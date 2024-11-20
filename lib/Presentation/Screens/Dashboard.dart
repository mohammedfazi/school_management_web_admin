import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management/Constants/AssetConstant.dart';
import 'package:school_management/Constants/ColorConstant.dart';
import 'package:school_management/Constants/SizeConstant.dart';
import 'package:school_management/Constants/Textstyle_Constant.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({super.key});

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {

  final List<ChartData3> chartData3 = <ChartData3>[
    ChartData3("JAN", 12000),
    ChartData3("FEB", 11000),
    ChartData3("MAR", 5000),
    ChartData3("ARP", 9000),
    ChartData3("MAY", 8000),
    ChartData3("JUN", 7000),
    ChartData3("JUL",11000),
    ChartData3("AUG", 1000),
    ChartData3("SEP", 4000),
    ChartData3("OCT", 3000),
    ChartData3("NOV", 2000),
    ChartData3("DEC",1000),
  ];

  final List<ChartData1> chartData1 = <ChartData1>[
    ChartData1('Mon', 129,100),
    ChartData1('Tue', 90,110),
    ChartData1('Wed', 107,50),
    ChartData1('Thurs', 68,34),
    ChartData1('Fri', 107,150),
    ChartData1('Sat', 68,80),
  ];

  final List<ChartData2> chartData2 = [
    ChartData2("Jan", 40000,50000),
    ChartData2("Feb", 30000,40000),
    ChartData2("Mar", 20000,10000),
    ChartData2("Apr", 40000,5000),
    ChartData2("May", 30000,34000),
    ChartData2("Jun", 40000,65000),
    ChartData2("Jul", 30000,54670),
    ChartData2("Aug", 40000,24350),
    ChartData2("Sep", 30000,80000),
    ChartData2("Oct", 40000,10000),
    ChartData2("Nov", 30000,20000),
    ChartData2("Dec", 40000,87678),
  ];

  List<dynamic> drawernamelist=[
    {
      "id":1,
      "icon":CupertinoIcons.home,
      "title":"Dashboard"
    },
    {
      "id":2,
      "icon":Icons.school,
      "title":"Teachers"
    },
    {
      "id":3,
      "icon":CupertinoIcons.person_2,
      "title":"Students"
    },
    {
      "id":4,
      "icon":CupertinoIcons.person_3,
      "title":"Attendance"
    },
    {
      "id":5,
      "icon":Icons.local_atm,
      "title":"Finance"
    },
    {
      "id":6,
      "icon":Icons.note_alt_outlined,
      "title":"Notice"
    },
    {
      "id":7,
      "icon":CupertinoIcons.calendar,
      "title":"Calendar"
    },
    {
      "id":8,
      "icon":CupertinoIcons.book,
      "title":"Library"
    },
    {
      "id":9,
      "icon":CupertinoIcons.chat_bubble_2,
      "title":"Message"
    }
  ];
  List<dynamic> OTHERSnamelist=[
    {
      "id":1,
      "icon":CupertinoIcons.profile_circled,
      "title":"Profile"
    },
    {
      "id":2,
      "icon":Icons.settings,
      "title":"Setting"
    },
    {
      "id":3,
      "icon":Icons.logout_sharp,
      "title":"Log out"
    }
  ];

  int? selectedIndex=0;
  int?noticeontap=0;
  int calenderontap=0;
  int messageontap=0;
  int financetap=0;
  bool viewprofile=true;
  bool hoverstudentgraph=false;
  List <bool> libraryhoverlist=List.generate(10, (index)=>false);
  List<bool> hoverstudentlist=List.generate(10, (index)=>false);
  List<bool> hoverteacherlist=List.generate(10, (index)=>false);
  List<int> drawertap=[];
  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltipBehavior1;
  late TooltipBehavior _tooltipBehavior2;
  late TooltipBehavior _tooltipBehavior3;
  final List<ChartData> chartData = [
    ChartData('Girls', 55, const Color(0XFFFAE27C)),
    ChartData('Boys', 76, const Color(0XFFC3EBFA)),
  ];
  final box=GetStorage();


  void localstorage(){
    box.write("name", "School management application");
  }

  List <dynamic> chatlist=[
    {
      "id":1,
      "name":"Mr. Franklin",
      "description1":"Thanks for the heads-up, Ms. Franklin. I'll make sure the agenda items from each department are ready by next Monday. Can someone confirm it next Monday with Mr. Reed?",

    },
    {
      "id":2,
      "name":"Mrs. Thompson",
      "description1":"Can someone confirm if the nurse's office will receive additional flu vaccines before the health fair next week?",

    },
    {
      "id":1,
      "name":"Mr. Franklin",
      "description1":"Good morning, everyone! Please remember to update your calendars. The school board meeting has been rescheduled to April 27th at 10 AM.",

    },
    {
      "id":2,
      "name":"Mr. Harris",
      "description1":"Can someone confirm if the nurse's office will receive additional flu vaccines before the health fair next week?",

    },
    {
      "id":1,
      "name":"Linda Adora",
      "description1":"All staff performance reviews are due by the end of this month. Please submit your reports to HR as soon as possible. Thank you.",

    }
  ];

  @override
  void initState() {
    _tooltipBehavior=TooltipBehavior(enable: true);
    _tooltipBehavior1=TooltipBehavior(enable: true);
    _tooltipBehavior2=TooltipBehavior(enable: true);
    _tooltipBehavior3=TooltipBehavior(enable: true);
   localstorage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstant.backgroundcolor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: displaywidth(context)*0.14,
            decoration:  const BoxDecoration(
              color:ColorConstant.whitecolor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Asset_Constant.logo,height: 70,width: 70,),
                    Text("School Hub",style: commontextstyle(fontweight: FontWeight.w600,size: 18),)
                  ],
                ),
                SizedBox(height: displayheight(context)*0.05,),
                SizedBox(
                  height: displayheight(context)*0.85,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:18.0,bottom: 4.0),
                          child: Text("MENU",style: drawertxt(),),
                        ),
                        SizedBox(
                          height: displayheight(context)*0.70,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: drawernamelist.length,
                              itemBuilder: (BuildContext context,int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedIndex=index;
                                      });
                                    },
                                    child: Container(
                                      decoration:BoxDecoration(
                                          color: selectedIndex==index?ColorConstant.bluecolor:Colors.transparent,
                                          borderRadius: BorderRadius.circular(10)
                                      ),child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:18.0),
                                            child: Icon(drawernamelist[index]['icon'],color: selectedIndex==index?Colors.black:Colors.grey,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:12.0),
                                            child: Text(drawernamelist[index]['title'],style:selectedIndex==index?drawertxt1(): drawertxt(),),
                                          )
                    
                                        ],
                                      ),
                                    ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0,bottom:4.0),
                          child: Text("OTHERS",style: drawertxt(),),
                        ),
                        SizedBox(
                          height: displayheight(context)*0.30,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: OTHERSnamelist.length,
                              itemBuilder: (BuildContext context,int index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        // selectedIndex=index;
                                      });
                                    },
                                    child: Container(
                                      decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(15)
                    
                                      ),child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:18.0),
                                            child: Icon(OTHERSnamelist[index]['icon'],color: Colors.grey,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:12.0),
                                            child: Text(OTHERSnamelist[index]['title'],style:drawertxt(),),
                                          )
                    
                                        ],
                                      ),
                                    ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: displaywidth(context)*0.20,
                          height: displayheight(context)*0.05,
                          child: TextFormField(
                            style: drawertxt1(),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintStyle: drawertxt(),
                                hintText: "Search Here",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(color: Colors.grey)
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:680.0),
                        child: Row(
                          children: [
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(onPressed: (){}, icon: Badge.count(count: 5,child: const Icon(CupertinoIcons.chat_bubble_2),)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child:IconButton(onPressed:(){}, icon: Badge.count(count: 2,child: const Icon(CupertinoIcons.bell),))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Mohammed Fazil",style: commontextstyle(fontweight: FontWeight.w700,size: 14),),
                                  Text("Admin",style: drawertxt(),)
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(Asset_Constant.profile),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                selectedIndex==0?
                    Dashboard():
                selectedIndex==1?
                  Teacherlist():
                selectedIndex==2?
                    Studentlist():
                selectedIndex==3?
                    AttendanceList():
                selectedIndex==4?
                    FinanceStudentsgraph():
                selectedIndex==5?
                    Notice():
                selectedIndex==6?
                    Calender():
                selectedIndex==7?
                    Library():
                    Messages(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.email_rounded,color: Colors.grey.shade800,size: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left:4.0),
                                  child: Text("emailaddress@mail.com",style: commontextstyle(color: Colors.grey.shade800),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone,color: Colors.grey.shade800,size: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:4.0),
                                    child: Text("+82 1234 5678",style: commontextstyle(color: Colors.grey.shade800),),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left:600.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Text("Terms of Use",style: commontextstyle(color: Colors.grey.shade800),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Text("Privacy Policy",style: commontextstyle(color: Colors.grey.shade800),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Text("Copyright © 2024",style: commontextstyle(color: Colors.grey.shade800),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }


  Widget Dashboard() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /////left side
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardcount("124,684", "Students",ColorConstant.violetcolor,"15%",Colors.green),
                  cardcount("12,379", "Teachers",ColorConstant.yellowcolor,"3%",Colors.red),
                  cardcount("29,300", "Staffs",ColorConstant.violetcolor,"3%",Colors.red),
                  cardcount("95,800", "Awards",ColorConstant.yellowcolor,"5%",Colors.green),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MouseRegion(
                      // onEnter: (_)=>setState(()=>hoverstudentgraph=true),
                      // onExit:  (_)=>setState(()=>hoverstudentgraph=false),
                      child: Container(
                          height: displayheight(context)*0.48,
                          width: displaywidth(context)*0.15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Students",style: commontextstyle(fontweight: FontWeight.w700,size: 14),),
                                ),
                                boysgirlschart()
                              ],
                            ),
                          ) ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: displayheight(context)*0.48,
                        width: displaywidth(context)*0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Attendance",style: commontextstyle(fontweight: FontWeight.w700,size: 14),),
                              ),
                              Attedence()
                            ],
                          ),
                        ) ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: displayheight(context)*0.45,
                        width: displaywidth(context)*0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Earnings",style: commontextstyle(fontweight: FontWeight.w700,size: 14),),
                              ),
                              expancechart()
                            ],
                          ),
                        ) ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: displaywidth(context)*0.15,
                          child:  Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluecolor,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.person,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("24,680",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Olympic Students",style: drawertxt(),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: ColorConstant.yellowcolor,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(Icons.trending_up_rounded,color: Colors.white,size: 10,),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0),
                                          child: Text("15%",style: commontextstyle(color: Colors.green,fontweight: FontWeight.w700),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: displaywidth(context)*0.15,
                          child:  Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            child: Padding(
                              padding:const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluecolor,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.trending_up,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("3,000",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Competition",style: drawertxt(),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(Icons.trending_down_rounded,color: Colors.white,size: 10,),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0),
                                          child: Text("8%",style: commontextstyle(color: Colors.red,fontweight: FontWeight.w700),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: displaywidth(context)*0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeworkannouncement(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Messages",style: commontextstyle(size: 18,fontweight: FontWeight.w700),),
                                      Text("View All",style: drawertxt(),)
                                    ],
                                  ),
                                ),
                                messages(),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget Teacherlist(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: displayheight(context)*0.90,
        width: displaywidth(context)*0.84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Teachers List",style: headingtxt18(),),
                    Padding(
                      padding: const EdgeInsets.only(left:600.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: displaywidth(context)*0.20,
                              height: displayheight(context)*0.05,
                              child: TextFormField(
                                style: drawertxt1(),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                                    hintStyle: drawertxt(),
                                    hintText: "Search by ID, Name, or Subject",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(color: Colors.grey)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(color: Colors.grey)
                                    )
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.list_outlined),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.filter_list_alt),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorConstant.bluecolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.14,
                                child: Center(child: Text("Teacher Name",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("School ID",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Subject",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Class(es)",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Phone Number",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: displaywidth(context)*0.11,
                                    child: Center(child: Text("Address",style: drawertxt1(),))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.09,
                                child: Center(child: Text("Action",style: drawertxt1(),))),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayheight(context)*0.70,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return MouseRegion(
                          onEnter: (_)=>setState(()=>hoverteacherlist[index]=true),
                          onExit: (_)=>setState(()=>hoverteacherlist[index]=false),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity, // Make container take full width
                                decoration:  BoxDecoration(
                                  color: hoverteacherlist[index]==true?Colors.grey.shade100:Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: displaywidth(context)*0.15,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(Asset_Constant.profile),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Ms.Elizabeth Johnson", style: drawertxt1()),
                                                Text("johnson@eduprohigh.edu", style: commontextstyle(color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("SJ-ENG-123",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("English Literature",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("9A, 10B",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("(555) 101-0101",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.15,
                                          child: Center(child: Text("(123 Elm St, Springfield, IL",style: drawertxt1(),))),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.square_pencil,color: Colors.black,size: 20,)),
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.delete,color: Colors.black,size: 20,)),
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.eye,color: Colors.black,size: 20,))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(thickness: 0.2,)
                            ],
                          ),
                        );
                      },
                    ),
                  ),





                ],
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget Studentlist(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: displayheight(context)*0.90,
        width: displaywidth(context)*0.84,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Students List",style: headingtxt18(),),
                    Padding(
                      padding: const EdgeInsets.only(left:600.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: displaywidth(context)*0.20,
                              height: displayheight(context)*0.05,
                              child: TextFormField(
                                style: drawertxt1(),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                                    hintStyle: drawertxt(),
                                    hintText: "Search by ID, Name, or Subject",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(color: Colors.grey)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(color: Colors.grey)
                                    )
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.list_outlined),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.filter_list_alt),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.yellowcolor,
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: ColorConstant.bluecolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.14,
                                child: Center(child: Text("Student Name",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Student ID",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Class",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("DOB",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.10,
                                child: Center(child: Text("Phone Number",style: drawertxt1(),))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: displaywidth(context)*0.11,
                                    child: Center(child: Text("Address",style: drawertxt1(),))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: displaywidth(context)*0.09,
                                child: Center(child: Text("Action",style: drawertxt1(),))),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayheight(context)*0.70,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            MouseRegion(
                              onEnter: (_)=>setState(()=>hoverstudentlist[index]=true),
                              onExit: (_)=>setState(()=>hoverstudentlist[index]=false),
                              child: Container(
                                width: double.infinity, // Make container take full width
                                decoration:  BoxDecoration(
                                  color: hoverstudentlist[index]==true?Colors.grey.shade100:Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: displaywidth(context)*0.15,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(Asset_Constant.profile),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Sarah Miller", style: drawertxt1()),
                                                Text("smiller@eduprohigh.edu", style: commontextstyle(color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("2016-01-001",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("10A",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("04/18/2008",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.11,
                                          child: Center(child: Text("(555) 101-0101",style: drawertxt1(),))),
                                      SizedBox(
                                          width: displaywidth(context)*0.15,
                                          child: Center(child: Text("101 High St, Springfield, IL",style: drawertxt1(),))),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.square_pencil,color: Colors.black,size: 20,)),
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.delete,color: Colors.black,size: 20,)),
                                          IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.square_list,color: Colors.black,size: 20,))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Divider(thickness: 0.2,)
                          ],
                        );
                      },
                    ),
                  ),





                ],
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget AttendanceList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: displayheight(context) * 0.90,
        width: displaywidth(context) * 0.84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Attendance", style: headingtxt18()),
                  ],
                ),
              ),
              // Header Row
              Container(
                decoration: const BoxDecoration(
                  color: ColorConstant.bluecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SizedBox(
                          width: displaywidth(context) * 0.11,
                          child: Center(child: Text("Student Name", style: drawertxt1())),
                        ),
                      ),
                      // Create a fixed width for date cells
                      Expanded(
                        child: SizedBox(
                          height: 30, // Fixed height for the header row
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 31,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  width: 26,
                                  child: Center(
                                    child: Text(
                                      "${index + 1}".padLeft(2,'0'),
                                      style: drawertxt1(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Attendance Rows
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: displaywidth(context) * 0.11,
                                  child: Center(child: Text("Lucas Johnson", style: drawertxt1())),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 30, // Fixed height for the attendance row
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 31,
                                      itemBuilder: (BuildContext context, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: CircleAvatar(
                                            backgroundColor: ColorConstant.bluecolor,
                                            radius: 8,
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 8,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(thickness: 0.2),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NoticeList(){
    return Container(

    );
  }

  Widget FinanceStudentsgraph(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: displayheight(context)*1.20,
        width: displaywidth(context)*0.84,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: displayheight(context)*0.40,
                  width: displaywidth(context)*0.53,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Fees Collection",style: commontextstyle(fontweight: FontWeight.w700,size: 14),),
                        ),
                        SizedBox(
                          height: displayheight(context)*0.34,
                          width: displaywidth(context)*0.50,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            legend: const Legend(isVisible: true,position: LegendPosition.bottom),
                            tooltipBehavior: _tooltipBehavior3,
                            primaryXAxis:  CategoryAxis(
                                labelStyle: drawertxt(),
                              axisLine:const AxisLine(width: 0),
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(width: 0)
                            ),
                            primaryYAxis:  NumericAxis(
                                labelStyle: drawertxt(),
                                axisLine:const AxisLine(width: 0),
                                majorGridLines: MajorGridLines(width: 0),
                                majorTickLines: MajorTickLines(width: 0)
                            ),
                            series: <CartesianSeries>[
                              SplineAreaSeries<ChartData3, String>(
                                enableTooltip: true,
                                  borderColor: Colors.orange.shade800,
                                  name: "Fees Collection",
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        ColorConstant.yellowcolor.withOpacity(0.1),
                                        ColorConstant.yellowcolor,
                                        Colors.yellow
                                      ]),
                                  dataSource: chartData3,
                                  xValueMapper: (ChartData3 data, _) => data.x,
                                  yValueMapper: (ChartData3 data, _) => data.y
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: displaywidth(context)*0.15,
                          child:  Card(
                            color: ColorConstant.bluecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Image.asset(Asset_Constant.trend,height: 50,width: 50,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.arrow_upward_outlined,color: Colors.green,size: 15,),
                                              Text("8%",style: commontextstyle(color: Colors.green),)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text("\$",style: commontextstyle(size: 24,fontweight: FontWeight.w700)),
                                        Text("8,000",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Activities",style: commontextstyle(fontweight: FontWeight.w400),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: displaywidth(context)*0.15,
                          child:  Card(
                            color: ColorConstant.bluecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(Asset_Constant.trend,height: 50,width: 50,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.arrow_downward_rounded,color: Colors.red,size: 15,),
                                              Text("3%",style: commontextstyle(color: Colors.red),)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text("\$",style: commontextstyle(size: 24,fontweight: FontWeight.w700)),
                                        Text("6,150",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Miscellaneous",style: commontextstyle(fontweight: FontWeight.w400),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: displaywidth(context)*0.15,
                          child:  Card(
                            color: ColorConstant.bluecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(Asset_Constant.trend,height: 50,width: 50,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.arrow_upward_outlined,color: Colors.green,size: 15,),
                                              Text("15%",style: commontextstyle(color: Colors.green),)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text("\$",style: commontextstyle(size: 24,fontweight: FontWeight.w700)),
                                        Text("126,450",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Amount",style:commontextstyle(fontweight: FontWeight.w400),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: displaywidth(context)*0.15,
                           child:Card(
                            color: ColorConstant.bluecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(Asset_Constant.trend,height: 50,width: 50,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.arrow_downward_rounded,color: Colors.red,size: 15,),
                                              Text("15%",style: commontextstyle(color: Colors.red),)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text("\$",style: commontextstyle(size: 24,fontweight: FontWeight.w700)),
                                        Text("67,200",style: commontextstyle(size: 24,fontweight: FontWeight.w700),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Tuition",style: commontextstyle(fontweight: FontWeight.w400),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                             )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0,bottom: 4.0),
              child: Container(
                height: displayheight(context)*0.70,
                width: displaywidth(context)*0.84,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Fees Collections",style: commontextstyle(fontweight: FontWeight.w700,size: 14)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.bluecolor.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)
                                )
                              ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.12,
                                          child: Center(child: Text("Student Name ",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.05,
                                          child: Center(child: Text("Class",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.09,
                                          child: Center(child: Text("Tuition Fee",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.09,
                                          child: Center(child: Text("Activities Fee",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.09,
                                          child: Center(child: Text("Miscellaneous",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.09,
                                          child: Center(child: Text("Amount",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.10,
                                          child: Center(child: Text("Status",style: drawertxt1(),))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                          width: displaywidth(context)*0.07,
                                          child: Center(child: Text("Action",style: drawertxt1(),))),
                                    )

                                  ],
                                ),
                            ),
                            SizedBox(
                              height: displayheight(context)*0.50,
                                width: displaywidth(context)*0.90,
                                child:ListView.builder(
                                  itemCount: 10,
                                    itemBuilder: (BuildContext context,int index){
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color:Colors.white
                                        ),
                                        child:  Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.10,
                                                    child:  Center(child: Text("Sophia Wilson",style: drawertxt1()))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.09,
                                                    child:  Center(child: Text("10-A",style: drawertxt1()))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.09,
                                                    child:  Center(child: Text("\$4,500",style: drawertxt1()))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.09,
                                                    child:  Center(child: Text("\$4,500",style: drawertxt1()))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.09,
                                                    child:  Center(child: Text("\$4,500",style: drawertxt1()))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width:displaywidth(context)*0.10,
                                                    child:  Center(child: Text("\$4,500",style: drawertxt1()))),
                                              ),
                                              SizedBox(
                                                width:displaywidth(context)*0.09,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.red.withOpacity(0.2),
                                                          borderRadius: BorderRadius.circular(15)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(6.0),
                                                          child: Text("Overdue",style: commontextstyle(fontweight: FontWeight.w600,color: Colors.red),),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: displaywidth(context)*0.10,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.square_pencil,color: Colors.black,size: 20,)),
                                                    IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.delete,color: Colors.black,size: 20,)),
                                                    IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.square_list,color: Colors.black,size: 20,))
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(thickness: 0.2,)
                                    ],
                                  );
                                })

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Notice(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: displaywidth(context)*0.84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Notice Board",style: headingtxt18(),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:650.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: displaywidth(context)*0.20,
                            height: displayheight(context)*0.05,
                            child: TextFormField(
                              style: drawertxt1(),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                                  hintStyle: drawertxt(),
                                  hintText: "Search by Title",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(color: Colors.grey)
                                  )
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: ColorConstant.yellowcolor,
                            child: Center(
                              child: Icon(Icons.filter_list_alt),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: ColorConstant.yellowcolor,
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayheight(context)*0.90,
                    width: displaywidth(context)*0.55,
                    child: ListView.builder(
                        itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  noticeontap=index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey,width: 0.2),
                                  color: noticeontap==index?Colors.grey.shade100:Colors.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                    child: Image.asset(Asset_Constant.profile,height: displayheight(context)*0.05)),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Welcome Back to School!",style: commontextstyle(color: Colors.black,size: 15,fontweight: FontWeight.w500)),
                                                      Text("By Principal Linda Carter",style: commontextstyle(color: Colors.grey),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: noticeontap==index?Colors.white:Colors.grey.shade500,
                                                    borderRadius: BorderRadius.circular(30)
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("August 1, 2024",style:
                                                      noticeontap==index?
                                                      commontextstyle(fontweight: FontWeight.w700,color: Colors.grey):
                                                      commontextstyle(fontweight: FontWeight.w700,color: Colors.white)
                                                        ,),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:8.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(CupertinoIcons.eye_solid,color: Colors.grey,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left:4.0),
                                                        child: Text("1.2K",style: commontextstyle(color: Colors.grey),),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("As we embark on another exciting academic year, let’s embrace the opportunities that lie ahead. We're thrilled to welcome new faces and reunite with returning students. Don't miss our opening assembly on August 5th!",style:commontextstyle(size: 14),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: displayheight(context)*0.80,
                      width: displaywidth(context)*0.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(Asset_Constant.banner,height: displayheight(context)*0.25,width:double.infinity,fit: BoxFit.fill,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome Back to School!",style: commontextstyle(color: Colors.black,size: 15,fontweight: FontWeight.w500)),
                                Text("By Principal Linda Carter",style: commontextstyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade500,
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("August 1, 2024",style:
                                            commontextstyle(fontweight: FontWeight.w700,color: Colors.white)
                                              ,),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Row(
                                          children: [
                                            const Icon(CupertinoIcons.eye_solid,color: Colors.grey,),
                                            Padding(
                                              padding: const EdgeInsets.only(left:4.0),
                                              child: Text("1.2K",style: commontextstyle(color: Colors.grey),),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("As we embark on another exciting academic year, let’s embrace the opportunities that lie ahead. We're thrilled to welcome new faces and reunite with returning students. Don't miss our opening assembly on August 5th!",style:commontextstyle(size: 14),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("As we embark on another exciting academic year, let’s embrace the opportunities that lie ahead. We're thrilled to welcome new faces and reunite with returning students. Don't miss our opening assembly on August 5th!",style:commontextstyle(size: 14),),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.bluecolor
                              ),
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                Text("Read Full Page",style: commontextstyle(),),
                                 const Padding(
                                   padding: EdgeInsets.only(left:4.0),
                                   child: Icon(Icons.send,color: Colors.black,size: 15,),
                                 )
                              ],
                            )),
                          )

                        ],
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget Calender(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: displayheight(context)*0.90,
        width: displaywidth(context)*0.84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            SizedBox(
              height: displayheight(context)*0.70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCalendar(
                  todayHighlightColor: Colors.orange,
                  cellBorderColor: Colors.grey,
                  todayTextStyle: commontextstyle(color: Colors.white,size: 15),
                  headerStyle: CalendarHeaderStyle(backgroundColor: Colors.white,textStyle: drawertxt1()),
                  view:calenderontap==0?CalendarView.month:calenderontap==1?CalendarView.week:CalendarView.day
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget Library(){
    return Container(
      width: displaywidth(context)*0.84,
      height: displayheight(context)*0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorConstant.bluecolor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.11,
                      child: Center(
                        child: Text("Book ID",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.11,
                      child: Center(
                        child: Text("Book Name",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.11,
                      child: Center(
                        child: Text("Student ID",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.11,
                      child: Center(
                        child: Text("Student Name",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.10,
                      child: Center(
                        child: Text("Class(es)",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.10,
                      child: Center(
                        child: Text("Date of Taken",style: drawertxt1(),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: displaywidth(context)*0.10,
                      child: Center(
                        child: Text("Status",style: drawertxt1(),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: displayheight(context)*0.80,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (BuildContext context,int index){
                  return MouseRegion(
                    onEnter: (_) => setState(() => libraryhoverlist[index] = true),
                    onExit: (_) => setState(() => libraryhoverlist[index] = false),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: libraryhoverlist[index]==true?Colors.grey.shade100:Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: displaywidth(context)*0.12,
                                  child: Center(
                                    child: Text("2024-LIT-001-01",style: drawertxt1(),),
                                  ),
                                ),
                                SizedBox(
                                  width: displaywidth(context)*0.12,
                                  child: Center(
                                    child: Text("Great Expectations",style: drawertxt1(),),
                                  ),
                                ),
                                SizedBox(
                                  width: displaywidth(context)*0.12,
                                  child: Center(
                                    child: Text("AKK1012",style: drawertxt1(),),
                                  ),
                                ),
                                SizedBox(
                                  width: displaywidth(context)*0.12,
                                  child: Center(
                                    child: Text("John Robert",style: drawertxt1(),),
                                  ),
                                ),
                                SizedBox(
                                  width: displaywidth(context)*0.12,
                                  child: Center(
                                    child: Text("12-A",style: drawertxt1(),),
                                  ),
                                ),
                                SizedBox(
                                  width: displaywidth(context)*0.13,
                                  child: Center(
                                    child: Text("10-11-2001",style: drawertxt1(),),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: libraryhoverlist[index]==true?Colors.white:Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(15)
                                  ),child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Completed",style: commontextstyle(color: Colors.green.shade800,fontweight: FontWeight.w600),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider(thickness: 0.2,)
                      ],
                    ),
                  );
                }),
          )

        ],
      ),

    );
  }

  Widget Messages(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: displayheight(context)*0.87,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
              // borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                SizedBox(
                  width: displaywidth(context)*0.30,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: displayheight(context)*0.06,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: drawertxt1(),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(CupertinoIcons.search),
                              suffixIcon:const Icon(CupertinoIcons.slider_horizontal_3),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30)
                              ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30)
                                )
                            ),
                          ),
                        ),
                      ),
                      const Divider(thickness: 0.2,),
                      SizedBox(
                        height: displayheight(context)*0.75,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context,int index){
                              return Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundImage:AssetImage( Asset_Constant.profile),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Dr. Lila Ramirez",style: commontextstyle(fontweight: FontWeight.w700),),
                                                SizedBox(
                                                    width:displaywidth(context)*0.20,
                                                    child: Text("Please ensure the monthly attendance report is accurate before the April 30th deadline.",style: commontextstyle(fontweight: FontWeight.w400,color: Colors.grey),maxLines: 2,))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("9:00 AM",style: commontextstyle(fontweight: FontWeight.w400,color: Colors.grey),),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                 const Divider(thickness: 0.2,)
                                ],
                              );

                        }),
                      )


                    ],
                  ),
                )
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(left:2.0),
            child: Container(
              decoration:const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: displayheight(context)*0.10,
                    width: viewprofile==true?displaywidth(context)*0.34:displaywidth(context)*0.54,
                    decoration: viewprofile==true?
                         const BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                         topRight: Radius.circular(0),
                         bottomRight: Radius.circular(0)
                          )
                         )
                        : const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                      )

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            // viewprofile=true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(Asset_Constant.profile),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:12.0),
                                    child: Text("Dr. Lila Ramirez",style: commontextstyle(fontweight: FontWeight.w700,size: 15),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:12.0),
                                    child: Text("Click here to see group members",style: commontextstyle(fontweight: FontWeight.w400,color: Colors.grey)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: displayheight(context)*0.77,
                    color: Colors.grey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: displayheight(context) * 0.69,
                          width: viewprofile == true ? displaywidth(context) * 0.33 : displaywidth(context) * 0.54,
                          child: ListView.builder(
                            itemCount: chatlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(Asset_Constant.profile),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                                      child: Container(
                                        width: displaywidth(context)*0.25,
                                          decoration:  const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                            )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${chatlist[index]['name']}",style: commontextstyle(color: Colors.orange),),
                                                    Text("School Secretary",style: commontextstyle(color: Colors.grey),)

                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("${chatlist[index]['description1']??""}",style: commontextstyle(),),
                                                ),
                                                Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text("8:05 AM",style: commontextstyle(color: Colors.grey),))
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height: displayheight(context)*0.05,
                                  width: displaywidth(context)*0.25,
                                  child: TextFormField(
                                    style: drawertxt1(),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintStyle: drawertxt(),
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Search Here",
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(color: Colors.transparent)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(color: Colors.transparent)
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: displaywidth(context)*0.02,),
                            InkWell(
                              onTap:(){},
                              child: const CircleAvatar( backgroundColor: Colors.white,
                              child: Icon(Icons.send_rounded,color: ColorConstant.bluecolor,),),
                            )
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:2.0),
            child: Container(
              height: displayheight(context)*0.87,
              width: displaywidth(context)*0.20,
              decoration: viewprofile==true?
              const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                  )
              )
                  : const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Group Info",style: commontextstyle(fontweight: FontWeight.w700,size: 15),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              // viewprofile=false;
                            });
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey.shade200,
                            child: Center(
                              child: Icon(Icons.close,color: Colors.grey.shade800,size: 10,),
                            ),
                          ),
                        )
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(Asset_Constant.profile),
                      ),
                    ),
                    Text("Staff Coordination",style: commontextstyle(fontweight: FontWeight.w700),),
                    Divider(thickness: 0.2,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.book,color: Colors.grey,size: 12,),
                              Padding(
                                padding: const EdgeInsets.only(left:4.0),
                                child: Text("Description",style: commontextstyle(color: Colors.grey),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("This is your go-to hub for seamless communication, collaboration, and coordination among our team members. Whether you're working on a project, seeking assistance, or just want to connect with your colleagues, this chat room has got you covered.",style: commontextstyle(),),
                          )

                        ],
                      ),
                    )
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget cardcount(txt1,txt2,Color?color,txt3,Color color1){
  return SizedBox(
    width: displaywidth(context)*0.13,
    child: Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)

                  ),child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                    children: [
                      Icon(Icons.arrow_upward_outlined,color: color1,size: 12,),
                      Text(txt3,style: commontextstyle(color: color1,fontweight: FontWeight.w600),)
                    ],
                                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(txt1,style: commontextstyle(fontweight: FontWeight.w600,size: 24),),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(txt2,style: commontextstyle(fontweight: FontWeight.w300,size: 14),),
            )
          ],
        ),
      ),
    ),
  );
}

  Widget Attedence(){
    return Container(
      height: displayheight(context)*0.40,
      width: displaywidth(context)*0.35,
      child: SfCartesianChart(
        legend:  Legend(isVisible: true,position: LegendPosition.bottom),
        tooltipBehavior: _tooltipBehavior,
        plotAreaBorderWidth: 0,
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          axisLine: const AxisLine(width: 0),
            labelStyle: drawertxt()
        ),
        primaryXAxis:  CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          axisLine: const AxisLine(width: 0),
          labelStyle: drawertxt()
        ),
        series: <CartesianSeries>[
          ColumnSeries<ChartData1, String>(
            animationDuration: 2000,
            enableTooltip: true,
              name:"Present",
              borderRadius: BorderRadius.circular(15),
            borderColor: Colors.blue.shade500,
            color: ColorConstant.bluecolor,
              dataSource: chartData1,
              xValueMapper: (ChartData1 data, _) => data.x,
              yValueMapper: (ChartData1 data, _) => data.y
          ),
          ColumnSeries<ChartData1, String>(
            enableTooltip: true,
              animationDuration: 2000,
              borderColor: Colors.orange,
              name:"Absent",
            borderRadius: BorderRadius.circular(15),
            color: ColorConstant.yellowcolor,
              dataSource: chartData1,
              xValueMapper: (ChartData1 data, _) => data.x,
              yValueMapper: (ChartData1 data, _) => data.y1
          ),
        ],
      ),
    );
  }

  Widget boysgirlschart(){
    return Container(
      height: displayheight(context)*0.42,
      width: displaywidth(context)*0.25,
      child: SfCircularChart(
        legend:  Legend(isVisible: true,position: LegendPosition.bottom,textStyle:drawertxt1() ),
          tooltipBehavior: _tooltipBehavior1,
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              // strokeColor: Colors.black,
                enableTooltip: true,

                dataSource: chartData,
                pointColorMapper:(ChartData data,  _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y
            )
          ]
      ),
    );

                     }

  Widget expancechart(){
    return Container(
      height: displayheight(context)*0.37,
      width: displaywidth(context)*0.35,
      child: SfCartesianChart(
          legend: Legend(textStyle: drawertxt(),isVisible: true,position: LegendPosition.bottom),
        tooltipBehavior: _tooltipBehavior2,
       plotAreaBorderWidth: 0,
        primaryXAxis:  CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          labelStyle: drawertxt(),
          axisLine: const AxisLine(width: 0),
        ),
          primaryYAxis: NumericAxis(
            labelStyle: drawertxt(),
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),
          series: <CartesianSeries>[
            // Renders spline chart
            SplineSeries<ChartData2, String>(
              enableTooltip: true,
              name: "Income",
              animationDuration: 2000,
              color: ColorConstant.yellowcolor,
                width: 10,
                dataSource: chartData2,
                xValueMapper: (ChartData2 data, _) => data.x,
                yValueMapper: (ChartData2 data, _) => data.y
            ),
            SplineSeries<ChartData2, String>(
              enableTooltip: true,
                animationDuration: 2000,
                color: Colors.purple,
                width: 10,
                name: "Expense",
                dataSource: chartData2,
                xValueMapper: (ChartData2 data, _) => data.x,
                yValueMapper: (ChartData2 data, _) => data.y1
            )
          ]
      )
    );

  }

  Widget homeworkannouncement(){
    return Container(
      width: displaywidth(context)*0.30,
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TimelineCalendar(
        calendarType: CalendarType.GREGORIAN,
        calendarLanguage: "en",
        calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          headerMonthElevation: 0,
          headerMonthBackColor: Colors.transparent,
        ),
        dayOptions: DayOptions(
            compactMode: true,
            dayFontSize: 15,
            weekDaySelectedColor:ColorConstant.bluecolor,
            disableDaysBeforeNow: false),
        headerOptions: HeaderOptions(
            weekDayStringType: WeekDayStringTypes.SHORT,
            monthStringType: MonthStringTypes.FULL,
            backgroundColor:  ColorConstant.yellowcolor,
            headerTextSize: 20,
            headerTextColor: Colors.black),
        onChangeDateTime: (datetime) {
          print(datetime.getDate());
        },
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Agenda",style: commontextstyle(size: 18,fontweight: FontWeight.w700),),
          ),
          SizedBox(
            height: displayheight(context)*0.30,
            child: ListView.builder(
              itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color:ColorConstant.light_pink,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("08:00 am",style: commontextstyle(size: 14,fontweight: FontWeight.w700),),
                        ),
                        const VerticalDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("All Grade",style: commontextstyle(size: 14,fontweight: FontWeight.w400,color: Colors.grey),),
                              Text("Homeroom & Announcement",style: commontextstyle(size: 15,fontweight: FontWeight.w700),),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget messages(){
    return SizedBox(
      height: displayheight(context)*0.50,
      child: ListView.builder(
        itemCount: 10,
          itemBuilder: (BuildContext context,int index){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(Asset_Constant.profile),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ms. Heather Morris",style: commontextstyle(fontweight: FontWeight.w700,size: 15),),
                        Text("Please ensure the monthly attendance report .",style: drawertxt(),)
                      ],
                    ),
                  )
                ],
                          ),
                const Divider(thickness: 0.5,)
              ],
            ),
          ),
        );
      }),
    );
  }

  Future logout(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Icon(Icons.logout_outlined,color: Colors.red,weight: 500,),
      );
    });
  }


}


class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartData1 {
  ChartData1(this.x, this.y,this.y1);
  final String x;
  final double? y;
  final double? y1;
}

class ChartData2 {
  ChartData2(this.x, this.y,this.y1);
  final String x;
  final double? y;
  final double ? y1;
}

class ChartData3 {
  ChartData3(this.x, this.y);
  final String x;
  final double y;
}