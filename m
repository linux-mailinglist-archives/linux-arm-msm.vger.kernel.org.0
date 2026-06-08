Return-Path: <linux-arm-msm+bounces-111818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9jbzObugJmqoaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DC6556D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="o1//GXH7";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=LHHEqjPx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111818-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111818-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01AF130EE792
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E633B8958;
	Mon,  8 Jun 2026 10:28:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5590343D8A;
	Mon,  8 Jun 2026 10:28:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914511; cv=fail; b=gN2YYZSg1kiP0oxXb00Sthb/WIS00UCoyAxBFbve7ZVwRF+ooW1Dno0+yp3rBiDgJYegLruqdj4t9d0/JrGkKKWrKP+ZNDKG2nsx9O+Lu+NTGI5A43En6rO70+RwAXBppx/uj0KvdOX32pKHJLkl8XccoYp3ckcFYFHFnA6UZlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914511; c=relaxed/simple;
	bh=/kbMfut+V0lg82Bkb6vnbb5kXPXM6M346+zJhSD9590=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHEg9Wy1ClbET81zLiV8/tFY84Fo2Ago3clhWiC767OM13m+20Yrjv1xV4qxs914l286sZlMBLcONW0l/myXDSDCoNuR+n+Y79zgIy5ffc3SOEAA9MwbmG9MJhD/XrXkfEpUhplEQ/gXbMMTv8NUXI/vp21XoAI3UOhwVW4Y3Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o1//GXH7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LHHEqjPx; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6583Mht03520654;
	Mon, 8 Jun 2026 05:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gYXIacxcw4bwP0hEr4URuZDtvGipQiofwVFqbjJVJww=; b=
	o1//GXH7wxuQfEz9OTW6/q7k/DqhcPkxSgK+pOd880P2wH7l0MBxzacSyZB6I/Y2
	NuLs01x39l+bwAEuuK0AoEStOZpqL6mDJSUGXZVrfbWkOiUTv3HnwUfnWtmSs4B8
	TZJwzDnKh0vXTa4Oo6dIdFRLr68XfZzvs/vjwgnqiTFlDB+5zxi+Na6smQbaj1YE
	SfxXy5rPDUPR/KPrVpQ4Nipct7eyvyPd9R0vtGbMXeFy6OIxcyIxtvlGi3HKn+ne
	46Q5wHwRA6QZomULUha/WrK6toMk+UCPGjuvn/e25oIGjl8i3oo8PiU0vTXGFTSH
	X40bTRX5K6bWfo2uoJy6lw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020114.outbound.protection.outlook.com [52.101.46.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8qa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc6qS/Ds7lw97mhFJP9z/xj+7x4gIHBnvrvTPKicC2ITMDd8CXuL7K1IDS8CtFEON5THy/mZ2jJBoQZIGZYC0sfal8UswZT2iaRTaSBFbXpqz8tRkGTsBTSh3v/GMYlE4N149IQL2Y3yZ5toY5xcd8z5z6kFoNQp6X9JA6sVODAxgwNMDHMngO9lfU4T+aLelWH283epj3KTHVdG9RrmifBxt2Csrwdn/9+fRwIaKDd58rK2yANdxw8IN/w7iHBAD00JIW/26SyLqlZW2tFr+3JD1ePpGuMgARnRLZhAYGZqVmCGAhq/hzfgvp9eYoKDtzyvuKisr/okyHHK2YFrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYXIacxcw4bwP0hEr4URuZDtvGipQiofwVFqbjJVJww=;
 b=TRo8W7WryXB+EvVfKroUp1rp1krfobLWtiLsWC9GF8qs7z2g/0NY7kCfVAnN+B9cHX7MZSqB3tWswPZZRCEd8lKMTFrZerREjXvT0vO4XFk5fn6MnNk/r/qYJ/sQTEUGSs34RRPSMiHVlmmDKGEeiBgpI7wXi32E81I7rcjLzluuKfoxeijle1ozDZ9mUlwz504zADhFWihF8y8Us13G1jImlnlTz/e3aSjiKI7biwyHeeJrO9i3r8qGgXziEJB/zsxRoXvgi+xEm1AzoIqkuN5B1DVEazPk1/kW4uU/1FGyH1i2kgjZJrfU2CVULG8uWGayJMHEVKp+xibXWmWh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYXIacxcw4bwP0hEr4URuZDtvGipQiofwVFqbjJVJww=;
 b=LHHEqjPxI1RQNYyHD1KDpBdlHVd6f9nWMK4aEswOgk/uO/opNDJ0l3RG2zSXmNjCQDhB7j7Z3gvGYjOnxoZBDa+BQWhdLPacBnSVbN2+p+G1C3hCNWFpkoRhpG25CKQgAxvP1NfaLOwC7wt+IaSuf2G86cWDC/v7KdxR2SCkMFw=
Received: from MN2PR06CA0021.namprd06.prod.outlook.com (2603:10b6:208:23d::26)
 by SJ4PPF60DD8B772.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:27:23 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::2a) by MN2PR06CA0021.outlook.office365.com
 (2603:10b6:208:23d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 15369406562;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0263782026C;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 10/10] ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
