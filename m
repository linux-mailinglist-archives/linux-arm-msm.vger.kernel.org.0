Return-Path: <linux-arm-msm+bounces-103855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k3juNfGw5mlDzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:04:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5A434C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71A43015884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D6C379ED7;
	Mon, 20 Apr 2026 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="RjrzgWn8";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="RjrzgWn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020087.outbound.protection.outlook.com [52.101.188.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92993D1CB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776726254; cv=fail; b=tyWzQy4ju6m1tOcB19SZsyB7bHbsbCS5t3ZSsIsHDlk2r09MUUOCNfR0RLiIdPcNPtcp9h7gqIQCx5k9h5XjQP4zZEwoG3T3/OASDd2iend2ONHd0sbvrdKu6szz21jnq3nvYqT2NLjbF/1eG2GFVGuJnOKVCfyTSxdyLw+8tfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776726254; c=relaxed/simple;
	bh=plZoEGw2MX9xaUUxo6EyqhCOOo8UYAqhsxB1HWLN6+4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lUase13lISSUwCl8GldqFbY7GUp8krRIaFjWKw9PuXkpYNOOCV01dVVOs5oHuPfTzOFy+LYUlzl8mosUet8F+lRyE/XHSvBLQTyKOLqEgEBOqYVTfThEXETbNMigLvslTy5qsylGz5oy0hMD5+ObN+3oLtyLaXTYL0jo1eRHDMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=RjrzgWn8; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=RjrzgWn8; arc=fail smtp.client-ip=52.101.188.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtAHzLBCwrkG0dTOmu9IppFhjCh5tfELF6Gj/DwSGUJpzH6p5njcHFf2DK4NQzhrHWBXnRl73OROQwH7pG3j7oB03RnAFPhE12S1zlZCJl2BJzM21sVq41wzEz+uB4hqunwPbMWDTTQ69+qQUdLAk8a3URTxqbfuePS6kgz/Ii5HHWPRbSZ0uT+bVMCxJKJgq+zr2uKDKQdX++/xiTznHSu2jqhjrGMAefsG1zd31s/YJQGmvB8MXsVZZbJxPHTj2GxT4MJxNYl5ekmGUtDMBxoaPqp0HTIyUWYIRGribNPqWUm8R7DcLXl2BvPPk3kb1kuKN6SAmclf7U3UoJaODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVaFM9wNArSG4b7T6HRGRX5Nb2Ht7zNKC1glE8cpGfs=;
 b=UdIHZwt0wiTVowb7c6QlhiiKuZVUlZC0BdcSqZabKSbL1G4Evyjas5AaVBqQ48T9VlyQiUqMbbYfm+1ppJZmOazjOI0tnykIyw/bCDqQuPl5Iu6smw1rvlwGCeIHBgCY+zYrQvBWg6B+/qvfGEWWtHWO2hE1PBuHmVPWS6z0sO5JAjN1JGy0LwrVhbopde7IMrrzOTqk8lm/9whIIB8uoOAyRCX2NR+7LzYl7yNP9oz0BvhyNtZtWO42lfOl3TKv0kRGEUiF57E0beBAsqYx3lYG6gYx8LujFHT/jtfqvredH2t0I4i566aYLctX9KoRj5tN0PEjOTIxlfUX+HFDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVaFM9wNArSG4b7T6HRGRX5Nb2Ht7zNKC1glE8cpGfs=;
 b=RjrzgWn8AU9nczhZNmWTdbOeSAf5c0GqfYlL5eMFRIwaL2N70ZgYoAIGjEN9d61LteULfQukCevKzWx2I1U609hzOnA5V7QXMfC/nbhZrHmnLLwxMlSPoZOu746dQMn6O7Adu6Gt1gtG/GHsJXcoQjgqMUQ1bvZHMgjDMo9roEw=
Received: from AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::31)
 by GV1PPFDE92F01FE.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::22f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 23:04:04 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::e4) by AM0PR10CA0021.outlook.office365.com
 (2603:10a6:208:17c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 23:04:03 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=RjrzgWn8
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012055.outbound.protection.outlook.com [40.93.85.55])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id B84EF7EFC0;
	Tue, 21 Apr 2026 01:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVaFM9wNArSG4b7T6HRGRX5Nb2Ht7zNKC1glE8cpGfs=;
 b=RjrzgWn8AU9nczhZNmWTdbOeSAf5c0GqfYlL5eMFRIwaL2N70ZgYoAIGjEN9d61LteULfQukCevKzWx2I1U609hzOnA5V7QXMfC/nbhZrHmnLLwxMlSPoZOu746dQMn6O7Adu6Gt1gtG/GHsJXcoQjgqMUQ1bvZHMgjDMo9roEw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR0P278MB1268.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 23:04:01 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9818.033; Mon, 20 Apr 2026
 23:04:01 +0000
