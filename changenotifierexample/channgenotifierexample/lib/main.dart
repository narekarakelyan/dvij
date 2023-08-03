import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => Favorites(),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
                'My favorite food is' + Provider.of<Favorites>(context).fruit),
          ),
        ),
        body: const Center(
            child: Column(children: [
          FruitButton(fruit: ' Apple'),
          FruitButton(fruit: ' Orange'),
          FruitButton(fruit: ' Banana')
        ])),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;

  const FruitButton({
    super.key,
    required this.fruit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Favorites>(context, listen: false).changeFruit(fruit);
      },
      child: Text(fruit),
    );
  }
}

class Favorites extends ChangeNotifier {
  String fruit = ' unknown';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}








