Return-Path: <linux-arm-msm+bounces-52242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F76A6C564
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 22:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC7A97A5F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 21:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9EB230985;
	Fri, 21 Mar 2025 21:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tCYEVfns";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fluKDKX2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aYFbAhyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B01F0E29;
	Fri, 21 Mar 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593711; cv=fail; b=EBTlNfDUq5I7PWUpGJ1bq2jLZ2x0XhYA2FDZ0Re81S3F/GJYC4oEhbfCeCTxjBQP8nOgn00itY9PJXFRgazqYcvAK66rflH1EZNq6qx8zQ2CI0U1VAhVsY+wm+VGE/q6sqqO/6vTCaiSufqe8Hyrx06fdVa+ezOV1WcIzroNsug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593711; c=relaxed/simple;
	bh=94oHFzZolAaLPjJeBhyR1Rx33t0A9BxTZeiANAeRplo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uFMv2MTCWsXKxf7IG/syoM7BG1DP1OKiVZRHWrP2xwbqzD6ytc0EzMqjr8ObDNX4dMPevuzzCGgkzeah2qkdkgZn7ipnHkDoUIG2w8AgB/CDtnQsY/nN12H3hAwrkFtGRILUpuBVBZquLAUBWi0zJCkAyQOohOQr5veRSYneP40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tCYEVfns; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fluKDKX2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aYFbAhyw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LJf7ke015981;
	Fri, 21 Mar 2025 14:48:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=94oHFzZolAaLPjJeBhyR1Rx33t0A9BxTZeiANAeRplo=; b=
	tCYEVfns4M+/pf0SS2pk28fmaTNrV3jr0xInIK7AWCYzTCXNHCttL8b/+S7JoZZ+
	bgiI3E7UkxdSSKbR2k5VqdYUfMFUrmSlUVkDahlFVdiMCPb3kFgkMJ2q1mw/MSCu
	PELyHoXhO42n7yZICHKCIoSyA5nI2K5dmdCq39U7y2c1QCorRZzG2aFSLieTokcM
	z4mBkhR0u7R4eWo8LAW+lwl3U8AmUnLkZF8/tBIAxsgFwgqLUZGkrhxf9dWMP6x3
	qikpaImtGQwtYTCm8g75boBDibCy4p473v6TT4wGquUCZA2jaah8UwvXlSR3edmC
	DL3yFgwVzvYK2KIPh03z8Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45fyyhyqpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1742593694; bh=94oHFzZolAaLPjJeBhyR1Rx33t0A9BxTZeiANAeRplo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fluKDKX2E0viI0t3ldxhhvvyBCYbYqgIyai4mhasyzkVbWjMTBbocRxtlOyKeY0vH
	 Hy/4U1lo/FUNL/7fVYIjbyOavk0f1eJSxTOQIsQOzafiw4KFi+DuXsNAIQDZy1ThLU
	 9Ok4onchpfKI1T6SZC3q9BAGh9bATERgpOULz4OpzeMZJ67DKjNRCahUFLyXTiYSXA
	 GsA+puHQGcqJhxWsk1AogQb3oAMOi0oLp/FuM793vh+ychGeHRyrdkNWR6dLCtMbA1
	 oRQnVoYe7Jroz6iiIcFeVysNPBzlhU6E9ztCrEk59eb08fQvgHDeufn3z7yRSS4ynO
	 rpcN7esmjQzmw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 49CF0403B9;
	Fri, 21 Mar 2025 21:48:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0F2F0A00B0;
	Fri, 21 Mar 2025 21:48:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aYFbAhyw;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A40E74099A;
	Fri, 21 Mar 2025 21:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK6cIbn6kqnkR12LZ9OdJxOEykJPD3crwKkHwP7L/GGuHtbF0BQ/EOuZoMtLU1hooMUzaoOHriLNlKD+tqH/BFWbft8RKyBCEWcxdV6b51tigDFnp5eaKmq2/ShqYenRwhy57JdDbjE3muJeqC8IJc6FGpHBjxbaZFV4Et2aIO7Ye1rj+9EfhBkRM+FEyq/ciKuXT29vtu73vQL/7WkAGzRkhMnedYI5xPddFrSB8VXtEP8+VUZEhpoBOAmj3ie3Ks4bGLWdoYzqPaXPsgWiiZhdRYx42deDQxAzjOm7ZBCIHRXuhM0pyCTFqsfb4kwe6IVk1JkjiXdp5uuoVBH+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94oHFzZolAaLPjJeBhyR1Rx33t0A9BxTZeiANAeRplo=;
 b=lLR4/ASirpW9tulWgL9KVcwa09Bl1YWQ6hzc0hmUIivDqb5+Q1CUREVW9pbudlVQPXz3WiRA7NNCPKIKZPPxstlswkEErwsa2VV31553rCNqWgOIeaaV4sj9WoaoDKqFNab5w0cIhh5i/zME2gqldnmtqqDyqdpGioycEcm8sgtjltEM/QCVS+sJukPpommbltbK49yWXA46URX/a1M2/58DMtEffcJoAmncEHhCzQ+EFOylAn/0qhmrUnvqxvJb98Sd0wTvXMXVncGE09Y815/aVvEqsvA4qX9LNVo8/wsL4KdLVFeCWhz3T6BYTcraufqhl/ixpbvOhjpxumVPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94oHFzZolAaLPjJeBhyR1Rx33t0A9BxTZeiANAeRplo=;
 b=aYFbAhyw0qxqHpgBgZvGVWYyLZfEBJJFMpzhi/tQOkytCYTorQC+K078Js+uaPgKar4i1yzSk/ME9vU7Nip8wjnA8cvf5gMLkFWhXUVq53nrX/GdPBA2gULD5zgev6338X/+nGsz6CKSmBmjS7ndYDz8ABkJYXBG/HL/cKVVhBA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 21:48:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 21:48:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/7] usb: dwc3: qcom: Don't rely on drvdata during
 probe
