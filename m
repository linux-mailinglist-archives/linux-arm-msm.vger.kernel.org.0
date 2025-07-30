Return-Path: <linux-arm-msm+bounces-67048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84AB1590B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE9A27B15F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 06:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D5F1F3B87;
	Wed, 30 Jul 2025 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="grgX3Fc9";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gze8ELqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9E61EFF9F;
	Wed, 30 Jul 2025 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753857708; cv=fail; b=OvgM/lM9CIAFFi6EJtvUSUN7gTqzLdYUcDcadP4tyVUbUYE6q1z1jgI/gRR/9Lz8lqQ56lUECfdskYVChWUmbQ+OIUq8Bh3/iymrH6BdPlszhgc8Z+f4gLsd0GwG3XO2nLgxl9RnNva0rklTkUvgau5kQH0henbcMsOQo12hEqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753857708; c=relaxed/simple;
	bh=ZeZlubvbT6vqfNNIO2iGvXwEerQ3OpFT6wpN4eNxaXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FgI+HdRPb3jJJzauBDAsrLr6YObhhr15jXhI6ONvJx/I/K1l5c1YKxe5CyHHh/Ck9tFtHvFhabgX397CIvKat+n1n/X5VSO8ncUUOa5t83o08bdn86pRomioRO2FLPMjwcm2Pt4qiIDDsZoxaOyvq3Toe0bOQ83maWpKQLBt2ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=grgX3Fc9; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gze8ELqI; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3b43033c6d1011f0b33aeb1e7f16c2b6-20250730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZeZlubvbT6vqfNNIO2iGvXwEerQ3OpFT6wpN4eNxaXI=;
	b=grgX3Fc9F56Rdlv9gEYPhkf64o83zbKdJuNvrQhYQQMLiiPih/NTowHqKAMCa7niguCifbvzz5mFfA8DBpPP2swlKkQu4u3CTEh3B4alC7VSV+XWzRJf0G+UHW3jdtpLlFbfL57mVjsT0RMzZDqrS9BfEyR7ixOgEf5Xn7cILAI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:44005e1f-04e6-48a7-8087-2f0f915026a0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:e9c36a9a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b43033c6d1011f0b33aeb1e7f16c2b6-20250730
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1287141957; Wed, 30 Jul 2025 14:41:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 30 Jul 2025 14:41:31 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 30 Jul 2025 14:41:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoTD5Fgn7TD3l3rDxkwie0gHu1RuyzLk8AnSL2BudbtSG16GIHPzpqJU30P8ET/I1v77TEv8XqlqgW82SW9sxjADKZdLNH/tFMD2JKLGgpHCL/kuL55q4RuL0HMQ5T4nnflz9VTaAXGgQdQuPGFDx2PPqUw8aUvKLrBIFr4qIHw/yyNYZXV3+DFQoNWhRq+939dwoycXyrUMgGgzN7ijfFyiPPTYRI1TWDbPsGWCbkMymdvbOj8EKFZugtsSwiRhutAWLp1bh7hhBTmpayhcPBe9FndyzabTNiE3eW7hdGwyryZElDzyON+3YcPW3ggheHNiT6D5NpNRrO4xECE4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeZlubvbT6vqfNNIO2iGvXwEerQ3OpFT6wpN4eNxaXI=;
 b=JeruxMi2DevXvb76De8e4i10PKdHAI7VAcWlmh1z9HjEgu9hpHsBJmYBdThPiLPclKUwpDc8qWMMfEjjCqNU11vb2uv7T9ttRDZ8qS81VOj9nGLA99YiDXJdmlfaY2mDXAeUSpVsiycXiCDrAZko9sLU0SSJ5OHpFdEb3FPWsiCcQ8AudsvcP+dTZ0Ij24D2w2/TGvum1t8fxYYZnfrWA+gGBXKrftQQlk66lj5Q5yHaJkZtJG6DS2KaJO2dgL+qBZtxgf+ENlLczeTP4Jh+uwHrjdA5T4DAiSkfRbdeg3+MR4wnLhRECw7WcIOLVsizrG1femcqHaQ62MovCZJp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeZlubvbT6vqfNNIO2iGvXwEerQ3OpFT6wpN4eNxaXI=;
 b=gze8ELqIwoMTyAR22aRK9QqUXgbeT40ji60b2dBJxlgA6Fry7OxHpnN7hTwqnsr2biEBAUBnTW3DAp57Wvlw2nGos5QH/5PKHydFgJj6aNyWBbFjfffLNSvij6oOkHcCLGvK2osDKarIdK9qtsb2tsNemtx6jE+e+1orR9mDsXo=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by OSQPR03MB8698.apcprd03.prod.outlook.com (2603:1096:604:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 06:41:29 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 06:41:29 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "huobean@gmail.com" <huobean@gmail.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "beanhuo@micron.com" <beanhuo@micron.com>,
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
Thread-Index: AQHcABMQk8XyzRGGh0CZRYgd32oCALRIMgCAgAD6fYCAAB32gIAA71oA
Date: Wed, 30 Jul 2025 06:41:28 +0000
Message-ID: <b005d94288a4c4d29a9361b043354bbc8d85e0e8.camel@mediatek.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
	 <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
	 <1b418968-2a53-443e-8766-9d280447bb2d@quicinc.com>
	 <0fd86741-f72e-4a52-9d2c-2388c4a26115@acm.org>
In-Reply-To: <0fd86741-f72e-4a52-9d2c-2388c4a26115@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|OSQPR03MB8698:EE_
x-ms-office365-filtering-correlation-id: 2fcd330a-14af-4dba-c0c6-08ddcf341d1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?YXkvTDZCNmNtd2xrblF3Q0NUSkdwMStBeE81VlFIWi9LRFFaZkc5TE5GRTVy?=
 =?utf-8?B?aG9LVE11eFIzZElHNWFOdUxYbWhVd3pmQWFDd2UxMDVSb01JTmIrTEttZ2Zk?=
 =?utf-8?B?bWEzSnB6WWQyREl1S052VUtoSFVGbUNTelYwdlBnZWJLME5zOUxWTUVtNVpz?=
 =?utf-8?B?T0dwM25ySUR6Unp3ditIaVIveVV3aWRzQ0R1bDgwWGplN2Zmd3ZzKytBSXRO?=
 =?utf-8?B?SS9uUWtOVEY3UFFnR0FPenlNWDViZDZ3QzY0eDZYbWNhY3FGMEJpaWVyZjls?=
 =?utf-8?B?cTV1cVQ3a3Q0blB2L2IxTTlHdlZ4UGdFME9MVmtaaFE3VGoxMTAyeXYyd3Vo?=
 =?utf-8?B?Wi9nOXJ2WGRJb0RKWGtYeVh3R3AvbkNHbEkyOVNLeUZYeFNmem9FNXlyNklz?=
 =?utf-8?B?Z084d0dLcUZ1anJiT1JXM0FsT3BMTXkyeTcvOW02Q2hPcHBMb20rZ0w2QUVw?=
 =?utf-8?B?WEtEZVlDQzMvRVFzSGRuVk9JRk9jc1hWaGZKZUxRV1hKSmxRRjVQL3FuRzVp?=
 =?utf-8?B?NUFHR01ZYUZkWmUyYjZ1S0F5enVRbGgzQnpWSzNZOUtqZnY3bllDckNud0l0?=
 =?utf-8?B?UmVWelJCVkUyZUFzMVVldWMrbVhsVzVmdjlXdDFOdFlXY0tVTHJRYVpSN2Jn?=
 =?utf-8?B?QVVzaXRzYi9mejRQd0ZWYzVOMllBVGx5clhjWW12NEtpWGRhMXUwdWMzV0VP?=
 =?utf-8?B?UkMyTm9Md1dHWDM4emRBNEt3SGgzV2NZeVdZdWNKZEF4bmsrNDhFMi9DM1JJ?=
 =?utf-8?B?OUF1b2dqcmxPSGx5bTl0cStNWlpQbFlyRi9vUUJoNVNFN3U2OUhvSy9WRGVO?=
 =?utf-8?B?NGQrOWgzOW9peGhYd1liSSt3aUgwekYrMXkycEpvVWE1Z0ZlWk9GdjN0dFpr?=
 =?utf-8?B?b2FkMWNtcVREREI5V3FoamY3ZnR6YStxcXRNc0FsdjBPdmVBdHhnOE1Ob1ZD?=
 =?utf-8?B?L2tlYmpuSGVOZWc2RThxTlluZFVDbjNSQ0JERFRGRnVIdW9tcjJoM1FPK2F3?=
 =?utf-8?B?WVI0ejJmdU9vdjZVUVJtNUNHME92T05YREJqenQ0VnJDRXNiNHVhRGxWVHNP?=
 =?utf-8?B?RVpBa2VlZTcxd0lkeEpBbG5sS0RFYUNTNlkyQy9qUXNPN3NMY0hlRUlZOXJz?=
 =?utf-8?B?OUFFQzk5K3JvWUpFVUludmc5ZHVhUXVtaWErcytkakdyMmRjZld3MHc3OVRm?=
 =?utf-8?B?M1A4aTQ4dE1RSHBVZGZROVVGSklYa3hNeDRQVmlQSzExR0pxOFg0YjBFa0k5?=
 =?utf-8?B?WVR1RldUb0xIbWUvUmxkZkh3U0l6Q1NFNTJpckRvanZSREJ5QkpxOHBUa2hs?=
 =?utf-8?B?VWlHRGM0dzFCOTVFSStIUHNOVWRsdTlXLzdoZHFPUXVsZ3JGRjU3TDJwdk9R?=
 =?utf-8?B?UlhpVHBJMVlYd296QkhsdVd3MlN2ZmJNeXRVTEZZNitwbjM5SEZFTGlKQUtO?=
 =?utf-8?B?WXJEa0w5czFTejFLRXhoczNBTTZMNldYS1lXdjZWYWtCSmNOaFNWVGR2YWFt?=
 =?utf-8?B?cTh0RzdpTWY0bDFmdElCa3dRNU5IRklHdlUvTmhHbTNqMWV6UnpxM2JPc1Ny?=
 =?utf-8?B?MDZERm1mL1NsdHNDT0lRQ2RBYWl3aldTZEVjUmg2ZG1iczM4YUFnSU53cnNE?=
 =?utf-8?B?WE9ycjZpSGdrT3JLMHh3RXQwbkxnR1RQOVhnQ3hsQU54bmVVa1lZOHA5RFFZ?=
 =?utf-8?B?eGFZZVcwY0pEemJNWE9LVWtwWDN4UU83WURIbWM1Y2lWSG5raUZsWFlMdFpO?=
 =?utf-8?B?Mm8rUlluV0k0Zzdjb3RaaHZiYnhWeDJncmpvZXgvSk1BdktBZzNycTFFQ1Iv?=
 =?utf-8?B?cGlJR3ByVHV2anVrVkRObmhINWthMTF1K3pmeE1XQmFSZDdZeTdWanBTUW5r?=
 =?utf-8?B?aExoS0lyMWdRSzJaMzRvN0VhRWtIMTZvbkl1eXZHbzFHV04vVTV2Mk1VenI3?=
 =?utf-8?B?R2VCR1Y3NVBwaVhtQVJ3OXQva1M2eGNMNlNZMlF6TUcxWVN0RFRjcXZyL0w0?=
 =?utf-8?Q?FESRKcAMR0UU77eZMVLYGYHeteUPcA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGEwZExDQStSanBhQmtwaTBsc1ZCdVMxZUEzNHlkS2oxL2dUa01QOW9saXdF?=
 =?utf-8?B?Um9CRVVLZVI4cldJL3RieUNqL1BzZC8vOEdLMDZYNmxLdzg1a0hzcDViV28z?=
 =?utf-8?B?SkpTNDcrUzlTeFBpQlJocHlkaTMyeUhuTGRyQW1qN3VTSkNKYnoxcUtwV1BM?=
 =?utf-8?B?cEh5TWxEY3E1STlNN3RCdFV2MWhTSHcvK0F6WjB3bkk5cmQxTWR0UUMrTkdl?=
 =?utf-8?B?R042ZmI2TUNnYWlkWHRKV1JNb2V3dFBqaGxFYURicUtucnVBcVcyNG9jdjl1?=
 =?utf-8?B?S0dpUWtDdzdSQnNkSVEyblM2R0drS2JGNURwbElON1ZZeHhSL3hlb1NaN0lS?=
 =?utf-8?B?WEE1eDZSOTZGck9yaEJGMlNUUnZOa09lakRGZFRVVkxCVXpFNkk3MmgrVzda?=
 =?utf-8?B?TlNrQmU5eXhiaGNDSmxFU25nRk5PTjBYdmlxZ1hLb25QcmY1b2JFTEtycFRq?=
 =?utf-8?B?SnFpL0dnMGQ0YlNPdllJWkt6cHJwTC8wbDkyS2VuY2JTaEJHZVpZSEUyZzdU?=
 =?utf-8?B?bU1JSUNzb21pcnZKR3VCaVQyaDJxQkVFWDcrWHVjNk94KzlHRmhTSWtrbkJQ?=
 =?utf-8?B?Q3FPSzA1K0xwVlVqWUIyVFQzV1lhUStMMVJWSWNlWXdab3ZHY0VPdm1xbThM?=
 =?utf-8?B?VWxlWERGTzN4djFnamtUeUxobjhZQWxMbWV6TXlNS1dDQUxtNVRiUUtPUHRX?=
 =?utf-8?B?RlVkcmxNZVdEUG5hcENhVFprbEFLd1p1UjBjbWJyc0t6eHhXSW5IUFIzdFBh?=
 =?utf-8?B?MkhYeXdvRDFKK2hVOWpHZnhKTXUvMzNuOGowL3BWbW1MNWFaa0pUaTdVWXpP?=
 =?utf-8?B?bXlpbTlGUEl4THo0UEwvcGtXU0xkakhoNmZXc1hucGNQVVRQVzlVQ1RpYmRY?=
 =?utf-8?B?eWZDQ2F2SUxlZTNtSFhWMkVoeFA0VUZlQTNYY0RKOWtnOGVHek54dWMySmh6?=
 =?utf-8?B?OEJSS3V1b2pCVlQ0Vzc4WlMzSHhlUjE3cGFDT1l6ZDlheEhVVEdueEY2U0s5?=
 =?utf-8?B?ZSszM2l1bGtjNnJEaS9LV1VJTkI5ek5qTVRTQmZPcWNFVHpMVytSeVJyOE5J?=
 =?utf-8?B?ZWUza05qWGVCeG1FZ3BGMUNLSXlJZGd2Nkh3amNBZHdzTDM5OGd5akd2Z1BV?=
 =?utf-8?B?eGZLMVFUMDAyK2FmdmM3N0RRMURHbGVFWTlHOFpoWXhNRTNPd213SWo3Qkht?=
 =?utf-8?B?M0RJRUVodUVidStQUWMxckF1ZmsxMmVYcnBvYjk4WllpRnVUYWFURDhrNlZz?=
 =?utf-8?B?NEZOUG1aQUlsdGg3OWdmbDlmSEZoWGhyUklORGxWUG50ZGpVQjBLVEFpL0FT?=
 =?utf-8?B?dDZjbVRBMXBGUFJNRzE2UlRLSVdHOG9nK3VaSmU4c0VQaDExTXR6aVlsWEJw?=
 =?utf-8?B?MDRHOHVEVGJNeHpCT0M4d0NrdVh4U1ptbFdzVWFvL0hrYVhYQUNhVG5OUVk2?=
 =?utf-8?B?OFlMUVhic01qMzBUSHdjVTVZbHJSQ1dVTWxZVlBBT1I5QWxvOUNZN2NZOUI4?=
 =?utf-8?B?L1hEc0dEU0Q3OXoxWFhWbG43V09FN25aSXRaYVFKdm1iN0JsSFpqb2crOWRp?=
 =?utf-8?B?dkhwb2JYU3orSXo4Q3B3VHA4aWVtZWhVWi9DVlpZQ0NzYWxqeUVHQWZlcjla?=
 =?utf-8?B?N2QxN1EyVnRjSVNma05pVW8xZWJ2V3g1VHg2dXdRcE9nT2RRNEpMaDJ4MUkz?=
 =?utf-8?B?Y1VpT1piOUR4U3lic3Q1dnE2NkpMY0dWQzBaZXV0VzBlYnE4eUNXZjJiU2ZU?=
 =?utf-8?B?b3RLcjk5RnQzZkx5SjUvVHA0Z09aMDNycDJXZGJwZWQ0RW5uL2NGOUxKa3ln?=
 =?utf-8?B?OFlOTXNvWllPU0IwaExNRGJwV0xVT0F3bFMyeUJMS2dvMDVQd0UrcHJqMDJ6?=
 =?utf-8?B?Zm8vUmhxVk45QUtmbDJ5MFJWQVVjSlFzV1hvMmRvR2V6T0daM0JVOXNWdlFn?=
 =?utf-8?B?amZiWWhVYkQwR0Z3R3IrNXQ0ZkZMVWRRcjZiMDVTRmFDaGxYRi9wMzFoeTNx?=
 =?utf-8?B?eEdEMnh1ZjkrSXZjNUNIbS8wU3g0R3dSeXVMcTAxZVBDenZzNWF6TjkrM3BH?=
 =?utf-8?B?bnBsSDV2UVBxbFdleUdyS3N5MXlYTmhxek84WHNDbkMvVnRNY256cmt0RGNU?=
 =?utf-8?B?UEZTY0hTME1ZZGFiU21hRzRIR0wwQ25tVElVZkhwYmNHbnVvTzNqbWl1TXhD?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA5894D9672972458FA49CA15EBE75C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd330a-14af-4dba-c0c6-08ddcf341d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 06:41:29.0064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F136Ws+EmfFBWlCWDRFgTK2AJxzvZh+8/avNuv4byVVHiJCpTic6+tPH5ezPj21NKXtqLJ4ag6Ac5CV8Z1hBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8698

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDA5OjI0IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDcvMjkvMjUgNzozNyBBTSwgTml0aW4gUmF3YXQgd3Jv
dGU6DQo+ID4gSSByZXZpZXdlZCB5b3VyIHBhdGNoIGFuZCB0ZXN0IGl0IGxvY2FsbHnigJRpdCBy
ZXNvbHZlcyB0aGUgaXNzdWUuDQo+IA0KPiBUaGFua3MhDQo+IA0KPiA+IFRoZSBwYXRjaCBsb29r
cyBnb29kLiBTaW5jZSB0aGlzIHBhdGggaGFuZGxlcyBvbmx5IFVJQywgVE0sIGFuZA0KPiA+IGVy
cm9yDQo+ID4gY29uZGl0aW9ucyB3aXRoIG5vIElPIGZvciBNQ1EsIHdlIHN0aWxsIGNoZWNrIGZv
ciBvdXRzdGFuZGluZ19yZXFzDQo+ID4gYW5kDQo+ID4gVVRQX1RSQU5TRkVSX1JFUV9DT01QTCBm
b3IgdGhlIGVycm9yIGNhc2Ugd2l0aGluDQo+ID4gdWZzaGNkX3RocmVhZGVkX2ludHIgaW4NCj4g
PiB0aGUgcGF0Y2guIEluIG15IG9waW5pb24sIHdlIGNhbiBza2lwIHRoZXNlIGFkZGl0aW9uYWwg
Y2hlY2tzLg0KPiANCj4gV2UgY2FuIG9ubHkgc2tpcCB0aGUgb3V0c3RhbmRpbmdfcmVxcyBjaGVj
ayBpZiBNQ1EgaXMgZW5hYmxlZC4gQW5kcsOpDQo+IERyYXN6aWsgaXMgd29ya2luZyBvbiBhIHBh
dGNoIHRoYXQgd2lsbCBjYXVzZSB1ZnNoY2RfaW50cigpIHRvIGJlDQo+IGNhbGxlZA0KPiBhZ2Fp
biBmb3IgbGVnYWN5IG1vZGUgc28gSSBwcmVmZXIgdG8ga2VlcCB0aGUgb3V0c3RhbmRpbmdfcmVx
cyBjaGVjay4NCj4gDQo+IEJhcnQuDQoNCkhpIEJhcnQsDQoNClRoZSB0aHJlYWRlZCBJU1Igd2Fz
IHNlcGFyYXRlZCBvdXQgc3BlY2lmaWNhbGx5IHRvIGFkZHJlc3MNCnRoZSBpc3N1ZXMgb2YgdGhl
IHRyYWRpdGlvbmFsIElTUiwgYmVjYXVzZSBhIHRyYWRpdGlvbmFsIElTUg0KbXVzdCBiZSB2ZXJ5
IGZhc3QgYW5kIHNob3J0LCBhcyBpdCBibG9ja3Mgb3RoZXIgaW50ZXJydXB0cy4NCkJ1dCB5b3Vy
IHBhdGNoIGxldHRpbmcgdGhlIHRyYWRpdGlvbmFsIElTUiBjYWxsIHRoZSB0aHJlYWRlZA0KSVNS
LCBkb2VzbuKAmXQgdGhpcyBicmluZyBiYWNrIHRoZSBwcm9ibGVtIHdoZXJlIHRoZSB0aHJlYWRl
ZA0KSVNSIG1pZ2h0IGJsb2NrIG90aGVyIGludGVycnVwdHM/DQoNClNvLCBJIHByZWZlciB0aGlz
IHBhdGNoIGNsZWFyIHRoZSBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyDQooSVMpIGRpcmVjdGx5
Lg0KDQpUaGFua3MuDQpQZXRlcg0K

