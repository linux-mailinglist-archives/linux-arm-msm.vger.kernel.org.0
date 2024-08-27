Return-Path: <linux-arm-msm+bounces-29520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48DD95FE33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471041F22A2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0404C83;
	Tue, 27 Aug 2024 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FNW20xLq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ap9qq32b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SqhmH6NG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1C4A2D;
	Tue, 27 Aug 2024 01:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724721614; cv=fail; b=SrUo9zRACCELRGYNmYwF2dJVJMOCHx0gks1ODcNIiedPYwE/zznp/wKc2iG13oFGawiVb566r1Q6nOQSIa/afGxulJ+10/h/E0gSuCZnUTgSq7alCAB+8w0OO4ByFFjx5yZ1i7B8yk3nzQmklzweMEw+JjOYzKKgaW6oy3FEaSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724721614; c=relaxed/simple;
	bh=G4kfK0JNkbNe6jSVThknzRsZG1KUpMPIlgfO9J0SKn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TzjT6K2Wk7ils9iv2N/V1xrG9VO9fjOVn6pbt5ftrtMpKvbg9XsDJIwqkYbjxiCzW6mk01TbwBFmyc0ol591Iuwcy/QbHa5KZvjkg6TAVSNjOzJ56wJMYnIxdR0zqXrtoXk8ozT+GlpceTnW41r5GSI7XrBNrzjLfG7cNdQc/q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FNW20xLq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ap9qq32b; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SqhmH6NG reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQAbv020772;
	Mon, 26 Aug 2024 18:19:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=G4kfK0JNkbNe6jSVThknzRsZG1KUpMPIlgfO9J0SKn0=; b=
	FNW20xLqfJhAQy191tPnGPEBSp8MPtwHmyxElSdnsIMSisYbt5aimGeFwcso34cM
	hizlY5tMBlvCiE1N7fVRiRK5/BUoWMG/448fCECm9NP9gq0lFolDMevdGOKWC8Ph
	4ZpxZzQyYslAU4UvJj8rqRf3rUBdKBgP5i2NMEy5EPl1Ew++0y2Ib3OiDnSNBxWv
	/1N1IzSoyp12Uhq1tAtzO/nyi/q8x52Un2TLa7BX22/1fjhX5JCCWUDFbDwVibgX
	CIXQaMf+c//aZvsh/FLp3x3v5vvMh8VTCox/dIGFhQ74mAMERAl3D15+5YnQJ7+g
	+JG5n83b8+6WwvbEIQMdeA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417es7temx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724721595; bh=G4kfK0JNkbNe6jSVThknzRsZG1KUpMPIlgfO9J0SKn0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ap9qq32b1wSXUI4ELe1oSeP3Tu7xeqOuv9PYYdJxisJ7tgcRoaFNwTATqJw8aQ9MP
	 Jun2tsLC4cgiHCH+XcQq8MLOwkHa5hddU4ln8Z67JKtfG2k5ObNNMnN+u/QFtdyEe+
	 dyT8lAqBB+PrWfmBUG/zaVW4orXMw5oaE04J0SiI6sUQlsPj+kuYQpMGEtevPwdUMp
	 D8GYHvYbX5ClKkQHah85bLHF5Nf31mamdEu+6IKI5c+u7iKb8tBhz+tUBPAKhcGt7P
	 qRQpupUgvLgM5up3g10+/weuu83IpYhJa/uajTOcrdPept+co4FK0i1Y3DKjt7KopW
	 uYiQCq23xn2fg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 442B14034A;
	Tue, 27 Aug 2024 01:19:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E7D06A0070;
	Tue, 27 Aug 2024 01:19:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SqhmH6NG;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C9E364048B;
	Tue, 27 Aug 2024 01:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfDFSR2nFk04BAkiixrnAY7hR+HrH2OpD1KR+Inb1Zz+g8FX1soRZdLIE9oxAsRxrNO8PXHBa/SK1eUZNGr5ifGCct16Rc98QD/QF5tyUw3CEUHhXyC1179f4VJafstynZnfAxXi3g3CeYJve6IKhBBMSV7ClgpiEn8ol33eWyRd9HuKQlQkY+JqquM9KfTZ423MEKfiiBPXeV/SQrfyg9qglksZLIikYz0n7yVo/Mw8zQFtVuEMYDzA1uv4bJ22VdmXNdAB8+1zwB68VSamF6E01hpo0H/j5ugrW8WKO0Kcq8uRIHxnb5fynthwEU345PnzPs+6OFLHZbL/QFDekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4kfK0JNkbNe6jSVThknzRsZG1KUpMPIlgfO9J0SKn0=;
 b=gMw1N3uib851b8Aryfe30j/AN9MHSNgMgHniMouP8sObQjja7DcCIj7e1HBeq/NuJ6+r6wVSE6Q6hNnxXILfiEAdYE0Hu1M6KcepeHN7Ihvuo7OVp/IbEizKHMxU+KKJ71sijeVG4WQk24/UoMBOTrJrbCidooNds2GGHsMCob2yCVA4WYlkd9pWayrtVkx63s7RThs3QONLnuqI7cpBNZt+u9ifuOkA3QWA6gnxo5DreDHpC4LH420YtjdcUI4ZcIX7XmNJhYwHW0d0W6FsGfz2ixQ7+4uNQ5JK5g82cIv8GYWi0h06wT/q3pxPZcmYuQL+vaBW7QUGfJv+Flwpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4kfK0JNkbNe6jSVThknzRsZG1KUpMPIlgfO9J0SKn0=;
 b=SqhmH6NGxb2Kx4mPV4xVX5TcpDS79ws5B+EcT5GPL1yCAf5mMESsLsBP5q6zE0ChIJdMG+upAVF0hormYncqLRmjOBW+0xJSclH/Lh6L37RZoKh+y0aw8Jv7miKBf7zswGgEHeLVHkOAk4ce9Byxt9vsPrxfib750IE3J1Kn+xM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:19:48 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:19:48 +0000
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
Subject: Re: [PATCH 03/11] usb: dwc3: st: simplify pdev->dev usage
Thread-Topic: [PATCH 03/11] usb: dwc3: st: simplify pdev->dev usage
Thread-Index: AQHa7jXF3VdX5lK1gUe2k0FSPEKTsrI6YfuA
Date: Tue, 27 Aug 2024 01:19:48 +0000
Message-ID: <20240827011945.hcbehbvyudak7qhs@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-3-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-3-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8311:EE_
x-ms-office365-filtering-correlation-id: f99d35a6-3cfa-4fe2-6ce8-08dcc6365816
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnNJK3hFbkdVMDA4a3IrUytBTmNsVzdEYlBjYmRnU2pJS0RLeG1OQkt0aEht?=
 =?utf-8?B?akVQRWd3c2E3bW9uZmFNdXh6WXhpS1dXQTJDUmdTeTBZait0OTlqMFM5QW00?=
 =?utf-8?B?Z0NMRVNaclRCblV1ZEZwOGN2YnlxblNTa0w1ckd6eHpCTHhxM3JvVm9xYkY1?=
 =?utf-8?B?ZUd3TGpzSWRVd0lvVlRoaURjeHB6Q0xaTnRaaHZGQ1ZQU2k4b2F2cmNtUXZC?=
 =?utf-8?B?bFkyMGNjVkdiYjB5cE9hd0xSOWVIUlAxaC92YXJWbXh5QWdldTJxRGtzVGlE?=
 =?utf-8?B?MXZodDFxdHh5RGFocHh1bVFlekFHYTk5VnF5QjVYcktONmVhNG9LZTJWL3Br?=
 =?utf-8?B?V21xa0Z4djNvR0ZmdGpyYzVTdmhRdEo0Y0dqeVkrMU9ON1g3allIS2dtNEhv?=
 =?utf-8?B?VDlORWJnY3FMdDM3UWxyS090RFgvTzBrSHpmVys5N3k2RjczVW9PcjN0aHdz?=
 =?utf-8?B?QkZsc2NjV1lEOEpQR3B3N01saUh3VzJYL0sxa0NRUlN5M2JpWGUxV3NzaVQ1?=
 =?utf-8?B?U3RLZEhvdkxpVmMrLy95N0F5VXFTVzNSZUl0NGZqditjTUdLLzE3QXI1K0VH?=
 =?utf-8?B?Nk9Sa1Z5ZWU2aENCNUpnMlk3eFFmK1pRV2JmNXVXMXJJc1hqNS9ScXBDVGx2?=
 =?utf-8?B?OVU0WlNqaG1uc2ZnTC9PZTNhbG91OWVibUkyOG9hZnZhdFJoUXVJMGpXYThh?=
 =?utf-8?B?RjlqT3dKUngrNVdXaE5jcklMWTNIMzdTTGIxcGZ6Z1hmcHJ0OVM1THdtb3F1?=
 =?utf-8?B?VDFNVTgrbTdZV3VCdnQxOXhIeUhVQktDWjlqOGZrd0k2SzBORjhYNUVLblBl?=
 =?utf-8?B?c0ZvKzB0d3hpdXQyWnFwRnJINU9zY0VMMlovejJDdHRkZWdPaVFNSWNXUzFy?=
 =?utf-8?B?R0htM0hiRzM1WkcxbkkzV0dPWGg5UWV6OElXeGM4d3grNFc4Rm9idm9TV3hw?=
 =?utf-8?B?UEVBZGFndGxwOU5KNVFFVTFsVnBsbmh2UVBwMGZ0M05neUxWZGV3RThjaDhN?=
 =?utf-8?B?eUdQR3BOeWNyTDVFcnAraHppaHVQT3hCdVFPSEJPRWJWN01nT0kwYjNRamVv?=
 =?utf-8?B?dEwwM1hOaEFnQnIzbnNpZU1OUkVqdFhETHpLWXVQdXlpVngwQWJHK0NBek04?=
 =?utf-8?B?MGpPUHltWXZHdW84b0VNU0ROL1JsamlXdUQ3S0drOGFOWnNUd0d6YkFkSGhE?=
 =?utf-8?B?YTYxTUdGYlpOTlRwZElRVytucTl5eVhyVUtQVmRocGFPNHVBYlA2endVSTJF?=
 =?utf-8?B?dDFsSHlTRGdBRC9HdFlGM2ptUHRMRGh2OXhtNUMyYUcrZU92NGhnS1pQS3Ex?=
 =?utf-8?B?dXRIN2puMjFuR2dSa1ZjaHBkVHZKV002WHVHd2svSlZrVVpiUnAyNU9WNXVq?=
 =?utf-8?B?MUV4bkcyYXY2MEJOTEVUeWR4QmwvUUdwK2ZPc1BETlFSb2RmRzk1RW9Qc091?=
 =?utf-8?B?a0JJcGJ6NHdVMXNRcjFkd1lYbUZhV3J4TndHbUNNU0FmcE4yaTZjSG5nU05n?=
 =?utf-8?B?K3RVZFl1M1N5QmJwNkZPWENVRjR5NnhNUjhGSTdabDhMUlVOQVJXZVJQNmlJ?=
 =?utf-8?B?NkV0a2ZuUjRScWFLV1ZzaytJOUhlc3R4UFEvQm8rSFRzVktqdFllbWExVExM?=
 =?utf-8?B?TEN4a3BmYkI0WnpMdFM0c3hzZzlNSWd5QjkycTVsKy9XTytPclVlcXR1TFA2?=
 =?utf-8?B?NklnRnlaK2lFRit4bDNNaGtxTDhpZ2tNeVV2OHJueFFDUTM0dStlL2tMaTlD?=
 =?utf-8?B?V1pDUHFESWJCdy9SRnhXVW5qTFh6UnlpQ3NyazBUakk5WTZkU0xGdHREQ1JI?=
 =?utf-8?B?VGlGRDJBdXZIV3k2SlBML0VxYnNaZFo3WUxCTEFXbHBOc2N3dHVyQ3lzTGhr?=
 =?utf-8?B?S3VvNVRlR2hxVFBOd2ZjMURLQ0lMb1REYWNOMWk2TFpPaVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGtRTWFNdUlOVGdwOHBBUTE1M1BmQ0haQW4zWnRzcW1UcS9CZVlFL1I1Rk0r?=
 =?utf-8?B?aFVOYlMwYWZiSjBoRTkvZ0Flc1hkTlc5MENZY0pOMmxpT1dBN21QL2JzcGR4?=
 =?utf-8?B?ZE1MamU5RkoxdGRkQkxqVDU5TEhSemtiWUZPRG1kMW1XYXptd2xGNklQRk5s?=
 =?utf-8?B?YXZvSzVFQlovUGQrOFNyM1VCTU80YUNEQ0ZzMmt0TlVjTnFHL3VyMjdvdWpi?=
 =?utf-8?B?aDFaeklzY212T3F5czl4ZEowQ1lrUEVoYVQzL0RtSW85RFBINWJmdVFjMzFI?=
 =?utf-8?B?OHpxN1B1WG11aGFTSDlWKzJhaTZxVy9BVkxlanZ6MGxLQW5lV0kySWhzZ1ZB?=
 =?utf-8?B?bnJoV3QrcGc2ZGNDOERpUk9pRUJmck10aC9seEVoUFY3c1FwbVd2eDhXUzVC?=
 =?utf-8?B?M0dKYTVDeEp4RWFRaCtnZnVXRHRlb3dycnV2V3Facm1IdkpmSVNqdWRSclM5?=
 =?utf-8?B?ZUZURFB0Q3p0ekZDZGloQlBDWkRBV1Z6NEFaSmRmdnFGa29EbTh2NEdQUkNt?=
 =?utf-8?B?ZElVYXdIOXAxSHZmM0ZDTVIxRXZabGdUQVlqU0dMcmR0VnRZMU83S2t6eEZB?=
 =?utf-8?B?NWdrclR3MWFIMEx3VlpMNXFEMGpiS0tZeUloaVFDN2hQaUowSWwwUXMyTVZ4?=
 =?utf-8?B?REQrRlNyb0p3dWNLbU5IbnpDVk1iRmNIOWhPbVR3eTVuRFdBeEgwNzZMTXEy?=
 =?utf-8?B?RGZ4MkFnc1JlclFpdFVjbE8zMVlNMlY2RDBTc2VOMG0vYXIrTkwwL0lKYzhr?=
 =?utf-8?B?cE1tRy9JS3dzSGVLMGR2UFFGaTJ0Wm5ZQWFZQVJtNE9HVEZhYW9iNmVMZVVB?=
 =?utf-8?B?QkluQTk2T1JTdlcrMyt4SGFIcEhYTk0rdlh4NU9vaTh6Zkt5V3d2N0wzWXNy?=
 =?utf-8?B?Ui9HbWl5eS9DdzVSN1R1dnlXVnczMVB2VDNIRTlaNkpsRzlsMU92aUUxSElB?=
 =?utf-8?B?OXhmdnk5ZWZxSDF2RisxdllKQyt4bXF6bEh2NGppaU5xcmwvQmt6dEtWb094?=
 =?utf-8?B?RFl5Y1BBYnBhV3Rmd2llSVRubCtqUXBrYlg3a21vT2tvUHlsSHBJaTltUnp3?=
 =?utf-8?B?WGVqMGc5WFljS2pEZzlLSCs5TEh0NFVZN2Nxd1FvVjRsMjlxaDZYL1NwcldO?=
 =?utf-8?B?WGU4WG00dHFQbUtlNUoyclZPZi9yS2ZXNDg1VzFVRWtKcUZMRkl3MFFNcmYz?=
 =?utf-8?B?cmVNckZ1cU95eDBHb0R1MzcxQXNKRU9rWDhEK0ljcHBESk95aTNsZ2lFNmRQ?=
 =?utf-8?B?WTRoRUY1N0xLMUtFVVBGY3pkZ1lHKzhkSEJncWJwUkJrWnhJR3lYdmNreXN5?=
 =?utf-8?B?RWlSakY2VkVXRmJVRHBWN2pqVkl4cEVSSUd0ZnZXNUJHWHR6eG4xc0FkNGRK?=
 =?utf-8?B?dm50SE5ybVdwdUhKbkROVjNVWlJMR2hKOG0wRGVqTnVYckZ6SXQ2TnpxRlpq?=
 =?utf-8?B?US9pSmNhek1FOVIwZUNpZVlJZUQxamoyNXBjVGQ2UjNnWjh4WjBNNDRGK2F1?=
 =?utf-8?B?eTJMUGZERmFXWDROdW8xaVRZR0cvMUtaaWtaM05IS3lYNzJuREJYU05nUC9x?=
 =?utf-8?B?ak15YUF0cDNSbDVXT3cvaDhtSEdPYTFtMDdQdERPZC9SdlN4MHM0WXE2SmJm?=
 =?utf-8?B?ZUdGWFpubk5TNHBIUjlZbzErUXBndGd3RjZVTVB0R1A5Szl3TGZYb3hQUGxZ?=
 =?utf-8?B?Y2pjd1BMSkxFcnJvREhDaUs0Mzdrd0tXdFlISWZNT0E0S1ZZbE9ScGppUmh2?=
 =?utf-8?B?b08wSEhaYkZ1amJsR3VmWjliZGs3N2xrUlVsbU13cFpFMGRHVGRYcWFkM3V6?=
 =?utf-8?B?eGthclFmczZ6aWpBVFNOWWZQYjl6R1VUa1I0ZDZtWUFBZHRrN3pkZWQ3QUZ0?=
 =?utf-8?B?QVJzWkZrQ2Nqamk4N0JqZThWQ1VPMURFemRwZjR5MncxS0JYeDc4OEN6ekNn?=
 =?utf-8?B?VG16Q2JXSUc0citqcy9IOGZVb1ZqUzdlSm0zQVB1WGVJeE42ZVN1bnpzZVZX?=
 =?utf-8?B?d0hqd2dqTGtpaGFvY3BXNGNUQkIyaGRqMEYvb0pDdjNiTUJGUEVpMUVIMzg4?=
 =?utf-8?B?Mm1XLzlnYW96SUxPMHZHZk9IeDN6TmVVemVucXBWZzVBMmZhYy9OeUFBVDM0?=
 =?utf-8?Q?/i9f9UYsCwbdcMHS43YqBUW5b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C640A1FFB22C0F4B8950797E43BE6475@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	51oS7H6YVwo0CDo2MxyoLtOYf40xr+FjBRyM2kje38XheekNC7LOU9dK0Sk2qvcRoj9SiijguvIxOSyWMEa+z9ouUCywtlf6Mf80UhPliuePedScKHZTRI2ugrOg4/IU1WuI/e5RbtoEHpCH+6AQbaBXonr8uDUeVyKKat0JE7kKp8rhgC9SwUMbPJsvDUjLXOiqD1GNCxPxoH9fvu18ZhxCYfdNRzokUrZarsKJRka6x2ryszUJIXq6xqgjTEMMaRkOB/hAVWq8EfVJIs9vWb0s0L3zyneNUxG9NHIURjUwGWU6MP3/FAzEARZEAi5DHcZIqguOD0oM0AoTuGN6lw9rO9QBnSNtdtWzGyyhKuYzn3dBEZWD1Lt7288AEpXd/akElVQWdzxt0BcPwBXyPIhT7FK7xP4wSHWx+R7ebzeLiYKREyNeT4eJ58gUpNrqxsWKkCcg3WdUsfhA/HFxObHTh0hQqYCozgKiQ4x+yRkVdCGWlGBR4f1hS1D+t8+JAeLKJSH2rsZQPvH6p40depknYK/IhhfSsepBRc6s/NVKL7zYhL7oiuSVi3+2GM0BZ9Znk8vHJHqCLHbGZys/Ih6qUWtHk0zOMJb2JQLwhHrg8oEi1zSHOxbiV3ee2lcyaqViJvgxG7uCzMgbOlN4xA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99d35a6-3cfa-4fe2-6ce8-08dcc6365816
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:19:48.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNGJpiy0BC3RbqS/IuambTp+j4vx3l7feUT9q9VmMh9rVP/83qYOB8TZSZumVXk4cFv7Hc/dJUnWR2kLkBrbvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
X-Authority-Analysis: v=2.4 cv=NZK01HD4 c=1 sm=1 tr=0 ts=66cd29bc cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=jssYuVedcgHY_Gtd5ogA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: ysco63ls0HJtGprSuCVEQEpmi2p0XiHE
X-Proofpoint-ORIG-GUID: ysco63ls0HJtGprSuCVEQEpmi2p0XiHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270007

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFRoZSBw
cm9iZSgpIGZ1bmN0aW9uIGFscmVhZHkgc3RvcmVzICcmcGRldi0+ZGV2JyBpbiBsb2NhbCAnZGV2
Jw0KPiB2YXJpYWJsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtc3QuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtc3QuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jDQo+IGluZGV4IDdhMGIxODIxNzY4
YS4uMjg0MTAyMWYzNTU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3Qu
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYw0KPiBAQCAtMjI1LDEzICsyMjUs
MTMgQEAgc3RhdGljIGludCBzdF9kd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICANCj4gIAlkd2MzX2RhdGEtPnN5c2NmZ19yZWdfb2ZmID0gcmVzLT5zdGFydDsNCj4g
IA0KPiAtCWRldl92ZGJnKCZwZGV2LT5kZXYsICJnbHVlLWxvZ2ljIGFkZHIgMHglcEssIHN5c2Nm
Zy1yZWcgb2Zmc2V0IDB4JXhcbiIsDQo+ICsJZGV2X3ZkYmcoZGV2LCAiZ2x1ZS1sb2dpYyBhZGRy
IDB4JXBLLCBzeXNjZmctcmVnIG9mZnNldCAweCV4XG4iLA0KPiAgCQkgZHdjM19kYXRhLT5nbHVl
X2Jhc2UsIGR3YzNfZGF0YS0+c3lzY2ZnX3JlZ19vZmYpOw0KPiAgDQo+ICAJc3RydWN0IGRldmlj
ZV9ub2RlICpjaGlsZCBfX2ZyZWUoZGV2aWNlX25vZGUpID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hp
bGQobm9kZSwNCj4gIAkJCQkJCQkJCQkic25wcyxkd2MzIik7DQo+ICAJaWYgKCFjaGlsZCkgew0K
PiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZmluZCBkd2MzIGNvcmUgbm9kZVxu
Iik7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGZpbmQgZHdjMyBjb3JlIG5vZGVcbiIp
Ow0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gIAl9DQo+ICANCj4gDQo+IC0tIA0KPiAyLjQzLjAN
Cj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
DQoNClRoYW5rcywNClRoaW5o

