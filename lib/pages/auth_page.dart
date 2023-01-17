import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_or_register.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //firebase will check the Auth status and changes
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //check if the user is logged in from the snapshot
          if (snapshot.hasData) {
            return HomePage();
          }

          //check if the user is NOT logged in from the snapshot
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
