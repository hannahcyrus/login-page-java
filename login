package android.example.myfirstapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
private EditText ename;
private  EditText epswd;
private Button elogin;
private TextView attempts_info;
private String username = "xyzpoi";
private String password = "abc123";
boolean isValid = false;
private int counter = 3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ename = findViewById(R.id.et_name);
        epswd = findViewById(R.id.et_pswd);
        elogin = findViewById(R.id.btnLogin);
        attempts_info = findViewById(R.id.tv_attempts);
         elogin.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View v) {
                 String inputName = ename.getText().toString();
                 String inputPassword = epswd.getText().toString();
                 if(inputName.isEmpty()||inputPassword.isEmpty()){
                     Toast.makeText(MainActivity.this, "please enter all the credentials ",Toast.LENGTH_SHORT).show();
                 }else{
                     isValid = validate(inputName,inputPassword);
                     if(!isValid){
                         counter--;
                         Toast.makeText(MainActivity.this, "incorrect credentials ",Toast.LENGTH_SHORT).show();
                         attempts_info.setText("No.of attempts remaining:" +counter);
                         if( counter == 0){
                             elogin.setEnabled(false);
                         }

                     }else{
                         Toast.makeText(MainActivity.this, "login successfull ",Toast.LENGTH_SHORT).show();
                         Intent intent = new Intent(MainActivity.this,HomePageActivivty.class);
                         startActivity(intent);
                     }


                 }



             }
         });
    }
    private boolean validate(String name, String pswd){
        if(name.equals(username)&&pswd.equals(password)){
            return true;

        }
        return false;

    }

}
