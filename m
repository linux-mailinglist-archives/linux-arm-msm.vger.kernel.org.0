Return-Path: <linux-arm-msm+bounces-111338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fc5JDZmQImoOaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27268646A7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=Q5Zj4WAQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b="e/2vbOuQ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111338-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111338-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26816305C0E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DFD3CBE80;
	Fri,  5 Jun 2026 08:48:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1B495523;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649339; cv=fail; b=dtFwRXvhvk7O7+pTKEZ8lywPJ2M8WyrPWgcEjeRJH2S71juk1TRoepHAb4d3kRWJPHc8Oa7SRDe/qUEW1DyGXVMthbpt+/2wbbcE5/iaRNS6c7qNehN2YMyLuWLiNZHnxH+dFeLlhdvOZts+EN4ksj9ygWCGCfFO1x5UsvrbOsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649339; c=relaxed/simple;
	bh=/PSPI50Ru4vizBocCtmQUduKLKuQ7mmmO3I7BonfFHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vq+eUVp1TlVT01kLRnw9Ce3w3zQSuLDf2+cD29qb/9JoGzrnyMF+e+MJUb85ebIX9BUzMeJs66vn794Xj73c/5zt9dKwCyKxYRyjn7+ivSG7CyUzMbILnhb+0YwBc8bVJxxu91qaRNorEjF83CRE34K3ZhR9Eisj7iKAXwUeI00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q5Zj4WAQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e/2vbOuQ; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65500j5U2067866;
	Fri, 5 Jun 2026 03:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JL8fo63cqzkdyCtQArwt1GpDA6EIZO+NP8OrL4Yw0nI=; b=
	Q5Zj4WAQB3OSg1Ndvblir3l5dqJYwDEdJWE9tvA7FcRGC/gXWScdX+5jlhBa0DA/
	UYPwWYMSZs81mszQLi1Lpy2gt8Lfd9OxZOSE2+juBkP4Ofgo+6NckGXd5rjlAh1z
	HojjQpUMr0IiOdF55W3pos0hH+rVMN7VznXfO32XfMjwH2sWNsvUoqP/g85x9uVD
	dls9j8oTinsT18KTuG9OCY/gKZP4BuVtDYEVj2+T4sdAB6Wy+N8G5WX5ugcynOlq
	ccwFpeuReTd6lu8yaHx29+XVFNhGpEeR5I0A8DutiTP/yexBbvnPDmxbL8rqB4CI
	xTkWbpl75MYi+1qd9IzdCQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022101.outbound.protection.outlook.com [52.101.53.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuqDoucYXQ7XGvFmco7bo0wHhwMXWo9LZG1RyFfW2Cu3QOkdLmcuTKaZDBuBVCxIholOmFg4nOTkmiIAJorJEXUeRylDM8HwlDvVKTbbU0LcPTwr6J0fXpkzREm0V5NX3IAqUCFiXIToMZMenPJOlL7BQXz04YdXjaK2HZo3Q6zXTEd6x00TbP65uA+nmwm2a2Q4zC79xUN9FrPeQ0t+JEhCcYdzA+mVdk4N6l2mOqGIPKwY1QXPK1AfNj6YO+QEYZbvwW7fKutfx+uYgY5oSp9XJ3JR99mKRxHLOwLsnVYHyzFUY8vD8it3khBQlc4YA/IZIouGzjwEYM2GzpMa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL8fo63cqzkdyCtQArwt1GpDA6EIZO+NP8OrL4Yw0nI=;
 b=qnMLwFgA1+zoX5/pI5qRzZy7PEUcn0EyNTvQ0TYnzgS1KGnD2IeaRwqPdAV9cVfjLbBLEChRCVxFIb5X2mcpCukhnghWis+hAR077GmPB7SsFBThgxGId5kNhgPdVoiDs2X5+vi/N5yRG0pxCucRU65awNLroMRXR6ZgYPRf/uy/JT7/AR3Tloa+iS+VaeaXzJlAqoL7UPCnIJqHByIem5Eok2ti7yLBJz+v8dcjk5466qr98/1D6863Km4la7zIDoRHzxuXrjlqpGoA6/Ws0TqRNPtuvBdrRNB9vHBXGP/woB9E7IT3CtueYg8QXQftF8adlezklTfez9u9CCNwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL8fo63cqzkdyCtQArwt1GpDA6EIZO+NP8OrL4Yw0nI=;
 b=e/2vbOuQsBl/UUkKyuXcclu1LHfVDndBB2kmXAIIqr2ddwaZsP/hXQU+dAZllRBATHeDCSo4i5AIr9p9f4fxOgl4TfrBxDFDP0sMg/mZ4QZy8Qv0VriaZW2K4549XlvXyr6A+kA88fXueI6a4B8QyOlhmf33ahJrEwjfdTO0KSI=
Received: from DS1P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:44b::15) by
 IA1PR19MB6521.namprd19.prod.outlook.com (2603:10b6:208:3ab::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Fri, 5 Jun 2026 08:48:18 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:8:44b:cafe::a7) by DS1P222CA0023.outlook.office365.com
 (2603:10b6:8:44b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.10 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E993406559;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 12214822545;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 05/10] ASoC: pm4125: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:05 +0100
