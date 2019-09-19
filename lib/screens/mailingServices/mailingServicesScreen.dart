import 'package:flutter/material.dart';
import 'package:hade/models/readApi.dart';
import 'package:hade/screens/mailingServices/mailAllScreen.dart';
import 'package:hade/screens/attendeScreens/editAttendeePage.dart';
import 'package:hade/screens/mailingServices/mailSpecificScreen.dart';


class MailingServicesScreen extends StatefulWidget {
   RS events;
  int pos;

  MailingServicesScreen(this.events,this.pos);
  @override
  @override
  State<StatefulWidget> createState() {
    return _MailingServicesScreen(events,pos);
  }
}

class _MailingServicesScreen extends State<MailingServicesScreen> {
  RS events;
  int pos;

  _MailingServicesScreen(this.events,this.pos);
  
  void _all() {
      Navigator.push(
   context,
   MaterialPageRoute(builder: (context) => AllScreen(events: events,pos: pos,)),
 );
           
}

void _read() {
       Navigator.push(
   context,
   MaterialPageRoute(builder: (context) =>MailSpecificScreen(events: events,pos: pos,)),
 );      
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:AppBar(
              title: Text("Mailing Services", ),
              centerTitle: true,
              elevation:0.0,
            
             
            ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
              
          Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Functions",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  IconButton(
                      icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  )),
                ],
              )),
              GestureDetector(
          child:Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),

            child: Center(
                child: Card(
                  elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(40.0),
                                decoration: new BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15.0),
                                        topLeft: Radius.circular(15.0)))),
                            flex: 18,
                          ),
                          new Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 15.0),
                                  child: Text(
                                    "All",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 3.0),
                                  child: Text("Send mail to everyone",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Colors.grey)),
                                )
                              ],
                            ),
                            flex: 30,
                          ),
                          Flexible(
                              child: Container(
                                  padding:
                                      EdgeInsets.only(left: 60.0, top: 10.0),
                                  child: Center(
                                    child: IconButton(
                                        icon: Icon(
                                      Icons.chevron_right,
                                      
                                    )),
                                  )),
                              flex: 23),
                        ]))),
            // size: Size(300, 100),
          ),
          onTap: _all,
                    ),
                    GestureDetector(child:
                    Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
          
                      child: Center(
                          child: Card(
                            elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new Container(
                                          padding: EdgeInsets.all(40.0),
                                          decoration: new BoxDecoration(
                                              color: Theme.of(context).accentColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15.0),
                                                  topLeft: Radius.circular(15.0)))),
                                      flex: 18,
                                    ),
                                    new Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 10.0, top: 15.0),
                                            child: Text(
                                              "Specific",
                                              style:
                                                  TextStyle(fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 10.0, top: 3.0),
                                            child: Text("Send mail to Specific people",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.0,
                                                    color: Colors.grey)),
                                          )
                                        ],
                                      ),
                                      flex: 30,
                                    ),
                                    Flexible(
                                        child: Container(
                                            padding:
                                                EdgeInsets.only(left: 45.0, top: 10.0),
                                            child: Center(
                                              child: IconButton(
                                                  icon: Icon(
                                                Icons.chevron_right,
                                              
                                              )),
                                            )),
                                        flex: 23),
                                  ]))),
                      // size: Size(300, 100),
                    ), onTap: _read,
                    ),
                  ],
                )),
              );
            }
          }
          
          
