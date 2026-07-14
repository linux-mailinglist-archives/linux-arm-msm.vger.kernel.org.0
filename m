Return-Path: <linux-arm-msm+bounces-118992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xf+zAIH2VWoSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:42:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11D75286F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:42:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="SOyrmpr/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=RJTBbWqg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118992-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118992-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F11E3019912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7006428828;
	Tue, 14 Jul 2026 08:41:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C740DFBD;
	Tue, 14 Jul 2026 08:41:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018504; cv=fail; b=PPMCFjyXRR9Ovt4Y/6BlZdLJHnAQP6lqOf56PAFK4+q1IoEVCN5qb4ctbbwFYFhb0+jYkKp+1bZcUQdhGvvE0P2BQ6MnyAI5zZSMRl1NXPlfvvN+2YkPUK8EW2qr8QXwnvT23bI7hdV/6hY+8GudI7oYa65ZEjBnbqJRwttMZeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018504; c=relaxed/simple;
	bh=9EqJAePx5+THVIA8zpDIfVue/2V8Lot6ZLY39i9fTio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMj9k0yey+kbEBMw+GaPP8gam4jIxPMGxmDvcg6mgALewjZIeYMSA8ArSdzzlYuoVWAdjWcViUHnbgn48DFXZgVGHOX2zWzLs9oSNzU72kS4JYOPbrR86g+Jq7FQ1v5LK6FKxZbsWdCdaVJvZbQRAG7/wbcEWYAm5KH4/4F81Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SOyrmpr/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RJTBbWqg; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DEaqwg2194231;
	Tue, 14 Jul 2026 03:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VE8zEUwk00Ow0jPlpE
	KL+YhLDoxOLy48zl9YyZ2rXRw=; b=SOyrmpr/5plTkQP0iP6c2t4Mxonvrhdzho
	FWOZl4HfP+PzKd8cQqWUMsMvjPi87jsMqgKeFYP6EQU6cx9CxtR9B26G9CjUIhm7
	bROctJrI0Rz3AS27Iui1wYKpeK9GxJmrz6UL0dYkDRLjClPDRjw7Jt1R1V+zj3x/
	m1pzwrJcjoy2eQVzU3cMnSpgPT2JBlP5/lzVK7EFmw9oQLuZKdks6PYpRqsr1DFA
	A56qM5C/ObjTh0Gwp/gc1h9RIO6dBf/JkNf7PVgPEqTokAzfKXCJsOcsl0Lj3o53
	KE2CaflBFLyk6t4zSVcAyyg1bX2ibH/Psak6p1TOosFtM05TKVDQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020077.outbound.protection.outlook.com [52.101.193.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fkg3n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 03:40:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vq7AlAVDXft83ibOcG7E91IPIiwkZihU/c5JJ32RAZD3QdDf7mF6sc33GZz/jgXopjqn8Z6UPFV9/pdLP+wup/fUBu6J7Rn/Nem7ZJ1CIpl1X3ohVwQWm8Un58OyRwEcxK/u8V7BaFwLWmulCrZhxi2g5p/2BZKY7WmAjB+uUGNvsMWNiMD6oqepG4lOHVycZlU38SgRxQT7jLxfBKbn3h05Fl9ymKWr6vD4ydsDH1SXRp77GOADKaD62ufykcc9F2MRo/XdeXon+2m+V/hj6bhMBHtOtqXBVjX2eh3bzKZeiheH4oQfjqYOFZ/Lp3xx3JKdMXdMKZe4RFFB4+tsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE8zEUwk00Ow0jPlpEKL+YhLDoxOLy48zl9YyZ2rXRw=;
 b=f2GNU7N7t3qZW9BTCWfiRjJOp7EwEOm77DZFlAhwdxQtTxbuTD2cT/d61rI6D3JkPZDA6aSPtjc8VoJztryD5ZsHqMSIQ2tMZ9nhX14SaPjtcpM8UdS34pUIfYI/sYIcXfg237u1hjtwmMfySOa/BU4eRnls8ZhT3oxHV/Lsdg/vN9XRd1/HoFcvK7BAdBbvhihHb3SMWzX1l/59TTojTvIfoN5XsQ5VlxjIo52R9BQXIF+QBHjU9brDKlxBlnGzSaDd3HtScS6fwqKJDRhAQNjpgXZm+KXrG+TfLmRlOsN1L13Yx7QZAzV7hUnOrN7ksIM5Z4ZPyw4yibTZ+UzO/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE8zEUwk00Ow0jPlpEKL+YhLDoxOLy48zl9YyZ2rXRw=;
 b=RJTBbWqgCZ3pTp3rdUJi3C1J/rZ4/eou+IAs4n3Bh+UuBZaORtccoE+UducAJEuBCFlI/7+R5jM2xGdqJcRf7GhtX18RSSP6EVAzHCp+M88kcqJyXxJ6TOmZC7evMRBn3k1Zpoxz8JAGW11kW6s1ZmCoSTUEn8j4t6a3DbO+T0w=
Received: from BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::6)
 by BLAPR19MB4563.namprd19.prod.outlook.com (2603:10b6:208:293::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Tue, 14 Jul
 2026 08:40:51 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::3d) by BL1P221CA0036.outlook.office365.com
 (2603:10b6:208:5b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 08:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 08:40:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 99C33406541;
	Tue, 14 Jul 2026 08:40:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6E4C782025A;
	Tue, 14 Jul 2026 08:40:49 +0000 (UTC)
Date: Tue, 14 Jul 2026 09:40:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 10/14] ASoC: SDCA: correct enum names and add a missing
 struct field
