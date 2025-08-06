Return-Path: <linux-arm-msm+bounces-67820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC3B1BE04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7E6624A41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55FB54918;
	Wed,  6 Aug 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BRt6J4Ow";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eXsHBI6o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DNYCtlu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96834AD2C;
	Wed,  6 Aug 2025 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754441431; cv=fail; b=VgZC/i26Hs6CO8ksdhMz/+CvnRJ+JO7dXj7MXorwvITdkBTO98/Wv5OMoZR/s0/iqm8i1fL3dxuubNUi2azQuKkA2MmeiMqG58tDACq0si0jUPKcUHtPSQVzf3s++HGld/G/tKhVFyGCpPo3b+8RmyGtlupKBUGFQZQrkT/di14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754441431; c=relaxed/simple;
	bh=XBbnHQWqfGw2yqZ8TdDQtlzTXePrBuOaid1Fgo8XVDM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMY9/wVu6Yayw1nBP3MN74x4swioDd/gl1snj4eNOEWWBjxvF6Y+h4sC4B89n14cGy/rEuk3GCVNkNtTz4xlktmyLGrB/v2qW3MYKCJiVQ7hF3YZW8O6V8eNqlfHES4nt2AXzltnJZge1Coe656mU/LLXgmq00h424w0rgZkYFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BRt6J4Ow; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eXsHBI6o; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DNYCtlu8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IB0G5030677;
	Tue, 5 Aug 2025 17:50:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=XBbnHQWqfGw2yqZ8TdDQtlzTXePrBuOaid1Fgo8XVDM=; b=
	BRt6J4Ow2Q8olrn8ItXC6rNHLwf+EZvURop4AMSJes39oDaPyuN4tT0/2ltkVle9
	+IjhNkEAee2+tc2EbfSDiX9Ex2YEwTR8Bq8/sQL7DbhCWjKO+t9BF1uYN0VvRciA
	8klIczIcmWyT3Iyd1b2kxHO3GsF6ti3IyJkjU1R3ZqmVptLR8VtI91STyhxP2eDW
	JcxCOViN1FS1DchNh8jPoRZcd3A+hTq0PKtY+JdmvEhFSxGLif7yPcxZ4kqymxz5
	aBSaeE2e3f/BBxK0ZeHdfEP52zVuZePOwakcGGueKYqBuWzoxrah+41OoVQ4+Q9t
	VZtAtq1kz6QszKRZ+l0/qQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48bq0v1s3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754441425; bh=XBbnHQWqfGw2yqZ8TdDQtlzTXePrBuOaid1Fgo8XVDM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eXsHBI6o+yvnoM2RjbHMrvjGy+dp9iePdLPr+XaDG737nhH2Mzmh/0+RID3gNAIN2
	 ClkidLEBN6wrLpGlbtxrjzNYY0ckwSOEdFPnOftwu8g5meLkqhcedUhoJo2gRlmrLl
	 jubleq/8cM1osgecDTYqEPVSMr8Ute0x+8R24nAyaxGxDp2qaY1CxU7I2RDk2Hd8ex
	 JzRU/SHEIclTTh+niwEAuB53XyFcX4o+GdHvIomZzRY+8FvkkcCrBgtKWK8ZrbJvck
	 LWFfsUWHQqbWnz+JqzQaJWiOtJZllzZGumhtBJBfwRzmiwlAiJKfPvXrU90w22RGsa
	 igQ7Vn7DmlQ0w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25AE040467;
	Wed,  6 Aug 2025 00:50:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B391EA005F;
	Wed,  6 Aug 2025 00:50:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DNYCtlu8;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1631340143;
	Wed,  6 Aug 2025 00:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiYqXqCrxKVD1h5xwXYg88OBloSpSKns3E30Z654DtVWyPLw2izPE0y5+rjm0Mm7SG6szBGF1PraIgR2gYHVkSIK+u5FnqdBPRYFNqw6WyCXPVyFzLeXjlDEYFAvzt+fsbg33ak5533nbIiCzpg9HJgmQ0OwWETtKBlik4Bmp0M7j4jQLrGISPDR7FygT72qMRkcu7n2vnpFkp889Rkxl9RQlmC32hItpWv8KfK+YMflDvBLgk0YviTP4pOQJpDh17IjQY3CAgZ6fbB1ff+TTpvrExOgl4qCjwBHM1KvUooFp4qKNlt3CK1z/n7SP6MDBDi+Y7yD7TMY2ZMYIgeS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBbnHQWqfGw2yqZ8TdDQtlzTXePrBuOaid1Fgo8XVDM=;
 b=Ga6DDy/Lzx9K6UrnEfys0x9dxABUaDp3Tp7Dhry7eBMLPv9oFCVUMBO7GqyO9LjUmm5Kn35kA5tjWoRo/s7qG1UyeOse9WE8YTuDnJaMbnwyxlneoIICKcLqgvb0idMufsst+BrbPEcKBG2I4oRnfu9CcRXTcKVJ8cN6GUfW1H4dnnndjpJMKS2etmmBTvyGT1t70h4i+5mX4cgoTgdl1S7Xzw/u5GNbjNB+RSYBe56Q9j0YeIKrEb76tdxEQaOLqu9Yde3ElPg8xmBeEfvWVDP9hniZeIai5dbCD2dPexD7k2gdwyWB89QUmAQjJ47hT9FuetiXVPdWhywhsq4Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBbnHQWqfGw2yqZ8TdDQtlzTXePrBuOaid1Fgo8XVDM=;
 b=DNYCtlu8CIP0S2cVWnS5yzXXIE4YPamjAGUVtLaz7M7ZpIki8Le0ql+dpQOBDBgg/VRvbIYPV1RFg8Qlw9d4foHeyd5NqKOdcDvl5u5cqmZTiS0yJBULHI3eJRMmqZMCKd6aKryGYOJ3UD9EgYYf0YLzlKb6vNmdkuPjpSRZ1Dg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 00:50:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 00:50:18 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index:
 AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWAgADi4gCAG2ZUgIACOgUAgBovsYCAAA7YAIADD7uAgAb1wwCAAMkRAIAAEMSAgAAI/AA=
