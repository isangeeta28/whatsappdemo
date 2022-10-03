import 'package:demoapp/controller/home_screen_controller.dart';
import 'package:demoapp/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GetX<HomeController>(
            init: Get.put(HomeController()),
            builder: (homeCon) {
              return homeCon.homeData.value.info == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                    height: Get.height*0.94,
                      child: ListView.builder(
                      itemCount: homeCon.homeData.value.results?.length,
                        itemBuilder: (context, i) =>
                            Column(
                          children: <Widget>[
                            Divider(
                              height: 10.0,
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 23,
                                foregroundColor: Theme.of(context).primaryColor,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    homeCon.homeData.value.results?[i].picture?.medium??""
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${homeCon.homeData.value.results?[i].name?.fullName}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(homeCon.homeData.value.results?[i].location?.timezone?.offset??"",
                                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Text("message",
                                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
                  );
            }
          ),
        ));
  }
}
