Return-Path: <linux-arm-msm+bounces-69299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3EB2742E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 02:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28E43ADD5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F73C27713;
	Fri, 15 Aug 2025 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KTWNkbQZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d/cFHH2f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZM6Q2lWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F853FC7;
	Fri, 15 Aug 2025 00:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755218546; cv=fail; b=C1gGlPWT2EpAgF3srDi1e9yzZ4c6qvEPw8SjSbRST5IFIlv4+S6d1125B8SIO1Hjcd/NcAsKpZ5K1/q2V0U0FJOD5CwFv4Fx+xCY/ziOh7MvcSgBFc6iXQySY5Boe5p38EFYM0m/CYQaoEhX9iRkbuYvblnmNutG/CJ0tcvT1to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755218546; c=relaxed/simple;
	bh=wB/44069cUqYzkCWm82ygjBMxvJCEp1yyVeLsqqVyEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E60miWEupufsYKDBDpK3QTqVzzd8poYHGTU+39hW9Kodyi5M69VEUpv9VUEnT0CES8/CnZgfdMxTiPYdKHV+B7WAKieJAu6xaR0SGsXP1XpPPxPVuq/by8r27q9liEz3Er46mQ6g+DPWq1OjGuduew/KFC1DqD/YgOPRkYDsmvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KTWNkbQZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d/cFHH2f; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZM6Q2lWj reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ENDcjs020623;
	Thu, 14 Aug 2025 17:42:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wB/44069cUqYzkCWm82ygjBMxvJCEp1yyVeLsqqVyEo=; b=
	KTWNkbQZwTKZKWjuF1VRVunmWjDdjHOHP7KkCPXriDIpV4llbw+AUTIJollhZtI7
	CtYoRQSrN8nPq0LDOoMF08g/N13x0YvtYYW1ts5VO8kzfmvN6O2NKedn/AANGQnM
	3LQ+eqK2UImhjisscvl5/I2j5yij+PMe81X5rU/Vb3ePoIPdOxdGqOgskA1cvA67
	k+gMfZoKtUovttA19c1pzue1+ROftdpZJwx/iqrqB8lM/o5zOxlW+teKeYkv9Mbo
	hc3MEuQyn97Dj79nl8+iI5rIbHOV1VPJLEkqw0U1dr51SO3DybqqDfInFegxGAzy
	x6UvERjpV/c3ljU5o3BiBw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48e58tv8q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 17:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1755218532; bh=wB/44069cUqYzkCWm82ygjBMxvJCEp1yyVeLsqqVyEo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d/cFHH2fDNzAtbOOXiPhi24V8kiGnezcwQ04FgzJssZtMG5JWANHjhPZAhpA6U+Jc
	 CuTdFwcHIxrCg8590Db+8gbUfQpfz7b9MFZuMBzc3YtPkNvziovTlUJPARtXMTUJNB
	 w1mG7qB1sHKYF7f1zAvECAjKl5Xoq4LN9c7+C0PvHlkmdsCV2k4RR1D7y1tLhp98NB
	 V228vksnRCgvvnKIaYEkqxsqOlI6QE/oHLV0iRALXt8be8REqBipBH5RKay+yEsX6r
	 dYmQSiGaqZwXDSld+MyHVd3mmkQtRh2ow5RRaVLHbtVRgv4ymX/BhgJJcPjRUDFDgp
	 JAiPyrBOHD4IA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3897F4013B;
	Fri, 15 Aug 2025 00:42:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A49D4A006F;
	Fri, 15 Aug 2025 00:42:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZM6Q2lWj;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 05C2A40833;
	Fri, 15 Aug 2025 00:42:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhxJL5ETS7hyme3EWWHBWnIP4ySRPd5CSHZCuElfR7chPAWsEC11GJiqEQAgYAD1tCe9qFu6R9n92NH8MBy7Q2LnAhTyh5YVZSIq17YkpBWQJ0IQ/JK7IPI5FwXc7hLQ1LBTiOOFczpdglSSQLjf1K/a44ekYoPcPFE1zHD57sOJhYClIme6qVzdaHQ1Shi+TyYBa6X32W6DAoS4cI8y9V37ZIUqEjUNTHt4obsR3NeipgJ2acOxFDIXXO4M3YJdv5ehb1QGxHFE9N9gWpfZguZavswSiBPPtwGfYjbdO3WJRbm+gvBiNPMHKWbqauZXJsf9bGvH1jXMMZqyokvp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB/44069cUqYzkCWm82ygjBMxvJCEp1yyVeLsqqVyEo=;
 b=a4dxuIouxCxRDWiJIK+RzedVRyI1lcCKRY28xyZ2b5gw92jatYghq5RV2AJ92DJJbPh4MkSqmlomPet7D6gq385tSFyyP72ewa4aGoq4JRvLxBtE1equsJry7lbI/cAO7M3T2X2a8LryhJMPjWzdjRgvHwBZkbyYqqEEc99H23TXaS09w0WQDLbQFxBUzHsPd/x+/dSJK9ooyayxGMDdLqeXxWwFNtcNWT1CIy4FbnI6qzNK0hLCRYaipBYiJWOPSv7MIz+instGXgDvLYA42zSUhzgCX3xMZQhebByNb1qUSqX/McPD281vSid4yGjJPj9x1zTjhEF/+7Sy8Lrrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wB/44069cUqYzkCWm82ygjBMxvJCEp1yyVeLsqqVyEo=;
 b=ZM6Q2lWjdOw/SfQR+WvDBi7Ps6x3+oWaOKectqjDZjZ3/vKkBmWMuEJgTjhJz8Su92QtO5YYklERE3gRu8jocyzdbOipDJIJllS6sq0ydti3MbnMD9YBJ3ZxdJkgw463GsjWrbLf07cbP/HL1i8lxPC1BBgzc40Gbi6h2VEfu+s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 00:42:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9031.012; Fri, 15 Aug 2025
 00:42:08 +0000
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
Subject: Re: [PATCH v4 1/3] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Topic: [PATCH v4 1/3] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Index: AQHcC03ImSIYA0H8z0GYeJ/ES5gh0LRi5D+A
Date: Fri, 15 Aug 2025 00:42:08 +0000
Message-ID: <20250815004207.xwv4n6xsat44bydi@synopsys.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-2-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-2-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BL4PR12MB9480:EE_
x-ms-office365-filtering-correlation-id: ea1121f1-bf08-46f8-45ea-08dddb949099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sk91OStEWndQRndjZjdka2dNR3FMQkYrRzJvRU94TVRrTW1MRkt4M0NNVzda?=
 =?utf-8?B?bFZZbXRkaWNFcmN2L1lUalJYdkhDYXc5WC9YYlBkNE5kZDAwRHhPQ0ZweHJS?=
 =?utf-8?B?RmxzTHlSK2Z1VkZRL0RpemQ1RHE4NnFKa0xtcysxNVRHcUdXV2tmbm9PWVU4?=
 =?utf-8?B?UEl0blhWSXJUYUg0a3MraUphSi9jOWRRZFFSVUdZNXd3bENJWE9mZTNHQ1hx?=
 =?utf-8?B?T0ppdkhwSVo5QjhMUG9UNEpPcFlubHNZak41UEM3YS9UNXlHYi94bStIVzVt?=
 =?utf-8?B?SXh1K3FubzVPV240OFdFcVZWMWZabXFBcjZTN0x1WTJOZWxmamRPaEhSZ3BM?=
 =?utf-8?B?MFdvM1YxRWpzcWV4SGU2S0NDV21yRk1lNnh6UmdpK0xvNk9HclJEMk9rdWlW?=
 =?utf-8?B?WDhYU0N6YzdiOTdpWXBkQXk4TTd3U0wvQnRsek1jOU1BSzN0QjR2OFMrTzVX?=
 =?utf-8?B?SHZhanhpbk9hNlFEd3RkakthcDVKeER6K2pmdmdFRGp6MTZ1bEZqUnRJdk5k?=
 =?utf-8?B?SE41TDFFVlA4M1dJLzd4WUlyazloWjN5TTVnUUVWZ29IbzE1ZU1vVlcyQ1VF?=
 =?utf-8?B?czkxSERKV2Z0cTduU0NVRjQ3akltbmc3UEVwVy9RWjZYQm5MQllUSVB6M1Zm?=
 =?utf-8?B?ZTRlMVpDU2o0emY5M0lyK1hBWU9rYWNLVDBzM1p0U1FnRGkzUkdFTEZJWWNK?=
 =?utf-8?B?ejdxSXZJOVNyeTFpWUZwei8zYVVmUWlMQUE4cnFWZDFJOEtyRXBQM3Nsb2Vu?=
 =?utf-8?B?MTIrSnJtRXk0VWZvM1p6RTNDeTBQV2kvdGxsTUswVUJpY3EzNHdaYWs1Q1dF?=
 =?utf-8?B?UFRuMzEvMjRnVVljVzl1QTZab01aK09UdmhINlovQkpOZGUwNklVQStDc1p4?=
 =?utf-8?B?Y1h5RjIvWGRRTnhqb082ektWd3FqZjJDa3NlUG1yRnZZS0RERWk3MTNHMkM0?=
 =?utf-8?B?bXNSNXpzNDZzN0VsY0dMMWdCY0h6d1B6SnRzM3p6R1JjRGF5VnloWDYyOExZ?=
 =?utf-8?B?UW0rQTE5aTh2NUFRQzdqMGYxQzJkU2w5a09ZcnVCOTI3NGRjSzZmeml5YUVR?=
 =?utf-8?B?bFZ2MkR1V1d0VDZqcjF3YmtQTDk4Y3c1QUdsRTE5d0Vod1NOTCthd1ArYlk2?=
 =?utf-8?B?K3FxS2ZiMm5wUHVoOWVSdVN4WnJjQ2ovM1g0dXgyc3c2bG9UYjRLVmxXdWRG?=
 =?utf-8?B?ejNGaFRnSU9xSTRXck83TjNQekpFUDBOMzF1R0lLVUV1YXhseEh3SEFydGlX?=
 =?utf-8?B?V1cva213NlRxazVJMkZzWUtRb2FMRFlPT2pzL2Uvamx4M0dZTndVRHA1aTh6?=
 =?utf-8?B?Wk5mNTY0VHZ6ZnR0dE9GZ09EMitiaURWQ1ppc3ZTU1VGMWJCenl3dDEra0Qz?=
 =?utf-8?B?UVAySVk5R0N6ejQ4MDdxdUc2elVMQVRlRk1sa1RTNEVEU2txZnRPQVpScGpK?=
 =?utf-8?B?MndZNFpiWUxwU3hJSGgwQ2EvMjJhK3p4bUFDaXFRbWRPNVJURUIzN3NQNUY1?=
 =?utf-8?B?N1FPbWdnVHB3c3NQbDFadDk4dW5nSG1USHFKUGwrQ3l2ZDErcWxJakc5c3J3?=
 =?utf-8?B?RVhzTUdvZ3o5L2ovUjVBbWNXbE1uS2NteHpBaVlnR205RGtDVnRFRFBuWVoz?=
 =?utf-8?B?eVd0QXVic2d5YWl1SkU5eUZ2bVowQUdxK1k2SmNPaDdXeE1jcDVmYk40ZEVS?=
 =?utf-8?B?ZjBpdTg3WDZYdkZBdmVscUJzeE5CZlQ5VU9valJtZnFDRkIvRm90bytmTk5v?=
 =?utf-8?B?SzJMNTBQOFltV3o5d1FjVmpPcnF1VGlQSGFmbmZnSWVzL09tM1JRL2NDeHlM?=
 =?utf-8?B?dXUzUWs2elhDWU5PeC9oYzQzOEJoa2NhdkZzc2U5VWozUzY2RlBnTGM4YzRP?=
 =?utf-8?B?cGhsbTkyaW02NTYzU2pPWkVXL1Jld0VEM1ZtN1lod09FazVPWFBiYnlyNk4v?=
 =?utf-8?B?M1Rab3BQVjhWTDdVY0didWswRjZvRXM5Sm81T3Z4eWp3SnN2dWljUXN3aU5l?=
 =?utf-8?Q?7jDh0Ad7McIxjhKEt/La5dkB9ZhQ7E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVlmc1hrWUxrdUdSN2ZIN0xWcmJxcDN4RzBRL3RxZ2k2eHdmVzZrTlowZmpE?=
 =?utf-8?B?cE1FTGdUZDlpN2labksveCtjSmhaRDBJSTRNb3ZBeEFPdURmbFhweFRlVG5P?=
 =?utf-8?B?NlV3SzBhaEZkanFoaHJhYlQyYjh2eTJJQzNqdmRqMkE2QTd4dFJRbFRqdklW?=
 =?utf-8?B?VGkvZkJRVzZEbmFIT3luTWZGVlJQbVAwNVhlWFZwMWdkZ0taWG1qM045Ty90?=
 =?utf-8?B?N3VmZ0pLa1UwV003QlVYR2NkeXJ2SUtvNTB4UzVRaVpwVmxUT054SmVmUXc1?=
 =?utf-8?B?QzFrK2tUUUxBS3k5UWdYeWlJQXUvYlYrcHQ1NlhwNFBvVE9QeVgyRjdkWmFa?=
 =?utf-8?B?OVkvc2s2RjYyYzV5WXdlNDVlYlYwRlVxa3lWWWxnQzNiRFBZYlBQcXU0V1Bt?=
 =?utf-8?B?M29OejBzTUV5SlU3OHlCdGY3OFJORG9oMjZoMmZ0ZDEreG5pUWMyOWlZVnNV?=
 =?utf-8?B?dzIrcGNVUCtXTWczZ1RFTS9FdnVUZGNoeUhXRHNJNTRCem9hb1NJeTFSRXdp?=
 =?utf-8?B?YlJYT0lmNm1KUFp2WnB0enRBWE9TanB0L08zdVJxTFY1ekhwUkdWOVVpOUto?=
 =?utf-8?B?eFNOZXd1bDRqYWh5b0xvZVJ6NUdnZEFRbWlOc3pVbUpzSUY2c2VUVzNULy82?=
 =?utf-8?B?N1hTbTZZTXRyOFpYTGNqbFNFM01VRFRIaUx1ZGsrOGZnRlZ6a0p6bmJwZkJj?=
 =?utf-8?B?TWhxeGdqNW5jTW9YbVZDSFRqMFhsWjYvNFlCaGphS0RQNmliNG1Kd1luSGht?=
 =?utf-8?B?Ym81cS9uZDR2dFF6U041NElMUzF6M0FnSFB0Wk9saURoRWZuUDdCQVZ2WFBa?=
 =?utf-8?B?bFpndS9udGlCU0ZSMGFEeWtzUEk3eWRVSkFTNFhvdWdNamVpdlZBcU4yMXhV?=
 =?utf-8?B?eGxXQXlzN29iVE0zWUJQR0U4RU83elRDY0pjTGZFbEU1Vlhvb09GRDdHUmth?=
 =?utf-8?B?cGxVMW96VWc1ME1jSVVlVWhFUVBjRXRrY0VHdHM5eTZPTnJ4M1hjVlpXb3Zm?=
 =?utf-8?B?S2Z0YlYxRmc2NHRPOVJMMnFnSzJkd2x5KzZXaGY3cFV4ZFR4cHF1dXFpSG9j?=
 =?utf-8?B?YU9HWVpES3NpOUUwWG9zSWVWbWdBYWxUNmg2UytaMVBuak9wU0o0RFVmUmM1?=
 =?utf-8?B?V3VoSkkzNkltaU5kMkJBa3I3NGZaZEYxMzRnOUFtbDB4R0FTekVEWmFROGRs?=
 =?utf-8?B?MDMzYlJWVm9HWW5rdVoxSXpUOTBheis1ai9pTTcxNDBzS1E1R0xFL25CSEhW?=
 =?utf-8?B?NTlGV2E4aVkyM2tDMFQzdmp4TzJvQ0c3TzdWbVdrcVBWYzgvSUhzemVTNG1s?=
 =?utf-8?B?QVNRem9ibmJNOTVCQmpDK0xFKzYrYVY5VDVaZDJDd0g4Y3Y5WWx4SHU2aWV3?=
 =?utf-8?B?T3crK09xMUVyeVQwVXJRWGNBR21LVjZRNEZMNFY1NWZ2Sm82ekd6djJTd3da?=
 =?utf-8?B?YTJYV3YwSU5Fa0N2K25ZSC9HZ3Z6cm9TaFdocWtVL2F1QjgxZ0VDaTVZVXkx?=
 =?utf-8?B?MUc1aFBkbDhwL0ZBd0NVN2lCT2pxdnZHSlErenhCc3hSVTdWcmY1WEpaeHZV?=
 =?utf-8?B?NEVkdktsNE5qdG4yZkpaZ2QyNHErcVVRdWxXZTV3am53eVNyN0lTYytOZjBD?=
 =?utf-8?B?YVlGL2FiY0NjODVYOHp1MmVKbkdoZ29QZ0Q2cU1XTTJFWCtCWi9KQVZnbjZU?=
 =?utf-8?B?NHI5WHlzUjBEYS9pYyttMmZVYjhYOFRDM3lQc05qSzJKdDB3T1hwQythWjdh?=
 =?utf-8?B?RVlQTFlaTmZXRExURTNKUko3dklnaHZtWXU4TjFQdTlwc2JqdjlxMzNCSXUr?=
 =?utf-8?B?TlFqbVNFZzR1WUFMNklwOGdZcE1VZGJDYUFJb05kdVlJeHV5ZDhyb1dqcmdl?=
 =?utf-8?B?eUFBdGd1ZGhLYVJkRWZHRVpJbW5xRzA0WkN3ZUMzZlM2ZEpvRFRtb0F6MWdT?=
 =?utf-8?B?UzRtaGJOT2hWWk1hVmh3QjNqY2FCZ2QxZ3BycHB4M1JWY003YVdjVUF6eDNu?=
 =?utf-8?B?Qk0xa1ZMMzdBNVdUV3hpY0dLWVVJRnp5aDdja2h0c0tIWUJwbUJYSEZ2Y3lx?=
 =?utf-8?B?L09FdFlmY2RGUE50amN6ZURiaFlVVWtPS1FaQTVnNGIySGVMeE1rVGNtblh1?=
 =?utf-8?Q?BwMNUu0Q3a5OVknMrJmvLfE/c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <285993FC7C6E474ABA8D33A7D9E42FF3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1btk5T3KBZ1ffkcfArETuTQUAW7+//VXuB9gGDI8k9rzqqktm8EJ+k10rxHXseNP0E2TvqjESEzqYWtOpHDiVdf45tAbzYcCV1P7gc/05TNy3cUVU7u0HdPOU17v8SW28oQ2mytPxV6Bdfrtt+7xiU34p+S1XefwLEG+mbpymWZwohqRCMzPUUZazoXtpjh00ZvwkJuNRP6PUcT7eZS60zyKj+/P2LMKC4IDMW40NKCfHqoCRr74FKUYaKoA/9YkTRhHgVjKzwqse9bJVpsp7LQPyvAPn/2tHSMrCf1xKSCTHUEiu+EBwcEgiqCISaErrbfl1MVkgkQSJmwAeQbUfS6Cy+W/z04Zdzxslt1vq6kprkm6qfNpToLiTDPVJx53XQCcYJ9PQziC1RqaynT1RZqUFvN5Ojj6GBJ/KbhBQIoliSUrl0/04jcaXI81Rzl6wOB+KrGB1B4/si+pptlUtJhOkaToEEJe16XQG2OiSptJXxYK5ICzcnjv0sEKHA72UnraTZikY77g1JDz8OAR2FqzpCHyQR8JMKVDPC/5QEBxfNZXUPbhBC/qgBzpoN80wfDUnzjfFzFIusN2i20GAQjoXp6JaMnAsCMaJ/kqXxYvtlh8vKFq7ENw1MdVcoe27b2yw1LbxSen4/1drInlPA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1121f1-bf08-46f8-45ea-08dddb949099
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 00:42:08.3865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKrIDQWnRJKY0ogaP6tYVYjbenCX2x9zTh4/9OMlEdeXMwyuW3vKvyKxPwbpktLEd7u5RaxkxaSBxNjbraaCvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=689e8265 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=EnLnMFUhpNnZi6Ekn30A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EZntMjl_YsjFyDmJya9gwnzUTCVOf-PD
X-Proofpoint-GUID: EZntMjl_YsjFyDmJya9gwnzUTCVOf-PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDA5MSBTYWx0ZWRfX6qgUykSvwBZm
 yWrBjFwe5bI9Z9L4ulig7ejVTdIQa347v8yWmh9xfuAESQfLu2kmFraEOSZ3x7b+1MSS9JGygAi
 Skm6jR7BuigbYJ34oYdux9HavS/H3J3pU+/gwvOM2obFJ/NE8Z4sb4LBb5JtjRJfQl0vB1E2udG
 4p1qjrqogEVfxfh8iRaGxaNmFGIAWDv3RCfZmmrDGqblwOwylTIFph35IZDcOya3tH86JI1mrhW
 pHD9SsBCF03GKvFa/D5wTwboMro9Nw+fLQD+sF31Ew+ixd+hXpfT7OgdpVZTYGmOsqk8kvlD6cv
 HL4hx5S0qTRN9+/oq/UuTxD0QPmJZZJExSwnlg6NLUt5EaTir1VChqAcngygCyGG5Tp2uyoczTe
 5d9N2fW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-14_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508090091

T24gVHVlLCBBdWcgMTIsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IEluIGNlcnRh
aW4gc2l0dWF0aW9ucyBsaWtlIHJvbGUgc3dpdGNoaW5nLCB0aGUgZ2x1ZSBsYXllcnMgbmVlZCB0
byBiZQ0KPiBpbmZvcm1lZCBvZiB0aGVzZSBldmVudHMsIHNvIHRoYXQgdGhleSBjYW4gdGFrZSBh
bnkgbmVjZXNzYXJ5IGFjdGlvbi4NCj4gQnV0IGluIG5vbi1mbGF0dGVuZWQgaW1wbGVtZW50YXRp
b25zLCB0aGUgZ2x1ZSBkcml2ZXJzIGhhdmUgbm8gZGF0YSBvbg0KPiB3aGVuIHRoZSBjb3JlIGRy
aXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBwb3N0IGludm9raW5nIG9mX3BsYXRmb3JtXw0KPiBw
b3B1bGF0ZS4gTm93IHRoYXQgdGhlIGNvcmUgZHJpdmVyIHN1cHBvcnRzIGZsYXR0ZW5lZCBpbXBs
ZW1lbnRhdGlvbnMNCj4gYXMgd2VsbCwgaW50cm9kdWNlIHZlbmRvciBjYWxsYmFja3MgdGhhdCBj
YW4gYmUgcGFzc2VkIG9uIGZyb20gZ2x1ZSB0bw0KPiBjb3JlIGJlZm9yZSBpbnZva2luZyBkd2Mz
X2NvcmVfcHJvYmUuDQo+IA0KPiBJbnRyb2R1Y2UgY2FsbGJhY2tzIHRvIG5vdGlmeSBnbHVlIGxh
eWVyIG9mIHJvbGVfc3dpdGNoIGFuZCBydW5fc3RvcA0KPiBjaGFuZ2VzLiBUaGVzZSBjYW4gYmUg
dXNlZCBieSBmbGF0dGVuZWQgaW1wbGVtZW50YXRpb24gb2YgUXVhbGNvbW0NCj4gZ2x1ZSBsYXll
ciB0byBnZW5lcmF0ZSBjb25uZWN0L2Rpc2Nvbm5lY3QgZXZlbnRzIGluIGNvbnRyb2xsZXIgZHVy
aW5nDQo+IGNhYmxlIGNvbm5lY3QgYW5kIHJ1biBzdG9wIG1vZGlmaWNhdGlvbnMgYnkgdWRjIGlu
IGRldmljZSBtb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jp
c2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvY29yZS5jICAgfCAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHJkLmMgICAgfCAg
MSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCA4MDAyYzIzYTVhMDIu
LjM5MmJhODZjNjlmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIzNTEsNiArMjM1MSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQly
ZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAgCWR3Yy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlkd2Mt
PmdsdWVfb3BzID0gTlVMTDsNCj4gIA0KPiAgCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KPiAgCXBy
b2JlX2RhdGEucmVzID0gcmVzOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBkNWI5ODVmYTEyZjQuLmE1ZmM5
MmM0ZmZhMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTk5Miw2ICs5OTIsMTcgQEAgc3RydWN0IGR3
YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAJX19sZTY0CWRtYV9hZHJbRFdDM19NQVhfSElCRVJf
U0NSQVRDSEJVRlNdOw0KPiAgfTsNCj4gIA0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgZHdjM19nbHVl
X29wcyAtIFRoZSBvcHMgaW5kaWNhdGUgdGhlIG5vdGlmaWNhdGlvbnMgdGhhdA0KPiArICoJCQkJ
bmVlZCB0byBiZSBwYXNzZWQgb24gdG8gZ2x1ZSBsYXllcg0KPiArICogQHByZV9zZXRfcm9sZTog
Tm90aWZ5IGdsdWUgb2Ygcm9sZSBzd2l0Y2ggbm90aWZpY2F0aW9ucw0KPiArICogQHByZV9ydW5f
c3RvcDogTm90aWZ5IHJ1biBzdG9wIGVuYWJsZS9kaXNhYmxlIGluZm9ybWF0aW9uIHRvIGdsdWUN
Cj4gKyAqLw0KPiArc3RydWN0IGR3YzNfZ2x1ZV9vcHMgew0KPiArCXZvaWQJKCpwcmVfc2V0X3Jv
bGUpKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSk7DQo+ICsJdm9pZAkoKnBy
ZV9ydW5fc3RvcCkoc3RydWN0IGR3YzMgKmR3YywgYm9vbCBpc19vbik7DQo+ICt9Ow0KPiArDQo+
ICAvKioNCj4gICAqIHN0cnVjdCBkd2MzIC0gcmVwcmVzZW50YXRpb24gb2Ygb3VyIGNvbnRyb2xs
ZXINCj4gICAqIEBkcmRfd29yazogd29ya3F1ZXVlIHVzZWQgZm9yIHJvbGUgc3dhcHBpbmcNCj4g
QEAgLTEwMTIsNiArMTAyMyw3IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAg
ICogQGVwczogZW5kcG9pbnQgYXJyYXkNCj4gICAqIEBnYWRnZXQ6IGRldmljZSBzaWRlIHJlcHJl
c2VudGF0aW9uIG9mIHRoZSBwZXJpcGhlcmFsIGNvbnRyb2xsZXINCj4gICAqIEBnYWRnZXRfZHJp
dmVyOiBwb2ludGVyIHRvIHRoZSBnYWRnZXQgZHJpdmVyDQo+ICsgKiBAZ2x1ZV9vcHM6IFZlbmRv
ciBjYWxsYmFja3MgZm9yIGZsYXR0ZW5lZCBkZXZpY2UgaW1wbGVtZW50YXRpb25zLg0KPiAgICog
QGJ1c19jbGs6IGNsb2NrIGZvciBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycw0KPiAgICogQHJlZl9j
bGs6IHJlZmVyZW5jZSBjbG9jaw0KPiAgICogQHN1c3BfY2xrOiBjbG9jayB1c2VkIHdoZW4gdGhl
IFNTIHBoeSBpcyBpbiBsb3cgcG93ZXIgKFMzKSBzdGF0ZQ0KPiBAQCAtMTE5Nyw2ICsxMjA5LDgg
QEAgc3RydWN0IGR3YzMgew0KPiAgCXN0cnVjdCB1c2JfZ2FkZ2V0CSpnYWRnZXQ7DQo+ICAJc3Ry
dWN0IHVzYl9nYWRnZXRfZHJpdmVyICpnYWRnZXRfZHJpdmVyOw0KPiAgDQo+ICsJY29uc3Qgc3Ry
dWN0IGR3YzNfZ2x1ZV9vcHMJKmdsdWVfb3BzOw0KPiArDQo+ICAJc3RydWN0IGNsawkJKmJ1c19j
bGs7DQo+ICAJc3RydWN0IGNsawkJKnJlZl9jbGs7DQo+ICAJc3RydWN0IGNsawkJKnN1c3BfY2xr
Ow0KPiBAQCAtMTYxNCw2ICsxNjI4LDE4IEBAIHZvaWQgZHdjM19ldmVudF9idWZmZXJzX2NsZWFu
dXAoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ICBpbnQgZHdjM19jb3JlX3NvZnRfcmVzZXQoc3RydWN0
IGR3YzMgKmR3Yyk7DQo+ICB2b2lkIGR3YzNfZW5hYmxlX3N1c3BoeShzdHJ1Y3QgZHdjMyAqZHdj
LCBib29sIGVuYWJsZSk7DQo+ICANCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX3ByZV9zZXRf
cm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+ICt7DQo+ICsJaWYg
KGR3Yy0+Z2x1ZV9vcHMgJiYgZHdjLT5nbHVlX29wcy0+cHJlX3NldF9yb2xlKQ0KPiArCQlkd2Mt
PmdsdWVfb3BzLT5wcmVfc2V0X3JvbGUoZHdjLCByb2xlKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IGlubGluZSB2b2lkIGR3YzNfcHJlX3J1bl9zdG9wKHN0cnVjdCBkd2MzICpkd2MsIGJvb2wgaXNf
b24pDQo+ICt7DQo+ICsJaWYgKGR3Yy0+Z2x1ZV9vcHMgJiYgZHdjLT5nbHVlX29wcy0+cHJlX3J1
bl9zdG9wKQ0KPiArCQlkd2MtPmdsdWVfb3BzLT5wcmVfcnVuX3N0b3AoZHdjLCBpc19vbik7DQo+
ICt9DQo+ICsNCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19IT1NUKSB8fCBJU19F
TkFCTEVEKENPTkZJR19VU0JfRFdDM19EVUFMX1JPTEUpDQo+ICBpbnQgZHdjM19ob3N0X2luaXQo
c3RydWN0IGR3YzMgKmR3Yyk7DQo+ICB2b2lkIGR3YzNfaG9zdF9leGl0KHN0cnVjdCBkd2MzICpk
d2MpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHJkLmMNCj4gaW5kZXggNzk3Nzg2MDkzMmIxLi40YzkxMjQwZWI0MjkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9k
cmQuYw0KPiBAQCAtNDY0LDYgKzQ2NCw3IEBAIHN0YXRpYyBpbnQgZHdjM191c2Jfcm9sZV9zd2l0
Y2hfc2V0KHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2ggKnN3LA0KPiAgCQlicmVhazsNCj4gIAl9DQo+
ICANCj4gKwlkd2MzX3ByZV9zZXRfcm9sZShkd2MsIHJvbGUpOw0KPiAgCWR3YzNfc2V0X21vZGUo
ZHdjLCBtb2RlKTsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDI1
ZGIzNmM2Mzk1MS4uOTk5YjJlNDM2NjIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI2NTgs
NiArMjY1OCw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfcnVuX3N0b3Aoc3RydWN0IGR3YzMg
KmR3YywgaW50IGlzX29uKQ0KPiAgCQlkd2MtPnB1bGx1cHNfY29ubmVjdGVkID0gZmFsc2U7DQo+
ICAJfQ0KPiAgDQo+ICsJZHdjM19wcmVfcnVuX3N0b3AoZHdjLCBpc19vbik7DQo+ICAJZHdjM19n
YWRnZXRfZGN0bF93cml0ZV9zYWZlKGR3YywgcmVnKTsNCj4gIA0KPiAgCWRvIHsNCj4gLS0gDQo+
IDIuMzQuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

