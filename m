Return-Path: <linux-arm-msm+bounces-29528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74B95FE73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFCCAB2099C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5153E8C1A;
	Tue, 27 Aug 2024 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bAJc4X5k";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jbpEGVVm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WOtbgAxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC88F58;
	Tue, 27 Aug 2024 01:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723114; cv=fail; b=btmURmBlvOxv4/Ashd1V9Gor83gVfwXe74Rbc6Qvr3clKSYBUSQPT3u1TUg4NN02i/a87DF89ocVJY1DbKX+uH46RVPlN9T7uOTO68Acv/tgIUuY81DrAmWAMkS2wssYIKQnLyodwYe8r1YQvY/3II77S2b4O0rV5q7xTGQWZ/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723114; c=relaxed/simple;
	bh=YfBPoSmT5vvVpi679jWAUeD2JaZ8/XI/nHLmyn3rRak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O+LwT5ne6SawvsfHWfZzLjlw0DGl3ihZTVNb1vg5NmdRgTlnn6xt5bip/YBKLfhQjX3ETp9Ok3m+8BRa+0v6uJvPcJmSpFQIuiMCgtjKakgpMQMNXbZuhvv9NMzHjsgHrh3cJ4DYTdr6n300CDQnW0SD1hk89H7zzD8DJHcoz2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bAJc4X5k; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jbpEGVVm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WOtbgAxn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQA6P020762;
	Mon, 26 Aug 2024 18:44:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YfBPoSmT5vvVpi679jWAUeD2JaZ8/XI/nHLmyn3rRak=; b=
	bAJc4X5k7CXS7FWhGifSuVvs9VE/5oo7fMIJTC0efnTaYL9e9EnkJy1lWr9tt2gT
	87IRu0v77g1rhZ0wYrfkfaMNFlDtRqcyIG8xbi2Av36PSwrFJWQ6fktveg8e8Igw
	pTcm+mNrpLH5H7sq6+/Lb26vEv7Tpa7uscl9d8/iUsIpiiOSNohtbNiHP4gvC5sq
	OEYX09nXFDi9ESfHDNi8nVI15g6QWqj7P26OaB289WjAiQDRaunj2UdboFTNZ0yx
	ONholkQTN3n19VhhzUOYzm0cODjBCPoT8cl5tYMIpQ1mRmY1WI63EVeKbqcRIb6i
	3RaQ6uPXxxhcjBU7WVREXA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417es7thft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724723093; bh=YfBPoSmT5vvVpi679jWAUeD2JaZ8/XI/nHLmyn3rRak=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jbpEGVVm8kchep1cmw5PZOQHvtiJ57FVWen5iJmc938iQl/Vs4fc1Kk9XZXc+maW6
	 g7D3fO7THHz0t68QCyBrWQJZbfh+GLswAG9HRkWcpO9g8d9UjUHN3eCZ/gBlBvTD5v
	 hzVjYJgM/cnE7qYHLFcDsWpnP41HcLyJLVMVs+bCBPvoCXMEwwrl2+qNP7a6WVRvMW
	 mfDoML3jUIZVjr4RRzGwSFXBIGlGj2AD5QQkhHpS9NSWoP25d2FfREfoDYqEKP41j0
	 xS+3m7XoLV0j0zDDtcIDqm8BKH2KgBqXoZnLEo1LtL5byf2ESRTVMaUq+X0IG+n88Q
	 vpPQpYt1Dj65w==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F18C840407;
	Tue, 27 Aug 2024 01:44:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A4AC3A00A1;
	Tue, 27 Aug 2024 01:44:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WOtbgAxn;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CD6EC401CB;
	Tue, 27 Aug 2024 01:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l82V7rFk0dXZ6LvgicMF2kEHZVpBVOyib0pURT1EdUhiUpe+18/Z4WhpKeqIU0oON07Lfg0XwmcGQwDADKa2ZfylLZEkyC0Yd3BpUETzxBWqfalKyuH0WBBBj88v9S2FcGI47foBKjqpHYVffowqCCPyl5wKz3x4oON+V2O0PhhNlNhCE5IC3x6/AObZo/mRLvHktY4RKBl6loHmuklS6ctPj0m6jZcCV6ditF7N6h7qdP0eYnaRc6P+WCSGF5ri+5aU48OrI6Yyn8Ka5V1ui9+lRpjwaDmnWUqNwvP7RbsA84SOaZ72O16PSS7DmCYUlpKbJDuyTf2lzyE5eFRxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfBPoSmT5vvVpi679jWAUeD2JaZ8/XI/nHLmyn3rRak=;
 b=mXipfx1E8fAT1foO28pvGkzbjM8lCYwcDmQsAFyiXYVtMK8ZsUEm7reXOabABEyyh5Bt4nWEotwCMmMx0k4+LI9iq1D5VqQK6s9dC1glXARC+mm1PExQx5ROsN8o4zhJE5P42e9OQX7Jc3gQWGSvDYpDC3pz7iuYqMD7r4bkalmqIr4F8EVLQug5DoV4tCqsG2vFLMiy6hPG9xxcXS+uOvhM1kxDNG2/x2uF/kvoWBY2DrPwFlBypgoSrsqDIlyyTkuRbJaKKzRitNvlCmrSX9P7r8znFzjPfSfmMirK37cVZZqDZ+egV/Klhv3rTHniha9TVpJ/rpRNiu8cQ9I0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfBPoSmT5vvVpi679jWAUeD2JaZ8/XI/nHLmyn3rRak=;
 b=WOtbgAxn7CUDaFhW4XHFERwS3F+5kSJ3KyfZKY3XstUtXSemTO7z2VLY8d1Tq6olfvq/tK52JmDjOnc+DWgaPpJBF7RAkYiFAXcK/7uaQCN645+enPDomRaM95a+RB9LNt0Qvut+1Wzd2wIfaXvTbt3550dHsxSP7W7hYZPnpfE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 27 Aug
 2024 01:44:48 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:44:47 +0000
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
Subject: Re: [PATCH 10/11] usb: dwc3: rtk: return directly and simplify with
 devm_platform_ioremap_resource
