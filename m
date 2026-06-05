Return-Path: <linux-arm-msm+bounces-111343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /wo8KbuRImpPaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:07:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A8646B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=krG2CL7m;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=lYqBPWoS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111343-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111343-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44A2A3089437
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4936C4BCAA9;
	Fri,  5 Jun 2026 08:49:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133564A3418;
	Fri,  5 Jun 2026 08:49:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649351; cv=fail; b=XjlKUCbM+3R7fNQGaw3D2OTfWsD5ZVmls4rql1sBMXMDnIENim9m53LWf1Fr5OVI09Ilj6ZRg99VB83MPa7xlL8evMDhpMYCuBv8X99QecwspK9L3vUWfXOLSxIaD3jS6UBn6TdEkyZcPZVfBWstQUIEgZomF+WrEaDe2Z2ePaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649351; c=relaxed/simple;
	bh=WeYloHecK86rS7EgekxtTbk4BsrNpgrpXk6WJdLYcvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5TF0TrzxsL5zYdLCgRu6GYoJgqa3BMi+qj2oezlRiSU8T84iBPZG0XGA0R1tu3EYV3Edyg9HzdgYhd402p00IyD3znHAOEbIC+iFMe6sMJkLjWSzdm/Hxr342J++X8IKr2RryUKFMqNL5HDA1XpISW2jyCn1aoQXHa18AH+wnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=krG2CL7m; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lYqBPWoS; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65558seC900358;
	Fri, 5 Jun 2026 03:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SoteH7zwztxoQCOcXbQ9mX/taF8yCJWf5OoC5nrOSzE=; b=
	krG2CL7mClPiu0mdL0mp0PhMyXVHRgzRfHEvqVcQHFRWTwjfmnS6sPye4sfc7Pcs
	whVAqQKPfD6x1FqjNFFuaIqiWyYwZIZmN31mI6tqcoYFj+/UbWK9YnLPEQb9RS+3
	LindFaIg1yH3UHDVfVM5FLye1Wm2uPV0CQKWTfpTnsBXJzeFHubNZz6xsO31V0ct
	nJnoHd+Z9W4wrSUZG2hItIoFwiN70Yjtg931F2CHHYJFhfACLB2fuaHA+8zSdEKa
	7Vx/QRk7I9E81TjrIeS29lajOlRlTdu0mzrSYK9lTE7VtNzhE6/44CpveYVTayOb
	lrPnHRNJ/mOziai0ViR3UA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa192j6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuUrXC8vwHsO7zkEGpck8T6nUXmNLXWMnD8lWtAp0NFyTvrakBrAFNuBdDmMDuEC1jIEJcbinlJwCNBP2jdEV2dov97FyLH1WmzSBQoGSPt6a9fXNILFeaWVpo95sVDKB0EQST0/7UZeSHQQbUdEfYhz17J/Qr0+dnK++YbgIhKYHBjDWFqElzTnPRjGNAwGULa8eab1p39sQ4i9sxDoLJgidqGCDjKeJAS8CACH2q7WZB5ApH4HNt29Z8Zv3+VeUkk93M6B5XpFmoAjHu0uX3PB9ni6Dgmao9CVO9lJ14G3kK32fieYuYKlQw+yp/ZZs/RxoS6NhvRroo7Xl+cwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoteH7zwztxoQCOcXbQ9mX/taF8yCJWf5OoC5nrOSzE=;
 b=kxmZ3qqDyrErnnPq0ymo7KiG3cjWVq3Z5NfQr57osSejyANjmLUu56qrbix6nAkEuE7pzmW2uzDi94nfTTXYRlZeIv1IpiSKQgyQQ3ueZg1LzLR6ZdpNVv8GXXIpDWRzn1E4oAHyrur6GCihiLGslCeZixGpIafOUoT3QA0d4mgFAvXtYDQmce5s2FknHUezYJvzsUIGdayhGwK/w0+PWldVDmCF4whgvnQwQwLlInX9KyaI0cfZnKH+czUiV87vdTByewzLc9a4pgDXyTxPbFZl5lehYnHGnfQXGdlYsr9LJbwpzWPY8ZmfLUOpWso+fyL/mwOmdAO+PFO+x+9GIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoteH7zwztxoQCOcXbQ9mX/taF8yCJWf5OoC5nrOSzE=;
 b=lYqBPWoSllLkwAIdZ/wPoXrqlexWu7yisaVfm8j1zHS2plcYlPQnew9wD0vLYdiLtPkN8zfX28mw3RDPvN66xVUqw8tdnzlXxwr2OsBSiM3ps/omsE31lETEyG/YTbXrYP99eGYsAiq7ZqOqTrO6PdQij7BNtRNkFZcK62JO6+A=
