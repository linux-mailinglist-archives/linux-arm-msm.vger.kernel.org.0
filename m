Return-Path: <linux-arm-msm+bounces-118127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BulMDotfUGq4xgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:57:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D052736D44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:57:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=synopsys.com header.s=pfptdkimsnps header.b=k+Exikyg;
	dkim=pass header.d=synopsys.com header.s=mail header.b="kk/S+Vim";
	dkim=fail ("headers rsa verify failed") header.d=synopsys.com header.s=selector1 header.b=NgmV6Zhl;
	dmarc=pass (policy=quarantine) header.from=synopsys.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118127-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118127-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2679F300A259
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DA635E549;
	Fri, 10 Jul 2026 02:57:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0731A268;
	Fri, 10 Jul 2026 02:57:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652223; cv=fail; b=HIJxIerZg6DEhw+DZrsTIRIsPpFFGkzXsvfXJX1LP818W6oXim4B0QZJFggX+RPuOvoQVZwQtX7M7BPg5sDTJvTy269q63JOTq1Ysy95ZJms1JW318EKY9aymBwd6qeiCKqW3j1uo8/Ps12XQdeifEIZrvBdw0AV8BAap9uKA3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652223; c=relaxed/simple;
	bh=LE+GUVyuqNKyC40XpIHGwpN7v7Rl8qDpcip5wnxPXSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BfygnJjPB5Y8qvmJAOfv7ey4MxWd0pc2Ss/Yk46kdS/19GlNF6amzqsAUAh+3pSRZs16CGtVK1u8tn9jUSDa2AeBJX1US02LXTTI5V1MiUi6Yp5k19JInP06OyJD3gFzb2m1vz5O7SfiX9N7Doq7w4W2v/p9U3AXj8LbHN/HtAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k+Exikyg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kk/S+Vim; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NgmV6Zhl reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669MMONe2275152;
	Thu, 9 Jul 2026 18:52:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=LE+GUVyuqNKyC40XpIHGwpN7v7Rl8qDpcip5wnxPXSU=; b=
	k+ExikygKMZwiPw1Cy0AJd28q7PuSAealyWNKpVO4h98jNhuIbEk+MJNawHSAauw
	vNSL5PYdbEeX4Kzq0KGLOo8Sd21hZIk7CZ1RVl8fZmS/ndZ5k2KJfFCKBm5/wxsU
	/J6CgSqchT17onhLXJ1DzxMX7bmMD0FocT6ASjBkhEiFW0ow30cvOf3BvBanbSl8
	/HIc6luYMvBwsYTNYxL2Xh9VqTJu7GrRC2+eWr0WFwh46CGkByCwYmb0PPWsfqUs
	G5H0aSyhL8QodtWMWny0DtmhV7lUm+N2V2vrqU3IN7FIndm4eI0cCY5Ezbdu82wj
	+CzTifkymN1uD5zEBFYz4Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4faeu3brc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 18:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1783648373; bh=LE+GUVyuqNKyC40XpIHGwpN7v7Rl8qDpcip5wnxPXSU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kk/S+VimWiZi3u2mL0gR4ENPh+3s4LTq5Z8G7daR4i2G+d32Tx5zCMsIaSYBK5x5n
	 w5OVS4ICSVSswkl5QrpMIEZ75o97ban2JhqJdViFu/L7IDK0110uAFHJi0J0ZM3aMs
	 kS6DyEVPEY/Hsjv3qkuAKGeNsVXmwAbViXflv988Q+9jgECgzgiRVDwVbCI2R15vzD
	 OZqSiWz5tCOzK9A0jCR6qLdRdY4qzFxx70vPrhaHWOXQ4iFRAChepwOa6neOaw+9tQ
	 uVWksFqOO0fENFBfHpHXBipHTbMwwKAhGBcPNgFJ+23n9B3vTQyh3fAZ2iwBjIz4B6
	 DXqvL6Yrbuoww==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E62240351;
	Fri, 10 Jul 2026 01:52:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CDF74A0077;
	Fri, 10 Jul 2026 01:52:52 +0000 (UTC)
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 23407220183;
	Fri, 10 Jul 2026 01:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJqr2iVhnc896j+aNug5j7ZuEQ+hqhePJSUscaAkwukr5/v9ndD2vtJIJ4Xqo1d/OHHJ7tv7Wtbqrd3U6pysQ7Xlrr9n7u+ImaYvU22VpCtP2v56AwocqBJOMJsy3A1ImiieSQ+fLJJ2tkryKqLc/rlT2FUspSTu9hmo8BKDfLPRwTVOM4NsRkZWPBk93QRuPijGjIBanVYOSpcXA/O0zcUpyCFDTT5ixB4A3/aEJj7THlMQ5MF7PdwtLxAt7FjFtcUR1Ev5IqcwMVvEMgSxeOiWX5C5UyFzyzBGlTanwbGfOG7zJdGMgFQUuK4ZroJwusO+RlQRyLSQlxdIgORyOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE+GUVyuqNKyC40XpIHGwpN7v7Rl8qDpcip5wnxPXSU=;
 b=kpZdbO108YEgiQGAIR7HgZFRPRwMIR8TAx4VqGpX030rFTP0GqKwiVo2PN7jApOJXVI12Ak4Wr6yWeO7QotDwkjX9wcDckDlNAuNqxM5VgvQIllTUfVrOXHPjLFNXZFXjJ+tguxqcLm+EXw/ZRGuMme+coXfhQ7/e3Pxb8cKct5HJerTeojzVX7aoluvpu27RjKLRHxDXlcTT7aN5xT+AulWfMEzY6gX09jq+Y//av5KlcHDCUAxmnoDMtmrtJfn7Gz2Q52EC+hLcFa8NI8PVaXOGuYNbzvR4skjO/9bfm6yo3NT5rsZ4IMSsv5NtENB9+d6ye3InJAfnXjm8v7a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE+GUVyuqNKyC40XpIHGwpN7v7Rl8qDpcip5wnxPXSU=;
 b=NgmV6ZhldFMvKARUNYkdT4Md1n2qK1CdDyANPamxvNWUoYGK8pVGr8vsmw1uWM3HKg1fEyroi83SLE+uFMsb61VEHVuruAR7a6btlX0hTZ/n/lGlxBaUVIU2FoxWu91XZItjYpyK0aSi3J4q+AdTOakSqwRRBNlHPkoWF7dJVJ4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 01:52:47 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 01:52:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index: AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiIA=
