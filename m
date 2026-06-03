Return-Path: <linux-arm-msm+bounces-111010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4iqnMYBCIGqNzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:04:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31582638EAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=JwlSJKwT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=gVWiMG9K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBE9632D80EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235CB3815FB;
	Wed,  3 Jun 2026 14:45:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658A24A06D;
	Wed,  3 Jun 2026 14:45:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497945; cv=fail; b=kMYPTR0ro3a0/Vi5FwFH2vza9xo1fJGFmHzsCgmXpboHOyOvLymNEzaZC9xyHmAsB/U5wP/A4H/XbXhE4f6h7hfQx1AmcuOSYOm4pxS7xi4i37Se3fSz8dcn1Q6KBU/9Js7rmPwu2DiXsibaZhvounRewdxyyuaObVNz6kflsUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497945; c=relaxed/simple;
	bh=u//Av+sb5wJsb70mZouhRhVtHE2fyjNA+J9TM6dmqI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTzeUcon2OEocn/llppjGNna8q1OaLAmulFnYWLDuHUD+iH0+ABG8kELMx39NEhLpKbgnhQ98u3LUpU6G6nk+BZBAjTCGdf8+nTn465EJeWCZXSAoBPzn41YCVxzvf74urw+z/2e55SbdemIivLyA0nH0l/0ceBuuYdm0f1sK98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JwlSJKwT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gVWiMG9K; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EPPWE2840062;
	Wed, 3 Jun 2026 09:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Oivxc7nyIFh5PB/UbGIVdZAgls7y7JxnH7eGai3JxBc=; b=
	JwlSJKwTG3j6fKEoKkW1/YTxacOlPaBsCUM8W8Jvy9RrU1PZffAbHffzZy8oY9n9
	T+wJnQ6VUrU0YgJTw4QsXTuglkakxrKK0iRxNXe9DykpSiz919wui+Ki3w1iezTI
	jd8zyrZ23wDLDMvfhp6DIkM8AODsUJIrV8/Lec/viod6VKV8VvujK/2xVpXO9HRc
	PBwBdbAGUonOwPcaMrTcCXZz0bjxWObjshwSJ6I0wTdOmsNWNV/OEZd1xvT3HOHP
	R2xiQdzO2P/rWW9WgxliDszM11uYRy/VDwBn4LyQEPkkyL4wUa7G13cq1giNtj0y
	/+CP3oC2kF+GfH8uqcHIjA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021093.outbound.protection.outlook.com [52.101.52.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagedgc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPHxEjv8xClwzGnQuKROGpPT/Pdo9XpFMFpbJOWKWBn7S+lKvO95RCSEg+VodHjmpK6T3mNENqQcAK72iKVbzFOvvObFczaoxfBHUGzLbZcwr5XULTEfRhX8HPxmM2+38L6bj7XReHW0pApkprZcrXeS0KzV57kGFgqrP5NLux6QasM8qYvGGkJIX1c3J4Q4KcH389kTw0ZrKDPvZuEjoOLL9vajZpVFPKZcx2mbLTCWeC45xNRsVRSvA3zWdA3MLxF5m6uJWiDw2hRlq/IBIky9K/eHfDOIwbR1zQIY5zVca241EUHSjzLAbng7MUjwLVXuq5ilyGEXKTNC+rx35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oivxc7nyIFh5PB/UbGIVdZAgls7y7JxnH7eGai3JxBc=;
 b=j97ydC+oD1ogrZOL8MDBbhQO0DwZd/n3xsDVyM25ILOi8pWRtd+OB1u8PA3LsiGctGE6alovPkPDee3R4rbnWD2ezhTB3JZWdtxrY49tSVVXKizK9lrwbFs5+aG1/yBjcHH2sWUXeXoGDm2U1+vjRLmAeOXNhEn+o72+sYx02Tchb944iBr1TrlNHrgeNFa9STqgbb5tyXCGSRIFYCNye4QwRY5OaPfi6zV/Fhx5ivsQYXEmVOtqi81o20OTjFzJmc8ZVyIMJBCcBde1Cqq0qGqJGl7eaQR6gI8FDW1mPosmNc/o1bcnKCQYv2g58Ra3v5LG3x/tfZTfbId2vT1HYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oivxc7nyIFh5PB/UbGIVdZAgls7y7JxnH7eGai3JxBc=;
 b=gVWiMG9KGoYY70hs4/e/75SfiY3Ex/1sUX2a0u/tZUOcSDvqrI0kaoNMcpK9q4IukoWkQXBWQysbr5oFIQYJsY4CrN8T0PVAZJdzUt2rTkrPASPvCMAXHyOGoM2NziINaHdrwSPosEO4c2WNklWFNH2LgFdTEcQnqVOT9gK3LfI=
Received: from SA0PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:d3::27)
 by DM3PPF667CD6AB5.namprd19.prod.outlook.com (2603:10b6:f:fc00::72f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 14:44:52 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::34) by SA0PR11CA0022.outlook.office365.com
 (2603:10b6:806:d3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51EDB40655D;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 14D52822546;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 06/10] ASoC: wcd937x: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:39 +0100
