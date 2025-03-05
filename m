Return-Path: <linux-arm-msm+bounces-50298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A703A4F2C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 01:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AA85188E83D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597A619BBA;
	Wed,  5 Mar 2025 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qtu9llW0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z77cMTii";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SH81o4Vj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD415D1;
	Wed,  5 Mar 2025 00:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134750; cv=fail; b=IN55AkKgsQKV+1TusUnOGnxP3b4u2kCBP0h+7lB3+f/0cfFo9601VQen0jFPGetmukL1u0P+6d3FlFd5o6OENx3HXJlOuVh7a/WA7aEvMyBzPF4b4cPgqGyc9GIMJwsywALukx2mlCHZbh60spsjMyNR9eSfS4fW/5KLCO4bpPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134750; c=relaxed/simple;
	bh=M0OHbnyuhY6IrVK2lig9VHLmVRCHAM6cgnR2MDPjE6Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L2V5V/I6AYxJbvtCJ06NXT2VM7d5DGdXRe6sRp2HSkkpLUNrgXO5w3za0ULayMrwfCTTEfsqjWIKeYfVtllCP9DVzdpyoYHFca6Q6VRy/k7SsJI5QtdKp+GJmAECnL/JMkM8s4EGJpzsocx/7kt3yXnnomEeIOZbw11pnssBybY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qtu9llW0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Z77cMTii; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SH81o4Vj reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524I0gjW015122;
	Tue, 4 Mar 2025 16:31:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=M0OHbnyuhY6IrVK2lig9VHLmVRCHAM6cgnR2MDPjE6Y=; b=
	qtu9llW0TQvM5XcPPndhe9il7ijQjlyNX9LZAZJ4cvt70bw6GVSkOtBTVExqiyv/
	VFfR9OE7kbLXcR6ZmoIHRCvWVgk90pojmGnoGl38buH06RfmOJC0Gj8VmjNgmQqO
	GzQMUt02Q5IPv1Jn05aAgAZ9zJ3J6sLfVVMx9reG+RyCRJCFzdVBJnLQ69h7WBvr
	mG7BZCX8L9z9u8Q0xi+5BG4hazzZAfVBBc8DkQi90nEi1pwpYBrHj8rinVkHxobg
	evPwc0nGKK1mWaWsl4ei1sTS3jdEPQnW/qOvxcW4KfB5NwBRsHOSdi1VTmMKazNx
	Ego0unKYC2mC3zuG5taKHg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4542202knm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 16:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741134718; bh=M0OHbnyuhY6IrVK2lig9VHLmVRCHAM6cgnR2MDPjE6Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Z77cMTiiehiRBJljEYTgFt0LKyocwghyHyHd0CicG+VKzEquygE3cohQtdEKvyD1N
	 4r2yp6Gf5ZNUMUEz7EFZ1/z3KJXkaUfbHY83fIlCo02BmE9yvfsYEU83ld7xqvoVFq
	 FSpMGoBVUO1yzMneSqKTmQAnPrAXLQlGAlmXxNgJRTuUfoDtVqQEsS4YwnzR2JblMV
	 IQ+gbn/hOThOSQqMECusDnFbXyjbiGZgoE0K0t4P5Fn9jxhTB3RUtSGgltSqcf4bpz
	 0xyxBvjg0ZKtArfmjRxKp79o/LAOFKdGps8Ym/9vqmdkBXF/MdyTCrA/lvAOjxCeol
	 4U2+7NB9ChWKg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1BDD240453;
	Wed,  5 Mar 2025 00:31:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 26474A007B;
	Wed,  5 Mar 2025 00:31:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SH81o4Vj;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D58F040143;
	Wed,  5 Mar 2025 00:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wz8g/Fh11FH4n85WIg1Ox9MfSb2byXxKVgMtAVFrZE5VdowCxzacr4EOdc8v/Bwz+cd0qR89CFnxV2KTgoDTQ9/ry3VcJhiRX2zwD5vSUiADqJHkSLiqP7JX6RBpsWQsfFgRF1POYI1PrpsYyy3HGL6pwx0hlK/5OqrGKYeAsUVwNqnko94IMNMsLedoVln6GeOfhU37u8FXA3AALoajJUq2vJDrOAnC5t0O+HYJvnSl7oqJ/tsQpJbj9m7NPtfvS87QTZoOhGjaMWl+lT5BIY7fWIxZ5lD1Ubnwg6CRqjtCKVpHlYjWdhwblbTzZ0zcYC0TtT4lBlCTn/Ai57ggmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0OHbnyuhY6IrVK2lig9VHLmVRCHAM6cgnR2MDPjE6Y=;
 b=XMUIE5ezWd2O4SDpIogai6z46VP3PcQ0nJqHbDG+vBA1wH3LFj5pATSjTp/ft0sJJcvioy3gVOy98qvXRVlrjRyS7iVN0rdGR3IW2tDUU7nCCurj5JVpQGoWMaefLK9pc/RWFfmy4VfIq122wTEUB3l5lFyWyalTv0UGda0m9XOJakm364vt2o4/Xmb5EnlVL6T/SAyMFC4dQdURG8NeISw8tvqcD+GwnHOoxnBb5V2goib9ntBUgzQfKXFkfghyqkNhNEzDOV3XvNX6HpwN67iAcaEu5J1KulF06w6mCdhrgrAGntVJc+17Ewa9LqMcsaPrlGD845d7/2hqfJohsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0OHbnyuhY6IrVK2lig9VHLmVRCHAM6cgnR2MDPjE6Y=;
 b=SH81o4VjTIx7Tr0mzCG9x+j8o825x9hvVKeCUXlJeA4S4dM7nc2/31ohPmGC4XiPdxFpDLUICk0tN90KBdh0gX8T5PrusgBXcApzvKfYMnnrsFyIqTpkigkSWf4/ABTo/83JfkGNICscJoaGMfkQosnHOLV7lK+WDbrowH52Rsc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 00:31:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 00:31:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Topic: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Index: AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyAgAAJb4CAACsKAIABZTgA
