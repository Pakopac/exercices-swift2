//
//  ViewController.swift
//  exercice
//
//  Created by Lilian Pacaud on 03/02/2019.
//  Copyright © 2019 Lilian Pacaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goButton(_ sender: Any) {
        //call api
          if ((UserDefaults.standard.string(forKey: "firstname")) == nil) {
            
            let api_manager = ApiManager()
            api_manager.getRandomUserHydratedWithPerson(completion: {person in
                
                UserDefaults.standard.set(person.firstanme, forKey: "firstname")
                UserDefaults.standard.set(person.lastname, forKey: "lastname")
                UserDefaults.standard.set(person.gender.rawValue, forKey: "gender")
                UserDefaults.standard.set(person.image, forKey: "picture")
                UserDefaults.standard.set(person.birthdate.toString(format: "dd-mm-yyyy"), forKey: "birthdate")
                UserDefaults.standard.set(person.email.email, forKey: "email")
                
            self.performSegue(withIdentifier: "ShowPerson", sender: person as Person)
            })
          }else {
            
            let firstname = UserDefaults.standard.string(forKey: "firstname")
            let lastname = UserDefaults.standard.string(forKey: "lastname")
            let gender = UserDefaults.standard.string(forKey: "gender")
            let birthdate = UserDefaults.standard.string(forKey: "birthdate")
            let image = UserDefaults.standard.string(forKey: "picture")
            let email = UserDefaults.standard.string(forKey: "email")
            let user = Person(firstname: firstname!, lastname: lastname!, gender: Person.Gender(rawValue: gender!)!, email: email!, birthdate: (date: birthdate!, format: "dd-mm-yyyy"), image: image!)
            self.performSegue(withIdentifier: "ShowPerson", sender: user)
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController2
        {
            let destVC = segue.destination as? ViewController2
            destVC?.dataFormFirst = sender as? Person
        }
    }
}


