Return-Path: <linux-arm-msm+bounces-111819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o810ItqbJmrGZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:39:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E08655346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:39:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=Pgb03NW4;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=LfenSZOc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111819-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111819-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F3530451E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32763BB101;
	Mon,  8 Jun 2026 10:28:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E193AEF23;
	Mon,  8 Jun 2026 10:28:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914513; cv=fail; b=EadsUkCN/YXkdLhyn+72c7tG5wJyma6N4vxTKHZl1GzXME5gR7dmZLG/EMGkKMzMflaiPnwtABVMgGvRP6f0LPOQyrBh6pb2an5xhbtnC1G8uzyGEmMb6LENxS2G9xNnwHQUdRfz1rEj+kLSsRuI739VNKnw/AsSGZr324Gu24I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914513; c=relaxed/simple;
	bh=9KqxqXufXfMIQUZStJckPvUKVS3e0XgtfWgqlELJVVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEzUVJw8x+AyFY3dQu+CTs/Fn9fRxoLvKpGOV6kBeUd8IR1Iij9W6CsR/VOWDL8meT8kujwENxLAyo4Dhvrwo/ptNlv+mAB4MModUMLU+HHn+1EHs6zZAghTNlOBEvLx+BRSe+0pT4cKm7XPYEYzIich1MxA2zyGz21DFNamoS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pgb03NW4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LfenSZOc; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584fEuQ3647139;
	Mon, 8 Jun 2026 05:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mwmNsj+aC5WwSZqnNW/nOvn9abAsHSMozmm1+Tu0vEU=; b=
	Pgb03NW4nhGoxu6GhpcZ9Dw1SriQ1tBtfx6cKjGDdvs8yzLQKPzd5ALZNfoQnRZp
	z7LWV199LrFqsWQoftCHk610WbEhQ4Tn/PxfuhNW0IDxPccrEImpjxch4tDEhIT7
	cuvvSXVK3c+gYDn+uuZpe3BkXE77CfRZsCPsLAQyN2hJhHTzcB7AVCOEC2BZKkF/
	MIYSQFZ/6C5f4JZUGktzGmIE1hW20t/jLUVCjHlkjlws3ff0FG4qGI0ZabOnrocN
	yyW3h4yQuWaO72pTwtBfCwfQcY2S4hG2FbSC7Lx7REO20EQaegquleZ7pS/OzR1G
	8fBlmjjtdk3Xwp6R2aYp7w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020095.outbound.protection.outlook.com [40.93.198.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8px-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVe/o7Mi9XyRQRbdZDlmavcMEElX9Fq72ElTL6sNtrdbBobN/DRnudN59C9l/idB6H78v0tfDORPhVTr/bKFML4w+K7jyG6onqTUJ1YM6wiWOy94zKWw9KxltYPUCzEY/VNXWmBqV0NPsomhP2+6IAQQnD6TcnyxrsSLK9INaQqAQf96LUHRf/L1qv221+J6NLX9dPUD83NQiAl2t6J1H6LbDonLwKetyL+sPavp6bRzH4ByFChahOWuazdxuW/+snP06iq3cCMiNXY6CWgADDc+2X/nVK+T2XhNhMw/VY9yc9sSGfqDs9JlgKhKr28I4kUQwOaW6r1sn5XEDPIiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwmNsj+aC5WwSZqnNW/nOvn9abAsHSMozmm1+Tu0vEU=;
 b=nLiHJ3MbxD/dBbHwGhaoAw8kkwp+euPvu26AlhwUsW13eSZO4+qRJRbvNFwV0+yx5z9V5bs6OXZNIqN9JyqyaldwPjvrqBx0xuTNqf2xD3o1eNtgJMzCL3d3r4FdqnmLAMtdbWzZ6jkDWZYUx+iphspXdJ9spp0GPFsz+udFxs23ho3Gen/jn5i45sJCwewzSrBJVJ2AUi+eTTLSDY4CPq/CE7Zlo+K8yU65S/NOk1ND1XJ7Dro1C1Pyo6xTifh+WXUjDL5gSXEV7a96hOONkJ4s8vHr33qYaRK1RelmYRWAkCsOuC1d7BbA7vb51ADKCFiBqTRyVtsYzftmnj2NSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwmNsj+aC5WwSZqnNW/nOvn9abAsHSMozmm1+Tu0vEU=;
 b=LfenSZOcNs1TXfabbko57GmJXy5uGqH0Co/AM0BDmVPk8QjWD77o1pZXp2GcuSYuk9ZFXxTGDdBW/++VqBMRfE1NLIXsmGTUXMa6YYw5qCylLjuXQhl8gIZLvWKXxAAWIp2PX7cXblV8p8S/a3Uncb9XUUoVDUJ09lljiTEtjU8=
Received: from BL1PR13CA0393.namprd13.prod.outlook.com (2603:10b6:208:2c2::8)
 by BL1PPFB530C981A.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ecf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:27:19 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::6b) by BL1PR13CA0393.outlook.office365.com
 (2603:10b6:208:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Mon, 8
 Jun 2026 10:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 09A03406556;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D20CB822544;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 04/10] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:08 +0100
