import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stopwatch/classes/dependencies.dart';
import 'package:stopwatch/screen/main_screen_landscape.dart';
import 'package:stopwatch/screen/main_screen_portrait.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      home: StopwatchHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StopwatchHomePage extends StatelessWidget {
  final Dependencies dependencies = new Dependencies();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        body: new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: mediaQueryData.orientation == Orientation.portrait
                ? MainScreenPortrait(dependencies: dependencies)
                : MainScreenLandscape(dependencies: dependencies)));
  }
}
