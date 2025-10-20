Return-Path: <linux-arm-msm+bounces-77947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E60BEF853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61833189ADEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 06:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC45A2D46DA;
	Mon, 20 Oct 2025 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZwyYx8l/";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZOiNLuKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9AF14F9FB;
	Mon, 20 Oct 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943204; cv=fail; b=q9S16ZTOxqWT/hF9jCUBWzFAXVC7388qMsdKaoqtxtlr/VOQm+qtXXaebb/16dLSKt79up8ffNFI30Ed+t5DlE0ioLVt1clsJbWo+MnoPb1kN4/B0ikZcFDK5vLu+gYrOP1UL+spIUNwhCbQ+msp+W1oS/YqxMccqdnkcn2nBd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943204; c=relaxed/simple;
	bh=KpXk0gw/oWgqPXpqxUug2BYIhYqRHxj8QCdf4+L4XEI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rgXEbFTJEIuuml7+/yW8XeN0lBvwKqBnTtwCZytqJVx/bM/gJcdEQLVCBw3rtwJ8LjaABCfzjIiM9qSJblcl68QPzq//8Ro2nSMJit48l+q66pzDsj903Q86Y3SaIMHGnGqBqhUNc4x5qg9Ve5UmXmRFvOI8eCWdSnEtwXg/J5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZwyYx8l/; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZOiNLuKe; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 70e8cb78ad8111f0ae1e63ff8927bad3-20251020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KpXk0gw/oWgqPXpqxUug2BYIhYqRHxj8QCdf4+L4XEI=;
	b=ZwyYx8l/hVf127Wme4jUb68ejXfaiUeAwnxXUNhGX5sDS5SGKBNHKQuj3WtKBErF3g8kAkw8sSZdes6FHmhRJpE/6ZKH8ByNi05o9IGhM1wOQtg6r80Esyx190GDZExLZcs2ifBxCIDRsN4lK0b3ZSbgPkjoVNdbcrY5hCbm7S0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7645ccf1-88aa-49d6-8f49-d59ef9098b92,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:aa415ab9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 70e8cb78ad8111f0ae1e63ff8927bad3-20251020
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2114119364; Mon, 20 Oct 2025 14:53:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 20 Oct 2025 14:53:04 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 20 Oct 2025 14:53:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB7Gbcsy+XTz7kz/8Ar2+Y/R3RFcHZjltkJ3bNNzFI5U3zZ6JycSKvMqV9JBo7ZzalN55DjwpgQRmh3b59AtNXrfIKsXLjV2pMWg1xf2fVxyJjkaqJWxJoQvVE7yHOPF6FnzJXfMer4sZg/sbel5po3lbZugBokY18alpS2xVS+6qDDaLDL/hPFRkd+jhoXAaMpla71Sa+C/3uaSW0dhkXcSGGbHGx2ljDohWYMc56NvCV7chSjQuJMiP4VisKRb9xG/bWfiNZU3KnYg6vVpDENEs7VJtat/KLSj90xFOJc3jl8iijS15bUH992yuAfbAXY7X8suv6dPn1T1k3lFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpXk0gw/oWgqPXpqxUug2BYIhYqRHxj8QCdf4+L4XEI=;
 b=Y1p67zTSEytD0hGHRZM1Lsd6gp4VAAQKfSpnBJJIezYG0vFqUsdf41bdkEEMYnnYBeYOwE58fi632fGb5LCtbCzVdme5IbxhUYYs9UzVPAh4SDsHSOuj+lyR1hbN+UmBubsNnXWsfamSM1hhPZhUxpTfA4hCB9OxVXxJ4e4HqsrY+9BTpXBvdaPkGRlUYLXOwna6NkAPJ+c8afE49euZQNvWFR73Mh/9v20rP+bF/KteokaIBgE4PMjqdtmPJoijS8/zN+M9E/efQnCiZK58UGKc214i/RUlpXbXh74R2Qi3vP8Uz9tiATAcndiiSgwhOmY6BBdOofGsegiCAjwTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpXk0gw/oWgqPXpqxUug2BYIhYqRHxj8QCdf4+L4XEI=;
 b=ZOiNLuKe/nXRDYdLg5spbnLqagwp5Ps6U/3EESHXxzOwiYKKLxjvsEbFguWldj5ARnz85ShtVj2avasDti89oiADSDkvvJwqNefQuAft3TrCkOJYzPhYfvoWUSMMmxdGlc0DHUqpHSe5U5PkXRgF6xpNYtVvcSFigYX2Pppz85A=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TY0PR03MB6632.apcprd03.prod.outlook.com (2603:1096:400:211::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 06:53:06 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 06:53:06 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "palash.kambar@oss.qualcomm.com" <palash.kambar@oss.qualcomm.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>
CC: "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"James.Bottomley@hansenpartnership.com"
	<James.Bottomley@hansenpartnership.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "quic_nguyenb@quicinc.com"
	<quic_nguyenb@quicinc.com>, "mani@kernel.org" <mani@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>
Subject: Re: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update
 to prevent race in MCQ mode
Thread-Topic: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update
 to prevent race in MCQ mode
Thread-Index: AQHcPNB+kkdL/1hyjEeIH07i8kpyhbTB0tIAgAFt0YCAABslAIAEIAaAgAMm74A=
Date: Mon, 20 Oct 2025 06:53:06 +0000
Message-ID: <e3fa13724a08bfaa764d57a3d223d201cd4d30c0.camel@mediatek.com>
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
	 <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
	 <f2b56041-b418-4ca9-a84a-ac662a850207@acm.org>
	 <CAGbPq5dhUXr59U_J3W4haNHughkaiXpnc4kAZWXB0SjPdFQMhg@mail.gmail.com>
	 <bb9c7926-4820-4922-a67d-65a6b1bace9a@acm.org>
	 <677b59f4-5732-43ad-83af-c670f6fb999d@oss.qualcomm.com>
In-Reply-To: <677b59f4-5732-43ad-83af-c670f6fb999d@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TY0PR03MB6632:EE_
x-ms-office365-filtering-correlation-id: ed732966-9d39-482f-508a-08de0fa55280
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RC96WjQwaGs2QllWNkU1RjBRc0sxNXk0dEcyTGI1ZldwcXRpK1kva1lOS21N?=
 =?utf-8?B?dDlSOFl2ZUluZnV4UVVGelE1bFhZUmw5cm81VE92K1d3eU4ydWl2VkYwanpy?=
 =?utf-8?B?WVlmMm1rVlprOWtZcWVhTGpNcTdNTDNQVUx6RVFjeDViL3BIVG9OaHRQbWxu?=
 =?utf-8?B?R2hxM0RuS1U4NUtSSTdHZUk2OWlxS095VkFhMnhQNy93ZHBDd2pZRVk5Y1V1?=
 =?utf-8?B?TGNvV2JYNWxJQXVucWRTN29aNlh3MUFSeXJwOWhvaXAwMGRSSXlmbi9FRFYw?=
 =?utf-8?B?S3JyMUtnbGorT01ZL0VyUks4TUgwd3pXSldKdVgvN21RSUlJRllVRWd0VzN1?=
 =?utf-8?B?TVRoVi9PNlZoaXJibmdQV0g5RnZnQnBlaXdaSWRWdlVOZVY5cXBjMTgxNXY0?=
 =?utf-8?B?QWM4eHVmR21FeTNRaFhPV2JDZ0JoODcwYldEVVRwYjR0S2s2ZVlDTm9LMjdB?=
 =?utf-8?B?bHRJTVk1Z0hPTkZjb3NlT3FoU0ZwU3NkWFhxdFZVS1dLV243TlFubkJWOGNt?=
 =?utf-8?B?YzAzRVVMdFU4bUdpNW9UY0oxV0ZYUlhYL3dvaDJlK2x0WnJubnJPeWNsR05h?=
 =?utf-8?B?TVAwU1hiYVovcUp4S0RGUXh5UTg2UEVnNkp5Mk05bHg4bXZsSTF1WWc3cHJq?=
 =?utf-8?B?U1hvVktFZ0dobkVUd3lsdDUwejRuM0E0cE1ETnJIVzk1QlRtRU1yUHVnL3E5?=
 =?utf-8?B?S1BZVHAzNFZmdEd3TStCNldWcnZXQk1BTkQvK3dkMEtRTG1JT3JnTit6V3J0?=
 =?utf-8?B?bkNZeHBzMm9OZDdHSTFjclhsQ1Q4UEo0blFHK2l3SGlINjBDQ0luaUZVOHlC?=
 =?utf-8?B?c2hxRHZCTDJHZ2lITTkzdm9BRDI3T0lmelVnWkpnQWcwczM5VXhWZVJEVjEr?=
 =?utf-8?B?U3ljQnNNeE16Yzd4Sk4yaTNKU2gvT1ZJWFB1VDVUWUZINlE3NjBWUC9nV0JZ?=
 =?utf-8?B?Nlo2MGRwUkNETlNtZnRmTmNodXBsNU5xZHdtMWtRWklyOW1GT2VxNGQ2SDQ4?=
 =?utf-8?B?Mk1jTlQ3Z3drSHBqbzd6WDFLOU5TYWk5QnQvM3ZUN0t4dXpPY0RxVG5jR2kx?=
 =?utf-8?B?VndPdE51VUkxSjlGN0w5QWlxMi90M2VHdXB4dytweE84TVJESVBXTnpoYzU4?=
 =?utf-8?B?dFBXRktRcEpJRUNONWhtOHYrZUhHTlppVjR4UnJLclFGcGw3NVdVOFR6SDVP?=
 =?utf-8?B?N1gwS1ZmMEdkQUtKaE53T1hZdHpQcXU2dWpBNTBNUjZxcFBCdnJjNmsveE5q?=
 =?utf-8?B?MXk5MEpKanpCU3dTUHJwam5ObElzemtneUJpLzA4Z0g0TXpwSTBBcUFXMHFZ?=
 =?utf-8?B?R010bGNLZmlpbHNOcHlNVmExb0E4Zlp6Mmh0OUJQSTZHbFBNeWpJdWlrZ2lI?=
 =?utf-8?B?bnltOXZ5MTBiYlAxaEtLL1V2eWZzZlI0VC9kVDU0a3puZmlYbmYyWERiNHA0?=
 =?utf-8?B?WlpWZDM2SWZkaG9VcldjK1g4bnRrUFY0QWhuNG9CL1ZtemdDR1Q3Q2xvem00?=
 =?utf-8?B?VTdzL2ZySGlVVHBPcHlwVWw1d0puVmFuVGNNM1RQWHlRSjAwblZTcTNWUGRI?=
 =?utf-8?B?SVltdDFvTlBGWnVCbWVFWmMrZDRXQ1BMVkRGV0pObGFOVVZsVDZWbVJZNmND?=
 =?utf-8?B?cEdKODRzTkh2NUNjcHVPNjBhK25JZm96cElQRTNsenh1L0dNZHpnOHU4QmQy?=
 =?utf-8?B?TUNkbk4zV0RseVRXWlRYZWxqVi9mU1UwbmMyaXRWblZWRlVFK2xGZVFidjZM?=
 =?utf-8?B?Qjh2VEF4YW9HZUhGclRyZXRBUHhVRHgwVHl6emNCMCsvNEo4Mnl5ZThIZzBV?=
 =?utf-8?B?eE5ZRHY0VjFUM2FCeWRrK1hLZGNaNHJ2eFBlYXFYTVpZdzI2emQzMXMyYUMw?=
 =?utf-8?B?OVNGQUlabzBCTE42TXIrYmtkWWpUV3lmOGRwMmVSK2JCL1d3OXljcmxyM2V4?=
 =?utf-8?B?YXMzK1NPVFpuZi9yN0ptSFJaWGNTOEJReTQ5cWRYWHBMSSt4NVhFemZ4aFpw?=
 =?utf-8?B?WXZheXRab2V4eWp3QmFLN1NkQ2EvZDFpQUpmc1lyV095eFBnZ0UrZzcwbDZM?=
 =?utf-8?Q?lqQrdJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEZ3a0EvS0JySXB5RWxYaE1URk1BYm1jb1FHd09mMm1PQUhSMzJnSXNrRWta?=
 =?utf-8?B?TkdRWGlUVUM4VmVXTjBzcENoejdTbmdqNE00emZ2ckQ5dURPTEtvQmxtbzRY?=
 =?utf-8?B?QWhIUTRnVnpTdStuLzZBNmpVUThBMFpoaHdQWHliK003bWd0N2x3T29QSm05?=
 =?utf-8?B?UzhYS2pmdE5iS1lIcHRKYVk4Q0JGaUN4Mytsd0JsUjcweGF1R3pYZXZRZnZG?=
 =?utf-8?B?ZngrbWhuL3pEbkhwblI4eUVSN3lYaWRuZkRYK3h5NUo0M3RuNHNUK0dSQ05G?=
 =?utf-8?B?a2N0cXZHT0ErOFhJNHc0dnlGTWR4ekZoeWxaL240WkxpTWt6RDNDaysrQURN?=
 =?utf-8?B?ZEFHUWlWSFpBcGJOQm5POHpBbUxwVFdNMlJHTkx5RkdiNGpoZmZJYUErOXN3?=
 =?utf-8?B?L0Y0Y0JLOUdTSGlwT0VVaSsvQU1hdjZ2SUxJempUb3czOWR6UWJOSzBYMkVC?=
 =?utf-8?B?aTh3eTJOc3F6a1VRSGF3VFRLb3ZxU0doUll6VTZic2wrVzF6TEp4bzAxUnp5?=
 =?utf-8?B?M1lHWTB6d3YzRkNzQ1VSLzB1eFhFelJoRWFsWkNOVGo2SjM2Nmx4RVlFazM1?=
 =?utf-8?B?SE5MUkVQV3hFOGI2OWQrQTl0QWhmdFhFRUYvdWszRmtSM0ZMRjF0S0hGeDBm?=
 =?utf-8?B?ZkRPLzZGOUpsQnNzQm53VGFaMHh4UDB6L2QyY2ZrbllaaTJSNXJyQS84QnNw?=
 =?utf-8?B?SXc5NnFnLzZRVVJtS2ZnTGdBaGQwaXE5WHpDRURid1EvQ1ZxTlBrOUh5SEFw?=
 =?utf-8?B?YTYyT2VsQjVyeUdxSjJrNkh6VG01SUZzRk9FUjc3SUNmVFU3ZitQamd1eFhn?=
 =?utf-8?B?TFNpeVhjak1Zb21NNmI3VkhYaEdsVGVLeGdhYk1yNFFZKzd6VVQybExJUUla?=
 =?utf-8?B?VmFUSUZBVVJaWThWZmx1UHVLNnJoT2NjNnE1UWJURWZTZWMzc1U2WStWUlFF?=
 =?utf-8?B?WHhsUzlzejFMZ1dkZHRhblp5YnNDV0tNQUlPVkFVV2JEWnBac1VJQVlTcGRq?=
 =?utf-8?B?VkdIdmoyUWVEVXIzWXhTVDdOT2oySVBqQXp6UGJSelN4MWlkT09wbU55cGNx?=
 =?utf-8?B?NVFhRXhZT2ppNUt6SWc0NmxRaHJWRUtpK25ScC91V0gwV004a2E0Qk5zemxz?=
 =?utf-8?B?UEdFaG41blZvQk5ydVRrOWJxVEszZzY5VjlvdGlTejcrRXB5QktyenRvUnlK?=
 =?utf-8?B?ZDJFMzlaM2ZTNWpzcXJGY0ovc0paMXNjMDJKaEI5aHNJaXZ6WkhZcW1yK25X?=
 =?utf-8?B?eVhGUEpSWXZybkNpQWppVUpXck9JdTJURWoydHlLa21OMHF3YjFVOWQxMmUy?=
 =?utf-8?B?Rjk5VkhVRk1TUTR4ejNGKzlDS1pOTTVzdk12WWg4Rll3cHpNTnFUaWVVeGk4?=
 =?utf-8?B?bXM1ZUNndFE1MVMyNTV3dE95N1ZyREl6NUMySXVrb2VpTmRkR1czSFVHOFBI?=
 =?utf-8?B?dHVLcUU5RjBuZDdtNVVDdEtmL1lLeUtuVUVFVXdZS3g4clBqV0R4K0t4N2JO?=
 =?utf-8?B?S3pWbFpPR1Z5RThyaDNEZG4vYVRqb2ZTMGdwSDdGeFFxTFBHYjFVb2JiVjBm?=
 =?utf-8?B?cEJkTGdzMXNhVVVGbk4rOE9FTjRaQ3d0WXU2SmlHZ0tmTnZYamhhdWtUZ2hW?=
 =?utf-8?B?V3d0VllFc05RWUxIbzBVY2tvQWJjNmM0c0o0dGhhaG53bytrdU5Ja2kzK3ln?=
 =?utf-8?B?eHF1L1BVdmptWk91SUJ4bXIvQjBhR0MyTGNEdSs5eGx4dVBxVTFTL2R1OGJP?=
 =?utf-8?B?WkFBaVA5UGhMa0N0ejZkT2ZQZlNiSFl5V2ZPbTVUL0NDRGRwT2ZRL0p0OG1Z?=
 =?utf-8?B?STFRdk9HZ3FiSTMrMEwyTGNleGdPZjZWZHlqUXAxNXg5UTRxcXprSGk1bTBw?=
 =?utf-8?B?RnlPYTExRTZIWHVFMWgrR0VlbDkrek96QVlOWjltOHhPTXhhRUx6aGdXTFZN?=
 =?utf-8?B?U0kwTlN4VWJrWHBjK1lKT21QdTdDc2JobkcxYlVZUzVPUjFScGlHVHUxTXFF?=
 =?utf-8?B?cUswT0NBcGlKVnBtTENxL3BxNWEzVnYwSXNxQ2VKZk9jaDNBYWJPSTFCTUhm?=
 =?utf-8?B?VFVsSWg0TXd6b2h2QUJ5SGorNHBIeC9XV25VNG1Hby9JdGJ0MEY3dE9hdkJs?=
 =?utf-8?B?WGZEOHBpMnVyVjlQWkNDeHRmQVVYeUxheVZ4ZmhaTTAxekhpbCsySGs1cHZq?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A3388E087D1074B997EFF0079AE7C55@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed732966-9d39-482f-508a-08de0fa55280
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:53:06.1299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70x4DUpNXQq529mMhoIdrdk5fDUIlAVWsqgj03GdwY37LBofN91/LECTWd1z0M23V6/I5s8Zz4bRSIA5Zc1+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6632

T24gU2F0LCAyMDI1LTEwLTE4IGF0IDEyOjE0ICswNTMwLCBQYWxhc2ggS2FtYmFyIHdyb3RlOg0K
PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgQmFydC4gSG93ZXZlciwgSSBiZWxpZXZlIHNldHRp
bmcgdGhlIHJ1bnRpbWUNCj4gc3VzcGVuZCBkZWxheSB0byA1bXMNCj4gwqBtaWdodCBiZSBvdmVy
bHkgYWdncmVzc2l2ZSBmb3IgdGhlIHN5c3RlbSBhbmQgbWF5IGhhdmUgYmVsb3cgc2lkZQ0KPiBl
ZmZlY3RzOg0KPiANCj4gMS4gU2hvcnQgYXV0b3N1c3BlbmQgdGltZW91dHMgY2FuIGNhdXNlIHRo
ZSBVRlMgZGV2aWNlIHRvIGVudGVyIGxvdy0NCj4gcG93ZXIgc3RhdGVzIGV2ZW4NCj4gZHVyaW5n
IGJyaWVmIGlkbGUgcGVyaW9kcy4gVGhpcyByZXN1bHRzIGluIHJlc3VtZSBsYXRlbmN5LA0KPiBp
bnRyb2R1Y2luZyBkZWxheXMgd2hlbiB0aGUNCj4gZGV2aWNlIG5lZWRzIHRvIHdha2UgdXAgZm9y
IHN1YnNlcXVlbnQgb3BlcmF0aW9ucy4NCj4gMi4gRnJlcXVlbnQgc3VzcGVuZCBhbmQgcmVzdW1l
IGN5Y2xlcyBtYXkgZGlzcnVwdCBkYXRhIGZsb3csDQo+IHBhcnRpY3VsYXJseSBpbiB3b3JrbG9h
ZHMNCj4gd2l0aCBidXJzdHkgb3IgaW50ZXJtaXR0ZW50IEkvTywgbGVhZGluZyB0byBwZXJmb3Jt
YW5jZSBkZWdyYWRhdGlvbi4NCj4gMy4gV2hlbiB0aGUgYXV0b3N1c3BlbmQgdGltZXIgaXMgb3Zl
cmx5IGFnZ3Jlc3NpdmUsIHRoZSBVRlMgZGV2aWNlDQo+IG1heSByZXBlYXRlZGx5DQo+IHRyYW5z
aXRpb24gYmV0d2VlbiBhY3RpdmUgYW5kIGxvdy1wb3dlciBzdGF0ZXMuIFRoZXNlIHRyYW5zaXRp
b25zDQo+IHRoZW1zZWx2ZXMgY29uc3VtZSBwb3dlciwNCj4gYW5kIGlmIHRoZXkgb2NjdXIgdG9v
IG9mdGVuLCB0aGV5IGNhbiBvZmZzZXQgb3IgZXZlbiBuZWdhdGUgdGhlDQo+IGludGVuZGVkIHBv
d2VyIHNhdmluZ3MuDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cyBvbiB0
aGlzLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IA0KPiBQYWxhc2ggSw0KPiANCg0KSGkgUGFsYXNo
LA0KDQpNYXliZSBkaXNhYmxpbmcgQUg4IGFuZCBlbmFibGluZyBib3RoIFVGU0hDRF9DQVBfQ0xL
X1NDQUxJTkcNCmFuZCBVRlNIQ0RfQ0FQX0hJQkVSTjhfV0lUSF9DTEtfR0FUSU5HIGlzIHN1ZmZp
Y2llbnQ/DQoNClRoYW5rcw0KUGV0ZXINCg0KPiANCg==

