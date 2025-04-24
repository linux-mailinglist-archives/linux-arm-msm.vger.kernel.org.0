Return-Path: <linux-arm-msm+bounces-55528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FACA9BB34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0711BA42ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4F6227E96;
	Thu, 24 Apr 2025 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WbGb81hU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BGyAVRS2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AZ0SBDrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250FEA93D;
	Thu, 24 Apr 2025 23:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537029; cv=fail; b=l8gWmhXpMVp/ZCVlP7LY5m5VE0kH1ub6szFLaRo4xngtmXMRlOhTI5DKDeSZVF5RuuY+LctHEgch66sks67GXyt8PFYh/EJf43P0rHmIRk0OOgQQIH7olKDBLslrIIWPpR+a61P/yrHbwAgX+Euxz9a0ElnD9z8hAWm5x47xXV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537029; c=relaxed/simple;
	bh=rwnSOqPTIE2dgElXIN2dmCuupTh2ekO3OzdO0fvKv38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F3cqgSw1R8jCTx4vYAXAIwydIQMMQFvHFZAXNCZwhejU3HXDSANl4Y2jiHcbNXNQsFkM/MrHKolC1iPlVfluAHgJjzct3pZtVbrinJxcn8V0jll3nQMEvzesRJn/fe/E2DjGiS3whr/O0tPFAaZ8CXM8UQqZXqItoMiwxsfwQ/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WbGb81hU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BGyAVRS2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AZ0SBDrZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONIKsP028112;
	Thu, 24 Apr 2025 16:23:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rwnSOqPTIE2dgElXIN2dmCuupTh2ekO3OzdO0fvKv38=; b=
	WbGb81hU6Ck67mVFE0yWPPzA3Lx9ArksAGL5tH4/rTBmbGcquE61oKJftTd1oT7t
	CEXij8+jCxMWZZYSphqSnlmPdw7x0RvE0IfisTWqAHJOhTEZEnTMcBoOLJ+kizAo
	0wNd9W9hD5Tk3floZTvtH12QUdmd1Hb6ep951Ii6vOBX/5fFXbUhQI3ey89CnIx5
	v1bh0d7JCWEZyDDLk2UeKqUZTsbJWVKnknGiSG7yU38UzXCjRnUIxHVY9BHQuzSl
	bnEbgBblahTuZj/PB08HXvVILKE1BpDoKu8c7em2NSsWb9tVMYUf7A28DVdxX5xg
	tIKxFZk+gKuXNb1Prw8nKw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 466jham9d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 16:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745537010; bh=rwnSOqPTIE2dgElXIN2dmCuupTh2ekO3OzdO0fvKv38=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BGyAVRS2i26pfwCyYsMUCc0mtYLi9MS9055kWaptWDHn1k8DvVoix+HPi5BQoz7TI
	 H92QNDHq/j3h1bgbjBmnsZjkhc8xioDy4lYv2tyfM8HGQf0x37AMU6tzrO369YckIz
	 zmtUd84I+HVpv1ohPh1r94M0ILKszJaVhE0j+wN9ia0/6KE0tZRiB7Jvm4x97Wjgli
	 SYjrvSEMedoTXvtbx3/1KFAR00//53DbAhSn/9d6uAtpR32wt7A9j4HcLrORuy2/4p
	 DmJPVfV37fxYHzSWBKbzMyQwMXwmINJDYtCGSKtdU5iiK6sr8Y3jHVNY0sb92rUTnT
	 RxN2xRlPLHwag==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86F0640556;
	Thu, 24 Apr 2025 23:23:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B179CA005C;
	Thu, 24 Apr 2025 23:23:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AZ0SBDrZ;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DB10F40355;
	Thu, 24 Apr 2025 23:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcH9jnuxP+IwJUEWapkQRm79aFy8jkyUfHCJtMiN8AbtGY8LImrYOPGeQd9S3cS2bbnv5hEFN5W4Z1EqeE78/R3rR+4B96SSO0MMRuZ8Wyh31rbEdF9agI5oFZ1wlq08+QWCWEOg39688xfzr7jn5H9ue5LLDmdK7vv6ArypSztuAOzghOcvfpzihoQhNA9X56TpT/Pe+uahHEHjMmEOHbYLS+32zccez0rY9g08qNoyN+54hFpbhSbFc4DFI/QFr5rT6E2TMi+aHCKb2Q+Qz0Pujm3XWNfqO8uDQ0ZL0oakzkbfT7US5AHgbBaKSd8nDjmw91VgJEI+M06V9bRhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwnSOqPTIE2dgElXIN2dmCuupTh2ekO3OzdO0fvKv38=;
 b=ies0HwtPMxw1H8rdZZw/RS1v2HbWgt8vKLmRmwkc94U5EKdKKCr1hVlOiG/4FFcv+RGRDXd6vO2LPVEZ/kQlxmsOpdG1YPs5E0nVLlB7p0UAtM2+oH5X28b9oevCX7eWmVLR3QSpoVyjdfccJbeEtE1VN2sexKD1981HrieuLqRbHRJJtvHHxamZyQbJyhDHeusEecg7wTvSglzWiWGMGdBHeP0yI7HqecVbv0oGSFR5kZpMGw0U8CyhVhykVemQKaP2bE/C1kdnXlBwdOtraiYFRL7bTske05IfCm6V2ByE3dAZTSmhUwyRWli1afcLajF0DbbO7OJpQSCaBTntmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwnSOqPTIE2dgElXIN2dmCuupTh2ekO3OzdO0fvKv38=;
 b=AZ0SBDrZqPrWFNgS/FDVSwUbJ7R4Bf4x673cP5S6r5910PS0VhjNIH3hZ4DlbiTyQ08txu5YyUGFjUNkfPn9KqcpBOXvWrE6A3tcO9HBMDfGzVv1a8szNQ9I2UbagavnFSwCNUdQPEJF48p/urlz57cq7VBx15GrMwB0E6/IeiI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7363.namprd12.prod.outlook.com (2603:10b6:930:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 23:23:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 23:23:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Use bulk clock API and devres
Thread-Topic: [PATCH] usb: dwc3: qcom: Use bulk clock API and devres
Thread-Index: AQHbs98BULHt9ZOcpUy2FcqghRssKLOzd/6A
Date: Thu, 24 Apr 2025 23:23:24 +0000
Message-ID: <20250424232321.xyyjetk3bocew4yn@synopsys.com>
References: <20250422-dwc3-clk-bulk-v1-1-37c7c941330f@oss.qualcomm.com>
In-Reply-To: <20250422-dwc3-clk-bulk-v1-1-37c7c941330f@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7363:EE_
x-ms-office365-filtering-correlation-id: 1f4c62d4-5cd9-47ab-6c59-08dd838702ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDkvRWkwZ3JoVFFOM0QwQU1ySmU2d2hWSkVibklCOWFVamdHcll4akFJNGhL?=
 =?utf-8?B?YWo1U1hvRDUxbXNHaVdXR3pRN3dtVE9yQVAzTnF2bTFUbHlyd2JQaVBYSnhk?=
 =?utf-8?B?anRTanJQQklraFhRQXNKaEpDRU5kTUo2MTBBV2daak9td3NwSFh4TktUUGZM?=
 =?utf-8?B?aU9GOVpyS3IrQW1zRDZCdGx0bGJ3WmlpaUJManVjQW0yNUY0M0R3RXZvdVVi?=
 =?utf-8?B?di8wWUZ5WjgvRmRZN2tFTnhuR3FrdCsrWUlFMEZRR3BrTlcrN1VtNVI4dmhj?=
 =?utf-8?B?bzg5eTRFdEZ1Z0kvU2NsV29HdjI0Rnh2MWY1MDUrNC9MS0V6eGxUaURoMWE3?=
 =?utf-8?B?Q1FUZHFKeVNtUEl3Wk9Oc0FCKyt3MkRSNTBDZWVIT2NWTVNGL1I3ZDUwa0Ji?=
 =?utf-8?B?NVM0TnNpWlVpbEdHcnJzeGp5c0ZVMXQzQ1NsOEV2cTV0bGdOaDVpQ1VaS2dE?=
 =?utf-8?B?MnpvWkM0eWdqTC9mWTE3elhaV0ZXb2FLQXBFeTJxTmtWTzlSRDgvOFNLdSt5?=
 =?utf-8?B?K2Y2WUp4ZGd1Z21iRk1VakcxSmhIcnZ1Ny9xVXJYWGptRE9HYk1jSks3WG85?=
 =?utf-8?B?WStIc2xwWitNYm9Ic2dFOGRKeGdhMGtXMUN6bGR4SlR1R1JPQlNXRmxKQWhX?=
 =?utf-8?B?b0JLTi9RUHU3TGkrcytvdFNBUDAzTk14WjlrOWJFVkJ4aCtzUG0yS2NZSlJC?=
 =?utf-8?B?c2F6M2FEaWpzWGIrTEVQb1BjMHR6c2Y2c1J5RmpjTHY3ODY3RTU0dGhkZ3li?=
 =?utf-8?B?amFPaDJhSGlaQU4rLzRyM2xsaFFDbHJvM2VuMlJGdlZsUWsrcGJwOU9iYUNi?=
 =?utf-8?B?Q1VMVjdtaG02VGszVVovUUJqMFZPaXZqNDNIQ0ErNFp2UmpnR1Bsc29ISjZl?=
 =?utf-8?B?eTBENi84MmFSMW1jMFJURk5XOG5aOVdYSmJkU2VSZ0pvL2xxRG1OWE9pcWY1?=
 =?utf-8?B?clYwNEZBcFpRQU8wRzBEVWF4Rlk3K3RQRTRjTFdpTzQyTHJlaG4wc3lvVDNa?=
 =?utf-8?B?SGVGbWJocFBQWFhUaWhNUlkxam81NE9QYVZSK0U4NHhPTzB2TVFPRGNxYnVn?=
 =?utf-8?B?Q2JJdTBCbHc5TTExa0w1WUJXRXlPM3JNYldwaTRHSjh0S3lJYSs0SUJhbEl4?=
 =?utf-8?B?RDIyS0hVQ3BZaklCNDR6TEdyRjg1a1Nmd2FBdG5CaXVUdDIwODN5cjlIVDZK?=
 =?utf-8?B?UDd4NnAzOEZJRGdsTVU4RkRrc0VwRFBRSWxzdWkxOGhrOXd5UDRuVjJMbWdw?=
 =?utf-8?B?R09aMkZnV1ZHeGw0UU1VdFdKUkF1aUp5NE9zdkU5S0ZmYWRsZ2NmY3Z3a3l0?=
 =?utf-8?B?ZnZGRnBCZHVYcGJWcFk5TFJyeXJoME9ubHZsanVmL2xzU215L0dJbXF0Mzd6?=
 =?utf-8?B?Wm5FRFBGYTVnTGNoc3ZhQWhuczF1V3lPdnJhSTdKZmRvb2VDUXVTWlZpYXZY?=
 =?utf-8?B?TStZVzgxZk96NTRXd1QzczdGVVh1M3daNmRzeU5DTkt6QmIrdUlYYU1aNHJj?=
 =?utf-8?B?M2xMWGxSTW1jb2VjdWFXWkowU2hEcko5eU5oeE5qK2FQVlZXb2JGZWp6a3JF?=
 =?utf-8?B?YnV3SUtFa09tL09QZjE1cjhmTktnN25pSEUrTTE4WjFPSjUxcThKWFMvOThP?=
 =?utf-8?B?elhMNXlQMzRyUEh6VEJGQU5JN1hRQkkvR3FSamRjVk9YYk1oQ0tQeU4vNkZl?=
 =?utf-8?B?am40cXdBTGMzdjFvMUY0WDRkdzhHVkEyejdmOUJmWGRBamE0YWt6K2hISldQ?=
 =?utf-8?B?cEo2Z21teHpoQnZnSzRRbEN4Vy9EOWJxcmdKemd5K2hjeVorSDNqekpsd0lD?=
 =?utf-8?B?cGZJN09VTEkrQXc2NmFkWVZYVWR3cFJKY20xOGkxdmJjZXExZ2ZLeEJJRWg0?=
 =?utf-8?B?MzlrTEtRbGZ4TXRNM0lUejNDMVhscjNPZmN0SHFLZ00yVmhJS2FtamVBcWpj?=
 =?utf-8?B?d2ducE9kbC9XZVVvbVJoS0xFNmhPS1JlVUd4dkxTRUY4WU84M1FoMlBWWmgx?=
 =?utf-8?Q?NuIKUaH6IwWQAWjuPBgYIBkCTBOzwA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3QxTDRCcXAxZTVuMjZmYXI0eTVQbnNmbTlmMm9GWnJCS3JEeE5mbmhRMHJ5?=
 =?utf-8?B?N1dVSEIvSG5LWWhQV0lUMml2UmI5ajV5dTQyUmIvSjZLQ0Flc3NsdFZ6dEV2?=
 =?utf-8?B?MFNGR1lQNEYvYXlmR2E2ZGVGbHFQdFBQQndTOHJxSDJqY1dtbjA4UUdKVXhE?=
 =?utf-8?B?TGJ1WTM2ZXFwZG5WTkVhbndJR2hsN1AxQnF5aUI3RUxRQzZMMWpvdFQxRXpr?=
 =?utf-8?B?cXBwSjJIaTdISGVRbFQrRDdvVnpwVVJxVzVpN0F3dy8vWlAwTWtVZjdSRGE2?=
 =?utf-8?B?Vkk2SjJwVU9hbzZpOThvZnVqU3lnVk1QcVNlVE5mcDMzaFF0Y282NmxncVUx?=
 =?utf-8?B?SklMRVZ3NEM1Wm4zMVprVVRhZFFMM1RGaVRSTHh4L3JEcXo3Yk9DSTNkQTBx?=
 =?utf-8?B?bFVuaEJQRXJkVTlqaU94dTZjQWViaXRiWmFuTVAwRHhwa0VlS3pKT1VPSktl?=
 =?utf-8?B?L1BpVUZZN0xaODkxUCt2LzF5MkhuYTlmMzR0UExGTE5NakNVdTdEOTh3NTB0?=
 =?utf-8?B?V283Y3RucXZvK1E1UWtDbHFSNEpwWVVKMkg1elB5alJGZ3k4ZjlpbFdLeUJu?=
 =?utf-8?B?VlBsNUduQytOcVNCejN0bWFrZmV2dHJTZi9DQnlib2h2ZHIxZVg3WTY2Zmt5?=
 =?utf-8?B?aDBwYjZFTW9Fd1N6TWVjM0hVOFV5K1FvMlcwWGMzenRHZlBrWGtIZ09Sa3RJ?=
 =?utf-8?B?STF3ZGJWUmVJbHdXanZhc0Jtc0I4Ymh6WGpvTEcyVFQ0YzN1TldNMk1sa2NP?=
 =?utf-8?B?bkU1dDdZamc1Y011TXFYZ3FRUmcxOTBEZ3VWYTBEbUlRQzF2Yit3NW9sd0Nh?=
 =?utf-8?B?Tm5mL0dScDRpZnF2Qnl3NG1CU3NlMktCdEI2RU9YRnp6YkszTUpuckNJUEZn?=
 =?utf-8?B?Nm5CWlo1SHpCdWRDa0NoQVZxWFdaQnE2N0JWWE8wQjJCSFlnQjRCNXc0MUI1?=
 =?utf-8?B?NlZuUUZXc1dobnlqTm92WC9FdzdRM0ZLRTZ3TWEvWjkrcGgzRGcyS2IyRVlF?=
 =?utf-8?B?c1Ywdys3TjUxb0ZyMHJKeW5oUXM1MEVTNmFQMTg4Z0NMY1dEZlNadnJlWmJK?=
 =?utf-8?B?V1FOYTNHRTc4amNOWkRtblhsQnNyZU9xcHpyd0t1aXNSc0ZiWmJrKyt1ZTRJ?=
 =?utf-8?B?dGhNMHQwZy8zdDMzempxMEIzTFp3UkxCSFM4NDhRTnI4a3N5TnRIMXptUTBt?=
 =?utf-8?B?QjVBem5LYUJmYXEyR1IxSFAyaEVxQm8zd3I2dHg4bHRHa2J0WmQ1ZGs4RUJR?=
 =?utf-8?B?Z3hqbC8vVEV6aU5SbTFOc3VIbm9CR3ZPeDRtbjBuMk55YmpCNW5CQU4rWEZL?=
 =?utf-8?B?WVo4eUoyWDk4UzlBTWxwbkxXTnJEQUUwSjZNR21Qa1diWEo1UkV2ZFovdS9I?=
 =?utf-8?B?NStIdzRvLzFEQjdmRzI2UVh0a0lUWEpVSDVuMVpYL3E5N241K3FlaHRiM0NG?=
 =?utf-8?B?WUkyWFVGUXh0MkRML2dycXp3dW1qWWR2TXh5QnoyUHppTmNUNUsrbTFTNGlD?=
 =?utf-8?B?TDFBenlUSW5OdTFsK09DdzZ3SFkwbzl6SEc1dFk0OHFPNWdOemtnUTdGQ2Vu?=
 =?utf-8?B?aWVzUkpkb1NhVFdhbDVPNGNPaG5vL1poS25aV3hPU1FsaWRBU01Hd3ovb1B1?=
 =?utf-8?B?eVc5TG1FR3dBbkJvY0hVcllJSU5YUnpVc1RwNGoyRDZOTlRFMmdLeWdMUFlD?=
 =?utf-8?B?T2RPOC9HYm5WVlFkQjhWNTRWYTAyV3k3UWw3bzJ1d0MrVThFV1RNOHFuOVRW?=
 =?utf-8?B?RHkzVXNTUTZLYmpQMzdxU1FuNVYrWUpoOVBJUWlIRW4vQTNlcmhxQWRNeGUy?=
 =?utf-8?B?S3Z4ek1vNy94UFVUd1Bvb3JjUE1uQXlOTTdldEhHNHY0cjhwZHpjNzNhczdR?=
 =?utf-8?B?ck4rdG5HUzJmNmtRYmorbExkNnViMUZ4VFozNUFrQmlwYmtmdjdWVmM5S0xQ?=
 =?utf-8?B?VGRMcVlCY2ZYQW1NTklPclcrbVJ1YU5kUDJzRWtMT0VTSTE5cU41aHlQeWlJ?=
 =?utf-8?B?U0gwYXVjbGlTSDAwVTRpczRJQ2xPVmZxbVhqeUg4S2RLQzV3eTBVdm1UZDNH?=
 =?utf-8?B?YnRxaDcvZUZpQ01hNGljYzQ1SldWR0hPbWNPY1lWWUdGRjZya3RRQ0FXOVRW?=
 =?utf-8?Q?5VHXSM/6Yud/kfaHAj4LHITxE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0EFCA4979104245B09D807E15C4D01B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	anAAZQSbRaPA2PFnfyOhuhgbBs8MCVC0AvrxmheIAJarmd+ta72XJwbNwu1nES5uQUpsC8F5tSJGgjUxYcM2X5wPhui+PHKUCS+nG3Q5YQsyushFOUI1gkcoXWOJEoLgDE6NdEirx9U9p88EL3ORN0Bls0g5dtzxBR6UG4xKukHUwnrBpnKXcADd1yeLzBYsRXrY6apXl6OFhetwUL7+TqYONaT35qYbDnPn5K+ezHp+0l1dVfcTdeMJCp6XdHdbl8pBqGkiAjb2roo4sZBnefKtNOYqbHGiBWMQ4k3wwdqNuRDp0h0SO06USFVRSTd+O+QkrA+2JJqesBUUFxrbXj5qnFI//i6g6aAjeM58gokKsj84h3Eg0ofImEMSFnzp0ywk6EcOuATjHSAXLo3zTqIqS0tMudi5FaH403agk3KQ8EtjSjPaodKrphOg3byC3YRljEHBJAHg6thBox5XH2JP7X6KwkWRz7du0ufxy5ZCUMpI0PcSANa1chETtcSs5X26FRy22oq/E5xgrp2t+cmvZz81TzC4L3D2ZYyimo7OoFWFzalC/ih79TZ3zsqcUSKCvQ4ku/QqKXVsZQxQQpdWtuqzp7gAv98ziUkGkeBmjNR1Mac3SHpZzAPuN8OUAqWk17ksn/w6Hu2Q6JuD6w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4c62d4-5cd9-47ab-6c59-08dd838702ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 23:23:24.5488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGZBgFAQl7I/aO3zMNyoJ1pjeWf72tvp0LLNoB+ndPATDv696Gnr4J4RXip3AZKsp2XUm8cP6PBkb067cUn6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363
X-Authority-Analysis: v=2.4 cv=SsSQ6OO0 c=1 sm=1 tr=0 ts=680ac7f4 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=eeF8L_rBI3w7Q6psAe4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NSBTYWx0ZWRfX3o7k64FsPJqK AkOXFU5XGgoe7k4PLgjKAty1uA7eGBxq7Z1g8fKjKqwv0KgoH7lEVBs9DzTtyCGKJdh3nQ07W8a c56+XcZYNytU0kSt73joZA/Ty239f42OmKKeYQX90+wr5QIohZHeA0HLXYETpFEGh7F9kXGE7ak
 hmP/IWjTwdsYK6pgu+Nd2NW4kfoh+MwBbUfi+L1OiqHCZbaLe5v6A+7ZTr1vHrEuNoiW41NT7zS hmSXU9aonYf1EgnyRhDe2KQSBoablwg6ZKwhrlFSD5EHOmi7jBod41ZxRSLVI+pcBzt3VIOQkGi sFmoJDuDR4sVC73UuwD7MmyhjLaCepsvHC0Rbg5eLEP6rKxFbMtmWfiRXTQOEu6Tia7oNg57pEF
 q+caunb+atpAFEMfkP5DeV/Dfjx6FHD2278pkfQoc8oZNJSa9wJ0y372163ohebNkbVU8xNQ
X-Proofpoint-GUID: a2eM4ajvVkoqlnKR0jHomGOQaNhGF42N
X-Proofpoint-ORIG-GUID: a2eM4ajvVkoqlnKR0jHomGOQaNhGF42N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2504070000 definitions=main-2504240165

T24gVHVlLCBBcHIgMjIsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gVGhlIFF1YWxj
b21tIERXQzMgZ2x1ZSBkcml2ZXIgZHVwbGljYXRlcyB0aGUgbG9naWMgb2YgdGhlIGJ1bGsgY2xv
Y2sNCj4gQVBJIHRvIGFjcXVpcmUsIHByZXBhcmUsIGFuZCB1bnByZXBhcmUgdGhlIGNvbnRyb2xs
ZXIncyBjbG9ja3MuIEl0IGFsc28NCj4gbWFuYWdlcyB0aGUgbGlmZSBjeWNsZSBvZiB0aGVzZSBo
YW5kbGVkIGV4cGxpY2l0bHkuDQo+IA0KPiBUcmFuc2l0aW9uIHRvIHRoZSBidWxrIGNsb2NrIEFQ
SSBhbmQgbWFuYWdlIHRoZSByZXNvdXJjZXMgdXNpbmcgZGV2cmVzLA0KPiB0byBjbGVhbiB1cCB0
aGUgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5k
ZXJzc29uQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXFjb20uYyB8IDg0ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggZDUxMjAwMmUxZTg4ZGE5NTIzZmY4MjQ1NGU2
NTNiYWM1NWMxNDA5ZC4uZWM2ZTE5N2NmYzMyYWJmNWFiOGY5YjIzYmE1OTBiZDFhMTI2YjUwMCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IEBAIC03Myw3ICs3Myw3IEBAIHN0cnVjdCBkd2Mz
X3Fjb20gew0KPiAgCXN0cnVjdCBkZXZpY2UJCSpkZXY7DQo+ICAJdm9pZCBfX2lvbWVtCQkqcXNj
cmF0Y2hfYmFzZTsNCj4gIAlzdHJ1Y3QgZHdjMwkJZHdjOw0KPiAtCXN0cnVjdCBjbGsJCSoqY2xr
czsNCj4gKwlzdHJ1Y3QgY2xrX2J1bGtfZGF0YQkqY2xrczsNCj4gIAlpbnQJCQludW1fY2xvY2tz
Ow0KPiAgCXN0cnVjdCByZXNldF9jb250cm9sCSpyZXNldHM7DQo+ICAJc3RydWN0IGR3YzNfcWNv
bV9wb3J0CXBvcnRzW0RXQzNfUUNPTV9NQVhfUE9SVFNdOw0KPiBAQCAtNDMxLDkgKzQzMSw3IEBA
IHN0YXRpYyBpbnQgZHdjM19xY29tX3N1c3BlbmQoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgYm9v
bCB3YWtldXApDQo+ICAJCWlmICghKHZhbCAmIFBXUl9FVk5UX0xQTV9JTl9MMl9NQVNLKSkNCj4g
IAkJCWRldl9lcnIocWNvbS0+ZGV2LCAicG9ydC0lZCBIUy1QSFkgbm90IGluIEwyXG4iLCBpICsg
MSk7DQo+ICAJfQ0KPiAtDQo+IC0JZm9yIChpID0gcWNvbS0+bnVtX2Nsb2NrcyAtIDE7IGkgPj0g
MDsgaS0tKQ0KPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUocWNvbS0+Y2xrc1tpXSk7DQo+ICsJ
Y2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocWNvbS0+bnVtX2Nsb2NrcywgcWNvbS0+Y2xrcyk7
DQo+ICANCj4gIAlyZXQgPSBkd2MzX3Fjb21faW50ZXJjb25uZWN0X2Rpc2FibGUocWNvbSk7DQo+
ICAJaWYgKHJldCkNCj4gQEAgLTQ2NSwxNCArNDYzLDkgQEAgc3RhdGljIGludCBkd2MzX3Fjb21f
cmVzdW1lKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiAgCWlmIChkd2Mz
X3Fjb21faXNfaG9zdChxY29tKSAmJiB3YWtldXApDQo+ICAJCWR3YzNfcWNvbV9kaXNhYmxlX2lu
dGVycnVwdHMocWNvbSk7DQo+ICANCj4gLQlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVtX2Nsb2Nr
czsgaSsrKSB7DQo+IC0JCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShxY29tLT5jbGtzW2ldKTsN
Cj4gLQkJaWYgKHJldCA8IDApIHsNCj4gLQkJCXdoaWxlICgtLWkgPj0gMCkNCj4gLQkJCQljbGtf
ZGlzYWJsZV91bnByZXBhcmUocWNvbS0+Y2xrc1tpXSk7DQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiAt
CQl9DQo+IC0JfQ0KPiArCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHFjb20tPm51bV9j
bG9ja3MsIHFjb20tPmNsa3MpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0K
PiAgDQo+ICAJcmV0ID0gZHdjM19xY29tX2ludGVyY29ubmVjdF9lbmFibGUocWNvbSk7DQo+ICAJ
aWYgKHJldCkNCj4gQEAgLTY0OCw2MiArNjQxLDE0IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Nl
dHVwX2lycShzdHJ1Y3QgZHdjM19xY29tICpxY29tLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19xY29tX2Nsa19p
bml0KHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGludCBjb3VudCkNCj4gLXsNCj4gLQlzdHJ1Y3Qg
ZGV2aWNlCQkqZGV2ID0gcWNvbS0+ZGV2Ow0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZQkqbnAgPSBk
ZXYtPm9mX25vZGU7DQo+IC0JaW50CQkJaTsNCj4gLQ0KPiAtCWlmICghbnAgfHwgIWNvdW50KQ0K
PiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAtCWlmIChjb3VudCA8IDApDQo+IC0JCXJldHVybiBjb3Vu
dDsNCj4gLQ0KPiAtCXFjb20tPm51bV9jbG9ja3MgPSBjb3VudDsNCj4gLQ0KPiAtCXFjb20tPmNs
a3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBxY29tLT5udW1fY2xvY2tzLA0KPiAtCQkJCSAgc2l6ZW9m
KHN0cnVjdCBjbGsgKiksIEdGUF9LRVJORUwpOw0KPiAtCWlmICghcWNvbS0+Y2xrcykNCj4gLQkJ
cmV0dXJuIC1FTk9NRU07DQo+IC0NCj4gLQlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVtX2Nsb2Nr
czsgaSsrKSB7DQo+IC0JCXN0cnVjdCBjbGsJKmNsazsNCj4gLQkJaW50CQlyZXQ7DQo+IC0NCj4g
LQkJY2xrID0gb2ZfY2xrX2dldChucCwgaSk7DQo+IC0JCWlmIChJU19FUlIoY2xrKSkgew0KPiAt
CQkJd2hpbGUgKC0taSA+PSAwKQ0KPiAtCQkJCWNsa19wdXQocWNvbS0+Y2xrc1tpXSk7DQo+IC0J
CQlyZXR1cm4gUFRSX0VSUihjbGspOw0KPiAtCQl9DQo+IC0NCj4gLQkJcmV0ID0gY2xrX3ByZXBh
cmVfZW5hYmxlKGNsayk7DQo+IC0JCWlmIChyZXQgPCAwKSB7DQo+IC0JCQl3aGlsZSAoLS1pID49
IDApIHsNCj4gLQkJCQljbGtfZGlzYWJsZV91bnByZXBhcmUocWNvbS0+Y2xrc1tpXSk7DQo+IC0J
CQkJY2xrX3B1dChxY29tLT5jbGtzW2ldKTsNCj4gLQkJCX0NCj4gLQkJCWNsa19wdXQoY2xrKTsN
Cj4gLQ0KPiAtCQkJcmV0dXJuIHJldDsNCj4gLQkJfQ0KPiAtDQo+IC0JCXFjb20tPmNsa3NbaV0g
PSBjbGs7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gIHN0YXRpYyBp
bnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+
ICAJc3RydWN0IGR3YzNfcHJvYmVfZGF0YQlwcm9iZV9kYXRhID0ge307DQo+IC0Jc3RydWN0IGRl
dmljZV9ub2RlCSpucCA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiAgCXN0cnVjdCBkZXZpY2UJCSpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiAgCXN0cnVjdCBkd2MzX3Fjb20JKnFjb207DQo+ICAJc3RydWN0
IHJlc291cmNlCQlyZXM7DQo+ICAJc3RydWN0IHJlc291cmNlCQkqcjsNCj4gLQlpbnQJCQlyZXQs
IGk7DQo+ICsJaW50CQkJcmV0Ow0KPiAgCWJvb2wJCQlpZ25vcmVfcGlwZV9jbGs7DQo+ICAJYm9v
bAkJCXdha2V1cF9zb3VyY2U7DQo+ICANCj4gQEAgLTczMywxMSArNjc4LDEyIEBAIHN0YXRpYyBp
bnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCWdv
dG8gcmVzZXRfYXNzZXJ0Ow0KPiAgCX0NCj4gIA0KPiAtCXJldCA9IGR3YzNfcWNvbV9jbGtfaW5p
dChxY29tLCBvZl9jbGtfZ2V0X3BhcmVudF9jb3VudChucCkpOw0KPiAtCWlmIChyZXQpIHsNCj4g
KwlyZXQgPSBkZXZtX2Nsa19idWxrX2dldF9hbGwoJnBkZXYtPmRldiwgJnFjb20tPmNsa3MpOw0K
DQpEaWQgeW91IG1lYW4gdG8gdXNlIGRldm1fY2xrX2J1bGtfZ2V0X2FsbF9lbmFibGVkKCkgb3Ig
ZGlkIHlvdSBtZWFuIHRvDQpwcmVwYXJlIGFuZCBlbmFibGUgdGhlbSBzZXBhcmF0ZWx5PyBJIGRv
bid0IHNlZSB0aGF0IGRvbmUgaW4gcHJvYmUuDQoNCkJSLA0KVGhpbmgNCg0KPiArCWlmIChyZXQg
PCAwKSB7DQo+ICAJCWRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZ2V0IGNsb2Nr
c1xuIik7DQo+ICAJCWdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiAgCX0NCj4gKwlxY29tLT5udW1fY2xv
Y2tzID0gcmV0Ow0KPiAgDQo+ICAJciA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgMCk7DQo+ICAJaWYgKCFyKQ0KPiBAQCAtODA0LDEwICs3NTAsNyBAQCBzdGF0
aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
cmVtb3ZlX2NvcmU6DQo+ICAJZHdjM19jb3JlX3JlbW92ZSgmcWNvbS0+ZHdjKTsNCj4gIGNsa19k
aXNhYmxlOg0KPiAtCWZvciAoaSA9IHFjb20tPm51bV9jbG9ja3MgLSAxOyBpID49IDA7IGktLSkg
ew0KPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUocWNvbS0+Y2xrc1tpXSk7DQo+IC0JCWNsa19w
dXQocWNvbS0+Y2xrc1tpXSk7DQo+IC0JfQ0KPiArCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJl
KHFjb20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3MpOw0KPiAgcmVzZXRfYXNzZXJ0Og0KPiAgCXJl
c2V0X2NvbnRyb2xfYXNzZXJ0KHFjb20tPnJlc2V0cyk7DQo+ICANCj4gQEAgLTgxOCwxNSArNzYx
LDEwIEBAIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjMyAqZHdjID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7DQo+ICAJc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IHRvX2R3YzNfcWNvbShkd2Mp
Ow0KPiAtCWludCBpOw0KPiAgDQo+ICAJZHdjM19jb3JlX3JlbW92ZSgmcWNvbS0+ZHdjKTsNCj4g
IA0KPiAtCWZvciAoaSA9IHFjb20tPm51bV9jbG9ja3MgLSAxOyBpID49IDA7IGktLSkgew0KPiAt
CQljbGtfZGlzYWJsZV91bnByZXBhcmUocWNvbS0+Y2xrc1tpXSk7DQo+IC0JCWNsa19wdXQocWNv
bS0+Y2xrc1tpXSk7DQo+IC0JfQ0KPiAtCXFjb20tPm51bV9jbG9ja3MgPSAwOw0KPiArCWNsa19i
dWxrX2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3MpOw0KPiAg
DQo+ICAJZHdjM19xY29tX2ludGVyY29ubmVjdF9leGl0KHFjb20pOw0KPiAgCXJlc2V0X2NvbnRy
b2xfYXNzZXJ0KHFjb20tPnJlc2V0cyk7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDJjOWM2
MTJhYmViMzhhYWIwZTg3ZDQ4NDk2ZGU2ZmQ2ZGFhZmIwMGINCj4gY2hhbmdlLWlkOiAyMDI1MDQy
Mi1kd2MzLWNsay1idWxrLTk2MGE5MWVkNGFiOA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLSAN
Cj4gQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25Ab3NzLnF1YWxjb21tLmNvbT4NCj4g

