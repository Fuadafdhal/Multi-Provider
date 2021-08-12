import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waight (kg)',
              style: TextStyle(fontSize: 20),
            ),
            // NOTE : Menggunakan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, value, child) => Slider(
            //     value: value.weight,
            //     min: 1,
            //     max: 100,
            //     divisions: 100,
            //     label: value.weight.round().toString(),
            //     onChanged: (newValue) {
            //       newValue = newValue.roundToDouble();
            //       print('weight $newValue');
            //       value.weight = newValue;
            //     },
            //   ),
            // ),
            Slider(
              value: weightProvider.weight,
              min: 1,
              max: 100,
              divisions: 100,
              label: weightProvider.weight.round().toString(),
              onChanged: (newValue) {
                newValue = newValue.roundToDouble();
                print('weight $newValue');
                weightProvider.weight = newValue;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Height (cm)',
              style: TextStyle(fontSize: 20),
            ),
            // Consumer<HeightProvider>(
            //   builder: (context, value, child) => Slider(
            //     value: value.height,
            //     min: 1,
            //     max: 100,
            //     divisions: 100,
            //     label: value.height.round().toString(),
            //     onChanged: (newValue) {
            //       newValue = newValue.roundToDouble();
            //       print('Height $newValue');
            //       value.height = newValue;
            //     },
            //     activeColor: Colors.pink,
            //     inactiveColor: Colors.pink.withOpacity(0.2),
            //   ),
            // ),

            Slider(
              value: heightProvider.height,
              min: 1,
              max: 100,
              divisions: 100,
              label: heightProvider.height.round().toString(),
              onChanged: (newValue) {
                newValue = newValue.roundToDouble();
                print('Height $newValue');
                heightProvider.height = newValue;
              },
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
            ),
            SizedBox(
              height: 20,
            ),
            // NOTE :
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Consumer<HeightProvider>(
            //     builder: (context, heightProvider, _) => Text(
            //       "Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}",
            //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // )

            Text(
              "Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
