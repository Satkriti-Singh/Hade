import 'package:flutter/material.dart';
import 'package:hade/util.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:hade/models/global.dart';
import 'dart:async';
import 'dart:convert';
import 'package:hade/models/RequestList.dart';
import 'package:hade/util.dart';
import 'package:toast/toast.dart';

class NotificationScreen extends StatefulWidget{
  String clubName;
  String token;

  NotificationScreen(this.clubName,this.token);
  @override
  State<StatefulWidget> createState() {

    return NotifiactionScreenState(clubName,token);
  }

}

class NotifiactionScreenState extends State<NotificationScreen>{
  String clubName;
  String token;
  NotifiactionScreenState(this.clubName,this.token);

RequestList requestList;

  Future fetchPosts(http.Client client) async {
    if (token != '') {
print(clubName);
var URL= URL_LOADREQUESTS+"$clubName";
print(URL);
      var response = await http.get(
        URL , headers: {"Authorization": "$token"});
print("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["err"] == null) {
          print(data);
          requestList=RequestList.fromJson(data);
return "yo";
          }
          else {
            print("dwgvdkwejgv");
            return "No Data to be Fetched";
          }
        }

        else {
          return "No Data to be Fetched";
        }
      }
      else {
        return "No Data to be Fetched";
      }
    }
bool _load=false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefix0.backgroundColor,
        title: Text("Notification"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
          color: backgroundColor,
          child: FutureBuilder(
          future: fetchPosts(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data == null) {
    return Container(
    child: Center(
    child: CircularProgressIndicator(),
    ),
    );
    }
    else if(snapshot.data=="yo"){
      return Container(
          child: ListView.builder(
              itemCount:requestList.member.length,
              itemBuilder: (context, index) {

    return Container(
    decoration: continerDecor,
    padding: containerPad,
    margin: containerMargin,
    child: Column(
    children: <Widget>[
    Row(
    children: <Widget>[




    Container(
    padding: EdgeInsets.only(left: 5),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment
        .start,
    children: <Widget>[
    Container(child: Text(
    requestList.member[index].firstName+" "+requestList.member[index].lastName,
    style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.w400),)),
    Container(child: Text(
      requestList.member[index].email,
    style: TextStyle(fontSize: 12.0,color:Colors.grey ,fontWeight: FontWeight.w400,decoration: TextDecoration.none,fontFamily: 'Raleway'),)),
    Padding(padding: EdgeInsets.only(
    top: 5),),
    Container(
        width: MediaQuery.of(context).size.width-61,
        child:Row(
    crossAxisAlignment: CrossAxisAlignment
        .end,
    mainAxisAlignment: MainAxisAlignment
        .end,
    children: <Widget>[

                                                       GestureDetector(
                                                           onTap: () {

                sendToServer(true, requestList.member[index].email,index);
                },
                                                           child: Container(
                                                             width: 100,
                                                             margin: EdgeInsets.only(
                                                                 left: 16),
                                                             padding: EdgeInsets
                                                                 .only(top: 3,
                                                                 bottom: 3,
                                                                 left: 10,
                                                                 right: 10),
                                                             decoration: new BoxDecoration(
                                                                 border: Border.all(
                                                                   width: 1.0,
                                                                   color: Colors
                                                                       .green,),
                                                                 borderRadius: new BorderRadius
                                                                     .all(
                                                                     Radius.circular(
                                                                         10.0)),
                                                                 color: Colors
                                                                     .green),
                                                             child: Row(
                                                               mainAxisAlignment: MainAxisAlignment
                                                                   .center,
                                                               children: <Widget>[
                                                                 Container(
                                                                     padding: EdgeInsets
                                                                         .all(
                                                                         3),
                                                                     child: Text(
                                                                       'Accept',
                                                                       style: TextStyle(color: Colors.white),)
                                                                 )
                                                               ],
                                                             ),
                                                           )),
                                                           GestureDetector(
                                                             behavior: HitTestBehavior.translucent,
                                                           onTap: () {
                                                             sendToServer(false, requestList.member[index].email,index);
                                                           },
                                                           child: Container(
                                                             width: 100,
                                                             margin: EdgeInsets.only(
                                                                 left: 16),
                                                             padding: EdgeInsets
                                                                 .only(top: 3,
                                                                 bottom: 3,
                                                                 left: 10,
                                                                 right: 10),
                                                             decoration: new BoxDecoration(
                                                                 border: Border.all(
                                                                   width: 1.0,
                                                                   color: Colors
                                                                       .red,),
                                                                 borderRadius: new BorderRadius
                                                                     .all(
                                                                     Radius.circular(
                                                                         10.0)),
                                                                 color: Colors.white),
                                                             child: Row(
                                                               mainAxisAlignment: MainAxisAlignment
                                                                   .center,
                                                               children: <Widget>[
                                                                 Container(
                                                                     padding: EdgeInsets
                                                                         .all(
                                                                         3),
                                                                     child: Text(
                                                                       'Reject',
                                                                       )
                                                                 )
                                                               ],
                                                             ),
                                                           )),
    ]
    ))
    ]
    )),



    ]
    )

    ]
    )

    );

    }));
    }
    else{
      return Container();
    }}
    )),
    );
  }
  Map<String, dynamic> body={
    "email": "test1@test.com",
    "org": "GDG-VIT",

  };

  sendToServer(bool res,String email,int index){

    body["email"]='$email';
    body["org"]='$clubName';
    body["accept"]=res;
    Future fetchPosts(http.Client client) async {
      print("yjhtgfdsyutrgds");
      var response = await http.post(
        URL_ACCEPTREQ, headers: {"Authorization": "$token","Content-Type": "application/json"},
        body: json.encode(body),);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

if(data["message"]=="Completed action"){
  if(res){
    requestList.member.removeAt(index);
    setState(() {
      requestList;
    });
    Toast.show("Member Added", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
  else{


    requestList.member.removeAt(index);
    setState(() {
      requestList;
    });
    Toast.show("Request Declined", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}
else{
  Toast.show(data["data"], context,
      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
}







      }
      else {

        if(response.statusCode==500) {
          final data = json.decode(response.body);
          Toast.show(data["data"].toString(), context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          setState(() {
            _load = false;
          });
        }
        else{
          setState(() {
            _load = false;
          });
          Toast.show("Try again", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      }
    }



    return FutureBuilder(

        future: fetchPosts(http.Client()),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.data==null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          }
          else{
            return Container();
          }
        });




  }
  }
