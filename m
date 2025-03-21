Return-Path: <linux-arm-msm+bounces-52244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90409A6C579
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 22:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9535188778F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 21:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09F0231C9F;
	Fri, 21 Mar 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fzthbml3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZkQNToyX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XzWbMk9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C328E7;
	Fri, 21 Mar 2025 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742594010; cv=fail; b=UcGCG8ERlmYry2Dc81UzXRwvG/xelCg215xZaNz7+7dpbdKRUzAX/4fDr2JrnGMfMEFIGHW8v4hUgb2tP8o/BmKmY0+4T3DC8PB8vrAUv4pcxcRdMUyyM2e3pGBkiwrAjlHvH/BYSJ8ThtSlO/0VnIxgpo3Q7MfCTZnchBiDFww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742594010; c=relaxed/simple;
	bh=TSFad01sK1hp0/plBmr7FA4cV+rR/Sg8Vb7yn4AbD2Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mik5s84fjW3NA2Z+uCOpnMv/u73H3j17gM9Nn3w+vuBRoVy4nUz2L1j8wUI9HwrQYPAj7wIMAzf+zI29EuTDUaAjnrBfWeSXAancO1Wm8seY3jwl/nU8AcXyoH9wTpC2ZGMdxu8xh3z2AlHQPo7W7iuhGd2UQ6ZO20XEUPZSKeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fzthbml3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZkQNToyX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XzWbMk9N reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LJerhE015250;
	Fri, 21 Mar 2025 14:53:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=TSFad01sK1hp0/plBmr7FA4cV+rR/Sg8Vb7yn4AbD2Y=; b=
	fzthbml3bbCrmQUUzPc8S5SfNPyuwsN8qtC4jqXJeER5SopOv6jRwmgMNlMwpluS
	sVa75OngMGtn/QY8GOEMeFmv1IqXvOAKPTENm2O+dXHVP7WueDE2djkVxUBN5qxO
	fwvP6vzvWFHuK9Nv9WkCs+BRh9xXThb82PYQeestcj9m8CQYHPY/RceBS+/bq42a
	S00+THa/GhjnMqetEXog3Uzh2mt8yTVTzclkv3fxdK72HD3w9KsS90C2SZMqjbq4
	FHxio/hneNan6G73dVbKJlbdFh5ivcQ1twYuAkXCqT8cDHrmGDiRjGUQ88kRQ+l/
	JjDz9yD4xOvvoubclPcM1A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45fyyhyra2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1742593983; bh=TSFad01sK1hp0/plBmr7FA4cV+rR/Sg8Vb7yn4AbD2Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZkQNToyXWOei8pK7J3+N6lgOTnV1vR0wwHxG0H8ZsoysyLfpBtgTRrBeY3zN+sx8A
	 ytgCliiPbAaLW9dUb8NXNLWE/gYe4dlihxFqEKT1j9uRrQYHnEtxr282WWdaGP4oNO
	 420iTI+B3v6D/0s/WieVc2scfvMbD6eMw28fGUUTsgJJKbCqp4UDCaYHutO00aE9+Y
	 1oqVqXhM0CS5zJ+6LhxrKUjd3fJxMX02HTwLcafTG539KWTUktt9b2fcapchPC97Uz
	 m00IA9WlFmV/lbXfmiXZXbBx/h1kwqYWsgsYBAbvXSo4s+cf1RjKwmGU5ZawEspvyx
	 i1VKg6lfA9Naw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9782940352;
	Fri, 21 Mar 2025 21:53:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 81096A009C;
	Fri, 21 Mar 2025 21:53:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XzWbMk9N;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 039704041E;
	Fri, 21 Mar 2025 21:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqz+WVlkd4YL/CFu0qpTyQ7MyMQe1OQwr/rieQPYodKDEkczj8KT8929AUfo/Dulfu9GkPsC58czpe1KmMM1S7K3V8ZIs8Rb880sVuJYEOZjpN2gqyF6FpLLS98mxpGQa+3Q5YIRROZLev9PK0cw8scPue9JjEVfIA8NS80pqClyb0TttD+XlNe+pWg9E8uJRNxn5osM9v8hDAn0V0bz8wJ98X9gxlAj1Kllso1S/JgpgsPVkrZ5tkJAwBlhYv3xHJImaU9borDj89QiXTFTaskPZgFyZqAxLo5JtyozFXXdBJaVhPIpJdtMz2KYrToEfkuIcrmAOyeGeD00asEVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSFad01sK1hp0/plBmr7FA4cV+rR/Sg8Vb7yn4AbD2Y=;
 b=igMTzRrPheUbaZ35PyRPLSh1TD3OpMkDTN8n9cpr3rBf/1fLt7cVVdg4KohiX+lTmkVVoM2dBVuDMCbOcjDLfSbpJ1wiMYoAMDA5QQxIGXd7D10bFFPgGSvwjPkfveu5YrjpPKwi5DrEnLg5uNNt3MImrUR2VC90ggTmSaLV6TX5MGIysGPYTUQ4lUBypPNtUOqOXBe7lV2ZJu0AhObGtkumiXKooT3ZIB3ZI/y/uhQ7/gFaqd/xcdzh/ZfyZCQ9haCC0NSfJ1wZzHjOPoxgTyYThQ0yRS8uVZLZAM6VbzHIa/uF3Zovszb9adHa8NVw0elxiRT3f/3M2YtUBy0RRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSFad01sK1hp0/plBmr7FA4cV+rR/Sg8Vb7yn4AbD2Y=;
 b=XzWbMk9NUSWYHSePoB+VgJUCUQZm5TMnGP9hV23uO+AU9uGFOR5w2gAErG5lgeavE5Ka0BA6obI2QVxqri8erMdzEPNkrJ6KodvJM+JvJBoUhuzJcFjHQ8nc5PrNEt5rkLzhDKnQxBPV5s0HAarknT67Mz28M1WXxD6vfUwBWGk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 21:52:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 21:52:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: core: Don't touch resets and clocks
