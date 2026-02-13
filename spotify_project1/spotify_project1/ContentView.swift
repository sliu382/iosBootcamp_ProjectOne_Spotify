//
//  ContentView.swift
//  spotify_project1
//
//  Created by Siyu Liu on 2/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var speed = 100.0
    @State private var isEditing = false
    @State private var isClickedRepeat = false
    @State private var isClickedShuffle = false
    @State private var isPaused = false
    @State private var isHeart = false
    
    var body: some View {
        //Top Section (Album and buttons)
        VStack {
            HStack{
                Image(systemName: "chevron.down")
                    .padding(20)
                Text("The Art of Loving")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment:.center)
                    .bold()
                Spacer()
                Image(systemName:"ellipsis")
                    .padding(20)
            }
            
            Image("OliviaDeanAlbum")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.tint)
                .padding(.vertical,50)
            
            //Song + Artist
            HStack{
                VStack{
                    HStack{
                        Text("Man I Need")
                            .foregroundStyle(.white)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    
                    HStack{
                        Text("Olivia Dean")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                        Spacer()
                    }
                }
                .padding(.horizontal, 15)
                
                Button(action: {isHeart.toggle()}){
                    Image(systemName: isHeart ? "heart" :"heart.fill")
                        .resizable()
                        .frame(width:20,height:20)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal,20)
                
            }
            .padding(.horizontal, 10)
            
            
            //Slider
            Slider(
                value: $speed,
                in: 0...184,
                onEditingChanged: {editing in isEditing = editing}
            )
            .padding(.horizontal,15)
            .padding(.vertical,1)
            .accentColor(.gray)
            
            let minutes = Int(speed/60)
            let seconds = Int(speed) % 60
            var secondsString:String {
                if seconds < 10 {
                    //secondsString = "0" + String(seconds)
                    return "0" + String(seconds)
                } else {
                    return String(seconds)
                }
            }

            HStack{
                Text("\(minutes):\(secondsString)")
                    .foregroundColor(.white)
                    .padding(.horizontal,15)
                Spacer()
                    
            }
            
            //Play buttons
            HStack(spacing:35){
                Button(action: {isClickedShuffle.toggle()}) {
                    Image(systemName:"shuffle")
                        .resizable()
                        .frame(width:30,height:30)
                        .foregroundStyle(isClickedShuffle ? .green : .white)
                        
                }
                
                Image(systemName:"backward.end.fill")
                    .resizable()
                    .frame(width:30,height:30)
                
                Button(action: {isPaused.toggle()}){
                    Image(systemName: isPaused ? "pause.circle.fill": "play.circle.fill")
                        .resizable()
                        .frame(width:70,height:70)
                }
                
                Image(systemName:"forward.end.fill")
                    .resizable()
                    .frame(width:30,height:30)
                
                Button(action: {isClickedRepeat.toggle()} ) {
                    Image(systemName:"repeat")
                        .resizable()
                        .frame(width:30,height:30)
                        .foregroundStyle(isClickedRepeat ? .green : .white)
                }
            }
            .foregroundColor(.white)
            
            
            
            //Last row of buttons
            HStack{
                Image(systemName:"headphones")
                    .foregroundStyle(.green)
                Text("Siyu's Airpod Pros")
                    .foregroundStyle(.green)
                Spacer()
                
                Image(systemName:"square.and.arrow.up")
                    .foregroundStyle(.white)
                    .padding(5)
                Image(systemName:"square.stack.3d.up")
                    .foregroundStyle(.white)
            }
            .padding(10)
        }
        .background(
            LinearGradient(gradient: Gradient(colors:[.white,.black]), startPoint:.top, endPoint:.bottom))
    }
}

#Preview {
    ContentView()
}
