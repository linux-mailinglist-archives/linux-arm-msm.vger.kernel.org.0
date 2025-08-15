Return-Path: <linux-arm-msm+bounces-69300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1327EB2744C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 02:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8CF16BB62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB34172627;
	Fri, 15 Aug 2025 00:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ypdckyt7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dCPzI4ZH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hRihelJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A1EEAB;
	Fri, 15 Aug 2025 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755219106; cv=fail; b=nN6CxDmFPwT4Ssovc9dYTlT772MNi+4mjcGJOrn4YDzIlmjp7Y93lWOufWqPBanD5DYQYY06ppB7Dg/75ugjVkq3WaSTl2u8DkoEYP/vLdmGQ0rwuqFQSe0SZ8Kw4gUqo7pSgeOr8kwl94vYiJ5fAhuB63I5rmA/NrkKs9D8qqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755219106; c=relaxed/simple;
	bh=KvJfa86C37IOo6btZYTWSdeZXGllhkEF61suWbzWE3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lkWAkyPqOAd4whO+pu02z3d2B8sI7waw4kHxl/nVfv9X+RmBz9YOPQK0IXPyb+o7LxP1KShSxuVOoKEk+4YqghG82BwiWICFORao7JJSI59cQl3mJgskU+Bhknj8aMTfvatpLemk6VNLtyDbAWwl7NnLlJW6C4c/ZQBq7Zrbym4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ypdckyt7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dCPzI4ZH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hRihelJV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIpCZX032066;
	Thu, 14 Aug 2025 17:51:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=KvJfa86C37IOo6btZYTWSdeZXGllhkEF61suWbzWE3U=; b=
	Ypdckyt7ldz+htsDVQAi9C0fsWzXbarHln0tvX5vMRevTaI96npDf7RPVED7jGOc
	dvrA98on88VQ1GOdjwS4aKutVYVJVUe8JpUjMED5AlNyJyvdYIttEqDOSvoVNVP+
	jKcb8WHq1kz64e5cJORhZaExGlnSHTrjfpnTXPylXA9gkPngdulD4vNSb6w6eQyX
	zsRILfSTscUr2Dhs+4a42AuqCxFU+X+uwZYeYjJbNmtmfjGnr48PFSh1Gf1I2Vne
	s29RrZZ/0Q26gq1UG2IqlRpgIRL0eJGcJI7Tp4accAGqVAkSPSr4m1KmlXvs4ncK
	GURUryncb3f35JBixT4/1Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48hnechd7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 17:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1755219087; bh=KvJfa86C37IOo6btZYTWSdeZXGllhkEF61suWbzWE3U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dCPzI4ZHwpwTvjkTCMyDuEMCeMqYgbLNt9PLDyvOYqnun96wq36qRrl01QYtnkqvd
	 wTYMKptvzPUJZbzYddxHQxzS+o8gqFILbefu99S0UY6K9BAjMVQnQkQdtbTSDQC0o/
	 RRgxWkdIEAqT5I90tE2jpTR/SK/GAP7/tVTfNowdJJyOjJKL6/vjoZNxGf6Tkcs/TY
	 eCpkXtkijijBGAfNF3esQW+CQ3nncZ5d9EKYyfyTd3snqwQ+ae4h4AkY+VUg/KPbhE
	 MkRfgeWAGokHJvo27Dwqd0aJWJFNIJaM0B2JaG+jegPPbZmLlJdRx83x55BVyu2zg0
	 ccrZYBiZfkywA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15A9A403A2;
	Fri, 15 Aug 2025 00:51:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C394EA00AC;
	Fri, 15 Aug 2025 00:51:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hRihelJV;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4B8F240833;
	Fri, 15 Aug 2025 00:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAre8weFP85NeCzKW4XOhRlBlJgkLIIJQTR8r1xXlFqFj5IMzGa6SM7OiIJAifPSjbDHP1wx8KGnwfDGFaFn+CJHuQod8Y//D6fbYmQUDybuZPGLnYsfBi4Ih3d6dAH9C42mi4sPfY/I2PxNUrAdK64Axzg9cAW1rSXFHrgcIOfsuKpx71vuM0mnyDuFJL3Y0LSirMjps0k+MegP82iKyEwrHXbnetFfIUU4C0j8i1KIOml26diby/Hc8siyDxjZ8PqWS66fU9E27BExHpOMMee/0hzHOaTkBPfzU7m0LCFqjldT0S1W12fU5jMvkFxmLoNbXZBOyyfcfx+9LnMvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvJfa86C37IOo6btZYTWSdeZXGllhkEF61suWbzWE3U=;
 b=HfD7fclMlE3444WF7jNl2BjrovrXL8FrxvtjOVs7vTqwbskPLcFLCoePjDkfUnJ5iDgnoxVyXCpgDGVUI6PIgITK/xV3JbXF6PwPlJ7Yf0KpTnkjpnQAiI3Yiz3OdAgAnU0sypa0bFDqcTlMIGt6aMMkKPai6iaZUXIzCib3E0kgdHt/VwcOesLyG7X41hEa1HapfQQFlO3ogiXiLwZ7hIkdYEEOXXndLrVuNv42azaGvaNAlUmyVQ/wZCskBDe7M4k0gyvUxUQwrluRqwF/KKe+ekiC7YvSRFo07jVuknd2ne4vQGeh0/u7NoFMNZt7NyKGSW3vSw87waX37rKmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvJfa86C37IOo6btZYTWSdeZXGllhkEF61suWbzWE3U=;
 b=hRihelJVyYydCS5KlKXnx+H5diWbaCh5CV5kDZ3neBO/mkjd0Vr7Bo1qvpjRFcFHIbwbqkLq9921JLsobUeId95UevjoKmd+ieseDlPA4FsjiO15qsd6LJO+awfEPQjYzZQOQa3WrkzsrLl0emEozGz25Dr8KamzAq/2J04oPV8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 00:51:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9031.012; Fri, 15 Aug 2025
 00:51:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index: AQHcC03KeWU33o7dKE22z1EMVODUyrRhSpQAgAAWbQCAAYXSgA==
