Return-Path: <linux-arm-msm+bounces-28567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6883952613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 01:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE295B2179D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 23:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74859149C64;
	Wed, 14 Aug 2024 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Zv/x/ahc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kjlgclR4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TTEH8s1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DA13C820;
	Wed, 14 Aug 2024 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723676739; cv=fail; b=d+bOaxq2GRSD+976xP8em/qxbUcMeLrHejuW07M5gAoBs0uyu0BHJcO6dJN6PMzxJSYN8O/h2cDR/CMZ35+cYg/X5s5uxmJUoKGxM6K8Oun2M5otr1knzI+j8EEyCBSLg2Rs58Zp9NNKYYLYdYJbiv7iHU+mAdOcOrr3ZHsxi8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723676739; c=relaxed/simple;
	bh=FPFjY7ORFmt5IUnBz+755J6/seAsf4u9KP+L4gRQrqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mTiNKgT/sGlKHUQcWU31CNEymY9P5K7/FGDEuCRpwTAeD3jBFi8nDEoGMND7Ld8K9eS32ifdu0SccoBn7ywYQd6liUhy3gW8Nepeh+iSi/adTpXKgxrhJLAZN6KAV9O1p5Vvqui2smVygGRis9frArstbQuV2O5+d7WuRsXbgxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Zv/x/ahc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kjlgclR4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TTEH8s1c reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EHxurJ015952;
	Wed, 14 Aug 2024 16:05:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FPFjY7ORFmt5IUnBz+755J6/seAsf4u9KP+L4gRQrqk=; b=
	Zv/x/ahcunETHbvrIo+ajBqzy0m37FkrayEneYfS4Ld6hEO6oOSQYQIG3kLpQ/3D
	OPH3b+xVigTluTAYaw5aZzKgNF+CJjoMDP8XZ1PrRRcjGB3V+uDe5Tp0a2QI+jgK
	kcArlEOcOznKoB6CZPIXtnAYt/hV5F2LsSKYr63tgDCbD8fVw+eLpnUstGg5D774
	tCRXCYaPaQ9eoVgzUVMP2tIuApvc45H8ENJUD7CkTYb3HyQnuI2zYPCEfFSTkaU2
	t/L2Rbw3mmOVaH/8nWJLntAdRczwCxdnG1quqZgKEmnr7jiopbuJDglXTh8m6iuZ
	8BjCWrEDPzFgvNMLXLv7DQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4111fhh32d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723676732; bh=FPFjY7ORFmt5IUnBz+755J6/seAsf4u9KP+L4gRQrqk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kjlgclR4L+YOyZs2w+gPgqD7C+O8ePIzT4wcur9vd0uIi/J7Xz/DyL5mmMIZWCJ7r
	 IJun5MksTBvRIzAKb6HhDkFvF++47SL5WQb++QiyL844OQ9Y3MuK8zAD2ippkQ+cYO
	 W0Tex9hw5bYoSioclw5Gev6TKQ5XJapOmhYDGYLcQS2YaVLmeVHNcEdcP9ZS/TGktm
	 63uGf7Si3av+Bybm+DvE9FP5UaZY8fxqCFeKUpUe+80NIFVqWBgT+imHK6YmZljSsP
	 OokmuokvUHASKRBr+SlcW56oeCWLsD1OW1UZcl2hRJ1kulwQ5903JC18bGxTkd29bq
	 Ugz1kDgJVl8ww==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0098440467;
	Wed, 14 Aug 2024 23:05:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A674CA009D;
	Wed, 14 Aug 2024 23:05:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TTEH8s1c;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8B199404AC;
	Wed, 14 Aug 2024 23:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfeytrJDq6wW4J6I4pgMYMUSglMLlmYdBCFwuKGejW7XsJJ7yhW2p2/6U6Iuc1s+rCtWohHu4Puz+ChyBonRlDtsv80esyz6lQ2gQUbKkooByqasLJB776Q6vP3e7wvDNWvm+9sbOgcIVdDbSR0TCm/zLW98uXvUsrhlU/vHckrqDdPYGawep0+nZKjIHoxe9PpMcEO9nu95+FudOTfNuMW7Jwu2pw3XXeCROwe7eoziozZOQYNSuO8WvjSF9q/Gp0o5POIAZoSe8YObCfwDzCO1dyvC3tnAoUYMi0LTwcAk2JYPw+QIKEYam39C23fK8l6Sz/J+cFJPcFYyicbeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPFjY7ORFmt5IUnBz+755J6/seAsf4u9KP+L4gRQrqk=;
 b=Il7NRz5QIRf25otSPmjDBjbnsVsoo42uzGglW0D863GOUR7aC9FKEJFyDLz7YFPjnF4R6koPGCVT2/53AQP1ZqGLPzp4BIGe1DwKqGDLFFn7rRTFcL0w21nbIdLVO0yTwhyPDPCRhD6iHsedOkOxi+uIH7rfedEBIQQNQ4wML8o5LEq52+IsSMwEnDoXHWL9qoLEtf127pakNOI/8S/QA4VtGaEYn2U2qawDd0U6OJvjwKkvT9UGRx55jzocOE7laT8lDOlACXquvSGZilI8fT3DZV4hRZZgY4+aHLmVcXNoDxkmi88+dzTdmTt1e0oMbewZ3d+eQa55eXgwtypJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPFjY7ORFmt5IUnBz+755J6/seAsf4u9KP+L4gRQrqk=;
 b=TTEH8s1coXeq1oFZ0pMBDTpQsHFrPlR5rZKdH3v4GjQjs/0aryy6X8HvR5LaiEba7NxGaZdsZ2zAfHTJlGMpsie1NaoCzKHAlyGd8HQEIlKYh5uHdcCURgP4EcNHCVAfvDK5Muhek5pja4h4e8hrNquD3XlbUS04e9phNRUJDT4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 23:05:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 23:05:26 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Faisal Hassan <quic_faisalh@quicinc.com>
