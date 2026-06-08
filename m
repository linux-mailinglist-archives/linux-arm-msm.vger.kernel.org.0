Return-Path: <linux-arm-msm+bounces-111826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxxCOOOgJmq3aAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F3655701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:00:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="ls3/gUOX";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=i3L7nyis;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA83331F230E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16523B9DA9;
	Mon,  8 Jun 2026 10:28:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E743BFAD0;
	Mon,  8 Jun 2026 10:28:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914529; cv=fail; b=KXwAWpHcYyqS3SRwfnEt7WXrXS8IfavjPHXFkZhHR0gOo/dGd0Iy2XYt/kMduYRrn5OcFDVcV9EhFEYC58L7GeNOfYqShQ+0aqwWFCB6C4ezxKNs0jZnOf7cpc41pcLlNAMMIHjAhRAH/x9BFc7a671RjtcnhVRe6GWl+HWR8y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914529; c=relaxed/simple;
	bh=3hL93PdSPnixlDT94emCUc5NGgPJqG6cYeGgerYmPH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMRGteZnoeLnmEwzNCAK//GdSuNcYLjHMeOsxAoJvVcW8BnUJjvnN0566DVoiCasa4FzEQnJcW3lSeV4mrXRv+C0x8YW5wK0bFWQ2FH+z3DR8acYGD5zCucKPTyT7rZMEpoyqY4zmN+jS/vRcq10u80cSbXDo66FwPOGuBWUtfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ls3/gUOX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i3L7nyis; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584AmNa1786307;
	Mon, 8 Jun 2026 05:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zUsGZ01uJpLpIBsU21v6zWj+/HsJ3cYYlCeuA9vkkmc=; b=
	ls3/gUOXOR5Gh2zgbQ4bIQjOBshl82EWV+iOgdzvAKahlPrkB1HRT5CdMWhU7+bq
	TMwT33h5lyvDUMMesmSudxIc/FmniVj6hkQ2jz01T2NeoNcre/WTISutSx/j7/rx
	wrb6Q+xKwSQKP5wxTKtHcq8LlNS2KeCp8TkNCkS3eTfMPqZ6IFCATtv3CNVfklCU
	ZXkHoloa56vcWPIKijZoqs1HrF+6dwPz23sDBk+GrI5pZGI9Y91Lh7VMLDZIb85v
	YQwZVyEwQ4y0cyMbPCRrw/gxhoRXZaLHZ0rPdknNtgfBCzYn+qS6Z8/OZ8/34i8i
	meImsmCkBRFMmqbo5qmygA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021122.outbound.protection.outlook.com [52.101.52.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyga9f2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAmTIQBBeuiWK8uW8RYLGmr/imKmsTLLy6pofKBWlO5E8pIwVhhpvlFAQeJTzbUyxjXUrYzl4zpPjcYDs7YhpGA7n8RvBbTuJ3fQdDsLIxYOGAvC4FQlIJmczhDh1JUaJgt07wIobnDc/m6A2OV+drBBXX2iZnr+oVhYZqC/u03FxZ7qR6AQfz2nG4sXnO4GrnLdGANXd9eJgNkC2Jd56KQH0LRYSQXHHlzH4qG/6NHZc+Y6JhljR1zzJfL6qrLkaLz3CDN4w1Ew5+h/YtASfQtu1VV9r6hgdQYgGNL7qmZJWiQdYPKdly7y+V+Mtc2f1FYMg9kQeHve6jEzajBTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUsGZ01uJpLpIBsU21v6zWj+/HsJ3cYYlCeuA9vkkmc=;
 b=s+6CvLhY+ZWnKusLxawrRtO84ZdO31EMWsi9xe1FPu+BR2EsCJ08YY6t2Cy3bnnTwRnNj+zCFMDs4JAECPyaBFAhAg+Hv9zNAyBHDAO1vjGuevzbjZUTJ6wAIZvkGygcMYcsjsYgBJcBaG5OUyn4cul8b+USe7mJ+mOgAG7iGosPbaGq+PksU2+V0ZSNbMUIVysj5fMfcra+DYzhUWmBb0e1y4r9YZ9RaJVHrwJe5kwGziACHozo+BJF+wQcrTEtJjHR9EdSQgBXXwMS9hclw/FZG7HwyPPX12g9VnOVt836/z8TaMbOrR0sTjEYkB3S+NiHMGsxwJUSfDWZotp8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUsGZ01uJpLpIBsU21v6zWj+/HsJ3cYYlCeuA9vkkmc=;
 b=i3L7nyisy+LwusQGOhMer5cnVgfYYIJsdrsaq3VEhQJ49ANyamqwR9rkLdIGlA/dtIOIG334Vct4CABQQb3DImlBcxGdElyzGAR8F9pqBpD/cgHtOeOVQrFsaG66vgzPrZdTfX0bJV0/r6l3qmkVAm1Q1i1xshzU6wg5kSIAbG8=
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by IA0PR19MB7655.namprd19.prod.outlook.com (2603:10b6:208:40d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:27:22 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::7c) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13AAB406560;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F25D482025A;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 09/10] ASoC: SDCA: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:13 +0100
Message-ID: <20260608102714.2503120-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|IA0PR19MB7655:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f972aff7-8fe4-49dc-cab6-08dec5488686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|36860700016|82310400026|11063799006|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	FFYXUZwQBEaCXjQZ2V382HCae1kYsAntdPS9QJgtm9Ro1H1n3u3dmv7Bko9LYhGQX2RXfhS8TFZCg3B8RRE7DCfd993QKCy6v1Zh1zNm+0qh+TVnhf3Uy0PS5Z7iRzvPmOwNrzqMJeiM8lkJwhCAH5cn9PTY2pdcuQpZuQXWqlXo3FUzGPfVq1ktKZm9A3O+PHaOYTyPj7z6p0LBkRxw//gnebA+pfzdtDZFRbt0AHGyJDVUVy1KIzy5noOntv4Xvm4zFx2z3FsbPUOh7gRxGgkuPbo+gOgVb4blvgdVT5CTTmO8vlpTPAnzzWh5DaMUgKlFl1gSSNMJZzoUgYu93mkzsup09x6uQlOpKr4xfh27WztKb4k7fyx3RHJNUKkl16Oo6jDpF1LM0jVqJ3mJAjs9XVz2DsjiLrg981M4rYNY2MqfiTP+8/tyxOAM0mA5drLf3303idx/oP0MO97fxRkhtkk8WFWn4uDQmCi+wHOcifaoQB7rSWK4RyVPCvxKkIQqeywP8qg3gA0RJ1Y9xV2GtALgDgPkvLIAcPjv7Ve8tH1IbFKXXNLM2cb/mAOzNiDjkw/KK9aqAyqZf6O1792NK4hh0juHF59EHttGms3TIXZ5oYeQyYtgOec4mIbw08y6Ejmd1FJ9G6Cw+arkUCdngzaULGIBHpflUvCKqVCIdnqlcGNpOgj5fYSjJ54mN/xGic/8dzqJR/FR5cbDivyDyNi7OqLBRWXKZQ9PexY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y2JltvzFAO5qkVsoeGAFv+35bwJUAI83Q5dDRJ8vN6JGm6jhxK/MLZiHrGV/onbpPH/2Efxxk2rNGnQKspxpCcE4fSEmqrPks5ALHWY8kQcYzO16Tw4nnKma2FM5WpTrKx81RnKGi1f+h1yKlGddOisSHl9+w7M5cB3nNnaaH4Ft9eTW1qr7OdTgFsUCP6EXLsaSSWvY/AZEl1A2RCSPNDweTS+9C47ym1Fwn5kKAiI01ZJvprlQoRJZ3zOt31AprGgPWfIgyMxYhDhML6wdEprofQwniJfZM3TlwsBvaJgAQV0sAXy08E5xdv85PXJirZCber499zf8LpJoSNs51hMsRmHZe19ofaeZiaD7EncnT2rBC2KU2DVWSu5Hu+aRCS610ypdbu5TAQi7aYl/2/D0LmvBM8boqfAVbxtHOPK8QxWEVJvDsEqwtiKvUleg
X-Exchange-RoutingPolicyChecked:
	UrW3jEfXkUa8ivJg5K2k5tVE80g6BLxM0aJSu3P61BWbTBJmmoW1Pa1Iw47eyudHWhuIIwIUibQ2UnIAHsiMwI04OQZvVvZLUWUX5Q2YctSMLIbnu3ZrLQMoFJi/AaThZwwrWv+233uf1pEvPsiQx6qCe4uBKt0Y83OzzVtKpkR3UeXymJ176uJg5kChDTdk0ql0J3/Er3yf+oYAP7sVovBUPKczsEO1ShvhdqxAzHyaUCCg2w0WKz3l0zsrwACLwVfGndduTcd2NcLY2AnS9RVVr+Y2osrDgfJGpIoc4slPFRRvflhGS6Mrkz4Fp8gC1ydhB2a1P09B3JiYLC0gHw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:21.6337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f972aff7-8fe4-49dc-cab6-08dec5488686
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7655
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a26990d cx=c_pps
 a=83jsKCSeZiZisq1MDa3xoA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RJn9l5sriXOQfstplqwA:9
