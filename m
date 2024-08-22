Return-Path: <linux-arm-msm+bounces-29254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D195B065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D473B25A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8011517C217;
	Thu, 22 Aug 2024 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GFUZ8RKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010007.outbound.protection.outlook.com [52.101.128.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B22179970;
	Thu, 22 Aug 2024 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315363; cv=fail; b=GR9WGNYnyEVGFOLe7PL2WGuYNwq58iLWQf7dKUYgz7clQ0Y92QVzfrdg+inapGINvHWSqjMh2Bs0j5GkJStNkOx7CXRUwvY7MNf+sp4f1nz6ePOyJxsZ3Ey7IZnbcofM6FdyayQXZYW1mxiSQd1FT+TmG5xnPXpEvebIxW+/U9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315363; c=relaxed/simple;
	bh=ooS74M7FOxzcKw8o+7ABlyUi9XkGvkuLLxgEX2AGEO8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FF5jY9v4Ea9PkgRK5EQKOpvVkldtBHWpVuRuLpzlkYHrDLR90CfkYVz5E2OTh5lDm5ShbMW4dtyaGZZpz+v8SizXVFCnaMhdSPtujyUin8YIXCO+BEBjT3Ftrb7LVGphXkYJ/N+BMRVQYVoVxzAvii4FhyuqQia3iYZWWAFUzvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GFUZ8RKX; arc=fail smtp.client-ip=52.101.128.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdIey1ZRSt+FK49vjYcirux/1LkHK15QdHI/wJ2QnxwOmC67zu4/tQpfRmK/A+9t5Dd5kHwA9RsoEAt+M80Bl/alfY29F9PWlT5ByHyxRjM1yc1LyP6JMOyfl4Kc4LR4g0Ti/1LX8eu4/FVbKnkuiuTEyBJfvLTvjMT5FDJbrguROKH5wk3BGCP6HxjY8szDbD7NnT29S4O56ZLfGF4FT3V/DzCutuJME9XZbg7jJZm3SymNbzXsPdd8DSsIQeXx7NKXmSX21xDpZoBrtVGsknN2ENd0Rq5SK2X4605/FzhpL3gYwWL/+Yn6bztw/pQ4ZTtOobX2rZ6sqYZy8BSu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV1DdG239fBs/5MPerHZ2v3BI6ptBPZQiZkIO3Dv1c0=;
 b=Rx7VER9B6A1EMsyq0H8PcXy59/yfEgLmwovu7S3w/s8nWQ5o1pqc4fsc49w5OTkVJvxOq7nsDIe+wt+B8w+dcXtLdFBHbmeTM4gg74ul/GyTwCdRFjQ4Um/fmwIZLXJBC5CLmy5Pr+/v/uWR3//vJQfH4aOv2d+oLM2L8QRgEyjRrmPL9jpw//Aqz+MtQMwg9ce4RcDXuUhm0qThpmuxplbSIU+TXcGovtpjYwtM3a6qF5FqoxYGNX27k0TFDd+E2nqiCgBWDJE/wIhxWElWw6UqGbWgxDKJ7Z7VrYSJfaZAjdviTa3G7G+Vm7EbYycioRuehdjxTuC5QcXMROk/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV1DdG239fBs/5MPerHZ2v3BI6ptBPZQiZkIO3Dv1c0=;
 b=GFUZ8RKXZq9K18YxydEYVsZDdFZpST+jymoWdu6viLHya5FdoTUFRqHw8aRWJXXlhugSQ6stQxGu66JUdSzmIEmbKiI6rDvVZoWVRBSlYWzjp19vBv8FJUBrShPWptyTlvUU6URMMLVKzumx8JWxC8waEgYQQG2SKruoey8I9PhjefyCbhXlEwtAkBRIuqawLToEG22PID5Ci6oYwXKCYi/Dm2GYBrDqTBUB0XvAgqpMmx8utevQ+3qNqBPT08c9q4WR5jCLj0GlaY0jCYha4ipdJF5M0N9yrH386V5A9TG4J4fWfG6lhnKrzKnavDgb5CXOCidCoPwit5dp5BjDVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:29:18 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:29:18 +0000
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
Subject: [PATCH 3/4] phy: qualcomm: phy-qcom-ipq806x-sata: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:44:16 -0600
Message-Id: <20240822084417.1596110-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::25)
 To TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: b59d44c0-7c39-4167-f494-08dcc28483d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpTnIy0mLttdN44Eu5/5jEDbN3hg/Woxle5sounxNR39Kod+bH/wMes0Rhgi?=
 =?us-ascii?Q?aY2TnFxu5e00G7JzDLnmHm/tkOvMItAhMNspM8gydTvXxfDsf6nvh+zkLCaG?=
 =?us-ascii?Q?ceXd2j6dmnUJQWXS6In7e1rNTU9fWacLkSxt0hw3Ovyb7Zc4CnqI7G8rBXMu?=
 =?us-ascii?Q?ehQcExhLZJFHviy0f++mPF+B6e2LmkxAs9dWSYu6uA55nt9vMmS+39szE/6Y?=
 =?us-ascii?Q?94tcNaa1hbC+8mRNNsIfc/wCTbrFdrqlHDQZx1NVQTPIOXa9d5dZlCFfh86E?=
 =?us-ascii?Q?cL60w2WPOPO6eauFgLsnOIW65bQ2iOjqZNDvvP13vZJ4Rg+3MTHlFaa0LlhS?=
 =?us-ascii?Q?Caic+L3O+zE6i2GHLnGBE7/6Zfhy8AmQpbbXwWN09Yeb1bmZvO6LrH7HyBsp?=
 =?us-ascii?Q?RpUk7nGV/OjV9EuIa71uC4wYZRcqe9t4MoFV7nmi9KUN7vI0tKFLepZAy8Lu?=
 =?us-ascii?Q?o8VIYty8BtG+HmSyJP8wfzFotBbORaQe9bJ7FPbF8/HJc4yykxssP83bhAYT?=
 =?us-ascii?Q?wMC2r4ncGeVH6y2ysc1tfVwde5DVK94jfZ5HdPb+fQoLDZS842aCpLLP+gF7?=
 =?us-ascii?Q?5iUSxAErqVOa9C8o+cbBkG23MSVPpzZ2Ha/DkHkgzPV44862Kifl2zxb3axd?=
 =?us-ascii?Q?Fj/pY6etUGWDMCI4sGI5srt7SNkCXojkgoo6XDIPr5LGvrYa989rb7+N98h9?=
 =?us-ascii?Q?rcWAox5Ey9rIbVFiCdqmWgXJYFcaCgE7a9gAv+OVTno0DRlMO2IyPdBBspnP?=
 =?us-ascii?Q?A6eEwa69p+CFI8ptPfTsLg09a1wN/9+7G2LzcW60/Apm/Wr0lpAQUFdgDOZy?=
 =?us-ascii?Q?EPBTp/Lq60TP+0uKdzGFlDJHa+73S17pFmXiEDGv2bwltKT/uWzASwAhYjA8?=
 =?us-ascii?Q?vXBN9EhcVxqGXhCGEQVp7EGBL+KdQ9Fxbnflqu5rvhTWok7RbQT+d5W3jasz?=
 =?us-ascii?Q?cRSTBgcFXSu4rrM1QdwfnNIHqjT0XMb611GI1EZ+lY1eSKxwUCKOBFMEBj8v?=
 =?us-ascii?Q?ShKdgDmDTLd8BzJf//6sXP5EL0cDZ71Z4oA8A00KZox92G+R14oGTq49jM22?=
 =?us-ascii?Q?H11xHQa3rK+dX86bqIy8lVXa9bGvfDW2TV9J/klokhXOMmz9Ua1e5tZ9rUhX?=
 =?us-ascii?Q?KFVtR4H/WgHiFRJWPiGLvvLNQujijh+smJ+GO10Cy3YZqUKS26z+rnH6H1Jv?=
 =?us-ascii?Q?KzJaXJ/1oTnSsyqlZBh2UrAYW56zn53GVCOC8/ywgd2oi9EjEvpMpBlBuW/K?=
 =?us-ascii?Q?z7jvKYyccEFI3S23uezQHWaYhOy+GHq08YhyQDBLiKlLlbqGzcb1R2uFnI8Y?=
 =?us-ascii?Q?PTl4tYkh/Z8VmbSAK+ieDBzh1SaoTR1gpupJg+g0g6TljFJEJWXxZU47mMlO?=
 =?us-ascii?Q?+qTL9JZnhRRUxigWgdQSmZFVLsi9/iuL8oSfcYAOsNMyUzN/zSj832bZbvUH?=
 =?us-ascii?Q?EyIWF0yb29Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9WB4DXntx+8i9sYHWVYScNWpRqepHm1W5NSg7OqpLc5DNtyagoU8iUnlkzy7?=
 =?us-ascii?Q?yAmA2dTEkzCzSRbbfJLsL7s4dnbVIkresJGroMneVQTsJvaL9Gzm179RLL3R?=
 =?us-ascii?Q?yaJKblwpI9V5uyByW3CNEOstDOMoqeOGDhdm33dwaRc56qlO95ZXKcbZMaHf?=
 =?us-ascii?Q?13cMXoRaeGc9Fgz8nGpk120/6kTFxOyrHlg6gNhEZphsMGJGakdkk83l2Q6A?=
 =?us-ascii?Q?mL4fpnwt7nfk0fiSW261rrNYoekOSBjPLJdYXIs5PxlUnNFJWlpXLTU1FmZX?=
 =?us-ascii?Q?T7Dg4ueQIPQARHQWSu4v4HfCh5FUP0H1sjrDVb8PA1ivFv3nq7BcOQe1YwXL?=
 =?us-ascii?Q?XnI4Izj4EkwUyzdSCJUwSG6XQm0D54H0h6Cnj1yP3Ox1JO7jEXYAdM3dRQ58?=
 =?us-ascii?Q?nrWNCyY6mwQRe37eTjHRR4tHYeVlnlSoN51VIj0tE379lc3/tiDyTciKhLV9?=
 =?us-ascii?Q?ayl0FszbPr62JV8aaABHU2A1NsH4NR8Eh/al3bYmNIYRRvWtq8MJbp0CY09t?=
 =?us-ascii?Q?TfjX0XHEwG2K9ioc2lFDkozQ5gGlfXLn0tIFrDT4Pt4gNex73JLCo94IfoKo?=
 =?us-ascii?Q?O2GYheQBQn2Zl9P5yzFCd3tqUo2zDUgEJI4NgKudn0H+WplSIUhzqK4lBWDE?=
 =?us-ascii?Q?XXxOfqrWUZAde1MrKQ4ClpLB3JnOpLrY+DMERs4us9iEuq2XX6ddSdZ0wrZm?=
 =?us-ascii?Q?OsUaMLDSp65Mi9m1m+GvNfCar+P9NClWNuqBZVx3dg5aRhoVrqL/l0x41vLp?=
 =?us-ascii?Q?yolLQz2CvJHwWekIV68oZXwiecSDk4xLx/vh/lYfJyMHOS/R6+WBE0zmXb5V?=
 =?us-ascii?Q?fWjLwW460cZ89jXm4scENkBNAFeUrF1YGAdPUwpk/1BCDEDwVCg9Gvo0ymQG?=
 =?us-ascii?Q?uAiY4VrUkhQPWW2vnZZdFpetxRRNDoHvJpVIz+14B4NhQJSWWbGdfZ7Zleuf?=
 =?us-ascii?Q?LWmXWy8EMXKMsuvOFC4oCZbUWBlvAAx4atPezX25giilXrriaqP7EisEInSQ?=
 =?us-ascii?Q?ZV3ypVCeYtusEr9LxMhAlPuk31OMjhANVP6Q8rkT419EgVLqgl8wBbE2ayGb?=
 =?us-ascii?Q?Fgry7eU8MbfFmNivAX4YyOrypPZUHo7lwLvI14gAIAhZjH8AQTYJwCMJpymX?=
 =?us-ascii?Q?D7KlNd39lFRB800LXi8O9N53DbHmckHckP6Df40pSidWqiWfnCZ0Qy5yjjA9?=
 =?us-ascii?Q?2pxhznCbqleSPO/8s++sJVxMVKwGa5VzPlKNyPuuqfH1ds5UIbvIcxk2Sv6o?=
 =?us-ascii?Q?1+s+xIv5cnDIuSmwRVBHsgzpKYnu1VoPbSVW1piX/BfJZO7OtqUSQWAL9Rw1?=
 =?us-ascii?Q?ZFtQgUi7QuoucbiQ0THQTKM1pf8VLUbsJsBa9ImccgtqjYkFC/VKFsvuoIBJ?=
 =?us-ascii?Q?U8N2UjqYSFGPda97TzDHPCY9F12K8oSeDNzEGYzF6NV1Nh28EQmS9cznbeSs?=
 =?us-ascii?Q?Df9cbi16ZKqwiphaWzbT5xQlLGKdWKF0S66f6bHGuMjl8fqAZghZycnnVwpT?=
 =?us-ascii?Q?OjpC9N3BBT/PXjAhLsZV6LYL8MRRhablE2ACuFFbS6kz5RgU6SN3MAwebzqZ?=
 =?us-ascii?Q?12PaxkZON44DqzrGX3jxnxb7D8yXZVZUIMhzW0RU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59d44c0-7c39-4167-f494-08dcc28483d3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:29:18.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyfcwVH2+o+eoAirAJcXXmtM4o2uYzveFPOLdGDFWGcGb3HgqTUrSFUhOR2K7N9sHgNVNABNnTs78CBruV6ibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c | 22 ++++----------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
