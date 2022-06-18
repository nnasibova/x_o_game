import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List game = ["", "", "", "", "", "", "", "", ""];

  bool isX = true;
  bool isWin = true;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 120),
        margin: EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (isX && game[index] == "") {
                    setState(() {
                      game[index] = "assets/images/o.PNG";
                    });
                    isX = !isX;
                  } else if (!isX && game[index] == "") {
                    setState(() {
                      game[index] = "assets/images/x.PNG";
                    });
                    isX = !isX;
                  }
                  if (game[0] == game[1] &&
                      game[1] == game[2] &&
                      game[0] != "" &&
                      game[1] != "" &&
                      game[2] != "") {
                    showAlertDialog(isWin);
                  } else if (game[3] == game[4] &&
                      game[4] == game[5] &&
                      game[3] != "" &&
                      game[4] != "" &&
                      game[5] != "") {
                    showAlertDialog(isWin);
                  } else if (game[6] == game[7] &&
                      game[7] == game[8] &&
                      game[6] != "" &&
                      game[7] != "" &&
                      game[8] != "") {
                    showAlertDialog(isWin);
                  } else if (game[0] == game[3] &&
                      game[3] == game[6] &&
                      game[0] != "" &&
                      game[3] != "" &&
                      game[6] != "") {
                    showAlertDialog(isWin);
                  } else if (game[1] == game[4] &&
                      game[4] == game[7] &&
                      game[1] != "" &&
                      game[4] != "" &&
                      game[7] != "") {
                    showAlertDialog(isWin);
                  } else if (game[2] == game[5] &&
                      game[5] == game[8] &&
                      game[2] != "" &&
                      game[5] != "" &&
                      game[8] != "") {
                    showAlertDialog(isWin);
                  } else if (game[0] == game[4] &&
                      game[4] == game[8] &&
                      game[0] != "" &&
                      game[4] != "" &&
                      game[8] != "") {
                    showAlertDialog(isWin);
                  } else if (game[2] == game[4] &&
                      game[4] == game[6] &&
                      game[2] != "" &&
                      game[4] != "" &&
                      game[6] != "") {
                    showAlertDialog(isWin);
                  } else if (game.length == 9 && !game.contains("")) {
                    showAlertDialog(!isWin);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: game[index]==''?Text(
                    game[index],
                    style: TextStyle(
                        fontSize: 100, color: Color.fromARGB(255, 197, 21, 8)),
                    textAlign: TextAlign.center,
                  ):Image.asset(game[index]),
                ),
              );
            }),
      ),
    );
  }

  showAlertDialog(isWin) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        for(int i=0; i<game.length; i++){
          setState(() {
            game[i] = '';
          });
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Result"),
      content: Text(
        isWin ? "You are the winner!" : "Nobody :(",
        style: TextStyle(fontSize: 25),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
