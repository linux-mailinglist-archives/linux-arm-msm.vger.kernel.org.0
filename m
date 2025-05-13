Return-Path: <linux-arm-msm+bounces-57652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940EAB484E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 02:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A86447A3D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 00:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872CD8BE5;
	Tue, 13 May 2025 00:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GPT1cOWg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lzp7q2IN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WeCca/dY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064CDF42;
	Tue, 13 May 2025 00:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747095242; cv=fail; b=Ww1PLrl+TLoUf3ghphfimClisoUOEk34oXz4y7YyfdZI858vBJGRvLVjIEEteIUyYesDBJ5Hxj61zV2wOUypiDudVFMAa/asnaz5AGFNvLYaZ77xJXoIAVLEZmJRQaoaovstMyXvwsSeIpINDBAINYLC8b8KugvtMYak31eolvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747095242; c=relaxed/simple;
	bh=+drfr0Ch1Gbp4wBC58+3IUWtFBGejRnGzNCzhZeQslQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CRaIbhU04JCx/s3gDbpDDo2QVhKjMSUS23kgr+b6q+W+RYmInSuttMXkpUOYsXNEBl9uyJF9tT9h/7sTCMYmzV3clMRv7RI0Y2ebmnMOpYEB/YJNu2btd/3EZTPX90GbnUWI1+6h40RjlIixUacYJora5szHezksBo33syDqC4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GPT1cOWg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lzp7q2IN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WeCca/dY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CINBAG023657;
	Mon, 12 May 2025 17:13:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=+drfr0Ch1Gbp4wBC58+3IUWtFBGejRnGzNCzhZeQslQ=; b=
	GPT1cOWgg2slA06zskl64HCF8Gu+GAjcIVYLkI71w6oOUx45lXTjppeqlUHg22Qt
	spNPbcfkAu8o/F3AwvTW5J+sD7VLfRPj9/gnKqw9K+izlK6/fpP47WH/jEkOZqCk
	GGi+VeD+csOAxG/ymNOv9NFdauz3bls9Ay4AbiqqZPB9UMUT9bVGym8ZtfQslFqW
	NtqxLbQowsc+BOpfR15aC8qsOJLya+ALPCsEUHFr77cdywrVAzc12FFG5WOjcCVq
	stO/fVe/UQRfzaOrELWY4C5UI1mKb2Jp/M19nmnYw4sHqcmPqmzX3E5W4NeRO5x4
	jYt2919h0lLD9syg+59ijA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46j5qw10nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747095225; bh=+drfr0Ch1Gbp4wBC58+3IUWtFBGejRnGzNCzhZeQslQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lzp7q2INCqfAZj5NYgz/SaZNU1DcF4rDAMpfaM0lzpIiJwOEQSY9E4APD4rnPb20F
	 djxz+NAXmzYE6baZYMrZTqt/dptRll/MmOqyBXpNjwb3tYug1ils6fMzIjv8zaVYhu
	 8uCXR7gLQPe/aZorD2QeIL/M2LQ7cvnO02EYazCJL8EujVDOyiJF0VNriEhMjQmKUw
	 UoHxYlNDpAwQf3SaTIAGKCdz+h7ofpGP+34AnImWTibzRvCcsvshXE5ZaaqrBhrHeY
	 QdDCcC70+TqgaY2a4nvkilKPEsRgD6OiE1tFQ8SkJ/GkhEBersbGJUpcfG5P5Hgelv
	 d64z7mX1MFNqw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03A9040132;
	Tue, 13 May 2025 00:13:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 74E2CA007C;
	Tue, 13 May 2025 00:13:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WeCca/dY;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B6F394013C;
	Tue, 13 May 2025 00:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmzLW+AW3Ea742WF8K5Q/gHmGd230Le0DDe01d7j2imK+nAGXLBATq+GUCrgBJYZB5q4/uVzWlnaiXbcpbJyfWiKnZusuM+xZ9TwiUF3bJoXMGqkNAI3f8jX1G6yuxBrcLxa/Ch/QqkRDNjFIbn09qdNgzuS9h5m5jjw2nlyMX9LzFmgITLJE5xEbNKWwZdr8LWmM5ifd5ZLh4JkXnf1j/Fm4Ycfcf83bUIrZg+OhRW+JpoKezzDPF0NrlrFEzuvEntT7MdcwsZ7eSTRcySi3/6c6lmnwkpB+cuEEAJr9B1H7T9pFipAFquMY3abffGsdULGN4mViM1Qye/KfhWt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+drfr0Ch1Gbp4wBC58+3IUWtFBGejRnGzNCzhZeQslQ=;
 b=ZTiHSrlXdfn+baE24HjGW09LIVLGQf12x5uzwNfoimLHwp3OZ4/zmUPDhuMtq2hU7YfRNkbEnhnvYPqZajzNrDQlDZFu2Bqk3hXCAQ474ESZ03XGE17AsCo6dHAP9y7mPov4Y1Sz91KVj4d1n0HKIIpg5lhpHZ6Gd7crisnzkqiRfudNHlp57QfgA+jWvvKkCXR5GmBbqwmfB6hiGRJbQc+LUnGqfKPb9UmdoR5tvF+IjjaL6YC9DA1I+w0eBgoUj46NUMq4ah4rz+saK8Wa0VFXZTXz8aTSo0kV+U0JT/njp01oXgefQQF2quOAbwHigpGSrAm6XVPOCxhLe/0Yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+drfr0Ch1Gbp4wBC58+3IUWtFBGejRnGzNCzhZeQslQ=;
 b=WeCca/dYPv0YgaIPKA50OlMvu4115IA5wX+FE+gNx1MTJcfmlsPicqSJyr2Sf4g4RlDwdvBt3oGN2vYAO/OhsL5LLbQptux0OYD242NHDCSD0VcB4/XBynNcvk9Wowpam4ewHV5yxOwXUWJzEcEeEvVvRWl5AySbr1mkME1D71g=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 00:13:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 00:13:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Use bulk clock API and devres