Date: Mon,  8 Jun 2026 11:27:14 +0100
Message-ID: <20260608102714.2503120-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ4PPF60DD8B772:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 223ac3de-7e13-4eb4-4077-08dec5488693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|36860700016|22082099003|18002099003|16102099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0oyn/204vHhO6ZGdtMzJF5LpjdZLiSUVZ8+Ohe57Dfcnp1rCJUJshrwbpeeDMBBFoo/5ViuN3Zkl/mAaZLFaH16n02hPk/Gd3a337OiEAmUKRD5E/LNM9UCYVFCjO8tbNmK7FWZIIv4BL8VMgwXf4QkeAHtYwv8UZCibUeGYHUPiLlV0sEkZC6Cpi5zPZWrV8OQHZ+q6u22/Kb4xLdiXEOqyaZBTSxticVr8s3M3uXIf9u2I2c8qW4xam9AVOEfbqnDnpI4zejYIHNkkizt/dO1po/fiJfb/m7xhxAmGDNC191QuktZGaE5Xv4iO5bumTR94fXDI9I6tm/ac+6Hy0n4273udXSmEHhuVNSsX8OvFAKMBFJGYkbDRSYnkxoT87kLkqUc+7P/R0lUgio18+MnFhZ9y0iDpb7s6/Pz3eDn2YMwX73XSOETV8DsrRKx0L9x9gwyKlNxA3Vn5zgP6pH6AVoht+PkoFL+abRcH5R4058Ve3aqoMrJrwbM6mg7/+ifC5S9mec9djeG8Cv98Qef1EdJBuJks8U/JorcKr8O4eFR56lx//6I2cnZA/QXnwhueCRHmYwW+A0ke6y8fv42rnXk+ghViepfJFX/Bzq/XUlng3A4LbJZimcRfP5owNphWIx19DktUDGxB70ZtSXq0B3IF8VVgpBzz9ET6CHMUN48GOuqahjNrbahkYStIySj7efE8Z9Pfaq9EqrzlyEs0C+z3EUugHvh79y3fHEo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(36860700016)(22082099003)(18002099003)(16102099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rcw1euXuds7QrNIN+ekCAzm1oKNIFglWMO3Gk6yxobk22XAVrRvqjt10xdOQGjoY3hZ0gP6C+32IWipsb67Gox2MnpQX3FoD2kQuYUn/DZXOvC382MZ21UysMgPsDbrhICMd1NZJeQA0HuInnEQNNWiG5YqU3xj/AJ9wJvTe4JSkEV8BV9FGoX2o3rzjUmZSpYcaGB7GplqlVaD3MQfs3gAt0NLxBi1baROCNlkSDHC69tQje6lT2WpHdxr2F7xy2Lb8feXSWVg9dfDV2K7d1QAeskQxX+FQi31knvoXZH8QGzt4FQ6X/0KdZq9H53P5NTTtl0noDfAB9j950pzQltWrE9M5B7PzwF1AbUYytCqroYnktVPv3ANf24/0ouAJUBp3bs5+BO7rHRtUSi6/Sym4NGj54HaOlVFajnNatpdJP+XBun8IbxSz3TjvX3MA
X-Exchange-RoutingPolicyChecked:
	U0gpFI93WE2agmjK8ZMaSEPl8JpagIiiPAE2AKQzGUL81rz+ijwkz9qbCgfN4rQ8/wf0Pegw3F18bu+IU1xN//Kh5GIKpp+uGOEkDQCncA9uHQtZZMICMsMTU4+Aebpzx8GushZcud8aBMnoo/ZaLKXucrgNQoUV/+ifLQn8VNJR3qrBEoFzSNgI25PQIIzLIRta9MRg4pp7XBNWDTFttXGZLscgwuJmdVxFKkx2l1l1fgRQtMSf2VQxCPm0XAZjBFbU88IvCSiivnpTUd8486Rubb0KZ6dMewZqn6DwP9i54uuOHVOO/6wwDFYZ5vibzQhG3AFO5tbJ+3RCGcAMVQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:21.7175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 223ac3de-7e13-4eb4-4077-08dec5488693
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF60DD8B772
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a269910 cx=c_pps
 a=LvphRkG1ZSFrSK8rCZP5oA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=fcoJ7aZ6GZweFMwf-4cA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OCBTYWx0ZWRfX+FCHiHvIGBH6
 WdMQ/qmRhtwBVALAxfsMgm2hlEFNH1Hczr33bUa761MpK6ZEe2P6F5XTgKWvlLMpyT7rrBjdhf+
 84kF78c80a1ro5ESjAtCuBvy3WtoTvHVD8gR9jymCxl+QuSJeL6IXNhlakqcGhrAHOG1JqKP0Fk
 i3rhSbBOHTQfpcNMRRTAYEuOmAR6sgMsEgmkmM0od9axsLTocnRl27Qut9423mVPllubNvY0GjH
 RuRiucPA4IkMcDnv3RSmwfZRRN+W/X4QMaIfg37Z0+AlSROQdJ1bp4Rq45uuelL0dSup2u2FbcT
 dObfmhMv7neRkqQdIu+aIRvgFtiJ64Qbj/L7/BI0kTeOZYE1+54l+PmhNunjrSSJj0zIqeClX+L
 CUp691vwGSMOZKKHVxUFRvecWOIcQOyYReRc/6bu1Ma2cKFkG5N+wWvWy07G/j9GfwEkPNRlU4+
 a6Itljd94rQGjS4QwqA==
