

import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {



    void changeStepperIndex(int val){
      setState(() {
        activeIndex = val;
      });
    }

    List stepperData = [
      {
        "title":"Order Placed",
        "subTitle":"Your order has been placed"
      },
      {
        "title":"Preparing",
        "subTitle":"Your order is being prepared"
      },
      {
        "title":"On the way",
        "subTitle":"Our delivery executive is on the way to deliver your item"
      },
      {
        "title":"Delivered",
        "subTitle":""
      }
    ];


    return Container(child: Center(child: Column(
      children: [
        AnotherStepper(
          stepperList: List<StepperData>.generate(
            stepperData.length,
                (i) => StepperData(
              iconWidget: Container(width:30, height:30, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: i <=  activeIndex  ? i ==  activeIndex ? Colors.red : Colors.green : Colors.grey ,
              )),
              title: StepperText(
                stepperData[i]["title"],
                textStyle:  TextStyle(
                  color: i <=  activeIndex ? Colors.black : Colors.grey,
                ),
              ),
              subtitle: StepperText(stepperData[i]["subTitle"], textStyle:  TextStyle(
                color: i <=  activeIndex ? Colors.black : Colors.grey,
              ),),
            ),
          ),
          stepperDirection: Axis.vertical,
          //gap: 20,
          iconWidth: 24,
          iconHeight: 24,
          activeBarColor: Colors.green,
          inActiveBarColor: Colors.grey,
          activeIndex: activeIndex,
          barThickness: 8,
        ),
        TextButton(child: Text('change step 1'), onPressed: (){
          changeStepperIndex(0);
        },),
        TextButton(child: Text('change step 2'), onPressed: (){
          changeStepperIndex(1);
        },),
        TextButton(child: Text('change step 3'), onPressed: (){
          changeStepperIndex(2);
        },),
        TextButton(child: Text('change step 4'), onPressed: (){
          changeStepperIndex(3);
        },),
      ],    )));
  }
}