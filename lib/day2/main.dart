import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double sliderValue = 0.0;
  static const double maxSliderValue = 100.0;
  late Timer timer;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void incrementSlider() {
    setState(() {
      sliderValue = (sliderValue + 0.1).clamp(0.0, maxSliderValue);
    });
  }

  void decrementSlider() {
    setState(() {
      sliderValue = (sliderValue - 0.05).clamp(0.0, maxSliderValue);
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      if (sliderValue > 0) {
        decrementSlider();
      }
      if (sliderValue > 0.9) {
        _incrementCounter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            scoreBox(_counter),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // width: 20,
                  height: 200,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: LinearProgressIndicator(
                      value: sliderValue,
                      minHeight: 20.0,
                      backgroundColor: Colors.grey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                FloatingActionButton(
                  onPressed: incrementSlider,
                  // tooltip: 'Decrement',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget scoreBox(int score) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Your score',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          '$_counter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
