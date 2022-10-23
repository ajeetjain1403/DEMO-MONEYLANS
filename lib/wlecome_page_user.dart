import 'dart:convert';

import 'package:demoproject_moneylans/models/user_datamodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Users> userList = [];
  void initState() {
    super.initState;
    loadData();
  }

  loadData() async {
    final personjson = await rootBundle.loadString("jsonfile/user_mock.json");

    final decodeData = jsonDecode(personjson);
    final userData = decodeData[0]["users"];
    // print(userData);
    userData.forEach((element) {
      Users user = Users(
          id: element["id"], name: element["name"], atype: element["atype"]);
      userList.add(user);
    });
    // List.from(userData).map<Users>((item) => User.formMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Project '),
      ),
      body: Container(
        child: userList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    width: 100,
                    child: Card(
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(userList[index].name!,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: , fontWeight: FontWeight.bold)),
                          child: Text('Sign In!'),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
