import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const ColorChanger(),
      ),
    ),
  );
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() {
    return ColorChangerState();
  }
}

class ColorChangerState extends State<ColorChanger> {
  int red = 33;
  int green = 5;
  int blue = 109;
  int directionIndex = 0;

  final List<Map<String, dynamic>> directions = [
    {
      'name': 'Vertical',
      'begin': Alignment.centerLeft,
      'end': Alignment.centerRight,
    },
    {
      'name': 'Horizontal',
      'begin': Alignment.topCenter,
      'end': Alignment.bottomCenter,
    },
    {
      'name': 'Left → Right',
      'begin': Alignment.topRight,
      'end': Alignment.bottomLeft,
    },
    {
      'name': 'Right → Left',
      'begin': Alignment.topLeft,
      'end': Alignment.bottomRight,
    },
  ];

  Alignment get beginAlignment => directions[directionIndex]['begin'];
  Alignment get endAlignment => directions[directionIndex]['end'];
  String get directionName => directions[directionIndex]['name'];

  void changeColor() {
    setState(() {
      red = Random().nextInt(256);
      green = Random().nextInt(256);
      blue = Random().nextInt(256);
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex++;
      if (directionIndex >= directions.length) directionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, red, green, blue),
            Color.fromARGB(130, red, green, blue),
            Color.fromARGB(255, red, green, blue),
          ],
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: changeColor,
              child: const Text(
                'Change Color',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Red: $red  Green: $green  Blue: $blue',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: changeDirection,
              child: const Text(
                'Change Direction',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Direction: $directionName',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