Thread-Topic: [PATCH v5 5/7] usb: dwc3: qcom: Don't rely on drvdata during
 probe
Thread-Index: AQHbmDiz6XE1X9OjSU6egDZy/leWPbN+JWwA
Date: Fri, 21 Mar 2025 21:48:10 +0000
Message-ID: <20250321214808.wckok22shw3mk76h@synopsys.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-5-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-5-90ea6e5b3ba4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8302:EE_
x-ms-office365-filtering-correlation-id: f6063ec9-cb2d-4df0-269b-08dd68c212b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M2RGanpkaW52dnZmamlNbFkwK215YXIxUC9GWnhvUnFseENyZ014dlJBckJk?=
 =?utf-8?B?Tjd4RGYrWkMvQXg5UVdUN1ZJdW41S3E4YkpxYXk2QUFjcTFQSkNNaERXVjkr?=
 =?utf-8?B?Y3hXT0RQK0hDMVE0Nlpub1ViZE01U2pqSnVsVE5QdHFZc29lSStJdzcrdVh6?=
 =?utf-8?B?NTU3K2VMQWRobjlDNlJxdUtLMU5FZU5CUDBRWkpHVkhoUVQzMitNd0tUdXJZ?=
 =?utf-8?B?clhkS1A3c1NFMVEwQ2JPUlRTM3BYVER0SmNsTlRGcWRzalk0M1FuUldKUHRE?=
 =?utf-8?B?T3gvZzFsTVNsK3JKM1ZpT3FLWXlRMjJhNUQvZVNKbUxhWVJUako5SzlEWGJr?=
 =?utf-8?B?enRnakdMV3pKUWtqb3JGYzlyYmZMUGsxQlNGUFdRTWNjcHlja0ZPUTZPNGJk?=
 =?utf-8?B?SDZHTXlYcFNlL3Q3WkgwS0N4QWpEbDlGNk9YTVRlTHl5RDVZZmxPRlZHZGtj?=
 =?utf-8?B?aTZmemNHeEVMcm5OQXNXdUtOU2dtWXdOdWFaQWNVMVBmenQrMlhGcHJqSkZQ?=
 =?utf-8?B?c2htclhCaUlGdFBoVVlEYmRXN3lrTTNzMnZiNE1ZUzFvY2IwOThKOTNKbzl3?=
 =?utf-8?B?MUhSb0VWbHVhbjNRK25nckp3emJEMExMUDVRUi8yUm5BUXB3d1BDT1hCVGVB?=
 =?utf-8?B?Y2pjSnlTRy9oV29JUkVQTytsQnNGMFEwVHFJZzJwUkxwWEVudWF5NzdBSXBM?=
 =?utf-8?B?Q2JpVzlaZ01SS2gzcGx0Vkt1SW9wa0k0YitvZUdLSjc5L0N3WFJuQlZza1A2?=
 =?utf-8?B?QmMralpwY0I4VjJRQm40TDZ0a3JUdE1rdElhVDExeVE5TUFqdUgrOStuZGNn?=
 =?utf-8?B?MFVtajFFTHljZHFBZ3pGQld2bHNsM1phak8zaTdXZ1NlUzYrc0p6cFJMS1Mr?=
 =?utf-8?B?SzFFRjF1SURqcjZaOVJRTmZkS2oxb1Q0NXRxZHZ2QlFqU3BsMGNxcmVpZHVZ?=
 =?utf-8?B?T01WT1dUcE9ORi9ocksvaVljVm1xQXlka3lIWVpSWkg2czdvUFR0MHNJZmh2?=
 =?utf-8?B?U2lyTHhnZDl2dlhONlFZbmJwbEdVNHc5UHRsTVlBWXJFY2FCVXNNZ0M2QWRH?=
 =?utf-8?B?NGpFellpOGQ3M2paVUZqaWhuQzgzQ2RrWWpNOXQwaWQ5Q0laTVlTVUZEcWtU?=
 =?utf-8?B?eW1VeDlkcmxMZmMwNVpQVERNcmk4VFhreWdaOU1zMXFPYnVlSzBuMkZINC9V?=
 =?utf-8?B?S3o1Rk9rcTVRWU9HeEJEa2ZlNHdLdi9OdGFIVGJIYXlzZWozR1FSZXFqbEsy?=
 =?utf-8?B?ZGRyeTk5Tkp4L1p1OXg4YlFEUFJkekIwUkpycEM1UnZqdlE0eWxSdnZvV1RU?=
 =?utf-8?B?SGorRlc1aUFWRWNEL3JKUW1WdlNLWGdyUjVUS1NDNUErNkRxT2hxQ0xkSGFM?=
 =?utf-8?B?WVJnMmY4V1RIQ3NuWUxIVjlCUGpaU05TUHZ2YS94eURPMGJFNm5NeFJ4bHlM?=
 =?utf-8?B?RytuNVlGYkxkek9XWWhWZnNaUndkditaUlM1WE9Nc3lvaUJJT01YTCsydkJS?=
 =?utf-8?B?S1FFQjRVT1JnWDc4MXlhR0R3djNZOCs0SGFtMTUxVlJxc0hVQ1MwMXZQSjZN?=
 =?utf-8?B?WXVOMWx6a2xGTUNVV1B5Sjdjdlp3UkR0bjk1d2tKY1Rsd1pWdlV1UERtM3FT?=
 =?utf-8?B?bFRrejBNTnArQXlEVlV0Y2V4ejhHSHBaaENmRDB5WXF6UzF4bWl3eTJTRldS?=
 =?utf-8?B?Qnd4cXFybTBJNkp3SFBvM3B2TFZiNURaYWsxWVZDczlPMVo0YnZTL0U3bHF2?=
 =?utf-8?B?Rlhxa0FjZThmeFdsR1N5NElFUDk2aXZERUxwd3U2aE5UMzNUQzhrL2NEZkpz?=
 =?utf-8?B?N1dhckt3WUpJOEtGeGZnNUpYTFZPMVdndlc0dGl2d0x2ZUFzQkVCcDNmTEgx?=
 =?utf-8?B?WUxEclQ3YWRRaXNyQStUZlFqeWw3K3pRQUx3d2dPY2g2Q2RpS2hYemt6elFr?=
 =?utf-8?B?eHBzNXZSaEJ3WTM2Zkx1Q3NIZk44QlhPMFpGdEZ6RjFkNTJZbHVmZE41aWgr?=
 =?utf-8?Q?0GNs6rodoiKPYigYSDAn5xw2YJVH8Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dm5jcmNJck1Fb2lzR05uNlhMZVV6U2ZaRjRNczZZcE4xWk5PRHVic0JsS1Jo?=
 =?utf-8?B?MnVkL01oRmpYbUR0dW9rSUlNNUlTME1DY1M1YWVvNlZsV3RTUEsxc3IyenBs?=
 =?utf-8?B?K2pyS25wRXduRllUTTUrZWFJUHVyK1pYMGR2TGRTWCtkUXhnR3AwY0pCUm5y?=
 =?utf-8?B?Tmd2NkJLSEMyaUdRTHNwVmpFNjdhby8rOEpWNjEyc3R6WXgvNTRNWm4rNHVx?=
 =?utf-8?B?dkRDWnU2M0YzelZ0ek9tU3RidkI1TkJEYUVWWHp5ZkhHU1JIcjZFck5UQkJW?=
 =?utf-8?B?Vno4SUdleHhXYjFvUjhPWXhDTnZGSjU2VW5zTjRLRTVXVTZISktRQVJCcGVM?=
 =?utf-8?B?WnlZcU9lN2xzL1hSaXQrQWtBVCttQ1FJKzJCUURxcnhoZkd1bVhWT3BhODRx?=
 =?utf-8?B?L0xtRlBtTUpPaTFMVlJ6Y3A4MGdrbnJyQldBUkErN2s2VlhKdCtmTWNaNURk?=
 =?utf-8?B?bk5kd0RTUEdiR1lMZHMxTll6aHZJUHNOTTVDYUk2cWNDVVdrbjlwMlJOemFs?=
 =?utf-8?B?eVZVWWZ2SXVCSTRTRnJwT2lRNy9ZRndWbWN4NHJTejUzZENXaHhUL0pack1h?=
 =?utf-8?B?NHZpOU94TFgrMXg5d0xBQ0E0MVk0RXh1bmFtVVE5aGF1b21nZGppa2YvNEtV?=
 =?utf-8?B?cmJRSjRwWFRuaUtoSE9RSUN3QXIrTDJ2T1daUnY5THRtdmRDOW1ydVNnb2VL?=
 =?utf-8?B?bTJhSDVvblB4ZjloS0ZtT3YwNmRkUFNqV2J3MTZwVFM2ZWZWdDhsQ3lrckE0?=
 =?utf-8?B?NUE2U3NkQzZvSExDRFRoSmNUK1o3ak00R2EzeURUeFJkeEhyQzAvK2pWZ1B5?=
 =?utf-8?B?MlNPVGNqcXhLZkpoNFVuUVNzUXdIUGN6VWoyVTZOSXp6SlZkS3krNENoMnBX?=
 =?utf-8?B?ODVuYXpEcHBCaHhLcE1zMkpucDZaTFBVdFNxTUNFYmh6WTRZRHVIeXlaV3V3?=
 =?utf-8?B?c0VDS0ZtYTl1bjFhZ2k0M1FJcmlqM0ZlWmpuYlJuVDN0VGpqVVI0MXRpZnF1?=
 =?utf-8?B?TnNHUElKTkxndE5LK0tiNEhsWExkMjREY0tXMndzNmw3NURZSEZBNzZNOXRr?=
 =?utf-8?B?QTVyNGlMNHBIb1hORElqS2dXVWZ3KytBcHR6Q25DODhIeUZJS25FQitNeUlS?=
 =?utf-8?B?ZndxTDZtZlQreHhBRGNwMnJuUHR5Y211VU1jZm1NU1oxNDFwT0F6QnIvYjFa?=
 =?utf-8?B?SlQvQllyRmc5ZWRpeTNySHFBcTFxOS9DYlhoZ1hKZTFibFBYOTVZTGtkaHlU?=
 =?utf-8?B?L0NEYUVLblFRSiszbGZ4amdXRVE5WFc2K1V4aUozMklnM21vYkNPVytOdkdT?=
 =?utf-8?B?RFNENDg1d0MvVFlsV01oMStHazZnOUVEaVBCd1RRbXRwOHBGTWYxcXNkMEFN?=
 =?utf-8?B?aDVZRmdSSFVxSVpyQTFyUDYzYkN2V0tQNkNNQjlXc3ZxZ1dnZWY5ZTZFV1lh?=
 =?utf-8?B?QjFSUitqL01VMWZYcnNPOEFQTXJ4VVBrVER6L1RUVlltZW9SZDR0UWtQbkR5?=
 =?utf-8?B?OWdGRjllbDVSWFlqOUNpdG1qb1E1TnZqekF1UUlSQVBrS2JPTk9Zd1gzT2h5?=
 =?utf-8?B?U3Y5TGpES3ZnNnlFWEdZdEF5RFRQeXlLZ1lHelpnalQvOVlzVXd4Q2twazRo?=
 =?utf-8?B?Sjg2Q2xJcXpoVDBLMmZ1c0dIN3JxZ1hqOWhOMklkNU9CbExCenhwcWhCSk9l?=
 =?utf-8?B?R1cybkwvNFhZa2FKTmx0RU9BQTVUWkVOZ1ZSR2ttelpMRElNR3QvKzVCS0FJ?=
 =?utf-8?B?MW5vdHBoRFBUbVF4c2JJdFBHUFU0UVEyeUEyVWRrOXFMdFJiR0pUN25pWEhP?=
 =?utf-8?B?L1gwN2FXMnJnTVRoWEZMQUl5Wk9yM3hBUEpiU04raFdzWjFLcGJRZ3dtQk5u?=
 =?utf-8?B?bnBIbGNvcFFWa1QzM2c0cmsybStSMnlGRlBqZ3FjVjRRRHladHl0NFZNcjFo?=
 =?utf-8?B?dnYrWmxMTVFLMzQzZnFvYnJKdG95MUtZOW9BYVlhaUxPZXg5dkNDU2xjSi9X?=
 =?utf-8?B?UVpnNnhTaXB2d0liL3lLOVg0UzMvWW4rMkFCV0d1UVYweUxRVkMzeGNsVk5o?=
 =?utf-8?B?WXBBVm1INHNpSU8rdDI1WUJwVWNOUWMxdk1IaVdwUjJXckJnakY2dGtBcVZu?=
 =?utf-8?Q?VnxmjUOLA9IaxJWqnU64++BiM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CA440B44B6894429F46442D934C568A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AwXYi0odMmyFujm+l9hhDm/H+4DK3lyjOzXhgaVo3+xinNrnOkdUOjwxD8K+2Vb1kenSpDSbE45FCzPBGA8/ALXgn9GYjiqsfEo7UqYFrB3rAoY+zEgoxCDZjDxrhrhp0EJAxsNWR/Vgm3RabT7Iwf7vHtZ6AKzZcP7Iu3yrb/gpGFkXJZjxKaTfzHbbdOpqradS4S7prSELbVp671fJU06c1L765iYqiir95vbgWfCqfMLnE4CvZT2Czut94NLytidXZSIwHkmEkKXSmOfczJIl2wHZxaMi3QoXP+Ys0kO3SXM84R24FhvYUIlEfoicofLqEBsoN525/3pillV9wvh+1yb+ib1GO5cu4FT+idQybiwBiQovaQu6GGyfGt5oKfiGZOl45ok6GqNX8wlAqOI59BKW4EKngqR8TOXtIDR4hXJSHS0ug39533XbTXgl1v5b9X1UX48UdtfbH7ygyuyvyimzEh5NRS35YBmausCbZrZedxwKsumlaSIRDspxPXTEi9ps4eACm6SYlwkq2tBhXUCu2AIR/2wOtZplPTZwwFW8HVFYda0+mffS9gysvTqJ/k042VR2ZCkXmqaM4NabkVWNixbDmjYerGDJANMfsoy6/KGGh5xYJ/ja1zJ4DEKjMnM/y/ZpXMXe4atxwA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6063ec9-cb2d-4df0-269b-08dd68c212b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 21:48:10.2741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yh+4kvtpkOk/jBqc9ZOl41VXRaUf3YSNFgHOIHNVsrGppRiqMt5vBcI7nkDrr4qys2wvKHVtqpvQgTXTZVjjIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302
