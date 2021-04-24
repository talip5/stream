import 'dart:async';

void main(){

  StreamController _streamController=StreamController();

  void streamYayin() async{
    for(int i=0; i<10; i++){
      await Future.delayed(Duration(seconds: 1));
      _streamController.sink.add(i+1);
    }
  }

  streamYayin();

  _streamController.stream.listen((event) async{
    print(event);
  });
}