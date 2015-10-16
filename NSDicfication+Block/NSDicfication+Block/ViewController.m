//
//  ViewController.m
//  NSDicfication+Block
//
//  Created by Jane on 10/16/15.
//  Copyright © 2015 Jane. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(50, 150, [[UIScreen mainScreen] bounds].size.width-100, 80)];
    [button setTitle:@"PresentView" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:button];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(disMissView:)
               name:@"disMissView"
             object:nil];
    [nc addObserver:self selector:@selector(disMisViewWithDictionary:) name:@"disMissViewWithNSDictionary" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)disMissView:(NSNotification *)sender
{
    NSLog(@"NSNotifacation is show and number is %@",[sender object]);
}

-(void)disMisViewWithDictionary:(NSNotification *)sender
{
    NSLog(@"NSNotifacation is show and Dictionary is %@",[[sender userInfo] objectForKey:@"user"]);
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"disMissViewWithNSDictionary"];
    [self removeObserver:self forKeyPath:@"disMissView"];
}

-(void)buttonClick:(UIButton *)sender
{
    TableViewController *tableView = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *naviget = [[UINavigationController alloc] initWithRootViewController:tableView];
    [self presentViewController:naviget animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
