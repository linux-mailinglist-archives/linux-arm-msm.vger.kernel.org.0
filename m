Return-Path: <linux-arm-msm+bounces-57813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1FAB66F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C63841B658CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607DA224236;
	Wed, 14 May 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LZIWeiI5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="M0KMlVGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419D1F4198;
	Wed, 14 May 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213523; cv=fail; b=CqRVniUi9iOO0memZT+2imSPmqrivf9Ge5LKH25c6N83J0319zDUhXCLxrHLNbrPA6uS5aDCJkMUEA8gz0TbrHIJOjHeZ6rS46wAqWSq1gOWIS+vScWrHDwxVKDfa6CzxawMcD0yCQM5kc6VmC78H2+gy2BYFQusENQvTDPgYd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213523; c=relaxed/simple;
	bh=kEfbZeZ09riTUjxRhEZxpHQ0YhMYWb3vcqSfy68RZCI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kiae74xbZSNgHuNU2je4qR3Iq/RefGFCqZB0hXzAAz4CHlEhZJd245jGADDTBarUNhW8cp5KfdOanGPo9VXTBKJQM0X5v1jGv/+lVwTvVUVJCAGYVcXMlTArBoLgCuE2lHx8Sa1NzuOWTpJ0o5Go4Eh9mSef7wB+3BQgGreElJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LZIWeiI5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=M0KMlVGB; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8beba01430a211f0813e4fe1310efc19-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kEfbZeZ09riTUjxRhEZxpHQ0YhMYWb3vcqSfy68RZCI=;
	b=LZIWeiI58Ok/rPXITH8KXDgMGftnk5zTOO8xAkEJT5xjH3wIbgKJ1hw+PpXf+y81fXfrsOh+vGBxcskyH9O2jbWzcYQ48jyTiIx+I9sDcr6yTGdz31Kje/wyx+BxUVej4u9Um/3wrefCwj61MiKp6NlFO0VT9jP56gdGIoIOido=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8382f1a6-a1f1-4b29-9fab-583e1fb9911e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6910c073-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8beba01430a211f0813e4fe1310efc19-20250514
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1888969602; Wed, 14 May 2025 17:05:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 14 May 2025 17:05:11 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 14 May 2025 17:05:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlGGBQiC2v6+ddxY7XC7SEM694k422G6+xEunAktcK6EBzLlhekIvkoSROtv02dDEQ0eru2AGYzwpYecPl38d80XfFZELa1Xh919Dm0lmLuCLUH8HtCPyOtOiT83pjjT+B+sPqwMJaNfWSSHwifZYKN6d8zX8trgNnPnSYsD7L/zzb6MEjRXkXQN+mBaXe7XbQV6waoUj6loBd4qXNir++9ApYriA8pD/JEed1itdpbJ3JXtJIKzd6hmRjonKNp9sbp3nTkBJkBDg7d6f4giA/LZCrAPKoohj0qbV2xIPCD4VP0qJcSKEiB/HbnZQ2b7IlNiTO/092lcmWxKLoWwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEfbZeZ09riTUjxRhEZxpHQ0YhMYWb3vcqSfy68RZCI=;
 b=ya804Aq07W+loCSXLVNjZ8y3W10IBgP3juGzn5kbNCm74Vu0wAfJaqAShrGY0nBBgjh7L57vQNfQh2sBtexkLuRjOYgGTIofy02Df7Cb3fY9iyU2mtgzwDtwIA2uDtJVDjN4HNc7a1w79F4NGPyXXq7mYOqf7578XdE4G2xRH/6Bw5VqCtGofje/Npc7918RE8BRwyJMvj1CY57BTgRRznkQwpUN+nrZN8IMRb+r8yizWPM9xABvyZytj0mUneNUI1mfoNdHyp3C/AlX5n35cglAqmGJir+/0/qrFZOS2z3T2mtm+cNQuVbzTO7+N2ZyMM03rGBD9aZVGC1Ahtgt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEfbZeZ09riTUjxRhEZxpHQ0YhMYWb3vcqSfy68RZCI=;
 b=M0KMlVGBfVosSGzP9E34YzVJR+SDgBgYOwWMLL6yxz/7JB18vqdQJxpdz6jde76JLXSvRggaI27A4UYnCXZ6F4HgLTTzPT+/4B6oJarJDqMuT8DVnzkKSsXBuptsELtlH/1ZRUDFI+8cQCqJXM4CCnBOuxbbdXhs3S2ltxGlxhc=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEZPR03MB7265.apcprd03.prod.outlook.com (2603:1096:101:70::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 09:05:09 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:05:09 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
Thread-Topic: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
Thread-Index: AQHbv/0jGTTwKLhaa0aZTpfOPNYF/LPI5lOAgADY5wCABdwJAIACJ5oAgAAbvQA=
Date: Wed, 14 May 2025 09:05:09 +0000
Message-ID: <f092c7a563f2f2b70ccb43340b95819adacb2ad6.camel@mediatek.com>
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
	 <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
	 <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
	 <c428f074-c010-4225-960e-56aa65a799d8@acm.org>
	 <486616b7-9400-4288-b4b4-c56ec628b0f3@quicinc.com>
In-Reply-To: <486616b7-9400-4288-b4b4-c56ec628b0f3@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEZPR03MB7265:EE_
x-ms-office365-filtering-correlation-id: 9c897be3-51f2-4ddc-354c-08dd92c66d3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a01wZldlYW9DU1UwZ1QrZU82Tk95YVBrMWtRT3RxbXN3M1lRWmM4QkNPTWlw?=
 =?utf-8?B?eFgvU3ViUEY1b1p6MTFBWUczcTRqZkxQUlpmMEt4ZDJNd2ZtZDdTejF6Y0tQ?=
 =?utf-8?B?ck1GbGlReG91RjdlbzBacHpHNkVTUjhEWkZ3dXFhdm5zdUh0OGNkdlp2b2Zv?=
 =?utf-8?B?Y3ZMZnNCN05uRUx5VnRKd3c4MU05cEduemRrVUxQdVpoV2lNUmpudVBHWExD?=
 =?utf-8?B?S3VyWVFuK0xEWCt6RGhYcVNMNUdjMVdQZHR4ejJDZmFoMnRuZEUyZHVINy9P?=
 =?utf-8?B?V2JibkZ2OVFCNGE1Q3RtUmdpaFNhRGt0Mm1zcXRWZ3FNZ2dubXRNRjE1Y2tn?=
 =?utf-8?B?bzRYK0RhWWJpME1tOTdha0doMW5pRFhTbGZ5SDljQ2U1aEFPakxOMVZ2MU1B?=
 =?utf-8?B?cEFVbDQ2dE1nNlBvOGY0Z005Q05keE1HNS9RamEyY0g3dHNyT0pJcEV3d2Fp?=
 =?utf-8?B?SDljd2NtcytURGo1MytVTDNnZzNlTlB3Yys1OGF1cHBPMUIrblBQNVZ6NmJn?=
 =?utf-8?B?bWljT1ZxWVVHUzlpK2o0TWsyQTF0Y3RJSTdGbGZpSU5SRWN3azhnbmNjSHlB?=
 =?utf-8?B?YWQweXhQaGFnT05idVorUzhQdmxpODFBeVJUaEc3OExPL1I2Vml1UUxPQ1Y1?=
 =?utf-8?B?RUZocVFORGxjaDQ5TDVQaXRYN3dXcHE3MTk2OFFkY2dJbXFpSFI2NVg2bEx5?=
 =?utf-8?B?R3orQXVqbmh2VlpMMXlBRStLbExGMmpma3B6WURad083QkliNm1DaTYyaU1l?=
 =?utf-8?B?WXdZZXY4cE1qM0J2dXArenVNZGNhYjZCS2dmb09xOTN2RVhPWm1WdkhFN29x?=
 =?utf-8?B?amFhMWNWSHBFZmJCQ3dad1RKMDh4aHBGWnhGYVJ1RGsrTTZjbFhYZkZXNnE1?=
 =?utf-8?B?Qm5ncmpKdnBFcjBBU0dGRzdoWGlFSE1QdmJnZlJ3dXdPSmhWdFlwY1BPUU9Z?=
 =?utf-8?B?ZWZubDRGWTdSdEtQNFFGdFdjQnk5YTZKL1Q1VmtOMGNJNDZVMlZ3U2FwL1pB?=
 =?utf-8?B?a1dsT0NhaG92VmoxREU5dkF0bHY5L00yY3hTSEY5YlpYa3o2N0hnL2dlYm1W?=
 =?utf-8?B?VlRtY09WdllsZzdwWURHYUplbFFwUGNzM2Z6aW43VGJ5NjVEMm5aNEZSMXN2?=
 =?utf-8?B?eVJOLzcvNCtLVDlWVnJ3WGNQYTdDYlU5M0lSZFBkc3pJYXdZL3Q0TGpSalh5?=
 =?utf-8?B?Sjd6QmdMeUZkZkhJUlRZRHVRL2ZvSjNpR1duVk02SE1mN1NKelBwcHBSc2ZQ?=
 =?utf-8?B?c0MvSEUwMmU2MzBWUTZVb2tJbUFrMU1ITzR2ZTZJSkdVSTZWUUlYM2FzMFVq?=
 =?utf-8?B?VWt5d0xBbDVvRFZQUGQxSjdJK2N2bkRjMEVnWTBCYXMzWjBVTWM0aFMvNjRR?=
 =?utf-8?B?RE0rSFV6OHdRTVZva0NjU2ozdDZ5alZidlNRUlRScVJJK1ZMMXVzNnp5SUlP?=
 =?utf-8?B?UktFOXN1VmN3MGxrck5JNEQ5Q2pGWG5iQjlDbldON2wzUXFMdEYrWWxEM2la?=
 =?utf-8?B?bFF0emM3c2FLVUhhU21veE9udkthblZkSXhjVUxlcUVURkxKMXRFMUE4cGFh?=
 =?utf-8?B?UFcyY09LR2xmZHBRNlkzL09uYUVScjc2eVNPSWthUE1MUDgvbkdxc21zYjNk?=
 =?utf-8?B?ZUtGUEplaCtFWHJiWkxhdjQyRnhPSWhzMVVVQnM0d0hreGhoNmNDMFJZWDZB?=
 =?utf-8?B?UG9Mc3JvelgxYTBoYVk4SitlZWpGVnZPbVQ4YVd5cHhaeW9KekpBTUxzTFZX?=
 =?utf-8?B?anhJMjhaWXpwSVRyanNjVDRKUTcxd2oxSEFLWGFBOTVsWjd1MHFiTnQ3amxJ?=
 =?utf-8?B?V05FaHhwK1RPVnFob1g3Z3pBZk9GdGlhMlEybjVYMFdxeXJLUTlGM0ZxK1Ny?=
 =?utf-8?B?OE12K09kWGRabEF5VmVoZWE4UkcrbmppUlpORzl5WWphNkRKekZHOFdrQU5V?=
 =?utf-8?B?Y3NPS3NYL2tZeWFObEFNMUsrZWJRM2lCM3pJTlo4akxvSGh0S09GUGIrYktn?=
 =?utf-8?Q?eIw/gEsDpWV7r6z5OLyfeu0aDyfTTE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Kzc5Nzlid3oyaVQxZ093S0ZDekdiK1VGb090dEgyd1hjV0VEWXRIaXo0c1M1?=
 =?utf-8?B?ZnBUUGU4WHhzWm5PN1ZaK0Q1MTlOOHBBOHBRVzZ4TWQxZjVHMEk3VnJoTHVC?=
 =?utf-8?B?SjlUaHB3c0Q5Sm5NVktRb0MyT3d6SkVjT2dQZHlSVXRYbkZGUW9HRVBUWndj?=
 =?utf-8?B?RUZCSm5QbjI0NEladmhXVVFqQ21pZXRVMmI0b0s0eHNHUXF4VkNDeXV4MEpp?=
 =?utf-8?B?Mks2WUhxQUo5OXZEQmlGZUlUMExJNC9lMlBXcEVGR21yREpxcU00L3ppdlNu?=
 =?utf-8?B?V2J1L2hPc1F4YysyVUE4S2VIUks4MCtLUE05MmtrSis4Qm9DRS9pZ0liL0lp?=
 =?utf-8?B?bmFCRmJQOWNWdkNJR1A5bGxSRmNRSkZJZTkwU2RIRmdqUGRLUWNmQnZiWnQz?=
 =?utf-8?B?SmZBbXJibEYzajNySC9jWGU0OWNOZjQwckdaZ1lhb2xLOUNLYTI3eWowWmZJ?=
 =?utf-8?B?eEFJbUYrN1R3WTVBZi8rWFZBdm1xczUwdFhMbmsrOGNYSmtvRTVOZE5DUUN3?=
 =?utf-8?B?c1JxYStGOVFhTWJSTjRVKzNqQXVITEwzdGszdkY1elZEUTlmU0JRcDlQcU5K?=
 =?utf-8?B?WmFaamQxcExEYXRCQnF5d2EvbWtsTDlVSmU3b0JKcFJHeTZyRVFrTE4xNGN0?=
 =?utf-8?B?a25BSnUzYUtYZnBBTEgrYzFmTzd0eU04VFVOdW5PdXZuRnl2Z0U0MnpDOHR0?=
 =?utf-8?B?SkZHV0pmbVppY3hXbFRQdy9saURhQktYVVIxblJnZ2RjVnhmM3V6NGlaYjFv?=
 =?utf-8?B?anNkdU1CcUZYSUdnZXlzV1hPWWpuRTlGZGVBeFNnN0MxYm5RZDRsU1NXR0RW?=
 =?utf-8?B?eDk4a2hpWlZIL3p1dWw5MTNuNHQzcmpxNDBrLzFPTDhhbFgvRTA3SDlPUVJP?=
 =?utf-8?B?RjFrNWxzNDFBeXNMOHUwaE9UZGFNbGRNR3Y0UEgwTWNoSXB5VFJqT1J6amdr?=
 =?utf-8?B?b0dBSkdUZ2xwNFZ0VnA3TGNZK05zQ0NCYzlFUERNMWwweTB5TUpUMHNxN1hO?=
 =?utf-8?B?ODY5d1Nxd1dyVS9odFRRZ2dGb3Z1dG1KZVNDaVdaa200R1ZBVUYzNWU5a2Z3?=
 =?utf-8?B?cXFTNlVsZDBkOHlEdkRrbmQ3R2xTbmRaTmwwU1pOL3JDNnc5Z0F3dSs5OU9o?=
 =?utf-8?B?VFF2T1lON1RxbElKVFM0QjRGQXFaZkkxeTczU3BneGdEUEJVejdVSnJMaTRX?=
 =?utf-8?B?dHN0M3g0SVIzck5QQ2hqNzRkWnlnWnhaWDk4QlJKSnBDK0tYQzJzUDJxS21y?=
 =?utf-8?B?aWJiYWxpanFObzhCNWV1eGIyQ01JZm1JWTc3c2ZUV3J6b2FsVEhuYjlpK3g3?=
 =?utf-8?B?ZzdSNUNjOUVuRmVrVDdITStqclZERGdlVUUyQUdLenZMK1hnNU5KZEo4ek96?=
 =?utf-8?B?RUJUbndqSy8yalFYR0hYNkV5dmZyMFJxSWJGSE9NS0lnRGt0Yi9OTXVrTjhS?=
 =?utf-8?B?UFVnNS9QZHdoOTRKalkwaTlPcnVMTUN2Ujl1MkNja0RvWjJBZjlHaVJ2RVp5?=
 =?utf-8?B?d2xqK1B6ZDBWNVJKemUwY2t2YkE1N21udTVrUFNWVWtuaGFFemNmN1FzVzRU?=
 =?utf-8?B?U04zbmpPRGlQME9jKzVJbFNaTzkxaE8yc2E3UURueE9GR2J2ZDhNdXBoTTVC?=
 =?utf-8?B?V3pSYkU2NUJtQ0RIaFEwTHJ0R2lqMnVyelIwbTlwNjhtamV5UlplVGpURkpa?=
 =?utf-8?B?NDZjMEM0TlRYMk50Ykp2YW93cFdxaDVHek9GTmJuajNtbUFDODEzbmRlRkFW?=
 =?utf-8?B?TXd4dThTaE1rWmhJV3kyNGR2T09BZlEvVHZ2UGh0TU5uVHRIcS9nRVhKMXBt?=
 =?utf-8?B?b0NweWxVVGM4RWJjSXRzR3pVODExSXkranFSVURjTUpYK3BiQUJYWDZIQnc5?=
 =?utf-8?B?ZkhQMHBOdStPcUtydlJXOVhMMGswdGk5MFhGUUZOcXE2UGd2TEEwSHFmRzRR?=
 =?utf-8?B?aWV4c2E0QU02SlRHeEhJdG9iQndkd2JpaXM1R2EwNVM0VnNmK0hGcTRyb2gv?=
 =?utf-8?B?NmUwQk40eFNERThVbjF5NnRNRXAzbVFTTnE5WE9nbDdGa2N3b04rNFdmSHU3?=
 =?utf-8?B?NU1XYjNrYkc1N213MmhraTc5WTdVTWl5cnZqT3ptaUdmc1lIeW83ZUdUWHI3?=
 =?utf-8?B?NVBwTXd1YnBEaXRlVFFZd0trTjZHcGt2ZTN0N3RSRlU3SHpKNHNlaldPRU5i?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF97222FE75EE64AB49D233E7F7AFE73@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c897be3-51f2-4ddc-354c-08dd92c66d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 09:05:09.0282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsijkZxy0QpKgP0zmD1oMhUOlRYb1q1LWmUk2Qg0HvJ2e3moIct9bUDVaO94VgkyBysWFd/ac0Jdj0kbvwxIaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7265

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDE1OjI1ICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBIaSBCYXJ0LA0KPiANCj4gSSB0cmllZCB0aGUgc2Nhbl9tdXRleCwgZnJvbSBkZWJ1Z2dpbmcg
bG9ncywgaXQgc2VlbXMgb2theSBmb3Igbm93Lg0KPiBJIHdpbGwgcHJvdmlkZSB0byBvdXIgaW50
ZXJuYWwgdGVzdCB0ZWFtIGZvciBzdGFiaWxpdHkgdGVzdC4NCj4gQW5kIEkgd2lsbCB0cnkgdG8g
Y29sbGVjdCB0aGUgZXh0cmEgdGltZSBzcGVudCBvbiBjbG9jayBzY2FsaW5nDQo+IHBhdGggd2l0
aCBhcHBseWluZyBzY2FuX211dGV4Lg0KPiBJZiBldmVyeXRoaW5nIGlzIGZpbmUsIEkgd2lsbCB1
cGRhdGUgYSBuZXcgdmVyc2lvbi4NCj4gDQo+IEJScywNCj4gWmlxaQ0KPiANCj4gDQo+IA0KDQpI
aSBaaXFpLA0KDQpDb3VsZCB3ZSBlbmFibGUgZGV2ZnJlcSB3aGVuIGNoZWNraW5nIGlmIGhiYS0+
bHVuc19hdmFpbCBlcXVhbHMgMcKgDQppbiB1ZnNoY2RfZGV2aWNlX2NvbmZpZ3VyZT8NCkkgdGhp
bmsgd2UgY2FuIHVzZSBmbG93IHRvIGVuc3VyZSBjb3JyZWN0bmVzczsgaXQgZG9lc24ndMKgDQpu
ZWNlc3NhcmlseSBuZWVkIHRvIGJlIHByb3RlY3RlZCBieSBhIG11dGV4Lg0KDQpUaGFua3MNClBl
dGVyDQoNCg0K

