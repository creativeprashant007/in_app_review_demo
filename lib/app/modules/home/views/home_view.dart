import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In App Review Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('In App Review Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('In App Review status: ${controller.availability.name}'),
            TextField(
              onChanged: controller.setAppStoreId,
              decoration: const InputDecoration(hintText: 'App Store ID'),
            ),
            TextField(
              onChanged: controller.setMicrosoftStoreId,
              decoration: const InputDecoration(hintText: 'Microsoft Store ID'),
            ),
            ElevatedButton(
              onPressed: controller.requestReview,
              child: const Text('Request Review'),
            ),
            ElevatedButton(
              onPressed: controller.openStoreListing,
              child: const Text('Open Store Listing'),
            ),
          ],
        ),
      ),
    );
  }
}
