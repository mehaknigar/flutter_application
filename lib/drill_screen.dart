// ignore_for_file: file_names

//This file contains the design of the screen
import 'package:flutter/material.dart';
import 'package:flutter_application/const_variables.dart';
import 'package:flutter_application/data.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:provider/provider.dart';

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CurveImage(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(39, 40, 55, 0.5), BlendMode.dstATop),
                      image: AssetImage(imageBackground),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Positioned(
                  top: 20,
                  left: 0.0,
                  right: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 0,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: backIconButtonColor),
                            onPressed: () =>
                                Provider.of<DataModel>(context, listen: false)
                                    .showPrevious(),
                          ),
                        ),
                        Expanded(
                          child: Consumer<DataModel>(
                              builder: (context, data, child) {
                            return RoundedProgressBar(
                              height: 10,
                              percent: ((data.index + 1) * 100) /
                                  data.textData.length,
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              borderRadius: BorderRadius.circular(24),
                              style: RoundedProgressBarStyle(
                                borderWidth: 0,
                                widthShadow: 0,
                                colorProgress: barProgessColor,
                                colorProgressDark: Colors.grey.shade100,
                              ),
                            );
                          }),
                        ),
                        const Expanded(
                          flex: 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              barText,
                              style: TextStyle(
                                color: barTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Consumer<DataModel>(builder: (context, data, child) {
                      return Text(
                        data.textData[data.index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 24,
                        ),
                        overflow: TextOverflow.clip,
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<DataModel>(builder: (context, data, child) {
                    return Text(
                      data.textData[data.index].subtitle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: FittedBox(
                child: FloatingActionButton(
                  elevation: 3,
                  child: const Text(buttonText),
                  backgroundColor: blackButton,
                  onPressed: () {
                    Provider.of<DataModel>(context, listen: false).showNext();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

//Code for curving the image
class CurveImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
