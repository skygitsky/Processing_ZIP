    import processing.serial.*;
    Serial myPort;
    int []data = new int [3];      //Arduinoから送られてくるデータが3個の場合の設定

    void setup() {
        myPort = new Serial(this, Serial.list()[4], 9600);
        size(600, 400);
    }

    void draw() {
        background(255);                      //背景色は白
        fill(0);                              //文字色は黒
        textSize(20);                         //文字サイズは 20
        text(data[0], 100, 100);              //Arduinoから送信された値[0/3]の表示
        rect(160, 85, 20+(data[0]/5), 20);    //棒グラフのデモ
    }

  //送られてきたデータを処理する関数
    void serialEvent(Serial p) {
        String inString = myPort.readStringUntil('\n');    // Arduinoから送られたデータ（,区切り・int 3個）の `\n`までを受け取り、String型で保存
        if (inString != null) {
            inString = trim(inString);                     // trim()で文字列から改行（`\n`）を削除
            data = int(split(inString, ','));              // split()で`,`で区切られた文字列を配列として抜き出し、各々をint型として保存
            println(data);//受信したデータ配列を参照       // 確認用コンソール出力
        }
    }