X-Proofpoint-GUID: uR412qIQ4TNuOZjTy46ZITXaR2JTCmof
X-Proofpoint-ORIG-GUID: uR412qIQ4TNuOZjTy46ZITXaR2JTCmof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfX3tQFJJtWQNWW
 J3ryMBUrdjlYLDEvc8qR6L9RJijSCKOSWl8tVNqgjfFBgzZd5clfiP/k2FWDCHgw4io5IrxPDG9
 VLAXgnQKaMDinhTr2D1jJR0atzTNYgyOb0qhBkWk892yW1CFzWAdginwkuboFIxkcPFLHJgrHbe
 DJp+VFi2r2U4R2MKYBBDT5aPPTVNMEXTmskx3u+nZlFg6uNxBcgnpH/aPppL7trgtFtMFTHAMwh
 poGBL86a+hCD9MUDAE0sOtgxPE7botwVTtPGm0EQpD1Z3EZVbiEjme08PjIxIA/og/47/koWlE5
 4vuP292NQlZYyOUwap0lMI8ib7IOa3jH0TUi5e3FUNIEz66KNvAi9ReC2Ay+KTn86PaQw2ttNfV
 t9KYf22NfiDu2Us/NVb9qmwAGGyfG4Ch16lXfJ5fDfLjEcBmMxcGZUZeXv6L+cvTnVmU8HvflQ1
 M+LYTobu4S/UMMbPDMA==
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
	TAGGED_FROM(0.00)[bounces-111826-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 422F3655701

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/sdca/sdca_class.c | 53 ++++---------------------------------
 sound/soc/sdca/sdca_class.h |  3 ---
 2 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index a6a3da8de4371..6937a91ddfb9b 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -38,35 +38,8 @@ static int class_read_prop(struct sdw_slave *sdw)
 	return 0;
 }
 
