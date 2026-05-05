Return-Path: <linux-arm-msm+bounces-106033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNCEIH1y+mkDPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 00:43:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF04D46EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 00:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8FE23014137
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 22:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C30431F995;
	Tue,  5 May 2026 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="v29cWbGo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ec/aZJD0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V4CZ5nau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7EA2EB856;
	Tue,  5 May 2026 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020987; cv=fail; b=DZhRCljWbTeUBgjwODkC+fS0aMo/SYTHWg5mr1lhwRzyFJJjmtjC+oTTj0ipevHzvzJT28ApraVPiTAYkWXz03YaXkSR38sok/VTJplybHriy2c07VLKsi8rv4m0U4jUVNPNpaTUL72oAlqnDI840SzOmqwHBEAvrNyU7OHGtMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020987; c=relaxed/simple;
	bh=ic0gR2ypNSDlp0drFFZ+tjSUS0FpJLYq7IkZ1Fo26Ug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Af9D2k/wFsYWrxcJAe97ubXON+AQ5ok7BUj6NlEdcAcPxbMDGDjt4Ob1dwxKc3SCLIwbt7IXlHyenrN5czbxU5kR9K7dEEprPfeEZWvSRas728WegtWfkrONGLwJf6gwojqzk0P2MGHNYm13muTKN0rlodUkxVee9jtKVirjUBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=v29cWbGo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ec/aZJD0; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=V4CZ5nau reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645KmRdE1525389;
	Tue, 5 May 2026 15:43:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ic0gR2ypNSDlp0drFFZ+tjSUS0FpJLYq7IkZ1Fo26Ug=; b=
	v29cWbGoaZCI3jN2oBP0gZ19LLqr1h2Fg3baBsnyhZdlcaaQTSagGbixMohyqQ5h
	BDSBa/Gi0j3vedl5eZCNb1d8Dse6H+58NxDwDv2HEzADCDE6Sa9wmmhWYZBIyptJ
	ja8s/2dawQD08gpDmSe9S3SLAyUvlMXeFi7Mh31mtDYSOq9dlxJht7c9YZI+3lNg
	9kIXe9pqdTkDgtY0hj29sV+c2aLcX3QDbK2rWF6lCPRLnHKnV4g1cwngcUErfRCz
	aqgS1fzinVSteSJFQ5+u/tmdYXfstya6Z8bChflWzMCi4qgAt8GmAquIxcCBcf+2
	+lCpR302K5ZiEEDNBmFBpw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4dyp2fs80c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778020981; bh=ic0gR2ypNSDlp0drFFZ+tjSUS0FpJLYq7IkZ1Fo26Ug=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ec/aZJD0NJE40FH5JNefPOsNF34w13MwhTrP4btA8HzhCMk6QuASQ5/NeXNV0OgwR
	 Q3eWHNKfa0+czxEpQP4jE40TNaUYtAxkVCrmaQ1d3XSllX85CLLdq5hniz+m+f8ZY2
	 XOmEigbwDbP55Si2bsPsOs+DlzbxA3Jx1faVQ19cWZrQvcVY4yHz4wbpb5pKW1QPMS
	 yH4k/PmkwA3ccWiqJRiGU905i3Rm2+VDVEjPPpPN+rhT37yQZpMBr0KkKECh+aYsDe
	 irUiDojiuKj4x3cSvhjyfdranXUlPh9LebWJUBSeiF/aI8hy7s9jvWfqvfzCc5gMrG
	 B4zZLSD+fFaKg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0F5DE402D6;
	Tue,  5 May 2026 22:43:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BF1C9A00C4;
	Tue,  5 May 2026 22:43:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=V4CZ5nau;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00107.outbound.protection.outlook.com [40.93.13.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BD48E4061B;
	Tue,  5 May 2026 22:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a09smtXdzaGuUfsh0MnyAhe2UpPp0ZOABJv4ZnKFvkTrSaxbpi1m68h28U1QrdtVi9PrINKxBCZnprzCanxHyVmnQB2l4c73xWQJwdmT4CUgSN5BTHtNZiee29y1uA6HNxVcdbCHf7Oizngl5XWQ2du+xWhzPeKqAatkbthOBrTIM2SAaDEbg9vfjT1lcU/ZZCFLNxmGImSdtDJ0/5xktpUGWtGibpOobmZmtWc6iDvCf8GbqMEsfsDCKwsGV03gBCCqvnDKoeUhip0peSF3xNTmmtJTrBe/wBlTVj7eEV2/lKeEEAgLK6qIFxn1nm3tZqetgM1gQkpw7yzDrP5QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic0gR2ypNSDlp0drFFZ+tjSUS0FpJLYq7IkZ1Fo26Ug=;
 b=yDJesvAbnUqQVG4FmU+/kfmVuyes8luLPy3pPH809I3J4CV1GtBR5EyYmN2XtldJ2OEhxyzcEHfK4dufAbzYV9WJiY4MIGDhozr4f9Gpp4pQavzM9FqP9s0eBnJfcMKqS6PVF9dvQNsPYbh3GO0DartkFxdtvyc4GUi6fKLGdgRvkqEzAtHAQBp6SZ31PnqYSgFVZPYW9PlhPdw8sUftD6h0GQ/kiLVrm+7IOsOzLj4KLaGibElKUKVRU6D0HyAeXrVSyg0NqhCc0dCbnN/8ThYFgbclNERfbatznbgxHiTHzx6RFtpdU3roCpK1rHUxLX60soo8cr8gyaIof+QW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic0gR2ypNSDlp0drFFZ+tjSUS0FpJLYq7IkZ1Fo26Ug=;
 b=V4CZ5nau0/yevEEmqdBWFyrWJJrEcyuQDyH4cXirAGNdRcT2obox2EN6mH8bJ/yQl2EVLP3tIKzrXWXW5dcCOJLmPebuEpVRMoOw32q6mN7StxZUTVAaJz2BuB0n9y0O/jUmJvv6EhuVZI+NSm1EZTAnH7mQeqvfr3AmPWYAUjo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB7023.namprd12.prod.outlook.com (2603:10b6:806:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 22:42:52 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 22:42:52 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Topic: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Index: AQHc3Mdgyp7z0ntLdECFnZ2Esa74ybYABncAgAAA+wA=
Date: Tue, 5 May 2026 22:42:52 +0000
Message-ID: <afpyJ8aEwIVdgZEr@vbox>
References: <20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com>
 <afpu6eF9lDy4KfTN@vbox>
In-Reply-To: <afpu6eF9lDy4KfTN@vbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB7023:EE_
x-ms-office365-filtering-correlation-id: 2579be75-fe1a-46bc-bb50-08deaaf7a473
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 gWbbhaEKuVIpty0fC3AiB3cUATrIT3KVVL0QJicXRObz6fVDe6ci+dhHVSfKyLeeRJmQBds6tWk05o1yrond/ckIXBoM6/NiLY/VfQwITsSwKuiaOOTHFIeOF0gSOaMyzZxt8EdNP1kZUUZ9n3YVPdSRXEwpPJVnoywNydmJZECMZ0G4HdQ69YbAD8RoG/tuBWbBYKc10AnJnLe0xx0304kmRlh4+TB4eEsWHBVQCTnF4Z3aJQdm2xgUq4AcRJvzcYwU+RflaWb2th2LOWoIk/V1v6Gu8jO+uRtLzIxpz+ecN7i6wT1VbTPaxt8XLxmFzVZFByfcPFC0FWIYSmceiuS4pa0dX4YGis3n6dFXHWylBHPelkryZt117g1Jo7ZC0eEkmdKou0cQO8DL1LfDxdAugYfo+shjBnsTO12lt2XujeEdTlZKNz9/mtOCTFxDyLn3aQFdJKg9ykTlJ6MYmQKOweKIjsANT6+7XuFD81V5pO7aAQwm8F8FiJEGrjPQN1MSl1U9FAded503fqo9Sx+3TNq5ur6n39ZhLUObfICm9ChHPQHITRpwUJxbqKXMSeZxwQu69MxpHHtbMnVaky9+Qnq7XEJVxodI4L/SHt+r4Tw0owxpGkNOlL+ebwuSbuYGx7znjFlghjnEMxtdwLJ6/8qzT04ZU/wm5gG7TtiDVmcAFT1pK1lsSXQihsznvh97CJ7F1zu+lf3cIXhiGlqQPY/qOpu4xYbxcUwP1T1fBiRq3VP8HPc+6+xTqdWw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTRYWXNiRjI4VU1mdlVhY2tTd05PVCt1VTBkeEN3bjYwcExYT2J1Qko5ZCtn?=
 =?utf-8?B?MHg2amxOOEh2QkxpaU5NcHAxTC9HM1JwWEMrR1p5SmFNaWRYMHFMY2tZdnBX?=
 =?utf-8?B?MGxMcjZOd3EwOGVPMjBLN1hhV1BrZHlWUDRPYUhzdUZPQUFDeEdFSXdwQWdk?=
 =?utf-8?B?bXZWc0Z6OXlRTVp4ZzRIVnFuajltZGZrd21kL0RPZ25laWhOeExXbGNVTUpm?=
 =?utf-8?B?VXkxM3BxR1Q1MzV4bzZocTlRSVpYcE8zZ0hNTFNUVDNDU291OUNqMWJBK0FP?=
 =?utf-8?B?V0lSZkk5SEdBbDM3QzVDOU1vZE1Xbk9JMTNpdTFibDlUQ3BkVGFJOS9YVkox?=
 =?utf-8?B?SmhRSmdpbkJoR2pqYlRTbmwyaWhzdjFFazFodGpwb1NLeEkzQ3BxcTRMMVV0?=
 =?utf-8?B?dlpMbGFMQXVjcDRpN0N1cUNjaFF3cThTVEhJaHVhanAyejNKTkQ4RFFIaC9v?=
 =?utf-8?B?dHZuRnRMeDRkeGVXVW9JL3BPbVdyK201UGZrTTA4VDhFWmRHOHlpOFo4RWtG?=
 =?utf-8?B?Nm02RGdkd1h2d05GTGhxYmF4aW9xeTdubXAwWElldUsrVjUvNk5TcWo4bEt1?=
 =?utf-8?B?end0cVhCc00yODUzQ2l5Uk9hdE9xR00yMENOMEpvTzdEOGlFNmRNNVVDYUJy?=
 =?utf-8?B?V0xJM0tGU0doT1Y0Y2FBUVVNenpOZXFRZHg5dytiaVM5T1hrYVd6T0duMVQy?=
 =?utf-8?B?N3JnK25vNlZobTRaQk5iQ04vTnhGRUZDdlZZTUozTnR4eXZ4aDNVSDZVcnRQ?=
 =?utf-8?B?Yi9XNnJsNVBHWGFzTll6Tjc2VlBYWTU5ejBVcmh1dWVYMlFwQWRnYzJYK0M5?=
 =?utf-8?B?NnRMWjY4Skp1UFZyYkZqRUkxcVNOWksxcFl3N0VzV3pxT2tzSzk4OTFwUnds?=
 =?utf-8?B?K2Q3VnJGa01CL3B2WTNHVit3NlRKOGIrQk9adXh0ZDVzU3RyNUdFWHdZWTJu?=
 =?utf-8?B?OEFLa0N1bkZLZ08zSVljck1jNkN1Q3kyeVg0M25YZlIrV2ZrdHBHb0pTaDJi?=
 =?utf-8?B?a1JTaUd6RWxQV1VidmN0R1pocVhvVmZid2IxL1krUS8vMGdOdW9vWW0vNjhQ?=
 =?utf-8?B?SUI1WXRKUkZaZ3VVRHBnb21YWXpKYVl6ejdLV09QclFPM1JKZWw0aUhzSk9x?=
 =?utf-8?B?UE1oazg2YXJiRHFWNUdrcjMrbjB4cllVeHlxd0htUDVHNHRnQ3U5U1Z5cEo0?=
 =?utf-8?B?YWZTQk5IWDFISWhrdzBtSWpqRzdxMGRnbGpVUytHanFNYVJnTjMvcGhJVFVK?=
 =?utf-8?B?dEJLK0FncWhaaWQ4R1QySGpVcmNZTHgzU1hYdmJ2WVlsTmFkOU5QelZvWmkw?=
 =?utf-8?B?YmFLWStzc05XaDVDOFMyeHl4OFI1Nkw1RGI5ajE2Y1lyTmF0a1QyQU9tSjY2?=
 =?utf-8?B?Y2RxWDhhS0Rxc091WUVPR09SSWRTeGdHczZ0dHN2R3ZsTkJxUGlGWk1PVUFy?=
 =?utf-8?B?ZTR1QlJzdzFSYnJaZFIxWEZXS3RpaVdKY1UvYWplR2FCMmdMczh0Q2pMUzlK?=
 =?utf-8?B?aFpONkl2UUMyZFhzUCs0WUNVeFg2eVlwVWZZT2tqandCM2ZSVWNkbEZLRWxZ?=
 =?utf-8?B?c1NjbFZENEdDck9jVUNZSU5OYmkrdmQxTmlMTWJ6ZFJhOUE5MXkwY0EwZ0lm?=
 =?utf-8?B?QUFRcmJickJicTl3Z3Q4YmFBS3g5NCtRZkhTUnBHZ3FRSURLRE5hUWhXZlJY?=
 =?utf-8?B?aUh0L3JwSWVqRTJBSTNJVi91cWU5ZWxCS0J2N3I3QnBNMmpXbW4xZXhscUJE?=
 =?utf-8?B?Vnl5MkF5emVuNFBNcGdMY1hXa2pnUWJzUFc2b1FiWnhQa1VyejR3ZlF1Um84?=
 =?utf-8?B?R2lENUpyRTVkb3V2Vjh1eitkUHFCSytSWnB3TzBjSnI3RGZDT1pFb3BwU0VI?=
 =?utf-8?B?TUM5VVFXTXNRMUhmbnJZOXNEZEIzQkFBd05lRCtXUGR0RUtQc1JVN1BCbjMw?=
 =?utf-8?B?cXZoWWxqNlFlelVJMGN5d1VjK01McGI3Nk0yM3ZMeXVUWFpmdWNlUVRzYTFk?=
 =?utf-8?B?d0FPNFNkbXdHdDNjMU8xUERCMFJmeVRwNldCTGZDd0dlNFhBbGFuVmhhQmpR?=
 =?utf-8?B?Yjl1UDI3WFZhVUlIR2pkMmJiZzljUkRadXA2aE1raGNpRkJQWEljTks5VkRK?=
 =?utf-8?B?Q3I5WXZ6RHNvU3BEUEpoUndjWmxZQWw5SWZERWdXZUZJWnZVWkxzSEVvRFpO?=
 =?utf-8?B?aGFDUUFwR2VDQ1FkOHdsN1R1dUJtT0ZQTnFPNjltVmRualRndFVqOHNVUjgx?=
 =?utf-8?B?elZkWk04ZFFKbEtNcCtnSklSWkNoZ2NMVHI3aHRZMjBDcExFVzRuZStsOWZK?=
 =?utf-8?B?eDk3WmV5SGptbmd1TUg0c212NXFpb2dwMHFWa01TQzkxK1U1NFdqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4CE33CC33A9D7448B4CAB6F2A0DCE12@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	de5EOZ/HVFgXTbbwtsZSChKFSRzkAYWX1impyofXWwduiOJ6vAUgKibZFgAhXQj9gyKMSCBpKtrw1IrMPGJNIz7AN17qh8kNvPtKxgLWy44HAcyfr++u9MDzJGm2NkAOPCne9FcUhlaAHClClR6ekQeX0sQ7qaYs8LjXuwAzJR3qkkofN+87NywRqT94icIR3neJOZxH3JPSqSpIiN6wtG/+HaDoizAxuVULiD1lAoS2zdOL+GRy2klPYjUMGM6LcT1MsozQb6DZca0R4UG7avUF/+MeNglQ18qQBazdHmA+xDYdlqWmbVTbw7tafLTHxOipss2rzf0FzNjQ2vQU1A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3U+Mzci9w8HdmEjSXl2lgLCHPmR7TWSV7T+o5BaE3bLKpVvQ7iL0yl8aMsoAKYOXdkVbgliDQaNRTQKZM2z2o5F9q0BwXs9jF50yN1lwF5MRmPyccifb5jgcri6S2wADi3o6ZkMfNNuIUnPuqvvDVgMEQDyFEdOiad/tlu0FSwxG7Ur8YRBDZjaaM7lrDc2KSZpquPggrAoAr9X0fKQ5jN6KMi6IhT0btAxt8j349G51tQSGN44+vGBOrfbvGYgOWjLs6ozb4H/fmRA/siofSklCObsVBVtN4LK10kf+bldZnjbCO4dHYNzzDhlaQYO739A+xeMNh1POA/SNSqp4yG7lrip69FdKlID12vIt9wa3EpnpKiZZs3S8GuKGj/779Z6nUtzkdPJOCrbzLwuiCJqmsVWNEoLl+lMuQaAdD1WblsesNMNmFKBbSTkcJNAtDpthyMlLchawDktYgdr3GcHTkBzacXfhCvtH6RvgbtCh2Uvab1Zg8rt/95VL+hzdh6h2XGD84XEvZrC1ISl+e+HbKx/Oxoc23XBoq3K3LWmhW8pvRSidNMP2AXsBp8FtcXlbZU9oXLHyi5zMNRvovWQp4NcTiz64jjsxeSxQC9KyYyy+BmOdxgvKakf3mrgFa8cM7B86A6jGViILnwomjg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579be75-fe1a-46bc-bb50-08deaaf7a473
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 22:42:52.5645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1Z8sOV8FqQJ/ENiN/Jz9kimE4TrV78wbS2X4NPJkzeDZ4t0fdpA6lyt+Izv8M8Axf+ErHXJoamtHHmen4PzWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIyMSBTYWx0ZWRfX5VR/txIlj43E
 WK7JWjZsARP/KbNjPjaXMPXhjwaPWJzAfef29XBuGv2LKAEPYNVnOFqWLrUNdSWZ36QMIV9Egvh
 4n5BVQ66k4Ud2SbGG13P6uSqmc5Ups9euSU+nl/Wix58ZGTMn8jGrrbUitZTDNIcgte9jc7yEXb
 f59nvneDNFzuIS0Ft483bmqcRCKi2Ze60t9WVgYgWMpFWKCn6FtEsUHMOIluE4shLS/1xCcL8uH
 5U+uKEIGN2N41IH9c1p16+f+Q67AmG+e+K25DhzzAdn9PcA4o3uzmqy/K1vNgBq+qecSsbJbkY5
 SvPwGyJBX6JFiMdwS4nFkTnpI02ID+tVAWk5LRv+/EDq6seni+vCJY3kAC2waXTCu+396w6TzmV
 U6NGeBqHn9LayDQHzyqqK6FswDjhld+sS4Oz7RRSISLYKR9mCXPMfWKtqYj6far94mym4A6DXYr
 jGhbn8jy4ooUA0GiO0A==
X-Proofpoint-ORIG-GUID: AJmpztDw3B4ahGPcvb4dPAnIZ-FBhaaW
X-Proofpoint-GUID: AJmpztDw3B4ahGPcvb4dPAnIZ-FBhaaW
X-Authority-Analysis: v=2.4 cv=Qq1uG1yd c=1 sm=1 tr=0 ts=69fa7276 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=9LWtvugFk1qyQnlIWDwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605050221
X-Rspamd-Queue-Id: E5EF04D46EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106033-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gVHVlLCBNYXkgMDUsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gV2VkLCBNYXkg
MDYsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+ID4gKwl7DQo+ID4gKwkJLmNvbXBh
dGlibGUgPSAicWNvbSxnbHltdXItZHdjMy1tcCIsDQo+ID4gKwkJLmRhdGEgPSAmZHdjM19xY29t
X2dseW11cl9wZGF0YSwNCj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmNvbXBhdGlibGUgPSAi
cWNvbSxnbHltdXItZHdjMy1tcCIsDQo+ID4gKwkJLmRhdGEgPSAmZHdjM19xY29tX2dseW11cl9w
ZGF0YSwNCj4gPiArCX0sDQoNCjxzbmlwPg0KDQo+IA0KPiBEdXBsaWNhdGUgY29weS1wYXN0ZSBp
c3N1ZT8NCj4gDQoNCkkgbWVhbnQgdGhlIHFjb20sZ2x5bXVyLWR3YzMtbXAuDQoNCkJSLA0KVGhp
bmg=

