Return-Path: <linux-arm-msm+bounces-111820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oFdrF8egJmqqaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A991D6556DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=p8XyYSx3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=AYyRhwpH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111820-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111820-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C770731B0551
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02073BB12F;
	Mon,  8 Jun 2026 10:28:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229113B3887;
	Mon,  8 Jun 2026 10:28:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914513; cv=fail; b=Gwgzd78XaHgZN9ho/K4JSF8sMsQyGVEoQ//60xFCjr7pGKsCCvlfIQ7ZSglYIjPdBR9tJCIBXqHsL1zBu1yIo6wKhDPyYI5khqzR/0Nyv522mrPPwHXCjA2zMp3n0uvEYd1LzOjxXzgIAX3uN84BPP7UxljKHsH8yu07ZcWZyRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914513; c=relaxed/simple;
	bh=sahaIq3iEByxh0op1w2HquWLL+pT+/U+FVZZ/QdK7bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlWcEQzzUL8wphscswR3723+MLJXqnqZSaaEMpB1CR0OjgpyZ8SI5Ijo/5yHyqV0HEdbDlE0hwQO9tT2O2PcguDSCukrDeANmnC+IfQmtyBnuhKxd4iccLuw1YzxzAy4ZbOWcl8mD+Y52YASMymcUUbbhUkTZOArxiemaRwScDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p8XyYSx3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AYyRhwpH; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6585U6pU3726519;
	Mon, 8 Jun 2026 05:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ga1/cphHKZVK55BhH6/pORK+0DMa2KCkOGu1dtLzHvc=; b=
	p8XyYSx3iUY8vRhDtaYTkrJSfgnppTyv7woouihLAC42+yJDokYpCJiY0cCMon5q
	BdbQ3+mkuiA//geif15VcOJEcv+n4UaycNQZQMw2f0UMlHoP9qNoewVYUYKb+uPm
	BtO+OR6gDHJoz6cVTmRJA/K6bl5morEz8qD9N/DrKmGNb7ieGNnhPcbLKnY0ztHX
	iralH4P+OQ+095M4cHSPCUlWgj9C0Wvb18Hxmk4cls9XhRPw4TJIRQW3zcFEoCqs
	VrbXt6j/98WaFvPyp7iyN85Frcj5P83PyedcK5Jx21NUD9ggVQe6/hLHRybXllzF
	St6vwqTqiDdSIJ9R0SeB7Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021139.outbound.protection.outlook.com [52.101.62.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8q1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrZGlJadzOe4KYcQFHbOj93TqOsJaPqoRk0tS6eNB829PiCgdcl7f55oqKeStTn+h350a/TUcS8jqL0P7GkNPpPabhv++hl4BvFiV7HluzT+3JOf7O32OtyjLsh7bpqFAJPc6t/UIcyL0PkEo2Ll5vamdplcC0YPgmIjTN4xE3luaAjfFDSAS0wXzbSwMmjzPTQnM9nHxoRujbU8pSiMEvgEbzGhX2yNa9W+j1FVhOwY+S57k0r0bdY82jkf3quqRwEcn2uBa/FdqU9CnfChUr5kFmsThVwlyzKg4orq5mQtUewzfqTTo4PPalQ8OQ8rSvbJY743PRH3mhQMgf4+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga1/cphHKZVK55BhH6/pORK+0DMa2KCkOGu1dtLzHvc=;
 b=NIWLwgX28Hl2xBbkkXoLVVM9kIuiYdWmXNtjd/07y8qStuM72+8xtb1G+0+ebXQeTa0SAG3+fHG07HC34JW2pb9tVXe5DPBwIT5UQdygahSv0GCtYwk/8xvVo70m8xQmEkSiGOv6dN7JRZLwhOvDh76FaYiXqwiUsRDarEbCvzTlJOIPcWcUh2BDY3Nu+YyHlo7LxvWVEjuvUV0i/vXXvncaz7bTC+zSAYf5/Vvr2hiSjxF4OscUms65DYqJaREFod1YlbeI2Da+Jtb7wMbnU5k8iUcq4BAmrRN55y+xT+opTEPpNftljRy26gtEChElarsSOHAqZLDBGYd1pi0sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga1/cphHKZVK55BhH6/pORK+0DMa2KCkOGu1dtLzHvc=;
 b=AYyRhwpHdjtXLKzs3ZaFjPd7U49dWbGMnVD88E44RC6x+HRcfAjd94umXBzCV2gbGhD2RdVfN5wLwPQXKyWwdcUoGNAqb7CyK66hGcQQQjytFvWDknJMih+GmshQIj1OlafEuG2arS+oT0IOAQhWlxsds1fh/kOju2ZMAiGEnuQ=
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by SA1PR19MB6648.namprd19.prod.outlook.com (2603:10b6:806:25b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:27:20 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::91) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EEC6040654F;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AFFBA82025A;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 01/10] soundwire: Always wait for initialisation of unattached devices
Date: Mon,  8 Jun 2026 11:27:05 +0100
Message-ID: <20260608102714.2503120-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SA1PR19MB6648:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48537842-bd65-468b-fb14-08dec5488534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|36860700016|82310400026|11063799006|56012099006|6133799003|18002099003|22082099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JPqKLOvr6Uzm0tWtuqbXVEN9koA+mVtK0BlORVbyoPaSytAyAGGpfeR+E19hRt/l55NKyaC17mopsOy/GbDHXQO4W3ZKeVkYaurQ+w9upt3vaXQAVkQTxlYe/PeX9wFYbED5B0aXTCZTMLqui9xAA/SYi91ANPJgY1MSO+N2y3SNZu7yBIwaWTmhYW8rUhhsT94sYc/NM6PAabO0diWW0ElsYMHNi7sqPD7bZTKdamUYYf5CTl7WX9b477eUzKHsMBZ78h93ZiNLlhliZOFE7GCEnRRopfMx6epn0BqqL/rDE9jEmzLXR4l2aFpqSGUlTHKccaPIHTHwWyLxahpCatqJUA8nuZvYRLaJgNPXojVz6BbnfiNtpEZo6iwGG4SfRjpy0aQ7B8StG/3KcC9o7AAyENKPWdZNIG5neEhQ96gaejgdLasanwjKXWzbsoWMRdgwZEhtMzA0hTC+pbJC6KoyQtE5cmss/Ps9dj5FNzjyzftJCnRWlI1qVolOHzU1CClVFhkg1kI680lvNPTIZ6VSAa+85aOEOhvCoyjQK9dvNdjqS87tNrng9wOr6MFmXoAMaS3VO7MWqooWpY+sdFE4sI/8fPQc7S4m5UR+2j7b9SjAEiYWfd+cppBIimhjcjmzVShMUZx8/9U6WV1tCDZCtoC5FJHpuVetlHFOv0yCWwQa7xIzEApc3Ufm5e0eu8uuqHVSac9yp/Zl4QK+YQqrW1BpHcT+Oa2IM2CBhyU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R/zfPiyuksr9KbapbJeqo3nn61B18G3lmjqfjWbNjfXSX+ivdJI2Vsj/aEW+8VFhRz0SH4Iojip5cUm+IFGQxYnGgrQt8jE0C1C1mXsV1QhGTyNYNbWM7N2KMce+sbuVLPUsrRjFUGgNDHC4U1piKdtuZL8x5/KajpgSBBk18RcxsazaGBgJMD7Q96Q7PTlh7J5M1TYp8a84AZfPWGQxYRWJNg44qP9Iipn6bxr6j4Wdnoavz/Qunxz7bh84o6fz3qqJKh9r64zSvPo0I/w9RbXw7hfa4UPspybihqN3cjDz2HGl63a2UsEyUepHUAArnabIYunWMzFPYiJmIbgQvNBOlBhkkb/gYbW5L0fXzy91YAUE1GCz2bb0Nwjke2lMZo+4OseuEXsYA0wlDnv31VUMFaF5HD2jTc24ltt78jqAiwlOmajEK0seAkBp0yfk
X-Exchange-RoutingPolicyChecked:
	oF9sdRUD7I9jDj0lih8H5UnCGQRonykPvvIIw+Re0qeyYr2Lfy3uO9Z3mEldXvJwwrZmUH7KHvlN/7ASKgl3MhE9UJEISRYo8+igVoVOvjsE8HWlKp7FJbudBWbtSGe8HoP2tNSIxcVum4JRl1eK4as0tIYn1lSy/mRjq4AjFuzIwd/IGRrxPk8w/6x+yRZHBMOnsVioFIa2E4JzTNMfkleHKU1ULwLSMrprsC1EyrERPWqQIyTKxjRo+XJH3hVGANqWvq4XDhi/eMQ9KmeztunRlbKWVTpoqeopVk+1nkOhHx0FL+r1/dzfI2x8qRJCABaBHnsw6+qMnETqjuvwfQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:19.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48537842-bd65-468b-fb14-08dec5488534
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6648
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26990d cx=c_pps
 a=KLoCFcM1m9TCm4209S5ttA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=CWTouP-59cMm0TkFMMwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfX6axmrsyd38oY
 tf5LWR5igcysPluum49jcpHAC/sLa2gQ8ATrcSpw3GB3yLFG4jxt2I8QMm4SKd6z3WqIn47cXsB
 63mLk+hbQKwHvUxbozH56DCKfRluD5rR+zhxqKa9/4QkzWoIgXgwZDwb+/Kyo/XJCRHvAEMp0Iw
 q9awH/aHhItkMfR87hwcat318TelvN6ue/vSDg5V9SWfNQwh/TVtcaSa0Hz4hTexy+G7crEd93Z
 l/1si0HYzI1r8UGHZ5KRHHBWWjUQVQD3MOtZn3DihGLZy+pTwc7sMtF4smTl8leiFE8i4PmnE6r
 32VdPeE4wqhEQJPTa9t9R26FIHffvolLRzunVc/OXAn6V9DqDogPaD/M9YwyxwaA9cH7UpMP3jV
 rfhVYBkSVepySlBTGIy/m8ow0u4tMyz4ml9qEidVgWCVWztASUI1VbeRB3MD2lUCLJAmonIszzI
 t1LcVxwKTzrK5u2xYhw==
