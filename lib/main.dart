
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:staggered_animations/auto_referesh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animations',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text('Grid Card Animation'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardGridScreen()),
                );
              },
            ),
          ],
        ),
      ),);
  }
}


class CardGridScreen extends StatefulWidget {
  const CardGridScreen({Key? key}) : super(key: key);

  @override
  _CardGridScreenState createState() => _CardGridScreenState();
}

class _CardGridScreenState extends State<CardGridScreen> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 3;
    return AutoRefresh(
      duration: const Duration(milliseconds: 2000),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Staggered Animations',style: TextStyle(color: Colors.white,fontSize: 15)),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: SafeArea(
          child: AnimationLimiter(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: columnCount,
              children: List.generate(
                100,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: columnCount,
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: ScaleAnimation(
                      scale: 0.5,
                      child: FadeInAnimation(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 4.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}