Date: Wed, 6 Aug 2025 00:50:18 +0000
Message-ID: <20250806005018.zdouack5cgdhj3lq@synopsys.com>
References: <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
 <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
 <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
 <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
 <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
 <20250805231808.cjht64mfabaw2ik5@synopsys.com>
 <98f9936b-3833-4350-8249-169784be1e53@oss.qualcomm.com>
In-Reply-To: <98f9936b-3833-4350-8249-169784be1e53@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN2PR12MB4045:EE_
x-ms-office365-filtering-correlation-id: ee91d933-22eb-4525-3524-08ddd4833743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dUMvNXY4bTgzVHlxMCs1Qk5qVzhudzVnWTdydDFOREhGUWtoUVdLbStxVkNE?=
 =?utf-8?B?RnM1Q0FFaUhpaEVvY3o3SkZqN2FPWEFWbGpob09KK1FGNUV6eDRTdVZvZGta?=
 =?utf-8?B?RjZhZHFwVG5IY3hMVXVTRXRmb09BM3I1Z0pqK1ZpMmZNWHFQLzdsZVRmdURr?=
 =?utf-8?B?QUtSb21xMHlGeUZBRnFSS05hcndWQ2tJSDJPTWRUV1BRYVkwbW9rMnlkVU9m?=
 =?utf-8?B?Wm84SHd6WXp6YVpiK0RzZHVLaTNWQk1INEM0UFlFa0VlaTRxd0ZSd0lPRytG?=
 =?utf-8?B?SXE1enM1Y3BCbnVWK3Q3MXAwRkxXdW1SZUZxZU1uL0ZENTZIUGFBd1U5MU1T?=
 =?utf-8?B?RG9zZUFTNjJZa1NqOFF3VmkzSUgzZ3VYcm5QbzFHQjhLdDlrV0lYazZoS3RZ?=
 =?utf-8?B?SDVrYlJ1Q2tFL3BzWTZHa0R0bENhUC84ZFZtSGRZVEt3TzZLOFJQaWdZZVQ3?=
 =?utf-8?B?ZklhTkZERXVmMG9UekdLbWtrQkd0S0haRzQ1YlJVcTJjdmIvbzQ5aFd3YTJB?=
 =?utf-8?B?bzFTWEpvaWFzWFdZVnk5Q296V0tRQ3dlWkYvVnB6aWJ3M3U3L0RYZVcvbWx5?=
 =?utf-8?B?YytrYW1YYXR5TjJBT01uVWRGajZKbml3Z2hDc2daVlF0NkZQdTNLZzR2SWVM?=
 =?utf-8?B?L0pEbFR0a3F5WFovQmpOeTh5ZlNnK1UrWFpKMURaaU12dGtpUyt4cDFuSzVh?=
 =?utf-8?B?L0tSSzc4blUwSnEvbWVKbnZGVzJ4T0daZWFXNW5LQWUzRTR3akZUYk1nbThJ?=
 =?utf-8?B?ZUhjS05hR3B3UUllZVpmR082bHFLWXV2cDFISU5SbjlLZnFrWFRvb0MwOExx?=
 =?utf-8?B?VnB1WTd6eWhVWVFUV3N0VkFJN0VnVnBqSCtkaUYrRHdEMGw2M1hydzg2WDFz?=
 =?utf-8?B?aWs4aEhzNTFVN1hYZXVBZzBTVjlRdkR6MEk1a2ovcHloNkoydUpWZVZvNWVU?=
 =?utf-8?B?MDNmb1A0eXA0UWt0QXk4dVFwYlVuQnB0aUJlejR6WXNSYnlIWE4rN1BDakUy?=
 =?utf-8?B?OUJ5TUg2K2dlMVc1M09sQ0ZnbzYzdit1TzIzTElzOFhEUkJUZHAzaHVSY2hu?=
 =?utf-8?B?VTdjcU0xcVR1amZVaEEzelFPZ2dyRStPNWg2eFptbEVETGlQbXE4cjFVbG4r?=
 =?utf-8?B?M3orUVBkRSttQTUzWjVUZDkrK3hXVWJObFUxVmVGSmduWk9WTlNwNFM0Z016?=
 =?utf-8?B?TTEzMUtEdTJGckdPUURwS2o3SmZOeUI3YllSTE9UM3ZpK0NqVm43YWxNNjN0?=
 =?utf-8?B?UndrYTRMa2J5ZXRzR0lFbktPTzBiajJWV2RCczFYVHB2TEZhU0ZTWU5HaUQr?=
 =?utf-8?B?ekdNVTB5SExheG9kRXNzT1pDK1dDRmRQTjRZdVZMWC9ieS9QWURHOXdOTjZt?=
 =?utf-8?B?U21EWHFNWnFiUy8zU2VnTVNVVjkwWmZqMzN4aU5SQ1gzS3Avb29MMlBtUmFX?=
 =?utf-8?B?RnFPSzV6aDZRbmR6bmFnOFQ0NkdBR1RYQjVTOGUvVlVPVVlIMDRCUERicVIw?=
 =?utf-8?B?UGhTdklkNGNocHpSQ3BXTjV1TUNmNXg1ckFnTWJkVTlLRXJMc3lsbDJhTVVu?=
 =?utf-8?B?SFd0MTVuVXE4bytpRnJ1d0xScWp6T3p1N1Q2VHJ0cG5ibjY5NUFteHZRUFBr?=
 =?utf-8?B?WHpSZGUvUXBOMWx3WnNzdkRrUlRoODd3SWMrUTFjc085bitXcHl4QlYybnYr?=
 =?utf-8?B?Mys5WU93blNueUZFR0VsbjJCMjQ5aXNlYm1Ld1NJMDIvZWVRd1lVQXA4anlR?=
 =?utf-8?B?NFpTMVpqUWlRbDZyRmJsMzY0ZEVIeTdycVNNaDZpVHl2TVVFM21Da08rVUw4?=
 =?utf-8?B?L3NmQkxvajVnR3pLMzRJY0hzZFFoQ1BMWEVEK3pYaDloalpReVF0U0RHalBz?=
 =?utf-8?B?R0ptNCt0VlQwdlpBM2JJZjVDZUx5NmhiTk9Mb3BQeFIxZnhYMU5DQnY2cktP?=
 =?utf-8?B?Q3hKY1hwK201eEhiNFZOc0xUQW9Kb09oOHFQOEgzbzFkdlpUa1pMZHFhb1NH?=
 =?utf-8?Q?/n/BLKt5qgi1zLJV8SXQ3mqD44D96o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1JaR01SOWZkcWo5eHJwbHhMOVg4MEJmZ2d4RU5rcS9DQXZMUzFHdDRKS0NW?=
 =?utf-8?B?QWMvalNwZUNNbjZ3a3EvTEFrdlMwdWVSOVJrVFpwQ2VzNEpxRStXWUU5UWRE?=
 =?utf-8?B?Y21rUWNFNktmNXFYZ3BCNWRZMHY4ZGlNV3pwcFVxZ3ZMaTQwalk1azBHc0Np?=
 =?utf-8?B?RjJVelJqWTJFdjRHYkEzL0JMUk1xeUFBWGxYazd3d055d3UzWWFkd1h6YnpC?=
 =?utf-8?B?ME1aVjB5c1drN2QrdVFWcWZLbG9vMW9mdFMyb3NKaW91Nk9Xbi9aY0dLYzNV?=
 =?utf-8?B?VUhIMTVwM2x4MDVXbG9PbTkxbWxQb3dTL1ZsQ2pXMlVNemg5WFdmRUY3UVN5?=
 =?utf-8?B?SmxDWTJTQVoxU1lDUWVENHFTOWtVU09DOHczQVU4Y01tUlk2bVFYYVBVVWox?=
 =?utf-8?B?TDRCdnJlaEJMUHk1ZHdxRFN5NW0xTXpZeGdjc3d1Ly9KRWd4WktYeEo0SUwv?=
 =?utf-8?B?bjhhK05oU3BoS2g5c1cwbWQ1eDhKMysrOWwxbkt0UWV2U2dxcXZTdHM3a1JH?=
 =?utf-8?B?d0hSemRlbkVzRWJNeWd3cHQyS1hKdllOdmJLUnZzdG8zdUhaQklKRUNzc2Fl?=
 =?utf-8?B?OG1aVWtnenBpcFk2L0Q5TFpBVjdselkvMDN6aW5YVWQrL0tiOGxuTUNRQ0Fj?=
 =?utf-8?B?amxNTXFrSXgvQkZsaXo2RllFQjJJN09LTENkaEtUNEJnbndOTHhoMlpCdnls?=
 =?utf-8?B?MjVVR3dEMlEwMitXR0E0VWZiS21WTVBlWGVsMkNHdVRSYXpncjVxOXdncUNr?=
 =?utf-8?B?a0l4K3Voc1ZtSUxZYlJZSmcyM3hVMmxBUjhMQXMvRU1HT0ZKNWxjQm9SRlkr?=
 =?utf-8?B?cHBhc2ZnM1VaVzVLa1F6elRlVlR3djJ5UzZ3VndmMmtwOTlDZUxkdGxBODJU?=
 =?utf-8?B?a1Vab2xqSHhtZmVEbDZaRmVURXVxMm1yVTN5eGdEWXMyUzRYbjcyZS9heG96?=
 =?utf-8?B?WUFHaXRQT3ZoSE1QN1ZOUU82K3FOWmJ4eVBOU0R4SnNPN3Y2R2dFTE52RUR4?=
 =?utf-8?B?YnhuaDVuQmZOcUpIbXBIQTZyZXBxeXdIRHhEZm41RFVkMDZVUW5sS2EyMWYz?=
 =?utf-8?B?bmlOckFXT2I3WGxXWld0Q2tjQ3ZVVXhzZG5QdEhUMEpjdk1uNCtSV2dhQWtT?=
 =?utf-8?B?RTV3SFlWTERodzhrblNRczJFOS9NRlIzVEhObVZuVGMyNHlna2VoL3BQOGF1?=
 =?utf-8?B?MzJjRVFLU1NQM25IQTJQZkRVY0QvYTNUdEpLaHlGZERaWVRybFl5eFhRVHp4?=
 =?utf-8?B?V2IrbGNhQkJKa25qUFYwRVFSWmlpejVsbzl2SDB6UVUxTy9CeUxDK2c4aE1Y?=
 =?utf-8?B?ZERNeDQ5Rm41Z1ZUQW80cXR3MnZLanJMQk83WGZKVjFXRTJqS3hwRm5hMEQ5?=
 =?utf-8?B?NEJQN0Ezb280VXBJRHVwKzVIcVZuMmJOTXJXdUx0OGZNQ2o2WE1XUVIxV2tY?=
 =?utf-8?B?aVpoSjJKNU1pd2tsU29UVG5DWlk5ZXpCbWxDQlB0N3BJRGFpNEJya3VTd1ZO?=
 =?utf-8?B?NGxyL0haMS84aEdwRnZWSTRPL21PaWJpN1pySFZQc2hyTEZwZWRTZGRNOCtL?=
 =?utf-8?B?MVJORklWczBPYkxzUE9uektmSUgxUWE2cW5VRFk3WlZ4aW4wdTh6TmNCQXdZ?=
 =?utf-8?B?UE1NR3BiZkEzalpNQWtuS2JWMUJvTUFUUlFpdmhMeUlhdm9zVC9lY0loZkFm?=
 =?utf-8?B?emZpUklBY1FiQnRLMExJMisxYkF3UW9aTFp4akZ3eDJGT0JlSmFiMUNwakRx?=
 =?utf-8?B?V2phY2hDZHVrMlBHM3ZqY1ZWUlBRZXE2UmZGdDM1MzBOUVlySDV4M2FSM3pP?=
 =?utf-8?B?a2w4Nko2YTVmdk94NTJjQ0JMYU9NWXovSU9jVUJwNjhQZEpMdEVpQ2c4Rksz?=
 =?utf-8?B?TlRPa3V2dVArZmc2ek1NaUdkSnZYVlJhRTcyS3IzMGsvNDBPSy8rTFRGSEg4?=
 =?utf-8?B?b3ErWDRkaEFrRTVXaG9SYXN6L0d4VmZYc0tpVXoyS0tuYUhobXYvMmdBSC9F?=
 =?utf-8?B?c05IYWNIeWg2R2dkREppaEw4aTJGQkoxZEhmTTFwcXk0V1BObVZDaEtkR29C?=
 =?utf-8?B?ZzdsVHlBWVZKeWxoV2NXeW9YQnlhRnFRRUg3ek9OMXhiaEswOXFHREpPSkds?=
 =?utf-8?B?M0F5c1ZLS3d4LzR2UE5oWno1TVh5MHBOOHVMUFNJRFdNazdyT3kwV1NHUlNo?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A407D30614840D4D882411B3E2F25A03@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9bMONn4tse3ZTNwqrXBs0jd1uKEgpQgwsKvJqIVhRPS5d2hBh4lPVeB6i6z/H3QkrRdGW7L5KIsu1PY2UofecbAnUULbq7Sasoxnmp+zpgNNAZIRV/ktbaHLDM/ckZf4Aq36M4d9dszxwE++rHKmmpaKjYlYBE+f+MAIFAmu9+0r8uV0III4ObhNKHYe77hH7Q3kow9jrCSax140HRR/qI1kqQoun+yv8H6UVCuIKrnWM4hsex/jxSM+jkYnFwRLytQkvcMLG+taA8inQvEEFYof3np+sIZwlBAKtwubcD3bFecxrAewB3S/IwBojIvfQPkqmB5fWOAsS2j6Gjwo+hCUGQ+h3Ll6+8fdHN/kxh0Pw596UF/eADXpUFLED5KIQM6sWc8SN0wFjbR7ergc/ZLGwwaf0Ai/V49YJUgqyrPBw30+FhPDgFIeami48d4AcTnaAwM3k/ngm90iIzO9t5vDelFKFzOpM4FbLe7XFfe9Yjxr93xI3fwS1mdt0jn06WDdjrH3PyMNwpW+K+6cLvC4WUUsVkXXRrpRkJk/xG/ucBH+VpcUHUWFpBZZBmUnnKtJAGBmVXN+StLgtawX2HxL9lJhNE43lCBZDHeUtTd/Ld8A8Aquj1vnhGqVvTcVKMpSuQItEk4VZrVREtoccg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee91d933-22eb-4525-3524-08ddd4833743
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 00:50:18.9340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9k0EqRgfpO2q19rdPYn6nTiAoWHn2OguXgE9F6e/TqDHqzviH37HlYt2l1nRO5jB9P4axsDRvmSEoVe9ywoLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
X-Proofpoint-GUID: LI5BEPvXAKOFIa2e4Ab2jYmb98jMajli
X-Authority-Analysis: v=2.4 cv=QJ1oRhLL c=1 sm=1 tr=0 ts=6892a6d2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=1kVI7lEY8e-oaGt1RUwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LI5BEPvXAKOFIa2e4Ab2jYmb98jMajli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOCBTYWx0ZWRfX/mb0bwwPZefb
 jeWfsPiDscELOD6YuxEw1EwVyMh9hTtnsi3SACU4+jCkmlNi472GpfvrcRsysnL4jPQpgv44ARv
 BC0QTPkNDqpR+tYd9wLXrT7pOcuqSLJjpKDdnrsHZZ18znwRsN9Q0POvGWgQBTsZ5ZIPWJU/Uws
 0iZ4U4OhWWyK8HWhtPurXoyXB3imD4e1680iUQXmvwsahxQn668uZMFAAliB6mGnLygamLArQgL
 cZAfoqFPOEU8HSgYWSpu0Nl4N6t2nZ+5Xm9ohPNjE7lkw7p3ch4aYic6tOideqjOf4s3Ypsb0Sp
 otdELoyx1Ris4Ow6I5LoQNqxa1g/pPdGBeGdy0DnoZMqEL9oMv5MwmpvEMpQK+MU08Dmh136GGG
 DY/gVoD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050128

T24gV2VkLCBBdWcgMDYsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gOC82LzIwMjUgNDo0OCBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gWy4uLl0NCj4g
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gaW5kZXggY2E3ZTFjMDI3NzNhLi5kNDBiNTJlMmJhMDEgMTAwNjQ0DQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBAQCAtODksNiArODksMTIgQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgCWJvb2wJCQlwbV9zdXNwZW5kZWQ7DQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgCXN0cnVjdCBpY2NfcGF0aAkJKmljY19wYXRoX2RkcjsNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhfYXBwczsN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwkvKg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICsJICogQ3VycmVudCByb2xlIGNoYW5nZXMgdmlhIHVzYl9yb2xl
X3N3aXRjaF9zZXRfcm9sZSBjYWxsYmFjayBwcm90ZWN0ZWQNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiArCSAqIGludGVybmFsbHkgYnkgbXV0ZXggbG9jay4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAr
CSAqLw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsJZW51bSB1c2Jfcm9sZQkJY3VycmVudF9yb2xl
Ow0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gQ2FuIHdlIGp1c3Qg
dHJhY2sgdGhlIGN1cnJlbnQgcm9sZSB0aHJvdWdoIGR3YzMgY29yZSBpbnN0ZWFkIG9mIGFuDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IGFkZGl0aW9uIGZpZWxkIGluIHRoZSBnbHVlPw0KPiA+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gQ29yZSBj
YWNoZXMgb25seSBtb2RlLiBXZSBuZWVkIFJPTEUgTk9ORSB0byBpZGVudGlmeSBjYWJsZSBjb25u
ZWN0LiBTbw0KPiA+ID4gPiA+ID4gPiA+ID4gYWRkaW5nIHRoYXQgaW4gZ2x1ZSB0byBrZWVwIHRy
YWNrLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gVGhlIGNvbnRyb2xsZXIgaXMgYWx3YXlzIGVpdGhlciBob3N0IG9yIGRldmljZSwgbm90IHNv
bWV3aGVyZSBpbg0KPiA+ID4gPiA+ID4gPiA+IGJldHdlZW4uIFlvdSdyZSB1c2luZyBST0xFX05P
TkUgdG8gaW5kaWNhdGUgY29ubmVjdGlvbiwgd2hpY2ggaXMgYQ0KPiA+ID4gPiA+ID4gPiA+IHNl
cGFyYXRlIHN0YXRlLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gWWVzLCBidXQgdGhlcmUgaXMgbm8gZmxhZyB0aGF0IGluZGljYXRlcyB0aGF0IGluIGR3
YyBzdHJ1Y3R1cmUgdG9kYXkuIEFsc28NCj4gPiA+ID4gPiA+ID4gc2luY2Ugb25seSBkd2MzLXFj
b20gbmVlZHMgaXQgYXQgdGhlIG1vbWVudCwgSSBhZGRlZCB0aGF0IHJvbGUgaW5mbyBpbiBnbHVl
DQo+ID4gPiA+ID4gPiA+IGxheWVyLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBIb3cgYXJl
IHlvdSB1c2luZyBST0xFIE5PTkU/IERvIHlvdSBzZW5kIGEgcm9sZS1zd2l0Y2ggY2FsbCB0byAi
bm9uZSIgdG8NCj4gPiA+ID4gPiA+IGluZGljYXRlIGRpc2Nvbm5lY3Q/IExldCdzIG5vdCBkbyB0
aGF0LiBDdXJyZW50bHkgdGhlIGR3YzMgZHJpdmVyIHdvdWxkDQo+ID4gPiA+ID4gPiBzd2l0Y2gg
YmFjayB0byB0aGUgZGVmYXVsdCBtb2RlIGlmICJub25lIiBpcyBzZWxlY3RlZCwgYnV0IHRoaXMg
aXMgbm90DQo+ID4gPiA+ID4gPiB3ZWxsIGRlZmluZWQgYW5kIGltcGxlbWVudGF0aW9uIHNwZWNp
ZmljLiBJdCBjYW4gYmUgbm8tb3AgYW5kIHdvdWxkIG5vdA0KPiA+ID4gPiA+ID4gdmlvbGF0ZSB0
aGUgaW50ZXJmYWNlLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGUgcm9sZS1zd2l0Y2gg
aW50ZXJmYWNlIHNob3VsZCBvbmx5IGJlIHVzZWQgZm9yIHJvbGUtc3dpdGNoaW5nIGFuZCBub3QN
Cj4gPiA+ID4gPiA+IGNvbm5lY3Rpb24vZGlzY29ubmVjdGlvbi4NCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBJIGZlZWwgdGhpcyBzaG91bGQgYmUgdHJhY2tl
ZCBzZXBhcmF0ZWx5IGZvciBjbGFyaXR5LiBUaGUgZHdjMyBhbHNvDQo+ID4gPiA+ID4gPiA+ID4g
dHJhY2tzIHRoZSBjb25uZWN0aW9uIHN0YXRlLCBjYW4gd2UgdXNlIHRoYXQ/DQo+ID4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBBcmUgeW91IHJlZmVycmluZyB0
byB0aGUgImNvbm5lY3RlZCIgZmxhZyBpbiBEV0Mgc3RydWN0dXJlID8gSSBzZWUgdGhhdCBpdA0K
PiA+ID4gPiA+ID4gPiBpbmRpY2F0ZXMgY29ubmVjdGlvbiBzdGF0dXMgb25seSBpbiBnYWRnZXQg
bW9kZS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFllcywgdGhh
dCBmbGFnIGlzIG9ubHkgZm9yIGdhZGdldC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQ2Fu
IHlvdSBwcm92aWRlIG1vcmUgaW5mbyBvZiB0aGUgc2V0dXA/IElzIHRoZXJlIGEgdHlwZS1jIGNv
bnRyb2xsZXIgb3INCj4gPiA+ID4gPiA+IHBoeSB0aGF0IGNhbiBkZXRlY3QgYXR0YWNoL2RlYXR0
YWNoPyBPciBpdCBvbmx5IHByb3BhZ2F0ZXMgdG8gdGhlIHVzYg0KPiA+ID4gPiA+ID4gY29udHJv
bGxlcj8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBNeSByZXNwb25zZSBkaWRuJ3Qgc2hvdyB1cCBv
biBsb3JlIHNpbmNlIHRoZSBtYWlsIGNsaWVudCBJIHVzZWQgYmVmb3JlIHNlbnQNCj4gPiA+ID4g
PiB0aGUgbWVzc2FnZSBpbiBIVE1MIGZvcm1hdC4gU28gcmVzZW5kaW5nIG15IHJlc3BvbnNlIGFn
YWluLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhpIFRoaW5oLA0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ICAgIFllcyB0aGlzIGlzIGZvciBjYXNlcyB3aGVyZSByb2xlIHN3aXRjaGluZyBpcyBwcmVz
ZW50IChlaXRoZXIgd2l0aCBhIFR5cGUtQw0KPiA+ID4gPiA+IGNvbnRyb2xsZXIsIFVTQi1jb25u
LWdwaW8sIG9yIGEgZ2xpbmsgYmFzZWQgcm9sZS1zd2l0Y2gpLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ICAgIEFjdHVhbGx5IHRoZSByZXF1aXJlbWVudCBpcyBhcyBmb2xsb3dzOg0KPiA+ID4gPiA+
ICAgIDEuIFdoZW4gaW4gZGV2aWNlIG1vZGUsIGlmIHdlIHJlY2VpdmUgYSBjYWJsZSBkaXNjb25u
ZWN0LCB3ZSBuZWVkIHRvIGNsZWFyDQo+ID4gPiA+ID4gT1RHX1ZCVVNfVkFMSUQgYml0IG9mIFFT
Q1JBVENIIHJlZ2lzdGVyIGluIGdsdWUgYWRkcmVzcyBzcGFjZS4NCj4gPiA+ID4gPiAgICAyLiBX
aGVuIGNhYmxlIGlzIGNvbm5lY3RlZCBpbiBkZXZpY2UgbW9kZSwgd2UgbmVlZCB0byBzZXQgdGhl
DQo+ID4gPiA+ID4gT1RHX1ZCVVNfVkFMSUQgYml0IG9mIFFTQ1JBVENIIHJlZ2lzdGVyIGluIGds
dWUgYWRkcmVzcyBzcGFjZS4NCj4gPiA+ID4gPiAgICAzLiBXaGVuIHRoZSBydW5zdG9wIGlzIHNl
dCBiYWNrIGFmdGVyIGEgc3VzcGVuZCByb3R1aW5lLCB0aGVuIHdlIG5lZWQgdG8NCj4gPiA+ID4g
PiBzZXQgIE9UR19WQlVTX1ZBTElEIGJpdCBvZiBRU0NSQVRDSCByZWdpc3RlciBpbiBnbHVlYWRk
cmVzcyBzcGFjZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgICBUbyB0YWtlIGNhcmUgb2YgYWxs
IHRoZSAzIHNjZW5hcmlvcyBhYm92ZSwgdGhlIHNldF9yb2xlIGFuZCBydW5fc3RvcA0KPiA+ID4g
PiA+IG5vdGlmaWVycyBoYXZlIGJlZW4gYWRkZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gICAg
VGhlIHJvbGUgaW5mbyBwcm9wYWdhdGVzIG9ubHkgZnJvbSBjb3JlIHRvIGdsdWUuIEl0IGlzIG5v
dCBzZW50IHRvIHRoZSBwaHkuDQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBXaGVuIGRv
ZXMgUk9MRSBOT05FIG9jY3VyPyBEaWQgeW91IGhhdmUgdGhlIHR5cGUtYyBkcml2ZXIgc2V0IHRo
ZSByb2xlDQo+ID4gPiA+IHN3aXRjaCB0byAibm9uZSIgaW5kaWNhdGUgZGlzY29ubmVjdD8NCj4g
PiA+ID4gDQo+ID4gPiA+IFRoZSB2YnVzLXZhbGlkIGlzIG9ubHkgZm9yIGdhZGdldCwgYW5kIHlv
dSBvbmx5IGNhcmUgYWJvdXQgdGhlDQo+ID4gPiA+IE9UR19WQlVTX1ZBTElEIHJpZ2h0PyBDYW4g
d2UganVzdCB1c2UgdGhlIGR3YzMtPmNvbm5lY3RlZCBmbGFnPyBKdXN0DQo+ID4gPiA+IG1ha2Ug
c3VyZSB0aGF0IGl0J3MgY2xlYXJlZCBvbiByb2xlLXN3aXRjaCwgd2hpY2ggc2hvdWxkIGJlIHRo
ZSBjYXNlDQo+ID4gPiA+IGJlY2F1c2Ugd2UgYWx3YXlzIHBlcmZvcm0gc29mdC1kaXNjb25uZWN0
IG9uIGdhZGdldCB1bmJpbmQsIGFuZCBtYWtlDQo+ID4gPiA+IHN1cmUgdG8gc2V0IHZidXMtdmFs
aWQgb24gcHVsbHVwIG9yIGdhZGdldCBiaW5kaW5nLiBJcyB0aGVyZSBzb21lDQo+ID4gPiA+IHNj
ZW5hcmlvcyB0aGF0IGR3Yy0+Y29ubmVjdGVkIGRvZXMgbm90IGNvdmVyPw0KPiA+ID4gPiANCj4g
PiA+IA0KPiA+ID4gSGkgVGhpbmgsDQo+ID4gPiANCj4gPiA+ICAgSW4gY2FzZSBvZiBqdXN0IGEg
Y2FibGUgZGlzY29ubmVjdCBpbiBkZXZpY2UgbW9kZSAoYW5kIGRlZmF1bHQgZHIgbW9kZSBpcw0K
PiA+ID4gcGVyaXBoZXJhbCBvbmx5KSwgdGhlcmUgd291bGQgYmUgbm8gcm9sZSBzd2l0Y2guIElu
IHRoYXQgc2NlbmFyaW8sIGNvbm5lY3RlZA0KPiA+ID4gZmxhZyB3b3VsZCBzdGF5ICJ0cnVlIiBl
dmVuIGFmdGVyIHJlbW92aW5nIGNhYmxlLiBJbiB0aGF0IGNhc2UsIHdlIGNhbg0KPiA+ID4gZ2Vu
ZXJhdGUgZGlzY29ubmVjdCBpbnRlcnJ1cHQgb25seSBieSBjbGVhcmluZyB0aGlzIFZCVVNfVkFM
SUQgYml0IGFuZA0KPiA+ID4gaW50dXJuIHRoZSBzdXNwZW5kIHdpbGwgc3VjY2VlZC4gU28gd2Fu
dGVkIHRvIHVzZSBub3RpZmljYXRpb24gZnJvbSBzZXRfcm9sZQ0KPiA+ID4gd2hpY2ggd291bGQg
Y292ZXIgYWxsIGNhc2VzOg0KPiA+ID4gMS4gY2FibGUgZGlzY29ubmVjdC9jYWJsZSBjb25uZWN0
DQo+ID4gPiAyLiBSb2xlIHN3aXRjaCBmcm9tIGhvc3QtPmRldmljZSBhbmQgZGV2aWNlLT5ob3N0
DQo+ID4gPiANCj4gPiANCj4gPiBPay4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIEhvdyBl
dmVyeXRoaW5nIHRpZWQgdG9nZXRoZXIgc2VlbXMNCj4gPiBhd2t3YXJkOiBUaGUgY29ubmVjdG9y
IGRvZXMgYSByb2xlLXN3aXRjaCB0byAibm9uZSIgdG8gdHJpZ2dlciBhDQo+ID4gcm9sZS1zd2l0
Y2ggaW4gZHdjMywgd2hpY2ggdGhlbiB0cmlnZ2VycyBhIGNhbGxiYWNrIHRvIGR3YzMtcWNvbSB0
bw0KPiA+IGNsZWFyIHZidXNfdmFsaWQsIHdoaWNoIHRoZW4gYWxsb3dzIHRoZSBjb250cm9sbGVy
IHRvIHNlZSBhIGRpc2Nvbm5lY3QNCj4gPiBldmVudCBpbiBkd2MzLiBJcyB0aGF0IHJpZ2h0Pw0K
PiA+IA0KPiANCj4gWWVzLCB0aGF0IGlzIHJpZ2h0Lg0KPiANCj4gPiBUaGUgY29ubmVjdG9yIGRy
aXZlciBzaG91bGQgaGF2ZSBhIHNlcGFyYXRlIGludGVyZmFjZSBmb3INCj4gPiBhdHRhY2gvZGVh
dHRhY2ggaW4gYWRkaXRpb24gdG8gcm9sZS1zd2l0Y2guIEJ1dCBJIGRvbid0IHRoaW5rIHR5cGUt
Yw0KPiA+IGNvbnRyb2xsZXIsIFVTQi1jb25uLWdwaW8sIGFuZCBnbGluayBzaGFyZSB0aGUgc2Ft
ZSB3YXkgdG8gaGFuZGxlDQo+ID4gY29ubmVjdGlvbi9kaXNjb25uZWN0aW9uLg0KPiA+IA0KPiAN
Cj4gSSB0aGluayBhbHRob3VnaCBST0xFX05PTkUgaXMgZm9yIHNlbGVjdGluZyBkZWZhdWx0IG1v
ZGUsIGl0IHN0aWxsIG1lYW5zIHRoZQ0KPiBzYW1lIGluIFVTQi1jb25uLWdwaW8gLyB1Y3NpLWds
aW5rIGFuZCBoZDNzczMyMjAgKG5vdCBzdXJlIGFib3V0DQo+IHR5cGVjLWNvbnRyb2xsZXIpLg0K
PiANCj4gPiBMZXQncyBrZWVwIHdoYXQgeW91IHByb3Bvc2VkLCBhbmQga2VlcCBpbiBtaW5kIHRo
YXQgUk9MRSBOT05FIGlzIGZvcg0KPiA+IHNlbGVjdGluZyB0aGUgZGVmYXVsdCBtb2RlIGFuZCBu
b3QgbmVjZXNzYXJpbHkgbWVhbiBkaXNjb25uZWN0aW9uLg0KPiA+IA0KPiANCj4gU3VyZS4gV2ls
bCBkbyB0aGUgZm9sbG93aW5nIGluIHYzOg0KPiAxLiBJbnN0ZWFkIG9mIGFkZGluZyBob3N0IG5v
dGlmaWVycywgd2lsbCBhZGQgInBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kIg0KPiBpbiB4aGNp
LXBsYXQuYw0KPiAyLiBGaXggdXAgY29kaW5nIGlzc3VlcyBwb2ludGVkIGJ5IHlvdSBpbiBwYXRj
aCAxLzQuDQo+IA0KPiBMZXQgbWUga25vdyBpZiB0aGlzIHNvdW5kcyBmaW5lLg0KPiANCg0KWWVz
LiBTb3VuZHMgZ29vZC4NCg0KVGhhbmtzLA0KVGhpbmg=

