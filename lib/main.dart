import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoListApp());
}

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 51, 50, 50),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        dividerColor: Colors.white24,
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 51, 50, 50),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => CryptoListScreen(title: 'Crypto Currencies List'),
        '/coin': (context) => CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter += 2;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final coinName = 'Bitcoin $index';

          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/logo.svg',
              width: 30,
              height: 30,
            ),
            title: Text(coinName, style: textTheme.bodyMedium),
            subtitle: Text('200000\$', style: textTheme.bodySmall),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/coin',
                arguments: {'name': coinName},
              );
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text('From coin >> ${args['name']} ')),
    );
  }
}
