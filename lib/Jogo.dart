import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _appImage = AssetImage("images/padrao.png");
  String _message = "Escolha uma opção abaixo:";

  _chosenOption(String option) {
    List<String> options = ["pedra", "papel", "tesoura"];
    int number = Random().nextInt(3);
    String appOption = options[number];

    print("Escolha do App: " + appOption);
    print("Escolha do Usuario: " + option);

    switch (appOption) {
      case "pedra":
        setState(() {
          _appImage = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _appImage = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _appImage = const AssetImage("images/tesoura.png");
        });
        break;
    }
    // Usuario ganhador
    if ((option == "pedra" && appOption == "tesoura") ||
        (option == "tesoura" && appOption == "papel") ||
        (option == "papel" && appOption == "pedra")) {
      setState(() {
        _message = "O usuário venceu :)";
      });
      // App ganhador
    } else if ((appOption == "pedra" && option == "tesoura") ||
        (appOption == "tesoura" && option == "papel") ||
        (appOption == "papel" && option == "pedra")) {
      setState(() {
        _message = "O APP venceu :(";
      });
    } else {
      setState(() {
        _message = "Empate ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Image.asset("images/padrao.png"),
          Image(image: _appImage),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _chosenOption("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _chosenOption("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _chosenOption("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 95,
                ),
              ),
              /*Image.asset(
                "images/pedra.png",
                height: 95,
              ),
              Image.asset("images/papel.png", height: 95),
              Image.asset("images/tesoura.png", height: 95),
              */
            ],
          ),
        ],
      ),
    );
  }
}