Thread-Topic: [PATCH v2] usb: dwc3: qcom: Use bulk clock API and devres
Thread-Index: AQHbwJRkwjFpxKXnbEOTKM4rXSYoVbPPtpIA
Date: Tue, 13 May 2025 00:13:40 +0000
Message-ID: <20250513001334.r4bomm5s2jbzlfoh@synopsys.com>
References: <20250508-dwc3-clk-bulk-v2-1-bad3427e88d4@oss.qualcomm.com>
In-Reply-To: <20250508-dwc3-clk-bulk-v2-1-bad3427e88d4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6846:EE_
x-ms-office365-filtering-correlation-id: f150822e-6d8c-46ae-fd6a-08dd91b303c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEZDQkt5Q20zOTlNMWl5YlhwU3FnS3FvRmZyNzJ6S2ZZL0Rxem1zUVBqa2p0?=
 =?utf-8?B?dEsrblZhWTlLdFJHNmowZTFseUhlN0R5U1lOVVJFT080RFFLWkFOWEh0MVZ4?=
 =?utf-8?B?VHBkb3ErU1c1T01rWGZlOFFUd1c2NE9lQVZLOUxpUU40dThPWVJmc25pRUc4?=
 =?utf-8?B?ckszT3ZUV1p2bXZmSWdQUEVhdFZtZzgvc3VTTHFWM21hZFVIWlZOeWtSTmxH?=
 =?utf-8?B?QmYyOUVhZWNSenVnTHpTWllQWGdlOHMzYjZyWjk5cjNieDFWYVV6SGp0WGZi?=
 =?utf-8?B?RXpqd1M4eGVxSUIrSTREZVpEb1EyZUp5aWd3Tm5TN3lFU0pEeTl2NlJvNnh5?=
 =?utf-8?B?ZmwrZFhLeGlSYmhEY2RuT2NETG9XNE1OaXBOY3kycFpDS1hkRXdtT0dYMGRw?=
 =?utf-8?B?R2VITnNaQVpDaUZkL2x4VlJKTFBGa201T1NTMDlXK1lSQ2tHZVJaRnR4b3Nk?=
 =?utf-8?B?ZGNNcXFjRWh3YjRoWm8xSnBZRVN4ZGhiMTVIUC90QUZDa3JRaWVPQ2ZLdWJG?=
 =?utf-8?B?WFVrNlY1cWpvaTgvWkQwT09WcFpnUDhkdUNsT21EM2FWWTR0Y2NMQVBGT29l?=
 =?utf-8?B?M2hKS1daTFRmR2hoVG14elpZUEV3bUFxRzFjYS9neUN2cXJaYmJDdG9wMWJt?=
 =?utf-8?B?VHJTd3M5Zng0OFNFV1d2TkJrKy95WlNVeGJISTRXQUtFOTlMbVZLQnJ0QXVV?=
 =?utf-8?B?UFBqcnJIV0NvZDE4VkpkU2FsZkpSYzBqWnUxTHRwWGVPOXJaSlpBcU1iQjk5?=
 =?utf-8?B?aXh5dkZ3MHBORWEzZlFBNTc5RHJXVnFYd3VNUk1KVFJsMjFldGFlSHNFUHZ5?=
 =?utf-8?B?YmRlZnEzNmN3aGtrc0JvdUxCeFZibERDcTFHS09idTNIR1NUK2VLak1MQWdL?=
 =?utf-8?B?UE5FZ0JjNnhxM092bFpVTldsY0ZBcXpKNk5vcGttbXFtS3N0YTdhelYxSmlm?=
 =?utf-8?B?dUVOY3h4bDgyVlZhZUJ2ajBFdndqaEExeGVNWElyazBBZndYZHRmcXBCNE5z?=
 =?utf-8?B?OHJqdHBFWWE0bldVMVhRUktSZkp3VDVEV3hDOUl0ckVjYzVHSDNaUUd5TEln?=
 =?utf-8?B?VmcyVXlwbHBNWEpYVFhtdjZsMDlISG5VeGJQMFp2L3Y0SmMxakorOTFodnV5?=
 =?utf-8?B?Y2x0NVJGVlRaUC8rVFNWTExNOTJXTEt6dGY3d2FDSUtTYkdFeG1tZnBQT1FU?=
 =?utf-8?B?ZnRzMXRMdjhaa08vdCt1RUQ0cnBYVFJpNVN2L1Rjc1FIeVVpUW5OWkwwbmEr?=
 =?utf-8?B?NW55RlNRUlpKVXVwZFB4Q3RoT25icmdBMHk0MHgwSE81UjdtV1pKNXRwMTls?=
 =?utf-8?B?djg1UnpUbitPWHBQeXhCb2pERkpLWXZvMlE3bWJkbXNYYU51RUI2ZlJ3MFlx?=
 =?utf-8?B?aCtpaThNeHQzb2JlNzZYNURwWjFZZWsraW5MN1NJY2N1Z040Y2h6WTFGbEJT?=
 =?utf-8?B?SVpaM1dIV2ltMUV6bG1BMnhvMGplVFFBQm5TcEM2ZGpDVFBpS2IvMXJkOHR4?=
 =?utf-8?B?ZWJhR25SRWFkQWlxNU1lb2RndWlnRmU5cXUxVXo0VG1BMXNxZlJCeE1FcEJp?=
 =?utf-8?B?ZjBJeEMvM2xSdWxZbXlXOWFLQWlNU2NyNnNVRzkzQmYwcTJFUTd1Z2JLOVU2?=
 =?utf-8?B?RlpJODJ3L1ltSjB2UVVUelF0WjIyYUJVbC9MMVIrU0dsVjNKVFRaZTJ5Y3Bx?=
 =?utf-8?B?Vk9HL0tOeTA0bnE5Nnp5UThxQ1h5dUJoSzRhVExuQ04rYVNKY1M0ZjVaUmoy?=
 =?utf-8?B?eXB4YmVRNDdPcFpPL3REclpqQ3phRVN2eEd4RnZyajE4aDlyTzVvODVySy9K?=
 =?utf-8?B?NDEzd2ZSMG82R2ovTHluWEVsaWlML3k4WVZnbGFLT3dGM0wwZmkyakx2V1di?=
 =?utf-8?B?eFN2aUUweUxJM2owVHRnY0Z2eWdLSXlTSUwvK0RnVGp3emxzdlAxRVFHTmVP?=
 =?utf-8?B?YUd5ZGlneFlzSHk3K3FFYll3VS83ZGZvZnZWdDdvcXNJbWJvZW02SVIwM3Fz?=
 =?utf-8?Q?KL2Y48G86bfvJBXjsJGwN69DqCtFPk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVowUlNubVI4UkxITVJmSjQxM0tTM0pEeUVMcjh2YlFkaGNPR3E3MnlUT0Ni?=
 =?utf-8?B?MnhrMlNxNkhvQ0NCU29UYXFRdFEyQWV0K0d6SnkzM0ZOUFgzWm1qRkw1QVlJ?=
 =?utf-8?B?cXhIOU5Db0RQWk54dnBTQmRUaW1hQUlGaTQxVTNCMjNneWtvWnI3RHFGTUhI?=
 =?utf-8?B?NFF2Mlp2VGFOMndrM2hGMlE3cjNEek9icU9md2htaTIrdkVXU3NzckJzOE9u?=
 =?utf-8?B?dm1NVEdmVGE3UmJRZmR3c3pxYkw5SGlLWlFGWTRQTjNaWHpQRE83cGNoaDVE?=
 =?utf-8?B?V0xoZEVTQXRUS0FIVFhIbnVXYkRYUk81Q3pwTHpXVld5dEtxdnFUZFlzT3Q1?=
 =?utf-8?B?TERmOHFCUUxNMDNIZms5cldVd0Y2cXNUbzA3MTBIYzJycGttMnR3eHVRRGcz?=
 =?utf-8?B?S1hZZlpPR2JSNThWaVlCOWUyYzBzNUxoOUlSU1VFczZzb0tETzR4MXUyMUU5?=
 =?utf-8?B?SXBabUV3eXVEM1ArT1MxaFFRTnhUR1pWTXMyaG5DWkxSNCt2QktWcHZuejJF?=
 =?utf-8?B?c1h3cEZyWmg5cm10Z2tsV29oNUtyakVyTWEvUXZaRUNZQkZnY2JiTVRaWXVS?=
 =?utf-8?B?ZXdSUVNPYU54M0JyTFRsMmtxZ2JvamlOSjNFQXRmZzI2cHVJaFJzNVJXZnIv?=
 =?utf-8?B?MkFYbk1nclJ5QmFWZGx3SjdKWUJWTCtEWTdNY2huaGMxS2d6Qk9sVWJuRkF3?=
 =?utf-8?B?WXQzbWlMSm5qb3k5cUtiTE5oUmNiYmZodlRGVmJoc0dpQS90UjZOYVpDb3lh?=
 =?utf-8?B?SERnR0FFYWdHY25aSEhXZW12OEE2RDBKUlhpcC9FcDIrM2lPSE1IcTNFandT?=
 =?utf-8?B?RWtvTG51SmR6aWxVVjQ2ZDZscjIwb1B2bWtFWWlybmlTUGFGYmxJY3c4L25H?=
 =?utf-8?B?NFpkdWdDcDU4M3F4Q0paTG5RdE5iclZaS0lWbWU4bkE0aFAzM0pINmt3NjdM?=
 =?utf-8?B?eDJzd0V5aXE4TmJLQ3lFY1ZPN1VTSWhoeU96NE5UbXVBa3J2S1ZRbW1GVS9y?=
 =?utf-8?B?alpBODhRN2ZlWnJ0Z2Nxc29XcWNoQ2wyWDZXalRzRTFaY2twa2xkdXV3VFhM?=
 =?utf-8?B?bnhtQnR2VXFoRit3TmV5RHkzVzk5SXhuRHR0VFRLRFluM3NFRDF1ejhaalhx?=
 =?utf-8?B?KzhoWFVHTGxuREpnZzIzNTVKb002RkZlSXZkUnVoSFA0SEd6dTNtalIwU1JJ?=
 =?utf-8?B?Z3NLVEFIaGQ4NTBXdWFJemVzYXBROWdhc2ZzYXlickhMS2N1cU9GY0lpNCtB?=
 =?utf-8?B?b2RHTWdZcGt0Mk1wcXFkM3lXNjFqYlBGekFqRHBwQnYwZHJkM2xkYWdwdGIy?=
 =?utf-8?B?OW9lYTcxd2M3em5BMzZoZGV0RVdtQVB2ME5pSlE4TktVYmZ4MWpmR3o2Ly9H?=
 =?utf-8?B?bWRrTDJBK2RRbVNVbkRWK1k3ZWZDVUUxSzd0VHFQbzcvTHBiZ0JKMkVwU0N0?=
 =?utf-8?B?K0YrMkYwdEJNU01NVWlyYTJDRWNGRlZRK2N1Nng0Y3ArRHFVS0VWcFVndDlO?=
 =?utf-8?B?alN6UHZxMndLMm9jUUxGMDFxTjJUdVpYY04ySXZNeDRQZkgzdktrQVgyTlBp?=
 =?utf-8?B?dTVxTk5weXNNc3A2UW1kV0VhRmMyMXIvcnVHZDI5UmZnVkpPUTFGVXZ4eWRJ?=
 =?utf-8?B?elY4eWJ5aGdkRXVMWnNBTlhVVkx3azh5SXhlTGtBc2tiWTRaTWpJN21vck9R?=
 =?utf-8?B?eW43cnVpN0dJVTlJeFJZalpDYlkydGI0QXk5YmRYOTAwaENhZVk3bGtnc0Z2?=
 =?utf-8?B?WE1pMFVXeFhXQ1J3WTdlNndtMzJGLzFxYlo2L2VNVTBLa2tlR2I1V25sNnhi?=
 =?utf-8?B?Q2Q5WjBPemtaaUl6V1hacHFTdnZXNEUzWHZqZzJaakt6Vit2R0ZJOWlrN0xB?=
 =?utf-8?B?VC9OM2FUQ0Z5ejNkYTlFVHlnN05NRHJGclRmcy9RMWNBc0x4Wm1NdXZHYnly?=
 =?utf-8?B?c2E0bzh6MjVKSEQrdFN2R1BvYTE2WExrNURRREIrYXlOcWJBeEVUT3h6ZUpl?=
 =?utf-8?B?L1hTcDJ5QVl5OE9MMy9TNnRjTUVwSTB3VnBzSVk5OGtkdlVhWW4vbEJ2YWpH?=
 =?utf-8?B?V3RQV1FBS0Fia0M0MkJvcE9YSkVyemVEbEpPQ1A0WHM1aDZTR1lQbHk0cThR?=
 =?utf-8?Q?CUV6zy6GjdrkeAVuxbDN1tuif?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EE6B8F40337234AB377F816E652EFA8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Axuh19D5w6261nuINAQ6JN5qsH7u06tX1q9IGLmSQZxRZk4sRjlawMTKXyF0Vb82TBhnSSmvXPiF/7rg5uaCeYjbKgOhYw7XhTQR9HofYVpDxrF6Fdw3eXGRG1drSZQqx1+1nDQxToGkfVHGwH9bDbRAcqOHTWCvyWuRBWvegODP3dYlwR0KbU0GRPztE4bqWw8eZu/YjnIaQ38o1i8mVFvmdtNtAelbVLkjwSZqHFZa4IhRXO5Ud+VTt4LDPoU677Ac1eVOLsYAiTpGWFkFQP4+RoKc6f3PccmhHybbns8ZHll7IQG5yEPppWxilN36adnWw6MMNR4jtaV3ZN+Ul9naRIPhTCoslYjDn/9fSND4c/hMDF9wZRVVERY/m9UzCT1pMkVBwrOYCTQZ74xowqhiyfohqCPF74huKDJVb0LQ3u2NHNNykfcGAsFOE8/DQjsVx2xfjk313SrqF0wcHW1vnQcGAj5fpfn+px9fMVCMFgZk7GJzQBCJQEwzH5KnxbVgRbX93Lb2a1oiGxQyQyKF+SW9bAOUY6Xy+cHNNKN1MMj7qIVLgIhZgQBQuRwOEh9ENTLGoXJ4cTKk2buKG8v8WSPvUGnGViH/YyeUplWWmIXEnf6lHkeZHXCGvE/XP/seoulLs6nJDvogS69XA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f150822e-6d8c-46ae-fd6a-08dd91b303c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 00:13:40.4676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6Ec3qEbYvY4uMrBN/XNBxstwKRt6p9MGzpmRa9ekyxv07Jc08YaD7ewVqYz24Ey2kk4zFKUm8Y8rw1eE/Vn1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDI0OSBTYWx0ZWRfXyJ/et5pS5V4K
 bGlLTpfs6YIsmZqLxZVzhccO+AxKly0kRbGpmJy4vtqhUX1yf4FzMK6xsDHz2TWlLo7rJw0IZ5y
 h9mBPEJ99j9hep/MEdEV1s5DXOmEJryR+bO/ShCgga6CUdLIsp2XRus4biU1aiirtm/yemgwDxm
 RErhIUyKSIdwl4V1hDeZWeAT7T0nAZkVAS/qhzsTZVghEta1M+k6fCbZTVFaSQ8YdSYe4i6ShIs
 s0RPpjiAaxO9VmAPiPbbimwf+wk4ws1b+IPDdfzmiX3+cqXzM1rDN6rMol+eGyyZG+7FaQ53J2A
 94TxAAAFUX9RXg66sQHVlf1c6H+PJeZRGzqdzcz5bVIeOWlG1SUriRgPeov0dXB6iF9MUiJvaQS
 DDQs3vkn7w6ybiTnnoloI3un41ZfXr51DhBDwTx+z/2rDYOqG3OgszUOi7vBBsIgIsyGKoHB
