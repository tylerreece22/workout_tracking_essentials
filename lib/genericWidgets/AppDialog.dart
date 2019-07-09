import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  Function(String) setField;
  String fieldName;
  String title;

  AppDialog(this.setField, this.fieldName, {this.title});

  @override
  State<StatefulWidget> createState() => AppDialogState(this.setField, this.fieldName, title: this.title);
}

class AppDialogState extends State<AppDialog> {
  final fieldNameController = TextEditingController();
  Function(String) setField;
  FocusNode _focusNode = FocusNode();
  String title;
  String fieldName;

  AppDialogState(this.setField, this.fieldName, {this.title});

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fieldNameController.text = fieldName;
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        fieldNameController.selection = TextSelection(
            baseOffset: 0, extentOffset: fieldNameController.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: title != null ? Text(title) : Text('New Name:'),
      content: TextField(
        autofocus: true,
        controller: fieldNameController,
        focusNode: _focusNode,
      ),
      actions: <Widget>[
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                  setField(fieldNameController.text.trim());
                fieldNameController.text = fieldName;
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  fieldNameController.text = fieldName;
                }),
          ],
        )
      ],
    );
  }
}
