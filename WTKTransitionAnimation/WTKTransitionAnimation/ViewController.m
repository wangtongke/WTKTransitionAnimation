//
//  ViewController.m
//  WTKPushAndPopAnimation
//
//  Created by 王同科 on 16/9/22.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "WTKNavigationController.h"

#import "UIViewController+WTKAnimationTransitioningSnapshot.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *array;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"111.png"] forBarMetrics:UIBarMetricsDefault];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [[UIApplication sharedApplication].delegate window].rootViewController = [[WTKNavigationController alloc]initWithRootViewController:self];
    self.array = @[@"AnimateTypeDefault",@"AnimateTypeDiffNavi",@"AnimateTypeKuGou",@"AnimateTypeRound"];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 70, 200);
    [btn setBackgroundImage:[UIImage imageNamed:@"111.png"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    UITableView *tableView  = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.rowHeight     = 60;
    tableView.delegate      = self;
    tableView.dataSource    = self;
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)btnClick:(UIButton *)btn
{
        TwoViewController *vc = [[TwoViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwoViewController *vc = [[TwoViewController alloc]init];
    WTKNavigationController *navi = (WTKNavigationController *)self.navigationController;
    navi.animationType = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
