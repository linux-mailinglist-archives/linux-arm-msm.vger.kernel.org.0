Return-Path: <linux-arm-msm+bounces-47980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148DA3569B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D005A188DCF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348EE127E18;
	Fri, 14 Feb 2025 05:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Os4PYLKS";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="X6AC4bwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D852186284;
	Fri, 14 Feb 2025 05:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512456; cv=fail; b=ZRX4kL06e1HJnmowOPHJKzQ+iVnL12oYaLoZIZZtOUAp6Z0+3e0F0CKLXsiKcIsvJjYfjT+LytAVERse77W5jcHd7Tdtay3qhBtp9gWZecgcYxJSMr6597XkhheRif9TedRuSEmXOw9DVsPo0N5HgRczL8LUEjcNz8mBgRGCqpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512456; c=relaxed/simple;
	bh=p8ADFDS1nMjE4uuFCxfuKLOBbfqXLyfdmlxEU1LrQXg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hyWAA0AgQgdKi6t9bwhZ0qTVrS+6r3aDrLFTRcz3Js6tFrLD9bTT9XHbm+JmnWCEKvnVAUaO5XOVOOPLRLjmwPeaK/WyhUOc1lP4Y7280PoEBq0crSumCyEoy2dN3Kedjw7iPbCfDE5yZaYmixlVwaWH3ALUutWJjceXmBZ9T9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Os4PYLKS; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=X6AC4bwN; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1badc26eea9811efbd192953cf12861f-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=p8ADFDS1nMjE4uuFCxfuKLOBbfqXLyfdmlxEU1LrQXg=;
	b=Os4PYLKSEYtKrXYx5lWwU2Lv8TiUQtwCBV/2rAoPI+o4SGV7eegov1qm4OrFn8CLzQ2kL27Ik9n6/xV/3o2a7jZg4Iigt8h8q4rg2imFS8JgNmlwu5+KvAqoBtn038CLbWTp805RSeowLaAejyqY/FoZpFZFKlAytM9nCkLHYdg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b81aadfa-a8eb-4f7f-a8f9-27aadc7b2f2e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:2a2e75a1-97df-4c26-9c83-d31de0c9db26,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 1badc26eea9811efbd192953cf12861f-20250214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618894911; Fri, 14 Feb 2025 13:54:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:54:07 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:54:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS8IKhKLjLYbOpPvoO1jSti24c+skkMSIQnNiTzeT6NziFOZnzxJxvZeAM4Q/gWH66cFkybfnCtUlAx4vy/YOMWpbgmlEKSvA0tGxNLPPwMPe4D5C/rUMrg7mMU3DVKPEN+BdxlkcvenlsKuSxel581kp56woVmEeqYR2XnSFG09I0zP36O0+Q6sJbXqn4exyuIIfI86ZWoV9pXifQUqJHC6r7s9fjVAdvrln9gcZG7INW5bUtbJzTYqdHjAF9FfNYM+VscnUMqaayjHyAcRvXlQljyk4s3+HheJ6dMj5xvBJor2jegF5IZ+pGDIETaz73fKSXbgE6KzqNgLr2A8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8ADFDS1nMjE4uuFCxfuKLOBbfqXLyfdmlxEU1LrQXg=;
 b=BtFB09BR2qyuXBtWxUg0Mt9vLK/lfK6CTCjpCKLUQLxEkcjb8Hnqas0lOcZkyzHzHHktUf3NoRiLgT1gLCJaQ+mgHJ8GA92JTdtnoZS61EjJCG216W8SS8F2afalpYG0LCCOmPoIr2LEDh8h5PPwm7UrJWb0YpD5DR5mIn83WkXbSyagwmqo78NjqGmHdp/Zd6FMqC3jjBJYCWgvIjBMCFg2Z7WpPYIUXemlgUEmavXNMbNdcZ6x2dv3BZ+D5Mv8N+OIUSaXUYDPSGJGmHdO8JLBo0ks3XEna08v6mOpbIwOALDa39plnx8jMdcqhRJF2deQYdAWPZ6Im7UhXZxHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8ADFDS1nMjE4uuFCxfuKLOBbfqXLyfdmlxEU1LrQXg=;
 b=X6AC4bwNxPRXGHaoy7+aJilFRVdrS5bP5Rf2CtgbH9KdG/DwHQsuxxr7Gn9qGq7tC/YuFXkrdjHysdklDmdyKWsfH8ii1jvt+Tv3Fsuz1FWmC8005zB/3wlaZFtU58SkakfqIaeUTaXXD2obOU6b0c5bKg9hVEcpc/kYoR6+zoc=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7319.apcprd03.prod.outlook.com (2603:1096:400:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 05:54:06 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 05:54:06 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "ebiggers@google.com" <ebiggers@google.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "minwoo.im@samsung.com"
	<minwoo.im@samsung.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v5 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
Thread-Topic: [PATCH v5 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
Thread-Index: AQHbfe17IxAlqgrcfUW8Yer7SNoN27NGTdqA
Date: Fri, 14 Feb 2025 05:54:06 +0000
Message-ID: <1b95749e23fd66cfba6d9bba1f822a727ecf7ba8.camel@mediatek.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
	 <20250213080008.2984807-4-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-4-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7319:EE_
x-ms-office365-filtering-correlation-id: b059f72c-bc58-4778-c342-08dd4cbbfe37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VXpTN1lTaUIvamFWWktZdWs4S3h1WkZyTkJLcUM1YnZKNkZLWmRiVWRPd2NL?=
 =?utf-8?B?a0VwSzMxem1lN3EvemhJVjkweFdpNGxjdStkRlVMWFhmelZ5Z3RqK2x0Z1lw?=
 =?utf-8?B?WDdxVjFnT0xFbEY2Q1drN2F1WXEyRUh0dEFtUC9zZDNLd2J2V0JKNkZNSHhX?=
 =?utf-8?B?L1BVVHBmTC9IdDBSL0FCVWRyODduOEtUK2p4ckJQTkdhMVppdXRucXF3YUQ3?=
 =?utf-8?B?aWlsOVhSSTFtdnlXZmVqUE82dVczOElLZ3g2SVloYmtWb1hrSXZOYTlwbXlj?=
 =?utf-8?B?S1llbUxCU0kvYjN0MFJPSVp1U2UwTEpBOFpRUDZqMFlVdWNMdjBSWWYzK0tQ?=
 =?utf-8?B?Zk1sYjRVSnQ1MCtYc0Q1T0FSWnl0WmhSZkJnTGtYODIzUTFtQXB0WHM0ajNq?=
 =?utf-8?B?SW9XMGhhSFlDVkZHclRZZU5GelhpZFV6VENMMTFpZkt5YzJPTExqTkZtZ2tq?=
 =?utf-8?B?bW1MdUJIRHBjNTkwUTRhNERIQVc0Q1ZmMkNINWxpSkFHRmZhM21FemxmdDdD?=
 =?utf-8?B?MllZM2VneTRuYU9wZThZV2dZTDFMMmsxTGw2RGdzVWZlZTBWWDFXdERvY1RN?=
 =?utf-8?B?K3BsSURSa2hacm4rTDd2NUV6UzBaclhEU0xITGpFaUozbnhGdENIOEVJRE5C?=
 =?utf-8?B?b2pPTVhIeU16Zm5ZYjdMaXg1c2F2R1R5MERDRHZUOG5CSDJrdmdmbFVuRy9y?=
 =?utf-8?B?aXNYcUtlbjk2R21wVFlOdnlZVnZDMXBEeUNqSzJwdk9WWGt4WjJ2Q1R5MHAy?=
 =?utf-8?B?Y2lVT0pBYmc0NTdkdVpKWlZLL3JONml0UVlBYUVJRXFOK2JzcGYxaS83RTRi?=
 =?utf-8?B?RW42dEhEWXJLY0VXU1JhYWtQUGZEWWNnNW02TElNbGJJb0kxcnR3RkpEaVBB?=
 =?utf-8?B?QUNOeGs2Q09GbURDL0V0S29neWpuOFRmSlIzaDZWVFovOXc2c01KSUgvMm5I?=
 =?utf-8?B?bTI4SEFadXZ4a3VYSWlhVkRZblRmbmNubjQzbmdJckw4dGVvb2lSOFRzbi9J?=
 =?utf-8?B?NkRVbzdrbUl5cjJWMEkrS0h1azM3akx1K2Ruc1dSVHRPZDFiUkkyTXpvN3VK?=
 =?utf-8?B?VEhzZ2RNazBFZHVxTEVEVlVvUUN4b2hpUXl0SjZUVFphL1Z0T2RkSzlIb3hG?=
 =?utf-8?B?eDdPK3I3MTdXeTVjZUdZdjRJRE9nbCtNTHJhbzJDUFNJMDE1UDQvMkxrOXZU?=
 =?utf-8?B?MzNVZzZJS3lyKzA3YmgzeGxFTlhXYzlTVitGWXAxWCtwOTBXRDk1MXZ2K2tD?=
 =?utf-8?B?enl1akNLYXFxZklkMm93QW8zNDBTWHU2YkpqNWZVbkM5bjBUZ1lzK05pYzRJ?=
 =?utf-8?B?YUFPa3ZEbEhqWlpUUjVVaERjQTExcU0ycUoyOTVSalNTUm1wMWc1VGZUVEZE?=
 =?utf-8?B?bDMyRUY3bDBDMUdDQTdjR2xFK2Y1RTlVaExaU2dYeFZZTkVhVVkyQkp6Y2la?=
 =?utf-8?B?dnVVRkxOa2xkclpzZkVVWE4yY0pIcWVVK3RxRXRVWldlZUg3WXFvK0lzR2Yy?=
 =?utf-8?B?cUtDaGFwL1cySlo1Q0ViRkhzdkE0UndXU29YbjU3ejlLaFBIMjluRHFjeUgz?=
 =?utf-8?B?VjhkT1RQR3RYUHUrZ1NJNzB4V0J2bU1zc1FGcFhGNkNFSzQwL21RMzVWUkhE?=
 =?utf-8?B?bnBBNzZLRWVkVXRGMWVDL1VmaGxOdDV4YzZGR2ZNOHB1Wmg0dzlkb2ErL1hi?=
 =?utf-8?B?V2tacDc4aFVjNHZEMy9HRGJQWk84ZnJRVVZ1UVh2SDgxakdWWVhHUFFMNXhZ?=
 =?utf-8?B?VEd2eUxFREMyYkNaVG1VVC9iUDFJRjdzU3pFNXI1aExlaGx2RjFLUHJzZDBr?=
 =?utf-8?B?cmMzUERwZ051clVjWFc5WkkranNsRWVFbTIvWU5rN0ZoRTRSZXI4RTVXdVJX?=
 =?utf-8?B?eC8xNytaR2Q5RjFYREljTVQvUVVKT2l2RXdKY2JnR1BTLzFiVkp1OXVobUo3?=
 =?utf-8?B?SGsyRXkvdUp2Wjhsd0UwcHQ2NzhFcVpNRXN2b2JOR1ZJdjBRNG9wd1RBZXdv?=
 =?utf-8?B?K2kvK2pHTER3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW92UjEvdHhvdzR4RUNKS1NzbHdCQjk0SlJqcG95TXc1YjhVSVpDRDI4ZGwz?=
 =?utf-8?B?aVVualJyMTY5R1FIVkJDZEZXZVVMV2xhTk13enRUc0M5c1dLNFF1MXJoanc3?=
 =?utf-8?B?eWtadWJTdHFWRnd6akU5NFprTHBzdnFjOTREeFNNOFJocExzSlZpL3A4QjAy?=
 =?utf-8?B?UXB2a2ZYdm5xZ0pGbFJEMmFrcWIwTWhBL0o3d3ByazF3aFFubTNQZlFpWE85?=
 =?utf-8?B?N1J2eW9oOUdlcGpaRE5ZTDRDTVJuUUlxaHRWSEcvUWNvY0xITHZTQUE4Y05r?=
 =?utf-8?B?YUtycjRmeTdhaUpCMmRJU3VycTE4QWJqVk5Wa3VRTkpidDdndE10Yk5aTEpU?=
 =?utf-8?B?QzVEYW9wM3V3QjIxMTZBL0NhUGduU0loQ0t4eTdVc2t2Ymo4emsvWXE4ejM2?=
 =?utf-8?B?dlNmYjNlQXNFRWFzWUZ5ajdkMXJ0Qkdvc0Fxd2VjYzlHSDRZMi9TUnpkUnhT?=
 =?utf-8?B?Vk42Z1ZrTHRJODdqb1NseHJUeDk0c0ZaSEhtaldWeVRGVW5ZYWwrMEdYNURn?=
 =?utf-8?B?RG9VclRuM1g3U1RkOVNOb2RHQWV4dG5yc0hWR2orMGM0VitPd2VCbTlISFIy?=
 =?utf-8?B?YjluMnpUMmtZUHVUNmV0ZGVRUlVzTElEZVQ4cVUxUlVaYVFhZTRHdzNnNXVY?=
 =?utf-8?B?VWVuMmpKOStuM1FSMkk0QlpiWEZZME10YjJpUFBRMFNsa1FtblhyZFcrQ2dY?=
 =?utf-8?B?YWlGblQ2M29kR2QzTXBUdU1UZW5Gemk4QXYvek9vMHc3NHk4Q3pYalovcXoz?=
 =?utf-8?B?QmhEMDQzS1dGMHp5V1IvcmYxUk1Gb1B4MGtXaUIvNFd5N1ZneHVkNmY3Rmdo?=
 =?utf-8?B?bU95TW5xS21IWU9KWkZ6YmFqYWhVRjF5VWZhU1pxQ3pnUG9kQUxtakZsczZx?=
 =?utf-8?B?dW43eW5zc3FMZGh3UHdJa281bDdhK20rNUZJdngvY1BwZ2JkWXAzQ2RSMW8r?=
 =?utf-8?B?a2FDUmVOUG9VY1dnemt4VDg0dzRub2pDSU5nMENLYUxLbVZTUE5KbGNuM295?=
 =?utf-8?B?Mjg3SlFFa3JPRUljT3hTR29QYTh5b2tHUlNQSVJFczBRcHdUa0lIZS93dGlT?=
 =?utf-8?B?MzVNYlI1ZS93dDFVZk9EREdEUzRxcW56SjVlRVZNUS9HMDRYdUExZi9MaTVm?=
 =?utf-8?B?Vjlkd1RxVzZxaXpCQ1RuaWZaekRvekZlVUlsaGRZNzVpUlphRk4yaDh6dnJn?=
 =?utf-8?B?c3lHYi9lN1ZJY3ZKeElISFkyT0ZCYTBsZHl4R3B3aXVpaThkaUJwQWNFRVow?=
 =?utf-8?B?dVJpL1Z4YzMvQmdibW1OOXRwU1AzYkJWZDdyVFp2dmtzWVVqNS9PS2hLejVr?=
 =?utf-8?B?ZnhOQlk2S29oc25MNis5SnlFVTVjQ2dzZ0NmSS9jTG9EcHMwbmFXb0N2d3Za?=
 =?utf-8?B?ejZGeUxHZUVlRXVSRnZ6c1ViS1I5cDFOZFBIQ0FvMThVTmtvMEd3M1JVTVVu?=
 =?utf-8?B?QitMd3Y1QmpQL056czdkT09vNmZtY0hQUzladUVRams2V0dtUksrbWM2aGRG?=
 =?utf-8?B?WFB2U3VtSDc5YlF3RGdIUm1UQWtEamw0SlJiY2M1MzdWSW51dklDazRoR2Fo?=
 =?utf-8?B?dHBrUHcxL0lVSE9NaE92QTNpelZMc3Q3Ym9mWGtkSk54ZS94dTY5Q2pkRDRu?=
 =?utf-8?B?a1drK1RPWVRMZEtIeVQ5YjgxQWhTQjNDOGJmbUs3aG1nSUZFZzgzQWt5RnMr?=
 =?utf-8?B?Qnk3bUNzVi9kbUpIbDhWeWlTR1NwK3ZSbXM4Nlo0UUs2a3pjMWhWQUduR3Fo?=
 =?utf-8?B?ZldpdnlVQTRvQTh2bldtU3RrQ21DWmpqekYzSGlQME1sVlEzdnFLWTV6SndN?=
 =?utf-8?B?SGtDaHNIK2cvUytZcUI1WUVCQ2gwMkt3SFRnQ0hzcEZFd1RNMkZlTGJXVi84?=
 =?utf-8?B?YlFPekFZWG5XaDZGam1wMkw0Z1ZobmlYRTlKSFl3WDg1Tzk5cnhWTDJsWmJ4?=
 =?utf-8?B?bFh6dHdqS1VPVEFvOTJBZWlaOVQrVUNmT2pySmNwUlhxeHZlRmZVdm53TEtZ?=
 =?utf-8?B?R2lLd1JaU1pISUFjb08ySWVjc0tjVjl2QmEvand0RXZkdGdKUmJpTFVxRXpK?=
 =?utf-8?B?U29HWWM2UHFOQ1RSSnpPL2lMSXBYUDdMbmt0QUJNNmZ5cFcyQ2d4a3N5N0Rv?=
 =?utf-8?B?amVYMG9LQVVGWFZGR3JvbWY4TjArc01IL2hjR08ydjNBMGRuRlU3SjlyMjJF?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A57FAB98A26BB44853880760BB39FC7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b059f72c-bc58-4778-c342-08dd4cbbfe37
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:54:06.3631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr+e1e72jjwVpAbdswm7GBgeIji9BI+srLApxuITRjj9XswRikrPYO9UtUZTP1tJZgKl3yQVYetD5Jgd7X0Lzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7319

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDE2OjAwICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IEFkZCBhIHZvcCB0byBtYXAgVUZTIGhvc3QgY29udHJvbGxlciBjbG9jayBmcmVxdWVuY2ll
cyB0byB0aGUNCj4gY29ycmVzcG9uZGluZw0KPiBtYXhpbXVtIHN1cHBvcnRlZCBVRlMgaGlnaCBz
cGVlZCBnZWFyIHNwZWVkcy4gRHVyaW5nIGNsb2NrIHNjYWxpbmcsDQo+IHdlIGNhbg0KPiBtYXAg
dGhlIHRhcmdldCBjbG9jayBmcmVxdWVuY3ksIGRlbWFuZGVkIGJ5IGRldmZyZXEsIHRvIHRoZSBt
YXhpbXVtDQo+IHN1cHBvcnRlZCBnZWFyIHNwZWVkLCBzbyB0aGF0IGRldmZyZXEgY2FuIHNjYWxl
IHRoZSBnZWFyIHRvIHRoZQ0KPiBoaWdoZXN0DQo+IGdlYXIgc3BlZWQgc3VwcG9ydGVkIGF0IHRo
ZSB0YXJnZXQgY2xvY2sgZnJlcXVlbmN5LCBpbnN0ZWFkIG9mIGp1c3QNCj4gc2NhbGluZw0KPiB1
cC9kb3duIHRoZSBnZWFyIGJldHdlZW4gdGhlIG1pbiBhbmQgbWF4IGdlYXIgc3BlZWRzLg0KPiAN
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBaaXFpIENoZW4gPHF1aWNfemlxaWNoZW5AcXVpY2luYy5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFppcWkgQ2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPg0KPiBSZXZp
ZXdlZC1ieTogQmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJh
cnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPg0KPiBUZXN0ZWQtYnk6IE5laWwgQXJt
c3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiAtLS0NCj4gdjIgLT4gdjM6DQo+
IDEuIFJlbW92ZSB0aGUgcGFyYW1ldGVyICdnZWFyJyBhbmQgdXNlIGl0IGFzIGZ1bmN0aW9uIHJl
dHVybiByZXN1bHQuDQo+IDIuIENoYW5nZSAidm9wcyIgaW50byAidm9wIiBpbiBjb21taXQgbWVz
c2FnZS4NCj4gDQo+IHY0IC0+IHY1Og0KPiAxLiBrZWVwIHRoZSBpbmRlbnRhdGlvbiBjb25zaXN0
ZW50IGZvciB2b3AgZnJlcV90b19nZWFyX3NwZWVkLg0KPiAyLiBDaGFuZ2UgdGhlIHJldHVybiB2
YWx1ZSB0eXBlIG9mIHZvcCBmcmVxX3RvX2dlYXJfc3BlZWQgZnJvbSAnaW50Jw0KPiB0byAndTMy
Jy4NCj4gLS0tDQo+IA0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgV2FuZyA8cGV0ZXIud2FuZ0BtZWRp
YXRlay5jb20+DQoNCg0K

