Return-Path: <linux-arm-msm+bounces-111013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ol84BG1BIGpVzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BA638E0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="m2r1b//u";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=aL5xE4g1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 659CE311F43E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709B13CB2CC;
	Wed,  3 Jun 2026 14:45:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E5397E80;
	Wed,  3 Jun 2026 14:45:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497948; cv=fail; b=VChIxa41gHbt15bjvAUMSf7DHqNLA/DaTM4zvvC39Xg7yG1LQ2+DcRISF3kpD7+Dj1Dg9mjw8+wRsA5Rr/BvDjR+zWgfcAFr7Ho2RbI0iOUXylgO/3GMR8JV0mBo4Pm/a25N2Jc7bacToOUToIA6+nf2p7u8PQoqFrBVu789tWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497948; c=relaxed/simple;
	bh=Er+cmvSPgBOjOSI238pnjachBCjIVd+5xBK2KmKnNQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZaABJ61db7dJdhg+jtU35S2CajiZZPsNsgZp24GQ1ipaWwYNbJkwCF4vF5Oa6sIWzGK3WURcwW5szEcX5z3WilXr1uSvgQ1hKrw5/PfLebu9yFoNdwAYBLe0GooAmEbcX+1+te0umRBAfuBUQfdM4idZSuJEoDXhi1z0CvISeO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m2r1b//u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aL5xE4g1; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EPOp22840048;
	Wed, 3 Jun 2026 09:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GXIy4lwH1HtTihcl6Szlfq0ozESb0OHgDePmz7aqN7k=; b=
	m2r1b//usWoSnREzS3a2S5AF4C/oAXGpvBsqCBZ4QVa489EDHHZrBZGcWrkeQ3cF
	IKJMZ0Q0qRlLMOBe9aM8kzjKT47g9Px5fVM8Eoy4LlvDk5vYrXmlLcud5/H1ZLEU
	d3VOGDIJB4toGnl6JTNSdsfzd93p1u+r7ycne79s16dslRtLTxTZOXDtfswmbSoW
	/6w/oksZd/YcJMYizcXQtXCfGfUaK5EoB9F8WiLGC2gRTQUgotf7EkKVmCTMIH9w
	ZB/xP4FOKU41FILvTU0zU8aLalMzeGzmJWf1n5SHo0yP4GqgF/Lqq2o0uNPQQJpq
	hqGJyzdPR8XakRHjhwUWEA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022125.outbound.protection.outlook.com [52.101.43.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagedgh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1K5I5s44YuJ1Jr9X12GwX5eaRDjNcHxWsi6/KSJav7EtRWtH5+CaH8qLZfRlQhvXBn2+1cVPNZrn4VIUUd5iyhfEyGt9WCGDCPHP3BY9DWuMA499l5QmUF9XMuOew4EZTnVpc+DxLv+MkMfQSNCspWE3aHSuRq/lsp6pDN41ceCX5xUQ90vRmuIeIau/eiBjiDbykTT8s8XJhOlINydmgdjuoBNNmkh29pdqXv+p7xEVaIFPaS7sDtZ0f2Y0U0x3+Y8kttT1R3cRXMxR//wc3i1H1hkb5tJcKDjZGFkido3WxWNO849Pk65ZISKrTkDcfVUJKbtrEEtFZuPG7Zh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXIy4lwH1HtTihcl6Szlfq0ozESb0OHgDePmz7aqN7k=;
 b=YGc0Tbdul4tk0i47g4JQBOpTbYOJ6JAWs9NGTq8YBJr00OvFUW3Arvhudv2NZ8+Zo2YGEFBkNr7lcVhXHRDQhCx5vYMpWiRUCwPAZ0/+vBHTlmN9DqxB4e57d2XQ6DN9CTyuMD6lkKqKpZiN1+ojdX4H0y1nGIwLSRbqSHJjrKEyHsfmFRMTVXlu0qP+yko+QpmC2D1xhTHEKoX6Uv2J/nC9Vjl+KCWA1vAeehYD/lq5nHHuCD/PaCRbMRrBuB4TrLvogGMibc4VYzjLijxpv3wJ8cy1UbKoizNXUF9HuFLlRh2FFME3EYF2Kj08dkAa//A6hpCT84QZN+C9Ny6UHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXIy4lwH1HtTihcl6Szlfq0ozESb0OHgDePmz7aqN7k=;
 b=aL5xE4g1lSVX2BAN3myTjwROvMwmzN8a38YuTNJ0UGoB2jveGvoxU1WL4MhqprRXJbIADDiMCJ8msS+HD1Hd6y0cgWQoBLTJfhVvqwbIu41EPNTsLbDtPakGrSjWvMPogGY1Zi1gd9VdA+z2z3UNKPqBghp/iA/FuPMQeTYoUzw=
Received: from PH8PR02CA0010.namprd02.prod.outlook.com (2603:10b6:510:2d0::21)
 by DM4PR19MB6295.namprd19.prod.outlook.com (2603:10b6:8:a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:53 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::91) by PH8PR02CA0010.outlook.office365.com
 (2603:10b6:510:2d0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5CB22406562;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1EFC082254A;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 09/10] ASoC: SDCA: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:42 +0100
Message-ID: <20260603144443.593230-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR19MB6295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 745f5e3e-4283-4b08-898e-08dec17eabb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|36860700016|22082099003|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lI/nkDCzttPWDCcChCegFBvA0rXnJYZh7bqbbtFOWlmIzzjNzpyghLnIvs/WIw5L+ggQBf8pfN9ToS71Yu7iTZNn23eKHiaLXP+juxJHU0d/nHh0A2s4Upe6rIb1AfObLaWmXdq+Q0wLnL6sKTfU+RpfT2KHcyY5MgRdJvjaBTsnPzSF1pTG/sStSebHN3XGvHfzmCpa5/1YTK+cfTMf2l04iIazO4X8gv53LmAqWXO+dT1ugMj7vgSS2idCiqmiD8TyfdPAm+zaLDb0aTB/1FOgPEWJQFP2ypNA1F88mMZLJtf4ZxaOflVBxzowxyXydYuH2iRhXfdl7wOtdw2WkiW7RBlkK+RLiyGbxAbhQDei5Ft1uBp8hkTywTRIviSPzUeSigw5dLhscP7AHl/WvIE2lEVLUfJwVcxCkWwSvJX7zFUzUe0NfOp4vgB4QAEjImpasJpur5MWP29+gLV4vlGIaXmSTPq9raLi1iaURxZrpwA6yqOXrxzkl2pyi9yYNq1b/m2CbtG7UWHBbaEKfamo5WnuhmeeCJLqroV8m9lUFcOk6Lb6+rUDtD2nnSwHAAwcYVgHPl3JpWyEZCcxPodKJn/6j2SKC7TddY02OEtV0mme535wyXiRbT/+zK9s6vSw/9iywhBy5Ic3R9pNS7c9drxHI2OOClemYLiyYN4zdj4+NAQbBNYmyCDnYAQBNuOx1yY1/J8C5U7+MUtsHjpR9PJgKfjhQJUVbARHnu0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mrkh6gF69tMNPgFjNBpeEhf7DuJAy04L8MEg+XKQSwfcJeIMbjJ7M10OcI87xhaSU674mqH+wBRtYKGgscD7e0j047Puuvfa5/Xi4vfE1u3VazPv+QRUyjaxzJDGxvGGdUjQqUHFP2t3qZV4H6SzBfjQ/Sc6uExh6kQZyn7LiQbgkht6IYbUOscr5NvfCOFH/ugJR3rutU4Q4mRObOmgIp60J5/0VKdRmfGxsxM4mYJ98Lu4ApXXH5Ew/O6dsFPirMbw8VG8+DkvrTq+pv2M5HE5SeIn3VCAlr3OVvqfhpkVUNzCAyZJ0nAmRjW/nqmYJtPloPccWdLR7pczyteeuUH9gIgjPX+OkkWUUVodh/yTXEljLwSmeGln9hSNrDxCfaqM8vwszs3VCBt64kPb9J9W3zrpALUft6gJp9KvuUMxSvgcsXEapB+3j4/+0H7G
X-Exchange-RoutingPolicyChecked:
	EFYKVvNlzZS3IzD0yxVebOMlgOLnHYeknac6F1UAKoemV/roKEbacRIM22+garZfnoazAu8z6WjQREryI5r/XL0znS3VYD+maGXWqgc3Y0akH2oubTFFOkIWMdWbIyLPwr6n+sAsvmhf5YMd5EifUlbBZN8pEm3kIhsZu94iyEfuvsN1j7JRYbY442bPyijZkWllWMNzDbUM0UHL6SZwbSLM4nCD6982gwYQEtoGvrx4X7Jfv41FFneCtUBFUcP6WacMI1cuUghMKnAxwMjAg76Wo7J9iTLWr0BrRli27l8f1H85j1Uf7xs3KoKa7Om9tH7LAhNKwcMKJ9OXiTd58w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:52.1139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 745f5e3e-4283-4b08-898e-08dec17eabb4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6295
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX0uzXQGBKLpBW
 K/eWCAaFU+RX/m6e6jdhK9BfzJT/2wVBFgAlu1NoDyxgYnHnG44/tJwTke0jog3lGc68IO4fgW6
 w/dBmUY5i7RCm/QB76Y1dYnQdp2gqYCDKkYiLpPbRUhmhXOXMgLjzJVEl/sDGOHK0QQd+xPLO9O
 BrOqoB2jM/JiyoN/L6hjO+WFCRgK1K8VMy6ECH16ca0w8KzsKsZyEHc6aKER4bnyQbav4vNQtWk
 Z4YNOzL1wFXI2j9OmixuIL8ZoX/Onk7cN7NSTm7nujaLx3zOoHecwgVEb4cDex3hh7mBAEhD70Y
 Pb0KbIx6pUIgH1FQEVpCa1DTtVR571vci20thT8oF8RL89/N+AKALBz6KyWM7j+dy5DDqKjlXLZ
 2BQVGLWEpGms+5/2jjqYkCdH4tGHKJLKLd8dW77+cbgikVv4YUQN/HY/Eu8GubV82onosadwa+f
 GL3i6ZagFnrAB7LttHg==
X-Proofpoint-GUID: aPVD3ZPjUJtSyifgNUKuYtF0AN4UL4ja
X-Proofpoint-ORIG-GUID: aPVD3ZPjUJtSyifgNUKuYtF0AN4UL4ja
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a203dea cx=c_pps
 a=YMpgYF4YqoZtRZf0gxQL+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RJn9l5sriXOQfstplqwA:9
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111013-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 775BA638E0D

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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


