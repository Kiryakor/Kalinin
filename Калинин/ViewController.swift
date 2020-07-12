//
//  ViewController.swift
//  Калинин
//
//  Created by Кирилл on 10.07.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startImageView: UIImageView!
    @IBOutlet weak var finishImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isHidden = true
    }
    
    @IBAction func loadImageButton(_ sender: UIButton) {
        chooseImage(sourse: .photoLibrary)
    }
    
    @IBAction func saveImageButton(_ sender: UIButton) {
//        var toShare = [Any]()
//        toShare.append(finishImageView.image!)
//        let activityViewController = UIActivityViewController(activityItems: toShare, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        self.present(activityViewController, animated: true, completion: nil)
    }
}

//MARK: Load Photo
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    private func chooseImage(sourse:UIImagePickerController.SourceType){
         if UIImagePickerController.isSourceTypeAvailable(sourse){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            self.present(imagePicker,animated: true,completion: nil)
         }
     }
    
    //для установление фото из загруженной фото
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        startImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        startImageView.contentMode = .scaleAspectFill
        startImageView.clipsToBounds = true
        
        finishImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        finishImageView.contentMode = .scaleAspectFill
        finishImageView.clipsToBounds = true
        finishImageView.addSubview(UIImageView(image: finishImageView.image!.tinted()))
        
        dismiss(animated: true, completion: nil)
        saveButton.isHidden = false
    }
}
