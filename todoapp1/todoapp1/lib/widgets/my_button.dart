import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPresssed;
  MyButton({
    super.key,
    required this.text,
    required this.onPresssed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPresssed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
