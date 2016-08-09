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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VDWeakRef *weakRef = [self vd_weakRef];
    NSLog(@"self %@", self);
    NSLog(@"weakRef %@", weakRef);
    NSLog(@"weakRef object %@", weakRef.weakObject);

    id ref = weakRef;
    NSLog(@"weakRef isViewLoaded %@", @([ref isViewLoaded]));
    NSLog(@"weakRef window %@", [ref view].window);
    
    ViewController *controller = (ViewController *)weakRef;
    NSLog(@"weakRef isViewLoaded %@", @(controller.isViewLoaded));
    NSLog(@"weakRef window %@", controller.view.window);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
