Return-Path: <linux-arm-msm+bounces-47982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA5A356A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD84165551
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5FC18A6B8;
	Fri, 14 Feb 2025 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GlfS4u1/";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XIIroViK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EAD18A6B2;
	Fri, 14 Feb 2025 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512533; cv=fail; b=q2iKUWVKn5APTsO1OR6Rn+o7p8LtzwnBecqdHeOm+kJbtHZEM4l+w0hNf5d/dj5RKjqUjdZz5f/w+2uAfrQT4IKMIwMOxq4X1cHJVTknFkIf+ngA5IXON40WAtYFS98LtXlU5S6+78U/UHMQ+/39cagGXp4gf+EvPJYE7Jj3U5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512533; c=relaxed/simple;
	bh=TqHWtBDkFgSOdZyXhY47hPFk15LvAWG0qfCc40Sw3aI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AMaGNdTNstG+3xsF8bUbnBxKQSdBHZeFnJbnT5JgrrXFg10qwjVLKiO8bCCSxypFeLdvO8ORpBbT8jGe0REL3fCTjh46AhrcjHexhChTzdjnFWX1Nh4Ply46V21xppujiUpOBFO+3u3hm2c0PAWP9b54E3qBJ9OjS5LdZ/QUB44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GlfS4u1/; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XIIroViK; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 495b6734ea9811efbd192953cf12861f-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TqHWtBDkFgSOdZyXhY47hPFk15LvAWG0qfCc40Sw3aI=;
	b=GlfS4u1/nijL9ai5UvZMbejs6BJIKlNxxQceU3bUVWfTjodvKy3YfQ1XNaeTGvWaYQ4DV2QhOWO53LNPvB4MD4XUnZTbXon7IGK9Y4voaqJR13KlUtIyhZvpzg9KDGkFlh8M4R/fLkO8XS2STpGi6Ht0+bwHPJgy9MLvkg5fBhU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:507da868-5f93-499b-9bf2-7562111251ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f1215c8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 495b6734ea9811efbd192953cf12861f-20250214
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1203705988; Fri, 14 Feb 2025 13:55:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:55:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:55:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTudRTDtT8QDoCfQ2GSA+4GlV/0ovxt1LNB+xffyakLIjOwf4JtQInMNygzAQ+rprcAQnzTIliUP0RGfIY/H7i5ZwXklQlql+DQPYcb9wOsweapm47j9lQ3NMFirnFpMA0pKzCNpRqXTvlu3qxcHlkcCG6v0hFZ+Z3qTr02GxFFJ4Iq8zq/+eYhDB6nYk1TBmk8ztsGFsTF5Fg35256YGWIr0tKTK4vygEmmftr02wSuMaYWOZw4Gd6cx7bdlaJyN4Aa+MpGjwAs4bsfiZASjrIhuyE+f7Is4L+r8+ERuE3TCVh/8r/F/cs13iJu40v816HhJjXVN8hVKJZdDt2TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqHWtBDkFgSOdZyXhY47hPFk15LvAWG0qfCc40Sw3aI=;
 b=WqhLYdKxDvAT+XbExyx+Ermp7wWAEJGbWns7HcM/3ZCB6mYyvkzBkPoDP/nwaN/Id9lhAKcXVYwhIB/M31KGEVw7oFw5Tuny6+2Dhw9R9An0yXmqB3Jzdj7TdzHZxkaKy1ke0GHNDZ8ixO+HHNxaWAU3luA2d3PdNFP0Js7KwgcVtV8iFiCMT42FKd2JPBRu61rKRytk9ZWgeCvxZ3HsU7zGygvgZI5weRNj4DfBlS0VeVKAq+rq3vTce1I/SHPOEOSLB1lNKZN2Vs0727BQs1zw7SHt2jkzim9mrPm4NsUeLl6+PPc13zeOScPqmxhE80DGeBd0sK+sdIcmx6cMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqHWtBDkFgSOdZyXhY47hPFk15LvAWG0qfCc40Sw3aI=;
 b=XIIroViKcxsgxQfOAv5hRTJQMhLmwz2j7hpgXsDIg/B2JlOB2GVO4MEVKlKCCDfzu2MzyzYEfDFJIywPSgVm0GX8imB7C7kRAloYwv8Vp3faYzOUKuIvkry7MiJEu1TNdxwDm474wgvu0ovxCxNhUY5lUhJkfSsMYn/jIBUYhi8=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7319.apcprd03.prod.outlook.com (2603:1096:400:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 05:55:23 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 05:55:23 +0000
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
Subject: Re: [PATCH v5 5/8] scsi: ufs: core: Enable multi-level gear scaling
Thread-Topic: [PATCH v5 5/8] scsi: ufs: core: Enable multi-level gear scaling
Thread-Index: AQHbfe1z5bHstIylm0mZ1WyeaHp0CbNGTjYA
Date: Fri, 14 Feb 2025 05:55:23 +0000
Message-ID: <4985f7a8acf18d0edd5fc68adc90b83f10c2904f.camel@mediatek.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
	 <20250213080008.2984807-6-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-6-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7319:EE_
x-ms-office365-filtering-correlation-id: 32d1c9b4-05be-47f9-30a5-08dd4cbc2bfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VVBYNnBmVStpTDU2TmFpdURUTXZzSmhUM2J5c3RCL2tncHhNVU5lODB2WnlE?=
 =?utf-8?B?ZFA0dk0rcnptUnJSRkN5QjNwVzh5aTBYSHdoK2l5ZTJ2UzJUT3BidEtlcVQ2?=
 =?utf-8?B?Sk9IYU9hOXNvbStBMXBCMFl2b1FkSVFUZ05QM3ZwTHlDdWVORHE0L3VYMUR1?=
 =?utf-8?B?anZBV1Z4enJZSGJmWW52MUZlY255ZkVHVjdzajE5SEJ4OGY3L2tFQkFoQVp4?=
 =?utf-8?B?SDNPdnMzZXdQU2duQU10cVFUNkhtNGxOdHdJdjZ5RDhjc0FiUURMSnp3T3BY?=
 =?utf-8?B?Z0R5c3dGQVg5OXJUeHN4WVlZMDBmR3pac0lxNHVubjl6WGhOR0FieTM0b1Z5?=
 =?utf-8?B?Nk5WSTZQUnFIL08yWGo1WWhHSlEzV21qenJyOEJGc29lQkVsQS80MC9iaVd6?=
 =?utf-8?B?ZTVJSU45Q2VkcS9XUUttZzBkbkZ6Y3oxbzNhNzMrcGlkRzF0ay9DS3o3US9U?=
 =?utf-8?B?L2VTOHpqK3ZTdVpQSE1BbWRnbUs1aHlJMmJuSEh5UTJ5b2tnc0lFL3IwZzBX?=
 =?utf-8?B?V2lkL1FUdk9SbjU5ak9YZU9tRGRZMVRmdThtV3dDVkc3Rk5zQnVkYUNRdXV6?=
 =?utf-8?B?RVFMZnM2ME81UDkrMlhuUjRVcks3T0c3UDc5K1JqUmxXSGZQa1c1UGU1aDdN?=
 =?utf-8?B?ZS9xWC93Zmh0MklER2FrZlI2RUM0M2pwNkFxQk1MUXFuL0dMaFVuZVgxNFB2?=
 =?utf-8?B?S3hBdFVoTGN4c2V0WjVqSDJhd2ZFeTlWeTcxWEhZcVEwbUNCMHZOcDg0TU5C?=
 =?utf-8?B?dWdyL0ZadEFPUm9WVWM2LzFqcVRnUXpCRlhlUXlPbUR0RDhZNUNYZXJ5YkdJ?=
 =?utf-8?B?TlpObWttUVhVQ1ptT1F6cEROZ2xzaDZqMlZoNlR5NlliQUQzeUtqY2QwandF?=
 =?utf-8?B?WnJ4bWlhdjF3eTVEZFI0YlRVN1hTV0RKNVBuRG4zS252cXkyeW1aRCtFQita?=
 =?utf-8?B?WGFVMWovRzAxRUVjMk5JMFVuK3VvSytnNHZXbHJkSGpoV3BnRGpxd1ZWWTVZ?=
 =?utf-8?B?VCt1dktLRXpVdFlublNHL1BqQkpUNElndnpwbGdkNC9iSGtpSW5GcW40QWZB?=
 =?utf-8?B?ZkQ4cXdTS2ZPWlZxbnNJdDVrWVhEa09QTnIyWlk2SnBmdWNjQVpKTGdHT0dn?=
 =?utf-8?B?VEplN0JGdm5VNnl3SWJBSDl3RnZMTEd5WTFpcWFQZ0dxd2dUc3h0TTNsNVox?=
 =?utf-8?B?cjBPaU0vVG1DaXNFNGlOOTdZN2NWU3h1d2d0MUJzYkdqdURqMXVSTVNOSFJZ?=
 =?utf-8?B?dmkraE5PNEg0eDEzN3pGcFQ3anV2c2lQNzVKZytHUy9VWVBtSEU4UkpCMUUr?=
 =?utf-8?B?YllrUkhMMUtQQnpWeW1rV0lYdWFKK3MyL1NmcVNrZTd2Sm1DSFJnS3VkbmVL?=
 =?utf-8?B?QkQ5RFZWZlRjL1ZKNms4ZUpDRG43QnEwM3hCWUpUOU83QUlaT0cvQWVWbTIy?=
 =?utf-8?B?R0ZHT2xZK3dIajZiOVFOa2tpcE0wTWJwd3o4VENjVGJHRGE1VzcrVGl6TXhK?=
 =?utf-8?B?VDRFdFBGTkVIclVJSW85dnVxUDNCalB0dWJxamdxK0pVaXlvcy9WY3MvQk1l?=
 =?utf-8?B?N2NqaEYxMzN5MFE1M3FlUUdBQ0pVRFNXVWQyMmxBdnBaVVZjNC9kNk11K09J?=
 =?utf-8?B?UFJKK2lZYUVSNFUvWDkzcVJVdDdkaHRNaHFNRzdJTmV1L091Z0JCNVByWEZC?=
 =?utf-8?B?MWludVM5RzF0eEQwdnd6a0UwdDVUcjdza3BSSFFKdlJvMXZjdkh2MnAvSVIv?=
 =?utf-8?B?NDB3ZzhUWVFJR0owdUFMS1lpbnNoYWdFMkpUQzlWODZGaDJjbHo4N2lFazZG?=
 =?utf-8?B?N1pXOTA2ZG1MU0NHbFpFL09sNHFIUWJYM2FDUFozVVlnVWlTQlAxUjRWa0wz?=
 =?utf-8?B?S21DVGt2YlVoN1B5ZTBIMWovR0oxQkMxN3R3bGxOYXJiUEczczdVTUZ3dDVh?=
 =?utf-8?B?ckdPWFBEWFV0L2RtdE1GdTMxV05zcjVMZG1RdGREandML1NvaU1VOVNRZjlK?=
 =?utf-8?B?SWV1cjExSlB3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2c0SzNVUUFGaXNGQWtCTXVhekJLZEg0b0U4NUFYN0wwNXBuS3pFSldBUkw5?=
 =?utf-8?B?SDBISUpvNnh0TU1aZFh5Sk1NTTBMYzc2K1N4WDd1dXNqVTRTRFE4U1NnWTlO?=
 =?utf-8?B?TDRDTjRjbEE4WFFvYjZCSzhTV2tKcWlVQVJaVlFzcitHQWxIUjRSN1dVaElX?=
 =?utf-8?B?aGZ6QzlrdnRNdkdzYjV5Q3hxWTlzL1VKV24zWlVkQ25RZDFiamhsaE0xUnpS?=
 =?utf-8?B?VkxaNDNIU0R1aHc2ME5HNHdzQ1lXODZ5Q0krb29ZemFIUmtHbC9VenJXZXQ4?=
 =?utf-8?B?OXNGQkJGK1liNnR3UytneElONFlBZEtKQUtSRmhjZWFpZzZEcGx6bjYvcVBi?=
 =?utf-8?B?a1V5UnlvUVZ3Y0h3cXNDY2RWME81M0lqSVJINVp0Y3laS3dUeWFsRnZNTzEx?=
 =?utf-8?B?bjdhRU1tSytablN3RkpiVFpHejNEM0dSRmxlZE9qa0JOSDVFOXd0Rm81a0cw?=
 =?utf-8?B?OGtad3NWYVFYdGpCOTJzZjR0VnI5ODloVXVLRUZMRE0wZkJSb2lyclYrZGtv?=
 =?utf-8?B?VFFMeU41TEVlREZ1OUZJa2JBRmN0dFh3RmtvcXNyYWpWQmNyaVROM3V6S05w?=
 =?utf-8?B?SjhWejZqQ3YxeHRuN292c0FFODJzalRKRVNCaEw4T0thV0VtY000N2FEWWk5?=
 =?utf-8?B?eFJybHlONlU4WkJncXVDRzVWOGFrRTBiKytWUUcvZG5EL3RGcnUwLzJTZ01x?=
 =?utf-8?B?UWE2RE4xc0RCVHA1WCsyZmY4cTNOMjJqUFNZTXM5NFhVUnZrbkI0ejZobDFZ?=
 =?utf-8?B?elV6UndSMlUzTTY5TWQxamlwMUhaWlY3eXJxQVoybzhDcFJxbnFuYUdVTUpX?=
 =?utf-8?B?bTJ6elFaemtHQ0svL0JyVzdiTFV6OGlIMUwvREVTeGMyS1Z2ZnRiYzVzL3Vp?=
 =?utf-8?B?aEpqb0FqTjhQN05QWTBnaFQ2TDloZUI3Z2hhaXlVTXpQNzhyaEhFdm5DeWlW?=
 =?utf-8?B?eWVLSnI4ZUlJbDNpNVhrTURnbGUyMWhKdWN6d0g4RklaSHVia043TEtqa2kr?=
 =?utf-8?B?L3k1cmFDVFgraWpDNU9CUmRLUGdGTWswbXIvRHdLT0RUR2E2ZGJ1THh2YXZs?=
 =?utf-8?B?TGNEakwxNW41VGlZM0JVZEJMeTJTam9ZdGZGTUZYSDgvbkVJNkloeDZ1aFg3?=
 =?utf-8?B?ZkFjdXBXR2Y0S1hub2dsazZtVU1sOEVBYUdPODRuS3FiMitVb0I2cEhkdkU5?=
 =?utf-8?B?OWFGanRHaEJXY3FhaDI3bkJQNUJ1RkdCZ2c0eERzbVc5TDBKWWpiQzREQXIz?=
 =?utf-8?B?akZlbnc3WnVPTVV6R0N2cStUMklCaU44MlRqUm9pUy9rL3UxMjRXbmxBVzQw?=
 =?utf-8?B?OXM2b3J3QlRUU1grZVFqZXRiK3ZxaEl4MTdWNDFqOG1IZ1JFSFVlbTNFSHhC?=
 =?utf-8?B?UHNIMmlXZGpHWEZTOVJJbkFEWGlQcVNtM2pYb1pZbmc3a0pzVlRjTW9KNG0x?=
 =?utf-8?B?OHlMSm1ybHRkOEVnbS84TWd4ZXpOT0J1Y0xLVnBjSUZnY1pwMVN3ZVMrTGJw?=
 =?utf-8?B?RG05d0JPSjM4S3RFZ3VrdVdYYTREZEZTbWpNRW5KclFYQjBhS05aYXdzMUVa?=
 =?utf-8?B?Q3ZxVnBZUXp5d0wycFNnZzA0Z0xvZmJaby93elErajQyektUbGZFb2NpOVpB?=
 =?utf-8?B?Q1o2Q0NTaUF3bndPM0hGOTc4UVU2RGNrTzlMZmh0Tkc2c1VrbmZEMjJvMUdv?=
 =?utf-8?B?bnVaenp6QjhHVXNwenQ3WVdsck1Cd2RhdzYxOGlUekc4aVoyTHdyenE3bCtG?=
 =?utf-8?B?a05QWklDQjloSlFDQktYK2VhMlFSVTVLM3ZOS3cwbURnTXpxVzYyd056Q2c3?=
 =?utf-8?B?YmVabUF4MWtMVlhvbW5HMEsrUDA0K3IzWkRJNGZmeE9selVkTk9qSkRQZXlU?=
 =?utf-8?B?S0I1SVF1Ni8rR1lHN2Z3bm05Sm14UjB0Z29zdzFTRE1vQ0l4NHE1U2loalM4?=
 =?utf-8?B?em84N3d6b28yK1pXMDFoYjZTTXVZc1ljaGZjUXpnTzNEZDJrcnJrN242N1RK?=
 =?utf-8?B?VXBMdWc0cStac2EvejBsUzQwZCs1ZjVkNVV0a0pORFVXNUFUSGdCWDFzSDd4?=
 =?utf-8?B?a25Pb3FDSmI1UnFUNnJUb0FCREVTVUp6M0cxdXBQZG5pS3pIekpvckd3WUNM?=
 =?utf-8?B?WjNzZzNJeXAwQ3Z3YUsvVWkxN3RWUjFjUnVPOEZQdzMwQW10V1FCbVZ2QnhS?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66D91D2F3FD69344AD53216E0DC65BFB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d1c9b4-05be-47f9-30a5-08dd4cbc2bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:55:23.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARtEjxjwMqvXi2oAeMe4EiX5YEwlFinM7eJYzwJkkEDwheWW/ahjDXwJ/ycjgv2wIvLYNj89sAwk52qq0qBnZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7319

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDE2OjAwICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IFdpdGggT1BQIFYyIGVuYWJsZWQsIGRldmZyZXEgY2FuIHNjYWxlIGNsb2NrcyBhbW9uZ3N0
IG11bHRpcGxlDQo+IGZyZXF1ZW5jeQ0KPiBwbGFucy4gSG93ZXZlciwgdGhlIGdlYXIgc3BlZWQg
aXMgb25seSB0b2dnbGVkIGJldHdlZW4gbWluIGFuZCBtYXgNCj4gZHVyaW5nDQo+IGNsb2NrIHNj
YWxpbmcuIEVuYWJsZSBtdWx0aS1sZXZlbCBnZWFyIHNjYWxpbmcgYnkgbWFwcGluZyBjbG9jaw0K
PiBmcmVxdWVuY2llcw0KPiB0byBnZWFyIHNwZWVkcywgc28gdGhhdCB3aGVuIGRldmZyZXEgc2Nh
bGVzIGNsb2NrIGZyZXF1ZW5jaWVzIHdlIGNhbg0KPiBwdXQNCj4gdGhlIFVGUyBsaW5rIGF0IHRo
ZSBhcHByb3ByaWF0ZSBnZWFyIHNwZWVkcyBhY2NvcmRpbmdseS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBa
aXFpIENoZW4gPHF1aWNfemlxaWNoZW5AcXVpY2luYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFpp
cWkgQ2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJlYW4g
SHVvIDxiZWFuaHVvQG1pY3Jvbi5jb20+DQo+IFJldmlld2VkLWJ5OiBCYXJ0IFZhbiBBc3NjaGUg
PGJ2YW5hc3NjaGVAYWNtLm9yZz4NCj4gVGVzdGVkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4NCj4gLS0tDQo+IA0KPiB2MSAtPiB2MjoNCj4gUmVuYW1lIHRo
ZSBsYWJsZSAiZG9fcG1jIiB0byAiY29uZmlnX3B3cl9tb2RlIi4NCj4gDQo+IHYyIC0+IHYzOg0K
PiBVc2UgYXNzaWdubWVudCBpbnN0ZWFkIG1lbWNweSgpIGluIGZ1bmN0aW9uIHVmc2hjZF9zY2Fs
ZV9nZWFyKCkuDQo+IA0KPiB2MyAtPiB2NDoNCj4gVHlwbyBmaXhlZCBmb3IgY29tbWl0IG1lc3Nh
Z2UuDQo+IA0KPiB2NCAtPiB2NToNCj4gQ2hhbmdlIHRoZSBkYXRhIHR5cGUgb2YgIm5ld19nZWFy
IiBmcm9tICdpbnQnIHRvICd1MzInLg0KPiAtLS0NCj4gDQoNClJldmlld2VkLWJ5OiBQZXRlciBX
YW5nIDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCg0KDQoNCg0K

