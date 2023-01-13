import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/status.dart';

import 'calls.dart';

class Wha extends StatefulWidget {
  const Wha({Key? key}) : super(key: key);

  @override
  State<Wha> createState() => _WhaState();
}

class _WhaState extends State<Wha> {
  XFile? pickedFile;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0,
          backgroundColor: Colors.green,
          title: Text('WhatsApp'),
          actions: [
            Row(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap : () async {
                        ImagePicker picker = ImagePicker();
                        pickedFile = await picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          image = File(pickedFile!.path);
                        });
                      },
                      child: Icon(Icons.photo_camera_outlined,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.more_vert),
                ),
              ],),
          ],
        ),
        body:
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 50),
                          child: Container(
                              child: Icon(Icons.groups,color: Colors.white,)),
                        ),
                        Expanded(flex: 2,
                          child: InkWell(onTap: () {

                          },
                            child: Container(
                                child:  Text('CHATS',style: TextStyle(color: Colors.white,),)),
                          ),
                        ),
                        Expanded(flex: 2,
                          child: InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Stat();
                            },));
                          },
                            child: Container(
                                child:  Text('STATUS',style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        Expanded(flex: 2,
                          child: InkWell(onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Call();
                            },));
                          },
                            child: Container(
                                child:  Text('CALLS',style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text('new message'),
                      trailing: Text('07/12/2022'),
                      leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/dp_images_8-1279.jpg',)),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,)),
                    );
                },),
            ),
          ],
        )
    );
  }
}
