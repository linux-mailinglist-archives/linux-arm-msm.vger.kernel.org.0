Return-Path: <linux-arm-msm+bounces-111334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /XCwLXeQImoGaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:01:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF52646A69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=neT5NhTZ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=NKlGto71;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111334-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111334-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 796073069434
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B3D4A2E24;
	Fri,  5 Jun 2026 08:48:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367483FE667;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649338; cv=fail; b=emoTqTcYY6ctZrqFYP4NAjhMvZOsa5NvEJUJsiKbZeZH8cqdu5YbhYnHXxTaMKNxv7baDwgMd3o8qwZkoBpwg5BQLLZYNbqDuJT3Zon3wOqgXoRXnwZjRTyMmtn6kOu0i1nUqeqFM3gzUxca3aHnYVj2UBPBhzieIh7wbUBgIFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649338; c=relaxed/simple;
	bh=yyoC8NH3IiYaiYxVhRKVfjByziTA6sOMAUpYC/eaWF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MptQplDYrFdOEQ78SzXyaQHjaaTb/CUyS7saVlwScAMjNMrHjAO7vKeSZZN394vK5EeCDOgI/0IsfIfTAL7n6VErD+7QHvWX42IsAZUid2vmZhABoGgHsG5seoa18Oa+ENsmoIHcZeguq2INu2FLrbiiToP+7I4TIgECnsk5RSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=neT5NhTZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NKlGto71; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65500j5V2067866;
	Fri, 5 Jun 2026 03:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tfdWQSD8zcXwGiagt+atIquGGs3vJ7rkYX01VvVnZVA=; b=
	neT5NhTZZ5V6BqAbJcdf/4MKDf9AJnyb+ITuTN3/xoykVDn+b9r+nqwCozNlhc6G
	SIOMC+LItq5ZnNWmcSxBFhsnAeiW4CznIoxoC25zTuuzpKIWgTU6nVjP1DqzgMhq
	7276oHhiRJMjobzKITFbIdQlERIG3GsEl8O+BlGfwEO4G9hDtFLmbaPJDz05SSZM
	0P2jnRXGbE1gDCGdlktBs9SPplG06+8XreuZq8jxSSgjJShYkOL6qqmx6/pGF4Q4
	v5cTzJA5wBJw6gaWVMlfFx3SrCNbz0LBwYy2j7Q5cDoQ9hnrbnV5MPy8JiEOnq5R
	kMsgcWQUqaoN0TVVVX5OXA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022110.outbound.protection.outlook.com [52.101.43.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAh/eaazlVDpR6L+S7mlRnhTc8EOsqEbDQjQ9Z1zE2ZkQx/okkbCd8sjTSu7N7A+7dTVO974Sk7sDMn3xe6rcpgAKCGqCncxhjNcdb4rRhLy8yfjNOCkIZbDiGm2Cj+MBOVGeuttfZa9UWqTgh/I1jf0tgoJgLFLBUTv75PgaNi1LBUwiCTfHBoRMlxPNl1rp9cgZmVatJ18dRBKbaI+bYgsXFlT4IL1I7CFMzjO4BngnNVYJg4kYpY4XpBmGI56tfyG482DgE00YMIXZhxaVZfsHV6iCXzukYeAu4FUqfovZQcTrL0uLVRSvUGQRnlIpBpcgdvlycTl9tIlng7NPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfdWQSD8zcXwGiagt+atIquGGs3vJ7rkYX01VvVnZVA=;
 b=j05b0Sp309VSlAtF70WQzAwH4JnpLk64anjRpzBkRF7u/Jce1fQ/UxcMIhu1X9+rUmLBt1td9PjmUnxBdmBEVar1HxOJdUTygO3bwgqUzIjvh9qqr9c8vpW9c9sJjwn9aPvzhonfY+2GMRHrf2ejoy87i0wcs5W1zI+BkIcTQcYH8hwfk8FG0t8IX8X6Jx48etkZjdfdL+T5orE+6Pul7/0RFeQyFOttOHB3wcGfWIYMz2Cev/T5SiYTRP1GHHvSbLWwQugTp16i0WkCE+ayfGbbA2j95SANPspGB1gVTC6hJshTjb2sOH2R98LwMa6sC96Y5FESmdg21mukheKINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfdWQSD8zcXwGiagt+atIquGGs3vJ7rkYX01VvVnZVA=;
 b=NKlGto71oTnHdS4gb0pbgkz3WL7p+bTMRsr+K//5jb61HWTCCMJLC7xXrhICUOtG0O1zv1A5OhmehVAA4q3+XC3ietp9nZN0wgyPYDumYL4sdJz+TRVfxCi+Aj0TYHsuOpvbv163PSaQaouDlB8T/XE2ExaQYJVYwbQIm0NVxrk=
Received: from PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::6)
 by DS3PR19MB9200.namprd19.prod.outlook.com (2603:10b6:8:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:18 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::4e) by PH8P220CA0028.outlook.office365.com
 (2603:10b6:510:348::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4299240655D;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B71B822549;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 08/10] ASoC: wcd939x: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:08 +0100
