Return-Path: <linux-arm-msm+bounces-111020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PtjJNjNDIGq4zQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF7F638F25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:07:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="P/uR727B";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=yl8jWZJo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DCBE31C4C45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BA248AE22;
	Wed,  3 Jun 2026 14:46:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FDA48AE06;
	Wed,  3 Jun 2026 14:46:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497969; cv=fail; b=VgGCkLQHDmwdsEThoiyhiaO/0MIjICWRx3RrbILlcanpDOQehPcvli85bFo6QZo8wmlmOYrtFJHNkQx/DJqjMsMovF0DVatDGDml3w2P9SkhvMglE31BdJHO+EOhdoYGsgAjaxGIiEJY0FRpWbYJ1gisjqstn5oEcVgaVIOCAnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497969; c=relaxed/simple;
	bh=4qMgBOTlYqO46lQS7rPsPRlI8bo3Iz7/qPHzA6+rxQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVqOGev71m1bjwOuEGnSWrsxwG1IwM2o1649RPB/4RMNu7ULziy1nyQ+niukLfPtos1L8+o9s9SY/IrJG04snR+Ay+ucQFuGzo4zsqJt9q3DvuJK6ApEEYxfhWTDZVcUfrLnR8xGXJ4tScVaPJbiWdTVhZBpQprbtSvhI3l3bxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P/uR727B; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yl8jWZJo; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESsrq1297281;
	Wed, 3 Jun 2026 09:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=96BiPLh+Fa+r6eD/M86QJoOKtyv7RjfdWaWnrxFsEdg=; b=
	P/uR727B6o6ezp+95MsFN2xMUSAoaQWioESmEDcm2bXGg7Ezmd5Dq0e69Bn1WAi1
	Ntvpc3d8tHTAsjXt7ltkbsVvnMpAgCSyl44UAhXneEc8ePDPPFX8u+BwyWmLt9ty
	LUwM+cCLU76R3YVDftkemRSZ/wvfM41h2zVfFEUIuEtp1jotaIGtdD/PLR3pBWf2
	BH9NPN/budkxPKlAX3jmuE5ILCoIvdqUZTrsKuV/fG8eqrY0/BvK8mVmxIxEHv0F
	q06ux4lYfx4C9lZcwRIt6HSKSOqOL4G8WraU/IdyC9DxY0BH3l/MR9PyUWi6nRtV
	vc9oeeUEFik5t5bf5Kb0Ug==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022101.outbound.protection.outlook.com [40.107.209.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa1695n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNTqEt1JtHEbbb74PT/eBGTT1wDcCmv2gAYlomzlc6ZjA7SaxM3LpoLzYtvo8O86d7VwudPKvFV9EQSiantsEnTeela57lz08McG4WU+lHauHX0Zhv5g9aJiZ1Y1cimi3RM1OCr+ucwK5+dPdf/XPFGd4O1khCBG0kZwwRO/4wJN0Fyy7xW+GLraAwS4ZS3d0h7n9+DVGnD4upZk0fQP4ry41uk2tEsstn+sDZGKYryywULXzdEPXFczFSTvqTTgkWiWlMJoGdgUC3uA2QCdB4yTMUPMxW0IyhQ+XyrEM909ij8SUHAB3HVlAZ+j3xQdhhwylRGiYGZVRWuehvz+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96BiPLh+Fa+r6eD/M86QJoOKtyv7RjfdWaWnrxFsEdg=;
 b=JxlJdUGSZqwy0uiap3KbSg3DUoqHcPO/tg7FZkGMzEQjxwiYm0v7EsEt7b1Axfnmq5jZswoESHkPuVQYwpA1JPvDAVcR4/VKfDVwY1D4sOrcgvYKAh9bXy2eWmmuJY81TjucuTc7uoGNsQWhOOlBgcTiC2GPQTwA6za3H3abXf0y9bmw7a2H/Ict3T8Z497Qk2m8NZoLOaELNDxFYaHL69WhNMcxJgkdlMcBokO9NJba7/NbWX0bWcAAEccj2liuShEQaK8pD17erhzpBqp4Bnd5EHwmtpiwM0OY+vPvQI5QfTAkKUBtJKaFv1Yhh73lWSHeGKCW2qAGQ3dY7Hgj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96BiPLh+Fa+r6eD/M86QJoOKtyv7RjfdWaWnrxFsEdg=;
 b=yl8jWZJoSuL6lTzrODgcX9Mj5QgE2cnIgecFk9Waex/p6Uf/05Xkpyrt3+0k1PXKsEOw/YuLKLzFLC7DB3MpecLH70sxsruXp/bAg0XMHD/cmNcepvANA/px1Z+wDgtLgh9FSt1MzrMbsXzf9ugKQDxclkAS8MkQjhrQQ1xV4uw=
Received: from SA1P222CA0101.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::9)
 by LV0PR19MB9261.namprd19.prod.outlook.com (2603:10b6:408:321::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:52 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::1b) by SA1P222CA0101.outlook.office365.com
 (2603:10b6:806:35e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5CA6B406561;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2259482254D;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 10/10] ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
