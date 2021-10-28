//
//  ImagePickerView.swift
//  walletcard
//
//  Created by Fei Yun on 2021-10-27.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable{
    @Binding var selectedImage:UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType:UIImagePickerController.SourceType
    
    class Coordinator:NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
        var picker:ImagePickerView
        init(picker:ImagePickerView){
            self.picker=picker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else {
                return
            }
            self.picker.selectedImage=selectedImage
            self.picker.isPresented.wrappedValue.dismiss()

        }
    }
    
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let imagePicker=UIImagePickerController()
        imagePicker.sourceType=self.sourceType
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
