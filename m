Return-Path: <linux-arm-msm+bounces-47532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1E5A3070C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28503A69F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC071F131C;
	Tue, 11 Feb 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nCD43gu5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="L62hBZ4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20E1F1319;
	Tue, 11 Feb 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266124; cv=fail; b=Xe81rw7plbcPTKkQwqN/PKdEJ+Ahm7nFYf2sbzEoQBh/0oe8gYTlQoQgglUiGgbXRH6saTmvjm4ClXqSqL/lNLbSwy94KM6jclN6FiLXQFHpoDJMw91zTQZnfp58gmQmwOe0AOWSLs6VLo68D6og8QxaJN8iHLnm399F6wIYlN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266124; c=relaxed/simple;
	bh=HYWXu17t2AC0xvqcUAljA1noyTcigS5xPO/B/RVtokg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KKuepx/0IAQND3VZDj08Rgbq4s+WAB+pzSDvge2emMCt8MimieSAg173seB7yclIBAZ2u2zQRRsZ+fjCeelsbghlOe63y9WbK/BYwRIPAoM9jcF2SjcLn3EYh4/aa5Lr7j0qHfOREill+Oy4VySp9xfUxNC3Y8yyBfx9nHnmDhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nCD43gu5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=L62hBZ4D; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 90e7567ae85a11efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HYWXu17t2AC0xvqcUAljA1noyTcigS5xPO/B/RVtokg=;
	b=nCD43gu5xeFt95Sgme6t9n0y9/FZiEBVQ7WhA4AR6UxvDzUNjkjeMj8JEaQRT32vP+0AiOiIxm40OtxyRhiEhb6CRtXJwzeys3CO7icZ0itKte+q1Ob+aNSFwJTmWiEiru0k/r3nPENzD7LwT8KPZoAYbRQw1cGv3MfpDstBOa0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9c143ff4-63b1-4c11-8d8a-deb209b268a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:59672b9c-f55b-41e7-a712-ffbe7a973280,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 90e7567ae85a11efb8f9918b5fc74e19-20250211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1829725146; Tue, 11 Feb 2025 17:28:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 17:28:33 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 17:28:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OydlX8sKGGMvbDcKiy54eenFxYdxXdM+SoPVXvVoXLARcPH7PSGvo88/P+r/dlqHgs2udSP7uZlTELNRQRhjMjbfvHVJ+oFwliJQM4L3TgvZ6UELORTzyq+el102TeRFANZuBYrxiLiZi5ruerPo2mh50pkmEsG0xQBqBe78fwNS4CEK70MB1tCtxYnxUTd7n3Y4eSChIwUqBdrISv/DHS5Xprh09wYnFcNiLWclG2PdHd1yFjOHyZC7frpxt8Yjp+Fd6bdCxhNzuUYVQld4KWLRXvksKH+U7gZ+haGkvVP8BKMshL5IyAbcyh61jMlmEGJ1PxRq7RXqsw8O/LVWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYWXu17t2AC0xvqcUAljA1noyTcigS5xPO/B/RVtokg=;
 b=mL80IhbCaixGdpwn2byi2k9UopUf7RBPIoNgR9lbCnmNkhVuqAPVOSsyWkalkJP1UMVevMq0JUEr+PQtO6VVBdXvLImxrM8kWqzN9CZ8G3IwtUtPNep5uWy0li+BSRKGRzX+BoHS4o/2bdzBBdqT6nuCeLT9l39YaR4KI4cpswQozqlghu+uNdxMIW446wA0tbsSuW2weDo0dUVZNRDSV1kMDr7vOz5isqpqjQqJcrFYcCzkN2N5DIzcDpAnA/h2kz78WM0nf3buN0Z1VM5O1IOm5ECagJAfK6pIAMLkArzijPqHsIyXEwa4nsxsmp/7lgK4ajuWcBX+JIvS+NE3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYWXu17t2AC0xvqcUAljA1noyTcigS5xPO/B/RVtokg=;
 b=L62hBZ4DWsPXKPmRoEXRJH6Dz6rllCgYi9dDnDmimNSeP+H7Dkui5sRP4Vq4RyEOur8/aHVYstyCGICSMRhOm98VHBHhaCgtBJ/O9Cnbvle7CfXYjMxXoWc1V0scmQJu0qskdy+9ED7J08vKZIVfoISYM4HXqJF5hk9tu2/JwhE=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by JH0PR03MB8148.apcprd03.prod.outlook.com (2603:1096:990:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:28:30 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:28:30 +0000
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
Subject: Re: [PATCH v4 5/8] scsi: ufs: core: Enable multi-level gear scaling
Thread-Topic: [PATCH v4 5/8] scsi: ufs: core: Enable multi-level gear scaling
Thread-Index: AQHbe6MnyjqBFti8cki4wuOWwCnc0LNB11iA
Date: Tue, 11 Feb 2025 09:28:30 +0000
Message-ID: <5c2ae6c27ef0679d6664a759959ae604e560f60a.camel@mediatek.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-6-quic_ziqichen@quicinc.com>
In-Reply-To: <20250210100212.855127-6-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|JH0PR03MB8148:EE_
x-ms-office365-filtering-correlation-id: 2851fd9c-acf2-402d-5626-08dd4a7e727f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MWFCZGdYbDUzR2ZBYmh5ZGRuWm5Wb1I1RDBJLytxb0FLUkY4VUQ2N1JXNFNx?=
 =?utf-8?B?RXRjZDBYT21aZHBpZVNYSEk0c1ZkUGpBU2p1dUQxYmQwUTZKYjZkOS83bHBo?=
 =?utf-8?B?Zm12R3hWOTZMbWplbTlPdllrYmpkN2lNODNqR01mcUxrajYxWEw1blVOaVdE?=
 =?utf-8?B?NUVTcWRmSHFvMDc1b1U3c1hFMlJmY1dxOS9FeXp1S1R2TGNSVDlvN21LNFFP?=
 =?utf-8?B?REtxOVR3NWlwbW1Oc2MweDRUZ1l1TUJhWjE3OXE2bS83dVdqVFRUZTlwd1Vk?=
 =?utf-8?B?QmhKOUVicThweloySHl0UzVWU01wK0g2REhSRE9vMG0yVnFvNXpFNDlEOTMw?=
 =?utf-8?B?VTRTR1BkTGttOWpjNnV1aDRBdnZEMmY0ei9DaEFaajJwckR3dEh4TGZtbks2?=
 =?utf-8?B?amFDT0crWWJSZURURlFQQTJBYnE1SWxMQ2s1WlpZSExuQ0I1TkFEdmRRbWdQ?=
 =?utf-8?B?cmFva2Z5eUJFU28rVzlyVTdMSm1uTHBzWEJmN2lKT1pQZmFEeDZDUjAzRmNY?=
 =?utf-8?B?TkpvUnlUeEdwOG9IUGpBM0MwZDRaRWJBQkFHdWpzeHBTSUNxekhtemQ0M2tJ?=
 =?utf-8?B?YVFWM0xMcmR1eFFiSW1QSVJiaG9BdnBhU2ZvdkRBS2h1VVpwMHlqSGJEZE9K?=
 =?utf-8?B?UDN3MW1aNTZQUGlXWEs1QUI1Sy9iRzBIY1U2aU5Jd2NyTFlGakRmK3pZVjgr?=
 =?utf-8?B?Q3R4RjdLQWVaSVVUcnN4VUpOYklzaGZaSnl0T2NLMEVCb1hxT21rRi9kYmpM?=
 =?utf-8?B?eUlzR1RjTmJyd1ZTempjOE5BcFZ1cmFYVWhpbkR3T3o3MDBSSXBDcWREY203?=
 =?utf-8?B?MjBmNzNrQk5zTG9iR2FuSUgvK2dESlA5bHNoQ0lOdHBZYk56OHdteU4xb1Bl?=
 =?utf-8?B?Uk9paEp3YTVzdFg3Z1YyZllFdExRYk1nYldUbGpabjVmdHNmekpqNUZYbmNv?=
 =?utf-8?B?TkUrTkRhaGdCU2xJZ2N1dnV0cHdhMHk0OU5MM2V5clF4eVJLYytPY1R1WDVH?=
 =?utf-8?B?UmpBWlNnZ250WDNubWo4QlZaaUIxTHhOeVNDb1B6cDg3eWVtSjRvYUNTdVVy?=
 =?utf-8?B?N3B0VENzRkZUMFE2bU0yZVIwUmRYMGFIYU5BUTYvb0wwaW02VCs2YWN3aGd0?=
 =?utf-8?B?QWRmMG1MUjUreTFyQ3hCYkVZb2lFeDliRW85S05ESUVacDFEWkxmWmpGb1Ju?=
 =?utf-8?B?TXBraTM4NmJiN1kvUWhnRlVyZXZNdmpHQWUxczNYOGlnYk1USWc4MURkSFpF?=
 =?utf-8?B?MkJWM2ZCZEFlQjA4RHBUcjR2ZDBITGNPRzcxZnJBY1gxbTVMTW9oMzJOQVlo?=
 =?utf-8?B?QkVjQkxOcUJmMGxDMGFSL0JQTXo3UUZKbEs3c1lJYkdwMWZqdFlYcVQxNGc5?=
 =?utf-8?B?Ukk2TktOUzlYRUhKZ0dEZ0ZwdjRTa053MkhTYU9IUW4xVHVaVmdSb0dGTG8v?=
 =?utf-8?B?bzdFU3FDTGRsTVJCZVVsZFRJZk92Vk5YZ3ZOTkdNem9sYnVPNnR0Mm9tdXpa?=
 =?utf-8?B?VFFuWU9aZnBRNURXYlJYRzNiTGxYNDRjaEVLSWdDZDlDSXhkTFFyQVRlMFZJ?=
 =?utf-8?B?Zm5LdVJrUkl5aHhNT0dRNE9BVmJxK1R5NlFXWHVwa3FNNTg5ZlZhMTFFdGo0?=
 =?utf-8?B?R1Q0SDhSaDBoV3g4ekVUOHBPTlY4SnVHTmJhOWpUR2EvdDBtYjltRnovdEdV?=
 =?utf-8?B?aUVrMEczcnVLYzN0MUI4eUhOcmExQ0hXQkN2aUp4cW96bDNZSlJvYlpVWmZ4?=
 =?utf-8?B?MG9KSUZzN0puZ1laajNXMlhKWklZV3lMdzU2c2J0M0NVZThULzY0d0tZR0NF?=
 =?utf-8?B?VWQ1QkVSZW5HeVpMazlGeFV6OERJamxWaEx1R2lGNURMM08yUVhrRCttSDI2?=
 =?utf-8?B?UkpMRVFvT2JzaHdReDRkR2czckFnU1Jnbmc1TjE5aXBvVmxldnRLSXNFWW0v?=
 =?utf-8?B?c0h0eG5wQ3pKZ2J3V2xjc3hlRy9mZEpFOFhGMzZJRFA4U2RqVTZMNHJvSFMy?=
 =?utf-8?B?Q2hEcXJnSFBBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm5MNzVqS3lzMjIrSXpOUXpuWGhYYldVYWRuZ2liTTZCenIwUDlyVGVhaTcz?=
 =?utf-8?B?dE1nOXdDeFMyVGNmN25uU0dBUzI1YUNyV2FvQ2pzYmRUdUVzdy9SSm1KbUl4?=
 =?utf-8?B?SlpiK0JtYTdqYm0wS0FCQW8xYWNMeXNTaTB5Qm9nN1dRSFdZc3R2c1VIbU50?=
 =?utf-8?B?STdycyt5U0NLdVk2TWsyaUZjMmJCakFkRkFTdkluV0MyK3NFcWZQeDN4NUxw?=
 =?utf-8?B?MlVlbkhRU1p4Qi9EZmU3SXZLeEswd3FiYkdxOGFUQ0xrNXp5ZUs1ck1ycFN1?=
 =?utf-8?B?R3NuWGI1Yzc5NEJHM1BGS3pjR1NuZEpicVB2M0tkbWw0by9wL3R2OVNLRWF6?=
 =?utf-8?B?K2N1bnZYSVZqNXE5a1d0S0h4SVY1d05YekJ0MmFQakIvdzBrUGZwSGpyY3NC?=
 =?utf-8?B?ZnhHWEExTFNmWlkxeVk1ZzhYMm45dUZwaFRteG8yTVBZckFNTlUwWmlTT3E1?=
 =?utf-8?B?REtVN25Vd1ZWeGQySTlsWXhPYndjRGNSRFFKWG4xQ01oMVhWMEQ1bkZkWFcv?=
 =?utf-8?B?QzF2TzZXUE1ZMFZZMDB4a255ODcxaGg4MktFUkNJRUV5a0NXMmtBWXp0RUJi?=
 =?utf-8?B?MmhLTUFReHNOL0ZxeUZRK2IwVXJzOEt3OTFmL2JiQlpsWXJDMzNNV01GVDJY?=
 =?utf-8?B?dlpad3dyMmdXeTd5NW5pVkZMckRzSHI2M0JGQm85bk4vQVhOK3d5TGZZaVRC?=
 =?utf-8?B?UUpNTXhpR1IyTkVlUmtOME5zb2JLcGJEMzhJaGU1NUZSbXk3bXQ5djNtTGdw?=
 =?utf-8?B?K2ljYkpNWnZZZTJ4UFJVelpvSXo2S2FzTnNNOHptMit4bTJWVEQrL1htUVVE?=
 =?utf-8?B?SmZWRkdKZ1FaaGs0OWJXa0JlYWZXcUsxRGZnamFNREtTR1BVZjhiNDA3YmRH?=
 =?utf-8?B?c0NyM0o3SEEzSHBSSFBZRStFUWJKOW1KUFZ2RHNHcnd3MFhmSkdQb2JRdVZh?=
 =?utf-8?B?eGFlckY4WExpaEswRVVlNW03Q3BjWHlpeGRUdnRPUmZJWTc2Q3ZGd3N5dGlP?=
 =?utf-8?B?TVBJdWNsUm90WEI0dkF3VFRIYzBUOEpGdkp5SUlMWnBXZkJQV0dhT3VTdWl3?=
 =?utf-8?B?SHFBdkUrSzNOdDhrSW5hRG9vdFg4eXNOTmxEbDdBVjlodUxQTkx6dkMrTnFj?=
 =?utf-8?B?dTF3QzY2eWdza0g3MWJBUnVpOC9JZEsyNmFZK1hDOGlaa2RCQjljZExDQW9w?=
 =?utf-8?B?NUtTeHdMdmlFMThGRXV4ZWtzMDArdmhmSW4vLzVwOXlUejJQWUFQQnVqSUFM?=
 =?utf-8?B?WmhybDNaNlJnRDI2OGxVUEdhTExMQjVFdzlZcXk1NHlCR0x5SWlaRi9jMmMy?=
 =?utf-8?B?Nm5wa3grOGtqTDhpVU1JR0hvUEJJWFp5T2JKdlRYb3YwTmZiS01YeGMwUVVH?=
 =?utf-8?B?TkRUUHFBSWt5RWxnMEtYd3JweTR6RzVWU092VHlyMTNiWUFkSVczNEl1ZEVa?=
 =?utf-8?B?YU5ENC9nRm1aN0MxdHhBRVdURFM4RUloMjcrQzZFUXpHVEplUUZYNVkwTjd1?=
 =?utf-8?B?VXBTZllqVCs4V0J3SitZNVo0WW14dmtOa3NSZVA0bHoxTG1uWVpXRmwvVm1P?=
 =?utf-8?B?bnViM09PNmxxNTJFcGxmMEhwbFp5bHM0MUllS0NqSnFsNi9CTi82bTRBZTBH?=
 =?utf-8?B?NEVhcmprY3VQa3p3MHdOemxrbnB1Zm5Eb3FiU3ZQcHBsVmFxKzFld0k0Mzg3?=
 =?utf-8?B?bTI5YnNhMzNoRExLanFnSHVCWCt0ai8zYU9xc29oQWN3dGdYOEloTmZRT1BF?=
 =?utf-8?B?RkxKOWZEMnNkNTFjK28rRU5DeU1HQlFUUTBIWnd2THFhZk1ScnQ2R0RyRk56?=
 =?utf-8?B?NHNxUmM0TWFlaVk1bHBtV3N4UkZUYnp1cTM1WWduWXZ0RUR3L3FEL0tUaWxz?=
 =?utf-8?B?T2haSGV1eC9wVnFPbS9QMmVsQ1d5bmJ6NFNqZ2ZnRnFmTkh4VUNzZUxXU0d4?=
 =?utf-8?B?U0JQS0g1Y2VmSklpSDk1RHExK2Y3dUp2RmF5ZWxYOFBSTVVTTHFKK0ViRTM2?=
 =?utf-8?B?M0M4UE5Oa2o2akxBeW9iY2tjTEZsYjloMXIzYzY3aWdRWEJSL2thRmdtYktU?=
 =?utf-8?B?M1ozcDhMSWdFREZIUjBiOGVSclNMeDhySGJZS3hySUg3ZzdvTTJtRDlYTXBS?=
 =?utf-8?B?eCsvcG9DVEYvN3R1YXNyQW1JWWI1MDN6R2YxRG5jSFBIb1AwQWppSU9lcVRX?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E044A63284E05479D9EECDE3FE8F3E5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2851fd9c-acf2-402d-5626-08dd4a7e727f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:28:30.3279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V8/55DKTZCTnh1mjGpbPjHPFK+BmbMSs8nc6ImzmRR+Ot1CflkoBLYcwsbgvi7hxOUBKq6/yDVB49oi8Rex3Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8148

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE4OjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6Cj4gCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwKPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lgo+IAo+IAo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4KPiAKPiBXaXRo
IE9QUCBWMiBlbmFibGVkLCBkZXZmcmVxIGNhbiBzY2FsZSBjbG9ja3MgYW1vbmdzdCBtdWx0aXBs
ZQo+IGZyZXF1ZW5jeQo+IHBsYW5zLiBIb3dldmVyLCB0aGUgZ2VhciBzcGVlZCBpcyBvbmx5IHRv
Z2dsZWQgYmV0d2VlbiBtaW4gYW5kIG1heAo+IGR1cmluZwo+IGNsb2NrIHNjYWxpbmcuIEVuYWJs
ZSBtdWx0aS1sZXZlbCBnZWFyIHNjYWxpbmcgYnkgbWFwcGluZyBjbG9jawo+IGZyZXF1ZW5jaWVz
Cj4gdG8gZ2VhciBzcGVlZHMsIHNvIHRoYXQgd2hlbiBkZXZmcmVxIHNjYWxlcyBjbG9jayBmcmVx
dWVuY2llcyB3ZSBjYW4KPiBwdXQKPiB0aGUgVUZTIGxpbmsgYXQgdGhlIGFwcHJvcHJpYXRlIGdl
YXIgc3BlZWRzIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENhbiBHdW8gPHF1aWNf
Y2FuZ0BxdWljaW5jLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFppcWkgQ2hlbiA8cXVpY196aXFp
Y2hlbkBxdWljaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaXFpIENoZW4gPHF1aWNfemlxaWNo
ZW5AcXVpY2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJlYW4gSHVvIDxiZWFuaHVvQG1pY3Jvbi5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPgo+
IFRlc3RlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4g
LS0tCj4gCj4gdjEgLT4gdjI6Cj4gUmVuYW1lIHRoZSBsYWJsZSAiZG9fcG1jIiB0byAiY29uZmln
X3B3cl9tb2RlIi4KPiAKPiB2MiAtPiB2MzoKPiBVc2UgYXNzaWdubWVudCBpbnN0ZWFkIG1lbWNw
eSgpIGluIGZ1bmN0aW9uIHVmc2hjZF9zY2FsZV9nZWFyKCkuCj4gCj4gdjMgLT4gdjQ6Cj4gVHlw
byBmaXhlZCBmb3IgY29tbWl0IG1lc3NhZ2UuCj4gLS0tCj4gwqBkcml2ZXJzL3Vmcy9jb3JlL3Vm
c2hjZC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+IC0tCj4g
wqAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMgYi9kcml2ZXJzL3Vmcy9jb3Jl
L3Vmc2hjZC5jCj4gaW5kZXggOGQyOTVjYzgyN2NjLi5lYmFiODk3MDgwYTYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy91ZnMvY29yZS91ZnNoY2QuYwo+ICsrKyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZz
aGNkLmMKPiBAQCAtMTMwOCwxNiArMTMwOCwyNiBAQCBzdGF0aWMgaW50Cj4gdWZzaGNkX3dhaXRf
Zm9yX2Rvb3JiZWxsX2NscihzdHJ1Y3QgdWZzX2hiYSAqaGJhLAo+IMKgLyoqCj4gwqAgKiB1ZnNo
Y2Rfc2NhbGVfZ2VhciAtIHNjYWxlIHVwL2Rvd24gVUZTIGdlYXIKPiDCoCAqIEBoYmE6IHBlciBh
ZGFwdGVyIGluc3RhbmNlCj4gKyAqIEB0YXJnZXRfZ2VhcjogdGFyZ2V0IGdlYXIgdG8gc2NhbGUg
dG8KPiDCoCAqIEBzY2FsZV91cDogVHJ1ZSBmb3Igc2NhbGluZyB1cCBnZWFyIGFuZCBmYWxzZSBm
b3Igc2NhbGluZyBkb3duCj4gwqAgKgo+IMKgICogUmV0dXJuOiAwIGZvciBzdWNjZXNzOyAtRUJV
U1kgaWYgc2NhbGluZyBjYW4ndCBoYXBwZW4gYXQgdGhpcwo+IHRpbWU7Cj4gwqAgKiBub24temVy
byBmb3IgYW55IG90aGVyIGVycm9ycy4KPiDCoCAqLwo+IC1zdGF0aWMgaW50IHVmc2hjZF9zY2Fs
ZV9nZWFyKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgc2NhbGVfdXApCj4gK3N0YXRpYyBpbnQg
dWZzaGNkX3NjYWxlX2dlYXIoc3RydWN0IHVmc19oYmEgKmhiYSwgdTMyIHRhcmdldF9nZWFyLAo+
IGJvb2wgc2NhbGVfdXApCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqAgaW50IHJldCA9IDA7Cj4gwqDC
oMKgwqDCoMKgwqAgc3RydWN0IHVmc19wYV9sYXllcl9hdHRyIG5ld19wd3JfaW5mbzsKPiAKPiAr
wqDCoMKgwqDCoMKgIGlmICh0YXJnZXRfZ2Vhcikgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5ld19wd3JfaW5mbyA9IGhiYS0+cHdyX2luZm87Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbmV3X3B3cl9pbmZvLmdlYXJfdHggPSB0YXJnZXRfZ2VhcjsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfcHdyX2luZm8uZ2Vhcl9yeCA9IHRhcmdldF9nZWFy
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGNvbmZpZ19wd3JfbW9k
ZTsKPiArwqDCoMKgwqDCoMKgIH0KPiArCj4gK8KgwqDCoMKgwqDCoCAvKiBMZWdhY3kgZ2VhciBz
Y2FsaW5nLCBpbiBjYXNlIHZvcHNfZnJlcV90b19nZWFyX3NwZWVkKCkgaXMKPiBub3QgaW1wbGVt
ZW50ZWQgKi8KPiDCoMKgwqDCoMKgwqDCoCBpZiAoc2NhbGVfdXApIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZuZXdfcHdyX2luZm8sICZoYmEtCj4gPmNsa19zY2Fs
aW5nLnNhdmVkX3B3cl9pbmZvLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNpemVvZihzdHJ1Y3QgdWZzX3BhX2xheWVyX2F0dHIpKTsKPiBAQCAtMTMzOCw2
ICsxMzQ4LDcgQEAgc3RhdGljIGludCB1ZnNoY2Rfc2NhbGVfZ2VhcihzdHJ1Y3QgdWZzX2hiYQo+
ICpoYmEsIGJvb2wgc2NhbGVfdXApCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
PiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gK2NvbmZpZ19wd3JfbW9kZToKPiDCoMKgwqDCoMKgwqDC
oCAvKiBjaGVjayBpZiB0aGUgcG93ZXIgbW9kZSBuZWVkcyB0byBiZSBjaGFuZ2VkIG9yIG5vdD8g
Ki8KPiDCoMKgwqDCoMKgwqDCoCByZXQgPSB1ZnNoY2RfY29uZmlnX3B3cl9tb2RlKGhiYSwgJm5l
d19wd3JfaW5mbyk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiBAQCAtMTQwOCwxNSArMTQx
OSwyNiBAQCBzdGF0aWMgdm9pZAo+IHVmc2hjZF9jbG9ja19zY2FsaW5nX3VucHJlcGFyZShzdHJ1
Y3QgdWZzX2hiYSAqaGJhLCBpbnQgZXJyLCBib29sIHNjCj4gwqBzdGF0aWMgaW50IHVmc2hjZF9k
ZXZmcmVxX3NjYWxlKHN0cnVjdCB1ZnNfaGJhICpoYmEsIHVuc2lnbmVkIGxvbmcKPiBmcmVxLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJvb2wgc2NhbGVfdXApCj4gwqB7Cj4gK8KgwqDCoMKgwqDCoCB1MzIgb2xkX2dlYXIg
PSBoYmEtPnB3cl9pbmZvLmdlYXJfcng7Cj4gK8KgwqDCoMKgwqDCoCBpbnQgbmV3X2dlYXIgPSAw
Owo+IMKgwqDCoMKgwqDCoMKgIGludCByZXQgPSAwOwo+IAo+ICvCoMKgwqDCoMKgwqAgbmV3X2dl
YXIgPSB1ZnNoY2Rfdm9wc19mcmVxX3RvX2dlYXJfc3BlZWQoaGJhLCBmcmVxKTsKPiArwqDCoMKg
wqDCoMKgIGlmIChuZXdfZ2VhciA8IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcmV0dXJuIG5lZ2F0aXZlIHZh
bHVlIG1lYW5zIHRoYXQgdGhlCj4gdm9wc19mcmVxX3RvX2dlYXJfc3BlZWQoKSBpcyBub3QKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaW1wbGVtZW50ZWQgb3IgZGlkbid0IGZp
bmQgbWF0Y2hlZCBnZWFyIHNwZWVkLAo+IGFzc2lnbiAnMCcgdG8gbmV3X2dlYXIKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdG8gc3dpdGNoIHRvIGxlZ2FjeSBnZWFyIHNjYWxp
bmcgc2VxdWVuY2UgaW4KPiB1ZnNoY2Rfc2NhbGVfZ2VhcigpLgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfZ2Vh
ciA9IDA7Cj4gKwo+IAoKSGkgWmlxaSwKCkkgdGhpbmsgcmVtb3ZlIGhlbHAgZnVuY3Rpb24gaXMg
YmV0dGVyLsKgCk5vIG5lZWQgY2hhbmdlIG5ld19nZWFyIHR5cGUgd2hlbiB1c2UuClRoZSByZWFk
YWJpbGl0eSBpcyBoaWdoZXIsIGFuZCBubyBuZWVkIGFkZCB0aGF0IGxhcmdlIGFtb3VudCBjb21t
ZW50cy4KCiAgICAgICB1MzJfbmV3X2dlYXIgPSAwOwogICAgICAgaWYgKGhiYS0+dm9wcyAmJiBo
YmEtPnZvcHMtPmZyZXFfdG9fZ2Vhcl9zcGVlZCkKICAgICAgICAgICAgICAgbmV3X2dlYXIgPSBo
YmEtPnZvcHMtPmZyZXFfdG9fZ2Vhcl9zcGVlZChoYmEsIGZyZXEpOwoKClRoYW5rcy4KUGV0ZXIK
CgoKPiDCoMKgwqDCoMKgwqDCoCByZXQgPSB1ZnNoY2RfY2xvY2tfc2NhbGluZ19wcmVwYXJlKGhi
YSwgMSAqIFVTRUNfUEVSX1NFQyk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiAKPiDCoMKgwqDCoMKgwqDCoCAv
KiBzY2FsZSBkb3duIHRoZSBnZWFyIGJlZm9yZSBzY2FsaW5nIGRvd24gY2xvY2tzICovCj4gwqDC
oMKgwqDCoMKgwqAgaWYgKCFzY2FsZV91cCkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCA9IHVmc2hjZF9zY2FsZV9nZWFyKGhiYSwgZmFsc2UpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IHVmc2hjZF9zY2FsZV9nZWFyKGhiYSwgKHUzMiluZXdfZ2Vh
ciwgZmFsc2UpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfdW5w
cmVwYXJlOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiBAQCAtMTQyNCwxMyArMTQ0NiwxMyBAQCBzdGF0
aWMgaW50IHVmc2hjZF9kZXZmcmVxX3NjYWxlKHN0cnVjdAo+IHVmc19oYmEgKmhiYSwgdW5zaWdu
ZWQgbG9uZyBmcmVxLAo+IMKgwqDCoMKgwqDCoMKgIHJldCA9IHVmc2hjZF9zY2FsZV9jbGtzKGhi
YSwgZnJlcSwgc2NhbGVfdXApOwo+IMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFzY2FsZV91cCkKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWZzaGNkX3NjYWxlX2dlYXIoaGJhLCB0cnVl
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWZzaGNk
X3NjYWxlX2dlYXIoaGJhLCBvbGRfZ2VhciwgdHJ1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gb3V0X3VucHJlcGFyZTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gwqDC
oMKgwqDCoMKgwqAgLyogc2NhbGUgdXAgdGhlIGdlYXIgYWZ0ZXIgc2NhbGluZyB1cCBjbG9ja3Mg
Ki8KPiDCoMKgwqDCoMKgwqDCoCBpZiAoc2NhbGVfdXApIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSB1ZnNoY2Rfc2NhbGVfZ2VhcihoYmEsIHRydWUpOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHVmc2hjZF9zY2FsZV9nZWFyKGhiYSwgKHUzMilu
ZXdfZ2VhciwgdHJ1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQp
IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVmc2hj
ZF9zY2FsZV9jbGtzKGhiYSwgaGJhLT5kZXZmcmVxLQo+ID5wcmV2aW91c19mcmVxLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UpOwo+IEBAIC0xNzIzLDYgKzE3NDUsOCBAQCBzdGF0
aWMgc3NpemVfdAo+IHVmc2hjZF9jbGtzY2FsZV9lbmFibGVfc3RvcmUoc3RydWN0IGRldmljZSAq
ZGV2LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX2F0dHJp
YnV0ZSAqYXR0ciwgY29uc3QgY2hhciAqYnVmLAo+IHNpemVfdCBjb3VudCkKPiDCoHsKPiDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgdWZzX2hiYSAqaGJhID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4g
K8KgwqDCoMKgwqDCoCBzdHJ1Y3QgdWZzX2Nsa19pbmZvICpjbGtpOwo+ICvCoMKgwqDCoMKgwqAg
dW5zaWduZWQgbG9uZyBmcmVxOwo+IMKgwqDCoMKgwqDCoMKgIHUzMiB2YWx1ZTsKPiDCoMKgwqDC
oMKgwqDCoCBpbnQgZXJyID0gMDsKPiAKPiBAQCAtMTc0NiwxNCArMTc3MCwyMSBAQCBzdGF0aWMg
c3NpemVfdAo+IHVmc2hjZF9jbGtzY2FsZV9lbmFibGVfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2
LAo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmICh2YWx1ZSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1ZnNoY2RfcmVzdW1lX2Nsa3NjYWxpbmcoaGJhKTsKPiAtwqDCoMKgwqDCoMKg
IH0gZWxzZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWZzaGNkX3N1c3BlbmRf
Y2xrc2NhbGluZyhoYmEpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHVm
c2hjZF9kZXZmcmVxX3NjYWxlKGhiYSwgVUxPTkdfTUFYLCB0cnVlKTsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGhiYS0+ZGV2LCAiJXM6IGZhaWxlZCB0byBzY2FsZSBj
bG9ja3MKPiB1cCAlZFxuIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywgZXJyKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9yZWw7Cj4gwqDCoMKgwqDC
oMKgwqAgfQo+IAo+ICvCoMKgwqDCoMKgwqAgY2xraSA9IGxpc3RfZmlyc3RfZW50cnkoJmhiYS0+
Y2xrX2xpc3RfaGVhZCwgc3RydWN0Cj4gdWZzX2Nsa19pbmZvLCBsaXN0KTsKPiArwqDCoMKgwqDC
oMKgIGZyZXEgPSBjbGtpLT5tYXhfZnJlcTsKPiArCj4gK8KgwqDCoMKgwqDCoCB1ZnNoY2Rfc3Vz
cGVuZF9jbGtzY2FsaW5nKGhiYSk7Cj4gK8KgwqDCoMKgwqDCoCBlcnIgPSB1ZnNoY2RfZGV2ZnJl
cV9zY2FsZShoYmEsIGZyZXEsIHRydWUpOwo+ICvCoMKgwqDCoMKgwqAgaWYgKGVycikKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGhiYS0+ZGV2LCAiJXM6IGZhaWxlZCB0
byBzY2FsZSBjbG9ja3MgdXAKPiAlZFxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCBlcnIpOwo+ICvCoMKg
wqDCoMKgwqAgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhiYS0+Y2xrX3Nj
YWxpbmcudGFyZ2V0X2ZyZXEgPSBmcmVxOwo+ICsKPiArb3V0X3JlbDoKPiDCoMKgwqDCoMKgwqDC
oCB1ZnNoY2RfcmVsZWFzZShoYmEpOwo+IMKgwqDCoMKgwqDCoMKgIHVmc2hjZF9ycG1fcHV0X3N5
bmMoaGJhKTsKPiDCoG91dDoKPiAtLQo+IDIuMzQuMQo+IAoK

