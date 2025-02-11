Return-Path: <linux-arm-msm+bounces-47513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE01A30333
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 07:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C71F1885570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 06:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71361E7C16;
	Tue, 11 Feb 2025 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A+3c33yS";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="St9M5qph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1801E7C18;
	Tue, 11 Feb 2025 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739253756; cv=fail; b=n2g7ZdvtjCpXpILpb18+zn7mmxvW9wNMR0QqRYJrd3FWsVDh5KNFGTXubetPkDKF4cHdJgmAgtnFM26nH+OmgpZUFwHvyDvysWIzHs3fvvWIlIsB7FBJT1Zo9awnNiHcVtchaEAxpZdmg5yQNqWao9GLvcDfWM9xPIVfO5g8rXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739253756; c=relaxed/simple;
	bh=DEvnlm1gksVcNuKNeE5UlwvuzjVwPtdaOCsBdTlowwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ukg7Cdx1paUdhSojNfDnRTJLzLEmYC/JDEM4v/3reOB72D/MEOIY6v+1D3vbxuza8QctTXu87e4CEHS0xKaHdR9m77MH4gwrIxIZff+YumaGNyGl8KNLtIENMWlumZASSIJqJujPMxoKrYoFuPofPXxIbU9QpRxyG0b8VNlY1ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=A+3c33yS; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=St9M5qph; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c5e7458ce83d11efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DEvnlm1gksVcNuKNeE5UlwvuzjVwPtdaOCsBdTlowwE=;
	b=A+3c33ySArrEt5HJgD6dv5wSwWN9xgaeeBGPRHWBMmmoUvy9uTVQV2oYqhjssPmVh2BR4yWQfQC0gn5FT7VaCOgf7v78pr2IJR/9/HPWYO5tt6pjGbMDov4PIsrlVvk7vHorEpblmiaEqbxLRRYa0ZKcqQuQf1BT69Fp/BdgC0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:725ad1b1-64c1-4ae8-aec8-1ee5a3b0c335,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d56d657f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c5e7458ce83d11efbd192953cf12861f-20250211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1854523149; Tue, 11 Feb 2025 14:02:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 14:02:27 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 14:02:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnig0Z6f7Lkwv+LBgmU302D2FgGvBUgzoLHXGldXBCqB9PfIuTP3AFllXMHV8TYq3P2tgS3xqage9XzUHLMCir/zf+DL6OTuwq1i4e7z7Ry0YfAu5ReEEvnevgHpWCRYajwo0CsM/65YKJnDt0eD+tMOQDCxrhtaXaCHywC2VuRZirdf4Yv8wEEMyEMLbMYIQeCzFXE75ynHcHdivLynRzSneDs8iWJbF/TlslgT4ixMReChvCFOR8KplPM39ksJ2khSvtx29VNkYBMEgo3lmpcCc0cSre8UlQpFaXYMorEJM/1y0oo+cPtxd60HR0ykUl2TmcnSrOy7DBdip1pfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEvnlm1gksVcNuKNeE5UlwvuzjVwPtdaOCsBdTlowwE=;
 b=ftIpxAjU6JVWsBINHiPj4R4xIVN9MPkQOTxHTr/lfE4LdkOSjFh1p6V/dSMIQXJnXI8O4OKmgEDSHdgHse6jdbJTO5LCzml/QpWdmQC5jGkmMbt4ijpuxAKPd/EKSlmnf1KIajGAdKfwWq4K8jZjsSF0MFQKXA4bR3HZT92Z1EH5IB4OBOuBTt1vV2P0Js4OqdyqbXz46EExdmU3d2v3Rw4IVC0OPcYWQngT5V56yR/WMiy5UmS/20I6c8P6pKOmkSCVPI6kZXix5Io9DsNbUVc0LKgFzO0AFZOLi6qmrM6MVkFW3YrJVgpy9MLg00XnrL9I3xmDYn5J1qLS+Pn7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEvnlm1gksVcNuKNeE5UlwvuzjVwPtdaOCsBdTlowwE=;
 b=St9M5qphiJ2BLtjZznLMEgn12TFW+MXzgbm5t7Vpt3UGxGexRklqnscTLgu10AOjr39VuT0xWiTnaXYAYTPX9ZSQohSfzOmg3eK5Ip+/tPP8X8RfPU7H8t2wf6iyfk+vGdfpAKN5Nl8wElfcTW2L7CPKx47UG20txmxTConDOP8=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by JH0PR03MB7731.apcprd03.prod.outlook.com (2603:1096:990:e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 06:02:24 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 06:02:24 +0000
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
CC: "ebiggers@google.com" <ebiggers@google.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "minwoo.im@samsung.com"
	<minwoo.im@samsung.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v4 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
Thread-Topic: [PATCH v4 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
Thread-Index: AQHbe6MD8TzIMAFZ7kq/QgqsLEsjpLNBncKA
Date: Tue, 11 Feb 2025 06:02:24 +0000
Message-ID: <cb88b16e4207c649da8eba66f976c5039df7c77c.camel@mediatek.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-4-quic_ziqichen@quicinc.com>
In-Reply-To: <20250210100212.855127-4-quic_ziqichen@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|JH0PR03MB7731:EE_
x-ms-office365-filtering-correlation-id: 50d0d4d3-b243-46d6-15ba-08dd4a61a7b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SHBOb0trcWV2aEVZM3ZwSlNYcFZjeVV3VFNmTDBRbUVJYnBDNFRkZmtmcThM?=
 =?utf-8?B?dEkzRUhsdWNyMWhiRU5NSmJLaTRocGF2WEtRN1owK1hyT2dmbHo1bWkwMTNr?=
 =?utf-8?B?RzU5Z2oxVTBYRHZhNWpqcWp0L0psOTRnUVNaWC9yOGpoU25nbmpRb2djZElt?=
 =?utf-8?B?QXduYzEyS0IrdVVPVlREVlBGb25TY3RwUjF5Z3BXVnlYMEpILzVLc3JNTlV3?=
 =?utf-8?B?c0ZwNjdQM3lucHhaUnNvb3NZNzkyMWFWTGF1OXJvWUpSWnk1RGk3SHVzV1Fj?=
 =?utf-8?B?ZkJ2VXFoTFdvNldiTGp1S0hrT3JuakJJNmJFS3hUTS9ERFVUME5VaWExYzN2?=
 =?utf-8?B?V2NZeGUrYmh4OEJMWmd2NFJxckF3UDZ1dGExeFpXZlFnZTFaTElJNWd2Snc5?=
 =?utf-8?B?QWtUSnM4UTdRaXFiZ2dhRmloZmxjZ3p4VWhXb1lsU3N1UFBxWk95OVA1MGlO?=
 =?utf-8?B?Vk93d0RuQ0pwL01YblNXL2ZBSFA5T1doNFRkWENIaFJVN2xiRVdNdENYTEVo?=
 =?utf-8?B?UXBEUDBOV29YcnRaY3B0TkI4S0dOQ2FTSkEvd0RFRy94K2loaVRyVytQZlFM?=
 =?utf-8?B?ME1zR2VmakZQTG10NEJJL1EyNXNoandKcXBtQk1qUkJMdGNscThkc3hKV2NB?=
 =?utf-8?B?UklZZkgxdDdWU0NDWDJsZlNDR2hBVlVKNUlJODd4aDVpYXNJaGRlTlBMK1Fh?=
 =?utf-8?B?OHZrd1ZULzJQSEdhY21McDBMWnlqY3o4MWxNS3JUVkpjZ2p2eE51czIvSEwr?=
 =?utf-8?B?c1JQQktBZXZQeHRnT2kxVHBmOTV3WmQyNnkzUklXMVdVQk4rS3hUNU12K1BO?=
 =?utf-8?B?V0hpMmtmNWc0QW51c3dLbFg2SFU4TWxHWGVsK3RNY1IzOXBpR09pcFFhTVI4?=
 =?utf-8?B?L0dQWnhYc0JncnRXTC9YdFhNREJqbC9ocG04ckg4dDdRb2lKRmNUTU8rSWJD?=
 =?utf-8?B?Sk1jSnk5VlBOS2dqdzRDYVdDWG8zOGRaSDVsaHV3VkMxWHZqUVpabE0wL2l0?=
 =?utf-8?B?OWd2d3Z4N3VHOWNkdW1NV2ExU1NHd201UzMweU5zUFlpN0d6d2hNbWp5YWZW?=
 =?utf-8?B?Z0hoVThURlBvd1lndVk1UDVSUFRlSUc4b3pGYS9qajgrVWd0TXZwWDU2VFFm?=
 =?utf-8?B?OWRVRmlqeEd2RTI1ZUZGb1UzbHRjK0ZaYVdLQ0ZwcDhYVVdNZkhEa25CTkFY?=
 =?utf-8?B?TnF1NzZrZjBIU0JTYkpWRDRIcXd3YkcrVlJySENqKzA4NGRZdGJPWk1rZk9z?=
 =?utf-8?B?bU9uWGZLMElJN2ZOUXpRSHNzVkdZaDJlcTM1TDJhMTRQRC93MUZiazNXUGlL?=
 =?utf-8?B?N2JpVXVEcW03VHNTN3pzUC9XMUsrL0NOZ21BeC9aRytTRkNqL0IydWc3R3hz?=
 =?utf-8?B?MUFTL1F0dXl5dTFIcmlWaXJJcy9WQzF0UkREckltSW9OZE03RFF2Y2szZHdQ?=
 =?utf-8?B?UndoRzdIYVpQTlRqUGJPU2xKeGFYNUxCSzRLeDh0aU1ZdTNPSTVXR2IwdkFv?=
 =?utf-8?B?RE8rSkFaT1lidWJ3VmpHS0JuYnVFZUp3SXdrdERwQW9OSHZoaEpObGRUZUlE?=
 =?utf-8?B?Y0FvUk1xNGkxNW9Vd1ZvTFdBbktYUVJ2NDVuWjc2VEtveStTN280SEF2YVVo?=
 =?utf-8?B?VkZQYTIraEdBeDZPYnM2TUpLd0FsYnJOeStUOXpvajZCK3NRcGlaQllKNGVv?=
 =?utf-8?B?YmRWOTRhWXpQOFJTdUJnbjIwVlc3ZU8wTXphM2ovd0JHQTF5MkFtRkpBSEp4?=
 =?utf-8?B?aWJmY2tjWE5SSlNIL3dNSzM5NXh6NVRrVTVpdWkvcXRHaDZUR1pGOHQyNDYw?=
 =?utf-8?B?ZFp6bysxMUprY0lCSXVmQkNxTUcySURCYXczSU1vNXlmRktpWDk5QkVHZWpk?=
 =?utf-8?B?UmllMExuNHk4T29MUnlNVzQrV04wc0o0eFdzMEhoZnVxT05DbWRuOUlVYjA4?=
 =?utf-8?B?SVA4bjhpQnJXWVMxZmNlUDR1REJvbkVpWHBYNlpZb1lsOWY2a2dtejdKdmVm?=
 =?utf-8?B?WjRsMldhVlpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjZXVHJ6WWJzRDEyVmRSYUVwbGtmbGl6RlVhZUFYT1k2cWxTK0RwYkRtaU40?=
 =?utf-8?B?enkrQW1XWk1PdzdZaG5RLzc1SXh5aEFMS3E0VS8waEx2WW52WW5rTFVmby9k?=
 =?utf-8?B?cXppcDk0VkJHOWt6NjZUWjdmM2xyMndEN1ZwRTI5ai9ML213MWNQTHcwS0N2?=
 =?utf-8?B?b2ZaZFBUNGZPanE3SmVuVWlPNGI4d3VtRWlKb1NYSjVlK2cvTUorYkY3U21K?=
 =?utf-8?B?RG04RDJqRzA1aWZOdEI1Mi84RXUxT3crRVBRV3gxdEdWdWdlVVBoelR5Rlkw?=
 =?utf-8?B?RXJTcWFDUGdrejNnWlFYdmZkaFN4ei9zMnBTbitxOTVhMnBsWEVVbGZ4d2V3?=
 =?utf-8?B?MDdxUXdRUXgySGxwdEN6Y0QvU21wMlBVY1YzL09MbThRazZBbmh5UUNrc25s?=
 =?utf-8?B?OUtyWnhHYXUrSUpJK3k4UmhQVUQyNk0raTh3V1pXQTB2MGp0RmtRYSt4TDhp?=
 =?utf-8?B?RVVhQUo2dVBXT3RlcXJxajlad1FMVlpxamtudGJsbzYzaE5zR0JlMzF5b1Ba?=
 =?utf-8?B?SVlVdXU0R3Byc0VBZFE3cWpRbEFrNnloRlFxMmluakRlOHRPRlJKdHp4bExl?=
 =?utf-8?B?ZkhDaEFqRWMzVW90eW9LZTUzNndxQ3M5cFFJUlZFanUwWWtLemhHM1JuNFRY?=
 =?utf-8?B?R3NEMVhsdUJJTERPbnlJakQwWU5oMW5nSWRjSjFMZTlJeENKOXJ3UmFkL3Vw?=
 =?utf-8?B?QWVjQVRIL0VWZ295Wi9TQTZuNHdMa3Npb21ianlJUXVjSkcyT243cU0vcWJv?=
 =?utf-8?B?eHNoY3VhMXVPNXRIOFYzQ3o3ZG5NY0RGbXVrZTEveDJ6eDZWYTZaNVFTQVNO?=
 =?utf-8?B?U1huUjJJNUcveFFYUlRzTW94aUJpZFkwT1BobnlyK1RNeG9UYTlrTjFyL0Nq?=
 =?utf-8?B?SUxHcVRUZkRydkhkdkJHMGg3eGI5R3d0NjQxL1E3RmorZkpLR1lIajZveTBY?=
 =?utf-8?B?Z2Q0VXE5Q0RwY1R1YWpIdkJrZFBoejFNMy9JZmJkL251UXdPNzdzL2pESWpF?=
 =?utf-8?B?UGlrQnBoanBGcVIyN2RRWkV0L0xUYUw3ZThzN0h1RTFabG1zdEZiLzlHZXhn?=
 =?utf-8?B?UzB1cW85UnJ1SUh2NForYlhRY2oxVEZpZXBWamRsWTh3eTdwR3JRRGlPNGFX?=
 =?utf-8?B?ZU9Sd1BPc3J0WmtEcTlpWlpGUk11OWFyTXZLV3p0cEJGVmdORHZYOHFDS0s2?=
 =?utf-8?B?WmFzUExvaXo0Vm5RZEtLajdzVGt3WkV6UXZvUTBIcWgvMEV6SWpaVjVZWWZs?=
 =?utf-8?B?WTcyVW80YVNFazFrR1VtUmFxeTVaUGdDaGt5VHU0L2t6SzE0YjVORlh1MWZU?=
 =?utf-8?B?aEVOdmtjS3hiblhUa0tnWHY4VHpOZWpMYXArSk9FNytJWWtUbnNrdFFrK3h4?=
 =?utf-8?B?QkJrdkJ1OHd4Mit1cFpCbHFXaExHQVFIT3dlYkZZcXFVUGhEZ1ZsSFZTSEVI?=
 =?utf-8?B?Q0NnWjd4WGVBU1BhWnZlVk1QWFVtd1RTSXR0UHRqeXQzci9SQ3VQTlErSUtl?=
 =?utf-8?B?R0RYZjFOVWQ5b1l4MVNDVzRVSVdCd2VNNkNJeWtNajNQcSs4TkJSa3lZOFJ4?=
 =?utf-8?B?ZFRzaHVZWEFjRVBBbllWWmxOQjRuZEJKOXhTVnJWaU50Mzd0bWlrSDFYbDlx?=
 =?utf-8?B?am5Sc0lPcFRkbDVKWXRLZTlJYjN0NmU0TmZ4bkpyMFdUREh4V1krTjFRR3VO?=
 =?utf-8?B?RWRXR0FTM2lzaTU1Tzd1MzRTbnpHcHhaNjZRUTVxMlpFSzFGTEdnMVlDYjVD?=
 =?utf-8?B?c0I5Z2FtSGdkUnBidWk5UUdqNmZ0aGpvNGxNcVZiQkRJYStLVkVvaC9uUFZk?=
 =?utf-8?B?L2RRTHl4dnJtK21waG04TjlTZHk1a3ZieFU4RzEvQXU2WHBRdHdaOXAwbDcz?=
 =?utf-8?B?WFRzQTR3aGgrelVhMGplUWZJc1hiYTRpM21SOTlPMVF6cjBkNG5Dbit1dmFM?=
 =?utf-8?B?SGliNXZIYWpocFZvcVY4U2Q2SFNQeHZBU3lYc1NwR1R4eDVSWnVLeGh6ZEZs?=
 =?utf-8?B?ZnF2bWJDVXVFWXphTmNiMmlta3ptOWt1cHd0NEoxUWVMRVJNUWVmTk5qSFF5?=
 =?utf-8?B?MEw3eVJuQ3l4c3l0U0IvTE9pZUYwWi9Qd0dobmNFSjYyTkVCMDhjTm9JKzA4?=
 =?utf-8?B?SFhtSEJLRHh4NVFvNXE4ZkZpaVJ5b1pMNUkrZnJveDNzUGJkcGZWcHVjelY1?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0D324CD98095143914070E725B893AF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d0d4d3-b243-46d6-15ba-08dd4a61a7b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 06:02:24.2458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9AuZpb5toAva+rogJxFgj03qhWmbRuAPlziCleLEt9u0Z4rU2+on1qBPqvGzu4tlbSFwwC5nlrMP6NlA4ejXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7731

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE4OjAyICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEZyb206IENhbiBHdW8gPHF1aWNfY2FuZ0BxdWljaW5jLmNvbT4NCj4g
DQo+IEFkZCBhIHZvcCB0byBtYXAgVUZTIGhvc3QgY29udHJvbGxlciBjbG9jayBmcmVxdWVuY2ll
cyB0byB0aGUNCj4gY29ycmVzcG9uZGluZw0KPiBtYXhpbXVtIHN1cHBvcnRlZCBVRlMgaGlnaCBz
cGVlZCBnZWFyIHNwZWVkcy4gRHVyaW5nIGNsb2NrIHNjYWxpbmcsDQo+IHdlIGNhbg0KPiBtYXAg
dGhlIHRhcmdldCBjbG9jayBmcmVxdWVuY3ksIGRlbWFuZGVkIGJ5IGRldmZyZXEsIHRvIHRoZSBt
YXhpbXVtDQo+IHN1cHBvcnRlZCBnZWFyIHNwZWVkLCBzbyB0aGF0IGRldmZyZXEgY2FuIHNjYWxl
IHRoZSBnZWFyIHRvIHRoZQ0KPiBoaWdoZXN0DQo+IGdlYXIgc3BlZWQgc3VwcG9ydGVkIGF0IHRo
ZSB0YXJnZXQgY2xvY2sgZnJlcXVlbmN5LCBpbnN0ZWFkIG9mIGp1c3QNCj4gc2NhbGluZw0KPiB1
cC9kb3duIHRoZSBnZWFyIGJldHdlZW4gdGhlIG1pbiBhbmQgbWF4IGdlYXIgc3BlZWRzLg0KPiAN
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBaaXFpIENoZW4gPHF1aWNfemlxaWNoZW5AcXVpY2luYy5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFppcWkgQ2hlbiA8cXVpY196aXFpY2hlbkBxdWljaW5jLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPg0KPiBSZXZp
ZXdlZC1ieTogQmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJh
cnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPg0KPiBUZXN0ZWQtYnk6IE5laWwgQXJt
c3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiAtLS0NCj4gdjIgLT52MzoNCj4g
MS4gUmVtb3ZlIHRoZSBwYXJhbWV0ZXIgJ2dlYXInIGFuZCB1c2UgaXQgYXMgZnVuY3Rpb24gcmV0
dXJuIHJlc3VsdC4NCj4gMi4gQ2hhbmdlICJ2b3BzIiBpbnRvICJ2b3AiIGluIGNvbW1pdCBtZXNz
YWdlLg0KPiAtLS0NCj4gwqBkcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC1wcml2LmggfCA4ICsrKysr
KysrDQo+IMKgaW5jbHVkZS91ZnMvdWZzaGNkLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKysN
Cj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC1wcml2LmgNCj4gYi9kcml2ZXJzL3Vmcy9jb3JlL3Vm
c2hjZC1wcml2LmgNCj4gaW5kZXggMDU0OWI2NWY3MWVkLi40ZGEzZTY1YzY3MzUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLXByaXYuaA0KPiArKysgYi9kcml2ZXJzL3Vm
cy9jb3JlL3Vmc2hjZC1wcml2LmgNCj4gQEAgLTI3Nyw2ICsyNzcsMTQgQEAgc3RhdGljIGlubGlu
ZSBpbnQNCj4gdWZzaGNkX21jcV92b3BzX2NvbmZpZ19lc2koc3RydWN0IHVmc19oYmEgKmhiYSkN
Cj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiDCoH0NCj4gDQo+ICtzdGF0
aWMgaW5saW5lIGludCB1ZnNoY2Rfdm9wc19mcmVxX3RvX2dlYXJfc3BlZWQoc3RydWN0IHVmc19o
YmEgDQoNCkhpIFppcWksDQoNCkdlYXIgc3BlZWQgdHlwZSBpbiBzdHJ1Y3QgdWZzX3BhX2xheWVy
X2F0dHIgaXMgdTMyLg0KSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdW5pZnkgdGhlIHR5
cGUgaGVyZS4NCg0KDQoNCj4gKmhiYSwgdW5zaWduZWQgbG9uZyBmcmVxKQ0KPiArew0KPiArwqDC
oMKgwqDCoMKgIGlmIChoYmEtPnZvcHMgJiYgaGJhLT52b3BzLT5mcmVxX3RvX2dlYXJfc3BlZWQp
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBoYmEtPnZvcHMtPmZyZXFf
dG9fZ2Vhcl9zcGVlZChoYmEsIGZyZXEpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
T1BOT1RTVVBQOw0KPiArfQ0KPiArDQo+IMKgZXh0ZXJuIGNvbnN0IHN0cnVjdCB1ZnNfcG1fbHZs
X3N0YXRlcyB1ZnNfcG1fbHZsX3N0YXRlc1tdOw0KPiANCj4gwqAvKioNCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWZzL3Vmc2hjZC5oIGIvaW5jbHVkZS91ZnMvdWZzaGNkLmgNCj4gaW5kZXggZjUx
ZDQyNTY5NmU3Li5jZGI4NTNmNWI4NzEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWZzL3Vmc2hj
ZC5oDQo+ICsrKyBiL2luY2x1ZGUvdWZzL3Vmc2hjZC5oDQo+IEBAIC0zMzYsNiArMzM2LDcgQEAg
c3RydWN0IHVmc19wd3JfbW9kZV9pbmZvIHsNCj4gwqAgKiBAZ2V0X291dHN0YW5kaW5nX2Nxczog
Y2FsbGVkIHRvIGdldCBvdXRzdGFuZGluZyBjb21wbGV0aW9uIHF1ZXVlcw0KPiDCoCAqIEBjb25m
aWdfZXNpOiBjYWxsZWQgdG8gY29uZmlnIEV2ZW50IFNwZWNpZmljIEludGVycnVwdA0KPiDCoCAq
IEBjb25maWdfc2NzaV9kZXY6IGNhbGxlZCB0byBjb25maWd1cmUgU0NTSSBkZXZpY2UgcGFyYW1l
dGVycw0KPiArICogQGZyZXFfdG9fZ2Vhcl9zcGVlZDogY2FsbGVkIHRvIG1hcCBjbG9jayBmcmVx
dWVuY3kgdG8gdGhlIG1heA0KPiBzdXBwb3J0ZWQgZ2VhciBzcGVlZA0KPiDCoCAqLw0KPiDCoHN0
cnVjdCB1ZnNfaGJhX3ZhcmlhbnRfb3BzIHsNCj4gwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAq
bmFtZTsNCj4gQEAgLTM4Nyw2ICszODgsNyBAQCBzdHJ1Y3QgdWZzX2hiYV92YXJpYW50X29wcyB7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqb2Nxcyk7DQo+IMKgwqDCoMKg
wqDCoMKgIGludMKgwqDCoMKgICgqY29uZmlnX2VzaSkoc3RydWN0IHVmc19oYmEgKmhiYSk7DQo+
IMKgwqDCoMKgwqDCoMKgIHZvaWTCoMKgwqAgKCpjb25maWdfc2NzaV9kZXYpKHN0cnVjdCBzY3Np
X2RldmljZSAqc2Rldik7DQo+ICvCoMKgwqDCoMKgwqAgaW50ICgqZnJlcV90b19nZWFyX3NwZWVk
KShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCB1bnNpZ25lZCBsb25nDQo+IGZyZXEpOw0KPiANCg0KUGxl
YXNlIGtlZXAgdGhlIGluZGVudGF0aW9uIGNvbnNpc3RlbnQgdG9vLg0KDQpUaGFua3MNClBldGVy
DQoNCj4gwqB9Ow0KPiANCj4gwqAvKiBjbG9jayBnYXRpbmcgc3RhdGXCoCAqLw0KPiAtLQ0KPiAy
LjM0LjENCj4gDQoNCg==