Date: Fri, 15 Aug 2025 00:51:23 +0000
Message-ID: <20250815005121.kaun5rsjgw3qlk7c@synopsys.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
 <20250814001552.gtbrgqthtjpilq23@synopsys.com>
 <4d160c86-cfbf-4f08-b3e9-f1f8235d20a6@oss.qualcomm.com>
In-Reply-To: <4d160c86-cfbf-4f08-b3e9-f1f8235d20a6@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4035:EE_
x-ms-office365-filtering-correlation-id: d0e64f4a-dfbc-4fda-a4b5-08dddb95dba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OWwwd0ZKL0xpZEU0c1JjL1RMRmNzM3lRQndTZis0RXRIa3RwaGRNOHNZaTRV?=
 =?utf-8?B?QjUzQXpxaktwWnIzamtVS2VjWklHU3YwM3VSb2JxL1lRM2ZRRlFIaFVVbDE4?=
 =?utf-8?B?Z0tRZWM1QnVVdkJHNDN1QTJ5d2laclNIKzVHOUtTZEtkYmcyZ3VkN3VFT3p1?=
 =?utf-8?B?MmlaT2RaZUZRMy8wOVpGUXN0aW55dGRURk4raWdjZHhsOStRc1NHbDdtcXVl?=
 =?utf-8?B?aDFBNmhZYU1NTURkVWZCZkhqRjFiRnlBN200N3FqOW41MzRibVVmYlNydkZD?=
 =?utf-8?B?amY4WnViSU5pWUZnSlJ2OHhzQzRjMGlibFNIWFB4Q1VQOVFCNFJPczVzMVJT?=
 =?utf-8?B?dStTTFZyODFnMTRvOUtuU284YWtlV3NNeGIwR3E0dVRnU0d4ZzJqWHpLUnI5?=
 =?utf-8?B?akcyVEE3cFVZY1FUVWREOG10TmtPQWJrZGk1WnlpSnFHaTRpMjAxQk1mUzl2?=
 =?utf-8?B?RlB3eGRlczFwT2JrKzhlbGh1QXYyYnA4NWxZenBpR2Z2alYzV3hRWXpHbnlV?=
 =?utf-8?B?aUlacVFlMy9Rc3V2b3UvZW5RNlRUSkp2QXF1OUhMK3d5ZE5EWWpmbEJaaW04?=
 =?utf-8?B?SnV5a3l3ZTRVclNBU3h4aWw3VWNlWktwRml1cnNGY3pDMU5tNVdOWmpYVjU5?=
 =?utf-8?B?cGdhamxtMEY0V3lDc0Y4eG5jeTVRWG9yY0VrZDllRTAzd1pkR2pMdkhSUkpu?=
 =?utf-8?B?UkRQMzRhNTdXcHBGcGtsdE5wdUZPc1E1L2NNZVVnNzl3UTE2RXUzYkFocUc1?=
 =?utf-8?B?Y1lVKzlJSUZ5M3g2Smc2Ym80Wm1RbnVMZkR0dEkwU3ZWT2xCcEF2b29IYURI?=
 =?utf-8?B?MUlsV09zVVUzZWQ0ZDBUYnVIZFBwWXVaWmJOcU91dTBVL1NXK0k0MENQM3dR?=
 =?utf-8?B?WnE3UU1CTjRTalVOWHpYalM2TER0dExnd0xmZWJZTUxsejBDV1JFa3VXQWg5?=
 =?utf-8?B?bkNBTTBNMmEyTmg4RHAvZEJzRk56U3h4UVB5ZGY5R0hxTmtSMzJvNHpXdVRM?=
 =?utf-8?B?UW1EeU9jUk1uWTkrWjNaenZUc2ZxRmUydzU3K1JLN2Z2SEMyN0s2TkRWMmpa?=
 =?utf-8?B?YVIvZHluSFVZaXNkVFlnK1ZNUFlFMEs0anhVanNHM2ZSblcvcDlDZ3dJNFFB?=
 =?utf-8?B?Y0NXQzRBeFlaNmhsekNGdUtxUkw0Y3lxUjJhS0pqWmYveUhOVlNCeVMxNDk3?=
 =?utf-8?B?eCtURUN4WDhQRGsyc2NSdGg5NDcvZUoyMmE5RS9FS1MrclROL2IwK29hdnRB?=
 =?utf-8?B?dklLR3ZQdGxMN0QxakFxZDc5UXFWVG5Eblo1allmYm9lYlZUZVh5N1psVGlQ?=
 =?utf-8?B?d3g0eW9qWXVscEZETFJBZWNaQTZOcWpIY0FIWXdTRWljOGNwTVJ6bDhpWm5q?=
 =?utf-8?B?cVBGTStVSU1zZ1FKQjRoOFhWdFZFdGkzek5zZkRYcUdzNi9xV29vdk15TUJE?=
 =?utf-8?B?eGtSR3h4UGI2eXRUVHFtV0UxUUYzVDN3T3MrY1dudTE5V1drNlByNUZ2TkVu?=
 =?utf-8?B?aTdoWGpNeVNnZTdFeVNvQjE2TnVaZU81dmxwd0MvN3dPTFlraFR2MXJCWUFP?=
 =?utf-8?B?c0VKZ0RuOVZnd3hTcjNqQzNxSjVJalltQW5jc2pqc3g0d1pxaGRib0hFL0hJ?=
 =?utf-8?B?T0dBSGkrL0JZWDZ2ZXBhK2tVK1cyZFNraWNTWUVFQks3S2pDVlpiYzBhVzMv?=
 =?utf-8?B?U1h5LzFwclRSRVBuY052ODN3ektobThJWFY1TVlTbkJ4UWdyNS9KL1NNQ3B3?=
 =?utf-8?B?N1dQVFZ4K3hPVGlYTGx2M3JLUG9ZcEhUSWpaOUgybXVlYjUrVlFBdzA3TlFC?=
 =?utf-8?B?dDUrZlpMUm1mZ0JVNmJ0c0lic1M5Rm9DaC9sUk1iOHNQN1IyMDd1empRZU5U?=
 =?utf-8?B?aC9PVEhMb1J3QzIvVmVyalN6L2x4eStiU3k3VUIvWEUvWW5VMEJqT1NnRkdw?=
 =?utf-8?B?OXZzWkpvZThxOWs0ZWFxTkRpZ3NFK1F2eFVXeDFrenVJbDZUYkJxekJ1aVNk?=
 =?utf-8?Q?SqA8ZWgEuRe0v+uPhr7GomuRnnjjsc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3g1MktqRUJMS0JSQnZtS0RKZG8ycFpOclZ4aHY0WUpaSU8xQ1JKMlBnK1ln?=
 =?utf-8?B?SGlKWWRYZGFFQzNqTk5sc2N4Zlg4ZW83WTZHbmt4NUlZR1dyRGk1bDFTNUxu?=
 =?utf-8?B?TFpPaGUvaWplQUZ0V3hLTE9UZkJTSVdoMDcyOHA3OGxVV2ZoNnViSlZFNStm?=
 =?utf-8?B?Y1JoSkk2Qzh5TUpBVTJWTVZCUktWcDVBSmJiWS9WZU9LTVZuY2lVWGhLUlVZ?=
 =?utf-8?B?aFYrNURTWklUalZwNm5HMldZbHNYODJwOHoyMVp5S1A2NDNCWDZlRmd0RUNH?=
 =?utf-8?B?dVFLNFIyVklrKy9ycG50bDZwdm5pM0lhSm5uQmt1d0lNU29WYTF0VGNKeXFZ?=
 =?utf-8?B?ZjRhanJpNWU3ejBGak90N0RoT3VqWnh6UGxNY2xMbE4zSjJaOFBMdmVNK1ZK?=
 =?utf-8?B?UXg1aHd3YU5rT2FFUFk3RUFGUkN0RFFTSDZoNTZKZEFGR3JKOHpTUjQrL3Bz?=
 =?utf-8?B?SWxKRHVEOVhSb1hKUVduS2RZeERHeTkzZEJmNTlHODM4Sm00RVJmZWNIbnNG?=
 =?utf-8?B?RE5EMUdvcndPZXNuWEEyVkxkajUzQ3pGTkhNT2ZYajVtWitrckNEWGNTN3RN?=
 =?utf-8?B?bldNWnd2U1pRVVoyVk9wQlV2VUhlZEt1a3JwWGhlNEUrMWQ1bEx1ZEVEZTYy?=
 =?utf-8?B?UkJqcjJuZXB2VjAycWJUV1dMbkhjN1RYaDNwVnFlM3c3NUxFd1hDMjZPZlBv?=
 =?utf-8?B?cVQzVUxuejNpdWZSTStKTTFEVVcxWFRlRWtwV1ZjdHAzWHdtelF6SWlXT3Bk?=
 =?utf-8?B?c1RUc1gyNGxLVWN3L1NLNjVWOFRQWm1aOE1OZEJhLzZiYmM5alNjL25odjJi?=
 =?utf-8?B?b0s4enNMNlp3N2pQaG44a1kzNmZ1OVg2NWgyUUlXc1dSK2ZzRFdRNC8yRzUv?=
 =?utf-8?B?V0JZblIrbjNQZ2UwWG5qb2pjcXVTMHk5enFyQzRRL1p2c0p0UXI2MnN1VUs2?=
 =?utf-8?B?U3pnckdlUmplZTk4a3lFQ3F6RzJndTRZWmZOTW9VZTFiVmQrSzhnUUpUQ3lm?=
 =?utf-8?B?ZHZkUGhQb05xdHIyWUxTNXJURDk5U3RGbDU2cWZxL1czcGgvblhtV0xheVBL?=
 =?utf-8?B?RzRMb1NyaDM2N3dPY3hzbVlaWU1SaEVBOWdqVVp4dWlGNjBsUmk3MHRnb0p6?=
 =?utf-8?B?MURrQmV4WCtMQkdJbytHUGpETUtESDBYdkNzclh2T2xwZ0R2anhpNjZDaEJ0?=
 =?utf-8?B?N2o0VVJrd3Q1clU2Mk8zRmZLMk9lU25WMDIrdm5mNGF5dWt0a0pEcElscjk3?=
 =?utf-8?B?c0Jja0tWY3N4TGsxQnI2aDFNUEp4aFFVcy9aNlFDekFVeFhBUVM0aFpmbWd5?=
 =?utf-8?B?UmNWMGJ4aUVKYzNHWU8rOW1wUHVyVDYyUlNxc2dyVmpGNDRQVmN3a2dpc1hv?=
 =?utf-8?B?TFphYlBOYk96VkUvMmVZVURLUG9GVkg1SDJqSmlRK3QvalEvamd6RWNJcjJF?=
 =?utf-8?B?WnVndmFYbTFUL01LOU1rN25XTzBSYVpVV2pHYUNZT0dRL1FPMFc4TmN5elZW?=
 =?utf-8?B?ckU3NUNHY1JkUittUFFmdlpwVk1iZG9jb3NSRDRHU3ltSFNldTdKK0NFRTJa?=
 =?utf-8?B?ZC9NQURFcWc1b3BZQVk1ZzV5SHFGeFBOVDFNVmtZZ2tXOGJOU2RWUm9sZ1RK?=
 =?utf-8?B?aWNZUlUzVzlGcnJpbW15U2FUTWlQREZXMzgvcEZBWEZsaUhNbit4NEZWNWtW?=
 =?utf-8?B?K2VBT3N5REhRWkN3eHJvM1F4ZWVPcjBqY045WmJwdkV4VS84Y0FnazVHWUps?=
 =?utf-8?B?L3Npay9QYlp1WlFSOGsvOURvUUpUOGY3V3RKUHlrNzJzVnAwemVPOWlLdm9a?=
 =?utf-8?B?TStYekEwTEFMVlo1Rno1YjQ4M2hxWnZ0MWtGcFNCNmlnMnJNZWROWGI0ZjJV?=
 =?utf-8?B?ZHNRbStGcTNLN3R6TmFWV3hzcFlwV3VOU2NpbVptaXQ1bVkxbFk2KzRXVXdO?=
 =?utf-8?B?MGhULzZyZkFLWUVLcm1MZGw0RlFiN3ZNTU1Zd3IrdUh3eDVuMytTVmpzdmJY?=
 =?utf-8?B?UU14MFlUdnd4K3lOTmdoNVl6VGpiS2hud0NlTVJnZmJIcTQ5dlRSQkczUVJ6?=
 =?utf-8?B?NkkvUnJ5dVhVMFhYSjBMdk11SUc0d2NVUHRiQlNPZUQvU0JqNXBxTG9BclQ0?=
 =?utf-8?B?YjZyWFdsUGplZ3ZSNmVRSHl0VE1GOUVVMEtxTUN2dzllWGlvLzE0eC95Qmpv?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAFBD55E7403441A9501DEE08E878B3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rD2KH17+E/jhBlRiyc1W2lGsz/ePr4dcHi+h7aJyBPC9zQr3URBULACwbkK1iKeaJdQRZZFu4w3I20bcaTsik02b9C2leOI9Dn3y9kXnRs+PVG5yFlUIJhvwWOM++hCcws7TpnGTuEnLYlhEDjSEU4mQJWAGdoa0feEG4+zicRYgINble743Pt9GE+rY9Y5hMazEVJPjHjSiX+s7sUnXQa3DakB996wzmBny3ZpaS4vtwVrU0dbOjsbyMtOUSe1V/vlP//EdiAyL9Pqw5MhwYTfHVAwO3iMjaj4E4hERMjFYH10KaXtECoFFhvL6RYb1YI7HbgoGfAYf+KjoONdhsKFzzMhkFe03wAU7UBYZ1nf2qdiQE1l6y8LP2AAaDSLHjqURI+dVyhVti1bBZL/q+K4Ddzvn/ZiizsOY7C3hpd1tl3JBXoQo7Y5baE/zXvf2tG0e5fEHFAGxEf77KaaLom16PYrDSx4XGaQUEjS7vpvI2LYz6NdQMK7z/CrKMU67cOPvpAiTZLPdFuHqTr6t9Cu7Tv1ht2I8uAr0a0bqzgrPn1Tn7Utj8myX8JHARlAYwfygrNNoZHPSD9RTQ3iyyfrZWSknujZjEf2bGeLE/1UhztwYGVolzzvbHMBJ7mUwCiluodd37UV5fIA/yjulfQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e64f4a-dfbc-4fda-a4b5-08dddb95dba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 00:51:23.7640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88Ub8SrYg737JZt0qY7LEcR0opPlEc4HGGA9/AJF9b0g5HQrXF8n/sxNtXRwbnK3Cp3KLQcgspaw6xOgDkw7zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
