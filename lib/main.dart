import 'dart:async';

void main(){

  StreamController _streamController=StreamController();

  void streamYayin() async{
    for(int i=0; i<10; i++){
      if(i==16){_streamController.addError('bir hata oluştu');}
      await Future.delayed(Duration(seconds: 3));
      _streamController.sink.add(i+1);
    }
    _streamController.close();
  }

  streamYayin();
  _streamController.stream.listen((event){
    print(event*10);
  },
  onDone: (){
    print('Stream listem içerisinde onDone fonksiyonu çalıştı');
  },
    onError: (error){
    print(error);
    },
    cancelOnError: true
  );
}