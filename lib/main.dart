import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:countup/countup.dart';

void main() => runApp(MyApp());

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
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter = 0;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _counter = 75;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff02154c),
                Colors.black,
              ],
            ),
          ),
          child: Center(
            child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: 10,
                    top: 30
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Migräne",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 0,
                    left: 25,
                    right: 25
                ),
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.2,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: _counter.toDouble(),
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                            gradient: const SweepGradient(colors: <Color>[
                              Color(0xFF00a9b5),
                              Color(0xFFa4edeb)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Countup(
                              begin: 0,
                              end: _counter.toDouble(),
                              duration: Duration(seconds: 1),
                              separator: ',',
                              style: TextStyle(
                                fontSize: 85,
                                fontWeight: FontWeight.bold
                              ),
                            )
                        )
                      ])
                ]),
              ),
              Expanded(
                  child: Scrollbar(
                      child: ListView(
                        shrinkWrap: true,
                        restorationId: 'list_demo_list_view',
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        children: [
                          for(int i = 1; i < 10; i++)
                            Card(
                              color: Color(0xff1f1f1f),
                              child: ListTile(
                                leading: FlutterLogo(size: 56.0),
                                title: Text('Two-line ListTile'),
                                subtitle: Text('Here is a second line'),
                                trailing: Icon(Icons.more_vert),
                              ),
                            ),
                        ],
                      )))
            ],
          ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xFF000000),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
