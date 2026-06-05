Return-Path: <linux-arm-msm+bounces-111341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c//PGNOQImoXaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:03:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64E646AA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=kKQmuxVw;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=yWkWHvOW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111341-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111341-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E6F030F99F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD454ADDAA;
	Fri,  5 Jun 2026 08:49:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D94ADDB3;
	Fri,  5 Jun 2026 08:49:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649344; cv=fail; b=kvoE/7r8tmiqGvsvnQHnGd2z2t9vxv6N0d61SdE04kW2Kiq2O7YrgJeXhkZBfW/Vv+fcCSalMBHUr3UarBJ1nNX95EOOrje0we9Gn/+eccPjh1f2Ol0Ybqcgg0qGT3XiWCTJCeztQUwOhjLMDsCbyxqiyEblEh1Q+peYRSz+QPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649344; c=relaxed/simple;
	bh=+NZj8rZ/B0GswszZQcjwF/9p0gNJp1fUaQeAJwxhExM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vux9XJ5uXYuuCZ/M3kaOZIa5maCpYbwGZUJCkhpYcLSh3zJ2hU3GFhaqitRJWOMhZTETbkalCYuaATCV5XHdlEXsN2Sc0zRENUCSK/dH8pKEL2BWF/dLFjw+x7YNJ0R2mwOWNA7QE+tu3AVETyumDJJPjpPzlXkKYThgRx3gVpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kKQmuxVw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yWkWHvOW; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550JRiX429440;
	Fri, 5 Jun 2026 03:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=h46n4PFyS6ThGKumlkzykJv2RMKXyDlHbPUot7Q7AkY=; b=
	kKQmuxVwXHSNPIYCDHR6Qmd+OidmsqpK6C+NgQbR62VUnMP/6MuQNFuOP6g8ZFnH
	LlRJQyWfNo49cOFw+hIlMh5m2YhBMlfO8GOIcOE5tK2gqY36pUcjfU8K07Ht87o4
	bWnHjQIV9HJhPVFrIorIsueey+ESdkbl9D/9RgPFiCeUaQxrJITbD2jjrscIe1XV
	8EJob9cs0Nr7VPD11mUipFK4T5EC+hPLjlQgU15CtCn2JrM6dFK1HF8dfNBB4aMF
	CEbCW8dpMj8egHZEcumvaeV+ri2wOlN9sfOX0RjS6Gss/8TeiEIDS5Li3g/637ML
	PUPFySFQ5+0FO+gdO4rGZg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022087.outbound.protection.outlook.com [40.107.209.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa192j3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSRjGxCOu+aQNHdRhu3iGTlYRAwh0u+/rO/LPOxXGhtuFIYh89B7ZZsAtnGj9y4Ntda0hQoYy0XKpCuNuqnPhxd7BNM5juOtmXrAA4ATTPJ3YeQko7lAJF+9iGjjsYAlFLRKKvLm/ttwr3a74mODHXTCi5kHDIUB1M5s0r6NOgIbCxoOwTJPqmUg9ZpLODYSQ8S00G0MhPVxX2OzFqZ64BBC1ck3TQzG4YhyG4VjDBUy+IKzgmseE/jMDyroAxUIAm6kJ1OdlN21hSudeD/NRE8k1KGuB18S7q2r0c6uYBgF5m3XFW0AFTz1doRlaVaypv4QQGTHZJrOtPhgFHIjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h46n4PFyS6ThGKumlkzykJv2RMKXyDlHbPUot7Q7AkY=;
 b=sLrZMlN38uEc/st+J3PSBOu35zDTYdHDE3rWNwPmcyPtU4XJj+SGifpuNGDwkS5ZOqJRP7btxZAOS7KEINIDbrUnfnOdZgOkJRsrJ1Y3lIm8M0qK0BgfLgKvrl449+D/DJOYb4zlsXCs0ESovx+S7wP76eih+7wEVuc6Mwm6aZpCitdsxNHKNQluGs+8TSJCZ4Ea2rN/3U3vufSHXVC4JBTVkfDFUiXw0gcgB8Ky0GLJY5grmvL1R4X0DNSrDUty3yosNAfx8SRywdk2yOK4E02d2WYUiP/1x3D7JsTeE4w2PVLoG7AYUnK63VuRxyYDBjbd1m0WnJwpJN00f6T1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h46n4PFyS6ThGKumlkzykJv2RMKXyDlHbPUot7Q7AkY=;
 b=yWkWHvOWpUzRiaxjePkszDJLgfmMMhLr3RNtBGZ7ewYh9pKf0oAZekipl80kC2ean5TpDyHxLFum3SUIn6t+Wh575KcWAz9hUp8uDmJco6xduBDNz5g8s0okcA9MREl45ozSnvE74SV5BCOIgHcuLE9ddo3yJwClFAB1pFs4PLw=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by DM3PPF95B66400C.namprd19.prod.outlook.com (2603:10b6:f:fc00::748) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:16 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::9) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36E1B406556;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B4BD822542;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:03 +0100
