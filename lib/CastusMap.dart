import 'package:castus/src/locations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CastusMap extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CastusMap> {
  GoogleMapController mapController;
  static Location point1 = Location(
    lat: 30.04176,
    lng: 31.23125,
    color: "low"
  );
  List<Location> locations = [point1];
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    // setState(() {
      _markers.clear();
      for (final loc in locations) {
        final marker = Marker(
          markerId: MarkerId(loc.color),
          position: LatLng(loc.lat, loc.lng),
          infoWindow: InfoWindow(
            title: loc.color,
            snippet: loc.color,
          ),
        );
        _markers[loc.color] = marker;
      }
    // });
  }

  //final LatLng _center = const LatLng(30.04176, 31.23125);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('castus'),
        //   backgroundColor: Colors.green[700],
        // ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
