Return-Path: <linux-arm-msm+bounces-47577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF8A30C40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0228D3A33D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7644421423B;
	Tue, 11 Feb 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r2nkEnV6";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rSPpbNG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C16213240;
	Tue, 11 Feb 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278756; cv=fail; b=h6LUTIAmkp0+hZH6X2cVL/9MFV9EadWxeruBFx1LdwZ2IXCuBsxEkJU2SGdtXc+J17CA/VQXpXGpnuec97cyGzzzLfp77wqBxzZlFocpJHvAwyXZyxczlPbQ6H57+PhsRxI4OipeDV6PaP4E8EnXWDp4ZhilSYLH5I0C0VZmCEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278756; c=relaxed/simple;
	bh=yqniu4VhNHoRfx7xUjALW+xMH7ywprr04KoE0GsLsW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=exBs87ff8zInb6OeR1UHFa4twBzEC6YCbCoQdN5OJsohTNHq8QCp6lbTr/k5xlJiFEuGyV8S4Rvn0AEQw6jW4IReFykOX2EseUZp0TsOliyVpkAhYB7jbKOSPkuyq8cdyDoSKY8ZxzSjhbnV9vhZTTS6seZpEu7zb+kCXeiNGjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=r2nkEnV6; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rSPpbNG5; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fa25337ee87711efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yqniu4VhNHoRfx7xUjALW+xMH7ywprr04KoE0GsLsW4=;
	b=r2nkEnV6WQnzi87BNddKYPP0YFh9DrnAaY/50R2J4mrlgaK73g0v9CKFeq46VR1dE7dcm6GCpGhSs5D1AeA8EZPF4IZ/RrGk+t+Hi6GR+3rdA1f9Mlac69bcuNYm1KXgVAP+TjSkeBrjL3Rlm57Yw/cVf1xmmYspWAldkgJy5Sc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cd3ff8aa-2788-42c4-88f4-7bb3e67359e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:7cf26a7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fa25337ee87711efbd192953cf12861f-20250211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 695207905; Tue, 11 Feb 2025 20:59:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 20:59:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 20:59:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g37QbI/2/oCtZ6IohZi60c2bhzLb8Qgcjsaro+ngozz0Le9oKXF2+BUzD5YvEqk2zrhsf+Hp74awSPBTykE5ZukGM3dP684/qzd6Ecbeutmu3wR4ystvXEQnTO0y+aQHQS/X38cWHPVV92vSKB2fYmAzHJ/uZ38QhGBA/WCnCA/DMUox04N7EKG4awRMBWEE3xl6KSI+3gyxE1jRtda0gZxGPs6Rks86xW+jFMtc89KxxD/SewW46EAuy00riJOm+anqEnuCiIVVTorXdwIJkfeE3mW1I9O2bZ3ka0yO/1f5gssyR9tUEThIZo+bnOr4lAGx8rBJ4vcwviFqNPkoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqniu4VhNHoRfx7xUjALW+xMH7ywprr04KoE0GsLsW4=;
 b=kxrGpBUHgzVyRC7wqiQ4TNWKAxLWLHzLt02ubaUftT1U23iNecUiWOOoSX306uOxFLljLbA9ZQ7FxrGXvGnPkaCDtK0N6r7etbU9/3zoAS/M8lCQ0VV2aP3uRK8qy850p6awYR0ECdz953TlUlErnJGn/nhzHF3vhFD23nGyOl0U7Qxye3sVgZ7Tz9bHXnnElO2zW94pzm3y1Bl6qOE+yOku5lb2LydP55zRuaqVrmqzRdEENkdXAhKMpzy8Llk6tKmvP2ipCilpJsnD+KvswlcFdmOqeoBNZgwYYwFVwijP9cYovVKUaODzcmKtaNHw0XnSl2+El24Pa7C6nvmvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqniu4VhNHoRfx7xUjALW+xMH7ywprr04KoE0GsLsW4=;
 b=rSPpbNG5uq8MGgT8iaUoNqF/Z+BicwySyaPjNC3U+MHCSf/JYZ4NOZ8FxWGFd89/gD+Bj3bsSwUWeVWGsIN2bKI90bWNGm95WdhQm/3vd1Lng2Kr1/qf2oN6ExpVzTiOG+KepgYJ/GK5um3HNB1qAJNHeFxJhUI9vqrqTxcVmck=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB8072.apcprd03.prod.outlook.com (2603:1096:820:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:59:03 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:59:03 +0000
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
	<neil.armstrong@linaro.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "minwoo.im@samsung.com"
	<minwoo.im@samsung.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v4 7/8] scsi: ufs: core: Toggle Write Booster during clock
 scaling base on gear speed
