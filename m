Return-Path: <linux-arm-msm+bounces-62122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35333AE5839
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 989347A7693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ACA22D78A;
	Mon, 23 Jun 2025 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="szuGRYKu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GYLorosM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t5OIgpmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803791AD3FA;
	Mon, 23 Jun 2025 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750723163; cv=fail; b=h99t+fl3vjAtDK2DzmSEra+rwkFiKWisyOkJmzqnvDECbu93MHrvOlnttB68HFZBqPiPFjA6qexmFUNkgbWD9k6IyBN/cmzcfwPTn/imhPlffA4Y/SHhQX4a0C4VBFgIqQqBPU0szjqHIK8ZHmxC9BqBbBx5fkINz6qbxvc4Fw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750723163; c=relaxed/simple;
	bh=mEXAXxIShlEvT2cXQ/uRtgnztoXWVQ9pCwTvKY7zbkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ItRDSi9IJ5LleKWXvtU7aCUXHzwjKL6UYXVCGEZxkRgLxi/FwSmM/eqN8llRwigZFIQwtBZML/NORdM/SU67FXclNIanz7fH15O2351k6WZjXRa1ulQZ1ovwhp8MVKX7U0EYw82+zWunLHwZ5ESFeOA0E1dKV5eErTJ5CJ+aSUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=szuGRYKu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GYLorosM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t5OIgpmI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWDfh012620;
	Mon, 23 Jun 2025 16:59:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mEXAXxIShlEvT2cXQ/uRtgnztoXWVQ9pCwTvKY7zbkA=; b=
	szuGRYKuf1za9UH6IYL290k43poIqdOCdtLiojoEkwtX+VdF/WTufrywv6ODzPaW
	ql4HwQ0QSBhc5mWDF5cvLoI1WOFAHSJdhAXtPuJ7xGjNEDrGB3qHU+R4oy94ahlN
	PZ4zooSPxrPJPmkbHcotxdGYXF4LhLXOwLDsdHHnVVnU85v1tkGQgiSYMynR+iXc
	XDChOWBbBBNznmgK7IYkxlqvOVhweJCE/P7nQeU4ZbL+Fo8TCWKZnVvmPCluJGa7
	ykm9Dc+RJUzBT0DJVSbKtn//7647gnjYFifcb2cpFktzG0cPHVBMVzM/kDj/XYli
	q5YAxBHwHo3kF8p5xzd/vg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47durr8184-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 16:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750723157; bh=mEXAXxIShlEvT2cXQ/uRtgnztoXWVQ9pCwTvKY7zbkA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GYLorosM29pVm8Jvkldl5yaM5tqTaEbomSjCdwmbFk6NCUObSSRaLVWNCuIf4eKM3
	 M1Qga7ypQ+itq5nJW5odL6oxjoug2nxKKTuupuhh+4/dGeXIsq3FnCxVD5gqM50eSs
	 XOZrGDFRhA2/1WTBRP4k4lcy0rXkXNI9gA7agMlvisM23dFe24wfbmbTM7vxkxcWso
	 L4O0fEOHm+waw5Lj9kEEkE+cxnStrspqmn7Y/llpjScyJqd+glm2+7syC2OHntrzx8
	 W1wmJqt3peS+GHNLPEYDJQOyPIFwVAXwH2c7oiZBf3xMJQTVkIIQSLKZJ6I54Yl/YU
	 AbSKen4lL3oZg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D3F440140;
	Mon, 23 Jun 2025 23:59:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0E946A0060;
	Mon, 23 Jun 2025 23:59:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=t5OIgpmI;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4E89D40515;
	Mon, 23 Jun 2025 23:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4l8KflmM4vkaHRoKlwUovYEjbD1jYEYZUpeAHe2jF4M4CMiU6V6xXdIlXXOt/ahvEryl6txWe+TpsLO8bARrqGPsDNTuece5F7J+TMTrB8raRpCQl8d+dbqV/ce8Zjhl2kSXLc6dsVOM2XpyDhvE7ZVxrJB383J/f85aQydnSymAUO/BERN4O1UUuUfF5JqHhVnCJFh9KK6bS8ScXvw3CDiM2yw4VgifO+WyCdnrC0nk4iCboyjS42309aprW8keLH0QfJBpx9VVqBB8a2TYW+1jxDlI514BDwuVuwS1OHMHmrh8fkFoCT4Zb5gPVh/ygr5WJs+nfQLNQ4BaYrIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEXAXxIShlEvT2cXQ/uRtgnztoXWVQ9pCwTvKY7zbkA=;
 b=dH4n3dsD7IBkn7SmoBKlDdVYkwtb0NdnT0RTpH5lgsryw0LQ+7NRfAxPHtxKaG66OzCrRE21xXEZaKQ3A8mmyqFZu9OLJ8Dc7IAWxqNKTHOT/v0Gt6WvIMxs/7f7dvoPgijm27RUVpbzoWIXfq4ria/ONfRCWydLni+C+WBd3xJmj9zVJgYxGB+I3jnVYTv8mMQrA9+bMa9YULkrY1EiRwPZa4FuVyMo/mJqOt6vfMcuKabG1EJ2KBoAO2vz7PVoY4kg/cWP62wnYi6uSVy5YFcU37vD8v+2XJl3V1FYvFtjxoOteSFzRNG98W1Ivggnemcr7yx95cgWLQ0dg/5LFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEXAXxIShlEvT2cXQ/uRtgnztoXWVQ9pCwTvKY7zbkA=;
 b=t5OIgpmI7fdzwT+vAv/3aq38CS+9nIfY0mgdw0Pt6d3fN0XugGIlvwYI3dzNFUO8FSprqaAGaDCXcTtuRUYha/CFa0nrkz2YymLHitXiBgrOnnQtMEpCiWtV+ZpXVqkcTzk5ffUqserkR2u9JCd67zHMp3MHp15HGjSODdr8FO0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Mon, 23 Jun
 2025 23:59:11 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:59:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Thread-Topic: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Thread-Index: AQHb2egNh3Ix5vfXrki85JWlpCI4TLQRgb4A