Date: Wed, 5 Mar 2025 00:31:49 +0000
Message-ID: <20250305003148.mahxupphkaiizpbh@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
In-Reply-To: <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB6777:EE_
x-ms-office365-filtering-correlation-id: d4bf5596-9c05-4e2c-3889-08dd5b7d1e73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUZJclBxRHM5cHpLNWtmOUpFSHNzbis0SXNuU2V1YzhQbWZzTkN5eW84YUQw?=
 =?utf-8?B?REVQZTBESEFBU1FYdUZFRVJjb3BWSTNNRnAxbWJCVU4ybzN1Z2pERkltS05u?=
 =?utf-8?B?ZWxpR0NPNDMvUDRYNXgyMTVEZlpCQllwbWMrVkFUNXVNSWFmL1ZZVFNTNGUz?=
 =?utf-8?B?cVZJbDBrUkJWUFZlVDA1NllmcHVXcWFXVkZ5eVkwRFl6NXVSODdBeDExWm9y?=
 =?utf-8?B?ZWRzRFNaaHlwMWVRSzNsUTc0UEpCd3ZBZmFpbytVZjBUS01wU1J2ekJrT1By?=
 =?utf-8?B?amlLbFdPZ3k5ZmUvZkJJTSthNHlBb0pibko1M0lCRVJxNWRvTkJ3b0NtcXFj?=
 =?utf-8?B?MDRUbWZzdGs3V2F4clFuenB6MEFsSXRGQUZlV3VXb1d5a2NYeVNNQUkrVlly?=
 =?utf-8?B?YUZtbGxqdjNEN3JXTlZucm44bkdUd0pkZ2ZOVkJObWh3RzA3NWFUV0YyRm90?=
 =?utf-8?B?S0xMSjBCMGRqMzNiLzlkYS83aEo4ZlVMYk96dXcrTzMreDlmOWpoZ05xSGNM?=
 =?utf-8?B?WlFZbnh1RUt1cDdsS21CL0N4SEhoZC8ySGlZa3dKZXJXZFgvMGNHUTNDV01r?=
 =?utf-8?B?Z09zUFVBSDdrY1U3dFlIS1VmNTRUTWs5VzN5NkJqTEhoK0p6ZTZTTDJmU3hN?=
 =?utf-8?B?OTlJNGJReUlmUEk2cmptZUhHbWpmVU9DMFRtQytuQ1ViRUJHbllQTVVUSzh2?=
 =?utf-8?B?bjBBUUlkUTJHYWtPdUFkM3RJNytERWxhWlJvS0VoMFdlbVBIaTgwdkhIUUE5?=
 =?utf-8?B?dGxLQi9td3VQVHdYZU54bVA2ZFJmTkpvVDRwRkthbDVhWWliOTNrckpUZ2hq?=
 =?utf-8?B?N3ZmdkFmbkhVVkRWaDJxNy9IcnJVSlc0aG5vS1BwSVJYaEcxRGc4TkdHWWps?=
 =?utf-8?B?OGZlcWZEdGN2YlhmQVVHdXlBT0NSQ0dlSGljM1hhampmbTArN0N1UGUyN1Rl?=
 =?utf-8?B?ZDJSOWQ2T0dmSEZ1WXVMT0xUZGk0QzJ0T1lOK0hjYXJSd0FiWXpJSnNkUEl2?=
 =?utf-8?B?K01hbVEwVzllckxZbnJhU2RrOUpUUDhnM25aUmNTNlNmUlU4djl1VytyeUlJ?=
 =?utf-8?B?T3pueS9nb0R4aG4zSUNKMmttd3lDbHpCZDdxbVdpSU9Bbmk2Y2NvdUtNWmtW?=
 =?utf-8?B?dlBSeFVEMGlBYmhyVkFGSnptOFFVeWlqaWRYbXJqcTNXVUJBRUUyU0lNaEkz?=
 =?utf-8?B?VHM3NVQwaDdPSHM4U1NKNDhBRTJobXMvWE11aE1pWlVuTW5RTlpUVGpHaHZ4?=
 =?utf-8?B?ckx0MWVzYXhja1F3TFk2Z3JIR1VwS2tNeFhVM0xORjRqWFBycFAzcUpiNk1S?=
 =?utf-8?B?M1RZckM4clRvK3EwYmViWGg4RXA0WHRubTVFS29udG1xQWZSMDlBYjFPbUhX?=
 =?utf-8?B?TFVsY0dTUDY5OG9Dbk9mbktpLythTjlRWElNT3htSUkrd2FSTGtxMG5wK3gy?=
 =?utf-8?B?R2VLY3pFUlhYejgrazJBbzk0VlkzeXJ4ZkRwUk9MaExIRlVvNXFDeTdSK1oy?=
 =?utf-8?B?VEJZRjA2Zmo0akNYUC9LRnc3aFVqUHkrMEFVUFgrcXdZWWdRZ1RlS3lrQzhK?=
 =?utf-8?B?cFZNbXY1TXlxcmhYeXJFWnE1bU5MQStJS0Q0U0tVNWFGWUt2ZlVSQkJRd2l5?=
 =?utf-8?B?a3h4cXQ1eWhQdFJYUGdMUjJVUGtFYzdwK1ROQ1pzZ3NGSGlqdmdYbHNLTE1G?=
 =?utf-8?B?OE1sOVVodVdDeTgrdGw4Vm85MnZtRFhxZEVOaHBhaTBzRVJtaDdaRzFiM2cz?=
 =?utf-8?B?ckY0N1lPZml3TXdJbFAvN3JtN3BtTUNkOFNkT2lNTXJ3V2oyeVo3NGJOWVhV?=
 =?utf-8?B?TUozQ3I3RDN2RFBFQllLWWdaM2cwaWtMNEt0RGRNL24rYXJzdmlTbzdMajFW?=
 =?utf-8?B?akJzWnlKcUZWSTNuRlZPNUFxeWtVM1EzazdiWmtrZzNmaGRJYmNhUkdNOElE?=
 =?utf-8?Q?6CCteiCcD46ee/ytOyTzLe+aUqvJJuqp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlNOUFlwZXFmeGZLcjFwZzEzS3A4NDE0aWVvNlNjTnpOUGhIQ2tSN1QwcUpi?=
 =?utf-8?B?K0s2eUdud1dTRStFVmtRdlAvaXhMdzhROW8xZGw5ek9JNTgrOTJXdGc0aDBa?=
 =?utf-8?B?cE5zdjFKWnEwM3AzeEpvNXg5SldyMnpOeWlWVjlkb21EOFBFcEw3YVVLTENQ?=
 =?utf-8?B?WGFqMmhsSW1yU3VMRXZUbStLVTNjK05iRUNnUS9jV2dkSzNQQlJTMXBsa3RP?=
 =?utf-8?B?U0tYSG5MN2NkTjFhRG03bFBQdFN1WFd1R0xoQlhXSFhVSDFWcVdtSHNvdHB0?=
 =?utf-8?B?N3RoNkY1bDZOQzNPSVJoR0todUw1RVlHVnNxcHpOcWxjaVlSQ0l5R0dNcmFv?=
 =?utf-8?B?aGNZeTdPcjlxdkdZTEZzb0g1ZU9kbm9GYkoyUTU0djMzc3hFOTdtTjA2aHZ4?=
 =?utf-8?B?N252V2JKenViLzBNU1FudGxoOUpEKzBtMkhJQiszQk01NFlQczJBaVN2RTVq?=
 =?utf-8?B?Y2xzTzBPaFNtMXRiSTNqdlFoQ3pLNWJJdW8zVWYrbHc3Y3dqOE1qNnRaWlda?=
 =?utf-8?B?RWVTL01ZcVUreDFSNTI4RnFXek81akduOXptUVE4cEs4MGZReldOOFdidGFz?=
 =?utf-8?B?TXRwUWpPZnU3VEdGNGNJUE5WNnBaUFpUMTRTMmRyOGlWSWthL2hOTWtJb2lo?=
 =?utf-8?B?NGJHRTZ0OW1rYmFmVFhBWDhCUUZvaitrVmJqQzBFNHY3NHphWnlTSGltOWpr?=
 =?utf-8?B?QTIvK3phYW9lbm9QQWZiVlVIWFdxMnBnMWluTlNJQVhzY0xwSmNraWlsNkt2?=
 =?utf-8?B?U3B5cWVhR0R4SDI4WkpHTzc1U2xzUzcreWRtVHNwb0VscEJyNTUyR2VNdWNx?=
 =?utf-8?B?bGVuLzNvWW9wOUNPRlVtVElrTmE0SlltSGk4T1FpSXlhVjBHc3dJNFBZN2No?=
 =?utf-8?B?U2hobzZtcitBRG5BUjR2UFd3VkN6aWVLMlpCWjIvb3NCOTlvRkFSdnA2QVNp?=
 =?utf-8?B?VTF3bG0yVXJ3K3VoZzZlS3EzRlplK0ZsMDFNbGlhRG9BWVg1MTZPbWFhMGRP?=
 =?utf-8?B?bzdKQjQvdjN4bytVeTBlZVhjUlJWRmpzbHJlRUk0czdiTm81TElyWmxPSG8y?=
 =?utf-8?B?V3FrbE1DNkx6OG8zMHRiS0t0WG5Wa0MyazlwWTE3VStjUzRiVE5VaDJUSGpP?=
 =?utf-8?B?ZDY4TnhoUXNLZVFFeTJqNm9IdnJtWi9lZnFwT0FmT083UXlwcDBRYm9rVEpt?=
 =?utf-8?B?OTZkVy9zMEFORzczWUNRdnhDR3R5eUt6RFJwYnlrMDdIbWQvdlNndXBNNEVx?=
 =?utf-8?B?RkZnL1JrNDN0WWF6ZW9mc29LTkZSM1pHTjJ2ZG0rUTlFaXRLeWRZRUJKbkVC?=
 =?utf-8?B?TE5WOVBBQXF1eGJXbW5ZK1Vmc0lHZmg5RllJYXRmQ3ErazRKYkVKTXdmc0lt?=
 =?utf-8?B?WXFZQ2dMMjE4WkFvMUNlZmVwUXBjR1pnSVRKU055TEsxUGVtb1ZGNnBDeFdv?=
 =?utf-8?B?bzllc1BkN0l2dzd3T0JpRWF0bHM0ZzZ3QXlOWTVJM2pyWUNSWWFFTXp1SnYw?=
 =?utf-8?B?U3ZKLzgxeU5OTm5LMUU4L0kva1gyZ1dlMmtlS2xCMDB2MWhpZkhoZ0dkOUZM?=
 =?utf-8?B?RGZkSVRuSW5Ic1FZNmV4TWQ0TTZ6RGZab2pPd3BndUNCdkJZTzhSZWpGckg4?=
 =?utf-8?B?LzJyOVJ4QXZHVW1TMFE5NDREcDZTUkxPbWVDR3g4MUV5Rks0eGkwUk9EUlEy?=
 =?utf-8?B?WUgyNyt5VEFoRml5elVUM2FDT3RlZWF2SVNENGU2dG1pUTMwSUROcFpIdTFn?=
 =?utf-8?B?NmxYZWpwNTRyRSt0SzhwdTkvaEVNMDR1V0pDbTRrYXl3VHFkZnMycVUzZk45?=
 =?utf-8?B?aldwZDZudjhwWHZ0T2Z1dTFhZ0dMRTZWR09CN3IxbUxWVjRoTmtHL0hKSUJX?=
 =?utf-8?B?aDVpSUJnTFNsZEtFS1BaZUc3MlNaUGIwdWttTWpyeUZjZWpQL2lqRFJyQlJm?=
 =?utf-8?B?YVN3ZlhJRHBOMUIzMnRZRVRWNE5POW5qUHJyK2tmeFhJaWljZmlXcjhrTkp4?=
 =?utf-8?B?anpqNTZHRE0yc1g2RkRCTlQ1eXNFWGJUdFYvRDQ4ZW9wTEg3ZFdPa1FSNnFq?=
 =?utf-8?B?QmdSZVkrUjJuenRxS2tMS0tZNkdNZEZDdHVkL3E2SlplNmFaMEgvZ1JnZmZh?=
 =?utf-8?Q?atkHrv4TffzJ2tIYaSWM3v1Fb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1DBE72555D2FB4E880D433C4577C481@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	onwuVoAXJ+D8xWdcxhOQsSo9CH2Rng/1EflQtTebtvXiqQ7RN8G8k7h3G9WOYsXq93hYSQdFNu0mk/QWjmzqD0/ck+svoBhuZeAFe2cw4jj3Qts4lD19lDs3DmjavIKuORS0t9bx9AupSZtGewMoIV09YHLFPQ9MoJeS9rqge1KjS/xmo1tuiMCqvDmjxhEasD/FEDPGSWoSJCGrOZOONinEIvFxcsqExhlK6MmSGDYlA+OUlT/oL680F+/FLxY5fycXlGFmOkKjkm+jJPAxqKkzY5oAQwys/8msg3k6Gsz3lM5Yk8b2gndfZIPvsqDxQ4zEcs4cFbburFzu52MYxWyuG6MZ8xIZNzy/6JE2gO1kGL2ZR+zDUM4acrJql2IYuKWy39u8lnZdfn4sZ58k7GnX5mkRS1Bh7EUvKZQSjEWjdo3kk4loOCEyXRyqTC4swU+Uz1VT3xrSgKDgBWJ+pLf+Eb2IB0q6CGeDQYyO1ygpHpjFzBieFbWwi9NkKXxfd3DLjgCuV7u46C9FDVlKXrGaObkngvQ/lKiNcVVw4s8L5bEsCGIbHIrVH4zNOedzcezRK4/JRl9f03EUt0UpFJxwS12AcMYsrptkCdWsY8g/vvWp7wbrtkU/WJZrPhCozjPWkAKtufwxbiYWGdp9YQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bf5596-9c05-4e2c-3889-08dd5b7d1e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 00:31:49.6276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpsDeM8cgoaLa7vJX43uFZAtSDTIf0SsL0CxT86lfh5v5h463F7NDNuAL3hBO9yqUCiLXj2uSjHBhjsEZbHW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
