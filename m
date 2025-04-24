Return-Path: <linux-arm-msm+bounces-55530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07051A9BB58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8278F926E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B2428150B;
	Thu, 24 Apr 2025 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jxWB3tEh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FrsgUMxG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YeNTBZVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487A1F463E;
	Thu, 24 Apr 2025 23:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537532; cv=fail; b=SyzxJ/fmPim8Hez5nmOnL1VR01XVALjw6ZGA7vxmgR82mPj7qhNaBel1Cpng5S0z1qVw8qvtFvUPHQgJA/0gsJiZbI9PEcNzA5/oVrrX0yloXOTVaYqz6Jf00V382cpm4F2nlth5p0i2nf2OXqGB2zzOOtL8kNgVx9Tau0RtU94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537532; c=relaxed/simple;
	bh=yPIsliBsuwnmDxsZE9JpSFaASdoAgfjSE0L/t4iFoUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3imYQafG3zgvsYUuesIq3aJJstjL582YxxrNF4xex6e+IUbUrpniAsHZWaXMfSaOSclV0owoZj8de846UWgnOxJpAKg1No+ooprXHcc67YM58wpMt8ayueXE/S8rsLs4eo8+QrCdNpojAF/sNiqpwa04h/2/nWsLtFlKlap5ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jxWB3tEh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FrsgUMxG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YeNTBZVX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONIWZJ015434;
	Thu, 24 Apr 2025 16:32:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=yPIsliBsuwnmDxsZE9JpSFaASdoAgfjSE0L/t4iFoUE=; b=
	jxWB3tEhbf9Xa3haU3mYBa9CzVG8Z0G5ML2+GQbiMLOlMJ17MZlbMLJZUMYNauhB
	GYTY4vkW7E5B84Y1VOLSNZDWPD58wBg7epNizsobAdi73OIy5oGMtXDXh2RZ4EnU
	GGPnGIbJjPWe3I2ZNJ1I77XzkE9EsGZg6Bmzcdcj/VdIqchQdASyyywPYYVZfuUA
	+Ggqk64fHYV/pxtDQTeD17HdJ6o10zhh8SmJbm9f1bpBpU6Quu+8PcV+QaHlSNW/
	QC2Y3La49aAW+ao7tvh0OFmrmcnN+zAoZpp+e9b2/kjKjMnQsxiZ3T+/f1eziVPJ
	IB8m1sZAvo0cBD+cAbiS5A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 466jke4cyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745537525; bh=yPIsliBsuwnmDxsZE9JpSFaASdoAgfjSE0L/t4iFoUE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FrsgUMxG2bdCrz4HG3lYFHcGK8zQS9voSbcoKyJQE/N6HCM3Tx+YlJosTvpEL1/lz
	 su0vjXpqY8vy0BdmkiBipXUnx6zqqkyxBS1qfe8y80dNLaEl8OpAfCpkQjf6tBxnPd
	 CraxpyuMTgX5XNzKImzY179xqznvRpxM/SfW2c5xLVD6ASOeqwHprsYZ2bC0PvTAW3
	 Xaj9KkIOyuAqE1115fc3pc6PWvfrdW7UQPRlTNZRtlgRoGD+332LIIGaXO8IS2XXia
	 5nvm2iWJFSu+SyIjoSUDWkQ3Lp8BzbaNhPXVxJFnUwpNK049RjHvkNIkwtQd8oO3Hf
	 ez1QteYJddmKA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF4034012B;
	Thu, 24 Apr 2025 23:32:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EF703A005D;
	Thu, 24 Apr 2025 23:32:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YeNTBZVX;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BDFD040124;
	Thu, 24 Apr 2025 23:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL7gUgHPYYXeCE2Xv8U/Dsf3g3vQg0RNOwXVUQM1HT9gBNQCCuqhnFv9p4vYNgz53Xs3XAMrSi03YxEVfr6qopWe6XYWGaAPxKwBd53a2kmoRWxQJ3BgQo9qvQgWtsAeawzYb9xcXFlKAEsVgn40h3cxcAyEVaSWxuHx+EvbTg0KFGq9YhHnDGEnUX5LNM643EPpCNKdNQSdYUUs2m6vkKmWb0on56WxvwpJDTmk9mwI5WYlACxQQjmzovlCKm+YP6FADk+SzAf2r5qinIlTx/wK/jGQ6zv2NhgZuYmmp8Z5aRnzKb0f2cchVjzay6cShSY8n8tkvDwaWIIdm/0j9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPIsliBsuwnmDxsZE9JpSFaASdoAgfjSE0L/t4iFoUE=;
 b=EO4AYjJuBJFaR2jAGQUAjflIi2ESbK0TQSdAqHf6aR2eYY0gxg/1JDgMRx2lPJAKoIyZz3XrI3HkPmoy0726AvH2tRXAgAqD6b7mo15D/6VSoYa8VtXsG9cOSZx5qytiOCqQ1i8RvcudBk+8ILBs01aIXHrkw6dKjZqJONi35zWlocdsQzmg+RzJ3eZlOhUT+sR9iOiJ0RdUXfALsamCam4GTSHalpdSiifGhFnjbU8T/3tocvfMLAdzF/VnjIdYtjl59K5k9KIW2YgtASsJeoc9mA7mRFLPUUXXiuhw+P3WHqJWvN2uWReMsWdRLRrB9ViBMhx+bvRYTbnANapPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPIsliBsuwnmDxsZE9JpSFaASdoAgfjSE0L/t4iFoUE=;
 b=YeNTBZVX2PqjnmVS5F03HFV/pc2syOti64Z44sgHz5nBcVG96zphbM2FrWCvsY86HTc8FVhETkNBFdebxS2Y3fUOKOuL0ibHyregOH4A0hgeFvcqJ2F2M5CFBHlWDWbpAAjC+WoT6kw1cBsMUT+Z+k18Cqr4E3lEB/RA92RSCBM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 23:32:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 23:32:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Thread-Topic: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Thread-Index: AQHbtCkTMJ0xjULk1k+gvjC4HPiHn7OzedIA
