import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool isUsernameAvailable = false;

  void _register() {
    String name = _nameController.text;
    String surname = _surnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Şifreleri kontrol et
    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Şifreler uyuşmuyor. Lütfen aynı şifreyi girin.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Şifreler uyuşuyor, kayıt işlemini tamamlayabilirsiniz
    // ...

    // Örnek çıktı olarak konsola yazdırma
    print('Name: $name');
    print('Surname: $surname');
    print('Username: $username');
    print('Email: $email');
    print('Password: $password');
    print('Confirm Password: $confirmPassword');

    // Kayıt işlemi tamamlandıktan sonra başka bir sayfaya yönlendirme yapabilirsiniz
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }


  void _signInWithGoogle() {
    // Burada Google hesabıyla oturum açma işlemleri gerçekleştirilebilir

    // Örnek çıktı olarak konsola yazdırma
    print('Sign in with Google');
  }

  void _checkUsernameAvailability() {
    // Kullanıcı adının geçerli olup olmadığını kontrol edin
    String username = _usernameController.text;

    // Burada kullanıcı adının başkası tarafından kullanılıp kullanılmadığını kontrol edebilirsiniz.
    // Örnek olarak, kullanıcı adı 'ornek' olan bir kullanıcı olduğunu varsayalım.
    // Bu kullanıcı adını daha önce başkası kullanmış olarak kabul edelim.
    bool isUsernameTaken = (username == 'ornek');

    setState(() {
      isUsernameAvailable = !isUsernameTaken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),

      backgroundColor: Colors.orange,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'İsim',
              ),
            ),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Soyisim',
              ),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                suffixIcon: IconButton(
                  onPressed: _checkUsernameAvailability,
                  icon: Icon(Icons.check),
                  color: isUsernameAvailable ? Colors.green : Colors.grey,
                ),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre Tekrar',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _register,
              child: Text('Kayıt Ol'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
            SizedBox(height: 10.0),
            SignInButton(
              Buttons.Google,
              onPressed: _signInWithGoogle,
              text: "Google Hesabıyla Devam Et",
            ),
          ],
        ),
      ),
    );
  }
}
