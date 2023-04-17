import 'package:flutter/material.dart';

void main() => runApp(const TipCalculatorApp());

class TipCalculatorApp extends StatelessWidget {
  const TipCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TipCalculatorScreen(),
    );
  }
}

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key});

  @override
  TipCalculatorScreenState createState() => TipCalculatorScreenState();
}

class TipCalculatorScreenState extends State<TipCalculatorScreen> {
  double billAmount = 0.0;
  double tipPercentage = 15.0;

  void onBillAmountChanged(String value) {
    setState(() {
      billAmount = double.tryParse(value) ?? 0.0;
    });
  }

  void onTipPercentageChanged(double value) {
    setState(() {
      tipPercentage = value.roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    double tipAmount = billAmount * tipPercentage / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(fontSize: 24),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Bill amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              onChanged: onBillAmountChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tip percentage: $tipPercentage%'),
                Slider(
                  value: tipPercentage,
                  min: 0,
                  max: 100,
                  divisions: 99,
                  label: '$tipPercentage%',
                  onChanged: onTipPercentageChanged,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Tip amount: ',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                ),
                children: [
                  TextSpan(
                    text: '\$${tipAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: tipPercentage < 10
                          ? Colors.red
                          : tipPercentage < 20
                              ? Colors.orange
                              : Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
