import 'package:flutter/material.dart';
import 'package:klimaapp/screens/city_screen.dart';
import 'package:klimaapp/screens/loading_screen.dart';
import 'package:klimaapp/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/first': (context) => LocationScreen(),
        '/second': (context) => CityScreen(),
      },
    );
  }
}