X-Authority-Analysis: v=2.4 cv=Jaa8rVKV c=1 sm=1 tr=0 ts=67ddde9f cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=CeMSe38P2SJbSCbLZCsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: gDBNm4_3K2NPRiY-5ImPqVLbHMlEsgZm
X-Proofpoint-GUID: gDBNm4_3K2NPRiY-5ImPqVLbHMlEsgZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210159

T24gVHVlLCBNYXIgMTgsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gV2l0aCB0aGUg
dXBjb21pbmcgdHJhbnNpdGlvbiB0byBhIG1vZGVsIHdoZXJlIERXQzMgY29yZSBhbmQgZ2x1ZSBv
cGVyYXRlDQo+IG9uIGEgc2luZ2xlIHN0cnVjdCBkZXZpY2UgdGhlIGRydmRhdGEgZGF0YXR5cGUg
d2lsbCBjaGFuZ2UgdG8gYmUgb3duZWQNCj4gYnkgdGhlIGNvcmUuDQo+IA0KPiBUaGUgZHJ2ZGF0
YSBpcyBob3dldmVyIHVzZWQgYnkgdGhlIFF1YWxjb21tIERXQzMgZ2x1ZSB0byBwYXNzIHRoZSBx
Y29tDQo+IGdsdWUgY29udGV4dCBhcm91bmQgYmVmb3JlIHRoZSBjb3JlIGlzIGFsbG9jYXRlZC4N
Cj4gDQo+IFJlbW92ZSB0aGlzIHByb2JsZW0sIGFuZCBjbGVhbiB1cCB0aGUgY29kZSwgYnkgcGFz
c2luZyB0aGUgZHdjM19xY29tDQo+IHN0cnVjdCBhcm91bmQgZHVyaW5nIHByb2JlLCBpbnN0ZWFk
IG9mIGFjcXVpcmluZyBpdCBmcm9tIHRoZSBkcnZkYXRhLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Qmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25Ab3NzLnF1YWxjb21tLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwgMTcgKysrKysrKystLS0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggNzlmMzYwMGYyNWM0MWE1ZWQ3NzBmMTY0YTAzYzdk
YzQyNGIwMTQ0MC4uOWQwNGMyNDU3NDMzYmQ2YmNkOTZjNDQ1ZjU5ZDdmMmEzYzZmZGYyNCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IEBAIC01NDcsOSArNTQ3LDEwIEBAIHN0YXRpYyBpbnQg
ZHdjM19xY29tX3JlcXVlc3RfaXJxKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGludCBpcnEsDQo+
ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBkd2MzX3Fjb21fc2V0dXBf
cG9ydF9pcnEoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgaW50IHBvcnRfaW5kZXgsIGJv
b2wgaXNfbXVsdGlwb3J0KQ0KPiArc3RhdGljIGludCBkd2MzX3Fjb21fc2V0dXBfcG9ydF9pcnEo
c3RydWN0IGR3YzNfcWNvbSAqcWNvbSwNCj4gKwkJCQkgICAgc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldiwNCj4gKwkJCQkgICAgaW50IHBvcnRfaW5kZXgsIGJvb2wgaXNfbXVsdGlwb3J0KQ0K
PiAgew0KPiAtCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsNCj4gIAljb25zdCBjaGFyICppcnFfbmFtZTsNCj4gIAlpbnQgaXJxOw0KPiAgCWludCBy
ZXQ7DQo+IEBAIC02MzQsOSArNjM1LDggQEAgc3RhdGljIGludCBkd2MzX3Fjb21fZmluZF9udW1f
cG9ydHMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXR1cm4gRFdDM19RQ09N
X01BWF9QT1JUUzsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBkd2MzX3Fjb21fc2V0dXBfaXJx
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgaW50IGR3YzNfcWNvbV9z
ZXR1cF9pcnEoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIHsNCj4gLQlzdHJ1Y3QgZHdjM19xY29tICpxY29tID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7DQo+ICAJYm9vbCBpc19tdWx0aXBvcnQ7DQo+ICAJaW50IHJldDsNCj4gIAlp
bnQgaTsNCj4gQEAgLTY0NSw3ICs2NDUsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9p
cnEoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpc19tdWx0aXBvcnQgPSAocWNv
bS0+bnVtX3BvcnRzID4gMSk7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVtX3Bv
cnRzOyBpKyspIHsNCj4gLQkJcmV0ID0gZHdjM19xY29tX3NldHVwX3BvcnRfaXJxKHBkZXYsIGks
IGlzX211bHRpcG9ydCk7DQo+ICsJCXJldCA9IGR3YzNfcWNvbV9zZXR1cF9wb3J0X2lycShxY29t
LCBwZGV2LCBpLCBpc19tdWx0aXBvcnQpOw0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJcmV0dXJuIHJl
dDsNCj4gIAl9DQo+IEBAIC03MDAsOSArNzAwLDggQEAgc3RhdGljIGludCBkd2MzX3Fjb21fY2xr
X2luaXQoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgaW50IGNvdW50KQ0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGR3YzNfcWNvbV9vZl9yZWdpc3Rlcl9jb3JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgaW50IGR3YzNfcWNvbV9vZl9yZWdp
c3Rlcl9jb3JlKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICB7DQo+IC0Jc3RydWN0IGR3YzNfcWNvbQkqcWNvbSA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZQkqbnAgPSBwZGV2LT5kZXYub2Zf
bm9kZTsNCj4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gIAlpbnQJCQly
ZXQ7DQo+IEBAIC03NzgsNyArNzc3LDcgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJZ290byBjbGtfZGlzYWJsZTsNCj4gIAl9
DQo+ICANCj4gLQlyZXQgPSBkd2MzX3Fjb21fc2V0dXBfaXJxKHBkZXYpOw0KPiArCXJldCA9IGR3
YzNfcWNvbV9zZXR1cF9pcnEocWNvbSwgcGRldik7DQo+ICAJaWYgKHJldCkgew0KPiAgCQlkZXZf
ZXJyKGRldiwgImZhaWxlZCB0byBzZXR1cCBJUlFzLCBlcnI9JWRcbiIsIHJldCk7DQo+ICAJCWdv
dG8gY2xrX2Rpc2FibGU7DQo+IEBAIC03OTMsNyArNzkyLDcgQEAgc3RhdGljIGludCBkd2MzX3Fj
b21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoaWdub3JlX3Bp
cGVfY2xrKQ0KPiAgCQlkd2MzX3Fjb21fc2VsZWN0X3V0bWlfY2xrKHFjb20pOw0KPiAgDQo+IC0J
cmV0ID0gZHdjM19xY29tX29mX3JlZ2lzdGVyX2NvcmUocGRldik7DQo+ICsJcmV0ID0gZHdjM19x
Y29tX29mX3JlZ2lzdGVyX2NvcmUocWNvbSwgcGRldik7DQo+ICAJaWYgKHJldCkgew0KPiAgCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBEV0MzIENvcmUsIGVycj0lZFxuIiwgcmV0
KTsNCj4gIAkJZ290byBjbGtfZGlzYWJsZTsNCj4gDQo+IC0tIA0KPiAyLjQ4LjENCj4gDQoNCkFj
a2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5r
cywNClRoaW5o

