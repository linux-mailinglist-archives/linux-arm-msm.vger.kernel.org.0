Return-Path: <linux-arm-msm+bounces-100152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCZABJt9xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:40:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02633A498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B4EC3008D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4DD39FCDF;
	Thu, 26 Mar 2026 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="STii0WDw";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="STii0WDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022139.outbound.protection.outlook.com [40.107.168.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD83330B07;
	Thu, 26 Mar 2026 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550415; cv=fail; b=C6h+e4zrs1QRLqPKhpUfvIWIb8iWlIT3TFydDks0S1Ke7evXxkWPUSZaKQIntAMW4o8OmJXXzwVUTVTAgJUGOPnGQePYTdXkSiZ7maT5RJU3tSzMoWp3OkgCS/F4Mydb4frwJBHMTPYhUh0VHuOELa1YMqSO1aQSzAPAPjKVYNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550415; c=relaxed/simple;
	bh=3r/U1d9TSqUZq2O65XVvNSNcwG/W3mjSV0795byJH1I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UbqwN59R8uRhNDLQedfXxtqcm8OgGbHP3q7qYgqLKZymgD1kCVhJwkv48PeWWUuvR/Y+wohcCT21qNLgX3LiZmiitKM0U2rLJ1jMvJ8S4GFSfGkyQvR1RUK4zrYApLewfJePsjMf7UDHGeDzRetfEqiLq4VfSXtxObMsxcVcvj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=STii0WDw; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=STii0WDw; arc=fail smtp.client-ip=40.107.168.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fe3X+gqTTr2Nv+NqLswWmhjMB62vDsHYKJN+webjtu3ivnGF32rMofy2XxYX34fk7h/JjSfGEP5aIOYGIkUp2vq2MVlwTRop8RWtgHzvuERpZQvrQpsjfxXlkHS6wZ2FUj1Key/aG24wph3no4RHSCzu0rKk7ksk6s0Jvbxka10iNo55nEQmm1v4dNAu+JvqFVJb5bsYrEnAHp432KcqSpXAy6Q8zh7V+qKP0wvJiI3pv0LtobyIKqLxvovVHzMnH6VnU6cfkeGjCGmZBv6Ws4M2ES5+znya6qP6arSTg+rnTX/W0EfDOukSo7W7UXlfy+TSbLfDPm3RjLW72SFpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdbC+xo5iRs6dvS1fVf8vzsAoVtHjrDHaq8uGqN6BQI=;
 b=WvBYWXNQd/PHcqbePlgm96ZTwfamAZniX2Tn3SZ9ZEVZIegZXOmEcp9Ccn741uGCsJEroAKknjy9l9j12JqBqEqo7oWQRXhbEiwOCldWnf8Lq2GnwcXRL/BVtJ0aXh83b9vSPtUawWbPjwUvWVIywM8uRenKibvjF0EPvpGto93eVKkEErVupewqKgyvO7NWKKhNuo1nsuxOCzZQ4vRU7NXFk0lDUmK69RkE0bhlnoaw5sDebqCJ18u/isRcTBs8V2ZjpjQbKw/pe8U+Y0GE9+IvUjviG9FlmPGAhZf/3aA0rqxL+skPF9xeafvy3aUbAjW+riIkiA1ZzaZ16Obang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdbC+xo5iRs6dvS1fVf8vzsAoVtHjrDHaq8uGqN6BQI=;
 b=STii0WDwAg/wFgVN1gGAJmaal0AmtNgFpw+KYp9QherQ04jWYYQpxy6V5vdIc18/r1mrh0Tl8j/bwnxybK1v107qs8JHm/k9uEcTrSjCfzAjz2KafpMMBZv9hH0hWTyiL6FX81n00wVwhpNy1JkguIsHB/DBRDkvvXuXCPKkkJU=
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by ZR5P278MB1794.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 18:40:08 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::ba) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 18:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 26 Mar 2026 18:40:08 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=STii0WDw
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com [40.93.85.48])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 0D9457EEF2;
	Thu, 26 Mar 2026 19:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdbC+xo5iRs6dvS1fVf8vzsAoVtHjrDHaq8uGqN6BQI=;
 b=STii0WDwAg/wFgVN1gGAJmaal0AmtNgFpw+KYp9QherQ04jWYYQpxy6V5vdIc18/r1mrh0Tl8j/bwnxybK1v107qs8JHm/k9uEcTrSjCfzAjz2KafpMMBZv9hH0hWTyiL6FX81n00wVwhpNy1JkguIsHB/DBRDkvvXuXCPKkkJU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by GV0P278MB1538.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:64::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 18:40:05 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 18:40:05 +0000
