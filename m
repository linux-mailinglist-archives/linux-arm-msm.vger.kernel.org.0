Return-Path: <linux-arm-msm+bounces-111342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EWpXIiiOImqiaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099D646975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=ReeRLI6R;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b="hMkuAHZ/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B3643047650
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6015B4BC009;
	Fri,  5 Jun 2026 08:49:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C14B8DF4;
	Fri,  5 Jun 2026 08:49:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649346; cv=fail; b=jDcFYACtAOrGuOv+Cvmk9lwWmk9tmxRbk8rDGa4bQRPErSIGmzpnDl3gWt2FxI1CWQ3H/4sDbXjopr17ZxWhu4gOSqXkg/BP93HI/9HMNCNbdjp5Ef2zriIoH+vIK906dYxo7NmLT4mQC0gUeFghEbhRKPdRr7NDMkGm4b41fHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649346; c=relaxed/simple;
	bh=YxiqkOxF8Rc5M4MX/F0o620yVpz/fl1cAypiXVLQBGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abKOV6M/KWU7LjiZfSUsTrc1u7UU0W8vsgNy7ecjWOT8zvPxAfMJ7g813Je0X77M+JRzH5LTRNw5nYh5JyuZqhMVe+xz0uTxSw7oov65PYduzEb28JsKb9kv3Ou0SLz/SwaPAoyTNJvupVDu5jpIDrdH3xpZhr25giKLip4qFQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ReeRLI6R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hMkuAHZ/; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6556T4pB1030980;
	Fri, 5 Jun 2026 03:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6jzJt+jVnms5G/ETk8HgE/6mOXHM+20uSGz5SVp2uwE=; b=
	ReeRLI6RTgy/8WU4Darf3+cMkhdUuxCfDvL4vD+KszFT/K6hvfrdrvopX0XyUQxY
	Nsq+ER+RNPPK77Np/hq4Z6WhwrLKS/RCHN2ojwtXGfLy0KSGnC6+ZMXzL3+XRxR+
	MROO1NspAXnCfAQgqvsb2D5/SC1DKY3U3pr/HX5kCRZ7mzmE8RWQ3AuqFy1TSgf3
	FrKek2ZsMZNlC6Az/lVTgvdDhlGtA/iNsdxI4YxEaJsXB64SqpKRThjqCEnY+C4H
	olkWumy3kV4Vidn1Y5aSvi27AF4G1ehzM7Vbh2ZIjH+e8TVRArEWcEcuaqST4Sbh
	dddm041il4m1gotM6SjyGg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022123.outbound.protection.outlook.com [40.107.200.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa192jd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmpbl+2y3+snYZMHm9SuPNRvbMILUkRuCd+cHzER7daGisfI6UMh5csH2M+zPr/xE1qjSHINdIdVhPvVxn+3Tm4r121PZm+OveQavK2/eA4P+ZNmmbDLVWiTjUGB9nlPqxUL+yg4U+kIXlUHDnSDInHME7KTk4vm76V2fqznX2SuoMUuuI6T2XuccrIRHoRmyamjWYoLYgGhHr5hUmJjnibuWdONW0+NxBt08eFg8vxqm0YSlVBQl6cne1PG2EGOv746fs/aceJMGvQp0uUi1ZCLKwDeIvAO+e059GBmjpJ3gszT0IO7WKdGI6Z6Sm7lEhn7kYKEIQP2QQfLXjf7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jzJt+jVnms5G/ETk8HgE/6mOXHM+20uSGz5SVp2uwE=;
 b=ehnUTiXGF2xyrVGLI9tOOy7R4Bfo5mikdMuC2sIAcyk+cVRwVJhu7zg+Vv2smLXlZzZfQLXqbQ+cr9ssYPDL9dPYdUCmDYuBdUqWXQRyoNd0rEG6Z2FPJAj/3rQBqmRjXa51PRu9rDnoH9FPUdnoO6Tm4yq8mzLanR+p1TOi5I5e4u4khAPKsg+W6OPhIjNtifj0TiObjjEtR7IXkJ/EcGjPQ0pFh2dC4mxD1Zx2M0cRYroLx8x3c8iAubDIww42/SjJWesEZwuZXbULlVod/zJc1NVX83CtUyXY9grti8uOoSvOUjy8D4fjztA3O4frwF0wZckAFcW6zCJk4OHNcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jzJt+jVnms5G/ETk8HgE/6mOXHM+20uSGz5SVp2uwE=;
 b=hMkuAHZ/amvwZ+3x7fMSKEYlXCS3qYjJO30lln1xmR7mRnaj94iaRL4k3yP6Qu2/K3n5sFrlCERJou7jE+FYziYWjHHekfxxFgZGVydDDhVkJXG5oRqWsaabSV98KWsksB0xY1GY27tZuAW5O3WcrerQTF9+D88RY7cTegxSLM4=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by IA1PR19MB6394.namprd19.prod.outlook.com (2603:10b6:208:3e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:19 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::60) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 47C77406562;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2287082254D;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 10/10] ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
