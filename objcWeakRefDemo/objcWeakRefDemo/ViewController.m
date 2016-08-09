//
//  ViewController.m
//  objcWeakRefDemo
//
//  Created by FTET on 16/8/9.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import "ViewController.h"

#import "objcWeakRef.h"

@interface ViewController ()

@property (nonatomic, strong) VDWeakRef *weakRef;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    self.weakRef = [vc vd_weakRef];
    
    
    NSLog(@"self %@", self);
    NSLog(@"weakRef %@", self.weakRef);
    NSLog(@"weakRef object %@", self.weakRef.weakObject);
    
    
    id ref = self.weakRef;
    NSLog(@"weakRef isViewLoaded %@", @([ref isViewLoaded]));
    NSLog(@"weakRef window %@", [ref view].window);
    
    ViewController *controller = (ViewController *)self.weakRef;
    NSLog(@"weakRef isViewLoaded %@", @(controller.isViewLoaded));
    NSLog(@"weakRef window %@", controller.view.window);
        
    NSLog(@"isKindOfClass %@", @([controller isKindOfClass:[UIViewController class]]));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"self %@", self);
    NSLog(@"weakRef %@", self.weakRef);
    NSLog(@"weakRef object %@", self.weakRef.weakObject);
    
    id ref = self.weakRef;
    NSLog(@"weakRef isViewLoaded %@", @([ref isViewLoaded]));
    NSLog(@"weakRef window %@", [ref view].window);
    
    ViewController *controller = (ViewController *)self.weakRef;
    NSLog(@"weakRef isViewLoaded %@", @(controller.isViewLoaded));
    NSLog(@"weakRef window %@", controller.view.window);
    
    NSLog(@"isKindOfClass %@", @([self isEqual:controller]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
