Return-Path: <linux-arm-msm+bounces-99053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNqPEOYTwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8E62E9E96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4528303351C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B486636826E;
	Sun, 22 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="IeAJabqA";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="IeAJabqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020105.outbound.protection.outlook.com [52.101.188.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864C364053;
	Sun, 22 Mar 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195415; cv=fail; b=S4B3eQy6iZtw2syNqYSf7BRkt01X/aYPLVxBfWb2/A9tX/HuSJJBN3w2E+yA+B/58yrsUEaxrsBAM4aKeN+D/CqDUdZzi5oGi0fl4ATWoArpi9izfbGzC8Dm/miZdVVV5SZFI4AHToXi55Visa63AxKpEvyU+5IY37lMOp2pLVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195415; c=relaxed/simple;
	bh=ubyzG68WfXkehN0/i1fpusfp/UUg+fis22h4Jx14anc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G31sSKNAgDjjtYkvfYBV1yjMr8m1/zZd1CkeLiKyomylSVccRpTXekl5SoFAWTL5GYOlaMBqqMZRLukmz6iMXHkYOq1zXzzwBQy8XWLT6+UJwj/ojrut9osi+oenEbUYETW1ozBgn2eBhRpKgnUUMcVOdpvLOft7DsvuUZMZ5ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=IeAJabqA; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=IeAJabqA; arc=fail smtp.client-ip=52.101.188.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpOFkSMyxx0wzouLb3KXcgKPWXNyi5SrDh8hnRoZ3a4Pt1OtVg8oX9fiMVcAL/fc0P7MOP2QAZH+aRtmdjTeqoaTP549g0A2nM6qKL7obBUU2njEfyX3gxgZ750Tnhrb3c58ZTIIt5wCkpDXb4bPWv5vPDPGOpWPwXx27KLd+kC/fGD6k+Ek8U4M2ESmymb1kf9Hyg3LOPu5p9Nosm/e6oBOomQfva14ZsX3dpQmYG+KkJ70bYVt5/8099arjLGMTPNr4CKC00PmUL4FxWyqfqvIvtZdp+awo9xZami7yQU67P8sjSK08QlYTf9lGEEa1p0nz8tDFMFcidDyu2skKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlW5c1dXeJZyIdvi7CiGm9bnlQ3EwBy9kKZ/ivv6gzA=;
 b=mY1NneVNnCz7A3oWscugEZtQnJ/z/B0TF6YeywG0YJYLLg1uuyshCROiYskt7krmZYesHwWBRpdTPXkY+DDjPAdbR17k83eHkcGrwT/XVEdRT6OT7Rcm0QVF/1ufXAOF67O7mtLNSgzibYhSIee8gv8zrDscMG/mWozUvIGIUXW4EsQforb88BDXfb0Uy/V7djRVwn80QjJcnfzU4QTe1sTnftvS5ZsuvH0cHO5ReGXCE2DehualHuzrfr7HCs1xEhfS0YA0ZHeb0WtGHS0SkiKRWksFBlb2dDalv1tX1/69ddDRDMPiqQ5VIP611M4Gk9Fu+g5bGozalBshlm+qyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlW5c1dXeJZyIdvi7CiGm9bnlQ3EwBy9kKZ/ivv6gzA=;
 b=IeAJabqAuvONT+FOOjM76MYamXGpF2sAETR9le5uTiVAZNa9ucf8LEAfqwykeOahedKkKhyb+h21kaDi2uhLTPAD36J7yRuEcHlkoNZFxonFM8gUIXTwBMRKJ2pOcN9EdFNyhMVC8wx8P8/T10KpkQPFK1kCusbdN7mC0Z6wH/8=
