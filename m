Return-Path: <linux-arm-msm+bounces-66990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B77B14CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71C997A692B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6740A28B7EA;
	Tue, 29 Jul 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="n36qu1vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55E02343C9;
	Tue, 29 Jul 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753787697; cv=fail; b=e3igaz6Mj2Tn5oGXG7SVIDQOchDqymGABgGlCrI01kHMlBLfYXPA57yUKsA9fRnEbODJb3HB930u0YK0bzJW6s+6dxVjEAQIVlzyUNuqqpd0RYT6xLQt0L/cxEr/dvekxB6z2IGA6hKDhybRsw2OPApNtar7g0TKka/GIAauTmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753787697; c=relaxed/simple;
	bh=Dcy/lN+vUX/gXV0TSJleLpgTY+fZQx1sZUQAEw2FNRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qclWcdeogNlZ6xTPyBY197plD3H/a81nxCp22AVeUFKttpfDME8HAeAH16CYre7D4wkixSmc/xUp2r4W1qBnUHJJEjkomfn3KFZnOZI2fg4UD3iuwFBwopYYqgIYR/TqRRqbjccHCKcvNfBbrk16yshB9mkMcmzREiOBj6e2eqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=n36qu1vp; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TAGtWg032352;
	Tue, 29 Jul 2025 11:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=pLecc0x
	LIp+PIeQEV+OqwSg/MSuTNHdRvA4IksgL3f0=; b=n36qu1vpm9BRXdvwvKO/6xa
	LbaG0Do/1Pu8PpBhyuQiPLwYKD9y/k06XpPruCxsdzabC1tYj2mwzea82E24iz/E
	1kKccX5Ds6/MQSvso/o5P4Ay330LCqQ7jZ6YHO/cI0wZKU3sl3P7Vm8P9+h9dWW1
	syQxZg+UGGBZy8XRZqFBOrFpFPjxVIozp0C6kMOvmr1p1IUkP4Hf9MWBMsASYPyM
	wC6RVYR3UnUxHR/EjcUGVuXUfKMGxU/2Ae9OVecd/ENOXutu3So5vmqYRowXsndT
	RpAZjSgsS1ixcCfAHshY17auqM6DWINfTtMKzjkSBGRFGNGQDnNzdkzPX/CBusg=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 484n7jjtjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Jul 2025 11:14:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBN1yOR4IWl01RLZviPwm7Cfhq6miUJq31WkPkL97cmFlYTjQ6C0cK4YMJRc1YPF65b9TTIIqFmB5hOCOkHDkAUDHS1SJqgUaHacIX0L0zNiwIYZgdWNVPiLBfw+hSWSGNH7zWTQJKYxpxSD/GVbjTGHCidw4IClZqAv1+WwVSQatI7h5z13zwpPmuid9wB/c+KEH/Hvln6dSVNG3s2Gr7psa0PE6FTafaYsZRdACyhJMzWz51UISRO1BO6B256xctdIwOSY/3rIF+cSr9jSPqHPxhKBhOtX6G0qVyaefrYozqHK7d/AfV416aaPhXlKet7CxfMIGgxr1DjjiAJ3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH6JrVPYYrkpeW5LVCXLEqbiItF5oeYyVbJHbmKkY0I=;
 b=GXUzbUGvWBd8qTKng4d40KEdrItimsiAJt45+r4g+cJY6o12urPfsclyatNwZkFN+rere5KoMPHLQq3yQTN/MwjjpZNXQALBCDJ3SwyiZNcezXHDXhZTe3QNSU8nHgXmbD3wrufDzS0Ya0e8wbzsBoW6YRtaZAC/r9hObkyMbl2TzMKKz42JlujGVoAalOTR00NsdzfErsJ2ks4xNKwtUXUoIroGs9c5m0DY1gq5phvqObJD66DKEyi1t6VLtmx0pQ2AENapoP3Aery60TkKgL1jnYGupGQBxN2nOU58HDjiued5rB4sts+7NfL0kG0KLkKVIoIKyMsTm7JQCum9LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 121.100.38.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=sony.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none (0)
