Return-Path: <linux-arm-msm+bounces-55529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B7A9BB53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83AAE1BA3F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6021224239;
	Thu, 24 Apr 2025 23:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gV9xx4e9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KroslAmr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bsRBez61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C321F463E;
	Thu, 24 Apr 2025 23:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537436; cv=fail; b=Dj5l4m7HYwepokOmdg/26i4KR/SK0QZqnjW6SWQLb8NN82+/ntUD0NQOun1oYbTCnND8/Si437kQYHTFrgztdzU+9x2rvjXneAzvUqPYupyat2ZXRcJhAfFQx4OTkJDk1rtyMdFn5cI9JV8I7PkI/s5m4DDE9/J+6LuifhtuRsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537436; c=relaxed/simple;
	bh=kdRjyuHGO9h3JPm2aKOoA3Cu5ZWbumeWMNG9nHi6PHI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U4eX/KVll4POWO785Z1So9lAm1CpLISAJTSy8nXtFUqjPFMnhwL6B5JwhL2zSlzyerlFxR4DsbFVM7a48cZ2BdZ6OD7bIS+WVxDLEaUWy92gejHCHmeFDenVPjO8d1Qlq7wmlLRZ6aV2JB68T5XXsb8O/gtIVa3emIgrU2PB3RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gV9xx4e9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KroslAmr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bsRBez61 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONIM9Z007965;
	Thu, 24 Apr 2025 16:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=kdRjyuHGO9h3JPm2aKOoA3Cu5ZWbumeWMNG9nHi6PHI=; b=
	gV9xx4e9wxvwm7zO390YvTw7zmCbeMXIyBgH44qfaRjH3utRTbM6upgMg+Ks4b5F
	t0MdlYQ0xjJsJHxUThppeZt5fMnJUZjXsm3V/+qdmuGWIxAYoYUIXEx+1qWvXlb6
	Sj6CEOWKdEEYlvFYmSpRljSP6HsXReb2udzjO0p0rx9LN8klpazbfinR6oAo/2th
	66L5MndSEcAOqwKIZ1Z1jLbD6XWyjRa2S/9zhKm2aCmblSClrNf/hbtlSIfqXtj6
	RsDl7INKS6cET5faYZ6ltqaGvKN/kySlaIupNDh/R9gAvA1OPPd+YxfdIFe7lcDI
	67NqARLLnHyD/cXHvs7TzQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 466jh84e8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745537401; bh=kdRjyuHGO9h3JPm2aKOoA3Cu5ZWbumeWMNG9nHi6PHI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KroslAmrsWPXqkFsCOZ/YPjzlhIvJ0ruO+xofS+M4a+SG7T+Dfdnhwlmo4TKWXnO9
	 TkPBLFAZ7KtC/aqKi4SejUs5WqKNwWCWWkx1WqE8jEkA8qpMdQvTg/mOdww2xzcexN
	 TAEHumvGEzK7eTfxbeBhfPw29FG1+2LHpQ/LcmOVXKvnqpCpPpr1zUFjAR7EBL/cgH
	 QZn8737TQ+hF1DA9erpV0fQslJ0yKfXNlyV++4dX3YpELv/7zxm7+fvFvMY8Du9KYy
	 ZzHRCJWqgPB4QJ/m4qiLYoLEi9WbA/pJMhqEsL7YHuZNQqld5XtLXWwERH+qxh0H95
	 8XO9t32BNRKpw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 85F9840131;
	Thu, 24 Apr 2025 23:30:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4DDCBA006F;
	Thu, 24 Apr 2025 23:29:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bsRBez61;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 721D640343;
	Thu, 24 Apr 2025 23:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpPnk9jvpu0tzCH7rUzPe+MhkqOm7tIvN6CrKGvBLv0EygcAcgt2GvgqY3lQmU49kujZn9m4g80RT3XoyQnH7vdIqmrAYz1cq53jmpsTy/ySA6JLJjm99L88hacyctirQ+fyOLLEp1ksDCjyDKwfNoCgQgwx7v7VTMTD0RfiIBTd7ev5JvDsO1fvDI4hO0likGn5uNS9uilR4ppL/qvui88S9Caf8GsXUuKfBOv8m/rXv/t7W8YZ66o/f06daYaryf1fDkCBkC0vN8h4WKQPyOUzTipWt5XT6X+sJIuM0+cQP0r+OOOjaljIwmjtVNLJUH2f1x9UJzf9w9ZvrR6Wng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdRjyuHGO9h3JPm2aKOoA3Cu5ZWbumeWMNG9nHi6PHI=;
 b=DixaspYQOVv8TmaDPEyLajZcZOmlc/Q25m94W3l79gx+9/aHx59NawcxdUCnl+v4p7ceaBDVRCgHtughqAW42TSLQGZ4+a4SmSdfP+bFEMD8306HvuYLRF12AQByNtQAIfpf5WKZE3wtvXBGsrifZVtzEi1Ab3NU517EFBIEu60jd6QKyNlaELvCq4hp09zqRThTAf2n+cGwnlR/YDP25lk4r/i66iecQO8S+bqHDPg5xZ0wmAwqncYFyRCR7dDMki5IzFfjw4fLsITVz5xAmzgkIjkWBcR446bqOrKZVlCdcCRdqJ6kwi8BVnThblKM43ec8yCKHz1zhBCMkShqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdRjyuHGO9h3JPm2aKOoA3Cu5ZWbumeWMNG9nHi6PHI=;
 b=bsRBez61nVExi5RAvrrc2P2rL9+qGja9WcxDIInxxdlmEeX1t7m7h75PlBAWJCNu6VFB8q9l1TD4K0FM8m5EHPKi0T5ztHL+VBFsLM1olUQwPkZt9r/VMVs8uRRbGvlhItkW16GL4UlOhhHFy1F+HXZ82xY5tlXjQOV4aX9Jxnc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 23:29:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 23:29:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan+linaro@kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: use modern PM macros
