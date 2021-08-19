import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _alcoholController = TextEditingController();
  TextEditingController _gasolineController = TextEditingController();
  String _choiceResult = '';

  void _calculate() {
    double? alcoholPrice = double.tryParse(_alcoholController.text);
    double? gasolinePrice = double.tryParse(_gasolineController.text);

    if(alcoholPrice == null || gasolinePrice == null) {
      setState(() {
        _choiceResult = 'Número inválido';
      });
    } else {
      if(alcoholPrice/gasolinePrice >= 0.7){
        setState(() {
          _choiceResult = 'Melhor abastecer com gasolina!';
        });
      } else{
        setState(() {
          _choiceResult = 'Melhor abastecer com álcool!';
        });
      }
      _cleanField();
    }
  }

  void _cleanField(){
    _alcoholController.text = '';
    _gasolineController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou gasolina'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Saiba qual é a melhor para abastecimento do seu carro',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço Álcool, ex: 1.59'),
              style: TextStyle(fontSize: 18),
              controller: _alcoholController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Preço Gasolina, ex: 3.59'),
              style: TextStyle(fontSize: 18),
              controller: _gasolineController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                onPressed: _calculate,
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _choiceResult,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
