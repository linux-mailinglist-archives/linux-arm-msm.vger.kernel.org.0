Return-Path: <linux-arm-msm+bounces-118881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIG5JOeFVWqTpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 02:42:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F132D74FE52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 02:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=synopsys.com header.s=pfptdkimsnps header.b=UqWWtXed;
	dkim=pass header.d=synopsys.com header.s=mail header.b=Isw1LybL;
	dkim=fail ("headers rsa verify failed") header.d=synopsys.com header.s=selector1 header.b=ozX93hPd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=synopsys.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4328302D4D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 00:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049AB1F0995;
	Tue, 14 Jul 2026 00:42:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1732757EA;
	Tue, 14 Jul 2026 00:42:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783989730; cv=fail; b=N1sE3Sqitt2KzPjXbGrH5fChsU6dYFXN+88iWZPso4BMaUDSfdimjHgsdQWOrCI8VGONEVvbkZ/qAQBRKpsmdFKQWFZe1rzQ3Tl1g+FOImGIfM5i0IlTFWJ/yVPjWjKa0bxiq8YFvJJAvjOrNOgIE6A2++RoigSkia/gfna4lnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783989730; c=relaxed/simple;
	bh=pjotWP4uynxxJPm1LBbMvmapbA/R0r/S+WlsS7v6E2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jEo+NGAcWXNd/njND+Ti6wFE41qz2Rt/bHDPyrOK7ctYvkKFbY75x3h7RRDWfVYh3KqR7YUKBvdGRxVDg52NRwqVUBF6MPTPBDzTYqCeDrFLRPQxv1h0XYGVt9pEt479OUmdPujlFQ0GcIBtSNNKIXGjX+DuZ8vAV7vCiEcrPqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UqWWtXed; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Isw1LybL; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ozX93hPd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnmgT1765924;
	Mon, 13 Jul 2026 17:41:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=pjotWP4uynxxJPm1LBbMvmapbA/R0r/S+WlsS7v6E2s=; b=
	UqWWtXedbRGL84z/klgH4WpI7igFne75rOgrwRw5a2Z3+zm8BOLFUdi2f94iXWCE
	dRR+z/ch3NVxwazJooobsQNov8W6ZkRFfshPNVnmqsxo01bbmwf/vXdeEnFBsqru
	tBq4MIj1yrECouyEY+laCyf3qAn74zV5jpoMMJrVVG9nMKbyEzv9PYPSSKjpgQPh
	PBNWcB8peDFOsMaKAiK9OtfwUtNaLaA7t02BruAMHt+tnzKmQ1w1LNz/jLNksNi2
	7mgfWzdcLVDBwK6mVBKO/g3f7Awhuy6/LNLqyq8ow6UfH89uGtyRtHTfC9hpEySY
	QAmZ83u5p3k1iewKNIB9RQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fcyhhnc87-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 17:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1783989699; bh=pjotWP4uynxxJPm1LBbMvmapbA/R0r/S+WlsS7v6E2s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Isw1LybLoals0KynKWMTU6EM/+yxzh1cQPoBBViYMD2WCJsLDA4tisKq03P5cpVTE
	 uCAzshciaaJjy4dF5i4PL/we5NqMY/acVenfU4mhlH9RKmZ17SeG4DpSFj3BLawPWK
	 JT1oVnBuzvDPFyrTugWiLL5yxPEdl8j9BcCyHk0vWiQmlBiZE6WhlD0riiw8nVFipO
	 cZAul/O+PyJDfYYua53GElGI3R/71dKrvAbyp8TAxfFbYF2pW9L4MDo2xikem7FAUS
	 0bpD2XdhTII6eS1985FHi3OVGy2HoWanHLjFKzgKKRRe8jXF6Aa2vLCnkWkvkcvIyt
	 JsknTb45iSShw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E4C4401F8;
	Tue, 14 Jul 2026 00:41:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4FC2BA0072;
	Tue, 14 Jul 2026 00:41:39 +0000 (UTC)
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00105.outbound.protection.outlook.com [40.93.20.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B5FE440128;
	Tue, 14 Jul 2026 00:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkL3yul7dEjg+JiNLtIFeF7NCGaN49Ys0zabLSbd0paD+mVoWmyynQ5YiUL77+Oq1UQNWIcrxwMYShJaVRS0vPK3aazP/O4bPX5icvrs6jeHubaU9XzRH7GzOSxpkYVNdELPHDKo/p08+JO9WvwuNhGE48B5aXy288P/M/QjO2TR0Gd/H69rLQvsrJVnEFnvP4U2vDosImQahA5mQzYaTMotA2XJRp010ryYHGCHs0c+bcdu7WnGVKzxGkHTHwG5Dg5ONmEpHNCTbBem5drzbekXwoLjoKf2ekCruRpUe5y78hQ6s957nR6c10OFS2vrGCtaYwVTlwO7hEFc3dNBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjotWP4uynxxJPm1LBbMvmapbA/R0r/S+WlsS7v6E2s=;
 b=Q8cM1+m5cQRYQNppbLQJzZBd1OmPWFmHITtJcr/y0D5ujgoXnXyO6dLbIaIknopVxe0tLF1zET9FHpKvatYewp2Q+U4/Jk5bF6LJNVZprBy7ZwL7EwnXOthHaeXQHh/y2WHnv95NAv815b/3OJx4AHLjd54Q8nTH6Kj1Gu1F+LESazc4SUAEo1nauxpqGamkIVlXBQ6AStWquL2wOqVarvx+dNaGcubs1tihqynscWXZVP9zIDJqWi2xRniAE8Tf8OppvJyetALUFZnqJj+cirBpOE+NTWm98NLtXeYYD7J0ERqzMx7ai1dQ7laGzzgd7MHARFZNei2t2lz2llW2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjotWP4uynxxJPm1LBbMvmapbA/R0r/S+WlsS7v6E2s=;
 b=ozX93hPdwarOYDmKsKkVy3gtw6o0jQm9mRTgrcMlvJybfK3nK/46phbZt02ZTqk7x7b2OiDLAt0W9TIpTQMRtX9ZOLqHaQu3OtxdprBNEGJ5xEZZCK15e1bCdTplMO8kL7xlUUOeFiXpU2C4AI3yHmSQ5aTVqptbnFBsgcFgOLs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS4PR12MB9561.namprd12.prod.outlook.com (2603:10b6:8:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 00:41:33 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 00:41:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index:
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIABMdCA
Date: Tue, 14 Jul 2026 00:41:32 +0000
Message-ID: <alV3pK03Y_DC0Een@vbox>
References:
 <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
In-Reply-To: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS4PR12MB9561:EE_
x-ms-office365-filtering-correlation-id: cc7f4df7-3a93-4343-cc6e-08dee140a714
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|4133799003|4143699003|22082099003|18002099003|56012099006|6133799003|38070700021;
x-microsoft-antispam-message-info:
 bPt+c4pAVbE/J3/b9q6FA8d3dSRrndoMLhUSy1H3A3yJeBCllBYjTrpTi3OanG3SEZIZCAK4phBN/rNJhqsw9lqWqgjCsZWCQ+GyVlTslrXf1JnZK14MPpzRsewFlloM6knlCq96pbiLZfbPPYrGMoAwNCX4a1zrNWPpBqNvRliD/VRugS2YyGVvja0c7z6N0gdLSNxinN8hd1p/d/Rbvq4XQRffAa5gkg67w552s4zZuMw7xZViUm9TrFkm9IJvh5IOIdphzX3V6eFHnQ6Rl7bmgl7O3Wt4kuVe8mye25vO2Ptow/mAK3982jKhyiuTsTrdpPxEkMUHUwoMP0AgtPX2mLSLd8Q68xMn8zZRfpjlPW9ym/ryolU/LEzFjYoKU7qFQEYTw38gchQL4GrEqJK9KnKsQQU9iijHaXA2BzBug1tJRkw7dBzlhJLVl3McNJMfx2iu2B+IibzmjcgGyQUQQ4+rQopJukVlGTFh32zRTkOxqCsVsBgtfaZhfoxtqNaX0cTV0rn+JNK6E8BazHNzkSFh72CH/p080giDBYcoGaR+9xZPnftHqmqeMJtHAIfoChdTCDi+UhfZVei0Rp8gfWpV5dQJPaQWMN5rOcBt+Cq+rWNayBY29cHHsD6KLTOsQo5WZHGM2Lm99JssNwL41deiE1dmOUXgPW5l2fbSx71ArWONedu25EjmfRBJUx07ZywzvKxCh5CWN4PkhMi4eBqB/eyoAuIpGf/aSnk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(4133799003)(4143699003)(22082099003)(18002099003)(56012099006)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWhiZGRRRTVlb0RQeVpid0NkNUFGeitVcGdvUzRyd2NxejhmdWtTbHV0dWZ1?=
 =?utf-8?B?NkVhSXdyYVJXNHZJc1pta0pFeWNoWVFJeXVEZXRLbzBScmdDQ3hnc0xCMUhL?=
 =?utf-8?B?WHp1RnVmK2lyWHVIQmVia0VnakU2dHNjYjdNWDlxSUpSelVkZzh6VVZLZ1dw?=
 =?utf-8?B?dHo5MkkvQkRJeUZyOEhMWGJ3MVI5TU51aFM1VzB2YmNOek5nVnZrRFQ1VUtQ?=
 =?utf-8?B?Q2k2ZXpTTHQ1WXVHMEFDb21VcU1ZTVQ1WEo2MGMrL0NEMVJPNHR2clloUUU4?=
 =?utf-8?B?cHBVMUpKQ1FFaDlITnplK1JsV2E5anowSDcrRDZzRDZWdHNUc2IzZjl0QUNL?=
 =?utf-8?B?VHV6NUJlNUpxamtXZlVDZnFrMXorNnhGNlZjb1dVbUllbkVqTkpDUVRaNkdR?=
 =?utf-8?B?NGJaUXZ5dlVlakg1VnA3SFZxbTRXZExHajUxTDZsdzRsalphbmFDQmtLY2l5?=
 =?utf-8?B?VkFwb2JQUllJdGxOWUkrSkFzQTEvb0x3ZHVEZm9SVTIzY0VwcFFHajBCWGFX?=
 =?utf-8?B?L3VVekRuMEdHRFlZTmNHVnhtU2Yzc2lpcHdKSDZBcUFOZ0tJOE0rbTRSdVNC?=
 =?utf-8?B?a0pZK0ZYMVdIRjVTZXM5SFJqMnZRVExxeU15Q1JuclBVeDdlTVRlc2xIWHJj?=
 =?utf-8?B?SGlRejhwUUxjdmpid1lJRWRoUDIxbk1mYzBKMmFna2ZwNlNZbXdJUTBkNnl4?=
 =?utf-8?B?SUY5bkZWQzU4SE95L2x4eUZ6WVlHR3Iwa01jRjVzYVpERXBTeFlhbS8weW1l?=
 =?utf-8?B?S3pHVUx0Ujgxb283N2NtQTMyMEduZm1pclVmQ2g2NS8vcTJQU2pqcE1RZmI3?=
 =?utf-8?B?emliNDhMRHNBRTFKalFJRVU3UXdiZ0Vpd1lVM29lNjFRdXQzWm1hUmRveEZQ?=
 =?utf-8?B?WDUvNWR5SVVMT2lSQUt4ckdPMWUrWVg4VHJ3aGhlYy83RzJpNEk5d2dTSUx5?=
 =?utf-8?B?am11VDFuckx0WFQ1TWVHR2dFbjVoTWhoN2dCWmFOaDJZU1QrQzFiWG1RZG0z?=
 =?utf-8?B?RTNYd3JQQzdjMG8wMEpIMEFJL2FVWjhXQ3orcUFrd3RCVFFWMSswTUpETmV1?=
 =?utf-8?B?dGw5QjdHeTU4Sm40UnRiSUpQWUs4OTJJem1pTjArSGJOamljNjlDTWVrbVVL?=
 =?utf-8?B?OEFzeG1rSm1ydkN3MDhBUWVYRTdaWTk0VlpVOXBGRFpLVDFESUtsczhJdVA3?=
 =?utf-8?B?bTR5emo4UE1LelQ1VnhWdjYwTS9TVG8yK204K1RrTUNhd2NLa1d0YkdOSmFC?=
 =?utf-8?B?ZXNOWU1jRTNaTUVUZFJoK2dIbG5WUGJQZWxsd3NzNW53eUZIZ1l4aFN3eVRU?=
 =?utf-8?B?eVRDTjdFK1ZHRlVMZzk0Z0J3eWNBLytsZm0veHdmbU8yM1pjamVXZmw3YzZC?=
 =?utf-8?B?MURyRUswVHQvaEoxOVhrYnExc3haRW9WY2NFcmw0cDR2Q003MVRPSEthV3dz?=
 =?utf-8?B?L2FwMUxTd0RrNlFvR3pHY2dUeGNTZ1BLcE1UVzlSb3B6QitiVHl3TW5hRm0r?=
 =?utf-8?B?aDdtQStkaVN0eEhvYytOYndxa3NOOHEzdHRUOWozZlU3cDh3cG8yK1YxQ09u?=
 =?utf-8?B?M3pKajc4QjdZSlRXNitjN1ZYQkpqNGhwaFRzZ2RueHo0SlhobG5aS3l1YS9s?=
 =?utf-8?B?NTFXM1dSS01LQWF1VDFyWVkycjRDeHdzNDJxVG1sdGFUNHBCZDNUbDY0amVC?=
 =?utf-8?B?dVFGNW16bXRuWC9QcFpBZHpBaWw1c3E3TmxaQ1U5NUxvMlRNR0xPWks0bzF4?=
 =?utf-8?B?YWpLTTNiNTB1ZjdNWUliMWcxNjdKVkZTcE1FNWhQSExkbDRObjBCL2pEdHg4?=
 =?utf-8?B?cCtZQkJ1NytrVHZnV0l4MGN1eWFhVEMxN0oxMEwvTXJZd29BcWlRc1JMQndJ?=
 =?utf-8?B?N3M4cWZFM2J5azI3WjVuRmxLdlpxeTI5aWdSYkJPcjhvdWMzVmV0WFNyY1NH?=
 =?utf-8?B?Vlp0UXRUWjVQUkViK3pDRHhNa3VOeWFhUVZldGNXL2VhSGtScE0weXVQcDlX?=
 =?utf-8?B?SWF5dUFTOTJpbWU1SkYzYzVCSmkwcFp4c0R2SDVQeFkwM005emhTS2NPaURM?=
 =?utf-8?B?TERqeUk5ODZYK2QyaDBEM3dMUW1Fc25lLzN3Y25MK1pJbE1GU3BCY1pzMS9X?=
 =?utf-8?B?Z0RUV1NLbjczM3B3eW1sanMyZDVmUmZwVmo4TFViR1JzTU9xUWN4RThyT1Nk?=
 =?utf-8?B?SytvVXBwbmhLa2p2RjNLSWJhN3VuTGRMS2p1UDdYb3BrYW9iVE5YdTNlT0Na?=
 =?utf-8?B?OWR1TXNCUGwwN2E4d3dTVnN5RmxKZ1REdDYyZktJaUMzYmdiSGNheklnNHBu?=
 =?utf-8?B?Yi8xcENNNW5QS2VKb01KWnQvYXIreWVLRmw5NXpPWE1zY2NZMkgvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECFCA3769FFDC348A704273134C70570@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PQEomGI3JtfZRXF74K7VUJmtNsAvHD4C3ErRlkbyf40h45qeD343DmUeRWi7UBOdx+3GUOGbdx4e2/FdQCSTOc7VlAuuM/X3+MEkcYbmw32/qBN5eXTsFV0XhGS4EC5Q+eRNdGcJgbS1ZuArcK+IADTOHxZ1cVr0aGbOi5SghzqYk+i0kMU8VI9yiBWoA1Wqhjg9w5frukUwF6jLU+IzDQZ+EEoXtiKtaiuywN7SGNfPKugYCD3K2oXgLcqKvS28roqIMYvTpcT9VyLckfHETx7DAEsF4huLVx1RJyjl7OdBlV3/okz0U+hvOsAjiXCRy+UXjT0HEE3AJ9f7rst6FA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/A7j+rFR7tdEF0GzMY0wtEcNzhEHj9PxtqNpcj6ea5i873zvtFLvyPBCfi3i7zlQ9ZFhiGOE/9JBd60EQ8Q8MIR1UDr3mo9FFiRr8/0EsMnjwjP86898MbKzp9uf6TI5Rsq0RpNmOYoiRmtiZbl+7Em2rn6PUkmxmW/H/kuxW1cim7VsFN9snb+o0W/C1/CbERYNqYJwNr/XWYqzfYpCIlWN/vtFoerlTAmucPJtzPQ6FKAfAn9KOja8lS3qHJto2zqPmMN2CK+rlQPPi4ku2w7KNwuIQ/UiAwkYreamm9/nb8VIG+7B5Di15tha0rdsUZkFDqdi8EvQIRgOHP3SW2dVgYaX2K/bQ0gLjdcOWBrL0RS0SDZmtMsyNdwzbSr7NkD84VZSAuT0ufaKqlosD82OKCyf1to5fMDO/Ku4EtUy02CljNV/NgGuUrULWibLpQ4DPhpZdnsh2VQd90usDu+0t+zoOiLys5Ql3ZEgF8QUiJoarGLxYNnrwfZ5Zsml9T4KAEbjKeZb06m4RQclQeRHd0Tr/11Am8ITJ08+VTSkValDJqti30icWC9Ondc3vFzipHk4YVrNjzUD1s3obRppCPOwLMKUGAuJLYb7VWt7eo57VoPPHMkG3d5sNmw8xJqMC2zZAnDP0DXFelLRyw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7f4df7-3a93-4343-cc6e-08dee140a714
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 00:41:33.0054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g00ulHO7MUTJfa6hVdlRSK8AAkvoAwLwMKhcea8xvGNYa02r8rUA1vmAXH2nx4MFsYtiwjNL+NCH9QA8VCugVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9561
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5585ce cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vFAlBDCH_s3SQioBj9wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MlQNo_xafz4IOJx3ySDrMxrn8-Jkv3jM
X-Proofpoint-GUID: MlQNo_xafz4IOJx3ySDrMxrn8-Jkv3jM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAwNCBTYWx0ZWRfX1ftGVcZU+P6h
 RrE+mmRZiYUYWHf0obuFtkqFV1aSOcEwnHFK4uOYnHA+d0/emIjclKR7h00otuzMLjoLgnVQz01
 CNoqn5ZF5muJhrhhhPQdiDyzrpnBO5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAwNCBTYWx0ZWRfX7owlFeoiQks0
 3yjw4j8oydPfga2zcJ0uYWYj5HUM4C2m38CUmdr0QElh/j78NUeNi8zV0MGBqSxesVJc13+ozmN
 kPOIcgAIfoPzeM/9Qrkxwr36DYdVKOoa1fwoTFrwG2c9WBL0rqKfv2btPNYAmyJOOkmtH2BOOfR
 LRGH6aK5h+RbRYP8GBJz0b19XPJbpU0zW3MZWFWRKaPefn9CQYlcLuwTiLKnQk2DtKcEegObDuZ
 oM23kID+E2sHkjOt9sXyFP6F500FDOYF+OUGLE8lOEQgU7tElNfy8oWZtl6o2yrEFTHpyG7YbiI
 05VO8izb+ys4zHK+9GRVBc2B9lVo6QbMJ3Ugd1ZsfgU/oS2bWz52O5QLkxwpasYsE7sHcTczolw
 BU9kct8Hty57/98mUl2baTJAYHb5aq59mE8UNrzw3KKKmEMcWht9FzDXUmKOaXIYxO2Xkg13IWE
 quymMf14wfdRYk45OKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607140004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:Thinh.Nguyen@synopsys.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F132D74FE52

T24gTW9uLCBKdWwgMTMsIDIwMjYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDEw
LzA3LzIwMjYgMjM6MDIsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmksIEp1bCAxMCwg
MjAyNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPj4gT24gMTAvMDcvMjAyNiAwOTox
NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPj4+IE9uIEZyaSwgSnVsIDEwLCAyMDI2
IGF0IDAxOjUyOjQ1QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPj4+PiBPbiBUaHUs
IEp1bCAwOSwgMjAyNiwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPj4+Pj4gT24gVGh1LCBK
dWwgMDksIDIwMjYgYXQgMDI6MjI6MzZQTSArMDUzMCwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToN
Cj4gPj4+Pj4+IEFkZCBwcm9wZXJ0eSAicWNvbSxoYXMtZXVzYjItcGh5IiB0byBpbmRpY2F0ZSB3
aGV0aGVyIHRoZSBTb0MgaGFzIGVVU0IyIHBoeQ0KPiA+Pj4+Pj4gb3Igbm90LiBUaGlzIGlzIHVz
ZWQgdG8gbW9kaWZ5IGRwL2RtIGludGVycnVwdHMgZHVyaW5nIGhvc3QgbW9kZSBzdXNwZW5kLg0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNo
bmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gPj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcWNvbSxzbnBzLWR3YzMueWFtbCB8
IDcgKysrKysrKw0KPiA+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sDQo+ID4+Pj4+PiBpbmRleCA4MjAxNjU2
YjQxZWQuLjBjNmE4MzliZTgyZiAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcWNvbSxzbnBzLWR3YzMueWFtbA0KPiA+Pj4+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55
YW1sDQo+ID4+Pj4+PiBAQCAtMTUyLDYgKzE1MiwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4g
ICAgICAgIEhTL0ZTL0xTIG1vZGVzIGFyZSBzdXBwb3J0ZWQuDQo+ID4+Pj4+PiAgICAgIHR5cGU6
IGJvb2xlYW4NCj4gPj4+Pj4+ICANCj4gPj4+Pj4+ICsgIHFjb20saGFzLWV1c2IyLXBoeToNCj4g
Pj4+Pj4+ICsgICAgZGVzY3JpcHRpb246DQo+ID4+Pj4+PiArICAgICAgSWYgcHJlc2VudCwgaXQg
aW5kaWNhdGVzIHRoYXQgdGhlIGNvbnRyb2xsZXIgaXMgd29ya2luZyB3aXRoIGVVU0IyDQo+ID4+
Pj4+PiArICAgICAgcGh5LiBUaGlzIHByb3BlcnR5IGlzIHVzZWQgdG8gbW9kaWZ5IGRwL2RtIGlu
dGVycnVwdCBjb25maWd1cmF0aW9ucw0KPiA+Pj4+Pj4gKyAgICAgIHdoaWxlIGVudGVyaW5nIHN1
c3BlbmQuDQo+ID4+Pj4+PiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+Pj4NCj4gPj4+Pj4gSSBz
dGlsbCBoYXZlIGV4YWN0bHkgdGhlIHNhbWUgY29uY2Vybi4gVGhpcyBpbmZvcm1hdGlvbiBpcyBh
bHJlYWR5DQo+ID4+Pj4+IHByZXNlbnQgaW4gdGhlIERULg0KPiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+
Pj4gQ291bGQgeW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBieSAidGhpcyBpbmZvcm1hdGlvbiBp
cyBhbHJlYWR5IHByZXNlbnQNCj4gPj4+PiBpbiB0aGUgRFQiPyBBcmUgeW91IHN1Z2dlc3Rpbmcg
d2UgdXNlIHRoZSBkd2MzIG5vZGUncyBjb21wYXRpYmxlIHN0cmluZw0KPiA+Pj4+IHRvIGluZmVy
IHRoZSBwaHkgdHlwZT8NCj4gPj4+Pg0KPiA+Pj4+IFRoZSBkd2MzIGdsdWUgY29tcGF0aWJsZSBk
ZXNjcmliZXMgdGhlIGNvbnRyb2xsZXIsIG5vdCB0aGUgcGh5LiBUaGV5IGFyZQ0KPiA+Pj4+IHNl
cGFyYXRlIElQIGJsb2Nrcy4gQSBib2FyZCB2YXJpYW50IGNvdWxkIHJldXNlIHRoZSBzYW1lIGR3
YzMgY29tcGF0aWJsZQ0KPiA+Pj4+IHdpdGggYSBkaWZmZXJlbnQgcGh5IGF0dGFjaGVkLCBtYWtp
bmcgdGhhdCBpbmZlcmVuY2Ugc2lsZW50bHkgd3JvbmcuDQo+ID4+Pj4NCj4gPj4+PiBUaGUgcGh5
IHR5cGUgaXMgZGVzY3JpYmVkIHNvbWV3aGVyZSBlbHNlIGluIHRoZSBEVCAoaW4gdGhlIHBoeSBu
b2RlDQo+ID4+Pj4gaXRzZWxmKSwgcmVmZXJlbmNlZCB2aWEgdGhlIHBoeSdzIHBoYW5kbGUgb24g
dGhlIGR3YzMgY29yZSBjaGlsZCBub2RlLg0KPiA+Pj4+IFdlIGNvdWxkIHdhbGsgdGhhdCBwaGFu
ZGxlIGFuZCBjaGVjayB3aGV0aGVyIHRoZSBwaHkgbm9kZSdzIGNvbXBhdGlibGUNCj4gPj4+PiBj
b250YWlucyAiZXVzYjIiLiBIb3dldmVyLCB0aGF0IHJlbGllcyBvbiBhIG5hbWluZyBjb252ZW50
aW9uIHRoYXQgaXNuJ3QNCj4gPj4+PiBlbmZvcmNlZCBhbnl3aGVyZS4gQWxsIGN1cnJlbnQgZXVz
YjIgcGh5IGNvbXBhdGlibGVzIGhhcHBlbiB0byBmb2xsb3cgaXQNCj4gPj4+PiAocWNvbSxzbTg1
NTAtc25wcy1ldXNiMi1waHksIHFjb20sc204NzUwLW0zMS1ldXNiMi1waHksDQo+ID4+Pj4gc2Ft
c3VuZyxleHlub3MyMjAwLWV1c2IyLXBoeSwgZXRjLiksIGJ1dCBhIGZ1dHVyZSBwaHkgZHJpdmVy
IGNvdWxkIGJyZWFrDQo+ID4+Pg0KPiA+Pj4gWW91IGhhdmUgYSBmaXhlZC9maW5pdGUgbGlzdCBv
ZiBwaHlzIHdoaWNoIG5lZWRzIHNvbWV0aGluZyBzcGVjaWFsLCBzbw0KPiA+Pj4gdGhhdCBpbmZv
cm1hdGlvbiBhcyBEbWl0cnkgc2FpZCBpcyBpbiBEVCBhbHJlYWR5Lg0KPiA+IA0KPiA+IEFyZSB5
b3UgcmVmZXJyaW5nIHRvIGEgZml4ZWQgbGlzdCBvZiBldXNiMiBwaHkgY29tcGF0aWJsZXMsIG9y
IGEgZml4ZWQNCj4gPiBsaXN0IG9mIGR3YzMgbm9kZSBjb21wYXRpYmxlcz8NCj4gDQo+IFRoZSBw
aHlzLg0KPiANCj4gPiANCj4gPiBFaXRoZXIgd2F5LCB0aGUgbGlzdCBpcyBub3QgZml4ZWQuIE5l
dyBldXNiMiBTb0MgdmFyaWFudHMgYXJlIGFkZGVkDQo+ID4gcmVndWxhcmx5LCBhbmQgdGhlcmUg
YXJlIGFscmVhZHkgMTIgZXVzYjIgcGh5IGNvbXBhdGlibGUgc3RyaW5ncyBpbiB0aGUNCj4gDQo+
IEl0IGlzIGZpeGVkLiBZb3UgaGF2ZSAxMiBjb21wYXRpYmxlIHN0cmluZ3MsIHNvIGl0IGlzIHN0
cmljdGx5IGRlZmluZWQuDQoNClRoYXQncyB0aGUgY3VycmVudCBsaXN0LiBOZXcgZXVzYjIgU29D
IHdpbGwgcmVxdWlyZSB1cGRhdGluZw0KZHdjMy1xY29tLmMsIHdoaWNoIGlzIGEgYnVyZGVuIGlu
IHRoZSB3cm9uZyBkcml2ZXIuDQoNCj4gDQo+ID4gRFQgYmluZGluZ3MgYnV0IG9ubHkgMyBpbiB0
aGUgUEhZIGRyaXZlciBvZl9tYXRjaCB0YWJsZXMsIHRoZXkgZG9uJ3QNCj4gPiBsYW5kIGF0IHRo
ZSBzYW1lIHRpbWUuIEFzIGZvciB3aGF0IGluZm9ybWF0aW9uIGlzIGFscmVhZHkgaW4gRFQsIEkn
dmUNCj4gPiBhZGRyZXNzZWQgdGhpcyBhYm92ZSBhbmQgaW4gbXkgZWFybGllciByZXNwb25zZS4N
Cj4gPiANCj4gPj4+DQo+ID4+PiBBbnl3YXksIHRoZSBjb21taXQgbXNnIGFuZCBwcm9wZXJ0eSBm
aWVsZCBoYXZlIGluc3VmZmljaWVudCBkZXNjcmlwdGlvbg0KPiA+Pj4gb2YgYWN0dWFsIGhhcmR3
YXJlIHByb2JsZW0gYmVpbmcgcmVwcmVzZW50ZWQgYnkgdGhpcyBwcm9wZXJ0eSwgc28gaXQNCj4g
Pj4+IGxvb2tzIHdheSB0b28gbXVjaCBhcyBTVyBwb2xpY3kuDQo+ID4gDQo+ID4gVGhhdCdzIGZh
aXIgZmVlZGJhY2sgdG8gcmFpc2Ugd2l0aCBLcmlzaG5hLg0KPiA+IA0KPiA+Pg0KPiA+Pg0KPiA+
PiBBbmQgRG1pdHJ5IGFscmVhZHkgc2FpZCB0aGlzIGF0IHYzLg0KPiA+IA0KPiA+IEFuZCBJJ3Zl
IGFscmVhZHkgcmVzcG9uZGVkIHRvIGhpcyBjb21tZW50IGluIHYzOg0KPiA+IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvYWhqWXdK
dGlNc20wQmNDaEB2Ym94L19fOyEhQTRGMlI5R19wZyFaRUc4bC1zREx6UUZhaGJ6eTNKdHVMV2Ro
cHFRNFZRN1o2MkFhcVA3SXhKN3IzVWEwVWZVdEZnMU5NYXIwbm5Qdzg2V2xLWG02SjhfUE1mTnZn
JCANCj4gDQo+IEl0IGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHR5cGUgb2YgcGh5IGlz
IGltcGxpZWQgYnkgY29tcGF0aWJsZSwNCj4gdGh1cyB5b3UgZG8gbm90IGdldCBhIG5ldyBwcm9w
ZXJ0eS4NCj4gDQoNClRoZSBkd2MzIGdsdWUgZHJpdmVyIHNob3VsZCBub3QgbmVlZCB0byBtYWlu
dGFpbiBhIGxpc3Qgb2YgcGh5DQpjb21wYXRpYmxlIHN0cmluZ3MuIFRoZSBwaHkgY29tcGF0aWJs
ZSBzdHJpbmdzIHNob3VsZCBiZSBmb3IgdGhlIHBoeQ0KZHJpdmVyIHRvIGlkZW50aWZ5IGl0cyBv
d24gaGFyZHdhcmUsIG5vdCBhbiBpbnRlcmZhY2UgZm9yIG90aGVyIGRyaXZlcnMNCnRvIHVzZS4g
VXNpbmcgdGhlbSBpbiBkd2MzLXFjb20uYyBjcmVhdGVzIGNyb3NzLXN1YnN5c3RlbSBkZXBlbmRl
bmN5DQp0aGF0IGJ5cGFzcyB0aGUgcGh5IGZyYW1ld29yay4NCg0KQlIsDQpUaGluaA==