Date: Wed,  3 Jun 2026 15:44:43 +0100
Message-ID: <20260603144443.593230-11-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|LV0PR19MB9261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c61f2330-7dca-4ba4-8299-08dec17eabb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|82310400026|36860700016|11063799006|6133799003|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cz+er0yLJAUeZG8FVxHT4oSCkQ/9/SlKU/M22EMvQzsoN8euflYmcTMNJKvSA2WQRV8q1Z2qG0Mxxy2McUlRJRKL1HHvGzwdjNb6HsHmQBJcpwQgOxY8/ufB/S6JA+Kag9KYA97qvhWYBItj9OSqqMJjluBn13hOjXLxPAFL0T7YVMDhf9equVimXonQGLvj3VnRezsFTNc0H9joWHhgHVvGIOASe82Vn4YQxNINqR6wNjmv6Ul1xWSUBRMW9cAk39TSLk0Xt289q6kxgfnQuMzwjd9aSwd/64WodS4/vI55zQUns68pKMVMwHyHl6r226FsBz/UBex5qzpfe3gVl54+0CrPLuQFMqA7fK1VNaGClVxlOxd4hukUv46heeVwf39qKXbk7eXHFN3N2lcgb8cQSWDIAMEtiYyQ6EyekX/O7cK6M66stLtKvGYRC56+mcW/Jy3eoB+ZYynlp6PJTLQd31FDUDpXAiyd38jo4GO/qB6ylduEv/oFRRbrrBD5PB+9qys3SWetljRQxbrdZeIPyl72tFPHj26JqqTN06UQ7qjkQ/lt//URjbwt7b5aLU51oCHCfHm99EsnYRsXonOprK+Uf+9M/VInrBnYmtcpR+LhvEfLO5+Podc3W4ZPSH74oglk3B2pO9y3EWyE3WyKQmtI1q6qb3Lb5KTe5+oAVU1k+/yQ2U0lFIXZpQlFQfxWYGpJBDtTnbe8ZZwdTElZM3G9AcE16MfBkdB5nws=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(82310400026)(36860700016)(11063799006)(6133799003)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GE6KxA4rmYaPuoRYBH00ol3y7G9QFX6Jf7oqFdBbpoG6WzTzclivUNJy8HzYWb3tXSbOyXK5J2rmLtsRX/aFTW0jcgfRJX+WzvwzlbNR9FZCrZ+aMKWVrrp+FJVYG5C7O4z84JmahjYu9iLN0+yP6USG+/ayGPMIFNb0ud6q427V0vTxBTfxuOFC4D96IqdD6CyIgfXXIhQJEnlZ4WN36hmFl1/cJQO/zDcAjUDOoWao6f1Ily1D2Fb7rSaBcT0rmDwxuwDIpbKgCcFTvps9hfzVfF5dqNETI+OGi151yhbS+bySOoiEoYi9UwnLRJbeLNqK38Tt9fpKrDQvrbjg5MR+N0GeWc9ZUJrXadbrjbVwRf5eSsVHB7P30tCjKNiLw9oV8Gjlumw1NMptKt6HbYrTmrKWFcdPIan6Iewo994JQ0ePCJLbkePYrtvSEvAA
X-Exchange-RoutingPolicyChecked:
	BkAuTrunUXg+m3Ja4Zb/p43UxmmyN4hdoh1oZb+tE/c4qQnD63fWc6Xg7zrg8ItDeyV5BkjLNQ2x9q5Onrae9yjESoR+WdHgMZx0mahtHm0euL1ZaOFZgCy6Yb3rTuu8ODa3h8Jm+ZJNS9ovd7Cstfzt08CnbvOB+dGJZW6mxb0vOf1w8+sOhX6/4XsEKC01XtHwV9g8B0XcnOz26kD30tFE87YSoU0mHmm1idVKaD1NmFfEpaLwlmhNyPovNDcHGDYmkT81O3m8aWgPdWbFmLgNMvMcVAKslmRTN/tQj1RzR0daufaIQzUIR0DSM/sRNQJ/atjh5LJdcr/CFfVOrg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:52.0998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61f2330-7dca-4ba4-8299-08dec17eabb1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9261
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203dea cx=c_pps
 a=vWQ3mT+D5TKWrXkKqtKQhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=fcoJ7aZ6GZweFMwf-4cA:9
