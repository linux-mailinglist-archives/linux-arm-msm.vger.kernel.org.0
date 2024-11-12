Return-Path: <linux-arm-msm+bounces-37554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED59C4FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2BC0B2619A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED9320C460;
	Tue, 12 Nov 2024 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="eh31LID1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020123.outbound.protection.outlook.com [52.101.128.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE920B215;
	Tue, 12 Nov 2024 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397280; cv=fail; b=Si6C6rfYSKwNcntBh+banCR18pSqmnG+CALeBKDQcf+olOcDhCIGnMJYkoyx8kyjgmlvIzXE7KsDsw+xlU7oAeuY2U8GgEWD6Ays/O1Pz+POhwwFT7OrQdr5DGRRBXDAdBxHxYWdIY6PlM4EBnl74Ytjo355l9Kz0xVNH7lvayQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397280; c=relaxed/simple;
	bh=PU2hVn8HfAWLeBYiyzaS3dRCPYyUhdNHxUJN4WXjAzw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SqyeGFRPSe8EPWVn8fHZoiS7YuUxYW6ctSp4UOHykXo+yJAMuy6PKHY62Bw66lxsaVse4fFSyaJFJ9X7DybxX9X42P8L7HEvstmF4eJrqv//L+wEdSx241j4wlxhf0QD43iVSp7dbjh+2crLgaNeDWdB0gp0RJ3r3BXubG9ekHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=eh31LID1; arc=fail smtp.client-ip=52.101.128.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYpJ7nf3Om1mfuM1gNBa7ylAW8lxofFXT3sF5GR79jmCMfDLrkmuzdOSNSuAO4txIn4Y6pjnPbwt7ScC5yujI63vP4+8Hg4ocKR6d3rLHtb826HvTb7qQsBWY/FnPAU8drQ25xCUWRZIBR4U01tESlX8XnGz4E1eb0hqr7mE1LWa3yAlelTC22FsifzBgCdBuKtzgL4NH82rQuTlQQ3Cl10FRbHEqqkZUFyN1R51OL8FGN3lXO1vPQN1nRULHUXg6Q89DFAmeA3G+ijreTErlOJmyA5XIupI6GOoKw+gkQhWvP6RgyFaaM5E2deHAMK4uRyg4G6ss5LH3VLbInttxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1PNAq20BwcmAm+sMAk0h8wLMRotf1HexizWuHwhC0A=;
 b=fC5N64fESZY0/xvnBD3ZHdOcSvjOlBofw+hgvHGoLsVS1WfwBTvaxYA0WtVF53pnciO13glH1BN889/R0OkL2VzBAogAGYuhKX94D4rqWJMZbwA+I+MQtSdJ/tu+PcLZLR4hVoCVkDAKW/zXPUzSOXkWTCSQMtIelMKuV77E/CB5g8L37WI59XzIUhWhGRmlHTEUzgZO856qg+3bPVtXBHIBsATJWZCzCMN0EobQ2pqrtzZ5zJSk8GGFdllzyfVlGi4EuVNHHotXZW6GJ1ii1O0h2qEWFypyVoMK3RW0noueKrOMJN5A4S0bxsEBO++pUN8ab1jAvvgij5mZ8pf8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1PNAq20BwcmAm+sMAk0h8wLMRotf1HexizWuHwhC0A=;
 b=eh31LID1abadUMZLIaUkBmWeASmCO6EAoO3n+eVx5ZQPS4WOhB4mCAEByYYAu4okJzah3Kcnwjlt3clrZodMFDQGJvJKCGMoEkIigF1GL9v7RzlMdT19UOdBKlTXdsDicPcOrdJggF+mZMqRzngdHtuxslM8nO8uRRqcPBJoSWhPfzZ6ip16ZuXO5uhozT+s8bRLdFP0paJ94f7v/A41LJ8FAkbZSobYO8Rvz5o0IjMkibEBXkYyugYeZKhVPU9cVU76oGz6AGQtmP2ojOjIg8Cyq55PJ6gY8rylJf4GsyUOJh1hCGWNHcHbc8Q41zctzc7SSTObe5Lq3AVTJIZu4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEZPR06MB7059.apcprd06.prod.outlook.com
 (2603:1096:101:1ef::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 12 Nov
 2024 07:41:09 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8137.018; Tue, 12 Nov 2024
 07:41:09 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	avrac@freebox.fr
Cc: sean@poorly.run,
	marijn.suijten@somainline.org,
	jani.nikula@intel.com,
	mgonzalez@freebox.fr,
	rex.nie@jaguarmicro.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com
Subject: [PATCH] drm/msm/hdmi: simplify code in pll_get_integloop_gain
Date: Tue, 12 Nov 2024 15:41:00 +0800
Message-Id: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|SEZPR06MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: d4796e07-7e94-4fb1-f00a-08dd02ed5fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+IKbRsk9sf7anoWdrK1roBx0skPJJBISYVqgBf6p2I8vCgH/2o2yLDsIwK6m?=
 =?us-ascii?Q?db+2rRlCWOvMxM1r8lPmD1Ivfo5ncLyAtwZQriEBc7HCtTPbEJ9SNpCadGcd?=
 =?us-ascii?Q?sjDhUvewuf4EJtWQsm5Ny1hhHA29xkc2CrYkTsr5K1xLX1bBlcm7/kbIcn05?=
 =?us-ascii?Q?cxFTpSdppzhQBBDM5BHHARjr/Xky88IHskosrB1JtCldWxyUNG4lH5ibftO/?=
 =?us-ascii?Q?9mUmLJEod+0RFRM/brfs5ARSLfpjihApVS1eR1/9dhxaEm61Z/riZ57a3DKD?=
 =?us-ascii?Q?k2p7e4evfA5n+sRvkrBXqmuy4cCPd3RDbqFASsGJ9VC9CuCN+oR+RLVA9wEj?=
 =?us-ascii?Q?N1TbFfvykYDA5pmGa5+RXbp/mluwNy8BKzGqppjrFVpu4udsnTm9W94oPZeS?=
 =?us-ascii?Q?s/NgSRJVfhH8cExE9sahaN2Lsuiyn+VgMPk3djazHkPCerdMJ6xW9OH4/wBG?=
 =?us-ascii?Q?4zxG0T6/vp5u4ogcpko1q90CuslD7rj6ttuZF2PR5N4I7QBeyeEXUZ5ZolZM?=
 =?us-ascii?Q?85/hCENuz+nEW9vOLiqve8L+G1us0LVLqSOvatd5rg8Xv0yfIkM7opukTMFN?=
 =?us-ascii?Q?/ksJezCl5y0WnXWwK+S1sJqpA5Lqoi+A/AAzhQByc9B4MY87KsLNv9iqP6O3?=
 =?us-ascii?Q?uiDALbr+8wz7/+tbSCTm1vQv0/AHuzaQeHNvrJbW398RsOQxmNaRevuIySpY?=
 =?us-ascii?Q?IfGW5+eKM/mPypHgCSKZmdzLHE4zAKvoUteLvsmU8PNmV50QNseLM8XV1DEn?=
 =?us-ascii?Q?GlGl4V/n8kDcEq4KH380e8p4EWWPF+JDEnD41YBcQ4/b+H6A24QeoM7Tknzp?=
 =?us-ascii?Q?zGlpYhe9B0HNghaJb7PdUOS+wumfEUuhrcYU12yGlQCOvWGD0/cXXxEJ19KR?=
 =?us-ascii?Q?L58w8q1tE0qwvN/ajCagZpB9xp+MEi85Ocv641Auo7zE+faOc32bstz9tTsw?=
 =?us-ascii?Q?8IFvHqUDGlN88dMLAz4m+nVvoewqASChqjUuA0M0wYo/kXG+OUI0OkO7U1gr?=
 =?us-ascii?Q?JqGGjNMTI1fOvpqZFwo4pw5Yfd7BlI+eGeFsfdhqp2wIACdbnBZuNM4CQvfr?=
 =?us-ascii?Q?lsDRA5FKkK7wpghYxEmUYkrAWp1cHMpOuAGLTZ6Q7NTkhceXKamYkAOcakkS?=
 =?us-ascii?Q?H4vOvRosKVHvluTJZ2cj3VT84NRt/KfmTHYvN0KhJPdqz2WpFNDHht+Y59DS?=
 =?us-ascii?Q?sjlM8WwRxwAY/3Si+HIrDjoMnNv8WVFq4lVmeSzunXdnTeY2McY3pYDC+ydY?=
 =?us-ascii?Q?Sgx9sLt2hqhpaNDVH8vS/wbR3V2W4XVAnVmPhJ89ipmfRGjdQUMj4rLAh11G?=
 =?us-ascii?Q?AsJPLZ0kB7iT6Evft+0AwUpEi7GCb+50v6mC6WYF97Z4mgcIS2FzqSKnbaLq?=
 =?us-ascii?Q?sEVGTQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YYFrNwh/H1Ge2MnIe+LH4yatGXUoLfSr0oSLVbCZjBnlS7649ju5awD07IWU?=
 =?us-ascii?Q?BGh1Dy6xBJL1C27GHfBvrjizx1Q0TgZwxFn4F/hd7v5xNaVIrYfXIt3NmdIe?=
 =?us-ascii?Q?5kR9PbwMrAlzGRpDi1toX3VZneIXBRa03V9SDrSxscmz6N6GVVSIAz4kAr7+?=
 =?us-ascii?Q?jVY/J1k8gZelP8IpdYm1FL9hsxFfGCwAzb8Jb7zPYgmA2NNNJrFSyvIOIkP0?=
 =?us-ascii?Q?7JqCC0reXWw1nWw8t696vcn8wdnsVEMdLkub+TopQCjDMpWK8JlwcrgVLECD?=
 =?us-ascii?Q?LWvs/LUxBBOctRcBei4yREr/41jTDrvXUTule7J5EbdZSRBe8l39u5CR6KKO?=
 =?us-ascii?Q?j9oaIpNRRBtRrdYRN1a4gVywAfLRiBUhkUIj3aqdLIkHPLkBwn5P+Zga0Nul?=
 =?us-ascii?Q?dIXDsmHv99KMCSSNJt+m4SG1A0X0FZV9lxsUmMj+K6mmesJ6Ke/llIEiGlYP?=
 =?us-ascii?Q?qQt6fPvvbB3mmvUqdRK9nuDwZIvzzoCwt/Y5LFpez4w7i7wQGBDK27c17FF8?=
 =?us-ascii?Q?PR6j3NZHtXrOS5aWu/EtMnOVpxr/49GppeTQR5dzZSHZb1FT4jxUd+j/vws3?=
 =?us-ascii?Q?wv/Ub9P2tWJXx5IFtqK5YFNdQeHbXkQ/tbp0B8nDLASdW2Ea+1KJ0ltpq3D3?=
 =?us-ascii?Q?Vt0ufCZHzzEoxOo+AcLKYk8dlGA5Zw3HDvQOYa/+2f6932nyCmoBI37nKLaM?=
 =?us-ascii?Q?1Tiqfh99VbvSa8/YoJhabZYSUNdBbIS+tqqR2k6n+2jtbNk1uwktm0J4JwQX?=
 =?us-ascii?Q?FIyRyhJXjW5+D0U2mCDVoDnpnfidfn9Hj8cwzJjvDvqJa5SiLdTU1EsDDFlx?=
 =?us-ascii?Q?7uBjASl4zWxrATy+GdPUG46z8x+5IuP0OvloHlB8JSIB9ET0eJNP4QK4QJ5P?=
 =?us-ascii?Q?z/+eCvvT0oAHu/XIinVAFqPYfuxxV096z+FSFwVtSlHXx25KGYpa91QK593A?=
 =?us-ascii?Q?opkvEsJqymXNFJvbi+tuaqcJ9nJsvPTxUYVfG9fa3bTqpzm8LINbXWKRuduK?=
 =?us-ascii?Q?1u9mOBfTblw8RNWNFEGLMt2IJtGsGYxafyGHNlVk1uScY9P0tVLRGCdtjwjv?=
 =?us-ascii?Q?86/kCPHKJhZptd1IHHbJcYdtrKrHDZDD3Ipy1FQvF2UEkro/4+aVENmsxFzw?=
 =?us-ascii?Q?BM+pcMHIrpRB+p8VnDX6EhOcMJF/bNQw8BhdUHu2USubz3oEOl+0D0ZegmvP?=
 =?us-ascii?Q?hbi+Eu/uk2opE+ndmtSL7bGga7nGaa4N5eogabLcIuzKPCY5N6ia1pbHHVQS?=
 =?us-ascii?Q?xJM7r5k3bVZVHBH70NaVCFuK+/S/lw9sib6OkAD6PtRu0YGfhlmQny1i/Tus?=
 =?us-ascii?Q?SFKNe638xNCRVJfpzlwJUfvh5HdoQaW+dLluC98ZafNHasdxRjo69OGt9Vas?=
 =?us-ascii?Q?HzrBgxDhHWIkHGu2K7IYWu48Otm/qIGisEisRuFJ5tfJkOlPAv17QAvAbisk?=
 =?us-ascii?Q?uhR6/3a1xrR3Ai7sUdKfrjHs3C/bF1Uzqw65cuHtY1djE+hfYiTguZAo+5DA?=
 =?us-ascii?Q?W4wcz/UfyvlRpwyBBn8r6IdYlxaXXFiMFmZgmQv99u4E1PZjIJdOhoRn/fjP?=
 =?us-ascii?Q?vB6stBlRGonygu2mq+p5Gis11vr17VZUNQXGQc1I?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4796e07-7e94-4fb1-f00a-08dd02ed5fac
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 07:41:09.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBp8wdB1tpPLed6NC20gfBCICcQxHCU9pzJhip4UjNYP0D6CFbhuOET7dfyM3UWF9QuMd5M15Zyi8prV6OT5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7059

In pll_get_integloop_gain(), digclk_divsel=1 or 2, base=63 or 196ULL,
so the base may be 63, 126, 196, 392. The condition base <= 2046
always true.

Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index e6ffaf92d26d..1c4211cfa2a4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -137,7 +137,7 @@ static inline u32 pll_get_integloop_gain(u64 frac_start, u64 bclk, u32 ref_clk,
 
 	base <<= (digclk_divsel == 2 ? 1 : 0);
 
-	return (base <= 2046 ? base : 2046);
+	return base;
 }
 
 static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
-- 
2.17.1


