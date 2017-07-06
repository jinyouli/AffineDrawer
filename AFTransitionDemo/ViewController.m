//
//  ViewController.m
//  AFTransitionDemo
//
//  Created by jinyou on 2017/7/6.
//  Copyright © 2017年 com.jinyou. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "AffineDrawer.h"


@interface ViewController ()
@property (nonatomic,strong) MenuViewController *menuVC;
@property (nonatomic,assign) BOOL isAnimation;

@property (nonatomic,strong) AffineDrawer *drawer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.menuVC = [[MenuViewController alloc] init];
    self.drawer = [[AffineDrawer alloc] initWithView:self.view menuView:self.menuVC.view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.drawer.isOpen) {
        [self.drawer openDrawer];
    }else{
        [self.drawer closeDrawer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end






