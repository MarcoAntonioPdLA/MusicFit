import 'package:flutter/material.dart';
import 'package:music_fit/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicFit',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => SplashScreen(),
        //'/home': (BuildContext context) => new HomePage(),
        //'/signup': (BuildContext context) => new SignupPage(),
        //'/listview': (BuildContext context) => new ListViewSong(),
        //'/recovery': (BuildContext context) => new RecoveryPage()
      },
    );
  }
}