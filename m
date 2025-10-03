Return-Path: <linux-arm-msm+bounces-75864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45DBB5D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 05:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CB874E0449
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 03:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E3E2D3EDC;
	Fri,  3 Oct 2025 03:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rx1Sd1MX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bEIusE+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01786274B3D;
	Fri,  3 Oct 2025 03:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759461011; cv=fail; b=R0ssU04Lgv/yKWXiYO0eBWGc9P1OZvRZ0oijTHt2DqWb56bqOJ7+178Z0uVkw+Y/G1wK+JjUng0lZtmYUu3Sn1lj3OywiCKlkeL9s1X3+owFGZYuSv+ws9+QyWmSiwHUiqA96JXUK5PCb3jBpg7hiDxK9Stm3J//HA4oKFVmEa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759461011; c=relaxed/simple;
	bh=YNuFZNH8I4tmPAebYIN5o3V+KDzK7+DnTxOqsI5kAzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jEEwR7S/Ap/ovyVulSFSW3+1o59icj++UdX8lBGQMfBLjmtIy4BAfHVYrsRVtJfMpXtArU4sgwNhwv7mXijtM+9HhxevdJc5BUEe7Or+XkNhz5k1mddeaiwDYdhA1IlX8y5VgOzNSbCiMQ6Q/ag7ojQnZ30zkuMClPmymoep1cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rx1Sd1MX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bEIusE+s; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 75714ff4a00611f08d9e1119e76e3a28-20251003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YNuFZNH8I4tmPAebYIN5o3V+KDzK7+DnTxOqsI5kAzU=;
	b=rx1Sd1MXTmcaIVVhHnuwuiHsuf0N2D2HHS7Pl8Nr20Y+5Ws6E0TZ+MXn23mbrt5hK2725+vZhOtaUEtjIGK1ZDYI77MnDy9lYuSKJKlbzj45GT5rKMHvAxy5Ss13xRC808glnp0ZtzHGIU4JxI9GrY54Ftk/ouSge43HlKns/pI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:69573fed-c641-4e99-b40d-4a31745c2dad,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:953aeee9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75714ff4a00611f08d9e1119e76e3a28-20251003
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 479399968; Fri, 03 Oct 2025 11:10:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 3 Oct 2025 11:10:04 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 3 Oct 2025 11:10:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy2Vs9OHg+ZiNac8MVxosrXjZng0poT+gaZHOzyWE2gT6yPc12ZoLso6ZMT17gqAW+BjLzgf9zUFSDR6m6/qf+T3czes1cHOudslRnh8pk2zJmRvicChFgPStQoMOoOLDN9IU43OMBLr90VhoJFg8KaMQfYzZF5jfQu10i6nLmE3xEtP3RivnIaO0gNSLzUsDR3mvBDM/hX6XHxdHl3jMDKdrvx27YtMq0Z5pLN1xeaE9q/puFykYwMQ76c0eTJaXwXuX1C4i3k+0qiyNtMVLwicPscPGcm+jTpKqm9yNdRdW0u927lqKDg7JdSaBoKCjefDvYeWrG37XWFrl2VYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNuFZNH8I4tmPAebYIN5o3V+KDzK7+DnTxOqsI5kAzU=;
 b=vcTK0PX/bBjqIMYb0c4rgC7KJC7D0UbqiqBidPVTb6bt8lIPPzNJTUpO58dFFEAQLCJvbyVZssmopHRAeZAp23lk0btjvGyPzinBVSc5zGSD0/JLVVGD0KD91CYe1etuNaIeEgvP2dFaSIhxdWd1bBV0GfbwkoI/jb/7yDzD1OJw+4AxmF2UiDGoU2dCW4M85/xB3Y02qj5SOjkJ/O2CE6xx7+ctI9cP5xkm+2sPzUhKcti6E4a9n3P8Mwk2VX0Lk7LhH0Fb2pluSzFqfurWpaYW9xaa/eClWMsqxlXBLruRsXwy+bhPnRXBOOMNR5GiXboYnZqVg4bFSya/PGMAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNuFZNH8I4tmPAebYIN5o3V+KDzK7+DnTxOqsI5kAzU=;
 b=bEIusE+sQbK8clFc+libcGtVhTlvYdhAgbBcSWFuD6j0KQaqPgiTDlux3s9Ux9kbR8KwR6CHX4z9vCxrwPCLIcroEhERNRqUzngaZTmmLALAc3qB80cgcRRqd8Q7/C0I0wxiHIuWrR4iDbCNYPy7A0RgZNpdN/tJuGWqKrLcf2M=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB8219.apcprd03.prod.outlook.com (2603:1096:820:109::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 03:10:01 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 03:10:01 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "avri.altman@wdc.com" <avri.altman@wdc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>, "quic_nguyenb@quicinc.com"
	<quic_nguyenb@quicinc.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
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
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Topic: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Index: AQHcMxYfOksnBxmnP02s2Q6lFEkIhrSufh+AgAC2GICAAIwFAA==
Date: Fri, 3 Oct 2025 03:10:01 +0000
Message-ID: <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
	 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
	 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
	 <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
In-Reply-To: <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB8219:EE_
x-ms-office365-filtering-correlation-id: 324da6e5-576f-4f78-0322-08de022a578b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dE1xazdUcU1RWUoyTUpzYllDbVQ4SnQrZ3VXYjlvYWV6eWN1ZldpaWNCTGhw?=
 =?utf-8?B?V1BuRXdKRFNXSU1GL2xIcG1YbnRmUlpCd09KM0pBNnhaNnh0bCtOY0djbTBE?=
 =?utf-8?B?emx1UTN2L3BTTkkwWXhKMEVUMGxZSHAwL3laS2wzRXFFS1JubGRMWCtmMjRr?=
 =?utf-8?B?c1ZQOXNTdzJUa2xwNlA0cUFRME1EaFIvcjV4WS9LT0hoR3BpQ3FUOFllekhh?=
 =?utf-8?B?ejhaQlJNWThWY3h3cDVQeDBCZHZkaWZMb1lIMFR2NjFaV1YzNllmRFZTMU5x?=
 =?utf-8?B?SEJJZGN2ek9zRzdaUFlxNmJqVHFZa0ZBNjZiWXArbjlqUEFxUnhTQTArVFBv?=
 =?utf-8?B?cEVReTBPclNFZ1JvbVpUSlhXT05jbVRlQ3p4VXBFWldsQmtZbzB6ZStZY2Yz?=
 =?utf-8?B?QjNibGxuNHJVWEc5SVZ6UjBuRHpjVGgzazFTVmUzNkhjVDNRYlVuUzkvZmZ2?=
 =?utf-8?B?d1hxRVJWcytSeksxbDBaa29JRDhiNVRxaUFaeVZNSmF2VkZyb0hYc0tOa3pF?=
 =?utf-8?B?TmMzWVV5ZEJsbGdkaGlndTlNSWFJanpGVmxaV0hhOElweEIydUdVMUx2cjNK?=
 =?utf-8?B?OFhoWmJwbGxnMjF6L1Z5WTgwSFFlZ3pxL1BGYzFFRWZoZldqdmwxcWFYNVRD?=
 =?utf-8?B?Q29jd1M5VVowdm5FUjVsK3Zuak4veGlSV1QrckpUK3hIaDBjMm1OUnlNM2U1?=
 =?utf-8?B?Z2xvV29GZERNMUlEclNxakgzUWYxRTRjY3FnSGIySldGNDFkOHBGU2hTeENw?=
 =?utf-8?B?OThYcjdGSlNBTjF3UVAxWWdmNkZSLzFBa0J6bG4rR2dRU3Zkc1p0T2gzV043?=
 =?utf-8?B?NmtDL2tDcVpReUs3bVRDQTZxTm80SktKZTdDSFFIay94UHlEUDFTN3lMbVpM?=
 =?utf-8?B?bjBEMWtaNm1JNGtaZWgrTktpWHlFU2MrQWJWZ1NXOUlHSHgyOVphaFdFWFgy?=
 =?utf-8?B?L0dSU00xbU5Ba0RjZGp1dFZjT1RpRlV3VHNIbWZ5aXY0Y2k0M3haTWYrWEx0?=
 =?utf-8?B?Q21DL2c0SnJiUThnVmI0bTIvclhacnp6R0NuYS9iWmE2QjJwZFFNWjZ2alE1?=
 =?utf-8?B?QmVyblNqRTZBK25rVDRlakNUQzI2bWJqVWZkSHU4cmZmRFVsNUlMRHZyeDdY?=
 =?utf-8?B?bGVxYlJkUDRKY0lxdFhPWTk0bFcvZm1ML2lHMGNuTFJ6TFljSXdnb3B4V0xw?=
 =?utf-8?B?TXpiY1hYdUlkSWdROXVBYkdEMzZhemxCZ0M5LzRWTzZHbTM3ZmZabTVMdUNB?=
 =?utf-8?B?QnB5dWNLQklHS3JJdW5hSVROcGdaZnFGbXUrbVpnYmgvVnBpSFZrNldybER1?=
 =?utf-8?B?dDhTTUxpZStKbU52blhqSjhPekFCSityQ2UwWmZNeDY4NmVwdjJQWlorYnJW?=
 =?utf-8?B?OWJUQ0hLR2JXcjJKZUZwR3JMWWoxaDdOSkxxRjk1dElwTG0yNkR3Q1hSUC84?=
 =?utf-8?B?QU9VOHU1MGtDNGU2UU9OdDZQQyt1Nkk2NmR4RENnSmJHMURmUVgxK1A1Rm1y?=
 =?utf-8?B?UDVSaWRWN3kxVW1HN1NpU0ZubHg4ckZpd2svSFUxN1gzcWs2Mitmc20vcElE?=
 =?utf-8?B?anF6WFM4OFA2SmU0dUdJMkJxQXZ5SFo3TmVXZzI4YXl4enNqd2FxdUgyNFpV?=
 =?utf-8?B?djVRaDRML3Y0MzhqL2hLVTdHelVOblBHQVhpb3BhWkh4aXJqYjRES0FlRXRQ?=
 =?utf-8?B?V3hYYlB4S2hVcGhpVDVZUGZSR2l2WWxRcVd6SHVHZEVaaXJFTHdBT3hMZVZi?=
 =?utf-8?B?YWVlTnl3bWgxc3JqU2NvODR5TU9EeTRxbDZ6cmJEMXE0MUJJZkFYa1E2M200?=
 =?utf-8?B?UjJENkZCc3dyQnUzLytpRjBINGo0WFFiMEw4NFpkQndRM0ZWbVA4bzVlNlpj?=
 =?utf-8?B?UGJtV0ZtdUpOeEdpbklaa2t4TStMcE80emduMXVyUzJaLy9TZTNGMy9hd0cr?=
 =?utf-8?B?T3pDVDVFd1lFZWhlMnMwazY2UzlSOEZGWFlkUXc4SlcybVhlTUwwRUNDL3RQ?=
 =?utf-8?B?ejBBVXU5Q0d0YnMzYThoMEdvdVkyejBLc0QrbFNGWkJIZ3Bram1sbmVWeTlo?=
 =?utf-8?Q?tvzxgQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3VTVlMvOVJ0OCtaNEYxRkllRTdQUDVxa2FIZ3hrOEo3UmpONUlNeUZjd0ZT?=
 =?utf-8?B?ZmVDenNmQkFWL0hwbzdMQ2pZMlU5bXRSMDFFMFFHbFNSUTZKQTBSZjZXbjE1?=
 =?utf-8?B?QnpVV3RCM0o0TFgwek8yRWR1Vm5Nb2xsVC9NMG4zTVN4S3pZY0JXMzJ4b0Z2?=
 =?utf-8?B?V0xTbXN0SVBpMDEwRjNtZlVDQ1BTREFQSUM1RC83VUc0UmM2em9jb0hndElx?=
 =?utf-8?B?MldqQ0F0eUFhdnhCRzQwN0dCai9DdUdOV0lETDRVdlozRFJiSmhMTUhQMXR5?=
 =?utf-8?B?NERXZGZDazdkV2JzQXJrUEk4QTA4R2VkeUY2VzR4U2VEa2RMTWNSR1Y5QkNa?=
 =?utf-8?B?cHQzY1RTNFNLSDdDL2V0d3d5NWFudGFpVEsxaGE2anYrbWJreTBUOUJlSnVY?=
 =?utf-8?B?TGtyZ2Mra2FuNmJmK2E0L1IzLzdpeXB5TFA3L1hkcGh6ZVMzS3U3dTJjZUNw?=
 =?utf-8?B?SGVaL1ZwVi9FZmxOZlJ5RTg1NTE5eTJkWEs2cWxnM0IzZkdrNnhYV3Vielkv?=
 =?utf-8?B?SHd4clg1L0twOGgwZXRjZ1ovVnY3SmVJK3FpNlBrcmQ2TU9ST1RqbUppb2Nl?=
 =?utf-8?B?SDZoZG9wMTVjOFhleXhXRWdpS2dRSUtPQ0o3S0VHRmE2dFlXbzVnOU05WWlS?=
 =?utf-8?B?TzNaM3p4NERmYkxabTl1RHVJY2pmTlJ2WVBEQVNldXNPanpDcWJSVHp2UzQ4?=
 =?utf-8?B?VDBRREpNRWR4TEZOQi9qaVJKY1hBQTFaQXlLbDg1c0tpbm9zL1lobnlGcmV5?=
 =?utf-8?B?OVhaQlVsQ2VWajQvTm1DT2FFWC83MGtnZmdlMkVrRFF0M1JJb3NjUkZCV1R4?=
 =?utf-8?B?V0dsZm9PVDBSOHo2K2ZMVWRXemxtVE1WRjc1cUFRN01rZDdmUVBQVnlOMzV5?=
 =?utf-8?B?WjNFbjA5b0tkOWl0c3YwS2Vua2tYUVErQWdsUkx5QU5CS3R3elV4NTQ3c2xr?=
 =?utf-8?B?a3ZQVWRRdzBnUXBKVlpWOVlpQ0thUHBnVzlBTDgxVjJWZVVrTC9KWU96VzJQ?=
 =?utf-8?B?NlFkcXFIKzZpU2pnVWFFZU0wQ1JSZ0FaRHpZNEk2S0h1WTVrOURxNkFhamZK?=
 =?utf-8?B?OTJDMVlsOWJ6bG5OcXFNY1dwc255bVN6bXBYU040RU53V2VUU1g2MklGbUV5?=
 =?utf-8?B?eUJDWFZ3TFhmTWw0akZVYitiejY3aFE3RW5senNucXFEUlpKTHorTlVtaThU?=
 =?utf-8?B?M21EYWJSeDFvK3pUeHBLZXZBZDVLK0x4R0l0c0N1VWdSVU56bVZPUGFsMmow?=
 =?utf-8?B?aE10TWdlc2hOdGcwcVMzOW1UcjliWVNIaVlsbGg1SXo2TVc2MHQ5c0lNQjU3?=
 =?utf-8?B?aUJCa09oekF5aWxCTUh4bmhxbk1KZDdmNUFKd1VHYmVmOTY2eHBiQmJic1dm?=
 =?utf-8?B?VkMrWGY1SjQrQkZtVkIrS2ZYNG84Q0xvNmxpNFNZRm9uL3FZQXhtYms5SmVm?=
 =?utf-8?B?c1BCZ29hUzM4VXpEbWRLUlJqTDNZbUZacGE4K0MxL2pJYWN3Y1BiUUdhSVlw?=
 =?utf-8?B?dHF3aEkzWktBVFhQM1lTVk11Ry91RllPWFdIc2M0VFhXWnBDSEc5a0pvdzdT?=
 =?utf-8?B?a01xaEZuY0pVeDh2WnFPWXZWVWNObEtYQk14RDJLWS8vbFd4aXBoaS9VeXNO?=
 =?utf-8?B?SjhPK2RGMitxRFpWRkJJTUI2c2xBK0h2eDkzT01MQW9NMTgxN1F0aTdub3J5?=
 =?utf-8?B?V1FDU24xc2Q3dkE1WmZ0SHFJUWZORXlyOUYyQTd5L1lXRU5QQnlIN2NhVllX?=
 =?utf-8?B?UmVBVFlNRUtLVkVYM2VWeEVqdzJER1hJZUtsb1UraXZ6K2NnUzd1Y0pjL2o3?=
 =?utf-8?B?SzNmdkhWamQxcEZBbTFJWkVLR1JRL0xwdEMyaWxWSlVrNEh2T1lBWSs4cW9K?=
 =?utf-8?B?SmNIZURvYmVtdzFVQXpTV1BNVG9vUkxTQXFub2JtNEZ3azdTRk1qcS9USTkx?=
 =?utf-8?B?L3Z3SlhxY09Yanl2ZG1VV3puZGJYOXBaWkptUXMxL05hdGoyUS9xZ1VlVmJt?=
 =?utf-8?B?VFhqWjV4aEoyZnMzWHhwWWNNSFEvbmpNVlZMY29raG8rUjNIMXo4eHlaVSth?=
 =?utf-8?B?NTJpT01TYkVudGxmb2l3dG8waks2cWtqTjU0ZkxXREpwTG9TNkFiMjdkaFFW?=
 =?utf-8?B?c0tLeEVVQ0hLOEVHeDl6Q3BuWElPU09rRFdMa3RBcmc1TDRMeUxLRXJLYWFD?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75AFEF1267AFD640AC7F870A835E52C8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324da6e5-576f-4f78-0322-08de022a578b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 03:10:01.3231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVzUQ+HRG1afVFzCnMXvkG7JJvaqnJo+dREN/huTYz/uAWarLmS2esFP3xV927dLNKSe6IVg2Iikp45lu40G0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8219

T24gVGh1LCAyMDI1LTEwLTAyIGF0IDExOjQ4IC0wNzAwLCBCYW8gRC4gTmd1eWVuIHdyb3RlOg0K
PiANCj4gDQo+IEhpIFBldGVyLA0KPiANCj4gVGhlIGN1cnJlbnQgTWVkaWF0ZWsgcGxhdGZvcm0g
ZHJpdmVyIGFwcGxpZXMgdGhpcyBxdWlyayB0byBhbGwgdWZzDQo+IHZlbmRvcnMgd2hpY2ggaXMg
Y29uc2lzdGVudCB3aXRoIHdoYXQgd2Ugd291bGQgbGlrZSB0byBkbyBpbiB0aGUNCj4gUXVhbGNv
bW0gcGxhdGZvcm0gZHJpdmVyIHBlciB0aGUgdmVuZG9yJ3MgcmVxdWVzdHMuDQo+IA0KPiBJIGRv
IHNlZSB0aGF0LCBhYm91dCA1IHllYXJzIGFnbywgTWVkaWF0ZWsgbWVyZ2VkIGEgcGF0Y2ggdG8g
a2VlcCB0aGUNCj4gZGV2aWNlIHZjYyBhbHdheXMgb24sIHByb2JhYmx5IHRvIHdvcmthcm91bmQg
c29tZSBIVyBpc3N1ZXMuIFNpbmNlIA0KDQpIaSBCYW8sDQoNClllcywgc29tZSBVRlMgZGV2aWNl
cyBtYXkgaGF2ZSBpc3N1ZXMgd2hlbiB0dXJuaW5nIG9mZiBWQ0MuDQoNCj4gdGhpcw0KPiBpcyBh
IHZlcnkgb2xkIHBhdGNoIGFuZCB0aGUgaW1wYWN0IG9mIHRoaXMgY2hhbmdlIG9uIGEgYnJva2Vu
DQo+IGhhcmR3YXJlDQo+IGlzIG1pbmltYWwsIEkgd291bGQgbGlrZSB3ZWlnaHQgdGhlIGJlbmVm
aXQgb2YgY2xlYW5pbmcgdXAgdGhlIHVmcw0KPiBjb3JlDQo+IGRyaXZlciBieSByZW1vdmluZyB0
aGUgdW5uZWNlc3NhcnkgcXVpcmsNCj4gVUZTX0RFVklDRV9RVUlSS19ERUxBWV9BRlRFUl9MUE0g
dnMgdGhlIGluY29udmVuaWVuY2Ugb2YgYSA1bXMNCj4gKHBvdGVudGlhbGx5IHJlZHVjZSB0byAy
bXMpIGRlbGF5IGltcGFjdCBpdCBtYXkgY2F1c2Ugb24gYW4gb2xkDQo+IGJyb2tlbg0KPiBIVyBp
biB0aGUgc3VzcGVuZC9zaHV0ZG93biBwYXRoLg0KPiANCj4gSSBiZWxpZXZlIHJlbW92aW5nIHRo
ZSBVRlNfREVWSUNFX1FVSVJLX0RFTEFZX0FGVEVSX0xQTSBxdWlyayBpbiB0aGUNCj4gdWZzDQo+
IGNvcmUgZHJpdmVyIGFzIHdlbGwgYXMgYWxsIHRoZSBwbGF0Zm9ybSBkcml2ZXJzIHlpZWxkcyBw
b3NpdGl2ZSBuZXQNCj4gYmVuZWZpdHMgaW4gdGhpcyBjYXNlLg0KPiANCj4gVGhhbmtzLCBCYW8N
Cj4gDQo+IA0KDQpJIHRoaW5rIHlvdSBtaXN1bmRlcnN0b29kIG15IHBvaW50Lg0KSSBhbSBva2F5
IHdpdGggcmVtb3ZpbmcgdGhpcyBmbGFnLCBidXQgdGhpcyBwYXRjaCB3aWxsIGNhdXNlDQpkZXZp
Y2VzIHdpdGggVkNDIGFsd2F5cyBvbiB0byB1bm5lY2Vzc2FyaWx5IHdhaXQgZm9yIHRoZSANCmRl
bGF5LCByZXN1bHRpbmcgaW4gd2FzdGVkIHRpbWUuDQoNClRoYW5rcw0KUGV0ZXINCg0KDQo=