X-Authority-Analysis: v=2.4 cv=I5NlRMgg c=1 sm=1 tr=0 ts=689e848f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=iLr9NSLReeLSvHKRvlQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: OkrtmyBXLo8fy42VN2ElSYvR-mwCqsns
X-Proofpoint-GUID: OkrtmyBXLo8fy42VN2ElSYvR-mwCqsns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE2MSBTYWx0ZWRfX3NsatGxPsfND
 qAU2sVqJAVGs5B0ul2P5hDFBjtswfZ6/Y6MSdGe++9qcQr/w7imZe8B/Z9xPOUTH826i805seUi
 yWt6cuY0WR5nV1rUdKMiJtrgpZD1NVehrB5rjcVRb6U/z5agCSZbrVcvbsVEAaVJqtcHaE4VlFQ
 /NnuKdiWiagsOzR0YViV/PYVZClz1+VecbsjoQCzjygHUhrPlzJNDUV7SKQQ6sZNDTEXD3zarM0
 QJBL79utoIVudQur/RkCY0NZZg3KarpukQ4DVa56iayEBOqoxapxYvKzRvWqhDlBgO/MPuoXQ10
 ZJ5JNhd/vh1RMzN/3TJUuh1ehrxtezfBrccDOv93NjLHpuFz6juUpe0M1JoXDiMUPiEuQnMrdtU
 uV9cWTjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508140161

