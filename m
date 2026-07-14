Return-Path: <linux-arm-msm+bounces-119105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9JexAIfFVmoqBAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:25:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794E7596C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:25:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=synopsys.com header.s=pfptdkimsnps header.b=CbRR1vsV;
	dkim=pass header.d=synopsys.com header.s=mail header.b=SZBOxKZj;
	dkim=fail ("headers rsa verify failed") header.d=synopsys.com header.s=selector1 header.b=S2lzzGAG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=synopsys.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E906D30B4598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 23:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCDC433037;
	Tue, 14 Jul 2026 23:23:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA31432E69;
	Tue, 14 Jul 2026 23:23:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784071396; cv=fail; b=euSssMNw37Bu1AHXZmnbDo4+BquSPZNjqtSkhY5Noolrvkgf16c798Umzx/nh3qSrtAnZFuOUr41SCVT3/kDved6k5auFKkZQPqPeDrY+w4RFEguprwK9B78YFTCda6X2RzR6zacDQI41rHS942uU3AEqmqYLmigl+Ym6q/Gyus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784071396; c=relaxed/simple;
	bh=J5DsFTzNIJOfTdyQpnoBh6z9JgKMWX9vDwTixlt6qec=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A/8zlztGNRLzjous+e1MSO4C60pnLS8U7lDtG+rgMQ27dJvcYuaKbwqlefBWIFjPO+uSxUXlJ0Zd4r3pGYSQTmk5k/DExHGQeNd1fuT3DiCXqJy5dP1ncYWxNcqIqGGXdWvvrmHaVrJmTmgGTXlYHypqZmUePzBK7GbyKxf8e8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CbRR1vsV; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SZBOxKZj; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S2lzzGAG reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EJ0KMp062435;
	Tue, 14 Jul 2026 16:23:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=J5DsFTzNIJOfTdyQpnoBh6z9JgKMWX9vDwTixlt6qec=; b=
	CbRR1vsV/+JDiMubP0QotBleuTBdsX/Qd7D7J57dhwYyFAuEPXbEG2RottO/rwc2
	/l3a1XGpXVZk7sKoWaBWrBh0LFM82Pu4dKF5YVEqBjEJ9HNxzESfPJ731PKVhRI6
	JIFOBEtXDiWtixbLND8y1z0hX6w+sGAdu5az1mDrGIQLbvgNma+/I/pcsdFmg1Ek
	t7m1ojgXD1yHFi51CDwsQ1irh9kaDZ7Qpg1RX5bx9xsawdRuIX1oj1wgbyTnlALb
	HM23M7cNYbTFsFWD7XJW+9boGvkr47tfijCv7Y9D+b8JL26WXSfzEGgqMG9rKc44
	TVusc8z6BPgrmu1HcjSybw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fdqdxuky2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 16:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784071387; bh=J5DsFTzNIJOfTdyQpnoBh6z9JgKMWX9vDwTixlt6qec=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SZBOxKZjeYxMtpXSSKQ0YjvnHCF+gl9J0GWvBP8ykaNj0F9ITSYPQJPNv5zAVVRKR
	 j78T71gC4H1XDb+mN+npS+7OoayokVQWJS8Fzq4RYURY2GOKoX9gzK37VBCJvSbIWr
	 OzbhVJQwDzpKcWSrE3neCfd5DPfgbAc6CYU8pWpYlr8UsL/gPO++9lcUayqqRG/0bB
	 TQHjYcOuEAENRfAw6utc5VhwfzQkx+hQT0xMDO5WK8+cw2NwtGWpgmUtB5wfu/FQQV
	 G/AvU2fqKVr9qVDsMKurndOvaRhJW6HdjTObrt4sdUK3vRxgLWSdFcHJtNwLQIpigH
	 cwF9fKCEv6xrw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6729F4012F;
	Tue, 14 Jul 2026 23:23:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9861FA0068;
	Tue, 14 Jul 2026 23:23:06 +0000 (UTC)
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00406.outbound.protection.outlook.com [40.93.13.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BBEB2401F9;
	Tue, 14 Jul 2026 23:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo6cFYMbmq43ezG+zZ6AgbpPG6/7Yv+ydilZyDuZQbVnz/7tGCFNmi78WNNYNVMja97zQ15+87y7ic20ImWrwCKdIYZljztxlJGCo5H8bqh3webSVzRCZFoYDqbRWhsVxYL8E5VziN2Sce+1JQbcff+eXMvW0nv7NhMUiS8uEm8v5PMjr/76l0IFGNFAP1iFBjAD3Uz4O5sUFkHSGtVb8hOecp5s8jOKj7VS1u8Vg7NMYXWvoOnasEpaiZjgI4px2M48hyikl6Mf9quLReYQxG/8obX4fvRz2xmwCQub64d7xACXSHiCiVhlDkx14i4Hnj6pEzAM6Z5kwX5ZzexVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5DsFTzNIJOfTdyQpnoBh6z9JgKMWX9vDwTixlt6qec=;
 b=kzekoj8KJ+e/CydzPeAf/KTdE9UqGfErFJoyIYMNW2talor5jKYVvX6OQEwAVwtHIs2e7TmOoy/6SdYAixRnpqk9vXoClQgRBJfwkR1bgr3TtFx6zfEc0ztsfwpSfpMB8boaFnZ3JS8bRc9DS0qI9ZpN99zTFqpB90BqnbqDPdTNZZy03ZV0wZ923uxHQR65f2KnHbLEsKAeomlkfW9h+ofHf/uOHcwt2cIrC1DfPuQYyrIgfmpTd2bj5iJJV4i87exxuj6Ma1KICMWJbeBNKxrUs+8QGJiX3mQkpg+XP1y79zPLX5U39vvh91hF8VUpxaPUrGx4RC94LTyiE2XgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5DsFTzNIJOfTdyQpnoBh6z9JgKMWX9vDwTixlt6qec=;
 b=S2lzzGAGTdKTj5Zu59tgnwnodlp2+FrhFyTX8Oh8vs1SwewpDb2o++nGOS4sIjyIF2lBIjmb/RlF0HTkTXq6328dua8nkc2RdRWb7f2SaXHjJND6Tpmll6+CuI4nYG5dPKVzn9rCxXLiWMvVz9/H6pNy9w8zltMbYNwsBXL1Irc=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS4PR12MB9745.namprd12.prod.outlook.com (2603:10b6:8:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 23:23:02 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 23:23:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoA
Date: Tue, 14 Jul 2026 23:23:01 +0000
Message-ID: <albAccNnsI12AIUo@vbox>
References:
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
In-Reply-To: <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS4PR12MB9745:EE_
x-ms-office365-filtering-correlation-id: 742f3aa0-4d93-44ce-2410-08dee1fed976
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 NDcB9xnxGZbo190hICjmTbu35SGvt1ivrpXIv4FSmbVmIyU9vXCSuQUf1MIIITU5v1b4zFXmLg5O7c/Ft+0Re6YxDHxWOBCNfmeLXGvTb1rRIgY3LtwWLUbOQKO7HbMzsiDZZnS+Hml1xnRkUm0rk3hM/cc/OxL53b4PmRhIpUnJNLWodEZIeftBZtByJgqNjJVdvxL3UlOw0nXZXd+75s5SqhKeNH8ekrcDEaf5ynp6BYOLKeg1l9JYqH4/LZuY9m29MuIpAWO2JA9UysUVy7B7weNp2xd+aFNcEeiVaW12spsofuJ7LbtqIIQnhJXPuDXZEfmbo2eowtnW28U9dJ32l9GTAxiD8lOWG912b35gMl0u3ZuBGCx+nm5Anza5A1VwtHHuDxGHSE4p3TzXV+L/x0rfRvu02EZh4AV6upGKiVWBKm7QvlZuphM0AO/xeAjI5ujpAyHcWXsct8zISBQTRqLzotgpNt1L9Kr79Wra7+2LYvSpr0xOJjV9ChcdkqApdnt46H7hxsQqU0t83Z5XMJAO3uoDf8V5YIV8MzOeHsvgGx91FTrfMEdOcJrT6J3B3tZ2jKsq8EcUp43Kd/ZttTbRtH2tAfY1H+DKL+iAFYbTS6a5GO9m6Yd2E/JDFFyThDvWb9iLc7eLwhqLDqY72y1IAFXzF0stT5m3/+Kf0akg97QmkoRwFMA2rqrkvNX8Yk4QK4+HPUXDjOpBmDQElgd1qkimEvLT6gRbBAU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmR1c2FzL2RPYnRBRlJUYlZBTGx5bERKNkcwZEszemQwejhyMFhockIxQUtq?=
 =?utf-8?B?Q3FQWkVSVkN0WW5sZHBVeW52T0RRVFdjN1hqcUx6M0JWK2JYNW85ci9jdy9Y?=
 =?utf-8?B?azA0NzZRS2s0dTdFbElOem5TK3ZqRkNqaURXbUxTNVlKSjNaQjR5TEFsYldB?=
 =?utf-8?B?OS8yYm13ZHd3M05xT2F1aTB6bUtCNnI3VExyMlpwdkRNTDFDNGJHMktEcktR?=
 =?utf-8?B?T3BMMGlmd3FSWFFjZXlnSDkrR0R1eVF1UWZMS1hoT0hUNzltQjlkTG16UUFw?=
 =?utf-8?B?ZUVyWXBsMW9oZisrbzZvbnRMS1BYQ2tYbG15YUpNN2dWYkMzU0N5b094UG9L?=
 =?utf-8?B?d1ZmNGlvZlRhNGhtS1M3YmRCejkreFluaFFUNFlZS2lVU0dGcVU4SUFYenNH?=
 =?utf-8?B?WlVqcUhiR3ZkaEtjVklQSVZlcjVLTy9GdFR3TjJSWU1jQ2tLWHJsbG0zSXBZ?=
 =?utf-8?B?bTdycUNMTUphdkErTlVsanlpazFseTlPaFBvSndCaEVzZXFOWEJBRWZrOHhV?=
 =?utf-8?B?djhkSTlaOUNjcmlaS2hnamplOHhzR3IvL0NJMk8wN2sreG90TmVJVTFNMmN6?=
 =?utf-8?B?UTZpUTJhWHVKWEQyVGFZbTQ5Yy9EUHNaQzkvT2ZJUzl4L054TGx6VERtUUhk?=
 =?utf-8?B?RHNGVWVxYWhxQXloSXcrLy9TYm1EcC9Mam95UjF4YlNmZG9Od1krU3FMcFBV?=
 =?utf-8?B?dGhmUFdIOWtSOVJWMVRFUGgxUnkyMEI0NlAzNGlsUE1BTWhnU0FNeEgyUUw3?=
 =?utf-8?B?ZTBvcTJCRzZtSlFkaXAvSllJWjA0K3ZKODdYRXNIQ3k4SS90SzlJeTVwTUVa?=
 =?utf-8?B?bi9kSlErQW1xZFJPWm00QXdrT0dwdWpzdEIvV2dUMlVxOVR5ckJqUk9tdUdF?=
 =?utf-8?B?L2pqdDlUUGFlL2NtUzdOUVVIRzNWTlhaZXg4cXJzUTNXaUdtcjdKWVg2MGVW?=
 =?utf-8?B?QkJHSkg0LzlqOHg1THVBb01OdGZYMURtWXpRWXhtQ1lhL2dtNTQ5MWF4dWZJ?=
 =?utf-8?B?YVAzclBCczNaYk9YYTZYbEFiamlud3lBL3JkSjdEYjRIVjNRZ1pZUFdMSjRO?=
 =?utf-8?B?OTVtalhLSUlKVHJoRkRVQndrOFhnMEhZWHdlUU9kb29UYzg3WEpmVVNBb2pa?=
 =?utf-8?B?RlhDK0dNZ2l1V3craGlrMlVQUnVIZWVCQTRlZ3VqNy9lb3VLRnBCNGd5T3Fu?=
 =?utf-8?B?aFRTUFJ6ZDMvSnBsdXZxRzAzVVdlSytCd0IxT1lWcXdZUXBualhDU0RheGcv?=
 =?utf-8?B?MkIwbU9qZ1MrSzRNQjNWMlR0NzkyYlNLenZNT3NRaXU0YTBRM2dtVTZuaERz?=
 =?utf-8?B?N29MYSs5dHdCMkdhazUvTVptdEpHWU5iakdmSzBSTDIwZXl2ck40dDVVdDlo?=
 =?utf-8?B?M2tyN295d3IycGtncEVtY1JET1Z6NFpKYU84Szd2K1poMTBmazlWbitnRDhm?=
 =?utf-8?B?WSsydUc4V09uOFNmVEhZdHdQVXBicUVYOVlhN0xFOFI0OERjcVBOUlNUSC9E?=
 =?utf-8?B?RVZOaEErZnlpR3NjZXN2b0dDZjg2U2J5eGVzVGN6cXgwbHVaL2JzRXhNWkE4?=
 =?utf-8?B?aUZLaEtpUDFmT29UZG56M0FGRFhsTGJ0N3B0ZWdLU01lalNaZm9QemRVRWRY?=
 =?utf-8?B?aklJSDJ1ekpyUXRLTDhLQXlIaXNrVzM0QTBabkdoR1ZoMjBOTVpSYmN0eGhx?=
 =?utf-8?B?eXk3SGlPdlQyVFpEYTI1Z3VrWWc3VFpVZEdwSjh5ZDMxdlgyRlU0dWZWS2Jn?=
 =?utf-8?B?OXhYdnhyRmZQTHRuVy94NThlMnFBRzNBUnh0NW13dFV0S0lyOThSVU9oVkdJ?=
 =?utf-8?B?ejlmR240cmpjU1k1OXNrSUZxRHVobmQxSGl0bXMxMHZNVjNlbTVJcFVrZnFC?=
 =?utf-8?B?SGFrT1VsNkUyWFFmemxHSksxU25aZXZTaFBmOHA1OTBWTXFHVkd1d05aMzFF?=
 =?utf-8?B?VUdlOGVhUG92UysrdFVSOHVyWmtUN2tVOTFnR0VrY0hxTlVxS3lER21sbTNj?=
 =?utf-8?B?Z1FMUHVyUGhsZVNCd0MxbVg2dm5JWTNRWUNZU21OK0Q3NWFNMHlTejh5QkdS?=
 =?utf-8?B?WmVOaUJZTjYvOHZhWkJTMnl5eGQvM0NTTkVCanA0NW83L0gyTzhnTkNhV2Iv?=
 =?utf-8?B?QjhnNTNVdGdUK0lsNFJRM0daVFZXQld0WWRCcm9kQjF5bWdyZ3BrMXlqUXhC?=
 =?utf-8?B?RE9PUHJJdVZMUEd6SDdNWHNaL055a095dm5mRFBZUjhoaC8zclh3UXNHMWtm?=
 =?utf-8?B?RmpGR3hSdFhBQjdBdGp5YXdmYllWKy9YaW5rcExvYjNCN0ZhVVljcDB5MWN3?=
 =?utf-8?B?VzVqZW9za21HVGxEUUdQcVpjY2Z5Z0JHZ2ZHbHgyMGJhclhHRkoyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DD54695D1F1B64186C12937A25B8BAD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bNdKZD6sRB0SQuPxDb9j0DtvW8GdFZ9LDxD16LMbuI3EwiyMwrbr1G9pVSiSVzAIe3bwvEPNrokLa1FAmaVkyz5qYmlAhtumjbt5wZqYTM0jqgaGJx9gME1+0deBb4bcbaiLWWiF33rip83gjuns7Yr1b5D3MUWQrJ+DSlslwgykufzdMm/HvYchsiG8cVkSka/x5a/VdQPZVA+8XRyx24vkq1WphqoLPVm8KmhgmHKIIte486wmAlZlrJgziMs/9KoUgT6OLa7fsD9yAQCkKhB2JHM1oL7ZmZ7Is75s1ghiVSWq3RFioV7vrpx/5NQHTZThmm4rfUc6jfP5/t9LRA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vzT4b1DXuffdSY+qmOdNa1ISU3DAD58StEvyZ0jBQoZOfYGUI7DGV6xif5fcJ3Fj4+N9VyqpOYxNPEPYmajd51R/7Xtak7YgJ2JpRB4lOfNVbk3nwiV7NzOVHElB9YrMUEpB312M9lsA4Pa70WHWBvQrUuR5Z25VhNVWUUyQrPIynmWWGLl412OQ06DA/UhDMwbpgRdNNB7+qNPow/j7N/Iry1XIXd6NZP2pL/pZT9CXYVah28rnI8AwSYr4sRtKs6i6dB+iAtnRRwGyCAY6iehCSZYZ7NCmo3XTg8ygJTvw8sGVe9vmBAQvEeBw7ZdQlGkVpdaFjTZloJMBez4UbEB7wGpvwb29lLecVYgOB7IfOjll1BERy76JC1DDaoTwJ7IwWi9EhfFRWfdtFv5LxqanmUFxNyGukQkGnn+Pl8BiB3HRSN8G5saDwFE6OjZcvAnxqq/+zbdeU8swxxGbHVsvZv8bOvzwH1M8C8HmW15E1jV52m8oquJBTWkrfXftw1utu3Ji3bKCuw1qKEt5J6KK43gbGFlzU4jHJ8eNgbeZcOHuk6UqaWDAXbJ3zmGxyjEUW3Uu+8xikjttmPgzvNztIBoQCYX35LjJh8pro9R78oF4g0gsAd0ka5Uq+JE3n0F+7Wh+d9Io7/lLfe6ogQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742f3aa0-4d93-44ce-2410-08dee1fed976
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 23:23:01.8947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEXJtfMLkgtC0RHGPDYbmt43MTrXJE3GLWom4BmILj7r9075IJhHDrYElE5gbnEZJpSC8eYI0zu3QiNFc1HwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9745
X-Proofpoint-ORIG-GUID: zfHmzTuEUMWaYVysMExWaDijk1qF2O5d
X-Authority-Analysis: v=2.4 cv=JLELdcKb c=1 sm=1 tr=0 ts=6a56c4dc cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=LzQjF4crdsTkk4_jFxkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDI0MSBTYWx0ZWRfX6WShcBnFjxwB
 jeV1S7qGwl/ZLvY+CRC+TbCVoFAtqRIAnU8tWvQr+TyFSfV+klZm9h7OmS/q8hjK2EXYVgpPRQs
 bOewyawGYqkKiPq0vvF276HGhOA4oHqTBsAR1P1HhpgpAyOWqlvsjiTL4T1iycktF5vG2KpVVy3
 JUpn+5rzXWQvwv3zRmTt2qj/0CFbD0HLhHsHuiYpf1rHJfnXbANIXVXNXZu5/roNhVreku0wt4r
 +oy9i9dXX8sqA5c11IuGOk+nNzbW+6IXqwt34sJJTderPZpH3TiaFs5d9uMYLrkIEyEMG9jaRt8
 cVtfAPVVZLkpZHzLdNMAgtQRmeeME08cPPw+B3nF+1FtRzDhWSV8oyhDVjQggytpyOP2RIywP/b
 VhsaAoDdgAnS4kJhptbknLrEQpo7XfMzB22nd0vTOSpSZ7J6sWGpENgRKYVhuS0wSkvv0Pfv3JQ
 /9HttnzqPEpi6WfNvZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDI0MSBTYWx0ZWRfX+w7R0Ip1BP+F
 zpo1hUmMqYdflsrg3TFucGQ38c1Qab9S428PZ6+6lJOmfFkl7yFZcvJXTZqFizAp2aVbvVwmmJ6
 1QaDd2MxpWMP+bb1ZCnpHukadcUfp0U=
X-Proofpoint-GUID: zfHmzTuEUMWaYVysMExWaDijk1qF2O5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607140241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vbox:mid];
	FORGED_SENDER(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:peter.chen@oss.qualcomm.com,m:Thinh.Nguyen@synopsys.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8794E7596C3

T24gTW9uLCBKdWwgMTMsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTEzIDIz
OjQxOjE0LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gTW9uLCBKdWwgMTMsIDIwMjYsIFBl
dGVyIENoZW4gd3JvdGU6DQo+ID4gPiBPbiAyNi0wNy0xMyAwODoyNjo1OSwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToNCj4gPiA+ID4gPj4gQW5kIERtaXRyeSBhbHJlYWR5IHNhaWQgdGhpcyBh
dCB2My4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBbmQgSSd2ZSBhbHJlYWR5IHJlc3BvbmRlZCB0
byBoaXMgY29tbWVudCBpbiB2MzoNCj4gPiA+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL2Foall3SnRpTXNtMEJjQ2hAdmJv
eC9fXzshIUE0RjJSOUdfcGchWWtzSjB0UHRSdGg5ZXo4dDBHQl9XYXhIM3lueDN5YThNOGFGSXlL
ZllwQXBSQ183OUlnOTNDcUUyTUtjckdKNk82dF9EbDNSRDF6ZnRybnhoZHRjZm9XN2hnZXA4dyQg
DQo+ID4gPiA+IA0KPiA+ID4gPiBJdCBkb2VzIG5vdCBjaGFuZ2UgdGhlIGZhY3QgdGhhdCB0eXBl
IG9mIHBoeSBpcyBpbXBsaWVkIGJ5IGNvbXBhdGlibGUsDQo+ID4gPiA+IHRodXMgeW91IGRvIG5v
dCBnZXQgYSBuZXcgcHJvcGVydHkuDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4g
Rm9yIFVTQjIgUEhZLCBpdCBoYXMgcHJvcGVydHkgInBoeV90eXBlIiBhbHJlYWR5LCBpdCBjb3Vs
ZCBleHRlbmQgc3VwcG9ydA0KPiA+ID4gbGlzdCB0byBlVVNCMiBsaWtlIGJlbG93LCBkd2MzIHFj
b20gZ2x1ZSBsYXllciBjb3VsZCBjYWxsIG9mX3VzYl9nZXRfcGh5X21vZGUNCj4gPiA+IG9yIHJl
LXVzZSBkd2MzLT5oc3BoeV9tb2RlIGRlcGVuZHMgb24gd2hlcmUgaXQgbmVlZHMgdG8gdXNlLg0K
PiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvcGh5L29mLmMgYi9kcml2ZXJz
L3VzYi9waHkvb2YuYw0KPiA+ID4gaW5kZXggMWFiMTM0ZjQ1ZDY3Li41Y2JmMTdkNDkzYWQgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9waHkvb2YuYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy91c2IvcGh5L29mLmMNCj4gPiA+IEBAIC0xNiw2ICsxNiw3IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICpjb25zdCB1c2JwaHlfbW9kZXNbXSA9IHsNCj4gPiA+ICAJW1VTQlBIWV9JTlRFUkZBQ0VfTU9E
RV9VTFBJXQk9ICJ1bHBpIiwNCj4gPiA+ICAJW1VTQlBIWV9JTlRFUkZBQ0VfTU9ERV9TRVJJQUxd
CT0gInNlcmlhbCIsDQo+ID4gPiAgCVtVU0JQSFlfSU5URVJGQUNFX01PREVfSFNJQ10JPSAiaHNp
YyIsDQo+ID4gPiArCVtVU0JQSFlfSU5URVJGQUNFX01PREVfRVVTQjJdCT0gImV1c2IyIiwNCj4g
PiA+ICB9Ow0KPiA+ID4gDQo+ID4gPiANCj4gPiANCj4gPiBldXNiMiB1c2VzIHV0bWksIHNvIGl0
IGRvZXNuJ3QgZml0IGhlcmUgYXMgYSBzZXBhcmF0ZSBtb2RlLg0KPiA+IA0KPiANCj4gSGkgVGhp
bmgNCj4gDQo+IFllcywgZVVTQjIgaXMgYmFzZWQgb24gVVRNSSBQYXJhbGxlbCBtb2RlLCBidXQg
aXQgaGFzIGRlZGljYXRlZA0KPiBQaHlzaWNhbCBMYXllciBTdXBwbGVtZW50IFsxXSwgZWcgYXQg
Q0gyLjQsIGl0IGxpc3RzIGVVU0IyIFBIWQ0KPiBGZWF0dXJlcy4NCj4gDQo+IA0KPiA+IFRvIGdv
IHRoaXMgcm91dGUgcHJvcGVybHksIHdlJ2QgbmVlZCB0byBpbnRyb2R1Y2UgYSBuZXcgcGh5IHR5
cGUNCj4gPiBhdHRyaWJ1dGUgaW4gdGhlIHBoeSBmcmFtZXdvcmssIHdoaWNoIHdpbGwgYmUgYSBi
aWdnZXIgY2hhbmdlIHRoYXQgbWF5DQo+ID4gaW1wYWN0IG1vcmUgdGhhbiB0aGlzIGRyaXZlci4N
Cj4gPiANCj4gDQo+IEl0IGlzIG5vdCBhdCBnZW5lcmljIFBIWSBmcmFtZXdvcmssIGl0IGlzIGp1
c3QgZm9yIFVTQiBQSFkgZGVkaWNhdGVkLg0KPiANCj4gSSBkbyBub3Qgc2VlIGJpZyBjaGFuZ2Vz
LCBpdCBvbmx5IG5lZWRzIHRvIGNoYW5nZSBhYm92ZSBmaWxlcyBhbmQgcmVsYXRlZA0KPiBkdC1i
aW5kaW5nIGZpbGVzLCBhbmQgb3RoZXIgdXNlcnMgbWF5IGxldmVyYWdlIGl0IGlmIHRoZSBjb250
cm9sbGVyDQo+IGhhcyBzcGVjaWFsIHNlcXVlbmNlIG9yIHNldHRpbmdzIGZvciBlVVNCMi4NCj4g
DQoNClRoZSB1c2JwaHlfbW9kZXMgZGVzY3JpYmVzIHRoZSBpbnRlcmZhY2UgYmV0d2VlbiB0aGUg
Y29udHJvbGxlciBhbmQgdGhlDQpwaHkuIGV1c2IyIHN0aWxsIHVzZXMgdXRtaSwgc28gYWRkaW5n
IGV1c2IyIHRoZXJlIGlzIHNlbWF0aWNhbGx5DQppbmNvcnJlY3QuIElmIHdlIGludHJvZHVjZSB0
aGUgZXVzYjIgbW9kZSB0aGVyZSwgd2UnZCBoYXZlIHRvIGF1ZGl0IGR3YzMNCmFuZCBldmVyeSBv
dGhlciBkcml2ZXIgdGhhdCB1c2VzIHVzYnBoeV9tb2RlcyB0byBoYW5kbGUgdGhlIG5ldyBtb2Rl
DQpjb3JyZWN0bHkuDQoNClRoYXQgc2FpZCwgSSBoYXZlIG5vIG9iamVjdGlvbiB0byBhZGRpbmcg
YSBuZXcgcGh5IHR5cGUgZm9yIGV1c2IyLiBJDQpqdXN0IHdhbnQgdG8gbm90ZSBpdCBpcyBhIGJp
Z2dlciBjaGFuZ2UgcmVsYXRpdmUgdG8gYWRkaW5nIGEgYm9vbGVhbg0KcHJvcGVydHkgdG8gdGhl
IERUIGJpbmRpbmcuDQoNClRoYW5rcywNClRoaW5o