Received: from BY3PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:39b::22)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 08:48:16 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::82) by BY3PR05CA0047.outlook.office365.com
 (2603:10b6:a03:39b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 08:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3247B40654F;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 027AC82025A;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 01/10] soundwire: Always wait for initialisation of unattached devices
Date: Fri,  5 Jun 2026 09:48:01 +0100
Message-ID: <20260605084810.1575539-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|PH7PR19MB6807:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fdd8dd01-2188-44ef-e3db-08dec2df2f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|7416014|376014|82310400026|11063799006|56012099006|3023799007|6133799003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IC7kS0P1tDgFHUDT1ZQW9IW+XpZVIxfsMYAbM/qj2sVE3Gc/CwVWZW/QA460gBug98vLHxj2CuY/2lZwuMKVGaTPXUZOkudhg/k6/7XZNHRS5UXuQdiGQH6e/BDrotR7HGZtZIYQ3WbhNn/kNLQH1rtHnG/k2FakXP3sGIzRKYUeoiGRF9piOCvcW2aaKVTy2KVgCAQ7AOJc6O31ALD4D1RIWJJdEApuP9YrlhS+L63RZP9SeolkFGBhU6yDNLO+cefIQcHPZLYUYyZcfn3elybPm1mCHcYSakGKwYzacCrDYGtyFzBM3L+fANCJgGeQga9x04lTLLx28LURMna4PVevqhe7K0kdJT38/xwiZMnCJx8o68M9hL4HtW/WHHA64BfELC8rcH1RW6lPMmBgM4VumgFGA1n0Dgk4Wie3pAJoUM/GLJaL+vJc8KVVXI8zNXxbC5JAAJtun0dW6zBxjfrsF6Hz+TP7zLqU/kZsPwg0UxEneEpAqsVtX7XwzYyrrqMj3ZOjveoIxdaMIL+6/AYsXXVBb1GfFcBK85nrMTl0TQstIsNS0fYSPytG2/jnq+zvxB3hO8mbwFp6+XS5MXsynIPQcyxO7vTMAeMda6/j9nvuqXfFywrUw8Zz1wu0kisviaObpuwUNoOpMt/xBXFVZKUYhqlcN9texiTr6JzkYh5qIOBRuFivzQTWTGdcx0vTCfgn/qc6/l+bh3zm6gHojtbcGzQWiRkHJqHBxL4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(7416014)(376014)(82310400026)(11063799006)(56012099006)(3023799007)(6133799003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gxhcOKKekKWyVI5mPnsGEyl+XPpGoawFv4n1F4lt1gMWFyScgFbDjoiDrz1dAl8PuIht8IhVMHXUOwfU2RO8Y8+bBtwP1Z4tlpLTc6VW/aJIJVGMGnD3uNp5FGNNahRDoFWVh/bLJJ7prhvRivFQZU88M33p9HbKtQ++K8H1tuV28RLEDQwzB0jELHUfCNp72nm7tchmwygzNrCADrWy8BSz9pAPwI/QwUT7G6ZloC/ffnd2fawLztEGCPlzm/DhrjJ4KRH2Q9eeUc4vzzTQXwVmCD1KM3oCslujvjXPTwKEByYvm5qKxdhgBYYnadnE7LDHHEf8PgwwS16TaTqJbCcBXTgdTG+2HYXReaPhNzVUfija68obm9EJ49FoB/G54rEJH48fTyInmXOufbKftpv2WEFrNFiNGWsC6bMaYDLY0ymQcNxHGYhm7k6IL1XP
X-Exchange-RoutingPolicyChecked:
	OpM+4ib08dSXikkA4tFKA3rAMUcAGFYMuJFUtSnvocLWi2pB3EflNHg7nhPbfxwzjue9+y/ekL5O3o2F53F+dBA8iV36+0vAaB4rP67UdoWoxjK6oqFkFn+rIZxQnrGPMLX0p3xD/YKRk8APa42SUbk+b3Eaxv2/XZlFFcHNMl1UMv5dpuYz1jctNGkt3MV4UzBmN01Cv6z0S6bBGZsULfBVpzvHuZriE6YOTGTOq2DQo44wzho339mKKfS6QNoVBCRkOMGt7Gb7iZdji7cLvzYZiV2OJT0Secqy1pEc+ds0bCAiQLLZg7sW6WGtDMnzKXRRTsY8pswDr+N4tH6SJA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:15.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd8dd01-2188-44ef-e3db-08dec2df2f30
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a228d55 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=CWTouP-59cMm0TkFMMwA:9
X-Proofpoint-GUID: 8rrwUUK7ZmQ8hzDeizG1YgaNxcteZYep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX/OJ12W5jFogN
 QnaLmmWDk0RSM+WJiqY4m7Yx/qc5wam+vsRI7PAoVk/j3hZfbnFmFOS6ex1sDJDqlszvk6N1CNT
 Zpza9tiyZCGtNs5GNPcXOVaDY0ZOrs0Ru1r+Q4bHpnBSlB6UQHj97pbnbhjxaIhJQrvX1uoZ7jf
 IbVsmyNQtzPOd+NHguqjyKdrHsu8loOFfUAdZ7ebu5t/mQiVqcf0Lo4ErArTWcXbYu9ocrCUJKx
 ASTZV3GrvO3uvJi9JQvEKhYFwmYuXSUELtFVsX2EIr0SB2jI9LzaBYai2lYLE235UCOdN9/+5YG
 oGyyfXe6iQnWREaIOByThx1LacyX86QJY71VyWIz/3w+yFDEw9WMDV6jaSJ47VTHQzRIvAG/9R1
 sgzf5ecyy1/zo7Xo9KCpg3TlTLY8ZnsG8Z7GZxeBpKM9PG07K657NkKC957s9sK1weTTLslf9B2
 SwxI2xK+HdFs3aqc9dQ==
X-Proofpoint-ORIG-GUID: 8rrwUUK7ZmQ8hzDeizG1YgaNxcteZYep
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111343-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 969A8646B18

Currently in sdw_slave_wait_for_init() the waiting can be skipped
if unattach_request is not set. Doing so was added in [1] likely
because the core used to do a complete() on the completion so
waiting in the case an unattach hadn't actually happened would
block for the full timeout. However patch [2] updated the core to
use complete_all() which means that the wait_for_completion() will
now simply return if the device is already attached skipping the
completion doesn't add much.

Additionally, unatttach_request is only set if the host initiates
a bus reset. However, the host doing a bus reset is not the only
reason a device may be unattached from the bus. Other options
could include the driver probing before the device enumerates, a
sync-loss, or the device itself powering down.

Removing the skip using unattached_request, doesn't cost much in
terms of efficiency and allows the sdw_slave_wiat_for_init() helper
to be used outside of runtime resume.

[1] b2bd75f806c4 ("soundwire: sdw_slave: track unattach_request to handle all init sequences")
[2] c40d6b3249b1 ("soundwire: fix enumeration completion")

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

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