Date: Mon, 23 Jun 2025 23:59:11 +0000
Message-ID: <20250623235856.b2jwgf5j6yup2sww@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6193:EE_
x-ms-office365-filtering-correlation-id: bb1e0c21-dc54-4a22-8b87-08ddb2b1f300
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a3FrMVpZMkk3ZG1uTGV0L0Z1RGZHY3R2UjdDdTlLalRDckc4UHVGQzFxTHNo?=
 =?utf-8?B?NE1lUHYvVHEzdm04T2FVcTNJNXNHaEdxYlV3NTQ2RXVtRW5UZlIzM3prODVm?=
 =?utf-8?B?M1pPUUkvLzFKeE1kREc0WVFFVzltMEl5ektlcG55cWtkcTZiN2RtcE9uK1o1?=
 =?utf-8?B?OTB5ZzZGd1Mrc2l3M1BHd1ViVVpPMDY0dG5uUkw5WjdmckFJRzV1QkErS2Zn?=
 =?utf-8?B?ajVEZGpib1R2ZU9kWDFXRG41MTJ1ZnBkdExEWmtzM0Z1QnZXR0pXQzM3cWwv?=
 =?utf-8?B?aVB4QUQ5R0RuY1pzek1wWXo5KzY1V0RwcGtCL1BuaGV3K2JIc0s2b3c3RkpP?=
 =?utf-8?B?ODYvRUJXZHdEQko3UXBRNU80TXhMSTRlWGZZUk9rRjJaTWYrZEI5Uk5Tc3Ji?=
 =?utf-8?B?U01neEEvRkhUY2M4d3d4WEt5Q0k4Wm40MEs5VU5pKzlHNGNMQXgxbEF0VXBw?=
 =?utf-8?B?dXQxWHBNTkg5Rkgza29RaGU0L25tNkt0dEVTNFk4Yzc1OGZzbmtSNzBteE1R?=
 =?utf-8?B?eUpVZlhzQytGTVJMOXRSUFQ0RHc0SEQyWVY1YmpkWmhEdXZiaVNFaDdXYUVj?=
 =?utf-8?B?QWNYWGNxOUVMZldsQUNISEp4Vk5PQnFmMTg4cS9GRVIxOTVzYzB3bkthRFBm?=
 =?utf-8?B?NkU2MkdIVjlyTmpTL3A4eE1MYjRLSUlWaGx5VUhwcDlmKy8zbGF0dE1TTUhL?=
 =?utf-8?B?L0F2SWIxdVBCWHhYekpBVk1sZ2hwQTFjSmhnSWJyQ3F4cjdPN3NScjVDYTUz?=
 =?utf-8?B?SjgzbmV0SVR0WDdGOC9vKzU1RUFtdjN6bVAwcnRybHNZM2duNGwyVEVwb1BM?=
 =?utf-8?B?TWVJNVNOaFNqWkJRQzh0cEpOQ21OSEdNcWVSYyttT1lITmh0K0hRRmZWeWJh?=
 =?utf-8?B?c2FROFZFQW5PRGVhaHJwVk0wSjk4VXpUM3pvcEw4YUhDS1owek55aTVLUHVq?=
 =?utf-8?B?bWxTaHAxalgvWnBlWXVSckU5SFZTVm5xeTBDcGZQL3hvaEtOang1bFhrSDBP?=
 =?utf-8?B?Zk9FMVQxdnNLYXdtQzhiUTl2WTU2a1hYR1d5ZDFzbS9rT2MwcjBFeTFkTC9n?=
 =?utf-8?B?TURGcmVHeDVPbFU0TS9maXFxYW1iVGUxbjFVQVhEbDJ3MjcxVkVlNkh6dlF5?=
 =?utf-8?B?WlV1dTl2Ykk5bGhBc29Sb0Z6Y2sydDNORlBsbGJqdEhsc3VPMjhBUFRXeWZi?=
 =?utf-8?B?N09odDVPcTNHLy9QZHlRZHNSbVFvc3hLN2tJK0dXVGZuQXJkWVBOUVAvRjFm?=
 =?utf-8?B?V3R0dmExNjFTRElNTGFVWDIxS0RsZ0JuWElnVGZGMmhlZUZ5S3pOQUQ4MENL?=
 =?utf-8?B?QjI5bGZvR0daSmpIWCtpMnU2ZmhTS1FSZTA1K2xxdEVLdCtUcEtONm0yQm9S?=
 =?utf-8?B?QVh2UEhrbTAzM3dtaDRlLzJpWE1BZGt3STR5WmFROWN2ckttcmw0RloxTC8v?=
 =?utf-8?B?VG5TenIwbXozemNBSFhKRkJHeHZYMWl2MU90OVAyNkdNU1lPUjBwcStTdmJO?=
 =?utf-8?B?TFRrSHRTRmUrMkIwUS9SeFRxcHB5dTdzYmJjMVRwWHYzNmZRQmJwN1hkcTJV?=
 =?utf-8?B?QjNPdG51N0xDVjFsazVkSU5XTU1kaHdhdWlDcnc1cVE2OFFkMHZVMHVBMkJ3?=
 =?utf-8?B?TTVjNVR1MEJjUnRuUnhsRWNlWkt5azZ6K3RjT3IxeSt4UHo5RUJoWVNYbmNK?=
 =?utf-8?B?bDNpVm5tWlBhb001VS9aMDU5LzhPN3JNUVhyb21uSHZGYXhQQ2dmTTRBYUNC?=
 =?utf-8?B?QmdrdUphZnZrU1l5UVBjZEkyM2NIOCtBQnJXbzlXNTNtNlhCZHZJZEh3a25a?=
 =?utf-8?B?dVJQRWlmUmF4ZG81RHFVbkdVQXJCaGhjU1M3bGJOdTVGYUlQcmJ4SVlyWDF0?=
 =?utf-8?B?NlVEcURVdHlkY0x4M3M2UXdlTkFGb0xRUkljeCsvSDFPU05Rb2diY0t2Yllk?=
 =?utf-8?B?Sm5mc1ZzT3R0MFlueTR0amU0aDNqZzcyM2s5VXVnTUpVRlRJK0huT0VJMkZG?=
 =?utf-8?Q?yGZsHIkGvfZAk1+UXBmiRxvmPmb5kA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmJsVmVxa1A5OTVKcHZYeGJ2WWNDRk45WTIzVEVPRmRvSWxkMXBBU1JGdUF4?=
 =?utf-8?B?bmxldDBoYVR3eHpTSk11SjlYY3NvRWJwYWJFM3k1ZnkyQ2RTZTlWYVdKZjhH?=
 =?utf-8?B?TG95eXJrM1hkek95UXA2UWEwNkRVZGVNbFZhSUlLc2UrL244dE5mbitMbmdo?=
 =?utf-8?B?NEN4SzVOVHZseStWYm1KYjV2ZnBJQUNlUWdydGRxa0VZLzFUdkR2UEFDWmE0?=
 =?utf-8?B?RTVaYzEwRVp1Sk1PNVcvRFM3UnRpYVIrYnJvUTUyNCsxd1BRTUNnbThOOXZk?=
 =?utf-8?B?TGwxVjY4dWNSaVZoVUJLRVZ4UlpPN3ZLK3NjZEphYnJ0TnZGTW1vSzJiYTBl?=
 =?utf-8?B?Y2NKM2g3cEYwMVJnckNJZzIyN2dGSXhidjkyb29uSmxpZUQ5RVRQRzNNaUpo?=
 =?utf-8?B?akRzVnhhOFFPdFZsWUR3SGhzeDhCenRCU0JJV2xueVA5VTkySGczZENRUmxL?=
 =?utf-8?B?eTIwb1crcTVKMGNYSGNmcHlXTWxWRzV6bFhlY2pUeURrMGNVS3liSGlUU1ZO?=
 =?utf-8?B?K3F3ck5LaUsyNnM3dVphZm9HWmdlUFdyeFJOejhORmo3VmJCZEpBRS92a3Nt?=
 =?utf-8?B?V0haOE15d3M4eWlUMXVoWlZWTXFaeEVQZkdKekNvaHFoUXlTZmR1dEhmYnV3?=
 =?utf-8?B?VzZ0U3RtQjF4a0ZqZHZGcFdNbXJXNlIvQ1BTdk1OSllzNVN0ajk5bDBUQkp0?=
 =?utf-8?B?MGlsZE45cncyZE1YNExZMTd6UVNKL0JaL2JMOEtEalJvNlVIcXR0eWhVaTNN?=
 =?utf-8?B?bmtyWGV6UlE5WkFoNzBzd2tVdmZFM0p2aERHTFJyd0t5RWZhNjhJTVFrdlF1?=
 =?utf-8?B?bi9vSTIvbVFKVlQzcnp0UTNzZk9oazNqbEx2SGxMM3RBTGl1MGNzOWpYUjJq?=
 =?utf-8?B?dVRRK0o1cFhteWhwRmNoWTgwOVBoY2YrRHJRdzQ3YysvV01ZQmQvMHR4Q3Nu?=
 =?utf-8?B?cGcxOU5vZ21PVFRLVzQwS3Q3c0JqWXUrSjYrMUMxNS9zbWNrMFFwUytQSEMy?=
 =?utf-8?B?ZXJaSnBVdHIyY0ZoTk4vUm9XT25WMlluYUk3VnNwUU5oWFZZWktadU91UWtp?=
 =?utf-8?B?MlpyeEFxUTFRMDYxYlJjT0ZlOUFqQVAvZVp6aFFBc1BkK1lndi9KMmMrMVJO?=
 =?utf-8?B?SUFjQ0JLQU0rQ05DVzBlZVhnYUpScWQxd3RYTTY2U1hSQWFqR015U0hmU0pF?=
 =?utf-8?B?NFg5aSsrQzU3T2NpUVMxWGpQaHA5MjNhaWRFYXRLb05DZGl2VDI2SDROSzFX?=
 =?utf-8?B?N3VDWU5ia016YVpsOUVuMXdxbmVJbjBwaWdabVdCNDNYSVNaRFBmRWw5clo2?=
 =?utf-8?B?UTZhYWJIT0YvbkZDU2FWaUlQcE0yNkFFTTRnR0VlZSt6N3MzcU5mWEZlNEhH?=
 =?utf-8?B?b2RmRXBCUVdnSjREYjAveDMwSnZieHhhZ0NrckJadUR1UVdGUk8yazJsZ0xG?=
 =?utf-8?B?bEEwN3FxdWVrSEJHWERxeXhiNEcyVnFiQk5FZ0dNUTZwTWFJYjJXekNGd0pr?=
 =?utf-8?B?UEkwSXUvTXBXdVFUdHVkNEVHYTZOenYxcVAzRVBWNDMxL0NLQURTWEx2VTBF?=
 =?utf-8?B?TXNxU0tyK0d3NVlpTGI5UCtKb1hPVXg5Q0QwOWVNQmFuajJ2eUNtYURFMTZV?=
 =?utf-8?B?UXJnUHZVZEFPNEd5bXNuTDVqK1lqSnY2dFBlUWthU1hoSWt5eHYzZEZkQ0ll?=
 =?utf-8?B?cUZKSCtxd1Nuek9qZmZHQ2xJVmpKMk5rMUx2cmxDSHJhSm02VjNKYzNzQ0dJ?=
 =?utf-8?B?dTc2MzJuNm1GU0JBNDlqTFVlMlpEM1VNRG5KeTVEZmQ0UXYzK0N0MkpRV2N0?=
 =?utf-8?B?UFM3dUdvVFFqcjBxZWo2RHd2aTNLRm8rNGZxZTR4UThXWnhmelhFMWpvanJ5?=
 =?utf-8?B?eHMya3FrSEJ5ejVTcVFOU2QxcDdMVndJdTdGeHY5dVVzeXJxMlVZQnkzMjMr?=
 =?utf-8?B?KzU4QkxldGN1dmJ5U1NvQ1dFdVI3bUJnWm40UUJxRXljckJKVllZajJ3cVE3?=
 =?utf-8?B?eWhJWmRDL052NVpsQjA0UlpEWVNXZGxHTzhIRnZ3b3dpdzhCTks0V2NJVTJ6?=
 =?utf-8?B?dEk0Y0ZUY092TVRJYUtSN0lDcHRKODZZckEwUE5WampPVmZndmdENmVwUGlE?=
 =?utf-8?Q?2Kisq3lioZt47HYNTW4IVu22h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30C5F690CD17CF4CA6057D3DEDE975C8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9oXh6ksXg2913JQVvrPVmHHl6CGLOnGhCIQTZGwNz0aoU8N/toU3YAcjNHwTLzkJryGmwUP55GSXWy055LblRhbktt4n7RAwcgMRRX2VMIWUIdIaGFsW9FylTUoyMuElqH/lOVfhYo7kjUMmAAG+bb+TC2tvzYzu4MSpQSP5w485WIudhX9K/iOuZ0i2nikrEOQVeKj0b/L9FtgtM4iFOhyrDjy2ujZvfjB+rYAEjtM3eI83PxXphoVBNukY9inK4UbMkRGFMuz2myrjrNkRfw3Soszypa5c8MH2wbT0ly7Ns+DrB/woIDBcqGXwFbG1fyfRrKtnqX6J+kxGwaRX4kevsRJF7+w1y/VTn4rYbDWrqQZPBOEqKKJwpCSkDqVjCx9wj63SEsV3TKvGJGzqKH518dD3uY/dsm1PV+lzUTfH8em9Xz7VEDyDteYU8vlMTW+jcmz9ffqznA8vfNvWNuHTxn8ep6G7TrdSw93KEMO5BNPkVAxB4RSs9bSYP2R0N1IBN/fOMiJU8ON9drS4IaMq2jpHPEm29UeDYtacTd6tEEfw2KH4xFe4ZHb3v1As+Vzk/MUpSGERUKUNsNX82ZZHfyF9UGctThrd6NFYCSI0Wh5YPynuPrXYSwcOv8VHqtnQHU1wUspFEHKzBPpVdg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1e0c21-dc54-4a22-8b87-08ddb2b1f300
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 23:59:11.1852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6eF+zaQtRONAADd/JAxYzQqM5C8Oael6CBaMPdNeVwT05KV5B0qcILuLy7IEzwTz46axBs64xVHMGAmRujyqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193
X-Proofpoint-GUID: JiGn1i0R0b_H53Oh02IgDSuVcbS_8f4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NyBTYWx0ZWRfXzS5XpAlwRU2H
 YfCyNT4t6tLvAnGZIYPXaNqvqteIbMHswitbNDZEhCEPkYVETEC5r8AWFrc9DAt3JjSslEG8gRn
 K/hSpLsOmf3yacd4Xe+myw3YWCAtuvwxXZKEKG1y0hqUtVpiuj3h9v35BrqE7p6kaRzB/eZj4H2
 7ljpQwXeuHCgd9D+KSB1cbNc5X3dJUm4+dWwQTxff0mEpjlZQtEoUMGcPFo+t1IggrBHV8zMt+A
 rSbqXeQG5+x4FfOZZG0w11bfxnvB1zBi6vr7XhrvOjsNfamF1S7Bu+A3mtfdRugRdmEl07NQw5G
 SS44G0206yB/bIDNyp8ypCMxV/gcRkOe7lE9Pz8VS+MkbW2BjKDs0ks4nvEEsMXQF1zR8RYMh7H
 hgLw6CfIv8UOtc3JbU5GUcvm+MISWyzPQxpvzn6TbvRiAm4jy97hBG3wXR6uGICdw/xqjN5Z
