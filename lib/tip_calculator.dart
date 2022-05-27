import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  // _bill is the bill amount entered by the user.
  // _tipPercentage is the tip percentage entered by the user.
  final _bill = TextEditingController();
  final _tipPercentage = TextEditingController();
  // _total will contain the bill total after tip is added
  // _tip will contain the tip amount
  double _total = 0.00;
  double _tipAmount = 0.00;

  @override
  void initState() {
    // initialize the tip percentage to 15%
    _tipPercentage.text = 15.0.toString();
    super.initState();
  }

  void _calculateTip() {
    // Convert the bill amount  and tip percentage to a double
    double bill = _bill.text.isNotEmpty ? double.parse(_bill.text) : 0.0;
    double tipPercentage = _tipPercentage.text.isNotEmpty
        ? double.parse(_tipPercentage.text)
        : 0.0;
    setState(() {
      // Calculate the tip amount
      _tipAmount = bill * tipPercentage / 100;

      // Calculate the total bill amount
      _total = bill + _tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _bill,
                decoration: InputDecoration(
                  labelText: "Bill",
                  hintText: "Enter the bill amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _calculateTip();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _tipPercentage,
                decoration: InputDecoration(
                  labelText: "Tip Percentage %",
                  hintText: "Enter the tip percentage",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _calculateTip();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Tip Amount: \$${_tipAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Total: \$${_total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
