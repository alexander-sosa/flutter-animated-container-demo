import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rnd = Random();
  double ancho = 0, alto = 0;
  List<Color> colors = [Colors.pink[300], Colors.amber[300], Colors.green[300], Colors.cyan[300], Colors.lightBlue[300]];
  List<Color> colors2 = [Colors.pink[600], Colors.amber[600], Colors.green[600], Colors.cyan[600], Colors.lightBlue[600]];
  Color currentColor = Colors.pink[300], currentGradient = Colors.pink[600];
  List<Curve> curves = [Curves.bounceIn, Curves.bounceInOut, Curves.bounceOut, Curves.decelerate, Curves.linear, Curves.elasticInOut];
  Curve currentCurve = Curves.bounceIn;
  int duration = 1000;
  double radius = 100;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Center(
          child: AnimatedContainer(
              duration: Duration(milliseconds: duration),
              width: ancho,
              height: alto,
              curve: currentCurve,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [currentColor, currentGradient]),
                borderRadius: BorderRadius.circular(radius)
              ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.alt_route),
            onPressed: (){
              setState(() {
                ancho = rnd.nextDouble() * screen.width;
                alto = rnd.nextDouble() * screen.height;
                duration = rnd.nextInt(2000);
                radius = rnd.nextDouble() * screen.width;
                currentCurve = curves[rnd.nextInt(curves.length)];
                currentColor = colors[rnd.nextInt(colors.length)];
                currentGradient = colors2[rnd.nextInt(colors2.length)];
              });
            }
        ),
      ),
    );
  }
}