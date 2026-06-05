Return-Path: <linux-arm-msm+bounces-111339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ZC2M7ONImp6aAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343C646936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=UCvELVHX;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b="Cw5/xlGF";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DFBD302D0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32644A3414;
	Fri,  5 Jun 2026 08:48:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669E3CD8CA;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649339; cv=fail; b=cBlsauTux899Zoie9MDkvVCrpHhs7M6Eu5IKx5obTZNhhwawMWMKBkDL4ExPY9fCr5/Ut6oQ9i1ToGwpEpUQ41J6ii7UHELz59UXhLQZCKStfEUNibfnyvrsC1Qo4TcIVFw+g/snpJyDHYPfhSrdMAmUI2lz0YwabKwnJwV5Xqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649339; c=relaxed/simple;
	bh=m+pVVozAyaw13VD+66YARJZRh/MDkaeoff4lQGBflG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WznnBy/kMB2+hBX6QVzpQqXfkPAUpCNhf1SZ8xUPWqCGxA9E4MQ2vmBdfrnR7CV4OLb0QqCs34I62StIVLrr37QvfJ9jZzSC8b/tZOOYp/3jHmmKpP3wIUQ83hM9W2cTXfwzXH950pugbwFe38R6cQ/NHMcssCrZzLNj2IdNjD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UCvELVHX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Cw5/xlGF; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550wlZg2165677;
	Fri, 5 Jun 2026 03:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WvZ0zXUwPmlzIpwnHxGNEmeY3cMFcMlpqfWb/SuPqYA=; b=
	UCvELVHXlxYmP1SUvM9FbtvbWHz30lxVnPQdTOrc9uwo07ePTQ30XZ0x+paFIlcN
	i1A1/jafFa3SgR85bRSYQOMV6xMLBXcMi92RXKhv8idViVn6tfwOh3bArGFyyLDP
	OepY3fZtZ4isCYUikHjHEFIPx8HM8KFM7rbH8dUTENVCDETyE37pVUguX9UkNu1b
	7v7BIXps9iFtoIlT61IAciDZ0UzrEilOBHcLPpeomPNAKMXZFrfc5uLt0jhCiSHo
	KJzKZsXRxst5T8kFvCbo94bq5iuHWZY08IutZP0JTDI7QUMbVIPHHZ60JOj1HWoR
	8Fkz4wxCZVs/h4ArfAQLUA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021104.outbound.protection.outlook.com [52.101.52.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB6Cx6RJljT7eHUIlYTCWwoKSYEUf6QHTJ2zaq5QaqeHJWSMwPPs4gRnJqPgpOO9DoHRPHu8Sx2FM09BqUWk6V3cDV2/bFbUAktemmRTsVjjQoevOgZeSNgtGqnpxUDXIfMNkY9f96mDBDBjB4W61JuNI4Eq4rlY5u5Xa7WKPZEHP+wq98C0RJuJARSd8VWnW5hKjy4HHPQF0baH+ILUr9maGlLTA9hQJgU62t6wXrUEsqH71R6UA+HEAbXl9A3RN/IDXLU5d5FzvsSwm3AlcDATLjeJhwfcyFIjrhBthMa5Zr6aY1StfDqXJY3Nx0HdNZgisROOH47jB+7AHsv1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvZ0zXUwPmlzIpwnHxGNEmeY3cMFcMlpqfWb/SuPqYA=;
 b=hlYYXcWqFcVeR6c3rd6z+/Hk3jfDCMZAjhGvgkkzQlyM+IjgmNMPCu5xqxgQBciVUyOOg04xRXAhlBzoOBoSrwufCPyc3yjOR6SAWZmSiPUwpgWFBxOZF0kghatyCk+iqv6/wP8dvDd6p1NNkLH1qsEORhlyIPBkzX7KQm/E5uVohuz0+Gezm/KIUFO4G3jzgrFHuqKgQeiN0813Y58y3gRONj1VOurpNITQjZuLFvNUWgozFj5/yz8i0bnGBb9Yf25vdjkhnhjMdIiVHoQRr/Dhbhuppcki0IlLroCIB6VK6qGQ/wfVcYZAIWUmKUQ/++wMCYf3vakZtE1ne6TU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvZ0zXUwPmlzIpwnHxGNEmeY3cMFcMlpqfWb/SuPqYA=;
 b=Cw5/xlGFl5eVv5Dk5f7ok+NY9FkTrjRjfKszT95dNa3V1G+AAHZcUlguvMHoJU7XnoiHSSY37PnAvJhEg257wXgG4r1XpRNB+vMOVhhPfns5an2ikjJxwBc6nSf0xv1vPTpbrCnHyIeLapSM9btZHBDG88bGZ6paBzuUs0l3XuU=
Received: from SJ0PR13CA0040.namprd13.prod.outlook.com (2603:10b6:a03:2c2::15)
 by DS3PR19MB9246.namprd19.prod.outlook.com (2603:10b6:8:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:16 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::8e) by SJ0PR13CA0040.outlook.office365.com
 (2603:10b6:a03:2c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36088406555;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07C6F82026C;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 02/10] ASoC: wsa881x: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:02 +0100
Message-ID: <20260605084810.1575539-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|DS3PR19MB9246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06077ca7-7426-4066-1184-08dec2df2f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|82310400026|36860700016|16102099003|22082099003|18002099003|6133799003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	shIhWsLro33qhq1b1cz7b3yxi/EXZhYgJHfGbEFJEGA+WoOaEufau4EwhBJ2uzRX0OeSUcDYlpJXBSceG5UtAQwn1Fgk7nxJHEgroMDKPDZU7MIt6WCCc4O2tWsO8hFwT1/Hsuv2zmHLx/miP7dSscq1N8ZNOH0vqyGf9TOS5QeOTsoqhc9z2TqQA0+GWZKQ4aFa5RN3/uXeQRws67S349iJj6YwH1tfEhCb2S1ZK4ssS/QbO9BRnnjy13nz1yliDnRf6YY5jFGsWUpxjimn1lXLGR8FfKXT8SuywiqrxfhoFV6axMrpd2wG5jl0/wTj8XdXDqcckiZTu5ktMkyAClNMePvYXKGHHTDxMAL9iX6cqg82jlCq/2CGc87AMtHaeavkjgs2AFJnhewj5dVf7R6KX+kgEM8DVFkjD/a0IbTAAE5N0/oPmuZv55IsQ58teqsHANea8++syawpRjO9TXZrQ8YcGlw95THHdcf1TPMziIY1UNSLo5kFGtli0CBFBpXEvvcQYm5d5CNtlqdmv6NCqbukog1hm/MIgH6xBF2wUa6obR27XpSUGPMHwfurkduGoE8tG93KZsLG3XI/WVRIYY4Be1GWAG6WqB0FmOT2etbMKJthUjc1rzswWrDfIhynXAq06urRZ7XKvVwmsuThFCrIaaJ51h6pqcibz6rrCyRLdGlwnLZzmbIv0BK0ig1VkCARmjZN+UeSu9dBp1CwNnoE+8J9P8y2YdA6QaU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(82310400026)(36860700016)(16102099003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V5ciNWs9uFvzLDrzMe1zYTFaYa8N4rvzfSfY5cpJFZFNDUnPPGOgE+B7lgfGh7ty5p+b8X2DD2XVTY/qsrSMrwgu0R3ByNzJ8u11HK8tFbti3YcZpPYVzOQoNEiskeFm1BGN5rKkoZKeuE6ORpcvZEE7MREErqhPERFkkEbgJYhI3/GjToZjv55XdO1zdvQPeZQd0qfZeVxhps/JLzwUF20vc5exLueUKj2ehHYYuoAnC2NOymz+qTrM/KPinpny9ZA+9J7wZWvUg9Ps2beWFcg+Ke5NqLdFpY0ALxiSHV7MTH9V1ll3T02gWh14goxXe2AQoVWKxrWk6rwB+yUHb1ujxGzLuuq0YO4XapfWEwQ8CwPDiwADrYcbOGxRtbA80pSXsX9wkND+ej9l+KEr5D9XlTC4bb4CoD6g/uaMqla8fJ2sBgs7EzjGM3cufpR+
X-Exchange-RoutingPolicyChecked:
	YPHef2egwlN9txXmQWTMl6o5UEvCoB5L7WuAidQx1+pvUTqIpyuNEmBkG9bp4t93TA0RdhzH91acREjr50o1r4gJj9eFwX5aDHs9uMPOpWVOawPAZ3Zvi61BJbu6Ovvx0YNq4At52laVZKjcdwFJJ1vXNE0NIeYPsqSxZYLKwNd1cM/Ofw+ysLUwhxxt5ajJPx5wWFx15pC+1UndCH2zwfX3qqrK2rV9/snBE7+GvNj0RQqLKD70vo6ZGoGrfYAQvAbmky9FZ7g9XB4QMsVQmAgRydC4rJi4AU+XZ8pier5WA4cGpj9wOBfOzlduxp/PPuAKSgC8mxFICL1bVMqMaw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:15.5512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06077ca7-7426-4066-1184-08dec2df2f37
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX4Sgrkr2gvW9n
 zJtFISXZ5JhLdremXWm8JNdFuooGYcWHLwciV5Pjp1SFQA+5fhJ70CoEfhE1rw/hXOs4Bvf6tXB
 wV6GwvPYZ9uJsVQ9cuf03+LVOa536rNpwyQlJyScWT2JEZXAYJ1QjDJ5iyAmcj6Df3MMHXssttF
 46DkSfkMU2QZgXeXQnrEl6BWisV03wc+9mZS6lcMJCV3MK3sqN7wVpm53IsXreXJmB0TwyXNeHk
 bCJDsqJuYtY6BNg9Bk14LHjUXjNkScrkrzTmElS2cFJXwuX6Ylzh3ZINBPlJJRTkHHkp6f+YDKP
 GayA3qa42JqFABVBmLq220+ta6JpUMhGmVUy9bZSKjJcjkG3VNdlIV3FuCkfdoVlfvqns5M3E8j
 8ho/+FfRcHyPBMeUHrcufIfRGUxPeeDJVI+Mc6YaGTYRK4m42XxCGs/vTU77VAoaCX3hQ0py0/m
 qtKPUc7enx/k8oyhJWw==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d53 cx=c_pps
 a=l/exgBlJIAx+5Sipbyuv7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=BxSnUCk73ilfYBohU2oA:9
X-Proofpoint-GUID: rigIEMM5oLqM00-ji-Ujlj7X0X64TChU
X-Proofpoint-ORIG-GUID: rigIEMM5oLqM00-ji-Ujlj7X0X64TChU
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
	TAGGED_FROM(0.00)[bounces-111339-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7343C646936

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it can be used for code that also doesn't check this
flag. Update the driver to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wsa881x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d15fda648dada..5174614c3e837 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1167,16 +1167,14 @@ static int wsa881x_runtime_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	gpiod_direction_output(wsa881x->sd_n, 0);
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
+	ret = sdw_slave_wait_for_init(slave, WSA881X_PROBE_TIMEOUT);
+	if (ret) {
 		gpiod_direction_output(wsa881x->sd_n, 1);
-		return -ETIMEDOUT;
+		return ret;
 	}
 
 	regcache_cache_only(regmap, false);
-- 
2.47.3


