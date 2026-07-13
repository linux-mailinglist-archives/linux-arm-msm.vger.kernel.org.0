Return-Path: <linux-arm-msm+bounces-118880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVcJCrp3VWqLowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:41:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9174FC4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=synopsys.com header.s=pfptdkimsnps header.b=k7OZnJxJ;
	dkim=pass header.d=synopsys.com header.s=mail header.b=P62IegYh;
	dkim=fail ("headers rsa verify failed") header.d=synopsys.com header.s=selector1 header.b="cKKZ5/mV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118880-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118880-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=synopsys.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15EE9303581C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 23:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C3E3D3D1D;
	Mon, 13 Jul 2026 23:41:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076BF4A0C;
	Mon, 13 Jul 2026 23:41:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783986101; cv=fail; b=Y2Z21YGMwHQ0XTtyx0K8wtBUxyYdPihSVKTbJO0WBcGv/IQE/BPk+X4vVQn3zuOWe6ZHyGmTt96yjKiSvmJLDR/0cCBs4dv1irmp6DVFcjgQ1/gciEoxgKGEdp/tiA8HXzoBfILxJOrL1VSxk2Z8tM6Jh9+e67T4zt1DLYi5XBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783986101; c=relaxed/simple;
	bh=v3K/AzbZ/7bhG5CqpauSGU03htnVt79ejb6Ql23iWLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eI55xMZ2V+9U+9abodqYSUl3oHDwJHZIhwyqAzwxMPvRBWw3s3AxuxvFAsm55AZKHSgXxdePQSeMEM3fLkMU2OexF371m9iPPP9OME8E58lHx9AOneWDMjC8x44p4Jtcwl+YfXo4SvLYfjLao1eGzg62eATkwJge0vvRjIqkLcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k7OZnJxJ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=P62IegYh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cKKZ5/mV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DM7kCZ1279365;
	Mon, 13 Jul 2026 16:41:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=v3K/AzbZ/7bhG5CqpauSGU03htnVt79ejb6Ql23iWLU=; b=
	k7OZnJxJN1jec1KsS14h/elpDu3lCGs0RY0j1A6WmbGL4BZIqSfCjk+LfuLKwvOG
	ITgXG40jfworctwQIdHTkxJi0remqOeFZzbZ82fxaIuoKnaLAdx1MQM86tr/8W5A
	CMbNtMxMlVyLuKeqf+iSEXu+MIi88F/oR3Au0h4CqiY3yyhsz1dq6F08NpC3a/xJ
	sQ0MzSLMKV8KR4Jquf8JjBet8fx/5Ow/77KR9wn6+Rb98kwNix7fbRf+b9pzhZLn
	jJGO9/fQXD83UXv05G8DMLJ/X2Wk2GO5ETzj+/rSAA0LHNauhT1kiOnff+wedJkp
	S50+HVT7NgWffLgv4jr5Pg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4fcv77x6cn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1783986082; bh=v3K/AzbZ/7bhG5CqpauSGU03htnVt79ejb6Ql23iWLU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=P62IegYhNABRPm/XIeD/a6c1/hckX+7k16cV71pjnf6RJrzTmGyezCDJSRCtQ61Rg
	 R/ddptXFPRYrfsHtY57f0p5mtfntr2HXmxIG0u7MnZfw9du5TGYw2kJCLFmtRXC/WK
	 jmibF3S6a37DjmLa4BE/OA6pg88MQTGqPrZZH78xfnlZodT3MxMtUnWY2VTIjdGrU/
	 K1gKjFmWtGxaxhSBszPc9FH6uOUHnTQE1DIOqtPEkvTDXAk7xkKluYnd928wdzxpJL
	 mpJ3VSxMFcfS4yZfixkOCFK7K9zyekpBbv127JvLwyPx/ERQxrf7hnyodC9fh3jCc+
	 Ungz81Ke8uw3A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86F7F40212;
	Mon, 13 Jul 2026 23:41:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E95CBA0083;
	Mon, 13 Jul 2026 23:41:21 +0000 (UTC)
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00107.outbound.protection.outlook.com [40.93.13.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4398D4011A;
	Mon, 13 Jul 2026 23:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw9s4FmL2EEPPWI5xP5az2jJJ/bNNqmGcV+tlWRz2Ua4nTJ0cDxdVEOXKVzo3FLDBpFl0DBXJtqF3ew5fAVoQ4pp2GEtKpZBcxAMGhRIeONjn2v8wKVGultCwhcjQ3Z+nOFv6b5IbwsDkMrhFHKdv9m2dbIZ0DTTmX3NrweHxsiJ7iqNZbSenh+UiZnb3Z5taNtZJxdanuDQd0xWIQva72Ko3gT/4M72mGlxLXRVq1ymReC5gUN8QwTveOtB+YAKIQdryxE63D8OgMkYsZHrbWob9KAiHMC+hYKRFtwdVfWdgt4GShXNlzmbgxrp77a0uq1OhwlyyhtNJ+3GRS6ndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3K/AzbZ/7bhG5CqpauSGU03htnVt79ejb6Ql23iWLU=;
 b=vmL4R3lgmnIQKJDxyGGoHXHmG4cIVH5/+Lj6Q1yXPeHGHtlvfoBOELuzphud5NaFL33P9kEob+ZgurMlY1sxljEAFMnPpxmARVQAff13kB0aWct7W7zpHpYAwNGrTP3Dvr5qIVw2ILRYczXvy1wq18j1LtYax6v7rRKPFwIVSngdAn3j4SW07iUbT3cD42Y4GYOnD/AFw9MJUb2IK8hvH1DNNjEKUrRREgH5To7vNXYYo8JDblAlxlk3UYs1M8zRnaRoNu3ZY4yc6xXxqNjXnSJ1b9Iz9Pwsbi2utVifSkGaG4uN3eKmJBeRRP6Ugiw8YucM5IkQ9qG6ZTg2PfnHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3K/AzbZ/7bhG5CqpauSGU03htnVt79ejb6Ql23iWLU=;
 b=cKKZ5/mV3rVHptpBNvLCsyvlHoD/MHK5YJogalAMPor7mi7or4gpImHj8ZnAURayn3NktLueEoO75eY/nJDMGFTiVSEm6ressvTrLN94z8Mg87N6UxAdH78+rHYA79Fbd9ShlmHd1EGkXdQ14aornxehjGpUYTbP/wVlSUANZf4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 23:41:15 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 23:41:14 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBIA=
Date: Mon, 13 Jul 2026 23:41:14 +0000
Message-ID: <alV0_DHvBFpzDumP@vbox>
References:
 <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
In-Reply-To: <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB7820:EE_
x-ms-office365-filtering-correlation-id: bfff1ae8-067a-42cb-397a-08dee1383a79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 OOSaf3KCFbnwW+ndr8CGQ+1WISC+MHR17iwITcXCRCp47VGVy/ls/TVY5nwlvXs9x1kzwIiHkN9BFQ11lyL3iEMfxC58bjOjSItZ5UiPfTKEz+f2YCBVlHQSDhgS4NrFT1Tlhm//ZXNvWo56mKvFtXY1ptmCAdW/h1ONExe91BwGR7Z6jkJBlR2dBSuurc+GLmxjXqI8jUmhNsJoGRQhLRujVidV0mxhWsX3J6r3W7rVV4UGSIErrQEs/R3EmgseTcqLatn5F5u3hdtAFDw762p3tcLzL4yqZ6vagrCfjIl9hjdBrxCYqy19G6vcTmzwxhD3ELKKeDU/lqfkBaxt91hAz2mhlMYtCpr+LsEHXzfJYdRlFXw+fLt1L8WxYI9Vy7cXZMeCajLS/Q6CPMHcEg8ZYDSb9hQ+0XkycxZycFImQzIhtwC1ywpj2DM/WVJLp8HacEKVhPn1AxXGGBRugM4uc50UdwZNq0ml4L+4wr+kMXz6Z6ltJi8ItEz7AAalZYG4v9FPg+gGspqC6I5kcfaF+eIWWSe1hwfHM+34A6qsJNJdf1Jla+QUu/lbHYPG7hBxCGTaIR94og00ZXJqbDn+oQixL4E8WC7kFjRNcnxq8UPhDQpU62xnMe7MEk/0xSV5MauG6dHOv4gKBwp4KfGu/0uT/j/hdyTZIlFytPAlmnK0rYD10CIcJ1wuptk8P2Nn9spQDtuTtFyM5KpGaHov1vNTvnY3CwPLP+CaMcU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2VWUnBBZ2RTVVhaUFk2TlFzZHl1aGI2RkhMeHRkRzFzOUkrWWhmSDRsbU42?=
 =?utf-8?B?REVUbWFWQzl6MExCemRITDRSTTJhLzFudnh2WnRlRU5Sd3JYUlVOZmgzTW5R?=
 =?utf-8?B?ckNoRk5BNFhSeDEwTWl4KzZQandNMFFuOEx0TVlNVEZ2ZDlpVjRaRmswczFI?=
 =?utf-8?B?U1dBaEtaUjFjUnB3cWVFbDNVWEpSTjBYOTJtS1k4ZXU1d0Fvb09yRzl0bkxC?=
 =?utf-8?B?U1RIaExMczVxcFd4RnRLWlVIWlcwQTh4MnphbmdoZnlMUHd5U2kwdlpJV0pl?=
 =?utf-8?B?MFZtUVp3dTROdjlSd0NrM2toY2o4UzBGSGlPdFhmYUFER0RldjNRWGNxMXlL?=
 =?utf-8?B?amQzbU90b3RvSExacS8vMzFQcXJ1Y3B2dk1tUUIrbkk0MGFsRnNldFhSb1BC?=
 =?utf-8?B?MmZRS2xVbEhCTHQxOXBPUGVTaUYxMmV2WEhkVFdyS1huNHFNZ1JBbG0wMHdH?=
 =?utf-8?B?K251elkwTmlvQ090ZDFzellLKzk0bFJReFllZC82amVPbWFCd1VCclZwOXZG?=
 =?utf-8?B?bFduMm0xQ2svODdYeTdEY3pGMjBOK2xZRnVscVdndTROcFJROFNBdVdEekhr?=
 =?utf-8?B?eTdSY1Jsd3NYbUJPcTZBUkdVK0RtaEhtaTJWeXBucEpmaUI2cGp0WllCU2J5?=
 =?utf-8?B?RFdJQXJNbmlyOWpPY2ZwRVh3YjZ2T3AzaHNXdzRPVEprOUN0U21DM2JDK0dq?=
 =?utf-8?B?UjA4N2UvKzF6N0YrdHNtK3pJSjd5MXA2WWk0UzFUQmdZQ3dDNDJPWTd2cDJN?=
 =?utf-8?B?WnhENGtOMUFEU2tSbWtDUWRoQjlXS3FxNGhtL3RUZnQ3U1FDOEZTOWtheUYr?=
 =?utf-8?B?K25vREJtUTdnaU5IRm5mQnVRczV5QmdEejNBaUpWUUZLZ0xlVUJldTdndm41?=
 =?utf-8?B?WGxqbnFJc0VYUG1PQVZncldjOTYwWjg2UEFlQVFWYVNJb2xoSDJqTWFwR0lU?=
 =?utf-8?B?VU1tZkJjcUdLa3VRNWNXK3pBQ1FON1U0SGN5S3lYWi9KSVl3Ull2dUVKWXFV?=
 =?utf-8?B?QnBBVktXSVN3eWlndEJWUHFzUkJ2NkNuRU1RTkdoTExKRGVuVFFJSGMvTXBh?=
 =?utf-8?B?NFZxeFp6M2VQYkhxMWFSaXN5Tm90OHlLbW5JSHo4Y2hGM0dLSlV2MnVHVm5x?=
 =?utf-8?B?K2o1aEJGRVhWeDlTMjBOUG01anUxRVcvTGZnZWxIck5CeXg0WFVOZy9Ha3Ux?=
 =?utf-8?B?MnI3c1J5VGNMdnRmZURCbjFtTTlmZlBBMzc5Q01CQWZjK0dzOFZDMWtrRGtO?=
 =?utf-8?B?ZGxUZTY2TlZubWY3TW9aNHFSUUY3STYxMGpPdk5BNDlvOXo2RWIyZnJRQkh5?=
 =?utf-8?B?TU8xQXozOG94VzNHekZKaWVBY3BGdGJjRW85UldIc0xCa0kwSFlyZ0ZhSGYx?=
 =?utf-8?B?RDJpTWRBdHE1bW40OTlwWEpZUXJxVDRSdU5PdlQ5ejF2SnBCR0NxMkQ3Tkhp?=
 =?utf-8?B?d2xmQTlEZ2dvNmQrY3ArWEJ3c0dkZWtrZnZvaFVVL2FlSkxUOWVGZkVVa3hJ?=
 =?utf-8?B?bmlnWTQ4NC9Ibk9aV1lPdmJhWVZlT1BhS1VZZXhWVU5SdVZYakFZSENBb0Vw?=
 =?utf-8?B?RGRjSnZrejU1bUhtNTlqZ1NUT1hCc0xURDFQQWwvNUJvdGwyT1Q0S2lmNjl0?=
 =?utf-8?B?S2hBck8zS0UrcTMrdWNqVE8ydnhUWmlVaTk2czdEM3VYekJjdkJiTmdjZ2pN?=
 =?utf-8?B?bWFGUDBJRHhXUTg3T2MxU2tMaGVXYUEyaWM0OTZIdXhnc0Z1VHRSd3VtTTlK?=
 =?utf-8?B?T2dIenExbDJNS1JuYmlEeXFBcEZJazBXZjYvWitNZUJnaStiUmtLMlFpUktU?=
 =?utf-8?B?SEg4UlhjOGhIeXdncTVpeVhrcjhNeitwMG5LeXc0cWc5K0hCRlpyWGQrU0Jt?=
 =?utf-8?B?eEIvZDZmdHpib21IUmNMNHY1cm5LRkR1YTJpUG9uZWhHeHZQQTdWR0pvY0Zq?=
 =?utf-8?B?N2hBV3hwMmwrZm5lUUQ3UVdOU0phSStFNGJHc2l4RlBUdE9HM3AxNFRoMitN?=
 =?utf-8?B?ZWxQRmtMS3hQdFBsQmN4WVhZTXBJOUI4K2pOU2ZEMGRiWDYrYVJBVno0S2pE?=
 =?utf-8?B?VUpLSkE3clpsTlAvdTlJYlJRQ0ZOcks5VjFEMlliQXI0d01uYlJya3FXcUtN?=
 =?utf-8?B?WW9wOWZRVWYrOU1qVmRJZ3dGaG1wSlVlOFpLQ0dWNTRxVVE1RDAzN2daaTVx?=
 =?utf-8?B?ZERDcHNkVmFDMmd6Z3oxUkNnbWtlRDBHWXMvbGIxN3FrTWxpdnlFa1VZSXB4?=
 =?utf-8?B?cjdGdENJU0NjZWx6WVQvNnVyTitPTHFiUGJRSUJzeU9tSU1YbCswdXZSZnhj?=
 =?utf-8?B?YTM2anE4cXoyUXY5OUhDU0Y0a2k5WnZJQXprN0pSQlZNN0RKeTNSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53A599D5BF469B449C7FA41DBF591EA7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lj3OH7SudsdIO6x/76YlKnFI8YMh7nvzpi9TKOTZFNz+SJq7zsg/hmbtq7OxW5eBmUcEtUAhL5e3WVuzUlYn05QvTQJIUh0npCrtr4yxrVuaYaJQeDB2upyiqPf06EywzjIi3CA3xIBeW09q9zOa2OfwpUHppu3xXB2fvCkFMxiPUacN5NBoN38lyuKZVXLvGt5o0R9tE26zn9gga5HfsG/ra+/gB4+XxiErMCpp5bJESYr9bXpdSBVFTCiyVGVTM0XmUck+hPHnqC02yLZxyatPyX8LLXEbej3jWDAAs3sjpSHXg7OpNfOJbOTOWRuK0Do3Pezwz8Pu+VNrp+gAWw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RFenyekn8reKW8uWMDYyb/vQpVAwmz8hkmtsdZaxWbyqT9w4fR7hB6V74gQ7bTomLuTWIxnGgGBUH9N/xwjXErqNIrX7sxZ6+7j0nvw0WlQcfy2nGqorjo9UCcBY/cz/tBbaGVBODiUlN6jlV6JOZAaAIMBfPOYJOx0mhaB96qNBjvIPQ6cHDZroQCcQyKYJD6jcUFajg2pgbR9nTKTNib/DIknl5IJu1PBPOuZ56O2HrcBtS8xeWRk8iWpOB6PyDVnLsoSo/FdH3nZbHbCXpJaldLWReX1kkLxzIfdHFazCSCI/koh7+T8Cy1xiDoCZsgZBBs14h/Ta8f48WOVSgoyAN2h5obZ4DnVxn8ZAdABFgSGw6V/+n2kgkhSmC0zDeW4RTV4WazizFo+vA+gWlJeKAjELj0Dj+iyIzeb8Ax/fG4WpXDWR/OX5JKJV6JgCs7v2u7ORmEYWcEVtXcrSMWo7FYtt/QYMCBeS/6hRw9aXmeobOYRzj9vmPO4Y5qfeccnjzU1l8K1nxvfLSZhRvXarNb7WcdsqJkS6boUg7vaADdFeLUpMmU8bVgFnobzjIa8WdDRKGsQSaG93wsNyWzt4rBwVeFmvEVqSqunrSyzkWASRrAwj1hJiB0NUlQa+5oJUG8C3qPcqMHhGWG+TyQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfff1ae8-067a-42cb-397a-08dee1383a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 23:41:14.8234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ru46xqT24bK1zc3sJNZcVSSSg3ESPibBsH8+USKUuetoUmYq13rnv69I+Hsx9eHO12Afl6pqAhvOZlnt9NcBPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820
X-Proofpoint-ORIG-GUID: jLEgR8nzBIZRKPwmk8AX9n_5M_0ZmBzF
X-Authority-Analysis: v=2.4 cv=EuviaycA c=1 sm=1 tr=0 ts=6a5577a3 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=oE04PSICo4JGKq8AwuUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jLEgR8nzBIZRKPwmk8AX9n_5M_0ZmBzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDI0NCBTYWx0ZWRfX/EfzkGILXyPO
 MzPYwMQmm95zI9CI1ZVG/YqwZtjNu1NSv9SYOPXU++1BYECTB1PeIw29Hpa9Y4gjiUhegQ62oo4
 4zj3LsnGx3ez7QLH0JbkNQVur86MFqFzFWwPOFrcmAqcc+WGfqJUILe5p/wysag6BycIUD4YTmq
 Xaq2A0UdU1H1IUOuYMonTV3XuAmRtcxpONf5orWAyefwjN9vq3CV/OgfI9mg6crsQbX+PnnKHUy
 2e3+8m5MKlbHNxXncsgcxnYGTNFeqi+Pw14HQvtwQr3l9R9ieTGY9BvnVVmRwrNix0a+Jk/NBN9
 goW1I5mOvvn/hszymrQLdxv6ruzPUNrT1sEHCqjO29ItrvdM3vnIdsnsW9UQPdyNRHzOkMu1Aqe
 27x7pPPJYBMD3fSCKZFFtIPaEvTdgS33OQDECjmLPr481EM72i2bPv5TWvTI93jutAqJPc4uGey
 0d1H6JouI0iMqN0hGbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDI0NCBTYWx0ZWRfXyCpC3EEs2xKC
 uBqv2iPBsM0gGQEcqUhwKSrRTtOGMNK7I6uv31CltfGtBaMX7dEHbYpKJRch04q4ut5dZaEuDIf
 iMlCFGY63tv/F+8n74QhjgmHQxIuH1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607130244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vbox:mid,urldefense.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:peter.chen@oss.qualcomm.com,m:krzk@kernel.org,m:Thinh.Nguyen@synopsys.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69A9174FC4F

T24gTW9uLCBKdWwgMTMsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTEzIDA4
OjI2OjU5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+ID4+IEFuZCBEbWl0cnkgYWxy
ZWFkeSBzYWlkIHRoaXMgYXQgdjMuDQo+ID4gPiANCj4gPiA+IEFuZCBJJ3ZlIGFscmVhZHkgcmVz
cG9uZGVkIHRvIGhpcyBjb21tZW50IGluIHYzOg0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi9haGpZd0p0aU1zbTBCY0No
QHZib3gvX187ISFBNEYyUjlHX3BnIVlrc0owdFB0UnRoOWV6OHQwR0JfV2F4SDN5bngzeWE4TThh
Rkl5S2ZZcEFwUkNfNzlJZzkzQ3FFMk1LY3JHSjZPNnRfRGwzUkQxemZ0cm54aGR0Y2ZvVzdoZ2Vw
OHckIA0KPiA+IA0KPiA+IEl0IGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHR5cGUgb2Yg
cGh5IGlzIGltcGxpZWQgYnkgY29tcGF0aWJsZSwNCj4gPiB0aHVzIHlvdSBkbyBub3QgZ2V0IGEg
bmV3IHByb3BlcnR5Lg0KPiA+IA0KPiA+IA0KPiANCj4gRm9yIFVTQjIgUEhZLCBpdCBoYXMgcHJv
cGVydHkgInBoeV90eXBlIiBhbHJlYWR5LCBpdCBjb3VsZCBleHRlbmQgc3VwcG9ydA0KPiBsaXN0
IHRvIGVVU0IyIGxpa2UgYmVsb3csIGR3YzMgcWNvbSBnbHVlIGxheWVyIGNvdWxkIGNhbGwgb2Zf
dXNiX2dldF9waHlfbW9kZQ0KPiBvciByZS11c2UgZHdjMy0+aHNwaHlfbW9kZSBkZXBlbmRzIG9u
IHdoZXJlIGl0IG5lZWRzIHRvIHVzZS4NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9w
aHkvb2YuYyBiL2RyaXZlcnMvdXNiL3BoeS9vZi5jDQo+IGluZGV4IDFhYjEzNGY0NWQ2Ny4uNWNi
ZjE3ZDQ5M2FkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9waHkvb2YuYw0KPiArKysgYi9k
cml2ZXJzL3VzYi9waHkvb2YuYw0KPiBAQCAtMTYsNiArMTYsNyBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqY29uc3QgdXNicGh5X21vZGVzW10gPSB7DQo+ICAJW1VTQlBIWV9JTlRFUkZBQ0VfTU9ERV9V
TFBJXQk9ICJ1bHBpIiwNCj4gIAlbVVNCUEhZX0lOVEVSRkFDRV9NT0RFX1NFUklBTF0JPSAic2Vy
aWFsIiwNCj4gIAlbVVNCUEhZX0lOVEVSRkFDRV9NT0RFX0hTSUNdCT0gImhzaWMiLA0KPiArCVtV
U0JQSFlfSU5URVJGQUNFX01PREVfRVVTQjJdCT0gImV1c2IyIiwNCj4gIH07DQo+IA0KPiANCg0K
ZXVzYjIgdXNlcyB1dG1pLCBzbyBpdCBkb2Vzbid0IGZpdCBoZXJlIGFzIGEgc2VwYXJhdGUgbW9k
ZS4NCg0KVG8gZ28gdGhpcyByb3V0ZSBwcm9wZXJseSwgd2UnZCBuZWVkIHRvIGludHJvZHVjZSBh
IG5ldyBwaHkgdHlwZQ0KYXR0cmlidXRlIGluIHRoZSBwaHkgZnJhbWV3b3JrLCB3aGljaCB3aWxs
IGJlIGEgYmlnZ2VyIGNoYW5nZSB0aGF0IG1heQ0KaW1wYWN0IG1vcmUgdGhhbiB0aGlzIGRyaXZl
ci4NCg0KVGhhbmtzLA0KVGhpbmg=

