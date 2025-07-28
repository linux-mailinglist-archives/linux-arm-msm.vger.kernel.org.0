Return-Path: <linux-arm-msm+bounces-66813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D096B134FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 08:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F93B16274E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 06:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6005C2153D2;
	Mon, 28 Jul 2025 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iKTHgokR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tMDLjszY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07C214A6A;
	Mon, 28 Jul 2025 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753684491; cv=fail; b=WVY8k0d6Ak9CIsuy4Un6T92cJ72ftNEUE5mdcrvd9ztAfO20v9YOhSibQP0oNw1ubQNSsEZ7aSyyX0NRApOnsoQrGQ7fbEmVgDPEGqMswPdwFZHtSShajsfcrtm4B0Q6GEEWoD+CsYdtymsmQGSxHCtrmBmzPSqteP6YHxHYmqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753684491; c=relaxed/simple;
	bh=J2PGGBTAHqdwSbJ+Dw3/dxqSFd9Hrrz/VlTpOJH61oc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d0Jwn/lJUFtNfGc1pmPdrZFtTMn/50AjjGqQckqW3aFKET0U+Br0TZBaX/vpbEJFwJUctCO/xUVMkq8iiDG9ZVVhKDIADbtFdmq5geOVqUNtEv1a9izbo1xT6IVwP6nzlZyPDxoIHNR+o6Hd0UB3I7AaEbYXum1yQJc8X5cW+GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iKTHgokR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tMDLjszY; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f1e1f78c6b7c11f08b7dc59d57013e23-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=J2PGGBTAHqdwSbJ+Dw3/dxqSFd9Hrrz/VlTpOJH61oc=;
	b=iKTHgokR41KTCqQO9eAnmNfpyNdYf+y7gzzEFcsWNC2wx1Bi0wiJtrvc0K62Pm6UCbrxCcDXaTNp44fQjOmSFZLOJC+z9QIzwGZj1ZzF42LpegRXbjR/vd3dacrcDOIdZs4C3ShoZ1AEQKiKsNX6bUGr1v5oXlCFBUvZykYcH+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3fa32e88-81c1-4a12-ad57-ca96c650f1e4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:0ebad908-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f1e1f78c6b7c11f08b7dc59d57013e23-20250728
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1214014745; Mon, 28 Jul 2025 14:34:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Jul 2025 14:34:39 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Jul 2025 14:34:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx669pc7xoCVcOp06xYVZIWpW3y7Xsk2+U+pfQEku+OQEARpophDgsrrZJ2a2l2DNwLVPg00jME+41hXrFmxbbOm21OCy3upOr1/TqH3FWusYkiZDMtv9P0IoERArvqfDIMWTBvgxJ0tlMcixmhnEw8DtB4yIGINtsP/TMdZlXITfWV7DCxgGbvqR1Gy1qwgzr+8SSqRVr12dVdUvFnGQ77km+eJDtaRusvgrpQezymjyl7bxZZcfYR+6yLeChJaMayOZhEPspKNqz8/h7sUJaVtJUMVXbKmgx4Xf88cMRreLxnYnxXb337+/afddi36E0Bp1n2+QFr8f9PeE2fx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2PGGBTAHqdwSbJ+Dw3/dxqSFd9Hrrz/VlTpOJH61oc=;
 b=eL9jpYBrYB4E63xKDrVo7cVki3x0rrBVUQtCCNxhwzqPJwSJUKbrSKbjGoi4dCdatxU0q6bH5celGCPJhut8h531qgPu3mPQnl8oyOwHSazi+0VK/ESxZNCxxDDH9EXfngLSgDlW6fvQZ0OzkiPwWggEiy97CIQ9FaagvAlSW53o8VYBpcCbnvsydGWfO7j3ghe+VN2H1UfIgNckYo2PXgk+aSktJH0XRn4JzHwyL6WxwpNzVoKd4Py62YM616gSBRo3cvwUhRN5fLcLDBITy7Oymi+iO28YvIg/VjviYpClInJTwpebRdo0MAP0zITh0Bvnxkn89fuyFV11EHbJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2PGGBTAHqdwSbJ+Dw3/dxqSFd9Hrrz/VlTpOJH61oc=;
 b=tMDLjszY1VkdK0ecb0Wz3VK+5J2MB2VLxONFM/4BoiDpCugIR/JpNRCrI2l62WXCnu2akXUNrtNy+MSG9hbu8KTvPn2BrB7oq8tRNrkKAcya8IvEM/maqV9iPLQtbq930BXbKhHLvM6SfOTrqjnIEV8Lh92oUL7FY3+sgUZsFbw=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEYPR03MB6434.apcprd03.prod.outlook.com (2603:1096:101:3e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 06:34:38 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 06:34:38 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>
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
Thread-Index: AQHbyvF2qqEtS3Zve0iY94J/r6+jLbRC8tIAgABfYwCABCtIgA==
Date: Mon, 28 Jul 2025 06:34:38 +0000
Message-ID: <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
	 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
	 <1989e794-6539-4875-9e87-518da0715083@acm.org>
In-Reply-To: <1989e794-6539-4875-9e87-518da0715083@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEYPR03MB6434:EE_
x-ms-office365-filtering-correlation-id: 23eaf80a-6355-4714-57cd-08ddcda0d3be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0ZEMVdQc3FPRUVwN3JFbmJVVW8yNnVRSHhNeGk5aGR1SVJIam5SMmVMZDZs?=
 =?utf-8?B?aWU3aHZmMkFCRWwxYllqUkpybEJONVI3dC9JcWhZaDNtZmh1UG94bkhJbWoz?=
 =?utf-8?B?UW85dHUzeTcrUnpWTFJINTNPbVV1MkZ4RlI4WVZoRWMvelk5ZHoyYVZMRWwv?=
 =?utf-8?B?MTlySTVaZXAvL0pWRmlyODBETjdTeEZ5bXdjR1hheWxFYk92ZnJlSWZoY0xT?=
 =?utf-8?B?NWltR2VHRHdPdzRVNVlSVTJvSmpHaFFtK29BdnpSUjRPeXhFZ0JDa2lsS2FR?=
 =?utf-8?B?SlUwTDBaWm55M2QyRTRnalZnWC9BaGkrZmx1bWVYOGxyQ2gvQUlIMnlqZ1V2?=
 =?utf-8?B?Y3BHNHRtbHdsWVY5RlNXekpzdHlOSzh5OEs3UWFmTjFGa0EwNVhrVlA1Vmpv?=
 =?utf-8?B?MGxSend1d0E3Lzg3TGx1M0JHREtXQ1ZZbVd3ODdRMFFPZnZxVUZGWnl4a2xL?=
 =?utf-8?B?TWY4dHZmZkhCVkFMbFFHN2JqMDBoUVEzTnBFNlFPTE5mNU9VMjBEV1lLZys3?=
 =?utf-8?B?MDVPRWJicXk2MlZQUEYxdUx6T1BOTEFyaEZ3U3dGWkVnUnhIUitWeXVwKzNB?=
 =?utf-8?B?NzZ6alA2TVVzaVdRU2taSTR3WE5ZeGt4c3hXZVR0STFLWktNeGFVUzNZcEJJ?=
 =?utf-8?B?dXFNSWdSVXozQUNEK2JQeTNZZXJ6ZWppSFdtZnlxZ3FHSXFmTGpHMS9raFNr?=
 =?utf-8?B?MXVmd3JreUxGc2g4MHgrdVpOUnQrdE5jZ3VOMVFSQmNHT3ZmbS8wdXBZdVNO?=
 =?utf-8?B?N2JLaXV0K285dTUwV1lTbmFzYndwTUNQTzNSQUwxMEFOc0VycXU4V3V5UzR5?=
 =?utf-8?B?Z0lIWE9HdDlVOWRza0NOeGZPeFo2SVY2VkdVR252V3B1WHdQdXUzYmVRVTNH?=
 =?utf-8?B?L3ZRQ0RBK2tNR2NtZTBhTlBDRjEwZllFQlNwZnNTSFZVcTFGa2g3WERWOS9T?=
 =?utf-8?B?RUxLNEJubzAwZ1NXVk0rcVpOSkduVHdFRWE3aUFDV1Z4SytvS2tPMWp4TU11?=
 =?utf-8?B?dzV2RTJiVEdpcXQ3dm02ZnA1VXZCb2VYWk9oT0cyd1BJMW5zRWgyVGgrdHc5?=
 =?utf-8?B?VXJNODlLekcvREZIRnFXYXpVSlJkKzgyZkp4U3Uwd0pFY2srOWk2ZS96R05j?=
 =?utf-8?B?cng1K0tUNkZHOEhpZEM0NHF1ZFhmSWJYZEJJWlJoU1RxZTgrVWVPQ2pOYjNn?=
 =?utf-8?B?NTVjSXNSak5kNjcxSlhMb0cvczBacWpxZzFUZ2FyZjFwaEc1UnRXZEdvTDRi?=
 =?utf-8?B?dWNmVHV4WmJiMEdkZC96dVlyTktvQmpndXp6NEFPbnZMTUpvemdrRTJsUVpV?=
 =?utf-8?B?dWRQL3BSbExFSXhPODhXUmtOUTl4VWhkeGRzemhtTjVwOTJFQW1Ld3Z6c3U4?=
 =?utf-8?B?TU84S1QwZ2pWcXI0ZHV4bmxGTjJSKzlqdGpHREE2U3NNQWZyVUxkbWZITHB5?=
 =?utf-8?B?SW1pdkJOVk1NVDNNQWduYSt0dVN2VWhYd1YxUXhZalFsUGNWNnpXYmszRmpX?=
 =?utf-8?B?S2wvOGJHOXJvNVVlalJwVXBUcnk5RXFJNWF0c1lTaFpla21pTEdiTWhQNFhC?=
 =?utf-8?B?NEdodFdjS245Z2ZKMDgrbXdOTHphR2xEMTJCZDd4QUo5cUpJSXhxeUpyV3Bl?=
 =?utf-8?B?eFl6RjVjTC8wYzRlOUE3VzVTRE5aNFdhZkl2am5hL09oWGQ5Q3pTMkxkeXRh?=
 =?utf-8?B?Q05MRkxBNmVRWjdYbEdEc1EvNVRCdVpmYnl0TmdxQkJMVFloS09rOU9MVnhy?=
 =?utf-8?B?b0JQTmJ1VllYRkkvcnlaZEtrSGVJUmJwSmlwaXdqOHM3VE0xd2RDa0x3NVpB?=
 =?utf-8?B?UWF1ZU02NXFTWGVxd1lTQ09RTEhXRXFlRk83V2o5c1RzN2hNbW85M0hyNzYy?=
 =?utf-8?B?QjZVZFlIVE5zTDNrT2o5ZFZIVVhhajZrbURaVlNkSm0rLzlZVXA1OGFyb3Rx?=
 =?utf-8?B?bWFhUGJmdjdYYy9CbUttM3QxUk8yZ0xrbkZ3aGlhdzluRkNYa0FEMW8vNXkw?=
 =?utf-8?Q?Qp3PCxA88GwR64lTvO320To5ATlGCQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkRidmtCdS9HbW5FY0h2RFpPNUprNEpnWmJZcDlzdzhxbTFtcnZvRUNEZkx2?=
 =?utf-8?B?TkVJQTNpbmprZ1V3WnZuZkZHUy9lU2kyc1hRWGRrNW54M2lVZHVtRXQxQjda?=
 =?utf-8?B?Nm1RSEE0YzliOHVaY0hJTExDVnJxZmdraE9zL0xCK1pBajBtNEI0QXJGSEtN?=
 =?utf-8?B?bW5GRmZkNDlpRlZLRThSZHJjUm5PYitGWmdtTUhBd0NWMDdRcG9BRGk2aUZi?=
 =?utf-8?B?UjJRMHpRVjFjTXlpVDVLTkhBNDVGVmNqd25wa3dYNzRBMmYxaERmWGFuUlR4?=
 =?utf-8?B?d0FwZUdhYmgvd3BlNmwrQjhoblNXUzljMmJTZzJmSEpoQytCSEdNK0h6UUds?=
 =?utf-8?B?dk9uTU9DcXdtRGp4Z05NalVaNm1LK2N1VGo0RExab1ZXTEFpaERFRGFkRDdL?=
 =?utf-8?B?cE5RVkhJd0Y0OTVCdm44YjYrajFUS3Q0WjgzMFZOVWd1SjdqTHNhM0RodXlj?=
 =?utf-8?B?ek53Zlg1RTQ0NEE4cnFxREdpZWJsVGJ6K1ZwbzJWb0lzcXVDdFYxeVRMRXVh?=
 =?utf-8?B?MDNlYlJ4ZXdMeTlUQlpuZkNSY3YzR3lwUkVvN1plamRHc2FCTlhBMHJrS3kx?=
 =?utf-8?B?VU1UZmJFZUJlOGJpTGg0SHBHYjA0aWduQkZSWFl3L1k3V1ZnZXZiN1l2RGhh?=
 =?utf-8?B?Z3EwVnhCYlZ0WDBpczFFQUNnZWhLa0orNHBGVmVYbXJ2NmFTcjJOdWppelYy?=
 =?utf-8?B?QktOWjNIY29HTHhRNHhQNUp4aWJhRVkzTHVwWXlhM1FaNGh6aC9UVFNjNm4y?=
 =?utf-8?B?U1FQMDY5RDdVcWlCSVVydzl3K0NMcFVPR3l5S1J4YXlVb1NjOGE5bTlFZDh5?=
 =?utf-8?B?ZEdhSEtFZ3Fpd2FIV1pKK1BlWXJkZzl0dEUycHN4T1lNSDE1cWUvRWp1bGNU?=
 =?utf-8?B?dWdLRjIxL3lsWkRsZ0dCK25yMHVXTVQvRGVUMysyMXpWTzJuVCtIWEFPQ25k?=
 =?utf-8?B?VmN4UGVtOE1DOVA1RGNYQ3c0MVk3Sk9GRWpkbDQxRUNTQU9oYSs2Vnp6aFhj?=
 =?utf-8?B?Tml4Y2xrK09VbE1YQWN3Rm52NEJkMFY1N1phTFJBMXYxdXNDVys1TnlwOXBk?=
 =?utf-8?B?YWI5U0psVXFzNHA3b2cyYUJwMklCUEoxK2JUSkYwVFlNT1RIbjF5cFFoM1Uv?=
 =?utf-8?B?YTBTTG5adWxQR1F6dXNsdnNzOVJMcS90QVBVUlkwcDZSZUZZeHVmK0IyN3Zt?=
 =?utf-8?B?SkFDYWZURlVFVXB1dk94ZHN2WTZ4MEowai9PMk12NTBRcVJRL3pLRGhRSE5w?=
 =?utf-8?B?UnBnaHAxQVRvRXpLVUF0MUNtL3FDdi9UVU5BM2xIZlU3UzhPL0M2WnlXQnB2?=
 =?utf-8?B?VlZjL01KdGZ1bVRVby9CL3dKZnJBV1NkZmdUVU12eEJ1TktuNnhra2hlTkYw?=
 =?utf-8?B?U3pCcnNEbzh5YUg2b2NsclY4ZzU3amowWHpiajRTRHFTbVExcWRyem1Hc2Nj?=
 =?utf-8?B?c2VqY2ZRQXNQOVhNMkdZbmh3OFlZQURkNXQvekpDOG1OQzZZSk1qS2pNckk3?=
 =?utf-8?B?OFNjeHNkM2Z6Tkp2S1l2WmVEMElnMVVkcGdTdjBaR25pakFhQ0pqVUtTYkIr?=
 =?utf-8?B?SDhucm1IRVlKdWxIeUtleFBBaWlnQk1uM0tCYlNsOHd1VTV3bjNoOUlLaGRF?=
 =?utf-8?B?WXlKSTZubGMvRnJwU0NaaG1oL2ZVT3dNbmVmaSsrNC9CY2E4UC9JdjQzRFpE?=
 =?utf-8?B?MXlwbFFVY0xGMlE2SEEzWVdWMHlobisvZHI5MlNXY1F1SnBBYk95bUM0cUUw?=
 =?utf-8?B?TlEzTThVUmwvMWtIcXdySThIdzdpdkdISS9jMXpJN0Rsa2RYd29lbmhNL0JI?=
 =?utf-8?B?dG9YRWxlSDFSUjVmb25lM3RoVkJqL0xyMHhCVk9YMUxtMGo3WmZ1YVVVc09F?=
 =?utf-8?B?V3hKS2R6cEdBTGlkZ0FBUEhnOUo4ak9vVVdiYVlFTHA3ZldDazBDTWZJeHVX?=
 =?utf-8?B?UGl5dDAvSDdPVG03TEhLQ3ZqS0x0akpKN3U0c0ZXYWNBV215cFd1cGpxR3hD?=
 =?utf-8?B?SHlXcDNrNWpvb0FXWnVONDJZaHpPaEpLbHVteFIraDFUdVF1ZGFDaFFjUlZF?=
 =?utf-8?B?VlVnQlFJNkFlQ0d2SWNSdlNKclRXUC8wWkNPdjl4Y0haYjRGY25sWHdkR1RG?=
 =?utf-8?B?d0lTY2dmUG96bUFmclBLUGUweTZCb2VOKzVuRlRkRWI4QjRPVitnSFlEOTZs?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A131E8E7A30E947B9D8C6F19858FB96@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23eaf80a-6355-4714-57cd-08ddcda0d3be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 06:34:38.7335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjaOr69nTRxDG3jhhxF10vMflsVuLSSui/8tTZdfAhScZyOIZ1TowXKunv75nT4kk8Hy7U+MexW7/41zK39jjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6434

T24gRnJpLCAyMDI1LTA3LTI1IGF0IDA3OjU0IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDcvMjUvMjUgMjoxMyBBTSwgUGV0ZXIgV2FuZyAo546L
5L+h5Y+LKSB3cm90ZToNCj4gPiBDb3VsZCBjb25zaWRlciBsdW5zX2F2YWlsIGluc3RlYWQgbXV0
ZXg/DQo+IA0KPiBUaGF0IHdvdWxkIGJlIHdyb25nLiBJIHRoaW5rIGl0IGlzIGVzc2VudGlhbCB0
aGF0IHNjYW5fbXV0ZXggaXMgdXNlZA0KPiBpbg0KPiB0aGlzIHBhdGNoLiBBZGRpdGlvbmFsbHks
IHRoZSBsb2NrIGludmVyc2lvbiBpcyBiZXR3ZWVuIGRldmZyZXEtPmxvY2sNCj4gYW5kIChjLT5u
b3RpZmllcnMpLT5yd3NlbSBzbyBpdCBzZWVtcyB1bmxpa2VseSB0byBtZSB0aGF0IFppcWkncw0K
PiBwYXRjaA0KPiBpcyB0aGUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIHRoZSByZXBvcnRlZCBsb2Nr
IGludmVyc2lvbi4NCj4gDQo+IEJhcnQuDQoNCg0KSGkgQmFydCwNCg0KVGhpcyBpcyBhIGNvbXBs
ZXggc2l0dWF0aW9uIGludm9sdmluZyBzaXggbG9ja3MsIHdoaWNoIG1heSByZXN1bHQgaW4NCmEg
Y2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5Lg0KTGV0IG1lIGV4cGxhaW4gaG93IGEgbmV3IGNp
cmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBpcyBmb3JtZWQ6DQoNCkNQVTA6IHRha2UgJihjLT5u
b3RpZmllcnMpLT5yd3NlbSMyLCB3YWl0ICZkZXZmcmVxLT5sb2NrDQpDUFUxOiB0YWtlICZkZXZm
cmVxLT5sb2NrLCB3YWl0ICZzaG9zdC0+c2Nhbl9tdXRleCwgIDw9IExvY2sgaW50cm9kdWNlZA0K
YnkgdGhpcyBwYXRjaA0KQ1BVMjogdGFrZSAmc2hvc3QtPnNjYW5fbXV0ZXgsIHdhaXQgJnEtPnN5
c2ZzX2xvY2sNCkNQVTM6IHRha2UgJnEtPnN5c2ZzX2xvY2ssIHdhaXQgY3B1X2hvdHBsdWdfbG9j
aw0KQ1BVNDogdGFrZSBjcHVfaG90cGx1Z19sb2NrLCB3YWl0IHN1YnN5cyBtdXRleCMyDQpDUFU1
OiB0YWtlIHN1YnN5cyBtdXRleCMyLCB3YWl0ICYoYy0+bm90aWZpZXJzKS0+cndzZW0jMiAgPD0g
SG9sZCBCeQ0KQ1BVMA0KDQp1ZnNoY2RfYWRkX2x1cyB0cmlnZ2VycyB1ZnNoY2RfZGV2ZnJlcV9p
bml0Lg0KVGhpcyBtZWFucyB0aGF0IGNsb2NrIHNjYWxpbmcgY2FuIGJlIHBlcmZvcm1lZCB3aGls
ZSBzY2FubmluZyBMVU5zLg0KSG93ZXZlciwgdGhpcyBwYXRjaCBhZGRzIGFub3RoZXIgbG9jayB0
byBwcmV2ZW50IGNsb2NrIHNjYWxpbmcgDQpiZWZvcmUgdGhlIExVTiBzY2FuIGlzIGNvbXBsZXRl
LiBUaGlzIGlzIGEgcGFyYWRveGljYWwgc2l0dWF0aW9uLiANCklmIHdlIGNhbm5ub3QgZG8gY2xv
Y2sgc2NhbGluZyBiZWZvcmUgdGhlIExVTiBzY2FuIGlzIGNvbXBsZXRlLCANCnRoZW4gd2h5IHdl
IHN0YXJ0IGNsb2NrIHNjYWxpbmcgYmVmb3JlIGl0Pw0KDQpJZiB3ZSBkb27igJl0IHB1dCBpdCBp
biBsdW5zX2F2YWlsIChzdGFydCBjbG9jayBzY2FsaW5nIGFmdGVyIExVTnMgDQpzY2FuIGNvbXBs
ZXRlKSwgZG8geW91IGhhdmUgYSBiZXR0ZXIgc3VnZ2VzdGlvbg0KZm9yIHdoZXJlIHRvIGluaXRp
YWxpemUgY2xvY2sgc2NhbGluZyAodWZzaGNkX2RldmZyZXFfaW5pdCk/DQoNClRoYW5rcy4NClBl
dGVyDQoNCg==