Date: Thu, 24 Apr 2025 23:32:02 +0000
Message-ID: <20250424233158.vgegsvpuiwm6j6a4@synopsys.com>
References: <aAijmfAph0FlTqg6@stanley.mountain>
In-Reply-To: <aAijmfAph0FlTqg6@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CYXPR12MB9442:EE_
x-ms-office365-filtering-correlation-id: 37877da5-672a-4671-0691-08dd83883730
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3FVUC8zVUFYWG1iYjlQV284cmVEQkJmTnVqdmpxSVhJbXZwVXRtUmtkRVpV?=
 =?utf-8?B?THFSbExUeDZ1aklVc0c1R1dyMTdqeU81VmhialR6emY3QWV0MlBTVVRVNUpj?=
 =?utf-8?B?UmdNbkVsck9vVStvUkg4dDdHMTRONHpPR0lXUytTTTlnS0VRajNCQmFoSjVB?=
 =?utf-8?B?dWQ3RTRFNU1oZ1NtSFY3c2tGZ2gwSjA1dUY2a25hdG5UNmZ5ZlFrWk50aE8w?=
 =?utf-8?B?M0dTeGJsVmoreUExcUZQemd3WjdoVC9Rbmh5Ykt4bTZrZ09MUThmWVV1cWdV?=
 =?utf-8?B?VEFZSXlxcjVOVy92V3FRWDNXN2hPMGlYTkkrVmZYTjMxK1JHT2t6cnVEbWt1?=
 =?utf-8?B?QS9hOHpTOFM1QmpYRUVDbUREUlVKRDU1NHluem9oNFRZL0RvYzhRY3BuR3hz?=
 =?utf-8?B?cXVQMGNBc2hibUFJdFU2THI4a2hFMlF2SFJabjFrYnI5cGxlOTN2SnFJNTBC?=
 =?utf-8?B?b3FzZkYycHpJTzdYdUE5SUtLZFpRU2xRMXBseDlia1BaMVFBUDY0NHJvbFh0?=
 =?utf-8?B?enFTeXVxOWFDZFJiSVFlQTk0WlpxNUkvVExlLzBZb0RuVTlIemF6WGRwRitS?=
 =?utf-8?B?NXNmZStJZGcySGJzUXJzZzVSbDA1bFZOYWRYWGlTaHJvZk1FWUhoZlQ0ckxH?=
 =?utf-8?B?emNFVHBxR2lTTUVZUk5NUXlRczNlSjlFWWNoUXVkanU0cFpJMmdFb3lrdDlr?=
 =?utf-8?B?Y0poSDUzRmErQWtSMkN3TndCK3ZicFlMUW9GbWhOMVd3QmhsN3lwa3VVa3Fa?=
 =?utf-8?B?bDlTZWx6Y3dnQ2w0VkhRdktNSkxzY1ptQ2E2SUFTZUtWc0V0d24wMm5IV2Ur?=
 =?utf-8?B?UTdBZENud2VNNGZHeW5DVlJsdnFXWjZBVXdYcy9YK0tpY0RvVlJCUmZIWSt3?=
 =?utf-8?B?YWh3cjFqbDdQVkxkQnpGU1dyY20vYTRGdzJOZm0wcTdiRkVOTkU2MzVDeFFL?=
 =?utf-8?B?dW5TdGpHQUsvVzJVb2tKcktWYWRQQnh1VzNpNDJneXpoclV6ckwxR1MvYjUx?=
 =?utf-8?B?eEs0UXRFVXVHL0F0SFpjcWlqcmlFSnkxaWtoWGdNTkJiajdIczRHeDNPdUhm?=
 =?utf-8?B?UHFvbStIeFhrd1RFdUZMTGx1NzBQMUlJQ0hZZ0JIQlNmYzlnM2ZFZGUrNWlt?=
 =?utf-8?B?SU04b281VmVsdVo1TEZ6S1I1Q2lRREppd09sUzV1Z2lyN0xhU2ZTNnJFMkNj?=
 =?utf-8?B?QUMvdXlaeWhGZlNaWkJFaWRZaVl3RGhDMzRoNlJmOXJJOVJkcElCa1QyWFVV?=
 =?utf-8?B?dW5uK1h3TzhaK3ZHYStybHMxYmhDaUNiaFJDVTVLT0FtYUsxbDgyanZnQU5z?=
 =?utf-8?B?bUx0RFVXWkZzRVhOcnRsZEx4QTZ5N2JZQTlGc0JHMnRwSmdCS1d4NlVPOUdZ?=
 =?utf-8?B?enhBM081dW8xVHVwM0pHc2VJam4xcGE5bHdqZnpsMWNGMmJ1MWJjYVpLVytH?=
 =?utf-8?B?cVZkNGZ2RUgvdnlrcTR3QWZvYlREVUF2Tm1Qc0dNWlBhNXFDMVJZSkY3MGJh?=
 =?utf-8?B?OGVOWXRkd0J2RDEvbG4wZkV3NkswVldycW9FSmMyMmZ5VThHQUZ0MW1HNyt0?=
 =?utf-8?B?SlRsZ05uYjdpVE0yRytnTHd1eGU1N1NYenlWMlVUUUtXMDArMTRrTGpQWFdq?=
 =?utf-8?B?a0Rxb3kwR0RZYVcreHczVFltN3Y2bHNwUFVwN1lxdTlBb2NRbDhnenNOcjNH?=
 =?utf-8?B?UmwrR29ubm0weENQZThXYWJUQS9ZOFlWa1lzSVFOb3lrSmVISVlhVmdNOEhT?=
 =?utf-8?B?c3puOTZvVmNYZ09kbzRRZWhoZWNXV3FDRWxVN3RmZG9EOTBhbUdOVENhR2hl?=
 =?utf-8?B?RFp6bHhMWElITlBlcHFLN3BQQXNMc2Q0clVnRGZDSnZOaVpQY2FaUXB0bU1C?=
 =?utf-8?B?V1NML1Urb1NYaGVHTStHREE2K2F3bXliSUZWY3FrM1NqNzdGMW5iSStYc1U0?=
 =?utf-8?B?bVp4VGVoc2txZEVJcGhkRDJYQkQvRHRtR3ZhWEZKSmxqVEN1bnA3MmNieDFk?=
 =?utf-8?Q?s9r7uVV8JwcGzar/GDsfql4si3UE20=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akJGWFpudCtWSG13eElMaDhIaTFlTUNxOFRsTytabG5TZUN4VFAyRld2dTJ5?=
 =?utf-8?B?ZFdsNVNNY0hpdWt4NkVOZ2svTk82VE95YWZFcGpyVE10ZUpZdWRyek5MRW5y?=
 =?utf-8?B?VzB1dEV5VUJTbVllVFBpMDJYQjRPc0ozWkxNN3FQWU1vVDBvZXFJT3Z0WnBi?=
 =?utf-8?B?MVpuMDVKZ1dXNS9YLzVEbkNnM3N4YThpT1RMTG9ENWJ0S0FnczZHNHJ3ZWNK?=
 =?utf-8?B?bWJ6QzZvdDZFTHBPWlVxVXFoSWZLSVlLYUNEbXZ0MDR6ZWtFK0VNUE1jOHY0?=
 =?utf-8?B?Tmg2TUQwTkZaSW9CT3BvcGI5M3BFK2QrWXZiTmtGenZpdWZJOWZpK2tTUXFO?=
 =?utf-8?B?d1lOWDQ0bjZWZ3M0emJBREFZTkZJU3RvWXFqZHlZbGFjN2ZMYTdCV0FsZ0dS?=
 =?utf-8?B?bnNmeXV2WmU0M05qbnhlOE04VHJOdHJrajlndjRNa0gvVTV3RGRzSk5HY1hH?=
 =?utf-8?B?cmdYaG4xY0o5eWVIRmRzNGJ3SnVTMzNaaDhYYUYzc0VnczFza1VSN0tIWVNr?=
 =?utf-8?B?U3NVVzFqMmZtS3lObnhWV3J0bUxCVUZsNDF4Q2NJVE9kcU80eDBhWm9DVEJZ?=
 =?utf-8?B?YnprQ1NIbUVHUisycnF6WHZkMXhxb2dOcThKSHd6WlRNbnJEcEFxcFRhYW1r?=
 =?utf-8?B?TzN0VGhCai9ha1hWc1ZSdlFLMlJmVUcwNmZZWUFrTGUzN01VdllIL3Fpdjhx?=
 =?utf-8?B?RzF2NUMxY3lDTjY2b2Z0R0xsNTZhM1orWEVYalpQdWdUTUs3bWpRZklIWVZv?=
 =?utf-8?B?cHJTRi9heDdsZnNvY1Z3c1pFcnRvd3hURGllYkFBZENhSXJVTU45N1ZiT3Vj?=
 =?utf-8?B?NnArYlYwYVgvZ1FXOEVJUzIyMUw1WWhOTy9EaHg4cEZHQ2twVVcxc29yZ2lR?=
 =?utf-8?B?Z2Fmd0s3QndkNkhTTitjb1BFbFRCeDVYYkNxc2xZWThqN2ZMSDVwWWR3Ylk4?=
 =?utf-8?B?NFE3bzBCemE2ampBUEgzbERXd1g0K0c3MnBudFB5ck5oYklCdjkxd1YzTmJ1?=
 =?utf-8?B?WUUwbW40TlpQNEI0b1UwTWlYcm5rcysvdTF6RWh1b0lLdDNNNUhuYzFObGFD?=
 =?utf-8?B?dUxuZjRNRUxFTEhPclZBU3l6UFdIOUtxN1RpdURjVGYrLythWnY4NUJsWitQ?=
 =?utf-8?B?RlNYT3NRaGZiZ1dlc3RZTE5OTDZubWloZmphc3Q5YWxlZG42VEtHSSs5Yy8z?=
 =?utf-8?B?WGNDSXFnQmU3U0VXZjBHZFFuUkJmclVtT25ZZGZkQ05QQUU5UTFIRk1ieWpq?=
 =?utf-8?B?bVlCMVlFTzI3cnJvL0lyUVpYWWMva0FGSkVaOWhseldOQmF2QTF5M0hSVXB1?=
 =?utf-8?B?OUY4QTVsUTJKTjM3WSsxeEoyNmtWaTRTTk9OTHdZeDVJTUIxc2dURjBMS1FI?=
 =?utf-8?B?dGtnbTlzQXpWZkVXUWNFMHBqZzhGUnJRcVhNbE9EYlRZaTdTd3V2WUdoTDFh?=
 =?utf-8?B?Y3AvSFNyTFlkNDFwTXJGTGUxMkQ3OUdvOUZLY2Mzb2U4eHphZmZlQW9BdzNE?=
 =?utf-8?B?MmU1U0xnbzVrOHhhRkx0ZHNTMUExa2w0blFWMEtUdHkydmhyRDRwQ2htZjdk?=
 =?utf-8?B?U0pWRVNITW5FQ2J2Q1NoRnZEVUVGb0NuMThPdEVmdk9KZUxidzJNU1hyVjJm?=
 =?utf-8?B?cTh4dXkvZThMaU83TlEyU2cxcEtWcnhVd2ZwOGRBam13MmFORjd0T3FidjA4?=
 =?utf-8?B?QmVrSFJ2Q0E5QmFxbTdZVW9NbDVGSE40ZDZWU1JVMXZ3U2t3RTR0RERUbURT?=
 =?utf-8?B?SHhSZXM5TStOZUFIVVFlM0JsSFFYUUppbE56WlU0Qk5HUG50Tm5sS3diWHBx?=
 =?utf-8?B?ZnVtWlFiNnc3VGxVSkExQlp4Y1J1WUt5WHVLNSsrbGxmUzVZM2lLQTBOeVov?=
 =?utf-8?B?SlJaa2dNdGlOa2UzSk5uUmx2ajkwVnV4N2xLSVIxcDdkZTlWNlROanNYb09i?=
 =?utf-8?B?cDJSaFRmNENDZmZ4VEFLLzkzTGl4T3VWc1RXM2VNRDMzMi9GVVV3eEhaNEZN?=
 =?utf-8?B?cjcyQ3hUdjBFeWFyWTlobFkzOGROUHdQNHA2QUwzeEpnMmt4TnhMbkdydW85?=
 =?utf-8?B?SlM0d1pxYWk3Tzg3U3M1TFRqS2RUdyswZW1WZnVGbGF5TXNxdGVFNXhmVVQ4?=
 =?utf-8?Q?+fmey9ylsX0JIwUTKWZ1fmjX4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F0D1A78E7C0CA49ACEF2A7249ED54A3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/y785TnK5YNjUmU0EZGskP+YH6L3AXmjvDCR2B6LqVW7/Q+tJctWEi7xPUTZiiXdvBZiPvOya8Kvejk6uDj9TwRtYUfGNDspbDM/DmPAinBTpcyeBC9X9xnXMAfXxUxGmVKOEuMMYf1CW+2vs0jwOjEeexr1/tYSYtU3wweJWQKkbtAY2wM7sHODjpjIpzQCNU7aZRIYph6/TeupJ3ke6m9rtrJqbnqjbAOtHi0BB06CBGdzLwwc70Uo2IESJaUWdEwBWy1nXhsIt4yrLXyWShX+JHv/gDSRQG0c/b1wz00RjUU5k9j2pFx3Z5ZZyELvQljyktG3pc/cmMuYcjnMeZdiP4FGAJ92PugjoWsxqVgvjFrwsBCGkXUBtDnHDampNl/c4ZVaNUfNv5/r83jPPNayU0uvjUmbrhrFgU6tThwtCl5wXKq1m+Dj8+xS6yt8Bho3O9gxv6Y2Ua6atGx4J0a/iyZCF2oXo7TDlb5GEqeAWQeO394h/AC2eZUlJdLUA5Iyas4j+qUzuWhD3CfN7OUd8Y5OI7x3nntVUUu9jUU+ELTS4mTwdzxK7WkeX4hVWejg7Egtmyoy8O2TdVrs11QnqaDoeYtgakJUZTXlIsAGROy2Fzflb6+d9wK4rWboeKe7Bjw7ePJykplxS4fgrQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37877da5-672a-4671-0691-08dd83883730
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 23:32:02.1032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLQJii+TBwh2rWAMDw6OwuVI2z+1RWJXZkPBgRpO5G373MAzqWRzHnrQGSSnmfcPhvcmZ/lbct01ggLqu2RIDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
X-Proofpoint-ORIG-GUID: LAvqxhtooYrsgyNtHmQz-wZDrkXSLnIc
X-Proofpoint-GUID: LAvqxhtooYrsgyNtHmQz-wZDrkXSLnIc
X-Authority-Analysis: v=2.4 cv=QfBmvtbv c=1 sm=1 tr=0 ts=680ac9f6 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=gU-PR89XZCzkBgG56jQA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NiBTYWx0ZWRfX/MahUyoM45aq FpeDKotgItos+mrPlPb6ZDTkO7Z6mPHfBQLXw/mmlGOfoh5CdmxjvGTbzp7NzMZYABYKxRDN1X8 A1/tzxgSMyd89NAwBd5r8Wty6WOBKC/h3x0G/ClZRJZeWL80pYHOXwjCMEJeHRDvbnCkdb/JBMP
 YfxNVy4xYYF/OR8QQBPqQVSkq6EoWy3xPW7HyDeScuPDgUH6BrqJa5AKR4hEMuAk68DQWI+sCvH rFvNFRDiilwmN22i2wE3Aq2E5WzQdWupqnM435/FQVYo5K5W+YJv++xskO3dkFFE77Y8bPsb+kv 7CX7y66Mp5s9L2ZNeA8MvLuTWcF0dn/KjF5yIeZdcXmsoy2DFeNZ/Ayj+mTfrvHpo4+DnwWRQKv
 W5XjENjwEmK0faZd4+xcsqF1Aam1GRudwtmrXyxRV1j2h35pcdyLcIKr+eX7YeCsRjgf4w9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2504240166

