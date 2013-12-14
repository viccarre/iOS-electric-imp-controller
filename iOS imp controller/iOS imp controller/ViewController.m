//
//  ViewController.m
//  iOS imp controller
//
//  Created by Victor Carreño on 11/12/13.
//  Copyright (c) 2013 Victor Carreño. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    
    [self sendJSONWithKey:_key.text withValue:_value.text];
}

#pragma mark - POST

- (void)sendJSONWithKey:(NSString *)key withValue:(NSString *) value{
    
        
        AFHTTPClient *httpClient=[[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:_deviceURL.text]];
        
        [httpClient setParameterEncoding:AFJSONParameterEncoding];
        
        
        NSMutableURLRequest *request=[httpClient requestWithMethod:@"GET"
                                                              path:deviceURL
                                                        parameters:@{key:value}];
        NSLog(@"%@",request);
        _sentURL.text = [NSString stringWithFormat:@"%@",request];
    
        AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
        
        [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }
                                         failure:^(AFHTTPRequestOperation*operation,NSError*error){
                                             //SVProgressHUD Es la alerta que sale
                                             // [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
                                             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                         }];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [operation start];
    
    
    
}
- (IBAction)hiddeKeyboard:(id)sender {
    [ _sentURL resignFirstResponder];
    [_key resignFirstResponder];
    [_value resignFirstResponder];
}
@end
