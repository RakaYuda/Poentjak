import 'package:flutter/material.dart';
import 'package:test_app/assets/colors.dart';
import '../assets/images.dart';
import '../models/mount_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(16),
          //   child: Image.network(
          //     "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            width: 36.0,
            height: 36.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: 36,
            width: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFEAE9F3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    size: 18,
                  ),
                  Text(
                    "Jakarta",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardMount extends StatelessWidget {
  final MountModel _mount;

  CardMount(this._mount);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
            child: Hero(
              tag: "mount_" * _mount.id,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 0.56,
                      height: MediaQuery.of(context).size.height * 0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        image: DecorationImage(
                          image: NetworkImage(_mount.link),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: shadeBlue.withOpacity(0.84)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Text(
                                              _mount.mtName,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2.5),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Text(
                                              _mount.mtLocation,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white54,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2.5),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Text(
                                              _mount.mtDistance,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          Positioned.fill(
                              child: new Material(
                                  color: Colors.transparent,
                                  child: new InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardMountDetail(_mount))),
                                  )))
                        ],
                      ))
                ],
              ),
            )),
      ],
    );
  }
}

class CardMountDetail extends StatelessWidget {
  final MountModel _mount;

  CardMountDetail(this._mount);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.46,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: "mount_" * _mount.id,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.36,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        image: DecorationImage(
                            image: NetworkImage(_mount.link),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28,
//               left: 20,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    _mount.mtName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: Text(_mount.mtLocation,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          decoration: TextDecoration.none)),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MapScreen())),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.8),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color: Color(0xFFEFEEEE),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.gps_fixed),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
//                 SizedBox(
//                                 height: MediaQuery.of(context).size.height * 0.8,
//                               ),
                ],
              ),
            )),
        Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                ExpansionTile(
                  title: Text("Pos 1"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 1")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 2"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 2")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 3"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 3")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 4"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 4")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 5"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 5")],
                    )
                  ],
                ),
              ],
            )),
      ],
    ));
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Flutter'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(3.595196, 98.672226),
          zoom: 14.0,
        ),
      ),
    );
  }
}

class HeroTest extends StatefulWidget {
  @override
  _HeroTestState createState() => _HeroTestState();
}

class _HeroTestState extends State<HeroTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            tag: 'hero',
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroTestDetail())),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blueAccent,
                    child: Center(
                        child: Icon(
                      Icons.group,
                      size: 50,
                    )),
                  )),
            )));
  }
}

class HeroTestDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'hero',
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blueAccent,
              child: Center(
                  child: Icon(
                Icons.group,
                size: 50,
              )),
            )));
  }
}