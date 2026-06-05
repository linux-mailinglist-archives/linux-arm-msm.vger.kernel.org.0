Return-Path: <linux-arm-msm+bounces-111337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rKTmDYyQImoLaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28180646A73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=flDyg4TJ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=M3V60Cnw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F45D306BE70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256464A33ED;
	Fri,  5 Jun 2026 08:48:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4D4949F9;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649339; cv=fail; b=VZLfbKK989yRx1rJzDUK4OwB5sibXmZ383Fq2mqBvBhtRhu309d1pzd3+QQWmJO8a1//q78PlY13Asb7FMnsY9FkRrSOtYRvfBa7sij2qKviYszUDDFc1oyPZrjvrlnLdZceKnrsRHMa6gGr92BYrguC5K5OCIThUxQGu9ER15o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649339; c=relaxed/simple;
	bh=syprN3dodN3cP/eiv9BMFjEFqD/2Vactoty4s/+YrJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jhsJOjHNNGnGyM4nsGv/1Sgi8QrhxaX/zPY42sS2qJ0zK+j0JArC9Cw9aH8ehbYZFEGIDRdKZmmQ3ZuJyl/w/YMSx/x/YmJTgSgmaVts+EyP0saE1406t0BPWrOpmcLWellXVIdqLQmCv0yCs0Y/FPksFvTJKHk1kYtaVvsdMFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=flDyg4TJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M3V60Cnw; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550wlZh2165677;
	Fri, 5 Jun 2026 03:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lPUi5F9rqZ5QXVcaxg7DXgriPROLgUU85g3NVNUtKKc=; b=
	flDyg4TJoiVpzXlPmSAH8gVpOPhYDTBZ5Fum3FJqng6w+xgPUX0OCNpsDBcWHivU
	pRLK4YJjPnuObYgeocAO14uyvlUX3yOygi3G9n8UY4wc+vbZ737cqEkntlVC7kvg
	rYBJw1xxY6jVZe/1llXcAT3qBp7lbDRtKlWH+K4b6p6ciWlSQzVgWv59xlCZ5ibB
	e+okFsrOGnUdIMbhcdE3tmPeOpxKlGWYdzmAmbIxx/ox51+TTn7ABiXlQ0BpO5hD
	DtFMBHm7ZayYrwhBguf0jmQPNbbZZwSLTZEFgqt6uw7szcP02GLrxWW5+yF5deKF
	r0zN/ul+GYv7xWEyaPhAtQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021084.outbound.protection.outlook.com [40.107.208.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tayj4DajvbN2lW3ec7JtPXYBDtV5l/LhVyuEbkB4DF7LGoskRCNzmdBWwwOpcytmqepXKGmE6hGTpY2aEhRD6flQsRIRe3m5YafOOncNKJtcc20FfpYfA9KtiqD/I8dFvGGnpRV3eSZ2fSq1LABimxOMZfPak3irsetUBNde2pqT/QrrCxfGz65kHIdt1b+ozkR2PyPBu+GD3LRROaaELn584mSs10qQ6kRAqZIrZNz2QFjGZXpTPToBnOEC6Hx/qY/caqJdjzR2G8tmuwrI8+lTsCx8JiZZt8mcP2k5/gWwboSpGVYiX8EKtNpmLGKP4WRYR1LAw9sBRevMVypgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPUi5F9rqZ5QXVcaxg7DXgriPROLgUU85g3NVNUtKKc=;
 b=vsaN9deNZhoN5pzMgdx0BEsZqD15vzOozMpHmB0Jw+fmQYm/x504UKAivLVdBRMbhfut68vKQOzkzbu0geZXKEp3oKMe32G3nB7TF0dBXeOKx5/S8eCY1FHSN8aPNx3tJzm7OI02j/b3EsiE1vcIKj6Orc9gat/0M6ibDgLvmlyQEB9WZvyi4EiY+e90DxNUIuyL6Y1EX31HDjFtnMg6koJJpTg8xJdcO/SvVzUOsJsjKXgbcNs58e3LcL4hVVHAp4oyiCuP5+p2xFA9Wlkp1AcesByxQsiUZNRbXIPlYvkddO6eXx7kxKDKHZjpoppoejr4igYY5gIEb5Gewi9uqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPUi5F9rqZ5QXVcaxg7DXgriPROLgUU85g3NVNUtKKc=;
 b=M3V60CnwnXE7Um1sVqujQ90vQwup+Xa11+bWrKzjwE0mK8VLTjBRY3CR9hBnu1dfciDZNS1lRUDj6lK7BI6UpLR12MYyM3xsTQEkfs9/3rClDM0JNMI43kLEqiqKgaNoSwWYRM0np8c4x6eENzc6stRBWSxjEOmWc2Lwf1SDqao=
Received: from DS1PR02CA0013.namprd02.prod.outlook.com (2603:10b6:8:452::8) by
 SA3PR19MB7586.namprd19.prod.outlook.com (2603:10b6:806:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:48:18 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:452:cafe::28) by DS1PR02CA0013.outlook.office365.com
 (2603:10b6:8:452::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43F6340655E;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 18549822548;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 07/10] ASoC: wcd938x: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:07 +0100
Message-ID: <20260605084810.1575539-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|SA3PR19MB7586:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: daf74459-77c5-49bd-6b48-08dec2df3092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|7416014|18002099003|16102099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/rJFvE7MycXlRR8t68KzOac9Jn3BhU/AzOTMalcHOUX2bUMdAVbDxfWxpXhGHFmClNhft0ou/x0RFV3tczWJxdUlgSFXjSM4lyFl70eABRPfdpw+JBknA7FOFCo9H134DNEMPF53/r1C+NJIIdv7KhUXPADiv86kw4YOodDk9oRs4R5cyfX8z104N1jW96vjILewcYZ1a/gBoW1ThrSg3UBlEcl/xaq784OQZW4W+sXtHrWDQBqSxK1Oo2bwfOTt642T3K6gAMDDf+BC6rkVhAQFl/KqTSbkfgN8JJDEKIROm4Icx/G1+JOvW/pFv8+rezbvdpo3Ygzx4J4fTCNFtXHeT/kEl/ZE/eidkyDbpPtT57RqsPo7bfewNsPFe+8NKPajK393w+1U3Pk1Pz1DI2YsduQw1giAG7GEJ631KDgCxHdOuKjiy/C4Bal0EriZ6084oIXzyOBCuof6c/PzNdv7rx4MYj4u5i5n3Rrw8tsDRtCsdNDqSjkkYCGvnzqwjgZlnuLAtY3hNcmsv0AzPvKnDWzcRS2CA8OXOXHWmyiFXEkvWByBshNeXJZ2EtuqWGtrTWYEGEPUIQKW0B55eO+D1LtUaQEdi1PHzzcPiWt0t+OfD+OMQo51jnB34OXddZMH+JRsURXs4l7KkApZnaGexT/rzpQi1Y0TscctoK6KZX0k2rUnIF3VWns0lHCRCDaQmUjFw4XaYhEyr6V14Y7u2aUQ1XrG1RUMW0JJeHA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(7416014)(18002099003)(16102099003)(22082099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S+VjMYUDBf+Dc/r+IF7DCvnLg5mDYBbF5g9xdGMLB4Py+AZ98mKQJVfQSbBTiyQrg4r6WUh8OETrCBf85d8DvZl4tbbvSuhPXvOa0Gr2vDmE8LrwBlxrWatrRgv9aSjXvog/HO8tOKLyjSR58AHb3dC4UZdeQ3Lfm6xcsjTAoTpAgQgIJTBVpdhkF+BfhkC2fZWIztmDNIaz7x3qtCRNt4WRhtcsVkIfsYeYugIanPpKxXYnsjITMD2iDoJwkFeqhRexWPu3zlvaImimMOXEXp9ypqew6QCQ2Q6MavbtnKuGD+ZuINnCJ03gnlO4QTXaDxvz3Be9DgYYsnTSce/wQgP/Wmh/Mm1yVpnyjIddvTby4uOK3vMHT34L+/xKXeS6w7Hc02bzkLzfrxrML+EIsMw/uJ0rtkqvSyBzvi1KCtT9LCiJ9ANrf9ihHxTgZ0/y
X-Exchange-RoutingPolicyChecked:
	nv4Rux6jT7cbHf5zqpKoPE6TrsJerscx9zlx23iSRT8xNTqVrUsOJSmkcpusU0f40RIz92o8zRs98Coay3CZHyoJwrwDnvxLmdCoWB63C/fqoYL35d6wbRrRnI/wxpWe6Dv4NOonPe1z7TruFB6c4C+wuLSBOmlfb1dcXI5/xTYvmEOtS60xGdWEuXp1G6th96n1ZM2a+oPHkc+B3Nfy/0MpDJbr+GPov6EPJ86O7GFTZLKHZq1p6USx1NeDPm6W9JHZJCd67XvGtey6vO2o3Pd4D0oBDS6EC5He/Ei2C662z/ns3vRNq4/XH25cFp1K0hthlQeoO6zETtbiijtfPw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:17.8868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf74459-77c5-49bd-6b48-08dec2df3092
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7586
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX4btoDrTx/I9O
 RXrb1QM46JNT7E7WJpw4YBLYlfvySLysFJ7Td4mBzIHJqy9b2Y4N4jdfw4ku3CGNNslWbmETfgZ
 MYMCx2MTmsswlBY+7Yc55UrevbPWW1lVtniS4uYKkT1ZVUV0OfMl+GNyRm4lccnUHgqAyDrnOzR
 3+/4xBgIzcSLNCxLfI78DorDpkp7VuWFftGyR/7AOJKQ/MLT09an+RLDU6eeH+GXJ/6MX7ZcGTo
 iVOIRbWYsoGF0h1rM8p78iNpDnwhTRPoT6Cge0nQLggY4unpSXPWZj/1BJW3j+Zo0rFwdcqdpH9
 WI3foLqFkMgQ/sLB8veugyGVVouXyy4kuvYeZZKO/8ZhSjbb7rUEkLf5hhsXTvUmeQjf3A74nKz
 c5yYIaQIdeGNZifw6bBQsj/YQ1X81KtUarqLBQG3pSynSQ5iRv8cD0bnuWmsb7bRZPrzT8jCbD8
 b+ggG4zNmq0569vuUcA==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d56 cx=c_pps
 a=0iCLHuH1wF6tAjvkAzcOzg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=JVHJYPckqUcmq-FxO84A:9
X-Proofpoint-GUID: iwNCz9m2XISImNaM3ryjrQ-_SBp38wJF
X-Proofpoint-ORIG-GUID: iwNCz9m2XISImNaM3ryjrQ-_SBp38wJF
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
	TAGGED_FROM(0.00)[bounces-111337-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28180646A73

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wcd938x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cb0a0bfdb6e32..c69e18667a85b 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3016,18 +3016,13 @@ static int wcd938x_irq_init(struct wcd938x_priv *wcd, struct device *dev)
 static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd938x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	unsigned int variant;
 	int ret, i;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(2000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd938x->tx_sdw_dev, 2000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd938x->regmap);
 
-- 
2.47.3


