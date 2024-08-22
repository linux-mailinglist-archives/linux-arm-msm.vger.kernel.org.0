Return-Path: <linux-arm-msm+bounces-29253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF395B062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54EA4B258D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3257617A583;
	Thu, 22 Aug 2024 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="iHf7pvvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010059.outbound.protection.outlook.com [52.101.128.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7615CD78;
	Thu, 22 Aug 2024 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315349; cv=fail; b=bbUWvG4Pl0NkddaQUGK8hGYFBCAAZOB8eOuDhiN0fNkKI5pnt1iKO/or/AcwuunBZUUJhxsIkgnyI6+AeLg8elhGBkqzqFtNGeBXZjvCjuq/O9pZ9kOe0BON7MBBlFeK1gairVbl1liETGeFfKK0DwyTVZwZWrKwsq9/rgEmYE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315349; c=relaxed/simple;
	bh=/XPsf64X3Rbsl6cumfBIZr580oQCpXTCvTPbikTYnwo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MNQ0WV3fVGKu7x772NxGiipzdE00ke3TerxvkeTdLwQKoT1pq22T0bTfgN5VxGCAhifdc60n5Fd+HI4zgxY8K7fzCdyxX7TxplkTOi7z3jyTvRVGMrUY1B1entHchjULs/CDkx9Py4ySyd1czZQTB9W/6pvaxAAl5npy/m9yyWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=iHf7pvvY; arc=fail smtp.client-ip=52.101.128.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdBAHYgiz2Z+kMos3t3z9y64jBMTopJyed15QT3og8jIh+dOPvJzPwtsGiWXd2RSoJcYB1TkJ8zbbdjeEF0nfhH571MkIqO/xWz/Bp1CiNenMUxeRwiCLrog9VxDPETPKNT2l5FUNdoaXYt/cDtNdeWdMrd9o5N00Woz5r2d1497n6u+2vbW2xyL7HuEGWypnrrMScnU2TFSVZaspPRs+xA8GMquvJRliSh20bP/nskpkEg4ps7axMpcpm8XMTUhmQ8+hZRFLpUOjnnQE4ZKu866dtEzuedTdk++KLXdtjz3CC2hCNk6Zzg9GNbdWqGv8kplh0wYjWUrAt7SkILLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXoV2SjY+ZpgvvB4OOesnELfc3f3Gl5+ZZS/e+vkutY=;
 b=e8AhdV3Pdizk0dWvCoaXzIMI4xHlDMESi/neurPtvNtRW5hF2LV+WTyye03sac1e1NPgpzoxR2bp5tGfAHhv+6sGjkQsCoZkXzhW4DsYTN7Ro190kUoQ3LVn6RnADu4Q5QDDWNLOqcL2HlsdQoIuma5bwn8gx5w0G1POqc7s4LY4AQX3sb1HsWv8fzymb2fVxFKSNr6AQRVEFtUq3AXjPhOnyKQciQw8xbiZ6hx7XKxdkwY4ttVdasLQqQ8mMJSe3iPZZabO+xaCPwJkkFMJtHTeopAWfGRORaBqG6/e1Q50K1mHSDyTCh4ASemGwpubQpbDtuT95PalIeQqxgHMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXoV2SjY+ZpgvvB4OOesnELfc3f3Gl5+ZZS/e+vkutY=;
 b=iHf7pvvYSfsv5IolbDCt4PyXuWtZJDvWTFUqoL21OMqyJse9DDAZfq0wpwCpXm2qrmLn/1xIIQ4kJ/MjePfv76geWJ5W4AUIUtf23iRhZICNEbFpgM4LOefWWpZZv92XxBpiX7Uw+n6h7IHlqYbv/9fLCIXowepS3kMYzavWpS69uRLggtsaedhVf5actpuUO447bRuybdtvjQlsLHu8Zh7WozTwvGqgYGgUXbjes3ZSHJ1URtYbWWnpFp4Zmd0/+uXe7/3e0uTaDNWGp8rQsLYUNrkQSGD+D/Hev2Q9fHQJEg8QcHlrs4CdFIxV0qpjYKXD4M6wr6kU1f+DDmo8bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:29:01 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:29:01 +0000
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
Subject: [PATCH 2/4] phy: qualcomm: phy-qcom-apq8064-sata: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:44:00 -0600
Message-Id: <20240822084400.1595426-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 58823b07-4f8a-48ac-684c-08dcc28479bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3TTHHn8zvI6SO+Gqt6Ib/LwxSSoD6Zz0iYYUEMR4vbaejMcYLXFFfaThBlI4?=
 =?us-ascii?Q?AsU2kAUrVtSTKEXUnagreEWOlm/PvAfIUggMUPhGczCXMG1h80me6vkPIjRJ?=
 =?us-ascii?Q?rpmjmNrLPa5U41q9fHQmYPMp5VDRB+d6m06NacVkLJ7AUGA4R49cIZdVpGa9?=
 =?us-ascii?Q?NlS9D8Vl7Otv29chUwJII9ZDI15DocDAXc0DxePysrnCAIcSKkwpOmEBTOUx?=
 =?us-ascii?Q?IR/ndmuO/z+G9hyacAvJ8savrtb7KB/fiGUNeQx80RJ2KfVWBytVesuYqlr2?=
 =?us-ascii?Q?ZiHUD+3uAxvyNjKIdjwoaJi7MI3lHqJNfnumse7wW5c3VEz1qnT0Y/BjgkQw?=
 =?us-ascii?Q?NwVGU8Ulbv54itj9km4bf2MgsCeZoWztFXorFcl4y87eBPZ7BAgwRgSaLX6x?=
 =?us-ascii?Q?4yqHjG5NnR8s9UiipqKckic4DdY7qj+ZAVMl1dfhhbE/v8LC4iolAXMOtunw?=
 =?us-ascii?Q?DWFgtubrca/plC9WyXN9xXj982M+sHU4rVPDhncc7mb12ibEFRTP+2kcC81q?=
 =?us-ascii?Q?yTbOF69KCT6I5+mhY8yyhbCtBqminYRilvMwj1NIbH2N3rtOknFnj6De3FYE?=
 =?us-ascii?Q?YAL+o7HsQSBsW2clN88hNoWxs5WZCVm0FP+Xte8jwqFTxeobvxcXvDsvzRwa?=
 =?us-ascii?Q?U1am//3Yk1J0bsUiY4QUs/434YbTIsoWo62pNZ9mUSPIhZcvy5hHRXc3zWvd?=
 =?us-ascii?Q?NG1qpCQxYFZrEh6+Lbc9qRFmzgjJPbv8teeZ6G/cwPaRPfmQSFV27Zv2jiLc?=
 =?us-ascii?Q?1iS3nSiQwFTHpGfSCzukNEMnP1ivssGSmmyLNhVQLLh/QpeLmaFa/Jpwe/st?=
 =?us-ascii?Q?rtCWelxlKKiFs8gf/smO6kr8PvzWu2DJjW8MLNWVqX/aq47rgu6zcdP/wcyB?=
 =?us-ascii?Q?6lFHg+ONA61+GNMWgoAfkWlh5TWi1G5Zvbudaa3Lv52lY5Or1sNuIaGze87N?=
 =?us-ascii?Q?n1shOrVn6AWKGQK1qzgSBDgzVYPl4IpSZAG7I4GblfULgiStu1R6+XiD8QAo?=
 =?us-ascii?Q?+prnjDDpgFumB4GRX7zXlYMvh75fceIY3O6yYxesJ79DWXrXxh8n4fqA9+02?=
 =?us-ascii?Q?lvdDjuCaXhZXNe3YagYsu7VlBxwmDoWzqf7xJZVlw9nASzPuRGtRPSp8fT5M?=
 =?us-ascii?Q?z0299SWSrs20u/3pUKWP+IDid7evT+wJZyRk9cK9h/zHUe7ZV5fQ3QsSLLQF?=
 =?us-ascii?Q?9h8fD9s2uilGrE+hh/UkHohpmzDlGDlM44ZhSlN8XoSc/DOWZRoW6UKegkAz?=
 =?us-ascii?Q?ZeSw0vPOcu52k/h2+SypeGpW7HyD1E6oZfBptnP6VDCKdi1UmGD+2bocvcym?=
 =?us-ascii?Q?wvfSoOXSf5MJiMq8L0S5WKX3zD0XSv0PtBNQf4RO72q32KySjd+1jIdK/jca?=
 =?us-ascii?Q?y7u6ojLUVHOwUOt8injo6kdEmuNJZpWWrGjyF8ERoTBfW+WgkmN/8NuZzYMQ?=
 =?us-ascii?Q?/mfI1JNUPh0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?raSqRl7REV4kj/VXPGbBpwqVKbbIDoc3GJ1BRvJG7WuHS9J1fgEmtChIrpW8?=
 =?us-ascii?Q?9GYXLEURMMI9GcN7QrOVKecK5XIHuI2BCjllqgNgd5YPPyZIsCgLaEBLZTI1?=
 =?us-ascii?Q?9oJwzC8hPeSaXFQddsxOCrS9oXHtWk35IwMEZi7BS1l6MKkAPE53cQrOKmee?=
 =?us-ascii?Q?VoZm3peZzoHe/IHYCLM1F2CAGg7MsWHgENd14C2ewQhHRn8K2VMdhn6lz/vN?=
 =?us-ascii?Q?OLxaoikW0RcAtscp9C5udX2tSYy6Ii9Vt7DWBb8pxjjqLj3SMop/BKmlTP4J?=
 =?us-ascii?Q?NvwtCYRaYb9YtV5deK5OOJ/TfzzSEzsZtAJb2wIVh/U0svJgRzurUrGGQZPu?=
 =?us-ascii?Q?fsxZtOx2YjCTZQGvVHNy6OKxQdTrgojRWcad2Jrr2aGspfAi/oVcNlyRl27Q?=
 =?us-ascii?Q?fSvFSHWt0RSCncHLJY8/aN9S0aE8EOZ66chyOLBBlwD48wvoRwORXcQUX/Gf?=
 =?us-ascii?Q?SJ8vbwsRNIQz5IMwgWIPFalFLtWFn4gXiB/b80NmZSS8aHDRWPI5OVtSDKnI?=
 =?us-ascii?Q?gRMumye4W4EAUeOZ2Bkl5djl7Ai1d2OSwbCNX7R+1vuBNXZUH76lhbiiJgFs?=
 =?us-ascii?Q?YXAUUUfo8SvdiPqj8VeJa1GBNL3cAhV7iP1w6FjUi0CFPqy+G4HD6NshqIVu?=
 =?us-ascii?Q?K6dJh+ejWvCUqYMleEiQvVlnfmFZiqKbGQCyAY+McH1PhmEFF0ox1nSkYsT9?=
 =?us-ascii?Q?v+XrZrDkSgAiNOHDytNGN76S8gQeXEp+4l/clVdFN42h3TKriYIQm6Z2p9FZ?=
 =?us-ascii?Q?lWgssGSDLYCUxadFJ3Dr6u2gK2BY5XQTliQAqLJ+GvI80CrDAoq6gSU9Frea?=
 =?us-ascii?Q?mRkNRyipK0/8kefnPKyjqr7X06fxI6LFvhCrg5jmyQHksrsu7Szr1T/VYQDm?=
 =?us-ascii?Q?XY3g0xU4Uwc4GPXHw5aFeuqGtWvPR94dgedauFDR/Qy35bo8O399j3txAedT?=
 =?us-ascii?Q?IccWCLyHDaZwwHh5B27dbxRPDvn4e0XLWbT7T6DmteTU1VwkfLDIqlKPzWAc?=
 =?us-ascii?Q?14Jh/Q/3U5t9GgM64t11JmuUieZRvSgPzyiVQAvSGm/m89k3lPnp3WcV1gn5?=
 =?us-ascii?Q?OjMm90BQcgh1g3wRXoJKffccjRgUwua+WeErEtxZo2FCZnT631Tyf+qmsi/i?=
 =?us-ascii?Q?yqXccAb6gs9UxlExscpORQewkwDeObT5TTTHcy5FbDVS5pZSm0pypOsnH0in?=
 =?us-ascii?Q?/1NYIzNoilatzWqeAVjHqF26sfUG+g2aQmCl2flwi550ZK/G5g/8t0Q5UrG3?=
 =?us-ascii?Q?Xe1Rek4WAvShPPSEp3YRzSZmHbwSu9+YySthRljfx64bFySU0Cxksfl9aByw?=
 =?us-ascii?Q?Oix5tso/LVEpS+WoXcdVv+kJJfek1+o4NARPqJlB53/d85eGyHN9PCvFLqG7?=
 =?us-ascii?Q?oTjekvyfkJNh3xKb6zaotAueD7u2Aru9zO7+PKlQTMEh/YL0l+DYLeF//nZp?=
 =?us-ascii?Q?nlRXCX1mrIcW4lp2WErrwTKSKcyY8u1SBxJn4qEWY1BRrNonQ3JzH1hK+i6K?=
 =?us-ascii?Q?pwmgoQMnFXo9vynE4iI45CJ1gCAOqzro+EH6vAMeEBYTpYIDGIwhvcLFhLaP?=
 =?us-ascii?Q?5MlC0uamHFUK4x/k7Dhjc4LjhEv49VcNgA3yVO+i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58823b07-4f8a-48ac-684c-08dcc28479bd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:29:01.5020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJpfHEMme18gq3FrqL0XnPtxnAHH/a8xlAnmG5fOUBaOg2yIa0y/XHjqofYjhb20dtA0PsmUPNBrXr04OhPCdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 22 ++++----------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index 3642a5d4f2f3..18c0dbd8e707 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -68,7 +68,6 @@
 
 struct qcom_apq8064_sata_phy {
 	void __iomem *mmio;
-	struct clk *cfg_clk;
 	struct device *dev;
 };
 
