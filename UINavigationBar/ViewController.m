//
//  ViewController.m
//  UINavigationBar
//
//  Created by 杨世川 on 17/9/23.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UINavigationBar *navigationBar;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.navigationBar];
    [self addNavigationItem];
}

- (void)addNavigationItem
{
    NSInteger tempCount = self.navigationBar.items.count + 1;
    NSString *titleString = [NSString stringWithFormat:@"%ld",(long)tempCount];
    UINavigationItem *navigationItem = [[UINavigationItem alloc]initWithTitle:titleString];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(backNavigationItem)];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushNavigationItem)];
    navigationItem.leftBarButtonItem = leftButton;
    navigationItem.rightBarButtonItem = rightButton;

    [self.navigationBar pushNavigationItem:navigationItem animated:YES];
}

- (void)backNavigationItem
{
    if (self.navigationBar.items.count < 2)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"这是最后一个" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        [self.navigationBar popNavigationItemAnimated:YES];
    }
}

- (void)pushNavigationItem
{
    [self addNavigationItem];
}

- (UINavigationBar *)navigationBar
{
    if (!_navigationBar)
    {
        _navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
        _navigationBar.backgroundColor = [UIColor greenColor];
    }
    return _navigationBar;
}

@end