Message-ID: <20260605084810.1575539-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS3PR19MB9200:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37d3805d-e483-42d6-d27a-08dec2df3085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|7416014|376014|11063799006|6133799003|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tBAKOuRmnz7Z6stZSKgxXbecM/5KBge2csgQMYlepog7SHs4RlkGWT/+QVyJuk506uh/jEjOd1oUfWUJQH4lyH5ZK4FrMlqBbEbBf0oAnyEW38ZA1QYgpRj5kuHFGmOypx0j6GphCuAX+CB7mATcxXUrwW+AxsmbAHmN0l08sFur8FxKD1ZMdBKcgGSBbKkeca62I3xLF/QXXsMF9vsSwt84zKcEijMnkh3xWAdSM8mkjGb+Or8U+s9tovsrWU2HMbR0OYdTzQUkxRFgXAsUcRp1AMoBGNtVPCk78IB3wrWb4PhqcFCeF0/CodWk+D+NJJDSAGjdgGb5g12w1aXUi2lRQilb7V+feOURsNh3xHrqvaqvKr7LRZDXghLUxOdMa1hBxl1BWiLRDNla9T9KLQfeJzCtUHv6v8US6kbCVi8OMN26OUOEMLTKqj0JfWAvhHpz80wktnD96D3Q+0NgeAeTxS5OU82nP8iC/hT5I5O0yEMj7H9hbDfI/FKbSvNErF7Zd6Hm9Y4r6uB1ksa2cBKTJtTUnqBxWR8zHoudS4HhnVcJwWFKCYNbxBwoR6X0N8S/kCVer7iviWTKX0+zib39yndVnCPgByK5XGDnHcHcg0QtpXeKgMY5Kdz/3/i4/OfbsmHchm+a0ksoKeybpeHu7FaGaZUILCWng1YQA6InSz7DXWWuNVdZ/usBRAkI+rN/4emUqxsW9417JuQ+DINGuvWge7NbDAAYy1LmzVk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(7416014)(376014)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	44HdA7IRF3B1utuGvnP5HFE6TNyVVCQJu1OnuJTBBkOeNtqVO0k4Ps8BKkQYzqUkjOeDczV49/HJ6TRBjcDvd+3b3MHOYyH+yjNofaH0RYVu1OQJln0jNsZfjj2tSk+n3kwn/TBjb9G4OFuWaNUQ7ejoq/flgwNJnUtXc0xxDeI+OMvD1tQ4PeRzmyNlCWhTBwz1sChZPdQjBEq69XSYWyfLil7Oc96H621+N+/q0+7w7InD1dzcy7BWrKNvmOVLWek0xQvvevQo1MxNINxDytopiIm5bYAzMPaamDgVNfSdRzZyio1Ae6uLOoeEMk2qQze+fmnnz9H3I3J0MwS6lH8zcODE91pF1TOI6TJ/BoomHq3isPjYPAIp4nwsvXX4j7BPFdJpOV1PiAINYkDyfGgUpMMpJBtAa3xa/P+S1lcVTNP8EX1P2CdXx0S58jw5
X-Exchange-RoutingPolicyChecked:
	Hd2pwM3LUAyExJsQZ/90uj/PM/4lsSGb7JA5jYOHP5HEr/NuwmNm++nto52pD7jRhsSeOFDYb39v7VfWtdHzV+dsGIrkqr/IB9bPTJTwb8SkeKguuXY32yrwbrf6VN4khd+f3HV6LACsTDKPI7qTtpV+ZsRIJUSH34Dg/ARp3QfYifxyssPnq1kk+wr5/Gu2VOh4LSm4rOBjjACoMFK107oM/j2niZUs+Bc7wMps+dIKytq6Csblr0LHn0Ze1PNIsG/E1Pt4td8e8KyC5NRe9lYUOOud3kd6BsSXHD5kuCi7CDtmCCb/OHI3vFS8enO1k3ORFgeL2ZetHkobzlBDvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:17.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d3805d-e483-42d6-d27a-08dec2df3085
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9200
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX0rc43Uew0H35
 U+yuitNZyBBrLNv7DRPOqMx0hbs9wy3cDRQIW/ikBeshxlwiQbAfwq/NKaJ8mUY4/BMNL0nbjW9
 7VqOfNTZPbhZELQ7UsC+kA3S0OR1Bo3D//f2bGxRUZmYAemXDeV0cHA5hvaM8s1FxNASgLZ9m1+
 o6fFsG/wfCgMUOmXYvNrCRMPbBNCmREn8KuP0V41lebUz015LUczQ8kGPtisRnXqSaKpsQiL+d2
 0eWV2rm+MfNSeD9K6m8sBDAyyiZv90rl3IxyoUhRvFc/nBLkDEz8dq+bmfQZFPhSCRuua265wmq
 Fbvy05zN9vKsiu2etFEs+n4yjMk7kFYprK90VDdwpdXGOu1r8d7iAHMTTRQWkSvJciD2ZG4FNR7
 w8kyF68aPbSDZx3c60/gu9KfKXAQVWSYuZEmoYEzAKxI8LJ6y+o0aREm621iO5r+ThHxmTuBgly
 cunhtmPBzjD5n1BQn7Q==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d56 cx=c_pps
 a=R5lJJwLUw69E8voCr07FQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=jMxjxLXPGdIgYIqNa_0A:9
X-Proofpoint-GUID: -NKns9vwjA8LFskFddiWgohMZ7SdJNx7
X-Proofpoint-ORIG-GUID: -NKns9vwjA8LFskFddiWgohMZ7SdJNx7
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
	TAGGED_FROM(0.00)[bounces-111334-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DEF52646A69

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wcd939x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 01f1a08f48e65..010d124667224 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -2968,17 +2968,12 @@ static int wcd939x_irq_init(struct wcd939x_priv *wcd, struct device *dev)
 static int wcd939x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd939x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int ret, i;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(2000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd939x->tx_sdw_dev, 2000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd939x->regmap);
 
-- 
2.47.3


