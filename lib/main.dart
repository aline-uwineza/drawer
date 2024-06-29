import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculatorApp());
}

class SimpleCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    SignInScreen(),
    SignUpScreen(),
    CalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Sign In'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              title: Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              title: Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email, color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Sign In'),
            style: ElevatedButton.styleFrom(
             backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person, color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email, color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "0";
  String _operation = ""; // Initialize _operation with an empty string
  double _num1 = 0;
  double _num2 = 0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _result = "0";
      _num1 = 0;
      _num2 = 0;
      _operation = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (_result.contains(".")) {
        return;
      } else {
        _result = _result + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);

      if (_operation == "+") {
        _result = (_num1 + _num2).toString();
      }
      if (_operation == "-") {
        _result = (_num1 - _num2).toString();
      }
      if (_operation == "X") {
        _result = (_num1 * _num2).toString();
      }
      if (_operation == "/") {
        _result = (_num1 / _num2).toString();
      }

      _num1 = 0;
      _num2 = 0;
      _operation = "";
    } else {
      _result = _result + buttonText;
    }

    setState(() {
      _output = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            padding: EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: color == null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      _output,
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          buildButton("7"),
                          buildButton("8"),
                          buildButton("9"),
                          buildButton("/", color: Colors.orange),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("4"),
                          buildButton("5"),
                          buildButton("6"),
                          buildButton("X", color: Colors.orange),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("1"),
                          buildButton("2"),
                          buildButton("3"),
                          buildButton("-", color: Colors.orange),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("."),
                          buildButton("0"),
                          buildButton("00"),
                          buildButton("+", color: Colors.orange),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("C"),
                          buildButton("="),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
