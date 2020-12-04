import 'package:flutter/material.dart';
import 'package:screen_search/search_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xffb74093);
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SEARCH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54),
    LeaderBoard("React", 22.5),
    LeaderBoard("Ionic", 24.7),
    LeaderBoard("Xamarin", 22.1),
  ];

  LeaderBoard _selectedItem;

  bool _show = true;

  static const Color ikeaBlue = Color(0xFF407AB1);
  static const Color backgroundGrey = Color(0xFFDEE2E6);
  static const Color backgrsoundGrey = Color.fromRGBO(66, 121, 177, .1);
  String _wordbyuser = "";

  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ikeaBlue,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {
              Navigator.pushNamed(
                context,
                'favorita',
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.pushNamed(
                context,
                'favorita',
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 67,
            width: 360,
            child: Row(
              children: <Widget>[
                Flexible(
                    child: Container(
                  width: 285,
                  height: 51,
                  margin: EdgeInsets.all(8.0),
                  color: backgroundGrey,
                  child: TextField(
                    style: textStyle,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 193, top: 16, bottom: 16),
                      hoverColor: backgroundGrey,
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 17,
                      ),
                    ),
                    onChanged: (valor) {
                      setState(() {
                        textStyle = TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14);
                        showSearch(
                            context: context,
                            delegate: DataSearch(),
                            query: '');
                        print(valor);
                        //
                      });
                    },
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
                  // padding: EdgeInsets.symmetric(5, 5),
                  height: 51,
                  width: 51,
                  color: backgroundGrey,
                  child: Icon(
                    Icons.filter_alt,
                    color: ikeaBlue,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
