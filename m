Return-Path: <linux-arm-msm+bounces-45065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F407A116F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF599164565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE0922DF8C;
	Wed, 15 Jan 2025 01:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KLrQwdjr";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jTNnj4Gq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ya8xnQIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E423243D;
	Wed, 15 Jan 2025 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906234; cv=fail; b=Y2fP8BFxRYrwrHPSbh9mMeHi1Y24Wc9OZAjtfPeDTo/6Shr7rM1JqfMxS7PcUkq0hM36cK1HzutJ1zqGLDc54JHcUUBq0iO6zNGpfWGh8ohJzJscULcrhsr/5tpGnAbBxPsf7AcJDjtrxF+gyJOoBX/iTlICzDbFrMus1REGD14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906234; c=relaxed/simple;
	bh=kilNqCmTSZEHyUaQc3Gyg+Ekd198TwVZ+ZWYaKcz86w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hV0bxxKlqKtTpwmIEyAKWQVeX3mm62peUaoGIHyGtaayJiUCky7oCkHiWF+6wpop3OLXzl9AxNDVMv1OcTO5zh3+Wd4WjIXRZbzwId29fImY8pShg/tPnrR3wesGP6t9Hw4cXbdkj+Q5bLsGwofwpd0qxvm1u1jaQtOW3vYxGKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KLrQwdjr; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jTNnj4Gq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ya8xnQIk reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EN1n3H026029;
	Tue, 14 Jan 2025 17:56:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=kilNqCmTSZEHyUaQc3Gyg+Ekd198TwVZ+ZWYaKcz86w=; b=
	KLrQwdjrdNcdxeqPXBukubbjAgU0iUjc0BlrkjvCyfySnXBluTn83PNRwLvwnNgz
	T9qgErY46STJksOzuK3bTAc4lrxh7qpmXogN3oY86klRH3UU6TujMKj+un57Un6a
	O5Pj2qL4sh8MqcOSdMo0fCbXiTOZwGkmvsZIBVLwbv+1NZABp/fBoehy98/XOzLN
	XyM7BbUNumT8Ah0TemuB8xr9/AMm8M2nZt5xUwqpV1n3fowKEBqgHylcWUsP83aa
	tYQURUkobwHObVWW8OGCBbAFfZQA8cH5iK1rCcBcmwGVWB1AseV9cQmUagbclBSj
	XSmB7HcWQKteKuahEAsaMg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 446186rpcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 17:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736906205; bh=kilNqCmTSZEHyUaQc3Gyg+Ekd198TwVZ+ZWYaKcz86w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jTNnj4Gq/mD4hfDg3YR7ZMIvaw4cYSVZH9A0cqQDKMNbKQ9P+liMNeZFFIr0vgC00
	 uZ1z1ZCSCFBq5JOl0FURSpbnSjCaFFOQ2BZR+HtEcHmQsB+rxhp9t6PyKl92ESAemX
	 KnNv158iuVVyRH+QvrA5ToqXR3DvKnC4A8f4juKwq95CMyE3jtNQkVrLODVtrttmtp
	 2IvlhoZXRecCys1/4pvxCoR8plHHAQ0QjHDBpbwjvroVKnoVfrCdq82OYWz5fc7+OR
	 siJZU8AeoduicugclpLxs1jPVM17iKcPYV88lHFvQuG10JndHUMj3I4OkxlA2xDRyw
	 L4+O2I7H0hXmg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B98CE40351;
	Wed, 15 Jan 2025 01:56:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5BBAAA0066;
	Wed, 15 Jan 2025 01:56:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ya8xnQIk;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7DE7540137;
	Wed, 15 Jan 2025 01:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orasW6RTs+z6tzb0BagshAxCBTZFqrdPpJsFbkwyVz02xgDQvOQb3QtSCTSPLXMqWWcjlQv4wcqa462ysfPi+KovkoBmbsZTAL+QFbFahmQjoe/3t8K5Hh9ErQTMzsVwrou7pT0cQeyQeOIr1MjGsRoRlJTaJs5/4PUW8L/HtFqzy7LgXUrJLQPNnwSRl4rzscldMHFQ31wWLVxF8ABi76zc/tUeWmcmU/2hm6oPdFGSA/n/fXWY6uJRxqc01XcP4swUGPv31+TwssoRpK0T9CusOtyU/eTuje6gS/nSu3IlrlO2VfJtZk3NOyLkdEDC6CRs+IGI7KYIfDa2ya4W/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kilNqCmTSZEHyUaQc3Gyg+Ekd198TwVZ+ZWYaKcz86w=;
 b=Ie8PUAJMpoG3ypnt66mSqUaL/e0ynWIOrImTmIa6hzqYCTueic1f6QdTawRvvDxyZs+PHrUj4mfkUpF32PmcBXfxEMG9iMIUVGrfLrvbd8fNH/4lgyPwvsVTHjewjGO/PUVcJ0vHyqXRf5t6vRv4tU5NssfahqGa1hsySCky7ZdwxvugeKBC80QvqkeCFMnbWdaMKFzBL81HyPqkylwtFoQc+7hXDImhxopovk2PgbXHtTn17Wds1PYmE44BBxClHRKftoMuXphrcH7xDfmp/suEEXeY+pdS96aJ+1wYW/wB5IpB3ygAs3rdjoE+P7s8u0Wd9xRKRixtqCgVrJRi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kilNqCmTSZEHyUaQc3Gyg+Ekd198TwVZ+ZWYaKcz86w=;
 b=Ya8xnQIkjVZ8zwkElGBBeoH8uNCg72G3Geb584Ut5/G3f6Oyy1bjNPX4d0a2qGcHHI49DbXBIjoGsbrWjEpkGD2vltkZr4DO7ky+BjtW+8App00+ioy6CY1hVmQIYTCUrQRjv6GPQci70H/tYOD/JOUCGEIbWQUaYF3qA8qUN6Q=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 01:56:35 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 01:56:35 +0000
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
Thread-Index: AQHbZkINGLyiDhNxtUG7fDaOZUkU5bMWrMuAgAA1pYCAADJmAA==
Date: Wed, 15 Jan 2025 01:56:35 +0000
Message-ID: <20250115015622.xbop23ltcin6vysg@synopsys.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
 <Z4a+fyhInS7ETgKh@lizhi-Precision-Tower-5810>
 <3s77lvw4dp3cg2s6tqt63wuexft3pusfbg2ibteacnd5z2dolf@p7mb2j5j5jlz>