Date: Fri,  5 Jun 2026 09:48:10 +0100
Message-ID: <20260605084810.1575539-11-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA1PR19MB6394:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7dfbabee-ee9b-4e25-87e7-08dec2df30c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|7416014|16102099003|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Eot63XFPdYXTlTlRHgHOJkxi4dbq0qRnX0Btn9e9pduV9L24R5zjc62+1397WTgu2WDeBuJeyFIK3UT81c2sFDOQ7ds67m2ssAHvMEXYwAxqvtXfTXlZwW3G0vCNDbcyVq+FpzuBVr75QTeNqQpjxlXQszX6PALzdHu+WVYtYXgdiBHQDHsM/4nsS6fryneXJIOT4WFa3K5ugqUmHwPyr8Ne8N6+pX1axW5eDd8MjrW0LkwRwch0yDbqTbrBDsHAJo8jIrf1pn2IslNZ0LWKok79ylqSVJzjJpKV36ITSza6y7fQ6vcGmyNODHSfoUgjkii+Of6/bQ0+/dBWZooDjj5QAA4KOKWGB7z//JN3ctQQxhoPfvc0jvjv+mDjPDBibgc+dM3bS8o9TBL0UgMgMwGmoDuuqK51iW/i/C2yaML5pqhR2IKu1BxHWex9i1WWInxXArEmDr+y8z5WITcFXXzu+CVXgva+tCZVApADQJYSRLbHxA2zLiW9dQUBSNqW4+mZiQxwiAib3ccuv8HE4NBHZsV9r94bFqeN7b7K6wrt2xpcRg+aNaOoOW3UYY9FyMtPipG+f3fKBiXTiOxF6iWo1i1ywzoYA/Col4rC/qB3nwaIfBPxDFhGE9mn1K4J6ddW5n4A7G4nhFY8wVMwmSE2HqxQ+lf/G/njVz4UlFV+McqJFyWS5pHjTzieeKa0VyesknJSf+txkv28sr745LlNaRmbD6ywFHTs8JLtE68=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(7416014)(16102099003)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L32da/PLY5k5MQU18nRPEGYTMV015/J3PTIQQCpFQSt0EPdwTp96SDSsTGOfGy3C4LETwZ15bOZv1d9NpUoGOl0fi/v0nORkepux+kSNU4Yn3BGy4vvzarNJB8qA2Xb0f5yVRiJYT6Km8f5kbgJs6cwQd5U8LgINYk/n2gr+YP3J+rdZDXdaAeYPCbNhVTuE58xWET0+f5cIX2+7jloGE5x+rzt7O4S3ugJiPBEkjrPd8YSyZXrHxm4tufJHOKZnOK9ZQMcN60DJb5S6m0lp5qumXmqjoNmWFA9F/9x3gSQHFfd7g7Q5deL/fRqcnZoLet6kGoR9pezYtltzdQopPBVBnbKTC+s96QyN2eg2PxeIfpRjYwByNU8GlzsCOECBZbotFagxANVTA8DegkWU95JAEXHGivkoTA6VAjZzysfiee9rpHBjSBu4WPQcra1d
X-Exchange-RoutingPolicyChecked:
	p3urHRl2jwX7Nu+sSToAWHBlEZWdMmVZadoCCqRfRXCgJBwrC5ljyQ7yuxPe2YPZvGVmRWzY8gR8Cpn/fEKRqRkPUxNbK6Vppmc34CYCrQCmBooYsxGK/am0AxDpA874L6oBv2q3Zfg3bFyassD/wYqwvhmW7nzOKcIG2F67D2r/eKFcAzepTB1ES3h4qAqjy4jBZ3A3FgjYI0p9rD4Gi8dKEsWht5ph357scw0yV6MCY1BKgOUCY7AkqHHQWYjee9Y4qwdOYf+nuYiVZgaKJ1YgzzQ6ruaI9SIgTfZ7DBklKzHhmHefOH7cVFfCttcaZU4XslGAfC6DD0oNyKIyRw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:18.1957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfbabee-ee9b-4e25-87e7-08dec2df30c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6394
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a228d58 cx=c_pps
 a=jAW+G/n5Z3iw2FAGIuuyAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=fcoJ7aZ6GZweFMwf-4cA:9
X-Proofpoint-GUID: kjBE3RcQ0o1cAC5TwHxgyMWl-TGAGgrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX+Ht8eOrup1qa
 D3YL/S+nrmIxug964ZG692EYMdEiYfTOhNgUpVkry8GIr12UitbM+leDCAQ1DfBe6ViPvElBhWi
 Ja3YtyW08aLkQXE2Lw6fcwfa62DuWEFPxYqhFuTSpWNzSmGpsz9piVSVVOrEcN7PYzePK7zw+YF
 I3pI52AhHtMn09dkXfAxLuFxB0sQqPusIAGVimRoV1oiRB2D3WdbGBH4xEX2DErPZ8tm7rrYypn
 FZY0ZujdlZBpoyLk4rr+qsX3JYnWQMrXTKPs20KxJaqgKKNg+Fib6oAiHOtoTZvr/XKcc51K+Gy
 JI75xw36r00FGs/DOZpkl0Z+RYZXoqQ1tWTsT9ptdKByg4DG3AP8WH/9P00o/WKIg47cduBmFhO
 gk6DugcG21eAdD0xQcvIe7bxqiVUivWxeYhdFOoSyfNLeGSOc+pN3ENQ3It3CqLxqjkJyNm4OsC
 a5uJGQe3uKOLMq76zeA==
X-Proofpoint-ORIG-GUID: kjBE3RcQ0o1cAC5TwHxgyMWl-TGAGgrJ
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111342-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6099D646975

Commit [1] updated the core to use complete_all() which means that
the wait_for_completion() will now simply return if the device
is already attached, so skipping the completion isn't required
anymore.  Update the code to simply call sdw_slave_wait_for_init()
unconditionally.

[1] c40d6b3249b1 ("soundwire: fix enumeration completion")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

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