Date: Fri, 10 Jul 2026 01:52:45 +0000
Message-ID: <alBOC18CpkGDhM2m@vbox>
References:
 <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
In-Reply-To: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ2PR12MB9190:EE_
x-ms-office365-filtering-correlation-id: 84e999bd-ab36-4260-2625-08dede25f018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|38070700021|18002099003|4143699003|56012099006|11063799006|22082099003|6133799003;
x-microsoft-antispam-message-info:
 yeQOt8nnNV5x9W+ZKo7NMES910OsHMSaLTMhakgQAroQBgegR8EMUIxwcA2zD8y9zk0LpuglLhtPEPtlTvfl/QjB6EkflSrfFhoghNi9lL8p2Nd8YajVLWuYMLQjqBfzDZABpb7iccDK57m3vYsdBSSKRR4g2Z1JVRBy0tr4IkW76HldjmeFyPDhAADL07TTX7WXHMCTC7En+4aifFCIIEhRVow6LntNz4SVi+5XPt1Rmm+y4u5+2QX7IbwaUTrYzrLepa3w9l5uxvYoiy7WDHyGdv8J7hpor5lDpY51xgRmqigatSwDWC+nmi74M72r88jc95Me2ssFEa06EqF83cZb2ZGqyYGHkBJXyEI+aD7mdP4/yyxwjo27Y6RvTNsIJktwvMcjMxcNFdFz0nvFpv8YPjuxh0/XfzQXQOHbvPEFjE9Gxn47Vew2R7ZABD9WWZcW+97qMOcbbZUTUwNsh+l3LueEPKVQoRaN71dmAHqk9ZZSJYUuzulDVaaWnCG2xURdo/8xgPVxZKpUg4LKDTdGDzM7Y20wlks2Ew+0LAxznw4YruyEuxtMRRVbkzaPK9aNw1aiD2yBVixfvNFk3Tt61BkzQC4+Nz8PDrj1/T8A02lL8MVL1t25dl0OHB/J7v40xIS/FefqV54xGoiYKGZ9W80vjN0fs107vuY9ZfzTPIIog2O2XjvZtmaWOblF71jySH/18vLcESuTqYwybmAZ5cK5YF4AgamN++TUH80=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(38070700021)(18002099003)(4143699003)(56012099006)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eStQQWNqR1lXQmwxSGJPUVh4NTVrZkMrbnhBbE10a2k1UGsyQkZoaXZmdnJl?=
 =?utf-8?B?R3VmTExFbHp6WHIzRXN6NmYvY0RPcFlqVVdBRHRGRHFpTG1KTjdmZEQ1NGtI?=
 =?utf-8?B?cm1wVmtKanl6UW1SNHZsSTRrbUJjcFFHQ2NmRmRaam1weGVQMWFGNVY3N3pU?=
 =?utf-8?B?SEVHdDVlZitLTFRhaXM2M1FDbk9kaXNxK0QrSXFIRnNIV0lVakFYOUtveVZu?=
 =?utf-8?B?ZElELzdubUhWc2ZKeG1NamhWWm1Tdzc3b2JwV0NyWDVIdkFCaHZjRWl2dENE?=
 =?utf-8?B?QlBCb1Y0Skd4TnlQYkcxYi9GTXVmQURhZng5dlZCODRreGJmNi9QOGhPV0xO?=
 =?utf-8?B?Zk9uSnZyWWtQczN1dXRaTmdmTHJIS3ovaHhGS2d3d0RtWGNVQ3phMk14Y2NJ?=
 =?utf-8?B?ZGZSUElIUjVxaUhFL1JvWmczNFNPemVmRDFpOTFsU3B4bWVYSHczVU12SzlR?=
 =?utf-8?B?dWEzeFBrMjRRR3RVUFNQMG5iT3Mzd2VFeUpuaUlRN2JMaW14Q21CbVpCQlpC?=
 =?utf-8?B?MUhTOVk3dWZBUlhXUHZEVEJjYThJNDU2d1ljNnEreVRGeGsyUGc3S1V1eU9R?=
 =?utf-8?B?WStkRG51SEhGSk1xQjlWYUhuMTZSSWFmdzYwcjJXdjNUS3NLVUdReHF4cVZ4?=
 =?utf-8?B?TUhpMXlING5HTWpVMTFXRTlJT0ZiODhFOWtrS0E4Wm12Y3B0NXFOTGIvMzlT?=
 =?utf-8?B?QTRHUWZ6Vk9TT1ZiWjFhOTNlV2pkaHhjK012Z0VjODErKzNzUVQrUXF5WmZx?=
 =?utf-8?B?cmU5RFJuTXR4cVk2SnNYc0RBWkpKem5hYktobkQwcmNUQ3p5SW54Q1lIZCtC?=
 =?utf-8?B?Z0YzcEoxQ1BKVzl0VENQKzlGRVR4bm8zMmFJSm50SHZwL0d0YWdjcTlNRXpI?=
 =?utf-8?B?RU5IYkh1UWlJNjZlL1dVeHVBUUZkRkUzeVVLZTc4b2FUZHA5NDZZZVZaUFJ4?=
 =?utf-8?B?bi9uOXRLOG9ROUZaZkZKK0pycmM4dGZjOFpOYmJESk1LNHpFUGVFRVFtQmZa?=
 =?utf-8?B?QUorQkJvR0hoaml5d1BxUzkrZC96d1FRVnJOOFUxUWd0cFY0TmlxYi84VjB5?=
 =?utf-8?B?Umw0MlJmRkJuUm9qMHpiZzFqZkZYQkNiWEszemdPQTlrNjE2NU1IMUY3RWtT?=
 =?utf-8?B?c3VZWThyeXFDa2pJM3VYT1ZYdjBCQklpZEE2QkJpeDJBbXBWUmRTRW8xaWFs?=
 =?utf-8?B?d1NPNVpDQUphRDU5TWNYdWhZWHBvSlRjSWx4TjRrR0MyVis3VUMyQXRVdjky?=
 =?utf-8?B?Y3NGdVltdFI2UDZPdFR1ZGFSSm9QcVE3ODhiY2VTdFlJdS90QlBDL2k3dU1G?=
 =?utf-8?B?Zm1oQ1N2dnVENHl2SFFwc1pqMmFIanZhOVJqeUNBVW9GbEZidzZzZjNPLzUz?=
 =?utf-8?B?RXdGZlNVSkU3VC8zZFNqRGhVWlR4cUdVVDhVSkdrOTdFT0FUSzVQWi9UeExo?=
 =?utf-8?B?dDc5R2dIMzI3Q2Rld2hoU2VwdXRkWTZrNktWL3J2YkV5MmNkU1FScTFFQUlP?=
 =?utf-8?B?ZFNuT1dzQ3U4cU92c0wvL2UxQVcyK1Y3QXFwbHd3K3krTEEzdFI1amlqU09O?=
 =?utf-8?B?THVrRmtEb3l0SndvOE8xbmFvYy9YS2NUcnFwY2dqMDlWYzhHbkxoUmZBblFn?=
 =?utf-8?B?RDc5VElqbjFmUUt6ZjBLbXlnNS9xWEdRTFJDbE1PK0tjMXFEMkZndFIyczZj?=
 =?utf-8?B?WUMyWUhXMGRvbGZBc3VKV3VtV1lCNzdSWU5SVkkxTCtEeWFkNlJtVmdGL1Vy?=
 =?utf-8?B?dWM0U3dybjM0bGRVZGpwWG9BYnFHKzAzcHdsTTNlN2pXM2NHY0Q5UU9BZDd3?=
 =?utf-8?B?dUptN3lOb2FvVENYOUVKOXhYaWVYakR4SDIrWTZtMjNlUGQrenRCT2VualpC?=
 =?utf-8?B?Qis3eU1tMlNRRVZ6YkIrcU5Ya3dPNHJ4d1hTbFFlNnI1VXYzWGt2ZVFGazBH?=
 =?utf-8?B?eEdnT2pWWUdvL3dESnpDdkxvU3p1SjFoeDlVano0SXg1NTdqOGgwZ0hMbHFU?=
 =?utf-8?B?cmtrWHQxWXJaenN2aUUxWUdVYlRpQnlLOFNFZkt1Q25uQkFTZFhpNitTUXRz?=
 =?utf-8?B?Ry9oeFl1anFHVDBxYzNXRVlpVDhIaTJuT0xTSDN4bUFnN1VzSUowdG1mZ3h2?=
 =?utf-8?B?ckp2em5URzhUQUt2cXIxWENycDdHSTFUajRvOEV0NTZJdHZVMjArWEpsUXMx?=
 =?utf-8?B?Yzg5SlFwMVZRWVV5SG5RS1pySGd1ZnduWXZmd0JJZE16OUVDM0R1d29xWW1p?=
 =?utf-8?B?cTRvdkdFMGNwMC9nU09qamJWdVFrVnNBNXNUN2o0NjhaUS9VSVc0b2RVTzh6?=
 =?utf-8?B?cDh0L0tXa2oyN25ITWJsRGI4WWNmNnlkbTVMZ2tFZGlLZTNUNFdnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77CF488129ECF64AA0CE78BB08C820A2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	fEp2Lkdu+xYIQul0no5SSZ9vInWSONYIlhnO2MbKNKvSQbsjUDGOE5K5kn8T/eQJs42cKILenujsiNt5NAL3KrOyGtC7fUkfWrD916CW8Bm6Q7oBsKqZ8XASGrbLRteQkL7tXWM9BrFxp7iCPc8OfUoBLJx4qLR4nerI2P1+nxXl7dj1KgRLyFCjH/Bhhpsru9ZAnMlPbMb2XAr10hUrV8PbHu5dPuhI2+531yImkcJdNJ485hok+krbJdgUj+9pDYiMCCHwKyfSueIIKrFtM3/85RE99pR/WjQcxJib6wglsq3XfCbHPNSQwFUBQzOeE1MrgHRIBuuONCGW+0uEOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bzaTmQ/m6/vqOU2Pq4vVKCmdZQpAmfZxQok2hbXtDS8/Uy5xmkLXFmJuyNxrpgFtPTNJvkF3gTY9YOg7ju5gH0lhQ4exImyAw1g8Ih0cbTMh7tc648NphHBvTNl5rLWwj/qOGyms4d62Lr5NWAXrGpHFiARvNldToTXtKws9ycCYVyg6NARWy1A8AlsK/lCXXGiY27Ath3URmgyENoawa+77As6N2iCXgk5TwyOVl4RUI8ETnAvSXdjdO50V219rP1O/3b8MY7Sb/gHDRYi+u7WeoL+xcyUk+itMIaRxOTVeLWjOENiaY5XpOgOF8XggfFJ5DPDXH69B6DWB9+wBWyZPxCi7IG2O7MzQ3toJ8DGue2swg8OCVFrh16lDyVHWfLuqsEE/r58SqdqMLz9FsNAHpSBzNCIitMR7q+FHyATG3M9O4f8qIgMYjW5dvqP2I/zJ11ZOaJ4JCGu6AOOCp5YOomhht5Bzddut66eQS1EuHlSAruqPAR7miOHia9fR90vW6ZZ3TsfBG3antDeXMtCAVXd6heMWfCdA9nAlTZwCL1lQxvTvMSYiEl+B9VB8J3DtiEGFdS9TzwXMLRZrLFPHxHQm/kV1Mw0eOh9FYkHmCaTOqmFecI33BeXrhTN+8qDw1ZV4o7KVTDLrAn19pw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e999bd-ab36-4260-2625-08dede25f018
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 01:52:45.6401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6X+k/UP/pzfhHN1sD3ZvCmfVo2EDfrOxqTYd5s2+2p/exTnuCdhTj80FMJmSauYnh1VnKSeEbdZuROjWV8lJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190
X-Proofpoint-GUID: y8GXJtWNqsVweWnfoxsoUORnBWpIW36A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAxNSBTYWx0ZWRfX57Q3466vvXxp
 +cSKMIutMs5A9jxIRxOjN76RPbqNYHEab4xg2FOmD2vAGYSzvkh7LENyS02Pn7QJyC2bR2HZ6px
 OyEogVt49qlgYiVOml5k9GRwzHR37j1aG0a9luThN7AB1y76nDoV4M1Qcl5cAZyNoKoQxGbn+98
 aQHd6dsMVzUsmn6gwl8nD45oGKdKHrwBxi9J+Qxaghupl8gynkytZ28d338ojWuz/Rjuy08kJO9
 SRoPsoG4PCYT7f0HUlhW8Ve9Wmfn4n1te+AEMFXNOHfyj3l3qOh/GxeXiPqAG2Cl/IST2CXk1vs
 d4srMChqxANjqC9VuWfdhY5xpFsE+k6q5oCo8NEy5r48pGDnNgZMvyZAEMToku+c+dwQy64cWxA
 ltRSIOVcPxpkIoqvlWTNHIVEc0QAGrlpS9y98KlylhNsHEQZJPai3vanWAXAcojfzGra11eycQ4
 4oJ6MDKzvfv5F9dz2lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAxNSBTYWx0ZWRfX+JFSI30Ka4F0
 FlG9wycOTESMWPynf76IUGjUGbkBhAKXRIYFoM9sW3VDuc4z8dP27fqh8mUuWxMOyRwKOulWi9q
 2DcrXOwgosXpZw0pq632UxAG2kPSW3U=