X-Authority-Analysis: v=2.4 cv=DbvtqutW c=1 sm=1 tr=0 ts=67c79b7f cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=VF3AVOYoy5cc0D6IJUsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3nMjFL5KJy3HhUNoUHCYaxJp7jfQ75lr
X-Proofpoint-ORIG-GUID: 3nMjFL5KJy3HhUNoUHCYaxJp7jfQ75lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050002

T24gTW9uLCBNYXIgMDMsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gT24gVHVlLCBN
YXIgMDQsIDIwMjUgYXQgMTI6Mzk6MTJBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIFR1ZSwgTWFyIDA0LCAyMDI1LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBPbiBXZWQs
IEZlYiAyNiwgMjAyNSwgQmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPiA+ID4gPiBJbiBvcmRlciB0
byBtb3JlIHRpZ2h0bHkgaW50ZWdyYXRlIHRoZSBRdWFsY29tbSBnbHVlIGRyaXZlciB3aXRoIHRo
ZQ0KPiA+ID4gPiBkd2MzIGNvcmUgdGhlIGRyaXZlciBpcyByZWRlc2lnbmVkIHRvIGF2b2lkIHNw
bGl0dGluZyB0aGUgaW1wbGVtZW50YXRpb24NCj4gPiA+ID4gdXNpbmcgdGhlIGRyaXZlciBtb2Rl
bC4gQnV0IGR1ZSB0byB0aGUgc3Ryb25nIGNvdXBsaW5nIHRvIHRoZSBEZXZpY2V0cmVlDQo+ID4g
PiA+IGJpbmRpbmcgbmVlZHMgdG8gYmUgdXBkYXRlZCBhcyB3ZWxsLg0KPiA+ID4gPiANCj4gPiA+
ID4gVmFyaW91cyB3YXlzIHRvIHByb3ZpZGUgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aCBl
eGlzdGluZyBEZXZpY2V0cmVlDQo+ID4gPiA+IGJsb2JzIGhhcyBiZWVuIGV4cGxvcmVkLCBidXQg
bWlncmF0aW5nIHRoZSBEZXZpY2V0cmVlIGluZm9ybWF0aW9uDQo+ID4gPiA+IGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBiaW5kaW5nIGlzIG5vbi10cml2aWFsLg0KPiA+ID4gPiANCj4gPiA+
ID4gRm9yIHRoZSB2YXN0IG1ham9yaXR5IG9mIGJvYXJkcyBvdXQgdGhlcmUsIHRoZSBrZXJuZWwg
YW5kIERldmljZXRyZWUgYXJlDQo+ID4gPiA+IGdlbmVyYXRlZCBhbmQgaGFuZGxlZCB0b2dldGhl
ciwgd2hpY2ggaW4gcHJhY3RpY2UgbWVhbnMgdGhhdCBiYWNrd2FyZHMNCj4gPiA+ID4gY29tcGF0
aWJpbGl0eSBuZWVkcyB0byBiZSBtYW5hZ2VkIGFjcm9zcyBhYm91dCAxIGtlcm5lbCByZWxlYXNl
Lg0KPiA+ID4gPiANCj4gPiA+ID4gRm9yIHNvbWUgdGhvdWdoLCBzdWNoIGFzIHRoZSB2YXJpb3Vz
IFNuYXBkcmFnb24gbGFwdG9wcywgdGhlIERldmljZXRyZWUNCj4gPiA+ID4gYmxvYnMgbGl2ZSBh
IGxpZmUgc2VwYXJhdGUgb2YgdGhlIGtlcm5lbC4gSW4gZWFjaCBvbmUgb2YgdGhlc2UsIHdpdGgg
dGhlDQo+ID4gPiA+IGNvbnRpbnVlZCBleHRlbnNpb24gb2YgbmV3IGZlYXR1cmVzLCBpdCdzIHJl
Y29tbWVuZGVkIHRoYXQgdXNlcnMgd291bGQNCj4gPiA+ID4gdXBncmFkZSB0aGVpciBEZXZpY2V0
cmVlIHNvbWV3aGF0IGZyZXF1ZW50bHkuDQo+ID4gPiA+IA0KPiA+ID4gPiBXaXRoIHRoaXMgaW4g
bWluZCwgc2ltcGx5IGNhcnJ5aW5nIGEgc25hcHNob3QvY29weSBvZiB0aGUgY3VycmVudCBkcml2
ZXINCj4gPiA+ID4gaXMgc2ltcGxlciB0aGFuIGNyZWF0aW5nIGFuZCBtYWludGFpbmluZyB0aGUg
bWlncmF0aW9uIGNvZGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgZHJpdmVyIGlzIGtlcHQgdW5k
ZXIgdGhlIHNhbWUgS2NvbmZpZyBvcHRpb24sIHRvIGVuc3VyZSB0aGF0IExpbnV4DQo+ID4gPiA+
IGRpc3RyaWJ1dGlvbnMgZG9lc24ndCBkcm9wIFVTQiBzdXBwb3J0IG9uIHRoZXNlIHBsYXRmb3Jt
cy4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBkcml2ZXIsIHdoaWNoIGlzIGdvaW5nIHRvIGJlIHJl
ZmFjdG9yZWQgdG8gaGFuZGxlIHRoZSBuZXdseQ0KPiA+ID4gPiBpbnRyb2R1Y2VkIHFjb20sc25w
cy1kd2MzIGNvbXBhdGlibGUsIGlzIHVwZGF0ZWQgdG8gdGVtcG9yYXJpbHkgbm90DQo+ID4gPiA+
IG1hdGNoIGFnYWluc3QgYW55IGNvbXBhdGlibGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGRy
aXZlciBzaG91bGQgYmUgcmVtb3ZlZCBhZnRlciAyIExUUyByZWxlYXNlcy4NCj4gPiA+ID4gDQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQG9z
cy5xdWFsY29tbS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy91c2IvZHdjMy9N
YWtlZmlsZSAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gPiAgZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXFjb20tbGVnYWN5LmMgfCA5MzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jICAgICAgICB8ICAgMSAtDQo+
ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDkzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIGEgYml0IGNvbmNlcm5pbmcgaWYgdGhl
cmUncyBubyBtYXRjaGluZyBjb21wYXRpYmxlIHN0cmluZy4gaWUuDQo+ID4gPiB3ZSBkb24ndCBo
YXZlIHVzZXIgZm9yIHRoZSBuZXcgZHJpdmVyIHdpdGhvdXQgZG93bnN0cmVhbSBkZXBlbmRlbmNp
ZXMNCj4gPiA+IChvciBzb21lIHdvcmthcm91bmQgaW4gdGhlIGRyaXZlciBiaW5kaW5nKS4NCj4g
PiANCj4gPiBJZ25vcmUgdGhlIGNvbW1lbnQgYWJvdmUsIEkgbWlzc2VkIHRoZSAidGVtcG9yYXJp
bHkiIGluIHlvdXIgbG9nDQo+ID4gYWJvdmUuIEhvd2V2ZXIsIHRoZSBjb21tZW50IGJlbG93IHN0
aWxsIHN0YW5kcy4NCj4gPiANCj4gPiA+IA0KPiA+ID4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBp
bnRlbnRpb24sIEknbSBhZnJhaWQgd2UgbWF5IGhhdmUgdG8gc3VwcG9ydCBhbmQNCj4gPiA+IG1h
aW50YWluIHRoaXMgbXVjaCBsb25nZXIgdGhhbiB0aGUgcHJvcG9zZWQgMiBMVFMgcmVsZWFzZXMg
KGFzIHNlZW4gd2l0aA0KPiA+ID4gYW55dGhpbmcgdGFnZ2VkIHdpdGggImxlZ2FjeSIgaW4gdGhl
IHVwc3RyZWFtIGtlcm5lbCkuDQo+IA0KPiBUaGVyZSBhcmUgbm8gcHJvZHVjdHMgc2hpcHBpbmcg
dG9kYXkgdXNpbmcgZHdjMy1xY29tIHdoZXJlIERldmljZXRyZWUgaXMNCj4gY29uc2lkZXJlZCBm
aXJtd2FyZS4gVGhlIHByaW1hcnkgYXVkaWVuY2UgZm9yIGEgbG9uZ2VyIHRyYW5zaXRpb24gaXMN
Cj4gdXNlcnMgb2YgdGhlIHZhcmlvdXMgbGFwdG9wcyB3aXRoIFF1YWxjb21tLWNoaXAgaW4gdGhl
bS4gQnV0IGdpdmVuIHRoZQ0KPiByYXBpZCBkZXZlbG9wbWVudCBpbiBhIHZhcmlldHkgb2YgZnVu
Y3Rpb25hbCBhcmVhcywgdGhlc2UgdXNlcnMgd2lsbCBiZQ0KPiBoaWdobHkgY29tcGVsbGVkIHRv
IHVwZGF0ZSB0aGVpciBEVEJzIHdpdGhpbiAyIHllYXJzLg0KPiANCj4gVGhlIG90aGVyIG9idmlv
dXMgdXNlciBncm91cCBpcyB0byBtYWtlIHN1cmUgdXMgdXBzdHJlYW0gZGV2ZWxvcGVycw0KPiBk
b24ndCBsb29zZSBVU0Igd2hlbiB0aGluZ3MgZ2V0IG91dCBvZiBzeW5jLg0KPiANCj4gDQo+IFRo
YXQgc2FpZCwgaWYgdGhlIG1vZGVsIGRlZmluZWQgaGVyZSBpcyB0byBiZSBmb2xsb3dlZCBpbiBv
dGhlciBjYXNlcw0KPiAob3IgbXkgb3RoZXIgdmVuZG9ycykgd2hlcmUgRGV2aWNldHJlZSBpcyB0
cmVhdGVkIGFzIGZpcm13YXJlLCB5b3VyDQo+IGNvbmNlcm5zIGFyZSB2YWxpZCAtIGFuZCBpdCBt
aWdodCBiZSB3b3J0aCB0YWtpbmcgdGhlIGNvc3Qgb2YgbWFuYWdpbmcNCj4gdGhlIGxpdmUtbWln
cmF0aW9uIGNvZGUuDQo+IA0KPiA+ID4gSWYgcG9zc2libGUsIEknZA0KPiA+ID4gcHJlZmVyIHRo
ZSBjb21wbGljYXRpb25zIG9mIG1haW50ZW5hbmNlIG9mIHRoZSBtaWdyYXRpb24gY29kZSBiZSBo
YW5kbGVkDQo+ID4gPiBkb3duc3RyZWFtLg0KPiA+ID4gDQo+IA0KPiBJJ20gc29ycnksIGJ1dCBo
ZXJlIGl0IHNvdW5kcyBsaWtlIHlvdSdyZSBzYXlpbmcgdGhhdCB5b3UgZG9uJ3Qgd2FudCBhbnkN
Cj4gbWlncmF0aW9uIGNvZGUgdXBzdHJlYW0gYXQgYWxsPyBUaGlzIGlzIG5vdCBwb3NzaWJsZSwg
YXMgdGhpcyB3aWxsIGJyZWFrDQo+IFVTQiBmb3IgZGV2ZWxvcGVycyBhbmQgdXNlcnMgc2hvcnQg
dGVybS4gV2UgY2FuIG9mIGNvdXJzZSBkaXNjdXNzIHRoZSAyDQo+IExUUyB0aG91Z2gsIGlmIHlv
dSB3YW50IGEgc2hvcnRlciBsaWZlIHNwYW4gZm9yIHRoaXMgbWlncmF0aW9uLg0KPiANCg0KTXkg
Zmlyc3QgY29uY2VybiBpcyBub3cgd2UgaGF2ZSBhIGxlZ2FjeSBkcml2ZXIgdGhhdCBzaG91bGQg
bm90IGJlDQpjb250aW51ZWQgdG8gYmUgZGV2ZWxvcGVkIHdoaWxlIHdlIGFsc28gbmVlZCB0byBh
ZGRyZXNzIGFueQ0KcmVncmVzc2lvbi9maXhlcyBmb3VuZCBpbiB0aGUgZnV0dXJlIGZyb20gdGhl
IGxlZ2FjeSBkcml2ZXIuIFdoaWxlIEkNCndvdWxkIGVuY291cmFnZSB1c2VycyB0byBzdGFydCBt
aWdyYXRpbmcgdG8gdGhlIG5ldyBkcml2ZXIsIEkgd29uJ3QNCnJlamVjdCBmaXhlcyB0byB0aGUg
bGVnYWN5IGRyaXZlciBlaXRoZXIuIEluIHRoZSBuZXh0IDIgeWVhcnMrLCBteQ0Kb3RoZXIgY29u
Y2VybiBpcyB0aGF0IEknbSBub3QgY29uZmlkZW50IHRoYXQgd2UgY2FuIGVhc2lseSByZW1vdmUg
dGhlDQpsZWdhY3kgZHJpdmVyIGFuZCB0aGUgRFRTIHRoZW4uDQoNCkNvZGUgY2FuIGJyZWFrLCBh
bmQgdGhhdCdzIG5vdCB1bmV4cGVjdGVkLiBJZiAyIExUUyByZWxlYXNlcyBsYXRlciBhbmQNCndl
IHJlbW92ZSB0aGUgZHdjMy1xY29tLWxlZ2FjeSwgdGhpbmdzIGNhbiBicmVhayB0aGVuIHRvby4g
VGhpcyBtYXkganVzdA0KYXMgYmUgcGFpbmZ1bCBpZiB3ZSBuZWVkIGZpeGVzIHRvIHRoZSBsZWdh
Y3kgZHJpdmVyIGR1ZSB0byBzb21lIHByZXZpb3VzDQpyZWdyZXNzaW9uLiBBbHNvLCBJJ20gc3Vy
ZSB5b3VyIHRlYW0gZGlkIGEgZmFpciBzaGFyZSBvZiB0ZXN0aW5nIHRoZSBuZXcNCmRyaXZlciBy
aWdodD8gSXMgdGhlcmUgc29tZSBtYWpvciBjb25jZXJuIGluIHRoZSBuZXcgZHJpdmVyIHRoYXQg
d2UNCmhhdmVuJ3QgYWRkcmVzc2VkPw0KDQo+IA0KPiBJbiBteSB2aWV3LCBzZXR0aW5nIGEgZmxh
ZyBkYXRlIHdoZW4gdGhlIGR3YzMtcWNvbS1sZWdhY3kuYyB3aWxsIGJlDQo+IHJlbW92ZWQgd2ls
bCBwcm92aWRlIHVwc3RyZWFtIHVzZXJzIGEgdHJhbnNpdGlvbiBwZXJpb2QsIGF0IGEgdmVyeSBs
b3cNCj4gYWRkaXRpb25hbCBjb3N0ICg5MzQgbGluZXMgb2YgYWxyZWFkeSB0ZXN0ZWQgY29kZSku
IElmIHNvbWVvbmUNCj4gZG93bnN0cmVhbSBhZnRlciB0aGF0IGZsYWcgZGF0ZSB3YW50cyB0byBy
ZXRhaW4gc3VwcG9ydCBmb3IgcWNvbSxkd2MzDQo+IHRoZXkgY2FuIGp1c3QgcmV2ZXJ0IHRoZSBy
ZW1vdmFsIG9mIGR3YzMtcWNvbS1sZWdhY3kuYy4NCg0KVGhlIHNhbWUgY2FuIGJlIHNhaWQgdGhh
dCB0aGV5IGNhbiByZXZlcnQgdGhlIHVwZGF0ZSAob3IgYXBwbHkgZml4ZXMpDQpzaG91bGQgdGhl
eSBmb3VuZCBpc3N1ZSB3aXRoIHRoZSBuZXcgY2hhbmdlLg0KDQo+IA0KPiBUaGUgYWx0ZXJuYXRp
dmUgaXMgdGhhdCBJIHRyeSB0byBnZXQgdGhlIG1pZ3JhdGlvbiBjb2RlIHN1Z2dlc3RlZCBpbiB2
Mw0KPiB0byBhIHN0YXRlIHdoZXJlIGl0IGNhbiBiZSBtZXJnZWQgKHJpZ2h0IG5vdyBpdCdzIDZ4
IGxhcmdlcikgYW5kIHRoZW4NCj4ga2VlcCBpbnZlc3RpbmcgaW5kZWZpbml0ZWx5IGluIG1ha2lu
ZyBzdXJlIGl0J3Mgbm90IGJpdC1yb3R0aW5nDQo+IChhbHRob3VnaCBSb2IgSGVycmluZyBkaWQg
cmVxdWVzdCBhIGZsYWcgZGF0ZSBvZiB0aGUgbWlncmF0aW9uIGNvZGUgaW4NCj4gdjMgYXMgd2Vs
bC4uLikuDQo+IA0KDQpBbGwgdGhhdCBzYWlkLCBpZiB5b3UgYmVsaWV2ZSB0aGF0IHRoaXMgdHJh
bnNpdGlvbiB3aWxsIGJlIHF1aXRlDQpkaXNydXB0aXZlIHdpdGhvdXQgcHJlc2VydmluZyB0aGUg
bGVnYWN5IGRyaXZlci9kdHMsIHRoZW4gd2Ugd2lsbCBkbyBzby4NCg0KQ2FuIEkgcmVxdWVzdCB0
aGF0IHlvdSBtYWtlIHRoaXMgc25hcHNob3QgYXMgb25lIG9mIHRoZSBmaXJzdCBwYXRjaGVzIGlu
DQp0aGUgc2VyaWVzIHNvIHJldmVydHMvZ2l0LWJsYW1lcyBjYW4gZWFzaWx5IGJlIHRyYWNlZD8N
Cg0KQlIsDQpUaGluaA0KDQpTaWRlIHF1ZXN0aW9uOiBmb3IgU25hcGRyYWdvbiBsYXB0b3BzLCB3
aXRob3V0IHRoZSBjb3JyZXNwb25kaW5nIGtlcm5lbA0KYW5kIERUUyB1cGRhdGVzLCBkb24ndCB0
aGluZ3MgYnJlYWsgZWFzaWx5Pw==

