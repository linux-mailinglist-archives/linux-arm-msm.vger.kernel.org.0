Return-Path: <linux-arm-msm+bounces-55029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991DA97DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D2716BFB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 05:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC094A3E;
	Wed, 23 Apr 2025 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VsJZMAL+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="M9k9242n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBE2581;
	Wed, 23 Apr 2025 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745384448; cv=fail; b=EF4mAk96Kxvh9MZ76OLYtk99cdwudQi96zKAuVoCfdfJ3Y8YoRsRv+oR5gD6vuTXNAHg88UzpWz+3WUHFcP76d3LZwyX92kjp588Hmqfw99muGnznBYRNQA5Szm4BLHg+O225t9PoIKQWgD+0lzlSLwDUvM8xIQHCY4rsItwSo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745384448; c=relaxed/simple;
	bh=GFFaQPuRuB/U5W0yiAYjsJ+yLXKrLDB3zWFRl2T6Vk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yze+i2TyUpa8T9p0pbHARTg4XTKbtCUGgluClVbaYkCMZjKWA/T0P4qFe6k+YxHG+e+NVFR6aYxD4WUdWth2cnAebkRXboXSy8aoKbjFQnFF5h/Ph4lHKO8Jxu9VqbquxQrG6NqGbk1luePdE35bZG3x0U+VQcws5/vTw37++Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VsJZMAL+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=M9k9242n; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e46d5a9c1fff11f09b6713c7f6bde12e-20250423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GFFaQPuRuB/U5W0yiAYjsJ+yLXKrLDB3zWFRl2T6Vk8=;
	b=VsJZMAL+lG9cVizZKecSRJGzLIJj+FFf233gEkXaYgd8GZJ6Lj3i/RLx+abc07/qQSOs2WR5d3lZ8TKNBiu//D6ohRjuDMV4qzslWkxJCY92+AIipFZZBDFrOJ99SAVStDI7az6MMSzZqhesyRM3w/wDiMM/Cl2jZXXqMTce4R0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a1f6ac15-2b0a-4e93-a5fe-91b84bbe36e5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a0c2318c-7f93-450e-9c23-df27069efa03,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e46d5a9c1fff11f09b6713c7f6bde12e-20250423
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1749129287; Wed, 23 Apr 2025 13:00:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 23 Apr 2025 13:00:34 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 23 Apr 2025 13:00:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WULEJrw0qFpvy7sWxxLZ82Adjv6iqe1hqXkqeCePRM8ac8ALaOT4TDeKBhtx9uv1AcYWe0R4VPJtuF0W5jZNogJyCH7rsYAWOC+UKTiBK5D+cr7KuC2RggGX3fuJ3Amm7O1XhkMZEhV7VwtycY9OxBvtxVlaI4CYNlbWt1uJ+OcvniB1mMJVXD+Wy8Qut11QRq+7SubEam5MACuqFRQLuVrMCLBIJF06aabQASgIlO86/0axsCy/wdo4Yr094yRrE9xSzsV17+/4lIS6wtVv0iNgIAYt4EKlNx+WpbZ827vK8tAdEVcdlgbXtncaXi0THUrANBj2H7hUpLzaQODvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFFaQPuRuB/U5W0yiAYjsJ+yLXKrLDB3zWFRl2T6Vk8=;
 b=xQwvX1KvAKnmHiQSayRJzIw7XZ8H9WURZ2Pj+yP8ub5L2NKp4aNjSOk+oGmBUcHd83g9LeqbSqe6V93nQhRz7Sg4Oqm3CjEtkKzWvf3qiV0mJAwmYpPUsqDQdAe04PqnOd2l8O93fHEMNTvBy837uGVgnWF9UWl/scP1UxDPcXjFEZey7GP3YeluJiKyqI674bbGJF0xukCAgXAvFj6N3/vQGnksqdjkA31ysC7lHoYq3dh7FWou9k1vrjzAanPKXIdDdkC/WNn4DKQkArVO9M3xROMvv6XTSG1IaeC6dyN3sHt+VDJfrwV1PXutgbPpmrHx7IzIfbHUgMCVw1F06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFFaQPuRuB/U5W0yiAYjsJ+yLXKrLDB3zWFRl2T6Vk8=;
 b=M9k9242nfwXrDrz4XH4MuR9SRM6tI+qgWLnXUMennzGabIZYPyPu1MsVOC3bj5GrRIJQhjMENKfxlJjYfrOI+HjgjYqrChI57yiur464T4W49Jn9G30PNnHG9FGTZDiK0voMFkLZ4/DnswewIHKpBdwcDYLQjChaJHBRG6nbAJg=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by PS1PPF948F3CF10.apcprd03.prod.outlook.com (2603:1096:308::2e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 05:00:30 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 05:00:30 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "avri.altman@wdc.com" <avri.altman@wdc.com>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>, "robh@kernel.org" <robh@kernel.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
Thread-Topic: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
Thread-Index: AQHbr5boQdRcrKoalka/Isau2NT+bbOwuhUA
Date: Wed, 23 Apr 2025 05:00:29 +0000
Message-ID: <070f15425ba2535a0bb165d61243dc3e3f63d672.camel@mediatek.com>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
	 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
In-Reply-To: <20250417124645.24456-4-quic_nitirawa@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|PS1PPF948F3CF10:EE_
x-ms-office365-filtering-correlation-id: d4f7951e-b70d-48a8-3a4b-08dd8223c508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?a0xQV0VSeWFnVnpuR1FpRmtiWWJvVDVuR09TeldXNDNkSjFwMmc4bi85eVkr?=
 =?utf-8?B?d2Z2NWxrb0krTjRJcTc3QVVrRFVoVkkzeVlGYXZyK2F2d3FBU0Zmcm15ZXZ4?=
 =?utf-8?B?UWhDenkwd28zWXI5d1dTZFp1QU82SG5HOS84V012MVpTRHN6cDlmcXBPSENv?=
 =?utf-8?B?cTF5N0x4RHpncHVLd0dobXY1a3UyUTZGaFVHc0hnRGJPbWl3Q2wwdkpici9W?=
 =?utf-8?B?Vklwa3R0WU4xWTA3ZWhaVEhBTnFpQU9RTHlaQ3BZWjBlRGJnN0pDbnZWQWEz?=
 =?utf-8?B?amU2emlBL1JQQmFJRVk5dCt4d2lHdEZQV0tqSTllWWMzMXJJclFaR2prQnZN?=
 =?utf-8?B?QlRSTUNCM1ZibjJZNGxnYlNXaVgyVXJTWVNWeWlCTUEwVi94ZGpyUmFVZitr?=
 =?utf-8?B?N1FXS2JOZFh4ZzRaelZ2K0ZvTDRXdGVLQ00yalFMdm9qb0xWMjBoMFozOGp6?=
 =?utf-8?B?UGNNT2pOL1M1STBwZHUyeTBTejQxMldyb2FselkrN0c3andFZ2YyZEttZHl5?=
 =?utf-8?B?M3hHdTdub0V3cE1BMVU3eVluaUh4MHNXbllxNEhWdXRFVE1iZGNrYnFmMHBz?=
 =?utf-8?B?NlBjRDY5VTN1dGl3Y0x3K21zNXNjUHlNWFczMFVQY29hU244cWlvYm1kSXEw?=
 =?utf-8?B?WmRHMFpEQ0FUOHljZmxteGZ2cmJ1dmwzVFI0QWhibDBPdzRIcUhIMXh1MzVS?=
 =?utf-8?B?b1pqWmVWdUJraS9VaGduNWZRclNaNjgrSGxxRXovemt1eUZxeVpUdStIMzNI?=
 =?utf-8?B?WFAxQTBFdXJiQnNxUkh2NGpSS3I3WnNycmVnTm9SZ05FbzhJa1JVMnVtZ2wr?=
 =?utf-8?B?Q3BlajY0dkRPYmliSHlqQTRRY3F1UElSWUNkem9nV0Rtc0dEaTdVYythS0M3?=
 =?utf-8?B?L3NiRENVeEE2a1lKRml2NUluaWZDdFF2ZUczeUkvN2lmRFJQTE44bXoxUTd2?=
 =?utf-8?B?UGRLYmptbjhEWUxZN2pkcXZ3WVJYaWRCUHZoVzk0b3BERkw0Wm9Yc2daRm84?=
 =?utf-8?B?OWJsUUJ1U3dDalIwVno5dlNUcUdGUVRZcDFENnkydHdVZ24wUEJlbkV1cHZX?=
 =?utf-8?B?OHlyV09SRWwyaFBaOUZiWXN0T0xaU3cxNHZpb0JmLzNsRmdRUlM0dlJSd2ZJ?=
 =?utf-8?B?THl3VXMvSEhHMkdkRjdtNGNiUHBYWTFUcm9RU3dOR1RWWDFyTEJDK3Z2NEE0?=
 =?utf-8?B?a2FWcnRUK28xSE9PR0EvZ3VRYnRMUUNGaDhpcUZOVkNENXh5TnZwN0ZrUWVw?=
 =?utf-8?B?bFA2bHNkeGd2MUV5YS9UenQ1QlJUNENoYnhMQjdlVzV2VHRIUEk5Yk1ZOGVU?=
 =?utf-8?B?UTRBaHpHL0hXUkc5QVNLaWRhajRuMXhkbURPUWtKTnlvbHlwck4zN09YSHJ0?=
 =?utf-8?B?QjNsdkNidGM3UFp2S2ZxZE9vVWJqWFZjblpLV2hSZTVER1VOTjliSmliNGhq?=
 =?utf-8?B?RkZZUnMraENsakNjM1Y1QlBDcGdhd1FiMVlrdzdxcmdnL01ISS83QVNKZzV0?=
 =?utf-8?B?emV4MUNGYmsza0FvMXM4eTNGS21jblUxUTN3M1l6VjRxdWdSNXE3R0pFSkdW?=
 =?utf-8?B?QzlUMTZHMERzS0ZpVklTMWdOTEVYdmhzYlFSNmJTckhNdlZhbzVQYVlTUUsy?=
 =?utf-8?B?cDlXeHNMRlNXN0RtbndhZm5lQmRoNE1nR3lMZjQ0T0NRRi9sMm5oK2JLU29j?=
 =?utf-8?B?cmRNaHZpRm14N2paYjQ3L09LMlF5NXZPR0tLK3BFek5pNEo5azh1N2FJZXo3?=
 =?utf-8?B?MVBkcUV2bExFa3VkbHVRNE1MUFNvcks3WVV0eFA0d1F2S1ppWm4xdnJ2VER2?=
 =?utf-8?B?ZmxhZk8vRHA5RGNoVG9tUzVFUERSelBrSWdvS3ZIMEgzL2JBczZxODdJOTZi?=
 =?utf-8?B?TmMrQWR6bGY0cnpLbXZTL0xyNEM0NjVqQlRHbVZGck5ZWDhJM1lGekg2ZVEz?=
 =?utf-8?B?S0s1WXhJZjcyamxpZXIvcWdvdUVhaEdhRmtXVEJoZkFrUzk3cGY0SG43QXBa?=
 =?utf-8?Q?hdlfuOXkrWw8D0QiLK8OcvQjC5gFSQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTBlQlp2WTlHb05aMnlsVWcwcDVJbWxJeitTNE03ZjF4TnhvNFlSTU9hWlVV?=
 =?utf-8?B?dytwc2FabG1NMWkvN2ZGMFlFZEZzeU5kODY1L21IaE1icDkwT0JXTy9sbjkx?=
 =?utf-8?B?aytjdTVQRjhSd2dpOFpMUUM2OGpiTW81SjZKRDJmd3lJNGVnMGNIbll0VFkx?=
 =?utf-8?B?Tis2YkNhUHNKMDZaZlhESXJLMXpkSXlvc1RnejlOaUw5UmFReEJXOFlrQjVJ?=
 =?utf-8?B?Sm5HSkVIWFpITnhoeHFyamtXSEhja0VEanFDdlVpNU5xNGd4aW44RUJxWEFC?=
 =?utf-8?B?ZU5BcnJIajFTZkl1QmpGM3dGeW1ySVZreWV0d1pUU1FNRDRNNnViRXlsVnU1?=
 =?utf-8?B?Ym5EbVhjd2ZlQXZJZnZkQXdHRnVqMmV5WnV2aDVPckV3cGJ1ckJDQ1ZDKys2?=
 =?utf-8?B?U2t1U2hNdWs2V2NDTHRmL3pNMFlUVjR2ZEZ4byt5NFhyM3hadnNGaW00aDc4?=
 =?utf-8?B?YU1JTzh1eE5ZZkgrTDVwNUE2ODNhZnNBTVZLVVlIRVh6RFRGMEVUY2NnZytm?=
 =?utf-8?B?UDdQc0F0TGFZQ0w3dG9EM2tBNmM2TG5vZ0Voc0hXZERQTGpVZ2RKWlVncmcw?=
 =?utf-8?B?aDZVVk5yc2RYTlZaUE5ibWsrUThLdGNQSWsvTUFDMU5PclltU1pRazlJYUNV?=
 =?utf-8?B?R2J4Z2dqMlVnWlZVOHg1M3dLTWtGL2MvSHBQaDA2enJFVmNoLzdIazIyN0Fa?=
 =?utf-8?B?cTlacWpLaWEyMEtkQlAvcllGaFovQVRqeUEwR2grZzJBNnFtVXRxeEVPb3BY?=
 =?utf-8?B?dnJ5NmhadVo4UE9ieVphaEdaR21wckNHTHdBL0U3bUh1cG90dE8rd1Q5QlhJ?=
 =?utf-8?B?SlhyUnFwa3NUUTNnNTRrUVZCU3ZPazhiV29qdjdOb0loOFNpcEl2YmRpMEJa?=
 =?utf-8?B?eTlqZllBampRN2NRVW5XcHdDYWpMVG55aitSLzZzZ1hVRDdDZmlXcUl1Znoz?=
 =?utf-8?B?ejRkY24vNWRQSUJlc09OOGJOTFNGMjhJVTJveGYraHJFUTRKb3hGR3dRem5W?=
 =?utf-8?B?V01KVzJpcmlFU0w2ZHBidUM5WGd6VVpPeVhxUUdRQU5vWDNQbXpuVGNBZDl5?=
 =?utf-8?B?eGdDUC9QQnZ6K2xwd1VkcVJqVzRISEhvdUFNUE1aa1FMMG94NnVOTk1yRjFX?=
 =?utf-8?B?Ly9jVFp1YzVsRkh6S1YvbzZjZ1IwZUFGUlRSTzlwamNidzBsNVJsZ2dJaWFy?=
 =?utf-8?B?dGplYXJIMk81TEE3WmxSd0ZtVEp3RzI5T1BpajRqRHFlWWoxODBVNVA0YUF3?=
 =?utf-8?B?ZGF4NDdQN2ZDcmk2T3NUSFM0bDVnOEZvd1g0ZWU5MFJLZkhFN1NYSEYzcUFL?=
 =?utf-8?B?eUgwU3lSakdIMytLTWV5K3JUNUowT3VNS3pveTlaRlJSUGhYMm9wUlVHSmt0?=
 =?utf-8?B?M2RJSy9SekxxczRWMWZkblRrcHlXcHMvMUFMV1hVM0RMaE1QT1BTNXJVNEoz?=
 =?utf-8?B?MitMNzFqaVJiQmVmeGxaTXVFM3dQMVFsbXJaR3B4bm5XdUkzQk9DQksxcmcz?=
 =?utf-8?B?OVJPWmFkS09ScS8zN0xROU40QjBHWmxzYTZQSU9XenlDSTlad1BWQlJ0b0Fh?=
 =?utf-8?B?SHJidXVDTUEzNkFtaUFYeDN3djdKZ01ER2xqbGxRa3ZLZjgraTJPdzZxOU1z?=
 =?utf-8?B?OFBJTFQvMm5JazJrdmZOMXFFMXNYYjM4S0tjWUVoWmxRZm1mdk5tUWhKUmc5?=
 =?utf-8?B?OVAvN2ZPVHEyQjdqZ05BbThMOGx5cUd1cW9UZjJHRWJRUmRGQWdFbGx2YitL?=
 =?utf-8?B?cE5oSzZrUzlKSmk0L1JFTDU1TWxEM1VPc0pQY2lyajVTZXZjbHpOV3BPZk9C?=
 =?utf-8?B?cEN3NXJsai84VWZWaGw5dVpQUit6ZWNXUng4VS9QeHRad0N3NmtCRkIxYjBK?=
 =?utf-8?B?Z1RuSVlOR2dIdUl6bE92Z09Zc0JUZittVU9zSGFOQURlbEh3azBoZFl4TnNQ?=
 =?utf-8?B?bVhvaUNLZTdJNHBjVFRwQzBlUUZ6d1F3WXlydlRIQk1mazVZZmI5R1lqK0gv?=
 =?utf-8?B?blVzb1dqYlpEZFIveUZiTmkxL3Y5ZkI3SEZFb0dnR0piYjNLOEw1ZDl3eCtS?=
 =?utf-8?B?Wk94RGJIeGdNZTY0WnRPWitGZVpac3o3cG02MDJpWHduQnU0SHh1MkhobjZV?=
 =?utf-8?B?ZUdGSjJSS0J5SE9KeVNRSTRiU2hwMUJOOVU1dnVtdU05OWFZUFFqbkNJYmc3?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0395FA7311FC9F4D9C6FC4ED7DF9166C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f7951e-b70d-48a8-3a4b-08dd8223c508
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 05:00:29.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mvcAqnxWTkvo2EEfAXHg+sm9uq/fEtVD2QGp0MZv41xyn3Vs9CikFeAh3a+Rl9LA1z57FJVMRuuQBqONbB9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF948F3CF10

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDE4OjE2ICswNTMwLCBOaXRpbiBSYXdhdCB3cm90ZToNCj4g
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gVGhlcmUgYXJlIGVtdWxhdGlvbiBGUEdBIHBsYXRmb3JtcyBvciBv
dGhlciBwbGF0Zm9ybXMgd2hlcmUgVUZTIGxvdw0KPiBwb3dlciBtb2RlIGlzIGVpdGhlciB1bnN1
cHBvcnRlZCBvciBwb3dlciBlZmZpY2llbmN5IGlzIG5vdCBhDQo+IGNyaXRpY2FsDQo+IHJlcXVp
cmVtZW50Lg0KPiANCj4gRGlzYWJsZSBhbGwgbG93IHBvd2VyIG1vZGUgVUZTIGZlYXR1cmUgYmFz
ZWQgb24gdGhlICJkaXNhYmxlLWxwbSINCj4gZGV2aWNlDQo+IHRyZWUgcHJvcGVydHkgcGFyc2Vk
IGluIHBsYXRmb3JtIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pdGluIFJhd2F0IDxx
dWljX25pdGlyYXdhQHF1aWNpbmMuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL3Vmcy9ob3N0L3Vm
cy1xY29tLmMgfCAxNSArKysrKysrKy0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdWZz
L2hvc3QvdWZzLXFjb20uYyBiL2RyaXZlcnMvdWZzL2hvc3QvdWZzLQ0KPiBxY29tLmMNCj4gaW5k
ZXggMWIzNzQ0OWZiZmZjLi4xMDI0ZWRmMzZiNjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdWZz
L2hvc3QvdWZzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMNCj4g
QEAgLTEwMTQsMTMgKzEwMTQsMTQgQEAgc3RhdGljIHZvaWQgdWZzX3Fjb21fc2V0X2hvc3RfY2Fw
cyhzdHJ1Y3QNCj4gdWZzX2hiYSAqaGJhKQ0KPiANCj4gwqBzdGF0aWMgdm9pZCB1ZnNfcWNvbV9z
ZXRfY2FwcyhzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPiDCoHsNCj4gLcKgwqDCoMKgwqDCoCBoYmEt
PmNhcHMgfD0gVUZTSENEX0NBUF9DTEtfR0FUSU5HIHwNCj4gVUZTSENEX0NBUF9ISUJFUk44X1dJ
VEhfQ0xLX0dBVElORzsNCj4gLcKgwqDCoMKgwqDCoCBoYmEtPmNhcHMgfD0gVUZTSENEX0NBUF9D
TEtfU0NBTElORyB8DQo+IFVGU0hDRF9DQVBfV0JfV0lUSF9DTEtfU0NBTElORzsNCj4gLcKgwqDC
oMKgwqDCoCBoYmEtPmNhcHMgfD0gVUZTSENEX0NBUF9BVVRPX0JLT1BTX1NVU1BFTkQ7DQo+IC3C
oMKgwqDCoMKgwqAgaGJhLT5jYXBzIHw9IFVGU0hDRF9DQVBfV0JfRU47DQo+IC3CoMKgwqDCoMKg
wqAgaGJhLT5jYXBzIHw9IFVGU0hDRF9DQVBfQUdHUl9QT1dFUl9DT0xMQVBTRTsNCj4gLcKgwqDC
oMKgwqDCoCBoYmEtPmNhcHMgfD0gVUZTSENEX0NBUF9SUE1fQVVUT1NVU1BFTkQ7DQo+IC0NCj4g
K8KgwqDCoMKgwqDCoCBpZiAoIWhiYS0+ZGlzYWJsZV9scG0pIHsNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaGJhLT5jYXBzIHw9IFVGU0hDRF9DQVBfQ0xLX0dBVElORyB8DQo+IFVG
U0hDRF9DQVBfSElCRVJOOF9XSVRIX0NMS19HQVRJTkc7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGhiYS0+Y2FwcyB8PSBVRlNIQ0RfQ0FQX0NMS19TQ0FMSU5HIHwNCj4gVUZTSENE
X0NBUF9XQl9XSVRIX0NMS19TQ0FMSU5HOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBoYmEtPmNhcHMgfD0gVUZTSENEX0NBUF9BVVRPX0JLT1BTX1NVU1BFTkQ7DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+Y2FwcyB8PSBVRlNIQ0RfQ0FQX1dCX0VOOw0KPiAN
Cg0KSGksIE5pdGluLA0KDQpJZiBoYmEtPmRpc2FibGVfbHBtIGlzIHRydWUsIFdCIHNob3VsZCBl
bmFibGU/DQpOb3JtYWxseSwgeW91IGRvbid0IGNhcmUgYWJvdXQgbG93IHBvd2VyLCBzbyB3aHkg
d291bGRuJ3QgeW91IGVuYWJsZQ0KV0I/DQoNClRoYW5rcy4NClBldGVyDQoNCg0KDQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+Y2FwcyB8PSBVRlNIQ0RfQ0FQX0FHR1JfUE9X
RVJfQ09MTEFQU0U7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+Y2FwcyB8
PSBVRlNIQ0RfQ0FQX1JQTV9BVVRPU1VTUEVORDsNCj4gK8KgwqDCoMKgwqDCoCB9DQo+IMKgwqDC
oMKgwqDCoMKgIHVmc19xY29tX3NldF9ob3N0X2NhcHMoaGJhKTsNCj4gwqB9DQo+IA0KPiAtLQ0K
PiAyLjQ4LjENCj4gDQoNCg==