Message-ID: <20260605084810.1575539-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|IA1PR19MB6521:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f46a3057-7c1f-43c8-4a35-08dec2df3075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700016|6133799003|22082099003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Qz2c5pwYnRb+rraJQr70rnDN9btgv+Dl+PrDZdYQryHDscVvBI1kjrcdBM+2hT/yqq5Occ7Re02qs8OoiI1LHKHLNq96de+D5e6pbhpNAr3WtbE8NBSw8tsOOUrF7U461JLHz3tMFay0vUcGpV9NIH2QR2xhmcuIOUMGr1d3USN6u0WRNG6Zu5BB7HG5VCvUAZirHiGGZNGzdoMGHvwiHgv4+q2w3//rT+gSyqPLilw4d5YTy5fSzitxAK+7uOyB49w9jYLO4smgziCNfvExTFxHIjQkiUdomSANudnVbcmWidqlkPgRFfVK8+4nZb9Qs6XOiSNUmuBbjpKMXuUvAsuon9pcaaTYbH6gskZWpqsXOLw92Qm/GgcfBvvUH5gQEdY310kDLhmMtRPqa8/6i9cAtX1XezgVfDaQPLJhq5pVhNQwWs6KKpoT9f5ALA+S/SNrBzcF6g2EaupjHujD4TVRVKHc27kACoRkvSlVa+4Dg9Ko6XYjwqQODjMH5ahLLJvZjWk779lJr/RU79tjoXD54IgG/pm3L54chVkr8zK3eAQ4fncDWpUP1JWbs8f+DXTDBAVzpUrFonxLBaS7S6vQCbeQul3e24INdS+SvC/M69IHaGDkRC6+uccmIlXDxPmbxTIHWC5UmswW3cSYoywPoAaWtKj6IscwFQQNGdHTLqF3TJ2odBNREpih95vw8D5/yYkoM73E2+MPJNP/ykcwtk7Ui6ZeaH76B6NjhzA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700016)(6133799003)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	26hA72Igoq1Nw562DKrEueQdY918Smt7NHyP+pljdn7/tTCYJvqbQbYptqbH2ffdnQc57nCrJ+78dQKXl3AcRNyRnPbdjxS4TKxbUrGMisav3+Z+0o7uVC1u5rWwySjL/1B9Bbaf7DWuDBBXWcXH7bfvjq0/0assQNods/7r1Yv0mlSnUI2LP/Y8IUCU3DgzLmIpsNVHtoAdpLw49yxT7+RCviuvOisUTguzbv+dyMlQ5IZAA0dI6Jbaji70jITpycmVjNt4JBCv6PROwzA2/dYLWWQ8w9oeaydBzgW9SpA2TVvk6utJgNwFkKczooX+1xMFnUhLGj1ucdp4nlACQOneRpA1XY+GGHjkLvSO4NDnI3Hs0sh6IylRi76Mb/eeVO3AtXgrXniXcEeDSY33scjDaqHJO5La+mcqWhOG/SMtfln6LDqvqYM25fy0lFLH
X-Exchange-RoutingPolicyChecked:
	fD2knXluJHNEle01nI2EvI+8yaKmE1+BeNT8a2S4vg/R1JnslaIxiXOqRkpkDBBAr9XVvm3N9pyyctt38xa4iIzzHhZnArCGkaTuP0NRj8qM18St/asF/F4H4z4iCI6e0ZYpDBbO3fVgjRYa2jrDRbEUT3j7/zowIgV30y5HHAasn43ROeW8BW7Drje4gazu7H7x6HwjU8DldXOmDXfTVLW+HKxc/63+1mvXuTFSvCjuzdt31mlT3lZ9KpIxV2XPO/xo8RnWB9xzagXrbsmF3qRsiH+2wNL6ppQfcuReWixTUWVmfOD45fq0aT2e9x3nySfS9KefO4dAjjjEU+XTYg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:17.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f46a3057-7c1f-43c8-4a35-08dec2df3075
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfXwSSogUFprY8m
 NKB81Y+1G422eqnObd/MkWsPihZLsOrgf5OoWR2Pb0X0HpatlkITQKjgtyCDwGxX6hgZaV2/8qx
 UEePWqRFvJ32b6lBIm9WdpR1I0YRidSdosBeFLEDeTDnKihbyy6f5oax4Jn2AzsC9dMdFTN8VNP
 U9VfSNujdVDyB5/GCL3hYSQKD6c8uVlhqoR+tc9wKyiDSLoNkxSaJB+WRn/U/pCztMskmY5XM8t
 FAqL2VqR0meJTWmOZFFDdBVGb8Ef8SOtyl92Tl4vCYGj7KMn7fEn6WDyvXsumhdRorjEWDm+1+c
 SuGNJH3fAbFrkM56ikOBGFH87aNgcIdN5ypdjle7gcgYSgRnVW0ccyUkLf29DeNzA9DoiyWKqPp
 sKjUY3d8kOYsXYumbrOZ9xqfjNG3qbsbj517Wh0IQmXhhVPM74K2N5ISosbAZ1LOzBEcU2/tstA
 QjtSyIBrTZeqw3r84Qg==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d56 cx=c_pps
 a=ZOOYKzJuauqLjokEqQd8dQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
X-Proofpoint-GUID: 8bBGp71CRJp_os8JMURbmhjupbaj-zLq
X-Proofpoint-ORIG-GUID: 8bBGp71CRJp_os8JMURbmhjupbaj-zLq
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
	TAGGED_FROM(0.00)[bounces-111338-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 27268646A7F

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/pm4125.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 1f0a3f5389f1b..29655175ea289 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -1309,17 +1309,12 @@ static int pm4125_irq_init(struct pm4125_priv *pm4125, struct device *dev)
 static int pm4125_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = pm4125->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int i, ret;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(5000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(pm4125->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, pm4125->regmap);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.47.3


