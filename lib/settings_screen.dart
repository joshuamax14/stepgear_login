import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Settings"),
        ),
      body:
         Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: false,
              secondary:  const Icon(Icons.dark_mode,
                  color: Color(0xFF642ef3)
                ),
               onChanged: (bool value) {

              }
              )
            ]
          )
        );
      }
}