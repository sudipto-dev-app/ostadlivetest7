import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<StatefulWidget> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog();
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }


  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count:', style: TextStyle(fontSize: 20),),
            Text('$count', style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      _incrementCount();
                    },
                    child: Text('+', style: TextStyle(fontSize: 25))),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      _decrementCount();
                    },
                    child: Text('-', style: TextStyle(fontSize: 25),)),
              ],
            )


          ],
        ),
      ),
    );
  }
}
