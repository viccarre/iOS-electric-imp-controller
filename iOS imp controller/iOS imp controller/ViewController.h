//
//  ViewController.h
//  iOS imp controller
//
//  Created by Victor Carreño on 11/12/13.
//  Copyright (c) 2013 Victor Carreño. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    NSString *deviceURL;
}


- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *value;
@property (weak, nonatomic) IBOutlet UITextField *key;
@property (weak, nonatomic) IBOutlet UITextField *deviceURL;

@end