X-Proofpoint-ORIG-GUID: JiGn1i0R0b_H53Oh02IgDSuVcbS_8f4w
X-Authority-Analysis: v=2.4 cv=OdiYDgTY c=1 sm=1 tr=0 ts=6859ea56 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=iYtnYYCt-WnurzE34mkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506230167

T24gVHVlLCBKdW4gMTAsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IFdoZW4gaW4g
aG9zdCBtb2RlLCBpdCBpcyBpbnRlbmRlZCB0aGF0IHRoZSBjb250cm9sbGVyIGdvZXMgdG8gc3Vz
cGVuZA0KPiBzdGF0ZSB0byBzYXZlIHBvd2VyIGFuZCB3YWl0IGZvciBpbnRlcnJ1cHRzIGZyb20g
Y29ubmVjdGVkIHBlcmlwaGVyYWwNCj4gdG8gd2FrZSBpdCB1cC4gVGhpcyBpcyBwYXJ0aWN1bGFy
bHkgdXNlZCBpbiBjYXNlcyB3aGVyZSBhIEhJRCBvciBBdWRpbw0KPiBkZXZpY2UgaXMgY29ubmVj
dGVkLiBJbiBzdWNoIHNjZW5hcmlvcywgdGhlIHVzYiBjb250cm9sbGVyIGNhbiBlbnRlcg0KPiBh
dXRvIHN1c3BlbmQgYW5kIHJlc3VtZSBhY3Rpb24gYWZ0ZXIgZ2V0dGluZyBpbnRlcnJ1cHRzIGZy
b20gdGhlDQo+IGNvbm5lY3RlZCBkZXZpY2UuDQo+IA0KPiBBbGxvdyBhdXRvc3VzcGVuZCBmb3Ig
YW5kIHhoY2kgZGV2aWNlIGFuZCBhbGxvdyB1c2Vyc3BhY2UgdG8gZGVjaWRlDQo+IHdoZXRoZXIg
dG8gZW5hYmxlIHRoaXMgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IGEpIFJlZ2lzdGVyIHRvIHVzYi1j
b3JlIG5vdGlmaWNhdGlvbnMgaW4gc2V0X3JvbGUgdmVuZG9yIGNhbGxiYWNrIHRvDQo+IGlkZW50
aWZ5IHdoZW4gcm9vdCBodWJzIGFyZSBiZWluZyBjcmVhdGVkLiBDb25maWd1cmUgdGhlbSB0bw0K
PiB1c2VfYXV0b3N1c3BlbmQuDQo+IA0KPiBiKSBJZGVudGlmeSB1c2IgY29yZSBub3RpZmljYXRp
b25zIHdoZXJlIHRoZSBIQ0QgaXMgYmVpbmcgYWRkZWQgYW5kDQo+IGVuYWJsZSBhdXRvc3VzcGVu
ZCBmb3IgdGhhdCBwYXJ0aWN1bGFyIHhoY2kgZGV2aWNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
S3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA2MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IGQ0MGI1MmUy
YmEwMS4uMTdiYmQ1YTA2YzA4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
cWNvbS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTk1LDYg
Kzk1LDggQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ICAJICogaW50ZXJuYWxseSBieSBtdXRleCBs
b2NrLg0KPiAgCSAqLw0KPiAgCWVudW0gdXNiX3JvbGUJCWN1cnJlbnRfcm9sZTsNCj4gKw0KPiAr
CXN0cnVjdCBub3RpZmllcl9ibG9jawl4aGNpX25iOw0KPiAgfTsNCj4gIA0KPiAgI2RlZmluZSB0
b19kd2MzX3Fjb20oZCkgY29udGFpbmVyX29mKChkKSwgc3RydWN0IGR3YzNfcWNvbSwgZHdjKQ0K
PiBAQCAtNjQ3LDYgKzY0OSwzOSBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9pcnEoc3Ry
dWN0IGR3YzNfcWNvbSAqcWNvbSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcA0KPiAgCXJldHVy
biAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IGR3YzNfeGhjaV9ldmVudF9ub3RpZmllcihz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiArCQkJCSAgICB1bnNpZ25lZCBsb25nIGV2ZW50
LCB2b2lkICpwdHIpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfcWNvbSAgKnFjb20JPSBjb250YWlu
ZXJfb2YobmIsIHN0cnVjdCBkd2MzX3Fjb20sIHhoY2lfbmIpOw0KPiArCXN0cnVjdCBkd2MzCSAg
KmR3Ywk9ICZxY29tLT5kd2M7DQo+ICsJc3RydWN0IHVzYl9idXMJICAqdWJ1cwk9IHB0cjsNCj4g
KwlzdHJ1Y3QgdXNiX2hjZAkgICpoY2Q7DQo+ICsNCj4gKwlpZiAoIWR3Yy0+eGhjaSkNCj4gKwkJ
Z290byBkb25lOw0KPiArDQo+ICsJaGNkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZHdjLT54aGNp
KTsNCj4gKwlpZiAoIWhjZCkNCj4gKwkJZ290byBkb25lOw0KPiArDQo+ICsJaWYgKGV2ZW50ICE9
IFVTQl9CVVNfQUREKQ0KPiArCQlnb3RvIGRvbmU7DQo+ICsNCj4gKwlpZiAoc3RyY21wKGRldl9u
YW1lKHVidXMtPnN5c2RldiksIGRldl9uYW1lKGR3Yy0+c3lzZGV2KSkgIT0gMCkNCg0KQ2FuIHRo
aXMgYmUgZmFsc2U/IElmIHBvc3NpYmxlLCBJJ2QgbGlrZSB0byBhdm9pZCB0aGVzZSBwb2ludGVy
cyBhbmQNCnN0cmNtcCBoZXJlLg0KDQo+ICsJCWdvdG8gZG9uZTsNCj4gKw0KPiArCWlmIChldmVu
dCA9PSBVU0JfQlVTX0FERCkgew0KDQpUaGlzIGNvbmRpdGlvbiBpcyByZWR1bmRhbnQgd2hlbiB5
b3UgaGF2ZSB0aGUgY2hlY2sgYSBmZXcgbGluZXMgYWJvdmUuDQoNCj4gKwkJLyoNCj4gKwkJICog
SWRlbnRpZnkgaW5zdGFudCBvZiBjcmVhdGlvbiBvZiBwcmltYXJ5IGhjZCBhbmQNCj4gKwkJICog
bWFyayB4aGNpIGFzIGF1dG9zdXNwZW5kIGNhcGFibGUgYXQgdGhpcyBwb2ludC4NCj4gKwkJICov
DQo+ICsJCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKCZkd2MtPnhoY2ktPmRldik7DQo+ICsJ
fQ0KPiArDQo+ICtkb25lOg0KPiArCXJldHVybiBOT1RJRllfRE9ORTsNCj4gK30NCj4gKw0KPiAg
c3RhdGljIHZvaWQgZHdjM19xY29tX3NldF9yb2xlX25vdGlmaWVyKHN0cnVjdCBkd2MzICpkd2Ms
IGVudW0gdXNiX3JvbGUgbmV4dF9yb2xlKQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzX3Fjb20gKnFj
b20gPSB0b19kd2MzX3Fjb20oZHdjKTsNCj4gQEAgLTY1OSwxMiArNjk0LDIyIEBAIHN0YXRpYyB2
b2lkIGR3YzNfcWNvbV9zZXRfcm9sZV9ub3RpZmllcihzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVz
Yl9yb2xlIG5leHRfcm9sDQo+ICAJCXJldHVybjsNCj4gIAl9DQo+ICANCj4gLQlpZiAocWNvbS0+
Y3VycmVudF9yb2xlID09IFVTQl9ST0xFX0RFVklDRSAmJg0KPiAtCSAgICBuZXh0X3JvbGUgIT0g
VVNCX1JPTEVfREVWSUNFKQ0KPiArCWlmIChxY29tLT5jdXJyZW50X3JvbGUgPT0gVVNCX1JPTEVf
Tk9ORSkgew0KPiArCQlpZiAobmV4dF9yb2xlID09IFVTQl9ST0xFX0RFVklDRSkgew0KPiArCQkJ
ZHdjM19xY29tX3ZidXNfb3ZlcnJpZGVfZW5hYmxlKHFjb20sIHRydWUpOw0KPiArCQl9IGVsc2Ug
aWYgKG5leHRfcm9sZSA9PSBVU0JfUk9MRV9IT1NUKSB7DQo+ICsJCQlxY29tLT54aGNpX25iLm5v
dGlmaWVyX2NhbGwgPSBkd2MzX3hoY2lfZXZlbnRfbm90aWZpZXI7DQo+ICsJCQl1c2JfcmVnaXN0
ZXJfbm90aWZ5KCZxY29tLT54aGNpX25iKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSBpZiAocWNvbS0+
Y3VycmVudF9yb2xlID09IFVTQl9ST0xFX0RFVklDRSAmJg0KPiArCQkgICBuZXh0X3JvbGUgIT0g
VVNCX1JPTEVfREVWSUNFKSB7DQo+ICAJCWR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShx
Y29tLCBmYWxzZSk7DQo+IC0JZWxzZSBpZiAoKHFjb20tPmN1cnJlbnRfcm9sZSAhPSBVU0JfUk9M
RV9ERVZJQ0UpICYmDQo+IC0JCSAobmV4dF9yb2xlID09IFVTQl9ST0xFX0RFVklDRSkpDQo+IC0J
CWR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShxY29tLCB0cnVlKTsNCj4gKwl9IGVsc2Ug
aWYgKHFjb20tPmN1cnJlbnRfcm9sZSA9PSBVU0JfUk9MRV9IT1NUKSB7DQo+ICsJCWlmIChuZXh0
X3JvbGUgPT0gVVNCX1JPTEVfTk9ORSkNCj4gKwkJCXVzYl91bnJlZ2lzdGVyX25vdGlmeSgmcWNv
bS0+eGhjaV9uYik7DQo+ICsJCWVsc2UgaWYgKG5leHRfcm9sZSA9PSBVU0JfUk9MRV9ERVZJQ0Up
DQo+ICsJCQlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNvbSwgdHJ1ZSk7DQoNCldl
IGRvbid0IHVucmVnaXN0ZXIgdGhlIG5vdGlmaWVyIHdoZW4gc3dpdGNoaW5nIGZyb20gaG9zdCB0
byBkZXZpY2U/DQoNCj4gKwl9DQo+ICANCj4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHFj
b20tPmRldik7DQo+ICAJcG1fcnVudGltZV9wdXRfc3luYyhxY29tLT5kZXYpOw0KPiBAQCAtNzc0
LDYgKzgxOSw4IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlpZiAocWNvbS0+bW9kZSA9PSBVU0JfRFJfTU9ERV9IT1NU
KSB7DQo+ICAJCXFjb20tPmN1cnJlbnRfcm9sZSA9IFVTQl9ST0xFX0hPU1Q7DQo+ICsJCXFjb20t
PnhoY2lfbmIubm90aWZpZXJfY2FsbCA9IGR3YzNfeGhjaV9ldmVudF9ub3RpZmllcjsNCj4gKwkJ
dXNiX3JlZ2lzdGVyX25vdGlmeSgmcWNvbS0+eGhjaV9uYik7DQo+ICAJfSBlbHNlIGlmIChxY29t
LT5tb2RlID09IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpIHsNCj4gIAkJcWNvbS0+Y3VycmVudF9y
b2xlID0gVVNCX1JPTEVfREVWSUNFOw0KPiAgCQlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFi
bGUocWNvbSwgdHJ1ZSk7DQo+IEBAIC03OTQsNyArODQxLDcgQEAgc3RhdGljIGludCBkd2MzX3Fj
b21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXQgPSBkd2MzX2Nv
cmVfcHJvYmUoJnByb2JlX2RhdGEpOw0KPiAgCWlmIChyZXQpICB7DQo+ICAJCXJldCA9IGRldl9l
cnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcmVnaXN0ZXIgRFdDMyBDb3JlXG4iKTsNCj4g
LQkJZ290byBjbGtfZGlzYWJsZTsNCj4gKwkJZ290byB1bnJlZ2lzdGVyX25vdGlmeTsNCj4gIAl9
DQo+ICANCj4gIAlyZXQgPSBkd2MzX3Fjb21faW50ZXJjb25uZWN0X2luaXQocWNvbSk7DQo+IEBA
IC04MTcsNiArODY0LDkgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlkd2MzX3Fjb21faW50ZXJjb25uZWN0X2V4aXQocWNvbSk7
DQo+ICByZW1vdmVfY29yZToNCj4gIAlkd2MzX2NvcmVfcmVtb3ZlKCZxY29tLT5kd2MpOw0KPiAr
dW5yZWdpc3Rlcl9ub3RpZnk6DQo+ICsJaWYgKHFjb20tPm1vZGUgPT0gVVNCX0RSX01PREVfSE9T
VCkNCj4gKwkJdXNiX3VucmVnaXN0ZXJfbm90aWZ5KCZxY29tLT54aGNpX25iKTsNCj4gIGNsa19k
aXNhYmxlOg0KPiAgCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPm51bV9jbG9ja3Ms
IHFjb20tPmNsa3MpOw0KPiAgDQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkJSLA0KVGhpbmg=

