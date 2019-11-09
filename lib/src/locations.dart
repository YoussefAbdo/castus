class Location {
  Location({
    this.lat,
    this.lng,
    this.color,
  });

  // factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  // Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
  final String color;
}