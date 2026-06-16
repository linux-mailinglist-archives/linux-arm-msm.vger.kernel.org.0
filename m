Return-Path: <linux-arm-msm+bounces-113375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HqtbFx0nMWpPcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:36:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F419B68E5DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=OzWzgCRg;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=XF8CmIuD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113375-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113375-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73585300490A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FB23B71DD;
	Tue, 16 Jun 2026 10:36:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA09357CE8;
	Tue, 16 Jun 2026 10:36:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606170; cv=fail; b=uW4aAFq9lDiMHHX553Df76gs9GPVSHf3GS7RhaxxnbwHAj1OHsomaBb+FlSpwP+OWzz4v61jkFCWT4ZreD1cnkMzHcEeYT60ezcrlfrbIurKW6MeSYWUR7raQSk8JglXsutueEeWtKoHHiYqQN4o5Dg0706wFvGTn3DvFqDUGZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606170; c=relaxed/simple;
	bh=dfutY/apOz9Ju4PDzxUbmEd2L6eJaHcsr0X/7jf/9U0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QRALdc3YT29FwddE2Akp6YucK57IyzkBHqzQfItEr3MRvE84IgfJS2KYm4x4NhwBQj4s2YKiYXlIDLfDgwN4HDMOK6lVL5eFVELawPQTCnw7xRJk0ImgkCHlmWva9khm8CmgjpbGp2uGSaOLMQ3opB4Rua5g3w55JhYHHPnBh/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OzWzgCRg; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XF8CmIuD; arc=fail smtp.client-ip=210.61.82.184
X-UUID: 2790513a696f11f18dc8c9802ae25ab1-20260616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dfutY/apOz9Ju4PDzxUbmEd2L6eJaHcsr0X/7jf/9U0=;
	b=OzWzgCRgJzNtfb9v0sbXlH0eVeclLtx8zcZCguS4PeG0M2MqNYsDkKK9W1Un3oEhPbhAAipHCTCPV8f12c5qxam49tVaSLUD5ebq9JwqGtc3cXvvIfzljq3HhYf6YgMchIFfs+xHoGwycDHB3dGEMe29h+qgziUTH9PXM+IhssA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:cc867e1c-5f6f-4a83-ab09-bc7a155b5502,IP:0,U
	RL:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:12
X-CID-META: VersionHash:d497b38,CLOUDID:bc4226a5-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:99|11|95|82|106|80|1,File:130,RT:0,Bulk:
	nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2790513a696f11f18dc8c9802ae25ab1-20260616
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1698733663; Tue, 16 Jun 2026 18:35:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Jun 2026 18:35:53 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 16 Jun 2026 18:35:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o19mYW8GF/MuqVFZ29+twSw3yxi5ld8TUn2nL0o4UvYr3wKVH09tuRjm3GR3dxr96UXRKjv+xV9rJsq9wAUvvaslv+aK13xGwjz+r8Hom3i3NDQanwwy49uOY4zTLGnwLKRWKIfyI/O2VA1Eg7Nd/lMW+1Ltsyg6RyFWVax+sr0RzEw3qoeMnrzXpifqKJuzy34Kl7X9L66XYkw0jWMDYCdysqGS/PHR9jR8eAfHd8Zote8Z7cUE7rfOXrJ8i5k1toIazs2U3fYUnrIPwSEm21vOaDiD3y3Enbx70dQCM9hiD3XbXya56zT6tOFsiE1jc7+Xgj1UQ36Hp7dxLmJvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfutY/apOz9Ju4PDzxUbmEd2L6eJaHcsr0X/7jf/9U0=;
 b=a6rp9ewLvZzq+CqoczMVihf1eUQdb/+nEzYmCHfrcyPk0bIIplPt7xZZXs6y+hQbuj9cKKM8UTo9/I2tDr+Ns0XGzUCIWycF3zz0rn0Gjx6P8Jdv5TUjCQPU8v0QtBTAuHfsNjSw9xenb/L7IWZXLwxeQGOH0hJrkuc85eN8tQceLSVUUZTROeirNTOiC9IifMXV1bNk7Ex9Edwgc8aGe4KcCS8VCm8vH/kzjQYF6m4AFPZhn7xTXlidvYyYBr4fyT6geik26r/wQj5Y0DLnp7Ytan9nZTiASExqOgutvHpyZ/nyzdD5U+UaQbpg19NlISU+3aGgdX7nfvApkRTHKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfutY/apOz9Ju4PDzxUbmEd2L6eJaHcsr0X/7jf/9U0=;
 b=XF8CmIuDh8lpKore6WW2eM5PY10s5/DU8BoBmNn6HY/KXZfak9ZQqFp7Yq70ocFtsFJVMBXng5uQqB53BMN7vQg/yLvp1rzkjXxi6qabx/pNmNXRebNY2djjLW34pSK1yO2qOfbxBkwLhptMJtVusq60dEPkFnn1LsxqKdOOqpk=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KUYPR03MB10553.apcprd03.prod.outlook.com (2603:1096:d10:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 10:35:50 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 10:35:50 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "mani@kernel.org"
	<mani@kernel.org>, "can.guo@oss.qualcomm.com" <can.guo@oss.qualcomm.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] scsi: ufs: core: Avoid possible memory reclaim deadlock
 in TX EQTR context
