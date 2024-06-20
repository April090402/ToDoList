import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gami/models/category_model.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class homePage extends StatelessWidget {
  homePage({super.key});

  List<CategoryModel> categories = [];

  DateTime today = DateTime.now();

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: appBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchFiled(),
              SizedBox(
                height: 40,
              ),
              _categoriesSection(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'DATE SCADULE',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(181, 231, 255, 1)),
                      child: TableCalendar(
                        focusedDay: today,
                        firstDay: DateTime(2010, 10, 16),
                        lastDay: DateTime(2030, 10, 16),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(96, 205, 255, 1),
                    ),
                    child: Text(
                      "Menu",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                  title: const Text("Home"),
                  onTap: () {
                    // _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                // ListTile(
                //   title: const Text("Data"),
                //   onTap: () {
                //     // _onItemTapped(0);
                //     Navigator.push(
                //       context,
                //       // MaterialPageRoute(builder: (context) => HalamanData(),)
                //     );
                //   },
                // ),
                // ListTile(
                //   title: const Text("Image Online"),
                //   onTap: () {
                //     // _onItemTapped(0);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Meet3(),)
                //     );
                //   },
                // ),
                // ListTile(
                //   title: const Text("Image Local"),
                //   onTap: () {
                //     // _onItemTapped(0);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Screen3(),)
                //     );
                //   },
                // ),
                // ListTile(
                //   title: const Text("API"),
                //   onTap: () {
                //     // _onItemTapped(0);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Home(),)
                //     );
                //   },
                // ),
                // ListTile(
                //   title: const Text("Camera and Media"),
                //   onTap: () {
                //     // _onItemTapped(0);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Meet5Screen(),)
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ));
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'CATEGORY',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            categories[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        )
                      ]),
                );
              }),
        )
      ],
    );
  }

  Container _searchFiled() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0)
        ]),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Scedule, task, etc..',
              hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset('assets/icon/ss.svg'),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ));
  }

  AppBar appBar() {
    return AppBar(
        title: RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'ToDo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'List',
                style: TextStyle(
                  color: Color.fromRGBO(96, 205, 255, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0);
  }
}
