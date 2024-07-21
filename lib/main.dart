import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool xturn = true;
  List<String> displayxo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var myTextStyle = TextStyle(color: Colors.blue, fontSize: 30);
  int xscore = 0;
  int oscore = 0;
  int fill = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tic Tac Toe',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'player x',
                          style: myTextStyle,
                        ),
                        Text(
                          xscore.toString(),
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'player o',
                          style: myTextStyle,
                        ),
                        Text(
                          oscore.toString(),
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.5),
                itemBuilder: (BuildContext, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber)),
                      child: Center(
                        child: Text(
                          displayxo[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'TicTacToe',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (xturn && displayxo[index] == '') {
        displayxo[index] = 'x';
        fill += 1;
      } else if (!xturn && displayxo[index] == '') {
        displayxo[index] = 'o';
        fill += 1;
      }
      xturn = !xturn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      _showWinDialog(displayxo[0]);
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      _showWinDialog(displayxo[3]);
    }
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      _showWinDialog(displayxo[6]);
    }
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      _showWinDialog(displayxo[0]);
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      _showWinDialog(displayxo[1]);
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      _showWinDialog(displayxo[2]);
    }
    if (displayxo[6] == displayxo[4] &&
        displayxo[6] == displayxo[2] &&
        displayxo[6] != '') {
      _showWinDialog(displayxo[6]);
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      _showWinDialog(displayxo[0]);
    } else if (fill == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw'),
            actions: <Widget>[
              FloatingActionButton(
                hoverColor: Colors.amber,
                child: Text('Play'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showWinDialog(String Winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is!:' + Winner),
            actions: <Widget>[
              FloatingActionButton.large(
                hoverColor: Colors.amber,
                child: Text('Play'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });

    if (Winner == 'x') {
      xscore += 1;
    } else if (Winner == 'o') {
      oscore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = '';
      }
    });
    fill = 0;
  }
}
