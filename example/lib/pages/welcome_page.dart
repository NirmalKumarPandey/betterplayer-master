import 'dart:io';

import 'package:better_player_example/constants.dart';
import 'package:better_player_example/pages/controls_configuration_page.dart';


import 'package:better_player_example/pages/resolutions_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Video Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            /*Image.asset(
              "assets/logo.png",
              height: 200,
              width: 200,
            ),
            Text(
              "Welcome to Better Player example app. Click on any element below to see example.",
              style: TextStyle(fontSize: 16),
            ),*/
            const SizedBox(height: 8),
            ...buildExampleElementWidgets()
          ],
        ),
      ),
    );
  }

  List<Widget> buildExampleElementWidgets() {
    return [

      _buildExampleElementWidget("Controls configuration", () {
        _navigateToPage(ControlsConfigurationPage());
      }),

      _buildExampleElementWidget("Resolutions", () {
        _navigateToPage(ResolutionsPage());
      }),

    ];
  }

  Widget _buildExampleElementWidget(String name, Function onClicked) {
    return Material(
      child: InkWell(
        onTap: onClicked as void Function()?,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Future _navigateToPage(Widget routeWidget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routeWidget),
    );
  }

}
