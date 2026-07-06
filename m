Return-Path: <linux-arm-msm+bounces-116710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TswvBpN2S2pxRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65E70EA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:34:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=brcULryu;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Cu8oL9om;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF117308D646
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A414DA52C;
	Mon,  6 Jul 2026 09:01:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A014D98FA;
	Mon,  6 Jul 2026 09:00:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328461; cv=fail; b=QfVLKeRtWW0Hoy2JYyM7qZFz00LKyOyX6rRvci19mFDTmW5aTmC3KBp84xmeHZBSpLW6A16ieMBIejTNTV4yaNkHVslEQ+9RK8midNZqg0uo5NfPIL0Z0coTiNdehlPxufPt9Y6Hw4iT8/SEQkmpKdhmbDfPSG70AjRs2N9YqIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328461; c=relaxed/simple;
	bh=LVJVc0/ztlQQhDQz1RMkOA7VYwUAlL5y3njCr5Adj7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZpw0KsQjvYGec7Ig5HEAtXNii8Er+p76WOqLiAteoiuvkK3+aiXkMOyUz6xS7ID2/Q3CyDFhzuOnGDY15I23ugqxOLsvt1OqlGOJjYolu2hYUe0EGkl6y/JDmDMde49XNzE16kNq1j8VIT0r5Tp385WCrXIyuaPeTA301P/jF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=brcULryu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Cu8oL9om; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6665GP1r985285;
	Mon, 6 Jul 2026 04:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Dhg02FGmKi0958F/wkx0JyTSSjiyZyS8vaGzNsRGXdw=; b=
	brcULryuvDVZaiCFmlFtMLWkvgdXj8Evmi3SCNXdGHRtkeLsVJuwrwciZl2bqyU1
	kcZFdfGvVt4HrNhXsZJO0G9ejcmp3mnDK9l0SDF3Nh4Mhit9N/6a6FbWeKsIvX/F
	4OMzWVX/i5+X0yC3SwolyT0dp60yOm4Qvd/J/nxRG70n6TvBjQobnFt/U48J5m6S
	J86xM0XFzPAMgFIVn9MW5qVv6ygFl/ul2gFWEHsfY44y0NHCkk70h5NXC8xLenF7
	joQw9BxMOz5QlxNfg+uyMfU+VjhWO+dWqVwhUcdGSPXry6nRsE/EAuHD56B2Pmf7
	Sgg/OlaY7GWYfrpkX3GJHg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022126.outbound.protection.outlook.com [40.93.195.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj30a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:00:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmsmMEZOV/g/pwqTpGPFl2iyow7oryim72xJpugtwmxHPp8EVEbcCuyjXKr3ahh60O7jKUgbmS84yuducJ5vuG5K3sBKzs6WIRjT04YEYcEKPWDA8WgB8xkZLD0c7N0yfOWz8m2QRu0KZEjJDWaXs5ugrjBekyQfiuy9bnVlaoR26u3KwZsbJLKJ9M0NL2RhnCSivYgb1tFIjOK/sWoPq4+Lm2XXrdv4Vu957UydHT4zTocrF9HP85+4KI/QCChb7bMZqsjkh/toOSRQqcfGPRogbSSNOLsh16t9zwETUsaSpixpjKFpljUYAF9qFQYErOnemVkFK5pwqo+xND6eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dhg02FGmKi0958F/wkx0JyTSSjiyZyS8vaGzNsRGXdw=;
 b=G3oUtdxDZKFjEK29bUtRdQHFCM894f5CZGM91OtL7guyDkkItI75x/d7bgrAd8turAL0yFB1nR1rDQUHP+aLi6QnV16VL1E4HNjh+bZqa5dcNpK+htipW6niT0hLPeQKA7BybFPDEoZyyFUeckqrgxPiqemBuYwJOQB+vo19K0jN0X3nE7x2GYwcc7mKrvIJGH5/zL/7Xk5SWx9G3FwYW6qhHVTjd+fMZ3JFynlnOrB6FDiICXvz7wPp/ov6FhSu+P8Jim3vxXrRlpAtq3bq7rO7iUyiBl+HmLcIg56pJZcWADsiVy3t3ojmGM9rOtRudGiGpALa7LZl88Q8Ppn+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dhg02FGmKi0958F/wkx0JyTSSjiyZyS8vaGzNsRGXdw=;
 b=Cu8oL9omIHmRRnj3N+K5rBNtfkhzIGetlW2h1RlhZWqmQ8NhfoaNESvnLbXdCsd/k/RqnZavEmpXKOUgmF7q9M85eUrcfb1EeQO4eBYX612WXDHXvAem6XzBxsticHvSP03+QelmxH/1lOz5RFQCvliy2pcwkAum7BLGaqcBTIU=
Received: from DS7PR05CA0080.namprd05.prod.outlook.com (2603:10b6:8:57::18) by
 PH3PPFB555818AA.namprd19.prod.outlook.com (2603:10b6:518:1::c48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 09:00:19 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::5) by DS7PR05CA0080.outlook.office365.com
 (2603:10b6:8:57::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 09:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:00:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 249C7406542;
	Mon,  6 Jul 2026 09:00:16 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16A26820244;
	Mon,  6 Jul 2026 09:00:16 +0000 (UTC)
Message-ID: <44917230-34d0-4305-a07b-2cc86d608683@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 10:00:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] ASoC: codecs: wm2200: Propagate regcache_sync()
 errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Oder Chiou <oder_chiou@realtek.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, David Rhodes <david.rhodes@cirrus.com>,
        patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sharique Mohammad <sharq0406@gmail.com>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
 <20260704040044.2402-1-pengpeng@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260704040044.2402-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|PH3PPFB555818AA:EE_
X-MS-Office365-Filtering-Correlation-Id: fae9a6ae-f047-4493-0170-08dedb3d0074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|7416014|376014|18002099003|16102099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ckdsz87I9CdSSpT3r97xG/widnI5l41R01zny6hJIqF/l6Wlau9gPbWRGrvf3Mpoj4bL8noPKH68oFY/dHSS2UyAA+AuHKkJtuATzNHj2YRNGNWO5QnR21NYAhBdesRo39J07ryOi/BHhIcCA1t+wB1+kcX3QADuQawVqQ6V+psdK8lM2m/6/I68bcj1QZrmdRinMI6h2bIuWdZjwPvidCNS6HP1aUM7Tzj1B4M9KI08SH2DHIkmEvAOQYTxJo7DWKQgzTxavR6gxFfRSiQXa+GYsmyEcDCtG7n2ZibLrQfdTRMQFCrjOkz8UE7S0Oh8ys/cEPFdRo0JfCYTAZSrjs1lhi0YZWBMTxJl4nG/9m7u+kyhYt8phAoRio2GXn1a64MJh+pCJa3dY/87oElRKjU1yabi7gvCPNZL0ZmdNDct0h9zAm+XZYtVzN2vx3Trqn3Nr0bov0Z61s4kgXO8lQ95HmaYYWWSdORZHsc4jybaKk82q7pUi+RSfJbtfDdKBqW11ghS7Bh+9jqas9WMFjhSFoFQY9eTCp42hn7Di9GPneKdeBKzeGuLvCXqycHUwOJ88rXr6UHy5jXAZYl+4V+0AB+/GRYaW1SHBW+hnn+37V3STPyJbkWSKaCrDpqHzh368TRhovjiEYbJ8yA540Jw2mkX8MMtok0YkKimbktwowF8ySiQA9kAfmC+6lnnp28HY01GNy5+oskejlHFfg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(7416014)(376014)(18002099003)(16102099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tTGqfIu0EL670YRVg1v8IdOr+0AHDm7d5OiznC7IkTqClWUt63A7aHGomSIOMNQJmDpiCew6F0a5Q7EB+3lUv4hnGAj8A6CaoiGL4Z3ce2WF/6vG7rtymE66LGsAxPXA9kmKdCQ6MvnxrEiFZPBiJKUuzY7TC1/Il6kONAqWJjGCxaLbk9Pz9N4BmZtFFzYsqlRwBFk4Pe770X2Mge2vskaz7t78NlI9wB5XsQS59c3vZFe4STwkIQEW5tamYy90OLid/Ia2vjj1LBoz0CXhE/ocWZD4r7dATzKNN76saPCOpGm3HjdmEJ4w2s8+Xk0PQzq4PVjg1meNPG0jsEXnHTA13Wc+3OaCe+VIHgbv+tPgziYZ9jCPgz0vub629E4o3mqKvjbJ5kgfcICXr46MXq8eItnwx4Qnkcyp5bk6KlclolYY3u+jCA1ONIUfeo7V
X-Exchange-RoutingPolicyChecked:
	bJuG2VfSa0v6E1QuRGxMWdWcOYd4SeVzgm244ELhhAQWItUBgJNdKCS9Cooy/TmFJEJDWuXSuFfciujukwYOm1I/WwgiCEk69ffC6nJtp3Sr4dIHKdzfDWf7BbAZlOLzbJshx9+nLfBsNTDB/SLFe8/BCkT9uozZKPi6/ngFP2UY7sZfYvOxQCgRh55fqFiI21GTXKkWQzn76TovUCu9Zl19Ppq1K143ERxXQSi4U05i8G8FdbcgizYp2/HLdlqbBUjv9XnhuYeKGeEVk5rp1DoxbRDZPEFDttlvRYkxaa+gutreoclZIDNxgGx2DRUPa9E+xTATc50TTS576wmMsw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:00:17.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae9a6ae-f047-4493-0170-08dedb3d0074
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB555818AA
X-Proofpoint-ORIG-GUID: yypuKvnDNGzOp5FWH-sa3hzzodBWwglp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX1uYG7cZSV26l
 5z+hkJr0UGkuk1E5PvPhckA+YESdJ7QE/B4PK1dQdZjqLX2lWwEu17umnbtc5WKVqNT3TPmZ0G8
 C413pGF1neWESkVGT7kny10gQkBuwEE=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b6ea6 cx=c_pps
 a=uymmTM4Y+3Yl+2F0nrhS0g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=OhUeExd6vg79ZpmgEXYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXysNMuQ3vw7nz
 Q0WlV2lLGSmBQJ6AhRL5LPvL1KHA15tILJxvKJXt8EYFRJ+VjyiZEuZyHSe0j16tUbnGr5HpDNo
 6tIEor2W9vXrd/VFC93A2N1YLMrawKyklM6i+RKr8LOyfOI/XD7fdlq8Ybmh1uk1faWoM5ObiG4
 iMrUmpPjWPZwmAngTFUZFgyYK1ZcvjldVzG9BwVXTVzEUhThLtkQ1zNHZ5COSlQUSCDlLWBvTab
 /sKZorxpVzuuyGu5dnQxp1dNOfEZSlPK3d27jCmDXXk77fy6yQBTAKhjgjm80bGJaIJe5RRY508
 YmjjqHsR4Os7h5uHgfpETx9Zp1F3Z1HIS0eBJr8tLnFjqNk10lpU4KtBLT7+cjz/6T0lzVQmeVZ
 IK51qTfCa4DP9UvrwD6fwEJiPhQRK+4SuXiAJaLLRU8LM/dF+fL7eodAP8OrMWbxLB8g3nZ9Tbd
 n2gV9ya/kjR3ibDKzvw==
X-Proofpoint-GUID: yypuKvnDNGzOp5FWH-sa3hzzodBWwglp
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116710-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oder_chiou@realtek.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:david.rhodes@cirrus.com,m:patches@opensource.cirrus.com,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:sebastian.krzyszkowiak@puri.sm,m:shengjiu.wang@nxp.com,m:sharq0406@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,vger.kernel.org,realtek.com,ti.com,cirrus.com,opensource.cirrus.com,renesas.com,puri.sm,nxp.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F65E70EA4B

On 04/07/2026 5:00 am, Pengpeng Hou wrote:
> regcache_sync() can fail while replaying cached register state during
> runtime resume. wm2200_runtime_resume() currently ignores that failure.
> 
> Propagate the error, restore cache-only/dirty state, and unwind the LDO
> and core supplies acquired by runtime resume.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   sound/soc/codecs/wm2200.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
> index ba8ce2e6e615..bc78b553b6cb 100644
> --- a/sound/soc/codecs/wm2200.c
> +++ b/sound/soc/codecs/wm2200.c
> @@ -2461,7 +2461,15 @@ static int wm2200_runtime_resume(struct device *dev)
>   	}
>   
>   	regcache_cache_only(wm2200->regmap, false);
> -	regcache_sync(wm2200->regmap);
> +	ret = regcache_sync(wm2200->regmap);
> +	if (ret) {
> +		regcache_cache_only(wm2200->regmap, true);
> +		regcache_mark_dirty(wm2200->regmap);
> +		gpiod_set_value_cansleep(wm2200->ldo_ena, 0);
> +		regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
> +				       wm2200->core_supplies);
> +		return ret;
> +	}
>   
>   	return 0;
>   }

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

