Return-Path: <linux-arm-msm+bounces-47981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E25A3569F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56F91635B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96EB18A6B2;
	Fri, 14 Feb 2025 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hYKjK/IU";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Fy87ygRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF122753E8;
	Fri, 14 Feb 2025 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512494; cv=fail; b=XDEX9Qi5qYxJIaYZ6MpPIikISAfW/zGh/8o0rsL4ghAeTXMuHt6Fej1bK9Z+fCtGG5SQmbGIQKUT4PSsL/wQj2MDxxbetso2QQUPn+k4gO+AD5fYyssEG2fujxE1Dx43Q07HSg6XI+yF9WFRKbQEuaNnNAOrIwW61yDc9cCdg5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512494; c=relaxed/simple;
	bh=BZ9rf7BzeYZ+rjCT2l0fTM/FW4gFY3FZ7TxK5tOcUUA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uxYU/+f9E4WWBTSNUP9jqAX5e9PkFEeK2aLACCHIXZwO+89qPTOTtmQ0tcsf3fncPSbtzuVEpzRO/LZCdAdc7s7PiobE9tilhBgGd0GiVAgpFHaLKWwpHfNZGXyfBv8lxNso5z27xZ1SHg0b7eUNbRuqtpTdBRqrjberfcUuDPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hYKjK/IU; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Fy87ygRW; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3148b854ea9811efb8f9918b5fc74e19-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BZ9rf7BzeYZ+rjCT2l0fTM/FW4gFY3FZ7TxK5tOcUUA=;
	b=hYKjK/IULQcEbgekMi2knSOa2VBn1dDr/EnMEvmJdjHHVulXVzNbZvKtntKmZc2/XVo9ix+Ad2GYvPr0Btcx3Akk0QXQCJLdPAirtU3V17XP2YWdSkNLvQwXkvgm7f7f2DDZldyZOS+xIBYKOQsXbklMYjPRUw8MVJX3cV/Gf98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:088ab18e-1154-4534-9fcd-a22c975d89bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:743075a1-97df-4c26-9c83-d31de0c9db26,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3148b854ea9811efb8f9918b5fc74e19-20250214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2057068763; Fri, 14 Feb 2025 13:54:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:54:44 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:54:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leh16Pn3ZrqU9+uCb0DN5BvZR0GgE1Ed5717AF/vM9YTmhUyKisKpv9IhF/xfq6tIQQcx5n0XEpaw2SGP4yhgwV5PpPdZjCapROs9vJxu3D0wiPklv57O3aB7KRl3gMa1PseWgZrPPwvNZneTZV7W0Yb7zlpsxgbzgS1U0SWw/p8o4vqhzIjNZFQEDOu1Zjf4gF1QsNNP/O3YxkHIgX6PWmUBjjww+sEzEL+N9ixLTBDHH9m3M+1AN3Jh7OXs432nLKspsqoBkPB3SgvDux0PFNFh3ZImynyeaQa6VkiujWI3hIV/2r/yfXfZoLOEZIsCP3Buoyqk0cACvCNFvUE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ9rf7BzeYZ+rjCT2l0fTM/FW4gFY3FZ7TxK5tOcUUA=;
 b=qXoystBTC/ZNlJooh1R/EKdrtMs+Z8bn6gQgL5KTq6Nuc4cNai++ygXJIBggYVBSf6+wOlPlXn4SswAr/8ACmq01Si1WtOw+9p44xYnsj9O4RZHt8hmEGbgF9qP0SZIDpzyQADMfluVpZVlZpGZKxYu2ORQkPDa3Ueaa7Ls51rmT8uA9zeg+kvjDXwG6nyyy8YPHEXqclzFYOg+He1QDKlR7rMh3iRHb1I/HwYiIMxor47a+dc+MST2yHyLowwA8G9+cCjtERLOfG6mx3oKgRcgi3CPRPPpToVKWF+bcv0+KXIr0gGbh2qIb96yXx2fq434nXbCZN1FDQmLsuGsuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ9rf7BzeYZ+rjCT2l0fTM/FW4gFY3FZ7TxK5tOcUUA=;
 b=Fy87ygRWSn3RHvUXPZM0a4/crJ5jeofiGmmF7+im+6jaU723xiT2yWo4At5v4lVwgBHRzDQlyOb6hsn1hBnXbwtwJBBDpfu3Jvr3fbxE93OuNk8p0+SqToO/ZN9h0gR34GpHO8Fx7WUDOKRPJBs9xXo2+aIxcLdB1c/eGD5M7Qo=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7319.apcprd03.prod.outlook.com (2603:1096:400:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 05:54:42 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 05:54:42 +0000
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
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vop
Thread-Topic: [PATCH v5 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vop
Thread-Index: AQHbfe3Yf2w15HM1qUqj0t4bYR02WrNGTgYA
Date: Fri, 14 Feb 2025 05:54:42 +0000
Message-ID: <90eee6e66b0873d2232f29a1e57a092aca442dd9.camel@mediatek.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
	 <20250213080008.2984807-5-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-5-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7319:EE_
x-ms-office365-filtering-correlation-id: 33412e20-cb6e-401f-9625-08dd4cbc13d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VmxudGgveWVtY09yalZmbUpBV0VjcTBCVE81UXRiYTVZc2lkVjloV2E2QTlZ?=
 =?utf-8?B?WnpsQmpHbUFJazdoNWV0dmFYYmF2L3d6bWdoaTdEMG1IR2xxYkk4U3JXTE9R?=
 =?utf-8?B?Zk1QQzlZUStkN3lpdlNkUUNjZkdoUTlOZHEzSlVCNERYVGZaUHpVN0tTMmlj?=
 =?utf-8?B?Z1oxdnFXYyt5WW9mVFk0OWFuL20vWFh4QzgxcnYweko2QnExSlJwanljb01l?=
 =?utf-8?B?ZVIxblg3ejJHUWVHSGJSRmcrbzJObjlIYXlJN0FCbVU1YVJtVjBpWkFFUWxi?=
 =?utf-8?B?a2hJbnZ6K1JmOVBjL09YRUJVVHRlSTM2d0NqU2RoZS9wcjIzWnlCTTdrc0Z6?=
 =?utf-8?B?OGVhYXBTbzhKV0VwVGE5SE90Zi92cyt1dFVtWWtrb09KYkgxQloybmdoNHV4?=
 =?utf-8?B?RlZqTjIwN1V5L0hjamdManlpVTJYdUhEZit0LzlkTCtKOGVhQXBNSTd2Uit0?=
 =?utf-8?B?b2ROalNEVDJvTkdqbTBlS0czUlNhbXRRaHJSVmtHYlVBSUZOTW0yZ1FvejR0?=
 =?utf-8?B?ZmJyOXlRYnhScmY2ak5ya0RUcElMUlR4MHExamVkdG4wZXd6cEduejFsdlZN?=
 =?utf-8?B?NWNSWlNlSTc5bDE3NDZYa01XSEJvZkN4NWdCbnozSXdyTXp1SVFFejAxaExs?=
 =?utf-8?B?c2hvK29oTzVjOU5HYmlWS2s3NzZBM04vRkFBdW5jL0psQ2JRcEdqVVlkNmt0?=
 =?utf-8?B?akUvWFhOSnIzNnBLZHJPWkI0Zll5T3J0cU80K0Q3Qk5YRFZiTzR0ZkdoMG5H?=
 =?utf-8?B?S0E0cFpJTkMyMzRoek1pd01GeXIxZjI1THNhUGtlYnZ6dUtFZlpOdEtjYUM5?=
 =?utf-8?B?YldHSzJYdTJRWVArUXNHelJEUm9WK051Zk9WaHphMTlieEdNVy8zNmVsUW01?=
 =?utf-8?B?aGpzbFVjU2RNTnZnQk1TM2tiY1VWMUUwUE5yaEFYSFJRRmZOek01RldTSUNq?=
 =?utf-8?B?ZTErZjhmQk0zMU9ZMnlpbHVtaXBJSGVLT05NSHJwM1pZZW1CYjh5bUd3Qkwz?=
 =?utf-8?B?aFU4dmJXZ2pwSlYwY0ZYTHBNTGRBdXlpMzRMUmZrNFpYZVFvcy9VQW5PSmVS?=
 =?utf-8?B?NmFvTUZXRUIzS2t0ZG9zSjROZVhHL29FUFN4Q0NSSHZCWDdIdkxPTG94Rk5t?=
 =?utf-8?B?WmpSSktyMDBvRWVwV250dXBpckVRTVh3bkFsWFY1bjBHTlFJUzNFb3JETC91?=
 =?utf-8?B?ZTQ5UllZZEhmdUlqV3FMQ1h0NDRVandOd3pmWDNacm0xYXk1YUljM2RZNkxh?=
 =?utf-8?B?VzNiS3VOWGJ3K2VoSFlGcW41NE5OcXJHZWZPNWZYK01JUURYbXpZNXVuZ0Zh?=
 =?utf-8?B?V3REb1JIeStYeDlmcU16aTJ2OU9qeS9rYnpFbTREU0tIVGpZMmdid0RGSm1Y?=
 =?utf-8?B?eCt5enk1YjhubnIybCtOYVBLckpnRnRzcGo0dUdaYXJXSEJ1dEIveDlQdzln?=
 =?utf-8?B?UmR0cjlGOCtOTGIrM1I0SlF6SGlIM1N3MFp5akttdHc1NVhYREV6SGlNdVVy?=
 =?utf-8?B?VVFEeFkvM2huMTJldC94NUNTRmRTLzE2MkNKdjhoOFR3UW9yTDBBZGtzeGUr?=
 =?utf-8?B?MG1rU3lveTdRblV3RnBFZWI1RWlhbE0yVFpnckhsaFJOVHJDcXpGelFBQWhu?=
 =?utf-8?B?MktHOXFCdWNYOXdpL1lZdmczVkRDMXBiNVcva1FubEFFTWhIZGpoNExFSVhG?=
 =?utf-8?B?RGZHVm5aK1JYN21EWDMvZWxxakNkdkhsUlVsRm0rQk45eW50ZkZ2MVh0dnov?=
 =?utf-8?B?b3YyR0hPd01nMDN2Z2pjVGUxSzBCc3BjODlEOXFUWDA4OVhhS2NGeTNYbkYy?=
 =?utf-8?B?TVE1T2w4THNhQnpHa1pKOUtzS3U2Skp6MU9WYld5OVM4SThpSDh0eHcyazdO?=
 =?utf-8?B?RE5pdkcwTTR1WnJBNExSY1ZWS2NMamVCZkdUZWZEMVdYSVhYU1ZzeEVWOEpI?=
 =?utf-8?B?RGdNUlF3Q1BqaHNSVEdXQjJHVTY0eUE5bkJpS0s1UjlWWjZ0RzN4QWdHaXp0?=
 =?utf-8?B?UGFXMzl5WVdnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRiUEM1ZFpqWGRzN1licUlsSldrcGNMaFBuVnp3S2o0Z2ErQzJ3TC9TZVNa?=
 =?utf-8?B?RHh5UDlEUHRwWEUxODFyZmVyNjhTQW11ak8vbUxTZW1TTDBVbTdINk5qUVhB?=
 =?utf-8?B?UzdDR1VxOUhoNXNxY0pNVVVLZnRYT0JSMzFyRlc2Vlh6c1Boc2xQa08ybmYy?=
 =?utf-8?B?T0FDdXVXOVhUVVBuYXNuYzZoc2hPdWw1VlFwSElMVTh6Z2hRakdIRlRPa0Jy?=
 =?utf-8?B?U2dmcXM3S1FReXBNZ3JwVlR6WHQvcWRnOEFSSzRYVWlPRU04dnlOT0xLbE5I?=
 =?utf-8?B?Mit0czBERmdHM0pscDlGNkhKM1R0dTVYVTN2UU9Jcnd2ajliMVNveUVSNEcv?=
 =?utf-8?B?OUo3dDFoNmhTbDlCMDR4R0hTS0hOWTJUdkJnaU9LRHRMNlpDdUpWYWxFUlZP?=
 =?utf-8?B?V3FVQ1hRRU1FL0E5Y2p4VWFmWmFjNEM5T2VRdzVLOG9uYndHTk1Jbmk2aVcx?=
 =?utf-8?B?blgrbVRvL3RGSXJkNmtuQ2M0RkwyQ0kyUlZkZlY3Sm1tZVhYRjlENldJVlla?=
 =?utf-8?B?MEVvNUVwZ3prV1pmUTZra2YrclhmanFITlNHaGwxclhDVVhlZnU2cjEvQjVa?=
 =?utf-8?B?QkFOY3ZNRW9IaDBaeHpmdldoWWhad1I1Nmp0OXNObXhnbVFJcGdSL1pSSXZy?=
 =?utf-8?B?UDZCMHEzTHExWktkUFdXcUYrVm1xcFZUbzU4OE1nTXFKaEQyUDJ2UVBVd0cw?=
 =?utf-8?B?VE5CRmRLOUhLTGxpQnZ1L3BkaExBU2FaSDliSCtMUVp6S3REeit2UHc2dk1X?=
 =?utf-8?B?VHJSZFdGdkNUNXZpOE1TRXNpQjBrUkgyUFpkZVNTMjE0S01JOW1OT0ltRU5z?=
 =?utf-8?B?NjZvQVFEaFFFS3NmRjhxSXFXdlBmeG9jYm0rU3pzb1Vsd0c4QlBucDVYeXlZ?=
 =?utf-8?B?ZGl0YjNXR3ZzZjc4U3JCUGhSSkdRd0RaOGJJbEQ4R0I4S2lkVUpQelplVG9J?=
 =?utf-8?B?RGZVMEJ2RUwwd0VCbUVUL0J3VmxmRnFhMloyMHNHWjk2SitEeFZjdEZvNjlJ?=
 =?utf-8?B?NmIyNEVFMVQxZlFwdlV3RE03YUkyN2gxQVdrZ1BaRUxVdnV6QlYvK3lqY1BI?=
 =?utf-8?B?ekdwajRoYXlUeFN3NkdXc2QzUlovRlkveldocEZKRzgzTDA5VjIzRXFmT1JE?=
 =?utf-8?B?MVA4ZnVPLzNVcWZNbkV3VTRjM0hhb2tDSHp4YXZiN2pPOG84V1FBb3I0ZWVF?=
 =?utf-8?B?QkxZVHB0cnZSYUJvSElKS21KWHJsQTBscTR5b0J2TW1kY2ZtLzNuSkpUWTNP?=
 =?utf-8?B?SlhKdThCaFkxY2J5RmFQMW5kb3N1M0w3aG1uWi9yQk1IUmdnSHFCTlByd0d2?=
 =?utf-8?B?bVViamZZaVZYbEFGeUsrQk1mUURnZXZFQ000Z1pJbmRFWXJPaUFhWXdBUnRi?=
 =?utf-8?B?VW5xSjVpbVdvNSt0RmlDdXNGVUZnMWxodXA2RzRZZVdyakZnTXNKVjVIMXkv?=
 =?utf-8?B?UE9qWkNkN1lxZldoMXlTZ29KZ2VPWUtRVlNLTnkyYklmZ25FUi8xNDBWWUoz?=
 =?utf-8?B?YldPUkxRMlVHUnIwMktOaVhsMHVFUDlQMmRBcmNFem9jdS9HY0pwVlZNbDBL?=
 =?utf-8?B?VXFsSG1iL0lyQUt6NXZqWmlXWVlMNFlRNFZ0QzQwRVBRUC9vS2dQeFViN29U?=
 =?utf-8?B?MkxhZ202b3B0Z3NwWVI2S1RlRElNVS9JbWtsdDdMaVBxR2Z0VnA2Y0hiWHI1?=
 =?utf-8?B?WEVTTnN1NEhNSjhpWXcwc09JalUraytjY2RHR3BCcjhkb2lWbmtkZi9XOU9n?=
 =?utf-8?B?Q1ZraWxDb3U4dXN3b3UxaTJYYzFOUW5EeDNGMnNaa0Q4WDNrNVhBOHhlZk1Y?=
 =?utf-8?B?WVQ5QUJ4UVBHWnZBWXBjeG9sb0FLa1J5bGd6dHdhSW8rNWJlWW44SEg4aFVC?=
 =?utf-8?B?Ymc1T1E3NERGME9YWE5xRkZUZEYydXlSdmRMWndZSzFwMnMzYXdmVThXblJR?=
 =?utf-8?B?aU5NUmpCMUh4dG5GNnhoSS9WTkdwUmJ5dlFPeG9xcThDWlFZSTlBVHZuZEY5?=
 =?utf-8?B?QlVnbENQVXFYcWRMZVRjWXhPS0g3RE1IZnNzbVJsM2owSTdscmxjMXVTMGVj?=
 =?utf-8?B?dlppU2J2QjlUUld0ZEVIWHB4S2Q1S3VKWHp1MysvL2MyMS9LSEdZZFZESmpo?=
 =?utf-8?B?M011SFFSSmlwei9SWml1cm9EWWdqMHVQU1FRN1MxVGNzam9uemVVV2VrbWRI?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F26E989DAFB8A340A7658D902C47E051@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33412e20-cb6e-401f-9625-08dd4cbc13d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:54:42.6635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avL5Ss7BczqC1vVybhznJIKed9FdnaWjGmWV6YXxFp3Yh2xEzPF0xL0JqajMU2RZNTkhOuQZ4W8ZfN903+6ksw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7319

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDE2OjAwICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IEltcGxlbWVudCB0aGUgZnJlcV90b19nZWFyX3NwZWVkKCkgdm9wIHRvIG1hcCB0aGUgdW5p
cHJvIGNvcmUgY2xvY2sNCj4gZnJlcXVlbmN5IHRvIHRoZSBjb3JyZXNwb25kaW5nIG1heGltdW0g
c3VwcG9ydGVkIGdlYXIgc3BlZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDYW4gR3VvIDxxdWlj
X2NhbmdAcXVpY2luYy5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogWmlxaSBDaGVuIDxxdWljX3pp
cWljaGVuQHF1aWNpbmMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaaXFpIENoZW4gPHF1aWNfemlx
aWNoZW5AcXVpY2luYy5jb20+DQo+IFJldmlld2VkLWJ5OiBCZWFuIEh1byA8YmVhbmh1b0BtaWNy
b24uY29tPg0KPiBUZXN0ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5h
cm8ub3JnPg0KPiAtLS0NCj4gDQo+IHYxIC0+IHYyOg0KPiBQcmludCBvdXQgZnJlcSBhbmQgZ2Vh
ciBpbmZvIGFzIGRlYnVnZ2luZyBtZXNzYWdlLg0KPiANCj4gdjIgLT4gdjM6DQo+IDEuIENoYW5n
ZSAidm9wcyIgdG8gInZvcCIgaW4gY29tbWl0IG1lc3NhZ2UuDQo+IDIuIFJlbW92ZWQgdmFyaWFi
bGUgJ3JldCcgaW4gZnVuY3Rpb24gdWZzX3Fjb21fZnJlcV90b19nZWFyX3NwZWVkKCkuDQo+IDMu
IFJlbW92ZWQgcGFyYW1ldGVycyAnKmdlYXInIGFuZCB1c2UgZ2VhciB2YWx1ZSBhcyByZXR1cm4g
dmFsdWUgZm9yDQo+IMKgwqAgZnVudGlvbiB1ZnNfcWNvbV9mcmVxX3RvX2dlYXJfc3BlZWQoKS4N
Cj4gDQo+IHYzIC0+IHY0Og0KPiBDaGFuZ2UgdGhlIGRhdGEgdHlwZSBvZiAnZ2VhcicgZnJvbSAn
aW50JyB0byAndTMyJy4NCj4gLS0tDQo+IA0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgV2FuZyA8cGV0
ZXIud2FuZ0BtZWRpYXRlay5jb20+DQoNCg==

