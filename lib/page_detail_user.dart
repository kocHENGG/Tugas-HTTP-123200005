import 'package:flutter/material.dart';
import 'package:pert6/api_data_source.dart';
import 'package:pert6/detail_user_model.dart';

class PageDetailUser extends StatelessWidget {
  final int idUser;
  const PageDetailUser({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User $idUser'),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiDataSource.instance.loadDetailUser(idUser),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.hasData) {
              DetailUserModel usersModel =
                  DetailUserModel.fromJson(snapshot.data);
              return _buildSuccessSection(context, usersModel);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(BuildContext context, DetailUserModel users) {
    final userData = users.data!;
    return Container(
      child: _buildItemUsers(context, userData),
    );
  }

  Widget _buildItemUsers(BuildContext context, Data userData) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              child: Image.network(userData.avatar!),
            ),
            SizedBox(
              width: 30,
            ),
            Text(userData.firstName! + " " + userData.lastName!),
            Text(userData.email!),
          ],
        ),
      ),
    );
  }
}
