Return-Path: <linux-arm-msm+bounces-52241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EBA6C561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 22:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BDB07A3F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 21:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5652A22E412;
	Fri, 21 Mar 2025 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UsBkFNq0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Br8phIIs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nUEPplUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6928E7;
	Fri, 21 Mar 2025 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593671; cv=fail; b=s1nEuE1Z8FFeYtxypDZIKEJCCvGjhg4LqhHRdfk3VbmdZD7L+VUcIe5N+mPyPRHEhMpLWJTbpPLkVcny+9B7D3tJRgNv7wVAknNJXe8BGKv2T65/BNkxqF3/mK3BEi9+izlPrN0tIpQve2R4LQ6g8rbgZMNmljCDnpzz+qOO4+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593671; c=relaxed/simple;
	bh=0OPL73uiLfvZBu7LjFbSdZAOeOMyKrDTZbmQF6/QtuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PGSJrvh2K5lG6Oka/1zUgg7knPaMbSjfnQb4jkFWmRdFk6Pk+X20oC7vjDypc18sIDeVQJYg6mb5OobUI2/KFVPG5f7beg4TNh0bOmVlyhcc+94ZIXsUxX31Z3N3WnfCjkiRQpnzQ2oZDj/aG4Z4Q9APP5ILvD0NF6+TYzLF76c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UsBkFNq0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Br8phIIs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nUEPplUb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LJeuiZ022048;
	Fri, 21 Mar 2025 14:47:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0OPL73uiLfvZBu7LjFbSdZAOeOMyKrDTZbmQF6/QtuQ=; b=
	UsBkFNq0Wt4gEOTZbnGeY95BG1uDcC7Y7GGYO9QRNfmpozeBG5pureVHL/WWJvwv
	Yfu6ikouODSBSMwrmRdcrex4KNL0ZmR9VWlXr775ST15vW2ao/GVhMeAjdv4xtJs
	UsohONONejS/+qeKjxWeBRqKttEvyHKCSjYRaSJp7DMSVdIUOJhdP3TEiAMsgKnP
	RShMcGPJSO+oeGnBQCGJwurQrAxG3XDphd91f9aKs0xh5IR0KqjPf6LBC0qbbf4O
	qbgKbtcELKuwryHiKklVuuU8/CDeq1MvUWDmXlW5M4OYAeMxGuS2O2BtNxog66SC
	00QFh7S8yKyhqzvC7M8uiQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 45gu77e9ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1742593649; bh=0OPL73uiLfvZBu7LjFbSdZAOeOMyKrDTZbmQF6/QtuQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Br8phIIsbNyszyqDqDtFsx/oOSyVKkOYORQzv4rbPU0olzAVZSf3WgZArC0VgBPR3
	 UHRH9dY/PaN3pC5LyaPVCLscmxvgnDcDtHQxl4Ll2aBAP5KAEnl70UHlW91tcMs7O+
	 krkSGtumNeyyDM1cUVSL87VXFMkazYBfS7KV9WE/v3IwtHZ9XlVxu40obTuBn0GzAK
	 Je6kRpw0+dvnLL2AFs6iYhujyoO1CubsILOtxuH/dTXghQlI17mIBNOMjewc0HTErI
	 yrQMAKn6vOIxht/F0H26ODv+b5fKe8THa7c56JP14WpHI1va7AHZ2NNVNcZItbK2wT
	 4HaGuv7IDUeBw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E32D340352;
	Fri, 21 Mar 2025 21:47:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E3AE4A009C;
	Fri, 21 Mar 2025 21:47:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nUEPplUb;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 974A24041E;
	Fri, 21 Mar 2025 21:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNPD25vB+vbir1FBSSjijRQQnMXMU/SgWxPXEaeXmDmFHj0Ji2fWBCY7pHzv/JaOp1jEA6Cqva60yWdyLT6C5PXEKch+S7Ce8MiXPCdhlXR6JBwm/D3YQ6nD1lxY8CE+b26LLY7zxlM6cJXc7H7bVQm7sURxfqkXMmJR+XxTeuhSabAh3FU92SWN5ImWlLtY/G0A70jYCBCBmgyjj3E6vgeygN6HOTjZEHNbM9RU2pCkao/59x8EEqT6IO5lgaDBthFBzBQ8AYug5cbdNaa8d5fzETVlNxWfJjlr3tEZyLah1XNOZdAsNKZ6mnBtUOTlq/14/DwIhCTrT0bV69vg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OPL73uiLfvZBu7LjFbSdZAOeOMyKrDTZbmQF6/QtuQ=;
 b=H4etIh4COfwEiz/jN0ojG5JimHmSBWiDf+x3g5N3wFsdVzR/n53fUu2bL9flel12ZpxyjAn0D0o1s+wPH8tR2cpXgliBoscspIVfjtL/DDxKHvuIE5xlxi0EdZk+Q50VW04mIU+mD/Y+Es1x8/dXa++dMKsC+E1wRGiW8CNRyfgdP5022Tn7F1LPRFeBo7nqfSQZkkLUYBR8sEHlAY5BjqmgPuJH7E7YFlCs0TsRqLORZ+Fl40McaOvy4+FfNsmrysNh8xpaj1ub/nwqLAnz0n4q8Estqq0n0CuJmzjsQDYCPtjQTP2AhQPFja+Fnubz78llsA2eSgW7Wkm9O9zuPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OPL73uiLfvZBu7LjFbSdZAOeOMyKrDTZbmQF6/QtuQ=;
 b=nUEPplUbd6cQ+huKo1iy++FjQzcQ4JvQuUZrKVxidsaPe5zl/uAdPcQ0G2IpFBxN1zKj/nXVNkj5NYT31L0jvXPA3TLc2cdEcNuBaFR7VGtSmcUFbNsihFykHDydfhbWE6h6Ds8ey+btTAMWOuap0qcI58FdcRfwKMGXH4prF2k=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 21:47:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 21:47:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHbmDiyvRFLaPQedUONnlGB97QambN+JTSA
