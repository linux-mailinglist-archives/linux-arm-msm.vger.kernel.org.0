Return-Path: <linux-arm-msm+bounces-29255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA695B06A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BBDD1F286F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17DB16EBE8;
	Thu, 22 Aug 2024 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="U+C3LDTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010014.outbound.protection.outlook.com [52.101.128.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D615F3F0;
	Thu, 22 Aug 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315379; cv=fail; b=DQRtPRjVNvt0erudr34gq/VFd7I7UFnOyoNH3UjW4Ls+fHOW7IfrKfkIzArlEQcaqjI6cxG21BeuO2Ky3hRir3BY7PQQWs11KzTiA/3WhhgZhvOx6UcvsKoFRNUjF17qa5SkqgYhlWv66Ygqvgf9C6sP+yudlAxnyi/+DVleXoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315379; c=relaxed/simple;
	bh=cQKG3AZcBfuolu/MIXCJqMGy3XnCgIP26xXAuubaKtc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Gsbg2xs5W2zR4bTKM6pgZnVUbIMLZRc5wR4EMGTTHagnBNu0QizpHPaKG29V5Eblxro0NmNooGpOWiEbCNNq/E5cigtf0ElHphSR2LyzhHHL0POrO4Luhq+5yT2yRxpfiVexBONcB8WF0Zyy9xt6tkTbL1Kqu/uLkmFB3CE8PKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=U+C3LDTQ; arc=fail smtp.client-ip=52.101.128.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPyxI4cUYNECDLgUZW6KrZjK9qgnl8bBRg+fQGgB4iOAR8YeGsUSfQmWK6E9W2Zy2LeP6dIC2u+6uxs5xiGgTFtMPLutUMbD03cK2Tgy0wgnKcGiIfZZc0cCdtv1B6qJDl6rL0W4srbCDEg4UdPsZzxwhKq1p4fBDJC02JslkRwUiUacA+ZquiawDGGrMKEizSSRGMzvKR6/FDmtIcgqvrHKE+qgiaregoTMbwXSVEialTAuxlWrIh/tfeDH8EamCoqr4LU9zFX08rZN5ZT93/kOr9ij7i6S1aUr4tJdzq5B7M8nEalCMNLhk4I5QkywwWZ3XL0GmPqLIPVgzJ24Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwkPutKog2rmpE2FfH+ojM7ztMMWoa7jeLrE1IONC8A=;
 b=uoTi0assD5xacGoZ2Ki+GovDXen+4i7sr9PPF4HORu7mItbjidy5AO6kaEn13MasZ1pmxuSCV2K281yIZdL7P0ZMQKz5OQeCW3zvvG/PIk55GS+gJ/GMioaX25GB38SpYig9hlg7T0OUmFm+hBTAtbrzVSTB2Au8H0mMZopGB/tiINQBc0qwlOtJX2ib3VNWULMdkbiqNPeUUduh12l1BEAXlOrkj2Dd09XZtl8bNqwTMZDFbx1a/gwAcybskmqr+5B02zd2CB+EycYwzThZXFcFmcUAUaMpncP01cLEMPn48vBJD/21jTEwnedpI938hBp8mo3Gc0X8E3AgeGjcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwkPutKog2rmpE2FfH+ojM7ztMMWoa7jeLrE1IONC8A=;
 b=U+C3LDTQRovKc8gtWxKyCjLYCBVyY5Q9bq4ypDxOK/WU4eAzksVRn8VtENw7NgSROqkW9TMY9gMjcGSlAnHbceePOEa7KJUDv9BHeAkT7VrHjFN53xN2ETgf7CBicOtW3DQrv6IIDCvJ1eiuYcI/sBq883SPOB+/eZC8J+FI1KeEJynD0zscn5QRs3EnkmKy6ns2h4E9rTRFRMuNZC6rHU7vgcQgXQoG49AcxQwmMC5HuLYmBvb/R8Oj69EHbP+SmlpACZZ1x+VFWqPjKElRwKjPnPGg0m3QTnfFf/qgZ78y6GyFqW3Pzm2WJ8AaePXxTvU+nucgxdO2kbNzw3awow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:29:34 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:29:34 +0000
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
Subject: [PATCH 4/4] phy: samsung: exynos5250-sata: fix missing clock disable in remove path
Date: Thu, 22 Aug 2024 02:44:33 -0600
Message-Id: <20240822084433.1596209-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 285cb0d2-4634-46f9-0096-08dcc2848d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y25CAZDNE3vrAfKQQsE1DHy2id35bpyabrEag1v4uUJNOtjW7ffXFJRNGM9V?=
 =?us-ascii?Q?VWkf/+k/0Wk/F9hGr/3qMlvte1QJb531bnQ3R1gDOfI81MDIs1GRtYAB9a9r?=
 =?us-ascii?Q?b849+EoK30vK3fIxUW4qwD1Pqq2EJ25yY7TKU5wxOyj3/I6PcJpLL9C2S3eU?=
 =?us-ascii?Q?oLgw7wkJ3OFHydLUUJ0XnKA8YORNwgne0VuoZ3gTYC4iysh154Q8/4ddgsgm?=
 =?us-ascii?Q?CUFxgppTy6zn+XXZ9fIqkiShnlR3fd6U4r6nMt6Awzq4WiBf5kjpL4Z0Hh5Z?=
 =?us-ascii?Q?RfNLPRGIMs4nXkIcyj0zCBatgT9nz1hydnrWk4iXAOBQbwa80A5UCRnf1nij?=
 =?us-ascii?Q?CinlZn4VrLBI2PPPybmgUmYzlVJGZ0swvBkWvyNMeOhwzP+AWSKqNeQVLuBo?=
 =?us-ascii?Q?HW8kOZLjh0RLqZWk07nLWUUyzpeqycglX4T6oAtjDLBT+EJgVySf0aZFlIZv?=
 =?us-ascii?Q?vQwsQsLykOEm5BgsF/PyyVTJxB9e53hL2Tf3gYx/5BIbzgNHxtOqLG+i9SgF?=
 =?us-ascii?Q?gwg353jzeKyYrTTXhpH6WGrxgfgAbgpiCXe4rSUpzcSQtVJ2TnxR3Ce361nD?=
 =?us-ascii?Q?D8XxmaDeZcfeNRNT0E5qh1H4T8Eq03Tpl034+Zco40XRRbZR313TtIfpx1sV?=
 =?us-ascii?Q?dBkm3dU2BRS9r0hPGlMSjbelu+I/YfTM2bxZ2A9+hnSTk5MmJx6dzYKcvlHd?=
 =?us-ascii?Q?UhX7ShNUIG5m4I79w4jaeWjff6p9aXqbK4N0PcqsRAOhZxe/qKDBkrTaLQHv?=
 =?us-ascii?Q?Aps1vkn/UmU40zASd15C3AEbIqqYFRh/40Ju/GHnVSnQEXHJu1kHYcZkaSbD?=
 =?us-ascii?Q?j3vg/ONkTodsVpSrstLQ9aDQtn6sK0o/ezDDGdlbme4Xzl3Pg6hUbx3HE2SM?=
 =?us-ascii?Q?ab67dsCfuVtGrZfRMm9O9PGezQ7qx6PAiNMvquchSek6nwef12kQmSYYsG6J?=
 =?us-ascii?Q?dT9F9RVTjQff1WYWZ9aZDNXSQ64+lDiSq5QiCiiSkrrt4JUjR7qe8VYzyRv2?=
 =?us-ascii?Q?7YlUllkmJLwOEwWPL40edJOQ8Ke5J1Qi08yJjziPU/bCl3cUAWV6kWXWWqoX?=
 =?us-ascii?Q?jgrlUwXKXcAHk3xZLG7ZTXzkd2l1mkJW5/VRhTNfuqpIb699Ym0YHcVa+KXr?=
 =?us-ascii?Q?YhVidGGQ/JSddIO+06HX5gxKFVCcFZVI0/ncUQ/g8NLpB8atoboyByhjkIE8?=
 =?us-ascii?Q?UZAKP1sbU3IYAAuRQ80WDdMSVpX+InqInjegUE4WEvA1CCFdpX9RXAz3fRK+?=
 =?us-ascii?Q?mxSxidLR70n/8Qkz0DVCT1IJikIYZ3x3YOhZONGwUCzb9p+MboB3QpYTeu7a?=
 =?us-ascii?Q?lQFtySpdJr1cJFUELOcXA5DxjyywWQEnsqKVippMX/2R+VlkOW0KYWUooldq?=
 =?us-ascii?Q?t4k9FcwJ3KSiHoZHQPn4kD/trqueozcM9I4VTRFM8WkgN35O7pkATnKvfBgt?=
 =?us-ascii?Q?9WSDbQsbSBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0Cs0aOs1ho8KBJgHpHsT9RQOR27oKYMzxISSWqt9nwtVxaWThQRVJQ2aiWP?=
 =?us-ascii?Q?rL4pVC6PVjbyWXgAqD4TgcsRkQXYRQ180wHwa6ZawNnGQXg+Mrv7jYCvqZy3?=
 =?us-ascii?Q?RUK1Dq8ZASeSQ/VXliL0AO52tnDYUJM4ZSzvWIllt1tQX9aJo4gvWbSJGrpX?=
 =?us-ascii?Q?JN2X+DhMM7g8bcizUaGy+jtJcw/tbhLt9v6f3qUf2OIonFEqC4uCG/B4YXiP?=
 =?us-ascii?Q?X65utwWnG8h+M953/wh3wJnW/n74R/JzmePfxrz9hC3wJjgWLIqI1kT2Du6V?=
 =?us-ascii?Q?WbaPoeXKXbtLLwUcxZeBLuq1KF+ea+Oe6lvxkhTInhoyJXPlLjm4KXuy7es2?=
 =?us-ascii?Q?kJ2iXRZ9e8TcVF5sBeNZn34drYUHT5R4UvZxFGtMDQHpRkSt2SMcJDchJ+QO?=
 =?us-ascii?Q?Y2vKBxyZKBUaI57eTbE++8jtgb2mjB/lDUMUPEFQsj2no7joPmZViQMrmw2n?=
 =?us-ascii?Q?rN4+o4OjtuTc2aoyikfuBHQ5j8HhAbU+oXXOb/qHzyfpvuMl3+XrM766upQy?=
 =?us-ascii?Q?ufwEKEEQ+8NhpjyFTU99VV0ltnQ3XvJuXmWtDLl7fyf5nwF1PGXazGOk+H4y?=
 =?us-ascii?Q?1Aoi5jfzYw4FMlQeUc/7UtYaZtxjPmStbBS3Mx10hPAnCNJVkQb6iKgEWbx0?=
 =?us-ascii?Q?ibSuFo90CCsgxxTVUHvt8yRrHcVAEAc5mCr6qaZ+VNXQV82ILqiei5gWivKE?=
 =?us-ascii?Q?IN/6B8C/lEAeBdE+mIeUJnJndTFg51wdiyVtH60UDYBxlfNKbEFPl0SY2/c6?=
 =?us-ascii?Q?H3A1+hBTE6nLvUIZSdPPVY5SRs7ZlwPfFCdWFOL7Ym47hvYCmwbUrGpkDckI?=
 =?us-ascii?Q?JNWybGzMTr0Anq36FDQ0WGrSpQ2n5/cfN9rrwBorwsKyshQZjv7PJJkWyI0F?=
 =?us-ascii?Q?hb5v2crCXgCQVweqD6nXXfBzGEtTqd9scMS2FuwqSkAEwrPpYKZB+/2qywda?=
 =?us-ascii?Q?m6hBycccn63Qi1iVvXuOIKh1HlAOMojGEyXvneI3nXHQytNy7ZtAnLz3pzg4?=
 =?us-ascii?Q?GhuYRhr6UFCmCoSFprSB03dByTnr9MMe2ve13LoyOf1KOoB5wJW0HH6EO3yM?=
 =?us-ascii?Q?oi32TmMIbv4QeAwF0c/HBuHxsjgYJtiONw9UNm/S9GQ+Mf1MXXfzDAQd601U?=
 =?us-ascii?Q?hBRioSJAxQctNkLQahnfC8+no3JuuXy8o1JEMbRdy1Bw/9EUXhuD6c1ugn7c?=
 =?us-ascii?Q?XQv3k/jZqSlNOWZiDbKtM067I2Dv03tmbh3lDAukO0zp72xc2mYDs/+hPhMM?=
 =?us-ascii?Q?xrIF1SkUEXTWtxu+NQbYTiNgmSwRJSmJ34PIEgJNTbcynI7MHhpVucufxnO4?=
 =?us-ascii?Q?XidM620IyFiGJ4B7uG8nzdGmtxZshdClhdLBeqoLSCfGvWiSGdX1SuhecQSG?=
 =?us-ascii?Q?TzyHY7EStpB4ZjoH4ACCCotiKEcK8qdDM+wSjnvmjac0dOXKb8sJAogY2T1f?=
 =?us-ascii?Q?ZB08Xqccpe2zSqyaOqLTyyGfZbPdTy+CKA9KIbpbpvTbw+FK5i+DvgA5wEa2?=
 =?us-ascii?Q?6KyflFdIz5OKWuQXEHyaYle6BOd4XTyJFr8+dZnTIOdl4ZR+rxlNimHOoraG?=
 =?us-ascii?Q?riVoLPgzyo4kw1AkG7L70V0vPpwO6oEeL2iL9xm9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285cb0d2-4634-46f9-0096-08dcc2848d80
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:29:34.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQE2T6OlVUJKSYHZxiRrWAobUbqdfyF/JVPqvR17E7HsXbOd+097Mum3cOJUGZC4/hURxXyeDZ2XE0gip+xI8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