T24gV2VkLCBBcHIgMjMsIDIwMjUsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFRoZXJlIGFyZSB0
d28gaXNzdWVzOg0KPiAxKSBSZXR1cm4gLUVJTlZBTCBpZiBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
KSBmYWlscy4gIERvbid0IHJldHVybg0KPiAgICBzdWNjZXNzLg0KPiAyKSBUaGUgZGV2bV9pb3Jl
bWFwKCkgZnVuY3Rpb24gZG9lc24ndCByZXR1cm4gZXJyb3IgcG9pbnRlcnMsIGl0IHJldHVybnMN
Cj4gICAgTlVMTC4gIFVwZGF0ZSB0aGUgY2hlY2suDQo+IA0KPiBGaXhlczogMTg4MWEzMmZlMTRk
ICgidXNiOiBkd2MzOiBxY29tOiBUcmFuc2l0aW9uIHRvIGZsYXR0ZW5lZCBtb2RlbCIpDQo+IFNp
Z25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCj4g
LS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwgMTAgKysrKysrLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLXFjb20uYw0KPiBpbmRleCBkNTEyMDAyZTFlODguLmI2M2ZjYWY4MjNhYSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcWNvbS5jDQo+IEBAIC03NDAsMTUgKzc0MCwxNyBAQCBzdGF0aWMgaW50IGR3
YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCX0NCj4gIA0K
PiAgCXIgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0K
PiAtCWlmICghcikNCj4gKwlpZiAoIXIpIHsNCj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gIAkJZ290
byBjbGtfZGlzYWJsZTsNCj4gKwl9DQo+ICAJcmVzID0gKnI7DQo+ICAJcmVzLmVuZCA9IHJlcy5z
dGFydCArIFNETTg0NV9RU0NSQVRDSF9CQVNFX09GRlNFVDsNCj4gIA0KPiAgCXFjb20tPnFzY3Jh
dGNoX2Jhc2UgPSBkZXZtX2lvcmVtYXAoZGV2LCByZXMuZW5kLCBTRE04NDVfUVNDUkFUQ0hfU0la
RSk7DQo+IC0JaWYgKElTX0VSUihxY29tLT5xc2NyYXRjaF9iYXNlKSkgew0KPiAtCQlkZXZfZXJy
KGRldiwgImZhaWxlZCB0byBtYXAgcXNjcmF0Y2ggcmVnaW9uOiAlcGVcbiIsIHFjb20tPnFzY3Jh
dGNoX2Jhc2UpOw0KPiAtCQlyZXQgPSBQVFJfRVJSKHFjb20tPnFzY3JhdGNoX2Jhc2UpOw0KPiAr
CWlmICghcWNvbS0+cXNjcmF0Y2hfYmFzZSkgew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0
byBtYXAgcXNjcmF0Y2ggcmVnaW9uXG4iKTsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gIAkJZ290
byBjbGtfZGlzYWJsZTsNCj4gIAl9DQo+ICANCj4gLS0gDQo+IDIuNDcuMg0KPiANCg0KQWNrZWQt
Ynk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0K
VGhpbmg=

