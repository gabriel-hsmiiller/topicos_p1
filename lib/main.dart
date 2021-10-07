import 'package:flutter/material.dart';

enum OPERATIONS { add, subt, mult, div }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _operation = OPERATIONS.add;
  var calc = '0.00';

  var num1 = new TextEditingController();
  var num2 = new TextEditingController();

  void setOperation(operation) {
    setState(() {
      _operation = operation;
    });
  }

  void doCalculate(operation) {
    setState(() {
      switch (operation) {
        case OPERATIONS.add:
          calc = ((double.tryParse(num1.text == '' ? '0.00' : num1.text) ?? 0) +
                  (double.tryParse(num2.text == '' ? '0.00' : num2.text) ?? 0))
              .toStringAsFixed(2);
          break;
        case OPERATIONS.subt:
          calc = ((double.tryParse(num1.text == '' ? '0.00' : num1.text) ?? 0) -
                  (double.tryParse(num2.text == '' ? '0.00' : num2.text) ?? 0))
              .toStringAsFixed(2);
          break;
        case OPERATIONS.mult:
          calc = ((double.tryParse(num1.text == '' ? '0.00' : num1.text) ?? 0) *
                  (double.tryParse(num2.text == '' ? '0.00' : num2.text) ?? 0))
              .toStringAsFixed(2);
          break;
        case OPERATIONS.div:
          calc = ((double.tryParse(num1.text == '' ? '0.00' : num1.text) ?? 0) /
                  (double.tryParse(num2.text == '' ? '1.00' : num2.text) ?? 1))
              .toStringAsFixed(2);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: num1,
                  decoration: InputDecoration(labelText: 'Número 1'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: num2,
                  decoration: InputDecoration(labelText: 'Número 2'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text('Escolha a operação:'),
                  ),
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: Text('Adição'),
                      leading: Radio<OPERATIONS>(
                        value: OPERATIONS.add,
                        groupValue: _operation,
                        onChanged: (OPERATIONS? value) => setOperation(value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: Text('Subtração'),
                      leading: Radio<OPERATIONS>(
                        value: OPERATIONS.subt,
                        groupValue: _operation,
                        onChanged: (OPERATIONS? value) => setOperation(value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: Text('Multiplicação'),
                      leading: Radio<OPERATIONS>(
                        value: OPERATIONS.mult,
                        groupValue: _operation,
                        onChanged: (OPERATIONS? value) => setOperation(value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: Text('Divisão'),
                      leading: Radio<OPERATIONS>(
                        value: OPERATIONS.div,
                        groupValue: _operation,
                        onChanged: (OPERATIONS? value) => setOperation(value),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text('Calcular'),
                  onPressed: () => doCalculate(_operation),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resultado: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      calc,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple[900],
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
