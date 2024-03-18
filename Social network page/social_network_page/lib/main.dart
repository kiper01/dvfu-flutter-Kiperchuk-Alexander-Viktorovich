import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class Profile {
  final String imagePath;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String about;

  Profile({
    required this.imagePath,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.about,
  });
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.profile});

  final String title;
  final Profile profile;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;
  String _status = '';

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  void _generateRandomStatus() {
    final List<String> statuses = [
      'Делаю дз',
      'Отдыхаю',
      'Иду бухать',
      'Заболел',
    ];
    final Random random = Random();
    setState(() {
      _status = statuses[random.nextInt(statuses.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(widget.profile.imagePath),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.profile.firstName} ${widget.profile.lastName}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Дата рождения: ${widget.profile.dateOfBirth}'),
                    const SizedBox(height: 10),
                    Text('Обо Мне: ${widget.profile.about}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _incrementLikes,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.thumb_up),
                          const SizedBox(width: 5),
                          Text('Класс ($_likes)'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Статус: $_status'),
                    ElevatedButton(
                      onPressed: _generateRandomStatus,
                      child: const Text('Генерация статуса'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
