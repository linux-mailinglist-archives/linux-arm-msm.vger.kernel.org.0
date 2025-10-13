Return-Path: <linux-arm-msm+bounces-76920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEDABD1566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 819524E0671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 03:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611222AD1F;
	Mon, 13 Oct 2025 03:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nf0T1QCf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vhauxhbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F0C1BDCF;
	Mon, 13 Oct 2025 03:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760327825; cv=fail; b=At69LxXDfmXimpIETrxyLIssW+VWXTnmti8hRZJAN4ZmmT47OH/MlGfb18ZUecjz1MWf2U04Uhbvc46sA4j2y3Xp3v3cKlp3Cg5WsLd9GlmOWa8fZlbTsJg+lhLM9xvg6NC9WilKgXRnAEIUPTZsDmcy98LSDXYUY1gJVszY9FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760327825; c=relaxed/simple;
	bh=5dTRrwuraVxMtghYxd8vWO6Yp1IxStje0WTU94+izWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vat4DRGJ0EsN1Rm8wau8UDtYgWtfe8kMtB45uOtVkiK+7VWcTNbROtAqYmd7xLaOMystlOTalsekSqXkRe8pxp1RwxR5tiiDqdmu8Jwnizm2kzO1uThiYxqxP/2pf7kwHVqTnONmrrv2K2XFD4qummXIivNqjx7pEuy05NV9VmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nf0T1QCf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vhauxhbP; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a6221a40a7e811f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5dTRrwuraVxMtghYxd8vWO6Yp1IxStje0WTU94+izWQ=;
	b=nf0T1QCfi8mbHLCIEgwcPEL6Z8zFQAnmBPKc2VfohVRb8IJtJrtotjuQrqLt+mG8rGKO3DLJRtRwpr2igMw2M3BbZv1ZRP2ZNzExGhhiX89+2vDAPsTN7Mpx2nInXV6WHnvEL05BZ8DIno8oTDeP8EetaPimT0J/42zr0ywIPok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f91e93e1-ca0a-4854-a942-5d0aa1a3342c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5be617b9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a6221a40a7e811f08d9e1119e76e3a28-20251013
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 914267438; Mon, 13 Oct 2025 11:56:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 11:56:47 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 11:56:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrH5W//xRvHPzg7TSyx4Qtoy0LxI38dIKODLevgaeCzXTIhuuoFGf6yMiYsYbHcvdZ1tp25G0LuidkQ8tl4YfSuulM+F/FL/wQaNPCO/L8tc1oDT/C5eKuGqyEgurcE1A9n0E86NrDcKaQj67iIf2YTJLq0mumUFy78g7W7zybsgbe5dDd6XkiQuhsuoM1qHpL4vr2GKwXcszfFvBjerqy/1zJAwvbcLBWFSLyewJqWtobcNm94N8tH5M4C/YSVS2MJ/lxWUoed/6vGOwNChIamdu1ZqliFjR2OOP/RN61L4so01kf6/Rj1MbooFWK4HmyZXyrBb6tm8jUTClHuIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dTRrwuraVxMtghYxd8vWO6Yp1IxStje0WTU94+izWQ=;
 b=dYNCMK3SITWnMX6MspQmih2dejB/H4kogwM/sxlFG4y8HZpr7hm0sqJNXB/S//MoR44AFl3NMPWd0za7icPxAYcYCd7kzcqSXboc3fq5/oFlTXhmY+BWd3U9XkXh0r5B/fetYGtLN29upgXIh+mxAKTDUOaSoMY/+tKyPl/TwEzekc85fbmFnO3ffeaT9zgM/yKsoRi54wxJ5blXXwV5qktkedN0gwBpNVOdSZlK/T7HZKAW9o4TNHH6qSBgpCzXSyJAW7P6UNdKk3R2kYvG45Gga32yvhOoRfFPW01zl+nGtH5Gl2C10NUOVeClBKU3TR6I8OyJaUKOoP1H5rx2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dTRrwuraVxMtghYxd8vWO6Yp1IxStje0WTU94+izWQ=;
 b=vhauxhbPHNs+I6vs8t5PR1V1XN0ynVhfD1cBLyBpHfCalpOzmyzvnOTGQXMqVTbr3CjyYN+KNzS2sRT6tSGNhDLqWGkOnX64WFnL/sms/3CleoNntFRRXc77H/MhR+lOItx6Mko7I5T747GlxZYrOOUeuVz8o8YKdPjzo+/G7aM=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SI2PR03MB6712.apcprd03.prod.outlook.com (2603:1096:4:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 03:56:45 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9203.007; Mon, 13 Oct 2025
 03:56:45 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>, "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>, "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Topic: [PATCH v2 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Index: AQHcOVjv3J+ur6sx2Uqx9GWQEkYgO7S/eBUA
Date: Mon, 13 Oct 2025 03:56:45 +0000
Message-ID: <6810cbe3202d979bfbdac1d7f5ded6a0db92cab1.camel@mediatek.com>
References: <cover.1760039554.git.quic_nguyenb@quicinc.com>
	 <3abb389ac7ca807e82263ab344e755db8498de81.1760039554.git.quic_nguyenb@quicinc.com>
In-Reply-To: <3abb389ac7ca807e82263ab344e755db8498de81.1760039554.git.quic_nguyenb@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SI2PR03MB6712:EE_
x-ms-office365-filtering-correlation-id: 4e52f2e1-9470-4a03-1e11-08de0a0c86dd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bjF3WFdTUDhNSUx6MVJHWHFKWTIxb3A1Y3JITmFISkthMUdVNnVERUQ0bXUy?=
 =?utf-8?B?QjEvWGJlSVpuU0VGVDNpaEdxVUxTcUF4eFQxRHcrdThmU2I3elJSUUlMdXZE?=
 =?utf-8?B?a0s1K0hxQkZqOXNtRGlQMzdXakxPb0JpVWg3VDJRaUhVaWl2RFJEL1dYUnlQ?=
 =?utf-8?B?ZkQ2Q1U4aHVsaC9tM0dmSlRtZmIyQkZkTks2OHJJb1I3aUtSTXpMVjB3cFpL?=
 =?utf-8?B?VkRuTmZQTkJicmRkYnRIbzNyblUvR3k0S09hdFZxMEJ1ZDA2dVJrTGJMZWVV?=
 =?utf-8?B?RGNNNGExNlErYWRsd08ydlJwWVJrays3OEVjMUdlY1ZrdkVQeXVHVmVKemN6?=
 =?utf-8?B?WmxJYXNEdWJMdCtCS2JzRkJXMmFENmpKN0lqWThNbEo2MXUvOTkzRlpNdmpQ?=
 =?utf-8?B?eCtTY3lzVXBDbVpBc3dyQ3hhQ3B0T2tqUEJJMWwxRDFmT1g4bnFsemZmNFZB?=
 =?utf-8?B?Y09ra01sTDY3L1QzVy9hRWIyUmN3Z05zL3lpamV2ZlIyQW43ak15dmVrNFo2?=
 =?utf-8?B?MmU4Ym51ZmFxOVNaSmVqbjFDVFU1ZXJtQTNsUWhmTk4zNUQvQjlZQ2NnTHgy?=
 =?utf-8?B?N1lSV2FrR3VhOWJuYW9VNzlYeE5FV2pUNGQ5U1dHaXFNSWdvQWlOR1hEaHY1?=
 =?utf-8?B?VVljSG5CeGJEbWNVNDN4Ukc1MnNTcE1pTHhTa1BlOUx3YkMrTURoTDkzY0FJ?=
 =?utf-8?B?UTZLNndaQnc4M0MzM1FWRkg3R2pMTm1yMHhYbE1rUjZIdW12UEZySk5LaGdp?=
 =?utf-8?B?RFpMTWdWc2ZFbUUxOFRzWnl2bnQra0NJR3hqak84dit4WXplR3BXek1pTldn?=
 =?utf-8?B?UzVXbTJXaEJqczQyZ2Y5Q2VOekE0TnRPaFZDZUVOeFVnVTI2blRhajdEa051?=
 =?utf-8?B?RWZYQU5ZS1IzYnViQTY5TUhXRkVIc2lGZEFzSTlpbjY5cWtwams4R20wYTlm?=
 =?utf-8?B?U0xvSmZNN281K2dscHJMS2hLODhMYlc3K3J4K1lZdUtycU15ZXoveE1rRWt5?=
 =?utf-8?B?OXRPc09HVGFOWUJ1NmR3L05DdW5idVlOZzB4MllLcnRNZThNVUplK3JOMnZa?=
 =?utf-8?B?bnF3NDZhT0RuN1NLSzN3dDJDMXhqQWl5MEttOTh0akRUbGhQMG1hWFFQOWFx?=
 =?utf-8?B?a2ZzTlRXVWJ1MFBUQkhwUGhuc0N6ejJmTHdrVFNWODBERWVCL2tZR3hDOFdY?=
 =?utf-8?B?TnQ4dnF2UCtjNGJ5MS94elBFKzVhd2JJbFJWdW5XM04xb28yNmVzL2trTm90?=
 =?utf-8?B?ejlkL2VMb2VFREtYcCtjRnJMRXovcjd3QzVaUEpmRU4xTTJFQ2t4NFRCTHN5?=
 =?utf-8?B?S3Z4TDV1Qm11cjJlWmo1VU5zc0tZNXhsSDhiNm9Uc3U3RmovRzc3V0NFdmp2?=
 =?utf-8?B?eHFmRnRlOEhLTVhCd3pYOURSYnZxWkxwZjg0T0Q2SjdaSnRlVStjcUVtMlBN?=
 =?utf-8?B?NzdDd0h5QnMwdmNDZTN1WTNwRnJwYnNhN012azBCK2VXcTJ3NkpMQ3pKYjRp?=
 =?utf-8?B?SjdGdms3RHdxRndWRTlrV2FTNDcvWlNoOE5obXhSRDBST3REelE3cEc1N0ty?=
 =?utf-8?B?RHEyU01vUitKdHRWUC9MTmJlUnpYMm1KSmpXWE9hbFd0cndlZHdiRnAwUWxO?=
 =?utf-8?B?Wi9tMDRWdlB0LzlIOFdiUDdqRTdaZlpyNExMM3Rsb2JOSm1GODNUMlNvWkFl?=
 =?utf-8?B?Ymh3SHp2enRmZGlqS0hRMHZ1QVloTGZiTURTbWdLL1ZvcmpDVDF5Y2NESGhU?=
 =?utf-8?B?VkNiMDk5NWZFc25yaHJmVnJOMFM5TCtZdjFaOGNYM1VpcXVkaXhWUk1QYko2?=
 =?utf-8?B?USs4WVAyWUpVdnlOWkJHVDFFcmtNTjV2K0VQSkYrN1BJY041eXFVUVVjeFVS?=
 =?utf-8?B?a1VmK2gwTGUwd0xOQkZLOTNaQVRpRnprTW5lMUdtZEU4NVlSM2dBbEE4NXYv?=
 =?utf-8?B?Z3AyOHJUdWl5TzhQMnFSTEkwSlhqNjR2R29BWkUrRW5URFZhaVQzaXVqT0ZT?=
 =?utf-8?B?Vko5Q0NWZnpTWEJxU1lEcDNtTmM5VjNvdDVhMG9TMnl6YjBlYlQ5L090aGth?=
 =?utf-8?Q?9b5oUY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU54bVpOLzlHNU1nd2pab3pXeGwrcW1iUTl1OGswRnRiR0lyWTAvSTFuby9C?=
 =?utf-8?B?SXh5d0NzQ01aWUdMYUJCcUErdEFwMlFMSlZ3cmZjcms5ME1xVEkxWi9hamx6?=
 =?utf-8?B?cFZTSGRRd3Y1VCtqbzZGS3ljWGlaTFlWczhoQ2pKbHFNbTFZTE9DQVFrRkF5?=
 =?utf-8?B?R0dLWW5CQ0ZnWDFDRjZVZmY0a0ZWaFdvalNqa256dW9DVW1WWVpGZUpKbGla?=
 =?utf-8?B?Wmt6UmxYVXhjdmZtL2FKK3dOWmplRWNFcHdsM1ZFV00rRzVrUm9XL2swM1pv?=
 =?utf-8?B?ejJHc0VYOE1BOHdwejVjTlYxakxpM0g0bGx3NzN5NFBGVDd3MkdzcXVEWDZ6?=
 =?utf-8?B?eFRNYTZFWmZJaXJoN3hRODMxb20rdTY5Qnp0RGQ3a3NuVW01WTB1bjNzM2dD?=
 =?utf-8?B?Vy80SkkxZWpQYktGOTdIbkVjWGVLTmJ3eXJnUjB3ZjFNc2pCNDd0bVdENUIr?=
 =?utf-8?B?aDJlVUtkTElGcWZadHZWbUZaSlJLYlZiNDZUQ09IYk5VNFBYYzQzNyszUUlU?=
 =?utf-8?B?RVBCK2l5c1NkSVMvT29tV1o1bWpKYkxkaTIyOTYyRjA3dS9aRGNhdVN1eHps?=
 =?utf-8?B?b0hhZzY2WjV3NVFwcFJBY0pxZ2tCVkJmNVpMcnErV3dNNjRpdEQ1Z0VjTlZq?=
 =?utf-8?B?amdKMHM4UjVxTHkwNHoxVDRmN0FVWVZyKzRPNWxpSUFCemVTTHBRUituYVVM?=
 =?utf-8?B?aGg2Y1pZOUJMdDdnWXBrRG9UaWVLMVVhNjhVSW5OakFmUlNxRXc5elcyL05y?=
 =?utf-8?B?eHdGMDNzSk9OWlVNS1V1TWN3c0FNUDdYZmk1aXgwYVRya21yREIzVklndEpo?=
 =?utf-8?B?N09nNVNHS003Z21tUUZhSjR0TEZGTjQ0d2VEay9ZaEdxR0NGOFpFM1VlajN5?=
 =?utf-8?B?WEJIMjlFeW82SWROMEZRdXFzK1lobEtTLzVDdWlkVU9ycE44OEpoTTZRSkhO?=
 =?utf-8?B?TFBuYWw0WlhKNWZuS2lJMmtCUVR6T2FpRy9RbkNnb0U5TWtjK1k2SkhpTThK?=
 =?utf-8?B?c1BjQ2UrWjZubXFRdllCVHJaSkp1WEYvSUlITlh4SjRGYXkzdVJlUWQxdndJ?=
 =?utf-8?B?aTl2Z0o4Y0F1QkFNUzd2LzY1VkNIUWt3OEswVEhUcDZjM1ArNGYyS29hbFlx?=
 =?utf-8?B?b1U4Q3BiZ1B4UmFzS2RtMEg0UkNTUEtiZitFT3Q0dThCS2E3MmNmUEs0Ry8r?=
 =?utf-8?B?QUFBMkUrWWlROHNta1M5WkhOZThkR2E3MVp0c0NaNSthNzJuT0J4OW9OK0lx?=
 =?utf-8?B?K25rRnRobkpiMDkzV3FTNVhwaHpEMkp6c3pMbTI5TjNaaFVqN1BWODhQbFps?=
 =?utf-8?B?RDluUlg3UGNkMnVEU0s0Z3FpU1JuYTl3eFhxakRiamM3cWUwTTAwcDVhSHRR?=
 =?utf-8?B?UkVPKytkMVAyVHR3SkN0VGxNWGpjdUxocXkyQTJSSGtQR05yK2twdTlRa1lL?=
 =?utf-8?B?UVFPSFNtZ1RrWFNDN040TTBDcmJuLzF1ZXUyTThFZWZLVmUrT251Y3loR08z?=
 =?utf-8?B?TS8rd0lkREYrbHo3T0VoZCtxdGhHbWJ5aFJSVERwaUJ5dXlKYlBxTE1nazVZ?=
 =?utf-8?B?cndRUFVsZVZkL3JBUm1wU25xQURpZWhEcHMyNlpYR2wvWmdiOW9Od01MSnVD?=
 =?utf-8?B?NEJueHhqRHpLNWRLQk1KVUVFNkxPOTNHdGRTb3V6S3hKU2pEU1RuOGdWdmpG?=
 =?utf-8?B?b3UveXRsLzVUNnVUd3lEYUgwTGFuTkhWYUdGRkhsaVdxb3lRYXcvN0l6WE5U?=
 =?utf-8?B?U09JOGp3MldOcE5NWGZLNy80VWR4ZHRLL3QxU3F6OXZMWmh6NUthZkJZTysr?=
 =?utf-8?B?K2lZQUZoWEZZMkdpV3BWY1RmMEk3d01LMnpKRUltTnhsMXlidjdNU1A3YlVT?=
 =?utf-8?B?emRnSUpGWnFLSVh6bEF3WU9jcHYxNnJLbkpkOC9XdDhMQlZMZUR3QnNzV2tO?=
 =?utf-8?B?MlNwalc5dTVCUDEySlMyaVFPeVZuZEhmRkNNUytuOXpabzkvVjNWbkxQVUlI?=
 =?utf-8?B?RkZPcmVCN1F1K09IQUFITlkvemt6NVUyeEc2YjFKRFRqc2NFRXhDNnYvT2s0?=
 =?utf-8?B?WFhjbEZIeVRHOGR3MUV0OVhtbE1UbEQ3VHlnWlBVNENiMVAvK2FUbWRhYUxQ?=
 =?utf-8?B?amdEeHppUGlPY3FzcjRQYmNhd1d6bGpZY0FHT1hjNit1cE1FRC9CTUZFMGRS?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA184F00A371E44FB679FB2477188754@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e52f2e1-9470-4a03-1e11-08de0a0c86dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 03:56:45.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hI7EeJDNvQjwTkhlH339pP9FRHOOrHzNWydc/DenNlQ5fzkfKQK/ih1kkSTwG/TDNVUFjU578fh0n733QedfvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6712

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDEzOjEwIC0wNzAwLCBCYW8gRC4gTmd1eWVuIHdyb3RlOg0K
PiBBZnRlciB0aGUgdWZzIGRldmljZSB2Y2MgaXMgdHVybmVkIG9mZiwgYWxsIHRoZSB1ZnMgZGV2
aWNlDQo+IG1hbnVmYWN0dXJlcnMgcmVxdWlyZSBhIHBlcmlvZCBvZiBwb3dlci1vZmYgdGltZSBi
ZWZvcmUgdGhlDQo+IHZjYyBjYW4gYmUgdHVybmVkIG9uIGFnYWluLiBUaGlzIHJlcXVpcmVtZW50
IGhhcyBiZWVuIGNvbmZpcm1lZA0KPiB3aXRoIGFsbCB0aGUgdWZzIGRldmljZSBtYW51ZmFjdHVy
ZXIncyBkYXRhc2hlZXRzLg0KPiANCj4gUmVtb3ZlIHRoZSBVRlNfREVWSUNFX1FVSVJLX0RFTEFZ
X0FGVEVSX0xQTSBxdWlyayBpbiB0aGUgdWZzDQo+IGNvcmUgZHJpdmVyIGFuZCBpbXBsZW1lbnQg
YSB1bml2ZXJzYWwgZGVsYXkgdGhhdCBpcyByZXF1aXJlZCBieQ0KPiBhbGwgdGhlIHVmcyBkZXZp
Y2UgbWFudWZhY3R1cmVycy4gSW4gYWRkaXRpb24sIHJlbW92ZSB0aGUNCj4gc3VwcG9ydCBmb3Ig
dGhpcyBxdWlyayBpbiB0aGUgcGxhdGZvcm0gZHJpdmVycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEJhbyBELiBOZ3V5ZW4gPHF1aWNfbmd1eWVuYkBxdWljaW5jLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsuY29tPg0KDQo=

