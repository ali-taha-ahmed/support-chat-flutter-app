import 'package:flutter/material.dart';
import 'package:support_chat_ui/models/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Support Chat App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

TextEditingController messageController = TextEditingController();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E5E8),
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Customer Support (Tony)',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: 'Online',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    reverse: false,
                    itemCount: messages.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender == User.customer;
                      return messageBubble(context, isMe, message);
                    })),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.photo), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration:
                          InputDecoration.collapsed(hintText: "Ask Your Query"),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.send), onPressed: () {})
                ],
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }

  messageBubble(BuildContext context, bool isMe, Message message) {
    if (isMe) {
      return Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message.text,
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(message.time),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message.text),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Text(message.time),
            ],
          ),
        ],
      );
    }
  }
}