In-Reply-To: <3s77lvw4dp3cg2s6tqt63wuexft3pusfbg2ibteacnd5z2dolf@p7mb2j5j5jlz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6797:EE_
x-ms-office365-filtering-correlation-id: f9b00b1a-17ba-4ce5-44f8-08dd3507d7ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?djhwcnVJM05VQWZPNkx6OFdBZlo4WEROOXB4Z0U0YWJJVVlHZnZlYXhZd2d0?=
 =?utf-8?B?S1FFbnp0OTcyYkFlYWtFZ0F3SnFOUSt5RU9XQ1dERjdOT0J2K1NJVUdnd3hP?=
 =?utf-8?B?ZjZNQ0dIU3JJalNxSzBzWTFNQ1BMYytYdEczRW11RUc4VzlndzhzUlFzOWMw?=
 =?utf-8?B?TGJldURoOU8rbTAvQ1RTMWpxWGduL2hPTXVCN1VqcGJMZkhUbitHdW10MEhv?=
 =?utf-8?B?dmhVY1pUelFSMkhheXVhbkZCKzY3bnpHMFBXVXdXMG1GU2Q4bVpFamhpT292?=
 =?utf-8?B?SDNnWmVCQkVaWjlmWVJ1S0tMN0RmVDh1TkxsR0NtUGtaLzJ0cWJlOVpqbWti?=
 =?utf-8?B?dTg3Q2RFNmw3WndFczFjQk9JUXpWanhpNVUvYWNvemRqa05OMkhsaWswZlpM?=
 =?utf-8?B?NnAySy8yNE85RTZaOVNaV2FRZ2kvOFlUOXRqOURqMU8xQVIxd0MxTWxmOU9D?=
 =?utf-8?B?Z0tsaThEdHRwU0s3MU5tMmFaZE5ONlJoVnFHZXk0MmlMYlM2NUJGYjFOVkwz?=
 =?utf-8?B?S1NZWURIYXNpdm5iNitPWTNMOEtETTZlZm9kaVp0cFpLcXBFWEkydXJBSmNz?=
 =?utf-8?B?K1JYWU54M0ZUMHZtYTErazFFZFJ1V3djVVlaSXYxZjNJd2FHWFdDVW9QUlpa?=
 =?utf-8?B?eTR3YkMvbWV3dmxtWEZ2WUJsVmcyMHViRVdIU2JpOUNaUEUvb2owUG5BeW1Y?=
 =?utf-8?B?TVZERXgwQURCOXpvYmJwSnNIODh4azE3ZlBtWEgxa1ZWV1l2clMyTnJONktK?=
 =?utf-8?B?OHdMM0tXL1o0c0Q5S3RycTBrWm50MzFIZXdWei9YZTErWm5lZCtjVWdHdU5h?=
 =?utf-8?B?cXBaVjlmaFVxeHNMRUZsbTFqL0lZOFRha3RxY3hxZlFFaUtjTEZ0akV4d3pI?=
 =?utf-8?B?THRMVFoxZnVHc2hGU1h6SlZJbFkzUnFvVDlmbkFMdXUwbGJneEs0Z0w2aHBQ?=
 =?utf-8?B?OVhNWWFJT21HSEZuOGZhaWdDeGdXRG1pUHQ0bXZubFYvS2l5OXh3Z3hITit5?=
 =?utf-8?B?d0RaRm9DUE9IU3p2VzIzb0VJRk9oemxoMU1jQXdEZU1CUGVyTUNnZ2xlLzZn?=
 =?utf-8?B?SFZnLzBtVk8wRGNXSyt3Ykl4cDR1RTUzZlVoamUralJOUVp2Q2FNMFcyQVpH?=
 =?utf-8?B?NjRNMHpKZjBPVUFxbXFaMHBuZ0lZTUZjeFpuN0JxTEowVko3enhwaDl5VUds?=
 =?utf-8?B?c05WRVpDc05EZnFidmJrclNRdklOeUhtSTc2clNmbnZUcWdDSkJKbG5qZFFi?=
 =?utf-8?B?NXRVajBkcFcyYlJ2bW5mZWJDdlpJRGsxMTlCK1NqelR2dXhTSHRWLzFyQnlt?=
 =?utf-8?B?MG1QUjRFWk81STJ1VGpGQTFESUl3RTM1RWtndmdWRzZJQ3VkeUUxODZva3pr?=
 =?utf-8?B?R0xLcTl2dHZyWFVMdUs5ejEwQjBSYjVuTXpTaUs0VytQc0plYVVFdzF4R2xy?=
 =?utf-8?B?dUZGdkkvQVJrejBkRDVSVUFLanBXQWJIRnRwcDc4OWRZVWIzenQ4cUM5ejhW?=
 =?utf-8?B?K2FEclZyZThGU2tFQ3NTZGRUcmxEcXJocjl6M1c0bzI3QzlxZFRlTkpRNEF2?=
 =?utf-8?B?QXh4Z2p5dFEyK05ZNkhpaVNnb0tid29vekZLeWo5ME1JcExRbHNhRG5DUVFW?=
 =?utf-8?B?UXRhMmNDWExpS2RZWmpRTGs3L05VcmszQitJZkU5ekZVakdUSXFZaVhuQnNh?=
 =?utf-8?B?Y01lb081KzFiQjRXelZ4QkllMkJyaHAwS2VFN3Z4YldqQ3lXTk1iN1o0ZUZ5?=
 =?utf-8?B?ajVXbU1BUjZlKzhwVzJIYlU0MExkSnduNU1JTkU2TnIvNWhVMjJoT2huNUpj?=
 =?utf-8?B?OTFvaC9QWGtwSFIyb3ZJcHVWZkNQOUVVdUorUjJIU3ZnSC9nbG1MTElrdzRO?=
 =?utf-8?B?eXVTc0J5QmM2K3l6S0pvMG1ab25WR1g3UEd0OVRKWHM5RVRmd0hrbER0cHI5?=
 =?utf-8?Q?wUzEuufLlkfqWsgvlrm+ZDvUYmBqAj+4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGtEZTEvTlhQVkhqMjkzYXUwcnhXMS9UY2dGWjdBdHUxeUZrbFgvajBxazVh?=
 =?utf-8?B?MjRoU1NGcWNhdmtPemlkbkxuVFY1U2Y3bGFpSXRSa1BQVk9TV1BuS0xlMkYx?=
 =?utf-8?B?WUdqR25QWFpPMkg3bTYvMjhtalJwWFBGbDBlL3U0Slg5WU5FQ1hzTnVBVHNx?=
 =?utf-8?B?SXlsL1pMaTJpclRwd2JEMkxrZXh6LzkvTHNVcGE1WDVXOElBSFN5ckZraHdu?=
 =?utf-8?B?ZFgwZjQ5ZWIyaVJrb2JpZnUwQUR1VG43dHNWSkxwd0tGNUZHUWdVUVYwNG9y?=
 =?utf-8?B?dlpRS2hoalpaOEVHVDMyTXphY3JMcWJPdTZZU3RaOVhxOFpLbmtqMGFGd0tq?=
 =?utf-8?B?UXFEekNBK3lXdTUxN2RzS0t3dS81Wmo5Y1ZENW5XUWVqVjhpNktVcGZ0WXE0?=
 =?utf-8?B?em1PNE5VcFNBMGtKWThGTVhZYlRxVHhvTlpyeU9vSHZML253akQ2SGRUWE92?=
 =?utf-8?B?cEhFOXNjOUUxMWJoT1VYcnhOajBBSXpTME1YazlYMDJMbTBDMThWOEdrd3pi?=
 =?utf-8?B?S0c3UTcvMUNDSzVrWXIxK2RJeVF1SDBuQk05QVpuVkJMendYZHAzYXkxSDR1?=
 =?utf-8?B?SDA4eUdXRzZOTEdiVDNEbG5xNmhkUzZLTVhzRzRrR21jd0tqN080Vno4RlJr?=
 =?utf-8?B?RVZ6Z25JcjVObCt5UUVMWFdIeDVUKzZmT2xoTldxZEFWY1YyRG1ZZ2VROThU?=
 =?utf-8?B?ZCtydXNWRnlISzlnVEFmMytkMm5yOVUxbE13ekJhUFB0WXFpTWZwTTBEVzU0?=
 =?utf-8?B?azArZlhQM0s1NWxoM1A5d3FSbTUweWkzK21Pa2l5NkxiNUZKYVlKdWxqcGRM?=
 =?utf-8?B?dTFLUzIydW5wQTJiWnB0V1B5UXBoS0ZrNGJkTWR0Y3lleFlVVldwK0g5di9F?=
 =?utf-8?B?RGQ3dHVIbEV5YnZqOHd4eTJ3aGpiN3IxV1FaNW5FQU5oTllCNDhHMzFvUVN4?=
 =?utf-8?B?c1F6OWZXZWg5b3pzSzU1Wk5wMERmQUZNQ3RuQTFFTlBLT284YStNV0ZBRkkx?=
 =?utf-8?B?dGpPLzJ6VnJ1azloSHVGODkvdURQbldIQlBENk56UFIyWDhsSkhvbXJGMXNh?=
 =?utf-8?B?SDJidHFLeWh1Zkw0OEJTbnNlVU9XTEwycGczT3ZQKzZQUUF2eU96ZEVhVmVC?=
 =?utf-8?B?Y0N0cDBjdmxPbmNyb1EvU3FMSFYwOHVOVThmZlJnYzRpTVUwSkhPWnY4dVZu?=
 =?utf-8?B?eCtLekhDTldJZ3dUNEU5MGRJTk1VL2g4QS9rK3NFVDd3Y2gzOTA5U2pLNWZ4?=
 =?utf-8?B?N2hSZi9hSDR4UWZINHZFeXhocmhuMEFKYmpTUmdMdC9nZzZyaFBTMzB1Um5r?=
 =?utf-8?B?d3VWYkhSUmZqZDJ4bG1vdG9MY29Ja0pVaktCNGtWeEc4WnZmRTV0VHlFWmZW?=
 =?utf-8?B?UHpWeDdra1RpRjFNVm1aVEk1YmdkOWVZUllFUmh4Y1dtMkpyY0wxcEpMRHA3?=
 =?utf-8?B?K083NzMvSHFqR1g2WWZJclIxNGxFckxUdmI2cTlYT2ZSVTdsUTMxYms3MjBl?=
 =?utf-8?B?QjhXS29aVXVpVjZyUGQzaHFBa2JudVU2VC9zOWlYUmwxRTJTUkxycGRBZTBD?=
 =?utf-8?B?MzJ2RlpaSG4xT1daSlJIeHF0aldCUm1xNmc4SWFWZFIzZHVZdFlwS0VUNFZ5?=
 =?utf-8?B?UE5kRzJQam4vcmVmaGdMVTFtMGhSbFl1cHVZdWNCbU5nazNLTkZlcGdZWTE0?=
 =?utf-8?B?OVY2cktRVFRSV2YyWDZoTm5zZHZOSzBHbDNtRFhHcGZpQ1VncTZqVlBQWTN5?=
 =?utf-8?B?VnczclhUTkRuUHBmNkljU05IZ2xaaXNwdWZtYUl6N0JvZ0dKT0F3TTdFODhR?=
 =?utf-8?B?SlNqOHlMSWRid0xYbUZ6WnQxL1pCVVBGTXVKWHV6NW8vZEtFTXI4ekIwa05D?=
 =?utf-8?B?SklEaUlwM3ZyVS81MkxkTTd1RG9Ndk8vdW9qUVg4ZHpMTGRkZldyRzNSUEhl?=
 =?utf-8?B?WkJPT1RFRFpkb1NPWnkvZG0yRHhpaHJMN25vZnBqbFhNMjZGYUdBVFIxaEE3?=
 =?utf-8?B?WU8zc29Uckp5NWNCZ1NEVmxNNjJpb0JDTjNTbk1YdGtWcDhoTkpYRFZaeEN3?=
 =?utf-8?B?dXdjWTdBS1pPZGxzMjg0dit4eDBWVHI0eUM5T0MrYy82M2NZL01DSEFIQUk0?=
 =?utf-8?B?NnZmRXUwRkJ3QW1kREVaZzROdStDSXFhTDN6bVhUZ0tUcFEvZEp3Mytld3l0?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1035493A4B075E41843E37BF13F95402@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NGb+OmXwOzns4QM5wnDRIbeZxx6OGrZS/aryC3GnyJlmD4OF32uaABzyA2qvPEDoJHwB8T/nCxTrefzseq4Y1zBCesT/kL2s23Mrli5QX8sA1YKAKM5kcXdXxy3w97kN7CnlbsJOcF8hrbpTHrqw5+qBVmeF/9BMz2+CAvS1dvDa6JsghIWi1I82a9gPXhcLBjqANcrK5hgs+chPsilIjmTdAB3ZuXH5Qsh7ZOz1OxrsBIyT8ZvFj3+/aenwiYBsExDMlKYPKgmrAJ5kYC8kY2I88BeoAQDDTqiNVaLkL4BExqAUch3gkyPF2XFN3gj0ockIgp1fb03J6CNvnFGYJAGb46QLBYaIrFF4bdyoUDtp6Z1+9GVN8JgqTN4DsonUFQ3LGsVnTYOsU+jdbxJ+IkjXCxXBbT2o7Kf0icFgYNZh8Zp163BEiCRCP0edaydO4jDaoUEwpYO70Tcq+OBj5fjpk6eHTyMmEW3bBkIdiWodl55+WiU/CY2olYywwh62Ehhi2QkR3kp9AuK8AbWAgJM+46VX6EOKVfkGHKn6wkC5VPhHi1bfflEXFGx3EPOH2zCvFydhE0VKURYO9khagrBnUY52O21nVVo9YbRMRc5o8X2C1tVYunEPYreQebAl2x2XVJibfJIAEAF3XczihQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b00b1a-17ba-4ce5-44f8-08dd3507d7ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 01:56:35.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IuADf/eSFAasiuuwfFGOASFPX2BcEqIVLxQmaQrMWZe2l3ziUkxxbknHGhn2gFNqKkX2di5nf2K1BMPXcRq9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