Thread-Topic: [PATCH] usb: dwc3: qcom: use modern PM macros
Thread-Index: AQHbtGx1K8KxCMfbsU60RIR9z3p6arOzeLGA
Date: Thu, 24 Apr 2025 23:29:53 +0000
Message-ID: <20250424232949.qg6klqn3b2egb7iw@synopsys.com>
References: <20250423162613.2082417-1-arnd@kernel.org>
In-Reply-To: <20250423162613.2082417-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CYXPR12MB9442:EE_
x-ms-office365-filtering-correlation-id: cf1eeba3-a606-4a8b-ac75-08dd8387ea82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUhDNkdEd0xQU2NWdG9qbzlBY2lhNUlLNDRLUHppUGlHSVcwRmxOSFlGNURR?=
 =?utf-8?B?d0pyWjE4OTY1ZnRXdnpKeFJVUHVCcGN5WHNHbjVvT29YRHFNMUVEWkgxblRX?=
 =?utf-8?B?N1N4OWtCbFBFZ2FCdUxORFJWV0trVkFpVUh0THVVTUE4ZmtyWFdHWGNJelp3?=
 =?utf-8?B?NXhqNUI4N1J3MHdsQ0F6V2pqR05OM2dYZmp1SERtbTNwU1JvK0hvWlZNMGhL?=
 =?utf-8?B?MDJRZHJDT0JNVytnVURrTG14ZEZNdmdhWnRpSjBIa0w4eGNWbG9QMHZCQ0pW?=
 =?utf-8?B?bmhIejI4N1NYbzV0MThLbVpUVGRCdlduWVBFQ05TSUJnK1pCd1JKcGdIeXE1?=
 =?utf-8?B?Nm1FT3ltYVgxblhPU0pPVkRHRWd1ZDBIRHFVekJ0b2VhRFp4SHRHbENIKzI2?=
 =?utf-8?B?bldKYVAyWDVtNnNDVTJDTXJFREpTczQxT1VGU2lhRTN6dWRGZ3FJN3lJRmtx?=
 =?utf-8?B?YzRmd0docHVpSW5INEdBbHRGS0p5Z0Z3cm4xQStPT012dytTK09mTlFoc1Z4?=
 =?utf-8?B?N09ncW54VXlxTzh3bTRUaGpTdW5UQnpxc0JGUUJYc2c0NEJocFhneUd3Nnd1?=
 =?utf-8?B?UlprTVlZdEc1ZC85YVFqVWtPSEROeE1qYk1MYjlacDZwWlJmUXJNUDF2b0pF?=
 =?utf-8?B?L0hrNHZoUG10WHNPVFdzU1ZsN1JPcXpmUE9USWVQVkJKM280RWM4NGxUZ3NQ?=
 =?utf-8?B?c2hlVnhLL2k4dTZGZDNSMUFKK09PMG00a2o2NkVFR3lWVjc0bGxkVlpHZTVa?=
 =?utf-8?B?a2tKZVpOamxUWmZHZ1gxcnV6R3d6UlExdXNnSEtMRjZLanlTYXl1TGxONnZp?=
 =?utf-8?B?Y041WFdKR2NLM0djSzZMUlY1d3V5UlRCWE84UWN5Ukdvc29BckQyclN6TTU1?=
 =?utf-8?B?eEQ4YlFKMnZTaFVoVmowQ2syOEd5QjY3anBkWXBiblpoNlNoRUxZbmhINk5k?=
 =?utf-8?B?cXlYb045eHhIQTFQMVNROENyU3dFeG11SXFwVkNFRnFDRmlXbVdUY3ZpN3U2?=
 =?utf-8?B?aDVGOWdOSHhxZ3dCMEUvSzQxZStJeXZjVnNuZkRkalBrOEdueFNZQWJWdEtB?=
 =?utf-8?B?MGs1Tk9DS1dFQmNJQVBFT3hGUWRXL0pFTkhZcVN4NVJiT1FnWENEYTlHeHF5?=
 =?utf-8?B?aFgvRzdCMkpjSlpmb1pnYXAwVzR3RTE3cGdGMnNITVp3TSs4WlpzNjltYXNS?=
 =?utf-8?B?WXd5Wm9ZRE1WYTJSbWlyclRoNzBoNXVrMDhaTStwdS9XVW44QUQ3TStlS2lp?=
 =?utf-8?B?ZE5XZGx3YmxQdWV4eWtxTWo5Vjh2aGhJeVh2aU5UdEF4Z1pDN2pIV3c3MHRy?=
 =?utf-8?B?c2gvTVlyNkdZNlBBV0d2VkxaY1ZoOEJOYkorS1RHcXVjY0NTTlFWNmlBNmF0?=
 =?utf-8?B?L3hGWGgxUVQ0ck85VVlmd1Fxd21wa3dTc1dPQ040M3pVV0J2MWNWblQxWm5v?=
 =?utf-8?B?T29xemNVUWoxdjZQT1FFUC90QU1CQXBrS2V6bzNSaDRQZllUREpQbXRUbHNJ?=
 =?utf-8?B?VnRmTThBOE1sbmh4VGJSSXp0a0dneWwzRDFmSFIraHJWMXc5bmkybk85ekU3?=
 =?utf-8?B?U3lQNVVPVEVhQkVqVGpOcFR1SmJUSDZxWjZjcXljUUU4UzJIOVRyb3lqQkVn?=
 =?utf-8?B?N0FhR0o1Yk9kcDhhNHo3WkxkWUJVSGgzUHRYL2puMFJIVjQxWkFScFliY3Fm?=
 =?utf-8?B?d2lWY254YURMK2ljSW90WWt2N2R2UUFsTU1ZaC9VbWVwN0I4RUNLWkgyS2NM?=
 =?utf-8?B?bUd2Q1hXdUFJNHhqeWtqbVZUZDBidXdQK0hiYS9ZV2FDakV6Rk80bm9zYTRv?=
 =?utf-8?B?WGwvUmNjb1o3c1FQbHRDRm1FbmE0dllaREFRUnBQcDhRUjVIUnRXTFR1Znhq?=
 =?utf-8?B?SzJ4Q1hOKzFGSU84MWZwNkE1MnZzTHhyRkhWYW5WTUFYamlUa0pGblhrcUpp?=
 =?utf-8?B?MjUrQm9yVVFabmFSOTJUSmswV01vYnhja2MvbjNuMzJIWGdEUllqVThwVGlB?=
 =?utf-8?Q?HpRyEQ6v0cWRie04jxgV4aVHrlgJEw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDFrMTU2b291aGxpclQwR0R0bWViaXNUUXF1VlNXR3duVWpSeXpSbDEreGlL?=
 =?utf-8?B?K1lXSHBXYys0U2FqVTVHdXlqaE9SYnd6WlRNelgvZjFTcmlEVkFmRjV2MzBX?=
 =?utf-8?B?UjN0Q21zRjNPQ2c1THJSdjhEdVdzMy80SWNZQlZXZ1Nab0t3b0tUM3hjV1VE?=
 =?utf-8?B?RWhrNlcxT2Z6MVkreWF2YXBOQkNhY3E1Z0txcW9PZVNjRWlNc2hzR1dhYzhU?=
 =?utf-8?B?M2Z3eko2b0h2TU9zUGRPU2pQQ0prSFhIVXc2ZHViWXZmZHk5RkNHWjlRS0Nh?=
 =?utf-8?B?NWs3KzBNam9INVFGcXpjVW11QmRVVHJaK0VFSmd0RkJLVWs1Zm0yWVplcU9T?=
 =?utf-8?B?UlM3cjM5eTlYWSsvNTNzNlRsTVd6S09ZcCtqNm9IcGdsYThxbjhlZm5rd2lU?=
 =?utf-8?B?dlhZZjdGcGtXZ25RZTM4NFUyYXBCOEU4d01XWERoR0tuVjE4Z2NVUEI4VXo1?=
 =?utf-8?B?bXI2UTdhZXhzeFNkczB5OXI1NVVpdFZYbnFpK0hOSmx2WlBDQ041aGV0a2NK?=
 =?utf-8?B?OFhoVTdERmRLZ1N0MndBTVV5bkhacVVwUXJLNVJCdjN2VUNYdlI1YUxxTHhu?=
 =?utf-8?B?ZTcwZUxORXRZb3A5cTcySkQ1UzdQY0ZPZ0xRYklkbGNVTmx1Vnc1RnA1eits?=
 =?utf-8?B?K0dYZTh5RldFRDN3Q3BEYWVGc3VmeDEyUXN3OGdhMTA5cFRYVDA1emlnR2wy?=
 =?utf-8?B?Uk9yYjY4OVJjZU5lTWtSQnVUSHF4bEdHOGVLcTVJVTdadUpjbTkvdDI2Y0tL?=
 =?utf-8?B?T1BUUlYxRmRPNGxoSmIrakdScE5SdXRHRFRIV2pxTXhDQzF1cDQ3aUNGN0lM?=
 =?utf-8?B?VW1BQTZndFVvT3VaVHhmOUYwQVZJUDlkNlJKQnZET3lWWm43VjA5UHhJdUV4?=
 =?utf-8?B?Wk5rdDQrZUcvVGVrU09sNGhKYUwwOSt2aDhRMEZ3cmxweHhKSTV4bExFRzRh?=
 =?utf-8?B?WUdob0t2bGtYWTZKOEpsbG9rdmJEMXJFSGdqNHRsZTMzcHBzQ0F0WEFHeFBv?=
 =?utf-8?B?ZDc0MWUxVDVTMENqY2R0VzRvWHBpSzlqWnYzOGxsa28rL1IwRGl4MGp0RWxi?=
 =?utf-8?B?cllES2JxZ0NvZDRZMG5ibHU2OVhYRldBdmVHM3JwalNrdkhMZUhIdVpsUWRy?=
 =?utf-8?B?WDdYenh1MStXcyt2S2NjNGsvVml4bWU3YnFFNzROMUJuQzFWNVIxRWQxUHJx?=
 =?utf-8?B?VmVydDBqZGZYby9wZTZFMGhBMHpRYVZzbHMvS0ZVNlRWV01OOTJ4Y2hDT2lY?=
 =?utf-8?B?T3h0NFdsbXFITFpiWWh2QzNDUWo4eG9oeGQxTnRKYUdIL3RERVFwQWMrckRV?=
 =?utf-8?B?S3B6UERiUEVYazdsZEdVcTBOTkZiWVNScmZWZ2QyNURGNlBlaEMyeUVaN1dH?=
 =?utf-8?B?NlBhU2x4QXRrcWxMdzhZVThCUGFzaC9pMVlUWHBCNTBHLzlnRWdTeEl1bUJT?=
 =?utf-8?B?WVpwVGRRY0hkUnRldWw5MWRlQlVpU0hDeEM5SldNczlqVzR3azd4UkhER1Jx?=
 =?utf-8?B?VFh6ZEVSdDd6RlRkemtjc1p3bXMvU3V2c0h2aUR0WUViWEQwSW9KTUNEWTMx?=
 =?utf-8?B?NmhCaEdwYUJVWUlLVk9KdDhuWE1GTi8wbEdHMFcwZ0hJakFmNVBYcGVWRDI3?=
 =?utf-8?B?aFBsMGJlUXFsWWY4RytBZldXNGFUL053TC9PNEhZRXlZZVpTMkYvbzRTbUw4?=
 =?utf-8?B?Q1VqNndoSnBXLzdRSjN1RVptNlBjZDBQemRXNGFwRC8xb0xENXhRU3FLampw?=
 =?utf-8?B?akJlcDJ5d2I4cGZNTnpvcXlYQkxnNzVaamlIYzg1NCs3VTRNcWJwRC9QUHRq?=
 =?utf-8?B?ejVYa0xwTGdtelE2ZjQwME0xTGhYaHA4MXVXNEM2Q3R1NlB3eEIxdnU3VlpB?=
 =?utf-8?B?N3RxVEpQZmxYblkyaEpWcXIzdGJhYkgybHRZRndabkJmYVhRUXJpZndHTWdN?=
 =?utf-8?B?NllPQTFsLzU1NzVrNDlaZGNiNzJkdjB5Z0FrQ3FqMk16R2FJdzBFaDNwSC9t?=
 =?utf-8?B?SExvNmR6cG9Kd0VFNk00L1gvYStwODVJUGdkOTUwZmVacjFUMk5Ccm5SNmFQ?=
 =?utf-8?B?T0MwQ2ptN1FYb1VRQzRWVW9IUjh5UWdhNzdJQ1ZiQjRtZXZMQ2pZVmROOEpY?=
 =?utf-8?Q?v5u4ZQnIWVrPOSWr9ExjS580P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BC60AFE2375DD44BD85610CB2DCDF70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o0xcz43oquME8GS4lR6hD7rbzRugnSgpb6LzUy/qtzDFqaz3WhbdnbFyZqtgxMvf0Dq/HSq9n8y+/EUDRCekyPSDMLxBxASUYCiGvXVY9//sandEfYFVxTb5KgomZVMLU+Gojz8yhJVqNfM/bmClrcRoTba0j4CPnDKoDxzq6OvyGejlG59hF9UV5d385bM0TgWj00VvxuVc8/sosgiLjS64Vq+MNTqo1BAWjClkRU2vIcX7UJFZnw5561GL1gWA4U+JygBQj66QDbi8a6zU+7wPlkruNaZxvHF9WFYUI9XqSnRU0silm39t+T5Jl6WTF5RYA3RRt995ITAjJXFQscNxKtVgMe7+p/c0hmKh5MMelTyGP4Ec2tUczhmGe6wRqPi79w0V1TFFA+aW8vxFMgWQ2rQFk3RWH2FYOxDh6RTajX7EHN39yP3jpc8J97Yv3/gSUrt5XutxqRI1SQWWjO3hxC+/quPCcxIae0fhvZANeH6f5cphuBmldzNUjnthqpxiIdhJZYEnijeTn0LR3wZp84kBq9cYEtBL2pKiwUCHwWfNN+EZ5bgJNk3sGsSZed/Wy59NSgLQeSwweoGrMm+isXpUMGya812wvC2eLtYP9kHLnMClUGM48qqe3mPsW2hFHWsrcgT2GbcAgBDtiQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1eeba3-a606-4a8b-ac75-08dd8387ea82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 23:29:53.4687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kimP0S1xqq5qlwgcT+M7+MT/VdF08QAXpC6OZw+SjsRBT65pjF1q1aFbD6mygtx8Oigqgn1c2Gpi/douUoG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
