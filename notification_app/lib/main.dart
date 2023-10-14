import 'package:flutter/material.dart';
import 'package:notification_app/notification_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHandler notificationHandler = NotificationHandler();
  await notificationHandler.initialize();

  runApp(MyApp(notificationHandler: notificationHandler));
}

class MyApp extends StatelessWidget {
  final NotificationHandler notificationHandler;

  MyApp({required this.notificationHandler});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notification App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Send a dummy notification when the button is pressed
              notificationHandler.sendNotification(
                  1, 'Notification Title', 'This is the notification body.');
            },
            child: const Text('Send Notification'),
          ),
        ),
      ),
    );
  }
}