Thread-Topic: [PATCH v5 4/7] usb: dwc3: core: Don't touch resets and clocks
Thread-Index: AQHbmDiyvRFLaPQedUONnlGB97QambN6nX0AgAOJRAA=
Date: Fri, 21 Mar 2025 21:52:56 +0000
Message-ID: <20250321215254.hmchw64vafqu3joq@synopsys.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-4-90ea6e5b3ba4@oss.qualcomm.com>
 <bfba8edb-b1e9-4b9f-bf96-bcba35e0cd8f@linaro.org>
In-Reply-To: <bfba8edb-b1e9-4b9f-bf96-bcba35e0cd8f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB7579:EE_
x-ms-office365-filtering-correlation-id: 5dae75a2-0ae1-49fa-3cc0-08dd68c2bd8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzY1OE9tYjl0YW1lZWdSNmUraFQ0TjFtQWszZnF6Y2FRMkhzT0xHM3JHbUd6?=
 =?utf-8?B?MzdJNVdOdDJoTmhTVEpWdzBjQUdhZ0NhK1lVR2tsTmsyQ3RoSUxJWm4xb00w?=
 =?utf-8?B?a2MrR1pKdXBzejZCZmZaMlFWZmJWRWdISlQrMVpldWNXdlY3Z2d2N0F6Umht?=
 =?utf-8?B?QUlBOG5yUWNGT2l3NjU1VE5RdFdpSmJqNWdtRk8xbVVhTWpLV2dwTHNDYmJO?=
 =?utf-8?B?R0Q2eUhDUTNVRUhpMzAxTFBZamVqZXM3YlJPc0pzRTFBQ2d2dlZnM2hReEJu?=
 =?utf-8?B?VXV0YkFSaE56MndFT2w1aFMvUS9SYkZLY0xDajQ4RXBlY1BDM1FhcnVGd0tW?=
 =?utf-8?B?OElEUHZ1UFRQS1JlQ1Avd2kvbDU1VC9vSEZpZURNR29ITVA0OThUQlFqSUc3?=
 =?utf-8?B?UXcxZHY3VUhuV20xc0VHdGoweHkwNVFicmFJSWtKTklPbTZwNWxIdVB6QzUw?=
 =?utf-8?B?R1pCaVQxVHVrL2RUOXJmQVlnOVgxd3JNRmhkME05OVFtdDhmUXprOHZUS0RE?=
 =?utf-8?B?YkNYQ3Q3cERibkJTZ3ViT1cvNHRiczFmNGZIamNKWGVQREo5Z0dsbWNvTzd0?=
 =?utf-8?B?cUVWNTdUQzJaRUFBOU5aS3lneUIySUhkRno4QWdDaCswZS9rc2N6SmxKMGp4?=
 =?utf-8?B?ZEdhM3cvZXRpMkxoNEJNdTRYcndDYVVYU012cUZKVzRXMlhMcEZSdi82OWRE?=
 =?utf-8?B?cXZBWndheEh1amE1bVVhSzRSZDZGaER5MnNRTEZISmZrbVNVQ05udU5xOEJh?=
 =?utf-8?B?S1F4Y2NPNDE4SWZ2R0JiaG5hSWdwYlpmVXg4RUhTNUxqWjZlWk40NjRYRWVW?=
 =?utf-8?B?a1BzYzVsQ25qWVJxNG5kMnVieUIycHE1N05HVEFwbUJaMGQ1UjdDZmFndmVY?=
 =?utf-8?B?ZjFORldoWFlYRUFYc2dZcHFYY0dQdUNTOVIrSXRadSt0Ykc5STk2alVKY1dY?=
 =?utf-8?B?NG51cjJvTVpWUGo3MzEvK1lSOGFwRGlxT2MyZzZlSGtXMXpaT0grenB3eTJx?=
 =?utf-8?B?WW0vWHRNK1ZkcU90a0lRMUU4VWRqeHBWNXlpMWlKMTdyV1czRjZDcEZqOHBn?=
 =?utf-8?B?TU9GUnpOSnRPcGV0N2FQcWRpREJONWxQRXcxRzFmekM1eDc4QW00dnF3OURB?=
 =?utf-8?B?aHhrQVZUWTFLT1pEL0dkS3R4d1ZhWXBaMDU2UUhTRlRkU3drSXpSWWFiRzRt?=
 =?utf-8?B?dTE1R1IzRUEvczZxYXJONWVSMndkZVpLNHg2U2FhUXVPTllMZi94WHVtYzVL?=
 =?utf-8?B?L1dFeEgwcXNPYjd6NmNHQ1hlS3RzV2Zhd3VoWVRLaWRidzF0bmdQdXBSUnhJ?=
 =?utf-8?B?N3o2RXlkd3hMdTFoUHA4QmpnS1V4NEFkRXdRalVWMXFKVjRLeGZJLzhneTNZ?=
 =?utf-8?B?YVk5Nkczb2hWSUxPVW5zS2RLYkVaUG9DdEN2VXJtT2ZydmNNUU4wd1BDNXpW?=
 =?utf-8?B?eXgyODlZZVNQYXpTWDVrTUYwMDVlY05Wam9SbUxOU3VGZWFJK012b1FUS0Ey?=
 =?utf-8?B?ZjJ2Vkp4aHV2eHlLNkVSZVZFdGx0RGprMVdoNWFmZmZkdDAvcnpDT1R4ZERo?=
 =?utf-8?B?dFJaZmVLVDFXaSt6L0ZkTklUaXVqYlkzQjR5ZGJ0WVBYVWFOdlIvcFB6VUxD?=
 =?utf-8?B?QTdNc2c3ZHlpOXdCWnNQQnpYNkRLNGlCMms3bHRta3RJcFdxZTBHOEdPbkda?=
 =?utf-8?B?d1dMU3JWTjV3eW9NNkR5VEc1U2dYQkJWd1BVMWRrWWY0UE84MlRyR1k4Y3Nr?=
 =?utf-8?B?a3pvd0w2VUFxOWw4S0Q2ME1vdlZ3OGpLcjNLVnNtaGhGVXgwN0tXTCtJU3JV?=
 =?utf-8?B?eUc2M0JlV3FETmlscFp5ZVVZOWVPMVZ2MHV6dThVOEZyK1JBeDZYK1VyVlR0?=
 =?utf-8?B?ZXRkL2Ezc0lveG5hQkFDS2Y4UStnbHRBaHYzSUcwZHpoV3dKV1Y5bmwybUN2?=
 =?utf-8?Q?Ng+Eqz0Ojb6AfuyFbzSSnaZj1IOjYCZC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUJpcTdGWnpIby9Xb01WOG55alVld3hwdUQrOXZ2dUpHakJXeGZXeXBBcVUr?=
 =?utf-8?B?OFlhcXhqSE8vRjc4NThrOUpwL3p2cENvZkJBQWNNOGd3Q09hbEFvWFE4dTVm?=
 =?utf-8?B?cSsrTVJMa3ZMOEQ1Q05vUTM4UHQxZGdTT0dzUXpmOGZwSkJxZ1VTb25zZ3Ny?=
 =?utf-8?B?c2g2Y3dHY1ZGNm9BaWxPalRUUjJJdzNSYWNtU3BlQ2RKYk42cVlqekN0TjU4?=
 =?utf-8?B?OVlSZFQ0ait5OE03NmZVdTBxUTB3QnYzRkp3bmxoY3lOcm45dXRuaVFGSXA1?=
 =?utf-8?B?SnpVcnhVNUg5eGlnNE5ib3lVZkFtSjZSMVY5VWl1UlNhb1R0RlhXZWllNUdH?=
 =?utf-8?B?SHc2eEpGTWU2VG9weURac2VkZUd1dHRJaGhFaFlZRVVzOGltdmZoTFBqV25V?=
 =?utf-8?B?Q1cyemtJVW9VV09iakZkVW9nV1dLc3V6VlZpa3VxRHJxaXBYenJob3IycmJL?=
 =?utf-8?B?RU8yUGJTVG16MDRNMk9YL3BER2cySGxhSm9VcnRodHhkTU9oRzd3a2hUM0lQ?=
 =?utf-8?B?VHVhcjgrUWdtR0NCMnVKQkFTMDA5SmhrS3NYUW5Jcm8rOXhxczY1VGY4TVlW?=
 =?utf-8?B?dGZtNkFoeEptYnduKzJRbWpOM3NLSEd5emxMd0o4dWdabmVuRjljVktMbHQ5?=
 =?utf-8?B?SmRIS09MNlYxUU4zMnhUaERqb0ZUbW5SNmtWZnpscHNzUEpaYWw4VW4yVDEz?=
 =?utf-8?B?Rkw3UnBRcXB4RmlrNkxBQVdEMS9xU2IxVWtFaWlXVytBOFlBYThTOHJIRkQ3?=
 =?utf-8?B?b0dVWDFQQnQ0alZGRkpaTTZqSTJpd0NzaCtoZUVneUphUnpYbktxeUkyUUpm?=
 =?utf-8?B?ZzAvakhvTnhOUUE3K3NjMk5Mc1M4ei9ONjd4MlVDNml0UEk3Y0NpdVYrVTRm?=
 =?utf-8?B?VDdCMGtpOUVYUkVRY0o4dFRqSzZGb093VDJEeldpaEpGeEx4eFFicDVkWG1W?=
 =?utf-8?B?V3NnZUJxVkxic3BsQ3hLMlZmaU5YL0pINlhoMkMzaTdDYTFDVDVyTHBQdWho?=
 =?utf-8?B?SldpN1hoWjg0dkxqZHRCQ0FpdWhONi9DMVFSenR0ZnJXZlN4SlFicmcyeDNU?=
 =?utf-8?B?V3ZuQnFZWjF5TEVpV0RvWmVRUDEwdGZXOEVRSXNHNGZDM3FqU2MzS3l1UWR5?=
 =?utf-8?B?N2c2b0tFOFRKaVlZZEZWQWN3Mlo2elBxajVhZ3F2d2RrdEJWdGxMbC91Tm1N?=
 =?utf-8?B?YU50NW5JeE5PMWcwcFFZSWhSQ2lWcFQ5ZFM4YXFoSnZ0aVJsb3pQRCsrVTk5?=
 =?utf-8?B?blJCaUlFM3doZmRJTkNLQ3pXMnJvb2hza2tlODNXWUVKakxNcVZ2eE9wa0Vl?=
 =?utf-8?B?bnNUOWhWTGlNRUs1RDM3d1lvcld5VkVKSm9PZVYrejJuNFFMMTgvVHM1ZHVB?=
 =?utf-8?B?a2tFK3RxY3ppVTJvYkVmWEJyNHdGRE40MmMxUVlXcnkrZTB6T3ZKTklwQXVE?=
 =?utf-8?B?YndIOFRCb2p6ZjJmZ29pL1Bsa3FaSWF0QjBHVE9HcVFOczY5ZzN2Z3paY0pV?=
 =?utf-8?B?S0N3TTAwaWN0bHJmZGJPaEhZOEtaV09pZFVKcTNjV1B3TE50QUR3Z3d1NlhH?=
 =?utf-8?B?clh5WThXM3BSaDlGaUpSLzcySUtsOUFGRGQ2QzFEY1RZdmhhbUFzRzkyYyta?=
 =?utf-8?B?Rnc1WFNIa1hJSVo2NFR6RXhpR1Fzc2pPZ2d0S0JaeVhwM1Q3dE1UbjNRZUp1?=
 =?utf-8?B?TlRHd1A0OVgrWFJLTVhZQmFIZHhaSEdwN2ZrZzJEMnNVY0hTTmV3MTM5akJi?=
 =?utf-8?B?N3RIUmplMTlIQm9YNzBCdG54TjJTWUh0MU5GUzBzcHNtKzRTbEhud0NtMGpn?=
 =?utf-8?B?RG9uaEFKTC9zU3dTbmpEcmVIMGFsOFdKVnd2RE8rZVgwVWRXNEM4WmtIaUlx?=
 =?utf-8?B?cFVuY2I0Q3loMytWWExTWllYUkx4ZXYzRXRHK1p5cjlOSWhMNGZsVTBRRXUw?=
 =?utf-8?B?V2J3cE8wb1h4ZFBTWVV5cDRTUnM3d1Z2TFg2Mkl6am9lbEMwM3N5dGVjT2hm?=
 =?utf-8?B?Q2NxMExmb1NtajFNRDNVbURhanM3YWlJOHR3RkdPMEpEdERrcmFBQTkxRFhL?=
 =?utf-8?B?dUZQOHU0cUt3UERkdWduSG40YUlDRCtucWJWTzFMQlkzS0xheGRhZStPY2VL?=
 =?utf-8?Q?o8e8j0pdvCYxw2u32nMC4QneF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3432248F174D3B4F81E9C57FD56D8427@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eFj5o8Aw7Bh8zBowbJ5z8fVAsNU+xCiM9dLz8m53XT6Cl5E+Jc2TdfmfpzElBi65kGSWKwgYD9j0nEerm+pLH4s65vyPvbQ0YbNaNHPVXjbaBXDtjYpUaQ50uQ79sCOmQd4jHcB6VAnRUR3cixPScimA0iTDQcsFXLZg9BzwVK869iB0VSpoLLOVj5f1NB5d5LMzN0oRQiRUWqFp/Tqnmlr+RxtlKSQtSmA2d/ca2fh4zjWCe841Yc2sLTbboj2IVDniexBqZCqEdlIq5cGArqqj6wRslMy1fLKVigwACkr6AYserYcM05Diq/Jbwt+DstnnMYlMySUXsxc960eRPTKhPRscMr1rkRF2seHbmNidaVkLaUtnM+139on7BUROHBkm/A7A3OUU5Rx4R17+EZbsP2JAgBmefAw0N1NxQ9W/MOZpDC+BY+iSFwbuMc6F56zInq9Eb0UQdQlpIPolBEDYaiJ9a4zTlGnssCqM6/QpdaME9OA3+lpZdERImDUrBVU6o2Nti6gs1M21638tLi8j2WUOex2MFW6z0NZ2Q9I0i/TTZaU68xAMK3On0PSx5tOTre7f3XWXnctIMoMVU3ykeujl1LBXgK/zktV9xnO09Wmp/MoP3VVxSb0djsImaD0y9zNWdwSEGP80kNjrgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dae75a2-0ae1-49fa-3cc0-08dd68c2bd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 21:52:56.9072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w02ifgUgKfHmJf4IMZXKLohGvY9HBaGwxK9fsdlPYvJo2Y01SMRdn82ysDKG6l7XNqvwzgWMTjDquxRQZqiciA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
