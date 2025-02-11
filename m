Return-Path: <linux-arm-msm+bounces-47576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A896CA30C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488511639E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA462147F8;
	Tue, 11 Feb 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d+ZpJUSh";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Avc///A4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547121CFE6;
	Tue, 11 Feb 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278729; cv=fail; b=QijNEn9DgRhbymvuuaaIKcsAOtRffvpncihnK8RfsHQU+AyH28heceRidvZxbNPH/R9WN/LG9x4EU+9wnechDY2YbGgVewa7+QeYGODky13L1TOhJwPf68sqN7gCr8AHmwdAd9a0myVctN9Zau7v+zU7ryoxIxK3lIE9shjnKcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278729; c=relaxed/simple;
	bh=tcoVwezglRX4jxWH9tVFR/BuetyI4/oazfdp0uyYSm4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jfQuFas3eK+I2REVIq+wKptH4nBAaao/2LGo0Yau2XEmpJWffblaoCMDiIgjx/o9+fC/Qb7igO5ZRASXpjEw3jeGlNtBvMKZxeOH6jurouTJ63yrK6jb+yZmV1hbKctRKdhoWr7yqP+nXoUkvJIgrx4FrP4fA06D7cu5ibf0JIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=d+ZpJUSh; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Avc///A4; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: eace8114e87711efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tcoVwezglRX4jxWH9tVFR/BuetyI4/oazfdp0uyYSm4=;
	b=d+ZpJUShlYU1piFg1b2XKZSO3SEM6bwz/mZVwsTTEqvcbqLrlrDt4WDkqzoLrCvPUWT1HbXB/oz3Ip+i1+2azQV0XrMHD5j1zmNtV5x8qh9L6SskuSHWnLW5ThjXDn02HNwCs8OSddRm090msyZBo6zrXnGvrPoGTTAf12nJrjc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:857a59aa-7b52-44d0-bb93-92f82ce5f5bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:9ef16a7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eace8114e87711efb8f9918b5fc74e19-20250211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 831501858; Tue, 11 Feb 2025 20:58:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 20:58:39 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 20:58:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq2aOTAp+owb/TJv/rSxpkFl6HIaF6jGzoVjqGJTl1j2M1DK2MzyLiMTLaXYz3P8Z5V+jzE/jnwnDQ8uZEG349eusRjQBuvLv7HOFcLhzX73KeMnaZYNELb9/hbTZ+4+JosZK1zUINHxduw9dkozOAlMtYw+vF9uGR3+kVf/CYArAFMS05uenr6pNDv08bvll2uoS9Ba1by19+0Vs97fqd1MqDkJpV+hs4IbTPHi0qxnIJLNywJgG58sCK8+2wOI5ssNYgjhTkf6qn2xGejH1XD2Tp9DypyHl38BUPOeJZ1Ak3T9eBsbxLw6n+TeFMY10RZWIdzS5jhJkQfd8UZ4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcoVwezglRX4jxWH9tVFR/BuetyI4/oazfdp0uyYSm4=;
 b=fVFt4y6wc4BEvqniOr71OheSngvgReB+SHjd5Go9/o1Bp57SukgeTHFnIDzH1CCTHX5c7Yt32X47FaG38tj7b/y7Ewio6lIj92mO8pMe6kJjYFezU+CH5+WiZ4B+PiXJn7y2ByZFHclD3LZC5Rot217Da30u6oNvzZ7h+POL7tgJ3X5NFazOOAEro05MRmp+NaygHl2tJqVsybx4zgzfo1g5vPNZ2CUKQb1fH7fUdacOFbxYn5CFSa+qqxqa67y3YMa3M4XGTSdGY9vcrG5BRFJvpfotwlgquWA2HpN2r3tvBvcWdd6Sy5xDRF78WSuCx3mTYDjyfSl7X2GnePmHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcoVwezglRX4jxWH9tVFR/BuetyI4/oazfdp0uyYSm4=;
 b=Avc///A44YA28/XYJscvF4+m2hyKp1mQ6N4Z9xzUqntQqA7CDZncxnaW1e1Q8GPU8gjxNe9kOr0YjaTyBNnGG3uI704+nULTzT6M1DOTFM/0jQ0i5/WKaKjHBpPoMiS3HNxu4mdLmxp2dsWdZWf/uzl/f9Twr9J59dXcNiAliWw=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB8072.apcprd03.prod.outlook.com (2603:1096:820:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:58:37 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:58:37 +0000
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
CC: "ahalaney@redhat.com" <ahalaney@redhat.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v4 6/8] scsi: ufs: core: Check if scaling up is required
 when disable clkscale