Thread-Topic: [PATCH] scsi: ufs: core: Avoid possible memory reclaim deadlock
 in TX EQTR context
Thread-Index: AQHc/W+ZpFJKxR1sc0G9vc4WNkVZ0rZA/OyA
Date: Tue, 16 Jun 2026 10:35:50 +0000
Message-ID: <b2c5b74f8becddf68cbe87d390459a43e542570b.camel@mediatek.com>
References: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
In-Reply-To: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KUYPR03MB10553:EE_
x-ms-office365-filtering-correlation-id: 73a84215-aa6e-4571-0259-08decb9308ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|38070700021|4133799003|18002099003|22082099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info: DT2WgbRCwJugMQCve0kaLojOeUKyiKO/JbhC1PcSqOeO7DKpc8LYXcjzJfmfZazpSOPdXZ/M3zhK0WevOIO5h/lIqQl6U/MMflNrh9uKhMgVy/xFl1g4VZG6yClZaQ4Dbkbkysp2nGEYgbiog+EGzPpz2KaDxvWJCZyzusn4os9CpbeANO5nq/vVCzgA7KVfbqjUxHXLlXgG71koPDmda+66cZ8tZCU73mAx8cNqZVNGJ9e2jqpposZ5GRA4T1pBO7WHyZrgyOCDAd5GC0Pj4NurChI+hboqEe87EQ6c7pA8+HU51sM5oBJwr4Itg3ThMb0oqyRtsdky1697s1Elt6ZR2bdNMnXxX5oZiHihnWelVLkerlne62jKLS3jAC4WBffSGol3ISilkH6d9lJtZ09MG+AQO2j76U7A5snnXoyxYPwsj4Ps6hxouM62V1oP+tJUi0G9RS5pdQY96BXMnCIoAi4ZfU+rYlsoH92ms6CGamUkFcuK+3kkD3XB6yXU/uxWW6n9VMIe1QTjQps3spWXK14ASCWkv92Fq4qY5Pzr+PWzL1F/WydalQ4sZ/nAA6wj+D4Tl0ZBnv7VCxg4Yxp9Wjl0wPV3nmOnE/dNBQdYGSIrVtO2P3i7LwYDTyByINq0KyBmS04lJ3CX9TMIDqentJ9tKrMHkrkcYz16vwp6VgSAVR/+UV/j9aSWlykAedtBR4LwUYSWDvvntpJIyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(38070700021)(4133799003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejNMekhFNlhhTHRPb1AvWElsamc1UDlEVzhSK3ZsV1A0WW9zRis5OWNsd3JQ?=
 =?utf-8?B?VXRRUFBiY1g1NThkTFZ4OUt1bnNhTE92SHN5Z2hYVEZsVWwyOXBrWC9OWldz?=
 =?utf-8?B?WHlFQXJ6NXpQRTZhalZxUHZITFBBczZkb2tPZmdBZmJFVEJRMGZUZVpUL2lK?=
 =?utf-8?B?MVBPcTd0bnE1NEJEQjlWWXp1eXNoYm5wa2NlTDZ6a0Y2ZytYZkxRL1BiR3NN?=
 =?utf-8?B?TThDZGtQYkwxZTBFR0NMSDFIZWFJUE1vOEJYS0IvTXE4eWxiS0Rlend4Y3hH?=
 =?utf-8?B?VWlwNVhZbWNldUF5TjVWVlFYVVc3dUFNS1RFdTdmUWR3VUZPY1dOcXZLQlNa?=
 =?utf-8?B?eFgwdGU4NHVYckZzWXZYd2NBcHlsa05qT0pYOEp1Wk5xZ1NaekJROXA1ak5N?=
 =?utf-8?B?QkluaHk4Njg1QWsxQWljaTNjc3JlMW5WRFhyTnVsS20rRkgvL2cyaXJzYytj?=
 =?utf-8?B?YldqandoeWk4aTE1NktiVXhqZWQ4OVZjTko1M2dUVTdTOExtalF4eVBmT3Vi?=
 =?utf-8?B?VTJ5VmthcHBSM3dRa2QzNXdVRnZ6TTQxczdlTWNSZG5zbjdhMkZNQlhiV2R3?=
 =?utf-8?B?RDA0WXlzL3RNcU5lZklTNkpOMUtpWTRPbUtvaVBvVXlJUFJQSnlzaDJ3d0Vr?=
 =?utf-8?B?WVZ5emFqRGJ4TWF3aU1KMFU3OWNOUkptTGxBbnI0LzFENlExMjdJUEFqSlFr?=
 =?utf-8?B?dGo0Mjl1Qlh6Nmk2amtDUnlubGw4UlQ3UUd1NDdOaEtpV21iamtRdkR5ekQv?=
 =?utf-8?B?UGo4NmlYeURJbjVMZ3QySGJFcVBQbDNFQkJlRnliYitxazVJQUhnVHZRZUpr?=
 =?utf-8?B?U2N1Y2VkL0RwbjFJZ1U2SXZaNFFnZWpRUVlFZWJCbmJsMWZWSHlWbUdURW1u?=
 =?utf-8?B?cERTNEp2RWlZdiszRTEvOFdWb2ZMWkc5QngwY28xSzB6dlJlWnRhYk1WNHFB?=
 =?utf-8?B?bTIvOTRZOFdOS0JZL3AvdkdJallkS3ROeVNIZ2gxdllNQjR2QTZKM2xpbGJh?=
 =?utf-8?B?YWhPNlpkNUZmcGRoL0NObHZkT0ticmIvcnFQN2Z2Yy9nUHpyWHA5UkVrUWhX?=
 =?utf-8?B?Rjl4R1BadVR0V0d4bHNWN05LZ0pFYXVOV1FCVG9EWmF6Z3ZSV1orcGxqMDd4?=
 =?utf-8?B?OVh2cnV4a2kyQmZxTW93cHcwc3Z2akZhY1BkelJJTnhjNnNGTDUrOTU4QU8y?=
 =?utf-8?B?K0hhdjdPQk1qdm1SVXp0SWg0a2FZaVpuS3ZJelBMN085Y2VpV0RLaXRUZU5v?=
 =?utf-8?B?MHlJcHR3U0hoZGI4eWk0dGZyRHdNTUVkRnl1azB6bmQraDUxM1ZzREJGMWgv?=
 =?utf-8?B?NUJld2hxNjdsOGNmWFhnMnBpT3FMQk5ucXIwQ0FzZEc5T0lHcmdmcVNBM3N3?=
 =?utf-8?B?SCtwemdaQUZRM2tkRENqa1p2MldFV2k5VWhMcTRGcGtEdFFTTElvdFpYdy9y?=
 =?utf-8?B?MkhKLzRYODhEVU1Tei9pc1NXR21uQ1FKQTd4anVwRDlpdEhhb0NId2xHeXdF?=
 =?utf-8?B?b2RrZEsvM1pJVUJoUTU3Ly9vNG94d01rdnV6R2VYbC9HMGw0R0pzRWdqeGQx?=
 =?utf-8?B?d1N5em1BMC9JVEZTSjBOK1ZJaWcza0VrQWNjYUk0WTRBZ3NqajI1azRCVFN4?=
 =?utf-8?B?S1RneEZTYnhGb080cWozcCtWS1dVcU9yU2NSNlNuQUt2NGVNQ2dkQmVFMDg4?=
 =?utf-8?B?SkJSYUlUTXRLRnM2ZDhCbldaMDNaVmpVSmV6MjBpeG1XZzc2dldISEg0a1ZG?=
 =?utf-8?B?QzBlc2lTOWNyYXJreHJxSzFvOWpTcU9Tdm12Skd1M052TkpoQndpT1VXcEN2?=
 =?utf-8?B?MmVJK0JIT0xlTzFWdVczNC92YnlyUUE0VUl5NHdzcEFTS1Y4ZG81VWQrU0tC?=
 =?utf-8?B?cFRjaHV3RkNiUlI5MVFsMkhFWGtxckpIcWVJbU81VFUybTVSazF2NU5remli?=
 =?utf-8?B?RXVjTGdxRUVwQkd5QVRoY3ZKRVBuN1g4WFpjeUVFQlJOMjJLMnl5clIwSTdh?=
 =?utf-8?B?OEh0d0VoS2Vydnc2YU9URkRIRjZ5ZGV3Tno4MGVQNkNvTFFUKzE5TDBDandy?=
 =?utf-8?B?RlE5a1lmR29lQkFrVmo5dlJkRllpb2lURm9ubGJ3WWpRWjMxcmU1UGxjMmpy?=
 =?utf-8?B?RjEyanpmaStUNTlTRFE2RlZGSU9qUlBLOGw2R054V2FuS1AzbGlndTJLVnlt?=
 =?utf-8?B?STBRMFFJZlJMbk5kS2xEcFpPd3UvOFRnM0JMcWRxNWxQZlRPZXpmUVY2ZHpl?=
 =?utf-8?B?UWpJUS9nMzViMVV0T1VXVW1JZjArUSthc2tQYnlnSlNJYkZYWVNpT0dnZ1hI?=
 =?utf-8?B?WGlkbFBhaUFEMUlOSkRJT3BUTUNvRTlrN0xkZWU3ZHRKTEVKNzAxVkhvZmNZ?=
 =?utf-8?Q?hShidtXdxv//g+2E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCA2ED4DA81EC24FA87545EA328F28CF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rUAGKmv0OS1hJnfnIKO/dlFLGQXRAcv9W7BFAkWO3IT5hB9iy6kWIEP5CflBXDGGbf+ArHjdPahwEX6Vn4UxIv5SmLrh9U7h4j2cNfiL4o1lHJSwsFj8J/1zNB6s5BTTFpH3bPtluYnW0gCvppzVi5dnuoMLnveNjUp0TqpB+WsWw8DLDc0ORt0RRVwgDXRnafxaMA4TxqTvujqZTf4e5ObrxBQxfk2F0DhRJ3TkRPVt0boQynQl0xy9D+hQIfBdPp6jyBKLee03I9eSfX5ZfTYVq9ikE9vc9HkdaJ9Hw5Gbn5D73Xun534udXhmRqrG1uwFo+zdCczm1lEtLJUTZA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a84215-aa6e-4571-0259-08decb9308ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 10:35:50.4674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbIBFMZ2W/yAOcmh7RYuIFdM+C6fWs615wbQcoOcfrmSrCQoQEvfFQ77y8Y4d9eFqwyKIndIA3CW61pTi5PP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10553
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-113375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,mediatek.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,urldefense.com:url,mediateko365.onmicrosoft.com:dkim];
	FORGED_SENDER(0.00)[peter.wang@mediatek.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:beanhuo@micron.com,m:mani@kernel.org,m:can.guo@oss.qualcomm.com,m:bvanassche@acm.org,m:martin.petersen@oracle.com,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.wang@mediatek.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F419B68E5DD

T24gVHVlLCAyMDI2LTA2LTE2IGF0IDAyOjA2IC0wNzAwLCBDYW4gR3VvIHdyb3RlOg0KPiBUWCBF
UVRSIG1heSBydW4gd2hpbGUgZGV2ZnJlcSBnZWFyIHNjYWxpbmcgaGFzIHF1aWVzY2VkIHRoZSBV
RlMNCj4gdGFnc2V0LiBJbg0KPiB0aGF0IGNvbnRleHQsIGZ1bmN0aW9ucyB1ZnNoY2RfdHhfZXF0
cigpLCBfX3Vmc2hjZF90eF9lcXRyKCkgYW5kDQo+IHVmc19xY29tX2dldF9yeF9mb20oKSBhbGxv
Y2F0ZSBtZW1vcnkgd2l0aCBHRlBfS0VSTkVMLiBJZiBkaXJlY3QNCj4gcmVjbGFpbQ0KPiBpcyB0
cmlnZ2VyZWQsIHJlY2xhaW0vd3JpdGViYWNrIGNhbiBkZXBlbmQgb24gSS9PIHRvIFVGUyBkZXZp
Y2UuDQo+IEJlY2F1c2UNCj4gdGhlIHF1ZXVlIGlzIHF1aWVzY2VkLCB0aGlzIGNhbiBjYXVzZSBk
ZWFkbG9jay4NCj4gDQo+IFVzZSBHRlBfTk9JTyBmb3IgVFggRVFUUiBtZW1vcnkgYWxsb2NhdGlv
bnM6DQo+IC0gcGFyYW1zLT5lcXRyX3JlY29yZCBpbiB1ZnNoY2RfdHhfZXF0cigpDQo+IC0gZXF0
cl9kYXRhIGluIF9fdWZzaGNkX3R4X2VxdHIoKQ0KPiAtIHBhcmFtcyBpbiB1ZnNfcWNvbV9nZXRf
cnhfZm9tKCkNCj4gDQo+IEZpeGVzOiAwM2U1ZDM4ZTJmOTggKCJzY3NpOiB1ZnM6IGNvcmU6IEFk
ZCBzdXBwb3J0IGZvciBUWA0KPiBFcXVhbGl6YXRpb24iKQ0KPiBDbG9zZXM6DQo+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3Nhc2hpa28uZGV2LyovcGF0Y2hzZXQvMjAyNjA2
MTUxMzI4MzQuMjk4NTM0Ni0xLWNhbi5ndW9Ab3NzLnF1YWxjb21tLmNvbT9wYXJ0PTJfXztJdyEh
Q1RSTktBOXdNZzBBUmJ3IW1rWmUtU3JjME1QbUJjMmNRYlJadG5WSnB0WFAyNnVJN2cwcTlneDVB
UlRra205ckMtRjJleVd6T19ma0t2akNEd3dKaDdhODlPWkhJR3ZjeF9LYmR3TSQNCj4gU2lnbmVk
LW9mZi1ieTogQ2FuIEd1byA8Y2FuLmd1b0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCg0KUmV2
aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsuY29tPg0K

