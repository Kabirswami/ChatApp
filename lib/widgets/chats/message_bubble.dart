import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  final String userName;
  final String userImage;
  MessageBubble(this.message, this.isMe, this.userName, this.userImage,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(14),
                    bottomRight:
                        !isMe ? Radius.circular(14) : Radius.circular(0))),
            width: 160,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userName,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.title.color),
                ),
                Text(
                  message,
                  style: TextStyle(
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.title.color),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
          top: 0,
          left: isMe ? null : 130,
          right: isMe ? 130 : null,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(userImage),
          )),
    ], overflow: Overflow.visible);
  }
}