Thread-Topic: [PATCH v4 6/8] scsi: ufs: core: Check if scaling up is required
 when disable clkscale
Thread-Index: AQHbe6MEkrpZwDdHM0uawCDRwYB/d7NCEg0A
Date: Tue, 11 Feb 2025 12:58:36 +0000
Message-ID: <34a7946c01e263c57738a9dbcce0d672c7acea0c.camel@mediatek.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-7-quic_ziqichen@quicinc.com>
In-Reply-To: <20250210100212.855127-7-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB8072:EE_
x-ms-office365-filtering-correlation-id: f3e8ead2-5a45-4d54-9c33-08dd4a9bcc90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?REtodEg0d2VsbzBQU0pqRWtzQUJzdDVsZWJ0K1dXVUNKbUgyY0d4TmlqeGxH?=
 =?utf-8?B?dzhTMEQxRkV5dmswWFBjL2E0YUtjb0RtN2xoV285eFJuUW1PWEVSTm1wWi9C?=
 =?utf-8?B?UUxLK2l0ZTI4b0sybWtYWW8rcXZxQ2RYa3hpVy9CaDMxaCsxSEdmZEZtTmQ1?=
 =?utf-8?B?TjYzUUgvWGM2MERZY2dGTUllTUJwbkswSFJRYmlkaGM2aW5oUUdUS1o5MkZo?=
 =?utf-8?B?TE9jZmpidUFySHdLRG9mWE9qR2RsMHFRNncwV2w0aVI4VFM5N09kRzhEZ3k4?=
 =?utf-8?B?N2hzTDJsQXBRL2tGZ3hUZkc4ZEZYN05wZTlXcFpNTnZMSzk2RkllUUttYTJM?=
 =?utf-8?B?SzJEL2NiS0pqWmR3WEZYK1lDRllhaDJsSmpRSWR1WjJwd0xFVXF2MURmK2Iy?=
 =?utf-8?B?WTFyT1FIQnZwcjBvMlFSLzhHZFJnRnpielVzMmVibmRmSkt1YzBwdDR4VzlM?=
 =?utf-8?B?dllDSTA0bjZJa2ZnMmc0QnhWTHNNNnl1aVMzcG1vRUxSRTd4YVMzdXluUzh2?=
 =?utf-8?B?QVVVeFU2MWhhT2NGamV5Mlk3NUZtQm5iUmxMRzUzTzRoNVlNNkVsYkFPbi96?=
 =?utf-8?B?T1FOTlhFUEtLQ0VTNzdQMFBiUmYwWVpweldHRXk1MGM2TEFZZ0QvSi9ndU4x?=
 =?utf-8?B?TmxZbVpxV1lSeEJvOC9GaHRQTDVYaTQxdHpmd1BaKzB6WGdvTUpUenJnZ2hw?=
 =?utf-8?B?eEJCd0lEcGxJMks0V05jTjRWMHJSMzhKc1VWSWpmMHc0QWt4WlBiUDdwa2E4?=
 =?utf-8?B?V3dPZmU1ZS9YdDZHWmZ0ZjM1NVNXYWhPQktzU1crcGpMdlhmNk1RWlJraTIv?=
 =?utf-8?B?WUJVcm95V0VJbHBKVzFIOFJDV3l3OWlnOU1UdmRaaGRURTR5NjdzbUVLeUtW?=
 =?utf-8?B?UGpLZzNCVVZoTG9RR200OU9jRkpzMVpzVms1QktuZEVzTFQ2aEhMVDhKejRB?=
 =?utf-8?B?d1Y1aUVxUFFCbzU5ZHlnZXBTdzJwTHhIMWJrSmtUbTA1dE9sOUhieTdabXlZ?=
 =?utf-8?B?dkFqTWtaWGJqUG11a1pvYnppb1FGWEhFYWVrS2hJMk04bnE2aFdqcXpWTStt?=
 =?utf-8?B?UXJ5VWFza1IxclBaVy85empocGtJWitrUTY2MkpTdkJYRE5NUlo3SzlhRENW?=
 =?utf-8?B?bTdBaDVlZVBaRDM2VnIrL2hqL0c4QlFqc1hzMVN1Wk90V1RBVVJ4cmhaQVRq?=
 =?utf-8?B?T3Ntejl0YUdTa0ZkbkV0d3pTeXVVTkRlZno1S09rS3MxMlVyN29abE5rcWxx?=
 =?utf-8?B?WVhNVmdnZytianVqdkFuenhGbGJ4Y1JVdS9ybVVLbENvcEpobHlsZ1pEOVBq?=
 =?utf-8?B?d3VPb204VHFtTWZRb3p1ekNaOHkxUm5yNUFoYWlDelF6SUI2K2hvN2VKYThX?=
 =?utf-8?B?NDRtQ0o0YlRZRW9PRGdEMjY1VEpSNE80SG1VRlZIYjZ1WFMzUTduWjFuTkdC?=
 =?utf-8?B?WkFmU0tIVUMxRktVLzBmTVZYNHRsUUJTVDB5d0k0R0xLQXpWOWk3SFBrclU2?=
 =?utf-8?B?cVoraElBUERhckdPa3RlMDRTcHQwYmF3NjRxaUFkVm1KRGMvRHVOdSsvZDFl?=
 =?utf-8?B?cEp6N05WY3NSRzJ1YmNJaHNWb29HU1hETzRvOFFGWGVjUUlFR09iMjZKYlZT?=
 =?utf-8?B?NHNjOTl4T2NsekplM01DU3hPQ0FFMVdLV2d5Y25OWm5tSTl0cjl5czQ3MHZr?=
 =?utf-8?B?cERLT2hURUZvZHhNc3hLM3pqMWNhS3BGY3dtSjVPY096cXVnY2V4V3UvRUk4?=
 =?utf-8?B?ZEhaNXQ3WVJGWnFrZHpESlJiY3BLaDhOckpPSWRXNjU1RFZ1Ly9rbW5vZFVw?=
 =?utf-8?B?QzE2YUp0QTRVQlo0NlAwS3dRNU9ZMXVieVRnYkVjWGRuWCtEKzluQ2Q5UDkw?=
 =?utf-8?B?d0lsbDh6OTg0ekdqLzk0MEhTLzc1Q1Q3Qm1ZR0txOGJOc1l0ZmI1azV0RVEr?=
 =?utf-8?B?SDdCUWkxYmlkMUlnNjBmdjd6SCtRYm9rSHNESFdkVGZFa3NqT3VMOU5UNkJv?=
 =?utf-8?B?STZrQWdxYkZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnNuNGlibjZZODV1N3ZZTWRMSHUwQi9KZUwyWXY3UThodFJ2NGFMdkRyM1E4?=
 =?utf-8?B?MWtwNmttL3FyNHJoV2V6SjZhVG5aRmN3Z3A1WUU4Q3VNaTRIaXZmZjU1bzRJ?=
 =?utf-8?B?QVZCMVhFckVib1ZVTlZBcGxRT2Vxd1dQc1ZBUEp4bmV2MStmQklXdkliNE85?=
 =?utf-8?B?UFZlbGVOUkhheXhWdnBBNm9XZ0lSWjBOcE9GS2lrQWU4Z0Z3UE1FblplRjha?=
 =?utf-8?B?LzZCQWhzc0MyWXpURzJDa0ozelBEOStadUE1eUd6Z004K3grN0hXdkY2aFVr?=
 =?utf-8?B?OGU0M1VWclJOUDd0R0o1S3VnU2FFSTE0V3FsWERiTWJhVlZGMWFEeUhFV01y?=
 =?utf-8?B?cVVjT1dqSHBSaUlTeUtHRXM2RFR6VE1BelJ0c2hVZnNFdlkwRG4waXBRRVA4?=
 =?utf-8?B?Y1g5bGNSTlJ6aDlwek5YYU4rRUFlYjhHWXZHMno5YVNYcDlIYzZJK0ZZdHQx?=
 =?utf-8?B?dElTYm9xMDJPZ3ZhdHBTMDBnMW1IWk4wRlBmaGVMM3BydEM3ZGl5cHl1NFBT?=
 =?utf-8?B?ejlwMWtTQUJCOCs3WVB1UkhLWEhlNnRycnROOTVKczhHd1E1ajduYjRsSk83?=
 =?utf-8?B?ZUJTRWUrMmV0dDNLYlhxdU8rWFlSYTlDY09rZ2sxMWtPQ2lqSVVJYWJqTDAz?=
 =?utf-8?B?TVNqTHZxdWRuaVBJcjJuSVU5UWZTNVJNZ0JOQUVNTE5WQWxkamUxbzVtODBz?=
 =?utf-8?B?UUJwTkkvRjl4cUJldmJNbVFTbVBBM2o4WFB2YmxVSHFvUjU4M1lDVUJoRU9L?=
 =?utf-8?B?cERTR2VRcWtGaTRCQkJPdlBLVi9oa3kxOHU1enRveGhRakw3dXlaZFBsWDdz?=
 =?utf-8?B?VE8vNHEwZ0g3YXBHL1JtdFdjUGJUZmhRaXhqbmRMczZSTEZNdzRJR2FtcC9j?=
 =?utf-8?B?SjFVemM1RzZ3N010K28ybEtybndWNU4vcFNsN04yb3N0dVByS1l1TnRwdzN0?=
 =?utf-8?B?SnRlVHZYbzh0bmJ4MG5aNjh0dXNWRTl1QVp4S00xeno1MjRmekVQVjFZdHVj?=
 =?utf-8?B?SC80QXBpOEFwUWtwZnJjTUdFMU9PcHJNSUtLSE5QY2pSS2VvdDFLT1V3NXUr?=
 =?utf-8?B?WFg3aHpBdVdwdi93RWpSam5sbHZYeEZBclovZlh5MzQzT21yeE9SckpIb1ND?=
 =?utf-8?B?SlVWNm5KT1BjbzdaaTFwME50UlNZUmw4ZXdsZHloMkhIbUhTN1p6akRBS2t0?=
 =?utf-8?B?R2xXUEVDY202cXRoME9UM2hOelFObE13NE5meUphclhoRUJxczVZbkpBazRw?=
 =?utf-8?B?THNpMUtGRVV2Wmt4RFdoVk1kODJHSnhGd1RtemJKa0FsNExSekZTekxKL2tU?=
 =?utf-8?B?OTJNYzl0QVZ6NW0rczRNdlcyYU9vYTE5M3dpM2FlYUpyNi93b01yb243aEda?=
 =?utf-8?B?elZ1cFMwb2VCWGlwN3hDZisxZnNUMzVISG9EZ0RsM2FjaTlQb2RUR1RXcTND?=
 =?utf-8?B?MUtDWkNBSTJUOTc2WkpKMk5CaWZnVzRSaFUreklqc0hRQXZtYzY3d1UvWUtK?=
 =?utf-8?B?WFI4dDdkUndiZEtIa1ovQmNaWGVac05KSmtzQ0k2Y0thZ2ttSmtHWWQ2NWZj?=
 =?utf-8?B?WEUxc2RsdnJ3Q0Z6RkZMT05CNlhhWVBwRVlSZ1hQUVpZQWZKQWJvSGRrZTF6?=
 =?utf-8?B?aUNyYmJtTXc0RjI0NTZZeDVSblYxSFNxb0RKZVlra2xkRFhSQ25jODhoNTkz?=
 =?utf-8?B?YjViUitSRkZVNDFpeUVDZlk3a0l6RXBaMi8wWHhab1NINDlRKzNJempNR2lZ?=
 =?utf-8?B?TDRhSlg4d0lSMDRPZjkrVlhKSUw5SGNoU050cTBEbkZVelhSWksxakxwZjJz?=
 =?utf-8?B?QmoxNUEvVWtiL3hPUXJBTmpiRnIwY05UU3pBdytLUWZvVk50QkZqTWRzR3Bq?=
 =?utf-8?B?NWhXSForQWxvalVRa1Zvdko5bmw0MC96ZHMxTnpwK1RVdENIVG9lZFArTkhk?=
 =?utf-8?B?dTZBNVNDa2pyeHV4S1JGOXZXTEdHOG5ETU5lck5TL1NEYVhIVEpLNi9xNThu?=
 =?utf-8?B?dG52NloyanEzWnMxNy9kOW1sTEVLSFVXRHJUeFZQTjBLcjUvUWVSMUpJSEJI?=
 =?utf-8?B?K2JWUmRKRWo2bTVKbWlVR0NXajllUC9LMWlEUVlTMzdoZjJSQWVuVkpZU2ZG?=
 =?utf-8?B?dDhtS3VpQy9CcjhleStGMEM0SXp1cjBHc0NWbWwvVTdLSEtBY1RtRk9lZE0y?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8550EB33B3AEC14089849A7EEDCAE69B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e8ead2-5a45-4d54-9c33-08dd4a9bcc90
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:58:36.8419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKOvkGKzCtBmxM+jtJtb7HR0HvYaoTlP0Sca+7UI8rk9C2b5iQ4I9VtO0OpyQt6AcpE6j5QF9OmpAh/v3zvgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8072

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE4OjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IFdoZW4gZGlzYWJsaW5nIGNsa3NjYWxlIHZpYSB0aGUgY2xrc2NhbGVf
ZW5hYmxlIHN5c2ZzIGVudHJ5LCBVRlMNCj4gZHJpdmVyDQo+IHNoYWxsIHBlcmZvcm0gc2NhbGlu
ZyB1cCBvbmNlIHJlZ2FyZGxlc3MuIENoZWNrIGlmIHNjYWxpbmcgdXAgaXMNCj4gcmVxdWlyZWQN
Cj4gb3Igbm90IGZpcnN0IHRvIGF2b2lkIHJlcGV0aXRpdmUgd29yay4NCj4gDQo+IENvLWRldmVs
b3BlZC1ieTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBDYW4gR3VvIDxxdWljX2NhbmdAcXVpY2luYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFppcWkg
Q2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJhcnQgVmFu
IEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPg0KPiBUZXN0ZWQtYnk6IE5laWwgQXJtc3Ryb25n
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiAtLS0NCj4gwqBkcml2ZXJzL3Vmcy9jb3Jl
L3Vmc2hjZC5jIHwgNCArKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMgYi9kcml2ZXJzL3Vm
cy9jb3JlL3Vmc2hjZC5jDQo+IGluZGV4IGViYWI4OTcwODBhNi4uYmQ5MzExOWExNzdkIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQo+ICsrKyBiL2RyaXZlcnMvdWZz
L2NvcmUvdWZzaGNkLmMNCj4gQEAgLTE3NzcsNiArMTc3NywxMCBAQCBzdGF0aWMgc3NpemVfdA0K
PiB1ZnNoY2RfY2xrc2NhbGVfZW5hYmxlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gwqDC
oMKgwqDCoMKgwqAgZnJlcSA9IGNsa2ktPm1heF9mcmVxOw0KPiANCj4gwqDCoMKgwqDCoMKgwqAg
dWZzaGNkX3N1c3BlbmRfY2xrc2NhbGluZyhoYmEpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqAgaWYg
KCF1ZnNoY2RfaXNfZGV2ZnJlcV9zY2FsaW5nX3JlcXVpcmVkKGhiYSwgZnJlcSwgdHJ1ZSkpDQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3JlbDsNCj4gKw0KPiDCoMKg
wqDCoMKgwqDCoCBlcnIgPSB1ZnNoY2RfZGV2ZnJlcV9zY2FsZShoYmEsIGZyZXEsIHRydWUpOw0K
PiDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihoYmEtPmRldiwgIiVzOiBmYWlsZWQgdG8gc2NhbGUgY2xvY2tzIHVwDQo+ICVk
XG4iLA0KPiAtLQ0KPiAyLjM0LjENCj4gDQoNClJldmlld2VkLWJ5OiBQZXRlciBXYW5nIDxwZXRl
ci53YW5nQG1lZGlhdGVrLmNvbT4NCg0KDQo=

