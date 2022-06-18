import 'package:flutter/material.dart';

import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "Welcome to the TIC TAC game!",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900, color: Colors.red, letterSpacing: 3),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(100, 5, 100, 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 40, color: Colors.white, ),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
