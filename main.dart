import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const KalkulatorSederhana());

class KalkulatorSederhana extends StatelessWidget {
  const KalkulatorSederhana({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Kalkulator'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(18.0),
          child: SizedBox(
            width: double.infinity,
            child: CalcButton(),
          ),
        ),
      ),
    );
  }
} 
class CalcButton extends StatefulWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  CalcButtonState createState() => CalcButtonState();
}

class CalcButtonState extends State<CalcButton> {
  double? _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator(value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: const CalculatorThemeData(
        borderColor: Colors.black,
        borderWidth: 2,
        displayColor: Colors.black,
        displayStyle: TextStyle(fontSize: 80, color: Color.fromARGB(255, 255, 255, 255)),
        expressionColor: Color.fromARGB(255, 47, 47, 47),
        expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Color.fromARGB(255, 255, 166, 0),
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Color.fromARGB(255, 186, 186, 186),
        commandStyle: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
        numColor: Color.fromARGB(255, 76, 76, 76),
        numStyle: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
      return OutlinedButton(
      child: Text(_currentValue.toString()),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: calc);
            });
      },
    );
  }
}