Received: from BYAPR08CA0012.namprd08.prod.outlook.com (2603:10b6:a03:100::25)
 by IA2PR13MB6751.namprd13.prod.outlook.com (2603:10b6:208:4b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 11:14:41 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::1d) by BYAPR08CA0012.outlook.office365.com
 (2603:10b6:a03:100::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Tue,
 29 Jul 2025 11:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 121.100.38.198)
 smtp.mailfrom=sony.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=sony.com;
Received-SPF: Fail (protection.outlook.com: domain of sony.com does not
 designate 121.100.38.198 as permitted sender)
 receiver=protection.outlook.com; client-ip=121.100.38.198;
 helo=gepdcl09.sg.gdce.sony.com.sg;
Received: from gepdcl09.sg.gdce.sony.com.sg (121.100.38.198) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 11:14:39 +0000
Received: from gepdcl02.s.gdce.sony.com.sg (SGGDCSE1NS07.sony.com.sg [146.215.123.196])
	by gepdcl09.sg.gdce.sony.com.sg (8.14.7/8.14.4) with ESMTP id 56TBEcTW018814;
	Tue, 29 Jul 2025 19:14:38 +0800
Received: from mail.sony.com (APSISCN11370DRM.ap.sony.com [43.88.80.182])
	by gepdcl02.s.gdce.sony.com.sg (8.14.7/8.14.4) with ESMTP id 56TBEPqD008368;
	Tue, 29 Jul 2025 19:14:25 +0800
Received: by mail.sony.com (Postfix, from userid 1000)
	id 2BD811BAB530; Tue, 29 Jul 2025 16:44:25 +0530 (IST)
Date: Tue, 29 Jul 2025 16:44:25 +0530
From: Nayeemahmed Badebade <nayeemahmed.badebade@sony.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 0/2] Fix fallback qcom,ipc parse
Message-ID: <aIitER4euo35Y27O@NAB-HP-ProDesk-600sony.com>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <aAdRfirB9AnAOlH8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAdRfirB9AnAOlH8@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|IA2PR13MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e468555-2bda-41c1-14b5-08ddce911c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ANmjomrkXCipmbPTmBbBVCsYCFyFlidy4nBaw6NS6JdloUIJ1yll3HvHqF?=
 =?iso-8859-1?Q?y6oN6vL0M4PVJNu+fHziSPEA8+z48EhFuSVRAn5w2OUtRjMCzTHwKBRJmj?=
 =?iso-8859-1?Q?mo3oNquyqQWiSuklbLXefvlzXa8xQO88BXfh4O7wGb1qJ8GM9GT58IQszm?=
 =?iso-8859-1?Q?X1mUf9aSrPNPusDdr1HixlyMAkveMEp+VP8T3krxFUUeS+HBcmxhhsiMYD?=
 =?iso-8859-1?Q?Y5eNhYTTw5djLnoxGrzqKXaD9lEZxMSm9+xGVb7GPwGgwTDU7WOHCgxrN8?=
 =?iso-8859-1?Q?RA7dmXS2v08QvfZXW1qc9FdWmivRiyAWKeQBjXbEks9K2sQQquHl80A5x9?=
 =?iso-8859-1?Q?/+DHmte7hBdBAZHURMCKIIkStPWLzZKtX8xjw1PMMhYMND46mXWsDhRppo?=
 =?iso-8859-1?Q?DiODF/JbwWd+rEdVyZSfruZGToxOhLxFfmrqnMhkiyUJLhjW2pcB8EvO2W?=
 =?iso-8859-1?Q?u5LodQ3AUR+xExSNaMoSUnU9R0ub3JRvLHgtPLnrVBEaniuEANiBTTodbo?=
 =?iso-8859-1?Q?s0eh40BOJQ/eHJSOl3oLMCbFqwCnBZNTJ5hvqt/ZScQJq1C9C2weC6qIPu?=
 =?iso-8859-1?Q?V7gdte6V0GcqTx1ctgA4nYg9uUx1HW+ag04xovOB6I52ThGoWd/NrSlOM7?=
 =?iso-8859-1?Q?BUFiR0EqIk8vyomVZJGmLhHS6GqHbTQ30P5DhDdHl+gh6BdzJfLuzFHt1I?=
 =?iso-8859-1?Q?4+ivmUutWC5hAv/+kbLnDSQAgDxYMLIvsPcXEQBEvaCLrIpskDmDQG7gqN?=
 =?iso-8859-1?Q?ufxj0OThr40XEqNOOmvbA2sdoZOizh1Ph93jkEpXo4j4UN4SPFuyior26R?=
 =?iso-8859-1?Q?ad+prA1kjF8ehA7D6HWZms712JmfpuO4XMIDVC3jKRtEd+9/kL6nrgKwVV?=
 =?iso-8859-1?Q?XguwzZsQPHKbKnOzGXD49YbRHEJwmvbPisGgWxbTAOJ/wcfNNmn+Au+/ag?=
 =?iso-8859-1?Q?Opt4hoMiFAbyFufTA39F2DVAXS35N45vkkLDaNVFA48mcjD/0/Jh71F5jN?=
 =?iso-8859-1?Q?29tyU/OyeqQY9MaTQdz93mK/QdMa1XHMPurWu8dHkCXcDz73vHWu57qunW?=
 =?iso-8859-1?Q?W8AYIJ5LnOc+K/Op86wwxHSwIaSJUi30XOP6ybIkkXV4rdAzTcqcX/XyL4?=
 =?iso-8859-1?Q?5UtmgnSpYHdnp29YAG2j7HTBoFrFTjAmh1vkhXzk9d+m3I5ygli68mEo89?=
 =?iso-8859-1?Q?jcT7iGVJKdydXPZHeUolqSpwWVUDW2J/+okuyRJuqLQUiCpa2zzafXXO3C?=
 =?iso-8859-1?Q?ibVpjidLkCLDdx1iogv/xn3wPZDpx18GqlYndvyWllPlUx2yR4s2ffzlsQ?=
 =?iso-8859-1?Q?fu4xxxkY07Uyq5Chjcpp0XTvW+al+hZiwlYy4I1QTL5mIGxRb/SjRXiJFu?=
 =?iso-8859-1?Q?jBMN9wbjLdnmQia3rkzafLRPw88G5qmtGrqsXq0VyXwc8TS/XixYfjz6SK?=
 =?iso-8859-1?Q?q5idiQpbYKEwrvmGqPJDZWTB9WgnUi/AtHXSnXghERpHuICxZ2zsxQkPv6?=
 =?iso-8859-1?Q?jx9JP2c4ikaC62keLt+WaunQ3fU9Qzssofi2V25NqUoI5qU87avtg9T7sl?=
 =?iso-8859-1?Q?MGXOVukfq+FS1Ug+5B1dBLd5t+nT?=
