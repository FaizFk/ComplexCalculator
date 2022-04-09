import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Complex Calculator'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double x1 = 0, x2 = 0, y1 = 0, y2 = 0;
  String answer = '0';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Text(
                      'X1',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.purple[300]),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Text(
                      'Y1',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.purple[300]),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      x1 = double.parse(value);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      y1 = double.parse(value);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${x1.toStringAsFixed(0)} + ${y1.toStringAsFixed(0)}i',
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 23,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Text(
                      'X2',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.yellow[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Text(
                      'Y2',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.yellow[300]),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      x2 = double.parse(value);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      y2 = double.parse(value);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${x2.toStringAsFixed(0)} + ${y2.toStringAsFixed(0)}i',
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 30, color: Colors.green[600]),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RawMaterialButton(
                    child: Text(
                      'ADD',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: Colors.red[800],
                    onPressed: () {
                      setState(() {
                        double r = x1 + x2;
                        double i = y1 + y2;

                        answer =
                            '${(r).toStringAsFixed(2)} + ${i.toStringAsFixed(2)}i';
                      });
                    }),
                RawMaterialButton(
                    child: Text(
                      'SUBTRACT',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: Colors.red[800],
                    onPressed: () {
                      setState(() {
                        double r = x1 - x2;
                        double i = y1 - y2;

                        answer =
                            '${(r).toStringAsFixed(2)} + ${i.toStringAsFixed(2)}i';
                      });
                    }),
                RawMaterialButton(
                    child: Text(
                      'MULTIPLY',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: Colors.red[800],
                    onPressed: () {
                      setState(() {
                        double r = x1 * x2 - y1 * y2;
                        double i = x1 * y2 + x2 * y1;

                        answer =
                            '${(r).toStringAsFixed(2)} + ${i.toStringAsFixed(2)}i';
                      });
                    }),
                RawMaterialButton(
                    child: Text(
                      'DIVISION',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: Colors.red[800],
                    onPressed: () {
                      setState(() {
                        double r = (x1 * x2 - y1 * y2) / (x2 * x2 - y2 * y2);
                        double i = (x1 * y2 + x2 * y1) / (x2 * x2 - y2 * y2);

                        answer =
                            '${(r).toStringAsFixed(2)} + ${i.toStringAsFixed(2)}i';
                      });
                    }),
                RawMaterialButton(
                    child: Text(
                      'DISTANCE',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: Colors.red[800],
                    onPressed: () {
                      setState(() {
                        double a = sqrt(
                          (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2),
                        );

                        answer = '${a.toStringAsFixed(2)}';
                      });
                    }),
              ],
            )
          ],
        )
      ],
    );
  }
}
