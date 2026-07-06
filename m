Return-Path: <linux-arm-msm+bounces-116860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 31mxGQWwS2olYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:39:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C07115D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=YqW7YnX5;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Etk2dMGy;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17A42306DCEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6382A3DDB00;
	Mon,  6 Jul 2026 13:28:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E82475F7;
	Mon,  6 Jul 2026 13:28:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344487; cv=fail; b=JDqEMK8xmXT/mATlYZurAp85/zN8yKh/11qg9VCFMRvUET/5kfA1wmykFEaSl+d/Pywow3b1uwWqThPI+GHiKhJH1tB3IG/5i0Jz6x3tYjDrUpTIeLUw/t2k1HErVRJNulJErYTLgxn/tJoLSs+JcIuh9yPsXbqCIXEGIgAriAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344487; c=relaxed/simple;
	bh=NVSkSXvZp+JHC2NMnSlDY0YHP9B3zzcilOpaV5pYq40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJlIqOehrOivxk5gz5xokr2j/T7gXaBOmD5gwvkt9iq5WFZidL4WMtw/BNhPLROJ3a9BNYcsfbS201hmkRFYSdgQL3gcDiWsUwLcs2jCxHRiCDxy/MH2s71b9knDtYDzCra8sRBWFg84tozZAtAGfj7YyFdvFZ4jAT9QnLmqdFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YqW7YnX5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Etk2dMGy; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664uRpd164142;
	Mon, 6 Jul 2026 08:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Exr9HRZ35htIMckdoh
	TfbIyqKI1BuQ817SEBISKcs/c=; b=YqW7YnX5Vbx0ss06HN1rZEcp3sSoU/ykxi
	iVZ1xJwDQXff8gNxgCRbRb+DHkmmH9oOQO2RaQm/OJxhG3C1oN/kJkHHsWH1eE03
	Eq6kHgkQucJY1eHA6I6ituII86jwB2BcG1asbPrDl7IGo5xcyV2+D1OY2Kdbbtbd
	THqWoI4RCCOgZYnypJvghduMxztpOCE/SAKPL/TBHlihxMU9JSGQlN5vgjjgG/k7
	ugG2EuEoe6WtCSNlxZbKHKwy4i2Gg5jV961mBGx2l5YFPsEbkNkxWEWiN8T31+vN
	drTlMa9NCRaMWeO5Q6Vc2ls517j/RTqWuPa3JCuclNstJOGTiJHA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020094.outbound.protection.outlook.com [52.101.193.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxjc7p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:27:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVIFvZwJn5GrfM6nwm58M0C3BbjPfgsBr2Vd/FmWJS2he5ogAcDvFkp4yBUIs5ISjm9Il5O4BQ3qzZD4l68UBj+QnDuV/DvqQIL1vKrTDQdaq1HbALAIwQyfIR/+g7r5mxC5MNsIbjaiNnAPEcI8ZvWAlWvgFh9plnqvW6zRHX8Zk/CB3b1k7rebra+z7wLYmghAWnp9qyaasCzrYh1Pz2dtw+U/TVEoODMU9hcyCfSPj+AXVv+5JaUJpqdJorYS9a0t23QlEXOOhmlzE3BG8p4q3LGmnpvPG7l95JeKeGSi/uziodrhip+2l29QI0iO18m462O6DYFk4vClSQcv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Exr9HRZ35htIMckdohTfbIyqKI1BuQ817SEBISKcs/c=;
 b=i2Bx3Z+Tt6B5GN11XXOa5wYHrx6gPMy9h6vPqex2ffUk1oZtWFgdaSI354p7J8txyNKQrLvp0GYoOAsnS6HwNkHHzKZW2NCA3VEOwUHGNg3YKSg5Jmg7GSpCKFmsbm8gu6FANhzwyykR12ewTA3PsVmWMK+zePi6JTPPf+1b9OTXvlOpsRHcJcK+uoRTU10vhdq+hNzscxm3k5nNhBm1pFhdow3+gbfoNJO7pzMfyKx3LNI76svDrFZQvJR3RAXIISPah3cfvBRPdlKGbeeTWI85okwS2Bm/0rMH1PJ2gKiGeTnSsPs5hKyp6dbHnFpuLgnkSwaEwxJDzaYzit4EdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Exr9HRZ35htIMckdohTfbIyqKI1BuQ817SEBISKcs/c=;
 b=Etk2dMGylqhLsMpvuFwq6Cwgm+axaDsNq3FauUxVSNM8gCuzbZU7zx0aqauRc7OJlK6Yj+ach0BeIQUGW4GtaEd5g3H4qrx9nJ3Jp0Q0SQcz2sMaXBD3JnmoAgQfB6WigPTOZTasg9kl+JAJs3mhDqSr4dsV9WpVSeAcAyf49F0=
Received: from SA1P222CA0090.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::22)
 by CY5PR19MB6243.namprd19.prod.outlook.com (2603:10b6:930:25::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 13:27:14 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::9e) by SA1P222CA0090.outlook.office365.com
 (2603:10b6:806:35e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 13:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 13:27:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C8B4406541;
	Mon,  6 Jul 2026 13:27:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 706A1820244;
	Mon,  6 Jul 2026 13:27:11 +0000 (UTC)
Date: Mon, 6 Jul 2026 14:27:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Nick Li <nick.li@foursemi.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Qianfeng Rong <rongqianfeng@vivo.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Message-ID: <akutLhJX+YL54gPW@opensource.cirrus.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630063449.503996-12-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CY5PR19MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3717b20e-5ae2-4201-c80f-08dedb624a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|61400799027|82310400026|4143699003|11063799006|16102099003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	RAgRUEMHu5EXSV30q7VM3e8IisWJrWZwIp8LZwFeqG6cviNwQ1P7+L+eo6OKXNomyRx7okut82nUC1W290NsXC2N3CzH21UFL0OLIF+nB4//XFYP2jsjpCa9wjCFlEuWUrNOCgqJa4M3laqfSrGrudIQHqsgSAXUHMgl58pNnHyJDsEIwA2e2mGo6S9OLCp3bjySn5ajl9n2Rh96EwyYcnTOVCEX9XEXJTMbVzQlEs1vV1Qp2Zs/FO+34aT/mvvqsyjhjnGpXAbLjVxJi1deFyrfpvPfeBBmAimzhiSaMj+8d00FnXAp4lFWj9aqFFYCIuJ5Ihu3+z12h8pEEDXuWUb4A2PWSCo+3/HnH9EWKDpI0MMWfl72oX213Bh5d/zmPODM/PHdgmGVMMx67ad/Sig9OzBLQpuDjHIWND1Fzys+RcfwO9Oh3mbyRQV13S1lwr01r8YvdQm7L8cmLW7A0/rgqRvcAmDYXx0mpVpwHsSsqnpO2Vsc7yXiP1dGEP9c3QE+5T8CIZdOJNhhoSgySIFvQmTQ6sHsvrLR1sOPU2Bg/P9D8URlYnUWckflO0k3DIim0tIavdJ67Zs1zLa2pL2+T3GDFPD+iWLmUNfqu0kui3F/HShXqi2MYZ0HRfJeslpdemwhqbevG7KruKZpkIX2Kf9Bpudx9ItcqN5m6Zv3MM3LfGk3TA/P1cu/EmxO5vCKnMtKQi1rNuuRZkD/Og==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(61400799027)(82310400026)(4143699003)(11063799006)(16102099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BYLrnBm03FbZiniQbA3LTM+ANsGO+i+1FZgpjYIv4ZsMt/pk5U1zy4PHdEcZTCqT1wi0Rm+g+ySw4nJeFjmOC7fu6PRhW9SezLflOvlW0fE8HaA5679o0gSvVz5x7pKnYQbCTmwf0Xfa8e2jpwODm9nQWEbezKHq8jLqk+7YmncYekk2ZofE17VISAqeCmDQpP+mBrPn3l6WNLYzvctjfUZf7QHZ2euL4EzwMie7hdwi5mS4SyScbQDofpD5QwuHioyrGSASLQuLqqwfea+TzvOP2A+zmGJ8tTjSr/KGMOmrUIVk4jq5svfi01fSWDrX+0a4tV9dfZXsOqonOhywaHooZkF5GRLJ8sJynKI5ecZ23uF/D3SzF+HPBbQb9JHY/5zcazAFxa/9Ed5hg0YcPt9gP/FLLQ211RHAKFWS57x6nWXjgXYYwa8b/2brFfkk
X-Exchange-RoutingPolicyChecked:
	gZGJP5GG3vAM2zzceWjU+pVmOLpVm3b6ucX+T4oEHWEkJIj4Vb9PkjhjC034xBIrm35p2xrQly9cAqxhgXJE9ma9ARu7naSc3qQ09yxQ+RB8AzW/Jd7lrfVbQCniel0D1GzP9jLkxgncFWkRB2OcOUtWRox1Rk1hg8wCYoGuhQqZZGsXUylV1McapvtrUaasv6ldO4xQ7pzd2W/VfM7qEFJoirGhM0XQOiOPRMUKxdW7lMLLPVGvkMBUrpwKQfnda968pcllGxCwDnYz0HiHN1NRtGVJmtNkQhtWsyBhYx+GrUmOcLj6+MF7ofZT8wNsGZ+tuif5wtF92nMm4fhwvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:27:12.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3717b20e-5ae2-4201-c80f-08dedb624a1a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6243
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4bad38 cx=c_pps
 a=R0VBx4CaF46Y8RBs4q2Lkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXwTog97vMthHC
 +IxH5nwq2h3uGT1wEiRMm2oWWLLLyXXbqodcstifrPKW2HA2sQ79yfsioysppm7/3U6Rcb4O8gk
 kaBGdaVzYTVXP71umnOh/hn/jQ8wYrc=
X-Proofpoint-GUID: rq18B9KK57Vxs1UMPugcMdC4Dzu1LRyU
X-Proofpoint-ORIG-GUID: rq18B9KK57Vxs1UMPugcMdC4Dzu1LRyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX33NIHcFxaTBO
 EBCT7MR8QUtDcZoq5KhI+QqXfMDh5rSd0sTJAUBdUhHwDi/6CBk5QwFHGspSOp4gqpXCwow4oNy
 LuknjImelQiieyCdgW1yCtEMZjk9wPu3x3B7jDRub5ym1KHAMhibD9db6TSGa9RPUVmbNuYcFz1
 HUVNJWSkElea4kGLwUZ//7DLbbyVAJ2vLSQ075Xt8SZ97q3BFYIFu1iCs8nu0hIpPvUapdZlgMZ
 JVtQrn23F4zpGUbXr1cX/3MUU61OzUcx6MO1BzPz4REay8rVekhKxcIGky980jlxWzg9JYZrt/e
 reOuiYiZqo0553z3Q3FIxQR6doex6VLCIvJu3KSclENVXahIXNPmjeRrmkAD+tvgqJ6c93LOJY8
 ZGlbGFszmb0yjInmiuYjcVwq/WBHd2tld8eThTzZoZN0MDaOP7a7KQZ2Jtc6Pwj5yXlpS7hbBC4
 bkQWEPT9pR+XnpODWFg==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,foursemi.com,bootlin.com,diasemi.com,gmail.com,perex.cz,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,cirrus4.onmicrosoft.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE8C07115D2

On Tue, Jun 30, 2026 at 01:34:33PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

