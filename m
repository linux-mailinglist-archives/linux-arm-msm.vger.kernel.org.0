Return-Path: <linux-arm-msm+bounces-113829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aNK1A5McNWqjnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:40:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 987546A5447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:40:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=qO5ATb2Y;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=rZPBQawq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12F21300B9FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F0E3749E3;
	Fri, 19 Jun 2026 10:40:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40AF3624A5;
	Fri, 19 Jun 2026 10:40:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865615; cv=fail; b=priK3l7jc39rlm6LRZabbDVtzQnyku9FtQZ8CLKWFKA5iXVtoFg/1Twvs+1y8IFW0mP2/HagsdCkR/0LDZZCo8rsewDJTRodoFCJmvqMFuGkpZ92crMdaLufgtjN3F7UhSj8hbctKuZOzF64CpF/s7RtYdFtezMJp21Vw2bk8Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865615; c=relaxed/simple;
	bh=55NxGL9npcHS6HlJwGZvkIFWT/0zqIDehAEYIzoMPOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHOhKZ45RQNbo4qb8tVXRk+hvsHZfHW2UIY2ZkwS/MlA1Eh4mAmcHl/JdxYpbUX9zNfRplQNkQ2T0Mvf0IUXQE4Q55D3GtWfdDuN2/H+LGpmSlQrZ9NV5FIRFT+5hF9O1K5dDOJmwC7igAwelj6+r5eDmLGoPyJTGGtP3vNr4dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qO5ATb2Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rZPBQawq; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7c9222848864;
	Fri, 19 Jun 2026 05:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eqCrcOKyOn8XAyC+h2
	Or/oWbNlkET9lDTBjL/V4AWE4=; b=qO5ATb2Yb2Lw6e7TUg2n4qMsDzd5iBiUeb
	WX55I9z8K2ZZ9TK01yH6rmCEk3QH5n8Vmj0feR7lzRm8+OjA2Mmv/ygR1+DuMzkB
	cQH+0R0Fqgy4ANoWNw+s9Q5glSeBmaVbe1Isu2qfPZR3zNTOhdgh921PvFgygneX
	ohLTqWlcmqftKbKz9icS3wVkHB7iGT6VX3QoWNO9Cq4yZ74ARM+YLZE6EKneNgLc
	j8YaWpvE79NeTj8iNgwY7jWV6T1lZGv1YOETRcO1mrlkJkGBKKhqLKSMIUV7R+EL
	+y/5b5irszy4bPsxLJ6IIByKS8Yczw18Q+FdhoYGkKBWRzc0n9Qg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020093.outbound.protection.outlook.com [52.101.201.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefva0q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 05:39:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWJR3abiyMEg2YykeS3/vc6WKP/yRiaswp03UxOA6yKFQ/NXdSb0cSFJxP8OsmqfcdTKp/oc8MiQot1Ul3CqJVg+jZ2SRKoeV7XNW1LDSyC8kkFUfucr2IyIwCatywkO1jqD0bD4F/PdXF3C8qqm7Znj5fpfVQAZEpybE7yLCoeMQAn6dBZcQWrLJhWn97L5pwhDkQib7EtWdtktS1Le3YUiiLPouwYfY0IUQaSnlW531ZB5pKc7pG6/M2ma7N0guxeGm9SHdlM9wIQISJRKgtOhFaapBNOmic5dbASR3AXVlD8f59OMvO+i1rhcJDaio6cpINlWJjmtJXHAa0/hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqCrcOKyOn8XAyC+h2Or/oWbNlkET9lDTBjL/V4AWE4=;
 b=I9vL6estGN7WLqiLJGsXn3Fca0/H8BhnShC9VBn6W5rOCjl2WlEVAZ5OIobNsfiLXLirsfxubF/D0jIsQJG2vRH0nzMFQrrdhCk542UazPjNXjGDh+HRbXI2a65EOadN5AINbiaPaZ9ZaZujh3Jomf/IpSiynCbIslyWO05vKiVmtoi/GYAHWRt8Uyb6Rp+6ZdixXKAf2LoU4lokS2ZXsHNMJNehOMa4KrYZl5OVLcV6UeHcwC/KUcKAc/rYMmUVyfPB/Y64vdkRwZ6gEUdh+gZfRk2M9RD2JTzCav7qCIOB3x6s+fCBQfVA4yvHetAkVSuyMy6gF/klL/DIkj1s/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqCrcOKyOn8XAyC+h2Or/oWbNlkET9lDTBjL/V4AWE4=;
 b=rZPBQawq13dFq70+SBjocqAsWCaorH/Ej4p7KCyyzc54B0po4SGWXzxNJ0Y852WsayRmcDXSHcuEZzTIzxWLIjHvQUY4Zvy6Z478bOJGVZruX9IAzmfNYRKb2F62Cl2eHDazkPgbrIs+hC2r61nmXam00bcwK6oNjYqTqEgc8zI=
Received: from DS1P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::12) by
 LV0PR19MB9543.namprd19.prod.outlook.com (2603:10b6:408:326::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:39:13 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:242:cafe::1) by DS1P221CA0021.outlook.office365.com
 (2603:10b6:8:242::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Fri,
 19 Jun 2026 10:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 10:39:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3AA2E406544;
	Fri, 19 Jun 2026 10:39:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1EDDE82025A;
	Fri, 19 Jun 2026 10:39:11 +0000 (UTC)
Date: Fri, 19 Jun 2026 11:39:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bui Duc Phuc <phucduc.bui@gmail.com>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org,
        Support Opensource <support.opensource@diasemi.com>,
        Nick Li <nick.li@foursemi.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Message-ID: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com>
 <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
 <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619101346.2ec49087@pumpkin>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|LV0PR19MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: 23131880-1b44-4383-602b-08decdef00b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|30052699003|36860700016|23010399003|61400799027|82310400026|16102099003|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	cMmjtLtI3FcFerFobXhR5FNHvDGJdhWrPbbtakaUumA0QwU8qQ/fjxqmBRZn1wNtLr/pNbUo4vYzTnYDnZwWkWje2KLi0IYXYjgpID9y+0sQD15CCifgTsqKKu2GPzXEEJwPSwClU68PdZq0lPoPoqMxcoZbsINnyniBIFWB1Cfmv0e/zfY5JRtyMNC34rESvcRK4B7yqkXoDVOmueMJMoPYqJ290ucbC8164ZqeQskqhYTocMcbQ/2AGzg76UkNgBZ63S8e4OFlZ8Vd/8kt+/+EN0xXjrL7H6uti5lMCCLBkBvGe56Z2ZrQoW5pPhEIHTfSjl0pJfsRdzum6nCOs73JDYYvyDfHOVAl5WaQza7msdrFuyBpUQQ7GvY17mJ3NgtelW0qn/z1a/fwATo/fPSNcm36UxowP/INbcitJaEjHlkwKQXX+4wP2JW+UHEBQ/JCfutHm9lAVOuSg9PelDE+I6PjXKqtxUSgpKE/6Qy2F/a90ZsQqbzhw7BDboxMUfjd0Q6h0u4XLcyApv69zqxoD760C9U8HeffCHdmLv7uy/s09UQC0grj0wO6mmd5NM/jnDTND6DZaH0tKMgx43gbsHOo+R3Oy6TLRXH4qtUQ9i98RvSTdN72ZXwGqhFm+fy2Ze5rweqWHz9T+ZrLtbla9qIIDBcwN+8ljLWszLJ8uZvsCq5Vzh4/gG7PqgUO+aWYWxqd82mBNBnQuffuxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(30052699003)(36860700016)(23010399003)(61400799027)(82310400026)(16102099003)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wSxmKo5nUeic5dduWSuouRqTebHlhpOqVNuORVkjhqUeYccjn4bWBuZt+oavcZLIsyUU7XLxbCLb66cQZ7zQ4z46kr3JPZxCdcV1SwMA6bqoWjrURlIs+yO8DlWn17+ZI2HPSCkJYiO0fIKBbAwZrXva9inEsmlG+nL8sPMbtwOQiH7V+hquRmkPOdJvi8ppNRzq/IKmzEZIbyFrOUyM5T6TX7Fjzt7pMsIgsDI45grWSx0+dUUBmxW8EoS6TluX/D3teSGHU/3PiRr3as1Q7KcTay2YHm8qi2NI7zZbxWP5ely+1T2VyX7jOP95AuhlAn3qe3VZ84V0ayATPG2ngRwsqcAN9ztRCq1gjjZP8FpCFhohVT+/lDM7Ap4BeZtsaFG47qLChXQNBcP9eF1BI+LQGZ1hR9l6RcRYQTjX4lZ2b0MPmPxX1ThhiioifAwJ
X-Exchange-RoutingPolicyChecked:
	c2tK64T7g1SQnVoooYChftxJMvUxSp9TQ9hovbQh+ulCCyRq9OUl7xWXkCP2NzFl/KLP6dBsRpmZab3MlbQL87thPUnNHy8ftGJChxRDilNDMOpPgL/7N9npDgWVWHmYQz81ZfO6iSbvYxJtrIiDV2XrKUR66Rg3x3BHBRGLRjiAEzBZ9YngWk1qcLTrYwisHFf+ooL1TVZcr/wp5u4RKWyYkh2Xxlo+wEB5M3mTXV4riK7frdJ/xWg2QF+T/VahT/0P92MTsLFFwPs2K4/cEw+TVe+suoOUeg4RxEBM9FLu34Lk107YOMxtrU00OPLStrw4L4JbFUsN+s0f2DOV4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:39:12.3315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23131880-1b44-4383-602b-08decdef00b3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9543
X-Proofpoint-GUID: fY95iPaaVKiVsEex4aTZwoiIFk5z0WD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5OSBTYWx0ZWRfX0Lby/p6xWiXW
 N46rwI1mjCOQA8vl2slgQn9G9utU/d5sHclbSzGqSa3neBCsDSunEK5m+82rAbVHyvndRqtGoKB
 gpJrUqMQfmg1gthLk58Qs+ZtkwNaQWmKuMC1D5xvsjoCmxDj14AP2gV0baSMzsrLXHnBzYM+fzl
 XZhLDONoTQQ6isQ+eenrIlhiK3qnT5FDGTOCoNWbvUHybGzl0GBIYJTipwzQ4ZbkAlYM8GJSoD7
 RCfog5WbzZQAkBDAFyfzFVBW3qqN6OLyt6/eTX3EhCuTZfPvwPiu1EVt3AA4bpzw8XZdmoSdRIp
 Gtdd1ztICLzcjwV++u/VYJwxNb42tSFLFR7v5XnYg3+/zrLxK+ltEQ9CzgKo0IuKWEorD4UCk1e
 y/fuI7aSemWk7pim+FUJojF5nYEAHWREOjap+i6iAyYLV3QTke7TtKhk5Sfrm0H2RRkcA3d2lkO
 bESZVSZzX4DIdXX4oZA==
X-Proofpoint-ORIG-GUID: fY95iPaaVKiVsEex4aTZwoiIFk5z0WD7
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a351c55 cx=c_pps
 a=bYRzraljH1LAKK9Y2O2T7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=e8pHenwNzZXRAC_djyEA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5OSBTYWx0ZWRfX1WgC6qFuPfBK
 imufkA/VSNPLuAkrJXYaT48f5sbRM2BWqmFzEOsWOLn5/ejnWNJT68RMj/u0Tm+2f+9+BAR9O43
 gZ1luTYPD3B5VDDyoY77ACJ57ut8yN0=
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113829-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:davidlaightlinux@gmail.com,m:phucducbui@gmail.com,m:povik@cutebit.org,
 m:matthiasbgg@gmail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 987546A5447

On Fri, Jun 19, 2026 at 10:13:46AM +0100, David Laight wrote:
> On Fri, 19 Jun 2026 15:20:37 +0700
> Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > > > I believe you have to use scoped_guard here, as there is a return
> > > > from the function above, if memory serves it attempts to release
> > > > the mutex on that path despite it being above the guard.  
> > >
> > > Indeed.
> > > I believe clang will complain.
> > > That makes these mechanical conversions of existing code dangerous churn.
> > >
> > > While using guard() (etc) can make it easier to ensure the lock is released
> > > when functions have multiple error exits, I'm not convinced it makes the
> > > code any easier to read (other people may disagree).
> > 
> > I built the code with both GCC and Clang and didn't see any warnings.
> > 
> > My understanding was that the early return exits the function before
> > the guard is instantiated, so it should not affect the guard's cleanup
> > handling.
> 
> When a variable is defined (and initialised) part way down a block the
> compiler moves the definition to the top of the block but doesn't initialise
> it at all, the first assignment happens where the code contains the
> definition.
> 
> However the destructor is always called at the end of the block.
> So if you return from a function before the definition the destructor
> is called with an uninitialised argument.

My understanding was exactly as your David, but it seems that isn't
the whole story and indeed I had to fix a bug in our SDCA code
that hit this.  However testing this out, results in some things I
find very hard to explain.

It seems as far as I have managed to test, the code below works
fine as Phuc suggests. It does not appear to run the mutex_unlock
on the error path.

int function()
{
	if (error)
		return;

	guard(mutex)(&mutex);

	stuff();

	return;
}

The situation I hit this in before that doesn't work was actually
this:

int function()
{
	if (error)
		goto error_label;

	guard(mutex)(&mutex);

	stuff();

error_label;
	return;
}

Which in this case it does run the mutex_unlock and NULL pointer.
Will try to find sometime to look at the generated assembly, but
this basically totally blows my mind. Very unclear as to if this
is supposed to work this way or just does by pure luck.

Thanks,
Charles