The devm_clk_get_enabled() helpers avoids the calls to
clk_disable_unprepare().

Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/phy/samsung/phy-exynos5250-sata.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 595adba5fb8f..0452b236ea50 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -47,7 +47,6 @@
 
 struct exynos_sata_phy {
 	struct phy *phy;
-	struct clk *phyclk;
 	void __iomem *regs;
 	struct regmap *pmureg;
 	struct i2c_client *client;
@@ -164,6 +163,7 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *node;
+	struct clk *phyclk;
 	int ret = 0;
 
 	sata_phy = devm_kzalloc(dev, sizeof(*sata_phy), GFP_KERNEL);
@@ -193,16 +193,10 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, sata_phy);
 
-	sata_phy->phyclk = devm_clk_get(dev, "sata_phyctrl");
-	if (IS_ERR(sata_phy->phyclk)) {
+	phyclk = devm_clk_get_enabled(dev, "sata_phyctrl");
+	if (IS_ERR(phyclk)) {
 		dev_err(dev, "failed to get clk for PHY\n");
-		ret = PTR_ERR(sata_phy->phyclk);
-		goto put_dev;
-	}
-
-	ret = clk_prepare_enable(sata_phy->phyclk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable source clk\n");
+		ret = PTR_ERR(phyclk);
 		goto put_dev;
 	}
 
@@ -210,7 +204,7 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(sata_phy->phy)) {
 		dev_err(dev, "failed to create PHY\n");
 		ret = PTR_ERR(sata_phy->phy);
-		goto clk_disable;
+		goto put_dev;
 	}
 
 	phy_set_drvdata(sata_phy->phy, sata_phy);
@@ -219,13 +213,11 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 					of_phy_simple_xlate);
 	if (IS_ERR(phy_provider)) {
 		ret = PTR_ERR(phy_provider);
-		goto clk_disable;
+		goto put_dev;
 	}
 
 	return 0;
 
-clk_disable:
-	clk_disable_unprepare(sata_phy->phyclk);
 put_dev:
 	put_device(&sata_phy->client->dev);
 
-- 
2.39.0