Message-ID: <20260603144443.593230-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM3PPF667CD6AB5:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ccc99281-4bad-4eef-8792-08dec17eab5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700016|18002099003|22082099003|16102099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8yV6syDNCxWV8ioZa/GCFQt/MlqjQ7sPG346xhk+hgprhpKBI/7IoX3IUVQwvHg22hAkgnfG7Tipy54dZWj5OrGsaQFiinUvjVd3tWSM0aW2CQMYnoRRQjjyCr3bwMAvgErITtkDhAaRo2lY9FbloZgp7hTL0JiqpLqg2NzvL5RpnPMD9ShIh2/1yxjQg5mB4G0KSQB8juh2/lmMc0InHEZsb19Dq1grjQF4JeSN7oFp4C40J9R1SylwOPESuOL8QkWlsm9FtnfmYWd5/PtakRdnTPmhr66QtG0QA9dFi2D4F7u8agOAbv+ceNCNB5p1SuxGLmHcVc05EzkiwInzqvtWUPRZKn5Wh2IfTLAa30a5N/J20fkJLptWSxLHJaSnC+skoujw21AsupsmXAsX/pzjrIu+1l8muJXRngvaU57zy5datIzAzkeEYv+im8Tx2nEwIcGbM7FY2fLpmzY3BmVT8gfJDmM1YCW2KYpbGEGjLL6QxaVU21HJ9sDj9i+GoopxuY0ZykLV8Kop7kUb6EZKpacHs8SE1JhjD5MFXxncpLVSVSM8HpGwGhCTH/uBvfrDnNMc9QhD4F89/djD6dpPDW/GnkI6PliFEwI0IbcVKPJJaLc0qFtisOFV22lF/LZvSh+4PHhEPScA6zCnPM8J0dV7EAmj0jIP98V068OGs+z0p8ifqLlRqKmsmW5UPf0YYAHYm9dO9oiOTVySVoP6p0DvPo8JN9tTNYbV4Sw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700016)(18002099003)(22082099003)(16102099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wCzmvyndkf2VT6dpkz7bx0orfapXZT+ILy04/Pz8GoS31w2x8MKbbK035t8mkgAPmSff2UyRRjBUjm3ahMcTqKX4flkSmmQ6prMR7Kzo2vZjzQQYXWUkf0Qpjf6YKV/R2DL7zRExTS1VWSVmRS+UDcqxz/O/mCCgy8GppIO4Io+8OblpUteygeTAnD6+TuRCFp1s/NGuVb/5q8wtRQmfUWd24gjWNBavMyaaBgKRqoD6cJB0AMrYqN/TQ7xL0MzwqnwxUBz26RnwqQirgWTTkwttDUeNAaV5C1qKX4Fhj3xFfToTfhMUe2owDDmzLjIumU7ilJzCSABhF5YgsKwgwZP8KCroHwgIixtNywQEPSOpNWgpVhta3IyNwj7z+shais1mpMI0QirLDbiPlj46KtcN5g+zhalK51wv/b9Qjv5jdrKTHuSOdyK1pSMcmvZV
X-Exchange-RoutingPolicyChecked:
	pWwQcixhvHQt2Aqb57XsEuZHPt7Cs5dnZpAsPtrnwMoZARByPZll42tQH2oo1kn6mlZoM8mbxCQp3KwbmFBsftWW9hWRUW+y2X02aib/+Y5MW707gzdpQqmEeqc547gySm3z1ZOCTRIU12fwB6p47GuR9KP6sYN0R7XtTmvU3kaxm6O1Zb7t0r6YzCiDPO9RCaqUTTq3/7AJ1qWN0rwmzf9NB7GwTC6CCozou/cTdt9QVHC7YiU9ek4g9mCCi3eBejXve8y+cxzDRKpeQXLKdEY3icItrYedKbV0c1FgdgW64hCkLUn9PvYV7Ly0xZLA/DKoHn3snQEqV8/e8lLG5w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:51.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc99281-4bad-4eef-8792-08dec17eab5c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF667CD6AB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX6I7zxdLFi3gn
 29ZXQRfYex1bOHKtpFI095RiLYPL5inYQJacPq/4HOzcEgURwtp29K4d9f87N4Bkad/K7cjKynj
 rz0eGwDulits8thT/pBHlNR8p7/ktN16DbUaVT5LUYd8LcnZeCqkd4RiWIqxFQfUYjqn+dAKsw8
 ZXsuScmgLaprKxIq0p+9sgYrrTY/OO1kQuiia+oGhplX0sBp3/jNmj6nb4TZawf5shdX0IoBTjW
 t4GbHGtwSbHAlcswtkbc2azbizoVABsIElortRr0JWyOP+123aMbcCg0OVwEB/CcZNqJx6+yXoS
 b232zTrkc1926AS8NxIcwlSCq5nq8aOyBc8cffMxJfVh1VT/4ynguTux8jD3jrSmJmfN7MLck4r
 LOIWTs7byVjlkHAmm9fmmSa7Ggp4Gemxzg5doBFOr131wR8Bg9TZTzKatTAj56hPNruy9TRZ/GR
 6zu01RKAljFzRviainA==
X-Proofpoint-GUID: WWTurcoCyhDVbkxRSNdr4tF9hCmTuCyU
X-Proofpoint-ORIG-GUID: WWTurcoCyhDVbkxRSNdr4tF9hCmTuCyU
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a203de7 cx=c_pps
 a=0scnO40TN6uu9waSdQKTQg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Uk30oNBv9cZ-rtdV3UwA:9
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
	TAGGED_FROM(0.00)[bounces-111010-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31582638EAC

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wcd937x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 72a53f95d6887..e0169e783ee96 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2499,18 +2499,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd937x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int i, ret;
 	u32 chipid;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(5000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd937x->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd937x->regmap);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.47.3


