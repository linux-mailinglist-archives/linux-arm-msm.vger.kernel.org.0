Return-Path: <linux-arm-msm+bounces-29519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F3A95FE30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A061F22A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAC94A1E;
	Tue, 27 Aug 2024 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E73oukcC";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ANghZ5yc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SWohNRQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB838C;
	Tue, 27 Aug 2024 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724721590; cv=fail; b=k9AoET020oVcHF6RCKm0ezpODPqasXGBkuiSeSza+YWjAPlQTi7fNqVGIUqgrjXmG2v44U4DNFcbnIGAE/yNT1XAY6VOSzj3oOQL3Xqr5YQEcNC97ffixzr/kUat14bIXgldwhLXmSTWa0igkSaF8JMEuIK79RWHULuY21mgJ8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724721590; c=relaxed/simple;
	bh=XK/xqQudg3o5rjSy+GJaHqYuRIizdu5GK1/h0O0KxiE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z9vNdiksa5yLwqc78FiidVJSrud38bXV6czT98JdHbSvEmxQRCI7a/GJJpIiEiS52rRkGqYaNVmtlzo6gZ67JiI8zBbDl9XkeYSmrJFKGmVXbjdT3O4Yh7bWvuZfDPQVJFzH1+me3bK6Ulfocx/nkBflSRCUul9MzLw65sIZp3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=E73oukcC; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ANghZ5yc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SWohNRQc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQAhE019965;
	Mon, 26 Aug 2024 18:19:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=XK/xqQudg3o5rjSy+GJaHqYuRIizdu5GK1/h0O0KxiE=; b=
	E73oukcC0ADPnOvIqfC7g7hpkJy98LnZeubKmqZLZS0TiOYBovWZUWF7yryGvKhM
	PJzBWXehuoYDkLnsX1xeM3JOzqI99vvTscnJVVlGdORjtctUKxmizN/uve95FMuL
	Nuo2QfFgFllBXW0UznIB6ND6iO/PetRASpSBs+ynDEuorYAsRQAcBZw8D4LT7mFl
	QXfAJ6R/N9KtXZC6e2/JfcGeHrTW5B0ROSjuylPeDzau2kIMFvPqaWv+tlTLWU2A
	sU2plYVTRVQt/cLzTsdpLyV3MM0aDw+A/Wfo65jUjob4SltYfeNrtaryUHBhexwQ
	N2sAYR3sWv9rkzKC7vsglg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417ehq2dd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724721555; bh=XK/xqQudg3o5rjSy+GJaHqYuRIizdu5GK1/h0O0KxiE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ANghZ5yc04TlJAVFNJEt/Zg0T7/G6Yyi0ic1n/6/T2a3LVu9V1b5hURYrn8Thd5pL
	 zhS18oz78/Dd4EGhK4twOSHlTrBg9TLqW5MBr+z0pErZ+02LXhS3Merbp+f36QMjga
	 AqovunOhN+0DJ1mGPw862JiE10S7wEkIcZsasMAzHRKRz6KM1/msyp13suK2M2qz4p
	 aNX838wC/Y/feWrNfJrIXvSt/0rI1Gfw6Ue2Z3HPoS7DK7unJK36OGs+0oAZ5egDaE
	 E5Qe6+mD3B/Yi2woIOmqsg7wSXvBm2pe3t32cNxXcItY7mPa75Ybs6MHG3fQLsr+7c
	 31Q7KFAMM76cg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD96940467;
	Tue, 27 Aug 2024 01:19:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 800AAA0083;
	Tue, 27 Aug 2024 01:19:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SWohNRQc;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C261040348;
	Tue, 27 Aug 2024 01:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWS2brRyBAF6DdwhG6FxHuUhcjkcPMDKgYytAWUfdNtDrfaZmHsUxXwR0kHgXkJpkGIuRs33x5UH+t8aN4AD7zwBrxbxjj4k2Y2lXVuNHFQTsnC2nWXZBHl1SHRvgEfW9VW0tSuMFARFi6rzqdRF+uvXKZrvQ9CJOPAs6UzP6K8/tfpnwDevYoBsypFqliHCxL/1N2+F9ecBg8JripGmic+zR3R6nvn/AaSNcorCKdzR9nAFqYMxEHuJMVR3uhZhW03h+TH9HBL2zGbE2JZvDC9ZAOKT6IMGvbyJCD/UztiGfajyJTsR0wSNsuxYRXMjo9/nZQkpB7reIV4MPLt+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK/xqQudg3o5rjSy+GJaHqYuRIizdu5GK1/h0O0KxiE=;
 b=n2NuosKrt1sYMs3jd7S8CrKQZPRPZkt/I0bK9A8x8MC6Yt+u41DtzurNJ2QhHvAYRP6fFWtp6LDyKEPEK+lYomziqbkMp+1M93uJwPaI8NVTx2ukR7AnQg5xmVDdqC8s4O0xPBugEOOO0VcXOrEnfDTTCq6q6wBP6/6g/2boHGvsdbmp8/0Y2pjgjfxjrhdwZxPpk5vXi1RGpe51t1qWrWku1qRaJmSS6gMRkHlBDfVC6mve2CPFE1r1wDvUJU7NBsDxFXRUSqTeUBA916BYeBJJB3JLyiEsdQ7VUw/wc3Bp61U47Q2lR8EcI4bLecwQ1AtIo5KTPXu6vjdwAecYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK/xqQudg3o5rjSy+GJaHqYuRIizdu5GK1/h0O0KxiE=;
 b=SWohNRQc6kvUPk6vHSSD4JsPTnS9ed+GpHlpa60eGFZgRR3AUx7NImjJYQKLiyP45PVxC0RCSa3MpLJ0fTdRuJYayhVmj981hrkGzBnDcVHn5r/yubmS6Q8qU+fsUKIXffdYygbHzGvCk/NFaMfLAo0aNv/w78VrXyNYFa0GHq0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:19:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:19:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 02/11] usb: dwc3: st: simplify with dev_err_probe
