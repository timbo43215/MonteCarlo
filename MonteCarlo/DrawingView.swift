//
//  DrawingView.swift
//  MonteCarlo
//
//  Created by IIT PHYS 440 on 2/6/23.
//

import SwiftUI

struct drawingView: View {
    
    @Binding var greenLayer : [(xPoint: Double, yPoint: Double)]
    @Binding var blackLayer : [(xPoint: Double, yPoint: Double)]
    
    var body: some View {
    
        
        ZStack{
        
            drawIntegral(drawingPoints: greenLayer )
                .stroke(Color.green)
            
            drawIntegral(drawingPoints: blackLayer )
                .stroke(Color.black)
        }
        .background(Color.white)
        .aspectRatio(1, contentMode: .fill)
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    
    @State static var greenLayer : [(xPoint: Double, yPoint: Double)] = [(-0.5, 0.5), (0.5, 0.5), (0.0, 0.0), (0.0, 1.0)]
    @State static var blackLayer : [(xPoint: Double, yPoint: Double)] = [(-0.5, -0.5), (0.5, -0.5), (0.9, 0.0)]
    
    static var previews: some View {
       
        
        drawingView(greenLayer: $greenLayer, blackLayer: $blackLayer)
            .aspectRatio(1, contentMode: .fill)
           
    }
}



struct drawIntegral: Shape {
    
   
    let smoothness : CGFloat = 1.0
    var drawingPoints: [(xPoint: Double, yPoint: Double)]  ///Array of tuples
    
    func path(in rect: CGRect) -> Path {
        
               
        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: (rect.height / 2))
        let scale = rect.width/2*(-1.0/10.0)
        

        // Create the Path for the display
        
        var path = Path()
        
        for item in drawingPoints {
            
            path.addRect(CGRect(x: item.xPoint*Double(scale)+Double(center.x), y: item.yPoint*Double(scale)+Double(center.y)-Double(9.0*scale), width: 1.0 , height: 1.0) )
            
        }


        return (path)
    }
}