T24gVGh1LCBBdWcgMTQsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gOC8xNC8yMDI1IDU6NDYgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBUdWUsIEF1
ZyAxMiwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+IE9uIFF1YWxjb21tIERX
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
cnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA3OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiA+IGluZGV4IGE3
ZWFlZmFlZWM0ZC4uZDg5ZmJiMWQ4OTk0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLXFjb20uYw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20u
Yw0KPiA+ID4gQEAgLTgzLDYgKzgzLDggQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ID4gPiAgIAli
b29sCQkJcG1fc3VzcGVuZGVkOw0KPiA+ID4gICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhf
ZGRyOw0KPiA+ID4gICAJc3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhfYXBwczsNCj4gPiA+ICsN
Cj4gPiA+ICsJZW51bSB1c2Jfcm9sZQkJY3VycmVudF9yb2xlOw0KPiA+ID4gICB9Ow0KPiA+ID4g
ICAjZGVmaW5lIHRvX2R3YzNfcWNvbShkKSBjb250YWluZXJfb2YoKGQpLCBzdHJ1Y3QgZHdjM19x
Y29tLCBkd2MpDQo+ID4gPiBAQCAtMTExLDEwICsxMTMsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
ZHdjM19xY29tX2NscmJpdHModm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0LCB1MzIgdmFs
KQ0KPiA+ID4gICAJcmVhZGwoYmFzZSArIG9mZnNldCk7DQo+ID4gPiAgIH0NCj4gPiA+IC0vKg0K
PiA+ID4gLSAqIFRPRE86IE1ha2UgdGhlIGluLWNvcmUgcm9sZSBzd2l0Y2hpbmcgY29kZSBpbnZv
a2UgZHdjM19xY29tX3ZidXNfb3ZlcnJpZGVfZW5hYmxlKCksDQo+ID4gPiAtICogdmFsaWRhdGUg
dGhhdCB0aGUgaW4tY29yZSBleHRjb24gc3VwcG9ydCBpcyBmdW5jdGlvbmFsDQo+ID4gPiAtICov
DQo+ID4gPiAgIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShzdHJ1
Y3QgZHdjM19xY29tICpxY29tLCBib29sIGVuYWJsZSkNCj4gPiA+ICAgew0KPiA+ID4gICAJaWYg
KGVuYWJsZSkgew0KPiA+ID4gQEAgLTU2MCw2ICs1NTgsNTUgQEAgc3RhdGljIGludCBkd2MzX3Fj
b21fc2V0dXBfaXJxKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnANCj4gPiA+ICAgCXJldHVybiAwOw0KPiA+ID4gICB9DQo+ID4gPiArc3RhdGljIHZvaWQg
ZHdjM19xY29tX3NldF9yb2xlX25vdGlmaWVyKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3Jv
bGUgbmV4dF9yb2xlKQ0KPiA+IA0KPiA+IE1pbm9yIG5pdDogVGhlcmUncyBubyBub3RpZmllciBo
ZXJlLCBjYW4gd2UgcmVuYW1lIHRvDQo+ID4gZHdjM19xY29tX3ByZV9zZXRfcm9sZSgpIGZvciBj
bGFyaXR5Pw0KPiA+IA0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9
IHRvX2R3YzNfcWNvbShkd2MpOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAocWNvbS0+Y3VycmVudF9y
b2xlID09IG5leHRfcm9sZSkNCj4gPiA+ICsJCXJldHVybjsNCj4gPiA+ICsNCj4gPiA+ICsJaWYg
KHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQocWNvbS0+ZGV2KSkgew0KPiA+ID4gKwkJZGV2X2Ri
ZyhxY29tLT5kZXYsICJGYWlsZWQgdG8gcmVzdW1lIGRldmljZVxuIik7DQo+ID4gDQo+ID4gTWlu
b3Igbml0OiBzaG91bGQgdGhpcyBiZSBkZXZfZXJyPw0KPiA+IA0KPiA+ID4gKwkJcmV0dXJuOw0K
PiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiArCWlmIChxY29tLT5jdXJyZW50X3JvbGUgPT0gVVNC
X1JPTEVfREVWSUNFKQ0KPiA+ID4gKwkJZHdjM19xY29tX3ZidXNfb3ZlcnJpZGVfZW5hYmxlKHFj
b20sIGZhbHNlKTsNCj4gPiA+ICsJZWxzZSBpZiAocWNvbS0+Y3VycmVudF9yb2xlICE9IFVTQl9S
T0xFX0RFVklDRSkNCj4gPiA+ICsJCWR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShxY29t
LCB0cnVlKTsNCj4gPiA+ICsNCj4gPiA+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShxY29t
LT5kZXYpOw0KPiA+ID4gKwlwbV9ydW50aW1lX3B1dF9zeW5jKHFjb20tPmRldik7DQo+ID4gPiAr
DQo+ID4gPiArCS8qDQo+ID4gPiArCSAqIEN1cnJlbnQgcm9sZSBjaGFuZ2VzIHZpYSB1c2Jfcm9s
ZV9zd2l0Y2hfc2V0X3JvbGUgY2FsbGJhY2sgcHJvdGVjdGVkDQo+ID4gPiArCSAqIGludGVybmFs
bHkgYnkgbXV0ZXggbG9jay4NCj4gPiA+ICsJICovDQo+ID4gPiArCXFjb20tPmN1cnJlbnRfcm9s
ZSA9IG5leHRfcm9sZTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQgZHdj
M19xY29tX3J1bl9zdG9wX25vdGlmaWVyKHN0cnVjdCBkd2MzICpkd2MsIGJvb2wgaXNfb24pDQo+
ID4gDQo+ID4gTWlub3Igbml0OiBjYW4gd2UgcmVuYW1lIHRvIGR3YzNfcWNvbV9wcmVfcnVuX3N0
b3AoKQ0KPiA+IA0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IHRv
X2R3YzNfcWNvbShkd2MpOw0KPiA+ID4gKw0KPiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBXaGVuIGF1
dG9zdXNwZW5kIGlzIGVuYWJsZWQgYW5kIGNvbnRyb2xsZXIgZ29lcyB0byBzdXNwZW5kDQo+ID4g
PiArCSAqIGFmdGVyIHJlbW92aW5nIFVEQyBmcm9tIHVzZXJzcGFjZSwgdGhlIG5leHQgVURDIHdy
aXRlIG5lZWRzDQo+ID4gPiArCSAqIHNldHRpbmcgb2YgUVNDUkFUQ0ggVkJVU19WQUxJRCB0byAi
MSIgdG8gZ2VuZXJhdGUgYSBjb25uZWN0DQo+ID4gPiArCSAqIGRvbmUgZXZlbnQuDQo+ID4gPiAr
CSAqLw0KPiA+ID4gKwlpZiAoIWlzX29uKQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gKw0KPiA+
ID4gKwlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNvbSwgdHJ1ZSk7DQo+ID4gPiAr
CXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocWNvbS0+ZGV2KTsNCj4gPiA+ICt9DQo+ID4gPiAr
DQo+ID4gPiArc3RydWN0IGR3YzNfZ2x1ZV9vcHMgZHdjM19xY29tX2dsdWVfb3BzID0gew0KPiA+
ID4gKwkucHJlX3NldF9yb2xlCT0gZHdjM19xY29tX3NldF9yb2xlX25vdGlmaWVyLA0KPiA+ID4g
KwkucHJlX3J1bl9zdG9wCT0gZHdjM19xY29tX3J1bl9zdG9wX25vdGlmaWVyLA0KPiA+ID4gK307
DQo+ID4gPiArDQo+ID4gPiAgIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAgIHsNCj4gPiA+ICAgCXN0cnVjdCBkd2MzX3Byb2Jl
X2RhdGEJcHJvYmVfZGF0YSA9IHt9Ow0KPiA+ID4gQEAgLTYzNiw2ICs2ODMsMjMgQEAgc3RhdGlj
IGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+
ICAgCWlmIChpZ25vcmVfcGlwZV9jbGspDQo+ID4gPiAgIAkJZHdjM19xY29tX3NlbGVjdF91dG1p
X2NsayhxY29tKTsNCj4gPiA+ICsJcWNvbS0+bW9kZSA9IHVzYl9nZXRfZHJfbW9kZShkZXYpOw0K
PiA+ID4gKw0KPiA+ID4gKwlpZiAocWNvbS0+bW9kZSA9PSBVU0JfRFJfTU9ERV9IT1NUKSB7DQo+
ID4gPiArCQlxY29tLT5jdXJyZW50X3JvbGUgPSBVU0JfUk9MRV9IT1NUOw0KPiA+ID4gKwl9IGVs
c2UgaWYgKHFjb20tPm1vZGUgPT0gVVNCX0RSX01PREVfUEVSSVBIRVJBTCkgew0KPiA+ID4gKwkJ
cWNvbS0+Y3VycmVudF9yb2xlID0gVVNCX1JPTEVfREVWSUNFOw0KPiA+ID4gKwkJZHdjM19xY29t
X3ZidXNfb3ZlcnJpZGVfZW5hYmxlKHFjb20sIHRydWUpOw0KPiA+IA0KPiA+IFNob3VsZG4ndCB5
b3UgZGV0ZXJtaW5lIGlmIHRoZXJlJ3MgY29ubmVjdGlvbiBiZWZvcmUgc2V0dGluZyB2YnVzIHZh
bGlkPw0KPiA+IA0KPiA+IFRoZXJlIGFyZSBhIGNvdXBsZSB0aGluZ3MgdGhhdCBzZWVtcyBhdCBv
ZGQgdG8gbWU6DQo+ID4gMSkgVHlwaWNhbGx5IHdlIHVzZSAidmJ1cyBvdmVycmlkZSIgdG8gZGVz
Y3JpYmUgdGhlIHZidXMgY29udHJvbCBvbiBob3N0DQo+ID4gICAgIHRvIHR1cm4gb24vb2ZmIHZi
dXMuIFdoZXJlIGFzIGhlcmUsIHRoZSB2YnVzIG92ZXJyaWRlIGlzIHVzZWQgZm9yDQo+ID4gICAg
IHZidXMgdmFsaWQgaW4gZGV2aWNlIG1vZGUgZm9yIHZidXMgZGV0ZWN0aW9uLg0KPiANCj4gVGhl
IHJlZ2lzdGVyIHdhcyBuYW1lZCB0aGF0IHdheSBldmVuIGluIEhXIGRlc2NyaXB0aW9uIHdlIGdl
dCBpbnRlcm5hbGx5LiBTbw0KPiBpdCB3YXMga2VwdCBhcyBpcy4NCj4gDQo+ID4gDQo+ID4gMikg
SXQgc2VlbXMgbGlrZSB5b3UgYWx3YXlzIGVuYWJsZSB2YnVzIHZhbGlkIHdpdGhvdXQgY2hlY2tp
bmcgZm9yDQo+ID4gICAgIGNvbm5lY3Rpb24gc3RhdHVzLiBZb3UgYWxzbyBzZXQgdmJ1cyB2YWxp
ZCBldmVuIGlmIGl0J3MgaW4gaG9zdCBtb2RlLg0KPiA+ICAgICBPbmx5IHdoZW4gdGhlcmUncyBy
b2xlLXN3aXRjaCBhd2F5IGZyb20gZGV2aWNlIHRoYXQgeW91J2QgY2xlYXIgdGhlDQo+ID4gICAg
IHZidXMgdmFsaWQuDQo+ID4gDQo+IA0KPiBJbiBkZXZpY2UgbW9kZSwgd2UgZG8gbm90IGdldCBh
bnkgcm9sZSBpbmZvcm1hdGlvbiAob3IgY2FibGUgY29ubmVjdGlvbikgYXMNCj4gcm9sZSBzd2l0
Y2ggaXMgbm90IHByZXNlbnQgYW5kIHNldF9yb2xlIG5vdGlmaWVyIGlzIG5vdCBjYWxsZWQuIFNv
IGlmIHdlDQo+IGtlZXAgdGhlIHZidXNfb3ZlcnJpZGUgc2V0LCBpdCBpcyBzdGlsbCBoYXJtbGVz
cyBiZWNhdXNlLCBpdCBpcyB1c2VkIHRvDQo+IGdlbmVyYXRlIGEgY29ubmVjdGlvbiBkb25lIGV2
ZW50ICh3aGljaCBjb21lcyBhZnRlciBidXMgcmVzZXQpIG9ubHkgd2hlbg0KPiBjYWJsZSBpcyBj
b25uZWN0ZWQgdG8gYSBob3N0LiBJZiB0aGVyZSBpcyBubyBjYWJsZSBjb25uZWN0aW9uLCB0aGVu
IGtlZXBpbmcNCj4gdGhlIGJpdCBzZXQgaXMgYSBOT1AgYW5kIGhlbmNlIEkgc2V0IGl0IGJ5IGRl
ZmF1bHQgd2hlbiBkcl9tb2RlIGlzDQo+IHBlcmlwaGVyYWwuIEkgYW0gc2V0dGluZyB0aGlzIGJp
dCBvbmx5IGlzIGRyX21vZGUgaXMgcGVyaXBoZXJhbCBhbmQgd2hlbiB3ZQ0KPiBhcmUgc3dpdGNo
aW5nIGZyb20gYW55IHJvbGUgdG8gcGVyaXBoZXJhbCBpbiBjYXNlIG9mIGEgcm9sZSBzd2l0Y2gu
DQoNClRoYW5rcyBmb3IgdGhlIGluZm8uDQoNCkJSLA0KVGhpbmgNCg0KPiANCj4gPiBCdXQgSSdt
IG5vdCBmYW1pbGlhciB3aXRoIHlvdXIgcGxhdGZvcm0vZGVzaWduLCBzbyBJIGNhbid0IGp1ZGdl
IG11Y2ggb24NCj4gPiB0aGUgYWJvdmUuIEJhc2Ugb24gdGhlIGRlc2NyaXB0aW9uIHByb3ZpZGVk
LCBJIGRvbid0IGV4cGVjdCBmdW5jdGlvbmFsDQo+ID4gaXNzdWVzIGZyb20geW91ciBpbXBsZW1l
bnRhdGlvbi4NCj4gPiANCj4gPiBJIHRoaW5rIHRoZSBjb21tZW50cyBhYm92ZSBzaG91bGQgbm90
IGJlIGJsb2NraW5nIHlvdXIgY2hhbmdlLg0KPiA+IA0KPiA+IFdoZXRoZXIgb3Igbm90IHlvdSBk
ZWNpZGUgdG8gbWFrZSB0aGUgdXBkYXRlcyBmb3IgdGhlIG1pbm9yIG5pdHMsIGhlcmUncw0KPiA+
IG15IGFjazoNCj4gPiANCj4gPiBBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPg0KPiA+IA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiANCj4g
UmVnYXJkcywNCj4gS3Jpc2huYSwNCj4gDQo+ID4gQlIsDQo+ID4gVGhpbmgNCj4gPiANCj4gPiA+
ICsJfSBlbHNlIHsNCj4gPiA+ICsJCWlmICgoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYs
ICJ1c2Itcm9sZS1zd2l0Y2giKSkgJiYNCj4gPiA+ICsJCSAgICAodXNiX2dldF9yb2xlX3N3aXRj
aF9kZWZhdWx0X21vZGUoZGV2KSA9PSBVU0JfRFJfTU9ERV9IT1NUKSkNCj4gPiA+ICsJCQlxY29t
LT5jdXJyZW50X3JvbGUgPSBVU0JfUk9MRV9IT1NUOw0KPiA+ID4gKwkJZWxzZQ0KPiA+ID4gKwkJ
CXFjb20tPmN1cnJlbnRfcm9sZSA9IFVTQl9ST0xFX0RFVklDRTsNCj4gPiA+ICsJfQ0KPiA+ID4g
Kw0KPiA+ID4gKwlxY29tLT5kd2MuZ2x1ZV9vcHMgPSAmZHdjM19xY29tX2dsdWVfb3BzOw0KPiA+
ID4gKw0KPiA+ID4gICAJcWNvbS0+ZHdjLmRldiA9IGRldjsNCj4gPiA+ICAgCXByb2JlX2RhdGEu
ZHdjID0gJnFjb20tPmR3YzsNCj4gPiA+ICAgCXByb2JlX2RhdGEucmVzID0gJnJlczsNCj4gPiA+
IEBAIC02NTAsMTIgKzcxNCw2IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAgIAlpZiAocmV0KQ0KPiA+ID4gICAJCWdvdG8g
cmVtb3ZlX2NvcmU7DQo+ID4gPiAtCXFjb20tPm1vZGUgPSB1c2JfZ2V0X2RyX21vZGUoZGV2KTsN
Cj4gPiA+IC0NCj4gPiA+IC0JLyogZW5hYmxlIHZidXMgb3ZlcnJpZGUgZm9yIGRldmljZSBtb2Rl
ICovDQo+ID4gPiAtCWlmIChxY29tLT5tb2RlICE9IFVTQl9EUl9NT0RFX0hPU1QpDQo+ID4gPiAt
CQlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNvbSwgdHJ1ZSk7DQo+ID4gPiAtDQo+
ID4gPiAgIAl3YWtldXBfc291cmNlID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9k
ZSwgIndha2V1cC1zb3VyY2UiKTsNCj4gPiA+ICAgCWRldmljZV9pbml0X3dha2V1cCgmcGRldi0+
ZGV2LCB3YWtldXBfc291cmNlKTsNCj4gPiA+IC0tIA0KPiA+ID4gMi4zNC4xDQo+ID4gPiA=

