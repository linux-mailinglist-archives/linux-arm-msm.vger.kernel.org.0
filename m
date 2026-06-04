Return-Path: <linux-arm-msm+bounces-111187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3T8OE/xrIWrPGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:13:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09A63FC27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="Zq/KKS3R";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=fLNKDIgP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111187-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111187-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A46793083EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93E842DFE1;
	Thu,  4 Jun 2026 12:07:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423D421F10;
	Thu,  4 Jun 2026 12:07:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574838; cv=fail; b=tCA1GcXmfbwj4JZJSlMXdiUlUE/DgEgVC1vJ+O6OSVxOZv4/3q3JClK5yvssFBBLVuaZbmzvFGDzDBxEl9IhJFSNJZBbKwLEodZ91+Gc5bd5DOZPbdGUskv5Vo6FvgGHu6XJJmfQVBP1kVO5Tsj7bpVJLICOcyqpw8MddNgJKsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574838; c=relaxed/simple;
	bh=fSs9fKysOtb1t6MQvXY3cke9AsbOA/xOxb6yffrpge8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGOJ5GobeifFz3lGU3sNFojHIwiF8NcXG8itot9eQp44GWhpvZqvOcFU4sIKbci2MHyqdHPW20zEEXJivboGyu/E3p1Gzg0XVaEekn/BToDhYtsXIKznaYl0NgnF/PwhRCvyKzyjs5WGp5rhCVFZr08LSaIEiXXflLMg5Aj2+2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zq/KKS3R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fLNKDIgP; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6544dp78098694;
	Thu, 4 Jun 2026 07:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Dl05erBk+ztr+bh3oD
	z/Q/TQtTNqKtH/hjCfKAm28LQ=; b=Zq/KKS3R5r9RpPQbcFC84LwRIY+1bAWGF2
	1b1eWtmJMhzeTrAgsvV6jeJFGpBlUoZfvywesnAkdXKBULLsSmF1tUwPoRIaw/SK
	UwwvfYnQFchySNwBAsjQqKuYi3Z5YqVam1UyhpVcNgwJ3MtV40ZsrtR7bTcTWx3T
	+o1QnoefweYqE5vHUy6QiWeADer6J45qt03FAJ++mA2J9C/KJuiMa1WT+jkIkTS+
	e22VBgMmIeC08jdM/y5JFtbRm9Avsx7P3V+e50ViINpH65iMNjZc1J1rlL03JuyR
	7Na6V8En+vpwNALpOyJ0laWK4Os/5Ff54XmgivVXv+Uolj2g6o8A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022072.outbound.protection.outlook.com [40.107.200.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbr96m8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Jun 2026 07:06:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EW59k7KgK19aHHw6zTIX/Al3JHcD6Fg7LWNR7NBCSrBXB2Q+BETR3ayz3JmJkoUXp/34S+m5sP60nvQk9pUWfb3YosrvfYZooWlZAOCHPnT7EvO46xlCvXAgC8p0I9+hubq35qPOJharZo/lUacF2sFwXMuEobq7FlY32qvG6fGscxAmts/PVwtXUk5km/VzHnkvpqM6MGcv9hFbTSImk+Cck94dQ/bNyQQFk2YTLHowKnsXgFor4pDQgtlm09l9GoZo9QGrcRxg2urYT7mpczriY2zRvvTiQ5CY92wr4A4Y7SVsQidf0I9XAvIyJNvYodKSxkN3NcuOeUD/LC6AyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl05erBk+ztr+bh3oDz/Q/TQtTNqKtH/hjCfKAm28LQ=;
 b=D+AqHjo9MiJAO8X/28p1NYV0lYW7Z0fz97qXPd1tp9a2SOSXwSk4E9zboIFgH5cJOlFfI+sutmMYjk7qpz9WUOJxSIvh7LRI0i9D2YqXcMTBCWWnGxdu515VU96/9YnReeS4o/a6j7sajjW5Vnyt7tbr+Dqn+ubo27jr4CETJgx3Fh/BXyXebOOy8ZLzucuKoLZAGUuLtzWcSvMy4jW71u37VbUShwBNyncF2VnCVXeM6XUKLIrIl8Pix/qtxBJ6brT74Bh/EjXaCzm3S+JmWjHLOa75H5ur79HxYEt29fk19WxFEgxnQC0ToYUi4sSsGzqjfdtWTNKtcFTpeTF58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl05erBk+ztr+bh3oDz/Q/TQtTNqKtH/hjCfKAm28LQ=;
 b=fLNKDIgPw8y0UdaPEFzkt1LStJ1+FB5xhu3ValuVfrmfwcrYS9ge3TjNvKs+jXj6IbMlqo0gsiyoYTHa5Zl+luw3z1PBsf9AT4ukYcBdDb2efbrypFJFONrDAUIxeQSRobIv5b4iiX4Cmg54VIOhHVdhlinf80Pfn5tSKoQnpYk=
Received: from DS7PR03CA0120.namprd03.prod.outlook.com (2603:10b6:5:3b7::35)
 by CH8PR19MB9166.namprd19.prod.outlook.com (2603:10b6:610:271::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:05:09 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::35) by DS7PR03CA0120.outlook.office365.com
 (2603:10b6:5:3b7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 12:05:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3901440654F;
	Thu,  4 Jun 2026 12:05:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 164A9820244;
	Thu,  4 Jun 2026 12:05:08 +0000 (UTC)
Date: Thu, 4 Jun 2026 13:05:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Message-ID: <aiFp8sc2kqfqTelW@opensource.cirrus.com>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-4-ckeepax@opensource.cirrus.com>
 <2b73cb79-ad88-4069-b77b-0f681d450030@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b73cb79-ad88-4069-b77b-0f681d450030@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|CH8PR19MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ae9e44-5287-4873-d9a3-08dec2318640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|61400799027|22082099003|18002099003|16102099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	LGnxQYJ0QK34FikJuFcWxiOoqq08xFFtt0FoeY+JRSI1q+I0+pR/khsPppM9ogPerivw+XP3Op8ug3Sk/7qjEiGy1X+97IwZFWL3sxm2HpJDGoUrtrpOdC8F/BVbgWpR4LXnTkA3tg9lPxKfW9j/ArIHtNi19TE6QFcIVxLbQC6kUDUzEQjm58ePTbaIWjBk8UhGyFERpQgCwv/9uHYduV+rtNahPN0umwmtpAnEuqCmefU+Sk6gPRtpn1XRJPZSwpvVZvlSU7wGXEFHqxqObfXGg7vhZWXomsQmjvk6xtzzYmN7c7iX9ecpJ5pI/+sB9pI6ot7t1nvmoFWmmHWGtC2IeP2klyq4UOgK5q8e9pJBQr+GGFToVi0IwKx0RfjZEtRuzcxxL8OBxsthKgfsMNFcNtwuBdwHZWF+g0Fa5PQoV9WaHfhOlMvu8Un1cw6DWU1z/RBCXteltyopkfP7k2CTO4Ekpi/VWyMTdkpP3aRHkRb9kdcBUgxPDk7ca2QwUxILRsyVBKAxXA1ZyiKQ5znb3EMwA7tl1w+PBdFCfwBu9gO0ZG1maqJREEpNBblFszESWCSRgpHq/+1yGk4hOHXXvitxb4d9UV/VSYn+Raz/5r9zHRWBn25AGYIqn+AFeseUHb1P1BJVCTz8+9izQqMNpq8V9tnMmaYovBvzMzucfrjrUl8TCEOszedwZTkIH9jeAU8Ry7MiMB5zM6yD7vGQbQ7HXQv0+Uvit0O3AhQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(61400799027)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	60dDbdmRoVJNwaegcTQxBk8XuhB8aIsSFRhg78oWC2xAg8asKE2f5/WxlYi1D5HkHSl+GA8+V6kMZPE+3EspJ7fQ5sq37VH2GylO0+PkrWtJMfSSoRnslDvQGXoY5uJTiN9n7yus8pZpoC17nH34Q0Jh+6UsaNTizeICe7MV4vPWNCWsW6IGLWz0qvZ4fBbxQzHK7o/gp+eBsSX6WkPbGc38Kba/PpJ0bmfzVPRnvw3RT77FNB/69/TnqGZQaEh+6mO9RGBlmmMenSOO+iK9B++moduARowAEJdQrUI0r6t6F4ZHKndS6foHAemnm1sVtSrw2XTXc85rn71FCtijFgWQSDVdMqc1oQ+G0Ahjy81Pqc+0Qkok+31j4SFQnA36zWqFwx0OaXXdxbDksKtwbfWxOvvAsulmSU6Xp4ZnOnkb+72ObjM/5h+nv6mUizBi
X-Exchange-RoutingPolicyChecked:
	QCIEDg1jnFyRCk1BSVvje9KzRlXMP33un+b0FaDqtca9VrvIR6tXwgtBrirsx8UW6S0j0VGGNHzW2VEZm1XzGSzUM6ZOQpmWdkraa3nHaskdPg6BWuO6EG2d+hhRWKQxilGSx2Sa7PXhBpC66sRAMOYoJhpkd61qtnly7QtVC9CGTwBOGAwwJvIHSIlRbujNH3zAWGbbpGlGheqAwhOzqJPxeFF6UIFAQJg4icehuQYS/gs7N53vk5KR40NTrRjcbg4cFfMF1orPr9psQglK75PrYvBwQk0C9sph14RmNJ4+CvTIfVj7MCdaigiqQ1tUavmQn/D1zrNBGtbOmCqiPA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:05:09.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae9e44-5287-4873-d9a3-08dec2318640
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9166
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExNyBTYWx0ZWRfX8TbTbVOldUEV
 bAD8uKLTvPemdwBy3l8u1nX4fWWKPKUnpXUKQVo5t29+UrGTd6J7gzRDW5OEy7gscVcC0u2kyjc
 Q5Ivu+UKnX2mkeQ2UWJq4+TAb0k4dn+wriOUemNYgWNtDUwQ8Hep9qlwaYew33LKoqbGM9/yUCG
 CuQu71RrJ7xVOutxoY1eNC33AViiSGorgZrXLXkzhPFHsZ7rydy6AxAJtzleS6E2rou9yrcS1dr
 Dual/CQRxFqYBB+Rplud+gGK+kAHT02imbyf+df1Ayk9bRoVjXILI12bAfLGF7XgwiufqexwvV1
 YvySEVQ7p2CpTc8314AFT+cUzH0x24lhHLQbZnnFDn2BgQWNECinDk0zq4F0svigNQXmsydoqGP
 Bdw7LB/6NfF38ihV2EZse2Y4MAjOD7l6ixKQjSbrJi/ceErY+todB+HTbt+IKYpzRj72rdvmEOh
 KdORTfnQINyXxSSTTqg==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a216a4c cx=c_pps
 a=lZ5sci2pGqwcsYvHxs2BaA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=W4LOWvyA0uvkkEYctKsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: aIHAc_w9lkES1X7J6DSWWGDWHiywYpJx
X-Proofpoint-ORIG-GUID: aIHAc_w9lkES1X7J6DSWWGDWHiywYpJx
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111187-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus.com:dkim];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE09A63FC27

On Thu, Jun 04, 2026 at 12:04:16PM +0100, Mark Brown wrote:
> On Wed, Jun 03, 2026 at 03:44:36PM +0100, Charles Keepax wrote:
> > Now the new wait for SoundWire enumeration helper no longer depends on
> > unattach_request it is safe to use from probe time. Update the driver
> > to use the new core helper.
> 
> > --- a/drivers/mfd/cs42l43.c
> > +++ b/drivers/mfd/cs42l43.c
> > @@ -586,15 +586,13 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
> 
> > -	if (!cs42l43->attached) {
> > -		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
> > -		unsigned long time;
> 
> Are there any other users of attached left?

Hmm.. yes that is true this is actually the last user of
attached. I will spin a v2 that removes it completely.

Thanks,
Charles