X-Authority-Analysis: v=2.4 cv=Ov5Pyz/t c=1 sm=1 tr=0 ts=680ac97a cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=J13qTDL3ETxfpuM5UYIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: my2X4PGRwoBGXpYKxCR4YTqw83XFBJAh
X-Proofpoint-ORIG-GUID: my2X4PGRwoBGXpYKxCR4YTqw83XFBJAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NiBTYWx0ZWRfX0d8daN7NlJx1 YBD4L6JQ7HSAN2Un6CSGW3Mweg+0ljJ+2PVA8CMDNKHGFqDAeWFGQ9EOaNJCdnG7Fb9zon2n2yF OAngfB+vIv0KEUhovfN17IRvQ5e8hPZjxdOinU44I9wpQLXNSuSzzAXFRVBU4K8fvg/XiIsWDNQ
 9wW5ymTC7ONrxNvZK6x7X0aAUZ2Hf5Mf7wFSlYzuo4QogeJTn/UKDKbBREcu7wW6hkgLh65tjiU 0qCT+O1qjKJC4v8L5AG00K9+7+Y3vlb5OwXJpYsAJWlEP1s8VNcZRTgTb643uqPV4dg2q5cRYH7 3+Zg6Bn1OLVMCy8uquCOmpvmtVGyW+aIayi4DidlL0Q1yylJTWm/lDzGVHDRC46EFtcF5f8Rle2
 FLHJ6RYlNzdCaheyvOPdQWAzCJ0OWJxTb0mbHGKNOGzYp0p6Grw8wG57V0BG5oZmf1uCUqUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240166

