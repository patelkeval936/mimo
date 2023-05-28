import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mimo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return Scaffold(
      body: Center(
        child: Column(
          children: [SizedBox(height: 200,),
            // Container(
            //     width: 400,
            //     // height: width * 0.7,
            //     height: 200,
            //     color: Colors.red,
            //     child: CustomPaint(
            //         painter: CustomHeader(),
            //         )),
            SizedBox(height: 200,),

            Container(

              height: 140,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),   color: Colors.transparent,
                border: Border.all(color: Colors.blueAccent, width: 5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Stack(
                  alignment: isButtonPressed ? Alignment.bottomCenter : Alignment.topCenter,
                  children: [
                    Container(
                      height: isButtonPressed ? 110 : 130,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),   color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        overlayColor: MaterialStateProperty.all(Colors.green),
                        onTapDown: (details){
                          setState(() {
                            isButtonPressed = true;
                          });
                        },
                        onTapUp: (details){
                          setState(() {
                            isButtonPressed = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),   color: Colors.blue,
                          ),
                          height: 90,
                          width: 90,
                          child: Icon(Icons.play_arrow_rounded,size: 60,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class CustomHeader extends CustomPainter {

  final painter = Paint()
    ..color = Colors.amber
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 7
    ..style = PaintingStyle.stroke;






  @override
  void paint(Canvas canvas, Size size) {

    double boxPixels = size.width * 0.1;
    double radius = size.width * 0.15;


    canvas.drawLine(
      Offset(0, boxPixels * 2),
      Offset(boxPixels, boxPixels * 2),
      painter,
    );

    final arc1 = Path();
    arc1.moveTo(boxPixels, boxPixels * 2);
    arc1.arcToPoint(
      Offset(boxPixels * 2.5, boxPixels * 0.5),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    canvas.drawPath(arc1, painter);

    canvas.drawLine(
      Offset(boxPixels * 2.5, boxPixels * 0.5),
      Offset(boxPixels * 7.5, boxPixels * 0.5),
      painter,
    );

    final arc2 = Path();
    arc2.moveTo(boxPixels * 7.5, boxPixels * 0.5);
    arc2.arcToPoint(
      Offset(boxPixels * 9, boxPixels * 2),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    canvas.drawPath(arc2, painter);

    canvas.drawLine(
      Offset(boxPixels * 9, boxPixels * 2),
      Offset(boxPixels * 10, boxPixels *2),
      painter,
    );



//downward

    canvas.drawLine(
      Offset(0, boxPixels * 3),
      Offset(boxPixels, boxPixels * 3),
      painter,
    );

    final arc3 = Path();
    arc3.moveTo(boxPixels, boxPixels * 3);
    arc3.arcToPoint(
      Offset(boxPixels * 2.5, boxPixels * 4.5),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    canvas.drawPath(arc3, painter);

    canvas.drawLine(
      Offset(boxPixels * 2.5, boxPixels * 4.5),
      Offset(boxPixels * 7.5, boxPixels * 4.5),
      painter,
    );

    final arc4 = Path();
    arc4.moveTo(boxPixels * 7.5, boxPixels * 4.5);
    arc4.arcToPoint(
      Offset(boxPixels * 9, boxPixels * 3),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    canvas.drawPath(arc4, painter);

    canvas.drawLine(
      Offset(boxPixels * 9, boxPixels * 3),
      Offset(boxPixels * 10, boxPixels * 3),
      painter,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
