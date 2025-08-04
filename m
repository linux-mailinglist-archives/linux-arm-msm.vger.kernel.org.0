Return-Path: <linux-arm-msm+bounces-67680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EAEB1A1FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D07E189EA91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0E72737E2;
	Mon,  4 Aug 2025 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lVKTVx/k";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="N6/3XaaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632425CC75;
	Mon,  4 Aug 2025 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311450; cv=fail; b=sk7tQv71CM8yjt8YdKcSmQtWgx9lEmKKYB7jRJp8l63yMM76tflyuz9wTnLXmYsEiSmKtiPYjk5jaZOLb8/1V5NfkJzaRoAQNPFItov2fwkgPF5G97mXRISHkXXh9Sgr/h8GG8nI3+OBwVyqszXyLQvF6XTiuFI0dF7JCM7x1K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311450; c=relaxed/simple;
	bh=IzvNB3njTKMb2/MvBNnfVBUc1tmZtkzNVkzaHvPlBnM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tskR8fXmxH+BNSapNE6otatknZwqIHVkx3ZfT6zlEDWSGsCiwyWncuEcOqmDy2xya1UoRnyHU2GUWnczm6jmytTiAoM4eeUnEFXxxl+Ac49IsUMLNGy3ZMXMCZcnQE7UkhZxvkHe+BiRD3P8PBDNb0brL7f2rxa0Bv2tfbjmTyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lVKTVx/k; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=N6/3XaaC; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b3652e02713011f08871991801538c65-20250804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IzvNB3njTKMb2/MvBNnfVBUc1tmZtkzNVkzaHvPlBnM=;
	b=lVKTVx/kwjtHXRusmg1hKZm5vrAYd0o9VutItQI4xxduAAmdLfiQPNyD+oC3BhgBwKW3QzPtpCMDXRgsMSUqoUuni08v+cCl3uYAFFO8NUJFCeRSc+Mu5SlRekx4fujsl5LSu9M7X9HqAZH7x/Izln/NyJnGyFCNv0vyRjPTnZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:a588f945-a18e-4488-95d7-8cd7a13bc28e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:eac37d0f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3652e02713011f08871991801538c65-20250804
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1954482348; Mon, 04 Aug 2025 20:44:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 4 Aug 2025 20:44:00 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 4 Aug 2025 20:44:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd3lAxUPOjwKkeFhKZbm/pPurcbZrfHWQSdFCGrJdBHC9gAQHBcYAm826JdsaXalyQEQ9wOI/nwXp5LLAfoT9CBLwhL1VnLNyydaxiVVh/HGgnTGL3Mgrw+oE2ktFy+yHyWjpXbsyLWSgZJORv4LONFuw99VNwC2fq/5YVl6ng1wTxHzNd2zyFKxbLkqNNpUP9ZIKqiu+n/WwNdgkaLzzID4zjUKZ2ituAA06wiFi9GcBmfHkPOME1ieU55z6T2EW31p+RdU/uZlvf91B8/1g8NSsDE0qllCtT21X0u2AE40s3QVjjr3b1U2nbkj17zGCPtIMr6i4D5/seLHVxLwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzvNB3njTKMb2/MvBNnfVBUc1tmZtkzNVkzaHvPlBnM=;
 b=E217d1kuFpBRm8cwyuE4l+kR+KtJMO2M722UPfrptTZDEgzYBHgECXVvKl8Wnb60CjJfMa+uu5JMxLqadiS0BZ1d3FgmWz14Kp6r5Nx6H1QvuVjT3RO/T+gb4FGsBkngOuJksqxZWIfyo0etvmBmbbvwUULYDI9OJ3fQJ895YH7VUJU7f8tCpBPRhGFlZi5Ttt0nmbQDWDc5C0o3frr+wIF5NH9jkT4Ih8eAcmm6uMlNPLhIqiOIDQ6XrUOi8vaTIIxT2kE7j8gk318o+NUPWXDXM3NMY3ENc8+mjEtq0j+e1PIna6L5PqfXqmo+6pNKP2dwnMWHLI+nle8OAJ8bnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzvNB3njTKMb2/MvBNnfVBUc1tmZtkzNVkzaHvPlBnM=;
 b=N6/3XaaC7sHXqYlnHrFBB8dCFex737jgPnF0a9367N4rZPITl8c8g1PfPM2nVMAx+axnaq9nrGCx6K1ybPZA54DfiyNnXOhfB17VWYyhj2kl4vpjhSRGgS3MRdqMbT9xyUK2z4XPpDNzICh/1l/ZHlwfU82iVM8ERa4r4qSbfPI=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7894.apcprd03.prod.outlook.com (2603:1096:400:45c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 12:44:00 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 12:43:59 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "beanhuo@micron.com" <beanhuo@micron.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "quic_ziqichen@quicinc.com"
	<quic_ziqichen@quicinc.com>, "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>, "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>, "mani@kernel.org" <mani@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>
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
Thread-Index: AQHbyvF2qqEtS3Zve0iY94J/r6+jLbRC8tIAgABfYwCABCtIgIABVyGAgAI33YCAADD+AIAHVo+AgABQ+QA=
Date: Mon, 4 Aug 2025 12:43:59 +0000
Message-ID: <efdd6dfcca06680bedc02a70fae1b35485083250.camel@mediatek.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
	 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
	 <1989e794-6539-4875-9e87-518da0715083@acm.org>
	 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
	 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
	 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
	 <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
	 <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
In-Reply-To: <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7894:EE_
x-ms-office365-filtering-correlation-id: be955402-38c9-416d-5dfd-08ddd354958b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?d0UzeXFBV0pXNkpteCsyMWxoSjFqYlNJTHlvNHlMaE9JeUp4WDExbGFlbm9O?=
 =?utf-8?B?L0lHZ1BzSjkxSmVoa1drS2ljZytmQlE0QnFweGY0T0ZIa3ZCL25CNksrUVMx?=
 =?utf-8?B?N1l1dU1aS1VlNlJpZzJiMjhpWFd2QjRFYkN5S3d0RjM1QlY1ZkJQOEp0RDVL?=
 =?utf-8?B?TVVaWlg0dU9JWFoyT05kamlBTG1sTlFJNHdnOERGdTJjUE5vUHNpbVE5MEFq?=
 =?utf-8?B?b2lEbW5RcXVKRGY1bDROWTEySi9IbnV0RTZxbC93MmdkOFhiTGtkUEdyK1NE?=
 =?utf-8?B?L0xSb2tzTW1jTUxKWkovUUl6MXVnVU5RM2JuY3F0MU02M1FHcHBML1JvWWlB?=
 =?utf-8?B?VUVrZDI0cWtLVEgreGtEMGNENHBKditON3FTdU9MMFZ2SG1DOHZ3SXB2aXNp?=
 =?utf-8?B?OEpNR0p2dHNxT3RxYnE1K2NzZjhmZ1V2b0FhWjBjTE9XSjVieGFTRG50OWl3?=
 =?utf-8?B?MUtMV0prU0t2T0NjVXVZM3VZcHAxMWZDMENBMGRldUdOTXB2UncvbW5lV3hF?=
 =?utf-8?B?NWFWTGpUeGdtNFRQZW9VSEMvVG9TN2xSQ1pCVG0vU1RTS1FmSlBNZjR3cElj?=
 =?utf-8?B?bzVzNlhKaU9XM1RUNGNmaTUwVFJ5U3pXN29ZbW5YelMvUGV3czEyY1YyRCs2?=
 =?utf-8?B?bzI5aFA0bEZDbzdObWFGU3BJZGFiSVFiaFd1cjRYOFhNZEZydFZDVjdQL1k5?=
 =?utf-8?B?VER0WkRteTBJei80U2pjb0VRRUFmYVdja2FHSFdpVDRZTDJiU3lRYTVISCt0?=
 =?utf-8?B?dThPczAvdTlRdW8rYzVwMHVPM2E3czUwd3pHTEtVeVpuRFVyV1lldmpjbGhM?=
 =?utf-8?B?Z29iU1VrRlV4eDNuUWNNd1BqMHFuT3cwQnJIOGRhMTNsYWZONkx4ZzRYTGJi?=
 =?utf-8?B?dm5VWm5ia3gxb0dYNXlrT0RpNGtnMFJ0dlZUMVBvR3pERDZNNCtKeXNOdTJh?=
 =?utf-8?B?L0dQc0gvNnJwUHV1ZWtnR1BlOE91TW1Hd3NOeHh2amVpbmxvSjF0dGFIUStF?=
 =?utf-8?B?Kzl4ZmFGRHM5cG50RjJrVjFoRnkzeXZiUHkrc2JvV2RXV2Z3WDRPcS9YbnIz?=
 =?utf-8?B?VmoyQW96bkFmM2k0SHplTmNRVHl5am8rbEVPUjA2SjNidVdvMjFZUVFxb2V6?=
 =?utf-8?B?ZEd2S0dxanRvcHQ5aWJhQTRibnl3b1RrRDBzMHkwNTA0N1BCVml4eWVIQ0dn?=
 =?utf-8?B?Y2FPUldBY3k5YnNUbDZpR2ZZK3IwQWlzWnI4MVdZeDRGcUc2UDQrcjFjd0g1?=
 =?utf-8?B?ZklHV3Q5enpMZjM0cWNneFo3N1pUV3RaNUNaYlFaN0xFN0NnaFhGY1hUbkFk?=
 =?utf-8?B?ZDBqdVlHNlVsek9VbWxkdFA4bzRwcUUvMWpiN0xrb3ZkS2hyTHVDL3F5Yndt?=
 =?utf-8?B?bG9IcFhQWm5uTVdSQ2t2cjZJWFdIQW54UGRjYkhvNjJJMHhnWnliNGU5SlZp?=
 =?utf-8?B?dVdLL1pLNTJ4YldsTzZ0VGliNDVQdkFxRGRDU2U2ckxLaEZhRDExc3NlZVUx?=
 =?utf-8?B?bDRQVEI4em01RWFPNUVQUzdHZkJSQnhMOWYwRXNzd3dmcEVxSXVQYityVGQ5?=
 =?utf-8?B?dXpWN3N5d1RMQmxWTllDcTR3cy91MTNha1VHTXk4RTJNNjh6REpOTlZnQXc2?=
 =?utf-8?B?YkNHRGlPUDE5MXowOG5UUi91OG1sZllCeU9uL3FkelVlamo5SG9uQUlCUEVz?=
 =?utf-8?B?SFY3K1JWMFFSMjMwL0dnRHBlLzgzYWdKbzFlRVczc0tsay9uMzBJTWErSVox?=
 =?utf-8?B?UnNWaXhtUURRd3NhVWE4QkxaWkhiVUJxSWhLZVBCMTV3dDNwbWtHZFhBSkow?=
 =?utf-8?B?VStheTduQW50NHRJditYMnQwbkZYL2dCbFV0TnQ1cSs0eEpuRUlDQ3djQTlN?=
 =?utf-8?B?ejcrYkFOQWFQS2dGUkVuUmZwSHNZYjZneG5pS2VUdExCdzV3RytEV3dSU01O?=
 =?utf-8?B?TGhVd2FxU2dhRk5NKzdQRXM5cmQ3QkhBU25NV0tHS2FuUXhTaWVZaTU5cVI2?=
 =?utf-8?Q?Z2Gwcm3JXMMMw1Rw7uDaDU8C/YqOig=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjRZVHNhOXRDUDY4anZLS1hKTUQxN0o3bzhmeW5SVlRHMHFyMzNQeXRqNko3?=
 =?utf-8?B?cVFpRmwxUWtITVdXNEVOZGhxQ3JIVkNMdVF5czJWVGxzM0RZSzRDbXRFMlBp?=
 =?utf-8?B?OWl5RXIyclVOZ3lMckhRUyszZ256OTNxcHBTK2pGMTAzV2gvejZleDkxUFJY?=
 =?utf-8?B?Q2x2U2tlaEJyZTE1bDlPbWpXNHMyemlRRml1UmdXaFJSS2F1TjBndExFdWlJ?=
 =?utf-8?B?RkhEQWh1RUI1QlYveElYeUlIQkI1b3lDbDhqWHZ2UCtQSHU0dWtGTWdmRXpS?=
 =?utf-8?B?eGVEQ1hNWitiS1ZkOFVodFpJKzd2c29RaWptSjU3L0R0ckJ5Ry9rcVhkbTBV?=
 =?utf-8?B?Q3hNT3VFOS81WVFUTkVtUVYweC9jTlVTVzMzTWx2UGk5S1V0di9pYmZIWHJl?=
 =?utf-8?B?Rm0xWHRyNUlaOURoU1N2Y3dQTEp6UFdvR3AwejJKN0JmSnFGZ0ljbGNVSkZQ?=
 =?utf-8?B?WEZEN2FJUGxyYi9RRm5GK0JxVVFvTEp4RWtTOUJNcVJIbFR2aVRUK2M3SGtu?=
 =?utf-8?B?Vmw4azNLRXJZNDkzTnVRdjcwNnEwcmw0M2szT2IxQ1MwM1UydVpKQVZNVVJC?=
 =?utf-8?B?MVFhUGpLdGxIQ1BSWm5wMW9XMUw3Zit3eFJtVGFZczZocEYwTVRyR29VekxU?=
 =?utf-8?B?YkwrR3lub3NvWGgwZ1BUVUVUeHdWVVp2Y2ZNL1FYSENwc3R1c0t6eGdpQnJr?=
 =?utf-8?B?amgvS0x4NGVrd1lEcTF1RWN1bUI0NmozNnJ5WFhhM2ZkYnFTY0ZlS0cxc1JH?=
 =?utf-8?B?ek5DNDY5d2lKRCtGdzF0QlAweVNrVTI0SUFZSEYrc1pnREdZa0JYMTUwTDR5?=
 =?utf-8?B?NWxiQ2tUcGNvUWg0ay9ReUM4bEptU2VtQjZpYXlFakViWEw0TnpnR0Q5MkpS?=
 =?utf-8?B?U0JrM0YzKzQ2Y29LS2tJOGZObUJTOGpxVFJ2bWpSbEI5S1VJejJLbDZhZXVQ?=
 =?utf-8?B?dEVzeEdjcDZqbm1tbTZXeHRHOG1qMHZEVXNRUWZOMFB0ejZOSk8zc1BLTXlL?=
 =?utf-8?B?dEEwTitiY1BxYzZvRXIyU25keHNYbWw0dXJjSG8zdmx3R1hXM09SajFEQjFR?=
 =?utf-8?B?cHRMenVVNE8vSTUyVjhuL0Q3YU81cnkxNXIrS1N6SFNkVUpaZlA4UGF5REZP?=
 =?utf-8?B?RjVvTnYxTTJxdWsyZTI5a0cydTV5b2krdWZrN2FWNm9kbjRNZHRIUXgvaWVH?=
 =?utf-8?B?bk1mdzVwQXc0UjZCQk01aWIyellYYzl0d0JlQU51cXZaZTZWb0F2WnlRQTJP?=
 =?utf-8?B?NWVqbzFmb0JnV0tlN2J6MWFMaHIzU3VqY0p5azI1YkE5ejdYTDRLSnNQWjRS?=
 =?utf-8?B?Qi9ONEdrZE5uVSs1eWQyb3l0YXA0cDB3MnUyZEdueVk5SWFPSERpc3RubDJQ?=
 =?utf-8?B?MnlTNVkrWXRBTXd6cngxRU1sWTRKaEJ4U0llTEIrTjNRMGZtekJUT3YwOC9G?=
 =?utf-8?B?Wk0xdm9ZbWZSRGlPQThyZzdKek45T1YrQ0pYYmlqSW11SXBLMzF2akhwbjdn?=
 =?utf-8?B?NVV3L0R4ZWV6UnpmcDNqQjVQcFBaMzltTkN4N1NQODRWTkZGY2pXWGZ3dmRp?=
 =?utf-8?B?aldTUCt2THNtVjZRTlJGM1JQSXZCUTVuWnViMzcvRGNvOHE0NVlRN1laZFhv?=
 =?utf-8?B?aFphdEJwak1rSGViMHJNcUFNWW1GU0pLcS9zc0szMGxoN2pRQ3hITUdRSUow?=
 =?utf-8?B?R1Jmc2JtZ05MdCtkdWIxN2hBd1V6MWc3cEJqQmFrUkhGK2M3N1oyK1d0N096?=
 =?utf-8?B?b2Fmd3ROMTFsODBDT2ExdkdkTXdtQmE1eVgzekkxaVVyTFpSR1d1a1QvdDdh?=
 =?utf-8?B?Y3FEMEphRlNEZVp0OG14aGdCbURGREVzeGxXNVk2dGlXMU43UEUycFVNUU9J?=
 =?utf-8?B?Y3k4aDV0YVRsL3BrenVmRTNoNmR0eGZTc3MwM1JGRXhaNFpBYTVKd24rMHVO?=
 =?utf-8?B?Vng5NUtOeUJ6aFQ1WGxtZmJHRkhqN29LNjY5d216NEpWRWdqa2NLTXVuYW1N?=
 =?utf-8?B?K3hhM3BCeUYyMGUwZHo0d0luS1dXNVZ3YUZicS9yU0c3VlE1ZzBiQ0NHNHE0?=
 =?utf-8?B?SnlKU3RmbzlmVXlkbGV4OThNY1lpbzdVTlkrU3lxSE9ncDBpWVZWUjd2bmx6?=
 =?utf-8?B?bmhIWXI3WG82bVUzbXpMTEdoZm5qV2g2K0lDNmZhbjM1MUV6b2p0MnpMVGhQ?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E81AC3C9F8997F43ADC4349FD05FF78F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be955402-38c9-416d-5dfd-08ddd354958b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 12:43:59.6001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbx+he2PDiFVtaKzlspQN0UddK3Rg3QK8pRWsIh5PfPhyr3ZsRmuwuN4TyPPbeR9yGLza/jPrBjoMWG7FoznMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7894

T24gTW9uLCAyMDI1LTA4LTA0IGF0IDE1OjU0ICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBIacKgIFBldGVyICYmIEJhcnQsDQo+IA0KPiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHVzaW5n
DQo+IA0KPiBpZiAoIW11dGV4X3RyeWxvY2soJmhiYS0+aG9zdC0+c2Nhbl9tdXRleCkpDQo+IMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRUFHQUlOOw0KPiANCj4gaW5zdGVhZCBvZg0KPiANCj4gbXV0
ZXhfbG9jaygmaGJhLT5ob3N0LT5zY2FuX211dGV4KTsNCj4gDQo+IEJ1dCB0aGlzIHdheSB3aWxs
IGNhdXNlIG9uZSBsaW5lIHByaW50IG9mIGRldmZyZXEgZmFpbGVkLg0KPiANCj4gQlJzDQo+IFpp
cWkNCg0KDQpIaSBaaXFpLA0KDQpBZnRlciBhcHBseWluZyB0aGUgcGF0Y2ggYmVsb3csIHRoZSBs
b2NrZGVwIGlzc3VlIG5vIGxvbmdlciBhcHBlYXJzLg0KV291bGQgeW91IGJlIGFibGUgdG8gdXBz
dHJlYW0gdGhpcyBmaXg/DQoNCi0tLQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91ZnMvY29yZS91
ZnNoY2QuYyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCmluZGV4IDJmZjkxZjIuLjBhZjM0
Y2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQorKysgYi9kcml2ZXJz
L3Vmcy9jb3JlL3Vmc2hjZC5jDQpAQCAtMTQzNSw3ICsxNDM1LDggQEAgc3RhdGljIGludCB1ZnNo
Y2RfY2xvY2tfc2NhbGluZ19wcmVwYXJlKHN0cnVjdA0KdWZzX2hiYSAqaGJhLCB1NjQgdGltZW91
dF91cykNCiAJICogbWFrZSBzdXJlIHRoYXQgdGhlcmUgYXJlIG5vIG91dHN0YW5kaW5nIHJlcXVl
c3RzIHdoZW4NCiAJICogY2xvY2sgc2NhbGluZyBpcyBpbiBwcm9ncmVzcw0KIAkgKi8NCi0JbXV0
ZXhfbG9jaygmaGJhLT5ob3N0LT5zY2FuX211dGV4KTsNCisJaWYoIW11dGV4X3RyeWxvY2soJmhi
YS0+aG9zdC0+c2Nhbl9tdXRleCkpDQorCQlyZXR1cm4gLUVBR0FJTjsNCiAJYmxrX21xX3F1aWVz
Y2VfdGFnc2V0KCZoYmEtPmhvc3QtPnRhZ19zZXQpOw0KIAltdXRleF9sb2NrKCZoYmEtPndiX211
dGV4KTsNCiAJZG93bl93cml0ZSgmaGJhLT5jbGtfc2NhbGluZ19sb2NrKTsNCg0KDQpUaGFua3Mu
DQpQZXRlcg0K

