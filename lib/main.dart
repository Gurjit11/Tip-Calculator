import 'package:flutter/material.dart';
import 'tip_calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tip Calculator',
      debugShowCheckedModeBanner: false,
      home: TipCalculatorApp(),
    );
  }
}