Thread-Topic: [PATCH 02/11] usb: dwc3: st: simplify with dev_err_probe
Thread-Index: AQHa7jXFyzC0x+okZUOaFHkuBkYUzLI6YcaA
Date: Tue, 27 Aug 2024 01:19:04 +0000
Message-ID: <20240827011901.zcu3x24ph3bmfwap@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8311:EE_
x-ms-office365-filtering-correlation-id: bf25524a-914b-4a3c-0d07-08dcc6363df9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHppSUF0cnFJZ0ZFUWFmSzBNNzN6U2piNndxUlZueDVnanZqdDNqMFdSYTZX?=
 =?utf-8?B?c3NSeUpQN0kzSytpb1F2SzVQVzdxY2VNc0x0eUxTVHFaR2UvOGFuL3VXc3NF?=
 =?utf-8?B?WHQ0bHMyMHFpdlFUZEtQbllPUzBzN00zUW1SUGo5OSs1N0htWCswYTJGQnJz?=
 =?utf-8?B?QVMraEptNVlPYVNMWTFlb1JRWFRwNUFUS0JvdExZeG91RzFYNFNkb3NURURK?=
 =?utf-8?B?dnhQcUlFcGhQaTFyaHRzZlA2aXZ5U3JDeHVKb1ZSN2UvY2NSWFBHYnRMbThE?=
 =?utf-8?B?Q3YrRExQR1M0M2pSUVQ4OUlPNVZ0UWJ6aWd6QlVIeitwQzlhRjg3c3hiaWt2?=
 =?utf-8?B?UkZ5SWJWRzRLUEVpakJZVDc1c1pXaythUWFkVzBJemxWWks3eWZxS0FXZDZo?=
 =?utf-8?B?c1RYWVlnWmZEVzJkejh5ODV3aVhJczBmMktZem1ZaDNFZXo2VzE1QTRYSjJR?=
 =?utf-8?B?UTN1bmhBZndZb2VoTE54QnJKOUN5Mzk0YzNOb3JCK053cWNJTUMzM3M4L3Z4?=
 =?utf-8?B?MzBTZWlZc1hFdEZtc1ZORHRhNTJnTVkwUG54KzV5a1BrS3dCQ3F3WXRsR1RP?=
 =?utf-8?B?RkRaWmE5b0Zwd28vSFBEdXphZERLRHYycG0rTXloUzlBbCsvVGpxbHh6T0po?=
 =?utf-8?B?b2paRzM3YVdIMXYrcmE3b2JYVTlRMStlbHF3eGZJN0dyY2FXM2FVM3JYRTlU?=
 =?utf-8?B?ZXdmSU1RcGIxRGQrRE12aVp2elZwczZBTFBpQXhwWk5KL1NkRHNJY3I5ejJF?=
 =?utf-8?B?UE9WbXl0QUNYVnNHd2lwYmdjaENoQndMK29lTWZ4T2VtaGUrM1I5cUNFRHhR?=
 =?utf-8?B?ZTZaRXlsWUg2N2Q3OGJoWXFZQnBhVFNpOFVKZnNNTFp0R1R0NlRlb0d6c3Vn?=
 =?utf-8?B?eFFJMnc0VlpheitOUnJheFhRU2c4MHJRSWY1T1Q3SGo1RUtmWlp6WHYrMjZK?=
 =?utf-8?B?aW94NzZGMjAzZXVpREtLNEtQUjQwUkVldmxQVmdzRzhrWktORGhrdWZpNm1M?=
 =?utf-8?B?V1QzMExIVlF3cjhHMHUvUnFSNDNoRHQ2Tlc1QXhZcVN6QXpqNk5BM1ZweGd2?=
 =?utf-8?B?d0hoMkFkaURVMWRYYURWNHdMbmpiZkRhRkxVbzh6aHdSclRXRGp3c1Z2SElW?=
 =?utf-8?B?QUc5eEJGc3E3cjNuRmxCT3JCMzFFbkhTUkd0Wlo1c2IzUFZEZ1FhUk1wdUlu?=
 =?utf-8?B?UHYwMHNoWHpoeHdaSHZoeElzV040RzREV0VIZFJzb2lUMUtDOW9zTUk0UURv?=
 =?utf-8?B?dTNpZDhEZHQvaUg3QUhzL3grbUl4UCs1eUVmUWp1eGJYYzBaenRRYjJpSytQ?=
 =?utf-8?B?TjB1eFhkRVdseVFMRnhTRFBmb2xRRVY4dk9GdWdzcXdSWVd5R09vN281d3FN?=
 =?utf-8?B?dWRqWVcwc3FCNU1qRno0ZEkzMTg3L3NzQkQ3V0wwdmYrQi95eHp1MTBENVlJ?=
 =?utf-8?B?L0hlelRQbmFad2MrREtEYXJwR01FekFiR2lDWkkxcklXbTZUbjJaZnJqYVFu?=
 =?utf-8?B?OVo3R2Myd25lNHV3eHZISVRCamlhZ1YyM0JLS0wvMFRzMEZiY3I2am8xQ0pw?=
 =?utf-8?B?QjJRdDRQN3pEcXpvQThudzBkYWRQOTdsRmxvcHVWbGpodFRxb1BQREE0b0FQ?=
 =?utf-8?B?OHpiejh0UGQxZkpadDhXQVRnMmk1azBQM0J3Wk1mcVRzc0Vub3I4NTJ3Mzhk?=
 =?utf-8?B?RUNPSzBhYkZ6eW9FTmMxUnl2T0lYTUFPbEREL1lrcDNPSjZRY3lKM29rRW5J?=
 =?utf-8?B?L3l1bGtpb0Q4czdtbFFrYzVGMXdqYTR5TTR2MEJwR3lKK09iRWp6dnVyMkdD?=
 =?utf-8?B?RVFub0NhOHJQOGQvNjFEL0NNQXdrRTNXK1VmZ1I3bnNOTWIvSWpRQk5scmRm?=
 =?utf-8?B?bFU4WnJZRHhKdHRTYTFhUUZESUVxY3NUMi9sUVFNcHgrUFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlByUU5HR1NVQVBxQXFjcGlaSldkVlMxZTBMV3lsNnh4TXpac1hBRXMyVUpt?=
 =?utf-8?B?TFVvOGt5K3kwdEtaaUNkcnYxZm5TSnR4cUs3OWZ5UkRwWkIzeG9xQTJZa3lO?=
 =?utf-8?B?WkRybmVMK1VEZEp4clhYYW0za2ZiY2xpdmQ3ekFLclQ3aUJMU21wZ2RVRE80?=
 =?utf-8?B?bDFrS1pXTWdma3J4aytJN0hLNTJXSThXdllxcmdtMlo5aUtiallDcytLcVo1?=
 =?utf-8?B?TXgxT3dLc01uZHAzelFiVGkrSDRwV3VtYloyeDZpR0xhbFErQXljNmQvdTB0?=
 =?utf-8?B?SUJUeUNoMkJBaE0rNEVrWlU3WWtJR1BBbms5RUNiR0puM1didlZLWFQ1Smlo?=
 =?utf-8?B?SWtkTC9YekZHSkx2ZWFzUmlNdlVnZmNGQzYwSDBwTzRMRDNzeHVhSFQ2ZHVi?=
 =?utf-8?B?N3NDTVZ1VEFxMjhYQUZFamlUeGdmSFhKaG5WMW55VnhVNEVrUDZmZ3dnbXZv?=
 =?utf-8?B?aFFubkRxOW9pMHpFZFR1T0lHekpHeVJRcklGQnBHczZ6OW9RMWJkeFJ3bEFI?=
 =?utf-8?B?MEdJMmhUQ2lUMFkrZGZSQmo0cDM3bS94YXlyN1JSZWF3ODJSanFlYVpTTzZz?=
 =?utf-8?B?Z1hrWFBFN3ZyR2ozTzVhRG9aRFFBcVR4N0YrcndYd2Q3QzJ6R1RoQi9hZ3h1?=
 =?utf-8?B?aE40R3VYNFVMZEhuTU5oV1VkQmh6YzNqQjNIclFqZmFVeGwvZWUzNnVoQlZm?=
 =?utf-8?B?Y3Zzekw5Myt3dkVhWExzYUZCSWJjb3ByeW8rK1dyUE02SzJORUdSVGUvVjJl?=
 =?utf-8?B?Q0ZCLzBKTEV0SVlEbm1VcVlLeDFnS1hWaXl0NHdMKzlsby9IT1lLUTVxQWpM?=
 =?utf-8?B?eEN5ektsWXB1QWpYaFdtN0RpSUFndktZSExnR0N5WDFXeUwzRkdHN1g4d2Zp?=
 =?utf-8?B?QjdsZERHMHpybk1XV2ZCanBhdkdyMDNxTjRrTk1oMEZIUnFkckNDYnVmL3Rz?=
 =?utf-8?B?a1lGZ1V4ZWxIVUtjMWFETEt5R0RnTTVBeDFjK0dqaU9idkt4YUhDMkQ2QWpO?=
 =?utf-8?B?eTZ0VzlnMFdaTG5KQkRnUnk5UWVQVkFPSC8xejYwbGduVmtuNk9KSklHeTlF?=
 =?utf-8?B?a0hnbW82QzJreU1haW8vOThKdkZtK3FvdjF6eVZWY01xVklpTWMzNC9tUTlK?=
 =?utf-8?B?Mkhyc2hhT1E0OERadk4rYncrcGJJYmVJbUpFSWdWWXFkSlhvZlZnV2RKSnM2?=
 =?utf-8?B?ZGVEUEdrQTJSa0FMNzE1bVRhVWFoaGdJeEV0ZWl3QlpsbXg1TjhCU2l5Sng1?=
 =?utf-8?B?RVlCbGYwUHdOOEh0cndUTFRVQlJOOEwxUDh5VmVibVBxaC9uNDc3VmV0Z2t3?=
 =?utf-8?B?Mk42TnpsdWJJU0pWVXh3RDB6YnpYbXBmK05TUEZ5N0QyRkZtb29qMHI4L0xj?=
 =?utf-8?B?eU9sSUUzeTRLQjlJcmhXT2xQOGNsT0NnN0lrU1ZuY083bVN4LzZnN1NsKzB1?=
 =?utf-8?B?dTdHbHlZbnZKanNhRlJCWDdoNDZqa2hFWmFkSTVzQURCRW9VaGVvVHB5MG1X?=
 =?utf-8?B?UVg1akdTT3lrWHo1L1JCWEVyRThJYjlLanM1Y0lpNUFabmZOOVpuZHFmOTRw?=
 =?utf-8?B?UGU4SDVDOGV4eFRTQmxKa2hGMjA2R2ZVSDl1Tk42VUE0MDlVUlBhV1ZBZGdt?=
 =?utf-8?B?UENMQnlSVWlWdTV6Y2NnSFFxZjNCTnMwbXd4ZkIwVlNMTHZmaUJiZnNqZUJJ?=
 =?utf-8?B?aTdOd0hsYUNoU2hxWWcxNnhFT3pVYTRIQzRLKzFCY2N4SVFMSVlTVjlUbTUr?=
 =?utf-8?B?WURvaEVBenYrUGszdjcxUUhka0VTK2p2UStXVjhtYTk3UFpkS2JNdStNMUJT?=
 =?utf-8?B?eC9PcG80SGxLNG1yaTNzTmpMdGI4V3d1c2p2RnBVNmZUbm9GQldJM3lWdC84?=
 =?utf-8?B?c0loWTlVemJOemh1QS9PNlAxQnJGc2NVdVRYb0dPQUJTRkVyeWg4T05Va3Jw?=
 =?utf-8?B?RmlCbzhaTGxOREZ5WVRsUWVNR1dxZ2hsUi92MXlLM2ZjYzU2ejZsMThybVJG?=
 =?utf-8?B?NHFyN0NMMDBFSFlBTzl2TW5KdytLYkdFU3huR3NjSElIRC9NVFIxdi9QU21D?=
 =?utf-8?B?OFhIaGN1OWJoNGw4aW1IZ0tWcVdEaitocmhaOFRpSDMxMm5NSDJXR0dIL1l0?=
 =?utf-8?Q?0hoOVBfTpkHs8Q8jxEATVLqJn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0A2AE8619DAE049B3DCC0FBBA9D78C5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ab7qHMVbxNRRe9nwEN8satDs5y4o0GUZF3MfSUTtmQVH+hrfoTBU7rz1vGWH3xhuM6nufNzKfQ2BqSWhJaSVJVMqGl+eNmSDrgUbDd4d2IBKNrUi1u2xfbDBcTU13LCvsHxcIV6wu6ONaBLaNyXuhsByeg3JJpDYvpl1s1WfzlfGnrj4cmAxYwyRrhtwCmBG0YbeivYP4DIaCzfeN8bGtq9LNwJpFlepMUXH699/vBbqQ86qnwcFhuTCnDw4CDK5ayEqrCdswg3wkrRyhEwapKHYDE3Us6BFplqDTDW1SGv7qGjQDuRcQdrd10xSCxYa0zzQqKQ/dCJzN5MhcfjDA1/psw6tiAFSdr3c7+47nDezDqg0qDAg+Oq53/51jYav5iHnOjvvyxQRX7EVDPqXt6VOkaJOLeraR5ZKZYn5j6hGMV2J/3KdPF6hhZThDRrFXSdsju322GvBo9j/pBNJzkg96Wj6Z2XS8jCSbmQjBezabno/YNPw5E2gTmFS9mRNBv41MFGTidCAQexQSoq03Hd25Qen9jKn2lJKj3OCROfQLO9vV2EtssUfMzEC5nhnQHwZxFb7lP1sINN5TWu/AaUxSPCCAIAyoXRIi6UIASpFE6ou1dPktGIVH3p07t6aV8R7cSk2vILTuVhHetqGZA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf25524a-914b-4a3c-0d07-08dcc6363df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:19:04.9988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ/gCKLDlRcP7WZrTRheNbrN3ICRDOgsUbK9WJCNPTkoN6vg9qWMw+kfquVySFyJm9X97S07/JnRWdxJjtzZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