X-Forefront-Antispam-Report:
	CIP:121.100.38.198;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:gepdcl09.sg.gdce.sony.com.sg;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rupIb3TNIwfAn6YlgKrJ82Cuj77E4CgYvXSwGryAuZro22lV0mf+ElZhaFcGUStqYg+GZ8wfxwSLs6mJoWXso8H7/MjHpUjpEEFkO0lf/L9o0iirhsiTnmZWSCHn04Oj274d7ZXAmvxeVd/7qIhx4+j/2s5hJrWJ1xDZI8PXUg2P/RfmBdnMcp0PwITFxoDjZBJlLhl3+X8jHo4tZagRh6cLWrrHFGR63VbD1/rYDz2b9y2Ct3rAKx5CiqbgVeLSo4Gk+qIX11x+TVBIkpdcSNuOBFqBSofBNtzp0Ncbkvxl55MnzdonMzj0tEPlwBx+U0MoR5qGemyAgrbiosEappmLZtBZGp+y2haVQIYm11RjtUnNvUAcs4oMsu5glPXYYFWxcIXnPLZgOIC77PAuKwbLxYDsFlQDTb1HSkzPhbfF6/s++E0HXvrk/D9pnZ4B64995XpHmM4bVR9qYfJQ7QIkkX+nTEEQAFt3SgXkGDk8mPFfCSN1Gj08ahkWpMpgWTjl799Swa8UNT1sd/he7TckxqBRTE3XOmpwU93pVntGLqfNX3C5E/7EGHVWRN6OVVH75zTfewhkr8SZPv1hTvsvSbVFbQG5ceLiSBkJnkl9D5p6ycl3nMMjJgsCML1G
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 11:14:39.6509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e468555-2bda-41c1-14b5-08ddce911c98
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[121.100.38.198];Helo=[gepdcl09.sg.gdce.sony.com.sg]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR13MB6751
X-Proofpoint-GUID: feFZp-81rJlloOhrtvAH-cvi_mMVyWkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NyBTYWx0ZWRfX2TB3F08WOLn2 GUUi1Yn2rVqwp7oB4pK0vn6zVd14a8SV1MM+GGYpbf0sZ5QDIJeRtdzhKJOU4ZC6b3rjpeaFovo WQ8OqgddPE0Y1fnTJ9yjLqNd1b4bUUXmbbgN67udUk7A+sEfh1e7Me9GnohxE1TAIPhU8ldKgQq
 Gs2ZuWXT3oNundg6z+lr4DcNQy1o8PIDwInEBHkfPcStIalqeg7XxzGp/TJtb4FMN3GS2X+ODVs v+DoplF8LZm3UEB05bsGnbB3BzL9994ExvyUaUXHBCRAtzbD1Cf08onDIZkcZ5q28qcpW3moqwq I2y2AkWjramgA3lisRaWEJdv1Raq/COvct6njf01JGy18ohVSUURoJLCtmDHth4CpL8WETeU9qH
 cjhO5qdC2Mmb0/ln8qXlHnjimJIGcYvpcnIhC9VVTUNMRNI/70PCIx02CNJIrpLvZJB6aFpL
