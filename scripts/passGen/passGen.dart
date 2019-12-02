import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main()
{

  const lowerChar = "abcdefghijklmnopqrstuvwxyz";
  const upperChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const numChar = "0123456789";
  const passLength = 12;
  Random randomVar = new Random.secure();
      var charKeys = new List(4);
  var createdPass = "";
  charKeys[0] = randomVar.nextBool();
  charKeys[1] = randomVar.nextBool();
  charKeys[2] = randomVar.nextBool();
  print(charKeys);

  while(createdPass.length < passLength)
  {
    if (charKeys[0] == true)
    {
      charKeys[3] = randomVar.nextInt(lowerChar.length);
      createdPass = createdPass + lowerChar[charKeys[3]];
    }
    if (charKeys[1] == true)
    {
      charKeys[3] = randomVar.nextInt(upperChar.length);
      createdPass = createdPass + upperChar[charKeys[3]];
    }
    if (charKeys[2] == true)
    {
      charKeys[3] = randomVar.nextInt(numChar.length);
      createdPass = createdPass + numChar[charKeys[3]];
    }
    charKeys[0] = randomVar.nextBool();
    charKeys[1] = randomVar.nextBool();
    charKeys[2] = randomVar.nextBool();
  }
  print(createdPass);
  runApp(MaterialApp( home: Home(createdPass)));
}

class Home extends StatelessWidget {
  @override
  String createdPass;
  Home(String createdPass) { this.createdPass = createdPass; }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Title'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
            createdPass,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Colors.black,
              shadows: <Shadow>[
                Shadow(offset: Offset(1, 1),blurRadius: 2.0,color: Colors.red,),
                //Shadow(offset: Offset(4, 4),blurRadius: 2.0,color: Colors.brown,)
              ] ,
            )
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Clipboard.setData(new ClipboardData(text: createdPass));},
        child: Text('Copy'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
