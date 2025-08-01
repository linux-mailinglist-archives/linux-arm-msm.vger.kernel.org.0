Return-Path: <linux-arm-msm+bounces-67301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A44B17DA0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501694E55A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 07:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEDE1E835B;
	Fri,  1 Aug 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P3vZtnLq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vckMZVDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CA2E36FF;
	Fri,  1 Aug 2025 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033512; cv=fail; b=lLvkpS6ydhVHsZHiDn4hcGeI1PQIcS3srMA9+j7cjds8WD6jDVejvaJoczX4pbmt7rYjqefxJTX0SVme3nPDHvt3mSBsPCv3a4jDluxDg7JO904vn1Xs5veFSAPzfllSesd3dTmFUac+eLTMnWQvZ6Hgyg3/mbyyjmMU2RuCilg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033512; c=relaxed/simple;
	bh=JiMNzpwBSw+gwVZJCmHbnvEpjpWQYDNC4mY5XAGo1i8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b2n6PeofCxhi/x5E4Xx9FxJ1F8pkgzBSaOcKErgcQX5AxFL9ubnt5Po5LwrTCdXqmEtirIoZuk1+89ipXR4AlmykbqCSF+ExMKnU4inZ9gsSiOvLaSAw1RG9B1yJUZV4tr3h+SDk+W7Xg7jzc/Ub4wAowvYT56YnKGG/dmhAa5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=P3vZtnLq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vckMZVDt; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 93c6fd3e6ea911f08871991801538c65-20250801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=JiMNzpwBSw+gwVZJCmHbnvEpjpWQYDNC4mY5XAGo1i8=;
	b=P3vZtnLqTzpRRvEfFXuznBHmXak/GYOPy0psuaa0etb3YLPrpELz3Fg7QKKz5GunECfkHOY7Sb0cKCqpi3vghtmaqzfGJaLjZ1CTD58nlWJ1gIOy6K/trC+XbII18f7ohER/CTVaArW3PfUPy6fh1ze/LIUs91Xz67mcctT3gmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b6b8881d-e6bd-49b2-80cd-e8b30671ee4e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:eef2660f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93c6fd3e6ea911f08871991801538c65-20250801
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 239165120; Fri, 01 Aug 2025 15:31:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 1 Aug 2025 15:31:44 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 1 Aug 2025 15:31:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axLplhpgF4Vul2UcP4cZTxBxkkZsZmk6963HixdV8iL7oyr6c4BV080B67VIdER04gbiFyTNngiG5XNLYqsucZFSrNFk7tCuzMDPnFsFlDdnyqdaQnCowHtlQyHI5C253xJDLZdvd3+EL9WAO3MYSHb0dMwIH8j/kACRJNCMxYldgerlYNSJpM6LsQH6s4bBjf5Am0y7LYHJPl4NY96jSwvrgqqyTDAd7+gUmKbCgeRgmbSxR6XhYJbS7GY2D5iL0GaHLFxHXPl49OpRjPLXp+uwcYHWpNUhS7IV8dmgFyOVfbIOUEECA618RJor6U9qZYm+PzzC39sNvv8zLxPy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiMNzpwBSw+gwVZJCmHbnvEpjpWQYDNC4mY5XAGo1i8=;
 b=N9I8TbDMNl3KfDHuGMBENm+NfZ/nhzu6UF6KIYW5g3q9fjsKxI5xb64sroa22NBdPfUqsvbTVdQh5+fE+AskrMmogBn5CvUnhVc6dJ7GaI0PViFLGKsHKQnN7mOR4Men3g6y+JSgvYa1O+siivasn8ACjF+aY3Xx+pLNSCZYj/+S4rI4uRA4W0lPthK6YjTpXAnjyJ82aoFEu+ILd9dzZEhVtO7F95zKbOVEx8jEvGdDTL8W7j3tJ35xZiDrv2E5HUu6t53VgmmKmbJAYnMjc3XDOpAtrub/83VAhrz8eqI5/fWug8V6FkrFFXqdokjfRhLiQPGG4bo2g8YxaADj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiMNzpwBSw+gwVZJCmHbnvEpjpWQYDNC4mY5XAGo1i8=;
 b=vckMZVDt8cUKwrgWE0bAx5WhhVRry91kg1gmA6tjryZojaF1l40qyzd+RnMAP2YDzoD3Trkp/dZiMAeddjsQgOPK9gVHEVxT9wsIEwzKet4T3yf37bSG9aLgsGVbjfcQdpI/v1aqvBCb7ZfjHJGv3jYhm39uWooYLRzqbAdJwYw=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SE3PR03MB9355.apcprd03.prod.outlook.com (2603:1096:101:2e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:31:40 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 07:31:40 +0000
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
Thread-Index: AQHcABMQk8XyzRGGh0CZRYgd32oCALRNbH2A
Date: Fri, 1 Aug 2025 07:31:40 +0000
Message-ID: <2e96a5843fe393537c3325dc2d5af5306686330c.camel@mediatek.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
In-Reply-To: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SE3PR03MB9355:EE_
x-ms-office365-filtering-correlation-id: c529a805-d834-41bd-68c1-08ddd0cd74f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?OTdOQmlqTHJkUUxhNDJtZnJkejBCOHNzWmlzUCtEY1ZxdWZpTzdTR0I0TE9F?=
 =?utf-8?B?L3FiL3gxWjVSZkw2VWNuZEcrZDRlcS96OTJteDg3czYxR0RsSUxiMk9ESEUz?=
 =?utf-8?B?S0c3Rk5sb1R6N2loR2ZUYVdZWVN1eEZJRWFLNkt0RCtZRkpXb1RaR2d1UWM5?=
 =?utf-8?B?Yks2K2RiV1VJbXFtZWFIK3JkZnNyaFdLelRZQi80K0hFZ3ZuZi9pMVZ3V2Vo?=
 =?utf-8?B?NVFwWXNpNXdTalNjTldZbStyNUtSMVBLV2xCa1oxSkJzcFVYLy9ob3FVNXRt?=
 =?utf-8?B?SjVxNDlWa3lTUzJWSWFnd3EvRkwxbkxmenRaYTdZOUdUY3FKczlGZTN5cVJZ?=
 =?utf-8?B?KzNueVNxaDRsOUxqSWl4RlpmVlRCQjkwRDVkN1ZqZER1dDRVRVYxOThtUXZ4?=
 =?utf-8?B?MVBPazdtRmFQSTFWVm83L2w5MU5GS01JVDE0Ujc5dkFoTVFheVdkUGFGN3pv?=
 =?utf-8?B?akpEKy83SG05c2J2WERkTU81eUYvMUg0QjNaUkp2SGF0dTlTYXlmVWVkTU1x?=
 =?utf-8?B?VnZoSDBTdFBCaGRFeGttSXhZV3Y4MUdtdTZ5RlVCMWxIK3Rid1pIdHM2Yzcy?=
 =?utf-8?B?bUNTQ1h2ZUZKZ1NPdnBCL0xqaXF1ckFUdEtOVFR1UjFJaUZ0UWt0dGxjalhM?=
 =?utf-8?B?RlEzaDdteWZLNjM4Mi92SEJ0RVpEWHg5eFkvZHc2VWYrSWM4MFhnYy90am40?=
 =?utf-8?B?OVBvNmxTZk9yK0hJMU9KNkpNUTVVK0dYaTFtaEdSZ0Z5YTV1VXZCbWJKb2Jj?=
 =?utf-8?B?TDlscUl1MjdQdEwwVHBVaUNZOFBwUEdWb3JMckVLVUcrQkVzZ3lMaDkvZEFh?=
 =?utf-8?B?RkIxbnd1L3g4MUNFYUFxMzI0bGppRlptRVhGbTdqTEZKKzA5RXZxYWkxc1gx?=
 =?utf-8?B?aVRIQ2s0cW1RQkJEUXd4UVpZSHpKSWN5dldGMER4YjhjYitubTBrczNhTCtv?=
 =?utf-8?B?c2Zoek53RGFRZDZVMmlkRDE0YWdNMDZtMDlwTS9CRVgza3VaV1poZFBYVlVD?=
 =?utf-8?B?YWZJZ3gwSWtaOU5QeDRBRmtUSFlvOTdEeG9pQi82L0N5dG4vaVBtdGhtaDFj?=
 =?utf-8?B?NDdNOGQwTVBLVHVvcmR0K01LVitqd3JralZ2blRWcDBDcmxCeXBKWG9BQS9E?=
 =?utf-8?B?bkUva08yOVFXTWZ1enZodno4ZGkzWkUyeEVsS3ZLTWZFaTF1WWFMN1l3N2dJ?=
 =?utf-8?B?bnRzeXRxbVRyTFcwdHJjY2RFM1B6MGZqWlVrRXFKVGRCeXU4Wlo5cWVHZk1Z?=
 =?utf-8?B?V3dIaGVjRE5qblphb015YVBXdVUvMGlueWJyeEtVMndTMHc1bFNqQ2RlbXh0?=
 =?utf-8?B?K2JmOXNDMDdKaFdUUDhWLzFZRWlPaFNZNkxHSEhUb2xQUHBLRHVESEZEb1Y3?=
 =?utf-8?B?Z0RLeXo5NE5qMW1oVzBnZ3RDbE1oby9HSjlLcjErU3BHQzVRVWdHdVNhdVJk?=
 =?utf-8?B?VVhtU09HUWMwL2VTTFc2VVBXWXc1dlU3cUlPWUtMb2QrdlJJUUl2di9zbHd1?=
 =?utf-8?B?blZodG1kdk1RRm5WUVIrRFZxZG1pTmpkL29zT25ZOVdFVStuY1ZDS20rYzhS?=
 =?utf-8?B?LytTQkIwdFZxSitaRWZ4OTYwWG5INCtZb2lVVDdYSHV4NDFyaDFZWE51VU1a?=
 =?utf-8?B?WXh0VEZrbXFGcURrVE1DS0tKejVwV1hNek9qMlA1S2dSWVZNT0NqMXc3MWFZ?=
 =?utf-8?B?b1YyYndDbWlzaC8rZ2J6MUFYaFhqQVFEbDNvSEs5YSttaTFuR3JsZzNCUUgz?=
 =?utf-8?B?ZjhKcitKSGpWeHNaWDV1NSt6Ymh6dEJ4Z1hRREE4MUpZOWJLRnZ2MlNjRTRm?=
 =?utf-8?B?SUlDRUtFbSt3TGlBT09iK0E0SnVydm03SWFXMFVHQmZ4b25zdFd0VGFqYmhH?=
 =?utf-8?B?N1h0SUJ3bmNYMHJYak5DL0lUckh4RkVGYVJoUEFKdjdCeEF0a015QVNrWXBk?=
 =?utf-8?B?cWc2N0hUK2liaTZwUld4MzBYbmZlTnpZSHdwcVRkK1Y5dWU2bnlRcWJMTTNP?=
 =?utf-8?Q?JwgHbZgDHt/JcJYnrDQS71sntHV4oQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk05aUVad0ZXWm8rdkRubGU5dUFnNHpycjQyaUxIOEMvdzk1WTZwTzZ6VEh5?=
 =?utf-8?B?bk1kUHRsaTYxcDVSSm92NktjeFQyQmxrRTRiK2NWYnpkN0NIRWlwbldaZmZt?=
 =?utf-8?B?V2lNbU5IZlYrUHRRSlZueTk3L3IzaWZ4c3g2Y3B0UUlEOXloa0FndXc5bjQy?=
 =?utf-8?B?Q1owYnZlTS9jTkdObmxDRk4wb2pKdEY3T09wYUQ2bTJHNXFOcW1vQ3lKU2h6?=
 =?utf-8?B?eXdaSlFhRkxkOEtDNmxqZVFGN2lJTVo0ZHNzWXN3c29IcDBxZGZkRTdCY1ZQ?=
 =?utf-8?B?ZFZDN0NzYjVSWXJJVzZKcUtpUTRZRmtBbHNST2FrZWdDUGJtOW13eHRSd2xZ?=
 =?utf-8?B?dEdyanRHZmNJa3k2dUVoYzNPTHJUKzBENGpZY0RKT2IzalY1QlpCaG5qNm9E?=
 =?utf-8?B?cHJKbjFENXZaSC8vRytiSEtManZKZUw1NDUxVFZWM3ZQcFA0MkRQVTczMDgy?=
 =?utf-8?B?enphczJOWVpEOTdWL2VBUDNpVUwwY2JHbEFGS0Q1bG5uTit3V05WY3Y5STFC?=
 =?utf-8?B?cHRnNGFKejJEMVd4Z3lVdncvL1hKSiszOGNoSkZCbHNad1huT2lnU05kK2J2?=
 =?utf-8?B?a3RmSlFabDc1UHRsWEJPSjhYcVlOS0FJQlkyQ1U2Sm5IbHBzMVd3WG1iZWRR?=
 =?utf-8?B?eU84b0tqcmN0My9SdWxQZ2lUNzJHUkcwT1VQU0xKRTVWa25NanpDa0dCVzhu?=
 =?utf-8?B?QjY3MWtRMFdyNUhDS084aXFLVEhGWGxaT1UwNlVMTUp5cjhMNm1lM3NXYWJo?=
 =?utf-8?B?eHo1RzJwamVCTU9CZnBEQllWbkwzdzdJcnFlcFRIQldWT0RsaCs1WnJSMUFQ?=
 =?utf-8?B?K1dGL1NLWkpETVlDVVBmVEFFQlh5Wk1HbGMveGhBOG1CaWpRa2NGSWdycGla?=
 =?utf-8?B?WTJia2laVEVzMlFhcUtKZG9mOVZjWUl6VVp1aXpPVnlsUmM4OTM1cFlyeDBr?=
 =?utf-8?B?N0l5VU1XdE82eE90NVhyYmlNRWlRK1dISlNQaGtiUFlOdjk3QlNMZkoyMmVE?=
 =?utf-8?B?S1BnRmlvWVZtNUNOTUtaWnYyc0MvdUpXRXoxRVlXU2E2R0JzUForakVkcEI0?=
 =?utf-8?B?bnhPRVlpeEk2SW5xamFhNUp0QnpoYmt1Tng5elREZUVTNW9oVEYydUlSWGds?=
 =?utf-8?B?NThkYzdiVmdtcm5TZEhpcXh5NTJqZVJoQnNKbXh3c2R6ZEg0K2tpV1N0c1l0?=
 =?utf-8?B?dnZrMTc4dmF6b1haZ3BkcHpCSm9Sa2tVdk1ndWpqQVF0RllxMTBZeG8rQlIy?=
 =?utf-8?B?S0lpREJvQnpBcVFkR3VVN0IyV1ZmTzdLa3hJVGVlbTNSYkpPYVg5UFhVL0wx?=
 =?utf-8?B?amw4aUpzekY3Y0JwMC9TUW5hTXg0cnIxMVRkUVRjVmcxMTZWRm41K3ZIbkJX?=
 =?utf-8?B?SndIMjhWY2RjYVYwZDZRQTludkZmNkNwNkkxeU82SjYxd1lxVms5Y2JBcE1j?=
 =?utf-8?B?Qlo2SnY1QkNYLzd4ek8vSnhpVTJFSW4zLzJOVXdKblhqazFHRGw1RDZCTFFL?=
 =?utf-8?B?VUVsaWZud21VMjYvN2Q4T1FaQ1FmSWpjbXRWVDQ0eVIrQy9pTXRmNXVVTjRp?=
 =?utf-8?B?VjlocVZBd2taRVdTNTAzODJzd2M4dnVMYVA1NTczYmN0eGh1YkhPL201M3Jh?=
 =?utf-8?B?L1MwYVFBUU1DekZmYTVHYmlKWDVleGNFWDc4aVVudGlhRkxMRE0xR2VlaUtp?=
 =?utf-8?B?QmdrZUNqM1NKZHRobUtoME93U1djV1lNQ0drQmZPRER6Z0lFNENRNDZiVVUz?=
 =?utf-8?B?dDJvVHJFbWdDZDhaNlZCcDJyODF3OUpsRS9qeHM2cVBsdXVpdkd1NFRHQi9W?=
 =?utf-8?B?czN1akM2WG9hVy9YN1FyMVgwbjJzejFkY3NvN3htaUtKQnNGdFJDcEJDV25z?=
 =?utf-8?B?STFhTmVnVzVGb0k4bVN0cTJSNTBXcWVaVEpSdXAzaDBpS1BRSlIxSUxTZVVN?=
 =?utf-8?B?c3dzL1N2S1N3V2FCV1I0ZVppbHJLWDZIR3h0WEdhaGJEdTJ5ajk5UHB5ZGRq?=
 =?utf-8?B?N09uNG05V1QraFFRN0xtRXZRS21IRzZDVnRTTkd4eXE1a1Nvc2ZWZFoyUy9p?=
 =?utf-8?B?ZjdNNW5hdFVNK1JvUG9DbVRldmsyOThldlp0a3lsTTFnQVk5ZEtndFV4MFpI?=
 =?utf-8?B?bjczZ1U1cFpjbDh0RGUxOGdvSEJlSVJVZXlSUXFBQ0RpZ09YR2VrV01HR3ZO?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <391918BD0D231F4BB76F69C9223E59D7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c529a805-d834-41bd-68c1-08ddd0cd74f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 07:31:40.5157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTPduNLahMx8L31jIJudC7ArGya629JaPHC1emUQKTbRLo5Etm2nTt5DnZKRqFshf8Mv5x6XSw31SqE+9AFTBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9355

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDA0OjI3ICswNTMwLCBOaXRpbiBSYXdhdCB3cm90ZToNCj4g
Q29tbWl0IDNjN2FjNDBkNzMyMiAoInNjc2k6IHVmczogY29yZTogRGVsZWdhdGUgdGhlIGludGVy
cnVwdCBzZXJ2aWNlDQo+IHJvdXRpbmUgdG8gYSB0aHJlYWRlZCBJUlEgaGFuZGxlciIpIGludHJv
ZHVjZWQgYSByZWdyZXNzaW9uIHdoZXJlDQo+IHRoZSBVRlMgaW50ZXJydXB0IHN0YXR1cyByZWdp
c3RlciAoSVMpIHdhcyBub3QgY2xlYXJlZCBpbg0KPiB1ZnNoY2RfaW50cigpIHdoZW4gb3BlcmF0
aW5nIGluIE1DUSBtb2RlLiBBcyBhIHJlc3VsdCwgdGhlIElTDQo+IHJlZ2lzdGVyDQo+IHJlbWFp
bmVkIHVuY2xlYXJlZC4NCj4gDQo+IFRoaXMgbGVkIHRvIGEgcGVyc2lzdGVudCBpc3N1ZSBkdXJp
bmcgVUlDIGludGVycnVwdHM6DQo+IHVmc2hjZF9pc19hdXRvX2hpYmVybjhfZXJyb3IoKSBjb25z
aXN0ZW50bHkgcmV0dXJuZWQgdHJ1ZSBiZWNhdXNlIHRoZQ0KPiBVRlNIQ0RfVUlDX0hJQkVSTjhf
TUFTSyBiaXQgd2FzIHNldCwgd2hpbGUgdGhlIGFjdGl2ZSBjb21tYW5kIHdhcw0KPiBuZWl0aGVy
IFVJQ19DTURfRE1FX0hJQkVSX0VOVEVSIG5vciBVSUNfQ01EX0RNRV9ISUJFUl9FWElULiBUaGlz
DQo+IGNhdXNlZCBjb250aW51b3VzIGF1dG8gaGliZXJuOCBlbnRlciBlcnJvcnMgYW5kIGRldmlj
ZSBmYWlsZWQgdG8NCj4gYm9vdC4NCj4gDQo+IFRvIGZpeCB0aGlzLCB0aGUgcGF0Y2ggZW5zdXJl
cyB0aGF0IHRoZSBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyIGlzDQo+IHByb3Blcmx5IGNsZWFy
ZWQgaW4gdGhlIHVmc2hjZF9pbnRyKCkgZnVuY3Rpb24gZm9yIGJvdGggTUNRIG1vZGUgd2l0aA0K
PiBFU0kgZW5hYmxlZC4NCj4gDQo+IFvCoMKgwqAgNC41NTMyMjZdIHVmc2hjZC1xY29tIDFkODQw
MDAudWZzOiB1ZnNoY2RfY2hlY2tfZXJyb3JzOiBBdXRvDQo+IEhpYmVybjggRW50ZXIgZmFpbGVk
IC0gc3RhdHVzOiAweDAwMDAwMDQwLCB1cG1jcnM6IDB4MDAwMDAwMDENCj4gW8KgwqDCoCA0LjU1
MzIyOV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnM6IHVmc2hjZF9jaGVja19lcnJvcnM6DQo+IHNh
dmVkX2Vycg0KPiAweDQwIHNhdmVkX3VpY19lcnIgMHgwDQo+IFvCoMKgwqAgNC41NTMzMTFdIGhv
c3RfcmVnczogMDAwMDAwMDA6IGQ1YzcwMzNmIDIwZTAwNzFmIDAwMDAwNDAwDQo+IDAwMDAwMDAw
DQo+IFvCoMKgwqAgNC41NTMzMTJdIGhvc3RfcmVnczogMDAwMDAwMTA6IDAxMDAwMDAwIDAwMDEw
MjE3IDAwMDAwYzk2DQo+IDAwMDAwMDAwDQo+IFvCoMKgwqAgNC41NTMzMTRdIGhvc3RfcmVnczog
MDAwMDAwMjA6IDAwMDAwNDQwIDAwMTcwZWY1IDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+IFvCoMKg
wqAgNC41NTMzMTZdIGhvc3RfcmVnczogMDAwMDAwMzA6IDAwMDAwMTBmIDAwMDAwMDAxIDAwMDAw
MDAwDQo+IDAwMDAwMDAwDQo+IFvCoMKgwqAgNC41NTMzMTddIGhvc3RfcmVnczogMDAwMDAwNDA6
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+IFvCoMKgwqAgNC41NTMz
MTldIGhvc3RfcmVnczogMDAwMDAwNTA6IGZmZmRmMDAwIDAwMDAwMDBmIDAwMDAwMDAwDQo+IDAw
MDAwMDAwDQo+IFvCoMKgwqAgNC41NTMzMjBdIGhvc3RfcmVnczogMDAwMDAwNjA6IDAwMDAwMDAx
IDgwMDAwMDAwIDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+IFvCoMKgwqAgNC41NTMzMjJdIGhvc3Rf
cmVnczogMDAwMDAwNzA6IGZmZmRlMDAwIDAwMDAwMDBmIDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+
IFvCoMKgwqAgNC41NTMzMjNdIGhvc3RfcmVnczogMDAwMDAwODA6IDAwMDAwMDAxIDAwMDAwMDAw
IDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+IFvCoMKgwqAgNC41NTMzMjVdIGhvc3RfcmVnczogMDAw
MDAwOTA6IDAwMDAwMDAyIGQwMDIwMDAwIDAwMDAwMDAwDQo+IDAxOTMwMjAwDQo+IA0KPiBGaXhl
czogM2M3YWM0MGQ3MzIyICgic2NzaTogdWZzOiBjb3JlOiBEZWxlZ2F0ZSB0aGUgaW50ZXJydXB0
IHNlcnZpY2UNCj4gcm91dGluZSB0byBhIHRocmVhZGVkIElSUSBoYW5kbGVyIikNCj4gU2lnbmVk
LW9mZi1ieTogUGFsYXNoIEthbWJhciA8cXVpY19wa2FtYmFyQHF1aWNpbmMuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBOaXRpbiBSYXdhdCA8cXVpY19uaXRpcmF3YUBxdWljaW5jLmNvbT4NCj4gDQoN
ClJldmlld2VkLWJ5OiBQZXRlciBXYW5nIDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCg0KDQo=