X-Proofpoint-ORIG-GUID: VaGCWbR99OdH7A19zu4D6sCQAEb4aPGE
X-Proofpoint-GUID: VaGCWbR99OdH7A19zu4D6sCQAEb4aPGE
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A991D6556DA

Currently in sdw_slave_wait_for_init() the waiting can be skipped
if unattach_request is not set. Doing so was added in [1] likely
because the core used to do a complete() on the completion so
waiting in the case an unattach hadn't actually happened would
block for the full timeout. However patch [2] updated the core to
use complete_all() which means that the wait_for_completion() will
now simply return if the device is already attached skipping the
completion doesn't add much.

Additionally, unattach_request is only set if the host initiates
a bus reset. However, the host doing a bus reset is not the only
reason a device may be unattached from the bus. Other options
could include the driver probing before the device enumerates, a
sync-loss, or the device itself powering down.

Removing the skip using unattached_request, doesn't cost much in
terms of efficiency and allows the sdw_slave_wait_for_init() helper
to be used outside of runtime resume.

[1] b2bd75f806c4 ("soundwire: sdw_slave: track unattach_request to handle all init sequences")
[2] c40d6b3249b1 ("soundwire: fix enumeration completion")

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Corrected some spelling in the commit message

 drivers/soundwire/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index ea3a24f805c00..b7bdf19ebb42e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1386,9 +1386,6 @@ int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
 {
 	unsigned long time;
 
-	if (!slave->unattach_request)
-		return 0;
-
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 					   msecs_to_jiffies(timeout_ms));
 	if (!time) {
-- 
2.47.3