X-Proofpoint-ORIG-GUID: ka1nMUVsHz7O6CBxNIwyl8rVK5VGcOVY
X-Proofpoint-GUID: ka1nMUVsHz7O6CBxNIwyl8rVK5VGcOVY
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 207DC6556D2

Commit [1] updated the core to use complete_all() which means that
the wait_for_completion() will now simply return if the device
is already attached, so skipping the completion isn't required
anymore.  Update the code to simply call sdw_slave_wait_for_init()
unconditionally.

[1] c40d6b3249b1 ("soundwire: fix enumeration completion")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/cs35l56-sdw.c | 47 ++++++++--------------------------
 sound/soc/codecs/cs35l56.h     |  1 -
 2 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 847e88f3b2044..0a55b93b96f96 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -330,7 +330,6 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 
 	switch (status) {
 	case SDW_SLAVE_ATTACHED:
-		cs35l56->sdw_in_clock_stop_1 = false;
 		if (cs35l56->sdw_attached)
 			break;
 
@@ -352,31 +351,10 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 	return 0;
 }
 
-static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
-					       enum sdw_clk_stop_mode mode,
-					       enum sdw_clk_stop_type type)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
-
-	dev_dbg(cs35l56->base.dev, "%s: clock_stop_mode%d stage:%d\n", __func__, mode, type);
-
-	switch (type) {
-	case SDW_CLK_POST_PREPARE:
-		if (mode == SDW_CLK_STOP_MODE1)
-			cs35l56->sdw_in_clock_stop_1 = true;
-		else
-			cs35l56->sdw_in_clock_stop_1 = false;
-		return 0;
-	default:
-		return 0;
-	}
-}
-
 static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
 	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
-	.clk_stop = cs35l56_sdw_clk_stop,
 };
 
 static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
@@ -384,23 +362,18 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
 	int ret;
 
-	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u in_clock_stop_1:%u\n",
-		cs35l56->sdw_attached, peripheral->unattach_request, cs35l56->sdw_in_clock_stop_1);
+	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u\n",
+		cs35l56->sdw_attached, peripheral->unattach_request);
 
-	if (cs35l56->sdw_in_clock_stop_1 || peripheral->unattach_request) {
-		/* Cannot access registers until bus is re-initialized. */
-		dev_dbg(cs35l56->base.dev, "Wait for initialization_complete\n");
-		ret = sdw_slave_wait_for_init(peripheral, 5000);
-		if (ret)
-			return ret;
-
-		cs35l56->sdw_in_clock_stop_1 = false;
+	/* Cannot access registers until bus is re-initialized. */
+	ret = sdw_slave_wait_for_init(peripheral, 5000);
+	if (ret)
+		return ret;
 
-		/*
-		 * Don't call regcache_mark_dirty(), we can't be sure that the
-		 * Manager really did issue a Bus Reset.
-		 */
-	}
+	/*
+	 * Don't call regcache_mark_dirty(), we can't be sure that the
+	 * Manager really did issue a Bus Reset.
+	 */
 
 	return 0;
 }
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 6a27ef2b7569a..9acd2e7e17c93 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -43,7 +43,6 @@ struct cs35l56_private {
 	bool sdw_irq_no_unmask;
 	bool soft_resetting;
 	bool sdw_attached;
-	bool sdw_in_clock_stop_1;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3


