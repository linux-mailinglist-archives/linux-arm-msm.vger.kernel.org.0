Return-Path: <linux-arm-msm+bounces-111015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BswjAQdDIGqozQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EF638EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=ZhHGvfXk;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=zrL7vEWr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111015-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111015-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC93F303D0D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2B843DA2D;
	Wed,  3 Jun 2026 14:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F033BED18;
	Wed,  3 Jun 2026 14:45:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497949; cv=fail; b=QTwSjekxhG7YdP0NqzZFbUbrAH6GSNp2WCzFxieZu9+38OzbEjVSRH+iEEzBWRdhur3f3M2+3oP7kVgtG4eaXI707j3wN5i+551sO0Iuvl8weEYkx2rypCDeamALMpt9+5005SCAM0nlpZi8Q94fPEl5zDZCZJKw7MgSh/QBGsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497949; c=relaxed/simple;
	bh=NVTU9H9V5psEyWHZ8oecAz2rpugNmdY45njScwtB/Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paDBVReetRACqlPu8FD7D3iYI7NUPCJULl51YebsRTRJU1+VmtY5dbOOztft5cYv2tPasFqBiDc0WgmHJ34fkCXTE0/Qi84eL0cCHymAdzlu894D7c3ezxXaduI4GKZtrfGfV1lzNqVMiuISyHAwyf66FsVHiKsSosJN0hPR/4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZhHGvfXk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zrL7vEWr; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EPPnn2840063;
	Wed, 3 Jun 2026 09:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AaS1daJiadOl7CFvexDevDHNEC99CLUDTcbW+mUV9KQ=; b=
	ZhHGvfXkgdKRoaL7lGpFxzT0RzRVu9MupWXqtYOLUCEvTBZDuV4Mo7AmJI+wSvCP
	8tLN28jJN/TsY55B6dlEaEA5h067QZhyApu4Ok73gbU44MM+EyWc5jhYTdqEhTBi
	vzhP1VzhtMcDi0HAFH3BwVFuA+UNr3OtifyTrZLKpqKsogLMNl/w7ei2UsA8PdZf
	I4BbcI5ABV5JbFO4jQ96FlmG5cNwGe3WKOjSniygPQ417gZwMwrcMKKBIsUkUGTo
	HG9vdj3bPMPVaUGpMb3nid5b46HiiRLiAHJhAcX/OO+sCY3HGCtBr59U/TS5ogvJ
	kNf62urbAlV3hR352LKtnw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023106.outbound.protection.outlook.com [40.93.196.106])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagedgm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuEhOrAZ0SjMdH/LmYPbzT++KH/pvNZOF/IiIkPyuFqdR+EpVSb4V8GTBUMYgPHpngTmGqFAM/LZrSpluBLeH9cPkSHObfYmo1v7iJqDbXlGteiZ/e2TgdrTySXP24Y+YntnkAE7WXNGFNmbrAluJBSrP1F1WLt+ckmigoAycJz3EW25yyKslvJ/C54xVyp9jD8oX3JvnH1G4Q3ld+DeSAKvuKyiHACox7r0zkU5UjC4kyHRduXVy/EV97avIEuQhJ8TSFInvWPnTWmvV/FLMVBX9cyyRmO5bTmDjrlVNbOgfPugIuvrZ6qLpWWHwUZzL+VZ0aayU5UvZ6rlnjOZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaS1daJiadOl7CFvexDevDHNEC99CLUDTcbW+mUV9KQ=;
 b=FPJwLwOohr3odVrkgV4fLfSDPFQlsrWkavUQRzCRbiz8mA35huLAGljqHyGCSHeilO0Tta1Er67SipR+Aa2/HLiaRhbm9/4gHH5L3NLirDNkVm6KE2LiaWRH5JnlAkTGUqMMWfKkSlbhi/Ru47yXMKYy6H/O9hXzAdDF9rnWd0gMX10GOyFX2S5wFUtMLGWZq13hJvV8ghH7CY1LrFLsjdESyKmKsZJoCfQSciIonx7vDw1/+M/QbG/62QAl1JOynXcYXe/Nee5EgymDs8JzmMCDeBmTEynCPAqaI3H0Un3c7kEdkwIGiWr63jnVUym4aNXZ8rJwqNyEZxbm2VUz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaS1daJiadOl7CFvexDevDHNEC99CLUDTcbW+mUV9KQ=;
 b=zrL7vEWrMU4p5P61et7e6qh5vqyhnDDdjClWjoOJQwMFRKhdkLW9YRWSZfqOVH/GLWYHxbHLpQFBXcGdI7MpQQLFb7KzJGYxosQVf5sZTfNnGayQbGssgNq3P3mVbFOZCbYCQABP4wn/d8P2I6R04Zn367HNlJiELS4dC1fibq0=
Received: from BL1PR13CA0275.namprd13.prod.outlook.com (2603:10b6:208:2bc::10)
 by SA3PR19MB7418.namprd19.prod.outlook.com (2603:10b6:806:304::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:53 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::29) by BL1PR13CA0275.outlook.office365.com
 (2603:10b6:208:2bc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5560840655E;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 17CEB822548;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 07/10] ASoC: wcd938x: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:40 +0100
