import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_deepPurpleAccent }

class ColorBloc {
  Color _color = Colors.lightGreen;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_amber)
      _color = Colors.lightGreen;
    else
      _color = Colors.deepPurple;

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void disopose() {
    _eventController.close();
    _stateController.close();
  }
}
