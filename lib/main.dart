import 'package:flutter/material.dart';
import 'package:flutter_application_1/color_bloc.dart';

void main() {
  runApp(Njajal());
}

class Njajal extends StatefulWidget {
  @override
  _NjajalState createState() => _NjajalState();
}

class _NjajalState extends State<Njajal> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.disopose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_deepPurpleAccent);
              },
            )
          ],
        ),
        appBar: AppBar(
          title: Text("Njajal BLOc tanpa Library"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.lightGreen,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(microseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}