Thread-Topic: [PATCH v4 7/8] scsi: ufs: core: Toggle Write Booster during
 clock scaling base on gear speed
Thread-Index: AQHbe6MW093dDpzPkUeTjevSZ1aBx7NCEi2A
Date: Tue, 11 Feb 2025 12:59:03 +0000
Message-ID: <ed02fa58c31c9b43f5a016e7cc834ab5511267c5.camel@mediatek.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-8-quic_ziqichen@quicinc.com>
In-Reply-To: <20250210100212.855127-8-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB8072:EE_
x-ms-office365-filtering-correlation-id: 784756ed-151e-4a35-ea5d-08dd4a9bdc90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SkRXaWNTRW8wRXoxVEZGZnBjRndxejNPQ2xoUlpDcVozNjMvd1o3SUlnVE9B?=
 =?utf-8?B?TExCN01SdlVFV3lJZjVXaGVRSzVoNWJQdXlZb054Ri9HSDBxZVhuRHhLaHdP?=
 =?utf-8?B?bXhYMXZobE8vamVZNk5ubHdVNmlPOGxxcGIyOXlGZU1jUE8vUWcrdVFmc1l6?=
 =?utf-8?B?Y0NuTHBVQmIxaU1rMVQ0cXZBTGRaNXVYZW5sNjQzbkcrSWFvRUdxM3JoeW1w?=
 =?utf-8?B?MHk5SXdKb29kL2JBZk5jUXRvMGN6VjdNWnRPTlhxeGZNeWFEZExCdFM3ZTVI?=
 =?utf-8?B?ZUkyMzIzdkxENGo5RW5YaXdUUUIvNzhnR2x6UXpHVWRjbVdKa2wweGxJNEJu?=
 =?utf-8?B?dlBiUVBReFdURGdOSHpaTXZlcHpvU1J2WFZyTEVEUUJjTHhtODd0OXlXQmc4?=
 =?utf-8?B?RlM4aWJyRnFtTGhGMTJ6b1JqaFJQdFcybmREUDJ6V3VLa09DUHVWSjNoLzhi?=
 =?utf-8?B?amsxT3g3R20zRHkxLzIyTEtIVWFWcUhwMGtRTTFxL29PV3NVc3RINXhyb1Vs?=
 =?utf-8?B?cWpObVBNYUhMaXlqVWwzOUE1dUZoQmNLbC9QQ0VoY203TUhmckUvMkh4TFVa?=
 =?utf-8?B?Nkp2b2JRaUJBV0VGREIrUmpmVFF6WHhyTWw0ZWhhY1BkOGx1ekdjaXI4NXdH?=
 =?utf-8?B?MmM4TXNteEZFYmhPL3FkNEtXenVmUjRvL2M4MXdScU5JVkRYR1ZBS1dNYk13?=
 =?utf-8?B?WTlUV0dTZ25kY2luSHp1dXNKWW9tMi9hUDRRVzIvSmUyZUR1T1JybHlLMFFF?=
 =?utf-8?B?bnNSNlFUaFdXMHQrSVViVXU2NlhsWGpEU1cwT0liWVVGWGtnN0pnNFZ0ZFIv?=
 =?utf-8?B?aHk5emw5Yy92TlNKdDJvbG1zcHdNSkVrdEwza0FsZ2lZZjRuOEhUdkdHWVVn?=
 =?utf-8?B?Q3pMNkJTbDlQeWNrcElRcEhKYUlhR2pHKy93V1dTQzJOYW5xa1BDYUI3WjJa?=
 =?utf-8?B?aEhNN1EyM01oOVpGVW9ldGwrRjFzVXlNaktUNjlWS3NaUjgwVi9lTER4Ukxi?=
 =?utf-8?B?UUplU0hyemxOWGhaaXphMDJLcmFuWHFlSGdNWmZGZDBWVWcyU0doR3dpd080?=
 =?utf-8?B?dWlleERqejdsZzVHazM3UnA0TWgrVGpNNW1nTWhlOXdPcnJkWDRLWlVrYnZv?=
 =?utf-8?B?ZTZTb2lBR1Bjbmx5Y0dhRGcwbjMyanF2UVU2d3dRblBWMmRXaXFoVzlIM1M0?=
 =?utf-8?B?VWxIQW5GaEtqUkdodDkrUkdkeXRYZWluanZDTGxaMi9oblhPWnlzaDI2QWtI?=
 =?utf-8?B?VUNaZXl3VnR3bjcvdXBUSHQ0d2k0NGNOdS83YmpteXQ4VlB6dXFOMUpDaWho?=
 =?utf-8?B?aXdPaTF1U0l5NExGZnJhdWg4RG1KRTdLV3RtWUpHQ3VnVE15SFhUVjhMUXpE?=
 =?utf-8?B?MEFYRFJoazV5Wm1PbEpCb2p0d1VQWTFOZkNFcVNmZ05MNnl5T1F3dmlHMVps?=
 =?utf-8?B?VU81UEdyeWJPUDhFam9yMUh4SjlKL0lTcC9MbEdvTHFId0svZDlqYlZ6QUNQ?=
 =?utf-8?B?RTZTN3VORzhJYlg0a2dYSHUyeHdsbHhNSGZnT04wMEthcUlxbnU5WWVZNWJq?=
 =?utf-8?B?TG1qWWpXTG5lSGdUd1pxaGU5U3Y2N2R3azlpVlRodHF1QVlreitVamlVN3I4?=
 =?utf-8?B?REJNc2NzU2xMZXYzbUYydE0xdERYZTJEV0tXQjIvRGZDTHZpa2N1bDZ4aFNq?=
 =?utf-8?B?QjlJU0hTTDhwRGpMK3J3Q2dySWFlZXhQTW5tb2lMemROM1AwUmxwWmRjNmpt?=
 =?utf-8?B?Wm93TWIvcHMxV3dBMFdRZWYveUxObHJMeWgrZjNhSkhCSTJOZTVzSHlUK2t5?=
 =?utf-8?B?MDVFMU15YnQ4Yzl1Z0pIUlQ1b3JqUEhrUVlLNG8wK0YvbndXdHdNSXIvKzJs?=
 =?utf-8?B?ZWYyRDdSdjhIQmlPeSt1T3d4RUNrVzlIQjd4bnFLYkhPZmpvNWc2Zm4zcU1v?=
 =?utf-8?B?T3FKSHI4a1JlZHZ4U2F0NkxicW90YTQzY05lZjRuOWRQWU5zYjd5UmtnU1Nt?=
 =?utf-8?B?U2ZMUERobERRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnFUWHpWaEtDazVuV09UNVl4ZVhRcE44b1EvcnVUQkJBTXlSdFdoVm1TRHdH?=
 =?utf-8?B?YTV6NTlIenlDenV3V1ZPNXhLVkM1QzNzYUJTMXFPOVp6SjVPb2o0cDBvenhK?=
 =?utf-8?B?Uy9SRENoOExjVGlaUXV6T3pHMUllVVVoUWVENWp1TlFZcWhxUVA3Y3pBL2s3?=
 =?utf-8?B?M052bVordVZlb1lMbW54RHdaNVkyNDVaS2oxTUVVMWNXRzJhQ3BjWnhXbGZK?=
 =?utf-8?B?RUNzeisxUFF1S2x4Z2VxSWJONHNkL0RGZ05iWkNRL015NE5UU3dzM29Jd3VQ?=
 =?utf-8?B?bFArQS9rRFZBY091NDR2WU81ZURrT2xHU1h2SUtPUDVxSVk0VU9xUURZOEUv?=
 =?utf-8?B?R1F1OWRSRkd4SENyaXBqQjR2Wm1ZbzZqRklORWxuMm1uSGF3VTBGd0NlQ3Rr?=
 =?utf-8?B?WlYxMzAzREJBQWV5ZDluUWRvQWNJNmtnZXM2eFdNRGo1SHBnbDlPdVJncDcz?=
 =?utf-8?B?MnUrVlcwRXphVHFCSTN0aVdQc1JRT3l2aU5CTDhqMkx5VG1RbHI3Z1lXRUl0?=
 =?utf-8?B?M1ZoeUY4M2d0ZlFzOC9WQXBSRExZbEYyWkN5dVY4MmhSZ2tZL1pPVjBtRHAy?=
 =?utf-8?B?N3dBNi9pR2s5M3JjN08xTXNSaFRRa2U2Z3VRMTA2UW9xOE9jb0JCMWo1WHJl?=
 =?utf-8?B?c0tmSlpZRWMrd2NPK2dQajZnenB3d3kvVHZ0VGhYZGdJckJ1Qnh4R1dnVEta?=
 =?utf-8?B?ZFU5N3JJQ25zc21lZ1RhSkg4TWRDWGREVktiN1luWFJkZnU1anc5NGw2bk9a?=
 =?utf-8?B?S01USUhFL0l6L3lyVjBONmxoTk42VXNrcjdIVHJ5V0dMMjBSeFlLQzFULzdP?=
 =?utf-8?B?M3hWeUJFZ2Q5ZnVHY29vcm5CQTN6NE40RkFlWE5qaDQwaWw4RVJlVFRGM1Fn?=
 =?utf-8?B?S2pCSDYvSGFMOGQwWlVQQ2ZPcU9KVk5LQmhFUkw5VDZkTTBoN0hYVDE5U1RE?=
 =?utf-8?B?Vzdrek5nZTE2YVpsRkVQWHl3RGw5R1IvdmxaSVZHdHBuNUljWEdOSEd6TTBt?=
 =?utf-8?B?YTkzTDJsSE5CS0lhc05BL2xHK2c4VDhIRVFQNmltTGdyZ1pQYkErb2dZMlVS?=
 =?utf-8?B?S2FqRTBEdGl6NVdMcVo4YlpFTEhZYWdwSWRjbVQwb1NtY2o0Y3hra2pGMWNU?=
 =?utf-8?B?L2hkTE9SQmdCOUszQUN3UUdibTZsaXFsVDFtN0NOZzRvNDEzRGFCRUEybDB2?=
 =?utf-8?B?M2NHMzc5c25TdFhqdnhrZ1E0dHFDNSt3S05zUjlLR3Vib3oyR3kxSEhHSDVN?=
 =?utf-8?B?ZDJkVWpzT2RJMldRVExkR2ZnRDJZaTZwVE5SYS9pdEZ0N2JhbWliemQrR3hi?=
 =?utf-8?B?eEljSDdEcWxWb1RnZmd2WERjWmczYUlSZitURnhyWlJEcURWVWQzRWY1a2pu?=
 =?utf-8?B?R2FkWkhHTjcwNWh5c1h1UXdTSCtOeXUxdzZVTU5xVUZzRFFUc0pXbWhIV2pF?=
 =?utf-8?B?alk0Q3BJL1FPcFRmaUp5R1pUeGFrR011MXFRNzZOVjFYSXEvZ2UyWko0eUpm?=
 =?utf-8?B?TXhtQm90SlRWMDBtcDB4YXdZL2s1THZuWFNiamoxWDF6UUxMSHJvRzdsd2tB?=
 =?utf-8?B?N2gzVzJsVldKYjJUN29OWDk3bC9palNuRmIrU0d0SjlIOUlhZjYrdWJUcG03?=
 =?utf-8?B?QkZqVnFRdWlONzEzV1krVjRoK3JRbEJHQ0Fma1JidTRkaEVpTDlnQ1lyTGdq?=
 =?utf-8?B?SnJKOUM0Tlp5STRjMTQxVzh1MzJHYWs0M1l3elo5cHZ1czJrNW5vVEFoNUlh?=
 =?utf-8?B?Vk8wNlNWdUJOY2l4L1RUb2JsTlFzR0J4ZzhPT1FnaUtFSEk1UHBPemF1eklU?=
 =?utf-8?B?UW5hYkwvVTBhay8vd2F6WHZLRmRrSjNtUDlBMXlUaUN6Y2JaRlpiOWdGeU92?=
 =?utf-8?B?WkgvUW11UDVOakNaSzZTSVhvK2xNN29TWUVwc0dsM0c4a3RQeFFNTTR1LzNM?=
 =?utf-8?B?Nk5OSzlkeW50WXNFcDhjOXZGa0RjenJRUlA2WXJrOXRUemFvWnQySlV4akNk?=
 =?utf-8?B?am9WVFBhVURuSERFNmR1T3dvQXM2eHZJUFprSkE2SWdvY00rZEUwTC9KUEJN?=
 =?utf-8?B?dGZrU1ErRmsyNEYxN3BnSWhsZDJjTTVhOHlWVFZKVUhuWFZvWHBiRVFTMG94?=
 =?utf-8?B?UDh3ZEtuaWZLaUNGNkFFSkFmcXFVVzh6UkR1YzgrYzZOcGNabEpmZGdaWmhE?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D12E6F4077C214EAC3D355629476A7B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784756ed-151e-4a35-ea5d-08dd4a9bdc90
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:59:03.6893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mp6YDskTq7pef+TA7aqDXF7gs8h/S5GvjytNfqoRhosvHGb5LZA8VIOlNPL6Xu/xzlB9L9AB26LIoZx965AyNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8072

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE4OjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IER1cmluZyBjbG9jayBzY2FsaW5nLCBXcml0ZSBCb29zdGVyIGlzIHRvZ2dsZWQgb24gb3Ig
b2ZmIGJhc2VkIG9uDQo+IHdoZXRoZXIgdGhlIGNsb2NrIGlzIHNjYWxlZCB1cCBvciBkb3duLiBI
b3dldmVyLCB3aXRoIE9QUCBWMiBwb3dlcmVkDQo+IG11bHRpLWxldmVsIGdlYXIgc2NhbGluZywg
dGhlIGdlYXIgY2FuIGJlIHNjYWxlZCBhbW9uZ3N0IG11bHRpcGxlDQo+IGdlYXINCj4gc3BlZWRz
LCBlLmcuLCBpdCBtYXkgc2NhbGUgZG93biBmcm9tIEc1IHRvIEc0LCBvciBmcm9tIEc0IHRvIEcy
LiBUbw0KPiBwcm92aWRlDQo+IGZsZXhpYmlsaXRpZXMsIGFkZCBhIG5ldyBmaWVsZCBmb3IgY2xv
Y2sgc2NhbGluZyBzdWNoIHRoYXQgZHVyaW5nDQo+IGNsb2NrDQo+IHNjYWxpbmcgV3JpdGUgQm9v
c3RlciBjYW4gYmUgZW5hYmxlZCBvciBkaXNhYmxlZCBiYXNlZCBvbiBnZWFyIHNwZWVkcw0KPiBi
dXQNCj4gbm90IGJhc2VkIG9uIHNjYWxpbmcgdXAgb3IgZG93bi4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBa
aXFpIENoZW4gPHF1aWNfemlxaWNoZW5AcXVpY2luYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFpp
cWkgQ2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJlYW4g
SHVvIDxiZWFuaHVvQG1pY3Jvbi5jb20+DQo+IFRlc3RlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiANCj4gdjEgLSA+IHYyOg0KPiBJbml0
aWFsaXplIHRoZSBsb2NhbCB2YXJpYWJsZXMgIndiX2VuIiBhcyAiZmFsc2UiLg0KPiB2MyAtPiB2
NDoNCj4gMS4gQWRkIGNvbW1lbnQgZm9yIGRlZmF1bHQgaW5pdGlhbGl6ZWQgd2JfZ2Vhci4NCj4g
Mi4gUmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSB2YXJpYWJsZSDigJx3Yl9lbiIgaW4gZnVuY3Rpb24N
Cj4gwqDCoCB1ZnNoY2RfY2xvY2tfc2NhbGluZ191bnByZXBhcmUoKS4NCj4gLS0tDQo+IMKgZHJp
dmVycy91ZnMvY29yZS91ZnNoY2QuYyB8IDEyICsrKysrKysrLS0tLQ0KPiDCoGluY2x1ZGUvdWZz
L3Vmc2hjZC5owqDCoMKgwqDCoCB8wqAgMyArKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
ZnMvY29yZS91ZnNoY2QuYyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCj4gaW5kZXggYmQ5
MzExOWExNzdkLi4xMjc2ZjRhOTg3YmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdWZzL2NvcmUv
dWZzaGNkLmMNCj4gKysrIGIvZHJpdmVycy91ZnMvY29yZS91ZnNoY2QuYw0KPiBAQCAtMTM5Mywx
MyArMTM5MywxMyBAQCBzdGF0aWMgaW50DQo+IHVmc2hjZF9jbG9ja19zY2FsaW5nX3ByZXBhcmUo
c3RydWN0IHVmc19oYmEgKmhiYSwgdTY0IHRpbWVvdXRfdXMpDQo+IMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7DQo+IMKgfQ0KPiANCj4gLXN0YXRpYyB2b2lkIHVmc2hjZF9jbG9ja19zY2FsaW5n
X3VucHJlcGFyZShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBpbnQNCj4gZXJyLCBib29sIHNjYWxlX3Vw
KQ0KPiArc3RhdGljIHZvaWQgdWZzaGNkX2Nsb2NrX3NjYWxpbmdfdW5wcmVwYXJlKHN0cnVjdCB1
ZnNfaGJhICpoYmEsIGludA0KPiBlcnIpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoCB1cF93cml0
ZSgmaGJhLT5jbGtfc2NhbGluZ19sb2NrKTsNCj4gDQo+IC3CoMKgwqDCoMKgwqAgLyogRW5hYmxl
IFdyaXRlIEJvb3N0ZXIgaWYgd2UgaGF2ZSBzY2FsZWQgdXAgZWxzZSBkaXNhYmxlIGl0DQo+ICov
DQo+ICvCoMKgwqDCoMKgwqAgLyogRW5hYmxlIFdyaXRlIEJvb3N0ZXIgaWYgY3VycmVudCBnZWFy
IHJlcXVpcmVzIGl0IGVsc2UNCj4gZGlzYWJsZSBpdCAqLw0KPiDCoMKgwqDCoMKgwqDCoCBpZiAo
dWZzaGNkX2VuYWJsZV93Yl9pZl9zY2FsaW5nX3VwKGhiYSkgJiYgIWVycikNCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdWZzaGNkX3diX3RvZ2dsZShoYmEsIHNjYWxlX3VwKTsNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWZzaGNkX3diX3RvZ2dsZShoYmEsIGhiYS0+
cHdyX2luZm8uZ2Vhcl9yeCA+PSBoYmEtDQo+ID5jbGtfc2NhbGluZy53Yl9nZWFyKTsNCj4gDQo+
IMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmaGJhLT53Yl9tdXRleCk7DQo+IA0KPiBAQCAt
MTQ2MSw3ICsxNDYxLDcgQEAgc3RhdGljIGludCB1ZnNoY2RfZGV2ZnJlcV9zY2FsZShzdHJ1Y3Qg
dWZzX2hiYQ0KPiAqaGJhLCB1bnNpZ25lZCBsb25nIGZyZXEsDQo+IMKgwqDCoMKgwqDCoMKgIH0N
Cj4gDQo+IMKgb3V0X3VucHJlcGFyZToNCj4gLcKgwqDCoMKgwqDCoCB1ZnNoY2RfY2xvY2tfc2Nh
bGluZ191bnByZXBhcmUoaGJhLCByZXQsIHNjYWxlX3VwKTsNCj4gK8KgwqDCoMKgwqDCoCB1ZnNo
Y2RfY2xvY2tfc2NhbGluZ191bnByZXBhcmUoaGJhLCByZXQpOw0KPiDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Ow0KPiDCoH0NCj4gDQo+IEBAIC0xODIxLDYgKzE4MjEsMTAgQEAgc3RhdGljIHZv
aWQgdWZzaGNkX2luaXRfY2xrX3NjYWxpbmcoc3RydWN0DQo+IHVmc19oYmEgKmhiYSkNCj4gwqDC
oMKgwqDCoMKgwqAgaWYgKCFoYmEtPmNsa19zY2FsaW5nLm1pbl9nZWFyKQ0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaGJhLT5jbGtfc2NhbGluZy5taW5fZ2VhciA9IFVGU19IU19H
MTsNCj4gDQo+ICvCoMKgwqDCoMKgwqAgaWYgKCFoYmEtPmNsa19zY2FsaW5nLndiX2dlYXIpDQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFVzZSBpbnRlcm1lZGlhdGUgZ2VhciBz
cGVlZCBIU19HMyBhcyB0aGUgZGVmYXVsdA0KPiB3Yl9nZWFyICovDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGhiYS0+Y2xrX3NjYWxpbmcud2JfZ2VhciA9IFVGU19IU19HMzsNCj4g
Kw0KPiDCoMKgwqDCoMKgwqDCoCBJTklUX1dPUksoJmhiYS0+Y2xrX3NjYWxpbmcuc3VzcGVuZF93
b3JrLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVmc2hjZF9jbGtfc2Nh
bGluZ19zdXNwZW5kX3dvcmspOw0KPiDCoMKgwqDCoMKgwqDCoCBJTklUX1dPUksoJmhiYS0+Y2xr
X3NjYWxpbmcucmVzdW1lX3dvcmssDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vmcy91ZnNoY2Qu
aCBiL2luY2x1ZGUvdWZzL3Vmc2hjZC5oDQo+IGluZGV4IGNkYjg1M2Y1Yjg3MS4uZWZjYTcwMGQw
NTIwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Vmcy91ZnNoY2QuaA0KPiArKysgYi9pbmNsdWRl
L3Vmcy91ZnNoY2QuaA0KPiBAQCAtNDQ3LDYgKzQ0Nyw4IEBAIHN0cnVjdCB1ZnNfY2xrX2dhdGlu
ZyB7DQo+IMKgICogQHJlc3VtZV93b3JrOiB3b3JrZXIgdG8gcmVzdW1lIGRldmZyZXENCj4gwqAg
KiBAdGFyZ2V0X2ZyZXE6IGZyZXF1ZW5jeSByZXF1ZXN0ZWQgYnkgZGV2ZnJlcSBmcmFtZXdvcmsN
Cj4gwqAgKiBAbWluX2dlYXI6IGxvd2VzdCBIUyBnZWFyIHRvIHNjYWxlIGRvd24gdG8NCj4gKyAq
IEB3Yl9nZWFyOiBlbmFibGUgV3JpdGUgQm9vc3RlciB3aGVuIEhTIGdlYXIgc2NhbGVzIGFib3Zl
IG9yIGVxdWFsDQo+IHRvIGl0LCBlbHNlDQo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
aXNhYmxlIFdyaXRlIEJvb3N0ZXINCj4gwqAgKiBAaXNfZW5hYmxlZDogdHJhY2tzIGlmIHNjYWxp
bmcgaXMgY3VycmVudGx5IGVuYWJsZWQgb3Igbm90LA0KPiBjb250cm9sbGVkIGJ5DQo+IMKgICrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrc2NhbGVfZW5hYmxlIHN5c2ZzIG5vZGUNCj4gwqAg
KiBAaXNfYWxsb3dlZDogdHJhY2tzIGlmIHNjYWxpbmcgaXMgY3VycmVudGx5IGFsbG93ZWQgb3Ig
bm90LCB1c2VkDQo+IHRvIGJsb2NrDQo+IEBAIC00NjcsNiArNDY5LDcgQEAgc3RydWN0IHVmc19j
bGtfc2NhbGluZyB7DQo+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB3b3JrX3N0cnVjdCByZXN1bWVf
d29yazsNCj4gwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB0YXJnZXRfZnJlcTsNCj4gwqDC
oMKgwqDCoMKgwqAgdTMyIG1pbl9nZWFyOw0KPiArwqDCoMKgwqDCoMKgIHUzMiB3Yl9nZWFyOw0K
PiDCoMKgwqDCoMKgwqDCoCBib29sIGlzX2VuYWJsZWQ7DQo+IMKgwqDCoMKgwqDCoMKgIGJvb2wg
aXNfYWxsb3dlZDsNCj4gwqDCoMKgwqDCoMKgwqAgYm9vbCBpc19pbml0aWFsaXplZDsNCj4gLS0N
Cj4gMi4zNC4xDQo+IA0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgV2FuZyA8cGV0ZXIud2FuZ0BtZWRp
YXRlay5jb20+DQoNCg0K

