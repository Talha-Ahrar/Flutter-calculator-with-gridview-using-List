import 'dart:math';

import 'package:flutter/material.dart';

import './data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<btnval> newbtnval = [
    btnval(
      btn: 'sin',
    ),
    btnval(
      btn: 'cos',
    ),
    btnval(
      btn: 'tan',
    ),
    btnval(
      btn: 'asin',
    ),
    btnval(
      btn: 'acos',
    ),
    btnval(
      btn: '7',
    ),
    btnval(
      btn: '8',
    ),
    btnval(
      btn: '9',
    ),
    btnval(
      btn: '+',
    ),
    btnval(
      btn: '-',
    ),
    btnval(
      btn: '4',
    ),
    btnval(
      btn: '5',
    ),
    btnval(
      btn: '6',
    ),
    btnval(
      btn: '√',
    ),
    btnval(
      btn: '^',
    ),
    btnval(
      btn: '1',
    ),
    btnval(
      btn: '2',
    ),
    btnval(
      btn: '3',
    ),
    btnval(
      btn: '/',
    ),
    btnval(
      btn: 'x',
    ),
    btnval(
      btn: '.',
    ),
    btnval(
      btn: '0',
    ),
    btnval(
      btn: '00',
    ),
    btnval(
      btn: 'AC',
    ),
    btnval(
      btn: '=',
    ),
  ];
  String _out = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String output = '0';

  // ignore: unused_element
  buttonPressed(String btnVal) {
    print(btnVal);
    if (btnVal == "AC") {
      _out = "0";

      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "/" ||
        btnVal == "sin" ||
        btnVal == "cos" ||
        btnVal == "tan" ||
        btnVal == "√" ||
        btnVal == "asin" ||
        btnVal == "log" ||
        btnVal == "^" ||
        btnVal == "acos") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Already exist");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }

      if (operand == "cos") {
        num1 = 0;
        _out = (cos(num2)).toString();
      }
      if (operand == "^") {
        _out = (pow(num1, num2)).toString();
      }
      if (operand == "tan") {
        num1 = 0;
        _out = (tan(num2)).toString();
      }
      if (operand == "asin") {
        num1 = 0;
        _out = (asin(num2)).toString();
      }

      if (operand == "acos") {
        num1 = 0;
        _out = (acos(num2)).toString();
      }

      if (operand == "sin") {
        num1 = 0;
        _out = (sin(num2)).toString();
      }

      if (operand == "-") {
        _out = (num1 - num2).toString();
      }

      if (operand == "x") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      if (operand == "√") {
        num1 = 0;
        _out = sqrt(num2).toString();
      }
      if (operand == "x2") {
        _out = (exp(num2)).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '0';
      //_out = "0";
    } else {
      if (operand == "0") {
        operand = btnVal;
      } else {
        _out = _out + btnVal;
      }
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Calculater'),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    output,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 210,
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  child: Expanded(
                    child: GridView.count(
                        crossAxisCount: 5,
                        children: newbtnval.map((val) {
                          return Container(
                            padding: EdgeInsets.all(2),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                              onPressed: () {
                                buttonPressed(val.btn);
                              },
                              child: Text(
                                val.btn,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ),
              ],
            ),
          )),
    );
    // ignore: dead_code
  }
}
