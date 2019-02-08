//
//  ViewController2.swift
//  exercice
//
//  Created by Lilian Pacaud on 03/02/2019.
//  Copyright © 2019 Lilian Pacaud. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var dataFormFirst :Person?
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func clearCache(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "firstname")
        UserDefaults.standard.removeObject(forKey: "lastname")
        UserDefaults.standard.removeObject(forKey: "gender")
        UserDefaults.standard.removeObject(forKey: "picture")
        UserDefaults.standard.removeObject(forKey: "birthdate")
        UserDefaults.standard.removeObject(forKey: "email")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel?.text = dataFormFirst?.firstanme
        
        lastnameLabel?.text =
            dataFormFirst?.lastname
        
        genderLabel?.text =
            (dataFormFirst?.gender).map { $0.rawValue }
        
        date?.text =
            (dataFormFirst?.birthdate.toString(format: "dd-mm-yyyy"))
        
        let imageUrl = URL(string: (dataFormFirst?.image)!)!
        let imageData = try! Data(contentsOf: imageUrl)
        let UIimage = UIImage(data: imageData)
        image?.image = UIimage
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