CC: Prashanth K <quic_prashk@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Thread-Topic: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Thread-Index: AQHa7XKiyJackif7S0av8/ScMK7yh7Il49iAgABYrQCAAF41AIAAxzuA
Date: Wed, 14 Aug 2024 23:05:26 +0000
Message-ID: <20240814230517.3xgjcobp4kg7isdw@synopsys.com>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <20240814001739.ml6czxo6ok67pihz@synopsys.com>
 <ec3a918a-df09-9245-318e-422f517ccf68@quicinc.com>
 <48651728-a4bb-4bef-81d7-6100a6c2a1fe@quicinc.com>
In-Reply-To: <48651728-a4bb-4bef-81d7-6100a6c2a1fe@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6035:EE_
x-ms-office365-filtering-correlation-id: 3d3c6f47-cef3-45ab-c10e-08dcbcb59586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXdqL09UTDhuMkg0cHZaOHduUkw1YURKREl4a0J6eWlsektSMWdyK09Wbndl?=
 =?utf-8?B?dWxScjZhVUU2cVhhS1RHY1ZHNUxZdTZBOUJ1TWYzWDVFWk96UVU1R0U5RTU3?=
 =?utf-8?B?V2RucVR3d2ZCMllac2tYR3Q4L1Y2RjdGSGd3VDFWeXYvZ2cyOXVleUtCc2c0?=
 =?utf-8?B?U0l2bWo4Z1JycmJ5U2MyZzJ1dEZXek9xU3RwYUNsK3ZwUG13K25zVS9LLzlo?=
 =?utf-8?B?Y200aFRkTWFyejRzQTZGSUQ1WitHUUhieGpaRndoaVBiWE9WMmJHem9DOUwv?=
 =?utf-8?B?dVk1aWY2NTdrS1BSVjRBelhYbElOOW9Ha0MxWjF1eWNRR29UVndyRGNsMm1B?=
 =?utf-8?B?d1VWVDBWbzZYSmVYTVd5S3VrbTg2c3VhQ0lVby9XRW5FRjVXSVJCMjllbjIy?=
 =?utf-8?B?a0F2UkxHTDJKVmkyaE1VL3FmdnRPbjNPM0FIOHc0dGNjUUNPZHoyQ1hoOXNM?=
 =?utf-8?B?ZXI5L2RMeUtFcjloaHMrelB0RVlVN25FNHVSV1RveVUxYURjb0dXZlFobjh5?=
 =?utf-8?B?ckNEN3Z5RHBaTG84emxTY1JuNjNyL2xsZmVMSFVNVm5DTVkxMlVwYkc2YVhq?=
 =?utf-8?B?aUF3S29KUFUzS2RMaGdWZDBVRnd5NDVWdFduVWI4VjNab1k3aGNZTGxiK21I?=
 =?utf-8?B?SjJyWGM5bGZ4UGp1RE1UdEFTNmJXRk9lOGlHeTZRTVZjZitoRmU1LzNQbUZj?=
 =?utf-8?B?d1hrTTJ1RUVJMlY3Qi9hQUVUWmJqV09Td1NzNWRteW5sRGE1R29kbmhxQ3ZI?=
 =?utf-8?B?a2xrWGloQ0V4bnN2dEJoTEVqcWt5SGhHWEVab0llckRxTnpkSDdwNDNZNWxw?=
 =?utf-8?B?cC9LZUUxcE45enp5K3BTekNFanpSMytPTFJjVS9IWkM0WlhHelNscjJ0WVEx?=
 =?utf-8?B?eFVNMDE2cWpjaEN6N1lUaWN4RmdaSHMwTEphZGI2aG9Xd2w3c1Uvd2YwUXV1?=
 =?utf-8?B?d3kwWXNVTWNuei9CdXRvWHhTeWZaaGVsVC9VV3h0bFM3WUplOTVacHBONUN4?=
 =?utf-8?B?Z1Z6RnVjWWpPelBscGJqNzk2Q0JvSzR1Y29GTnNQVGdMWHQ4OWZqYWZaZ3pS?=
 =?utf-8?B?SGQ3ZHlsWGlxdG4wTGp4dHhyQVRRYzJ0Mi9STTlwS3JuQ0xDdXZkNjFwK1o5?=
 =?utf-8?B?NXF2b3k2eCtXSUpSSEd6YUhpczFoNzc5Rk5HVGdpdFlTUjRLRmluUERzSjhH?=
 =?utf-8?B?aVVtMDFTTFNKZDZ2TUtLZkRJbStKblFqNjlpMk1RQWR3bHFvamxkN3RnQVVF?=
 =?utf-8?B?L3cvU0JvcVd3amhUT1M2dTIrQUlwQWZBaUpzWkV3alpQckNqczAxeXpZSnpy?=
 =?utf-8?B?MU83UzJIMlk2RVVaS2QvTmhsM0ZIZC9hemNzQkVmN3pHUlVMOGRBeEJ4dEFL?=
 =?utf-8?B?Q0ptSWlmMnM0dUdVMmxCaXdBNC9oRVRmMC9GTWxWV04zRGp6aERBY3Z1WmNB?=
 =?utf-8?B?UHd0NzBPb3ZCdkxXOHZ3RFlxcmRuUFRxV3REREk0N0VVQSs4bmlLOW9tMDRQ?=
 =?utf-8?B?NXdGOTFEclJFVFdESWc1NmdmazdCQkYydkF5dEpJTWcrVHU3b2UydWNObVRa?=
 =?utf-8?B?bmx4Z0N3T2RRR3UrRmRGOFM1QXljWi9meURmTW54MnhDRWx2UUN2b1hIcERy?=
 =?utf-8?B?SzBUN2owRVpkUlFiNzVvSFc0VjBNRzE1TTdLY3NqYWt1NXhHcHI2aVpGN0hB?=
 =?utf-8?B?d0FBSllUL3d6eHlBSlU0QTh4WkgzeWlobFRiZEdNQkpQcGVHUlhsSVJmQkFx?=
 =?utf-8?B?M3pndlNMQjFJSnB0bzM0a3NXclRZREhVeVI1U1lhMjlPSDF0ZUNJZ21EQmN4?=
 =?utf-8?B?UVFVYi9zRXFMT0MyQkxxdXRqc2YvY0F5ZkpYTXdrZHZWWFhXeW9raUJTNWYr?=
 =?utf-8?B?RklFWGRZUzB4VVQ2ZmdmeGNwRVVmZldqVzVKKzFMcG02Vnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SlA2WGFGN2txbEpOcFhlMGgrQmhVQTdRaGJSdVEvWHBNUDVFQzRFUkNwOWVP?=
 =?utf-8?B?d3R1NktnMUJvQlJ1Y2NiM0Q1WjhwUVVYUTN5NStHM0drYXR2K1FBd2dUL0RK?=
 =?utf-8?B?endyM3p6UmhPMTRjem1aOEZVeW1jd1BrMmRab2J6MmJOdCtrckRVbTRlakZC?=
 =?utf-8?B?SzNFK1NoRHk1dWZaTGNhS09nekcySnIzMHBmVGs4VjlCTFlyS1duOVRaOXJF?=
 =?utf-8?B?NSt2WVVGeGhaK2hwN2ZoalMvb3NpeXZqRmN5NlNqZnNSbndBbldQSmMzRFhj?=
 =?utf-8?B?QytKWDJBZWhxRis4VTlSUHR4NnVRWnE1S3RjVm5jQ0ZCZU4xL20yTmxvRGtB?=
 =?utf-8?B?NXdNTXUvTnduNlRJVTBMODl5bG1ZMkVWeDdTeHJhQW1KMUxFYTFqbG1aN3Q3?=
 =?utf-8?B?VGYvOE9Zc1luekVMa0VJOURpaTJVdXk4TEtrSSswVnJsaEoydWhReHIvMEkr?=
 =?utf-8?B?RjdvVnpqZ3h0YnJjQ1RrSWlKdGZvLzE5NzFTZXZpcW96bjNRTTNxK3ZyNE81?=
 =?utf-8?B?Yy95YzA3UGNtNFprNEVBYVZJUlNHOThURHE2S0REbW1GbG9qZzlKNDFaOWh0?=
 =?utf-8?B?SktsYmpYT0VkckNPNU9KM2xDTHRqY3pwTlFDb1h5TjQremU0NWFIR3FnL1Jw?=
 =?utf-8?B?N3M4ZlBlMjJOSWg5SEtCWFFhVmNncXF5SzRDQ0gybTFHVDRJLzNaLy9DaWhy?=
 =?utf-8?B?SjMzbUdWa2ZpSjhqeGJhUTZZWnZEWm93ZFVoWlQ1c1hHdU1jOXFsblJiMmtu?=
 =?utf-8?B?NGd1bHJ3R1VISkh1dUYrdXRLN1pORU5SY1p1NG1HUkRLbUxYLzd4Mi85N0ov?=
 =?utf-8?B?akdiRU1nN1B3c3NVS1dqSzFuQlE4c0tuTGU1bHA3dFYvaE5EeEs3WGs2MmNk?=
 =?utf-8?B?VVJGNkgxdUlXMG9xS09tYlRYWEZEODh3ckltNDltL2t2QVpvNE5UeFVmSEVm?=
 =?utf-8?B?bjlQYnVRKzZMWHJOeUxYVGhXRjJRZFpwcldpOXh5WS9sY2ZJSDBPRlZMVGdP?=
 =?utf-8?B?WGRRbEYrckU2VDlVQ0xGdmFRdUNYZDI2UkZ0SjlIM0QxTTZOd0pwWnlCVzZi?=
 =?utf-8?B?MjhwZkFFdFUxeWRSN1RDZzVPR2tRa0JRZTE4VEV2T2dzUEI2SlIrUk0zSDA0?=
 =?utf-8?B?RXBTblFVWWNPVmk5NGZpU0Z3ZUNJV2hVV2t3ekE1K08yNGRCUVJYeEFSMm9Z?=
 =?utf-8?B?aVVVbmpLdkRiVDQyc0FVOExXSjdKTHYvYTJuZmdVV0Uwb2t5Q3p4Rk96U251?=
 =?utf-8?B?YlBXYlJ5Z0NaYVFsc0k1cWV0T1AyS3JlL01pSDI2NW8zR1JMYm5kVEZEQ28z?=
 =?utf-8?B?bXB1QW55VlkvZTcvbkZHcG1HY2c4VDdhQ3ZqMkhFQWljZlRmNlpuclY4akIz?=
 =?utf-8?B?YXpyRnVJTGpJNFRSemdQdFJsdzd4RDkwV0llcDZRK0RiblAwRHk4N3ByTWRJ?=
 =?utf-8?B?bXFuOHZ4SHhlS2wyMWFhRnpzR3BWZUZRdXZwU1NwSjhVQWF0aHF6R0xiOU9B?=
 =?utf-8?B?QlNzQUxZU1NuelpJeDMvMEo5dmkrdk9CL2xTNmdQU29ORmJWYjJWUU9rZ2lJ?=
 =?utf-8?B?Yk11bVNPQ0E5cmV6Z21tOUtDb29rWjlLT1ZBWFhJV045aGw2emNTaDB2VzY0?=
 =?utf-8?B?ZzJUT0FlcnA3MjMyUHFkWXVxMDlvK2xtT25VUzNyazMxUExtaVVsZUFCK3J4?=
 =?utf-8?B?aG0xZllZT2RBTGIrNTc4TTJhNjJSazYzRDIxTnpOb2dJejBCOC9ONnJwRzRo?=
 =?utf-8?B?U2ZCeURZRFREdHZYaERIMW1WbDRMejVYUTdSRUZrVlY4RXFuMnR6ZHRPSFlG?=
 =?utf-8?B?K0E2aFR4aHhjNk9pMUZHMEUybU8wcDVlY2hMRmVKQWtRY0doQk16SnlTMUJh?=
 =?utf-8?B?Rjd5c3c3K0Q3ZzZRSGZoK3l2ZWU4eWFDQjFZV1VxQTJLZlBNUlo1bXRCNGlo?=
 =?utf-8?B?Zk50OXpKbjJvTy9EWTVzWW9SeWZJbU96QjJWQTZSVzBnR3ExMkpQZnpIZ1pJ?=
 =?utf-8?B?TTFyNGUyREExRXl4aFZ1akwxOTZyV2xIWlRJb0hUTzl1TnM3bEVJQTIzODZI?=
 =?utf-8?B?L1VQK01GZkxhcTVFUkZ3QTNwSXFQVVUra01SeDVXUVZwL0FsSkxoK1V6QUZD?=
 =?utf-8?B?SFJvWFdBVjNYRFJJN1lmVDBFRWxUem1EU0RsOFBkTjFVVjVVUUlHOHI3eEdL?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D13288948296A44FAD22BB955F29E56D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C96ciNoQKXiVRGGFkU8djV7EcvXkG0Qd/Uk8O0iGQgwwEegv+Szrs3Elo7TqDfCRlZfw/grZKfpMnZGXUTBBnPemv9gCyy0XHRBSiRBBnvcdQprxEgbUfuqTr9td5xQlAkhw8SZKXTdrIPKTpDxwZO07x++mif5rwuHSGqX7zgRaeYccqGsu1QWS6YFl3IUZX7lnzMLAgMxSAk4MSjTtfzVygogjf3+EpD+/IqkZr3jZBwg2KxWjSk1KU3Yr8tu4rRPqEq99NSl0YN3kvH4F0ps2AhAhe5dn8nlKwdBr2Rl/fXgiSvGphzXG9XfuB0ZOJbkWht8PSJppKMok8rj9HeecSWrmafT4vHw1xLwogUbYwD16DdsZhTvBynU6/NJSE5ZsLEFehAhc/X/ikh9HXAmvEU+mI0FbtjRCviBEXA7jQQTPTyOE86TOTdyDd2/oXICz5FQXC2jp8q6l5yBnxXrKtna9sbOPQbNyMAI+zQWJyoe6xMf6hmpCWf8BlTV/BTm1int0t2/CLwCWe37+w/WAYRnNQFxqyDYr3+iHqRyG1N0kuIjrkycKelGGVYTXmk+0R34STiMkgDX6M71LJ1e88cylulrehzomkX+/IdOncu6lrCZn9sWLYRDp026BD32cASz+pRX2zEEuL8RrRA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c6f47-cef3-45ab-c10e-08dcbcb59586
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 23:05:26.2956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mv4xgoDd4pDwkkdBqEv4+NgvDhru+NaR9rjEAwv1NayNRqgB4Utx4tACNw3jytU78X7JEMfq82YIGI5678pNKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Proofpoint-GUID: CEHaOZJ9bJJAsJLdIB711wVsmS4PlOyP
X-Proofpoint-ORIG-GUID: CEHaOZJ9bJJAsJLdIB711wVsmS4PlOyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_19,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140160

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IA0KPiANCj4gT24g
OC8xNC8yMDI0IDExOjA1IEFNLCBQcmFzaGFudGggSyB3cm90ZToNCj4gPiANCj4gPiANCj4gPiBP
biAxNC0wOC0yNCAwNTo0NyBhbSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+PiBPbiBUdWUsIEF1
ZyAxMywgMjAyNCwgRmFpc2FsIEhhc3NhbiB3cm90ZToNCj4gPj4+IE51bGwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBvY2N1cnMgd2hlbiBhY2Nlc3NpbmcgJ2hjZCcgdG8gZGV0ZWN0IHNwZWVkDQo+ID4+
PiBmcm9tIGR3YzNfcWNvbV9zdXNwZW5kIGFmdGVyIHRoZSB4aGNpLWhjZCBpcyB1bmJvdW5kLg0K
PiA+Pj4gVG8gYXZvaWQgdGhpcyBpc3N1ZSwgZW5zdXJlIHRvIGNoZWNrIGZvciBOVUxMIGluDQo+
ID4+PiBkd2MzX3Fjb21fcmVhZF91c2IyX3NwZWVkLg0KPiA+Pj4NCj4gPj4+IGVjaG8geGhjaS1o
Y2QuMC5hdXRvID4gL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy94aGNpLWhjZC91bmJpbmQNCj4g
Pj4+IMKgwqAgeGhjaV9wbGF0X3JlbW92ZSgpIC0+IHVzYl9wdXRfaGNkKCkgLT4gaGNkX3JlbGVh
c2UoKSAtPiBrZnJlZShoY2QpDQo+ID4+Pg0KPiA+Pj4gwqDCoCBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzDQo+ID4+PiDC
oMKgIDAwMDAwMDAwMDAwMDAwNjANCj4gPj4+IMKgwqAgQ2FsbCB0cmFjZToNCj4gPj4+IMKgwqDC
oCBkd2MzX3Fjb21fc3VzcGVuZC5wYXJ0LjArMHgxN2MvMHgyZDAgW2R3YzNfcWNvbV0NCj4gPj4+
IMKgwqDCoCBkd2MzX3Fjb21fcnVudGltZV9zdXNwZW5kKzB4MmMvMHg0MCBbZHdjM19xY29tXQ0K
PiA+Pj4gwqDCoMKgIHBtX2dlbmVyaWNfcnVudGltZV9zdXNwZW5kKzB4MzAvMHg0NA0KPiA+Pj4g
wqDCoMKgIF9fcnBtX2NhbGxiYWNrKzB4NGMvMHgxOTANCj4gPj4+IMKgwqDCoCBycG1fY2FsbGJh
Y2srMHg2Yy8weDgwDQo+ID4+PiDCoMKgwqAgcnBtX3N1c3BlbmQrMHgxMGMvMHg2MjANCj4gPj4+
IMKgwqDCoCBwbV9ydW50aW1lX3dvcmsrMHhjOC8weGUwDQo+ID4+PiDCoMKgwqAgcHJvY2Vzc19v
bmVfd29yaysweDFlNC8weDRmNA0KPiA+Pj4gwqDCoMKgIHdvcmtlcl90aHJlYWQrMHg2NC8weDQz
Yw0KPiA+Pj4gwqDCoMKgIGt0aHJlYWQrMHhlYy8weDEwMA0KPiA+Pj4gwqDCoMKgIHJldF9mcm9t
X2ZvcmsrMHgxMC8weDIwDQo+ID4+Pg0KPiA+Pj4gRml4ZXM6IGM1ZjE0YWJlYjUyYiAoInVzYjog
ZHdjMzogcWNvbTogZml4IHBlcmlwaGVyYWwgYW5kIE9URyBzdXNwZW5kIikNCj4gPj4+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBGYWlzYWwgSGFzc2Fu
IDxxdWljX2ZhaXNhbGhAcXVpY2luYy5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IMKgIGRyaXZlcnMv
dXNiL2R3YzMvZHdjMy1xY29tLmMgfCA0ICsrKy0NCj4gPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29t
LmMNCj4gPj4+IGluZGV4IDg4ZmI2NzA2YTE4ZC4uMGM3ODQ2NDc4NjU1IDEwMDY0NA0KPiA+Pj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiA+Pj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXFjb20uYw0KPiA+Pj4gQEAgLTMxOSwxMyArMzE5LDE1IEBAIHN0YXRpYyBi
b29sIGR3YzNfcWNvbV9pc19ob3N0KHN0cnVjdCBkd2MzX3Fjb20NCj4gPj4+ICpxY29tKQ0KPiA+
Pj4gwqAgc3RhdGljIGVudW0gdXNiX2RldmljZV9zcGVlZCBkd2MzX3Fjb21fcmVhZF91c2IyX3Nw
ZWVkKHN0cnVjdA0KPiA+Pj4gZHdjM19xY29tICpxY29tLCBpbnQgcG9ydF9pbmRleCkNCj4gPj4+
IMKgIHsNCj4gPj4+IMKgwqDCoMKgwqAgc3RydWN0IGR3YzMgKmR3YyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHFjb20tPmR3YzMpOw0KPiA+Pg0KPiA+PiBXaGF0IGlmIGR3YyBpcyBub3QgYXZhaWxh
YmxlPw0KPiA+IA0KPiA+IFRoYXRzIHVubGlrZWx5LCBkd2MzX3Fjb21fc3VzcGVuZCgpIC0+IGR3
YzNfcWNvbV9pc19ob3N0KCkgY2hlY2tzIGZvcg0KPiA+IGR3YywgY2FsbHMgZHdjM19xY29tX3Jl
YWRfdXNiMl9zcGVlZCgpIG9ubHkgaWYgZHdjIGlzIHZhbGlkLiBCdXQgYWRkaW5nDQo+ID4gYW4g
ZXh0cmEgY2hlY2sgc2hvdWxkbid0IGNhdXNlIGhhcm0uDQo+IA0KPiBUaGFua3MgVGhpbmggYW5k
IFByYXNoYW50aCBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4NCj4gU2luY2UgdGhlIGNhbGxlciBp
cyB2YWxpZGF0aW5nICdkd2MnLCBJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmVjaGVjay4N
Cg0KT2suIFRoaXMgaXMgYSBiaXQgaGFyZCB0byBmb2xsb3cuIFRoZSBjYWxsZXIgaW5kaXJlY3Rs
eSBjaGVja3MgZnJvbQ0KZHdjM19xY29tX2lzX2hvc3QoKSBwcmlvciB0byBjYWxsaW5nIHRoaXMu
IEhvcGVmdWxseSB3aXRoIHRoZQ0KImZsYXR0ZW5pbmcgZGV2aWNlIiB1cGRhdGUsIHdlIGNhbiBj
bGVhbiB0aGVzZSB1cC4NCg0KPiANCj4gPj4NCj4gPj4+IC3CoMKgwqAgc3RydWN0IHVzYl9kZXZp
Y2UgKnVkZXY7DQo+ID4+PiArwqDCoMKgIHN0cnVjdCB1c2JfZGV2aWNlIF9fbWF5YmVfdW51c2Vk
ICp1ZGV2Ow0KPiA+Pg0KPiA+PiBUaGlzIGlzIG9kZC4uLi4gSXMgdGhlcmUgYSBzY2VuYXJpbyB3
aGVyZSB5b3UgZG9uJ3Qgd2FudCB0byBzZXQNCj4gPj4gQ09ORklHX1VTQiBpZiBkd2MzX3Fjb20g
aXMgaW4gdXNlPw0KPiA+Pg0KPiA+IEFGQUlLIHRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byBnZXQg
dGhlIHNwZWVkcyBvZiBlYWNoIHBvcnRzLCBzbyB0aGF0DQo+ID4gd2FrZXVwIGludGVycnVwdHMg
KGRwL2RtL3NzIGlycXMpIGNhbiBiZSBjb25maWd1cmVkIGFjY29yZGluZ2x5IGJlZm9yZQ0KPiA+
IGdvaW5nIHRvIHN1c3BlbmQsIHdoaWNoIGlzIGRvbmUgZHVyaW5nIGhvc3QgbW9kZSBvbmx5LiBT
byB0aGVyZQ0KPiA+IHNob3VsZG4ndCBiZSBhbnkgc2NlbmFyaW9zIHdoZXJlIENPTkZJR19VU0Ig
aXNudCBzZXQgd2hlbiB0aGlzIGlzIGNhbGxlZC4NCj4gDQo+IEZyb20gaGlzdG9yeSBJIHNlZSBD
T05GSUdfVVNCIHdhcyBhZGRlZCB0byBmaXggYnVpbGQgaXNzdWVzIGZvciBnYWRnZXQNCj4gb25s
eSBjb25maWd1cmF0aW9uLiBTbyBjb25maWd1cmF0aW9uIHdpdGhvdXQgQ09ORklHX1VTQiBhbHNv
IGV4aXN0cy4NCg0KSWYgaXQncyBnYWRnZXQgb25seSwgdGhlbiBpdCB3b3VsZG4ndCBiZSBjYWxs
aW5nIHRoaXMgZnVuY3Rpb24uIFRoZQ0KI2lmZGVmIENPTkZJR19VU0IgZ3VhcmQgcGxhY2VtZW50
IGNhbiBiZSByZXdvcmtlZC4gQnV0IGl0IHNob3VsZG4ndA0KYmxvY2sgdGhpcyBwYXRjaC4NCg0K
PiANCj4gPj4+IMKgwqDCoMKgwqAgc3RydWN0IHVzYl9oY2QgX19tYXliZV91bnVzZWQgKmhjZDsN
Cj4gPj4+IMKgIMKgwqDCoMKgwqAgLyoNCj4gPj4+IMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBGaXgg
dGhpcyBsYXllcmluZyB2aW9sYXRpb24uDQo+ID4+PiDCoMKgwqDCoMKgwqAgKi8NCj4gPj4+IMKg
wqDCoMKgwqAgaGNkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZHdjLT54aGNpKTsNCj4gPj4+ICvC
oMKgwqAgaWYgKCFoY2QpDQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFVTQl9TUEVFRF9V
TktOT1dOOw0KPiA+Pj4gwqAgwqAgI2lmZGVmIENPTkZJR19VU0INCj4gPj4NCj4gPj4gUGVyaGFw
cyB0aGlzICNpZmRlZiBzaG91bGRuJ3Qgb25seSBiZSBjaGVja2luZyB0aGlzLiBCdXQgdGhhdCdz
IGZvcg0KPiA+PiBhbm90aGVyIHBhdGNoID4+wqDCoMKgwqDCoMKgIHVkZXYgPSB1c2JfaHViX2Zp
bmRfY2hpbGQoaGNkLT5zZWxmLnJvb3RfaHViLA0KPiA+PiBwb3J0X2luZGV4ICsgMSk7DQo+ID4+
PiAtLcKgDQo+ID4+PiAyLjE3LjENCj4gPj4+DQo+ID4+DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

