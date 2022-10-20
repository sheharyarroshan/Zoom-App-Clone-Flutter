import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom/Utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChanged;
  const MeetingOption({
    Key? key,
    required this.text,
    required this.isMuted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: const TextStyle(fontSize: 16.0)),
          ),
          Switch.adaptive(
            value: isMuted,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
