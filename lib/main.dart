import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DayNightPage(),
    );
  }
}

class DayNightPage extends StatefulWidget {
  const DayNightPage({super.key});

  @override
  _DayNightPageState createState() => _DayNightPageState();
}

class _DayNightPageState extends State<DayNightPage> {
  bool isNight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNight ? Colors.black87 : Colors.blue[100],
      body: Center(
        child: DayNightSwitch(
          isNight: isNight,
          onToggle: (value) {
            setState(() {
              isNight = value;
            });
          },
        ),
      ),
    );
  }
}

class DayNightSwitch extends StatelessWidget {
  final bool isNight;
  final ValueChanged<bool> onToggle;

  const DayNightSwitch({
    super.key,
    required this.isNight,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onToggle(!isNight);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 160,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isNight ? Colors.black87 : Colors.lightBlueAccent,
          border: Border.all(
            color: isNight ? Colors.yellow : Colors.blueAccent,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              isNight ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isNight) ...[
              const Icon(Icons.wb_sunny, color: Colors.orangeAccent, size: 40),
              const Spacer(),
            ],
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isNight ? Colors.grey[300] : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: isNight
                  ? const Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.circle, color: Colors.black, size: 12),
                        Positioned(
                          top: 18,
                          left: 12,
                          child: Icon(Icons.circle,
                              color: Colors.black54, size: 8),
                        ),
                        Positioned(
                          bottom: 12,
                          right: 18,
                          child: Icon(Icons.circle,
                              color: Colors.black26, size: 6),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            if (isNight) ...[
              const Spacer(),
              const Icon(Icons.star, color: Colors.white, size: 30),
            ],
          ],
        ),
      ),
    );
  }
}
