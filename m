Return-Path: <linux-arm-msm+bounces-111014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJMBMGJBIGpSzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F640638E05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=hhTykutY;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=qgdB0XrQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEBB5312AF87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062613DB32F;
	Wed,  3 Jun 2026 14:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB993B995E;
	Wed,  3 Jun 2026 14:45:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497948; cv=fail; b=RrSsHmbtvMvgrFD3twiZrfAOXsNqb/ivd3WTa2S4IbW/W2KvVZB/bghYlfjNTO6XbUeLyN7RcLLFuSwm5aeytREvxqp9hsA+GQNE66+1/Xp/zhq9M6ylI24JlvEK4xNWmbfKI1uJYAgLYH/NWI1FBGhkXRkbXLA/P52hhN3EmqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497948; c=relaxed/simple;
	bh=6M1Y/aRpeEb3qALn7R/lZmqMrri6AYCx4MbvCasPzRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnEBidYy0cDFv+Jwv+fGtb/QH3d0zS8DraMGp3VY2jKvHaxxUSVIOYZC8HKG/MIPzTGJlweF4s9sExRlB6FTMMKeVsYZyXS0HVE2lnAoSn+UvQ3u4aJfs6C3AneS/zbHK+F3o5xKDHV/mItAZT4J3nPxxm/TE9H4itPWBjng0ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hhTykutY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qgdB0XrQ; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESr2p1297173;
	Wed, 3 Jun 2026 09:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=p3kwYGCtqhyefa3TTIcUbbm74mIrd5JOHXM/d9JiNe0=; b=
	hhTykutYw9xrkyQl7QVVxNhaienBd91SaVMF5m91IPQjVwDR9TXSggr1+i7F3Y1C
	L99B5HFy5cbNY4teLIS4Jm9KapEqhLMPlEGvOPFhW8ueeEqjRMmTkmJrERrrAr/1
	F+0m9SOaUQ0dNHdlvZBRUS/oER4c/hpyIZ7BLihzHYQCyTTXqWtAhp0b3NaHhEv2
	42X+78kAGxFupdIau8PUQTRPDLYyTCPeC3WlPEEGaku20ErZ9m/6m/O6fHAju+3I
	7h2GkWPeS/pGBomYXL4CsrJ3TFXsJ9QjTfUSoXmHv6mwyY+zh4sV1u3oKtPy1s7U
	fqCfiSLJKsU3WvWkQRuR5w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023122.outbound.protection.outlook.com [40.107.201.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa1695k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2puLa8bZ7X+vn/3h6qnkxtlI8z/9T+V2KqD2r611Ke65NIAHzTHKMkA0NOVrJGyNmf3qxwZk++coL2OmThSWqTx4N2KDVVf7xtYNqT5R1dDQgKlCtkuTxMr1iKFcdahOvt5ll+GebQHIA6DMXkTMYiyMZUV3mx3vyXTcqCYdOPODS1ZnXrY/v99kCjXGziUtNoTC740xyylbWHMJHnCumvGLzvGyph2/SaB0Y8306AWvo6K977eOkKH3P3+R/oiCD895rLUI7c7iwe+UkFP4GGVyRVRKBFyJQ0AUv48fdf7l6p48wJ5Mw8Q7+wHg5jmLTXwQJ6OIg4SfdDH2ADhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3kwYGCtqhyefa3TTIcUbbm74mIrd5JOHXM/d9JiNe0=;
 b=NlQqDopLSumWhj26RZ+SfdWgVVV59F3bhTh8TZqC5ZuLGaaKyQVLmn8ujbUAdul0s85mygwDCNV2YC12ZiK1ErWpnc7tkFYeakIUVyW4LydIuzaRrlKzt3pR7HO3nR9mNkNuiFpnafjslyC0iuWumF7RbcHXuv1F8ZVeobyhgqXuO2QhJXVMCS/tCTXRjou6hV0ZgerTXjNVahEBSo3orSi+0yoDDdosndLHZpHeu3vUT9PQoDhi/zo0BWChogHrgupcTfg12sorRbNquyV6xX6IXfOm9V3nA5l0DAOXGiru4dqXjczVeQK0xgFePBtu0rEcclWf+89YhTUjmP699w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3kwYGCtqhyefa3TTIcUbbm74mIrd5JOHXM/d9JiNe0=;
 b=qgdB0XrQzmPiNZsQzVQGjwZKAWlRXhj5/pQHiKDVD9d/CDpYmzLWW03/hiHGwLHv1wP0WnaOiqw94jmcjqCpWKh3ceveJatXpz8HQ/xojXOVAdVe4SR2vJrhRy47YL7b2uBj9tO5bcJWB+ubVxbr2lL/XM06OyaWXB7cDdTn4aM=
Received: from SA0PR11CA0127.namprd11.prod.outlook.com (2603:10b6:806:131::12)
 by BL1PR19MB5769.namprd19.prod.outlook.com (2603:10b6:208:391::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:50 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::73) by SA0PR11CA0127.outlook.office365.com
 (2603:10b6:806:131::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 42C4B406555;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07C6382026C;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 02/10] ASoC: wsa881x: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:35 +0100
Message-ID: <20260603144443.593230-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|BL1PR19MB5769:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 890fb4d7-0e70-481e-3c18-08dec17eaa49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700016|6133799003|22082099003|11063799006|56012099006|3023799007|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	/nS/6VZok2W9zvRtyjBtPEyZFyrcEBQaJIms5eJJE+Ry6nG9S7Bhi6e/YGqn7FW0NkGec6lKQ8Wf5tplpC5G5o322HGl1Ef5v9gqiwlNlf78n79TEKmqtV7GT1VslMe6EbkV9Ewb6PR6aEk/vNC0Ea1M7Dk2OsZ6ZSJlRk3myUzbBPTjFNnr5V7CKwxsZ5yuMHKSAWXKL6SrgB1n/tVNR+HI9klNiKxlYSsZdUPZnAax13VdsxPbauvnNpuBeBvhm4SVd9LL0NmC9dyxdKq6QJZzOYevJ8A23yLess8ldqfxV5CzZyFA4DaOsX78JX3XDznpOTFK+q93wPd5ihNSOlSN+OM5nQX08khFc+yg+v4rfQ0gOaWW9KwQAdnU1jL1/uhqvRtewWbjrRRVNSbwrbLvRTqyMlpEhMcihlJFNkWnEx2YnXsfZ1FfPZtqsXmeDrfkmOgDwf2XNskRAyDTIrjsZmekTQjsr8y/XPIIJJb5KpA03SRd/TxDvA1jKmqdIUHpBM05NcMPj0ex1GdL49T0yplBlqeTOJRH9mY+PcMBZH4cvTTszfO0GFS6lMgVHlmqvxzcuZvnCQ/UW81ADpjn0be/OYTVOgcRNy3UVBclamTuz/qMKXU4odvjn1FfP9U7TkJLDDvvG9Ezjr+B5dcV9d0+ATjmvV6NiWoCFdCkk4w5YA9h4AZ59L1uzlGZsBxVPNOdG0oGVKiRFcbYA/5zx5GVu/B50cvICNmV5BY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700016)(6133799003)(22082099003)(11063799006)(56012099006)(3023799007)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mWBipDpn1xiK4Y/yp7YvZtUM/Rfor3I4Cf1euuKzCp42nRFZU1PL0ORMjabW4gipzQ2nN6Nt7e7SJdwWlFaEQX7+gQNUDHyq/8SaOaTPSawilXTCf4OF9CxokKwLIQe7QNbmu/YGyw+hDtLWXkuNh9dk8LdfLwfxjML4WSLctqtEtR2eZ52Q7gJ1aibDH/247ArDSP0fv3COqbI85dv05Bh4cCqrdizNG89USh/AipV6ssuJ8pt9ajvYU6OC5P9wsghMCGnK0JUqtcBpr+1OFDGVY7r5SvkYT2knp+daRAYPWEbERDL00Nx0EeD01+oGK2PS6FvzAl4QJAWDKcEOk9bNluAlAyy8wI7HAFh1ktsdzYYdxVxbxEOdvOO9YwsKR9IpAApqT/mecdQzEKq3B7XReizU4/Xf7GtshBU0ZkmEKKcbSUZJFCo8eo7pZ0iG
X-Exchange-RoutingPolicyChecked:
	EB0bM3RVqYu4QQXkqeR/lJWDSMHjxPkK91FcnAxEXQkJkPLPhplt7u0OQX0OfzVI204f+CR30erW8sodTqouKkvveYgIe7mxnblesbmVEBdOkYw9ciNwNOVmyBMzuG4YFTv5Zsmj6IcQCFffpXWYbtmQ1fZlOC3qcuOju8ZEtMa1N2C1pqMNnF2A0BYA+axY25FLkBg67UtIVImyZg5wYf1+cq4o0k/dTyNNUwKr4GZ8EH8IbSq4EJcw4YUU8ZIknTvvfrzptZ3hHss/CccjR/MZpC+KPHPaqymBT4gl6Em5j8iITQyB3UGLe2EuRB4bi/rCIahmhv9+m3pKjonb2A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:49.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890fb4d7-0e70-481e-3c18-08dec17eaa49
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5769
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203de9 cx=c_pps
 a=1IaZlVIhgsmdv03QAtF1KQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=BxSnUCk73ilfYBohU2oA:9
