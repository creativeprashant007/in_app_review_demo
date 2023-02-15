import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

enum Availability { loading, available, unavailable }

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final InAppReview _inAppReview = InAppReview.instance;

  String appStoreId = '';
  String microsoftStoreId = '';
  Availability availability = Availability.loading;
  @override
  void onInit() {
    requestReview();
    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        availability = isAvailable && !Platform.isAndroid
            ? Availability.available
            : Availability.unavailable;
      } catch (_) {
        availability = Availability.unavailable;
      }
    });
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void setAppStoreId(String id) => appStoreId = id;

  void setMicrosoftStoreId(String id) => microsoftStoreId = id;

  Future<void> requestReview() => _inAppReview.requestReview();

  Future<void> openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: appStoreId,
        microsoftStoreId: microsoftStoreId,
      );
}
