import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/Auth/auth_methods.dart';
import 'package:zoom/Utils/colors.dart';
import 'package:zoom/Utils/meetingOption.dart';
import 'package:zoom/resources/jitsi_newMeeting.dart';

class VideoMeetScreen extends StatefulWidget {
  const VideoMeetScreen({Key? key}) : super(key: key);

  @override
  State<VideoMeetScreen> createState() => _VideoMeetScreenState();
}

class _VideoMeetScreenState extends State<VideoMeetScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDcontroller;
  late TextEditingController Namecontroller;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    meetingIDcontroller = TextEditingController();
    Namecontroller = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIDcontroller.dispose();
    Namecontroller.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIDcontroller.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: Namecontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60.0,
            child: TextField(
              controller: meetingIDcontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                //contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
            child: TextField(
              controller: Namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                //contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Join', style: TextStyle(fontSize: 16.0)),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMuted: isAudioMuted,
            onChanged: IsAudioMuted,
          ),
          MeetingOption(
            text: 'Turn off My Video',
            isMuted: isVideoMuted,
            onChanged: IsVideoMuted,
          ),
        ],
      ),
    );
  }

  IsAudioMuted(bool val) {
    setState(
      () {
        isAudioMuted = val;
      },
    );
  }

  IsVideoMuted(bool val) {
    setState(
      () {
        isVideoMuted = val;
      },
    );
  }
}
