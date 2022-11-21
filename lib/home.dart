import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<ProfileScreen>(
                    builder: (context) => ProfileScreen(
                      actions: [
                        SignedOutAction((context) {
                          Navigator.popUntil(context, (route) => route.isFirst); //Back to the first screen
                          /*Navigator.of(context).pop() is ok when only one permanent route is present and it sends you back to the
                            SignIn Page but if there are more routes then you have to use other methods*/
                        })
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.person))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/dash.png'),
            Text(
              'Hello! This is Birb 🐦',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
