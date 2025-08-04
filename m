Return-Path: <linux-arm-msm+bounces-67652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA3B19EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD00C16C70B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0B3244673;
	Mon,  4 Aug 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W3P/KY/g";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nWmY+1fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E523ABBD;
	Mon,  4 Aug 2025 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300513; cv=fail; b=DTprfTHg60rdPJekY3QiRDm9suzxCH9qayf6jn3TrZfW0GQKOX0uUskGh2DVwF8hT+P98V5y+kgMgjeEN8gIp37P8wS8AeRU75uRsKcRomRo66a//+PkCyL0JK7LcrXvv+xoaQTqv+THZl8XKHk36JAr3nPosQgjE5eOALm5vL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300513; c=relaxed/simple;
	bh=b4zSb+GkgMgr65QJoc0OTajCg8LRAvVfTxNuDn6A12E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m+XPqY578gcDm1rVE8M+FAbyez82UrmwcqKi6WSYSmNsYUOxjdIPtQgCJWUFet7mZJQadh5Wnfr+U5+emtkzfo+lIARLMsFEu8zcP1D1blImXlFrH1XrqTK9I1yY+dy8/tZHuW5jh/AAVd10PzLLoguZ8N0V+yL9lpqB04SCIF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=W3P/KY/g; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=nWmY+1fu; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3782a2c4711711f0b33aeb1e7f16c2b6-20250804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b4zSb+GkgMgr65QJoc0OTajCg8LRAvVfTxNuDn6A12E=;
	b=W3P/KY/g2GHNaKHis1vRvvn9x2Vpd3u34XDN4LfFCKwmz4Rh1nik08ptBd9kCTGWW4Mc47dCs+In1HSHxo15aNX3BB+qkiCp/Yi8EchhF+OuVAbd6DS9/Ha2gDgWPaQiOxBr8GczUBLwS/ZgqUxMR9bSFRg6WsjKluOvYWP5/fA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:0c9276c5-a5da-4593-9801-79497be0ef3e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:8346959a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3782a2c4711711f0b33aeb1e7f16c2b6-20250804
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1199459843; Mon, 04 Aug 2025 17:41:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 4 Aug 2025 17:41:15 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 4 Aug 2025 17:41:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkysPJivGLNJTiOZGI7wU5pOvvgINGIt9Fa+NalTsGv5M4eSJ3Ja4+iXkaVuHfhiRbBHFWqHRa8ALMK7gghBJSo6WXEVkFweSZ5VNduS5X1Euvxj/DozFEyrts5x+HNcF8f14Ar6UAYZFYx2dKPKSt+dwLtnXTtbhRZV/z1Nu0nSVzR38O4I4h93OAkDAGMtNQuH3xfwSWJoXZxpyG8hzojaBqPdcNrP1hnOsI6T7FVZ/ckMVD2e6RHhiNXrTEsMRgGHwEu0eRGeimO3TNr+PtR/TV43OkwX2lsED98W2yQESLnegNh7vG3Mz0+/uYcYMEgfNL2SbH9cY5keVQsm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4zSb+GkgMgr65QJoc0OTajCg8LRAvVfTxNuDn6A12E=;
 b=XPx2mGXSd8V+rINIzx5/4VRalW0CeCnw9dFDoqvv+PNrimM5jWgeTAEK81c5mRvrp+5Mx3tyVCHi5UpyS9Wd7bYBzykoXU07mZCXod0XJbxwmgCXG2D/cz+0pfBBc9UPm3V71VCAEH5LMM+Tyo/ZoJ6si1/xG4w3eBxsLaEKtQ39fNBWd4kIMM4V4Zt4sq5WEQN2HHeFCoHgGmAmHeUE7Z1J75VRV2LYohCQlIhCIHXIevyfwx1ro2iQNpLBi5u/DupWk+cbrUN0Eu5e0H6doiCOQeTSOH0PgLm5xkF7jl3Xo2sy8z4/zoxDjAjGHYgQ7NAgvYPm0JmfNOpYYk5sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4zSb+GkgMgr65QJoc0OTajCg8LRAvVfTxNuDn6A12E=;
 b=nWmY+1fuCWPOpVGDZYjLwQaCWUYht8lAe6v7yLm54pUowsQq/dqwL8Hv6IBiR/S3U1Jv46orppz59JQvQILJ0iRLwcWA+3Or3uc9s73/UKqLCU8Bby2tst2XX5pqe0+C0LTIW/1b3DBAJOUqWcKfHXPyRHZsaQ/L4y6uaER5MEQ=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by PUZPR03MB7062.apcprd03.prod.outlook.com (2603:1096:301:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 09:41:14 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 09:41:14 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>
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
Thread-Index: AQHbyvF2qqEtS3Zve0iY94J/r6+jLbRC8tIAgABfYwCABCtIgIABVyGAgAI33YCAADD+AIAHVo+AgAAd6oA=
Date: Mon, 4 Aug 2025 09:41:13 +0000
Message-ID: <faef2c814745ff7d26f39a6efbe090bdf04cae64.camel@mediatek.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
	 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
	 <1989e794-6539-4875-9e87-518da0715083@acm.org>
	 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
	 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
	 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
	 <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
	 <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
In-Reply-To: <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|PUZPR03MB7062:EE_
x-ms-office365-filtering-correlation-id: dad7ecf4-a6ed-4011-0a46-08ddd33b0d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?bXhoM3lURFEzNTdwU2FQTk5BalBvTWtheHp1dEtZYUNESU91L0cyRlQvbEtk?=
 =?utf-8?B?cEJyYnUzSUxteXI5K3FzRS9BYU5iRnR1TGVZdWJySGpxeHZINS9OOFVJK1VC?=
 =?utf-8?B?VWxQSlZDN3NBVS9wOEdjRzhSakZpS3NYaUZ0d0R5d0ZPREx1d3hDc1p0RldI?=
 =?utf-8?B?VkdoUWRhTXlBQ3VJbVBGR1ZMU1VyRytDTlhMMDNwSGx2ZUlEWDRqOXZHSE43?=
 =?utf-8?B?bWFRMSs4bWRYQXAxZFVJNU1OYXJnblVidnRNRzdKVjdyZFpEQUJYbitYNU5M?=
 =?utf-8?B?SXhKV3hVd29aK1phOGdUNCtFZ2kxc0Z1QjN6MUxqeUk2Tm1xZ2dZUnJJRFR6?=
 =?utf-8?B?TGlwTUlzN3NDc0ZkTFZsUUsrNGU1U25SMExYem9PWmR6ZmZXeE9yVjRzU1pz?=
 =?utf-8?B?alRmdllwNTBpYlZPcmpFMGdPdm93ZXdteElGclRiWHFUZExVL3FmUHZSNFVO?=
 =?utf-8?B?c213UE5adXM5d0NCMm83NHdDWlBXK0JUdUF2SFIyTk5TbnpYK1ZpbWsxOXY5?=
 =?utf-8?B?Ni9Dc2g2NXBuNldhN2ZnSTB0Um94djZTdWZxUHVDVndpTjJlTnpYc3VzYmRL?=
 =?utf-8?B?NHRZeFFSVVBpVVBybGZZdlI5RldHY0kvK1UyQ0JMQ2t0M085T0g1NUhmaWkx?=
 =?utf-8?B?TWpFMXZEcm9KOTRDbXFtS1Y5cDVWclNkd2h4L1hiUzg1eERkc0ZqWWtNNHFu?=
 =?utf-8?B?YWRVb1dMNnVmdUhXbGRxMnVLdXNsWkY4NzkzT2dxQzZoSXFJM3J1QlN0am9i?=
 =?utf-8?B?ZTRmeFlsL0IrU2JRTlZSRTBWN1Ixdk1oR1dURjRKK0hEMHVaRlF4MFh0TnZF?=
 =?utf-8?B?d2lWTDlBTGFOdUpSQ1V5N0xhNFE4SWdWRTU4ckYxM0ZiRTBVMWNmRTFweUw0?=
 =?utf-8?B?dkFnQmExYk9GazVmMXViWVVJMmxhcEExejhWaGFybS85TjQ3MmNMTnNlRlFW?=
 =?utf-8?B?dThxNERzZW43UC9WWnZlSzZHL2ppR281N2NNdWVBU2phWWl4NkxlV0F2bzlM?=
 =?utf-8?B?NXcvZTJQcmlDc2xCSzRSTlVTN0tPRG1JNWd4cXVZd0w1OXQ4amJwTkdhSmRP?=
 =?utf-8?B?akJBTzBiV0Q4MFRlWTArUnVDZ1pXUk11MzBFaGZBMEUxTHliaHlubjBQV0ZD?=
 =?utf-8?B?bkxJV0twSFdvWi9sdmh4YXRRdHRnUUhVWnIzV2xhcXUzSGZmTjd1dUJ4UTVP?=
 =?utf-8?B?NUdmaEJ3SkcybGVCV0x5dURWZ2dGTzk4aFFVYTZKQzg0azJUV2JmQXJ3Nm1p?=
 =?utf-8?B?RDJrblVoZ0hhbC9kM0M0bzlQU3ZEbHNwR0pLaGI3TzlTTFZTY09MSUYyaHlX?=
 =?utf-8?B?Yi96T1RqOHMybGdpZFNnNThxYzI5SlBwdGF0UkZreWxKYnkvaVdHMUJsWXN1?=
 =?utf-8?B?QjJ3TDJPODZEdjZCeElRSXYxcnFiWXJKbEg5eDlnZkZVVW5IKytZdWxRd29S?=
 =?utf-8?B?WkpteFdheHdjYWs0ayt1Y1dRdkJFb0pCL28zMDBNZi9tb3RsOSsxKzVsS1Vy?=
 =?utf-8?B?M2Y5UEhMNnNmdCt1SmN3QW85M0ZkR05BOXgvQjkreFhLTVNFdVpZL0lpZ0Vw?=
 =?utf-8?B?MlVFT0c0Yk5heUhiWlBmWTYrYW1UMkZNZnQzN1JEc0xVWm8zU0xCQ3kxZXFa?=
 =?utf-8?B?R2FTRHpaRE1HZFcwRHFpSkRoWS9HTFkzamRGUDJCb3BJcEVHdzIrYmx4WEpH?=
 =?utf-8?B?UzZQRFdyUmFzS2JSYXQ5M0FiUGV6ZXNTSlZUaXVFVHR5b2pLWmZjZGFHZkhB?=
 =?utf-8?B?NzhlRFZGRVRadHY5V1hxVXBzVk8yUGg3NkRvc2dMdklTVDNESXRCRmNYVHU4?=
 =?utf-8?B?cUdZWHFtOVFIM213K1NQbmlja2F0aHp3ZFo4SnpLbjV6RExXektkQWJXUVp4?=
 =?utf-8?B?RnQ1NnNjYndHYWJnYU9MNkVyYzQ3bVJRS3B1VnR0YlFSSjE4ekJVd2JZdXU2?=
 =?utf-8?B?LzRTNHIvRHk4NXFBbzRMUU1uTUllL0dxUGlSZ2d0ZEtJMXFhK3hFNlBJZ2FB?=
 =?utf-8?Q?7V51LifaE9tK7ETUb29EHtFDIE8r5w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFJBRzVxVTg1d2NtNkhhYmNjaGJiWXNjaWozaHd6R2p6WkxnUjdDc2Qzcnhi?=
 =?utf-8?B?L2VxdUp3Zzg4TVNPZU5YQ0hLdjJxanJrK1BteElUMllhdCtDT2lvWWx3dGpw?=
 =?utf-8?B?eWNad0NOLzYwVTdISHBlRUlmVTRlbWlSNlpUUWczN2U3eUNGaUd4VmY2UjFp?=
 =?utf-8?B?RG9JcjYzYk1YcENoQXZDZlRWL1cvb1ZtZUdEOEJFR3UwUUY4QWRTYU1Xc1h4?=
 =?utf-8?B?VEdQNmh5cUo3M0Nza3dtYUlsSzg4YXczdFBwNVozak1pTW50Z0Q5MzVYRURT?=
 =?utf-8?B?VW1EblBaL2dMWWVpd2dmSW9xWTNFOCt5Z2JUcXExTTZTaEZ6UWZSM0JJY0tj?=
 =?utf-8?B?cDc0bFgxL0JZTnN6ZVNsUnAxQnZZVjgwOE94aEN6eVF1aWtmNHRPaHNEZmVn?=
 =?utf-8?B?WHdzZHZhbXRta2N2TEJOd0prWjRQZEtwVDRJaXNiVTh3dUE0YlJOeGJwZFdj?=
 =?utf-8?B?enl1TUpSZmFVSkNCQ1RsSVFrc0lJRTIzR0xxUTRzL3NKdUxJbFN5STgwNWR2?=
 =?utf-8?B?WXd6YjJDTnUzSDhwQ1dNYkNSR1ErLzFWTXFwczNhZVNadlV6eWNDekUyWkV0?=
 =?utf-8?B?aWRSdEVqVDRmVkkrMTNpVEV2bUNMMUpGRmtOeEh1djUxbmZCb3RzUzVRVHJ4?=
 =?utf-8?B?L0lLbW1haTB2dk5MWE1CMUo0Z1ByOExSM2F2amROZTFJd0dQZldBcXAxRzBE?=
 =?utf-8?B?VW1vR2V6RGE5aUlldkhVSTJ5YWZnNjBUbDBodklMelpWYkNiR3JRRDR0cUx3?=
 =?utf-8?B?MnFGUDlZZnhLU1Q1WUpVUFJXM1M4dFRoRnZxOCt0OU9Cc3loY0w0REVDdWlw?=
 =?utf-8?B?QU9MZmZZUFRBYThIL2R2NUNqWmRsYlYzT0U0dnNNT1phTlJWdFNRWkJuOXdB?=
 =?utf-8?B?aVlxTmlvVlVEKzJ5cUxNNnhGaGQ0TUNKNmZFcjFhZ0VuVXhDSCtrRHIwVnNv?=
 =?utf-8?B?WGd2WGZDUGhuaGk5dTNCNkl2bU13ZE1tQzhBUExZSmE0OER6RnhadHpwNWtN?=
 =?utf-8?B?SXJWd1pKMGo2TVE0SVplYXlpUDZGM0ZwcXZzSGtUTHdYMzRldG53ZmNqQVdF?=
 =?utf-8?B?SnlKVDhyVWxXRUlqcDJpeE9idkJvbU43VG52ZUp0M1Ywb09MRHpsNnUzeUpZ?=
 =?utf-8?B?UzZlZm9VR0NsZCtlTnRJSVArKy9QM1ViTFBkdDNESEpqdEYrRlY0L3V1Nm41?=
 =?utf-8?B?RHlvd1ZvTzZBSUkyNDhNaFJ0MXF0WW5VaU93UkVKY3ZoTmswTXk5OWhXMEEr?=
 =?utf-8?B?dWJMakpJeEpMckRwUDl2Z3lvQTZEQks5Nmw0clFYOEhRRVhzSHZNbS8rWGM4?=
 =?utf-8?B?bTVaNC9lMkJHanRaOVVwTmNjdmc5TWlFSi9TbUw2RmYyOHcxS0ZZMnV0ZjJx?=
 =?utf-8?B?VU41YzRzREdISUc5Mk1QQys1dTN1Y0hUT05zUDQweWExRjhYUGJTOGwra3N5?=
 =?utf-8?B?bE0wTWl2ZGIzVUNLSXRHZzViRWNha3U0UXMyR3BSaGhUeEQ3NW9qeUNjNHdN?=
 =?utf-8?B?TVFKcnpqcXNqa0szZk9PT1llNXFQcHo5WU9IWklIZ2VMSVRFT3AvekpSaVRp?=
 =?utf-8?B?QUFhMVVSRmMzc2lLM0hYOFFzMlZaZGt1Y0wrdFE3QU1RQlBBWHhNaC9JRmpL?=
 =?utf-8?B?aXE5cDA0TkE5MytUV1RVR1B1SkZ4UDJjNmZUbjBRZnpzUXpLRGhaOEgzR1pu?=
 =?utf-8?B?ME9qMEcyZm9TMzBKdE9qWWl5V1NGeGRYamNCZnp5a2hSN2ZtblhEaGJKM0xk?=
 =?utf-8?B?NHhmYXl6THcwRmwyeEtST2QwVTJueVhuVTMzc2FNNGdiaDVVby8xODA0elJU?=
 =?utf-8?B?bkNJQkxvaDZWRlVnTlpWbmQ1WXBWcHZZcWVVOFdXZmtuS3M2ajV3ZmJ6cWxP?=
 =?utf-8?B?em03RUJqaWloMDQ2enhyNXVzMHpNN1RXNWtycXdOdERFeEFKTHg5allpNVVH?=
 =?utf-8?B?OVlGUXNMUUtTWjdKQnZEakpsMVRCNGxCNm5MWkxCWUVTdVlYMGtjZ05VMzNV?=
 =?utf-8?B?R0JmSzlDRFZ3NktUL2RTc0t2enJJQ3VGTXhtbitYV0UxV0pLSkQvZStlYVli?=
 =?utf-8?B?UW1UcDdteXhOWmpSaHJFQjdtaWRHdDBkc2ZMS1U3eXZ6WmpUMW1tMDhOeUhx?=
 =?utf-8?B?eGt1cFQvV2VoQ25lU0I3SnZwYzQ5elROZ29qYkpNK1NEWW13VEFYZ0pTYldm?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E2C906C694F8B48959483549F02D8E9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad7ecf4-a6ed-4011-0a46-08ddd33b0d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 09:41:13.9670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yEp1tpnmtdJ0AUvl6hfAOo4SVAVT9/10rOZIAUqzruAyq8GAK6O8zR501Ig5RJ2WgP/9OIKm7QmbJieBUvLB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7062

T24gTW9uLCAyMDI1LTA4LTA0IGF0IDE1OjU0ICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiANCj4gSGnCoCBQZXRlciAmJiBCYXJ0LA0KPiANCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB1
c2luZw0KPiANCj4gaWYgKCFtdXRleF90cnlsb2NrKCZoYmEtPmhvc3QtPnNjYW5fbXV0ZXgpKQ0K
PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVBR0FJTjsNCj4gDQo+IGluc3RlYWQgb2YNCj4gDQo+
IG11dGV4X2xvY2soJmhiYS0+aG9zdC0+c2Nhbl9tdXRleCk7DQo+IA0KPiBCdXQgdGhpcyB3YXkg
d2lsbCBjYXVzZSBvbmUgbGluZSBwcmludCBvZiBkZXZmcmVxIGZhaWxlZC4NCj4gDQo+IEJScw0K
PiBaaXFpDQo+IA0KDQoNCkhpIFppcWksDQoNCkkgdGhpbmsgdGhpcyBtaWdodCBoYXZlIGEgY2hh
bmNlIHRvIHJlc29sdmUgdGhpcyBjaXJjdWxhciBsb2NrZGVwDQppc3N1ZS4NCk1lZGlhdGVrIHdp
bGwgdGVzdCBpdCBpbnRlcm5hbGx5IGFuZCB0aGVuIHByb3ZpZGUgZmVlZGJhY2sgb24gdGhlDQpy
ZXN1bHRzLg0KDQpUaGFua3MuDQpQZXRlcg0K

