Return-Path: <linux-arm-msm+bounces-67237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0156B16E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F831757FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F62218EB7;
	Thu, 31 Jul 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UY8vE25G";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="G1oruNEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73221E1E1E;
	Thu, 31 Jul 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953784; cv=fail; b=Lj1Wka6ebCaczBuCCTSiWib81/HVg0kqjp6rFz1D25K9FuMfs+5YtFrmbaMUT/7J9SYBoImHYKSVYTCqcyhwDWvsDmu/Nb3viDGBOJnqkqTuLDHQIOoEfuOXfNEC6MK3J9YncOKMqOPyRoLiEW8JmMRPRMoGhbIn+JWvbq1K6dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953784; c=relaxed/simple;
	bh=Gj5q4h1uOiaCDsNYwSCXy6hyhyFGWPsW/JzlSjPTviw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kcG4TaEXF+kmi+4pbFXZFHZTKO8rnnldfGzqqUDgLmn3E7O611LVXAhRk7QvphhtC8hEb+ed+ZStnbyHhOJVdnCqZqngfUaaVIbNjRc+IHji5Zh1sY5TcksFH9CoEBMz0vfmq+VD0uoM+BOk7bp+2LnLs/5zHUGeqs/RVLTCRac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UY8vE25G; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=G1oruNEK; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ed7c7e0e6def11f0b33aeb1e7f16c2b6-20250731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Gj5q4h1uOiaCDsNYwSCXy6hyhyFGWPsW/JzlSjPTviw=;
	b=UY8vE25GsabMJdCsOXPzJVFxvwNg6uOoq/ThFvRaSgtjZ92XeE4EWHn9GNb4C7EMLAnXCr4Z5RGc2QhaMddoi4v5bRtiffahlm8I9RYLxHjJuyNR1JaRqHL/VaX07YWftcCNA0VqztkYLC5jwLGWHNnIwlkjUKUohX5lAwfYm84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:837f9c48-07ce-4857-9cc5-fdb77c3e61ed,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:e5317150-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed7c7e0e6def11f0b33aeb1e7f16c2b6-20250731
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492646652; Thu, 31 Jul 2025 17:22:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 31 Jul 2025 17:22:48 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 31 Jul 2025 17:22:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBpOkcESVHSJA8gjP8W1nB1UM2O4Ies8PgQTNXdcn46qWILBkMU2I6Y4fIeT68WFJx8hY+c0wmdi96S17/4ioxG+MdvA3sl0HYjH0nSEE1yaRVwy8lFi7HoE7CQkGPv7ISdi2fYPaZaaBVvbV1quMgd0Mh8dpVzY/+fcIEEdAcS+cdKM0+4UxUBM6IvPRclYdoZYCte9kV/mqVxkj8fgmcYF8Zhrq8WYgqYqYjRg53ramCkBL2FfHAlzxaI1qDyHgh5sqOblZWm0b9SuwZIKNhJVLYgr5YDDdf+b9miNFaPn4ehbqaWnLC2gcNNha2lhPw4oEnmVaaAPMrGbYKb2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gj5q4h1uOiaCDsNYwSCXy6hyhyFGWPsW/JzlSjPTviw=;
 b=ofZ35YZ+8vItHtS9Xe9M1qE4n3UXaCSnCBJIIksQc1VUXmilTO7pPEEnCihK5RwHAuriltvJjJO6x7VCH57l+OLg/zXPK/rrfiq8/zwmSPSaFRy0nKgUbE8V37aw1zrzGWswzPM6pOBUht6Yl4zWiSMBbAT0b34CCdwBNYHxDtZKdGffmsdFyxn6bP77R+bx3hVuJa5zwJz0+dx8P92bcciss89UX5Ynmn5ltMALShQtMiFL6uy77+i5GRb81qaCuiEP+SILe0zS1xoPGxIiYhT00DPcS32DDLMqdDXGSOGkIRjjWdI+xkNndHJAJ15Edu81h4UEQeys2HMOp9nI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj5q4h1uOiaCDsNYwSCXy6hyhyFGWPsW/JzlSjPTviw=;
 b=G1oruNEK7bxU2wQvRpv7PYa0JQPHF5ZlpeZz+TCeZgsIA9+T7bm39Pby3KwdeDggdxCb7kxprKCyYdy5BmZTCqB6dayWMu0uZB7DA3oDYyzRK4hWbgqD/ULqIy3BR52Om+qM/WxFIgQS+kfoB4EzOBwktVoNBbctZI2BO3Ku5yc=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by PS1PPF0E55F1411.apcprd03.prod.outlook.com (2603:1096:308::2c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Thu, 31 Jul
 2025 09:22:46 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 09:22:46 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "huobean@gmail.com"
	<huobean@gmail.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, "mani@kernel.org"
	<mani@kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"quic_pkambar@quicinc.com" <quic_pkambar@quicinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
Thread-Topic: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
Thread-Index: AQHcABMQk8XyzRGGh0CZRYgd32oCALRIMgCAgAD6fYCAAB32gIAA71oAgACdcICAASH1gA==
Date: Thu, 31 Jul 2025 09:22:46 +0000
Message-ID: <cd2282911c3479fb247280a1c9a2b85fa45be370.camel@mediatek.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
	 <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
	 <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
	 <0fd86741-f72e-4a52-9d2c-2388c4a26115@acm.org>
	 <b005d94288a4c4d29a9361b043354bbc8d85e0e8.camel@mediatek.com>
	 <d0677ace-0f01-4111-8f00-868d83550b65@acm.org>
In-Reply-To: <d0677ace-0f01-4111-8f00-868d83550b65@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|PS1PPF0E55F1411:EE_
x-ms-office365-filtering-correlation-id: ea178d09-83be-4b54-041a-08ddd013cf9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MzBPa0ZXSkp3eDlNWFlZN281K0U1Z2hxdC9rdnZKWmV2SnBNQjlTYzNzYWxD?=
 =?utf-8?B?UTA2SExVZHBramRkVXR3L2tVcXRBd2ZMalJWZStZYjBJbERtYjhqZXJRelB0?=
 =?utf-8?B?aXZISFZYblQrMENFbyt4azlsUi9NdWJ6QmdGcHNUaXFjeTNUVldDS24wVmdz?=
 =?utf-8?B?ZXFJSlo1S0JhZkJrQThaTWZ2Z2d1V3pUSHJNWGpKZHFUNXpYRkUyUFlKNUpE?=
 =?utf-8?B?ZzdudS9TOHlSWVRCYUJnajZROVgxTEpYWHBxZlNueWl5UERPdExWN0VaUFg4?=
 =?utf-8?B?YU1CRklFbFl5WEEvb1pwaGpyWnZwQnZyZlJFQ2dKUHdCRVg2OXY4Y0ZESlIz?=
 =?utf-8?B?L2UwQnhuYUhua2d1RWo0RlB3alZPcGlQY2g1R2xHVkpyanYwVEhzUTRTSmk5?=
 =?utf-8?B?WUJJZjV1WFN5bXRlZXR4Tk1aRVRXOFpZR0tYUkxXbDg2SjA1dDVsNUdUeFdX?=
 =?utf-8?B?cTMrODJoODJyUEVXWUdEaTgrSHo1M2lCU3dVcGQ3Z3l1cDViV3c4eXgweHJW?=
 =?utf-8?B?dEI1bkxWL3FreVNtSGRFUGFBeVRlT3RCWUM3M1d6dGlxTmdScTV2cW1zR3o4?=
 =?utf-8?B?cHRlOG5laXlKVk1FcmVEbkRmcWFZYUg3MUR5bG9RSHJpUmxjeFo0SkRHYVdC?=
 =?utf-8?B?dkE4Mm04MExtTFdnaWRGSzc3eVRFRkZERU91VlN4VFdOUGVsKzNXZjVZZXgr?=
 =?utf-8?B?N1ZKWTAreVF0ck5aSjYrV3hYZGFiMWdyQzdEUUJvMGNGZllGZ0FEZ0RtVVV6?=
 =?utf-8?B?R0RDNWZINEVqd1VVMEdwMkd5ZFROTTI3NUcxa3c5aTR3cCtrd3Y4ZUREQ0kr?=
 =?utf-8?B?aDRMTGFEa2FIUFJpbDVzY2ZRQVpvZHVjNG43K1JGMXZQZ3RSSGJzM0dmOVJT?=
 =?utf-8?B?Z3pOT2FtNEVaMGZQUW01T2JxS2cyMWJLQUxJVC92djFkODRwSnp4S2xxb25l?=
 =?utf-8?B?b25WWmtrUUgyamp3RHVnK0pCN2wxbmVrYXJnZ3Z2WE8vbHc1OUZvOUQyNXdV?=
 =?utf-8?B?RmtSbnZTdVVBMmNyMzhuOHB4eFdIVVdGd2R1Mll3YzQ5OWVoalRnTjVJVnRZ?=
 =?utf-8?B?UWl2UjB6TmplMEM0bjQxemxrTlZzMWhHaGNHbFg1dTRrckNLUjFiamRzc1Zx?=
 =?utf-8?B?S3hrUGM4TVdrc3ZQS2o5WGFFRDFUTmJFY1V4a01GZnZvcDJpd1Y1OVQxdFQ2?=
 =?utf-8?B?dVpqczBkeTQyWERqaDltRjhKMHhuT1A0aldaN05mSDFNRW4rcnpEMGxWNzFX?=
 =?utf-8?B?c3Rwa2pyYkFBb0VTTG1GZVMxRkZ3MHpJR2xCL2JhQ012ZHlicWsyRUc0aFll?=
 =?utf-8?B?QThrWWkyVVhySWNTaTFsaTBBOThKajdVREYzcmZJbGVZOGxmRU5kVGZzT2Jw?=
 =?utf-8?B?SHNOTFNDWDNiS3lBd2RuVThiNlVwckVoWFR0KzdwdzByOWs3UlN3TGJ0UFdT?=
 =?utf-8?B?NkdCcE85cUNmQU5pcjlvV21HTFdsVm9KWXZ5R1JIU0tPQlRqRXlHOEJLaWdy?=
 =?utf-8?B?ZlBiblVIVjJZUGpQaWFWL21uc2NJMHFnZllzZ3FOc3h0aGpld3E3RWJJbWVP?=
 =?utf-8?B?cytRTUY4LzVvRzdDQlRwY2NvRDRwS0xBamV6SWJFcWVZblZIbzMyMVRPRXFG?=
 =?utf-8?B?NHhTeWU1dmNCalozdE1HN1JpbmpTSUM0ZFJrbS9JY1laSTRMZnZ5WlhkeVRE?=
 =?utf-8?B?QjhTMmp1aHdJTEVmLytJVVEyNEN2WElBdWcvUTllZ1JxSGs0RXRNOG5KVThU?=
 =?utf-8?B?RURQb3RvcUpFMGthOTdkMUprbnlBY0FRZTNDcjFIdHloL0ZVMUx5Y1JwazdB?=
 =?utf-8?B?cXh2TWlydjB5SVJraFBYNUdpcjd6UjVrOG5WZWdmZklqajRnakcrbTRwOXpm?=
 =?utf-8?B?WjZkR25jU0VmN3laWHhZMk55UUNUQmIrYUZaNzFHU09uRlFubXcyVi84NFht?=
 =?utf-8?B?elhkVnlTcDdoRU00QzBJVUZxbmE5b3ZTRjVZMWhEZHAvMUtSMlFKWjdmUWRW?=
 =?utf-8?Q?4pU/Zn8NGnBCvktx4BQva4WOCy3nzc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkdWRGVYWGFxSDRGMWxVNy9vM0hVUWF1RnFpUDhsd1A3VFNUUjdrSDdZdy95?=
 =?utf-8?B?UlNRMkpVbW1VSlF0aFNEak01OFdtQlY4U3RENzN6R2orRG1obitxUE92cURK?=
 =?utf-8?B?Z0tMSTBxaXdqVW1CWWw2TGRSMkJEUi9KRS9VY3g5YzFNckZYY21EdUllRGNl?=
 =?utf-8?B?OU1nZkFkQ2V2d2hITDVhQUpnbXJUNUptaGZYVkx0NjFNeXVldkhkU2JjSHAr?=
 =?utf-8?B?K0RoSGxiQUZ0QlQrN2xuUndueFZnVmhyR0ROYVRlM3lPMytZcjVlMC9PYUk0?=
 =?utf-8?B?Qk9ybURsUXhsNWtmYWNheDViQWlWRHo4SDIxUzR0WTN4cDFQRGRWR3VUQTd3?=
 =?utf-8?B?enZXUzlrclZLSVB5ZitlSCtzQWE5WXVrblBQSzArZnpwUmVBdGw4eDAzTThK?=
 =?utf-8?B?RXJlaEFhQmpJUUNhUnJnMWVsR2dUc2o4RmNERW44SlE0T0hkdWlrWE9BcXF5?=
 =?utf-8?B?RmRpRU9BeUNGeHRNT253TzJkRmJrQVBGUWdIekVUZEdxc3ErMWdPSldPaE1G?=
 =?utf-8?B?blRIUUdIL3J4RzBybWsrRm1tL1MwdEhIT3FRRTl4Q0RqR1ZiN0RXWnpoa0h3?=
 =?utf-8?B?bEM0Q1VMTUowSUZFRnR5MVNxT2xPcy8yZStDL3lhNHhrQnIxRjJsZTVNWWlV?=
 =?utf-8?B?bDBZeUtXdDhTelgvUmk3UC9Qa29FckloWXNwaThsSjRvOUpwKzhmWElLT0Q1?=
 =?utf-8?B?cm9RZGcrZUhHWFBDUmRUaUpUa3lWaytIWmxuOEdacmRJVm5vS3FzbXZQTjFT?=
 =?utf-8?B?Tm1uaW8yWjQ4T0xlS3A0cEFYOHY3S1AySEZZSjhpM29CR0ozTFlWWFFWUWZw?=
 =?utf-8?B?VVNPdW1mSU13a2s2alMvWE1JRmtoZkpGZ2lKL2psRU4rR243TnRobmE1Wllr?=
 =?utf-8?B?QVEweUpZQVkxeGtuTWExMVJlbW9HUkpLWUx0dThxNGoxV3RrZUhVYkdVdVpI?=
 =?utf-8?B?UkV4THpFTWRzanJPL0pkTEpSRkdIcXJQU1ludWowc2RTOGlxRlM0Wk5YSTRX?=
 =?utf-8?B?WEljd3hIaVZnSmpOaERpd0dsWnZqQlhBbG9KM0hBeDFxb2poemc2UldHQjlU?=
 =?utf-8?B?Uy9tcVBmOFc5NW1NWjdvUC9pN0F3K1AvejRqMXpxQ1l6MU5PUjhmaW5MSzdR?=
 =?utf-8?B?UlMxWER1V2JXdlBpRnRwYTNHVW5uMVYybXY4bTNiT3ZQYXM2NThMSWIxZ0Jj?=
 =?utf-8?B?MWdVY1FvVkJjTGFlbFNYTG1XLzVBNVFxK29Lb0tZOU9EM0pManh3NE1MMkdu?=
 =?utf-8?B?MGhnUFNnNmFOQUtXWGdyUTlGUmd5RXg3YW92VlVHU2lJbGQ3S0FaeDd3czY5?=
 =?utf-8?B?aVZXTE5vMlZqTGcrbUJqOGlqWlpCZ2cxWUJORWhhTFJOWG1kK0x6OUgyNk54?=
 =?utf-8?B?VlVhQXYrU0UrQktyS1dxMVBLNXNTRXZTSWE3cHUzOVVHZE0wTllyQjVMK1dL?=
 =?utf-8?B?Sm51RlJLekdscFVlc1RlRFV2MkFQWFF6UXZaTm90Z0x4MHF2WEg3anhSTGZL?=
 =?utf-8?B?cTNDd1JxeHQ5dzlpSERJVGdaWDU5SEsxdzdCcUxseE9ROEtSLzk1ZU0vUTZt?=
 =?utf-8?B?aFNkWHhjVHhmb1B3MDJyRDdiL3U5YUs5cmNoWDlQd2NIQkNMcmw2K296bG1s?=
 =?utf-8?B?bUxxdmd2cjFndno3S1VwUVhJTVJuU1IveFJRQzdIUyt5OThNVlRHYkowWHQ3?=
 =?utf-8?B?NG8rVG1Nd2IrdGplc2kveWZhQ1VnVGdoTFR3RlFUcU5wNERyKzJ2RmZETHRq?=
 =?utf-8?B?RTFrZnN2MnR1dTduVFZXbm15eUJtZVNMcTdxMG55c245VTY3RkQ4TnZBTmUr?=
 =?utf-8?B?U2kzRWEwblhzV0JXcGlqNVNNaThLRm9heW9HYmgvRDRhWGN6eXJJaXVzRUpB?=
 =?utf-8?B?UVlqK0FkWHIxUVNDa25xTSsyaExVMHhhQ3NqVXhEUnpwTlkrYUdZUisyNXBH?=
 =?utf-8?B?RzZENnVTWG1kaXBHS2Q0dFNwSk9UT0RoWlZRcDRyS3N6TkxZTWpjNU1qdVVa?=
 =?utf-8?B?UnJlMG45SUJEVjh6enVZQXNBeDJaYWYwZ3I0LzZFamsyZ3RDL1ZDeVVDMzBB?=
 =?utf-8?B?REJsQ3BMcjNqMnJLT2owZ2Z5ZUVFNGhJQWtSTFlDOHhibm5XcFY4T1gwcE9z?=
 =?utf-8?B?cWVIQitXZkhRMUJBbkZ3SnVzV081TDdlOHoveWhHR1dhV2haUUtFRlNpbDdR?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <238A697552B29745A108086645C49FE6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea178d09-83be-4b54-041a-08ddd013cf9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:22:46.2023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ahb6tzg3Yc4X60/25QddCshZC2WPxW28naRO60QpAt2X8xD3OF+RbdFIiajhDJPNCrQM34S56iqzD1+wqW/zuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF0E55F1411

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDA5OjA0IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiBIaSBQZXRlciwNCj4gDQo+IFRoYW5rcyBmb3IgaGF2aW5nIHRha2VuIGEgbG9vayBi
dXQgSSB0aGluayB0aGF0IHlvdSBtaXN1bmRlcnN0b29kIG15DQo+IHBhdGNoLiBNeSBwYXRjaCBk
b2VzIG5vdCBtb2RpZnkgdGhlIGJlaGF2aW9yIG9mIHRoZSBVRlMgZHJpdmVyIG9uDQo+IHN5c3Rl
bXMgdXNpbmcgdGhlIGxlZ2FjeSBzaW5nbGUgZG9vcmJlbGwgbW9kZS4gSXQgb25seSBtb2RpZmll
cyB0aGUNCj4gYmVoYXZpb3Igb24gc3lzdGVtcyBzdXBwb3J0aW5nIE1DUS4gQW5kIG9uIHN5c3Rl
bXMgdGhhdCBzdXBwb3J0IE1DUSwNCj4gaXQNCj4gcmVzdG9yZXMgdGhlIGJlaGF2aW9yIGZyb20g
YmVmb3JlIHdoZW4gY29tbWl0IDNjN2FjNDBkNzMyMiAoInNjc2k6DQo+IHVmczoNCj4gY29yZTog
RGVsZWdhdGUgdGhlIGludGVycnVwdCBzZXJ2aWNlIHJvdXRpbmUgdG8gYSB0aHJlYWRlZCBJUlEN
Cj4gaGFuZGxlciIpDQo+IGdvdCBtZXJnZWQuDQo+IA0KPiBPbiBNQ1Egc3lzdGVtcywgaWYgdGhl
IGNvbXBsZXRpb24gaW50ZXJydXB0IGlzIHByb2Nlc3NlZCBieSB0aGUgQ1BVDQo+IGNvcmUNCj4g
dGhhdCBzdWJtaXR0ZWQgdGhlIEkvTywgdGhlbiBJL08gd29ya2xvYWRzIGFyZSBzZWxmLXJlZ3Vs
YXRpbmcuIFRoZQ0KPiBtb3JlDQo+IHRpbWUgdGhhdCBpcyBzcGVudCBpbiB0aGUgY29tcGxldGlv
biBpbnRlcnJ1cHQgaGFuZGxlciwgdGhlIG1vcmUgdGhlDQo+IHN1Ym1pdHRlciB3aWxsIGJlIHNs
b3dlZCBkb3duLiBUaGlzIGlzIG5vdCB0aGUgY2FzZSBpbiBsZWdhY3kgc2luZ2xlDQo+IGRvb3Ji
ZWxsIG1vZGUgc2luY2Ugd2hlbiB1c2luZyB0aGF0IG1vZGUgYWxsIGNvbXBsZXRpb24gaW50ZXJy
dXB0cw0KPiBhcmUNCj4gcHJvY2Vzc2VkIGJ5IGEgc2luZ2xlIENQVSBjb3JlLg0KPiANCj4gQmFy
dC4NCg0KDQpIaSBCYXJ0LA0KDQpJIGFtIGZ1bGx5IGFncmVlIHRoYXQgeW91ciBwYXRjaCBpcyAx
MDAlIGNvcnJlY3QuDQoNCkJ1dCB3aGF0IEkgd2FudCB0byBleHByZXNzIGlzIHRoYXQgdGhpcyBp
cyBhIHBhdGNoDQp0aGF0IG1ha2VzIG1lIGZlZWwgY29uZnVzZWQgYWJvdXQgdGhlIGNvZGUuDQpP
cmlnaW5hbGx5LCB1ZnNoY2RfaW50ciBtb3ZlZCBzb21lIGhlYXZ5IChsZWdhY3kpIHdvcmsNCnRv
IHVmc2hjZF90aHJlYWRlZF9pbnRyIGJlY2F1c2UgdGhvc2Ugd29yayBjb3VsZCB0YWtlDQphIGxv
bmcgdGltZSB0byBleGVjdXRlIGFuZCBhZmZlY3Qgb3RoZXIgbW9kdWxlIElSUXMuDQpUaGlzIG1l
YW5zLCBpbiB0ZXJtcyBvZiBleGVjdXRpb24gdGltZSwgdWZzaGNkX3RocmVhZGVkX2ludHINCmNv
dWxkIGJlIGxvbmdlciB0aGFuIHVmc2hjZF9pbnRyLiBCdXQgaWYgdWZzaGNkX2ludHIgY2FsbHMg
DQp1ZnNoY2RfdGhyZWFkZWRfaW50ciwgdGhlbiB0aGUgZXhlY3V0aW9uIHRpbWUgb2YgDQp1ZnNo
Y2RfaW50ciBiZWNvbWVzIGVxdWFsIHRvIHVmc2hjZF90aHJlYWRlZF9pbnRyLCANCmFuZCB0aGF0
4oCZcyB0aGUgcGFydCBjb25mdXNlcyBtZS4NCg0KT2YgY291cnNlLCBpZiB5b3UgbG9vayBkZWVw
ZXIgaW50byB1ZnNoY2RfdGhyZWFkZWRfaW50ciwNCnlvdSdsbCBzZWUgdGhhdCBpbiBNQ1EgbW9k
ZSwgaXQgZG9lc27igJl0IGFjdHVhbGx5IHJ1biBmb3IgDQp2ZXJ5IGxvbmcgdGltZS4gQnV0IGNv
bXBhcmVkIHRvIHRoaXMgcGF0Y2gsIHRoZSByZWFkYWJpbGl0eQ0Kd291bGQgYmUgYSBiaXQgd29y
c2UuIFNvIEkgcHJlZmVyIHRoaXMgcGF0Y2guDQoNClRoYW5rcw0KUGV0ZXINCg0KDQoNCg==

