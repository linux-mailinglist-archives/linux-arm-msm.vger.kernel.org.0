Return-Path: <linux-arm-msm+bounces-29252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D195B05E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C40831C23852
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FCE17DFFB;
	Thu, 22 Aug 2024 08:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DjxcaOyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2083.outbound.protection.outlook.com [40.107.117.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCC17DFE7;
	Thu, 22 Aug 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315328; cv=fail; b=TGKtYUxs9DgrdUdGiiCl7BkeOVLIWOMqsAlqAMvnPeQezE1uDmeLyhuc/y1npyA35Acgmaya5KotUtNScEmfMHaGrhKf/dUOG9S4ItyE104c2LJCMRjptpIUnOKZgKLoN7+Q6VL6hZeC6CuXfWZLzygY/qH2wU9ACW1WclLiQW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315328; c=relaxed/simple;
	bh=SY1OQVeuycg6rcEd5ZtrbHKtWeMMPnXMMqhcn1zEwg0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YTzPV7tiA3Jmk+lLBh+OCfksGoUR92/fpcm6owFYuUKKM4fj4jmbq3+x2Fxn6j0ExIVNCQK5zhM16HAwod7cDkrzopJpyD3My2U8DvZshuiEq/cavPNuz/MX1PV6wK+JHoehNC5s3JYvkpTSKlx+mf5TEvGTWokNYhmEKm1zYRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DjxcaOyr; arc=fail smtp.client-ip=40.107.117.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4jWIpEZLxpL+QNNvq6qiccCa0KZQLyErcga+NsxlxTjMT/CFjOuReBncy4pbsagwPvEHn2v03Acyj9U+hvUADVgFMW2uZ7OPBTrKBgZ3VXCR+y/UShw6M9lshptBumhf/nbjvaNuyrggedxh4FSxOiGtdgWRjmNFCCvaVtrTQ75Yl2eIpgUAZF3EIlJ5/prsrTGC65d1Y0Er8Lg844q1PfnobxzeTRjpiHnN4kh0LXFVK8gn12P6fmdjxKci2R139DZ2yTXoL1TcZY8waTrRUDLEfRqkPNStwhqCd6vL5YFuSaD8farHVbA73tYDU5smvJet8xCvqTWu64+2jkAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKNx+Jq9+iyJ8QX7+xS8E/ttjUKqR/hh6VfhIesQ5II=;
 b=HRML0qu55/55WQeQZkFdnWZw/eSEW0QGJbFyotOyPFmlLVwwqfPBeuAill9egy6RXuef17uTo2vuerjjFVaWEUZmeiiZeBNP8vRdGcc/pYyeg3qyNW8CsQJ67pq5I/XD1nE0HcoTuMu1SQuTM0DjeguProvRp2PwnpWHGVahgBPXiYAXhfUU7HehpO1EKc7GoghzAZEfb3Nv3SsDBoeP/Ll/++O0q62CR/svyf9D2HTC9QaU9VB2yNKolLgRbb8uKNXpo8nue+tOVdDAZrW9+eqDqhivQVIkeeHgrYNI69UoFscGT1lxuCAMWTlJ9ClIeG9/v6nQ0ipvtk3Vk8C+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKNx+Jq9+iyJ8QX7+xS8E/ttjUKqR/hh6VfhIesQ5II=;
 b=DjxcaOyrL7L09EnsYDTxBSNyrUnwlTvrN/oc4XoZ8CfneMhPsDKZfHdOfI1vJwXpEzf1QbndSo1bcD5yhawGlZRKZKk4VqE4cMIdbUtftl2bPT7654cJf2cFS9NiYJh4JOcL15c0+XvIrOZ5sRlOPCKIl8G6zLuZ13zP1+9wYjGjP9LJRG17p3L/UMaTNPkFctFymGPVndDptXEG+bpgshK2pxZmjy9/6K9ePdYS7Rd9dyA+jhoF5BCwuHGGMU3wuy+ekwi7pfLstiVeAEPwEKJnIzWUEfQliR4p7lwpo9BSYKmqTqmN/UU9ADLIGuhtBf/XChZAO7ZX8w2/+vXP1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:28:44 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:28:44 +0000
From: Yangtao Li <frank.li@vivo.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	frank.li@vivo.com,
	konrad.dybcio@linaro.org,
	liubo03@inspur.com,
	robh@kernel.org,
	yuvaraj.cd@gmail.com,
	ks.giri@samsung.com,
	vasanth.a@samsung.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/4] phy: ti: phy-dm816x-usb: Convert to devm_clk_get_prepared()