X-Proofpoint-GUID: dZAsnOj19h8TGVuXzuS7m3LGaROz9rdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX6wJNV7/ezbFd
 fnUlLxwrOllzmjXjm/5+q9oIxyVeblSSecQwxcVQMWEqlLic2jyjszD6Icscxy5zVjc2efdVezB
 VjySv4LxKZkKtjZyjMGngLbt9PRbvoP8CeXQjQoKUI5zQB2Qw6X4AP4zzX9qk04x0p8A+eDkSRW
 KKeIa5+2RdCHJ0zYN4EN6jF7yGPXNphtViS4psv8ncFxKj80EI51+Wkm4+tFyqWCQVURH7Vu5VL
 7NwSOCl0pQ9u8vyTgeBeFun+n0ukHU6fJjjYOs/cSrywFg5fuX7llBlTE4DiYNv8zyuu6Mu03zr
 UitGkV3nr6gla678ITk/h5OBrCUbdrJvk3pnkjj+ce8W23QKtq0xh98OhE8d9iBHjzy1Wm8j18/
 jrXKkasQaHgs5iN8DXaGnZn7lLqWxAv8mZYLynRep31CjrLd2RqL+I7nxIDiXH57QV5cIxtM86n
 sOUENGxiygAPbDTYsZg==
X-Proofpoint-ORIG-GUID: dZAsnOj19h8TGVuXzuS7m3LGaROz9rdZ
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111020-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus4.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EF7F638F25

Commit [1] updated the core to use complete_all() which means that
the wait_for_completion() will now simply return if the device
is already attached, so skipping the completion isn't required
anymore.  Update the code to simply call sdw_slave_wait_for_init()
unconditionally.

[1] c40d6b3249b1 ("soundwire: fix enumeration completion")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 47 ++++++++--------------------------
 sound/soc/codecs/cs35l56.h     |  1 -
 2 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 847e88f3b2044..0a55b93b96f96 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -330,7 +330,6 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 
 	switch (status) {
 	case SDW_SLAVE_ATTACHED:
-		cs35l56->sdw_in_clock_stop_1 = false;
 		if (cs35l56->sdw_attached)
 			break;
 
@@ -352,31 +351,10 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 	return 0;
 }
 
-static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
-					       enum sdw_clk_stop_mode mode,
-					       enum sdw_clk_stop_type type)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
-
-	dev_dbg(cs35l56->base.dev, "%s: clock_stop_mode%d stage:%d\n", __func__, mode, type);
-
-	switch (type) {
-	case SDW_CLK_POST_PREPARE:
-		if (mode == SDW_CLK_STOP_MODE1)
-			cs35l56->sdw_in_clock_stop_1 = true;
-		else
-			cs35l56->sdw_in_clock_stop_1 = false;
-		return 0;
-	default:
-		return 0;
-	}
-}
-
 static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
 	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
-	.clk_stop = cs35l56_sdw_clk_stop,
 };
 
 static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
@@ -384,23 +362,18 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
 	int ret;
 
-	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u in_clock_stop_1:%u\n",
-		cs35l56->sdw_attached, peripheral->unattach_request, cs35l56->sdw_in_clock_stop_1);
+	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u\n",
+		cs35l56->sdw_attached, peripheral->unattach_request);
 
-	if (cs35l56->sdw_in_clock_stop_1 || peripheral->unattach_request) {
-		/* Cannot access registers until bus is re-initialized. */
-		dev_dbg(cs35l56->base.dev, "Wait for initialization_complete\n");
-		ret = sdw_slave_wait_for_init(peripheral, 5000);
-		if (ret)
-			return ret;
-
-		cs35l56->sdw_in_clock_stop_1 = false;
+	/* Cannot access registers until bus is re-initialized. */
+	ret = sdw_slave_wait_for_init(peripheral, 5000);
+	if (ret)
+		return ret;
 
-		/*
-		 * Don't call regcache_mark_dirty(), we can't be sure that the
-		 * Manager really did issue a Bus Reset.
-		 */
-	}
+	/*
+	 * Don't call regcache_mark_dirty(), we can't be sure that the
+	 * Manager really did issue a Bus Reset.
+	 */
 
 	return 0;
 }
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 6a27ef2b7569a..9acd2e7e17c93 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -43,7 +43,6 @@ struct cs35l56_private {
 	bool sdw_irq_no_unmask;
 	bool soft_resetting;
 	bool sdw_attached;
-	bool sdw_in_clock_stop_1;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3