X-Proofpoint-GUID: 5NN3Pws9RQI44w81ojLl4FWeS4r9Eh48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX2YMsNEiTEXdZ
 t+NY0uuCvdXOPJ3uRCsHX+kKymtzi7vqJ1EBKv1lY9glv2N7P2WIiWcnWVaBxUgo2BwXxSZhtLt
 rTp5JERaYS+Yx34IjT0aH5GidWjArKjaBiIVHLYenezvnhgwK8sEyOFoT/4BAE3wyvFYPLTUE9K
 laRzG9KgRevppsj3qcSD55N1SeSNt4yVUm5JkI7tBOnf4rkmie246V62YQpQ6u6VyzGa49iLlt8
 KwN3kXiNInb1waCUDMOKV6VuiY1gdySz/ZFakdPYhA1zK4BDInYAt8YiFVxO/HUErytR6IBKBaN
 THzHFxIjdBqYp509brh3m3zDoYDQyQQn4C9XkrOviH7yUQXmdkh9SCVOGDO7NxNV1c/S13rYUps
 32dnDSkgG2ZOxEX/7ltdxXdys/rqVzvLZUcmMUae5wsX+X9cXJ5VECuPbvdMppLB4PrB/tKXsmY
 4tF8PD+3NpxzMMgWEag==
X-Proofpoint-ORIG-GUID: 5NN3Pws9RQI44w81ojLl4FWeS4r9Eh48
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111014-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F640638E05

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it can be used for code that also doesn't check this
flag. Update the driver to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wsa881x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d15fda648dada..5174614c3e837 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1167,16 +1167,14 @@ static int wsa881x_runtime_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	gpiod_direction_output(wsa881x->sd_n, 0);
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
+	ret = sdw_slave_wait_for_init(slave, WSA881X_PROBE_TIMEOUT);
+	if (ret) {
 		gpiod_direction_output(wsa881x->sd_n, 1);
-		return -ETIMEDOUT;
+		return ret;
 	}
 
 	regcache_cache_only(regmap, false);
-- 
2.47.3