X-Authority-Analysis: v=2.4 cv=U72iy+ru c=1 sm=1 tr=0 ts=6a505076 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=EUspDBNiAAAA:8 a=C77DFiaKGdHkvBkVOSEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: y8GXJtWNqsVweWnfoxsoUORnBWpIW36A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607100015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:from_mime,synopsys.com:dkim,vbox:mid];
	FORGED_SENDER(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:Thinh.Nguyen@synopsys.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D052736D44

T24gVGh1LCBKdWwgMDksIDIwMjYsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDA5LCAyMDI2IGF0IDAyOjIyOjM2UE0gKzA1MzAsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6
DQo+ID4gQWRkIHByb3BlcnR5ICJxY29tLGhhcy1ldXNiMi1waHkiIHRvIGluZGljYXRlIHdoZXRo
ZXIgdGhlIFNvQyBoYXMgZVVTQjIgcGh5DQo+ID4gb3Igbm90LiBUaGlzIGlzIHVzZWQgdG8gbW9k
aWZ5IGRwL2RtIGludGVycnVwdHMgZHVyaW5nIGhvc3QgbW9kZSBzdXNwZW5kLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1
YWxjb21tLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sIHwgNyArKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sDQo+ID4gaW5k
ZXggODIwMTY1NmI0MWVkLi4wYzZhODM5YmU4MmYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55YW1sDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9xY29tLHNucHMtZHdjMy55
YW1sDQo+ID4gQEAgLTE1Miw2ICsxNTIsMTMgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgSFMv
RlMvTFMgbW9kZXMgYXJlIHN1cHBvcnRlZC4NCj4gPiAgICAgIHR5cGU6IGJvb2xlYW4NCj4gPiAg
DQo+ID4gKyAgcWNvbSxoYXMtZXVzYjItcGh5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4g
KyAgICAgIElmIHByZXNlbnQsIGl0IGluZGljYXRlcyB0aGF0IHRoZSBjb250cm9sbGVyIGlzIHdv
cmtpbmcgd2l0aCBlVVNCMg0KPiA+ICsgICAgICBwaHkuIFRoaXMgcHJvcGVydHkgaXMgdXNlZCB0
byBtb2RpZnkgZHAvZG0gaW50ZXJydXB0IGNvbmZpZ3VyYXRpb25zDQo+ID4gKyAgICAgIHdoaWxl
IGVudGVyaW5nIHN1c3BlbmQuDQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+IA0KPiBJIHN0aWxs
IGhhdmUgZXhhY3RseSB0aGUgc2FtZSBjb25jZXJuLiBUaGlzIGluZm9ybWF0aW9uIGlzIGFscmVh
ZHkNCj4gcHJlc2VudCBpbiB0aGUgRFQuDQo+IA0KDQpDb3VsZCB5b3UgY2xhcmlmeSB3aGF0IHlv
dSBtZWFuIGJ5ICJ0aGlzIGluZm9ybWF0aW9uIGlzIGFscmVhZHkgcHJlc2VudA0KaW4gdGhlIERU
Ij8gQXJlIHlvdSBzdWdnZXN0aW5nIHdlIHVzZSB0aGUgZHdjMyBub2RlJ3MgY29tcGF0aWJsZSBz
dHJpbmcNCnRvIGluZmVyIHRoZSBwaHkgdHlwZT8NCg0KVGhlIGR3YzMgZ2x1ZSBjb21wYXRpYmxl
IGRlc2NyaWJlcyB0aGUgY29udHJvbGxlciwgbm90IHRoZSBwaHkuIFRoZXkgYXJlDQpzZXBhcmF0
ZSBJUCBibG9ja3MuIEEgYm9hcmQgdmFyaWFudCBjb3VsZCByZXVzZSB0aGUgc2FtZSBkd2MzIGNv
bXBhdGlibGUNCndpdGggYSBkaWZmZXJlbnQgcGh5IGF0dGFjaGVkLCBtYWtpbmcgdGhhdCBpbmZl
cmVuY2Ugc2lsZW50bHkgd3JvbmcuDQoNClRoZSBwaHkgdHlwZSBpcyBkZXNjcmliZWQgc29tZXdo
ZXJlIGVsc2UgaW4gdGhlIERUIChpbiB0aGUgcGh5IG5vZGUNCml0c2VsZiksIHJlZmVyZW5jZWQg
dmlhIHRoZSBwaHkncyBwaGFuZGxlIG9uIHRoZSBkd2MzIGNvcmUgY2hpbGQgbm9kZS4NCldlIGNv
dWxkIHdhbGsgdGhhdCBwaGFuZGxlIGFuZCBjaGVjayB3aGV0aGVyIHRoZSBwaHkgbm9kZSdzIGNv
bXBhdGlibGUNCmNvbnRhaW5zICJldXNiMiIuIEhvd2V2ZXIsIHRoYXQgcmVsaWVzIG9uIGEgbmFt
aW5nIGNvbnZlbnRpb24gdGhhdCBpc24ndA0KZW5mb3JjZWQgYW55d2hlcmUuIEFsbCBjdXJyZW50
IGV1c2IyIHBoeSBjb21wYXRpYmxlcyBoYXBwZW4gdG8gZm9sbG93IGl0DQoocWNvbSxzbTg1NTAt
c25wcy1ldXNiMi1waHksIHFjb20sc204NzUwLW0zMS1ldXNiMi1waHksDQpzYW1zdW5nLGV4eW5v
czIyMDAtZXVzYjItcGh5LCBldGMuKSwgYnV0IGEgZnV0dXJlIHBoeSBkcml2ZXIgY291bGQgYnJl
YWsNCnRoYXQgYXNzdW1wdGlvbiBzaWxlbnRseS4gVGhlIGFsdGVybmF0aXZlIGlzIG1haW50YWlu
aW5nIGFuIGV4cGxpY2l0DQpsaXN0IG9mIGV1c2IyIGNvbXBhdGlibGVzIGluc2lkZSBkd2MzLXFj
b20uYyBqdXN0IG1vdmVzIHRoZSBtYWludGVuYW5jZQ0KYnVyZGVuIGludG8gdGhlIHdyb25nIHBs
YWNlLg0KDQpUaGUgInFjb20saGFzLWV1c2IyLXBoeSIgb24gdGhlIGR3YzMgbm9kZSBpcyBleHBs
aWNpdC4gSSB0aGluayBpdCdzIHRoZQ0KcmlnaHQgYXBwcm9hY2ggaGVyZS4gSWYgeW91IGhhdmUg
YSBiZXR0ZXIgc3VnZ2VzdGlvbiwgcGxlYXNlIHNoYXJlIHdpdGgNCnVzLg0KDQpUaGFua3MsDQpU
aGluaA==