Message-ID: <11b5a6bc-78eb-423d-a6b6-51cc3df8a8df@cern.ch>
Date: Tue, 21 Apr 2026 01:03:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Samsung Galaxy Book4 Edge 16-inch with X1E80100 SKU - offering to
 test
To: SaddyTech SRL <saddytechsrl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, konrad.dybcio@oss.qualcomm.com
References: <CALsAr3w-M1wKbXpRv7xtxYwYNED=R1Z6xvQXWkJAAULKTDyPiw@mail.gmail.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <CALsAr3w-M1wKbXpRv7xtxYwYNED=R1Z6xvQXWkJAAULKTDyPiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS6P279CA0093.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3d::6) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR0P278MB1268:EE_|AM3PEPF0000A79A:EE_|GV1PPFDE92F01FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b69406-4346-4f3d-3743-08de9f311dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|786006|366016|1800799024|376014|19092799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 +i9Pn4j4NW4TiCDR9HKLL810gXdnLF6+es62yF02yZv7H6eU22BouTOmn/E/yiu3lShNGSwjqge8hNTRhfrhF/q2g8AOOPQ8oKwUkPmoLBjXl6q/b84wXh7jvOTgNGrznhjSv6VT1hygcjg/5C7I+mYhujL0Kq60Nf1PX54t5qmQT2HtLxXh6ya/2KSM6ddKO/H1N7muEihLzml735S2BLieqeYC7no2HbWVMRC/RvPDLWIj1txjpLezkYm0F3k/ZI8Vi4gYYNHZLP8bJwEel1kPjiVOtD4ROPFkkwsWZBs3f5QQxahKx4wJ3T0rupsg6d5OnT3XDfBFIke7fHPOR0zGfZA08BwVNcM1TpoyjSCgafdfHjzaDHES2gfNGfjX+Oqik4YDRwKi6zrdofFcwTlZRWPKEcAvZhAqwT5ruCklY5sPwoktxE0Lk1cGOpUTu+cLpTvavhACi9jK+fCijLT+FpspE5YSLMhjlo6gTOusFahNpBjsp3FtN8b7UXRjj0o8EvDoI0R/lY5vU9aRtcb4jfbuwy1WD2CrevcqcP9HNtzdIis+7htL+ffis5cXftDWxNT8W/OHizOioKHiNDGV610lAJH2TGErCJ5Wb9WKSQV9Epg2gt3Ty2SPzYT4uH71vOMOmUQUOMBLq0z58d+FDk8o7o1AfSssabm+ey4DiJAJyT4kl9tMTxwPxISDWXTjHgWQJlatY/XMVOhj9jXh6AsbOPgPDmvXiLAxfo8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(786006)(366016)(1800799024)(376014)(19092799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 tEXCEKm9NXOGqCxA9JRIdrNNHmauseAHNvP7fHM35zsKwkiDQk/UkuvwtL25da0aze2nJQ0vVhy3W4OTgT1HNa1jEQVQVycBmkFvJB8xfFT5sEUNQ6FbU9+uqoLZA/Xm0oQvbIi1qjEEAY+WICmVyKhs0oWL8x+yQ+RUd6Rd41qKMQt1EDAWG39k5vCm1Xohi1e2i6IaZYp+jVsFFa7puaIDySpn7yledbOoV353jqJAb6L/UfY3xWAqPrCY8jrOCkh4RPS/iDk9O69CIhYfr9e8Vi/JS3TFQLAx85pyV5AvEoDeW8HToaExV6msK9xdzeXS1w/A9R6I/tkR43Vd+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1268
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df5a5aa3-5adb-4653-e4e2-08de9f311c65
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|30052699003|786006|1800799024|36860700016|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4rw4a5RFpoMWparaXZZ8i0d3pEIvCAdhgCtYzsG6R2Nk/+S/dIqKPDoOwcdfGfbYtq1RgKqYJYTsUr3r47HAEmK/siKb6lhaxFRHN03RC2vdlojQMFBWCAbiD6z6vQQZEzdZeCfyDi/IqA6NSXrtrUkW8fWh6ZDCzS5tgtSj3D2CDfxNEVnBHr9zR/qA8g4yyxYp5P5x3vIANxv5IVS9GwVFI+nOshQrnTDj5APEZsRx5I6uJnqS4LpZ6ftXkepJ4jmIvvorPjpujZYpHly3E9ZZk5+2nT/R1ebs0Ey2ij0rBSO7r11HNFTQ2rq/v+TbE7lj3ooxJRba4FiKZ//wnaoJh2Fe/IkX2ctEHKFBN84nfhHwWUWpjC0EnZgnEJFiYimZueii481Pee4gOCSFodCDABc6MoiSnkM0Ek5tu2ZkQOp0YpmBqfCGbItBIeZU1BeYhPjt833yunFEpBxgMZ90iEABKB7bYTsC1Kz1lh0yS6KP2Ay/dV/EvZp758srNXC67cbLcyJefev2DY7COHToyNHy5xHmYhpP9wGM1jYVbvmTzdWHge/Kihz+n9Lc7ImWdjilgKRQhg/bDWpY/hy+czJsM24JGBiF3D8zMxWbK7Jh+QQbCi1uzCz5ZfdYvHhst36dWwLYLtm4x/AmFjp44l5xbPFKHUGBchsy+/I5UtUH30GDMItGcku3bLNw8k79jATEpxW4YLd/JGOD3i6a3okECLwwJQ2iEffesR54tOQfWzQOFEt6+/D50vcrWr+unNx0HEWQWDRshvtQgw==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(30052699003)(786006)(1800799024)(36860700016)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gHwCVJW4xgVHceRbdAG3NN+BKUof6YuDuCqEuZsbyvso7s0TnJfZyDqvxVSq0lYkzabk2SD1eV06PhHVqnJGhjwgA9P+o+YS3s27SBY3QI8UhA3nn/s8opcY60y/s4wwWr4IJMHiexDaKnJpwjlSmePW97UohFMaqgqr9g/iCzp5nHmfPRpdlslrjeD6W5WDizaJPthUezsXjb4X8J0bDpZGJlFUNx+PCvKqqhzxI5XEs4b08otrF9B2VFOc3LkJqvxq0UukNUuZAA3r82R+gsQsvJMBEBQvot3yfH9W6cCQkRYNf1sE+/CXjwAeWOezWxKAyrsO2FLtAtbQzM/BhqUV6N86lyLqJSANxDWxzOWc2q+ImPysoHO4zU/mHqPu8YxfJnZB7IW2N/ITfW/J7/CtVRxqHPTb3HvvdsTyaoYBV2EJ1JjgG1XD7NHhnuqQ
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:04:03.4193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b69406-4346-4f3d-3743-08de9f311dc8
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPFDE92F01FE
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103855-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[cern.ch:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 45C5A434C88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 14:06, SaddyTech SRL wrote:
> Hi Maxim,
> 
> I saw your [PATCH v6] Add initial DTS for Samsung Galaxy Book4 Edge on
> lore.kernel.org (20260322160317.424797-1-mstoretv@cern.ch) and in your
> reply on 26/03/2026 you mentioned a "16\" 80100 user over in the debug
> thread" who tried the x1e84100 DTS without success.
> 
> I'm in that same situation and would like to help test a proper DTS for
> this specific SKU if you have time for it. Details from my machine:
> 
> - Product: Samsung Galaxy Book4 Edge, 16-inch chassis
> - SoC: Snapdragon X Elite X1E80100 (confirmed from Windows
>   oem124.inf: "Snapdragon(R) X Elite - X1E80100 - Qualcomm(R) Hexagon(TM)
> NPU")
> - System SKU: GALAXY A5A5-PAKX
> - BIOS: P00AKX.061.250718.WY.1810 (2025-07-18, SMBIOS 3.3)
> - Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
> - Serial: (available on request)
> 
> I've already extracted from the stock Windows install:
> - Full Qualcomm firmware bundle from DriverStore (147 .mbn / .elf /
>   .fwpkg files, 1.6 GB)
> - Full ACPI tables (IORT, MCFG, APIC, GTDT, PPTT, CSRT, FACP, DBG2,
>   FPDT, BGRT, MSDM, TPM2, SMBIOS) decompiled with iasl
> - Registry dumps for HKLM\HARDWARE\RESOURCEMAP and all
>   qc*-named service Parameters keys
> - Per-device PnP resource allocations and event logs for
>   USB/DWC3/Type-C controllers
> - UEFI firmware environment and EFI variables
> 
> Happy to upload any of the above if it helps you figure out the right
> display/panel/regulator overrides for the 16"/X1E80100 variant. I can
> run boot-time experiments and send back serial-over-EFI-framebuffer
> dmesg photos/screencaptures.
> 
> For context the 16" model ships with a Samsung AMOLED 2880x1800 panel
> (Samsung atna40cu07 appears in the 16" SKU of your v6 patch, but I
> don't know if it's identical on X1E80100 boards).
> 
> Let me know what would be most useful.
> 
> Thanks for all the work on this - looking forward to running Linux on
> this machine.
> 
> Saddy
> 

Hi Saddy,

Appreciate the offer.

I have limited time to debug this month due to travel, but it would be
great if you could try booting via the devicetrees in that patch.

For context, I'm able to boot via both the 14" & 16" dts on my 14"
X1E80100 (albeit with caveats using the latter), so one of them might
already be able to get you to a desktop. In that case, it could just
have been something off with either the initrd or the system image in
that first attempt.

Cheers,
-Max