Date: Fri, 21 Mar 2025 21:47:22 +0000
Message-ID: <20250321214721.6ceqttt5kbycz5zw@synopsys.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-4-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-4-90ea6e5b3ba4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8302:EE_
x-ms-office365-filtering-correlation-id: 6fb0bb0f-79f9-4191-612a-08dd68c1f661
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzZtd2VoQnlFeHp2cEh4L2dZSnIwdXY3UFptNnc5aGVSZlZMZ3dNaXlLMlZu?=
 =?utf-8?B?Tk5OU0UraWpRRHdISWNoZkRVaTU4Sy9ZUHRYTjkrc29IUVV6TFU5SWVsU2w5?=
 =?utf-8?B?c01sR3ZjaGx1UmtYU0tMZlpQa2tXRWdpQlo5aSszRHpFbVIvN0NiUWE4SDRV?=
 =?utf-8?B?VG5NQXBweWt6bDNMckRoYVRieCtodG5HQVpaRUc3QW80aUw2VDNtVlp5NmtN?=
 =?utf-8?B?Q3lvZkNMVkU4a0FLL1o3cTZ0aGNZRHlqOEV2b0M1UldtK2o4RXpnV1gyTUNR?=
 =?utf-8?B?cFJ2K2xkVnlHaWlCdytDL0pscGpwcS95MHlqWmJxZHV4ZExBTVcwSGR3UGpv?=
 =?utf-8?B?My9EbEFDT1AxejR2RURQazFzN0UxNGsvS1l2UlNvMnh0Q3NxbTBacWFrK0l6?=
 =?utf-8?B?NlVxbndYZmtucGc1V3VCZ0FJQ0RsUHR2OHY4MTBkWmgwOUdkcFBHbEhsRVVn?=
 =?utf-8?B?VHpDQmZqcmRHb0s0TnlSUTNTeEpIWnIzTUw5VklndTNDUEVsZy8wdUdjbkpH?=
 =?utf-8?B?M1JtY3lFbHhNeEFnQ2t3cHpGU3ovU1VEZTk0OVI5ZUE1NzY4eExPVU9JMXp1?=
 =?utf-8?B?OWJ0elg2TCttYjE0QTErcWxEa0c1MFY3WlFXalB6SmM0aEdBYzZPamlVYkFY?=
 =?utf-8?B?YWNONStxb1haUVJKaFFveWV2OGJqS2VwOUYrdnUxRHpTVVNNYVBVSWw4TEFz?=
 =?utf-8?B?Q3krcmdsU0FjcE5UaHNEc1dlRXRMZHU5NnkxaXdWMjBnd3JoQ0xWZXVsWExX?=
 =?utf-8?B?ajhHa1JBS2E2KzBMaGRaNlIvc1UvaGMyK1FOdkw4Z00yanRlYmxVaExJN2N1?=
 =?utf-8?B?VFR6Z2hlMjIzejBCN21vTS9veElOci9LQ1VGeDBOa25MMlcxTEVhWUZUeG8y?=
 =?utf-8?B?NnVSN1ZDVXd0ZitSOFp0dmx6bXBaWFNlejNVbGk1UllseEpqUmtva1dCWkoy?=
 =?utf-8?B?bEFoNnl2dUNOM0ZkeFdrVzZWNnlKbG81bkVoMkNTYWZ1RVNrTFN1aUgyelFn?=
 =?utf-8?B?OFRaclF5RDl3cmovVC9oUHpjTmpndXZlK002Ri9lejYrM0hhR1BzbkJKaXY1?=
 =?utf-8?B?dWd2cFd4MXZ2N0cvM2JCTkkvZWwvL0lENmxhZ0J0K3hLaDJ1OExNQ0VscVBo?=
 =?utf-8?B?THBsUTlhRHlCZzVPdy9qV1lxZ0NFQUxmS08rVjlDMWVrYXM4cFdVQWFBL2hK?=
 =?utf-8?B?M0RpbDFNVlU1b0JDbXFVVVdzL0s0RVdDSzNDOVpMQ1Y1ejcyTDJTaWZQeVU4?=
 =?utf-8?B?dDZPR0J6T0FFSDRrcyt0Ujlhb0NOSHJjdUNjbURDUWhrNHQwTTVpYVdtMFJ4?=
 =?utf-8?B?cHI2SmVrSzFpS3pTaVRoY0JJcEhncHBnWXhwRXh2UStDQ05JN29abVI1SUZa?=
 =?utf-8?B?K0RTR1BUbG01NXVSSll0QkJURkhIZEQyWjFiNnVoUUpWNkZxMVNuc0Q3ZWFP?=
 =?utf-8?B?cFZ6UDY2eXhuMVRoTXdHZkF5UDg4MU4veDV2S1B0b3pGTGV5Ty9VeWM0Ujl3?=
 =?utf-8?B?ZU0xZEZnZ2J2RjY4MkIxU0tBNXErUFdOQlJUYVcvbkpPcDlyZFE3UDg0Wkh3?=
 =?utf-8?B?a3Ixa0wyeTZ6bjVRRDMxT1Yyb0hFQnlocEtwbjFodGVQcFZCS0hzWDVwSkZC?=
 =?utf-8?B?ZTAwdVhGR3cwV25oWDBnWjRwdWhXbDhqaGF0Q1pSRktkeG1MTG15SHkzY2xu?=
 =?utf-8?B?QzNxaFJaTWwrTExlTGxqTmNNN2xad1RTeUZtYzBrTjJ1Sncvd2NYbjlyckYv?=
 =?utf-8?B?Q2pBMjY3N0RZRzdMUGp1N3kzbTRYMnM5WHZNcWJzbnhzY1BGNFRNeFVtdkl2?=
 =?utf-8?B?VDFQWjhPN0FSaFUvdks0UytKd0xzUTZubHgyNXBmZm01TmhuZjNueXgxbzIr?=
 =?utf-8?B?MGx2Z0p1eEUxenp0RllnZklYYThPSk1IOHE1OXB2SHNXLzRsOWZsZWRjR1pU?=
 =?utf-8?B?UVQ4aW5FV24xVndDcE9waFVHWmxsbVh0bHExd25Nc1VERTg4U01oaUNISXFU?=
 =?utf-8?Q?YwLvRyUeFa9S2z2IuqumtSK4Os12tQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0ZIWklDeWh2M1I3QXlBdGVCZEd6UXE2ZStocy8vRk92MldVTXlyMzA4cEVl?=
 =?utf-8?B?V3cvdkppaUN1c2FNWVFRUFFlUzhMUlZjcHkyY05Kb2QrbWw5clFraWRXRUtQ?=
 =?utf-8?B?ZlFpMEhmWkdjQXNYQThVMUxkNWM1ZnVsQ01IK2dCczNsSzkvTEpTcG04WkR4?=
 =?utf-8?B?U0gwT2lwNWRFd01SMzdrVGhDR3FBTUpDWURySzR3WlpSVUFoMXV2VS80N2JJ?=
 =?utf-8?B?L1I5eFppOTJvSElRbUVpaWNjVy9iQW9VTHhJaWtZNHVIMlJTWU5oTUcweE1R?=
 =?utf-8?B?Wlo3R0p1U0dzZlVYWExwbHpUOVlVTnFtU2wxQ21VcU40RXYzVlp5aFVDTnhE?=
 =?utf-8?B?V2cwZm95VTNWYWtadVNmVW1qZ0FLbVIwM3pTVnZoQ1I4WXdENWVvNklyejJF?=
 =?utf-8?B?VU96cnVzMklDWldnS1hOQTdoZVNuR2x0RHZ3MlVkUjFVZjRvVTZMMXJwOVM1?=
 =?utf-8?B?VnEzRitNZnBhWGd3TStWR3hHQjRObms1NVVuQjFOalViV25uVFg4ekc5ZTNF?=
 =?utf-8?B?Zjl2cGpiRUNYWmQyelhJSWNqck9BNjljdHc2VzNCZmxSZ0Q1R2l5NDZzbXpY?=
 =?utf-8?B?RjBwcExWMkhCYmU5SUdMZ3R5RW8vN2NJWlFsVnY5b2F2Q09DU254blpKTFND?=
 =?utf-8?B?aDdKVThvT0F6VTM0Rjc4RXpjck5xa2hMYXlodFBBSk5ZdlA0bDc4SFMrbzl4?=
 =?utf-8?B?OGJjN2srQXZFYmxqUlI5OUQ5T1ByNm02TEdTWlUzU3VyckJGR1FjVDZrMnV3?=
 =?utf-8?B?d1JzTWRnRy83ZTBETHFvc1E2MHVqRFZNblVXeUd1RkxkemdEN1BUVndpdFFS?=
 =?utf-8?B?cVppaEVwcGNvMzVxbktldzVaV1d2c1FjUzFZSTh3SUNBaFNVeU5VdEh4bkQy?=
 =?utf-8?B?YlBoYWpMYWZpc3VKTTVOS29ObnFkMUVJR3c5Q09HOXlYcDhjOEZKOHUwN0t1?=
 =?utf-8?B?WG5QenpzTWorWnRNSUVYUisySGprYSszOTlSdG0yQlhLdUtlQXZocDB2Tjdm?=
 =?utf-8?B?cGJ1K2FNb3FmWWpEenFacWdUWVNPOENOUGNPMDRMSWhOaHpVc0pzT005Yysx?=
 =?utf-8?B?Uld1aXg4d1hSRnNTS1c2a3EraE1DelB3eWZZanlEOERFWlc4cGNnYW4zOEwr?=
 =?utf-8?B?Y1dVNVJlYnI5M25EWFR2b1FDVG9TMVcvTmUxeDQwbzVuRERBSElTYXJWeU85?=
 =?utf-8?B?Z292d2dlZ3FsMHNoYjBXcEZ4QVVOdlE2WDgzMXk3ZGRlUVJHdWJhZ0hjdExS?=
 =?utf-8?B?Y3Qxc01UUTlGUTNHSGVUaTlCRTFLdExLUGdQeGtJMWdSKzBqZExOdW5yNUhm?=
 =?utf-8?B?T0hvRzJFK284bWlCbG4zRDJ1MDFBS1Bzc1FoUW1idFN5MDREc2ZsQW1URElm?=
 =?utf-8?B?eXJ0cEtkU1RnOFJLUG02YjhSUjg4TzB1VGZTcnNXVUM1OHExVkxxVmZLaXM2?=
 =?utf-8?B?WnlZS28zUGFZZWN3aW4vWjFHUjdqL24rVHRwUE1PMXA0MTY5NVo1UVROVHhz?=
 =?utf-8?B?SXFOY1JIOHhpSmFXcEZTSlhMakJhWFNPRFMySTRpdkhxUUF3M3BiQWdQRGhC?=
 =?utf-8?B?NGE1ZFV3cGZNMmc2Sm1VSFVhN0ZSYXZla3N5eVNjU2ZqbFVuSVhLR2M1Nlh4?=
 =?utf-8?B?L3YrSlB0UVduREMweVhORXFJOU1lZ2pTT0JGK01kSGM5aHY1MEV2UDZ1aVJi?=
 =?utf-8?B?d2tDTTZDajJIRmxkMDZXVFlIeXRnQ0hpTW9tTVF2NUZQZ1FkWkN0Z2lmaUNv?=
 =?utf-8?B?RmJZZ2g5bjlRYk5HRVFFbEpPVXRIeWYybE0rbnh3Z242eGgrOFBxWFd3aEtG?=
 =?utf-8?B?R2VWcm9RZ2tvUHVXa2FLZVhsRDJYREZPckhjaVVMVEEvTTVpWENhQ2EzSm13?=
 =?utf-8?B?cHRZaWluSFJHeUpBelJSZ04vTnVJdThxN2VQaWRjOVJwWFk1cWUvSU9iaTgx?=
 =?utf-8?B?SWRSODZiSnVqUlR2WDJUbTYxYXRKTDlGVWZWQ2laT0E3QlZCK1I4NFRWQUh5?=
 =?utf-8?B?bnhFWjhrSm5YWldwenVBVGYva0xZd2NHWGtIMFdKYmIwQ1NWOXdEazlRWlV2?=
 =?utf-8?B?cE5QYkhtNWtCSmlpVTZPTjJIWXZqMnEwOUNnSTRCb2V3R1NOOEJhbTNMRGR4?=
 =?utf-8?Q?OaRp8f+rz3a6HftY3t0KOpk/i?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1215FCE8217AFA46802431931C1F7CBD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	czQl4wNE5nkVFoniOtP2er+CWtrlooxRACsykuzkvPoV/QTRTw4nLG/zl6OP6r7AStDM4x/h0IXONxIpHK9FyaVosOrmzYCFsvU+Nq6mQ16vsl/kboIxuXuZU+GV/OHQt1BBXYXG2sxhb3p4LYMJSTGiFm9vaENWiXYp90pgHS4sZrV94kNSE5nM+rXXVbrhKDEoJb9NzDe5IiDRFEMZbNjxhJ37WqMR2THy1JrS0FQRTdPKxw2dzb30sV1PEhyBq9gDlBhtnLyGLFT++CM4d2pI2bxOJf4zW+Q8g1tnhXWYzmwJwoFkja3alCU8Aarn3JBTr2ueoITEPm1Qjlg7IZkftXwngCoPRKlqdy8eJd3AWKddk+Ya0N5jGSQqyB4sMYu1NjrBaiyr8vmdp6sEsA/7xmY32Ly6lJ+RVKdsBhgjW9T9BOhl31f+TzJnyXVwWltniubpAnNt2BQSe4FVO8w/qkwSjSgbtkZaPPWSE1OfFc8AfxiiVFiOd3di812EHqBvgUeihzPbr8XK+iD/fJKnZaYi554eP9PR4HagOo5PBde6rC4eL3xIzgk2eMqJ0QR5wpe+pUpsdFyCkd+qNqyzzvohASG2IIHJcBIDSzDhZfNvOqYQtFHvtCy3jc3+zGlefZAXsjrL4DRWuUdaOA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb0bb0f-79f9-4191-612a-08dd68c1f661
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 21:47:22.7643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDqhMeDSqMYE6ezGp1hLFWoIQl0pJufPHEOxsqIFa6ZZf4YDxcQsme981l44tmySb2dijJrk4PaU8yob7xovHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302
X-Authority-Analysis: v=2.4 cv=RNKzH5i+ c=1 sm=1 tr=0 ts=67ddde72 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=qPHU084jO2kA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=1dH9oOfezxabTsPGZMAA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: UIbmJ7ZDQiQu_vS3HsVC61b8jFKJJbKp
X-Proofpoint-GUID: UIbmJ7ZDQiQu_vS3HsVC61b8jFKJJbKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210159

T24gVHVlLCBNYXIgMTgsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gV2hlbiB0aGUg
Y29yZSBpcyBpbnRlZ3JhdGVkIHdpdGggZ2x1ZSwgaXQncyByZWFzb25hYmxlIHRvIGFzc3VtZSB0
aGF0DQo+IHRoZSBnbHVlIGRyaXZlciB3aWxsIGhhdmUgdG8gdG91Y2ggdGhlIElQIGJlZm9yZS9h
ZnRlciB0aGUgY29yZSB0YWtlcw0KPiB0aGUgaGFyZHdhcmUgb3V0IGFuZCBpbnRvIHJlc2V0LiBB
cyBzdWNoIHRoZSBnbHVlIG11c3Qgb3duIHRoZXNlDQo+IHJlc291cmNlcyBhbmQgYmUgYWxsb3dl
ZCB0byB0dXJuIHRoZW0gb24vb2ZmIG91dHNpZGUgdGhlIGNvcmUncw0KPiBoYW5kbGluZy4NCj4g
DQo+IEFsbG93IHRoZSBwbGF0Zm9ybSBvciBnbHVlIGxheWVyIHRvIGluZGljYXRlIGlmIHRoZSBj
b3JlIGxvZ2ljIGZvcg0KPiBjbG9ja3MgYW5kIHJlc2V0cyBzaG91bGQgYmUgc2tpcHBlZCB0byBk
ZWFsIHdpdGggdGhpcy4NCj4gDQo+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25A
b3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDIw
ICsrKysrKysrKysrLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dsdWUuaCB8ICAzICsr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gaW5kZXggYjQyOGI2ZmMzZDBhNTU4MTFlMmY3NWQzM2Q3OWRmNGIwYzY3
ZGNhYy4uNzdhOTg0OGEwYWM3MGZiZTU2Mzk4OGNlY2JlNDg5MTMwOTg5YWFkYyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMNCj4gQEAgLTIxOTgsMTUgKzIxOTgsMTcgQEAgaW50IGR3YzNfY29yZV9wcm9iZShjb25z
dCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KPiAgCWlmIChJU19FUlIoZHdjLT51c2Jf
cHN5KSkNCj4gIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3Yy0+dXNiX3Bz
eSksICJjb3VsZG4ndCBnZXQgdXNiIHBvd2VyIHN1cHBseVxuIik7DQo+ICANCj4gLQlkd2MtPnJl
c2V0ID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9vcHRpb25hbF9zaGFyZWQoZGV2KTsN
Cj4gLQlpZiAoSVNfRVJSKGR3Yy0+cmVzZXQpKSB7DQo+IC0JCXJldCA9IFBUUl9FUlIoZHdjLT5y
ZXNldCk7DQo+IC0JCWdvdG8gZXJyX3B1dF9wc3k7DQo+IC0JfQ0KPiArCWlmICghZGF0YS0+aWdu
b3JlX2Nsb2Nrc19hbmRfcmVzZXRzKSB7DQo+ICsJCWR3Yy0+cmVzZXQgPSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfYXJyYXlfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYpOw0KPiArCQlpZiAoSVNfRVJSKGR3
Yy0+cmVzZXQpKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKGR3Yy0+cmVzZXQpOw0KPiArCQkJZ290
byBlcnJfcHV0X3BzeTsNCj4gKwkJfQ0KPiAgDQo+IC0JcmV0ID0gZHdjM19nZXRfY2xvY2tzKGR3
Yyk7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBlcnJfcHV0X3BzeTsNCj4gKwkJcmV0ID0gZHdj
M19nZXRfY2xvY2tzKGR3Yyk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlnb3RvIGVycl9wdXRfcHN5
Ow0KPiArCX0NCj4gIA0KPiAgCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHdjLT5yZXNl
dCk7DQo+ICAJaWYgKHJldCkNCj4gQEAgLTIzMjEsNyArMjMyMyw3IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGR3YzNfY29yZV9wcm9iZSk7DQo+ICANCj4gIHN0YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAtCXN0cnVjdCBkd2MzX3Byb2JlX2Rh
dGEgcHJvYmVfZGF0YTsNCj4gKwlzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhIHByb2JlX2RhdGEgPSB7
fTsNCj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gIAlzdHJ1Y3QgZHdjMyAqZHdjOw0KPiAg
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaCBiL2RyaXZlcnMvdXNiL2R3
YzMvZ2x1ZS5oDQo+IGluZGV4IGU3M2NmYzQ2NjAxMmYwNzIxNDI5MWFiZTU2NDU0OTM0YWIwMTQw
MTMuLjcwM2Q0MGMxODk1NjViMWUyOGFlMjhhZmI4NzI4Yjc4ZjRjZDJmY2EgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2x1
ZS5oDQo+IEBAIC0xMywxMCArMTMsMTMgQEANCj4gICAqIGR3YzNfcHJvYmVfZGF0YTogSW5pdGlh
bGl6YXRpb24gcGFyYW1ldGVycyBwYXNzZWQgdG8gZHdjM19jb3JlX3Byb2JlKCkNCj4gICAqIEBk
d2M6IFJlZmVyZW5jZSB0byBkd2MzIGNvbnRleHQgc3RydWN0dXJlDQo+ICAgKiBAcmVzOiByZXNv
dXJjZSBmb3IgdGhlIERXQzMgY29yZSBtbWlvIHJlZ2lvbg0KPiArICogQGlnbm9yZV9jbG9ja3Nf
YW5kX3Jlc2V0czogY2xvY2tzIGFuZCByZXNldHMgZGVmaW5lZCBmb3IgdGhlIGRldmljZSBzaG91
bGQNCj4gKyAqCQliZSBpZ25vcmVkIGJ5IHRoZSBEV0MzIGNvcmUsIGFzIHRoZXkgYXJlIG1hbmFn
ZWQgYnkgdGhlIGdsdWUNCj4gICAqLw0KPiAgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSB7DQo+ICAJ
c3RydWN0IGR3YzMgKmR3YzsNCj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gKwlib29sIGln
bm9yZV9jbG9ja3NfYW5kX3Jlc2V0czsNCj4gIH07DQo+ICANCj4gIGludCBkd2MzX2NvcmVfcHJv
YmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSk7DQo+IA0KPiAtLSANCj4gMi40
OC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpUaGFua3MsDQpUaGluaA==