Received: from AM0PR10CA0058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::38)
 by ZR1P278MB1578.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 16:03:28 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::97) by AM0PR10CA0058.outlook.office365.com
 (2603:10a6:20b:150::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Sun,
 22 Mar 2026 16:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Sun, 22 Mar 2026 16:03:27 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=IeAJabqA
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 96FF97E1D6;
	Sun, 22 Mar 2026 17:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlW5c1dXeJZyIdvi7CiGm9bnlQ3EwBy9kKZ/ivv6gzA=;
 b=IeAJabqAuvONT+FOOjM76MYamXGpF2sAETR9le5uTiVAZNa9ucf8LEAfqwykeOahedKkKhyb+h21kaDi2uhLTPAD36J7yRuEcHlkoNZFxonFM8gUIXTwBMRKJ2pOcN9EdFNyhMVC8wx8P8/T10KpkQPFK1kCusbdN7mC0Z6wH/8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR1P278MB1326.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 16:03:24 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9723.022; Sun, 22 Mar 2026
 16:03:24 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v6 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
Date: Sun, 22 Mar 2026 17:03:09 +0100
Message-ID: <20260322160317.424797-1-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::26) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR1P278MB1326:EE_|AM3PEPF00009B9D:EE_|ZR1P278MB1578:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cd0e1b-869b-4d7c-f208-08de882c8e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|366016|10070799003|786006|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 HnrAUV7tTqHIWghd7bZwuQmkrmDxTVhD5kMXid7cIa/qj9k0Spgz97lGKtVKf1baQQE/a7hPp9B83kFnsnWV17zma5vRp1vrxbrMzbUV7kEdoVeYHURb0o/EZq+OhV7MiaTv0I+PGE+w+fAomoxYp6JNV+tTzs0zJO0lDqE4Sz0NObaCP16wpL2YuYYFXMczn/uPsueGsSiIdMidvP7gIqJ7icnASJTryuIRB0kN663ISRHPWWlzf5qX6+bdinJHEWX7ZvxLogf74JAT1t4Z5lvEYJBXd4Fq7Dan9jvALXtsPmLbdV3BlHAa8MT4cXVi/wOXr8NSeVcdW912TYhE4NOdBhvh6XWLDC5QJEK482czOQcfKqaYiVA2oPTapK9a8TZHfgiO9b74gym+Or2VTxS050ZPjgL1l8rPeXUSQ41xqaMIvERQPg2eqza+xefCL1+TzQ/1PKL8SGI+PjA5fQzekdwzQ6EaRMYHjw7rKaO0qZDrNAa+njMzgSzE260vkQmvK8lLgKtb2sPPu0njdOS0FyNK6X7EFg/7bXpXSpdoz522BIgODa0oGy/YL01LGNmJMdg+HmTM37CDSYvOXJinogJA+zq8imj4VgS5RfqPut0QnRhG855lw8Pxpkp1OW1qXcFt1x3FPrRKxrRhFk5shPewYrfFetb264LTMXf+UrrDWCRatfrxPsErT+Zs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(786006)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 i7GLpRsg+lMdJm6omEA+5ASynnHjw20lRQpA7TG9dUgAPt1jlP1Yqj4iLphKnirCywvLDgAXfA+iBEWZKnFG40y6uFy7ZeQvPrGyCQbYYaLPKp1eo80hLic3N67yOuUBHJo/NkScdIeowZXC80pMHkniKzBcISZYOTB+GWthMVPnXCL5MI05xP8AbIM/3XmKeUcDDwX7GYfRlRnMl9ox8R2ND89Tx3bd/PAZAOOZJ2wy6jhJ5CI+a/HYCRJJWAQjOASA3YluK1/3yLTdI06W+DIsIjf801GArzFKZRFbYZPs4oWQMshO9IhiYCU2NqSm6nCqjulqtulGA4QGRQkAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1326
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04716f2b-632e-407c-bb47-08de882c8c1a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|35042699022|14060799003|1800799024|19092799006|36860700016|786006|30052699003|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	b3jElNNH146BFhR0aqKJoyafZHydUQpMKTzwPhuKkHCLWLvS3SfMp7pnMmg0TmGhGMjla3/WKi2M84vVFjNPVb1YnYCyY5ETHML5tiunbck87yIFd+9uuJy76c/L3D9yD/DLGlLjbGtxqCM+6FR9vwspzcxbnknA+HdFFU1eZUXdyvNXocYsVTO7f4KAUBcgjGXIggETClHvg9Ed+IKQg0bubf8x7ZcVaj5GUrDPHu1bfdmLTGx0PNRbcGY+qnU26KMKigAWY8EjhbErW72hlH0OD90N6OdIWmuYOCKrWFoMWDMYwfZVkFjusnuNWpQR7j4bR1HgzjGXgJNNkl0O2rB6Inl00G8ZNUui912NNCqCh3021NR48lXnDDkNwnLk+IroxgZDi0DzDn04MDVm3AolpvzGBrSre4torHO4lBnC0u8YDm0qntrZUyBXL4GrtQzXseHZnKT4vosHIjavX4QlGtTxXbQacFuSIaA8y1oqFSbxsbVoy3ZQd0p0HQxS6qwBNoTi1R5TrI8LTgPdglFo3sdlQb93pXO9X6cYFabtg0AVgwL0drmhlEJL4uCpstHt9c0f/W6aJrepNC81JYoW0CEjaCfbWWKqXwF0lV/4jCZNVUsi7gjrD35G/hNOcAEnM4ocgFojsrJ5Djolcm8vz4710OUUaI3hgKQhsnRkTLIr8RMQ0A7ZXXXIEjOTXMFG1vBviNd6FHrOEuqhDI+tYq4Hg8rQVF48Ho6Ohyg=
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(19092799006)(36860700016)(786006)(30052699003)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZgQfyos7apRSAFIoELsNCNE7P4PCWIbC3PJihgO3auN2KvQUxEKKrEqgzzbAni93VGkPk7Ppi0h/dqmg4h6waF7zDsMbtjxhGHug3hbmshIYxN5gJBwdiJHz8iF5sjC5e32vix9XSPMU8HCFqbDDdCvEzLrk1qHTPfQfsQwDtx9+zyVH1f/Y9JT4ZJSZDjppE3g7oFFF6tQvYvDkRAU6B4tSYTv5wvRn0pgcvgu/bp93qd72QK5/YMzOIifrQoAnDmzlpLO6Sx2AuhSNoUlGJPyH4VqIuOEAk/SlreVLTCG1Af1mvSXMEGLVs/9BTcZMIfvLfULAmcT4HzKAb9TTU8OJ71vpzIKqLGCIFbxTtPT2ONLFFnYSE1NiiXErPI9QlNTsCDif24cH6x/Rf1jEaRcXKK4uf4hikWK1xmrHibX3rFi0n26o9J+xDo/wiSln
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 16:03:27.6287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cd0e1b-869b-4d7c-f208-08de882c8e18
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1578
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99053-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9C8E62E9E96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch introduces devicetrees to support the Samsung Galaxy Book4 Edge laptop,
and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.

