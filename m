Return-Path: <linux-arm-msm+bounces-64648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8129EB027AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30F71779E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01422236FD;
	Fri, 11 Jul 2025 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EaL+WZmN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BbUUb+0b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RwIAHbx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E82628D;
	Fri, 11 Jul 2025 23:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752276614; cv=fail; b=KstX21zihe8GNSfnyVgWPNLqPIsUhqN8W0/ZVzzLNQGy6yflR9DzC7S/JjxFIzlYtMzUcuhOePEIeSTgkxlk6npVWf7Mw8mcjptLcW6mBaxhunbJCxgd29EdRcBXY4jicePmEGHQVQx5HziTxfkzJjDq6DKTnmBYWupkvQaOK6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752276614; c=relaxed/simple;
	bh=hILgx/2A38JymPDjV92EhUKFYVuIbvQXBi746QkDyzw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DxgzIWp8k4mchqzRl+CUt5wZZDVFvos8FAiZepA8u67PcB+PKzc2Kut9WvUjMkOq4iLUitTI0jatu0uDBqqxSHu4BJeMVk4tYVPZcg4/1QKq93CkHjKKuZlNxX5n1NPukY+o+F8sCTQRIELKI/9DJ7Rwu4qEDG2iqCeAJr76acI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EaL+WZmN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BbUUb+0b; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RwIAHbx1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BKj0gW014800;
	Fri, 11 Jul 2025 16:29:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=hILgx/2A38JymPDjV92EhUKFYVuIbvQXBi746QkDyzw=; b=
	EaL+WZmNn84GQL/pGLCoXrRkzaF1UkeBga2G+ZS0blyTlaJI12j3t2YIg8geR7DQ
	YIA7dt6TfIw2asuS5nbKOS47RrMy9tidjRWz6W1DA22c2Gaza0qj2kn3x9CzjfGm
	TNFcheG7mWkImk7weCZULFeJtCrygdQGL/gJtlmQoriBtOzZNRiE1etb8dcX/Jcr
	bEoBqq6B9e3Zse+tkGurURO5oVf1s7RUwveM+0/hEGpOQveuilsbDN8yKVOaZSz2
	WWbV+MCXDAnd4bjn85VSfh+n7YSPcOiavah029qdjPXINyTHww4FthdF0wsALhA4
	hqedOtbQ+JcqvHwAkNRAlw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47rbqua4gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1752276597; bh=hILgx/2A38JymPDjV92EhUKFYVuIbvQXBi746QkDyzw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BbUUb+0bNqlNq2u+qzUAqV0P4YQyLeKCKzPHJ3HYLn66dfaVUXRX4XsgGHzmnJQyZ
	 16WFAJ1buaIcozZRfVB/C9HpZ9Nb9KDYOXHKtSA1+IOTe+9v7aHq/Tw1FZF+loJOOv
	 rfpS9KNtDDDGfrzHR9Dyo4VWennWdVD3RD96GjBBaZRooWKdoiIFSuW5lPcuAXSYJ5
	 ssyj3bFg+p0VyjZgCGdxRw//VbDSJc67P7kNerAnp6AiXx56Fk9qq08csBboPHhJH0
	 b/shAZ92gOgyeoaBzD/PYx1w4F4PiFY07iclJj6zNcnJEO6Z/bnkB2k3Y1CryOjxCM
	 w5pV/a3OJzc7Q==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D968940078;
	Fri, 11 Jul 2025 23:29:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 76F97A0070;
	Fri, 11 Jul 2025 23:29:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RwIAHbx1;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 16431404AF;
	Fri, 11 Jul 2025 23:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9i2eBCwVMCtZrstJtGZcqS82CP76UeAlS9kEpFQQzjzgU6sE4nJ+Ec5Njpg3zvpw3DkEeuHOOuPEPe0JMiF0ewQeAOA0rSpba05NKPYe1lrFLeJIFKhmLQGi5o4wLaQOjZkiNVwJfTmph+BwjrHgdooN3ZMExZy6QV13sFJ/OMOGOR/Dm+/LnvsawQTDxe+MCv3OZbaAXaj5P+OMTle0CS+twe9MYz/hse7/VRYmj22bZwiemGF9BCSV6f4Q4Su4eyouUyPUvSzhubskHsSsTyB5gLGeJK1AlY4TctIZNTL4suMXh5QO4xZpVOW/XY2OXtCMfq1sRSRjeaR/8rT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hILgx/2A38JymPDjV92EhUKFYVuIbvQXBi746QkDyzw=;
 b=F/HaVl/CfwAvt91hiaYDw0bd0aPoQ2QIdK19Nhcr0/Mt9F7slx8ccCDLXC6eFeLyB/ILgGXcJQ4O3U7ev3QTj3+himzlOTFch4c87Sk1cDU3mGYetnCROl0dDDdiRP+gc3y7d1HiB9H57XZmyGFl8C2ptK2sMMRY4XUKylm1TMVjgM2oVPLD1kevjnKEdmT8mhRo9ncrtnzsk5JHC6fsSWZUtIMrJgdOG/z9RQ3eekDml/rqFE/RMB7ERQhM5g/XIlsiOGb6Cp9gXawDSIIlYgxUbcHQ0fDJYHSNNK8/2cVzugkAD5eVBiuLamohh/l51OKYcd9engSJ1OgW9Z6byg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hILgx/2A38JymPDjV92EhUKFYVuIbvQXBi746QkDyzw=;
 b=RwIAHbx1WbGLfdTQDdG3AlYo3saFQfHB53CSt5OEgM8hhaKys5+r0O8JrJdkBLdUaVjqDwo6tH8ED0VoqZYleAXArhMzkK2GzVKfYs2EfbQR3a2GFBbRh1uXmTIpjoVPe9qTyGjwMHT7nKkVDwDE0RJEXgGyCoJfihxwhWtbcpU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 23:29:46 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 23:29:46 +0000
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
Thread-Index: AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWAgADi4gCAG2ZUgA==
Date: Fri, 11 Jul 2025 23:29:45 +0000
Message-ID: <20250711232929.5oukafed5lnvsu2v@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
In-Reply-To: <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB7894:EE_
x-ms-office365-filtering-correlation-id: 562a7118-d458-4f66-ec63-08ddc0d2d25a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUUvVEVpdUJKVkxrQ3puS1hsc0FNNnhKZk9Uck9HVE9JL1FrUFY2VnNVS01E?=
 =?utf-8?B?TitxNlBXUGJkOWxtYTJ0d0FtbzNMK2lidGtPYUVCUHQ4dkNISk5iMnZPaWZS?=
 =?utf-8?B?b0hueVZ5eG5jamFtMm0vTHVUeS82MUIxTmxvank4UUMzRGs3b21haWRGVHNt?=
 =?utf-8?B?Z0VpMTl3R3dBV1U1M1ZoYUZ5VCtxdWFqWVlJYW5UUEl2V1FlaFE5MUFiUGtM?=
 =?utf-8?B?ZTJUbHJmZHgvanU4KzlMb3ZTQUVpK01lWENDTEVaVW9mQVJFZkQ1WGFWNXJZ?=
 =?utf-8?B?MUQ2eUJtUVdmd3haS2RWTmhKRjVrT0xmbVA5VW1Na05iU2VLMFFLVUpqVjRG?=
 =?utf-8?B?WVRGLy9lMXBnL1ZxT2tFVUhQL3BOemx3ek5MVGwwNGZocjlsQUoxT2tHaml5?=
 =?utf-8?B?dS8xMjdVUWpZL0p6UHlEUlZEbDJBanVGY0t0d2JDb3ozUG9ITXIwVHoxWTBG?=
 =?utf-8?B?OTNBOVFwS0xNZnZnVERKUDZEaXNXbG5adkVUZTMraWFHREhnTE1CQTA2aTEx?=
 =?utf-8?B?Y1dNUklocnlISExtMDdQbno5M1UzT1VxQzVUVXNzRUozTS93TmNORmpmZ2t5?=
 =?utf-8?B?aVRWNmphQ2UxSjhEd01ZbGJjNDQ2U2dEWnVHTXFOZ2VRRFBpNHR4bytvRXFz?=
 =?utf-8?B?dlY2bzhFR09TWkZhQ0xpRWFreFJKNjlUTlZ1ZHpLK0xrN3lrb1Q0Syt3Yll1?=
 =?utf-8?B?djlrd2JlQjQrQTdjRlRXUUQybEVqNGVVU2hHWllnNTRlODEwKzNOZVNhbHVk?=
 =?utf-8?B?MWFraUk4V013Rk13ZjU4YkxoK1o0YnRCZXJpTHpvVGlWL3NISEw2dzR5ekFl?=
 =?utf-8?B?aFl0b2NJUzVzV3lzaEFBdGxEU2JYdzNOcXRDWmRGd3RFdjQ5TXFyOUdlUlNs?=
 =?utf-8?B?QVd0NnplMWNXU0FvZXBOOTdDK3VPVVJ0UDZOcmw5MlhVc2h3R3NsZFFFRGw0?=
 =?utf-8?B?RHpGSmdpaWt4ODhYNG9acG5CN0t2TzkxbXY0UHJnTE9KeE1LWEdFL1dRdVd0?=
 =?utf-8?B?THZpdGliWjZvMHlNUmY3K2xuRkJJNDJUMlBiRDRxN0tORWZyK3FyVzAvOGZ1?=
 =?utf-8?B?ajRNNXFjZU85WmRvcDBBM0s1M3JpVS90MjJZNnZ4REVCZWVSZHROVnQwT2Iv?=
 =?utf-8?B?MWxRU0NpTkltSEhaTEF3cnd5Y0dNSHRGM0pWWVVoNitIeHF6Y05Pd0RTa3VP?=
 =?utf-8?B?Q0p1R0MwZmJJZmJZeW9KZllhN3oyd1FYK1lzdlRhSThkOG96UTlYbDgzem9R?=
 =?utf-8?B?N25MMlczYkR0ZWhobmtBVW4zcDBjbHZpN3cyMVR3Y0FhZHBmY3JreDBtMzVu?=
 =?utf-8?B?WXg1SW13UXVQT2lSb3Y5UE5IMzE0NkluSnNWYVRJMXZwRXJ2ODdMRnBLWVhv?=
 =?utf-8?B?dFlQRU5BZWRad0dyL3VvWUhBQWMycHc5cjkxN2dlNHBvUEE2RUlUU1c0N0J2?=
 =?utf-8?B?NGVZZE1aVzI3TjRYYWxsVzNGaWlwcVkrdWpIZ3lKTzJBTjFiZTRNQmlzQmVO?=
 =?utf-8?B?RnF2K2JVUU9DSkNyR1FGR01BSHpQZTI1bzREZlVRa1Ara2k0NkJzRW4vU0Mz?=
 =?utf-8?B?NitvOWIyM25sd3VFVXllYUhOaFlVYkdzK2F1dGNRWWs4SnJCdmdWckh3Wnd4?=
 =?utf-8?B?U0lHRUhQdWtGQXZONGVoZTdvNHhDZDV5SkxWTWtYZkxLcFNLRzVRZTMvMEFU?=
 =?utf-8?B?QUdTMXJpS2VkMnd1YzEvQ1V1NGhNRzdzTkM1cEQwVmw1djRvaGlHUjhtN2lk?=
 =?utf-8?B?QnFaamhnRzZHWUZtZzc5c3dTY21PN1NPT1NvV2FOMjJtemMvTUZCWitoM1NM?=
 =?utf-8?B?T1A2YWJ0TE1GUVdHYjFmV2lNNjhzOXlucXJjaFVvZ25RaG5EN0xkNzVoMWVR?=
 =?utf-8?B?NWFMeU1NMytOL1d6dUxQc1ZneVR5VjlOUEpYa0FBRGlnQnNIRjlkUlgzSHhm?=
 =?utf-8?B?cHg0R3c0YkwweEZjVDdFT2JjemFWNkRqdnVmNFExT0ZtNHdCTFROd3FoWDAy?=
 =?utf-8?B?MVlFT0xML3RnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjNnWDhURXZ6UVc2SS9iK1hUOC9QR1ExSEJ3UXViVDYzVW5VN01aK00vSFVH?=
 =?utf-8?B?K3p1K0ZLd2VLSHFsOEpndWRZcWhESXk5Mjgxc290cUE0YmErVWNtUjZ3SXhZ?=
 =?utf-8?B?dEtVbWw5KzBlaWxCbVhpQXl5ZENWMm9zenJ6dWwzbS96U3J4STFzNW1xSGZC?=
 =?utf-8?B?SmlUTEcrWFBFdk11NXBQSlk5MFhXQitXeTNSU2Q5SkNFMzRyY1JTUHdIcnVt?=
 =?utf-8?B?NVVRemNxanNJSlU5RzZtMUQ1V0tRK1ptZm1jb285NXR1NVhrU2Y4ZVMyTHNt?=
 =?utf-8?B?RmFpOEhaOCtOYnB6elJmc3hmUjJVTDVoV2lRbkllMjlTTlNrM3JWME92U1FT?=
 =?utf-8?B?eUkraytmV3ZiZUJuOWZ3Wk5uSHQ0LzFsWFFOVmllMzBpSWZ4SjlOaFRMVzJM?=
 =?utf-8?B?YnBCTW5RYnNBMHBrV3d6Y0RyVXB5am1UZktvSkloTWJ0cEdwbFRQRFhkMndS?=
 =?utf-8?B?SXVFcWFhWUJ4RVlONDN6TktpN2VRZzhLeVh5dTJWa0duYnVpK1JiSlhHdE1S?=
 =?utf-8?B?c1gya244aG5JdFAyd0U1MlNaWVNGd1U5enczaEw2RGc1TkVabDl5K09YZ0FB?=
 =?utf-8?B?NEdKNnM4YXVQQmV5TUQrL2luMGw0SHpKOGM0a0JTbXdkbno0TkhCWnc4L0hK?=
 =?utf-8?B?OUZ6Q2dHQlY0U2FwbUcraVZza3VvQTRtdGk3NFVlY1ozOTRTaXBraXN0dWhE?=
 =?utf-8?B?ZVJTME9mbmpjVllwQXVUWG1HVlJ2bjZ0TlZwa1J6bWI0UkNsK0UxcEFPcFFm?=
 =?utf-8?B?S2x5UGJXZ1poWTNZMWRPTU44UTdnNkEwby9YbjdRV29VZC9ETXZGRDRXY2l4?=
 =?utf-8?B?aWs2TDlMbWR2TDZSUTVkeDRKekk2WjlDcFpBMVUrZi9TZHFzZ1N5RWNnM3p4?=
 =?utf-8?B?bFdXSWZlczF6dktOV0d3TXlPZ01FR1pWMGhLU201cXIxVU5acUNGVXl6UGgz?=
 =?utf-8?B?czE2R0JxZ3VidUJMNnVlWUpOT2dnZlkvYUdGVkpBOXhoYUprUUVYQWV0NHdU?=
 =?utf-8?B?b3pPQ3NiOWFibUJqcjVHSmczYTVOUy9HVGNiVjJxaFZLR00zNW5HY1dHQVpp?=
 =?utf-8?B?ZHhvRUoweHEwYmw0SkhXTE92RmVKSzJCL2VTWVRDK0xVenZtVzc2OVBVcFIr?=
 =?utf-8?B?RXVjdnhzUzAwcmdSS0lHREJlaXljNDFrdDAwdXBCUFh5UGZrMy9peTVBRHJG?=
 =?utf-8?B?d2lsNGVtU0JMajd5TmIvRTBTZXA3K3pTSjRwYU1FTEhCeWNKNjhXUnZyQzdB?=
 =?utf-8?B?Yko0VnYyNmZGM2RZcUNlZU0wR0xiL0NMM3JwVmZjMVlTWHZwc0ZwVng0QlN1?=
 =?utf-8?B?OXh4TjdkRHVCZ2JLY3RiVXhCMWVlUTEwSDhJYmllVHhSbGlZT2hJdEVjTXBr?=
 =?utf-8?B?R2sreGNtelc1MnpyWW9YWkE4RU5rZFFQY2ErWTVLWmxaTFZ2c0JXOEZNY3pn?=
 =?utf-8?B?OFdhVHlydm8zK05UOEhPZzZ2NHRvNFpUcnFVSjN3Z203U1hOL0cxbTJkbVBr?=
 =?utf-8?B?L28vdTYzbVBCeXBYUFlDMUQ5ZDYxUHJlSkF2UkN4ZFVkMDZYT0t2T2RhYnlU?=
 =?utf-8?B?Tk16ODdUTXR2THZ0TEZySTE0eE5yOUgyQnhjOGpxQWxYRnkrUXA5MFFYVUxT?=
 =?utf-8?B?Q1poT29VK1JZOUhUM2ZnYVJndXp0WXpYbnhqYVJXa3hpY2FNVkU1THVXMnhi?=
 =?utf-8?B?YWJ6ZFkxaldnUHRxcU9wbjIxb1hYUHJCeEVUNXZDMVJ0bXRWdTlXaG0rbmg5?=
 =?utf-8?B?ZzFIUUxjQlltNkpZYU50UEQzanhTVVRvbytlckxuU1FEcmZ0Y1M5RldaWUpH?=
 =?utf-8?B?eTRYTU5FaDFHNTFrbitQWXovSHVTTXg5b2dYVTE2UTM5dVFWK2hkc0JTOHhw?=
 =?utf-8?B?b20rdnVkUmtNNFhhVzNDdVdobTRCcWNrSU1NbC9GeEd2eXYvaURGb0hwY2ky?=
 =?utf-8?B?ZENicklOWEVVTlpVYzV2VEltQnZBZ2hHNGFEblE3OUFQeVdqTWZQS252NUlp?=
 =?utf-8?B?VlRmVDFpeE5JK0g2L05rYjcvV3duVFZ6RDhITGtwMkJNMCtlc1JvV2tSRlZS?=
 =?utf-8?B?VWROZnEyc3VDUEtyeUI3MUNMci9TQlNVTmFOLzcxQU1ibzQ1SXpXK1lNWFZR?=
 =?utf-8?B?S05pQjBIWThaeEkxOTZVM2doQjJkZituRVpkV0d6SVpNb1gzSlV4cG9pY0l6?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02C882371FA1D54F8164C12180C49BC1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fk7aMTF7QH3yb+mxybub6eySuKmy3RoTczBS+6715YvRB7DIBPs4ehpnJMa63x3YiRq0ss/BoMYma5LFi5BvKcuv8j1dHNFMC4plfR/JmzdVAhMkiec/aKwMWUloe7pFBfF2PgZCfYMMlr/vusEYaNV1QEr1JzeyTOXGsE5OjIQBGz6/Cl/i6hL7jLXKGjkoDsI6EKG6+AU2p/jBnhOyuRK1ceKCvH/P8kKvdbllm1uKLOSLzTU/MKLq/yBJwS4sd4IDkV63L3r4PvfODrJtziYNKTyLp5/zc0W6/yhokn++sdkgsOW+OZgi9gP8Vb44a/eQ//q/v6psGTlS7Z97Rsv0xQOpCkf0/cOqL4yWorzxeNQ5Uq8YkB+RH2Oa5pZeghN6o6pcIEex20LcdtcFgStWAnAheIC5sykhEt+5OhiJelp9Rf/2WKb5yTxMcijAzHF8Dc9XNjTwhm6qvQKqkr/7Kj0AYtt0/gFzRp4lwtHX1qYl3ZqHwr22TTA7MNTYoxSF4Zb0Xgv65NwXpfd/VBgbJCAjrIRJpSwr4+DpBMBzSsJyw6qfPAlES8DNX8XRbryKR78Miu6ChyzQlY2/6nsuBrE0bIHfxnKFvolLS865Jgmn+gBVKCJRQQapnAovihZQNwoqlRecgpm3B8wVOw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562a7118-d458-4f66-ec63-08ddc0d2d25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 23:29:46.0761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p34wnfNQw76cRKM76FkAbQTogYCluzfaaFqomAxyjOP9C5+yInoGJOvnxF2OtBbzxEpc5V0GyidOtkhfSMc63g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3OSBTYWx0ZWRfX3AA6RIA/bG5q
 rj0m86R3Sf1l1yr2WXJdLxZvsYfT+wr5mu5tGsq0MuCh7/2B05ugCHZt5HD5vfPNpZMCIPzDGvp
 t6zEKaFGyoVPvXdqOGIhC/R0w8aHjWDe4lOUFq1MS9ppjrEyMA/uaASBe3ni3L7iNJ/eqV4X4f6
 rSFdVcA+Aq5t7ZypA8ImrOPwjpxf/QqVExLr0xYaxEsj6A5D4MYhdzuWLtOXYFkBQ+kEmEdowLk
 71YYClkL6Z78O+6Oe7hyyyLkHdwjd1Ph4fosgsiO0mHuuIwqo2gUXJduCFwbp00lKu009eozQql
 m6ay+K8IraWnO+bDwp9ll19sjMNhCJPzGrosbp4In2PT2bGMaFr5b7Krqwe5yj1c8FNNPcRNRXQ
 oS+F4BaapKMR5WIibBq23J6fOQcPv++PXLcr4d8rS3xbovEuFX5vwO5gloQv6NYPEOCsLwZz