Message-ID: <20260603144443.593230-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SA3PR19MB7418:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a04a022b-939d-4e0f-4507-08dec17eab9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|16102099003|18002099003|6133799003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cBWytF/LH/mlHLH4fHPRDCKf+7VjYk4/r3bemZ32f+8q4/XPFCpLuS7WKIKQoP0LpKOGXXqnI/LLVR6vzB32TyrXuacyr/fdYscPW+CjH1atFEwZiA77z73pEcDS/DHmV8UzUtfWHPXbPldtuyGcckY6iiYIWuU90qEHsseHly45M8sFO5U8HNtccABEF/P4ubHO9PFkH5i/Y9qA7nxiH7os8NvCDYgqag1SJCDInkesM2mrzyw98lOEQ9HC9KowA1A7WpX7A3odzm3vAROivSb4EFgQmHiMBY/R1S1mNcp6gkqWi7Thq14uz/qyHmTblcRCDsi5dd52+yUJ4GrEyMd6nBNvrMPNoPDfRvOLJu7+2w21P54taglSA7exSeafLJGLlBz7gG1cOalnGdeRboHbCulta7AHDz+KbZOEWQFS+J07CtVB5kukl3CYaYycKPjK2yabTgprb9jPHw97qA70tZnMkxiMogiPzQfQZAOWv6GpVmfDEsr8lomSGjSXUBwk8BSKrjQScjAa4Z2Ov4XN/zRlh3F0ZAKLYUO6abvDyX+5ook6oS4Rv1IT/csiDTzRDJBa6P14nmAWFBZeTa5OL02JJXfRb+EB5YP/qDAwSgx+Ggyovu2SOzV7OHo8Ww1MmZ9+qGU4PDTcHM42MpXaJTV085q71WqKphuMDJtGDX88V3HB0zPNGINOB+4L7iL9lA0l4RpukdK+lMXvx9G6J0NPprwupjOtwsTyAPA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(16102099003)(18002099003)(6133799003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kNMT/hUUKlsTPEnrfjhfmGQ8+QSeSjTIoAVPxMcIsGSoq+3zQdy5mp6sGOYc16xNDqcP3AAKRERb6IkCgBlNId+cLFNlOXyPxidJZslCmf+RxIi+zoBbmWe/Kauywvfq0FvbjO2kQdePwieki1x2Gk4jYiktxyr4Vdb8vZmJEWm9oJJsy6HO1uvQadtafZZXmCLERX9AaBJxEGNNCJoMYOt51H8mEFc7pIbh0n6Uu5P1YtyYxJjJ2ZFPAP/pwNeAl02o2H19i04f4HI60hjUgIcAjpFhcOOFNV5c+PqZdCZ7oVZG0pI+2njTveI4H+4Px24rfutD9g+A9sbdNhVLusp/Cdum95WYdUmddQwDWPlhcYtB6OcnB0Mz8i4L+2ZDmMA4Vy0pTnHeNv4xd+snXHwyc7cNPfIisdKFY7E8z2gt8dadsV/sGh/hD12Ijp4U
X-Exchange-RoutingPolicyChecked:
	r6jIbORPwCr8+w/nbz6JXoYWrVc6eb77ovn6GFNxNBsLuBsX5OOns09HnmzDmR8ltPErKizHxB8E9rNe3gyuVJJqEsYlF0bzPneXPDYIEabf7/CVf3Y8qqdiP1VjSCc6/J6WwWuwNaYG/fyR6CiNtU2agPJw1OufqfocBO8uHKhRslE3A3GsSiJKMoE5/ccgsnZb8WmdyXUImdMYG+L1ixILdFRsEA2SnM2UAocLBHcVpO1gBNgx3bqyqaLBmk+ZDm6mGFRnMcp61kHDXhTuaB1zjwwTaGg23ssjR86+wi57ahrVVLF86yWUm8oUSZr+EEZ4qM35cBfM3ALo291xWQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:52.0326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04a022b-939d-4e0f-4507-08dec17eab9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7418
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX+1wMeodyGqzF
 P/ARivQQrYDfYKd4fHw0q/EMjeLRntMeqwKwHhonqgfZcTQ4tdzNtwDMrB+M4TeontwmKFrjtvo
 45YXwrSV4MSibmBq3iswQLcMRv+LpzVE0MEKsH+ABXZyLT69KRA0SHXU3NacWzl1UMa94EM3eZB
 u/c0GtjadermSMXwBOYCjmgQPDEQiPXOORUrCiysBJ8LJ7nY1U9PTxvff4QKaDbXKaX3fxdrCSZ
 EKuxFknaDRFoxFWCv2tpsnwffGaXz8W1LCwIL+wV3EM9NPs5p5l5BHOXThTkiw3g0F/OwCExT5m
 QSZlMWd7FR1EWx1II7ezZowplf2sBxkBzJUZ+MXbcCKZqyYmuYzduQ7jFORGkkwNdYBv69CZSAb
 /hdSj5eEF/IDiJArd9h+/XMlhI8tLB04FqIOA7/85WKEnHxXcJizMFq8WIJAk48ca+WKKjtLwB1
 1YBSQjNU+qakRCh4B8g==
X-Proofpoint-GUID: hy3E8xthKrH3RhWh6oMEEghAS_V0kc36
X-Proofpoint-ORIG-GUID: hy3E8xthKrH3RhWh6oMEEghAS_V0kc36
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a203deb cx=c_pps
 a=glTcUGO0A6QcesvNX5ZrRQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=JVHJYPckqUcmq-FxO84A:9
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus4.onmicrosoft.com:dkim,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A3EF638EFE

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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