Message-ID: <20260608102714.2503120-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|BL1PPFB530C981A:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50d0e3b8-b5ee-4417-6059-08dec548851f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|61400799027|22082099003|18002099003|16102099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	29ofGxmGDnoH8jaCW/PMPtbDqogG9QvU04swTBSWU1XhZcgfTz9oS28CkQDtraYBJLTV6RN1kJIy8BwAtKClMaESyUkK/hfYLM/n4KA1LPrfcLCSbLu+VSO0+gIAAuF2qO64+NYrH08vAejfAmRLDOw30XsJj93tiUcXXF0xuAf5njBzOME+y1ZC6CZUKLbkQmtoFi/dGleSVoMEEaHjGjMPZetOhTgjqTJfW4VH4K/So/POHn4fNwyb8l2mvxCl8N2umi3Mvba+tccBHnYjQoBSkHYn0djYRR9ShFN7R3ARLvQvSB/lagtFUPOy1TnWwpF5OOOpEfgHvRIWAqHhTi0PiURl8wEuGZRR/DIz/xE2pRYEWym7sDdg2MmnO/8ISXyMKcSzLhsRk8ZopsHhVhmsGSrj38VuF+gse50jZEiSEbfvffJWnT+l9eew3KOPMJFW+mpGFwkiJqv0Yj1TWl7w29ymtvapg7rABwgO5/Elg5OoS2b0jt0wsUrTFXoQiea/EyP/7iVwYi+CFjqYYcnLlCkyfuh8tsnUronyfM+GuHRlALbmjFlbLpqN/vAFBnQXiL/Z33ZMjYCRUa6s80SaWjZoKtZviDmgXeoR20dYJ6941DR1NGhxMHNfsmCZmXHD4rrT5RbKYpPOzAwxbPagRTCttHzAgZZEvjdXoi1DCoWWHpC4OowXRjk+EaHH1lzIyPiASkn9uHDd7E4nod1OwV9CJs49V+syU3sIBx4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(61400799027)(22082099003)(18002099003)(16102099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	129Idm4G0yd4bFsg+R+Inagxz8oc6CSiTdiyOYlnTO84WiCAcwz+SMLAG2lwsbSNq0ad+7mAQSU1HdmTWt120qxQqfGA8HkdKLq2O2eN7NI1m8kEq+Ett2RCrl0AOXHPv+GZMaHmfbyIvUW/ZHIMqmgwIR9tT8gPtPvB8R81Pg30gIvsnBgzAVJU2IWHN8XX91f0eUDsvlRX/w/HphNqQ3OwTFBx5rqLa2NAg5QxcYtDXOkhDhJujhxtyeXG548wakYZ0EzG+RaDsVTVB8u9puE7A8oBARkiK5WWuyOgDQCFjdLKTrTCAhgb21WRMl0Kf4HbBB96EVIhdUXXpdB+ubIXd+HnmEaW9sd5VIlvC5LGRxKz4Kydbx95VQI0nBV4Lfrn847mn+9F0H2Y3Pr41LK4x3a8TRgTbNv6qi1mNIeFBaWXE8C4a2igGtAzQhxN
X-Exchange-RoutingPolicyChecked:
	dSgfTONyZ2ifiTZ94xKddPMzqfquotWAxlUL3Vy4zcWQf0SM033yrqJXXNzRuFDtWn4frn1kfNvV+ypbT+Tdu9W4OOxHLY8IH79UwbUy5Jeu6JF18XVJS1nnzHR3l0czAH6laSmvgJiIFkKeQUPK/ynGAT96b+9yUyM9iOZHTTKVZIv/N6IKylIpZyF75tVUh0zdXJQLy7KuRIGbGVAshbnQwmhyL3l9AycmbOCNhA7ZpGdN7jvh89juwWPteK7gWrAxueaOkYQK6MS1kHDVRunCjcthH++sJvWwVS5f30Jq1BfIlBASs5QYDoa/R8Ggf1CRD+leLBTJz+nhJtJNDw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:19.2737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d0e3b8-b5ee-4417-6059-08dec548851f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFB530C981A
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26990c cx=c_pps
 a=gm/QZ0ERG918agb7PW944w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfXztQvE08tUIWs
 /kRd4SysAzmFGQdmc06HE0+5hHnIYYrVu5VP04hsAANBcaFqF3XrCDsRDCwW3+GxjnsBLSFQUuP
 gw43VGpspaW7+cAV+HjsLLEytIvaFepuaVWCMIu1VNweTDOOk5uuBCK49OMpBHeZfHfXQUr5Gca
 uPlgPz7uaSyEjLqybdTv9C5W/6ComGiTxzv9r5YAPUtpvjvgGQwsluB+0RrDS7WfyP+peXo+5B8
 6Bsk0RiJXfCGmqDMRjRJj3qYHrG4gXT+Fg3rH2HTlCu2O0OTA8lD7GstH6lXD/d5u9O0VqwEjzk
 2NXE1dSPm1bIy30LZj1utspHg6OCbrQHHUnfIPbBngm6RXgGAh7ohMYIQrYILEcbgNwFO2bW3kq
 Fjg0sFw3gU8IZEmZHHAKnJTuWLpERNkd8ShBrKnElWQuseaYRAHoJT+AZpTmqJ554AB8ADZDi7K
 288KyLx3H93wgT2axAA==
X-Proofpoint-ORIG-GUID: ruDWtYuw5GLB8ak6bn0vGx1XeyiiFgo-
X-Proofpoint-GUID: ruDWtYuw5GLB8ak6bn0vGx1XeyiiFgo-
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111819-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0E08655346

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/rt5682.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d39f8e4f3474c..4b82e07d3b2c7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2929,20 +2929,14 @@ static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct sdw_slave *slave;
-	unsigned long time;
+	int ret;
 
 	rt5682->component = component;
 
 	if (rt5682->is_sdw) {
-		slave = rt5682->slave;
-		time = wait_for_completion_timeout(
-			&slave->initialization_complete,
-			msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-		if (!time) {
-			dev_err(&slave->dev, "Initialization not complete, timed out\n");
-			return -ETIMEDOUT;
-		}
+		ret = sdw_slave_wait_for_init(rt5682->slave, RT5682_PROBE_TIMEOUT);
+		if (ret)
+			return ret;
 	}
 
 	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
-- 
2.47.3