Message-ID: <20260605084810.1575539-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DM3PPF95B66400C:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7959d8d7-9cac-4c58-2193-08dec2df2f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|61400799027|82310400026|376014|22082099003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	i9B3e7g2K+hkoQlVdCN9R84vxx0WCJpDhBshSeJ66LL0cMBgddgd/tINsIVSgR2iwAGPx7Xbjt1Ke6R1szq5qhTOjfVDWN9Ymfad2Ftox3ClCneAPjAyItd25AyKl11dhsCxACR4Dm5cOLaTgh2NV0UlXou/td045XNqFAnbMjDAMvPAb+iRsLOMtP1CqcjjnbYApY9U5gM7J6axutUqPs0/x+eyC5KiBTxsaXhvyr1sHPXDdd6VJDVdUroBvPpjTpbqtn3kGbAqebL8zh01DWNQTrhniJe5uctN7mhuj0zc/zlGoi8s3dWNNhnBBv4QAXdQrODXsMug2mS0fKOBnvm4Hpylof3roA2hvqef0mI97rXW244rFKu3JC8O4CbnT2SVYB3AnvU9hHCfko4ProI+xK8VDMDkdYKNYFssSDAjTil5EL8h3n9SKYkUdZ8ZIcA5dlHXSrALZSC4t+ymXFAI/nkI3PIshTDsVKcKaLpjphq66eM77rqCZUuUxWwPKkeDlVodUd9jd6FUC/WzNrg+rwtiuSC+gPCXI6q2U5EX7dMKPOIZStkf+198h4SxbHiIyCid6TMW4xVORG2n3RaAcCuz9n8EnMgNPBsIllprTZJMTSOH7qIr2w/5taT/6+gmnJpLxXd8b1aeebH6t4WtuzhTH/GdrDRkardr5N7fTLH4H1QmAKVzO5MsaiVzusEkrgDBjtEw9GVHeUuJi5t1jP3yXXXZMZJUyelA2gc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(61400799027)(82310400026)(376014)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vBfrWIjMQdOw4pLelpSF6q57kM7lwUAO7INHpdK9IzFoLB1nfMKLjwTgMNyPdHU2b3EfnIRMyhcVO2ShBYro5KI9JaSv4/zijAQiiVr/4wlHheTaDjI8ws4H+sYspMNqigvkxqOIXltfUDw2Hapk1ZrpgtyoehKvT46OPVfv2iZOgotGywkAUUWliCoxSXdVhlO5c+CX3oZnHMy3k5mKFWZgOiVBht/5d0nulmqDeQf0nqV7kQKfj5oyVGeV0E2Q7Df2g/fp3a0/snugcl/8KybE8qiMvL4rmEl2FHKscgCwLn9NifLjJGitE66w8ONioz5IhgRPmjIh1kFf8+/+Iwfihzm50+pmo9Od89z2q7jZv+Z9OWMnP0Q5PYHuauKxmCtenVUr9vHLSBr4eAuTbnC2gnZIC2g4kjYcS8aowDpQ8jFoTogu9ElJamaF57IJ
X-Exchange-RoutingPolicyChecked:
	Y5AhRWRMOKVh0PB8Z6JqJhVbS4Gxzwn2G5IfoMAFaRaucn7m/4Ye4ZnVOqaeCjObr1t/2Qmrk92ZskQOULURkkE8VijHAUr0pOoIUWyhaoj8KUMOjUFSVuPmMvFGdJ+nM6w0VCazdty7a9WJozU1fz+zeLcO9CttYRf4jiv/nGD0JNUrRvfZfAgnek9GC9TDzN501Th4k6sy5bvAaBvQzovLC3xYQmBgcE9XsIEA/t2byYRtkMcOXwc14hTxdsKPeODU+Onmhlqu26YuUBGfy6JmEajf7E5++WCEvAiJDyUUEJJ+PC9BkoNyFJTX65UxD5tsithEMomW7tIiKF29CA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:15.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7959d8d7-9cac-4c58-2193-08dec2df2f37
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF95B66400C
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a228d53 cx=c_pps
 a=W3l6ozmAkfr7SACE5S5a5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=zWJqKzWmD0Dw3pFQfkwA:9