-static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
-{
-	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
-
-	switch (status) {
-	case SDW_SLAVE_ATTACHED:
-		dev_dbg(drv->dev, "device attach\n");
-
-		drv->attached = true;
-
-		complete(&drv->device_attach);
-		break;
-	case SDW_SLAVE_UNATTACHED:
-		dev_dbg(drv->dev, "device detach\n");
-
-		drv->attached = false;
-
-		reinit_completion(&drv->device_attach);
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static const struct sdw_slave_ops class_sdw_ops = {
 	.read_prop	= class_read_prop,
-	.update_status	= class_sdw_update_status,
 };
 
 static void class_regmap_lock(void *data)
@@ -83,24 +56,6 @@ static void class_regmap_unlock(void *data)
 	mutex_unlock(lock);
 }
 
-static int class_wait_for_attach(struct sdca_class_drv *drv)
-{
-	if (!drv->attached) {
-		unsigned long timeout = msecs_to_jiffies(CLASS_SDW_ATTACH_TIMEOUT_MS);
-		unsigned long time;
-
-		time = wait_for_completion_timeout(&drv->device_attach, timeout);
-		if (!time) {
-			dev_err(drv->dev, "timed out waiting for device re-attach\n");
-			return -ETIMEDOUT;
-		}
-	}
-
-	regcache_cache_only(drv->dev_regmap, false);
-
-	return 0;
-}
-
 static bool class_dev_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -151,10 +106,12 @@ static void class_boot_work(struct work_struct *work)
 						  boot_work);
 	int ret;
 
-	ret = class_wait_for_attach(drv);
+	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
 	if (ret)
 		goto err;
 
+	regcache_cache_only(drv->dev_regmap, false);
+
 	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
 					  drv->sdw->irq);
 	if (IS_ERR(drv->irq_info))
@@ -206,7 +163,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	dev_set_drvdata(drv->dev, drv);
 
 	INIT_WORK(&drv->boot_work, class_boot_work);
-	init_completion(&drv->device_attach);
 
 	dev_config->lock_arg = &drv->regmap_lock;
 
@@ -290,10 +246,11 @@ static int class_runtime_resume(struct device *dev)
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = class_wait_for_attach(drv);
+	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
 	if (ret)
 		goto err;
 
+	regcache_cache_only(drv->dev_regmap, false);
 	regcache_mark_dirty(drv->dev_regmap);
 
 	ret = regcache_sync(drv->dev_regmap);
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 8b63e62485e64..57f7f8d08f497 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -30,9 +30,6 @@ struct sdca_class_drv {
 	/* Serialise function initialisations */
 	struct mutex init_lock;
 	struct work_struct boot_work;
-	struct completion device_attach;
-
-	bool attached;
 };
 
 #endif /* __SDCA_CLASS_H__ */
-- 
2.47.3


