import 'package:flutter_test/flutter_test.dart';
import 'package:testautomation_app/signup.dart';


void main(){
//email test
  test('empty email returns error string', (){

   var result = EmailFieldValidator.validate('');

   expect(result, 'Email can\'t be empty');

  });
  
  
  test('non-empty email returns null ', (){
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

//password test
  test('empty password returns error string', (){

    var result = PasswordFieldValidator.validate('');

    expect(result, 'Password can\'t be empty');

  });


  test('non-empty password returns null', (){

    var result = PasswordFieldValidator.validate('password');

    expect(result, null);

  });

  //field tests

  test('empty field returns error string', (){

    var result = FieldValidator.validate('');
    expect(result, 'field can\'t be empty');

  });


  test('non-empty field returns null', (){

    var result = FieldValidator.validate('example');
    expect(result, null);

  });



}