Message-ID: <alX2EEBB6l2GzPL2@opensource.cirrus.com>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-11-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714014445.569992-11-rdunlap@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BLAPR19MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: aae342e6-ad83-4f3e-546b-08dee1839bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|23010399003|61400799027|16102099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vSFEpzU8tYKdMzqcvT24jS7YFPsJvE6wffT8eFmw6U73ZEKWqBOIS6g5U97a9aEXfTVBfRPpGlLQS8yz4SkMrQTFjPn8L+N06YuelWC3gxhOO9t+mVLenMg4mU8Lfx+zsfeUBSJ97whOMTDi44HfA9frhZdfooEE/3Q11blkkvD9eDb8YA9PdMhis3KTCNHAdTGkdtoTdHQtfFRquTuThCcZ0thsuBBDduSDYi2vvwoMW2EkYAPdcVhQ9jq6oN5rB6AhvEg6CqVbHbgj8ql5tgcrEbV6Pc3l9Xe9D24fEgG+eiY5lmF3O4HXY4pbvp+RQIRZ1f5tUOHhlV+XnFrCGLwRGIfaA/xcuMYcDe0ZDa4wn21OOib5m9+7BbKPsvW4dAD/DYWCcQk1qXaL0tnC7rQakoZaSNCOisNEbt5ucRh8og/E42YcMDS6FjkakZHV54R8/D74YafE0bydGNJ5uMvOQY5kgQWKCmqVzdw1ASyBnUOe62Nu6gHDkqpN2QTniei4gOs6oz19KCXQLblPqY5V/SpqPESwD2c8OypmgI02o13n4KSxdZTS94yiN3IDmsRKRAP3vI5TIALACWPcvMT3I5xU2/PCudzOfzW5B7BKRR8Cs3kFVwgGIoZLaY2pgf/gXofaOwPJH0A9p+PmAwYLSdkYAMhAELYLmOI8AqVzcc8ozXrNUTQTw6G4g0H46EIMcDQD01JqtOsKdIunPw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(23010399003)(61400799027)(16102099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o7hzZyNQvJwqWcBYcYackxBfoQAsyn6F5XEiFovyVT1xbBPEgwiedXdDc9kwAQhP0w6+yTVj5icW6QEW+zjbpJxp+UaIBDpCykpOqfAWV+iR97L4fRJ3Zl19GQUDtx6pZL8ttwsNt6VW5vwBOp0nZvyU6p6mzLSNggylqbR5GbcIfpdrkibyWMXOCx5nkLsERVnnxcRdjHp4O7D7b2Anm5s1afduM6WEA9c82tEiszBhqLL4R6ghwXHeFpSVlQB4k69MEsxpXMf8joDK2+aDMBZCvW6esHIRSw0K9uY3fLbaJsfzjj3eERYJ6E4t1M4M012lRArS38HYSWIVEKTyCVvytZLMZytuGplHD+qtoJVdZnpXvLsimBWQTMvVq+o4ys2Kj7/slS66f1wvqocLGx4VWtAaeRAP0fYxzBjbI1w+zZ1X+d6BkNuOyaMR7fUx
X-Exchange-RoutingPolicyChecked:
	c/8mESdiLj94JzcRGvaqvzfOpu977Vo6kZcAzREO6E6WfJ+hLAX+eAz8FxVB7avCfrgVJbuTFayTh6+J7M+b+u/1WRNE0Rn0j5nojdsjdaRxPr0OoL7plAuiBQStcizJvJ55ZnwB90v/f93znm8zVNDzIp0EyRovxLCm6QEg97xYIVmnbsiEw0MewnwmIyFNpxTQXG0J/xWmKTGGsdk8T6934sZZuV5MbrkXwnKhkyV8L5TdUMpufr/gJoeJEfjS9aHElVX+VPv5WHWf7j0RcFTC4urQUhKuAyHqK3GIxrnIgrFcL5prtNTPludfl+odbdxGKxaI70ImR+vW2J3N6w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:40:50.4848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae342e6-ad83-4f3e-546b-08dee1839bf8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4563
X-Proofpoint-GUID: fycBkc5aYbUvDn_f9gpGzW7uzecY2FY0
X-Proofpoint-ORIG-GUID: fycBkc5aYbUvDn_f9gpGzW7uzecY2FY0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5MCBTYWx0ZWRfXz3Zxn5+TnoXi
 Rd0ro2JUUtaMiNJMEyWwZro87WY72yIYXh5N7xaOj+x1t7QBGvMlPK2cxWkxQrOupSliUzWieSi
 hUkff8EeLBMPZ7/dU/0DgYjVI7jQNOA=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a55f617 cx=c_pps
 a=0f5ZEuiVSdGWuY0eyBan/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=JfrnYn6hAAAA:8 a=w1d2syhTAAAA:8 a=AK6gHdfnSv0E9eoZ22EA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5MCBTYWx0ZWRfX4JihevM7ugt+
 kqiO8yBKWOSdRhchFG42N4gS2uMx8pPicw/awuxchncF5pX2NRnikWkG1W/0SofxZYI3ZrWB4/4
 yPM9kAISfB1ZLzHfjB8J9ic3t6NAKs1b/BA89gW1emSpSVwlhMZNvd+ChEY6dTsM15jverbrblG
 IQKxsWB4GYKeS2e3sQEZ729y3RKgr4NpdqumZ7LWBOaqrM6HT4V9j1bJg9vcsKc/5aPr9YDoclg
 zz/zgL8hVKdrgnEu8sHoc20bGtEmC/KXfcA4estBNnHEIwcv+hEU7X0thB9iT6/ACiytlR55NkO
 Sz9vFqIA1Pv/KK43kV3rNHxqVl4xcaziINNjHecFRx6+qQCsmBTOdqHrDWa5uLhg5ZFLe8Y4meE
 /tyitGhxYvoDEfi9mY4vwHUUNDv/Hmi0ZHY3EgUtVG9Vn9WOfOtBhDXyudVX48LVaUek4p2tYHC
 empDAYFA9Kf5Y1+6Bow==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-118992-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:email,cirrus.com:email,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C11D75286F

On Mon, Jul 13, 2026 at 06:44:41PM -0700, Randy Dunlap wrote:
> Add a kernel-doc comment for @is_volatile in struct sdca_control.
> Correct 2 malformed enum names to match the enums.
> Fixes 3 warnings:
> 
> Warning: include/sound/sdca_function.h:306 expecting prototype for enum sdca_set_index_range. Prototype was for enum sdca_fdl_set_index_range instead
> 
> Warning: include/sound/sdca_function.h:829 struct member 'is_volatile' not described in 'sdca_control'
> 
> Warning: include/sound/sdca_function.h:1152 expecting prototype for enum sdca_xu_reset_machanism. Prototype was for enum sdca_xu_reset_mechanism instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Thanks for fixing those up.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