X-Authority-Analysis: v=2.4 cv=E5nNpbdl c=1 sm=1 tr=0 ts=6888ad26 cx=c_pps a=Uo4aFAHIxFRcms0b5QyC6A==:117 a=DqilkWtliqFtnzj0yEUnMQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=xR56lInIT_wA:10 a=KKAkSRfTAAAA:8 a=z6gsHLkEAAAA:8 a=OuZLqq7tAAAA:8 a=vren-wmS-kNaLJScZBMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=cvBusfyB2V15izCimMoJ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: feFZp-81rJlloOhrtvAH-cvi_mMVyWkP
X-Sony-Outbound-GUID: feFZp-81rJlloOhrtvAH-cvi_mMVyWkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01

On Tue, Apr 22, 2025 at 10:21:18AM +0200, Stephan Gerhold wrote:
> On Mon, Apr 21, 2025 at 04:04:15AM +0200, Barnabás Czémán wrote:
> > mbox_request_channel() returning value was changed in case of error.
> > It uses returning value of of_parse_phandle_with_args().
> > It is returning with -ENOENT instead of -ENODEV when no mboxes property
> > exists.
> > 
> > ENODEV was checked before fallback to parse qcom,ipc property.
> > 
> 
> Thanks for the fix!
> 
> Would be good to mention clearly that this fixes booting 6.15-rc on SoCs
> that still use qcom,ipc (e.g. MSM8917, MSM8939).
> 
> Anyway, for both patches:
> 
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org> # msm8939
>

Hi,

I think we should consider applying these fixes to stable versions such
as linux-5.15.y and linux-5.10.y

On v5.15.186 and v5.10.240, we noticed below errors with msm8916
platform:
  [    0.185835] qcom_smp2p: probe of smp2p-hexagon failed with error -2
  [    0.185905] qcom_smp2p: probe of smp2p-wcnss failed with error -2
  [    1.525302]  smd:rpm: failed to parse smd edge

On these versions, msm8916 device tree still uses qcom,ipc, due to which
drivers in question fail with above errors.

Applying these patches on those versions, fixes the issues.

Also, only one patch which updates drivers/soc/qcom/smp2p.c seems to be
merged to mainline, while drivers/rpmsg/qcom_smd.c is not updated yet.

Thank you.

Tested-by: Nayeemahmed Badebade <nayeemahmed.badebade@sony.com> #msm8916

Regards,
Nayeem

> > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > ---
> > Barnabás Czémán (2):
> >       rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
> >       soc: qcom: smp2p: Fix fallback to qcom,ipc parse
> > 
> >  drivers/rpmsg/qcom_smd.c | 2 +-
> >  drivers/soc/qcom/smp2p.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > ---
> > base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> > change-id: 20250421-fix-qcom-smd-76f7c414a11a
> > 
> > Best regards,
> > -- 
> > Barnabás Czémán <barnabas.czeman@mainlining.org>
> > 

