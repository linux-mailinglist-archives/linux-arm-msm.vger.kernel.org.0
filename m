Return-Path: <linux-arm-msm+bounces-47509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E7A3025A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 04:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A02B188AE1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 03:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9481BF33F;
	Tue, 11 Feb 2025 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kAFyYMm3";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="g1a55zi9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76F1CAA75;
	Tue, 11 Feb 2025 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245945; cv=fail; b=ZmrZgHtJFNzKFThrKPKRNTl37m4F75jrEhj69vFAYZ9rsxP+/xIL+iSzLNvZrnnYEECgXodud0aeyNfUhOKz/vun2C5gwfvV9QudCoFSDg3gODAzypEY5GRxYkArDzMwtHo/4XBxKHm9++7BfijFfhpmbgQBHRdyAXQhgO7L3hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245945; c=relaxed/simple;
	bh=ajd9Fnql+fGNC3NlwTe1GCUkxddzAUoC0GlNPm868es=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G+Ce3sZgZyGMIeuSyuB1V0Ok6SmpNv8GVzhx37Yk7DS4e3LVWNv6MusKc9o98XSV2Pm2j5RBLvA6SSZakxig4ZbFo3PZ3FeqwcO5aiFdBynKfq+v3PJVL1UA8ktdvngN7XbsaOVjyWrb6SQqaGuKk500hOEc0HIu+4AT0/PQ70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kAFyYMm3; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=g1a55zi9; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 963cbdcee82b11efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ajd9Fnql+fGNC3NlwTe1GCUkxddzAUoC0GlNPm868es=;
	b=kAFyYMm3NmuAUYDJ2S4vHVfDydYeitrVf/4oSw09zt0yBIeoGxfHSpm7bqEF4FMyaaVi54eUQoEiV9HDDI10GJNhQfPflcA/ZXsmInC0seJxeYn7o4jUUH+nTRtVTz6jH6uTSu3Ha+Sf90NvdMN/9q8jiEybYhjWtIydx4+VrDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:44d45c18-014b-4ccf-8147-fd57d2b8ebff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:75d36c92-d651-4ec6-81e1-a3deb10c9ff8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 963cbdcee82b11efbd192953cf12861f-20250211
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2113717265; Tue, 11 Feb 2025 11:52:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 11:52:16 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 11:52:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBf2fxQ+wMJ9r4cjf26An2YqDg90dy5rxE0vw9NJlV+dm4M5i1WbaaEyfluiYgjnX3kQhkzGWiEVeoOdkKhn5JQvF73XCkAaxCUgFvqCTpmx1K39VRXzWfeU3OubERRJqJRthCB48HOK3o2WkBVqxkRasRAiRmCCpKfPmYhLKMVtH9lcrU57XVFcmWNzZwRqnXq2eGlfgcVBeFHK3HcxrxaSshvVpZZBQJjpHkZ4oOdM2/Wh148GxSY2NNoUnVNjSwDYwdL/sQjc8oAImX7up2wEFM05ULdSYiikk0Q4SoQt8B/fsJ7gyxHC8i9EL4mnPlpX+yIJ4ncpjYuo+qR1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajd9Fnql+fGNC3NlwTe1GCUkxddzAUoC0GlNPm868es=;
 b=HQxMaCFL48l37Ni4P3+aHpSbF6a4FZyBJ3LlHVZJrtKrCB3rh3DdI46BaWtvro8dIssQ1D1SeVrD1oRuwyBNdu0uEwZ3N7NZcvRlP3mk0VgNpR7hv6DFR7GGSBoueE2fGX0QbzoYxfbfQrLKdNLtVk3dX9BI9rsemJD4sP70TOGkzyjM5yvC4E9kuPMqlNG68lbrw6tUWbWmzBzRrMfH9dzf7Hj4sldjKWTn4BDIbrB5D6/i479IdZLCNjR0JyCFmAghvaPXJ+PsOOICeGmrcG3uO8/iCiulaPpjBzsNqUDNtt0VSXr6mGBlcRSNPd5KdVUdNKNwNQBqgwR57aRKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajd9Fnql+fGNC3NlwTe1GCUkxddzAUoC0GlNPm868es=;
 b=g1a55zi9Rcu7qf/7xfGtqsgMdMHpRaJquw8YPq/MmYHkoVU1q40f4gUn27khObjK3lTinlyjxHuPtMeAKXFlOQnTquyL5KHOlX+Mgumr2QgekR9CXA3RKpTSckFkVNBnrTGxPqUafT3iZGhuJ9S+5nUeSNT28wvVwH0tEBxsbBo=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB8401.apcprd03.prod.outlook.com (2603:1096:820:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 11 Feb
 2025 03:52:14 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 03:52:14 +0000
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
CC: "ahalaney@redhat.com" <ahalaney@redhat.com>, "ebiggers@google.com"
	<ebiggers@google.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"minwoo.im@samsung.com" <minwoo.im@samsung.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
Thread-Topic: [PATCH v4 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
Thread-Index: AQHbe6MpGDpB/PhTMU+oq6FCZN0rl7NBeWMA
Date: Tue, 11 Feb 2025 03:52:13 +0000
Message-ID: <6dc8849886ff4ac6ceca7d8e36b853b27f337cb9.camel@mediatek.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-2-quic_ziqichen@quicinc.com>
In-Reply-To: <20250210100212.855127-2-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB8401:EE_
x-ms-office365-filtering-correlation-id: 16c1e996-40bf-425c-2cb6-08dd4a4f786f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?Lzk3WnlZN0pRUHJraExsTW1yUFV0Q2E3d3J6c1hrQWhpTyt6MlBOZytWdytI?=
 =?utf-8?B?OWE1aE8xNXJxM0ZKeDdFbDNLaDdvS1ZOMFlNbm03dmRETG0xcEVnYTR5WjA2?=
 =?utf-8?B?UG8xSUc1SnpLYzVCUlBJa2NiNUkrT3N2cktKMFB2VVNYZURra1BubzR4MnEz?=
 =?utf-8?B?VWwvUzYwalk5YVJHYmdpT1BNVGVsTnROekNQZTNyV3RJOExpMWRWS2xpSFFn?=
 =?utf-8?B?TlRkVUdrazhHZEZIU0kxK1FPRmd1YUtrRXRDRmtYRjgybXZuRFQ1YlJYRG9a?=
 =?utf-8?B?THBEK2R5WVJ4Ukxid1VMZUNnSk00ank0SlRnOEdpOTcvelhTWWpCUUc3VU9I?=
 =?utf-8?B?cmQ1VTI5M1h4Ym1GQjl6WDc4T0pMbE11eW13VTBPbllpYUtBRmlpN0JwZDUx?=
 =?utf-8?B?NkJqdDBYcFd1RWxMRGQ3UVcxVytpU3gyeUc3dWtwN3gzMW5GZm4ra3pVRWI4?=
 =?utf-8?B?TktCL3JvZHgrcVNjdXhjcWxiejQzb3FhQ2VtTG1OdTN5aW53QkltR21mb0cx?=
 =?utf-8?B?cDdyL3grNU5COXVCZDNwL09maDlMKzBicTlPeHVpRHpCdDJibm56dURuQ2Mw?=
 =?utf-8?B?SFpSaEs2Q1FCMFJ1cktZTjUxajQ4Wnp2eFdnWFpCQVY0VmdhZmlTbXgxaW9V?=
 =?utf-8?B?NDNWTlVBd2tuZ01oOXVrdHorOEMxdUQ1K3Iwc1YxdEx5SUNhSTRYaXhPSVgw?=
 =?utf-8?B?SjhiMUFYNGhyMVBKdlZnNHVkTyt5aUhYZnBQeGM4ZkhSQ2NxL1cyakplQXQv?=
 =?utf-8?B?T3RESXhtY0dCcWlnTkcwZ3BQOHlZRFpocGFTQmlOM09DZmNCcTYzVjZ5WTJS?=
 =?utf-8?B?c0pwcTBJbmhEQkJ2OUpJcGJmK3dmVjMrWkpGNzM0VFloaWRpSm12ck5ibGdl?=
 =?utf-8?B?dFZ1VXp1TjNVVmVDNGIyTnNXZi9NdkNhMGhQa1E4MDVrOFlPTzZxMStSbWZD?=
 =?utf-8?B?NGNiYThCdW4yeDltM2x3Mk10VW9ySkRHZndxZlY4dGFaVldiTnBBekc1MlRM?=
 =?utf-8?B?Y0gxa21ib29rbTJZVFVFaTFwN1dQaEdxTURlRWRzOUFlM014ZWJOTXVkcU1F?=
 =?utf-8?B?WHdTZE9PLzN6OFc2OUV0WW15VkxOaHMwSkZ4d0V5YUoyaHNwUGpiTys2dC9I?=
 =?utf-8?B?aEt5NHQrbTFqQlBVbzBXNzF3eGxLU214MjJGMzlBb3BKeWIzSVpIczAyTUo4?=
 =?utf-8?B?SnZ3dXhJZXJkcXN1aEVCMnZIZDZoVTR6b3hoMVFtU2ViVE1Za2p6Rm9NL1Vk?=
 =?utf-8?B?UHJocENrdUFRS214U25DQUl4Q1pvNFFHbkFYMDMyVSs2ZXBrMSt3MXAvemQ0?=
 =?utf-8?B?Q0o0bEZWVlBxOFp3dkFaZktnZjFWRitBVmk1cjIydHZNS2JlOWJCNkN1UG5h?=
 =?utf-8?B?TjNUc1drS0ZERnI3VEU5UnBpakZQSjBHZC9JaUJHTkc5dURocW1Id28xci9M?=
 =?utf-8?B?alNWakx4VUdCQy9qK0J3MWFPcjJKQ2lvNnhKUlVkdG53cE9BZzY2WHNHa20z?=
 =?utf-8?B?alBGR25ZSllVUmZCL0NqOWluWWd3eUwrYVJ4SEpjOG9FcXRUL3JSUjZHOHdm?=
 =?utf-8?B?eVJ2SzFxeHhTWmxTTUJmSHJqZ0FiYmZEdE4wQ3JSNXl1eFJpS1dKbGlKTE1I?=
 =?utf-8?B?aHI0bUhKb01BWVg5dURhM0FBRGVxN1pIZU41WXJzVHJuQjFsT21LK0dGcW5H?=
 =?utf-8?B?VDhDT05NbjJYS1AyMStWUmFVcFNqMHJtMXBQT296Q1g0TnJTM0RDREpLWlJY?=
 =?utf-8?B?RjJzNk5tRkpBVngzc1ZGbFVsNzJvUVNldHNja2xVTEpBUHpZWW1uRFFIWTQ1?=
 =?utf-8?B?NHJqdk02Z1ZQRFFPOXd2MERHSDRDT0YyM3ZqNjh0SDFNKzdwMDluM2xjaDFF?=
 =?utf-8?B?ZDU5NVJlT0xybEl2b0FpNnR2aDlQdGlPcW1nNGxKL2t2cTZLWXFjY093QkJP?=
 =?utf-8?B?S1RGS08xeUlzZW4vZmNxaWV2c2VrRm1HMkVoY0F1eGNaTlIvcFpGTkJYNE9t?=
 =?utf-8?B?VFJkaE50VitBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am1zVGxDWUhBN0NZN3VTTXZGWS9LUUhDSWUwOEs1NFc5UjNDTitPTFVyeTlM?=
 =?utf-8?B?YmdKbWVsYmdMMXpnL3J3UUkwVlUveitpbDAvRkxPdlhXbGhBZHhZandQU0d6?=
 =?utf-8?B?ZEwvQXgyTFozU3plK2pTWU1kaHorM2h1d0FpOU0yaEM1WjAwdDJRZmJla3JB?=
 =?utf-8?B?SytPZHZQS0ppN2JzZGsrOXB1YnArUDhCMFRIeEFjN1FtMTlNZFJIb3NaQmIz?=
 =?utf-8?B?Q3hPak50VW5BMjBDcVdhaFhoM2ZQbWsvV1M4NUE2MklpUE5yVzd0dnVXRE83?=
 =?utf-8?B?NENHaGFoZlJiKzdQcCtPRjZCWDJ3ZWNWWXVacjZORVBENU5PWkZiN3F1VTlk?=
 =?utf-8?B?ZVltQnYzWUt6d0l1RzZtR2h0ekFMR0pzQXpRWWRoUmFsUXB3WktqK1BvNWI1?=
 =?utf-8?B?TTZCekdIZ3VtM21VT0NmUFROUmZxdjJ6VlI4d2l2aUNRUFBhT1NBaU1Zd2VT?=
 =?utf-8?B?M1kzaGJHTEJHR0dteHg0ZklzR3BMN3N1Z3V3aXBIeGxsdnBmOTQ5bENzcXZx?=
 =?utf-8?B?OTIwWlNVaE1USGlaUU16SmhJeTBzdGxtWS9IaWdhejJENm5tQllTQWM0WVBq?=
 =?utf-8?B?WWhDR2RBZlBmMFgrMnA2WXM3SjdrSmFUdjhqdDlPN2VNZkx5OG1RYWZ4RzVF?=
 =?utf-8?B?UU15bEE0S29tVnd5QnlZZTZRSERYdHlZYTJZeGVtZlRLamN0SjZ2RG1mc2gw?=
 =?utf-8?B?Rjc5OFI3Y0w3dnE5MzhBR3J1alRXT1hUNndJT0lsSlVxV1A2S1lNU3I2MUNU?=
 =?utf-8?B?SkhyZi8xb0ZyQ2Q2VGVEK1IyQ2oxZFJOQlFjd2RudjdLblF5VDdIeTVJTzl4?=
 =?utf-8?B?NkJzS3lFci9nWWVHdFhUNE8rMHRGbEwwUXNrUWJ3OW11bWZVWFJQQXl0VlEz?=
 =?utf-8?B?bDFBa1c5NnEwVjk2SnREQmdnSnpFMXU0aGdTM1RNUHhFU051dlNTd2pzQTBv?=
 =?utf-8?B?Zm5ORTIyVWZBb05vWmVsZHorTUU5WWRqQWltdWdWSWVmMEhLQnpacjlsdzE3?=
 =?utf-8?B?RVN2ZjVhVzZUbi91K2l0SnJxTVJlSVVZZlJvZnlabE4yWDRtQ0h0V2s1U3hL?=
 =?utf-8?B?Tjd2aVE1RERNWG5qYWgvV2NLbWd6L2RGeS9Kam40MjYrNUFCMml3ejcwb3cz?=
 =?utf-8?B?R1VncGxsRlAzUGxqNE1aUUZiMHpZbW5JbWQ2K0hYcEVCN0Fmb3FZSWpjRldE?=
 =?utf-8?B?RkhhamxBZlJTR1JnWTZLK3BMOEpJcUk1OEY3Y0Niamh6SGxWdmZodXlnZjgz?=
 =?utf-8?B?S0JXN1RYVWUvQWIvOWYrMkxGL253d0ZPYXVDemd0RlRXVlZoSWFhRktuUkw2?=
 =?utf-8?B?eDdtQzJ6OWk5bTg0WjNzQjhHS3BUVzZOS2lzVUJrY2RvZ0VaMUpkY3RRTmZj?=
 =?utf-8?B?dU5YYzBaZlh5Q2planhheVVtSjFvKzNTUVMrSE9jQ1EzbTB5SmNNZFpzbFVS?=
 =?utf-8?B?LzloOU1HZmNrUDlzSVNsMURzZzJmNk9HMXFXSWduSzVoNFgvbHcxcDQ4NVpx?=
 =?utf-8?B?UUNoRXdUMnlibks0MmdCSU90bXB1WjBEYVhGaTVDL3A2N3lNdkpOckhMOWNl?=
 =?utf-8?B?N0QyVEJKMk9jV09ZUUdoaWZPaUd0RHZ2d0Z6L1VZREhlVTdZaXkwUmxYQS9G?=
 =?utf-8?B?ZzhibUpBVVlOWVJMQU14a05BTE93S2trcS9wcEdFOVNTRCt4Mm9wNStUWDJr?=
 =?utf-8?B?MytZWWt2U3RZdHFkWlZ2cWlBenNhc015UDV4UDIzTU1yaUhnVTZaaDEya0dB?=
 =?utf-8?B?MUU1OGpiYkdXZDFjdkp2cUkyQ2FMQ1laQW9DZ2VpeHRwYm5JQ1hCVWpRQ0hG?=
 =?utf-8?B?Yy95Uy9vc1phYWUyeXpXWkdpcnFnU0lXc3kwK1dmajBJazV3WFNSSFlwYWJD?=
 =?utf-8?B?RUpOVi9jK2pZZW5sMFZzdWtnbDAzVkdtRU9yK21DQzk2UHFNN1A1UEFVZkhz?=
 =?utf-8?B?aWNwSWtYMzFjMTBaejhNa1d1bS9XbkNGM2lKYyswbXEremxSRFdIcUU0M1Jo?=
 =?utf-8?B?MDc4b0ljQnNMOFJxMVFsYlVCNGljbi82NFMzQjNQZWxhVDJ3NzFzWWcrelh1?=
 =?utf-8?B?YitXdHh6U295S0IzTXhlQ3BJdVRtSStrK29BZldlczNtZjVNd3R4aTBadkdi?=
 =?utf-8?B?OGdURlJWMmFOTmx1ZFFoSU1nUE82b3pZWnkrYTBqMFdCcFZ4a2NjTlFGMDF0?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12BF8C6037C95A4DB2A2711D0B797106@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c1e996-40bf-425c-2cb6-08dd4a4f786f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 03:52:13.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmJsMetAfJQIBvfioQE4giwFxMo2JNY/3DbZKQMz0zdw3hgqlskqZ4Cb6qKHMf1agAFNBIS7Dy2tuGg10jvpTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8401

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE4OjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6Cj4gCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWZzL3Vmc2hjZC5oIGIvaW5jbHVkZS91ZnMvdWZzaGNkLmgK
PiBpbmRleCBkN2FjYTllNjE2ODQuLmY1MWQ0MjU2OTZlNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L3Vmcy91ZnNoY2QuaAo+ICsrKyBiL2luY2x1ZGUvdWZzL3Vmc2hjZC5oCj4gQEAgLTM0NCw4ICsz
NDQsOCBAQCBzdHJ1Y3QgdWZzX2hiYV92YXJpYW50X29wcyB7Cj4gwqDCoMKgwqDCoMKgwqAgdm9p
ZMKgwqDCoCAoKmV4aXQpKHN0cnVjdCB1ZnNfaGJhICopOwo+IMKgwqDCoMKgwqDCoMKgIHUzMsKg
wqDCoMKgICgqZ2V0X3Vmc19oY2lfdmVyc2lvbikoc3RydWN0IHVmc19oYmEgKik7Cj4gwqDCoMKg
wqDCoMKgwqAgaW50wqDCoMKgwqAgKCpzZXRfZG1hX21hc2spKHN0cnVjdCB1ZnNfaGJhICopOwo+
IC3CoMKgwqDCoMKgwqAgaW50wqDCoMKgwqAgKCpjbGtfc2NhbGVfbm90aWZ5KShzdHJ1Y3QgdWZz
X2hiYSAqLCBib29sLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIHVmc19ub3RpZnlfY2hhbmdlX3N0YXR1
cyk7Cj4gK8KgwqDCoMKgwqDCoCBpbnQgKCpjbGtfc2NhbGVfbm90aWZ5KShzdHJ1Y3QgdWZzX2hi
YSAqLCBib29sLCB1bnNpZ25lZAo+IGxvbmcsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtCj4gdWZzX25vdGlmeV9jaGFuZ2Vfc3RhdHVz
KTsKPiAKCkhpIFppcWksCgpQbGVhc2Uga2VlcCB0aGUgaWRlbnRhdGlvbiBjb25zaXN0ZW50LgoK
VGhhbmtzLgpQZXRlcgoKCgoKPiDCoMKgwqDCoMKgwqDCoCBpbnTCoMKgwqDCoCAoKnNldHVwX2Ns
b2Nrcykoc3RydWN0IHVmc19oYmEgKiwgYm9vbCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIHVmc19ub3RpZnlfY2hh
bmdlX3N0YXR1cyk7Cj4gwqDCoMKgwqDCoMKgwqAgaW50wqDCoMKgwqAgKCpoY2VfZW5hYmxlX25v
dGlmeSkoc3RydWN0IHVmc19oYmEgKiwKPiAtLQo+IDIuMzQuMQo+IAoK

