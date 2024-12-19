//
//  ContentView.swift
//  saveVariablePractice_example
//
//  Created by 김장현 on 2024/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputIntegerText = 0;
    @State private var savedIntegerText = 0;
    
    // セーブする文字列宣言
    @State private var inputStringText: String = "";
    @State private var savedStringText: String = "";
    
    
    var body: some View {
        VStack {
            // 文字列入力
            TextField("Enter some text", text: $inputStringText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // セーブボタン
            Button(action: {
                // 文字列設定
                self.savedStringText = self.inputStringText
                saveTextToDevice(text: self.inputStringText)
            }){
                Text("Save Text")
            }
            
            Text("Saved Text is : \(savedStringText)")
                .padding()
            
//            地球アイコン表示
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            
        }
        .padding()
        .onAppear(perform: loadsavedTextFromDevice) //アプリが起動するときにセーブされている文字列を表示してくれる
    }
    
    // 文字列を内部に設定する
    func saveTextToDevice(text: String){
        // UserDefaults を使うと値を格納することができる。
        let defaults = UserDefaults.standard
        
        // Keyと一緒に格納
        defaults.set(text, forKey: "savedText")
    }
    
    // 設定された文字列を呼び出す
    func loadsavedTextFromDevice(){
        let defaults = UserDefaults.standard
        
        // Keyで値を呼び出す
        if let text = defaults.string(forKey: "savedText"){
            self.savedStringText = text
        }

    }
}

#Preview {
    ContentView()
}