Thread-Topic: [PATCH 10/11] usb: dwc3: rtk: return directly and simplify with
 devm_platform_ioremap_resource
Thread-Index: AQHa7jXOcy68LPJkRkKn+hWPANiKj7I6aPYA
Date: Tue, 27 Aug 2024 01:44:47 +0000
Message-ID: <20240827014444.tskp7olj3npyjsyv@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-10-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-10-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB6093:EE_
x-ms-office365-filtering-correlation-id: 1f40f299-b22c-48d0-884c-08dcc639d550
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXk1NjdYeEtySlIraEJCdXB1N3cweHZxenpMRldXNVRYM25ralNHam1zNkwy?=
 =?utf-8?B?VHY0cmFiYkFuZG5VZ0hUMEg0UHFGN1N1QmRiK3FRVER6ME9ic1BvTW1NRmV6?=
 =?utf-8?B?OHNJRUN5ZUp3MkVhRW1Eczl3aUxobU5MelVjcms2ci9WcWJmVTJwYW9UTkZq?=
 =?utf-8?B?MlBZNkQrOGdaU1FobDYxWGtLcy9WV1pjSnRRM01xYzZjVWppOTcwQUFkY05T?=
 =?utf-8?B?eWVYdHdraDR3YlFBWlFwZU1EVmF4eFYwdmU1a05kVjFPQmNWeGsxSHBmMVVX?=
 =?utf-8?B?STNwWENSYUR4b1NzRGcwUXVVS0U2WUY3eWpyNFU1R1FiUVZXejJXMDFmZjBk?=
 =?utf-8?B?bGFTTllyR3orM0drOWdsMjNqbGp3THk4NGZtbGJSZ3VJWFB6aWVNMldRREU1?=
 =?utf-8?B?UnVHbkYrQXAyYjAyNGlEWXpWZUpQem1iVXUrVjJjdFViNnY5V29pdEhiQU5m?=
 =?utf-8?B?NFllK0lJM24zS28wcHdYNmM2OFlOSlZIQVVWbUdGQ1ZDaGNyZVArenBtSU1l?=
 =?utf-8?B?ajBpbjdoUjJUZkVEamdsL0xRMG1IQlFQVUhBcGVFQ01PdWdTa3ROVWs0cW1a?=
 =?utf-8?B?K0gxK0t1L1hXRWwvL1RTSnh5WlFLK1J2cUxUcWFTNzRSMkVXbjh2SmFYK2tY?=
 =?utf-8?B?Uy9TZkRGSXJqRXlLUFY3NlpHZmFnSWJoYWdVZ1pqTUxIcWVxTnQ0d2Nra1NT?=
 =?utf-8?B?RStxaWVnWWgvUzNWTDAxYjFweUhPZ0pLNnBZZjdOL0xiYzVXY09EV2VaQ0ZV?=
 =?utf-8?B?Qzc1L1F2N2hxbUQ3TDQ5RytFZEFxVFpUT3M2YURnYzl0d09lTDFyZmhPOU1m?=
 =?utf-8?B?WGNrTVVndGJQZ3FDVDRwSWdwV3g0RFc2WnYvc3dQRW1sRlIrejR4NWN6WlRs?=
 =?utf-8?B?OGZCaGozdHBRclpib3VnQ0ttenZDN3lmN2ZVeCtYc0pobEhwVEtlUzU2QXYz?=
 =?utf-8?B?cGRvbVQrS1kwSTJoZDd2a3RSdzdQNjVuR0ZMODJzQk92VHZpRmRKdkpkTDhi?=
 =?utf-8?B?TlZSVE80VmJzbVlWbnBFbmViVkl6TW9kd3phamhwZ3M0RVB2RHpQVG1nYzEz?=
 =?utf-8?B?K1g4a0szQVcvMG1JNlZ5ckt0VmdUd013eVJXeCtneUpsL0RoSEdMYUtWNE9S?=
 =?utf-8?B?KzExNDNlSlczRStYMHZQVVNOK2o2RStzclZZaUl0clNabDBQa1RpTW0wSjM4?=
 =?utf-8?B?RzRtNzJDRzRPMEgyZ3A1b1B4NGxQa3Q0TlQ1T3ViVWd3TWh4VGxSaU9HODZj?=
 =?utf-8?B?bDFtSkJlWitFSVFkcmtsa0RqRXY1U2N3LzZjQkJsZ1loYnFZR05RNmtRbW9x?=
 =?utf-8?B?SjV2U1JhOURWQzlGYmxEL2ZrNndBcFNEaUtmSGh5K013Mmh2WnNSQ3pBWVRm?=
 =?utf-8?B?akhaQXc0R0dGOEU2LzhxNVc4RW9EYzVtUG44bTdkSnF6WExabjNLaUJMbTJD?=
 =?utf-8?B?eU9mckU4bGJZOWRhQnQwcWlDOW9sNm01L0wyNzdvRHhLeFFpMkhPakJ0L3kz?=
 =?utf-8?B?Z2g2YWN5RUhERHVGRmlxRlZLalNrK2JmeVhwVEZ4VFh3SW1lRlk5aWlQVStl?=
 =?utf-8?B?cjFXcnUzRmY2aVRJUUlYRkxab1BMUHdRd0dYZ3g4VlJDdHROR1lnRXRGcFFv?=
 =?utf-8?B?bXRhcnJIcTA0VCt1dWQzSHRsNVpGZUEvZzZHREpDV3dvdnVMeFY1S1V0SGo3?=
 =?utf-8?B?emdObEVVakxhckpVV3dSTDlNb3NzeHdoZnVzemV2cTFldFlRWjNwa3BSQWRO?=
 =?utf-8?B?cCt4eE5HZEdFbmMyRWprSlJDWnhQOUV2WVpTZkV2UjJiY2RQY2VaQXNkeWJI?=
 =?utf-8?B?bzAza2RkRUFTZkVpblVhMVpJckhCaUloR1FPZ2lVMUZqMm1zbEtxSFJ6NDZq?=
 =?utf-8?B?Tk9KMXgvRFJCM05qUEJ0TVE5Nm1pWlp2S0lEMXhqek5ZZUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDl1aEdCMUo5aGRHMnRINzRRdW5zR1JjU1JXL0FDcG13UWNLSlR3OEI2ZHJs?=
 =?utf-8?B?SCs4NGwvWHhPMjFFcXg5dHlDUHdYS01hKzNJcWpWUDdBWTlmdGFzbnRrbVJM?=
 =?utf-8?B?WjFiZGNReDJuczdQR0pZUnhPQXA1bmpqVHI0UDBPTFU2SU9IckRKMWQyRUxI?=
 =?utf-8?B?M0htNGN6ZC9nRzdHVWNkMkVHUnJaVnRCTU9JeHNVaERzMHBDMUhSUG80ejZt?=
 =?utf-8?B?di9TMFVRMWNBWFRJayttYjR6STRSMnM2S3VvTHpMazRzUVVKaHhZWCtOcWdW?=
 =?utf-8?B?MEl0d1VMbWRYdER4VCtVVDVLYUU1eEF2U1dnZWpLYTZHS0xNUE9EUEkwMHRv?=
 =?utf-8?B?ZWVZbnpTRk5NSHMrVlBPWVBTaUl6d3dzdFlicDVYZnZQZlpZOFlTNlE0QXZE?=
 =?utf-8?B?bEcxS21SOGIwOFVHM09ZYkxqZ21IcXpBQmxsa2k2MjYrSWhSWkVlQ2o4bDdo?=
 =?utf-8?B?Q3pTK2NMdXNiblFiR3IxVGVxV01mOENvU3FhaS9ZSVVWdkREVzFDSEZoRGd6?=
 =?utf-8?B?RkloL1M1TjFXaUZsU2ltbmVPRG5NbWdQQVIzWUlvOG1nRmpZL1hXZm9ISEI4?=
 =?utf-8?B?LzRJeUxrQTVkQVdEUnBSN3hZa2xxRmxnOE5zR0ViMDlpSE84QmFVOUt4MUtv?=
 =?utf-8?B?T3hWY3VCdEdjSEJGQlpGSmhmKzh0b1lFYWp5QmhIT0ZKWjNNMXpVVFVNaDl4?=
 =?utf-8?B?SThOb2NIYlp4YlFkclY0V0duMy85UCt4K1o1VFM1MDJDc0Jza3J2MXlUbjJi?=
 =?utf-8?B?MUtCbWUxQ1NGUHFialhSVTBITE13eXVudGtjN2xIZmZCR3FXYk5QZitjdTRp?=
 =?utf-8?B?OGsyd3h0Yy9HL2lJd1hDbGluZ29iVnpOVEt6b0V1VXpHdUMvaG1hUHdQMzlP?=
 =?utf-8?B?ejlXRUcrSjZzZlI1K0JLcDNXYjZXbkJWUDl0cW9lRS9zazU4ZEVHZ1FLSnIz?=
 =?utf-8?B?ZkI4cGcyc1doT0E3OWRlTSsweUovSVNyRDc4NGRuSkpldWJ4ejloUmVUeHRi?=
 =?utf-8?B?ODBVNWlnVXd0NGhiSktkSVN3Q1RNYnFZRjBTTU1kL3d5V050NjVBaElmTENi?=
 =?utf-8?B?N3dXZjAyWVI4eE9EMzNpdytSZUVBTXZGZDRLenFaKzZnZ1laU09heTlhOUg5?=
 =?utf-8?B?eEtreVZlWVJOaVdqR0orajVpR1RZZmY5NFNnTWF4cEhycm9BNHRHNlpyRGRk?=
 =?utf-8?B?Y2lBNk9aL0RWcnlGc1pWVGxNQTlqK0pqanEzWTFDSDZhT3g5WUtlTjZzRmxt?=
 =?utf-8?B?MTE0ak5rak11OUIvdFRrbTZqV05TeEV0MEZ6SXhGWnNmYk9zMHl4c2lHdDc5?=
 =?utf-8?B?NThUdTRtbE54bkQ2TnYxSjBhTGxjZUFXRExTV2F1c1RZbHk3UjNJdERZMUtF?=
 =?utf-8?B?czd4K3YxRGo2WVp2KzFvaWpaejBhT0VacWROb1JWRmhUN1Job2UycDYwdTNt?=
 =?utf-8?B?d1pEZFVqVkhOdmJpU0lNVnIvOWtKQnQrbXB6TDJOVzVnUTZGMjNwWXpIMEpZ?=
 =?utf-8?B?cWM5YU9pZ041WjRqYjZQaVJ3QjgvUlo2YWF4cEdaQ2wwaVAzUVlGUlR4UHZD?=
 =?utf-8?B?ZUV3SjFCd29jdk14T245MVJVMTFIdkgwVnA0VWhCbVo2d0JKbUhPTmdkN0Fs?=
 =?utf-8?B?MEZXbS9ZenpxM01WWE04cG84cnBhcG92R2s1NE9HVDlja2hLVW9OampWVVlp?=
 =?utf-8?B?TUJyWCtnNU1RZTdkSTJtb3Z4eHZ3dUVIeGtnbW9tM05xMU52MzFXQWxmYVF2?=
 =?utf-8?B?Q1lVK2dZeUZLZHo0bzhZOW1nckVoeVEzVjM0ZEg0RmdaTE5COHZBTlo5aU0y?=
 =?utf-8?B?VGRxTjhrY3Z1Mm4vaTltWWVGZnoyQVA3c0V5YTdTY3ZCRVQvS0JmRVZyOGNu?=
 =?utf-8?B?dHNOV24rSEUvYk84NktNRDZFTlQ5dGJqa003UFlOb0tuZFd1UVl0S0k2bzBE?=
 =?utf-8?B?Qnkvc3g4T1VPbG9KSzVLT0FuUlQvSDVzTCtJOUdQak95RFZmSmt3ZjU5ZUVT?=
 =?utf-8?B?U21relZaUkMxWXVucC8yQjZodmRHelFwenViS0xkOGhQS1VwMXhWZ01SNnVI?=
 =?utf-8?B?aU1yL0VDV2RPTWF3SVhSdHVpN0ViMHNiT2V2U2tRZEd2bFBrOSt0ZUtGU05B?=
 =?utf-8?B?Zmt4UzlQQkowZGU2cTFuRU1FWkhSUHRKZVBrTFhSNVo2K1JQQ21yZDNtNDFw?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <339AE7CFA143754796B82DEF8E5FCFE2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LZN+7XzTeBpkNpGwbhuWiUqVZ1aY5xk5SEsBlLCG+yetGVOOhdEK57W2GfUQMajz0S9Eyu/qGnP1YvOnVMMk4+/BYwVQqcotl+/PuCwvqtZtVaDTtfiMbLmYTmY+5akQAgOZhzLVkYbiXapI8jByvqko8sZXBTAwAv4CRKer08BQNndZvG7Z4Qlp6vClvTA1X452+oKsjrDScRDSCceoXkE53lBqLZSE4KNJxvEzEi2IqFiH7boOVAgG/lBPZR3AK53IXnh/OyEZki/hP8QNt6jdrQbS+PUmBltwpjUMuURyUvHijAxjWBEjsQ5X2HMdAAMNUtBRChlvPcMh0G7Fu3dtCp9deWY3+ZUWxOOcdoOxUqY4jMLMR5ALQ0wHlQrj8xEpTVzElNC0tsi5+9QioC188XgvA9ltV/MVJsuRboIv4ql226+P/reO/yoXbcfem91LmOdsc/+2V5Pm3lcGBLUENrVWyi0o2ULk2tPiluYaeiMiFITun/xAaa57zHQv9jINUrHexCxSSdDtm8ZHd06cmIk6SLlM6z/GXS3plqfLGbZnJA4CaOAW34fULkORvP+jyx+eV7ZBKCXo0rDUMIp8UTZqIYAztIG50DLGG1XfXNLtzb9ASAuVuYyBtyydiGMCkc0ibkNynZmO8YiILQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f40f299-b22c-48d0-884c-08dcc639d550
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:44:47.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvW7+hF/50uwVobsdqbtyYmpkzKVNTYNtUZetMRvhW9xKHjk/R95TyJTPGi1O+8LgVXTP7qN9fTcZdfqDgf7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
X-Authority-Analysis: v=2.4 cv=NZK01HD4 c=1 sm=1 tr=0 ts=66cd2f95 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=_BuFDa7xYwYddcyxmg0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: RBiEL22aLT6bxymfsBHmGnFyjVX5roJZ
X-Proofpoint-ORIG-GUID: RBiEL22aLT6bxymfsBHmGnFyjVX5roJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=995 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270011

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSB3cmFwcGVyIGluc3RlYWQgb2YgdHdvIGNh
bGxzLCB3aGljaA0KPiB0b2dldGhlciB3aXRoIHJldHVybmluZyBkaXJlY3RseSBpbnN0ZWFkIG9m
IHVzZWxlc3MgZ290bywgYWxsb3dzIHRvDQo+IG5pY2VseSBzaW1wbGlmeSB0aGUgcHJvYmUoKSBm
dW5jdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3
YzMtcnRrLmMgfCAzMyArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1ydGsuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1ydGsuYw0KPiBpbmRleCAxZTNlYzIwODQyODYuLmIzZGI1Y2Q5OTA2ZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXJ0ay5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1ydGsuYw0KPiBAQCAtMzU4LDMwICszNTgsMTggQEAgc3RhdGljIGludCBkd2MzX3J0a19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7DQo+ICAJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICAJdm9pZCBfX2lv
bWVtICpyZWdzOw0KPiAtCWludCByZXQgPSAwOw0KPiAgDQo+ICAJcnRrID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpydGspLCBHRlBfS0VSTkVMKTsNCj4gLQlpZiAoIXJ0aykgew0KPiAtCQly
ZXQgPSAtRU5PTUVNOw0KPiAtCQlnb3RvIG91dDsNCj4gLQl9DQo+ICsJaWYgKCFydGspDQo+ICsJ
CXJldHVybiAtRU5PTUVNOw0KPiAgDQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcnRr
KTsNCj4gIA0KPiAgCXJ0ay0+ZGV2ID0gZGV2Ow0KPiAgDQo+IC0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLQlpZiAoIXJlcykgew0KPiAt
CQlkZXZfZXJyKGRldiwgIm1pc3NpbmcgbWVtb3J5IHJlc291cmNlXG4iKTsNCj4gLQkJcmV0ID0g
LUVOT0RFVjsNCj4gLQkJZ290byBvdXQ7DQo+IC0JfQ0KPiAtDQo+IC0JcmVncyA9IGRldm1faW9y
ZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+IC0JaWYgKElTX0VSUihyZWdzKSkgew0KPiAtCQly
ZXQgPSBQVFJfRVJSKHJlZ3MpOw0KPiAtCQlnb3RvIG91dDsNCj4gLQl9DQo+ICsJcmVncyA9IGRl
dm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOw0KPiAr
CWlmIChJU19FUlIocmVncykpDQo+ICsJCXJldHVybiBQVFJfRVJSKHJlZ3MpOw0KPiAgDQo+ICAJ
cnRrLT5yZWdzID0gcmVnczsNCj4gIAlydGstPnJlZ3Nfc2l6ZSA9IHJlc291cmNlX3NpemUocmVz
KTsNCj4gQEAgLTM4OSwxNiArMzc3LDExIEBAIHN0YXRpYyBpbnQgZHdjM19ydGtfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDEpOw0KPiAgCWlmIChyZXMpIHsNCj4gIAkJcnRrLT5w
bV9iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCj4gLQkJaWYgKElTX0VS
UihydGstPnBtX2Jhc2UpKSB7DQo+IC0JCQlyZXQgPSBQVFJfRVJSKHJ0ay0+cG1fYmFzZSk7DQo+
IC0JCQlnb3RvIG91dDsNCj4gLQkJfQ0KPiArCQlpZiAoSVNfRVJSKHJ0ay0+cG1fYmFzZSkpDQo+
ICsJCQlyZXR1cm4gUFRSX0VSUihydGstPnBtX2Jhc2UpOw0KPiAgCX0NCj4gIA0KPiAtCXJldCA9
IGR3YzNfcnRrX3Byb2JlX2R3YzNfY29yZShydGspOw0KPiAtDQo+IC1vdXQ6DQo+IC0JcmV0dXJu
IHJldDsNCj4gKwlyZXR1cm4gZHdjM19ydGtfcHJvYmVfZHdjM19jb3JlKHJ0ayk7DQo+ICB9DQo+
ICANCj4gIHN0YXRpYyB2b2lkIGR3YzNfcnRrX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

