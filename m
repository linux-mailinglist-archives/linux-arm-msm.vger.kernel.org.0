Return-Path: <linux-arm-msm+bounces-113965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0OdsErALOWqYlwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:17:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE326AE9B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:17:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=orVwF2Q6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b="ia1U/Ik3";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B049300B460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551683A5429;
	Mon, 22 Jun 2026 10:17:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F63A450F;
	Mon, 22 Jun 2026 10:17:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123437; cv=fail; b=Wc4kUT0ghbBlBRqRB734gmPwCGXvAI6i/zYQCDfHp2bVBfhAltVECrF0MnVXjDHr1PBZ0JSWb26e7Tt0UafFDNLkqi2ebY45PL2Jw/xGA/puGw1K3MpQoG3/NvAR03yGN1NHSfF4wAtmYWv8OnBhyUIPR+bqvpba4GsQPD34ybE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123437; c=relaxed/simple;
	bh=KWhsY+a5Xo+C95JXbecoPuZtb7KtIZIGxbv/ixfIybM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5iEf6B0hwO6+ch4MLl9j+zxSFoP6bewgnDglbmRMiqMqdSqe2UqN6SUrlkhFUZagLr8OLDhrd9vVD1vPcDm74zhYnsT+grZ2/CyizU6GSu4pinqQlQBvTgj8d3abqpXWO5x3qMYy1gs7v+z15cdgdws4Jnpd9T2vPaq0Isfadw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=orVwF2Q6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ia1U/Ik3; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M6JhOe1318347;
	Mon, 22 Jun 2026 05:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=CscLT7gTR241Dar9aB
	qQfX+DPBuDVvVohu8c0qdiJZc=; b=orVwF2Q6yzTlToTa0KndpZYFzwwKbtYr/S
	jx9upvbC+85xJmHcjg00+oYTHznHdodwuhqPtzWqCkod0SVkeXG54M/T0eV/7Rzc
	SN9tqlyulDk5lVqCosSktlPwFWZmLsu8mIj9ruYMqvCBGjkUU3HvoR//l2tAkxPg
	a0ni3XUoAJDz2LkqV6uMNoffwJUbjqfDAACfX8dY/6sLxuHwX15BL6k5836YrbOv
	x/tQ0eDOl8H54YewyrcysRnUDoJUjVN+WT1Z2tfbT2cFTbmhnBeJv/9rN0yIyNd/
	4+iwU7Z933koCNxontyeWIp3pVUj22J5LVM2KGAGpcK7FchXyt/w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020123.outbound.protection.outlook.com [52.101.201.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x1r95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 05:16:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAI7Gs5gwvKSZ0MQyCP4RiywAMfXbXstIQgFyo3jpJ83l2XSVVae0SdEzuxww8sldEc6rBny1vwMBBtAtX1qnOSpHRTGWwt/M72IYM+9OOHAj5ZfhLxf02WO4Xv478w3bXhEhPaDTcrMYYHyR47/V9aWNnz0+5hlS9lvNuaMqzVUTGJPYj3/yam3Kb4Q4infduvv8vrD8p5nPWMa2b0xYhcD28dXrsxsuCf9UDvqwk6uz0cjgeudpH3Il8oAtx8knjKg8mkkdELiEnWc7a3NIYPyN7BjhMZKTwmIvx590NbVsQJL+iyAXT4C0/uRkQ9ld7WkPUKc3L7ddBr1u5ijSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CscLT7gTR241Dar9aBqQfX+DPBuDVvVohu8c0qdiJZc=;
 b=Vmy8ZWi6Kc2NVn0g5/L18kBGq0EYWy7jojtxz76sn7dO46KVi0bIZv1SD7lJI9rpyOPWGXg4HQWk3bqZS3bXj8nmaNtWv/jclYXeM96dldmlno9OVkCZxfI/wEz7578bD7cy1KklAbR3ZM/elIC+bdPH2rk7lvEG77RFI/YwChAK1oqgn6wdfwUDfZiNsnC7mhBlxXSNqTqJkGgmFB6yHmZeTTjbc6t81a0yFecQ47+kqwRucZldRu7222GDc+TLA416QDrFVsjQAaVvT550WybxkUG0Ju8lFZpO/luYb1pA8xUVegrB5YCk+aj6TpvidyKPayrSAvIlnVWYqzPW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CscLT7gTR241Dar9aBqQfX+DPBuDVvVohu8c0qdiJZc=;
 b=ia1U/Ik3fHoyRi8MlNBV0BFDTSJFIl1+1LJFVIbQHQlxYPJDGxhnacDz0VDDpuNH6d1rKioYtNTS65rxH9nqk5IGBTySUO6sU7PcKteSa8f8ipXGsxKECLOq9vkJT6K9F3wpyGJLTORd5yLMzrH9kiMyXsfoJSLDLRUUKFxG6S8=
Received: from BY3PR10CA0030.namprd10.prod.outlook.com (2603:10b6:a03:255::35)
 by PH8PR19MB7143.namprd19.prod.outlook.com (2603:10b6:510:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 10:16:33 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::7f) by BY3PR10CA0030.outlook.office365.com
 (2603:10b6:a03:255::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 10:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Mon, 22 Jun 2026 10:16:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EFD93406544;
	Mon, 22 Jun 2026 10:16:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D24E482025A;
	Mon, 22 Jun 2026 10:16:30 +0000 (UTC)
Date: Mon, 22 Jun 2026 11:16:29 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
Message-ID: <ajkLfSeJDAG53/ZM@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
 <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
 <ajVpMYzqnSc0x/YB@opensource.cirrus.com>
 <d4c4ffb9-8ea6-4fb2-bcfe-1e2265c262fa@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c4ffb9-8ea6-4fb2-bcfe-1e2265c262fa@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|PH8PR19MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: e407bf34-f18a-47e1-2f1a-08ded0475597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|30052699003|23010399003|7416014|376014|16102099003|18002099003|22082099003|6133799003|3023799007|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	MqGPoUxypWwIkmY6OP0vh3lTBy0fiT3PVOpubD3T1InzV567WdgKpRihqM3gSHefraWak1AYgCE5G2MQLRCUL2kHWNEERtlHMSEq4nu4257vr5w+tVIg4wPoSYSy5UDkOmamCGizdEIGN3PNJgsMru667Zxd/03+p8ya9RLg9IReoSsBOSrSx7DFzGcP5NhNMC9kJm0KT2y8F9dGlKaWszC0lTI4sqJie2UTkyzx+QT8Ng0JE5xEb5raX/1Y545XAxjzJJcPpJb3/q5uqO91ZDcor+y4XYajN9eGwz8+thYurPWmoUMNTSDHL8QvavfIxaiBVStJuzUfqaJ48MYd9M20DB2uvYZlYsOLDCyYMOQdRr696aOaKyd3IDm2vOVypQNL/SHpwa6wpCmwfCoXh7FquMxtispuA9gVS5u1YA74ZcDFv9pvKUyHnVXpJtXBq6DKJFOQk7orGxB6mvU3KnjfYC5H8eFL4bRp6zgz1DXrFwVFwDvAKqJk4mITRocMtCOMvxzfd7lZXDT3aG57Ip34PfxN1p9qtxolCUmdtL8m9G0kGTrqNftgSJNkVdmCKa+KOa5N/CckOc1HnrLIfqfa3Go0dR7guFJO4j2gGHNkkZKKg23aHRYs0VpThdsGLL4F8RyEE2Sb0ijkfL0UNVobOWWhPZSvE79JKSRxU4oWKN1aqqzEwrxehKYLtvDt33SFYCO1A/IRsXIWf34T3Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(30052699003)(23010399003)(7416014)(376014)(16102099003)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o9HmpU4Y5N1jyqdmAqV1VPL2URyoENTUdUEkd2H5+rMNE/1oocdEW6v3Xjl7d78HnCcuKTki85yQ63bgS5FtmjpYJrAq8DLDF+seb1x0R8SfrBiJBqyFmkM0wVHtPm2T5VAdY2hvHvYn/Hhu3XS5JnwX1co/eIXRDno62T+CeDiKeeTdJ/we0LDxpC7jbjhXPlBo46J3ejyG9PqZkM5tACVOUinI0KsRlm2PKbSWPE/TLuAstmaVLD3c11D36ASsNplpqg52Skj8ELdGoWMgLOp51+atcAs+A+WB4iAUcXgutynlgsfKUT+9BjsRQ9f7K1aoog8U1e+8bc2YwPJ7Is6ka8y1GKkSNs2H+dmD5QUNWXBj7kWZ9tMINv/1T+uCNsNTH3mIjGMJl7vRugNR4oaKEW2JSAp2QZmJxpCfFN5bJk2CkpE8QbTDwzb5GrEX
X-Exchange-RoutingPolicyChecked:
	L3Werhg/+hmHH88opoZ6mSeVe+K2BazHWlbwakgrPK74yfrgwoHrOX2FAMOKfzghPKDlFkYjnbTbE16mP2OFjZXIry2nSB7rZL2OXvfaXMHUmXhmNTkz8qABjuR9IV13sArtIqkTELU2fnsSyBuW0TRTdbBskmP7WWkFh/4eTekQg0WL10JPsv1NdyoRX9bXFE4j9pNIYKE8l5rj1UXISGjR9HhAbpcKyxnYvJidzPJvB9nqwTbSSK2F0aY0t4WdTu400hZ/W2SD9+aGPUV0yTktBNOL5J8NkJaTj7n268Hdia17dvDpZQGtSG0kmA8bOB6hJUsDrrlzNkBTkOnJ8g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 10:16:32.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e407bf34-f18a-47e1-2f1a-08ded0475597
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7143
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a390b87 cx=c_pps
 a=/J5H70gqsNCigf7dtRDCFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=REIdru0mGqBuvD0yt1oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwMCBTYWx0ZWRfXzjVGN6QMpetO
 5qRWmPrs3C+YXIsgtF38Q00K9JCaU9l3dnCjEFXsC0UGNuat8iAbEFdtL8Dop8r4uKwiqBSZ434
 D5PFYFsQXCtrLKD1aC4VwQQsj4ZKegNq1bCtrCsk+F2+m3EszoPQNoaO+GrTw+FiA35NIzkisMu
 +Aq1/YVuwsy7Z1SHzhGro+diEbkxITx/xvtyKkfcvvRVqYFiUzl+ff3ryPvHYYQSbsHpgcdisRv
 ujPm80s7dZxup71i8pTKI7uwXrEadHCCtIJ/1DVXRh9iv3pm6JDR7dGBSSdQNneJaKDOUWyniaj
 1GM8Fy7SpvyRVV4+ub1rocTj902NCAbbCRXaWgFWfXZAG4LL3/otdF7CWFyg2wmcOSJARSQbnBe
 1BwQownoaZf4YQjJeOaZZ0RXWib5W/lgOzbtI+OgckWLEioL/KGpf5e7yP57V98gVKHOpIWHUGt
 +pzC45KfzBY+elcDpsw==
X-Proofpoint-ORIG-GUID: Jr8jzhjvhwoR2HWIS_NpXjSlF_xD1rzf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwMCBTYWx0ZWRfXzSKmA2/vzQ/a
 0ML6r9cKGLIiSGVws3sfCjWtaiO5a2JC13ymiTr/qImv27T08tmHUw/9q1DuYKzG9JR/audNsea
 cTvojrR915qN1NRy262WiFATvclGZtg=
X-Proofpoint-GUID: Jr8jzhjvhwoR2HWIS_NpXjSlF_xD1rzf
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-louis.bossart@linux.dev,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
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
X-Rspamd-Queue-Id: CFE326AE9B2

On Mon, Jun 22, 2026 at 11:44:01AM +0200, Pierre-Louis Bossart wrote:
> On 6/19/26 18:07, Charles Keepax wrote:
> > On Fri, Jun 19, 2026 at 03:41:44PM +0200, Pierre-Louis Bossart wrote:
> > The problem is mostly from the device side. This usually comes up
> > from a device reset. So the driver does a reset, device drops off
> > the bus, the device driver doesn't want to carry on until it
> > knows the device is back on the bus. So naively one calls
> > sdw_slave_wait_for_init() but there is nothing the ensures the
> > core saw the bus disconnection before that call so it might
> > immediately succeed, causing the driver to attempt to access a
> > missing device.
> > 
> > Yeah the fall of the bus is fast but so are processors, you need
> > to actually ensure you can't shortcut the wait. Although typing
> > this it occurs to me it probably doesn't have to be a wait one
> > can probably just manually reinit the initalization_complete
> > completion. But hopefully I will get this series ready soon and
> > we can discuss on there.
> 
> Don't we already have the interface to detect a device was UNATTACHED?
> In theory the core will invoke the update_status() callback on
> every status change. Each driver would use the information to
> know when the UNATTACHED happened and likewise when the device
> is enumerated/initialized again. So far most drivers just return
> and do nothing when an UNATTACHED status is reported.

Yeah so update_status() is the normal mechanism for a driver to
know if it becomes unattached AFAIK. Indeed what this is working
up to is removing the code in cs42l43 that uses that to track if
the device is attached. Although also now you can also use the
intialization_complete completion for this purpose too, since it
was moved to complete_all().

> The only thing we can't control at the moment is that when
> a device reports as device0, the core will enumerate it and
> attempt to initialize it. If additional time is needed prior
> to the enumeration, we don't have the hooks for it - that would
> not be quite standard behavior anyways.

Its not really about additional time, there is always time,
events in the real world are not instant.

Thread 1 (driver)                 Thread 2 (core)
-----------------                 ---------------
Reset device
call wait_for_init()
                                  reinit_completion()

You need something to ensure that wait_for_init() doesn't skip
the completion before the core calls reinit_completion(). Or are
you saying there is already a mechanism that prevents this that I
am missing?

Thanks,
Charles