It continues the earlier patch series for this device, originally submitted
by Marcus Glocker (v5):

Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms

Supported features:
- Keyboard
- Touchpad
- USB type-c
- Display
- HDMI
- WiFi
- Bluetooth
- ADSP / CDSP
- GPU
- UFS*

UFS requires changes that are now in the process of being upstreamed
as part of another patch, specifically:

Link: https://lore.kernel.org/all/20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com/

Changed from v5:
- Reworked DTS/DTSI for both 14- & 16-inch SKUs
- Added Galaxy Book4 Edge to QSEECOM
- Removed UFS node from the patch

Changed from v4:
* Fix previously missed commits:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v3:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v2:
- Squash Makefile patch to new DTS file patch.

Changed from v1:
- Provide the patch in the expected format.
- Added missing bindings.
- Removed sound node.
- Changed regulator syntax to be consistent.
- Changed touchscreen node comment, and removed false pin definition.
- Rename ufshc@ to ufs@.

Marcus Glocker (1):
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge

Maxim Storetvedt (2):
  firmware: qcom: scm: Allow QSEECOM on Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add Samsung Galaxy Book4 Edge DTS/DTSI

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1518 +++++++++++++++++
 .../x1e80100-samsung-galaxy-book4-edge-14.dts |   39 +
 .../x1e84100-samsung-galaxy-book4-edge-16.dts |   29 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1590 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts

-- 
2.43.0


