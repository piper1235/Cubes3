//
//  GameViewController.swift
//  Cubes3
//
//  Created by Tony on 7/25/17.
//  Copyright © 2017 Anthony Vitrano. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

imagePicker.delegate = self
    }
    
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let game = Game(context: context)
        game.title = titleTextField.text
        game.image = UIImagePNGRepresentation(gameImageView.image!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
    }
}
