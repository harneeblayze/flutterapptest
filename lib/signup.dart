import 'package:flutter/material.dart';


class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}


class FieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'field can\'t be empty' : null;
  }
}



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> buildInputs() {
      return [
        TextFormField(
          key: Key('email'),
          decoration: InputDecoration(labelText: 'Email'),
          validator: EmailFieldValidator.validate,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
        ),

        TextFormField(
          decoration: InputDecoration(labelText: 'username'),
          validator: FieldValidator.validate,
        ),
        
        

        Flexible(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'description'),
            validator: FieldValidator.validate,
          ),
        ),
      ];
    }

   List<Widget> button(){
      return  [Flexible(
        child: RaisedButton(
        onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (formKey.currentState.validate()) {
        // If the form is valid, we want to show a Snackbar
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
        },
        child: Text('Submit'),
        ),
      )];
    }


    return Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs()+ button()

          ),


        )
    );
  }
}








