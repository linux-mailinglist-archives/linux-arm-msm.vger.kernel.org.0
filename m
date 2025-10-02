Return-Path: <linux-arm-msm+bounces-75780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA50BB2C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5631923CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 07:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910202D0275;
	Thu,  2 Oct 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZgcEp9of";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="b2FFidqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79F1DD9AD;
	Thu,  2 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759391844; cv=fail; b=lRBfUzmhf+VGZ1nvrt1kV7qsy5Ife5+1S/0wWu+40surm32dril0RiFs3I4YY6ySf7SZDZHUn9qjNFP68IKkD45p9rPzk4yQ1zTT6vuIvmigYQ1U5er2esPFadkN0RoYQkXoiNEljAtABvA7IX2NrrDZeBmGOu72Lff0+Lv2FpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759391844; c=relaxed/simple;
	bh=eUfiVAwSF5szmPOq5KNUoNcqZwF5DcjNRjqY4e/3uUM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHiHTliLhXxIxPXfDMwqrT/gg5/Zx84s5VlfuwQ70Iran/TUw0zRT3CCINyxVFq859EeoBgk/+9MlMFUN2av0h3z+1r/ndWYXbJyPExqOVlvOSqskyOXJ+5CfcyHCKGF0IJG7rxzWKhER+Z3zf7fGJ0QwHcruqfar3Ip3DS8V0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZgcEp9of; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=b2FFidqP; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 68569a5a9f6511f08d9e1119e76e3a28-20251002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=eUfiVAwSF5szmPOq5KNUoNcqZwF5DcjNRjqY4e/3uUM=;
	b=ZgcEp9off8BxigtNzxh5vdgWVh9V3mIZgwaoImMg5q6iAOQ3BCPPUzMlG92jpf0F0xBGJcBb72CiAIInAccLJFBC3/ISSIX5OikrO/UWdWb2flEDkcvSOyqxHtv3+OPxGqd8eMuzoKYQw7rxQPPb1q5WqHfW8Gpblye42ENTdKg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:aede28db-28da-4495-b0b2-dc252cd1e456,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1afae8f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 68569a5a9f6511f08d9e1119e76e3a28-20251002
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1740370278; Thu, 02 Oct 2025 15:57:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 2 Oct 2025 15:57:10 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 2 Oct 2025 15:57:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc0T+tGNmM616Y9pk4HHVo1OwGJwkTHAKjAAZ46fB2EN2bXoWB8PDDiHhWCn8TdpYt/o/a0Schg9HRX9a/RTYUs24KkK8IeP0lgQViSejjalCITqcbetwRzLD6bh6/PRVgQCPmaEDd0RL/QCaSQWyBYylqkl2AWA3zyCLROV9L0lqAL/MKrAXuWdzrQ4bP7+za3KsBheMMYEp48WShQcfxb70Uh1MhQ22EEULUlt4BIupoFCmqtCWWth4pXV2a9v/Q2O9w9NyyuQM1UZDf3Ih+fPQs1jPSovHQ/HHyGcmWFC03NrLFir3R9Y+v7Zz67B2nsXBWmRdIfEsQg+uUNjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUfiVAwSF5szmPOq5KNUoNcqZwF5DcjNRjqY4e/3uUM=;
 b=TlqINqea7xy/yN1byBeCUghcvdhvL9JaNN5mZfRZ30vqCI+dzq/+HWpfx6cY+lS+vWbHKSC6hoJreEQVc7LtbZ6sQ7M+SQb7SiL7afmkCTlEnaD8Z8780S5Jc9EZdASqYsfk0o6dfhQMRSwRVMRhxmy4CuAPgQ2TqQGKMYxoW0U42aZjbobmQ50MYby29RZzlQGoq36GqcEzz/Q7BRSibNfB9Dmg5pK0tB+VTbl0lfEUJD3wrSWl4XPgAlMWuQxiGos+MPx5apQSZbfhi6cCC3N6HcoIAASCG1ci3i20w/DLJE1THvaecV/dIOxHymtYGvqvkXi8V0A2G7cAc0jZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUfiVAwSF5szmPOq5KNUoNcqZwF5DcjNRjqY4e/3uUM=;
 b=b2FFidqPSA1wUEKWqDLMrHb0NyKd/R5HkrhDhbhOw8M9PnlywX6r2IKPzQnIawFbqLSnjT9hCXOI1Yy76x3aQMi/gMeq15kTkLsq3HdoDsw6roU9wb4y7uY9vA+TkXUreInALINNMODMi5PxvvgFOpfTkc52r00m5IuI/XcY/D8=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYPPR03MB9448.apcprd03.prod.outlook.com (2603:1096:405:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 07:57:08 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:57:08 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "avri.altman@wdc.com" <avri.altman@wdc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>, "quic_nguyenb@quicinc.com"
	<quic_nguyenb@quicinc.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>, "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>, "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Topic: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Index: AQHcMxYfOksnBxmnP02s2Q6lFEkIhrSufh+A
Date: Thu, 2 Oct 2025 07:57:08 +0000
Message-ID: <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
	 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
In-Reply-To: <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYPPR03MB9448:EE_
x-ms-office365-filtering-correlation-id: f7c563b0-d0c0-44a0-8d18-08de0189490a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WnFTbmhyVTdiUVZ0aWJBVjBKZmFSRlVRTHI5emFLZVNlZHRVeG1zbE85V1Jp?=
 =?utf-8?B?b3BGbHBzb0ZOamVaMmkwSzVRTmNHSzRIb2YzM2lsSHcxTi9IMkdkcStYcEFW?=
 =?utf-8?B?RzhkblBmVWY5UWlUS3dsWTIzYnAzMFhFaGd3b2pubnN5MXhKOWkrenliL1l0?=
 =?utf-8?B?NFdtdEJHUEI1M0U0Z1g5VHRKeXRlRDdRVHBRRHhWNDhoWGJNVmhjNjNYY08x?=
 =?utf-8?B?bTdoRnFzTjU0eEVCK3VsQmxGdG4yZmF1dFRaUWt0N0pnVmV6aEdZdkI1SE9n?=
 =?utf-8?B?MWtwTFI1WGpLK0NCL1dZODBOQXgzcjJCYlNsbTZHdVhnK2RwS3RPeGxHV3hs?=
 =?utf-8?B?SHJoQWx6QzRmODc2VHROM25QMkVBTlN5eS9LREwvYXNGNlZLS3hEZkZySUFn?=
 =?utf-8?B?N0wrdTl4Y291Q3F5ZmpFNUZxMk9EUUpBM0ZWMFVLVEF4K09CSGJGbFhVemQz?=
 =?utf-8?B?RkFZOU5laFE3MlRJZXhYdHJuYXVLRXBLSVBRenNFcGlpZmdBMExnVHJMTjFm?=
 =?utf-8?B?bVNGTDRTWUFramRrY3dZdU9kbm1XODZBeEJRK0o0Mk1KK0l6QUhLbW8rT09I?=
 =?utf-8?B?eWo4RGlTUGVOL1p2S3l2eXJid3dxMEZSaUxyenRScjlDbG5ZYkVZRlBUdmwx?=
 =?utf-8?B?dDJZL0FmYWsrM2FKS1FTS0ZIS2N2UkV5T0MxOGF0T3JEMk5CaHpwK2x0RXRH?=
 =?utf-8?B?MnlMUzVKM1NoUXpma3FxS0NxaC9rTVlXZGJvUUVYMUJtdjYwRXcwdVlIcHRa?=
 =?utf-8?B?NGdxbnpJeDdEU09vcVNlZHdpSi8wYVRmckQzUUNuSDVmaHhtR043WWVudmxu?=
 =?utf-8?B?NERlaUkzOEp2RUhZNGozMngralkwM3JyMWZKZHdPR3o4TGNjZ1Bvc0xxdWxr?=
 =?utf-8?B?V1B2RWpVYVVGNElBOWV0OWpiZi84NTJEeVgydHh1Yy8rTUgxL2MrdU1yT3lk?=
 =?utf-8?B?ZmdaeXdaczVVcjFkczhuYWJhOHdidlBrSzh1bWpQOUNjVmF5cXc1SzhsaHhI?=
 =?utf-8?B?MDd3ZjdkQitNVGhqdmZwVUovVHhuaUJzUnNwZUZ2YkxFbG05RFlLZmFVNGps?=
 =?utf-8?B?UDI3aHZuR0ZLVXlzeFEwSDdBdzh0WndMNUY3Z1dqanV1UzFJTHMya0ZzeEtr?=
 =?utf-8?B?ZXhhaVczNGtkZGJ2Y2IzTnFCWkJlSjBvaHcrOHlXNDlMdlk2bnlyL2dMaU4w?=
 =?utf-8?B?TXBDSENHM0NsaTIyN3F0OGowMHVONWQrVENaQUM3cE82bTFpbkg2eFYvOHBv?=
 =?utf-8?B?dkI4aDI2M1FkZVY3QktuYmFzSGprclB1N2dtZStzMUZSaytjdC9VbTJUYmYw?=
 =?utf-8?B?TGMxTzcrNzRGL1h0MGljeitNd3EyRkFvNmZocTRqQ2s1bnIwUzhEOWN4UHgr?=
 =?utf-8?B?cFdIUWVVa3RXSk1qWkxkMThpYU14VzVlNk5VTklOVTUyRkY2K0ZiYUo4ZzB2?=
 =?utf-8?B?UVJBNkhZQUtFK3paMFU0RHFFN2N3YjZRWlB5bDdtb0swbmFIZy90eDB2QkJt?=
 =?utf-8?B?Q0dCdnkzVFdKZUx0NEFSd3JuakdDQUVGSGZuYllqVVhacGFpelZuWVVhZk9Q?=
 =?utf-8?B?N0FDdFpvU0sxTnpuR2c1eWpjWUo2V3p5ekRZU0tuRDNRNE0vNmFOZjN2YXNF?=
 =?utf-8?B?M05sbVJnQnZTWkU4ekFtdUI1c1Q5VVdPK09ZakFIdW9KMzViWmloSW1Zbmpy?=
 =?utf-8?B?OHp0eEJpODYxSENPL2hFYVhHS2F3OXZsMWwxMWpuRkVvdDZrL2hzYkVLanpi?=
 =?utf-8?B?WjRJeURUaERvajd0bHJJNERxb3ZwWjh0RUtTcXpvTGtQVXJDbEZqRFhacWVH?=
 =?utf-8?B?UTBZRG9TVXJIOENJOXEvVGZDclV0b05aSWNBTGxyTmVvNU0xTkRmUjErZmZl?=
 =?utf-8?B?YW82eDNaYmtlRW1SQng4eXMyZ0U0WUxFU09IOGJUNkhsVkI4M0tVZTZJM3V2?=
 =?utf-8?B?UGFFZzN2VmJtbU4xMkUwWGlvbXRKZzJESXBKZlBUaEUzbjNsRzdNSUlGcDRt?=
 =?utf-8?B?YkZwYU1ybDNXUGlMakVVNnZOL2MzT1BFQmdvcDlMU1M5RW9La0t3Q3hzTTVh?=
 =?utf-8?Q?D6Tj/S?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eitVelhDcnJrd1VwMW41N21QZThIVTdvZUNUV2ZFVDF0VTYvbHU4andUZURO?=
 =?utf-8?B?SDczY05SVThUSGduK0ZYV0hyaWQxSlQ4Y0s0UkU1aGhEVTNsZUlNbUhvOWdQ?=
 =?utf-8?B?RXdjeWlaUmRnVFhTOGRKRzhQcVNhQXVqdlZzY2NMSHlNNVdGZzhtQk1Rakpz?=
 =?utf-8?B?dXZuSnFtSGM1T1FMOEN1aDY4cG8zOG4vdENxR25lVWVybExYcC92bFNYNmxp?=
 =?utf-8?B?THZCOW81N2hYNUZwQVZiUlQwcUJrUkx3eHFHL2doU2hVVWF5Qmp4M0pzOWVL?=
 =?utf-8?B?dWxwbnpncmdNeVNwMStpSGJkc0xoWGVQSVpIUGxMcWRYd2cweXNwYmJCdWk2?=
 =?utf-8?B?VjM3eXNtQi9kdTNteEVRU3psNlBIbnRabTFyOTF3c2J4UDAvZVRIM2tmT2hz?=
 =?utf-8?B?ektXK2FKRVJaTHdQYmpqSTJFdHM2UHp3ZFBoajlhd29tTTllWGpod2ZmT3l5?=
 =?utf-8?B?dXVub29uUmxLRUJMMGFZQmFuZ2ppTDAvU3hCVUFxdVE0SW1BdWZWOXRqdnZs?=
 =?utf-8?B?b2ZORTlNMWllaGVqdncxSG1BcGttWWl1Z1FrckRzNVlZdTlmdTR1VmFpRHho?=
 =?utf-8?B?S0lvUmgrMTV1NjJJOFhjRFl1S2YzOTR4TVdyVkQxNHQ2c1c1ME1CY2hHaW5s?=
 =?utf-8?B?aFBWSDg4T2tNRmVJQzIrb0dlWGVtODlCMHZIeWpvOUFEanNTMFVLN2hIeW1Q?=
 =?utf-8?B?bnlsRG55NHVyTjVLU0VtY0YyZmRxMi9XeTJTZlNNbW5HYVo0YkxmVnNQaGdt?=
 =?utf-8?B?c3JDSm54VFJXQ0thVEZGSnpMREk4ejNzN0RKNlkxWWNxbEhrcnZvNEdMUTU2?=
 =?utf-8?B?M2NFZURYN2RYMGxEZUJjTU9ZNlE3U0QyZkpmNUJHbEd2Q09XNFFQUFhQTWw2?=
 =?utf-8?B?MDM4U0d5STdYd3ZtYXJGM2l1cGtzQ2F3YUI2Z1RVSkZmeHNISkMxM0JnT2NY?=
 =?utf-8?B?OTNnLzBub1pjVFN6Vk1YVjZNS0J3dy85SXFMUjMxdER0Q2Q4YURKMmxYQWNo?=
 =?utf-8?B?VTk1OFBpQjBab3R5VXlzdUduUzZIbllIRWVQMWl4NVZFd0xzNDJCVGVnZEVY?=
 =?utf-8?B?akZHUDlKRXhhaTBqQjQxMUdNQnRBQjJuTVZIOWppdlI1K0hyYXpYd0IrSFFi?=
 =?utf-8?B?akxuM211QjUvenByMk1hWVZDQWQ2bXJtZytzdUMvUTVqZ3VJY1d2Qmo0YWF1?=
 =?utf-8?B?MFdSazdKeGpDUEg3TnQ2c0l6T09ueEllVmNLNEk3OHRqallLb2JjZUdUMGlj?=
 =?utf-8?B?L1pRM0hTaW9lazJpRHJmOHFkU3pPcEMwRTNCSVE2N1JXVlNnWlJCT0FhRnJh?=
 =?utf-8?B?ejRyT0lqMld6NFFNNXJhdXFJblo3dlFlS1E4SVIwajNhdjIwUVVQaXljZTlK?=
 =?utf-8?B?Z2owaUNqWmZwaDFvYlllVEVweGtmRUsrNUh5M2puKzNJOE9sTTdEY3Q2ODll?=
 =?utf-8?B?UUtBUyt1Umk5UTYzVm1GT3B1anVJSmVKL0NwUzdyNjc0RHVVZmFSbTZwcVhu?=
 =?utf-8?B?ckJFbUVvS2xpbk5EYS9QWmhGaE9vRFAzNzZrTDJ2WFQxZERveXU2QTJDTktl?=
 =?utf-8?B?bm1YR0lxSlNWK1NrMlZlaVBTTitxZU5pcGFaQmtiZkZ3MzFqL0kvSVJkM3cx?=
 =?utf-8?B?STlaMEhheFMzZWVCOGdTM24yU2pFOVkvSXpDUXRqUE1pYlpPbmRBY0VIcURu?=
 =?utf-8?B?M2VmMDJpWFIyamR4MlU0UVlIS2pwV0hpL1d3d0pTV2NmNVBkY0FBczdDTkdQ?=
 =?utf-8?B?QzMxcnJ2andmcW1WV2RSWnU4V25PR0xUM29QNFBjSkdNWlg3MkhBM2xka0Z1?=
 =?utf-8?B?UlhrZXFhNjdSK21KejZtSUdQVCt6aFJDVHliSmF5NzVqZ3FvSlQrMEFEazI5?=
 =?utf-8?B?Qk1heXRjbkNyNnJRK3Nua1pWVzV4Ylc0VzNrb05KNkpCdXR0T2FldHZ1dUlZ?=
 =?utf-8?B?NVRwYmJXd2pYYUYwK1VJejFXRkd3SVRNOFpTU0dOakxyUy8vNHRnMmNZMkU0?=
 =?utf-8?B?SWRwdHhCNmRBcW9tTjJjMFVBektVeEMxNGhSTThEaFFGcUdUcTVqd2lrYTJm?=
 =?utf-8?B?anc1dWR5UzMvN0F5QzhHd2hoRjJCYUMyVWlHNG0zU1A1ck4veXpJWUNzNEVw?=
 =?utf-8?B?NUM5MFBDdUFRT0YxaVZoR20yZGg0MmxuT2hET0FqOE9rdElvZ05wY1ROTFV6?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <101D889EF5A53849B802CC1F77E741CB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c563b0-d0c0-44a0-8d18-08de0189490a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 07:57:08.0669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81fjgf2WtGklKYYci2/2XGmq0zUSY7FoL3a0mNkzysjlJmX0XMD+5S/Y+GBUyjwqayHnx7OR7UhpbNS7DrsKZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9448

T24gV2VkLCAyMDI1LTEwLTAxIGF0IDEzOjU3IC0wNzAwLCBCYW8gRC4gTmd1eWVuIHdyb3RlOgo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jIGIvZHJpdmVycy91ZnMv
Y29yZS91ZnNoY2QuYwo+IGluZGV4IDJlMWZhOGMuLjQ1ZTUwOWIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy91ZnMvY29yZS91ZnNoY2QuYwo+ICsrKyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMK
PiBAQCAtOTczOCwxMCArOTczOCw5IEBAIHN0YXRpYyB2b2lkIHVmc2hjZF92cmVnX3NldF9scG0o
c3RydWN0IHVmc19oYmEKPiAqaGJhKQo+IMKgwqDCoMKgwqDCoMKgIH0KPiAKPiDCoMKgwqDCoMKg
wqDCoCAvKgo+IC3CoMKgwqDCoMKgwqDCoCAqIFNvbWUgVUZTIGRldmljZXMgcmVxdWlyZSBkZWxh
eSBhZnRlciBWQ0MgcG93ZXIgcmFpbCBpcwo+IHR1cm5lZC1vZmYuCj4gK8KgwqDCoMKgwqDCoMKg
ICogQWxsIFVGUyBkZXZpY2VzIHJlcXVpcmUgZGVsYXkgYWZ0ZXIgVkNDIHBvd2VyIHJhaWwgaXMK
PiB0dXJuZWQtb2ZmLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgIGlmICh2
Y2Nfb2ZmICYmIGhiYS0+dnJlZ19pbmZvLnZjYyAmJgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGhiYS0+ZGV2X3F1aXJrcyAmIFVGU19ERVZJQ0VfUVVJUktfREVMQVlfQUZURVJfTFBN
KQo+ICvCoMKgwqDCoMKgwqAgaWYgKHZjY19vZmYgJiYgaGJhLT52cmVnX2luZm8udmNjKQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2xlZXBfcmFuZ2UoNTAwMCwgNTEwMCk7Cj4g
wqB9Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdWZzL2hvc3QvdWZzLW1lZGlhdGVrLmMgYi9k
cml2ZXJzL3Vmcy9ob3N0L3Vmcy0KPiBtZWRpYXRlay5jCj4gaW5kZXggZjkwMmNlMC4uNWMyMDRk
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1tZWRpYXRlay5jCj4gKysrIGIv
ZHJpdmVycy91ZnMvaG9zdC91ZnMtbWVkaWF0ZWsuYwo+IEBAIC00MCw4ICs0MCw3IEBAIHN0YXRp
YyBpbnTCoCB1ZnNfbXRrX2NvbmZpZ19tY3Eoc3RydWN0IHVmc19oYmEgKmhiYSwKPiBib29sIGly
cSk7Cj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHVmc19kZXZfcXVpcmsgdWZzX210a19kZXZfZml4
dXBzW10gPSB7Cj4gwqDCoMKgwqDCoMKgwqAgeyAud21hbnVmYWN0dXJlcmlkID0gVUZTX0FOWV9W
RU5ET1IsCj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5tb2RlbCA9IFVGU19BTllfTU9ERUwsCj4gLcKg
wqDCoMKgwqDCoMKgwqAgLnF1aXJrID0gVUZTX0RFVklDRV9RVUlSS19ERUxBWV9BRlRFUl9MUE0g
fAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFVGU19ERVZJQ0VfUVVJUktfREVMQVlf
QkVGT1JFX0xQTSB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgIC5xdWlyayA9IFVGU19ERVZJQ0VfUVVJ
UktfREVMQVlfQkVGT1JFX0xQTSB9LAo+IMKgwqDCoMKgwqDCoMKgIHsgLndtYW51ZmFjdHVyZXJp
ZCA9IFVGU19WRU5ET1JfU0tIWU5JWCwKPiDCoMKgwqDCoMKgwqDCoMKgwqAgLm1vZGVsID0gIkg5
SFEyMUFGQU1aREFSIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqAgLnF1aXJrID0gVUZTX0RFVklDRV9R
VUlSS19TVVBQT1JUX0VYVEVOREVEX0ZFQVRVUkVTIH0sCj4gQEAgLTE3MTMsMTUgKzE3MTIsMTMg
QEAgc3RhdGljIHZvaWQgdWZzX210a19maXh1cF9kZXZfcXVpcmtzKHN0cnVjdAo+IHVmc19oYmEg
KmhiYSkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoCB1ZnNoY2RfZml4dXBfZGV2X3F1aXJrcyhoYmEs
IHVmc19tdGtfZGV2X2ZpeHVwcyk7Cj4gCj4gLcKgwqDCoMKgwqDCoCBpZiAodWZzX210a19pc19i
cm9rZW5fdmNjKGhiYSkgJiYgaGJhLT52cmVnX2luZm8udmNjICYmCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgIChoYmEtPmRldl9xdWlya3MgJiBVRlNfREVWSUNFX1FVSVJLX0RFTEFZX0FGVEVSX0xQ
TSkpIHsKPiArwqDCoMKgwqDCoMKgIGlmICh1ZnNfbXRrX2lzX2Jyb2tlbl92Y2MoaGJhKSAmJiBo
YmEtPnZyZWdfaW5mby52Y2MpIHsKPiAKCkhpIEJhbywKCkFkZGluZyBhIGRlbGF5IGlzIG5vdCBy
ZWFzb25hYmxlIGlmIHdlIGhhdmUgZGVjaWRlZCB0bwprZWVwIFZDQyBhbHdheXMgb24uCgpUaGFu
a3MKUGV0ZXIKCgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoYmEtPnZyZWdfaW5m
by52Y2MtPmFsd2F5c19vbiA9IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBWQ0Mgd2lsbCBiZSBrZXB0
IGFsd2F5cy1vbiB0aHVzIHdlIGRvbid0Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIG5lZWQgYW55IGRlbGF5IGR1cmluZyByZWd1bGF0b3Igb3BlcmF0aW9ucwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBuZWVkIGFueSBkZWxheSBiZWZvcmUgcHV0dGluZyBk
ZXZpY2UncyBWQ0MgaW4gTFBNCj4gbW9kZS4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+ZGV2X3F1aXJrcyAm
PQo+IH4oVUZTX0RFVklDRV9RVUlSS19ERUxBWV9CRUZPUkVfTFBNIHwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVUZTX0RFVklDRV9RVUlSS19ERUxBWV9B
RlRFUl9MUE0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+ZGV2X3F1aXJr
cyAmPQo+IH5VRlNfREVWSUNFX1FVSVJLX0RFTEFZX0JFRk9SRV9MUE07Cj4gCgoKCgoK