@@ -203,7 +202,7 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
-	int ret;
+	struct clk *cfg_clk;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
@@ -223,19 +222,14 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 	phy_set_drvdata(generic_phy, phy);
 	platform_set_drvdata(pdev, phy);
 
-	phy->cfg_clk = devm_clk_get(dev, "cfg");
-	if (IS_ERR(phy->cfg_clk)) {
+	cfg_clk = devm_clk_get_enabled(dev, "cfg");
+	if (IS_ERR(cfg_clk)) {
 		dev_err(dev, "Failed to get sata cfg clock\n");
-		return PTR_ERR(phy->cfg_clk);
+		return PTR_ERR(cfg_clk);
 	}
 
-	ret = clk_prepare_enable(phy->cfg_clk);
-	if (ret)
-		return ret;
-
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(phy_provider)) {
-		clk_disable_unprepare(phy->cfg_clk);
 		dev_err(dev, "%s: failed to register phy\n", __func__);
 		return PTR_ERR(phy_provider);
 	}
@@ -243,13 +237,6 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void qcom_apq8064_sata_phy_remove(struct platform_device *pdev)
-{
-	struct qcom_apq8064_sata_phy *phy = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(phy->cfg_clk);
-}
-
 static const struct of_device_id qcom_apq8064_sata_phy_of_match[] = {
 	{ .compatible = "qcom,apq8064-sata-phy" },
 	{ },
@@ -258,7 +245,6 @@ MODULE_DEVICE_TABLE(of, qcom_apq8064_sata_phy_of_match);
 
 static struct platform_driver qcom_apq8064_sata_phy_driver = {
 	.probe	= qcom_apq8064_sata_phy_probe,
-	.remove_new = qcom_apq8064_sata_phy_remove,
 	.driver = {
 		.name	= "qcom-apq8064-sata-phy",
 		.of_match_table	= qcom_apq8064_sata_phy_of_match,
-- 
2.39.0