X-Proofpoint-GUID: 2LaO720nVPbRAQH-rtJfNSS-p_r7M8JS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfXxgAZVfgz4wAu
 oAscRWa54S34bx4l/COzCBaKmYOECoD1bBt01Q6JfbMsrO7j9Al66wdjyINe2JnYFtxzXhW4o7g
 h3Zvvf+N6ezoXk38WNZad8LbtKNdDlOyAFEV44RVYgohZwJOilVpP1Jfj7e/brE9oMCUh0zaWCL
 c62kRd01zJp2nEAwF36qss25fdfxGl2r2b3LKMOpXyPeyNduMgNYUHzC3f+nBUs5ozc8oCs5OFI
 JelRBI4O4zn/YraIB9NL1Uriq5KimvMV2IOH7MogcTEwICvnhy/BueivqXpo+jLqBSIaaB3LkBz
 +aYKrFloJgMP7G9lmlft6YboUT8dhLQ3mTUpWqgAeu0zexPvr0FP7PqWEsCQbx24IDjFkteo0PX
 c4Y8jxIwKYh8+9DYzuJboxeZAK8lVfnlXOiifHh8E/5dwHASqf/EAwci/aFjEdECmJHZcUWtJ93
 LCtmetsTMmcVzFuVb6w==
X-Proofpoint-ORIG-GUID: 2LaO720nVPbRAQH-rtJfNSS-p_r7M8JS
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
	TAGGED_FROM(0.00)[bounces-111341-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE64E646AA6

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Completely remove attached variable since it was now unused.

 drivers/mfd/cs42l43-i2c.c   |  2 --
 drivers/mfd/cs42l43-sdw.c   |  7 -------
 drivers/mfd/cs42l43.c       | 15 ++++++---------
 include/linux/mfd/cs42l43.h |  2 --
 4 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 0a0ab5e549a5a..4db452b41220d 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -45,8 +45,6 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 
 	cs42l43->dev = &i2c->dev;
 	cs42l43->irq = i2c->irq;
-	/* A device on an I2C is always attached by definition. */
-	cs42l43->attached = true;
 	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);
 
 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 794c983781750..2b87ae2d79c51 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -100,17 +100,10 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 
 		sdw_write_no_pm(sdw, CS42L43_GEN_INT_MASK_1,
 				CS42L43_INT_STAT_GEN1_MASK);
-
-		cs42l43->attached = true;
-
-		complete(&cs42l43->device_attach);
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
 
-		cs42l43->attached = false;
-
-		reinit_completion(&cs42l43->device_attach);
 		complete(&cs42l43->device_detach);
 		break;
 	default:
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 166881751e698..cb1e175586bd1 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -586,15 +586,13 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
  */
 static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 {
-	if (!cs42l43->attached) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
-		unsigned long time;
+	int ret;
 
-		time = wait_for_completion_timeout(&cs42l43->device_attach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device re-attach\n");
-			return -ETIMEDOUT;
-		}
+	if (cs42l43->sdw) {
+		ret = sdw_slave_wait_for_init(cs42l43->sdw,
+					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
+		if (ret)
+			return ret;
 	}
 
 	regcache_cache_only(cs42l43->regmap, false);
@@ -1120,7 +1118,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_attach);
 	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index ff0f7e365a19f..8e993fb535e68 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_attach;
 	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
@@ -96,7 +95,6 @@ struct cs42l43 {
 	struct mutex pll_lock;
 
 	bool sdw_pll_active;
-	bool attached;
 	bool hw_lock;
 	long variant_id;
 };
-- 
2.47.3


