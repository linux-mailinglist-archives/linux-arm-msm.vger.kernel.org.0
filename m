Return-Path: <linux-arm-msm+bounces-45066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB774A11792
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 03:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C7E1674C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDD822F166;
	Wed, 15 Jan 2025 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BNHagRvl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O+wIuNdx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OSRXjbxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842C22DFB4;
	Wed, 15 Jan 2025 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736909963; cv=fail; b=nR4QX5ZmA9XPw8eGJGWDigSLCXO9iWj0kqw1baF+R3exqsR+5VtpVGbmYVVkZ5z8ACIQ4MozRGTMQsD+ZbAurSgU7RZ/w/gIW+n9T7VMWWFWZ0JnEK8Q6a/OXHNWQAX9sxK7Mxl6VW+Neb3/hGBMCkrdgiNiY1NhE29NWvh7YuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736909963; c=relaxed/simple;
	bh=ZVSPGiCpz+MaNhAhgtvfVdFot395EDqnFq49gY9Tkrs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dqoz6fS6AZOmWI4Mjqm0/jutKQMdoAa2g7mhb4+puViGdFF0ok/CPrTqE+gbY96kqrCTXUj2fyV+KUUhEusbqyDiQa9vOe/aVYgfefxbz4XkzuEbB1qU4YbPAnCDmBUftU+coH8xKZmtTzjvsyOFqsPZ7Mz7pVIUhVAx9vH1xpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BNHagRvl; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O+wIuNdx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OSRXjbxv reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EN1sOY026055;
	Tue, 14 Jan 2025 18:59:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ZVSPGiCpz+MaNhAhgtvfVdFot395EDqnFq49gY9Tkrs=; b=
	BNHagRvlxG+sl69FotI4JPJe1LtGJ8eFhfK3328ecZUyor32DrEfMoMdOcybBe2X
	L0YuL90L5wBrH9twVJpXOLL5tt92oatAMvpifIfoqp+KkdsPaDU6AM8E63+610kb
	LDAczsCG4rWVrvJoO/d2Qz5pZauoKCT2Vp34U2pdJ6U4w67OIHccgCUBw6xgzQEq
	BIqAVxaY2T+RTrUgCCdtXdOHVXI2P1ckLzehbDmShL9YHaXCOlnyrQ0ZndF8ALVT
	s1GfjyAZ9fV6rv4EItsyo2OhJ00TAylKDhqUuVLwW/c9h7nb5RYnfymSxK5/V5ao
	86RGyxnNmKJhhh0kbBaC9w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 446186ryh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736909947; bh=ZVSPGiCpz+MaNhAhgtvfVdFot395EDqnFq49gY9Tkrs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=O+wIuNdxfX611VcGS6L6JD3ct/nbBR2uJK1fKwN3w0t3XYUDOCUOnIpd0UilE/c4n
	 Z3O37Ezt/aLCvNvCE8YnPvP/nctW2/hTtxTZSRuzfn2o4L3GYNhJeqyhvE0omt2kl7
	 Ng0UnJNghRgTzI7kA4pu3R/QROeQLD9gEwX/+joxpkMP2b3WQAhfT5Rrg3XKez4AB+
	 OrQqdYHfnpxVFZarw121jqhqwf4+44zkZhUB44+YvhwyQqKtIgc//4wX1e/LOxhfMQ
	 oTCnKu8npP6OVb5PbSgiZ8UNM4KZlA3zc5gBgARVJook1DhDH+lmehS4S/Zv8DJcXX
	 Sb5oXNwmbG+bQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 62DDA40521;
	Wed, 15 Jan 2025 02:59:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8C9A5A0072;
	Wed, 15 Jan 2025 02:59:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OSRXjbxv;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A616240357;
	Wed, 15 Jan 2025 02:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM73YKM3Sq3vJv2RAaqo+UI5n+ngwjjcZBASKH8LbGD1Cd4XD3WhTdYYMT7TdTzqLRyEclGewi62nYJkFD+mZWUWXOtccrN8jhuocg2E69Ht+KRZeqie+5sf8s2Rp0ToZ8Nj/wrsj740jBGYQqtqDNrLASh7+pagoFJVypzS1fBEdoLPeCURElZQZWmA8gph2n/QqsJ3zuoe2PlgcWBYXxbWLHelqR6abVrIe6oeDXDuMwoCYPsjHB9b9/Awm1LstHjIsXWeVNBtY08EWefxb95WZNbq/u/3qhRY57BcR1ntpoBXLFJNwhO0YvRnzgDqY4+F6sxQ3C+LJWsc2hR4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVSPGiCpz+MaNhAhgtvfVdFot395EDqnFq49gY9Tkrs=;
 b=yNBborEJu4hhJ9Fcygc4tN3kFf8kr54fzXHZbQ2H8rMpktU5Xhb7pY8Pv83rCeHjm83I9lvgZ3sb2eizkMJX8tijPxEMb+HmB05fWBa+CJ/PUBhl8aciKPqYOVpUpGoewwQh8OlW+o4FLrRVoRZ5TQCk/SZCJbgedZAN+Farx3b2SFj0IImLcMqsbZUdjpYl/r5bwg8dbb7dLZZ4f+j+AQnYoLdqQzFEIi1+xkbXEytJhdenHCxAhnVsb39jRZihbc3focfG8iYhl9/Oy9ySzrNxMNzsYPVA4urbK7iXKxb+zMmEPqkkWe2Sr3dNHQKkWqeuwUBLBgBwSU3KtK78eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVSPGiCpz+MaNhAhgtvfVdFot395EDqnFq49gY9Tkrs=;
 b=OSRXjbxvn2sGi6vNhHmCVYxiuc2+Pfp73TaQJpnv5ClEo850kBKEKuDOTbtERBo3n2zu1tx1sJFnu+PpmSh+cz/mBmAuQj/QiRYg8grMBe0yY5AKyXufbM5I884+8rMDd007Xcc8gqAb8PSlE0+E4SBdI5PxAZ52dfJ2nmewf8Q=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 02:59:00 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 02:59:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Frank Li <Frank.li@nxp.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/12] usb: dwc3: core: Expose core driver as library
