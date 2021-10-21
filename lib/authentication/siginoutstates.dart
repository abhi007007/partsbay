import 'package:flutter/material.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/authentication/loginpage.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/screens/bottombar.dart';

class Signinout extends StatefulWidget {
  const Signinout({Key? key}) : super(key: key);

  @override
  _SigninoutState createState() => _SigninoutState();
}

class _SigninoutState extends State<Signinout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: StreamBuilder(
          stream: changesign,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(child: Text("Something went wrong"));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    value: 2,
                    semanticsValue: "Loading...",
                    color: pink,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Bottompage();
            } else {
              return Loginpage();
            }
          }),
    );
  }
}
