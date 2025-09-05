Return-Path: <linux-arm-msm+bounces-72230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D43B452E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A037A653B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834DD30FF1C;
	Fri,  5 Sep 2025 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="kvMnUfE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012058.outbound.protection.outlook.com [40.107.75.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE430F541;
	Fri,  5 Sep 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063617; cv=fail; b=WQ/8KjZSKzf+wLO/kJh7JDj81STRC9qc+VhKBTbGePWSCpwRJ6McTQUD6zeAT9C/iT5PgIMW/+Ds2yI/4QBwWvxZVeNF77+Sj/A93KUlBBVnItB4CXzN2nhGUAu53y3o7L+jq+jmmidbmOtlGCp7rYbDuvCszpPupGxqLhyn5Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063617; c=relaxed/simple;
	bh=UO6oCV021M/ZESWd0HSAkwrp/iEj/3sET3HBFkHiqYg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DzWLNOSo/FKAEaltYwKnK3p8PXp99ZeYlgg5xnza2wauB9ibp2e7DxvmmRIs0s5u3Bn/M8DrQo6VnEgzAdxsdT5Ypzp0vdY1DZ7pbtwF1uRcfVEWRoB6i9K28TcJ8MNC4Pkbpo2ktCqlZYvTVBcEL6EVVpxHxKrM5Ge3yyBG9NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=kvMnUfE4; arc=fail smtp.client-ip=40.107.75.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8bAks6mZMjsoCrUOR9I8i+kg91uw3Z9lfZGJj4UZsZSb8yPsSVQqiflQTPI4/fUVMrpUzmLROCc4FVZCHgObWGLLFiYn5dG8A+902J8+wt9/SZYTuYmX8RQRAPgjvI7EnuOsGTyAj2dLMD/xH6QX0Cbnbf1PkcCVe+LzOgYD2n/e0Zqe0ZzFQf38FXAguFLZWsMOliO/jv207YzgiVcEbVNksja70adQ2usiMvhsYJUN3ISX9whMasXqP6XdRbZGgPGlhP4TkogoTn/LuvROx5wpYj+/4fhGSPV23wF7+IV+jaLQ8bcaQVV4ZYHDdE8X+aMw08svtYqqE7jt1+Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgjxX+RyvozPBzUvY2PA/ambW/o0dcYBhvDlRYhlBuI=;
 b=tPU9WmoTjmLIY/Pq2ihEnnqQCfOpv0bJGVghTi5EMXXoo4XD5KDcnuvnp/j6OBVqas7Gv8y1ZRIwfR9yVdiIlb6G2Xg5ngcNCXDkw0bs3KmDvgvg1ZRDEbBNS4QFXoXms51z7wHDKjq7ZW8JCW36EZcwGVzpnDlpNjNVde75LQ4ezaxnDq1VGTuH5AIiMXGefM/qs2uWehbIBesOKiMEdNrk1YkEGR7hqskjP54LFnn+fBs0SZ9XhzTbBK3NogVk7+Yqw7YCIWGSLMXCwqRhS49rN0s8TPgg06R0RJPPi8eIDjq9Rfe00xED9hBEx6LEhdCixlGAFL5ac8lt4lQQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgjxX+RyvozPBzUvY2PA/ambW/o0dcYBhvDlRYhlBuI=;
 b=kvMnUfE4oLT8php1baZlwMmyecd3VZhW9dlYgirfGbGCzwxaYlsLT4i+UiREk8RNP8+BVZFmOBTXcPwOz5dmxTsYyZ6yglKH2PAYodh52wYZF3KI1lONwbMmggPPMD3WRV+rZ5+t1lzGhUf3m2mLHVGxGuguLL9Esz4KUZp3ZnqbzMKbM6dLBDsB2zSCw6J6Ndn4P8Lbdim4ql38/2DRI4FrumM8CNst9srQOHhtbgWmRHzBLd77ReAJpTRMegDprcuCayQn1MJslrW+ID5s706DyVEza+naXDM+5O0hUAYZ2+dlbBiprbbJMgfLMd0VACmktwtt3JPWQYRhZwPtzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 by PUZPR06MB5518.apcprd06.prod.outlook.com (2603:1096:301:fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:13:32 +0000
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5]) by KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:13:31 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] tty: remove redundant condition checks
Date: Fri,  5 Sep 2025 17:13:21 +0800
Message-Id: <20250905091321.437476-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To KL1PR06MB7330.apcprd06.prod.outlook.com
 (2603:1096:820:146::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB7330:EE_|PUZPR06MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f887f6-47ff-46a7-6c21-08ddec5c7baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfP2usrRUGzQbQPQlFMpb9nRKZRFqA00SZguNreXVgmiavT1rM7wLlko8wvp?=
 =?us-ascii?Q?eAk0GfKempYmSeQgA3yR6PxkFrhLKAcwiBNlKaNYAyE2XDitGIdcQbw+l5U8?=
 =?us-ascii?Q?0Qp+g1iIGVQJc5sD4xtwBJfeWAWAAHhX5+hPT3tPhBj6QbBWCvkGZFZy6gTG?=
 =?us-ascii?Q?Ha63SKL8Kk+5ji98gVlAQyf1ttygeK9FJQL0uv35BXBit+pF0NhMPf3IXxtj?=
 =?us-ascii?Q?k7+CAS+fTmtbpWzRFeqTdgGca482E/usCPbr8ba39Bf7p+Umz/ZIm9AVMT6T?=
 =?us-ascii?Q?oAhsJ4T5GPBDRYkGVGucvGZKRbEdHpavSJ4LS9f1wNRVhknMSwvBV0oJhWti?=
 =?us-ascii?Q?ffUbCqy1qZoMdzvAESwpJ/oEHjbs7W6VR2nzGRMwR0fMD23hzdQrXoNeLFOS?=
 =?us-ascii?Q?Rf1FVMWu7B6HNRBiTfLr3KQyjWbDI0jQo3jdDexJoPiNRhT96FZ4zR0/ykXh?=
 =?us-ascii?Q?YwABXWxvDq5faSN771ciZIScmuhug+3gEN/S1I2HjQgxLBxecyy+5X56KXGb?=
 =?us-ascii?Q?t2043E1lUVt5fyF8mDrDY+xb/3x7/vzccA2E7UEZdT6pxgthixJrJA5gpe7h?=
 =?us-ascii?Q?ZyeWq7nAQQrtzW2M/J0jshdho9FGSCrjvjOPt/JCdz6WV47bcEJVi9KZnlwm?=
 =?us-ascii?Q?gWWKRDuxsUpP+MsYMzoVdhjzkU2Rpiapptz96FXIVTwbu2c8H7tV7sFeHCn0?=
 =?us-ascii?Q?nkgAfzoc1Iho6MzAyleJuLstBNx4jEoPYxMrbiwqSF1ftYrlrbZQ2HrMpDwU?=
 =?us-ascii?Q?U0agq8Kt//0/6cB/O9tQzjIBwQqsFf6cBP5JLBiBj9ZdYLc6N0S6eT2A0Y1N?=
 =?us-ascii?Q?yADP+N5NpkOy+a/xNPXZYCwzfzFgv7UvQH9nHK6iF/b/OZSxfSNcQ8p6cKkm?=
 =?us-ascii?Q?uEXDnLCOTRVpPufIseK7z251y/T/OW+SiR6AiAxaE4iVT3+IIJ/oP+EeIzhw?=
 =?us-ascii?Q?3rnpAzHZgIq8WVHkS6s2pKSmqIVnnIF1owm8MolxccG9RvshwmsVEH0jySfA?=
 =?us-ascii?Q?zl0iYQIuHVl+4LHpBIbQ8QpOAkBhIgCKw3V2aZ6f9Qepyltax1GkriSBF6L4?=
 =?us-ascii?Q?Hq8iGftExe6ShOAUqSBtg/zZ8tC43zj3FjYWQyLPEWkoilciTsadUR+SBixD?=
 =?us-ascii?Q?VeHZqDKNjGrcjYXMwaO4eaXwypBARElewbzgnpRdrw7LbH4DKf59R7DNnUtR?=
 =?us-ascii?Q?YpM2L0aYdF9Ota0u6yM0cNYjXAEdT+cZTosJoEbwgN0AyKAPMF/YXpuj6KGV?=
 =?us-ascii?Q?JdlAKMkJ4Gi2Ws43EEVji3TVhyTAaKzzr2UKZsTRwW2IexYg6Q1hv369phZk?=
 =?us-ascii?Q?n23yRBMLp2kXfa2cujFiXBDPKPUatFa3bQxd/IatnP86+hICqu931iiIDVk/?=
 =?us-ascii?Q?/Q2L6yaFU/uBwjOpVouVcq2H3d0BI4rK9p9ylx7qhWmW5AJ8yHW0XBnl1Sch?=
 =?us-ascii?Q?/0Z2Zb6n8D8HKQ6KDARuWXelBtiTIQVs6rAMuRM697g8aU1uVhsLag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB7330.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZV2dkX+dwm0Z8Sw18mGt/gieWdyAzoh+Q29l5pc3rogEtCLi5e/DjwOwyzKy?=
 =?us-ascii?Q?VGpvrhcSAucXj3IRS3/LVVwWOv+KLj6bmqLGywTderYixxv6pWIhfKMLYRrj?=
 =?us-ascii?Q?5hcoJzQLiiNAy46goKiiJCXhvLyxOiXxTJ9uOJODhhgXN4ATR7NiaLB+66RA?=
 =?us-ascii?Q?qkey1QTsdWUswsUQI7SZH07yN9JHqBwbeeGafroITnDxm4mlI/dMZysBI2fq?=
 =?us-ascii?Q?aDIJ7th96QQhNBiIJ0hiIeucCFcgwzqhjrWTOGO67RoPzgQJgn2iN91cTPVa?=
 =?us-ascii?Q?sStUKCWDBOgbXpTm1ObysPr0RrgnP4awSBwu+NkMU+WVF8XzzGJ4J+CD1hUS?=
 =?us-ascii?Q?gpu9umuR9GFBloeMPA22GQbJ2W918OkHitmnk/ilnBvspbqPzvZ3OHtkEtlC?=
 =?us-ascii?Q?ibJ9iXZKcpwqtOES1UnLLkAc72MUNrEYaDI2mHQYW41r7syQUeAxpH0qImcb?=
 =?us-ascii?Q?CpNFU0ZHdiouMmEC80XACo4ZL8/dJaFYkegU1L3+coqsA8yNsDFKDLVYWpuK?=
 =?us-ascii?Q?RhA0ovx24fpY3iQ75mDVlWH2MlXK3OFplgyVmrhhTn/+R+fekPWe/1OdozVo?=
 =?us-ascii?Q?2fR4yRn1W9mfclOZJrCq3qDm6GkjL5OOuVjfkC1lMWcbX+WSIcr6yZxZeG4Y?=
 =?us-ascii?Q?ts9P7VwwA9EerbAQyKdm26ExpLEwmxyl5RHz6eQ0u2jNByRRmwawXmeERb1r?=
 =?us-ascii?Q?OvG8PzYo/4A5IQE/5KLebKRFkM/chaXgfQbGf1oBwImsRF28l2O32Mx7LqgH?=
 =?us-ascii?Q?EPBous8OgvEe5c4u5mCUyPVVIiwaisvxeqz9RG7hzMR7HOmnsRpJYKhvsgIw?=
 =?us-ascii?Q?hcf75c1Iihi8cL2ul8W1uGjNReSdIqTuZsXFfm5wEA5EG8WhMvOJ+8OBMtfm?=
 =?us-ascii?Q?FOTrkmra9tm6Sf0quz49BTq0SWRJF/47bNYZsY1ZSgRR4+iOfNsW4yTqJOlQ?=
 =?us-ascii?Q?eoYolFd0R0KGTdcFLrQhMmfJSWfKO6Rdrehge3x9KcrfEFMostJucfu0KHsQ?=
 =?us-ascii?Q?9C15F6kAnUYWPZ4aubxCVDtNgtdQbwta4GpoBKBoR2FPlDfzUCHTfvjTxxsX?=
 =?us-ascii?Q?40gPw15f/+nyN4BT8Zox3noPetp3oMDm3q2wXl5L4XZjm3360aSu/LPPCY8S?=
 =?us-ascii?Q?uFoYe/CzyjS8EtpreDmIHFJgTWoST2BixHAlrPDCNxtdSGx2OjHmIbvCZeX0?=
 =?us-ascii?Q?0X0dY/GG7NakCETUGIMy8Fp8vvUZJechpTnFfJ/H6iqNvaFNQ3LgPWCXYT2L?=
 =?us-ascii?Q?IdfWJRgAnICvO0a1mNMEgOScLxgpl06Z1PPtmOXiblfOD6H8ulkX0NK82jID?=
 =?us-ascii?Q?dVXVSoF1w5cg8cqwGIh0iFrwg4dO+jTdmR9M2fdvJNAnuz4OyCvKhlWt2Nh0?=
 =?us-ascii?Q?Oav0t0JH2OP+fWY3ene2QQCtdW+4Niy8TRuojNDVJTTe8RfolLY9qyRYMSO/?=
 =?us-ascii?Q?nob8AS/Cu5K1xMkHHE/AcQZw/cpPJDYKrZTBLq9bhS/s8qSs1g2kNTh1OBeA?=
 =?us-ascii?Q?eYJONtWZPhAxUcnT9SnpzBbGVAbi3PKm9G7QkO/JiNfmNDh7bodAHI+171U9?=
 =?us-ascii?Q?aBz/slMFgQinnxkuT18iVPBg+iTcr3vricJjpibu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f887f6-47ff-46a7-6c21-08ddec5c7baf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB7330.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:13:31.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d03RVGeyqR46pAVJAno3G/eW/NYjD6WlANvFRg5BnIhfnXlXKsbBn70UAsSkdMK7RHetr9RZwCnHvUUKNnmZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5518

Remove redundant condition checks and replace else if with else.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/tty/hvc/hvc_console.c   | 2 +-
 drivers/tty/serial/msm_serial.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index cd1f657f782d..fffc30b9ea54 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -184,7 +184,7 @@ static void hvc_console_print(struct console *co, const char *b,
 					hvc_console_flush(cons_ops[index],
 						      vtermnos[index]);
 				}
-			} else if (r > 0) {
+			} else {
 				i -= r;
 				if (i > 0)
 					memmove(c, c+r, i);
diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3449945493ce..2e999cb9c974 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1102,7 +1102,7 @@ msm_find_best_baud(struct uart_port *port, unsigned int baud,
 
 			if (result == baud)
 				break;
-		} else if (entry->divisor > divisor) {
+		} else {
 			old = target;
 			target = clk_round_rate(msm_port->clk, old + 1);
 			/*
-- 
2.34.1