T24gV2VkLCBBcHIgMjMsIDIwMjUsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IA0KPiBUaGUgdXNlIG9mIHRoZSBvbGQgU0VUX1NZ
U1RFTV9TTEVFUF9QTV9PUFMvU0VUX1JVTlRJTUVfUE1fT1BTIG1hY3Jvcw0KPiB3aXRob3V0IF9f
bWF5YmVfdW51c2VkIGFubm90YXRpb25zIGNhdXNlcyB3YXJuaW5ncyB3aGVuIGJ1aWxkIHRlc3Rp
bmcNCj4gd2l0aG91dCBDT05GSUdfUE06DQo+IA0KPiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jOjQyMToxMjogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnZHdjM19xY29tX3N1c3BlbmQnIFst
V2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQ0KPiAgIDQyMSB8IHN0YXRpYyBpbnQgZHdjM19xY29t
X3N1c3BlbmQoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgYm9vbCB3YWtldXApDQo+ICAgICAgIHwg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jOjQ1NzoxMjogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnZHdjM19xY29tX3Jlc3VtZScgWy1X
ZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dDQo+ICAgNDU3IHwgc3RhdGljIGludCBkd2MzX3Fjb21f
cmVzdW1lKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiANCj4gQ2hhbmdl
IHRoZXNlIHRvIHRoZSBtb2Rlcm4gU1lTVEVNX1NMRUVQX1BNX09QUy9SVU5USU1FX1BNX09QUy9w
bV9wdHINCj4gbWFjcm9zLCB3aGljaCBhdm9pZHMgdGhlIHdhcm5pbmdzIGFuZCBpbXByb3ZlcyBy
ZWFkYWJpbGl0eSBhdCB0aGUgc2FtZQ0KPiB0aW1lLg0KPiANCj4gRml4ZXM6IDE4ODFhMzJmZTE0
ZCAoInVzYjogZHdjMzogcWNvbTogVHJhbnNpdGlvbiB0byBmbGF0dGVuZWQgbW9kZWwiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCAxNyArKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1xY29tLmMNCj4gaW5kZXggZDUxMjAwMmUxZTg4Li5jYmJhMTE1ODljZDAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLXFjb20uYw0KPiBAQCAtODMyLDcgKzgzMiw2IEBAIHN0YXRpYyB2b2lkIGR3YzNf
cWNvbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXNldF9jb250
cm9sX2Fzc2VydChxY29tLT5yZXNldHMpOw0KPiAgfQ0KPiAgDQo+IC0jaWZkZWYgQ09ORklHX1BN
X1NMRUVQDQo+ICBzdGF0aWMgaW50IGR3YzNfcWNvbV9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGV2X2dldF9kcnZkYXRhKGRldik7
DQo+IEBAIC04ODYsMTIgKzg4NSw3IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3ByZXBhcmUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiAgDQo+ICAJcmV0dXJuIGR3YzNfcG1fcHJlcGFyZShkd2MpOw0K
PiAgfQ0KPiAtI2Vsc2UNCj4gLSNkZWZpbmUgZHdjM19xY29tX2NvbXBsZXRlIE5VTEwNCj4gLSNk
ZWZpbmUgZHdjM19xY29tX3ByZXBhcmUgTlVMTA0KPiAtI2VuZGlmIC8qIENPTkZJR19QTV9TTEVF
UCAqLw0KPiAgDQo+IC0jaWZkZWYgQ09ORklHX1BNDQo+ICBzdGF0aWMgaW50IGR3YzNfcWNvbV9y
dW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2Mz
ICpkd2MgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gQEAgLTkyMiwxNCArOTE2LDEzIEBAIHN0
YXRpYyBpbnQgZHdjM19xY29tX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7
DQo+ICAJcmV0dXJuIGR3YzNfcnVudGltZV9pZGxlKGRldl9nZXRfZHJ2ZGF0YShkZXYpKTsNCj4g
IH0NCj4gLSNlbmRpZiAvKiBDT05GSUdfUE0gKi8NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkZXZfcG1fb3BzIGR3YzNfcWNvbV9kZXZfcG1fb3BzID0gew0KPiAtCVNFVF9TWVNURU1fU0xF
RVBfUE1fT1BTKGR3YzNfcWNvbV9wbV9zdXNwZW5kLCBkd2MzX3Fjb21fcG1fcmVzdW1lKQ0KPiAt
CVNFVF9SVU5USU1FX1BNX09QUyhkd2MzX3Fjb21fcnVudGltZV9zdXNwZW5kLCBkd2MzX3Fjb21f
cnVudGltZV9yZXN1bWUsDQo+ICsJU1lTVEVNX1NMRUVQX1BNX09QUyhkd2MzX3Fjb21fcG1fc3Vz
cGVuZCwgZHdjM19xY29tX3BtX3Jlc3VtZSkNCj4gKwlSVU5USU1FX1BNX09QUyhkd2MzX3Fjb21f
cnVudGltZV9zdXNwZW5kLCBkd2MzX3Fjb21fcnVudGltZV9yZXN1bWUsDQo+ICAJCQkgICBkd2Mz
X3Fjb21fcnVudGltZV9pZGxlKQ0KDQpNaW5vciBuaXQ6IGNhbiB5b3UgZml4IHRoZSBhbGlnbm1l
bnQuIEVpdGhlciBhbGlnbiBpdCB0byB0aGUgcGFyZW4gYWJvdmUNCm9yIGp1c3QgdXNlIHRhYnMu
DQoNCllvdSBjYW4gYWRkIHRoaXMgb24gdGhlIG5leHQgdmVyc2lvbjoNCg0KQWNrZWQtYnk6IFRo
aW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg0KPiAtCS5jb21wbGV0ZSA9IGR3YzNfcWNvbV9jb21wbGV0ZSwNCj4gLQkucHJlcGFyZSA9IGR3
YzNfcWNvbV9wcmVwYXJlLA0KPiArCS5jb21wbGV0ZSA9IHBtX3NsZWVwX3B0cihkd2MzX3Fjb21f
Y29tcGxldGUpLA0KPiArCS5wcmVwYXJlID0gcG1fc2xlZXBfcHRyKGR3YzNfcWNvbV9wcmVwYXJl
KSwNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNf
cWNvbV9vZl9tYXRjaFtdID0gew0KPiBAQCAtOTQzLDcgKzkzNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGR3YzNfcWNvbV9kcml2ZXIgPSB7DQo+ICAJLnJlbW92ZQkJPSBkd2Mz
X3Fjb21fcmVtb3ZlLA0KPiAgCS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJkd2MzLXFjb20i
LA0KPiAtCQkucG0JPSAmZHdjM19xY29tX2Rldl9wbV9vcHMsDQo+ICsJCS5wbQk9IHBtX3B0cigm
ZHdjM19xY29tX2Rldl9wbV9vcHMpLA0KPiAgCQkub2ZfbWF0Y2hfdGFibGUJPSBkd2MzX3Fjb21f
b2ZfbWF0Y2gsDQo+ICAJfSwNCj4gIH07DQo+IC0tIA0KPiAyLjM5LjUNCj4g

