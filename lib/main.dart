import 'package:flutter/material.dart';
import 'package:main/db_provider.dart';
import 'package:provider/provider.dart';

import 'note_list_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DbProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NoteListPage(),
    );
  }
}
