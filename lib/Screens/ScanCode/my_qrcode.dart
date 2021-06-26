
import 'package:egycare/services/local_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../main.dart';



class MyQr extends StatefulWidget {
  @override
  _MyQrState createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {

  @override
  void initState() {
    // getmyId();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    String myId="";
    getmyId()async {
      myId= await LocalHelper.getIdFromLocal();
    }
    getmyId();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[

              Column(
mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Center(
                     child:QrImage(
                       data: prefs.getString('id')??"",
                       version: QrVersions.auto,
                       size: 200.0,
                     ),
                   )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
