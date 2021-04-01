import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  int touchedIndex = -1;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  set touchedIndex(int touchedIndex) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  static String dateFnc() {
    return DateTime.now().day.toString() +
        " / " +
        DateTime.now().month.toString() +
        " / " +
        DateTime.now().year.toString();
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black26.withOpacity(0.5),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 2,
          margin: 5,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Mars';
              case 3:
                return 'Mai';
              case 6:
                return 'Aout';
              case 9:
                return 'Oct';
              case 12:
                return 'Févr';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '1000';

              case 4:
                return '2000';

              case 6:
                return '3000';

              case 8:
                return '4000';

              case 10:
                return '5000';

              case 12:
                return '6000';

              case 14:
                return '7000';
            }

            return '';
          },
          margin: 3,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 6,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 13,
      maxY: 14,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 0),
        FlSpot(1, 0.26),
        FlSpot(2, 1.82),
        FlSpot(3, 0.61),
        FlSpot(4, 2.21),
        FlSpot(5, 8.09),
        FlSpot(6, 8.92),
        FlSpot(7, 13.21),
        FlSpot(8, 14.79),
        FlSpot(9, 4.38),
        FlSpot(10, 1.93),
        FlSpot(11, 1.35),
        FlSpot(12, 0.28),
        FlSpot(13, 0.34),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(0, 0),
        FlSpot(1, 1.02),
        FlSpot(2, 0.78),
        FlSpot(3, 1.38),
        FlSpot(4, 3.01),
        FlSpot(5, 7.39),
        FlSpot(6, 8.21),
        FlSpot(7, 2.591),
        FlSpot(8, 3.79),
        FlSpot(9, 1.90),
        FlSpot(10, 1.23),
        FlSpot(11, 0.6),
        FlSpot(12, 0.2),
        FlSpot(13, 0.1),
      ],
      isCurved: true,
      colors: [
        const Color(0xFFFF8748),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(0, 0),
        FlSpot(1, 0.08),
        FlSpot(2, 0.08),
        FlSpot(3, 0.02),
        FlSpot(4, 0.01),
        FlSpot(5, 0.04),
        FlSpot(6, 0.42),
        FlSpot(7, 0.38),
        FlSpot(8, 0.50),
        FlSpot(9, 0.60),
        FlSpot(10, 0.43),
        FlSpot(11, 0.26),
        FlSpot(12, 0.08),
        FlSpot(13, 0.01),
      ],
      isCurved: true,
      colors: const [
        Colors.red,
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }

//

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xFFFF8748),
            value: 1.05,
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold, color: const Color(0xFFFF4848)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFF36C12C),
            value: 97.17,
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold, color: const Color(0xFFFF4848)),
          );
        default:
          return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [9.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    var data1 = [0, 0, 1.5, 0, 0.0, 0.0, -0.5, -1.0, 0, 0.0, 0.0];
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              textBottom: " ",
              offset: offset,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Maroc",
                      items: [
                        'Maroc',
                        'France',
                        'chine',
                        'canada',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Bénéficiaires de la vaccination\n",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade50,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 10,
                          color: Colors.green.shade200,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: Colors.green.shade700,
                          number: 3961941,
                          title: "Dose 1",
                        ),
                        Counter(
                          color: Colors.green.shade900,
                          number: 651351,
                          title: "Dose 2",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Mise à jour de cas\n",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        dateFnc(),
                        style: TextStyle(
                          color: kTextLightColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          color: Colors.red.shade100,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: Colors.orange,
                          number: 102,
                          title: "confirmés",
                        ),
                        Counter(
                          color: Colors.red,
                          number: 1,
                          title: "Décès",
                        ),
                        Counter(
                          color: Colors.green,
                          number: 304,
                          title: "Guéris",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Évolution du nombre des cas",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(50),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.blue.shade100,
                          ),
                        ],
                      ),
                      child: new Container(
                        width: 30.0,
                        height: 10.0,
                        child: LineChart(
                          sampleData1(),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Répartition des cas",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        dateFnc(),
                        style: TextStyle(
                          color: kTextLightColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(1),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.cyan.shade100,
                        ),
                      ],
                    ),
                    child: Scaffold(
                        body: Center(
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 360,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 180,
                                width: 0.1,
                                sizeUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.startCurve,
                                gradient: const SweepGradient(colors: <Color>[
                                  Color(0xFF00a9b5),
                                  Color(0xFFa4edeb)
                                ], stops: <double>[
                                  0.25,
                                  0.75
                                ])),
                            MarkerPointer(
                              value: 180,
                              markerType: MarkerType.circle,
                              color: const Color(0xFF87e8e8),
                            )
                          ],
                        )
                      ]),
                    )),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
