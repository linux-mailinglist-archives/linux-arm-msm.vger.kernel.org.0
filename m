Return-Path: <linux-arm-msm+bounces-67045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3242B156F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 03:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27198164EF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 01:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C447F145A05;
	Wed, 30 Jul 2025 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YeIrEFsg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SRGFrIX2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JGXENPhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59421361;
	Wed, 30 Jul 2025 01:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753838607; cv=fail; b=RQAIFF4PpeGmZ9Pi17riIRsYm1Hp8QL5MliQil4pSeefeQ3tHi8TNOG2xnb0Bjjl7XFJd6xQV/KlH6ZDwDFXZrffy1Tq0PZ6Qez+baKUJkxt6NbkTlR5p1nEJZK7UGLEijSkUGE700RPZMnHtzArBS16McWRb7jZmRnOpF8yuYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753838607; c=relaxed/simple;
	bh=QhqpY3jHdltiwGVAEwLnH5QLJZ54/BY8LLyA0hntcEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MOEeXoWYK9JCOzh8qe7vUcG2GiCXZzcivxny3bmsMDEtqq2bN8D9D2XK0A7OUpHVNtGv073mgZO2vyTSvHtqJV5vBKXZkECDo1d4DjlDFxSHLPg43oH4jVuFKIigKb0HTix68S1cdDSh+1LutzPuivGFfmJQ8N1HX5Yw3OD5jh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YeIrEFsg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SRGFrIX2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JGXENPhx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TMLfU9027460;
	Tue, 29 Jul 2025 18:23:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QhqpY3jHdltiwGVAEwLnH5QLJZ54/BY8LLyA0hntcEs=; b=
	YeIrEFsgekTqkL9ntqEQS3PoeKghMhi9fdRrbVc0LnA1Ytqakwr+IXxF5l6dD00O
	ObJP7JZna+t/0m+99rBjTwXsOlUn4zwtNLqrn1MbSU7T8qUC5Tg2qrGV7yZVoirt
	N3h098YzQ+Fa6Jgto+sVrHpd6ck1kSksRBAifgmqqgiULTHQVjYme86u7d683SZi
	+6+9f4DO7s6x6jamwelPbzvRN3mot5yJniULSSclH2fReLyTlp4ORm0+lGILkGaL
	Q6m3+Kna909OznsmR/ni0lk7XAs7eNMgZj7E2pjtkebseiJDtdPNTjZc6Kl5KTlV
	TQAz9VldaZRbCBYPD4fX2w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 486wbfkj5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1753838595; bh=QhqpY3jHdltiwGVAEwLnH5QLJZ54/BY8LLyA0hntcEs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SRGFrIX2k1NtZ+CpL9RcPvZQrflUDTG/R0brzuM9BVDYtYTRkpEnD9TvxDU3iRZqG
	 caFegFnG0oDGz1g3R2tIq9XZaUWRrblR9p6AxR9e4pEm5RscoxdnUg36Zcu1eksB41
	 UxXE8z2ow6lNCsLjnlPuQieyZSjN3sfn1do6WiwcsM8KrKX8BHOrlJgKaHUbuTjaXt
	 FrR+DL2edeykx1iiMrZGv2XhjgmYORQigVHybclVvG70xyDX4rSuciHJ5EZufVImab
	 XmO2AsFkkLdbnvYhZPnssSZzUz6Bx2HRvfHMCfBGsfqhVKFuloyGJt4oyfV4uASBuw
	 B2sDCBSCFtOFA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A380404AF;
	Wed, 30 Jul 2025 01:23:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 97EAAA0072;
	Wed, 30 Jul 2025 01:23:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JGXENPhx;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5A6A74035D;
	Wed, 30 Jul 2025 01:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMR+0BnbVYyUc1BiqjWFLaAB52kUX8/xvXnMBIHG7XZPUG1BslRRYR/0C4vcA3KsBC7haHgY5Iu6YKQ/04fkLg+lEM0b7i+2owMawINFmWUxPz7wGrJVnPHc//ZY3oVGBLmj5UQB3R1znDGmtf8RaV/7iqFzJ5tb1Yi05JUzZqcQknNJC0d031RUdb9uBg0UjmEcZfyBq/fiYPRWCVWGVmlCZHVndpK5TN8z/GVRumia0VQSPL1g6aXQsVRDBdeooewu2Pz8q3IZNmZpOespgYfdq8yPMll9hGIJTEpOaT8UVsTusxr7xJzhkL8iy/W8Fb30l9u63yu5jSt9mtc/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhqpY3jHdltiwGVAEwLnH5QLJZ54/BY8LLyA0hntcEs=;
 b=YE3pr5bmyQeilbltnLM7kJQHRQJtNCfvKgSVTdac7uNs++BRi9vAla6dpdZ5UrPLypgYg8Bh6jsSvdACFnkX5o438xT75YYceh1fffAwmm/IXRivVO39FQBZ4krjn2WCLiK4tcN3jBn72lyczulHy3T6RKTr37FpqP23E3PJBgMULoRLI9wPk3uuEAnqSZPMIZAJyRCO83yFFq1fBihIcU9b5o/9nK6OfSIXVuecRXCF89u4rwY65oW0ELWQTixLBbQh2R4JrA+Zgee/t0I4t7yIn50AAJnpzH2Kv8iup560gzET+0ZkA6fiBQib0U+XXJLRFn+dM3o7SkXoZ+qobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhqpY3jHdltiwGVAEwLnH5QLJZ54/BY8LLyA0hntcEs=;
 b=JGXENPhx+RNh8VuFU561cnct1P4bSK72/pqfvM1JdKn0hzAzoxRNOlLhuV5gacwvsjc3UMgVO818lEYbMAJOlZ8CuY5Ju8dQxr8TVFkVZNXeA9QbO7RQI9a2U9y9Qs1MI0RH10ielIKhTtOP8pygimBDPKDyKLXQgnipII7TLhE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 01:23:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 01:23:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index: AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWAgADi4gCAG2ZUgIACOgUAgBovsYA=