X-Proofpoint-ORIG-GUID: E8ToXfppyRkhdPo90eV6jmInDFokj-8n
X-Authority-Analysis: v=2.4 cv=EdXIQOmC c=1 sm=1 tr=0 ts=68228eba cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=6d44LShnmKeOEjHDiWUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: E8ToXfppyRkhdPo90eV6jmInDFokj-8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000 definitions=main-2505120249

T24gVGh1LCBNYXkgMDgsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gVGhlIFF1YWxj
b21tIERXQzMgZ2x1ZSBkcml2ZXIgZHVwbGljYXRlcyB0aGUgbG9naWMgb2YgdGhlIGJ1bGsgY2xv
Y2sNCj4gQVBJIHRvIGFjcXVpcmUsIHByZXBhcmUsIGFuZCB1bnByZXBhcmUgdGhlIGNvbnRyb2xs
ZXIncyBjbG9ja3MuIEl0IGFsc28NCj4gbWFuYWdlcyB0aGUgbGlmZSBjeWNsZSBvZiB0aGVzZSBo
YW5kbGVkIGV4cGxpY2l0bHkuDQo+IA0KPiBUcmFuc2l0aW9uIHRvIHRoZSBidWxrIGNsb2NrIEFQ
SSBhbmQgbWFuYWdlIHRoZSByZXNvdXJjZXMgdXNpbmcgZGV2cmVzLA0KPiB0byBjbGVhbiB1cCB0
aGUgY29kZS4gVGhlIHJlc291cmNlIGFjcXVpc2l0aW9uIGlzIG1vdmVkIGFib3ZlIHRoZQ0KPiBp
bml0aWFsIHJlc2V0IHB1bHNlLCB0byBoYW5kbGUgcmVzb3VyY2UgaXNzdWVzIGJlZm9yZSB0aGUg
c3RhdGUgaXMNCj4gdG91Y2hlZCAtIG90aGVyIHRoYW4gdGhpcywgdGhpcyBubyBmdW5jdGlvbmFs
IGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5k
ZXJzc29uQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEFj
dHVhbGx5IGNhbGwgY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoKS4uLg0KPiAtIE1vdmVkIHRoZSBy
ZXNvdXJjZSBhY3F1aXNpdGlvbiBhYm92ZSB0aGUgaW5pdGlhbCByZXNldCBwdWxzZSAoYnV0DQo+
ICAga2VlcGluZyB0aGUgcHJlcGFyZSBpbiBpdCdzIGN1cnJlbnQgcGxhY2UpDQo+IC0gTGluayB0
byB2MTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTA0MjItZHdjMy1jbGstYnVsay12MS0xLTM3YzdjOTQxMzMwZkBvc3MucXVhbGNvbW0u
Y29tX187ISFBNEYyUjlHX3BnIVlkdFZydHRMQ2xsVjJ5RXg2OUNRUlA1aEVOeWxvOVduOUdiQjJi
eVJtSXRDbC1uM2xvSUo4NzA5NGhkYjhUMmx4dkNBbms2d19MVWxPVzhnVkotMVBHVmNOVndtT1Na
MkNTV3QkIA0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA5MCArKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDc1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jDQo+IGluZGV4IDIwYzAwYmEzYmMzZDI5ZGZlMWUxMWUzOGRlZGVhMGM5NGFhYTZhODEuLjcz
MzRkZTg1YWQxMGM3ZjY4MGE3OTRiZDc4MThmMTgwMmIxMzA0NDAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXFjb20uYw0KPiBAQCAtNzMsNyArNzMsNyBAQCBzdHJ1Y3QgZHdjM19xY29tIHsNCj4gIAlzdHJ1
Y3QgZGV2aWNlCQkqZGV2Ow0KPiAgCXZvaWQgX19pb21lbQkJKnFzY3JhdGNoX2Jhc2U7DQo+ICAJ
c3RydWN0IGR3YzMJCWR3YzsNCj4gLQlzdHJ1Y3QgY2xrCQkqKmNsa3M7DQo+ICsJc3RydWN0IGNs
a19idWxrX2RhdGEJKmNsa3M7DQo+ICAJaW50CQkJbnVtX2Nsb2NrczsNCj4gIAlzdHJ1Y3QgcmVz
ZXRfY29udHJvbAkqcmVzZXRzOw0KPiAgCXN0cnVjdCBkd2MzX3Fjb21fcG9ydAlwb3J0c1tEV0Mz
X1FDT01fTUFYX1BPUlRTXTsNCj4gQEAgLTQzMSw5ICs0MzEsNyBAQCBzdGF0aWMgaW50IGR3YzNf
cWNvbV9zdXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiAgCQlp
ZiAoISh2YWwgJiBQV1JfRVZOVF9MUE1fSU5fTDJfTUFTSykpDQo+ICAJCQlkZXZfZXJyKHFjb20t
PmRldiwgInBvcnQtJWQgSFMtUEhZIG5vdCBpbiBMMlxuIiwgaSArIDEpOw0KPiAgCX0NCj4gLQ0K
PiAtCWZvciAoaSA9IHFjb20tPm51bV9jbG9ja3MgLSAxOyBpID49IDA7IGktLSkNCj4gLQkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPmNsa3NbaV0pOw0KPiArCWNsa19idWxrX2Rpc2FibGVf
dW5wcmVwYXJlKHFjb20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3MpOw0KPiAgDQo+ICAJcmV0ID0g
ZHdjM19xY29tX2ludGVyY29ubmVjdF9kaXNhYmxlKHFjb20pOw0KPiAgCWlmIChyZXQpDQo+IEBA
IC00NjUsMTQgKzQ2Myw5IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Jlc3VtZShzdHJ1Y3QgZHdj
M19xY29tICpxY29tLCBib29sIHdha2V1cCkNCj4gIAlpZiAoZHdjM19xY29tX2lzX2hvc3QocWNv
bSkgJiYgd2FrZXVwKQ0KPiAgCQlkd2MzX3Fjb21fZGlzYWJsZV9pbnRlcnJ1cHRzKHFjb20pOw0K
PiAgDQo+IC0JZm9yIChpID0gMDsgaSA8IHFjb20tPm51bV9jbG9ja3M7IGkrKykgew0KPiAtCQly
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocWNvbS0+Y2xrc1tpXSk7DQo+IC0JCWlmIChyZXQgPCAw
KSB7DQo+IC0JCQl3aGlsZSAoLS1pID49IDApDQo+IC0JCQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KHFjb20tPmNsa3NbaV0pOw0KPiAtCQkJcmV0dXJuIHJldDsNCj4gLQkJfQ0KPiAtCX0NCj4gKwly
ZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShxY29tLT5udW1fY2xvY2tzLCBxY29tLT5jbGtz
KTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gIA0KPiAgCXJldCA9IGR3
YzNfcWNvbV9pbnRlcmNvbm5lY3RfZW5hYmxlKHFjb20pOw0KPiAgCWlmIChyZXQpDQo+IEBAIC02
NDgsNjIgKzY0MSwxNCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9pcnEoc3RydWN0IGR3
YzNfcWNvbSAqcWNvbSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcA0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGR3YzNfcWNvbV9jbGtfaW5pdChzdHJ1Y3QgZHdjM19x
Y29tICpxY29tLCBpbnQgY291bnQpDQo+IC17DQo+IC0Jc3RydWN0IGRldmljZQkJKmRldiA9IHFj
b20tPmRldjsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUJKm5wID0gZGV2LT5vZl9ub2RlOw0KPiAt
CWludAkJCWk7DQo+IC0NCj4gLQlpZiAoIW5wIHx8ICFjb3VudCkNCj4gLQkJcmV0dXJuIDA7DQo+
IC0NCj4gLQlpZiAoY291bnQgPCAwKQ0KPiAtCQlyZXR1cm4gY291bnQ7DQo+IC0NCj4gLQlxY29t
LT5udW1fY2xvY2tzID0gY291bnQ7DQo+IC0NCj4gLQlxY29tLT5jbGtzID0gZGV2bV9rY2FsbG9j
KGRldiwgcWNvbS0+bnVtX2Nsb2NrcywNCj4gLQkJCQkgIHNpemVvZihzdHJ1Y3QgY2xrICopLCBH
RlBfS0VSTkVMKTsNCj4gLQlpZiAoIXFjb20tPmNsa3MpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0K
PiAtDQo+IC0JZm9yIChpID0gMDsgaSA8IHFjb20tPm51bV9jbG9ja3M7IGkrKykgew0KPiAtCQlz
dHJ1Y3QgY2xrCSpjbGs7DQo+IC0JCWludAkJcmV0Ow0KPiAtDQo+IC0JCWNsayA9IG9mX2Nsa19n
ZXQobnAsIGkpOw0KPiAtCQlpZiAoSVNfRVJSKGNsaykpIHsNCj4gLQkJCXdoaWxlICgtLWkgPj0g
MCkNCj4gLQkJCQljbGtfcHV0KHFjb20tPmNsa3NbaV0pOw0KPiAtCQkJcmV0dXJuIFBUUl9FUlIo
Y2xrKTsNCj4gLQkJfQ0KPiAtDQo+IC0JCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShjbGspOw0K
PiAtCQlpZiAocmV0IDwgMCkgew0KPiAtCQkJd2hpbGUgKC0taSA+PSAwKSB7DQo+IC0JCQkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPmNsa3NbaV0pOw0KPiAtCQkJCWNsa19wdXQocWNvbS0+
Y2xrc1tpXSk7DQo+IC0JCQl9DQo+IC0JCQljbGtfcHV0KGNsayk7DQo+IC0NCj4gLQkJCXJldHVy
biByZXQ7DQo+IC0JCX0NCj4gLQ0KPiAtCQlxY29tLT5jbGtzW2ldID0gY2xrOw0KPiAtCX0NCj4g
LQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgaW50IGR3YzNfcWNvbV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzX3By
b2JlX2RhdGEJcHJvYmVfZGF0YSA9IHt9Ow0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZQkqbnAgPSBw
ZGV2LT5kZXYub2Zfbm9kZTsNCj4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gIAlzdHJ1Y3QgZHdjM19xY29tCSpxY29tOw0KPiAgCXN0cnVjdCByZXNvdXJjZQkJcmVzOw0K
PiAgCXN0cnVjdCByZXNvdXJjZQkJKnI7DQo+IC0JaW50CQkJcmV0LCBpOw0KPiArCWludAkJCXJl
dDsNCj4gIAlib29sCQkJaWdub3JlX3BpcGVfY2xrOw0KPiAgCWJvb2wJCQl3YWtldXBfc291cmNl
Ow0KPiAgDQo+IEBAIC03MTksNiArNjY0LDExIEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCQkJICAgICAiZmFpbGVkIHRvIGdl
dCByZXNldHNcbiIpOw0KPiAgCX0NCj4gIA0KPiArCXJldCA9IGRldm1fY2xrX2J1bGtfZ2V0X2Fs
bCgmcGRldi0+ZGV2LCAmcWNvbS0+Y2xrcyk7DQo+ICsJaWYgKHJldCA8IDApDQo+ICsJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOw0KPiAr
CXFjb20tPm51bV9jbG9ja3MgPSByZXQ7DQo+ICsNCj4gIAlyZXQgPSByZXNldF9jb250cm9sX2Fz
c2VydChxY29tLT5yZXNldHMpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAiZmFpbGVkIHRvIGFzc2VydCByZXNldHMsIGVycj0lZFxuIiwgcmV0KTsNCj4gQEAgLTcz
MywxMSArNjgzLDkgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gIAkJZ290byByZXNldF9hc3NlcnQ7DQo+ICAJfQ0KPiAgDQo+IC0J
cmV0ID0gZHdjM19xY29tX2Nsa19pbml0KHFjb20sIG9mX2Nsa19nZXRfcGFyZW50X2NvdW50KG5w
KSk7DQo+IC0JaWYgKHJldCkgew0KPiAtCQlkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVk
IHRvIGdldCBjbG9ja3NcbiIpOw0KPiArCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHFj
b20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3MpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiAgCQlnb3Rv
IHJlc2V0X2Fzc2VydDsNCj4gLQl9DQo+ICANCj4gIAlyID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
KHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gIAlpZiAoIXIpIHsNCj4gQEAgLTgwNiwxMCAr
NzU0LDcgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIHJlbW92ZV9jb3JlOg0KPiAgCWR3YzNfY29yZV9yZW1vdmUoJnFjb20tPmR3
Yyk7DQo+ICBjbGtfZGlzYWJsZToNCj4gLQlmb3IgKGkgPSBxY29tLT5udW1fY2xvY2tzIC0gMTsg
aSA+PSAwOyBpLS0pIHsNCj4gLQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPmNsa3NbaV0p
Ow0KPiAtCQljbGtfcHV0KHFjb20tPmNsa3NbaV0pOw0KPiAtCX0NCj4gKwljbGtfYnVsa19kaXNh
YmxlX3VucHJlcGFyZShxY29tLT5udW1fY2xvY2tzLCBxY29tLT5jbGtzKTsNCj4gIHJlc2V0X2Fz
c2VydDoNCj4gIAlyZXNldF9jb250cm9sX2Fzc2VydChxY29tLT5yZXNldHMpOw0KPiAgDQo+IEBA
IC04MjAsMTUgKzc2NSwxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMgKmR3YyA9IHBsYXRm
b3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSB0b19k
d2MzX3Fjb20oZHdjKTsNCj4gLQlpbnQgaTsNCj4gIA0KPiAgCWR3YzNfY29yZV9yZW1vdmUoJnFj
b20tPmR3Yyk7DQo+ICANCj4gLQlmb3IgKGkgPSBxY29tLT5udW1fY2xvY2tzIC0gMTsgaSA+PSAw
OyBpLS0pIHsNCj4gLQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPmNsa3NbaV0pOw0KPiAt
CQljbGtfcHV0KHFjb20tPmNsa3NbaV0pOw0KPiAtCX0NCj4gLQlxY29tLT5udW1fY2xvY2tzID0g
MDsNCj4gKwljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShxY29tLT5udW1fY2xvY2tzLCBxY29t
LT5jbGtzKTsNCj4gIA0KPiAgCWR3YzNfcWNvbV9pbnRlcmNvbm5lY3RfZXhpdChxY29tKTsNCj4g
IAlyZXNldF9jb250cm9sX2Fzc2VydChxY29tLT5yZXNldHMpOw0KPiANCj4gLS0tDQo+IGJhc2Ut
Y29tbWl0OiBmNDg4ODdhOThiNzg4ODBiNzcxMWFjYTMxMWZiYmJjYWFkNmM0ZTNiDQo+IGNoYW5n
ZS1pZDogMjAyNTA0MjItZHdjMy1jbGstYnVsay05NjBhOTFlZDRhYjgNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0gDQo+IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQG9zcy5xdWFs
Y29tbS5jb20+DQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lu
b3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

