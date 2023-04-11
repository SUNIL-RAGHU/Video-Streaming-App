import 'package:vidstreamz/screens/home_screen.dart';
import 'package:vidstreamz/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../model/SharedPreferences.dart';

import 'onboarding.dart';

Preferences _preferencesProvider = new Preferences();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  static populateSongsIntoDB() async {
    // OfflineAudioQuery offlineAudioQuery = new OfflineAudioQuery();

    // if (await _preferencesProvider.getBool(Preferences.DB_POPULATED) != true) {
    //   {
    //     List _songs = (await offlineAudioQuery.getSongs(
    //       sortType: SongSortType.DATE_ADDED,
    //       orderType: OrderType.DESC_OR_GREATER,
    //     ))
    //         .where((i) =>
    //                 (i.duration ?? 60000) >
    //                 1000 * 10 // 10 seconds is the minimum duration
    //             )
    //         .toList();
    //     _songs.forEach((element) {
    //       Hive.box('downloads').put(
    //         element.id,
    //         element,
    //       );
    //     });
    //     _preferencesProvider.setBool(Preferences.DB_POPULATED, true);
    //   }
    // }
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onBoarding();
    const HomeScreen();
  }

  void onBoarding() async {
    if (!await _preferencesProvider.getBool(Preferences.ON_BOARDING_DONE))
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoarding()));
    _preferencesProvider.setBool(Preferences.ON_BOARDING_DONE, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      // child: Image.asset(
      //   'assets/images/logo_light.png',
      //   width: 160,
      //   height: 160,
      // );
    );
  }
}
