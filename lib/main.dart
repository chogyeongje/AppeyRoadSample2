// TODO Toast 메세지 사용 방법
// 1. https://pub.dev/packages/toast#-installing-tab- 사이트에 들어가서 최신 버전 확인
// 2. pubspec.yaml 파일에 들어가서 "dependencies" 항목에 해당 버전 작성 (띄어쓰기 주의!)
// 3. packages upgrade 버튼을 눌러 dependencies 변경 사항을 프로젝트에 반영
// 4. 사용하고자 하는 dart 파일 (main.dart) 에 이동하여 import 구문 작성
// 5. Toast.show() 함수를 이용해서 사용

import 'package:flutter/material.dart';
// TODO 다운 받은 Toast 메세지 기능을 사용하기 위해 import
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String title = "hello2";

  void onPress(){
    // TODO Toast 메세지 사용하는 예시
    Toast.show("you click button", context, duration: Toast.LENGTH_SHORT);
    // TODO 주석을 해제하여 setState 함수를 사용해 보세요
    // 변수를 바꾼 후 화면에 표시하기 위해서는 setState((){}) 함수를 사용해야 함
//    setState(() {
//      title = "clicked";
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child:
        // TODO 입체 적인 모양의 버튼 제작
//        generateListItem(0)
          // TODO ListView 제작
//          Container(
//            child: ListView.builder(
//              // 아이템의 생김새 지정
//              // 변수로 context, index 를 받아와서 Widget 을 return 해주는 형태여야 함
//              // 아래 예시는 위에서 만든 입체적인 모양의 버튼을 Item 으로 사용하는 예시
//              itemBuilder: (context, index) {
//                return generateListItem(index);
//              },
//              // Item 갯수 지정
//              itemCount: 5,
//            )
//          ),
          // TODO Column 꾸미는 방법
          Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              // TODO 빈 박스(Container or SizedBox) 를 이용해서 사이를 띄울 수도 있음
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              Container(
                height: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
              // TODO Expanded 를 이용하여 Column or Row 에서 남은 공간을 모두 사용할 수 있음
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) => generateListItem(index)),
              )
            ],
          )
      ),
    );
  }

  Widget generateListItem(int index){
    // Padding 으로 감싸게 되면 감싸진 Widget 의 주변으로 공백이 생기게 됨
    return Padding(
      // 아래 예시는 좌,상,우,하 순서로 공백의 크기를 정하는 방법
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        height: 200,
        width: 200,
        // Decoration 으로 Container 의 디자인을 꾸밀 수 있음
        // 참고로 color 옵션과 decoration 옵션을 동시에 같이 사용할 수는 없음
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Icon(Icons.cloud, size: 100,),
      ),
    );
  }

}

