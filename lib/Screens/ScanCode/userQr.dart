import 'package:egycare/models/user_model.dart';
import 'package:egycare/services/network_helper.dart';
import 'package:flutter/material.dart';

class PatData extends StatelessWidget {
  final String userId;

  PatData(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(

    future: NetworkHelper.getPersonalInfoUsingId(userId)
    ,builder: (context, snapshot) {
print(userId);
      if(snapshot.hasData){
        UserModel userModel= snapshot.data;
print(snapshot.data);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userModel.firstRelativeName,style: TextStyle(fontSize: 25),),
              Text(userModel.firstRelativePhoneNumber,style: TextStyle(fontSize: 25),),
              Text(userModel.secondRelativeName,style: TextStyle(fontSize: 25),),
              Text(userModel.secondRelativePhoneNumber,style: TextStyle(fontSize: 25),),
            ],
          ),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    },),);
  }
}
