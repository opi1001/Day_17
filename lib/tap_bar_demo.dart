import 'package:flutter/material.dart';
import 'package:practice_17/page1.dart';
import 'package:practice_17/page2.dart';
import 'package:practice_17/page3.dart';
import 'package:practice_17/page4.dart';

class TapBarDimo extends StatefulWidget {
  const TapBarDimo({super.key});

  @override
  State<TapBarDimo> createState() => _TapBarDimoState();
}

class _TapBarDimoState extends State<TapBarDimo>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "This is AppBar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Container(
                  width: 50,
                  child: TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.amber,
                      automaticIndicatorColorAdjustment: true,
                      indicator: BoxDecoration(color: Colors.red),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.abc),
                          text: "Page 1",
                        ),
                        Tab(
                          text: "Page 2",
                        ),
                        Tab(
                          text: "Page 3",
                        ),
                        Tab(
                          text: "Page 4",
                        ),
                      ]),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
