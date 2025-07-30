Return-Path: <linux-arm-msm+bounces-67151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07EB160CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71ABC7A9F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEE02980A5;
	Wed, 30 Jul 2025 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bOlv7CWZ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SFk7Tgai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253102957BA;
	Wed, 30 Jul 2025 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880136; cv=fail; b=t5aZG72f3QOue9BMGlsbzzgzwbl7hVnLyFN2xa02DJc6brGg6G8OIoAZyUs9fHwW71cik2GM2YqjPu3NRL/scj6sKZ3LjM0sYkX2qEAqtRWo3NR1rQV664B6z51xFXkfH5xKhpoG8wK2cPJ517rigAlNj2cHeV7hc/vFmx1e6kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880136; c=relaxed/simple;
	bh=9b+tCC2L4k4e5+zKO+5+vy5GGY3Nk6hQltyC7b+GTO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hAuh6auoW2QLI1VCDyFQZZL1dIsd3gPfzwHgQfYR2Zdhy+oV4Di/hF8BTu2yxRL+9ZahCZJ0ekgq8afOElFCPkcIcn9XSvIPUe18fHo142OJ/MCnAVgPkGt9n01VwVR0a0SYn0KcjLOBliS8B0H2tivjAgGA8nw8WpiKqQmhC7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bOlv7CWZ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SFk7Tgai; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7203e5246d4411f08871991801538c65-20250730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9b+tCC2L4k4e5+zKO+5+vy5GGY3Nk6hQltyC7b+GTO8=;
	b=bOlv7CWZ94Hwq40Ur58f1IBtmn3WyKzgPAUMNsnmqXQUIWsLCekRzSzmauXHWt2xvlkg6p68vU3+XMmHABU1a48fggI+aqfZXeFIofXSSOwTw021iGUtVLzQ38T1lxEl2rGuxBZHwcat6rGbbsHThHsB6k4ol0pDyIx6OPTBl5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:53966a20-bc76-4560-81b3-d478e3a5c045,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:703e550f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7203e5246d4411f08871991801538c65-20250730
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881162435; Wed, 30 Jul 2025 20:55:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 30 Jul 2025 20:55:16 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 30 Jul 2025 20:55:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0UQutaxjb2WHCt4+b01EJNQQZwh1S4SzzHS7+00/txSVGIoqY6D41+PIUgT+hEtbSFf4tz+3wCvjrSzIHQu2ICK6p6HUENDSXcSHUXJl+qncNMDTMTiMtv5+Jdh+MuwFkdCj/jFY8143gSI69U4YjWDXyN3oRzBrasiiwbKV/0y+vR5PsfBMa2pDhzEkJJqfWmsGYNrgxgLSbBGVZuQsya83GQ7QbY51bETmfMSy2q1+aDIsrPiFn2hz9SLVfVamYfAKz0Pf7UqQbn8SGoNmDZ3e85sikYwR7x2aYG0kx4gBCtpC0yRmWPTV2WJTA30XKxQHafVAAzIjHnBOHt4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b+tCC2L4k4e5+zKO+5+vy5GGY3Nk6hQltyC7b+GTO8=;
 b=nVL6lpAXmVeqWh55XTeR0wfIiEbrw2i0/iD09u2v1JlNvgFcYfj2SoC4xP8VBVYYovWGvfHQUODmVjBwkBHIuEQpR6jF33C4g6E31N03NyDRx5KsaNVgxeJfUOP+Pcz5JuJMiENyWngQCH4L5o6LEzFCgtduxEMKlghrRL04BVO0RumLh1VX3II06QQ9aBEWrixSIxLtZaS1HxuIiMAKTf+dBM1aNjOUL5WzkX7afuElxRomwe0oG8glqDTTQIKZ6G1DF28lcraCfcgsQIFzhcCKR7AEQyX4H5JX3WZP65hLUGJeRugv4H2hUS4Katc7QEOibBAye7czfPnvoawfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b+tCC2L4k4e5+zKO+5+vy5GGY3Nk6hQltyC7b+GTO8=;
 b=SFk7Tgai6gX2EprWMJJpGnxag7K371Clj3buAUXVtPkoi7NJGeoxHYQIGgtK/dwIHw5Tl3NxsemiZEd6CenIzQaQ0S0VUtmRbLBxPnZV1vmvPddpG9HoSfPwIS65xbsRn2fddSznORFJRn44OHI8oL4w3rcsNUtWQ7ZMiB06Kh0=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by PS1PPF323E082FD.apcprd03.prod.outlook.com (2603:1096:308::2d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 12:55:13 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 12:55:12 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
	"junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>
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
Thread-Index: AQHbyvF2qqEtS3Zve0iY94J/r6+jLbRC8tIAgABfYwCABCtIgIABVyGAgAI33YA=
Date: Wed, 30 Jul 2025 12:55:12 +0000
Message-ID: <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
	 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
	 <1989e794-6539-4875-9e87-518da0715083@acm.org>
	 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
	 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
In-Reply-To: <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|PS1PPF323E082FD:EE_
x-ms-office365-filtering-correlation-id: 2fe7845e-7143-45c8-0baf-08ddcf6852a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VzNpNXhBcjV4ZzI5YTN6MHZWbGxCVm1jazFRMXJsMXN0elRxR3lpWklac2Z0?=
 =?utf-8?B?YURyM0hCRVJyS1owSWF1MFJsT1BmaVFNelZSL3h6Nk1RemRNR1dNRlYvRWZk?=
 =?utf-8?B?TEhMWEZxRXNYNVlSOW8rNkQ3QzJoM0E2KzdpK3ZnM0FySmNxaTdhRVJTUU5C?=
 =?utf-8?B?T1h1eWo3R0hUb2xvQk04U2R5SGVQcWlEaTB1UCtlNG9KYnE2RlFTTGlrYk1O?=
 =?utf-8?B?QUNsS01iekg0Mmk4VjRjN3M1YXFHazhUUDZCRURIRWNBT09VQlVKWlZUTS81?=
 =?utf-8?B?Zm50eVYyU1d3d0NFWGx5dGJPMEhqcGtUbHRPQ0xkVXFJYkFsUVQ3L0FPVHRR?=
 =?utf-8?B?T1hrVE5FaWtmK0plZCs1Mis3TzFsWFJ2dDJnUkZRUkxsdDZkdWZnV2ZtaytF?=
 =?utf-8?B?WWpRZnczK0xyRU9aYXlqa09XR3QwQWx3QXBsUzZuMTBpTE9tdUJwOHpWekNq?=
 =?utf-8?B?WmhOSVloWmRWcHhtYXpJY0ZlbGdReGhoRHlIelQrVnd0YncvU0NlZTNiY09o?=
 =?utf-8?B?V01IQUEzUHFvb2hidFFXQXFhQXkvZ1VwRksrSzZveTBpcWhoNmd6c1orMFBq?=
 =?utf-8?B?VGpJekp0T3BoWnNWbHJhM3lYZ3g2QjN5N3hTTnhBVm1KTlAxUU5ERVJQdXRi?=
 =?utf-8?B?TGFqeFF2Zm4zelNrWU1DVnlkWXp5VmQ0bE9aZEdnUExsWVV1NUozYktFbU04?=
 =?utf-8?B?RGF0QXoySUR5TUh0UnA2NWNUREJ1WU5MMzc4Tk9lY3R4Z0YxTm1GVVV5K2tu?=
 =?utf-8?B?dExrN3F0Qy9RS1ZwOVVzb0VkUU80aitrQVZ3V2lKV1cwWjJKTHBsSjQ1dlRS?=
 =?utf-8?B?L2U3SzlyL0hUeUp3M0FuaVlNVWdEaHVhZ0xzVCt6cmNYdXU1Y3owdWh5SGF1?=
 =?utf-8?B?MFJJRkpuOUhxNkZiUUlTdGkvOW9ZOEdJblp4YjdjUEg0djRRNFNDSTBvOWRR?=
 =?utf-8?B?V285TEtvUnhJdnllTFc2c3VGeVhhWEtWSkF0bjZHbm0reEVBZnZqaEVMWHdJ?=
 =?utf-8?B?TVZvYnpDRFVYaWZzeElMY1p3SjhlWFR0VnNXMmlBeTYvQTBTSW9KS00rVlJo?=
 =?utf-8?B?dm1pcWxkYXY1YmJ1dGYwdGEyYlV4bjJPek5MSlQ3akxhL2V0ZUFERVgrdjkv?=
 =?utf-8?B?NG5hdWFWQ2l2N1I4NjhCRWhtdWhsTzMrL20way9FK3FvdmUrcld6YXNEUUJq?=
 =?utf-8?B?SUVjdmdRbU9VNWhTbEgxTHhJbUNjTnNqMGVUNlZCN3pkTTZmQkdRZ3dFMUVG?=
 =?utf-8?B?QlhNOVhYYlhhb1JNejZSS0FwZDFwM2JVR3RyMVdIdmpUVm11QzBVWk5DSEJM?=
 =?utf-8?B?d2ZjQ1QwMFFnbm42ZHlDeUlPeGZHaHJseDhYTnhpdUw4K25iWXY0cnBWbkJW?=
 =?utf-8?B?eDduK1R5bW16NjlEaXhNUXFzM1N2a3NSc0EycHVjU3diZXYyU2Q3YlJyWFJW?=
 =?utf-8?B?NkkzbG1DdUg5WmUraDZKdURESGszRUxucCszL3l1UEp4YW91ZzEvVTRqM0wx?=
 =?utf-8?B?VWRQMllHTjk2WXlqYm9PYzVNRmhZZS8wa3pvVjNQeXMraU9DUnJSeXBMUDU3?=
 =?utf-8?B?aGtXRjllMm5FZzdkQ0UybEV0N1dxbWpXakhXa1pyRjBJU3VKSjRDdWNDcncy?=
 =?utf-8?B?SnRZcHhSeXpScUlncVQ5ZXFNclorNnpZTldKaHIxYjFTRldEQmwrMVV1V1ZP?=
 =?utf-8?B?OXBUY2ZlUkVWR016RTdnSHVWWGp6dWxKOUxwVkJxQnd6dWpXSmpjZTdmcFpx?=
 =?utf-8?B?NUhNVVdBSVZYdTRCbHQxcm1za3FSbXMzQThmNnFBOHJ6cDhHRitOMkJGLzZY?=
 =?utf-8?B?QXJEUnNmY2lzUHFIWXR5V0pqNmZCT09KbWpudW04eXJteEFZRWd6eWpTQ09z?=
 =?utf-8?B?NUhwTlFadEZYa3NKT3BDYXVVRFJPQ2MzcDhqQ0hTYXU4NG9FNFVrTVRwVCtG?=
 =?utf-8?B?MmlHNmpkOW9WZEg5SDhNbWVWTkFrWEw3WlNXOXVsa3c5R0J5UnpLU0tlVkVv?=
 =?utf-8?B?bEt3ZU9uRGJJQkFuaWFXM1RuQVhRVFF5bldkOUZIamZiR2ZSV3JFZW1mVU5V?=
 =?utf-8?Q?d13Zrm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUNKajRZeGtoYzRlcVd4OTRlNGxndzY5b0szYWNUOEJaYWk4RjRFKy8zdjFs?=
 =?utf-8?B?ODZRTGVjV3Q0d2ZlMHNiQUxGYmpRbW5RdFZERkRoTiswc1R3cHhaRjl2WGZ2?=
 =?utf-8?B?Q0oyZXdRdXV5WlFYWW83YTVqb0dFWmhmSGVqaW9qVlBwZFRQSHRTNENhSHZs?=
 =?utf-8?B?R0s2YXVycDNPRzk0TjVQUC9WUjY0T2lJZW5oZXBHOTMvUEExY0w4MEFQMkwz?=
 =?utf-8?B?S3hTaHZUNFVrNlNqT3J1Y1lYTXFlNGVQdUprTkJJa052N1dqTE41WWxaSkYw?=
 =?utf-8?B?VUUyUThzL3pOTDRwQ3Nhdi9sTy9NeUk5VUsrRnRCazh6Vm96VHpBdEI2am95?=
 =?utf-8?B?STlFaktWc09iWnBVbEd2TkNxU3BReVdpOHhLSjJLRkh2dS84Y0Y4NHo1VHBE?=
 =?utf-8?B?NWpIbVhXVGd4ZnJHTlM5aG1tWENxR3ZNUVBGeXllOE1SVDRIMSsycFdHTEJy?=
 =?utf-8?B?M2kwVmVaRVNoa29TTlo4MHdZMkV1dGNCOGd3WmFrc3RKZXJNaEhNQ0ZtalQ3?=
 =?utf-8?B?RmpNS1hXQ2xTbVZNQ3lZOWo5eDJTaGJoVkoycVJEZ1JhMTRaNmFTZnhoaWd6?=
 =?utf-8?B?cEJ3ZXF0YXV6Ny8zeWVzREhCby9RbUl2TTFFUWlyN3NNc0FlS21qM0tEN2V5?=
 =?utf-8?B?ZzQzYjFBaHdWWGpUc2ltVURpdXNFL1NLV0pkNWhxWG9qWDQ0eFkrTStGT01t?=
 =?utf-8?B?RVlJSjBVTGtWbDF1VllQTFQ0N3ZheGlLSTNzMTU0OWc2aVgwVDdQR3VVcXlq?=
 =?utf-8?B?Y0FqcVdNR09QUi9HRnYxcE01a3BqaW10ODA1UUlYU0JRYnNJQkdIVklQdkJN?=
 =?utf-8?B?aDhmN0dSOHFFZG4zYWMxSW8yLzNFYlg2Nk1RSmVZVk9qS2hJSVk3TkIwd1Ix?=
 =?utf-8?B?eHQ2UFc1d0hDRGdxbnpGaVpHRlI1bStwRTRCd3hPcXJSNVZlOWptc2pDRXpQ?=
 =?utf-8?B?Tmdyb3YrREFRWUd6cE1iMXBFYTRnbDIrSHRNelZUUSs4WkdPYzJXMDdYdURl?=
 =?utf-8?B?UFN6cllQK0ZVanhTTFYzUGRnbmZPTm1QdERwT0tNZThuZHl2TWpsc3NTVnE5?=
 =?utf-8?B?Z0p4empTZjBoNDMrSE5RSGprY2ZTdjhBVmNQNFBUSnlsUGlNVTRaQlNCUXh2?=
 =?utf-8?B?d3BBNUNaN1VVZ1JKNkRnYWNibmxGTG9oQUZZdGZhQi96ZzhXVis0ekdsN2E2?=
 =?utf-8?B?VWdzVHNEV08yek0wWFhXN1NSazRtdnVyRUc5OFo2VVFCTnBlYS9FNEpPNnYw?=
 =?utf-8?B?eGszSGlOU3hCTks3NFN2Wk13YSs2Q1g5RktoZUNOSDB3WFVId0cxbE9LNmg4?=
 =?utf-8?B?azNBYXFSUDZVUjFEbGE5Z3IvMlo2RHM0QjZSNVkwcWhNVUZqYUxmeTExQk52?=
 =?utf-8?B?YnlHVFB3Z01ZdUlFZ0t2VkF4SEtjSWJDYi8vYjBjR2JLcFVuMlNseHdyNVBt?=
 =?utf-8?B?YmIwMlFhOHg3K1NRZTN3VmxwdU14KzNnU1dVbHFhNXowNHlVWVIrYVpMempX?=
 =?utf-8?B?SW1URTBqaHFqY0dKUDBYYUpKYkNGWmtsdHF6YW04a1M2MmZ2RFpMSXdBTWNx?=
 =?utf-8?B?MDROY1ZMaGlheGRUbjQ2cEZwMUVJQ2gyK2ZUcjJSSFpBazl1VG9YWFZJYXhX?=
 =?utf-8?B?S3RmbTFNZGsvNEVpQ2NwbC9uR1RFVEZOK2VVNnZoUnN0RFYxTUg5VURtOU1x?=
 =?utf-8?B?L0dGSmM2VHJxTHpIMW55N3MzT2NKcjBZekQycGdWOU1rSjd2SnRFVXlwNU8v?=
 =?utf-8?B?OU9TK2JTVVNCcGcyTnJkL2JXYVV1Q1pLTVpZL0hVelo5QXlkMDhJWk1YY3NJ?=
 =?utf-8?B?TWZOUWQwNmxNWTVxUVBzazlhNSsrcytpZVJHUHZPMDFIQkxYMHJxK09ZWXcx?=
 =?utf-8?B?Q0NaYnlIblZneU8rNFVRZU9rQjZubUVxNjFLTjZZbEQ5QWQzUGRNSDRYZTYx?=
 =?utf-8?B?MkJ0N0pKL0wvMnBsaVpBM2V2emdXRXJrNlkwUkNqbHNsTjRONXplNWJ6Y0F4?=
 =?utf-8?B?ZTU1bEt1NGdZeDU0YW5SRTdsWkptTm1EVktPTU9oR0x3WFJrQ2haWm9IbDhD?=
 =?utf-8?B?QkV1UDJ4L1kzbUhjc08yenVqMWhrbXU3dG1QVTViVFZQRnI5WUNBaWxRWUht?=
 =?utf-8?B?YlRUOVpmNW40eDQ3WDZLNHdaSXdwbEZiWkhsbFNNTmljeUE3Q3hJaWk0R2hW?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9E5C852920422408C5399440E7D2076@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe7845e-7143-45c8-0baf-08ddcf6852a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 12:55:12.6401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FjLZ9qxHpqZdaYV2ZEFTG0O2pB6dKncMNKHC6W1ByW+VFkb8LQQ1Ag8EODt4jAMV4jcYz9gUwnJBxI3FxXrHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF323E082FD

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDExOjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiANCj4gDQo+IEhpIFBldGVyLA0KPiANCj4gSSBEb24ndCB0aGluayB0aGUgZGVwZW5kZW5jZSBi
ZXR3ZWVuIENQVTIgYW5kIENQVTMgd291bGQgaGFwcGVuLg0KPiANCj4gQ1BVMjoNCj4gX19tdXRl
eF9sb2NrX2NvbW1vbisweDFkYy8weDM3MWPCoCAtPiAoV2FpdGluZyAmcS0+c3lzZnNfbG9jaykN
Cj4gbXV0ZXhfbG9ja19uZXN0ZWQrMHgyYy8weDM4DQo+IGJsa19tcV9yZWFsbG9jX2h3X2N0eHMr
MHg5NC8weDljYw0KPiBibGtfbXFfaW5pdF9hbGxvY2F0ZWRfcXVldWUrMHgzMWMvMHgxMDIwDQo+
IGJsa19tcV9hbGxvY19xdWV1ZSsweDEzMC8weDIxNA0KPiBzY3NpX2FsbG9jX3NkZXYrMHg3MDgv
MHhhZDQNCj4gc2NzaV9wcm9iZV9hbmRfYWRkX2x1bisweDIwYy8weDI3YjQNCj4gDQo+IENQVTM6
DQo+IHB1c19yZWFkX2xvY2srMHg1NC8weDFlOCAtPiAoIFdhaXRpbmcgY3B1X2hvdHBsdWdfbG9j
aykNCj4gX19jcHVocF9zdGF0ZV9hZGRfaW5zdGFuY2UrMHgyNC8weDU0DQo+IGJsa19tcV9hbGxv
Y19hbmRfaW5pdF9oY3R4KzB4OTQwLzB4YmVjDQo+IGJsa19tcV9yZWFsbG9jX2h3X2N0eHMrMHgy
OTAvMHg5Y2PCoCAtPiAoaG9sZGluZyAmcS0+c3lzZnNfbG9jaykNCj4gYmxrX21xX2luaXRfYWxs
b2NhdGVkX3F1ZXVlKzB4MzFjLzB4MTAyMA0KPiBfX2Jsa19tcV9hbGxvY19kaXNrKzB4MTM4LzB4
MmIwDQo+IGxvb3BfYWRkKzB4MmFjLzB4ODQwDQo+IGxvb3BfaW5pdCsweGU4LzB4MTBjDQo+IA0K
DQpIaSBaaXFpLA0KDQpUaGlzIGlzIGEgd2FybmluZywgYW5kIGl0IG1heSBub3QgbmVjZXNzYXJp
bHkgb2NjdXIuDQpIb3dldmVyLCBvbmNlIHRoaXMgd2FybmluZyBpcyBkZXRlY3RlZCwgbG9ja2Rl
cCB3aWxsIHN0b3AsDQp3aGljaCBtYWtlcyBzdWJzZXF1ZW50IGRlYnVnZ2luZyBtb3JlIGRpZmZp
Y3VsdC4NCg0KDQo+IEFzIG15IHVuZGVyc3RhbmRpbmcsIG9uIHNpbmdsZSBzZGV2ICwgYWxsb2Nf
ZGlzaygpIGFuZCBhbGxvY19xdWV1ZSgpDQo+IGlzIHN5bmNocm9ub3VzLiBPbiBtdWx0aSBzZGV2
ICwgdGhleSBob2xkIGRpZmZlcmVudCAmcS0+c3lzZnNfbG9jaw0KPiBhcyB0aGV5IHdvdWxkIGJl
IGFsbG9jYXRlZCBkaWZmZXJlbnQgcmVxdWVzdF9xdWV1ZS4NCj4gDQo+IEluIGFkZGl0aW9uIHRv
IGFib3ZlICwgaWYgeW91IGNoZWNrIHRoZSBsYXRlc3QgdmVyc2lvbiwgdGhlIGZ1bmN0aW9uDQo+
IGJsa19tcV9yZWFsbG9jX2h3X2N0eHMgaGFzIGJlZW4gY2hhbmdlZCBtYW55IHRpbWVzIHJlY2Vu
dGx5LiBJdA0KPiBkb2Vzbid0DQo+IGhvbGQgJnEtPnN5c2ZzX2xvY2sgYW55IGxvbmdlci4NCj4g
DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDMwNDEwMjU1MS4yNTMzNzY3LTUt
bmlsYXlAbGludXguaWJtLmNvbS8NCj4gDQo+IC0+IHVzZSAmcS0+ZWxldmF0b3JfbG9jayBpbnN0
ZWFkIG9mwqAgJnEtPnN5c2ZzX2xvY2suDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTA0MDMxMDU0MDIuMTMzNDIwNi0xLW1pbmcubGVpQHJlZGhhdC5jb20vDQo+IA0KPiAt
PiBEb24ndCB1c2UgJnEtPmVsZXZhdG9yX2xvY2sgaW4gYmxrX21xX2luaXRfYWxsb2NhdGVkX3F1
ZXVlDQo+IGNvbnRleHQuDQo+IA0KDQpXZSB3aWxsIGZ1cnRoZXIgY2hlY2sgdGhlc2UgdHdvIHBh
dGNoZXMgdG8gc2VlIGlmIHRoaXMgaXNzdWUNCmNhbiBiZSBhdm9pZGVkLiBIb3dldmVyLCBpbnRy
b2R1Y2luZyBuZXcgbG9ja3MgYW5kIGluY3JlYXNpbmcNCnN5c3RlbWljIGlzc3VlcyBpcyBzdGls
bCBzb21ldGhpbmcgd2Ugc2hvdWxkIHRyeSB0byBhdm9pZCBhcyANCm11Y2ggYXMgcG9zc2libGUu
DQoNCg0KPiANCj4gDQo+IEkgaGF2ZSBhbHNvIGNvbnNpZGVyZWQgdGhpcy4geW91IGNhbiBzZWUg
bXkgb2xkIHZlcnNpb24gb2YgdGhpcyBwYXRjaA0KPiAocGF0Y2ggVjIpLCBJIG1vdmVkIHVmc2hj
ZF9kZXZmcmVxX2luaXQoKSBvdXQgb2YgdWZzaGNkX2FkZF9sdXMoKS4NCj4gQnV0IGR1ZSB0byB1
ZnNoY2RfYWRkX2x1cygpIGlzIGFzeW5jLCBldmVuIHRocm91Z2ggbW92ZSBpdCBvdXQgLCB3ZQ0K
PiBzdGlsbCBjYW4gbm90IGVuc3VyZSBjbG9jayBzY2FsaW5nIGJlIHRyaWdnZXJlZCBhZnRlciBh
bGwgbFVzIHByb2JlZC4NCj4gDQo+IEJScw0KPiBaaXFpDQo+ID4gDQoNCkkgcmVtZW1iZXIgdGhh
dCBJIHN1Z2dlc3RlZCBpbiB2MyB0aGF0LCBhbHRob3VnaCBjaGVja2luZw0KaGJhLT5sdW5zX2F2
YWlsIGluIHVmc2hjZF9kZXZpY2VfY29uZmlndXJlIGlzIGEgYml0IHN0cmFuZ2UsDQppdCB3YXMg
YWxyZWFkeSBzdHJhbmdlIHRoYXQgdWZzaGNkX2FkZF9sdXMgd2FzIGNhbGxpbmcgDQp1ZnNoY2Rf
ZGV2ZnJlcV9pbml0IGluIHRoZSBmaXJzdCBwbGFjZS4NCkhvd2V2ZXIsIGluIHRoZW9yeSwgdGhp
cyBpc3N1ZSBzaG91bGQgc3RpbGwgYmUgc29sdmFibGUNCndpdGhvdXQgdXNpbmcgYSBsb2NrLg0K
QW5vdGhlciBpZGVhIGlzIHRvIG9ubHkgc3RhcnQgdWZzaGNkX2RldmZyZXFfaW5pdCANCndoZW4g
c2hvc3QtPmFzeW5jX3NjYW4gPSAwLg0KDQpUaGFua3MuDQpQZXRlcg0KDQoNCg==

