enum User { customer, support }

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  Message({
    this.sender,
    this.time,
    this.text,
  });
}

List<Message> messages = [
  Message(
    sender: User.support,
    time: '5:30 PM',
    text: 'Hello , thank you for calling Provide Support. How may I help you?',
  ),
  Message(
    sender: User.customer,
    time: '5:31 PM',
    text: 'I have an issue with my order',
  ),
  Message(
    sender: User.support,
    time: '5:33 PM',
    text: 'Can you explain the issue',
  ),
  Message(
    sender: User.customer,
    time: '5:34 PM',
    text: 'My order was damaged and the delivery was late .',
  ),
  Message(
    sender: User.support,
    time: '5:37 PM',
    text: 'Alright let me check investigate the  matter ',
  ),
  Message(
    sender: User.support,
    time: '5:38 PM',
    text:
        'i have referenced the matter to the item delivery team and the issue will be resolved soon.',
  ),
  Message(
    sender: User.support,
    time: '5:40 PM',
    text: 'You will be contacted as soon the issue is handled ',
  ),
  Message(
    sender: User.support,
    time: '5:40 PM',
    text: 'Is there any thing else that i can help you with ',
  ),
  Message(
    sender: User.customer,
    time: '5:45 PM',
    text: 'No thank you for your help ',
  ),
];
