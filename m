Return-Path: <linux-arm-msm+bounces-67750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44687B1AF77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7396189CEFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 07:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FB21D5AB7;
	Tue,  5 Aug 2025 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gGvgtYVB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KQW0b59a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306754594A;
	Tue,  5 Aug 2025 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754379583; cv=fail; b=gVonkeba3aetROOshl5PbCfh2Iop+1dNjmug4+mwqV7WQUeJsKRRapkuYR0iQrg/0x6ZEa5O+kNXXZ24fcq4cS4UMBIkrN8i7fttiYZRmhvzFqeivokJ1mHz1JpANFPZDKuhH5bJCsFXCI4sDUfb2soL7OqnZx7nxPwDIa344ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754379583; c=relaxed/simple;
	bh=pV4ORdCtq7b3nQr7Q52rfgGDSDvtVdUHu6Zxr7wtdog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fvT8K2eVseHanuhuRztvHy8y7NsjzQTYrvK+1E1iyuQ9WZCsdnaFMuj+8A0O9zMT1B486bjM3IEh8tL/vFqjU+1Xh2RNQn3FzpgaJIjFW0ut3UezLHUfI4H34RWYIgkoPcADXx0TesNRUFCjoobokNuLgYZ1NAMZ5wskJgOzarA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gGvgtYVB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KQW0b59a; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 52f84fc871cf11f0b33aeb1e7f16c2b6-20250805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pV4ORdCtq7b3nQr7Q52rfgGDSDvtVdUHu6Zxr7wtdog=;
	b=gGvgtYVBB40YPtjvprnuZlErnNy/14jdbemLj6EOmdJKaf9lvvoWpgFQ5Yej/WWAlkpZj7oxrxL13K0e30bF9KTD+Ebv+iZw0s+/WJtMqBBe+66Tp9Na/MwEMQ/mFCRajysp6vI2JgGMFka04cvBESWg33AgT18P7pGjc3H/9gc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1a9004ce-e22e-4302-9c84-7828d5956312,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d18e850f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 52f84fc871cf11f0b33aeb1e7f16c2b6-20250805
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 71958349; Tue, 05 Aug 2025 15:39:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 5 Aug 2025 15:39:30 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 5 Aug 2025 15:39:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NorE4Ya5zhXXU9oyy7Bz8biUxuTDcbK0QyWSdaS7MPVjuL333yeCJyLecbqvBt6QfMzftFiRwoC48+aQHnVT+nhlzsDa+yrawbQFKOPEG15G4D22pPihe50vE6r1uKUprngxDqcKxyDJfye3havNZjLPXl8AEE4df21zdi4y+1ujrCYL52Uz4vqc/WqmTh7LH1HRw7Yp4vZHLGILhQ5iC9V00Watttga2uRvd3FeVtrSlZveMkBtX89OBP/823zoOleBfmEN0Ow9ToFH+kv7I7ErqzG0PYA29SwhPbkQJvQ6mTpSDDP1dV7g0q78lXvEO+/r+KeIU5ITfy+AlRQBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV4ORdCtq7b3nQr7Q52rfgGDSDvtVdUHu6Zxr7wtdog=;
 b=r42R9fde8oAy1Cx2ZUl1CuKsaotBiChuu5utyTLGqfyxlPjMZHI1vnTOjSZGO1sqiscfjb1aO/byjzx1szsmZF9BiWHOO7vJz56qePIcpBHi20ekMJ4t5iF/q3O31DTlsSIb4+cGZi9h5n57LwAN1WldQY+jpxVlPmuKzVwxV78Eq8fGpNW9qa9SmmVOQmGI2luuJVEHt/M+mH7UQH9UsbinYzJvoZgOMunSiaE8MHPHUjYs3j1I+fV6hcMcVsKPspm9Bn/oNN1nUC8SuFk67mUbf+DfANoSnIaX/vIfg1zAWQXsLi+mzUvcAQ7R4Ezlxx09mIgATzBEgvqb/tjM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV4ORdCtq7b3nQr7Q52rfgGDSDvtVdUHu6Zxr7wtdog=;
 b=KQW0b59atsGGF89SJi+5l/kAOcrmbRGuhyQHsOe7nHqcZYMqC2KiXdovR+4lQhfMP03kyUWHe1NWRzBFzbcf4kwzxvwZeQcwXfL8ibVUKLgzNhYHg183hr371uCK0IrOjWReLGe+GJkRFgJXHHZR/cutUHrtTO5pwbwzEHh9Sy0=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB8587.apcprd03.prod.outlook.com (2603:1096:405:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Tue, 5 Aug
 2025 07:39:28 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 07:39:28 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	=?utf-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
Thread-Topic: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
Thread-Index: AQHbyvF2qqEtS3Zve0iY94J/r6+jLbRC8tIAgABfYwCABCtIgIABVyGAgAI33YCAADD+AIAHVo+AgABQ+QCAASJqAIAAGtaA
Date: Tue, 5 Aug 2025 07:39:28 +0000
Message-ID: <1e7dcb2c31beb3ea884879235fb70270fb483731.camel@mediatek.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
	 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
	 <1989e794-6539-4875-9e87-518da0715083@acm.org>
	 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
	 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
	 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
	 <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
	 <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
	 <efdd6dfcca06680bedc02a70fae1b35485083250.camel@mediatek.com>
	 <81e403f0-51b4-4efd-a06c-c6d7b02802dd@quicinc.com>
In-Reply-To: <81e403f0-51b4-4efd-a06c-c6d7b02802dd@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB8587:EE_
x-ms-office365-filtering-correlation-id: 9221c894-6eba-426e-ad61-08ddd3f33558
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WGE3K0dIZDQ1cStKTUNTVWdlcUVWVVhEZzdvakR0ZlZDNTRtK05KMWtWdHhw?=
 =?utf-8?B?Y2NJSUtkemVuT0Y4cmROTUc0d2JYcm5OL2dvOERyVlBKdzdXWVhpN3dxMDlq?=
 =?utf-8?B?elpLQnJnNGpWbUUxU251cUVqVFpxRjVHbGRjZ2E0VklVaC94cXlDRFdid1RY?=
 =?utf-8?B?MTNEZ1dkVmRTTjkvTFFoWjY3VkE3ZDdTVjZCWFZycERLVGF2cGdDS1BLUGtj?=
 =?utf-8?B?czhHdWFrdGpkVFBlWWNrUkZBMi9jemU4YkpJdnprTWIxUXkzSlc3cEJkeHc1?=
 =?utf-8?B?ejJPRmU2cllYcklURmZaRVB1bkhTdjA4SWN3WE54dDl1cHlEZUFHQUJEOTZR?=
 =?utf-8?B?SWQwbW5NSW1nOHdFYmwyaU0zbXJMN1UxRmpKNzYwbnRZSENXUXVyQm04OC9j?=
 =?utf-8?B?VjZoY05ObElobHlBZ1dsTUl0MEpXd0RNbDBFMVhDcnJWWDhQTHpqa2pxU2I4?=
 =?utf-8?B?M1BVMVkrT2lrV08yUWwwT1VmSVpjM2lmRXVBWVlNeFI0bGUrcGs2aElpQ0NQ?=
 =?utf-8?B?ZkRVRytBeXFualBkM1FKNEMrMnBlOFNOaGxiTEx1dHBucU5FMm9vdnZUdllS?=
 =?utf-8?B?dys1L2RNcTdrbkhZZ1UzaXl2QXVsdTM5Wnl2ampLUzFYRkZuYkJqOTlBK2Vh?=
 =?utf-8?B?ZHNXTTdiTGRWcVpObVhTa3RTZHdCOHdFck8yTkpjeCs0M2lvd3J0dldPSTNC?=
 =?utf-8?B?WXM0V2hLQTBtbTJWeWFXK042MW5WeW9MVEw0V1BPS2gxY2twVmtsMnFYdDVk?=
 =?utf-8?B?dVhaMk9wRWhMWTFzOGVJR2dEdWVMenhhV2JIeGxLVnU2ZFVRWlFmcFV0MGo5?=
 =?utf-8?B?aGd2UW9LV2xJMFo2bXZqdTczVDNobnRJUHhxeGJiQStQZ3hHZElRcldhblBE?=
 =?utf-8?B?WjJScDFUUmh1dTllaU1UMTVDZW56dWlGMFZHVC9jRkgxTStnQ1hDWHBMYTBw?=
 =?utf-8?B?WmN5WjR1S0dRZ3FuUnV6dHVUUEd6RVc2Qi8xZk9iREhTVHNXNWRhQ3Vka2VO?=
 =?utf-8?B?UU92bGdTbnZna0NibUFZeW81ajJFU2FRSmJreFdxQzlMOXNERkl0REwzeHlF?=
 =?utf-8?B?cWdRcXIzM0JGUnIvMkRvc0l4VFlBaGVvTVhhUmIzNFp6eU1xcUZkL1lYemtz?=
 =?utf-8?B?U2dBZjIxNFJIa081Rk5WWmpTTkFHNGRySGg3KzlzbnZvWG1WQ1RpR3FRTGhi?=
 =?utf-8?B?VGpuQ2d3RzBJV2lrNEp4NFVEakllK2x3TU44UTVLYlFTaGZWektXLzh1cEpx?=
 =?utf-8?B?TkQ0clpzZTB2a3NObWFaNUEwYUNleHg0WnBVdG1qY2NxYlBGVHVEWnduSkp3?=
 =?utf-8?B?VmhFYTZiMVhTSTlmalpWYS9FSmRLeUtnVWx3MVVLbVh2OXRXMVJ6dGNoSlpq?=
 =?utf-8?B?MExhMXZIQkRFUG5tN0ZYWFJEazJyYTdZd3VJM05oZi9vYkxNanlOZmI4bWtC?=
 =?utf-8?B?U080cUs3VG10UktONmwzekVxeUk4R1dQd3hpN2VqRWFrL1IwZkljWGpCdy9O?=
 =?utf-8?B?SnRURDJ3Z2pZakpmblJ2TU9hcjhrYm5pR3hFaldqZzVUSnFzcjVJOHNFV09J?=
 =?utf-8?B?MldTdjN0VEN5bURtMzY1KzQ4VVhrMERSTmlPRS9RZzRyL2kzSnBtbklBRWNQ?=
 =?utf-8?B?K3U5WEhlUVBFallFZGZ3RnhZQXZoTWVQVTVxLzk3dk5Xa0lhZFhyNW5Ndkpn?=
 =?utf-8?B?UTdGRlEzSWtkVjlnVlFuL0dmR3ZnMEp6YzdJM1JQaGJTVXYxTkR4VnVUMTFr?=
 =?utf-8?B?OTRBZGdPd3Q2b0QzZnhyVFNZcmZkWW5oSUJ2UEM4dTd6MXROZ2d3Y3BvcGV0?=
 =?utf-8?B?Y0xFRU5rY3dpRjFFTWtVclJrd3psZmFLQXlNcW1FdkdXSVprMi96NXhsUmFS?=
 =?utf-8?B?Q3dkdFBNN1B0eGR0UmxQLzJzZXdackJudDF6VklaeGJwQURIOVVwSm1yOThn?=
 =?utf-8?B?MG1hdDF4a1hwTnlTNUpxVTRRSDJDZGFuMWxaTDByek5jMkl5VnliQmhNNVBB?=
 =?utf-8?Q?gw3ZwIhYI9KvAjtXFZtCIh5aSVfI5M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTNIL2FYeU4vSWdEU0tSa1VkZlF3TDJ2bEh6dGdhcFJGelp6U2dEdCtjVDBo?=
 =?utf-8?B?THY4akRodU1qNXlwYWxGM3A2M3BGaTRUS0tXWnRPRWRCTnRjTnZhaGx5QTRC?=
 =?utf-8?B?UllKMEtDVEtqQWJ6Qmc0VW5RVC9jQlkvUUw1dDNwSGRVd2lzYVltQUZ5WGly?=
 =?utf-8?B?eTlvOW5xQ0EyTkVnS3hDY0UwY2Y5alVmTHYrNllvNUgwSmdxTjM2QXlHaGpn?=
 =?utf-8?B?Zk1RVmt6OEVDaDRHenRKYnFFZDFwbzZLSVJZZzlXR25qbTFDdEZVcWd4UjBm?=
 =?utf-8?B?MHNtanY4Mkhrb2FqT3A0elo1ZkpNRHhHVlFjMEdINm9IbmF6MjQ1SGdNL3Bx?=
 =?utf-8?B?WGJxbnliK0dRMGlHdnNHUUFCNlVNeThQQVN0Q2cxeDB3cWRZdTJZczd4UDYx?=
 =?utf-8?B?TkFkOFZhUHdMU2YydkFsVEtid3QzQ1huK2VqbkVwVTFjRUVISDRHMzU5L0Ru?=
 =?utf-8?B?OWFMdzRPYzIvRjVoSzdDNEVpUktPQWJIV0RZR2JrajI0V3U2ZGVyMzRnWGpO?=
 =?utf-8?B?anlPeURweGlCZURRS29xZUpKT1BvaHFwZVZOYSthbHlxVWVmVGpiRXB0T3dV?=
 =?utf-8?B?QWd6SFVtemc4UXJtR0w3aTF2RTc0MGdidS9GQktsZnRoM1ZEN0xrYndTTk81?=
 =?utf-8?B?UWRlSGJxZmNWbUxTYVdvOGJRSGpTdjhuWlhnblhXdUs0WkRLTXZEQTlUQWtT?=
 =?utf-8?B?Y01EamRuclIzdzVWcmExdkFxeUwya0p0RDJJYUdOaGZZVFN0dEJtZ2c2N29V?=
 =?utf-8?B?aVJjUEowWTJUNXNTSnFDYzZEQTl3bGhBOExxdG9WQmxNd1ErZEZqZWhGMzNT?=
 =?utf-8?B?LzBRakRvZVZzZXJrZ05jdTVzM1dOYjhOR1N3M3VYeVJqVjNTcmJEcndxcity?=
 =?utf-8?B?VzM2Y0haWHlxS0NVOUJlWTEySlc1SzZ0RUxKMFArZm1mNXBwZTR1RFgwL1hz?=
 =?utf-8?B?UGlhampqNk5YZldhRzJJMjlSRURTVndvb1ZqWGFDKzZ5MDMwNlpNZDYrdjg3?=
 =?utf-8?B?OGp6ZXFONzZMQXdtV3Y4VDQyVmlzUVZmUFdTZ0IyUlNNVjBFemhLMkpIWkZv?=
 =?utf-8?B?dTdiajI2azhZVG04cmJ2VjBXNU1XOEkxdlY4L3h5SWcwMzQ2VXRPUEx3YVJO?=
 =?utf-8?B?dGo5VkZadzRjTC9qQzA3VzB1QzZRZi9hdGd4M2xncldTSDJwOU1ISnlBUWxX?=
 =?utf-8?B?ck4wNlpVZFlrbWw5N2NvRE1QcktCL2pxNTJCdnhOamIwSHQrMU8yUFJMNXM2?=
 =?utf-8?B?ZDBLMU84Z1NETVFjWGxXWnlGbTEydUdLMi8vbjg5MUZVRlpkTitBUDkwcU1C?=
 =?utf-8?B?S3VkbW5aOE9US24wSWxsemgyVlIwdEFsejM5UDRVN0xHNWUxYUkyQmZoSFlv?=
 =?utf-8?B?VXdKek05d2NBNVZqL29HVGw4cmJtcnZYbWhqdVJ5OHJoRVhEdjBmYmlyb1Bw?=
 =?utf-8?B?amVsOU9JaHRqTENXVU9GUUxJVkhuSzIvV1h5ek9BWWVHQ0RwekREb1hBOElH?=
 =?utf-8?B?bDZvalBpbzErbHlXUWlDbmtJZUdzYUQyWm5GNmNDVzNYNjZvTDBHZE5ESTVk?=
 =?utf-8?B?MTR6SE95WEp5c1JTaitWTFdTVERwYXczdi80VkJEL0t0VnltclljczlqaXZw?=
 =?utf-8?B?WGs4Z3N0SUcyck1Fb01HSkprMWZ4K2Z1dlIvVStDN0Q4SVVPb0QyRGtaSFdi?=
 =?utf-8?B?NWN5dW1hMnpyWE0xanloOFh2aWpZUW1JdWE5Rm0yVFBRd0RQTDdnRHVteitT?=
 =?utf-8?B?WkJ5TWdUTXdCOVZkMTZTOE1EY21qNzVLbStuTVdVR1JkVFh6R214V0FKWGRQ?=
 =?utf-8?B?Vi8vZ3hhNCtoMlY3anZBWkF0bHhTRlcrM1ovVk5rNWFEVjBkZzhvTTFzYkl0?=
 =?utf-8?B?bUsrWVlNU2ZncmtxelN5L24rYVFObjdTS012cDhKMzBPVmhSbldxM2FhNFBm?=
 =?utf-8?B?ZUdSd2htOHpCQVc4VVNaOFRmaVVVeHQ4M21tQk95OTNHdW5TNTBndk5USVcx?=
 =?utf-8?B?RVcxdGQyM0hGekE5VHc5ZTI1K2RGWGI2ZnRWbHZTQjhCTkFwck1tRzFCaFZ1?=
 =?utf-8?B?ejR6bzFrV1l2RUVxejU5aWErT1J6L3hVc0R5WjBMT0VCQ21HRnZFMHJ5ZWQz?=
 =?utf-8?B?cW9EZGVJdHlVVVhFR3VkK05nZGllTU5SWjlvRkNGTXZuTDBkSXUzamdmU25E?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9523B7A8807B7B4E936F516225646769@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9221c894-6eba-426e-ad61-08ddd3f33558
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 07:39:28.1489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3uhKuzqU0FNC/6aCJxlEUNZlkK2qBODp6JnDgiLvR6tCcf9K2Xc4Jkw+J5ltHU0zjEGygsDc09h/VcoT6FrFzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8587

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDE0OjAzICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBIaSBQZXRlciwNCj4gDQo+IEkgc2F3IHlvdSByYWlzZWQgYSBBQ0sgY2hhbmdlIHRvIHJldmVy
dCB0aGlzIHdob2xlIGNoYW5nZSBvbiBicmFuY2gNCj4gQW5kcm9pZDE2LTYuMTIuIFdpdGhvdXQg
dGhpcyBjaGFuZ2UsIHlvdSB3aWxsIG1lZXQgc3R1Y2sgaXNzdWUgZHVyaW5nDQo+IHN0YWJpbGl0
eSByZWJvb3QgdGVzdCBkdWUgdG8gcmVxdWVzdCBxdWV1ZSBxdWllc2NlIGFuZCB1bnF1aWVzY2UN
Cj4gbWlzbWF0Y2guDQo+IA0KPiBUaGlzIGxvY2tkZXAgcHJpbnQganVzdCBhIHdhcm5pbmcsIGFu
ZCBhcyBwZXIgbXkgYW5hbHlzaXMgYmVmb3JlLA0KPiBUaGlzDQo+IGlzIGEgbWlzanVkZ21lbnQu
IEJ1dCBzdHVjay9jcmFzaCBpc3N1ZSBpcyBhIHJlYWwgaXNzdWUgd2hpY2ggaGFzDQo+IHJlYWwN
Cj4gaW5zdGFuY2UuDQo+IA0KPiBDYW4geW91IGFib3J0IHlvdXIgcmV2ZXJ0aW5nIGNoYW5nZT8N
Cj4gDQo+IA0KPiBCUnMsDQo+IFppcWkNCg0KSGkgWmlxaSwNCg0KVGhlIGxvY2tkZXAgd2Fybmlu
ZyByZW1haW5zIGEgcHJvYmxlbSB0aGF0IGltcGFjdHMgdGhlIA0KZnVuY3Rpb25hbGl0eSBvZiBs
b2NrZGVwLiBGdXJ0aGVybW9yZSwgdGhlIGxvY2tkZXAgaXNzdWUNCmlzIGNvbnNpc3RlbnRseSBy
ZXByb2R1Y2libGUsIHVubGlrZSB0aGUgc3R1Y2svY3Jhc2ggaXNzdWUsDQp3aGljaCBpcyByYXJl
IGFuZCBvbmx5IG9jY3VycmVkIGFmdGVyIHRoZSBjbG9jayBzY2FsZSBjb2RlIA0KaGFkIGJlZW4g
aW4gdXNlIGZvciBzZXZlcmFsIHllYXJzLg0KDQpUaGVyZWZvcmUsIEkgcmVjb21tZW5kIEFDSyBy
ZXZlcnRpbmcgZmlyc3QgYW5kIHRoZW4gbWVyZ2luZyANCnRoZSBmaXhlZCBwYXRjaCB0b2dldGhl
ci4NCg0KVGhhbmtzLg0KUGV0ZXINCg0K

