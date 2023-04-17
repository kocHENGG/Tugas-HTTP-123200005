import 'package:flutter/material.dart';
import 'package:pert6/detail_user_model.dart';

class PageDetailUser extends StatelessWidget {
  final int idUser;
  const PageDetailUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
    );
  }
}