Date: Wed, 30 Jul 2025 01:23:08 +0000
Message-ID: <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
In-Reply-To: <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV8PR12MB9136:EE_
x-ms-office365-filtering-correlation-id: 7a4867f9-b9e6-4041-e720-08ddcf07a461
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXJybUZaeklvL2I1ODM4KzhMeXlPRmdtYjNISEV6MHMyd1B5TkljU05KYVAr?=
 =?utf-8?B?bDFRUTcwU3lNNkFjNzdkWWVXTFlaYU83RDlkR015MFAzZXRyT3lyVGUyR0tw?=
 =?utf-8?B?NkJtTDFybTBCZU5KSUp2VXpVbnBlQm9KYmpxT0ZqQkQ3NDlUa2tMWGxCMCtI?=
 =?utf-8?B?L3NpUzJwa0ltSUt2SGNKa0w0RzJXSjNGZEY0eVBIYUhvZ3lIU0FyNURaMnJB?=
 =?utf-8?B?Uk54Qkl0RzVRMU5nbXNYKzhZZzlLb2RMdXpoRUJwNkdqZlpDUzFncHRMM0Mv?=
 =?utf-8?B?aThjbVZVV3FnRkZnZmYxek9SSnVpSm1VWjNibDc2dkludHpRL2pVVWd0ZElW?=
 =?utf-8?B?bHdURWpqSXdkQjcwRnIreU8rTHFZQ2FGVWd6Z29LRHhPTjV6ZDdxMVFuWXhH?=
 =?utf-8?B?MzhCeC9ocVpPeFVucDFUOENjV1Qydnc5TjZYTXIxcm1VRklvbG51NTg1c1lW?=
 =?utf-8?B?V2FOQVFDNzJuQjZpUzVjanhiL1Q3T3czcDlkVXpQeVU3OW45cGVFOElCSFA1?=
 =?utf-8?B?VE5pUVRmYlhzK3poekF5WlhDbWdkb3REc0x4cEZISWNOc05hdjF1SXk2aGhT?=
 =?utf-8?B?enozZThBdjJEdlBvTlUrM3pOYU9BdnNJZGlyUWNITk10b0xtaGErY3hMYllJ?=
 =?utf-8?B?eGxUcU92Zjc4RjAzMWk5Q2Z5bFV2Z2hDRFUyQzFmMzhJOXBRblJaUEh1ZmFk?=
 =?utf-8?B?dGdVQXFheFlmanRDNFdvb2NzWWRDT0dOWXNBNlFzN3BrSjUzblhSNS8rdHJG?=
 =?utf-8?B?ZHlmZmdTaVhxYkpNUytRdGhZc21DZDF3UjNMNmJIZ1NEejlOTGZVWVpxK1I3?=
 =?utf-8?B?cFVmaStHNE9wUE5SVkxQenA4b0FxOWJySk9YWmh0bS8wNEcwWWFhcnkvVEYr?=
 =?utf-8?B?dVdEZFFhaWZ0SWNLaTdVbWJVRlhvTlp4dWFwY2pQN0FoczdqZHJYWlJEQ2lN?=
 =?utf-8?B?NTd2SGZCUEdJRFMwQlg2cEZxbURFeEJhSzBnQjVxYXNGbWNPT3duSFpMam5J?=
 =?utf-8?B?Qk82N1FSLzRZc3ZoRmNFZzZweGhYamdaUDlpQytUNlF4MEpyYmY3TzdwR0c2?=
 =?utf-8?B?QldTbVlxQWJQT2RBR3ZQSnFSN2xobXZxWkxnNzEzSDVkaWx6QnZ3dGpwQnZu?=
 =?utf-8?B?Ynh5aWdxaDhMQ0FJcklER0FPbFAxREZZLy9nNkVPYWM5d3licFExQW5oeWJk?=
 =?utf-8?B?Z2xOQW5ES2VQRVlHeG5QclNUOE1SMlc2c0FydVU1d084UE5ORjI1bEhRNmdh?=
 =?utf-8?B?QjBOcjFEaERRcHFqWWc1ZjZmdkVrWXdTdXQ4MWVCanZZTUUzYlRnRStTRlpY?=
 =?utf-8?B?am9LbEg0eDdJQVExL0NSNWZzd05aQ2U2VVk3RFJXOVg0VWkxS0N0OUE1a3NC?=
 =?utf-8?B?akdnWi9idmdrWjZIakRuWTFDRlVRZTJOSnFEN21vU3MwRFRYL2dpRERia3E5?=
 =?utf-8?B?d2JjeE9QMkpTTU1kN2g4MU55QTlYSkI1a2RCOFFJcXVJR2F6WDl0VjVUMXBr?=
 =?utf-8?B?aCtleHpWRHBBUWUwNVkreFhDUW8xR004MGVvamFwK0g3ZTJVcjY5WnhmaFhL?=
 =?utf-8?B?Z0Q3cGtRRGxpOE5CSjVtMlhvUGZRdmJOVVprZmxpOVZaVmYyN2xaek9NUitO?=
 =?utf-8?B?ZVJpYzd4QWRLVGc0Ukh0OXdOZUMvalBxOWhqNzdHODFTVENuem9WTEtpT2NY?=
 =?utf-8?B?U2FQRS9pZnN6MmowNktLYnRxSm9ibTlUYWhXMDFKS0pCRDh3L2lqeVZGRGFC?=
 =?utf-8?B?WWJEWkFFNzJTOVdNWUNhNVpMbkhrK29uazZGaG1mcHhkVUtXNGhMSGtlRXcx?=
 =?utf-8?B?T0UzdXU2KzVYY1NaVXBqT2ZWa0h4N09xM3FMeUZIOUZxTU94cGpOeXM1MC9X?=
 =?utf-8?B?QkFNZlg1bVdWd3kxWmJURlZQMFZEQithdzErUEtoRys0NjA0Y2JyZ1Ixa2dG?=
 =?utf-8?B?cXFTT0lVUjE5U3JNK3UwMmtPZkZXLzUwdHJBVFpuTnZONlVnTzgwZTRBK3VF?=
 =?utf-8?B?TVVOaE9oL25RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDNIUEljcXhRYWEzZVRkMWZDQWdHbmx4NFF5WlpwemtJcytTWXNTQlBMVHJx?=
 =?utf-8?B?YVR5VXo0OFZDcGFPRWhGYlY2OG5oUnBjYmVBckM1dmpJUWdZd3lMNjVYa3Rr?=
 =?utf-8?B?SmQ4d3VBQnl4ek80U1hnUEh5Tkd4Z3ZMcER6dXYzc1dWc0NhRk5SSTlxSXRF?=
 =?utf-8?B?V0NUUUZjTnprNjFzUEFGeVFUZHBPQ0J6MU9nR3lJMjd2WE1yS0tneE1Sakk0?=
 =?utf-8?B?bWVXNWFVMzlNWVEzeU04Z25uazlvNjdtdk1IYzFaL2RaSExteVhMbEUvNDd2?=
 =?utf-8?B?QnNXd2k5Y3NLOWVBemhZcjZuQkJNSW1qenJEK1VpamU4emR3SUZGamxvRmdR?=
 =?utf-8?B?Y21vTy9iSEs4bUdtSE9hUjA3L2lMejUwRjVwUG1rc05oWVdYMGRPaStQK0Ny?=
 =?utf-8?B?Y3l3MHo2bm9aNmRBYkQ5NXEzcTlEbWFadSt1QXluS1R1R1JBblZYMFl1MU94?=
 =?utf-8?B?SXpMLzlOeXV1R2UzZGNOUEI3L243UDcxUzEvL1FQSWQrbU5JakxUOXl6ekN3?=
 =?utf-8?B?TFp6V2dMaWRxQmRMZnVvUzM1cmZ6QXNlZVp4SFVsZW5ZZDRwcFZsc2wzUE5r?=
 =?utf-8?B?Nm1waHFHUFYvaXJ1TGN5b1BnTTFINkoydHhOVUliRE55VkJhTGw1ZElHYlUr?=
 =?utf-8?B?MjJxVDNhNVJUdzNpajNJS09XQXZQa0trVUdnQlI0aU91c09FbW15YisyMjBH?=
 =?utf-8?B?WTNOdU5mWnV6UmZUellIaG5mZ0hpWk4wOXd6bGpxaW1DQTRpN0VOYkM2a2F1?=
 =?utf-8?B?ZGRucHIvNUtVT3ZWcVJJRVExL3NBcVRMR04vWU9wQUQ2N1g3ZFluRlNDTEhj?=
 =?utf-8?B?cERtL1k4VjFtS3JwVFJ4ZVdMUmlHajQvQmNHWU8rNGs3dDZNY0FQMk1WTWZT?=
 =?utf-8?B?M21hV2pLT2lhQjBLZGwxejV6RnhTTFlZUlZkQkMwblY2QkNTWmV2dENEMmJT?=
 =?utf-8?B?VHB4Si9URHBCT0ZlK1dDOFdoSVlRQTBOdWpVeUdWYSt1OGJ6bnVHWkR1VytN?=
 =?utf-8?B?c2pvcWtFemhpb1JEcjZaMVlwNWpyK2oybFNnR2dqUlByNGRUVUdzUUJxSXZa?=
 =?utf-8?B?U29SaGlJdzhyQzZBcWwvTHI2TVVsSWFTQVRWL2ZQaFhkckVkNTEzU2xlV2pP?=
 =?utf-8?B?b1kvYVppSVVEdjhlZndPQVltT2Fkcksra1NTSGlGTElmYS9QVEczbTdDcmVM?=
 =?utf-8?B?M3FYazlPUVdOR2ZSekt0bElhNS9odWQ3TDkyNGhyQitqaVBnckFHU0o3dG5u?=
 =?utf-8?B?VU9GczQ1c2FmUVN6TWZEeWJpN0pudnMzWXcrWUVRL0tJM0JFOEg2c1AvQ0cv?=
 =?utf-8?B?M3Q1MUo2aGQveDFRckx5T3BkdVJEb2lWTVZwcmY3blJWWlVFVnJua1pzVmE4?=
 =?utf-8?B?b3FRbFF0dVQxdFlVSTI0RUw3ZVdGajFNYXVvMTQrSVpUZWF2VVdYY0JFeUNJ?=
 =?utf-8?B?MVpXUnMxcjY2U2NRVGJLNlhoVGY2M2NNS2JXWGlmVDlpeXpibnIvK3dUVXh3?=
 =?utf-8?B?S2J4UjRmT2RnaUp5ZkY1cUVMaDZ0aTNFS0d1MlFGc3ZhNW84S1lRNjN0WTBs?=
 =?utf-8?B?dnNRallLU3dQS3NyVlhoYm51MjdQQmlOOEZydkRnUmgxV3hlSnBlSi9iQ3NB?=
 =?utf-8?B?U3h1MkVXbGN4QW1HdGNaUUVTRmtCamwvRDFSbmRHV1Y5ZnNpZWgxNUVVM2hS?=
 =?utf-8?B?TTRncC9ONm9saXArb1l1aHFKZC9qbGxXblk1anhCaUI0UEdiaHk4SnMrUk9U?=
 =?utf-8?B?NkdxNkREeVhnb1pMRzNsTGYwdVlqSU85ejd2RGliblNvNjhIMVZ1NUhleW9a?=
 =?utf-8?B?M0NlL04yV2Yrd3Z2ajQ4cDk0WVZ4dnJxcExSMjVtMWVZYUtWcklZZ3lIa2g4?=
 =?utf-8?B?TStxWS9oZUVHY2Rqc09YQ3JoOHBhalE2NVdkNkN3d29qaXRaUjZ2ZWcwb0c2?=
 =?utf-8?B?dnIrQnlHSC9ROHg4aEU3TzFYdWhhOHFGZDQwekRWZk5LZ2xGbXFsWW5lS1FW?=
 =?utf-8?B?bSs2L044eW5tQUlOSTN1bjJUUzNUUkpCTjMxNjhSSFZJVHJrNzVseU9sNWda?=
 =?utf-8?B?cENFWVovTC9Wa2JLZXlraDNnS1dYQ0h4dko0TkJOUTNXRGRRTFo4aFFNZFo4?=
 =?utf-8?Q?xvz81pXrTmYV41eE02In84g7E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BECB586B2C49440858B6F0EFA985668@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xmErEkiWygX7xCeXIRtRUsBHpHaFGsjNFQcUIqvuHF+nn/Fmm5lzE00eLwhdSQMUzvoXsr++nZc1K2+rF12eNy8jbT/yRzD4KKesP587qUTdlkOF+gnmEBeQuHAUuw4AanKtfYGDGnj9kwNymJnhe+ZZRk6+t6YC4swZNDjEVcUFPopUN7mH7Psf9QexnAiDg3/AyvEY81E/yxGbIZpACFzeydoiSk3QuhCfmWPtduYPeaeQROxQ4FGzz/Qkqf2ssF9DwoINq7YRgJuvDLhdiZrFIkK/i9D5woPA7dgcPcp22KicDsW1zYnRMInE8MwXcmKcHR9zEtllAzwZmtHjxVPoUk0xagEqowpIg3RQcwyyhxwQf1VifVxwA8xZrl8IN83t4QpjuShXyQ1IhTCY2dD4ISWF6BTFIZHJdPS4MmpJtNEl/8R8n1bYkB4hkKYBtpkNpQbjx+l1oWStna6XQB2y/vlNNDVBJZa4GCixlr98KL5INo6+MxPs2qhLnLgHhuORoxvdwXZS+o5jsO5QWylJ0eQWIJeZFk2Pt3aEW1bt5EoPDikCGFBsY47wvjv2gsO11tGzP/pgzRWXiwHMsHKFQgKFTxTy6UafX+ba1LmUgR9vJJTv9TMx1BS56WrLaTDjTbZcnsH/zIn6ZIPI7w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4867f9-b9e6-4041-e720-08ddcf07a461
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 01:23:08.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTWp+T0LRShaJcHuyFAV0d1FYSAQAO3o9v37fbKbLo8a38Kv95M1mNj8U40AJCqUQrOoD/3e9bI/EgkFeiTpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
X-Authority-Analysis: v=2.4 cv=JrfxrN4C c=1 sm=1 tr=0 ts=68897404 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=__oIDQPPv2wGo0MhrIoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: t3iL0nEsJaQUZBAAFhHenr1PFrA03o-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NyBTYWx0ZWRfX+J4OVi8M14gX
 lShgsHJuxVKaOMpUOTHqc09nnMH+lYoOrdSikvBWLJ0/nAI5+KGWofw4mmseWGwNczUtnS1IM2g
 76z5/L6qB2UQkAEiYpHJbJHyrWlV4sAE+iDOoTvRYEWY/K2dOjis3jeECJZRYTEyAwnE4KT4r6W
 Bn4BO01WFj7GH/Hv6EXytXW+vXRhkwS0d2W+rjiFllSLPs22J1lbArqW+Q05cdhXVOPfy0OZxCy
 DMJc0l2+cOu9Qi9EtR6+dEaTXinNHE9itnPsQstCaVvrHYRYAzSNbOWCkcbOR99bA+PgO/vlEn7
 6m1geC0gi8OP3/k03+B1YUwfl9o8QLvPsuzC2x1WbHy1u7kYDsP3amKxkLGT2tYUbdTHhMwDxXd
 IeYKR9uC
