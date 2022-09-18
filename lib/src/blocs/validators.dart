import 'dart:async';

//Here we define our Stream transformers in a Mixin file

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    //To avoid a type error on email.contain, we must anotate StreamTransformer with <String (input), String (output)>
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Enter more than 3 characters');
    }
  });
}
