import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerWeight = TextEditingController(); //Peso
  TextEditingController _controllerHeight = TextEditingController(); //Altura
  String _resultText = "";

  void _result() {
    double weight = double.parse(_controllerWeight.text.replaceAll(",", "."));
    double height = double.parse(_controllerHeight.text.replaceAll(",", "."));
    double imc = weight / (height * height);

    if (imc < 18.5) {
      setState(() {
        _resultText = "Sua condicao de Saúde é: Magreza";
      });
    } else if (imc > 18.5 && imc < 24.9) {
      setState(() {
        _resultText = "Sua condicao de Saúde é: Normal";
      });
    } else if (imc > 25.0 && imc < 29.0) {
      setState(() {
        _resultText = "Sua condicao de Saúde é: Sobrepeso";
      });
    } else if (imc > 30.0 && imc < 39.9) {
      setState(() {
        _resultText = "Sua condicao de Saúde é: Obesidade";
      });
    } else {
      setState(() {
        _resultText = "Sua condicao de Saúde é: Obesidade Grave";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset("images/imc.jpg"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite o seu peso",
                ),
                controller: _controllerWeight,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite a sua altura",
                ),
                controller: _controllerHeight,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              RaisedButton(
                onPressed: () => _result(),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                color: Colors.green,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  _resultText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
