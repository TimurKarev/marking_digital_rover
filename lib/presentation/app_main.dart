import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marking_digital_rover/presentation/home_screen.dart';

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 16.0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF171A1C),
        ),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