X-Authority-Analysis: v=2.4 cv=YIHNygGx c=1 sm=1 tr=0 ts=66cd2994 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=jIQo8A4GAAAA:8 a=KKAkSRfTAAAA:8 a=_qF_nsAkUmZmLwJPBNQA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yGKkS3BI4VNQbp1dDLLUafvfemr69oSS
X-Proofpoint-GUID: yGKkS3BI4VNQbp1dDLLUafvfemr69oSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270007

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZfZXJyX3Byb2JlKCkgdG8gbWFrZSB0aGUgZXJyb3IgcGF0aHMgYSBiaXQgc2ltcGxlci4NCg0K
SSB0aGluayBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIG5vdGUgdGhhdCB0aGlzIGhlbHBzIHdpdGgg
Y2FzZXMgb2YNCi1FUFJPQkVfREVGRVIgdGhhbiBtYWtpbmcgdGhpcyBzaW1wbGVyLiBSZWdhcmRs
ZXNzLCB0aGlzIGlzIGFuDQppbXByb3ZlbWVudC4NCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jIHwgMTEgKysrKyst
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtc3QuYw0KPiBpbmRleCA5OGY0M2Q3MDgyZDcuLjdhMGIxODIxNzY4YSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXN0LmMNCj4gQEAgLTIzNywxMCArMjM3LDkgQEAgc3RhdGljIGludCBz
dF9kd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlkd2Mz
X2RhdGEtPnJzdGNfcHdyZG4gPQ0KPiAgCQlkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2
ZShkZXYsICJwb3dlcmRvd24iKTsNCj4gLQlpZiAoSVNfRVJSKGR3YzNfZGF0YS0+cnN0Y19wd3Jk
bikpIHsNCj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiY291bGQgbm90IGdldCBwb3dlciBjb250
cm9sbGVyXG4iKTsNCj4gLQkJcmV0dXJuIFBUUl9FUlIoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsN
Cj4gLQl9DQo+ICsJaWYgKElTX0VSUihkd2MzX2RhdGEtPnJzdGNfcHdyZG4pKQ0KPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZHdjM19kYXRhLT5yc3RjX3B3cmRuKSwNCj4g
KwkJCQkgICAgICJjb3VsZCBub3QgZ2V0IHBvd2VyIGNvbnRyb2xsZXJcbiIpOw0KPiAgDQo+ICAJ
LyogTWFuYWdlIFBvd2VyRG93biAqLw0KPiAgCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHdjM19k
YXRhLT5yc3RjX3B3cmRuKTsNCj4gQEAgLTI0OCw4ICsyNDcsOCBAQCBzdGF0aWMgaW50IHN0X2R3
YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlkd2MzX2RhdGEtPnJz
dGNfcnN0ID0NCj4gIAkJZGV2bV9yZXNldF9jb250cm9sX2dldF9zaGFyZWQoZGV2LCAic29mdHJl
c2V0Iik7DQo+ICAJaWYgKElTX0VSUihkd2MzX2RhdGEtPnJzdGNfcnN0KSkgew0KPiAtCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3QgZ2V0IHJlc2V0IGNvbnRyb2xsZXJcbiIpOw0KPiAt
CQlyZXQgPSBQVFJfRVJSKGR3YzNfZGF0YS0+cnN0Y19yc3QpOw0KPiArCQlyZXQgPSBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihkd2MzX2RhdGEtPnJzdGNfcnN0KSwNCj4gKwkJCQkgICAgImNv
dWxkIG5vdCBnZXQgcmVzZXQgY29udHJvbGxlclxuIik7DQo+ICAJCWdvdG8gdW5kb19wb3dlcmRv
d247DQo+ICAJfQ0KPiAgDQo+IA0KPiAtLSANCj4gMi40My4wDQo+IA==