Date: Thu, 22 Aug 2024 02:43:41 -0600
Message-Id: <20240822084342.1595239-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::36)
 To TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 27236175-df8c-4e9d-c062-08dcc2846f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fUHBPfAQazZkQQhKhrHNWejHYtG57HtpRzmZ3dyYSManf3nElcNTJNpgg24I?=
 =?us-ascii?Q?215ZtAfLOMNkZJA1nqm+8RF/fDIujoUMCOtuBHgS/uTmt36kNzKKmHfxzQcN?=
 =?us-ascii?Q?UbPxGMfoh3+W20mnhoVQo1+fij67/C/z2KZf8U3XwsRVKSkNCeLwJNYzOWl4?=
 =?us-ascii?Q?X1043V9xjCCLTxiFG38pHnqK3Xs3mPA67hegZNGXcJAKMVeImEDf1g6/ralp?=
 =?us-ascii?Q?z5rzrNDljwAgEHM/CRefyILwko6Xx2I886yo86mBBkiFV45DIYp0q1h8FHs5?=
 =?us-ascii?Q?zJeE22E+xWRX2v6Yogy7NKxXHllqx1OIt+gzSK5fN7zxyy+A0d4UcP5ojWUY?=
 =?us-ascii?Q?eCyDCOb0rUJ0ybu3wVUwg26hx7r1jb7GVLSk9oiol4OL+HGezlCaxC9aNEky?=
 =?us-ascii?Q?eX3F9xpkPDV6xnc5fCRcrRSRY8fiEAPJ5Z3/MBbLXFdnJgyK8qYVxbX2lq4b?=
 =?us-ascii?Q?z9a4rpRU4jMxWup0S34wk/5V+uOXsciBfDgDKXUOxcglIGlJPYVxi+wmko7A?=
 =?us-ascii?Q?8KzfhppvY6pXvGdc8K+eFWOxNi0nNjOiIHfKZ+2lPU5f2cqliPWzOqptKN3R?=
 =?us-ascii?Q?/Vne9edj9q6tqBjHAV3mz9HlbBd6uL/pYDdxP+TQeBLAKX+MLLAJ/C+0ebeh?=
 =?us-ascii?Q?ghxpsyeMtkknY0ZS/jS20mMqkbpICt0bkmty4QrW2k351KGPJ3sEgwF0am2e?=
 =?us-ascii?Q?1XDDITE5QMOB6eJkuK3rTE359mdKoNLg5DzfYgVUev/fYDbnNhHfB+RsSRva?=
 =?us-ascii?Q?TBZASOYk6+0AZLz8ZOHEDT3WI8S0J0JIEiQBFGhA4Aab6AyortrTGTy0+uKS?=
 =?us-ascii?Q?AymvRhbKbrr4KA5CWqiQSoyZIN+0rVXX+0jf1VoBOZY0iF5L3jRA69Mbd2Im?=
 =?us-ascii?Q?sMwZUWozy91M6FQJcOqxpf0oRuCTB7yiO+0pTrf0PdzI1u++POG8VhpS9O5y?=
 =?us-ascii?Q?YVINmpg8yod1ST5IGmm2QWYx8YFRz+uj+LMByggzVo8xurR6p6fA/7BlOhty?=
 =?us-ascii?Q?PMb8J2iTrtprZf/im1g6ougqdFEI8UCpXloCFZ/MGUebQsZJBhOlEWGdsqjl?=
 =?us-ascii?Q?xfZ3jkbZoTw9zbEhDNzgQShWRDItDoOiFHXsj+nXojCATOXaVbwLmLUmGf96?=
 =?us-ascii?Q?COCP/++OIRglvZD8aGp7t4IsS1HfJwSlDjFvJA9LUJqIHjT6k9F73KGVACHo?=
 =?us-ascii?Q?5KM85ayyCawrd0JP/9DklPP+9dEmQmKZ2tjAUwNJQ2Rlc7NoHoBJUepyUlEf?=
 =?us-ascii?Q?awFbSjGVTtelMURwee6iBUrsxafEIgn5fdxQv0bYaOPsS9eIC2BKn8g2Du+x?=
 =?us-ascii?Q?hJt7WM4rtOfrjpaX+XdNr5ub9JOfl7nrnChmJkMGgvbbMXWJtvx13gluHHvx?=
 =?us-ascii?Q?F+/xyQACxlDlEo8BP4TbqcNxQM/rZiIu5TU3PmWLIOl+OCNMcITC1lGOCY8O?=
 =?us-ascii?Q?2F3PF5xv8o8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cWsmoTZ0Wj6YaAKUzIAkGrKwdchjparZFq6kHP1EcK1J9gilwGc6rpwQMjmX?=
 =?us-ascii?Q?gZfUgkwCzdARi9oam0SMMvpFOlpoCOA8LyFbkcIt38J3qUhrgyJzTVjJmyjg?=
 =?us-ascii?Q?9rG6mTpKJT9FrQARwnXf10mFctbFB5lBBuyn5Zar6dY+VNCg3LeVuY1xTWEu?=
 =?us-ascii?Q?KZ5Ndt8jz7O/LkLqGpJkVVNIdv+5ZV2CDXsaTHL7lmQICtEjm58KS0BUP4X5?=
 =?us-ascii?Q?WHv4GXE83IqhtsR5XIF+T9fAPOWLMCDCU5Oc22j9ZfoemMljKwCo7oIpBBfT?=
 =?us-ascii?Q?MkirZx54hLo2Pdmqx2nZF8gQkmo+iY1dHUbVw7jVeZ3zkMn8Y+wX0Jss//5Y?=
 =?us-ascii?Q?OxmNsYCMACpP29bnwUYxV/M9UjwXw6yZWhnmVqA4IGtNIWA2OnNiKQZW4fCr?=
 =?us-ascii?Q?Hllqa5yy+xd2QIE2mDIE/3QJoTBY5BT/zUt4PDm0nZLZhbHmSxqlw3rWpb8w?=
 =?us-ascii?Q?iI3kXmQBCpAIswSZYn0xTojKJ3VlsgXGYFz6GomcuXdT/d4/FkbS7GZfGuIz?=
 =?us-ascii?Q?l7ommmAWJf48i9jUMKxVioAFIffJ0BgOI/HsCtIL1ZErzhWdV7SlrUgbiNbg?=
 =?us-ascii?Q?O1np/he7l60Ie51Aib2lJlIBvuTzEGPMg595dBEQhlw+SrE2JASbdeegnfgo?=
 =?us-ascii?Q?E3VT75gyswXH9ly62PTTyE7q/DfZjemQkM6on/XntrNeMJJU2pU2oNQG/jil?=
 =?us-ascii?Q?Fyuv4edx+CHRHn8aGD+9kVBDGH1IDxpeODOBdpslJnH1ey3zGpgDo8B4mqk+?=
 =?us-ascii?Q?ch8g9uta1MYptZRfj/WqMlxfVf+0sXFsyTGGs5zFs0RHBPCz9ecbDUvAOZvS?=
 =?us-ascii?Q?p+Adq7iM1eaJG6ZwQ33OF+JqCIs7MA+RAvvZRFq9jeh6cWgUilkOl4ezO3i8?=
 =?us-ascii?Q?94m9gxtqqpqddgS/1SuUYkfPDoFMe3TZgstrg5iyE52k8drj8a6ZI9/uCgum?=
 =?us-ascii?Q?1WEW/6nN0FJLLdIAGqLzQ8yMjaAaYmmTXc4P4Ml9Q0emj5t166whFIWbHpnM?=
 =?us-ascii?Q?XmKu79XHw1siIRqSoia+P/wX3P6Z535dqkC3eQ8WyZjxn3wLIM/R7lwq0OXA?=
 =?us-ascii?Q?31i2KZTlZV3N/1UgA4hfVcg4fhMC2JVVxq7z4gtYGbCWdV3jFh7sHjhX58gb?=
 =?us-ascii?Q?rAOt5xeAs7cmgpgSRqe3q85qWaLid9oH7o6KyaQVOx0V8KlYcElQ2suohu7r?=
 =?us-ascii?Q?YL4Z3gbj+rzalyCzdTrsDiR5jZcd6o9iyJwJVW/26CDNQVNVaSwaZMowf1tE?=
 =?us-ascii?Q?2ppaYxj8pRDBQg+RTX5mVsYmneMHF24/ImiblO9nPI/1Ukg2jTgAo152e3ZQ?=
 =?us-ascii?Q?neyZxUK1qIK1ZhUO1Nqg48bu1TqQYDksHdLxo6KpsMnKMgr3T+8BEzFhjdEI?=
 =?us-ascii?Q?dwRdQNMWaNVwVCgnIislVcQVRiILhTzA7BO670/CGAVC2c+heF7n96YEpJBp?=
 =?us-ascii?Q?BWjXDlEd6/pCQ18RpMjslpXodaZRHbem1WHGqpT7etQPtV7dRzdEuSyGscRh?=
 =?us-ascii?Q?TbckNhVCRRbggqYy8axqs/OOgl1uu+Kqi1jX8aB37HN2FTaV6Zq40xC1kx6k?=
 =?us-ascii?Q?sfcC3PTsJ7P+jX6oCv+oPYwfzUWnKF1uMOyW8zvx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27236175-df8c-4e9d-c062-08dcc2846f61
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:28:44.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XycuF9wOKZh374GumBaTQPuYD4FtCJRmIj4GWBFtjX3GXs0j2Vvs+FfOJEb0WptqY+dsBfW4ZWLFtQIwAdK8iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

