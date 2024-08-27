Return-Path: <linux-arm-msm+bounces-29529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484F95FE79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA0E28234F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CF5C8C7;
	Tue, 27 Aug 2024 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dkd36oVJ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="koEACkOm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DG+/ZAHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5921913FEE;
	Tue, 27 Aug 2024 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723130; cv=fail; b=KkR1lsgXRS6f6DQfZ9cncHKwQ6hAA4tPGIVC/DTWqVgM9FF3QPrHpFmLbO/OTp/rX7XEFN7HGDXVlDI/FRFA0btdyVwOxpRFKORbHM7IeDTKBm49LB9AJzrMCIwfyp2OlOOtH2nSpQtFW/f00WK8gyU0tEt96BtQC+84XW+aWM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723130; c=relaxed/simple;
	bh=jegMlO0MxXxyJBhKMUNDDLNIlWNymouaU3YYZXjE2EM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aop7NN0cQzW+hpz4eKa87/ScIlKkmFUILCuoExNamNzldOo8MdIMz9PI4CAPcEwa0LkXnurSnmuSloEOys8OtF0SNfqGMIMIMdNa4HGZ4+7HjvY1zsjfqNJkQmycii+ZEpNfgJU7NzXTJzZDIArP/9ryrc2f0eZFU0u8dXzrYdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Dkd36oVJ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=koEACkOm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DG+/ZAHH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQCgC002821;
	Mon, 26 Aug 2024 18:45:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=jegMlO0MxXxyJBhKMUNDDLNIlWNymouaU3YYZXjE2EM=; b=
	Dkd36oVJYbYaE+4n0BaLsq/Q+XYdhBRZYWQq0YOwjEh5zmdOnWkC6aBNawYScQ7e
	6S8lO+vGVtRbFSAMImP54mkcNFv4MY5T/HTw5z63rYpBrayCxFivySHKQ1B0pQHM
	UJx4dvaDFYjsi/elZKGKDdLr4AAdjSzR5rlfAm6Om4/y7OQIRpG+6rR7sxGBOK0e
	3Bt7SZt9Tp+nfGcwY+MI7sK11At9tBLZLXROSSH0oN9F1cPRiMruFhc6vZVSp5gp
	Lnsggz6NlXTmmedjSqA51BuVz3fA1aLFSHKqtVTV5Njlw2ICWSncPglN7bfIAtzV
	xR9ViaRTQXULC5i5DWgg2A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417eevjnct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724723111; bh=jegMlO0MxXxyJBhKMUNDDLNIlWNymouaU3YYZXjE2EM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=koEACkOmzcrkJeNh+ORyq1cCuQFU9OI4hlg5nndQ1lM5KZaiZfz56CAr/JYBre1GC
	 zWKx/NiLjK1tTkYjeMdQfcG6lJ5hChC/svjdbsnSA/3ZPN3jv9H7p6jFjwiJyL0oPT
	 V474Jy0jIWnLZ2rYfwLZE6LOV8YrJdRJ/8DfTrk8I/4rhA8xgkioi0K5W6gMH5q+Ha
	 KLE88XK70/hjpUNaM6moo8qaJt1EN053GaE6Ezj2fKqlV4d4/pIm1jwyYo4ranKwuq
	 cU096IK0rpjhit/ukPh/6cEGkfPVbc3VvBTpQLyUFqQm7T29hBKU8ElNLm+KN9wKHu
	 WIBPE1KvKVqIw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A73F40346;
	Tue, 27 Aug 2024 01:45:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CC8B1A009D;
	Tue, 27 Aug 2024 01:45:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DG+/ZAHH;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 46F73404B0;
	Tue, 27 Aug 2024 01:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXG3crQaZ+JoI4oh8megSWlCx3JBKLUP+gx0+NpQDYRFmRHnO4/5ws5NihDAii3/hZlm/nGa8KVCaZW5257UUKo+7T0u1S8WU38qKNdfzt3bJi8EDQjtWgIhBl4kh6Hs/QaK/7/4+GYfdyU/A5Rmbqa27Ii4dgl+vMvbVxU4lALjMnMlgDIIfeoSO+yXeGjNQQ/gUl+jwzIFmLUQaz+nHfx272gn1INYKzU3KPOBCspA+HS32SbWMwtK4pi9pXi3zj3qOBf/GjxLMmfeXNtKwf3WDpKPKFnqp0syfnRLvzdQmQvBbQgLQz2Xs6g14krifMZLjtv4qY8642KoKHmDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jegMlO0MxXxyJBhKMUNDDLNIlWNymouaU3YYZXjE2EM=;
 b=Y8hlQPJj9CbvXqj8jucr/aQlVmCanoUdwon7ONmNrjvPAjUpEaHsBA+GaT/39HW37ABKe8b6S1DT5trd7OF46UbyIU2wZ7dvjF/+ZrvyxjcK2DPD70MuB2H4lYGxRH191wUZX2iTkDXEySFK6d8hI1d7YIuF4v6XxqK78JSKQwu4u2XtZydUia+mV6YrxOBx05wDJZd8+rCFErrwjEnUvfncr3Wht0EQFIUV8ehIKni7lbYzHb5eL6YijeQOIc0L6IlDV4fjZeW/bVLXwpasv8U+gBcQHFc0FVLcwnDGOt7p0suqQtVbnFKV3jdIY+KKSOJkr65r/KH11iY2H+kG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jegMlO0MxXxyJBhKMUNDDLNIlWNymouaU3YYZXjE2EM=;
 b=DG+/ZAHHU2+9qCT+JzXA5Y2TdGOJ5cCGUsQkoBy2ZovAKIJxBfwddbGYxMvL7hLKomWyuCYz1XNgTExZaR5H5R6UyZ4negHgh/rEMZdqgn8ElzyTUd3HJ/4WYMeHDA3fnYh1mywRnEqUZdSfTxnt4PdN5L6PftfNS1SstYHw4FI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 27 Aug
 2024 01:45:07 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:45:07 +0000
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
Subject: Re: [PATCH 11/11] usb: dwc3: xilinx: simplify with dev_err_probe
Thread-Topic: [PATCH 11/11] usb: dwc3: xilinx: simplify with dev_err_probe
Thread-Index: AQHa7jXQs7fEWn9UDEiZxSEbqXeFXrI6aQ0A
Date: Tue, 27 Aug 2024 01:45:07 +0000
Message-ID: <20240827014504.psd6mix4woyg4pin@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-11-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-11-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB6093:EE_
x-ms-office365-filtering-correlation-id: 926058a5-e03c-48e2-f049-08dcc639e11a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?czZ2Ykc2SWI4U0RoWm80bkhkM1ZOU0QzQWJHaDBCNC85eEhQOHdIRUlGS3ZR?=
 =?utf-8?B?RTR1eTBpUktVVmNXMTZWc1lZY2x5NWlNL01PbFRmZjRpVStQU3l1Q2FnS2pq?=
 =?utf-8?B?SmFaTTB0NW8vOVZRSlRqa21SWnZuVlVsanlJdGJ6V3ZlNWlib212dlZ1VUtJ?=
 =?utf-8?B?NEFuNmlDK3c1bHgrQzNHNm8yc2xKUWxEVXhqMEtSMXFJNW5nMTJscEZSbVFj?=
 =?utf-8?B?aDJoTTI2SGsxY2N6K0xsVmxJZXZnTWFQOEJkN2oreEVXTE1sbVlmclcrVUVP?=
 =?utf-8?B?MzBnaytWVUZhT1gvRDJ0RU9KSXgxbERrcjdIc3UwVHZsSkphcU54dThMcjdH?=
 =?utf-8?B?QnBRTFVtL3lSVGdUVW5xZjVNbVlUNXRzT1RvOWpIcXpDSFViNVQ3ZDcvZmdj?=
 =?utf-8?B?WWRpQ0pPTTJyYU5xTUU3ejNDQW96cTBhYXFpUDJnOUdWL3VIVnhOWUNxSTho?=
 =?utf-8?B?TnU2WTRZbDlqb3Fqam4zcU4rTXk4RVU4OGw4M2plVjFKNTdiZ2s4dzcrUDJ5?=
 =?utf-8?B?bjVSeGhxUFZZd2VMekRoS0hIejlXWE9OSVBPVU1zWFdDM0JaUmQ2NGhpcGhk?=
 =?utf-8?B?Yk5kaE1iTUluY1BJSUVzMEUwd0IrYzNFdSt6eGlrUnhCQ082blhSWmpuOFRV?=
 =?utf-8?B?eFdSNVAxVnBtQXlteitpeHhkSVppSWlCbC90eGZGUXVydDlZSGllcnpMODA1?=
 =?utf-8?B?dFNuelBZQkowMlUyZkt5MFJnMGJ5MktkQ21NWlJOSC9UUmpjVzExb3h1Wno4?=
 =?utf-8?B?WUVuZ2FINGVKUlhaR1VybjNtQVd5TXJnNFBDbnV1a0pHVHVyUC84eTBCSnFD?=
 =?utf-8?B?ZllQaHlMTkRoY0laS2J4MHVsZXBvTFEwVUtYMkQ4N0ErTStmREF4V2kvUjR1?=
 =?utf-8?B?YytGU25OVC8zR2dTUThxQlhGd0J1Q2trN1VENVB0UWZrU0ozY3FDZGZtcW1x?=
 =?utf-8?B?M0dUUm1wWk1Rb2M1cE1pVjVGV3RlRWd2dW5xL2txSE1ZY2pVbm80L2E3bW1D?=
 =?utf-8?B?VjljS2Nzd0UrTk5Oa0lmRzJVV2RVOGFiL0YxcnhReUNJOU9lT0JNZ1g3bHlp?=
 =?utf-8?B?TFdSeE5TdFBUYXV3dmRCWjVIa3JsZjJTbUd0ZkdDV0ZadzhZUkMwQmhyTVRx?=
 =?utf-8?B?Y3Z3Rk5ocWd1VjI0NThEUm1wdGJ4Rk42bmVPRFNsaTY3RzRKRzFMV1JUaUR4?=
 =?utf-8?B?VExpQWhFcVFsaVBIV3E0SGkrOCtuamtoa2doMnpxSFRFTklON0RSU0tjQzJh?=
 =?utf-8?B?dFhsbklKTW1pemtOcUFJRzJROTdONElyditOUUl5ZElZYkhOck8wR0lGVmZj?=
 =?utf-8?B?enhhRW5FQkRCNFhXVHJtWS84YXFtTXZTWHFWR0VJRmZwYk1xenVBV1lLYjBW?=
 =?utf-8?B?RUN0elNMOVJuSERYOUg5QWFJME1xYk9MTm5VaE5oc29FbjJoT0lEYjFwWUha?=
 =?utf-8?B?YUtpT1NHQkxNMjNWZzhDK0ZTaG51QUlZL3AvR3FMSkVFc0JZaEpwb21TaUtU?=
 =?utf-8?B?Mis2QVo5V1JJR2JnZlFRbGIrVGg5UE5CVHBScGQ3NFJBT2NSZHpaT2dLeWlu?=
 =?utf-8?B?UHF2c1BWczdBemhRdTNWc2FYa2FWMGhCUDhlVzFaYkd3WVI2cnVtT0ZyOXMy?=
 =?utf-8?B?emljcVNMZWpBb1I4dy93L1g3VVFydDNUOExxcUJOYm04cG1nejBoak5UVUw1?=
 =?utf-8?B?RVQ4UTNZRmxTYkM3ZVY4L2lMWnRDUlBOMlU3OXQ1MWRVVzhVdlpYblpVU1dt?=
 =?utf-8?B?TkZ1Q29uc2RyQ05LSDQxeDZaK2hZcmtWWU9sNHpnOEc1b3MzTDVwaitjR1FV?=
 =?utf-8?B?VG5XTGJDbmpXNGhNMkw3UzVLLzZqZHVBNFlHR3I2UWh1dW8xVjRobmI2bHc0?=
 =?utf-8?B?Y3BWTVo2cjFndU84UCtCVnNPamk2SGxkanFRSWdPU1l4YUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmpkS2pVcjRGck1rTzlZS3h1aTNQUldnWnZrWFRJVlUxeHhyMDRaRU53U1Vs?=
 =?utf-8?B?R3hVQThMY1VDUzI2Nk9pZ0x3YkxjV2twRXdObzJobzB5eGRvLzZySHlWYVJE?=
 =?utf-8?B?NHpZcklCazFjcTJJT254dlVqTDRGcFZ6RkMzaW9tOU1OanhLZE1wRUN1Ukpk?=
 =?utf-8?B?b1BReUdvMEJNZVlVTy9pNW9yVG91cEtkbUdSOHV1M2szSXFVR21YaUkvcmlw?=
 =?utf-8?B?L3Q1NW8vTGtmSTV0ejBEazZpWnhWMGFJVTdiVmUvYVNWajFkLzI4WEVvM0xJ?=
 =?utf-8?B?VmtWL3Z4R0J6cDJSKzY0NWdxRkR5Z2lqcG95MHQ2dkNzaHZaOWVmNTNYVUo2?=
 =?utf-8?B?eTR5N2s0NFpzUTcycXNqN0hjTmUwZXZ1Q2U3ejkxcmRRSUc3OWVETFZFYkFW?=
 =?utf-8?B?U2Y0TldsMEZrMWx2UTRXTzhPMk5YVkFva2pVRWVYL1N3dUo2YlNIZVNNQisv?=
 =?utf-8?B?MWtwUC9YQnVvZXhmZVpqa09aWmlGeWZVOG1meUFXUlVuc0JYT1JwMll3MFhj?=
 =?utf-8?B?L09sbitkWGovSjNxaGkyUmJ1VldwYURycDlWSW1odmlIOHhUeUZwM1NWRkZX?=
 =?utf-8?B?YzNINFVsaFRIcUZQZmd6c2h3OVZiSmxINERCOGZqelZEcWo3ZW5pdnBBM2wy?=
 =?utf-8?B?ZU42VzJQUlpQYURLY29KeU5lU01ZOTZiSENaSU56M2ZOdWhhZHp1YkMrOWRE?=
 =?utf-8?B?cTJxaEs4NFcwUEFlN1laaHhrNFdvRHZOTDF6RFFhdXBVenBxd24rNHdNREFw?=
 =?utf-8?B?bXBzKzkyQmUwV2FCMk1lMFVEVnhjaThOZ0h3YkdmZVhRVTd1RTZZK2FqOWRp?=
 =?utf-8?B?M0huaFhET2RLNkxxY0IzeHAzaTQzVHRIMXNVRUh5eFJUeFM1bXBLR2xIY1Yz?=
 =?utf-8?B?RXFLZlIvVndYVnJsSGdGWGtWSjh0Zmo4UHFrQ2hVOVhOUU91SUZRbjNaUVpN?=
 =?utf-8?B?MDJHdUp5ZUxucVdWWVlKdm8zb3l2amk5aHk4a0g0QXpWOFBkU1daT3dNOXdQ?=
 =?utf-8?B?YlRtbXM5ZVdXNTVLNGYyT3hLSFdLUEx4aDZQZEVrR0ZwM0N1VkVuM2RtOXlX?=
 =?utf-8?B?Z3pCTWFlVDNkR3Bmc0VWN3liRkFEQ21NYVU4MTRaZWpaUnBXN2UrVWJ2Wklp?=
 =?utf-8?B?LzJXTmgxak1yUVloWCtaOFBwMEVQWGRXWVRBM0Y4RDJiNFFLOXdRVisyei90?=
 =?utf-8?B?TFhVdjNybzYrcXN2R0taU0U2VkY0U0dkd1N5eFowR0txeDh1WEd2OGFJcHJV?=
 =?utf-8?B?cTNQUXYwNy9hWUtYLy8xRTljMExYNHhFV2krSkkvYmRNZzU2Y2lYWWhqRzYr?=
 =?utf-8?B?VUFyWkJCWDh2bG0wYUhXNmI0akJzUWpGanZhWlhYNVBmalpDOEJXUzJYUzV0?=
 =?utf-8?B?Ly9VQmRVWDJqTC9QVEtLUytNSUhJaGNOWXRTVmxrYVdkSitmWnljWVA2by9w?=
 =?utf-8?B?ODZQUS9MME1WUWNzR0FtVm1pcmxkRkgzNTU4UTBmbWZuTmt0VEZPaElRYVFn?=
 =?utf-8?B?WTlCeVNYMFpHc25qTThmbEkxR04rbE9sbGdzMXpoSUh0czJJaWg5bkdsOXlC?=
 =?utf-8?B?cDQyTE1hazZlemNoYlNuRTJqbzFJdUdRNkoxMDBWcm1GSXBBeGZtMTZTc0c4?=
 =?utf-8?B?TXkwc2ZOYTlIWmZWN1FqOFNYUVU1SEFZcFROaktFTE1aWGVBdlI4cXp2YnQ2?=
 =?utf-8?B?YXVueGJqalptSWxwZWRRNGo2UHM2UTBwQ1VMTjA5ZlN1UDRTRUJSSW05Qmc1?=
 =?utf-8?B?TVF4Z3p6S2VOVWU5d3BjemFLWEhURnpMOE5IaTUwbzNYZXpOQSt1azdralFq?=
 =?utf-8?B?a0k5ZC9NcDlUbnJPYjZQWExkUW1mZmJpZVJhbWxtQllKWnYwOS9pVnNLL1Jj?=
 =?utf-8?B?a3lQdUdoOW9iS3hHMjQva2ZGck5HOEd3bG1oOFFWUjAzVmM2cU0yaG5pRGtU?=
 =?utf-8?B?NGNuMDNaZml0bXBhR01aRzZqUnVlNFlvbnUwSFhGaWh5ZjhkcWRzRS9XaWk0?=
 =?utf-8?B?dkI1WWNOd2lzdFZzSkd6ck1jVWNDVTFJWUVEQ1BCTFhuMGFNQmNlMXlNa3dT?=
 =?utf-8?B?Y2hFSkpPcnBBUXQxdW5XVFUvUmttNWt2MnNrck5tUFlxRkVza3g2N21qNy9P?=
 =?utf-8?Q?WiKq9LfqLss656+0CfXXfHyNr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF2D4BA40E5854E92172344BDBF0BBE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZMng6otZGe81hR2zLYpDLfdgPtHdmQjhO8yFdSl4N+idLVEiSfyd6e09xfIB+nPL40NEgi3pJek41AjpjVXKveUR1icTB7sXUZENIBqSqG4EWHw+EQCtit1YdTZQKQgqv02drf4/apleHYgnBKufAsPDzDovTukc8K8i3t2n8juHYyGr2Jq/acG+7Qquh/FPO9bWfTn3B9OX+owTSWV0/Ui/TXPU5qvp9/tvOOnRL4VGKLF1rOI4Uyekj6j/YfnqQJO/Ic9WPbInH93I+gI+S0wgN0JbUvK/cZtfokvEmLpNTOQGyBnldkGyjitaXAEkzFYitIpCCGV2CLVpNJXHXmLTDmeTSDEDrlsvKQ1ZkU78t924grbxnOCzBUeD33Ya5aC5NMgKUTzOvXoQK1FDmjWnJKf1GYtfBtsbh7vyR7CmkKt/cr+TZ8KWk/LmNvbSwgk0QNoFUuPVn4urq7pSQpESMgQAUu5+1pVhbFsUPopAILVUnNqf2+cLksIKWEZZAWijryJ7Bg4BSrPCT5p5Jijf1ynV2bVQXm3zmPBI2+i2yb6jA62rGV1r8YgLZrKLsfiijVdvUWV3OmFgCJmlb4V6bsJG8nSGzqrDAUbhl/v3yWLfHxs1a0nzvTzqXUVTXk/QJOTVkocl8c/zvK60Fg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926058a5-e03c-48e2-f049-08dcc639e11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:45:07.1245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlp/KEKgAA1POdW6yLtk9RF7GWDxcICatlP9usSOatECymsZRyOk2JLVrGBv+I7JbksMlM/DHnnIgSJy1YRtSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
