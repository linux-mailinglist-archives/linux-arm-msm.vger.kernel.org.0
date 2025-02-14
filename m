Return-Path: <linux-arm-msm+bounces-47979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB967A35696
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA6B188E5AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27D5189F5C;
	Fri, 14 Feb 2025 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cEcKTV5Z";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EVeeV+MD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BA18E377;
	Fri, 14 Feb 2025 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512417; cv=fail; b=Bbfr94bOGWDcEpxckvmZ4d/uDFlLNusYdb8710KvNSxo/DSPhZhYG7sFkfXnQI23aqx/qkGaiHSJcRlC4kNdpFQz0t4wv4bH+M65h7oJXmuhGbvZbkdM2TxRS9C1zNtbVIxGpjFRhShtMf473WCgbl5Qn7OvIKMd7hc8fpDCFhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512417; c=relaxed/simple;
	bh=Fx1vYm/slSIToOuCKWmteWDaf9Ew66QZP/lb0ZvoCrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FWt6axtMfu2wt5qaMipdm2TyoFoaSWZvCbw088CBnVLK294Ak4KSrdqeHMoPoGH5oBekEPvhWj0+u+k5tTFUATSM8mqswpZASxxacIWhQ9uGbLnFkMtlze5yyl+Qc94fnEELBkFxNkqXx6VkWWSD8+KIUQ6XorQh5IigiMgDosE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cEcKTV5Z; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EVeeV+MD; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0573c0b6ea9811efb8f9918b5fc74e19-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Fx1vYm/slSIToOuCKWmteWDaf9Ew66QZP/lb0ZvoCrc=;
	b=cEcKTV5ZiPRZFudfgk4RdRzGm1CtgwRhxWXCReXWv/QdkDH1c2Wu3AfH2/Y4NR6jxLjNs7zdk1zaVyHVBXl2YGvkml83b84mB9IFcVyZXoDxclnluM7vDLnQjQmDmKLHQHljD/vxPBjyEn4gTDDVVMs76vzXZogJL8NrEBN1V6I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b04420de-13bc-4160-a79a-ed2771ae5381,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:27418f27-6332-4494-ac76-ecdca2a41930,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0573c0b6ea9811efb8f9918b5fc74e19-20250214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 156196579; Fri, 14 Feb 2025 13:53:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:53:30 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:53:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNDrkTmjM44xsfADXomV8VO3fqFuBiGFSw6m5ck+WH8WB8KIQJbpDgA82sNFOenOIe+AWtRmexqVnCHom59OQqYkBDpOKBWvu7nPSG+ebozN9PBfx5ohNMSkSy7ZFNQwKdtf9oW02WpGRJoqflatLwfQQfmeMSE2Beh2KRpkIFAFE7vmYs7zKvJBtUJ+OikuqElrhzuZ/c1ApWN9oRGE5qw0JAHuS9pjWu5BLyUBjndS/V6tRQ553zHzS+XhI3S/4P3oq3lx/G5p/NF7RFLSxpqCuaTZhtiP50IJ7Etr+rA9CETCpESDjJkAvw7QHE5PZTkAKsSNUQhuo3te5Lhx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx1vYm/slSIToOuCKWmteWDaf9Ew66QZP/lb0ZvoCrc=;
 b=Cuwb4j+CvH/eHHsz7ZO/RMOSbTcXMkdqb7GHvflbHNTknXgzmJnNJzLloG2OXQj5hMmnNOrZNG5LsPQqPQenxPcMqGvq+ab3zWPoeMDZ4g4zGT7VMpFM2eTou8ucfDKZbSWttZhZ/LByh1WW2CzWuqyF5vnYkAIC5/zyvNivg13QllgfF0vI5Y4n3eRovzlDZdYLblKcAUB0pfCgaHxUs1pDbxlGNqhAd6M5L7CW+KnHjdi9vDeLE8uFm/QcyJuiiw/664ShubgYJmoaWzejjrJEkbJQXg06ckc+3TB+S/qsVG7mOHubrBjmuPbBSe6d8N/TRq2t+iPNOjPxaGRrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx1vYm/slSIToOuCKWmteWDaf9Ew66QZP/lb0ZvoCrc=;
 b=EVeeV+MDp1vZ41c0wt1pwvYbUeumQ2MeaKCzIWI4dv6rbdMdaLKf3G4ozY0VcmkzHeENZmWeI1NLH+D6RpwDuX83StbffBPT8ZaCzKZ0WHzug93dhR4znWHFfPVrCvj4fdfywkUmDplfYO90+CN9kCwkUYmG1a8iRI+mCKg5ZFc=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7319.apcprd03.prod.outlook.com (2603:1096:400:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 05:53:28 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 05:53:28 +0000
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
Subject: Re: [PATCH v5 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre
 and post change
Thread-Topic: [PATCH v5 2/8] scsi: ufs: qcom: Pass target_freq to clk scale
 pre and post change
Thread-Index: AQHbfe3cfVT0uI0eUUaWUlXYsEDWxrNGTa0A
Date: Fri, 14 Feb 2025 05:53:28 +0000
Message-ID: <5ce057491b5f03d4ae2ff0b9c0c1f588babd0eca.camel@mediatek.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
	 <20250213080008.2984807-3-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-3-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7319:EE_
x-ms-office365-filtering-correlation-id: c42ca12c-dcd4-4f5a-3e50-08dd4cbbe7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?U0tVbEljUFBtMEJaZ1VIYUFYRmk2eFdYOHk5UjNoRE9OaGdqaCs5Q1VPU0tC?=
 =?utf-8?B?bHhzTEljdEFJSlNkRk1ZOWdJenFUQnNXVC8zaHBOQWkwUS85WnpPaUtGZ1pz?=
 =?utf-8?B?Um1sYXp1bytaUjE1dlVnanJUZXlYT1FMWDVyZno3Y2RMK2Q4ZGw2OEx3N2hh?=
 =?utf-8?B?dS8rM2RLS3ZyT3FvRGNYZ1QyNEVzM2tpRWZGYzUrbFRXU1hCY0M0NVpmRTcw?=
 =?utf-8?B?eXRSSzlvTWRQaXlwQ1VCZjhwcFY5eUhVeDZsWDgxRGNEYkN6bm90djduQVhO?=
 =?utf-8?B?TnVXaHBESzkrRWdCVFFIL0RiMVovR3dGNzRMR281WFUwNGtIQk14Y2NqN2pY?=
 =?utf-8?B?MUh0R2VFR0pCM3RoT1h1Vk9wSHR3S0tFQ1ZhcW9uS2hHaHM3VFpXcVBoaUd2?=
 =?utf-8?B?YjhCSm5lcW9JWWVCQllZRW1xdGxDZ3hsRDI3bUVpUEttaVV1QmZmNlp6V2x5?=
 =?utf-8?B?dDFOUllGSStHMHM4VXpuUE8xT0lpNTBrbU5lVTI4cWRqQXdsOXpsN0xjZkg3?=
 =?utf-8?B?VFZNb0VCSkpVeE9lNHhDNVEyb25kamdHcEVSL1dTbDFHaTNpcGN0K3ZlS2I0?=
 =?utf-8?B?L01FWmQySEd4NUpyY3d0dXFYVkxVZXJGVjNjWW9NaXJZd21yZThsUWdJbE5h?=
 =?utf-8?B?YzRLdU5yVlZ6Y2ZaejdEOXpmcHRLd3hxY2c1ZTBkZGJzUWljVlJ5elQya1ZZ?=
 =?utf-8?B?ODZnZWVXckU3cE11dWd0Ym4yZzhVL21VSk90S1lDQTdBZUI5YXNiRzE1WjZs?=
 =?utf-8?B?c2NuS29ndmJDeHE1WFhQYmhIT2Zlb1AxcTJRSStKK3RiTVJJNDlhSWFZdzMw?=
 =?utf-8?B?dUhsVS9VbVpDVU9rRDI3MmRhL1RicDBDZmFwbXdlNEpSRDNBMmpBb3djQlZv?=
 =?utf-8?B?VWd4VDNTN2c1V0NYYTNPZFhnUUVXeEJCYjMvYlQwUTRXdU5XOTRONHpFM2tP?=
 =?utf-8?B?QUkxU0dhYSthU3NETFUzMVQ1TzUxOE9nbWc4dVlHRWdPVzR5amd1Mk5wUENV?=
 =?utf-8?B?bXVlQzB6YTk3WS9MbGlnZEFQT1B1M243VmZNbnEybVN2T1MzREs3eXdhaStC?=
 =?utf-8?B?L3FZVytqcmptaFdDazZYWDNqbEFWOXcwcjNxV1RxWU1XSnBnZEpzNzNRdkRK?=
 =?utf-8?B?bzVKdzRCK2dlMEdqV3dsdmJTTlRaTy8yekZoZ0gxUlVFVXpHL0RuU0NtaHBa?=
 =?utf-8?B?UU1JYi92bDlra2FmdC9mVzlVdVYxejVtR2h2djJ0WG9CZERnNHpla2xISURo?=
 =?utf-8?B?YUU1QmhPb0h6VDk0Rnpnc2tHTzc3M2wzbnZiZGRLeGVqb1hqcVpPcGdvK0FU?=
 =?utf-8?B?QVU1WldGMDFBN1duay9samg2eWxOUmhlcEpCV1F5ZGoyYVJwRmJrQ0wwd2hu?=
 =?utf-8?B?UktpaGlMRGp1Slo1eWM5S2hOV2FkZytqdUh0TkEyZHo4OFFET3VrWU1zWE5T?=
 =?utf-8?B?VHlGaUd6aGNtRHVobS9WZ1ErSGh5bE9CSjJndmk4VG5QNHpqQmVkMVd1WUFN?=
 =?utf-8?B?N01TNnNLWnBvM04vRlZVTXhRNFVqaEMxS1ZlWHVxNFNmdXNxbk1CZW5YbVpz?=
 =?utf-8?B?SytWeHp3OWE2VGNMcHhOaEo5ZUFXWU01dHVFZ0dPM1ZEVEU2VGJoK3d6UEMr?=
 =?utf-8?B?VVowbjBPQ2VpTVZTbGYzRElyK1FOcEowdmhZUFlkdDY4a05hb25PWTVjaVdZ?=
 =?utf-8?B?Zlg1UUhsdEJrWG1XamI2UEFvSlpNRllNM3JoTzBrRi9acEEyeWh5cXBGejlI?=
 =?utf-8?B?TEEvdStlOE1STkNxekdTRVpiTUpjQXJZaGxJY0xxenZwbm5RTzNCQmowbVJm?=
 =?utf-8?B?cUpNRHphYmlxY0NpYUd6Tkp1TGM3K2tUUGlERm5XaVVCcDlLbXBUOXVOVDFO?=
 =?utf-8?B?eElqTFdLOFNLVGZMV1NzaGVGTDJQbVhFL3M2dklDZ2VTZW1LbmQ0TGdsVTAr?=
 =?utf-8?B?WnJuQ09TNnJxc3gwa3cwWm9Gc0tIdHdQK2ErNEV0Ni8zTEwwQ09BbE51bkRz?=
 =?utf-8?B?dGVNdGhVMk1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGxhemhLcVJvOFVoNlJpYVdlVUtzRnlnU2RoYzhKbmVQWTU5YmpxU1V4UjJL?=
 =?utf-8?B?UGRBbkZmMjJEVFBJZFZ1c1phcnFIY3hnN3JwY09XZ3VIWTVPYk1ySi9ZV2Jm?=
 =?utf-8?B?VVZ6UFVhelphbFp4V09PZjR2T0JuUEJaOTBiTFN4ek1oYXhNZUM0bTdzR0Jz?=
 =?utf-8?B?bTdYRE5NbG5Md3ZJWllxelhHeENVZmtMTnpwRDRBQ3BDeWRPSXFHRWJ1Z2Ev?=
 =?utf-8?B?S0N2c2dNTmJHWmhITkJ6cHAwbVdnQVhBTTZVMU80Z3M2a29HNUZudGUxN1da?=
 =?utf-8?B?TytXSytOOFVBTUdtMVY1Y21tUFFBbzRBSWpzWXpZTTNtNVhXN3RtMXZDaC9K?=
 =?utf-8?B?enhPNzVGKytJNVYyZStRRFNnbW9sdGhpemZpNXlScDFQMFB0bTViTWdVTEM5?=
 =?utf-8?B?d0NkcWpYR2t4M0ZwNDZKMStleDdCTmVIalRGeHBUTStNOC9oK3VIUlAwaTJG?=
 =?utf-8?B?SFpGSFZUTVMyQzEwU1VqdksyUzB5TWpDdDNXYXVRS2YxOHBoYmsrWnkwdmNY?=
 =?utf-8?B?U2xseGlmWHRNaURwMThhRktxTzFaazV2dlhwYnh1VkwydjdTdndpVzlhYXhI?=
 =?utf-8?B?R2lCMFJ5REhKYW1HcHN6MDIrU1FxT2duYmgzVHJyZWducmg4SWVrcXcrem9t?=
 =?utf-8?B?dVB5ZHVXUE9wU0FRTiswUy9uREM5MFVZQUk2K1pFL0Vpa2ZxV2Jwd3IxWFhO?=
 =?utf-8?B?R1ZRK1NQam9HTndOeVdsSWduNTFTczlIYTVPTHRSd0c3c05lR1dMVENyaEFz?=
 =?utf-8?B?YkxPMllzWVFwdmlUc3ZNSS9NKzE0MFpPVXE5L0M4OEFLczVCUC8razBHbm1v?=
 =?utf-8?B?MFlQNm0yOTVXMUpxMExLN1BkNjZFUi9KWTFmRkl6YXUxVGFPMnMrdS9PczM3?=
 =?utf-8?B?WHdVeGtzeGhQMStjWkZmZFZnbmZocXI1cjhocldpQlJIWU03L3E0VlY1Z3l6?=
 =?utf-8?B?Ymw2aW5VRFBMU1pnSzlRQTUvdWVnSGNNM3IwQm5NM1d1TEhENlhDMVhiV1Vw?=
 =?utf-8?B?YVNUTk85bFR0ZEVEa1lhODM5RFRXVnFoNTZXYUpsb2ZXZlFuaWJxSUNkbExX?=
 =?utf-8?B?V2dIRVc2MjRQdEpRTjdaSWJ2V3pUQTNyVW9IcWRtTk8rZFFaQ05RS0VXZm5L?=
 =?utf-8?B?UTR0amN5TFMvMU5zZE9QMDRsUmdPVnRxdzVTdHp6NHk3MXlybWR0UndsVlp5?=
 =?utf-8?B?SVh1dllmZ1ZyTGtsS05nL0hGdlhpTW85amdlVDJvTis1VVVGakl3dTNQL0pJ?=
 =?utf-8?B?a2J0d1F2Y01ldVAvV2tvd2FEUERUNVorOEFHeHJDQzA5Yi9sQjlhckltRFVE?=
 =?utf-8?B?NlVqdm5wVmFFNEQ3bDBCWllKYm1oajMvaVFwanA2cFNWWGlIZWx6Mzc1ZHhv?=
 =?utf-8?B?N1ZVbU04SThjZXB3M1VSSkNvaEpTdGNCbnQ0RGNoaFJia0U4UWFYa0lQOC9a?=
 =?utf-8?B?SUZQOFIvTFlESjBnbXg0aXN3R2t0TXF2UVBETjM5NzZtelFTRmZ5MGNWUDd2?=
 =?utf-8?B?UTI0K1NWdmJaeHBZSXprYTRLSFJ0RHhTbThsWXppSE1zelZVOTE4R2dhcUg3?=
 =?utf-8?B?Q3J0dWlRRjFpNmRONU1qcXRPZlkxMHlzUlhGbFJMMC8xWUpIMDNvZUxGKzhq?=
 =?utf-8?B?M1BGWHBrYUFjZUEyWEJBRTBkdC9QZDUwZUJZWDk5WGxEUWZHeFpDdjhVUmZr?=
 =?utf-8?B?YlNTaXdzU0FLYTdSdzJJUGZ5S0xOS3MxY1VXMXF1eFhDam9OK1dzMis2MjlU?=
 =?utf-8?B?WVNURTc5T3NTQ0I4VDBJMTJ5TmxkaVIzTFdGV2tiYzZHWktqL1Nmc1c4VTVS?=
 =?utf-8?B?ZENDKy90aE8xd0pRejVua01NUmtVaGEwbVpubXU0N05LM3RMZzhVQ3dGVDEr?=
 =?utf-8?B?RVRSa1BHWFkxRXA0SndqdGF4MzJEWFFLQWM3R3NsQkF1SlVYUkFkKzEzdTM0?=
 =?utf-8?B?T1lBWjdKWm8wVWxQdGFURkoveEwyVWt2bms3T3VrSWZmaXpYVTU1RmdKM0c1?=
 =?utf-8?B?RW01bnIxRkFKRzBsYzhFUU9KOEVKczhKek52YnIxTXEyN2hPUXVKb1kzVHN4?=
 =?utf-8?B?ZWptWHVxdkpZS1E5ckxqdVpKbUt1VlQ5TVkwVlpBWTJxT3BLWURNWGcxdXp2?=
 =?utf-8?B?bnpPL0U0bncwMVpmY1RvdHFzRWxDdUxIaENqRG01YzFBQ2ZhU1RVVUJMaXRN?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5A98F3C3775E14EA93C43ED7D64EBAE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42ca12c-dcd4-4f5a-3e50-08dd4cbbe7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:53:28.8785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+uQOoAxbVkf5Rg/ov6UD74SfrlBhPyKEO704SGFNCkLU5GNIk/HSOPL0grsn2WFjb2TnuS8xEdj4h7DJCQNBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7319

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDE2OjAwICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IEluc3RlYWQgb2Ygb25seSB0d28gZnJlcXVlbmNpZXMsIGlmIE9QUCBWMiBpcyB1c2VkLCB0
aGUgVUZTIGRldmZyZXENCj4gY2xvY2sNCj4gc2NhbGluZyBtYXkgc2NhbGUgdGhlIGNsb2NrIGFt
b25nIG11bHRpcGxlIGZyZXF1ZW5jaWVzLiBJbiB0aGUgY2FzZQ0KPiBvZg0KPiBzY2FsaW5nIHVw
LCB0aGUgZGV2ZnJlcSBtYXkgZGVjaWRlIHRvIHNjYWxlIHRoZSBjbG9jayB0byBhbg0KPiBpbnRl
cm1lZGlhdGUNCj4gZnJlcSBiYXNlZCBvbiBsb2FkLCBidXQgdGhlIGNsb2NrIHNjYWxlIHVwIHBy
ZSBjaGFuZ2Ugb3BlcmF0aW9uIHVzZXMNCj4gc2V0dGluZ3MgZm9yIHRoZSBtYXggY2xvY2sgZnJl
cSB1bmNvbmRpdGlvbmFsbHkuIEZpeCBpdCBieSBwYXNzaW5nDQo+IHRoZQ0KPiB0YXJnZXRfZnJl
cSB0byBjbG9jayBzY2FsZSB1cCBwcmUgY2hhbmdlIHNvIHRoYXQgdGhlIGNvcnJlY3Qgc2V0dGlu
Z3MNCj4gZm9yDQo+IHRoZSB0YXJnZXRfZnJlcSBjYW4gYmUgdXNlZC4NCj4gDQo+IEluIHRoZSBj
YXNlIG9mIHNjYWxpbmcgZG93biwgdGhlIGNsb2NrIHNjYWxlIGRvd24gcG9zdCBjaGFuZ2UNCj4g
b3BlcmF0aW9uDQo+IGlzIGRvaW5nIGZpbmUsIGJlY2F1c2UgaXQgcmVhZHMgdGhlIGFjdHVhbCBj
bG9jayByYXRlIHRvIHRlbGwgZnJlcSwNCj4gYnV0IHRvDQo+IGtlZXAgc3ltbWV0cnkgd2l0aCBj
bG9jayBzY2FsZSB1cCBwcmUgY2hhbmdlIG9wZXJhdGlvbiwganVzdCB1c2UgdGhlDQo+IHRhcmdl
dF9mcmVxIGluc3RlYWQgb2YgcmVhZGluZyBjbG9jayByYXRlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IFpp
cWkgQ2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWmlx
aSBDaGVuIDxxdWljX3ppcWljaGVuQHF1aWNpbmMuY29tPg0KPiBSZXZpZXdlZC1ieTogQmVhbiBI
dW8gPGJlYW5odW9AbWljcm9uLmNvbT4NCj4gVGVzdGVkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBQZXRlciBXYW5n
IDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCg0K