Convert devm_clk_get(), clk_prepare() to a single
call to devm_clk_get_prepared(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/phy/ti/phy-dm816x-usb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/ti/phy-dm816x-usb.c b/drivers/phy/ti/phy-dm816x-usb.c
index d5ae972a31fb..d47674ec5e96 100644
--- a/drivers/phy/ti/phy-dm816x-usb.c
+++ b/drivers/phy/ti/phy-dm816x-usb.c
@@ -215,12 +215,9 @@ static int dm816x_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, phy);
 
-	phy->refclk = devm_clk_get(phy->dev, "refclk");
+	phy->refclk = devm_clk_get_prepared(phy->dev, "refclk");
 	if (IS_ERR(phy->refclk))
 		return PTR_ERR(phy->refclk);
-	error = clk_prepare(phy->refclk);
-	if (error)
-		return error;
 
 	pm_runtime_enable(phy->dev);
 	generic_phy = devm_phy_create(phy->dev, NULL, &ops);
@@ -244,7 +241,6 @@ static int dm816x_usb_phy_probe(struct platform_device *pdev)
 
 clk_unprepare:
 	pm_runtime_disable(phy->dev);
-	clk_unprepare(phy->refclk);
 	return error;
 }
 
@@ -254,7 +250,6 @@ static void dm816x_usb_phy_remove(struct platform_device *pdev)
 
 	usb_remove_phy(&phy->phy);
 	pm_runtime_disable(phy->dev);
-	clk_unprepare(phy->refclk);
 }
 
 static struct platform_driver dm816x_usb_phy_driver = {
-- 
2.39.0