X-Proofpoint-GUID: z9vBUGzOUbX_ktGc-kKknKUokkQuhX9F
X-Authority-Analysis: v=2.4 cv=Se6ldeRu c=1 sm=1 tr=0 ts=66cd2fa8 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=77EbC3Wl7TYuYxMQ4k0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: z9vBUGzOUbX_ktGc-kKknKUokkQuhX9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=789 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270011

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZfZXJyX3Byb2JlKCkgdG8gbWFrZSB0aGUgZXJyb3IgcGF0aHMgYSBiaXQgc2ltcGxlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMg
fCA3ICsrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5j
IGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IGI3NjEzYTEwNmRhNi4u
ZWI1MzU3MzNjZTkxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54
LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC0yODUsMTEg
KzI4NSw4IEBAIHN0YXRpYyBpbnQgZHdjM194bG54X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+ICAJcmVncyA9IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gLQlpZiAoSVNfRVJSKHJlZ3MpKSB7
DQo+IC0JCXJldCA9IFBUUl9FUlIocmVncyk7DQo+IC0JCWRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJmYWlsZWQgdG8gbWFwIHJlZ2lzdGVyc1xuIik7DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0K
PiArCWlmIChJU19FUlIocmVncykpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihyZWdzKSwgImZhaWxlZCB0byBtYXAgcmVnaXN0ZXJzXG4iKTsNCj4gIA0KPiAgCW1hdGNo
ID0gb2ZfbWF0Y2hfbm9kZShkd2MzX3hsbnhfb2ZfbWF0Y2gsIHBkZXYtPmRldi5vZl9ub2RlKTsN
Cj4gIA0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

