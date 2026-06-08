Return-Path: <linux-arm-msm+bounces-111825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdDDEHybJmqfZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:37:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B26552F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:37:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=Q4B+ikqV;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=G497XHj7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4065E304463A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2103C13EF;
	Mon,  8 Jun 2026 10:28:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7E3BF684;
	Mon,  8 Jun 2026 10:28:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914528; cv=fail; b=hOi6y9sqZt0gbbVIDGbEl2hxlOBrBSySI8xT+25fjtWv00TniN0Z7LaKyzjR/18IWy+S5BaeGEoRdhoOoRLAnSbL1Mz4mpW8+ItBXBeIVUNYCgSxHvCOGz7+brFYY8S0DWYbbe7peuCIiDp3d4qLex+4OWiHsdn5ztJhUk67Sn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914528; c=relaxed/simple;
	bh=t72LMO0ldtm/rsRK7kb9dKB21U8bU/E5KdNhqbzUv6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qj+j1FjUpdWU+Szl6LGWMd2xwoTnvrH1WrxjJ75SoJ9zf3zAmelXjsuEXaEZkc2O7B7XRzBIK1Df7ZVNf3nuJqbxHBmyTP/MIq1TmiZIu4uoF0EkSbVISrcWF5oKaCWca15RaHamMm8i9+t/CEh6dzG9HruU7eShkassYB3J9OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q4B+ikqV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G497XHj7; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584NI001807595;
	Mon, 8 Jun 2026 05:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YljO7TUVuP9esa82
	WBXl56zsXG9BQUMfE616z0Z3Xk8=; b=Q4B+ikqVLxXp1wzZHjrpJ2dznMgBm648
	GkugBaAPHMcM95Vx2Bb+/zAX/ezMZfxX9ngR5OzbzkZr7lPlpR4YEaiwV2XJ+/y7
	yJt++dgRjcKKL+DDzwiJUZu5apxtQwti/WOrpI1Lww+mcjm1+/zJC8qJ4NX0NrjK
	wLGN6tjOKBNlPJ593vMB/zpBaWs3RRnlxZesysPXGh6OueoB4o6eDmstUmcrl8zC
	aztql40jqNPLsPbUqS152+pcCNCcCjyNRXJwFM/zmDhCn13HohXSOpt2zV70cZkY
	RbCmYwivYQPV/2dkYRNRUzohu13ZpFd1A4Esn2QGyGSiBjmoZB3+8g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020125.outbound.protection.outlook.com [52.101.46.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyga9f4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtAuI/zyH4DwtnZuo8+oz+HOeDeGeLdW6HpMFje72bv3F+Cowa60t8DzHVx7LbuIYlV/NiWpELT9ZrUVFOMUSo8lLL54hhGfm7XtxPPEhmFCb2onKGEdVpTNXqScAhE189ncwHUH90ro9UqB0Eq/a/WBUyk6dETvH9uZWPM4xzEAEs8aeEJ22e+BwwIvPLRw8ZAKLiNzF0s3HFwQSWoRf2yvMtzPD+jh9b9CvSX3IXc8pERnatgnoECg9gr2TzFVEZTNZ5VEDb6vUSNSaqtBEoXByPvTfYW2idA0+vzWMk98WyRs9DKDkQqq/lT4nxFwpJZKjrt0zEIGKkkbRan+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YljO7TUVuP9esa82WBXl56zsXG9BQUMfE616z0Z3Xk8=;
 b=l51qhhckG4VIXtg+GA9RUloOUUYSt40waH5lMTQ6fAbMTq1QkMMAUZCOt+1+6wytvo17MkPUt3h2FRvmZkOCc93+diKPhv/fws6ShNwUkfAeaQnf2kOStTZbwjgOPtkIprccprmbd5WAdL5QMsuI5N/8R5lJ6HfFGN785wZhgtrhgrSLCVYxfgEY4erAzP8ggt0wc1hnouXgY57hVfZ3qRdCQFzYsRdvhWFZsvPiV1t9EQrKwooF7CKbQBGSYfHiRU/VI424RHFaI9HWordeCT3pF0dog3ikR2FxtBu/P5+SB0tWed6IfJbdJdiq+gM1drq/fyBrHHBFErBbAwgrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YljO7TUVuP9esa82WBXl56zsXG9BQUMfE616z0Z3Xk8=;
 b=G497XHj729Z/7B0NeRcFRwVfAZRFMH6zFvjShRuq0uFcfZf/r/u1hdI4ws3A03X+NXlb6s+IPr++kc6A/bsQs3p1xoB6L2GL+/UCzek5ZwWle82KfrikV7XBBVL2m3sR1CjLtm8t4xtwJkAk9z130id0fjmEKDP+EprYRl5sPLw=
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by SA1PR19MB8970.namprd19.prod.outlook.com (2603:10b6:806:458::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:27:21 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::a6) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Mon, 8
 Jun 2026 10:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D6574406540;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A96CE82024A;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
Date: Mon,  8 Jun 2026 11:27:04 +0100
Message-ID: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SA1PR19MB8970:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49cf5850-fee3-43b9-d265-08dec5488584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|36860700016|82310400026|11063799006|56012099006|18002099003|16102099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	wEu1GUIQKN3KQlm2mhICZpsVtdl5VqPrwr0e4dWlXbpB54BqtQm64W3Usr6EZ75I/jPbVbnzUYOzEFGDEEqsEHtr8uXVFr+EFVS+8psjXY8uGNgc+4hb67rVgmF88WUDA+AcspfX5mjj4XjQT7ofES8L5kw+xofRXXb0/wqYFLbcwUjR10TXTBchNO8KVo2SqXPjJtdxZRkdXuWY56WpyztKaxBtNkg2yQCWIwXv6LfR7xqQaezidZCSTMWQDTZXYp7qzZOOIPAZUiC64NREu6zcO91veow83lyZaA4xEHv5+ah6QUEl8EO2GUyNVEBifkJLYuYooBt53Gg7ERyY/F73Lls6MAvnPicOemJl1xkkQmWegYMkj2cau6HCYc3FAAtz9C6Fek8iWCc7DjU8eTrssOCZ6HwnuvqhNTMW3UyKHhU87Yxvt4QksxqciILKkEwykfi2Qbj4jFbZJd176vtYlq8JPExrmF50lxjpzjkwA42ll9HGeZGUdNu0bbmLwbt3juoeW74bibw3B+QVVAYyxX6WVbuYTc/FJ1HESvEt7hz98LTAWAUzpTNGYPT3PIDucwGE3BuzQYVVaz5a5KKiDdaR0Gl1iWsGWhZbz3ZxgpTFIUMVTE4Vic21V4taTzlh1N2PwtSK8S/efPpUk9OHCZpNP398B2r/I+kxMR2pZKIKkTw/JE4E9EmujhICNzp1flBQQp9RX8ryaxWy3PRYCuEgXcl/K+uUKIQyPgw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(18002099003)(16102099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mw0OhRUxAnwRouGwH1o8BZAiCOvHGAHCyvUGIV24+xFNRfr7Nvoxz9+vRMu3rdBXX1dmCW0/gO9ZVbNCwgIfR/+vCHSA8V1lM5QyY18NSmitqeM3WZEvEg/Uw+b9YS6M6l9o33MNE0JIZovMZ/0wmpvVdjZM/NJZaLgV7XsIdcEp2b6Gcqn+WieoGyjEx1kSX3uqCjXe0mr0dfscczNrUATSD0E2hb6eXItO3O1RckCK3u+z34zPWdwYIEnK07iDo8IwH+k9B8qoK96py2srYnA/ZSkJtNg7D7Lm1BNEPR9Hxw40nUFCdw8LGr0Vjf2IcMT/2A9YhwOsSj8a1L5z0g7Xrgc5JicrKxfgb+D5fAKNF+EpUTXLhi53tp07mJtL1T0KJplVUKfu7+NEsMLFYChMB8dDrVI7j1uPSmmgbFeF/0kCIkIm6Z988rLbDLgJ
X-Exchange-RoutingPolicyChecked:
	RrQp+nQMLaZ4Zd09hPfmroP8Kt8AEgpwvH+nLiGdg1vLljVp/JgcimmpaOGza1WCbLLoErLaBWA6LYriLtv0GMN8TGB4+nyFuTezs+eQugFLhsBkH4FqxL77TMuagIWBXHvKrUJKtr+XU9U2slU9M3CxAuP9RIo0ds8Ix8dO0nJU4+3KtG2R9fzwJVsE7AoaTNj6orIWVwgElWxlOBS4OKQD8XZOKy2bTaoa7LT3aGN2lozl7pqqEhgvfr1IKf0lKVvfjKQUfgPZQETdoZpQF72LQFCbClhcnrb66wTdLZWe+yEay+LKf5oO747sqmOE/g8SXLn2RPe5fxu0K9NbQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:19.8341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cf5850-fee3-43b9-d265-08dec5488584
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8970
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a26990f cx=c_pps
 a=a9mBi0/pkv8X/C+V2IbyUQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=maTja8o1zyEAkiTaWhoA:9
X-Proofpoint-GUID: akKl-M-_2Sn9y1P9H4Em04D2kzplKQE8
X-Proofpoint-ORIG-GUID: akKl-M-_2Sn9y1P9H4Em04D2kzplKQE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfX59OhiBemvZZI
 by5hNFMmy5dWQgmvuvKzwUvItAUoV2DeNnKxXs9RW7qlz1RuFeu0gmaVCrUWxalfcTbtfa4Du14
 9H8zPpZczgrvEwVdWTiTzB8K34LQrVZbXGiLNuZkolX4X0jnbh00OG1GXa3n9AM+O972l6Xxkfo
 dLZgIzIZNbm3U+igOiy1XpCg7F3c+k6u5GfyWq4UxybWLYvvJG8c3BAfahK7hzb6ekT6YAvAOA5
 aopeB4J/E6YrSqgt/u4RQX2V2aPLksPh2Xq7qFnfqE5zP1J7NX8ZoM/w4WoL36viKNWG4S5Lkda
 8rXPEg+r1Kp8ECgnRDO1nOPu3DXqsE/0gpyV90FixWpfbloXXq4ZRA3uBVTMh+DjgN8rWdjI5Di
 asq68/lgvT0SZv2xd0I7wqhavY4EeebjhuO87d7vM1Uf+NiDmKyMlkSMmjt/YmJYOMgfWav20an
 ZSeG6+6SM+AIJvjS92Q==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 723B26552F0

The patch series in [1] added a new helper to remove common boiler plate
waiting for a device to enumerate on SoundWire, however, many devices
also wait for enumeration during probe. This series updates things to be
suitable such that we can call the same helper at probe time when the
unattach_request is not valid.

There is one final step outstanding which is to add a core helper
that waits for a device to drop off the bus. This is not include
in this series and should be the last step of this process.

Thanks,
Charles

[1] https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/

Changes since v1:
 - Completely remove the attached flag from cs42l43

Changes since v2:
 - Corrected some spelling mistakes

Charles Keepax (10):
  soundwire: Always wait for initialisation of unattached devices
  ASoC: wsa881x: Use new SoundWire enumeration helper
  mfd: cs42l43: Use new SoundWire enumeration helper
  ASoC: rt5682: Use new SoundWire enumeration helper
  ASoC: pm4125: Use new SoundWire enumeration helper
  ASoC: wcd937x: Use new SoundWire enumeration helper
  ASoC: wcd938x: Use new SoundWire enumeration helper
  ASoC: wcd939x: Use new SoundWire enumeration helper
  ASoC: SDCA: Use new SoundWire enumeration helper
  ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration

 drivers/mfd/cs42l43-i2c.c      |  2 --
 drivers/mfd/cs42l43-sdw.c      |  7 -----
 drivers/mfd/cs42l43.c          | 15 ++++------
 drivers/soundwire/bus.c        |  3 --
 include/linux/mfd/cs42l43.h    |  2 --
 sound/soc/codecs/cs35l56-sdw.c | 47 +++++++-----------------------
 sound/soc/codecs/cs35l56.h     |  1 -
 sound/soc/codecs/pm4125.c      | 11 ++-----
 sound/soc/codecs/rt5682.c      | 14 +++------
 sound/soc/codecs/wcd937x.c     | 11 ++-----
 sound/soc/codecs/wcd938x.c     | 11 ++-----
 sound/soc/codecs/wcd939x.c     | 11 ++-----
 sound/soc/codecs/wsa881x.c     | 10 +++----
 sound/soc/sdca/sdca_class.c    | 53 ++++------------------------------
 sound/soc/sdca/sdca_class.h    |  3 --
 15 files changed, 41 insertions(+), 160 deletions(-)

-- 
2.47.3