index f0a72b82c770..bf2d91c00700 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
@@ -17,7 +17,6 @@
 
 struct qcom_ipq806x_sata_phy {
 	void __iomem *mmio;
-	struct clk *cfg_clk;
 	struct device *dev;
 };
 
@@ -130,7 +129,7 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
-	int ret;
+	struct clk *cfg_clk;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
@@ -150,19 +149,14 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
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
@@ -170,13 +164,6 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void qcom_ipq806x_sata_phy_remove(struct platform_device *pdev)
-{
-	struct qcom_ipq806x_sata_phy *phy = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(phy->cfg_clk);
-}
-
 static const struct of_device_id qcom_ipq806x_sata_phy_of_match[] = {
 	{ .compatible = "qcom,ipq806x-sata-phy" },
 	{ },
@@ -185,7 +172,6 @@ MODULE_DEVICE_TABLE(of, qcom_ipq806x_sata_phy_of_match);
 
 static struct platform_driver qcom_ipq806x_sata_phy_driver = {
 	.probe	= qcom_ipq806x_sata_phy_probe,
-	.remove_new = qcom_ipq806x_sata_phy_remove,
 	.driver = {
 		.name	= "qcom-ipq806x-sata-phy",
 		.of_match_table	= qcom_ipq806x_sata_phy_of_match,
-- 
2.39.0


