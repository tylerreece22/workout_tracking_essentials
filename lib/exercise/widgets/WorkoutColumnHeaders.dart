import 'package:flutter/material.dart';

class WorkoutColumnHeaders extends StatelessWidget {
  Widget item1;
  Widget item2;
  Widget item3;
  Widget item4;
  Widget item5;

  WorkoutColumnHeaders(this.item1, this.item2, this.item3, this.item4, {this.item5});

  Widget _rowItem(Widget headerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        headerName,
      ],
    );
  }

  List<Widget> _createItems() {
    List<Widget> items = [];
    items.add(_rowItem(item1));
    items.add(_rowItem(item2));
    items.add(_rowItem(item3));
    items.add(_rowItem(item4));
    item5 != null ?? items.add(_rowItem(item5));
    return items;
}

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      // Diables GridView scrolling
      shrinkWrap: true,
      //
      childAspectRatio: 2.0,
      primary: true,
      crossAxisCount: item5 != null ? 5 : 4,
      children: <Widget>[
       ..._createItems()
      ],
    );
  }
}