X-Proofpoint-GUID: t3iL0nEsJaQUZBAAFhHenr1PFrA03o-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290087

T24gU3VuLCBKdWwgMTMsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNy8xMi8yMDI1IDQ6NTkgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBUdWUsIEp1
biAyNCwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4g
PiBPbiA2LzI0LzIwMjUgNTowMiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBPbiBU
dWUsIEp1biAxMCwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+ID4gPiBPbiBR
dWFsY29tbSBEV0MzIGR1YWwtcm9sZSBjb250cm9sbGVycywgdGhlIGNvbm5kb25lL2Rpc2Nvbm5l
Y3QgZXZlbnRzIGluDQo+ID4gPiA+ID4gZGV2aWNlIG1vZGUgYXJlIGdlbmVyYXRlZCBieSBjb250
cm9sbGVyIHdoZW4gc29mdHdhcmUgd3JpdGVzIHRvIFFTQ1JBVENIDQo+ID4gPiA+ID4gcmVnaXN0
ZXJzIGluIFF1YWxjb21tIEdsdWUgbGF5ZXIgcmF0aGVyIHRoYW4gdGhlIHZidXMgbGluZSBiZWlu
ZyByb3V0ZWQgdG8NCj4gPiA+ID4gPiBkd2MzIGNvcmUgSVAgZm9yIGl0IHRvIHJlY29nbml6ZSBh
bmQgZ2VuZXJhdGUgdGhlc2UgZXZlbnRzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFVUTUlfT1RH
X1ZCVVNfVkFMSUQgIGJpdCBvZiBRU0NSQVRDSF9IU19QSFlfQ1RSTCByZWdpc3RlciBuZWVkcyB0
byBiZSBzZXQNCj4gPiA+ID4gPiB0byBnZW5lcmF0ZSBhIGNvbm5lY3Rpb24gZG9uZSBldmVudCBh
bmQgdG8gYmUgY2xlYXJlZCBmb3IgdGhlIGNvbnRyb2xsZXIgdG8NCj4gPiA+ID4gPiBnZW5lcmF0
ZSBhIGRpc2Nvbm5lY3QgZXZlbnQgZHVyaW5nIGNhYmxlIHJlbW92YWwuIFdoZW4gdGhlIGRpc2Nv
bm5lY3QgaXMNCj4gPiA+ID4gPiBub3QgZ2VuZXJhdGVkIHVwb24gY2FibGUgcmVtb3ZhbCwgdGhl
ICJjb25uZWN0ZWQiIGZsYWcgb2YgZHdjMyBpcyBsZWZ0DQo+ID4gPiA+ID4gbWFya2VkIGFzICJ0
cnVlIiBhbmQgaXQgYmxvY2tzIHN1c3BlbmQgcm91dGluZXMgYW5kIGZvciB0aGF0IHRvIGhhcHBl
biB1cG9uDQo+ID4gPiA+ID4gY2FibGUgcmVtb3ZhbCwgdGhlIGNhYmxlIGRpc2Nvbm5lY3Qgbm90
aWZpY2F0aW9uIGNvbWluZyBpbiB2aWEgc2V0X3JvbGUNCj4gPiA+ID4gPiBjYWxsIG5lZWQgdG8g
YmUgcHJvdmlkZWQgdG8gdGhlIFF1YWxjb21tIGdsdWUgbGF5ZXIgYXMgd2VsbC4NCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiBDdXJyZW50bHksIHRoZSB3YXkgRFdDMyBjb3JlIGFuZCBRdWFsY29tbSBs
ZWdhY3kgZ2x1ZSBkcml2ZXIgYXJlIGRlc2lnbmVkLA0KPiA+ID4gPiA+IHRoZXJlIGlzIG5vIG1l
Y2hhbmlzbSB0aHJvdWdoIHdoaWNoIHRoZSBEV0MzIGNvcmUgY2FuIG5vdGlmeSB0aGUgUXVhbGNv
bW0NCj4gPiA+ID4gPiBnbHVlIGxheWVyIG9mIGFueSByb2xlIGNoYW5nZXMgd2hpY2ggaXQgcmVj
ZWl2ZXMgdmlhIHJvbGUgc3dpdGNoLiBUbw0KPiA+ID4gPiA+IHJlZ2lzdGVyIHRoZXNlIGdsdWUg
Y2FsbGJhY2tzIGF0IHByb2JlIHRpbWUsIGZvciBlbmFibGluZyBjb3JlIHRvIG5vdGlmeQ0KPiA+
ID4gPiA+IGdsdWUgbGF5ZXIsIHRoZSBsZWdhY3kgUXVhbGNvbW0gZHJpdmVyIGhhcyBubyB3YXkg
dG8gZmluZCBvdXQgd2hlbiB0aGUNCj4gPiA+ID4gPiBjaGlsZCBkcml2ZXIgcHJvYmUgd2FzIHN1
Y2Nlc3NmdWwgc2luY2UgaXQgZG9lcyBub3QgY2hlY2sgZm9yIHRoZSBzYW1lDQo+ID4gPiA+ID4g
ZHVyaW5nIG9mX3BsYXRmb3JtX3BvcHVsYXRlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhlbmNl
IGltcGxlbWVudCB0aGUgZm9sbG93aW5nIGdsdWUgY2FsbGJhY2tzIGZvciBmbGF0dGVuZWQgUXVh
bGNvbW0gZ2x1ZQ0KPiA+ID4gPiA+IGRyaXZlcjoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAxLiBz
ZXRfcm9sZTogVG8gcGFzcyByb2xlIHN3aXRjaGluZyBpbmZvcm1hdGlvbiBmcm9tIGRyZCBsYXll
ciB0byBnbHVlLg0KPiA+ID4gPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgbmVlZGVkIHRvIGlkZW50
aWZ5IE5PTkUvREVWSUNFIG1vZGUgc3dpdGNoIGFuZCBtb2RpZnkNCj4gPiA+ID4gPiBRU0NSQVRD
SCB0byBnZW5lcmF0ZSBjb25uZWN0LWRvbmUgZXZlbnQgb24gZGV2aWNlIG1vZGUgZW50cnkgYW5k
IGRpc2Nvbm5lY3QNCj4gPiA+ID4gPiBldmVudCBvbiBjYWJsZSByZW1vdmFsIGluIGRldmljZSBt
b2RlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IDIuIHJ1bl9zdG9wOiBXaGVuIGJvb3RpbmcgdXAg
aW4gZGV2aWNlIG1vZGUsIGlmIGF1dG91c3BlbmQgaXMgZW5hYmxlZCBhbmQNCj4gPiA+ID4gPiB1
c2Vyc3BhY2UgZG9lc24ndCB3cml0ZSBVREMgb24gYm9vdCwgY29udHJvbGxlciBlbnRlcnMgYXV0
b3N1c3BlbmQuIEFmdGVyDQo+ID4gPiA+ID4gdGhpcywgaWYgdGhlIHVzZXJzcGFjZSB3cml0ZXMg
dG8gVURDIGluIHRoZSBmdXR1cmUsIHJ1bl9zdG9wIG5vdGlmaWVyIGlzDQo+ID4gPiA+ID4gcmVx
dWlyZWQgdG8gZW5hYmxlIFVUTUlfT1RHX1ZCVVNfVkFMSUQgb2YgUVNDUkFUQ0ggc28gdGhhdCBj
b25uZWN0IGRvbmUNCj4gPiA+ID4gPiBldmVudCBpcyBnZW5lcmF0ZWQgYWZ0ZXIgcnVuX3N0b3Ao
MSkgaXMgZG9uZSB0byBmaW5pc2ggZW51bWVyYXRpb24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJhcGF0aUBvc3MucXVh
bGNvbW0uY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1xY29tLmMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4g
PiA+ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiA+ID4gPiBpbmRl
eCBjYTdlMWMwMjc3M2EuLmQ0MGI1MmUyYmEwMSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLXFjb20uYw0KPiA+ID4gPiA+IEBAIC04OSw2ICs4OSwxMiBAQCBzdHJ1Y3QgZHdjM19x
Y29tIHsNCj4gPiA+ID4gPiAgICAJYm9vbAkJCXBtX3N1c3BlbmRlZDsNCj4gPiA+ID4gPiAgICAJ
c3RydWN0IGljY19wYXRoCQkqaWNjX3BhdGhfZGRyOw0KPiA+ID4gPiA+ICAgIAlzdHJ1Y3QgaWNj
X3BhdGgJCSppY2NfcGF0aF9hcHBzOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCS8qDQo+ID4g
PiA+ID4gKwkgKiBDdXJyZW50IHJvbGUgY2hhbmdlcyB2aWEgdXNiX3JvbGVfc3dpdGNoX3NldF9y
b2xlIGNhbGxiYWNrIHByb3RlY3RlZA0KPiA+ID4gPiA+ICsJICogaW50ZXJuYWxseSBieSBtdXRl
eCBsb2NrLg0KPiA+ID4gPiA+ICsJICovDQo+ID4gPiA+ID4gKwllbnVtIHVzYl9yb2xlCQljdXJy
ZW50X3JvbGU7DQo+ID4gPiA+IA0KPiA+ID4gPiBDYW4gd2UganVzdCB0cmFjayB0aGUgY3VycmVu
dCByb2xlIHRocm91Z2ggZHdjMyBjb3JlIGluc3RlYWQgb2YgYW4NCj4gPiA+ID4gYWRkaXRpb24g
ZmllbGQgaW4gdGhlIGdsdWU/DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBDb3JlIGNhY2hlcyBv
bmx5IG1vZGUuIFdlIG5lZWQgUk9MRSBOT05FIHRvIGlkZW50aWZ5IGNhYmxlIGNvbm5lY3QuIFNv
DQo+ID4gPiBhZGRpbmcgdGhhdCBpbiBnbHVlIHRvIGtlZXAgdHJhY2suDQo+ID4gPiANCj4gPiAN
Cj4gPiBUaGUgY29udHJvbGxlciBpcyBhbHdheXMgZWl0aGVyIGhvc3Qgb3IgZGV2aWNlLCBub3Qg
c29tZXdoZXJlIGluDQo+ID4gYmV0d2Vlbi4gWW91J3JlIHVzaW5nIFJPTEVfTk9ORSB0byBpbmRp
Y2F0ZSBjb25uZWN0aW9uLCB3aGljaCBpcyBhDQo+ID4gc2VwYXJhdGUgc3RhdGUuDQo+ID4gDQo+
IA0KPiBZZXMsIGJ1dCB0aGVyZSBpcyBubyBmbGFnIHRoYXQgaW5kaWNhdGVzIHRoYXQgaW4gZHdj
IHN0cnVjdHVyZSB0b2RheS4gQWxzbw0KPiBzaW5jZSBvbmx5IGR3YzMtcWNvbSBuZWVkcyBpdCBh
dCB0aGUgbW9tZW50LCBJIGFkZGVkIHRoYXQgcm9sZSBpbmZvIGluIGdsdWUNCj4gbGF5ZXIuDQoN
CkhvdyBhcmUgeW91IHVzaW5nIFJPTEUgTk9ORT8gRG8geW91IHNlbmQgYSByb2xlLXN3aXRjaCBj
YWxsIHRvICJub25lIiB0bw0KaW5kaWNhdGUgZGlzY29ubmVjdD8gTGV0J3Mgbm90IGRvIHRoYXQu
IEN1cnJlbnRseSB0aGUgZHdjMyBkcml2ZXIgd291bGQNCnN3aXRjaCBiYWNrIHRvIHRoZSBkZWZh
dWx0IG1vZGUgaWYgIm5vbmUiIGlzIHNlbGVjdGVkLCBidXQgdGhpcyBpcyBub3QNCndlbGwgZGVm
aW5lZCBhbmQgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMuIEl0IGNhbiBiZSBuby1vcCBhbmQgd291
bGQgbm90DQp2aW9sYXRlIHRoZSBpbnRlcmZhY2UuDQoNClRoZSByb2xlLXN3aXRjaCBpbnRlcmZh
Y2Ugc2hvdWxkIG9ubHkgYmUgdXNlZCBmb3Igcm9sZS1zd2l0Y2hpbmcgYW5kIG5vdA0KY29ubmVj
dGlvbi9kaXNjb25uZWN0aW9uLg0KDQo+IA0KPiA+IEkgZmVlbCB0aGlzIHNob3VsZCBiZSB0cmFj
a2VkIHNlcGFyYXRlbHkgZm9yIGNsYXJpdHkuIFRoZSBkd2MzIGFsc28NCj4gPiB0cmFja3MgdGhl
IGNvbm5lY3Rpb24gc3RhdGUsIGNhbiB3ZSB1c2UgdGhhdD8NCj4gPiANCj4gDQo+IEFyZSB5b3Ug
cmVmZXJyaW5nIHRvIHRoZSAiY29ubmVjdGVkIiBmbGFnIGluIERXQyBzdHJ1Y3R1cmUgPyBJIHNl
ZSB0aGF0IGl0DQo+IGluZGljYXRlcyBjb25uZWN0aW9uIHN0YXR1cyBvbmx5IGluIGdhZGdldCBt
b2RlLg0KPiANCg0KWWVzLCB0aGF0IGZsYWcgaXMgb25seSBmb3IgZ2FkZ2V0Lg0KDQpDYW4geW91
IHByb3ZpZGUgbW9yZSBpbmZvIG9mIHRoZSBzZXR1cD8gSXMgdGhlcmUgYSB0eXBlLWMgY29udHJv
bGxlciBvcg0KcGh5IHRoYXQgY2FuIGRldGVjdCBhdHRhY2gvZGVhdHRhY2g/IE9yIGl0IG9ubHkg
cHJvcGFnYXRlcyB0byB0aGUgdXNiDQpjb250cm9sbGVyPw0KDQpCUiwNClRoaW5o

