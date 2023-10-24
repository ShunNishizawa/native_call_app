# call_native__app

## MethodChannel

- Dartからネイティブのメソッド呼び出し
- 逆に、ネイティブからDartのメソッド呼び出しが可能

- チャンネルを作成後、下記を非同期で呼び出す

```

// チャンネル作成
static const MethodChannel _channel = const MethodChannel('hogeChannel');

// 第一引数：呼び出したいメソッド名を文字列で指定
// 呼び出しメソッドの引数に指定するデータを指定

Future<T> invokeMethod<T>(String method, [ dynamic arguments ]) async

```

- サンプルコードは実装参照
