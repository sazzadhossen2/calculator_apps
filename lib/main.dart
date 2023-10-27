import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOne = TextEditingController();
  final displayTwo = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOne.text = x.toString();
    displayTwo.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              CalculatorText(
                hint: "Enter first number",
                controller: displayOne,
              ),
              SizedBox(height: 30),
              CalculatorText(
                hint: "Enter second Number",
                controller: displayTwo,
              ),
              SizedBox(height: 30),
              Text(
                z.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOne.text)! % num.tryParse(displayTwo.text)!;
                  });
                },
                child: Icon(CupertinoIcons.percent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOne.text)! + num.tryParse(displayTwo.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOne.text)! - num.tryParse(displayTwo.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.minus),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOne.text)! / num.tryParse(displayTwo.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.divide),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOne.text)! * num.tryParse(displayTwo.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.multiply),
                  ),
                ],
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;
                    displayOne.clear();
                    displayTwo.clear();
                  });
                },
                label: Text("Clear"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorText extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  CalculatorText({required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