X-Authority-Analysis: v=2.4 cv=cOzgskeN c=1 sm=1 tr=0 ts=68719e76 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=6gIddUWclG8gg_QhYMgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FKa0WaSHmd0woqFZVtoLuXyu_0brXXHT
X-Proofpoint-GUID: FKa0WaSHmd0woqFZVtoLuXyu_0brXXHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=873 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2507110179

T24gVHVlLCBKdW4gMjQsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNi8yNC8yMDI1IDU6MDIgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBUdWUsIEp1
biAxMCwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+IE9uIFF1YWxjb21tIERX
QzMgZHVhbC1yb2xlIGNvbnRyb2xsZXJzLCB0aGUgY29ubmRvbmUvZGlzY29ubmVjdCBldmVudHMg
aW4NCj4gPiA+IGRldmljZSBtb2RlIGFyZSBnZW5lcmF0ZWQgYnkgY29udHJvbGxlciB3aGVuIHNv
ZnR3YXJlIHdyaXRlcyB0byBRU0NSQVRDSA0KPiA+ID4gcmVnaXN0ZXJzIGluIFF1YWxjb21tIEds
dWUgbGF5ZXIgcmF0aGVyIHRoYW4gdGhlIHZidXMgbGluZSBiZWluZyByb3V0ZWQgdG8NCj4gPiA+
IGR3YzMgY29yZSBJUCBmb3IgaXQgdG8gcmVjb2duaXplIGFuZCBnZW5lcmF0ZSB0aGVzZSBldmVu
dHMuDQo+ID4gPiANCj4gPiA+IFVUTUlfT1RHX1ZCVVNfVkFMSUQgIGJpdCBvZiBRU0NSQVRDSF9I
U19QSFlfQ1RSTCByZWdpc3RlciBuZWVkcyB0byBiZSBzZXQNCj4gPiA+IHRvIGdlbmVyYXRlIGEg
Y29ubmVjdGlvbiBkb25lIGV2ZW50IGFuZCB0byBiZSBjbGVhcmVkIGZvciB0aGUgY29udHJvbGxl
ciB0bw0KPiA+ID4gZ2VuZXJhdGUgYSBkaXNjb25uZWN0IGV2ZW50IGR1cmluZyBjYWJsZSByZW1v
dmFsLiBXaGVuIHRoZSBkaXNjb25uZWN0IGlzDQo+ID4gPiBub3QgZ2VuZXJhdGVkIHVwb24gY2Fi
bGUgcmVtb3ZhbCwgdGhlICJjb25uZWN0ZWQiIGZsYWcgb2YgZHdjMyBpcyBsZWZ0DQo+ID4gPiBt
YXJrZWQgYXMgInRydWUiIGFuZCBpdCBibG9ja3Mgc3VzcGVuZCByb3V0aW5lcyBhbmQgZm9yIHRo
YXQgdG8gaGFwcGVuIHVwb24NCj4gPiA+IGNhYmxlIHJlbW92YWwsIHRoZSBjYWJsZSBkaXNjb25u
ZWN0IG5vdGlmaWNhdGlvbiBjb21pbmcgaW4gdmlhIHNldF9yb2xlDQo+ID4gPiBjYWxsIG5lZWQg
dG8gYmUgcHJvdmlkZWQgdG8gdGhlIFF1YWxjb21tIGdsdWUgbGF5ZXIgYXMgd2VsbC4NCj4gPiA+
IA0KPiA+ID4gQ3VycmVudGx5LCB0aGUgd2F5IERXQzMgY29yZSBhbmQgUXVhbGNvbW0gbGVnYWN5
IGdsdWUgZHJpdmVyIGFyZSBkZXNpZ25lZCwNCj4gPiA+IHRoZXJlIGlzIG5vIG1lY2hhbmlzbSB0
aHJvdWdoIHdoaWNoIHRoZSBEV0MzIGNvcmUgY2FuIG5vdGlmeSB0aGUgUXVhbGNvbW0NCj4gPiA+
IGdsdWUgbGF5ZXIgb2YgYW55IHJvbGUgY2hhbmdlcyB3aGljaCBpdCByZWNlaXZlcyB2aWEgcm9s
ZSBzd2l0Y2guIFRvDQo+ID4gPiByZWdpc3RlciB0aGVzZSBnbHVlIGNhbGxiYWNrcyBhdCBwcm9i
ZSB0aW1lLCBmb3IgZW5hYmxpbmcgY29yZSB0byBub3RpZnkNCj4gPiA+IGdsdWUgbGF5ZXIsIHRo
ZSBsZWdhY3kgUXVhbGNvbW0gZHJpdmVyIGhhcyBubyB3YXkgdG8gZmluZCBvdXQgd2hlbiB0aGUN
Cj4gPiA+IGNoaWxkIGRyaXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBzaW5jZSBpdCBkb2VzIG5v
dCBjaGVjayBmb3IgdGhlIHNhbWUNCj4gPiA+IGR1cmluZyBvZl9wbGF0Zm9ybV9wb3B1bGF0ZS4N
Cj4gPiA+IA0KPiA+ID4gSGVuY2UgaW1wbGVtZW50IHRoZSBmb2xsb3dpbmcgZ2x1ZSBjYWxsYmFj
a3MgZm9yIGZsYXR0ZW5lZCBRdWFsY29tbSBnbHVlDQo+ID4gPiBkcml2ZXI6DQo+ID4gPiANCj4g
PiA+IDEuIHNldF9yb2xlOiBUbyBwYXNzIHJvbGUgc3dpdGNoaW5nIGluZm9ybWF0aW9uIGZyb20g
ZHJkIGxheWVyIHRvIGdsdWUuDQo+ID4gPiBUaGlzIGluZm9ybWF0aW9uIGlzIG5lZWRlZCB0byBp
ZGVudGlmeSBOT05FL0RFVklDRSBtb2RlIHN3aXRjaCBhbmQgbW9kaWZ5DQo+ID4gPiBRU0NSQVRD
SCB0byBnZW5lcmF0ZSBjb25uZWN0LWRvbmUgZXZlbnQgb24gZGV2aWNlIG1vZGUgZW50cnkgYW5k
IGRpc2Nvbm5lY3QNCj4gPiA+IGV2ZW50IG9uIGNhYmxlIHJlbW92YWwgaW4gZGV2aWNlIG1vZGUu
DQo+ID4gPiANCj4gPiA+IDIuIHJ1bl9zdG9wOiBXaGVuIGJvb3RpbmcgdXAgaW4gZGV2aWNlIG1v
ZGUsIGlmIGF1dG91c3BlbmQgaXMgZW5hYmxlZCBhbmQNCj4gPiA+IHVzZXJzcGFjZSBkb2Vzbid0
IHdyaXRlIFVEQyBvbiBib290LCBjb250cm9sbGVyIGVudGVycyBhdXRvc3VzcGVuZC4gQWZ0ZXIN
Cj4gPiA+IHRoaXMsIGlmIHRoZSB1c2Vyc3BhY2Ugd3JpdGVzIHRvIFVEQyBpbiB0aGUgZnV0dXJl
LCBydW5fc3RvcCBub3RpZmllciBpcw0KPiA+ID4gcmVxdWlyZWQgdG8gZW5hYmxlIFVUTUlfT1RH
X1ZCVVNfVkFMSUQgb2YgUVNDUkFUQ0ggc28gdGhhdCBjb25uZWN0IGRvbmUNCj4gPiA+IGV2ZW50
IGlzIGdlbmVyYXRlZCBhZnRlciBydW5fc3RvcCgxKSBpcyBkb25lIHRvIGZpbmlzaCBlbnVtZXJh
dGlvbi4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jp
c2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZl
cnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiA+ID4gaW5kZXggY2E3
ZTFjMDI3NzNhLi5kNDBiNTJlMmJhMDEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcWNvbS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
DQo+ID4gPiBAQCAtODksNiArODksMTIgQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ID4gPiAgIAli
b29sCQkJcG1fc3VzcGVuZGVkOw0KPiA+ID4gICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhf
ZGRyOw0KPiA+ID4gICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhfYXBwczsNCj4gPiA+ICsN
Cj4gPiA+ICsJLyoNCj4gPiA+ICsJICogQ3VycmVudCByb2xlIGNoYW5nZXMgdmlhIHVzYl9yb2xl
X3N3aXRjaF9zZXRfcm9sZSBjYWxsYmFjayBwcm90ZWN0ZWQNCj4gPiA+ICsJICogaW50ZXJuYWxs
eSBieSBtdXRleCBsb2NrLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJZW51bSB1c2Jfcm9sZQkJY3Vy
cmVudF9yb2xlOw0KPiA+IA0KPiA+IENhbiB3ZSBqdXN0IHRyYWNrIHRoZSBjdXJyZW50IHJvbGUg
dGhyb3VnaCBkd2MzIGNvcmUgaW5zdGVhZCBvZiBhbg0KPiA+IGFkZGl0aW9uIGZpZWxkIGluIHRo
ZSBnbHVlPw0KPiA+IA0KPiANCj4gQ29yZSBjYWNoZXMgb25seSBtb2RlLiBXZSBuZWVkIFJPTEUg
Tk9ORSB0byBpZGVudGlmeSBjYWJsZSBjb25uZWN0LiBTbw0KPiBhZGRpbmcgdGhhdCBpbiBnbHVl
IHRvIGtlZXAgdHJhY2suDQo+IA0KDQpUaGUgY29udHJvbGxlciBpcyBhbHdheXMgZWl0aGVyIGhv
c3Qgb3IgZGV2aWNlLCBub3Qgc29tZXdoZXJlIGluDQpiZXR3ZWVuLiBZb3UncmUgdXNpbmcgUk9M
RV9OT05FIHRvIGluZGljYXRlIGNvbm5lY3Rpb24sIHdoaWNoIGlzIGENCnNlcGFyYXRlIHN0YXRl
Lg0KDQpJIGZlZWwgdGhpcyBzaG91bGQgYmUgdHJhY2tlZCBzZXBhcmF0ZWx5IGZvciBjbGFyaXR5
LiBUaGUgZHdjMyBhbHNvDQp0cmFja3MgdGhlIGNvbm5lY3Rpb24gc3RhdGUsIGNhbiB3ZSB1c2Ug
dGhhdD8NCg0KQlIsDQpUaGluaA==

