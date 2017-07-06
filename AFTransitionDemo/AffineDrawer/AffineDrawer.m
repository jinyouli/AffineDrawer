//
//  AffineDrawer.m
//  AFTransitionDemo
//
//  Created by jinyou on 2017/7/6.
//  Copyright © 2017年 com.jinyou. All rights reserved.
//

#import "AffineDrawer.h"

#define ACNavBarDrawer_Duration     0.3f

@interface AffineDrawer ()
{
    /** 背景遮罩 */
    UIControl         *_mask;
    UIView            *_mainView;
    UIView            *_menuView;
}

@end

@implementation AffineDrawer

- (id)initWithView:(UIView *)theView menuView:(UIView*)menuView
{
    self = [super init];
    if (self)
    {
        // Initialization code
        
        _isOpen = NO;
        
        _mask = [[UIControl alloc] initWithFrame:[theView bounds]];
        
        [_mask setBackgroundColor:[UIColor blackColor]];
        [_mask addTarget:self action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
        [_mask setAlpha:0.0f];
        [theView addSubview:_mask];
        
        _mainView = theView;
        _menuView = menuView;
        //视图布局
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    _menuView.frame = CGRectMake(-_mainView.frame.size.width, 0, _mainView.frame.size.width, _mainView.frame.size.height);
    [_mainView addSubview:_menuView];
}

/**
 * 打开抽屉
 */
- (void)openDrawer
{
    _isOpen = YES;
    [_mask setAlpha:0.3f];
    
    [UIView animateWithDuration:ACNavBarDrawer_Duration animations:^{
        
        [self setCenter:CGPointMake( ([UIScreen mainScreen].bounds.size.width / 2),([UIScreen mainScreen].bounds.size.height / 2.f) )];
        
        _menuView.transform = CGAffineTransformMakeTranslation( 0.7 * CGRectGetMaxX(_mainView.bounds), 0);
    }];
}

/**
 * 关起抽屉
 */
- (void)closeDrawer
{
    _isOpen = NO;
    
    [UIView animateWithDuration:ACNavBarDrawer_Duration animations:^{
        
        [self setCenter:CGPointMake( ([UIScreen mainScreen].bounds.size.width / 2), -([UIScreen mainScreen].bounds.size.height / 2.f) )];
        
        _menuView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        [_mask setAlpha:0.f];
    }];
}

@end