Message-ID: <94d666cb-23f6-441f-857f-267c2c98d132@cern.ch>
Date: Thu, 26 Mar 2026 19:40:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-3-mstoretv@cern.ch>
 <ad4880c3-bec8-43f0-a79a-52f3d09f3f10@kernel.org>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <ad4880c3-bec8-43f0-a79a-52f3d09f3f10@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV0P278CA0074.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2b::7) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|GV0P278MB1538:EE_|AMS0EPF000001AE:EE_|ZR5P278MB1794:EE_
X-MS-Office365-Filtering-Correlation-Id: a38b86bc-28ad-4058-5ddc-08de8b671afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|786006|19092799006|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 blW1w/7OzX5YjIPevYNKobLkB4jGbwGJJw0oBBgs+J9lSTHAAt16g0Mv/Urw0/OmLu3tCVsGhZ1xx+ikNI/HMNmL9QHbagDXo7KhdznQa7pFnZhZZmo99CxJrGtE24Y+RdbivkaJMfHuoygG7vSQOj0y4MOnaQ3+6nLQ69TZl+EX4TC/3R5T8fFJMgEo7lmiAJMon/0vMYgbqu58hH2/7VLKDy541htWDUejSqKFiOTiw8TFShCont3gXZr5Ymcgh4LB5f+mDT3J0X8LRvn3zESNTbvYT34fFp/u/JTsq6FAxlcYd6yXhuaRJcyYLZDaRdxJmjki4IjTFzmqfVfsUITkdaQTQMjsIbNATOm846ZSPVTEojtqd8wCX998dKv0i+fACvn4Ovg5QHGpkRWHbXbt4rL/3KwVqmER2icgZwHxNKR32LDmhBnZRpsWFQeiz9UqmQl3KS7MgkB+lKS3wCq8HAVSgWWtT1Fm/zuF7pK75gzmFNhqIJca25WgG9/ORBb4xAUR/Dfjmhq8hRMHgLDEHHnOosDwHKpmfUci9j4nEDoJHBHJ9cD5pLl8uqaOkfoVs4UYj5l9NVAzS5+NWRjjP6k4qk1Rp5M4oPVjcdMHYIu1uxyh6WIPwkh7ZAt302h2Vyh12VrDwkB3+fLnFcJjv3EHNfmuBVht+kmOnXUnlfcwb8uHvyAjQPxDqriK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(786006)(19092799006)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 nFDEGamel1qb26deIqA50QCg4YtoZG7DkI9xNmhunr0+EXsrfbZTefShWNrevpGe7dYKhjcdUZPEZxz4n+JhL78Rg9QSO9tAaXjaQhMvwiEQehX3FDvKDaDecuHAJIx830j2aCzS54J2Zv0MPRpNG6J7QZYHZazWmkFw9/9sQjUEGQ0C/3IEgCkNGIjdpam0fHBN3rHsJCZZlF0jomREmbvTiyZqRGl32aEMamXnorUqVE2yB6r0FVBjtBcRTX4hJrHR2OMixUyv4yZwOsGcZ1ZzTch4rh1+IKGx9DUgeQozVzsDPxx/ZUwry+D1oG5qjKcUufff2xBcY4Tng+CM6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1538
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76ed44cc-f6f0-467e-5c4f-08de8b671923
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|786006|82310400026|1800799024|14060799003|36860700016|19092799006|7416014|376014|30052699003|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	z4qS9DNxHFaTOr8MKLGlM6rcP6sEU04IeAvmW/hnDSTAOudFLn9IZqWx3zc2IUak40UCEfl0p/PC+N7aiFDOn+vJQEto/c8UqBExUzS08vIYGLJC+ONgB+pzWaFZ/KDhqso8BnpicgUPiZIfvt1cJBHnNg6UUMeMBrNchM0aXyt25WmpT21q+vdjYQTNnDlAEaSAmZQyy+Fq7/MMkAPDVmx+JLaEzOqlVDEGyFKAMmC5R0Ye8LXvce5x0IMNSPhRgIbwhuSEkn7BNpGnMpEO28B1Yr106ZvKzZEyGgLxsYEWydwmWZNxcVEf6Iy+rVpGyVBJ8C//CiJVHuGgBbYfSa9MwUSeengXv/NSoKSNw1ioGcZovu/WGd+BDzBAb2sOZLD/sbWsxZDlOZ83jUt0zyyXvt+3cHiVhRd1xAwOJbmaPLR+HI3siArs3Q+raPLFb6R90Yiy/gSOLYAjgK0O2qvlUR3VqolmLxg3GhPvsvgKIDC7dcLmjLf+K8iwqTgJlBFPZog/7FhsD1XrEEZIMijGaJA1ZErr1EyYrHKDzNAxPn3tV2SuxphoPoldIxKNpdnG+Ygzm1lb75d/XTBpOWINDxy7RgmEIncgVteeLqTDV2qiDMuMUNkMVMYtXJWLCy6lgDSTAFpOP4Bira4wbRZE+RY/fyoz+FxP1eovxkFqWn3rsZZfDn9WVoicphHzOG5F7U2GupuwQsNN7iNbgi55SUGEW6ZLMDWx+tv93jI=
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(786006)(82310400026)(1800799024)(14060799003)(36860700016)(19092799006)(7416014)(376014)(30052699003)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ho2r3Ot0RwVDB5/1NE+29x5clPqzMQcycsOKVxp6Sh2DdmIcV1k9r1JcRhhWuFojr4/3jdnEGG9as1xORUJzUnDwr8gvl7GQJUOMJu00YOEAOtF09G4A/Bt/J4IXXrkOgwAo7xEP+YrwUXMUCZT1axOyXVke1SwCX1ZyTuEfPe1grYfoSckYeBRBlV12eruQDO/qVTBuHookL+bzDfXruBMX+FffSYG7XaK1aLhXnTLOou/JFvz7j5S6y/RMPnslZ8dd6f1TdjXb1UtmlGKTdnSP08LiCvyVO5NWELbM7s1mIo/FG7P/Qcn6fyg68AdrLBCnHSPRKLLq9QoaWmInSJoN7MyScykSiNvGRIYyF5vveLjDe9lCLLtWQ5GIdc+Vz4CcYoxyk8Gbor05wq2mjYO+KZuFxlqpyLZ0TQ4StukEmIRy2p1M1heAe/4GwQ4
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:40:08.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a38b86bc-28ad-4058-5ddc-08de8b671afd
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB1794
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-100152-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cern.ch:dkim,cern.ch:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nazgul.ch:email,bootlin.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9C02633A498
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 12:44, Krzysztof Kozlowski wrote:
> On 22/03/2026 17:03, Maxim Storetvedt wrote:
>> From: Marcus Glocker <marcus@nazgul.ch>
>>
>> Add the Samsung Galaxy Book4 Edge compatibility binding.
>>
>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Incomplete DCO. Please read submitting patches about certification you
> have to make.
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also:
> https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
> 
> Best regards,
> Krzysztof

Duly noted. There's already plenty of useful info/feedback added here,
so appreciate the responses despite the entangled thread. To be
continued in next (and hopefully correctly threaded) patch revision.

Cheers,
-Max