Thread-Topic: [PATCH v3 08/12] usb: dwc3: core: Expose core driver as library
Thread-Index: AQHbZkINGLyiDhNxtUG7fDaOZUkU5bMWrMuAgAA1pYCAADJmAIAAEXyA
Date: Wed, 15 Jan 2025 02:59:00 +0000
Message-ID: <20250115025857.ro67qieahqhirgzf@synopsys.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
 <Z4a+fyhInS7ETgKh@lizhi-Precision-Tower-5810>
 <3s77lvw4dp3cg2s6tqt63wuexft3pusfbg2ibteacnd5z2dolf@p7mb2j5j5jlz>
 <20250115015622.xbop23ltcin6vysg@synopsys.com>
In-Reply-To: <20250115015622.xbop23ltcin6vysg@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB8430:EE_
x-ms-office365-filtering-correlation-id: 4213adb3-9fe1-4a39-bb11-08dd35108faf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1U2ak9MaW11Szh4UW9nNVFmK2VwcnNEdlYrRW5TbGt3VDhrM0YyeTRVT0dH?=
 =?utf-8?B?L0dJODR0UXRuanh2WHdERVIyTGx5a0QrYXAvZTQvaGVKdHRzU09SaWpMVGpy?=
 =?utf-8?B?ZDZldEVXei9tNnpQTVJiVnZoampRalRYU1JXOFpFaDVvTHNNeTFhckpnc0RN?=
 =?utf-8?B?bEo4VTZXR3hhWE1wM3ptMDZyTjJDZThUQ1lWNUhldWlLejNrNFNUSEp6YXRa?=
 =?utf-8?B?NzJNbHl1Z04vL3FvbUxocmcwUTV4K2psenBqMmQ1RXhXY3pBak5uT1FMbDBl?=
 =?utf-8?B?S2oySy9EVVJSaFJoMURITDg5KytCVTNkblJLWnlCMC9zR2wzY0RDS1UvSFpG?=
 =?utf-8?B?T0hPTHNER0h0Mlcxb01iV1Boc0Q1OUNVMkNrR0RuZDJXRTQydVJsQkJiK1lm?=
 =?utf-8?B?UlFickZjZmJuaittUzNPVDI3VmI0VlBkWnRLbk9UMWkyUFV2RlIzbzk5NXpL?=
 =?utf-8?B?Zy90MTlMSllqRmZVZHp2L1BEM1p5YWV5cjhOUTl1SlhMa0JhT3NyM3JuZERC?=
 =?utf-8?B?Z1V5UkpzcW8vaFFxbGxQM213dFdjS2EwQmZqM2hHTHZxYWZsN3Y1QXVVVWc3?=
 =?utf-8?B?VDNrREdyMklhbEFFMVZYbUpQRlh0MFJJaXRtbnl4VVlvZ1FxNGZkbmt5bHhV?=
 =?utf-8?B?SkpNdVNJUERYNWh2YjVlMWVqUTdCbGU3emVna2dkdkxVaWJ3b3h2MS85d3dl?=
 =?utf-8?B?MXNHRUUzYzZSZDhoNVc3NzdmRGJ3NVo4MHp0VS9xV1IxcE5jZ3ZlNzBKTnZz?=
 =?utf-8?B?MTVBRnF1T0s1c2tsSXJNYjc1NnBKZEhKZUpxaDRiYk42NXJPZEVJVVg5ODBy?=
 =?utf-8?B?MUxrUmN5aGxheDFxaXpmTWw2S0NCM2JWMUlIRy9kUDA2ZDlhaGJlK0xUNDI3?=
 =?utf-8?B?UkJEcXh5dVNUUkZVeXR2VXBZemVWYVcwZXR5YTdlbnB4SmZjUW9jcUFDTzF4?=
 =?utf-8?B?dmtyVjRGKzJLek15RWpUaEFtSHpIVDhEeE9nSHpXWWV5aGtQeXA4V0R5SGpN?=
 =?utf-8?B?SU9jcmRINUVqY0Z3eFRFSjVHMjU4OUxOSjRhL0E1bE04U3RiZWlrbkM0L2ZK?=
 =?utf-8?B?cnZncGZlY3NaQ3l4TmtrWHl5bW43cUVOdDVkQ0poaVZoV3JyM2JwQ2h4ZG9n?=
 =?utf-8?B?ZjcrZnY3NFBJcUVsYmlucHdISmZLelFSWm1VTjlTekxFVXErbk53aXFqV0h6?=
 =?utf-8?B?enYyVTZvVFRSZVZ6UkdvQis4M3kycmVWL1BsNEVWRWV3MHJtaTBMR3VvdFpM?=
 =?utf-8?B?TmpWSkpkUGlkQmFObzBDcjMwUnBEd1dqY1V4dXRIRkU3RElpY0Z6cnM1Ulhr?=
 =?utf-8?B?TU9DeloyZkM2S2h2ODhabjF3VlY2d2l2L1piREdUZlNIRUdHdVVUaHF1TERG?=
 =?utf-8?B?Z2IzSlJ1ZjJTRzhJVEhIemtQb1dKNldFNjJaSURseEVUWmoya0w2RGtwRHhz?=
 =?utf-8?B?bElEcUwxTzlIeHA2MmlwOFdLbDlNYis4RmErNkY0MnJiY1NUclNKN2E5QWor?=
 =?utf-8?B?WXVtNmJhUWFRVGxEemJSelZpWXNod0dBVE50clpicHVNWXRpMDhML2JHa29I?=
 =?utf-8?B?bVNodjFnVHJrbFlLVlloM1dlUXZTblVZRXpKZVF2WVp0UThpWGx5cXpzYTB5?=
 =?utf-8?B?VTIvaVE4bjNlcDZtNUdZVU5IeWVHUENDNnRRSGpWQ1kyeUpSSGJkWHlOMjZl?=
 =?utf-8?B?dmJRR1A5VG5hbHVEZmxvaTd5U1dOMHJrc2VaZkJCSXUzWnhXQmxxS0ovY1hh?=
 =?utf-8?B?ZTlEbnJobThMTHFHZ1lIMzBqTWwvdXo4NG5HYS9pZ1I4bVUzNUgzaDN5aFVq?=
 =?utf-8?B?clpFaWE1dWFORWQwVW1ha1ZneWZYeFVzSzJKTnpMTVdKUzRkRmR1Y0VUbVFx?=
 =?utf-8?B?d21HTVU3TW9RTlJlNXlhOFBFUEwwYkZwOEEzRTFEQmVRMkpucWVPUm1uQ21D?=
 =?utf-8?Q?ZD7zsQX8J59n+A9olgO7d8wzs96dZF9p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OG5DWFkzVWFCZlY3MzhuZGRBQUh2V2h2cDV6NU5DV2kwVXlmWVhYOFBYYlZP?=
 =?utf-8?B?dGs1eVoreFBQU0RncU5SaWRyZUo2L2FURnBQc3Q0MGw5ZFFvTTlGMmtjci9B?=
 =?utf-8?B?bW5aeGg1VXg0SGw1NitGeEs0L3dsWExJZkgwaEhON2Q2UlhuNzY4TmJZY2Jz?=
 =?utf-8?B?blBPUGlwMGY3VU1ZTGVpVlE5QU9TcFgxaHUvdTRTL3Vud1A0ekRrUlluK0Mx?=
 =?utf-8?B?d0tjTUFoVmErUHVHT0hBYndvdTNNSXY0dUNKOVBtR240R1VCaW81ZnBCbVU2?=
 =?utf-8?B?VlcrT3dySUxsdW51ZDNOVUJkNUpGM2pZeGQ3a2Z5cG1jNGpaTFU3N0xYVHNH?=
 =?utf-8?B?RU54Tk84OXBrcmtVYmxGZzIrUEN2MTBBR0VtdFlndnUyc0dkSTFzcmpyMlo1?=
 =?utf-8?B?RGpQNlFhdE1qejlFd3J0OHN5bTFHTFZ6NURLeEFNRXZJQ29ZUTJpTEFqQlJv?=
 =?utf-8?B?clJRQ09xaVhjRG9uYWc1TWhvdFZPbG5lMVpFT0dEUXFRdUFHL1BhZWFqSjZ4?=
 =?utf-8?B?ZkNla3UxYS83WmNtVE1KeEFSamlMSVY2WmlVNHVBOHJSaHJUR3c2WjBYWm5W?=
 =?utf-8?B?ZElHTU5VQ0ZIajdhdld1THM3WmtDL3JHV1o5RENlaUNSa3d0dmF0clcrYi9s?=
 =?utf-8?B?eFhjaVo2K0RQZ1dTS2ZTbDZVbWhrYU44ckUzNEd6UXVVdnFlczVsVXJxSytp?=
 =?utf-8?B?Q3J6UFNONlRURkZLMkRJUVRRY2VYSGd2eE0veUQ3Q3Y0Tmk1VFE2Y25VdW8x?=
 =?utf-8?B?eTVjMGVQZmVkV09zYWpUV1k3TGlNS3ZOMTlsZ0d0Tkl2eGQrSVpBa1F2SXFr?=
 =?utf-8?B?Y2N0WTJ1SFJCVjdDc2FmeEtHWlY5ekd0UW5MOWxUZkpwdTRwMGVoWnkzMk0x?=
 =?utf-8?B?QW13aVZDNUtmd2JlVnBBVFVsTFcva3pUaDdHZFBYbWREVGNBaUxQdkxtZnhQ?=
 =?utf-8?B?U01Md1g3WnpITS9vNzhsajhnZmV0QUF5T1BxMytQZWxjbXZ1cVB6LyswR0V5?=
 =?utf-8?B?eFgrcDNFQkhMcGRBV0NRZUc1aUFPUDJ3NC9QQ2hWeUFhbFF4cjBkTlRLRlhU?=
 =?utf-8?B?TkhrTU8weU80VjhuOTEvNDhKWGI5SllHb2dtbFNyeHkxZzJPM2RUaGp1ZXc2?=
 =?utf-8?B?aG82bEhLVzU1bGZ3Nnl2Rk9VWE84N0c2eldwTHprK1BHZklHRy8zLy9JNkkz?=
 =?utf-8?B?TlMzRVllb1B3T2Q2VVRydjlEMk1IcTVQMS9zOXE2RHphaEVnbUl4d0xtRHFv?=
 =?utf-8?B?d3F0WnVaTVhIQnJjbHlpMDVnOWZscG0zNHdxeURtZ1JZUlFYNmErTTBwaUNR?=
 =?utf-8?B?S01jWEFjbktGVnZkdlE4SGhNTEVGb2lLYld1bXR0VjJpMlpqcDNXbWs5RnJV?=
 =?utf-8?B?R3hSd2FVTUlqQzRqT0kxenAvV2IxZit0S3lUVWRlVWFVb2JjWDY4MWZpeGU5?=
 =?utf-8?B?RnZWeVdkVGJnOGU3dVhWa3QrSFBES1RzdnQ0aUxQaTYzNForS0dJbmlkVGlO?=
 =?utf-8?B?ekFNSTJIUmQxQ0dLcXFGRUF5ZWg1MFRwSDVqYjFIUzhheXFmMnBZTys2RkV1?=
 =?utf-8?B?YmRqYWZod2dyVzhUZGxUR0lGSGIzcFp2ZjVIRjl6RTdseEUranh5dGkwdEVC?=
 =?utf-8?B?SHlsRU5HM2J5TTBiM0VGeUhYODMxeXZBRENXSWhlb0I2NWszdWRqMXhPOTJT?=
 =?utf-8?B?c0J6dEhaSUJUVWkvMWhadG1YM3lnaCtnNUJFMkFLNFZMZFVYZjRyYlVjSHg4?=
 =?utf-8?B?UG01WmMycC9Sa1B0Mjd0TDVFcEJGT05oUW02MXMxa0lGYjZmcWNxeVBXVUZi?=
 =?utf-8?B?WWhWZS9zd0pnUGNOa3NBaEV3RG1LZnZNRncxR1UzZ05nTmUvejlMVXNKY0Jy?=
 =?utf-8?B?eExFYnJYMVRDRGxXWkFzZ3VDNVVId3d2d3hBWFZ1RXlYdkVjeWppUFNBbDlH?=
 =?utf-8?B?TWVyVkt6YTNrVlhxb1lCZ3kydzlJb3BGM0wvbkN6TTVIRFUxMlFTenBya2lx?=
 =?utf-8?B?ZTVnRzgrL2FWcUYwb0FHcDZGUjR5YTAwcHJOSWNpNlZCZk0yNlZaeitBQlVy?=
 =?utf-8?B?SldWMlJPU29iRmdJWHNPcVEvczNnQzBjWkhNUTYvdjRaYndqSWUvbERGNFdU?=
 =?utf-8?B?NTdGU0R2VDJiL1lqS3lqeUIxeTUzVE0rNFliSWkxbVROc3d1MlVwclc3eEFX?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F72BC3FE866FA544A47A4427B2C11012@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	07aLXHrkcu0XazsvlFr1Jrx35v6+rhqhOTNTSzveqpgyIK/iom+eXwjDFbIg/vyskkC5+8OVbcVXSJ9PbP/d2nTB0W0i+8DCbjwxuitbde/lnOgt+FP9cAzumXPXEizCDdQ0H1WdImPdheGrozOPbKEsMtMoB5TXQPutvCxMC4R+LIgxdG53hxH0xE2pXaku0oVSDaokbd/qQntFXYXGi7dZ1fUK6a5umWI9EP6Xo5KGkgpSh2mRp5XOJcrDTIfYT+NktkgTpCsbyBZ148XLsxgeTLNnPimod3bJG6lauySnVcHqBPh8tFEgTk5ogNAx9UkDD2hp330t0v8NgngAv+fUqWIR2ahulrPwk1n2N5nSaud39v3Vvgq9uje9bQGovYwovh+B8Eoy0EJZC8H6lj2iU93SlfwPQTi7BFxjJBRJoZYkx2mOb/mcsu0OsVi4xsH+H3iJQLaZTJ7+gxWZ4zET0Su45Xkovl2Y8nn7UF/lM1HVIal859fuf7lqQo1WOhJZw7WWo0AWvKa/I8TChvY7YT7hMDLMcQaF9eFwfxfH5KYjKKp28G6qUoXI9fhCHlRCaPFSRhoUmkhTa6iy4VXrdkwN1lX7UUXZ7rqCnaWxK18jGFeOWllrNB83MVSn8U4meMqKi6ot0o8u+JH6cQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4213adb3-9fe1-4a39-bb11-08dd35108faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 02:59:00.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4e5ZMaqIP4FiDHKMzEZLYpW/vznKeQHKamhmaRuI0wdrAg35R8OkuJpcGxt8lLfI/rQyadQ9nSSD5DGlCoqqew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
X-Authority-Analysis: v=2.4 cv=UJQnHDfy c=1 sm=1 tr=0 ts=6787247c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=rShVWc7qt9HEQe62oh4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aFTLEhcwKsHn2A0N2XMhuu-I0uACGH5L
X-Proofpoint-ORIG-GUID: aFTLEhcwKsHn2A0N2XMhuu-I0uACGH5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=904
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150019

T24gVHVlLCBKYW4gMTQsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVHVlLCBKYW4g
MTQsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gDQo+IEFsc28sIHNob3VsZCB3ZSBh
ZGQgQ09ORklHX1BNX1NMRUVQIGd1YXJkcyBmb3IgdGhlc2UgZXhwb3J0ZWQgcG0gb3BzPw0KDQpJ
Z25vcmUgdGhpcy4gSSB0aG91Z2h0IEkgc2F3IHRoZSBjb2RlIG91dHNpZGUgb2YgdGhlIGd1YXJk
cy4NCg0KQlIsDQpUaGluaA==

