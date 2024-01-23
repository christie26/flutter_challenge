import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter day1',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FlutterBoot Plus'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'FlutterBoot Plus',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Rubik'),
                    ),
                  ),
                  featureBlock(Icons.bolt, 'Premium features',
                      'Plus subscribers have access to FlutterBoot+ and out latest beta features'),
                  featureBlock(Icons.whatshot, 'Priority acess',
                      'You\'ll be able to use FlutterBoot+ even when demand is high'),
                  featureBlock(Icons.speed, 'Ultra-fast',
                      'Enjoy even faster response speeds with using FlutterBoot'),
                ]),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text('Restore subscription',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              const Text('Auto-renews for \$25/month until cancelled',
                  style: TextStyle(fontSize: 15)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Subscribe',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Widget featureBlock(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
            child: Icon(
              icon,
              size: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                description,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
