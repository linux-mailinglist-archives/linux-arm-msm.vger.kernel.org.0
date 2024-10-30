Return-Path: <linux-arm-msm+bounces-36457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D249B6441
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F831C2165D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7349B1EBA16;
	Wed, 30 Oct 2024 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="HPrsMECi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2124.outbound.protection.outlook.com [40.107.117.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FDA1401B;
	Wed, 30 Oct 2024 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295427; cv=fail; b=DgQfabX0Q+VvHg6Rnm9drYYBSFRDgkPh7D9afHhOjI+HUd20Gon3I79xNv9CMJzpHtmDyP7R2kEZYQ1tJLHsO2zcEiWbyAphv+oReS7Ystb8X97Dw0d8d9YRnApWjQZCPp9EHh9VtmD2KMp6jzvMMs0S5t8FezJxkbzAYwPt4RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295427; c=relaxed/simple;
	bh=O/iGRSAorpNwBkDgyIJvjzOaGMMND+sB5MhyqzW5C50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q+vyWuGpLAgw8BudwaPM9Mo+X1K1z2iXBUHrpfOmH1x5sAhyElWdMBDxJ1ewKOhsOca+t+MC8PYzRLfh8NKL1TZnBSmrMZTLRvETMaXadEPnX2XSYKg00Q9pyKuPgAo/WOpi523wTOatZnRAf7AsrRLkqAh7GZTfOgOLqwjcUuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=HPrsMECi; arc=fail smtp.client-ip=40.107.117.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3wVMtmYFdiYJLnK6JD+jCDwmZrSfkwl4n3Zozmuwc1D6uOnSaJ3Ou8q07Fr3VIo530gBr4QvN5KxsV8Icu740RmA0fXJydXCMeRlapEnPgqvaxpjY7utaH78+IkmOjU8zKqdR8USb6bXf6avbarnduHBiZyTpYfM6P9juRWtbKD19aZco+Phvz8wMaEuhAQp7qrFfvMdDcXRs6UW9N4AicQYlfxRiIVsbu7TENGmkGNAS1cGbESAZxfT17TseEQ1GLQU8/h2HucKS/yQB4ysRV3uxhoJdHripXwlaTuJo8kya0Aq0JrH00PbbbqmE1p7+HmqbNXWNsM/ARcHls0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGdU6oCVtdAIYbFXngWI0o7XjMRw4Fe7RE6DymhTqOI=;
 b=BUxq043fhUt2WbHfAX94EfO7rOtv7V8fTauSnSWl7+TIuc5n6pLmMcaP4DcorETYQFEMcGIZL5VHjYrKjcSuiRytYPFwfVN12BBU3Ebevo+xrvcLGV90qsV3aofUQxDvgEzKiiZNukMUYJD6GF0AWXJ2z45mj/aEEh9+3YysaJTJ/FKLZFkHnnUi8RNLmT/SybHnKQubcLGReglnPigd9ca09x4RoIwxOAbDyF90WCwTC2//gKNWfHPzz3fputiuzoh3752gV8xOf+ZYVX2MWxsHjsjyO6TsU9unuulpN3hhFipCwUepoIe/Rno6JKJEDu0AUKWnZYe2N6mEQfpdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGdU6oCVtdAIYbFXngWI0o7XjMRw4Fe7RE6DymhTqOI=;
 b=HPrsMECifgNBbcb7Ovol/s8jcm2pKO4ZT0JngJU/hEh2+cPSKEmZvr99lbXiIvBVbmVPUn8EeR812fv/rVHAZ2nBK8mQwn4wa/gtrVvNpC/dp6pFXfqvD+X3k+aq32CGiSpumHPdGbA6H8bID9jGkLlhqV5pWFG+9FfXihyVK4iuuRJnUtBHy6sX7zaSH3EALb3la1GZvSkwvkpyGta5Omf/Vm0KMsLrY81V5hgvQDDgzolmvgnmo+XEzTyP0JjmfGUWkuB3LpgEqtwuuGZiao3ATiFbV/WOYFd3D5s6pGq/uVeTnOK4xRBqY8Kgm9m141xr/P6x6jzD36pd6N6uEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEZPR06MB6350.apcprd06.prod.outlook.com
 (2603:1096:101:133::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.13; Wed, 30 Oct
 2024 13:36:57 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 13:36:56 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: bryan.odonoghue@linaro.org,
	heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux@roeck-us.net,
	caleb.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com,
	stable@vger.kernel.org,
	Rex Nie <rex.nie@jaguarmicro.com>
Subject: [PATCH v4] usb: typec: qcom-pmic: init value of hdr_len/txbuf_len earlier
Date: Wed, 30 Oct 2024 21:36:32 +0800
Message-Id: <20241030133632.2116-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:15::23) To KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|SEZPR06MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a8d93c-a8e0-47e7-1b42-08dcf8e7ec34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GL0Sqr98YVCeC9VrDZ7L2x89wXlLHI+azPi57UruYwrN2yjPDyliPfbWYZUT?=
 =?us-ascii?Q?BGxWeOJbRJha4JFSIbta4Xloef22MooE7HYfmvl146A7wADgwuLCW4omprSm?=
 =?us-ascii?Q?kOmjZdH+y2X7mTHVFmtMKrkk6pKKaH1woE8au3q0jGkzjdH6b2EfmkQ8/4r4?=
 =?us-ascii?Q?tgsUfrye8T8udDjnquXO74cTVm+AWJt11X68r4oQ1e8LmE8cauxlIXteHMt2?=
 =?us-ascii?Q?kl00xnB99Qv8OEjisp0hiwmCja6+Z/HcWfQYldU9gNXDYpwQWFzNLRALFspg?=
 =?us-ascii?Q?rG+WsLT+Ps+S9JGcHCCZMSVHm2mahiCv78+MR/zYqNX6kwv6JinqU1kaKEe3?=
 =?us-ascii?Q?NIe34qCZXZgLUnoRWAgxmhBMOoOmAB6hyZXf9vaRcyydzm98dBvA79st1Wbr?=
 =?us-ascii?Q?/D1BETaXEFBuELWATWi1h0LjPu1asbyQ/z45Exkv3tumup693L5W/fVkwqR6?=
 =?us-ascii?Q?QjhV9U2NGhHMCbJCioO9+CxVQ2u6jQnhrM8J5I56RZy1jiKM4Mz5W4AhqnFN?=
 =?us-ascii?Q?OdsgFdlzk+NQerFbQc+0323G5/0eo/Pa0C7YJIIOCG+l9QPwYk8G/9AyHPNa?=
 =?us-ascii?Q?JndVGacyqExBhpWbnrUHACGHYcg1pTxTDnMNEhSdwzDx06M+ml+DAmeHUlCl?=
 =?us-ascii?Q?xLCjHikTYJaMHcv4zlA4BgGlbVZQvgPLtN9kMQ3V9h2xHibBKEizbvmxf6TT?=
 =?us-ascii?Q?0oeZGbc30sO4r7ZIpVMs1MauYNONaKShhAN39dXaHWJTYYRo+O+mB2yu6J5k?=
 =?us-ascii?Q?KwvSZXju24vdPeq+XUGdq06pwBr+Q+stSUYcu16M6j7ZY8tMrjT1wTCB1lIa?=
 =?us-ascii?Q?YC9ubvy93RomWnpweI8xXh/rNPNQG/08nd333X8op77HUdEcNURWG67T+daY?=
 =?us-ascii?Q?FAX+4QM9cW5hUS0MvJPp3NqIlKAZgOp91xT2ciGZ1Gr+NZpGOKxJe4dptmIz?=
 =?us-ascii?Q?uIJFh92FpeKlYkXajirKWvb1NuAPP7RjUjZmvyGxg+FrWsazjc/+RK5L26or?=
 =?us-ascii?Q?zRV7g6BPhtsbNk7h13OqHAjIA4yZWR4Ddtj2oktPkArTgkCH8eeayLmU/oiW?=
 =?us-ascii?Q?RAD+BtW8Fcz1RXs9a654FI7hTwnqPQHC664/zB2TEUHngT4Orn/HvCD9Xi75?=
 =?us-ascii?Q?wHX9h0SHsB34eEz4f0zYozDMErCSv8FYPvmGRCWxrWOHlVjBVM26tmS7lTig?=
 =?us-ascii?Q?rpfrXOXsMryBao2NTAZbgGCMR2htmWjgVmYlbKUJJYYchKxDyrrPF04uDkwL?=
 =?us-ascii?Q?N1Z4MORoDYX0hIpYzl8asiPdENeXTM4fSBS/8kffNO1sA98Phi8sL9Uy/CFs?=
 =?us-ascii?Q?Q7AWZi5AWrp2jNwNU7xNMq/zzCx4KURdihCwLCH6Hvj0phFpiPz54Zvj3fXL?=
 =?us-ascii?Q?Dj99juU6BdRh3lWgLsM9uThqf8IR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KFHsE9+dFxIofzvC7tm17VuWU4Faw22lEZf5Ge+YIP1IbtQ6vYrUfvMmL+N6?=
 =?us-ascii?Q?hjSpJio65h6yKh1x+xnXYovJU6QvvTNU/q/yx0ckaYIdhaslBUFwrBZtP9aC?=
 =?us-ascii?Q?2ijt60Z3BqnIW8T/NQ1Pe9WC+UTHjnVJRR+dUuaD2o9lgY1kqA5YOsB+GHDd?=
 =?us-ascii?Q?n2Hh6NtVb0d1wI9POsgA/QhHvSQ4uB6DZXQBxpNE4oIiVcwdKGzkE2EUU/Jx?=
 =?us-ascii?Q?8QaEEx5nNnRyz78hlAEebfT9k0GUvq1EoO9LuDCqJ7j4oHbW2E6tzDnsaZ+j?=
 =?us-ascii?Q?P+r+sXyVIz814FvY/zUGmqD2+2WxJd11ah686/C3MF2vxRfGElqZYPrXEsFB?=
 =?us-ascii?Q?Kfd41OclCPhEOqkfx7UbJCEJ3xlcEB1xyDAOUXZrRqScJ1nY2HJi8S8dPB/l?=
 =?us-ascii?Q?QdjABP+HgJIaW7wSKbKi8z+ABMqcq8kMPqWyZZblCd1yUMals48QIf1yIiDn?=
 =?us-ascii?Q?s3XJ3DFLCtNSt9tppp6nAZrHt04jBtU8QVIyK/kCCA1NsbQrZqYhOfRNXnGI?=
 =?us-ascii?Q?SFHG2Wd/Kda+RlCQFY2W68qkKcaR8J4ym2SWi0u3ck2jtDRxkaFHQv3mhTMU?=
 =?us-ascii?Q?RcvyX9r0JBscUHRew/b/CUJ6upOfbPgchMUOKixkFDyzv/NJww0HNIE6DuVS?=
 =?us-ascii?Q?oego/WIZbrewu4U87dKWXd0pNQXwFyg/rCZx3X3AL4wNCeCyMCCLL6lt4VGF?=
 =?us-ascii?Q?kBa6p0CdknhD2FhJQSfBuMDAyfEuK4FmBQT4U1b0P91/gC33eisTbmxs12vP?=
 =?us-ascii?Q?QJ+qOkCN/sg3HFpnH81w9ZPUaWihWs1EqKOQHoBhxGUkpeQn7cgQMQA4ogFc?=
 =?us-ascii?Q?TxSMQ5Ks4lOrjdvzuqpmCzDU6bmQKmWFEHT++QrmK1Wv6g+0r7SrgVUg01d2?=
 =?us-ascii?Q?onJwDqmUNdvcwTG7GnoL39xJA3SwH3G3Cef1pxBZYdY+6UqNc/zpeVMN/7lH?=
 =?us-ascii?Q?nIIB9s9ZPGas1grB9GvVgpyx8R/TnbGZYwW+ux9PNOcInWLBhk2br6VhsgxC?=
 =?us-ascii?Q?7q8FmITOmDyjlB5eZITRzhiv60x/Y7y+kNO5NvZQiKeCw9yeENUDN6bP8U1D?=
 =?us-ascii?Q?QRVoBZotRYsleHrqv4/37r9yQPUu64Fe8tc7I2lLJAx2yaMvo9jRNfj2ERnz?=
 =?us-ascii?Q?3LzXIM2iA6jAYb7vmULiYYnr3QNW39SZknbLyeaEjteGgFTpHv/KBYWIt7BH?=
 =?us-ascii?Q?LZzrCXmTDOEsHH9S5/EBmtb7YtgiIPiGO5ZfmTi/iay58Jw8uuDxXRORlrEK?=
 =?us-ascii?Q?5ZyNSS5P/XlWAroqyr4ApWKGAu8UU/BkniSAioxl1yfIVdUl80yrY/KahX9I?=
 =?us-ascii?Q?QYM0NXjEhHhdT8VM4niP8/VU7gzc78T6iIsJJnPTF/PbJ2EfvWlyuSLU6dxp?=
 =?us-ascii?Q?QMaLoXcMAM3FJd5EEeGsMvA8Kkqwot0wwA5TyaLwFT+WeCBa2HtF6Te4WCZO?=
 =?us-ascii?Q?JypvbuWOxctZDWVCfPjW4MRzbTKYqWVU+x/7Qbt9beFDY9g9hZR12rCoesu9?=
 =?us-ascii?Q?dx68Ih57bC67aFNx8HOmug0IiDFMTUQYCdmrfq1I5CWfZqywLFhUQ8QW5dHO?=
 =?us-ascii?Q?bZoNBequwA0zFq9lsCaJyqTDYRZgb+/keoz/62Rg7OkqYjJQQkoM9cNLdk5X?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a8d93c-a8e0-47e7-1b42-08dcf8e7ec34
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 13:36:56.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V48+ydHfxUpYxtUNxKrNxsFmgOUS7yaxHf6nZBfBOyOxzR6VW5Wykx/6xj4q8j05OaX+Y0GoQ65lwEmFdjs6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6350

If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
txbuf_len are uninitialized. This commit stops to print uninitialized
value and misleading/false data.

Cc: stable@vger.kernel.org
Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
V2 -> V3:
- add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
- Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
V1 -> V2:
- keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
- Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 5b7f52b74a40..726423684bae 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 
 	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
 
+	hdr_len = sizeof(msg->header);
+	txbuf_len = pd_header_cnt_le(msg->header) * 4;
+	txsize_len = hdr_len + txbuf_len - 1;
+
 	ret = regmap_read(pmic_typec_pdphy->regmap,
 			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
 			  &val);
@@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 	if (ret)
 		goto done;
 
-	hdr_len = sizeof(msg->header);
-	txbuf_len = pd_header_cnt_le(msg->header) * 4;
-	txsize_len = hdr_len + txbuf_len - 1;
-
 	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
 	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
 				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
-- 
2.17.1


