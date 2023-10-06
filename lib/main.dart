import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonColorChangeDemo(),
    );
  }
}

class ButtonColorChangeDemo extends StatefulWidget {
  @override
  _ButtonColorChangeDemoState createState() => _ButtonColorChangeDemoState();
}

class _ButtonColorChangeDemoState extends State<ButtonColorChangeDemo> {
  String selectedSize = '';
  Map<String, Color> buttonColors = {
    'S': Colors.blue,
    'M': Colors.green,
    'L': Colors.red,
    'XL': Colors.purple, // Add XL button
    'XXL': Colors.orange, // Add XXL button
    'XXXL': Colors.teal, // Add XXXL button
  };

  void _showSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onButtonTap(String size) {
    setState(() {
      buttonColors.forEach((key, value) {
        buttonColors[key] = key == size ? Colors.orange : Colors.grey;
      });
      selectedSize = size;
    });

    _showSnackbar('Selected Size: $size');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    buttonColors.forEach((size, color) {
      buttons.add(
        Container(
          margin: EdgeInsets.all(10), // Add margin
          child: ElevatedButton(
            onPressed: () {
              _onButtonTap(size);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
            child: Text(size),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: buttons.sublist(0, 4), // First line
                ),
                Row(
                  children: buttons.sublist(4), // Second line
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
