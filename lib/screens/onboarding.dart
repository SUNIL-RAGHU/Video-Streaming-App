import 'package:vidstreamz/Widgets/intro_widget.dart';
import 'package:vidstreamz/screens/home_screen.dart';
import 'package:vidstreamz/screens/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController? controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageValue);
  }

  Widget _indicator(bool isActive) {
    return AnimatedOpacity(
      opacity: (_page == 2) ? 0 : 1,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    final List<Widget> onBoardingWidgets = [
      IntroWidget(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        image: 'assets/images/onboarding1.png',
        type: "Hey!👋🏻",
        startGradientColor: Theme.of(context).colorScheme.secondary,
        endGradientColor: Color.fromARGB(255, 32, 7, 7),
        subText: "",
      ),
      IntroWidget(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        image: 'assets/images/onboarding2.png',
        type: 'Call Now📞',
        startGradientColor: Theme.of(context).colorScheme.secondary,
        endGradientColor: Color.fromARGB(255, 0, 0, 0),
        subText: "",
      ),
      IntroWidget(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        image: 'assets/images/onboarding3.png',
        type: 'Connect Easily🤙🏻',
        startGradientColor: Theme.of(context).colorScheme.secondary,
        endGradientColor: Color.fromARGB(255, 25, 3, 3),
        subText: "",
      ),
    ];

    List<Widget> _buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < onBoardingWidgets.length; i++) {
        list.add(i == _page ? _indicator(true) : _indicator(false));
      }
      return list;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.1, 0.9],
                  colors: [Colors.white, Colors.white])),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: onBoardingWidgets.length,
                onPageChanged: (int page) {
                  setState(() {
                    this._page = page;
                  });
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return onBoardingWidgets[index];
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: AnimatedOpacity(
                  opacity: (_page == 2) ? 0 : 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: TextButton(
                      onPressed: () {
                        _page = 2;
                        controller!.animateToPage(_page,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        // style: Theme.of(context).textTheme.headline4,
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: (_page == 2) ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: TextButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
