Return-Path: <linux-arm-msm+bounces-47978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2FCA35690
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B007E3AC9A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A050186284;
	Fri, 14 Feb 2025 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t3u4lN/Z";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YIiuvmlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363D2753E8;
	Fri, 14 Feb 2025 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512372; cv=fail; b=E4f4g/IBb5x5mbuxFq9cdevsrFMfPM/rxeJS10hlSPghUXaAb8zmjXCdcjZrnIkbUFLTAQgKh9SZqV8ye/fcyUfJulqJ9LCX2PIdvxBKzKeaw2A9Ku4o+jg7/J0XSmMrMSekuu2ZHcGPCPmN6A07xzVn0XUQE8stqPtl4AgfNHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512372; c=relaxed/simple;
	bh=iDGrny4Jab9aXYEnBUXoY5bgD0UxfDcoE8OjQvx+Reg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NJD2BqYKakdV1Akd/vq2pFrHayddk92z0PHd4jV38W/uH5EDR8kDjO5o4uj6GXOI6YbEdQeEi4K6McdiSpi55AvbpiWH+/LxeeR1Jduhl4S3/DpfBAipMF77Z2uFOnOyJfKyV1WXdYygPIWFI54zvjPTEmhrqNcwxSOXbRFay/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=t3u4lN/Z; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=YIiuvmlU; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e79e1730ea9711efbd192953cf12861f-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iDGrny4Jab9aXYEnBUXoY5bgD0UxfDcoE8OjQvx+Reg=;
	b=t3u4lN/ZQDTcHdw/X1dNZVqdakOb8adFBtY4l05uP8ImI5/u2DMST6p1WqTqL8ranVaWjK0cLMBrpdkU8lPpGpVNF5CdS3n6SUNpITQWRA9XtCePTjWu0El/SrtMcRoPMG12HW+TI7eI7deARcmTuTZgd/XO3Frc44nNAN0Kv8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d3c18bac-15ae-427e-b3ec-f62346ba40d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:b2175c8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e79e1730ea9711efbd192953cf12861f-20250214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1768716790; Fri, 14 Feb 2025 13:52:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:52:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:52:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pl6r9Awoow3Drcv/EBd8oLd3nplQC6qWZcbQuDRzm4sLGh9Nuh6oIEBFhAZwt2cJbz2Q3CnhZH77mnhRXAmpTFWWerxXDeEY1CaCVnvswIuja9dQSamHJ9YN3vKYCAeA/J7Gpx8Fp7J/Zi00mSmaSXIG2QEU2jwwLKke1pku5NytWNmGOV+MhuDb6WCl34WTyqVhwcl1s81qM2SCtNDhIQ/oC0NiBtAIcymd6bg7yeGvndvKFkuF5BGHu939/R8WUwa1o8Q8nRdJQEbmdI+Tb3QFWm11cbJiGrn5E7vsc3AXXp6qDn9wpLcKi5DF4t2xXx0QjBKZB5opvzu+ATrStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDGrny4Jab9aXYEnBUXoY5bgD0UxfDcoE8OjQvx+Reg=;
 b=mbio3lmjhabiQDNEUEXVi43Ol74K8YYWwOqri8OT5kimleEpWvHsUKzGPgPL5lSAT4FXXngeEg/Hm6jjsfbzPzMwymsZTUKGhZMERMF8OMRoZfC1fOPqlXptJzl/sx8gGFtYOX16JkutWHpzeqTYDo+HuegS5uUbiTuR0Uj+fyVeBQ+EpT+/m6PkivOwmyo+hrtaXA6U8ZIv9iRMQxRIbuCf5CmQupH4moTNlnKVDfWIQwYN1+TDL3it4w0TJL9P1TG6QP0y5IEUEIhLBniVc/1EWdLSkTcycqAm/0xyI/x56sfz4XPOq2B0NnZmRog5LO4p7QOPEoYA33FiD/udZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDGrny4Jab9aXYEnBUXoY5bgD0UxfDcoE8OjQvx+Reg=;
 b=YIiuvmlUjeKO9eUvhgIQbZwfekmGDv+kc3LwiSIZujEQOYBf3xYg9RemSohLBLBOoCqHjml1WilNf6ikGEFr+4R6GNJochPfy+gevlOSdRlPsewt8WrImNZddZ0hhr/ihjIB8Xko5g5KWk7B3WrQncAxnURx0g58Co3ztC2Bv1w=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7319.apcprd03.prod.outlook.com (2603:1096:400:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 05:52:38 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 05:52:38 +0000
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
Subject: Re: [PATCH v5 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
Thread-Topic: [PATCH v5 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
Thread-Index: AQHbfe17WY63s8KB8U2E9YRHGLtcM7NGTXGA
Date: Fri, 14 Feb 2025 05:52:38 +0000
Message-ID: <8e2b992282751b6c052d72f15641294ac47c3861.camel@mediatek.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
	 <20250213080008.2984807-2-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-2-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7319:EE_
x-ms-office365-filtering-correlation-id: 7d67da7a-4514-4697-ef75-08dd4cbbc9d6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?amlPUVVSM2szdDl4TmJvVzBxSWJwQmNJUmg5dXdFbzlNUXEweEE4Kzd2VFdP?=
 =?utf-8?B?S3V2MDlPL3NwZS9QQUNwYzVBc1JmMk5mTG0zWUEyMS9XZXFMODVUMjNPVnI4?=
 =?utf-8?B?QWUzQ09KNmkra1pUemt3RS9CYWpYR3Vsa1RGeTZRQlpJYWM2Vkc5RkR1QzR0?=
 =?utf-8?B?SERmOVhaSGwveUs3RHVUZjBiSGZ2OUU2YktjRktldEJLSlNOa0g5TlY0Z2lt?=
 =?utf-8?B?WlIvaEd4VkVjK0hZZTZzOHdFTzh0NFZFQUhCNmFCL3hQWTVNV2k0d1cxdzll?=
 =?utf-8?B?OWIyQW5iR21KTnkxcDNQaFBPQUpiSjdxdERsL0VCZU9ML0RMaXZ2VFVza1lt?=
 =?utf-8?B?anNLeTBuLy9EOFNoV2tJRlNWakhPVzVWdlZHY24yODM4cGI3ZWt5OUNHU1Mr?=
 =?utf-8?B?MVZCSklwMGlMYTducEdneklVQit3K3p5STNRUnVCNDZtOWRsbUF1Ulp0aEcr?=
 =?utf-8?B?WUpUK1IzaDlEUjJaZCtKMXB5UXJ3ZGJyQ0NMWmFOQ29GSDZrb0pvRmJodGtv?=
 =?utf-8?B?cG53L3JwWnVDaHhHdEMyWjRuT3hTUmt2a3N6SkE1V20rU2xZYkVOdHNRRnhO?=
 =?utf-8?B?VGJmVUZxTk1iSTNmV0d0SWZFMUt0d2RKenY0MmJIT1k0ZXdRNzVIQU5SYklx?=
 =?utf-8?B?ZHBoZUxIV3ZrSkZjcDJKSjJXNWtCV3hSNU9EREdTaHNac0NSNGJyQjBHUC9i?=
 =?utf-8?B?d2g1VU41VDFuVmtnU0oyc0ZhTzRMdVFVQjRxN2R4Z04xaXJ2RzZISUY5STM1?=
 =?utf-8?B?MHJTM2YxbnFkaUgzTWNMMXV5TFgyQzBUdUlFVUhJZXk0bjUyZG9HYS9DaXJP?=
 =?utf-8?B?NUhCMWhmN2V0M1E1SnNtZTZJQkgvRHRPZUx4TWdPNHZ1aFgyTEhPTXZUb20z?=
 =?utf-8?B?WTRaWHVUSGUwRFRvYXdXVHUybVRxOXZMNndyd2ltU0M1enIvcnlhUFVBbStQ?=
 =?utf-8?B?V2dzaHZHOTIzcWY3OXp5STNmWWtEcjlsamJZaWZJN2IzYlhyaGFYSEk5TmVI?=
 =?utf-8?B?RUZaWnpZL3A3THBHa2s2ZGJSOWF4YldNaG13cUhjQ2ZyTFlrM0VIMlFwSDMw?=
 =?utf-8?B?QTNEbHNxMm53UCtiMndsZThwcXphNi9kYm9ZOWdoVWZkZkU2bTlYSHU1K2Zw?=
 =?utf-8?B?V2M0Z2xRTFMyMk5iUm43U09UcndyUXVNVkJUVkFOUnl2aHhxSkRNK2NqdnZl?=
 =?utf-8?B?eHZsb2drMTB6dDhjNVJDMk5wTklRSkZJaDBGTGFCTStRVWxMRXZEYnhLRXlH?=
 =?utf-8?B?SU9Nb2tONWJlVUFrYXZab2JaeS9mYmFNUHZzdmU3VW9GTVFhZDRxVGVqWTNJ?=
 =?utf-8?B?NnF1M3FhM2Y5U0o3SWwwTElUaU1Ld21mZUdIeVliTmFQTnhXczJ1UzY2anpS?=
 =?utf-8?B?bGV1d2hqeURrZ2JVTU9GclpCRHN6L0pmS0p1ZzNPUTBseHdxUzdNdDlwSDEz?=
 =?utf-8?B?UjZSc1BNUzBreWMwZDNVdjFWYlplQXdmZnZzODdrVlBoOUdzZG5xZmxXd0oy?=
 =?utf-8?B?N2plb29WU1A4YU4xYit6cENYVU5CRHNTMDRiV0U2N2NJY08xOEdieThUYWZ5?=
 =?utf-8?B?SkdRMW5BQjJ2Q2RsN2RkWjJuK01DU01jN2Npa0h4YVVUTCtuMSthVktyNDQ4?=
 =?utf-8?B?UVB6RTkwaUlPNkJ2Y1B3bU10Ty9hL25UWGJjODRxa01OVkVNNVBNRjc1THpu?=
 =?utf-8?B?S2NRWXU4alZ3dkc1VzE2UEtrb21FVHQ5eXBKK3Y1NnM4b3lqa0Q0NU55T2F3?=
 =?utf-8?B?ZEZhMFpScjNRM3MwNU9YMGxYaEc4YlUvYXUzcFM0NmtCdkI2b0pKYzhyUTBa?=
 =?utf-8?B?cDg5T2YvS3VxTG9oRkt2MFFqeURwcXBBNUVXM2VoUHBsaWRZOFJ6anpZQXQw?=
 =?utf-8?B?bzNlb1dJWmlCRnNuZ0pBV3p1YU9lUmp1QUNXUEE3TEVlTTV6a1dKeEN0dS9N?=
 =?utf-8?B?WDZLS0xROWhGZEVSOWlGR1VkVFU0ZGkzdTBDWG1LKy93Vk1USDJ6TjdpT1A2?=
 =?utf-8?B?VVYzWlFNRUFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ak1jN2NpVHdvdExuUVNOb0pjMkxBd0dNdnhKbXVObW9ucW9sRkJqRUdRN09K?=
 =?utf-8?B?dTZEREJPdXZVKzVmaDV1Q2JmRWwwdHRFa1NKRnRTb2ZuckdwL3dPZDkxMGZ4?=
 =?utf-8?B?WWI5YWtoMmpQV01GcDdKT25vMFRmUzQ1dUFnVFY0UGZBSThSWlh6RkhxUmJ3?=
 =?utf-8?B?aDY0Wjd4dTk4YzI0dklwbGgxYXM2SmJnNVBXMUFvZHVnYVpYRmVpczllV1pa?=
 =?utf-8?B?VTVsZm5hZGdtS1lOSTdHcVJUeEVBcTZydFJiVUZPT3VZM0lOWXFUTlRhaEF6?=
 =?utf-8?B?NjltMTJNOGxjT2IrZFBIUzVsZTRVd0p4YVZrRWpDWkFNV3hEZHBETDlBcTNR?=
 =?utf-8?B?cEM5ZTVsak0vRmg0VmVZSldHMkZmL1VGSVIzV0dyZ2pwWjlFVVFGK3pabS9T?=
 =?utf-8?B?MnlUd1QvUzRpaE1WU3BkQWVOMG9UOURsZEpIZVJrMkR0bHZlU3VvQlcwR1hU?=
 =?utf-8?B?TCtwUUl1QTRXRlVVeWxkOFZybDJPMThnOVhGOGMzcXhTODd0cEFZSm56U2xL?=
 =?utf-8?B?YWpxVWR5Mk5WT1YvQ0RsVTRJY0Zrb1NWY1FnMWZaRzlsUjc5eXlMbUtWZ2Rv?=
 =?utf-8?B?UU1jOTM2Q0RyTDN4MnNaRk1XQ1JWQ1E2T3I5MFVxZjFBUGpwbHNPbURqdzJo?=
 =?utf-8?B?dElnWkZLRDU3Ry9xVnJiYVIxSnFKOSt6bDdWZDVObldXK2ZTWnBhbklYMzIx?=
 =?utf-8?B?MlRoeU0zS01yK2FZTUloTWlPaGtXMjRyVktybVhUamVRS2ZYNCtmUUkvOG5X?=
 =?utf-8?B?VWtud25DRnFTRzhsWHMvNjJ1b0Z1aUJ3bTZOejBJaGhxME9jbkR5L0l3SVBJ?=
 =?utf-8?B?WGtoRzIwUC80REpMR3dCTENIUmdRMDgwbGRZakg2TTdGYy9lTnQ0Rm9aTmo1?=
 =?utf-8?B?cVp2Wm1seWpHK3NvZlZxWnZaZUV3NXZML0VKZlVZektjM1pIT3BjdW5PeXZU?=
 =?utf-8?B?aE5zenM2TmVmTFNWSlE3WG9CMXNzb21Ca2x3Q1Z2Y3BHb1JMZDNnVnJaU1lV?=
 =?utf-8?B?V2VEbEtURjY0dkNpN3BuVjhXaUVnY1REUGJBeGhQQUdlSEt0L2hQcm56Qm9I?=
 =?utf-8?B?TVlkc3Y1QjBERnlsTExYd3hHQ29oWG9oQWhSK1ArQk5kMnJxWDhzR1JzeHJD?=
 =?utf-8?B?T2ZaN3hieSt1dFZUT0FpOXNXblVURmYrS1B5ejBsK2I2T3NZVkIxbjhxd1lo?=
 =?utf-8?B?SkpCV0tCN2REeVVETFpGZVZtUHFTUGFTUWZ3T2FwbWorNTJIOFNxbSt1VU9q?=
 =?utf-8?B?bko2SlNubHVxV2hwMG41T3hFTnNrc3M0cy9ESW9MdkhlTTNJTmZ3MHV1Wng0?=
 =?utf-8?B?QVh4NWQ1cVdjVGFJL1QreTI5RldTNCswS0xDYWhqTERjbExmUHhhaVJqL3hD?=
 =?utf-8?B?cFVZcERFZkZMa0VwYUhjWlRUeitnVUZEZ1hPdGhsM2U0K25ydWlyN3kvTWg3?=
 =?utf-8?B?MzIvR2NZbG9seXNQeHVPbDBSRkZKeXpZZVdjU05SbFRYWHJLTkVKK0lETFlR?=
 =?utf-8?B?OUVDRVA4R3d4TkY4azEyZGtGbXNBZFJBVVJHOEluNG1DeFlJTVpsQnlUaEE4?=
 =?utf-8?B?UzkzT3M0R3dsRzZoRHJVV29KNHcyZ3R5NlNVUWhaY2lwbnFzWEVPS1A5T1Zh?=
 =?utf-8?B?bmJkdWpDR0RzQyttVjZPeW43N3l6OElvUjZOYmRXS3NVcTRsWExlTnVZNVF1?=
 =?utf-8?B?d3JTdGRRVUFCRFpDOWp1bWFicnkxL1VOQVhLcVhnRHYwL1ZBYmZDd0htRkNq?=
 =?utf-8?B?VkpKUGtVR0x6VkJPa0Q1d1pCQ0FzbVdWWjc0K2JCWmNvZWtLUTdWVjFZV0VE?=
 =?utf-8?B?V3hveUR0b0tMS0tBNkRNc1BUVkFsNW43Njl4QUQySERtbFBkVkp2Z2ZtTSti?=
 =?utf-8?B?L3kyclZTOU5KWFdRWlJSQmc5YmkvRWtiSUtJZ3ZFWGhqYWVEQytNYWdnNEFw?=
 =?utf-8?B?ZldGWVg3MUtwZWZVZEVJU0ZicUNGMXhxUlR1MzNyTFRNQTRRSmg0OWc5bTBw?=
 =?utf-8?B?aER0QVVaaFI1VG1yRUtnczB6ZmcxdHFqYmRKNTc1T1ZkNmUzdnJiUnI0Uk92?=
 =?utf-8?B?YnZmWEpPckc0L2IzenVWbUhicFVqTUZER1l3NHhSMnlyZFhVL0Fja1dGakNq?=
 =?utf-8?B?UkVLYlYyNXR0bFIzRThBYVZ2SngzalBraENpc2JFN3J6TjczQ2V4MVVxbjRU?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93CB4A27B903A147B7E1CB842EB2D4AA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d67da7a-4514-4697-ef75-08dd4cbbc9d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:52:38.4998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+JDGlPvINurpap+MiL1AmYIEYtQsa7ancaiH0hYpdyVrfz50/rK8hvVQmrD9yLiIctbYKk1DKsmCqTdb2uqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7319

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDE2OjAwICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IEluc3RlYWQgb2Ygb25seSB0d28gZnJlcXVlbmNpZXMsIGlmIE9QUCBWMiBpcyB1c2VkLCB0
aGUgVUZTIGRldmZyZXENCj4gY2xvY2sNCj4gc2NhbGluZyBtYXkgc2NhbGUgdGhlIGNsb2NrIGFt
b25nIG11bHRpcGxlIGZyZXF1ZW5jaWVzLCBzbyBqdXN0DQo+IHBhc3NpbmcNCj4gdXAvZG93biB0
byB2b3AgY2xrX3NjYWxlX25vdGlmeSgpIGlzIG5vdCBlbm91Z2ggdG8gY292ZXIgdGhlDQo+IGlu
dGVybWVkaWF0ZQ0KPiBjbG9jayBmcmVxcyBiZXR3ZWVuIHRoZSBtaW4gYW5kIG1heCBmcmVxcy4g
SGVuY2UgcGFzcyB0aGUgdGFyZ2V0X2ZyZXENCj4gLA0KPiB3aGljaCB3aWxsIGJlIHVzZWQgaW4g
c3VjY2Vzc2l2ZSBjb21taXRzLCB0byBjbGtfc2NhbGVfbm90aWZ5KCkgdG8NCj4gYWxsb3cNCj4g
dGhlIHZvcCB0byBwZXJmb3JtIGNvcnJlc3BvbmRpbmcgY29uZmlndXJhdGlvbnMgd2l0aCByZWdh
cmQgdG8gdGhlDQo+IGNsb2NrDQo+IGZyZXFzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1
byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IFppcWkgQ2hlbiA8
cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWmlxaSBDaGVuIDxx
dWljX3ppcWljaGVuQHF1aWNpbmMuY29tPg0KPiBSZXZpZXdlZC1ieTogQmVhbiBIdW8gPGJlYW5o
dW9AbWljcm9uLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2No
ZUBhY20ub3JnPg0KPiBUZXN0ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0Bs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gDQo+IHYxIC0+IHYyOg0KPiBNb2RpZnkgY29tbWl0IG1lc3Nh
Z2UgdG8gbWFrZSBpdCBtb3JlIGNsZWFyLg0KPiANCj4gdjIgLT4gdjM6DQo+IENoYW5nZSAndm9w
cycgdG8gJ3ZvcCcgaW4gY29tbWl0IG1lc3NhZ2UuDQo+IA0KPiB2NCAtPiB2NToNCj4ga2VlcCB0
aGUgaW5kZW50YXRpb24gY29uc2lzdGVudCBmb3IgY2xrX3NjYWxlX25vdGlmeSgpIGRlZmluaXRp
b24uDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0
ZWsuY29tPg0KDQoNCg==

