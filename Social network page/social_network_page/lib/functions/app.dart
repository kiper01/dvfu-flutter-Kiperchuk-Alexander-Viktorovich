import 'package:flutter/material.dart';
import 'package:social_network_page/UI/homep.dart';
import 'package:social_network_page/model/model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VFacebook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'VFacebook home page',
        profile: Profile(
          imagePath: 'assets/images/avatar.jpg',
          firstName: 'Александр',
          lastName: 'Киперчук',
          dateOfBirth: '28-03-2001',
          about: 'Студент ДВФУ.',
        ),
      ),
    );
  }
}