X-Authority-Analysis: v=2.4 cv=UJQnHDfy c=1 sm=1 tr=0 ts=678715de cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=aIo2kV7cSN3g1NxgljsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RM4VEgxh5tEAvFzZ3Pz7ba0AN_oxcq1L
X-Proofpoint-ORIG-GUID: RM4VEgxh5tEAvFzZ3Pz7ba0AN_oxcq1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1011 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150011

T24gVHVlLCBKYW4gMTQsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMTQsIDIwMjUgYXQgMDI6NDM6NTlQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6DQo+ID4gLi4u
DQo+ID4gDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaA0KPiA+ID4gQEAgLTAs
MCArMSwyMiBAQA0KPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICov
DQo+ID4gPiArLyoNCj4gPiA+ICsgKiBnbHVlLmggLSBEZXNpZ25XYXJlIFVTQjMgRFJEIGdsdWUg
aGVhZGVyDQo+ID4gPiArICovDQo+ID4gPiArDQo+ID4gPiArI2lmbmRlZiBfX0RSSVZFUlNfVVNC
X0RXQzNfR0xVRV9IDQo+ID4gPiArI2RlZmluZSBfX0RSSVZFUlNfVVNCX0RXQzNfR0xVRV9IDQo+
ID4gPiArDQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gPiArI2luY2x1ZGUg
ImNvcmUuaCINCj4gPiA+ICsNCj4gPiA+ICtpbnQgZHdjM19pbml0KHN0cnVjdCBkd2MzICpkd2Ms
IHN0cnVjdCByZXNvdXJjZSAqcmVzKTsNCj4gPiA+ICt2b2lkIGR3YzNfdW5pbml0KHN0cnVjdCBk
d2MzICpkd2MpOw0KPiA+ID4gKw0KPiA+ID4gK2ludCBkd2MzX3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QgZHdjMyAqZHdjKTsNCj4gPiA+ICtpbnQgZHdjM19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZHdj
MyAqZHdjKTsNCj4gPiA+ICtpbnQgZHdjM19ydW50aW1lX2lkbGUoc3RydWN0IGR3YzMgKmR3Yyk7
DQo+ID4gPiAraW50IGR3YzNfc3VzcGVuZChzdHJ1Y3QgZHdjMyAqZHdjKTsNCj4gPiA+ICtpbnQg
ZHdjM19yZXN1bWUoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ID4gPiArdm9pZCBkd2MzX2NvbXBsZXRl
KHN0cnVjdCBkd2MzICpkd2MpOw0KPiA+IA0KPiA+IGR3YzNfdXNiXyooKT8gVGhlcmUgbWF5IGJl
IG5hbWUgcG9sdXRpb24gaW4gZnV0dXJlLiBUaGVyZSBhcmUgbWFueSBJUHMNCj4gPiBjcmVhdGVk
IGJ5IGR3Yy4NCj4gPiANCj4gDQo+IEkgdGhvdWdodCBkd2MzIHdhcyB1bmlxdWVseSBhc3NvY2lh
dGVkIHdpdGggVVNCLCBidXQgSSBkb24ndCBoYXZlIGFueQ0KPiBvYmplY3Rpb25zIHRvIHlvdXIg
cHJvcG9zYWwuDQo+IA0KPiBUaGFua3MsDQo+IEJqb3JuDQo+IA0KDQpSZWdhcmRpbmcgdGhpcyBu
YW1pbmcsIGxldCdzIGtlZXAgdGhlbSBhcyB3aGF0IEJqb3JuIGhhcyBhcyB0aGV5IGFyZQ0KbW9y
ZSBjb25zaXN0ZW50IHRvIHdoYXQgd2UncmUgZG9pbmcgaW4gdGhlIGRyaXZlci4gV2UgY2FuIHJl
dmlzZSBpbiB0aGUNCmZ1dHVyZSBzaG91bGQgd2UgbmVlZCB0by4NCg0KQSBjb3VwbGUgb2YgdGhp
bmdzIEkgd291bGQgbGlrZSB0byByZW5hbWUgaXMgdGhlICJkd2MzX3VuaW5pdCIgdG8NCnBlcmhh
cHMgdXNlIGR3YzNfZXhpdCBvciBkd2MzX2NsZWFudXAgaW5zdGVhZDsgdGhlIG90aGVyIGlzIHRo
ZQ0KZHdjM19jb21wbGV0ZSgpLCBwZXJoYXBzIGR3YzNfcG1fY29tcGxldGUoKSBmb3IgY2xhcml0
eS4NCg0KQWxzbywgc2hvdWxkIHdlIGFkZCBDT05GSUdfUE1fU0xFRVAgZ3VhcmRzIGZvciB0aGVz
ZSBleHBvcnRlZCBwbSBvcHM/DQoNClRoYW5rcywNClRoaW5o