X-Authority-Analysis: v=2.4 cv=Jaa8rVKV c=1 sm=1 tr=0 ts=67dddfc0 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=qPHU084jO2kA:10 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=G7qOEu26-S0oGouXZzsA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: EVmGJ1hJM2_7oVmo39dqX3CEN7qy9pAX
X-Proofpoint-GUID: EVmGJ1hJM2_7oVmo39dqX3CEN7qy9pAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210159

T24gV2VkLCBNYXIgMTksIDIwMjUsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6DQo+
IE9uIDE4LzAzLzIwMjUgMjA6MDUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gPiBXaGVuIHRo
ZSBjb3JlIGlzIGludGVncmF0ZWQgd2l0aCBnbHVlLCBpdCdzIHJlYXNvbmFibGUgdG8gYXNzdW1l
IHRoYXQNCj4gPiB0aGUgZ2x1ZSBkcml2ZXIgd2lsbCBoYXZlIHRvIHRvdWNoIHRoZSBJUCBiZWZv
cmUvYWZ0ZXIgdGhlIGNvcmUgdGFrZXMNCj4gPiB0aGUgaGFyZHdhcmUgb3V0IGFuZCBpbnRvIHJl
c2V0LiBBcyBzdWNoIHRoZSBnbHVlIG11c3Qgb3duIHRoZXNlDQo+ID4gcmVzb3VyY2VzIGFuZCBi
ZSBhbGxvd2VkIHRvIHR1cm4gdGhlbSBvbi9vZmYgb3V0c2lkZSB0aGUgY29yZSdzDQo+ID4gaGFu
ZGxpbmcuDQo+ID4gDQo+ID4gQWxsb3cgdGhlIHBsYXRmb3JtIG9yIGdsdWUgbGF5ZXIgdG8gaW5k
aWNhdGUgaWYgdGhlIGNvcmUgbG9naWMgZm9yDQo+ID4gY2xvY2tzIGFuZCByZXNldHMgc2hvdWxk
IGJlIHNraXBwZWQgdG8gZGVhbCB3aXRoIHRoaXMuDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IEZy
YW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVy
c3NvbiA8Ympvcm4uYW5kZXJzc29uQG9zcy5xdWFsY29tbS5jb20+DQo+ID4gLS0tDQo+ID4gICBk
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDIwICsrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gICBk
cml2ZXJzL3VzYi9kd2MzL2dsdWUuaCB8ICAzICsrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gaW5k
ZXggYjQyOGI2ZmMzZDBhNTU4MTFlMmY3NWQzM2Q3OWRmNGIwYzY3ZGNhYy4uNzdhOTg0OGEwYWM3
MGZiZTU2Mzk4OGNlY2JlNDg5MTMwOTg5YWFkYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gQEAg
LTIxOTgsMTUgKzIxOTgsMTcgQEAgaW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBzdHJ1Y3QgZHdj
M19wcm9iZV9kYXRhICpkYXRhKQ0KPiA+ICAgCWlmIChJU19FUlIoZHdjLT51c2JfcHN5KSkNCj4g
PiAgIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3Yy0+dXNiX3BzeSksICJj
b3VsZG4ndCBnZXQgdXNiIHBvd2VyIHN1cHBseVxuIik7DQo+ID4gLQlkd2MtPnJlc2V0ID0gZGV2
bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9vcHRpb25hbF9zaGFyZWQoZGV2KTsNCj4gPiAtCWlm
IChJU19FUlIoZHdjLT5yZXNldCkpIHsNCj4gPiAtCQlyZXQgPSBQVFJfRVJSKGR3Yy0+cmVzZXQp
Ow0KPiA+IC0JCWdvdG8gZXJyX3B1dF9wc3k7DQo+ID4gLQl9DQo+ID4gKwlpZiAoIWRhdGEtPmln
bm9yZV9jbG9ja3NfYW5kX3Jlc2V0cykgew0KPiA+ICsJCWR3Yy0+cmVzZXQgPSBkZXZtX3Jlc2V0
X2NvbnRyb2xfYXJyYXlfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYpOw0KPiA+ICsJCWlmIChJU19F
UlIoZHdjLT5yZXNldCkpIHsNCj4gPiArCQkJcmV0ID0gUFRSX0VSUihkd2MtPnJlc2V0KTsNCj4g
PiArCQkJZ290byBlcnJfcHV0X3BzeTsNCj4gPiArCQl9DQo+ID4gLQlyZXQgPSBkd2MzX2dldF9j
bG9ja3MoZHdjKTsNCj4gPiAtCWlmIChyZXQpDQo+ID4gLQkJZ290byBlcnJfcHV0X3BzeTsNCj4g
PiArCQlyZXQgPSBkd2MzX2dldF9jbG9ja3MoZHdjKTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJ
CQlnb3RvIGVycl9wdXRfcHN5Ow0KPiA+ICsJfQ0KPiA+ICAgCXJldCA9IHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoZHdjLT5yZXNldCk7DQo+ID4gICAJaWYgKHJldCkNCj4gPiBAQCAtMjMyMSw3ICsy
MzIzLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19jb3JlX3Byb2JlKTsNCj4gPiAgIHN0YXRp
YyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgew0K
PiA+IC0Jc3RydWN0IGR3YzNfcHJvYmVfZGF0YSBwcm9iZV9kYXRhOw0KPiA+ICsJc3RydWN0IGR3
YzNfcHJvYmVfZGF0YSBwcm9iZV9kYXRhID0ge307DQo+IA0KPiBUaGlzIHNob3VsZCBnbyBpbiB0
aGUgcHJldmlvdXMgcGF0Y2gNCj4gDQo+IE5laWwNCj4gDQoNClRoaXMgc2hvdWxkIGJlIGZpbmUg
dG8gYmUgaGVyZSBzaW5jZSBpdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSBmb3IgdGhlDQpwcmV2aW91
cyBwYXRjaC4NCg0KQlIsDQpUaGluaA0KDQoNCj4gPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsN
Cj4gPiAgIAlzdHJ1Y3QgZHdjMyAqZHdjOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2dsdWUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQo+ID4gaW5kZXggZTczY2ZjNDY2
MDEyZjA3MjE0MjkxYWJlNTY0NTQ5MzRhYjAxNDAxMy4uNzAzZDQwYzE4OTU2NWIxZTI4YWUyOGFm
Yjg3MjhiNzhmNGNkMmZjYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dsdWUu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQo+ID4gQEAgLTEzLDEwICsxMywx
MyBAQA0KPiA+ICAgICogZHdjM19wcm9iZV9kYXRhOiBJbml0aWFsaXphdGlvbiBwYXJhbWV0ZXJz
IHBhc3NlZCB0byBkd2MzX2NvcmVfcHJvYmUoKQ0KPiA+ICAgICogQGR3YzogUmVmZXJlbmNlIHRv
IGR3YzMgY29udGV4dCBzdHJ1Y3R1cmUNCj4gPiAgICAqIEByZXM6IHJlc291cmNlIGZvciB0aGUg
RFdDMyBjb3JlIG1taW8gcmVnaW9uDQo+ID4gKyAqIEBpZ25vcmVfY2xvY2tzX2FuZF9yZXNldHM6
IGNsb2NrcyBhbmQgcmVzZXRzIGRlZmluZWQgZm9yIHRoZSBkZXZpY2Ugc2hvdWxkDQo+ID4gKyAq
CQliZSBpZ25vcmVkIGJ5IHRoZSBEV0MzIGNvcmUsIGFzIHRoZXkgYXJlIG1hbmFnZWQgYnkgdGhl
IGdsdWUNCj4gPiAgICAqLw0KPiA+ICAgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSB7DQo+ID4gICAJ
c3RydWN0IGR3YzMgKmR3YzsNCj4gPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiArCWJv
b2wgaWdub3JlX2Nsb2Nrc19hbmRfcmVzZXRzOw0KPiA+ICAgfTsNCj4gPiAgIGludCBkd2MzX2Nv
cmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSk7DQo+ID4gDQo+IA==

