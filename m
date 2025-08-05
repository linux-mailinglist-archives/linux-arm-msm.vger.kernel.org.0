Return-Path: <linux-arm-msm+bounces-67814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22967B1BCFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 01:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42BE117F968
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 23:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8261F25B693;
	Tue,  5 Aug 2025 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qnYBq8QZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cY9smgXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NaEZYAL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF221B960;
	Tue,  5 Aug 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754435913; cv=fail; b=W30qndlraO6fbCCmL+8TI77pe2sERDfEcB2Gdhvl3bNhJcwCk9uZah+fBxW9TNqYHQYj/9L5TuDKrCfgSdhLt843I4H1KuhIQorqzyeQY0jel3QuYo0yqJf6O8mLXVefRooINdlNjbpUgE9v5lQE42aBolc6QamBu1HPLV56ysw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754435913; c=relaxed/simple;
	bh=U1MRUO1zCDsYbco1/+mKgL8HAz7MOleOr5SUC0tFi9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bY94t94SOuk8sMjClPzjHJnzjrHYgB0gO9WYoWci6955siRUVLHixpeYK2T6pn2zR1cuSCvyNCpa9jE/S5RjCZH6gfwuF8UC5GsuV+hM0gca14gWst9KH/a2wyzZrlYm91VROo9WytI2LY2F/v8wHLKwy7gCcwvKBX/qly0xv1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qnYBq8QZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cY9smgXX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NaEZYAL9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IB3VT030811;
	Tue, 5 Aug 2025 16:18:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=U1MRUO1zCDsYbco1/+mKgL8HAz7MOleOr5SUC0tFi9Y=; b=
	qnYBq8QZpRqQ5tT/hWuhF0FqLfa+VIO0th/hzhL3Ge46UiyTfeBRPA0QIqtqGcqB
	JAHj3Hour/d6Uyjasyp2LSOdFltntQTlZdOPWcJlTlWH7LgbSQejliyMu9Y/TZ+p
	+C7s8fhKt8BfJ5hSrbMvsbvjS+u3Rgae+V9ymi9H8jUds/gssc5VmyJZuneR6h75
	EftaOpDlTqiCbF+PO0fZ0t8yBtfcMyZ+1CVc6r3ifaZQS+5992VHDdgYmklnU0LU
	J7uQCETF5yfVv5l6CMjSt0OB3RPbk9IlVNzSkjQNRbfpvJDsWLO2A2kZwVvT7Ton
	AyzP7A077SqwfKDIZinwNA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48bq0v1dhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 16:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754435895; bh=U1MRUO1zCDsYbco1/+mKgL8HAz7MOleOr5SUC0tFi9Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cY9smgXX7P/RHT/w+QjrXvyvpHZ0tqb+q+vLgn7QLBTzLT/1MGUh7IegEiBggm+Fx
	 epbXgu5um5oR6VWMYfnDeKIM3Q7HQi+x7L3N8z475mRHiTV8+vWJR/gOA+zD+PPeI3
	 jGp3dK/hPznfGpD7IfLYf3XSVBhGHXiEXOekBMPSbF5xnSHZtYxUOPPSv2ERmxpHcb
	 OlrJ0sq4y1CWUfIYg2VNfJm/FKwA01tWDaq3DyANNniTGkeUhvchrMIyXmNXSrcwCm
	 pxwL/aA9jzghJIt9zpf12NnBuj5MSM+DewqDDNNQY93r3/qg0a1Nnt7xjhlSVNrBuL
	 2G+moy4QZyF7A==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13F3E4045D;
	Tue,  5 Aug 2025 23:18:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AB71AA006F;
	Tue,  5 Aug 2025 23:18:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NaEZYAL9;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D6C4F40362;
	Tue,  5 Aug 2025 23:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBaonCsz2DJjzyrwDzHY9rI9stpXdRG3cZtiCQfnehfQx61UU2HnLOQ025aW77EKdO0BkIvMMu/TQA3d1NOGtUgqpcBdh8gJCQ3hS7GI1KFvoEmR2rVKVH9EmewmFpTdNDv8RBJqY8zRrNLfWHm23dVygPAnji7DhG1AZv10F12JWwSeLlZACBQdUkbG6jcsA61M7T1c2tG45y1+CypD5tm5DUegGE7/nleuMUM1i0bAX5qlY/NwC2EkM6U5BcnkvBFtfKskXFAN8XqFu0ndNlcqfGGBY7dRq6DN8VtMgXjFc9ShhyR8J2fvbwMoyPBFkX8CazOgDVSOk7NTF5NJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1MRUO1zCDsYbco1/+mKgL8HAz7MOleOr5SUC0tFi9Y=;
 b=YbTQRf93K1ZDIMEcM0Kk4vzlRObp4gWtBn+0l/tF9x2nPsM419FGosTdIqFdy74q+xP+mi3JCH0E2cx6/hR7ijj/8/UjpW2YbdiXNy7iBS483XzPaQ5UYK8hDfc5oXzXP1g2IGdG4oaUMR7JRPmN/2sJtZeKNYQIYGlzTRnxWBaznDAc9L2YiNP5jBr66p/dkSWmkTBKX5JQxwEnz1RLNI7ni5rqTJO4ZazMZiFszaVcjje+MOscwiEe1MK8GE//apCX3+NbgWClh3GKYZcbwReJN+PKiQPrSX/pA4IvQWtInfbBS9CvTFD3j7BBUJEUXoFk9dyBUNb3ieSsGPSrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1MRUO1zCDsYbco1/+mKgL8HAz7MOleOr5SUC0tFi9Y=;
 b=NaEZYAL9VSTHDdStv2DegudzeIlDAwACOEsWhiOkcnGeMBxauJguglZO28blPaFQbKFsrf9AAY7nVpkbBuc7iILdOVpRGoXeuXKVSLDhng3nYdQvNnlAOLzYmQCkjOBnmNxihe1kfxL3SPctm/uQ0ZEWZJIOkBDJv5BXd9p8FWA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 23:18:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 23:18:10 +0000
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
Thread-Index:
 AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWAgADi4gCAG2ZUgIACOgUAgBovsYCAAA7YAIADD7uAgAb1wwCAAMkRAA==
Date: Tue, 5 Aug 2025 23:18:09 +0000
Message-ID: <20250805231808.cjht64mfabaw2ik5@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
 <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
 <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
 <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
 <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
In-Reply-To: <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB6443:EE_
x-ms-office365-filtering-correlation-id: e0ca060c-2a6c-421d-2eb8-08ddd47657bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0RZSlhxeE1WckpJckRxbjZncmhKMU44ZmdJYUEzWUVzcnFyL3ZpOEhESTZu?=
 =?utf-8?B?OWtNais5U2daVm15Ylg4UVlPSlFLVnpVODhuNjFDODdYN2ZKUnp2OGo1Zng3?=
 =?utf-8?B?YUlQR3diYTRlNjhVbElndHRRM2t6dTFSTFY4T2h6eHFBWk5lYW4rREgrb3dl?=
 =?utf-8?B?bFVYYmRScDFOMHZpR2JNazBPSnRZNTJRTnVWMm5zczltcGxtKzVrdnZ4U00r?=
 =?utf-8?B?K2ViZUN5cXUwR3A4bWR3eUZTT2M0eVAzUG5rL0d0TUdTUU56bDNqaHppZHRC?=
 =?utf-8?B?OTdxbUxBUzcxOTdOMEVjUXlFaThCamR0NFRGTXdaV2NINDdQdFZUUXdnVG00?=
 =?utf-8?B?ODl1aFBoSGxDallLWjYxZitsenl1YkNWUEVCM3YxOU9RblhUK3J0SVhndlov?=
 =?utf-8?B?ZUwwRTdyVXlpMWE2aWg4QUt2bHhsY0dpM3ZIVlJZNGpiODg0UUhxYTRGY0ph?=
 =?utf-8?B?bG4wc0NSSVF1Wlk0b2dORlVDb1dOTldNTzh3Y1RWSTlFLzYwSnk2UHVIa0xS?=
 =?utf-8?B?cnQ3cGR2SWFBOGZNcFU1RjhqU2lYenZiYUJMYmp4S2daT2M2ZlBpZ2FJWGc4?=
 =?utf-8?B?WGVoQXlPMG9hekRTSi9KNit6MmxRYjNuN29CZmNlai9hWUc3OWl2UzlXU3g3?=
 =?utf-8?B?YlBueFBXeU8xYkFZcmRUb25DZnpONzJaYmJTSUlVeEc5enJGcTR3Um16YVQ1?=
 =?utf-8?B?TU5FUm1weVY1SktGcUR5TWw5MDhPRzZVbngwNGIzREF4dVdLUENWVE5EV01S?=
 =?utf-8?B?Ly8xM1hvdGtuZkg0ZGVwODZNK1I1MlZOa3A5WWlUQ0d5K25HVWV0bkhFMTFH?=
 =?utf-8?B?M3JoWFJRZjN3QVhiTXdEZWlodVlXRWlOMXpib0dTcXpNNWlYV0QyNjNoWW5Q?=
 =?utf-8?B?cjRxVEcvTVJYMTFodEtvMW5aSnBIZmFGb2cyQzMrWUZnU005MVQvakJ2cmZz?=
 =?utf-8?B?SWM2QzZpWXZqQTdCdHJVVnFGT3M1MkYzemg5WVhrZDN3UG9jV3JXaXFobXhx?=
 =?utf-8?B?YUUwSzZGS1Z5QklrUWxUcVFjaFMvQ0NWdnhHQjUwOXRCY2prei9tM1ljRG14?=
 =?utf-8?B?YVJaTmlZMURVcVNpNWJuNjNEZndEMGtscDMzaU1wMnpGOXF4Ny9SN0ZxeDhY?=
 =?utf-8?B?cmNMcmczVExpS3FIOTNxSFczd2R0WkhrcVA1WHNpTXE0NHlzRm1tVGsxSmVq?=
 =?utf-8?B?TjBqemFjSFJPUXBGbkUxaXA4a2hnWWcxWHh2cHFFa0tsa05Id080ZzAvMkhu?=
 =?utf-8?B?dlI0K1ROc3BmTmtLU1RsbE5NcXBpc2VVMmJ4OXR6RXRjRFpuKzBCOFBmUGpt?=
 =?utf-8?B?WjNUYlVIWDdSR0xuYVFyVkpYTHF2LzA1czBSUUlxdzRDTkN4ejZLNzJySyt2?=
 =?utf-8?B?bk04bVpvdTNWMDNINHFEY084OE9tUUZGUzIvbFNpNlpNRXhXZmowL0IyZHpu?=
 =?utf-8?B?K3p1cTA3NjdyTmcxaWhneWVHdnpLNkxPZFZvcDJHVWZ6c21DZ1piZS95RkJ4?=
 =?utf-8?B?RVpKZ0IrblhVdDJzaUh1eWZockFmZFZzVVcvZkUwSStsOFpUUG5jajdVZzZQ?=
 =?utf-8?B?NEo2VXllZzNJS3VLQ1Y3dlN4Q3VlQm8xTWF4KzFsVFpyK05scGYvQlZrR3Ur?=
 =?utf-8?B?d0pKWGpNNTNXOXYxNEF0WFFZMVorZ3ErZzQ0NnFmYzhibE54QnhPOHlraUhV?=
 =?utf-8?B?ckRsQ3RZSUkrM3RHZFpHTjEralRiSENCM05nellLQVJNRzFLdlJlR0dtNlFx?=
 =?utf-8?B?R3I2OW5oMXRQZWM2WkZrSlIyKy9oVGQ5a2NFYkdObFlFSHRUUFVEdTVlNXhQ?=
 =?utf-8?B?cmliZE5UWnM3UmZhc21PZC9QNkMwNzYyVHoyclRHV1ZzL0Rmdlh2UWN5OG52?=
 =?utf-8?B?R08zR3h0S1FJbHdKSWtIQXh4eWp6L0hxMWN5THE4YWg5bWR4QldaTm5MZ2NZ?=
 =?utf-8?B?cmxoYUtWUVRTbmlRZkROcUc1VC80QXpsUTkzN2JOd0lSSCsyZGlNbGd1Y3Vm?=
 =?utf-8?Q?SHioGCMP5EgNRaC/dxFulMVTdk1sH4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEYrZE9Uc3VEVS9jWllNK3V1QUlXOUQzUEpQOXBGOGpBY3RyVHBGU0JTeWFG?=
 =?utf-8?B?QjJNa3hhYU56dFhDZTRIZTV3ZzhtZFVGZ3Jydm5PV1ZqV3BBV1lrQi9pZUgv?=
 =?utf-8?B?SzBnbTg0d0xUcGpHK3duNWNOU2hFWHc1eFVFZnZ1dkxUdWVuQzlkSjIxeWhz?=
 =?utf-8?B?SHFndllzVll3RU9SZTF3Mlp5TzR5SVVpOVdvZG9UU1RmeE9reUZ0OFR1Um1h?=
 =?utf-8?B?Zi9USkVSMWVkblZOdEQydThHVU9nTnlnMmU4dlhSWHJRaCsvdFZiUmFDZUd5?=
 =?utf-8?B?eEtjN01RRHNOLzg1TXQ4RTlVMUVOVFk4SGZ2WThpT0trelcyMm9VTGZhQm9G?=
 =?utf-8?B?N3J1QUJPVzRVTUltMjNkSDBDaGkxd0VGWUdSTTdYZTRVQm1tVlN1MXFVQllm?=
 =?utf-8?B?elZUd05vVkFjNVJHSDExd2tnYjVvTU82ZGdvc1psb1lPbDM3RzdTMWhHSkhU?=
 =?utf-8?B?YXpQM2p3ZzNveFB3V2lGRkNMaDZPL2NRZzRLVWdCMGpZZXdsdnNJMGFTSEVo?=
 =?utf-8?B?SklMalUvanpwdXZQdjZjaVJLQm5UemFOcWh1T0dSVjFad2ZsY01Hb0VLdHlV?=
 =?utf-8?B?eFNweUpuS2ZCQ2ExTVZ6cElnWkJhRGlzaE1IbVNSTlQva3p1b3hrWHl0dGRn?=
 =?utf-8?B?M3BNRWNGcXFMNlNYcEpWMU0wL0tpZU5tdnA4QzNmNTZZMHgyT2hUY2pEb3ZG?=
 =?utf-8?B?ZzRVYXRyRWdWQ2pBS2hFNTF5TitrOURUdDdNTnNrNkxNREZxclBBSVhHN1A2?=
 =?utf-8?B?VGtka2xJVWtUQS9vS1huS25NZlBkNkVYUTZYT0o3akZrd3p6VmNObm1qUkRV?=
 =?utf-8?B?MWloYmtuSE9ia2lyb0lGZ2J3NXlXMk5IeG1aUHJxRGU4K0h1QWhRbmFGVVRE?=
 =?utf-8?B?clpwTmIyeEpJaUdKY3Fkd2ZWY2I2cEdQQVNJVmRMZEZWbUpPME55eVEwRnZs?=
 =?utf-8?B?M3VGSDJvdmRsa0lxUW9WbGM0Z0ozRkxuMHByRTdmNlJydndCZzdpT3Uya0dL?=
 =?utf-8?B?bEh4NUxXMEZjK09BSVN6R2F3eTZFN1ZuVDUvVHdnSmk1clF6N2tyZ3BTWGlt?=
 =?utf-8?B?NkgwS01uVmxsR3NWdTBVd1dla09OZnRQS0k4Y29OUjB5NXNlMTNnUTNaVmQ5?=
 =?utf-8?B?dm9waG5wSTVMN3k1Z2lOV0tpcVR4UkNyRUhsck1seWxFRkFUWHFiTHRyYW0y?=
 =?utf-8?B?dzhFYXlLT0wzUzluZ3J4Wjk4bDVSVDB3cE9QVVdQVnN4SGlicnc2STNGakxV?=
 =?utf-8?B?K0pjRlhhbmlxWG43ekRXbWNRQ2d3MGlvTHI4OThhTzFETDRaZStCbUl1UW00?=
 =?utf-8?B?Z3Ixd3RTNG9rQm56aCthakJYam5OVFRScG9CVXV4S29UWXZWbFpsdUJDcUU3?=
 =?utf-8?B?SDg3VStTWUhLeHhKWUZMTjhFRm9HRXFaeGN2SlNZQll1SzFWTnBkSTJjWDJF?=
 =?utf-8?B?bnZwRXJTSjROckZFa3VwYTlqV2ZGNEhZVDUxb1ljUU82TGd5QVFUUy9BcUU4?=
 =?utf-8?B?UndHYVJUUXV5THMxQ3FDRGJIUzVBc2xSL2ZVUFRyMmVJL2MyeUVzZzE1Z2Qy?=
 =?utf-8?B?dFRwemxZczROMy9WVk5XWXY1V0VYK0wvUFI2Mm84eVpWS2JaRCtHVG5Qa3M2?=
 =?utf-8?B?WmNRbmtLUEg3Zm1lZGhhYlBJSUZQU0oxakhIbVdmc1QrdkNqb2hvRmRkR3lr?=
 =?utf-8?B?TkdlVmxKbjBDaEYrMjJ0WTFzRklhZ1pGVmxQWnFJaStncEhsT2VCL2lmc28y?=
 =?utf-8?B?TWhyWlg4YXdnNUwrbGh2bUgwamFBa1kxL0xua0l3NFhDWXF1ZUxrUXNvc1Fs?=
 =?utf-8?B?TTgvVWpNeCtiYmZjSks2bzlMcnR5OTk0bXNoZ1RDa3prY2I0bmNZQlgvUUp2?=
 =?utf-8?B?YlVnVWIwL0tLYXRvYU9tTnkrNzBTMFNHUlpuSkQ1Tkg2bllGVmtucWh2cEdy?=
 =?utf-8?B?Mm1ieEx2blpDOG9qcjU3K2J6U3AyemdtWE5za0lqSnFJNm12SENsRjFnSUpX?=
 =?utf-8?B?UFJKRGszbmtHRzVZR2hvTytFemMyRkZBOERkRG0vNUljSCt3cGFKNkhNRmVP?=
 =?utf-8?B?Q1lVc1BQRFIySXVzL1dsRmlkVjdyZDdaQ2dudjM0WXNXaXFrL254Rnlyd2ZQ?=
 =?utf-8?Q?EUGLsdYW5I4FCfwS1gKHsw9W+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62335A9216E6C54E9FD87D12A9E92480@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6zqKEEav5hQRD8AKDZzTLWZYnlSVtgEsDDGHH1k1JSrq7B+F5OLg9YHfXF0SHCeOiKJiuhAB+uODHj09O/Yh9Jun6QxxV1QFm3J6IwA/JKl50gIQgG2I8sfBhnYOmOyFzLchtNn6MoswqDmYhkLNjbDvVy9WdPDbwNBhA9NUwNfRJmXFFuJz/UstQHHRnpC+P7fSUSL0gEsxMsp1EDGyiPfYz2yD4yTLoDTOtYNnQ5rTTEVU4IgNiiJCBOcYx1GsbsNCjHB04o6GunEGVXBpQdSUuPeP5xV/6ox5bKkJBo13THka31Sg4zMlO3Xff4P/8sT8Looic1raJ0NEeLervw5La+ENMxg+u5PsKH004H2/3mZIU/TAcyWZCNzuO3u9fbT2jXmrbmUZtV5XXU9jae83Be+T5a55GPplxLbWwVJInFw7nzI6wl56pJNUcic8jvU8518Gs/b3uaL25qbB9iP2WGodXdmm3ixMiqgz4ViiT0suQZMXDIZwxddqyn6VePPGVEYHdZOSkJZffGY7HZxky9zphiJ27C7wcUrckcm6TPYl1XZeBTPuHBKhca7sIFWKA55awWT3ejO6PUTFUUlHLsPcPC840O2kW0GEb76CwTybPWqGVsL78ju47CQXeCpjawhJRM8+0lPdw01hTw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ca060c-2a6c-421d-2eb8-08ddd47657bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 23:18:09.9203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pM5pGAdCMqfviGwYnGrA2Zqp9OTb3PpnIAJTWvbwQ2fxDNAipJ0T0fjo/knL5yXpqlBXojsajGmeb5/DtS0HHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443
X-Proofpoint-GUID: oiTo3ZWSksP6sRPu18NprGo0jLY5DIza
X-Authority-Analysis: v=2.4 cv=QJ1oRhLL c=1 sm=1 tr=0 ts=68929138 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=Su9-aplNltZ4Lq1KURIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oiTo3ZWSksP6sRPu18NprGo0jLY5DIza
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOCBTYWx0ZWRfX6WRdqPkwdAY9
 F5IN/2Ck01z+rWD4NIwKfbbiHmFLTzn6lqNG68h6llCFGWb9vO+xaPodQ5SEh6ySBSF0ss3zLet
 znI7Iro0Mo9Qto1W7ODpJL0rsqjjlC8tpp6sus6N20I9ZXYLVS1T1mV7Tk/vZOnzJQAdKxPZ/CT
 raKs4+q6k2V9whtm5b5zGw7KTEAW3KhWi2QZZL1NZbuMaxAJ98lG9QVFiBXxp15Ghwyt9mnfuPC
 PD6x9OtiJVNfY+pUTK3uTcK/Ye5Sll87U24R1g8jq2edc6TkGqiMd1m7UhSizxDxnRmm0b73G2D
 vmCCJL/nq+2+ISzN6jnMHtqtzvojDvgxC+CpV1QXxCjAzcFcGRtjiAirl40myd2OboQgO/iBl33
 ZwJHvCzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050128

T24gVHVlLCBBdWcgMDUsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gOC8xLzIwMjUgNjozMSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwgSnVs
IDMwLCAyMDI1LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+
IE9uIDcvMzAvMjAyNSA2OjUzIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9uIFN1
biwgSnVsIDEzLCAyMDI1LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IE9uIDcvMTIvMjAyNSA0OjU5IEFNLCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+ID4gPiA+ID4gPiBPbiBUdWUsIEp1biAyNCwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBPbiA2
LzI0LzIwMjUgNTowMiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9u
IFR1ZSwgSnVuIDEwLCAyMDI1LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+ID4gPiA+ID4g
PiA+ID4gT24gUXVhbGNvbW0gRFdDMyBkdWFsLXJvbGUgY29udHJvbGxlcnMsIHRoZSBjb25uZG9u
ZS9kaXNjb25uZWN0IGV2ZW50cyBpbg0KPiA+ID4gPiA+ID4gPiA+ID4gZGV2aWNlIG1vZGUgYXJl
IGdlbmVyYXRlZCBieSBjb250cm9sbGVyIHdoZW4gc29mdHdhcmUgd3JpdGVzIHRvIFFTQ1JBVENI
DQo+ID4gPiA+ID4gPiA+ID4gPiByZWdpc3RlcnMgaW4gUXVhbGNvbW0gR2x1ZSBsYXllciByYXRo
ZXIgdGhhbiB0aGUgdmJ1cyBsaW5lIGJlaW5nIHJvdXRlZCB0bw0KPiA+ID4gPiA+ID4gPiA+ID4g
ZHdjMyBjb3JlIElQIGZvciBpdCB0byByZWNvZ25pemUgYW5kIGdlbmVyYXRlIHRoZXNlIGV2ZW50
cy4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gVVRNSV9PVEdfVkJVU19W
QUxJRCAgYml0IG9mIFFTQ1JBVENIX0hTX1BIWV9DVFJMIHJlZ2lzdGVyIG5lZWRzIHRvIGJlIHNl
dA0KPiA+ID4gPiA+ID4gPiA+ID4gdG8gZ2VuZXJhdGUgYSBjb25uZWN0aW9uIGRvbmUgZXZlbnQg
YW5kIHRvIGJlIGNsZWFyZWQgZm9yIHRoZSBjb250cm9sbGVyIHRvDQo+ID4gPiA+ID4gPiA+ID4g
PiBnZW5lcmF0ZSBhIGRpc2Nvbm5lY3QgZXZlbnQgZHVyaW5nIGNhYmxlIHJlbW92YWwuIFdoZW4g
dGhlIGRpc2Nvbm5lY3QgaXMNCj4gPiA+ID4gPiA+ID4gPiA+IG5vdCBnZW5lcmF0ZWQgdXBvbiBj
YWJsZSByZW1vdmFsLCB0aGUgImNvbm5lY3RlZCIgZmxhZyBvZiBkd2MzIGlzIGxlZnQNCj4gPiA+
ID4gPiA+ID4gPiA+IG1hcmtlZCBhcyAidHJ1ZSIgYW5kIGl0IGJsb2NrcyBzdXNwZW5kIHJvdXRp
bmVzIGFuZCBmb3IgdGhhdCB0byBoYXBwZW4gdXBvbg0KPiA+ID4gPiA+ID4gPiA+ID4gY2FibGUg
cmVtb3ZhbCwgdGhlIGNhYmxlIGRpc2Nvbm5lY3Qgbm90aWZpY2F0aW9uIGNvbWluZyBpbiB2aWEg
c2V0X3JvbGUNCj4gPiA+ID4gPiA+ID4gPiA+IGNhbGwgbmVlZCB0byBiZSBwcm92aWRlZCB0byB0
aGUgUXVhbGNvbW0gZ2x1ZSBsYXllciBhcyB3ZWxsLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gPiBDdXJyZW50bHksIHRoZSB3YXkgRFdDMyBjb3JlIGFuZCBRdWFsY29tbSBs
ZWdhY3kgZ2x1ZSBkcml2ZXIgYXJlIGRlc2lnbmVkLA0KPiA+ID4gPiA+ID4gPiA+ID4gdGhlcmUg
aXMgbm8gbWVjaGFuaXNtIHRocm91Z2ggd2hpY2ggdGhlIERXQzMgY29yZSBjYW4gbm90aWZ5IHRo
ZSBRdWFsY29tbQ0KPiA+ID4gPiA+ID4gPiA+ID4gZ2x1ZSBsYXllciBvZiBhbnkgcm9sZSBjaGFu
Z2VzIHdoaWNoIGl0IHJlY2VpdmVzIHZpYSByb2xlIHN3aXRjaC4gVG8NCj4gPiA+ID4gPiA+ID4g
PiA+IHJlZ2lzdGVyIHRoZXNlIGdsdWUgY2FsbGJhY2tzIGF0IHByb2JlIHRpbWUsIGZvciBlbmFi
bGluZyBjb3JlIHRvIG5vdGlmeQ0KPiA+ID4gPiA+ID4gPiA+ID4gZ2x1ZSBsYXllciwgdGhlIGxl
Z2FjeSBRdWFsY29tbSBkcml2ZXIgaGFzIG5vIHdheSB0byBmaW5kIG91dCB3aGVuIHRoZQ0KPiA+
ID4gPiA+ID4gPiA+ID4gY2hpbGQgZHJpdmVyIHByb2JlIHdhcyBzdWNjZXNzZnVsIHNpbmNlIGl0
IGRvZXMgbm90IGNoZWNrIGZvciB0aGUgc2FtZQ0KPiA+ID4gPiA+ID4gPiA+ID4gZHVyaW5nIG9m
X3BsYXRmb3JtX3BvcHVsYXRlLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
PiBIZW5jZSBpbXBsZW1lbnQgdGhlIGZvbGxvd2luZyBnbHVlIGNhbGxiYWNrcyBmb3IgZmxhdHRl
bmVkIFF1YWxjb21tIGdsdWUNCj4gPiA+ID4gPiA+ID4gPiA+IGRyaXZlcjoNCj4gPiA+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gMS4gc2V0X3JvbGU6IFRvIHBhc3Mgcm9sZSBzd2l0
Y2hpbmcgaW5mb3JtYXRpb24gZnJvbSBkcmQgbGF5ZXIgdG8gZ2x1ZS4NCj4gPiA+ID4gPiA+ID4g
PiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgbmVlZGVkIHRvIGlkZW50aWZ5IE5PTkUvREVWSUNFIG1v
ZGUgc3dpdGNoIGFuZCBtb2RpZnkNCj4gPiA+ID4gPiA+ID4gPiA+IFFTQ1JBVENIIHRvIGdlbmVy
YXRlIGNvbm5lY3QtZG9uZSBldmVudCBvbiBkZXZpY2UgbW9kZSBlbnRyeSBhbmQgZGlzY29ubmVj
dA0KPiA+ID4gPiA+ID4gPiA+ID4gZXZlbnQgb24gY2FibGUgcmVtb3ZhbCBpbiBkZXZpY2UgbW9k
ZS4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gMi4gcnVuX3N0b3A6IFdo
ZW4gYm9vdGluZyB1cCBpbiBkZXZpY2UgbW9kZSwgaWYgYXV0b3VzcGVuZCBpcyBlbmFibGVkIGFu
ZA0KPiA+ID4gPiA+ID4gPiA+ID4gdXNlcnNwYWNlIGRvZXNuJ3Qgd3JpdGUgVURDIG9uIGJvb3Qs
IGNvbnRyb2xsZXIgZW50ZXJzIGF1dG9zdXNwZW5kLiBBZnRlcg0KPiA+ID4gPiA+ID4gPiA+ID4g
dGhpcywgaWYgdGhlIHVzZXJzcGFjZSB3cml0ZXMgdG8gVURDIGluIHRoZSBmdXR1cmUsIHJ1bl9z
dG9wIG5vdGlmaWVyIGlzDQo+ID4gPiA+ID4gPiA+ID4gPiByZXF1aXJlZCB0byBlbmFibGUgVVRN
SV9PVEdfVkJVU19WQUxJRCBvZiBRU0NSQVRDSCBzbyB0aGF0IGNvbm5lY3QgZG9uZQ0KPiA+ID4g
PiA+ID4gPiA+ID4gZXZlbnQgaXMgZ2VuZXJhdGVkIGFmdGVyIHJ1bl9zdG9wKDEpIGlzIGRvbmUg
dG8gZmluaXNoIGVudW1lcmF0aW9uLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9z
cy5xdWFsY29tbS5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDgyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICAxIGZpbGUgY2hhbmdl
ZCwgNzMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29t
LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ID4gPiA+ID4gPiA+ID4gPiBpbmRl
eCBjYTdlMWMwMjc3M2EuLmQ0MGI1MmUyYmEwMSAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC04OSw2
ICs4OSwxMiBAQCBzdHJ1Y3QgZHdjM19xY29tIHsNCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgCWJv
b2wJCQlwbV9zdXNwZW5kZWQ7DQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIAlzdHJ1Y3QgaWNjX3Bh
dGgJCSppY2NfcGF0aF9kZHI7DQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIAlzdHJ1Y3QgaWNjX3Bh
dGgJCSppY2NfcGF0aF9hcHBzOw0KPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+
ID4gKwkvKg0KPiA+ID4gPiA+ID4gPiA+ID4gKwkgKiBDdXJyZW50IHJvbGUgY2hhbmdlcyB2aWEg
dXNiX3JvbGVfc3dpdGNoX3NldF9yb2xlIGNhbGxiYWNrIHByb3RlY3RlZA0KPiA+ID4gPiA+ID4g
PiA+ID4gKwkgKiBpbnRlcm5hbGx5IGJ5IG11dGV4IGxvY2suDQo+ID4gPiA+ID4gPiA+ID4gPiAr
CSAqLw0KPiA+ID4gPiA+ID4gPiA+ID4gKwllbnVtIHVzYl9yb2xlCQljdXJyZW50X3JvbGU7DQo+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gQ2FuIHdlIGp1c3QgdHJhY2sgdGhlIGN1
cnJlbnQgcm9sZSB0aHJvdWdoIGR3YzMgY29yZSBpbnN0ZWFkIG9mIGFuDQo+ID4gPiA+ID4gPiA+
ID4gYWRkaXRpb24gZmllbGQgaW4gdGhlIGdsdWU/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBDb3JlIGNhY2hlcyBvbmx5IG1vZGUuIFdlIG5lZWQgUk9M
RSBOT05FIHRvIGlkZW50aWZ5IGNhYmxlIGNvbm5lY3QuIFNvDQo+ID4gPiA+ID4gPiA+IGFkZGlu
ZyB0aGF0IGluIGdsdWUgdG8ga2VlcCB0cmFjay4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IFRoZSBjb250cm9sbGVyIGlzIGFsd2F5cyBlaXRoZXIgaG9zdCBvciBk
ZXZpY2UsIG5vdCBzb21ld2hlcmUgaW4NCj4gPiA+ID4gPiA+IGJldHdlZW4uIFlvdSdyZSB1c2lu
ZyBST0xFX05PTkUgdG8gaW5kaWNhdGUgY29ubmVjdGlvbiwgd2hpY2ggaXMgYQ0KPiA+ID4gPiA+
ID4gc2VwYXJhdGUgc3RhdGUuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBZ
ZXMsIGJ1dCB0aGVyZSBpcyBubyBmbGFnIHRoYXQgaW5kaWNhdGVzIHRoYXQgaW4gZHdjIHN0cnVj
dHVyZSB0b2RheS4gQWxzbw0KPiA+ID4gPiA+IHNpbmNlIG9ubHkgZHdjMy1xY29tIG5lZWRzIGl0
IGF0IHRoZSBtb21lbnQsIEkgYWRkZWQgdGhhdCByb2xlIGluZm8gaW4gZ2x1ZQ0KPiA+ID4gPiA+
IGxheWVyLg0KPiA+ID4gPiANCj4gPiA+ID4gSG93IGFyZSB5b3UgdXNpbmcgUk9MRSBOT05FPyBE
byB5b3Ugc2VuZCBhIHJvbGUtc3dpdGNoIGNhbGwgdG8gIm5vbmUiIHRvDQo+ID4gPiA+IGluZGlj
YXRlIGRpc2Nvbm5lY3Q/IExldCdzIG5vdCBkbyB0aGF0LiBDdXJyZW50bHkgdGhlIGR3YzMgZHJp
dmVyIHdvdWxkDQo+ID4gPiA+IHN3aXRjaCBiYWNrIHRvIHRoZSBkZWZhdWx0IG1vZGUgaWYgIm5v
bmUiIGlzIHNlbGVjdGVkLCBidXQgdGhpcyBpcyBub3QNCj4gPiA+ID4gd2VsbCBkZWZpbmVkIGFu
ZCBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYy4gSXQgY2FuIGJlIG5vLW9wIGFuZCB3b3VsZCBub3QN
Cj4gPiA+ID4gdmlvbGF0ZSB0aGUgaW50ZXJmYWNlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIHJv
bGUtc3dpdGNoIGludGVyZmFjZSBzaG91bGQgb25seSBiZSB1c2VkIGZvciByb2xlLXN3aXRjaGlu
ZyBhbmQgbm90DQo+ID4gPiA+IGNvbm5lY3Rpb24vZGlzY29ubmVjdGlvbi4NCj4gPiA+ID4gDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJIGZlZWwgdGhpcyBzaG91bGQgYmUgdHJhY2tlZCBzZXBh
cmF0ZWx5IGZvciBjbGFyaXR5LiBUaGUgZHdjMyBhbHNvDQo+ID4gPiA+ID4gPiB0cmFja3MgdGhl
IGNvbm5lY3Rpb24gc3RhdGUsIGNhbiB3ZSB1c2UgdGhhdD8NCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSAiY29ubmVjdGVkIiBmbGFn
IGluIERXQyBzdHJ1Y3R1cmUgPyBJIHNlZSB0aGF0IGl0DQo+ID4gPiA+ID4gaW5kaWNhdGVzIGNv
bm5lY3Rpb24gc3RhdHVzIG9ubHkgaW4gZ2FkZ2V0IG1vZGUuDQo+ID4gPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiBZZXMsIHRoYXQgZmxhZyBpcyBvbmx5IGZvciBnYWRnZXQuDQo+ID4gPiA+IA0K
PiA+ID4gPiBDYW4geW91IHByb3ZpZGUgbW9yZSBpbmZvIG9mIHRoZSBzZXR1cD8gSXMgdGhlcmUg
YSB0eXBlLWMgY29udHJvbGxlciBvcg0KPiA+ID4gPiBwaHkgdGhhdCBjYW4gZGV0ZWN0IGF0dGFj
aC9kZWF0dGFjaD8gT3IgaXQgb25seSBwcm9wYWdhdGVzIHRvIHRoZSB1c2INCj4gPiA+ID4gY29u
dHJvbGxlcj8NCj4gPiA+IA0KPiA+ID4gTXkgcmVzcG9uc2UgZGlkbid0IHNob3cgdXAgb24gbG9y
ZSBzaW5jZSB0aGUgbWFpbCBjbGllbnQgSSB1c2VkIGJlZm9yZSBzZW50DQo+ID4gPiB0aGUgbWVz
c2FnZSBpbiBIVE1MIGZvcm1hdC4gU28gcmVzZW5kaW5nIG15IHJlc3BvbnNlIGFnYWluLg0KPiA+
ID4gDQo+ID4gPiBIaSBUaGluaCwNCj4gPiA+IA0KPiA+ID4gICBZZXMgdGhpcyBpcyBmb3IgY2Fz
ZXMgd2hlcmUgcm9sZSBzd2l0Y2hpbmcgaXMgcHJlc2VudCAoZWl0aGVyIHdpdGggYSBUeXBlLUMN
Cj4gPiA+IGNvbnRyb2xsZXIsIFVTQi1jb25uLWdwaW8sIG9yIGEgZ2xpbmsgYmFzZWQgcm9sZS1z
d2l0Y2gpLg0KPiA+ID4gDQo+ID4gPiAgIEFjdHVhbGx5IHRoZSByZXF1aXJlbWVudCBpcyBhcyBm
b2xsb3dzOg0KPiA+ID4gICAxLiBXaGVuIGluIGRldmljZSBtb2RlLCBpZiB3ZSByZWNlaXZlIGEg
Y2FibGUgZGlzY29ubmVjdCwgd2UgbmVlZCB0byBjbGVhcg0KPiA+ID4gT1RHX1ZCVVNfVkFMSUQg
Yml0IG9mIFFTQ1JBVENIIHJlZ2lzdGVyIGluIGdsdWUgYWRkcmVzcyBzcGFjZS4NCj4gPiA+ICAg
Mi4gV2hlbiBjYWJsZSBpcyBjb25uZWN0ZWQgaW4gZGV2aWNlIG1vZGUsIHdlIG5lZWQgdG8gc2V0
IHRoZQ0KPiA+ID4gT1RHX1ZCVVNfVkFMSUQgYml0IG9mIFFTQ1JBVENIIHJlZ2lzdGVyIGluIGds
dWUgYWRkcmVzcyBzcGFjZS4NCj4gPiA+ICAgMy4gV2hlbiB0aGUgcnVuc3RvcCBpcyBzZXQgYmFj
ayBhZnRlciBhIHN1c3BlbmQgcm90dWluZSwgdGhlbiB3ZSBuZWVkIHRvDQo+ID4gPiBzZXQgIE9U
R19WQlVTX1ZBTElEIGJpdCBvZiBRU0NSQVRDSCByZWdpc3RlciBpbiBnbHVlYWRkcmVzcyBzcGFj
ZS4NCj4gPiA+IA0KPiA+ID4gICBUbyB0YWtlIGNhcmUgb2YgYWxsIHRoZSAzIHNjZW5hcmlvcyBh
Ym92ZSwgdGhlIHNldF9yb2xlIGFuZCBydW5fc3RvcA0KPiA+ID4gbm90aWZpZXJzIGhhdmUgYmVl
biBhZGRlZC4NCj4gPiA+IA0KPiA+ID4gICBUaGUgcm9sZSBpbmZvIHByb3BhZ2F0ZXMgb25seSBm
cm9tIGNvcmUgdG8gZ2x1ZS4gSXQgaXMgbm90IHNlbnQgdG8gdGhlIHBoeS4NCj4gPiA+IA0KPiA+
IA0KPiA+IFdoZW4gZG9lcyBST0xFIE5PTkUgb2NjdXI/IERpZCB5b3UgaGF2ZSB0aGUgdHlwZS1j
IGRyaXZlciBzZXQgdGhlIHJvbGUNCj4gPiBzd2l0Y2ggdG8gIm5vbmUiIGluZGljYXRlIGRpc2Nv
bm5lY3Q/DQo+ID4gDQo+ID4gVGhlIHZidXMtdmFsaWQgaXMgb25seSBmb3IgZ2FkZ2V0LCBhbmQg
eW91IG9ubHkgY2FyZSBhYm91dCB0aGUNCj4gPiBPVEdfVkJVU19WQUxJRCByaWdodD8gQ2FuIHdl
IGp1c3QgdXNlIHRoZSBkd2MzLT5jb25uZWN0ZWQgZmxhZz8gSnVzdA0KPiA+IG1ha2Ugc3VyZSB0
aGF0IGl0J3MgY2xlYXJlZCBvbiByb2xlLXN3aXRjaCwgd2hpY2ggc2hvdWxkIGJlIHRoZSBjYXNl
DQo+ID4gYmVjYXVzZSB3ZSBhbHdheXMgcGVyZm9ybSBzb2Z0LWRpc2Nvbm5lY3Qgb24gZ2FkZ2V0
IHVuYmluZCwgYW5kIG1ha2UNCj4gPiBzdXJlIHRvIHNldCB2YnVzLXZhbGlkIG9uIHB1bGx1cCBv
ciBnYWRnZXQgYmluZGluZy4gSXMgdGhlcmUgc29tZQ0KPiA+IHNjZW5hcmlvcyB0aGF0IGR3Yy0+
Y29ubmVjdGVkIGRvZXMgbm90IGNvdmVyPw0KPiA+IA0KPiANCj4gSGkgVGhpbmgsDQo+IA0KPiAg
SW4gY2FzZSBvZiBqdXN0IGEgY2FibGUgZGlzY29ubmVjdCBpbiBkZXZpY2UgbW9kZSAoYW5kIGRl
ZmF1bHQgZHIgbW9kZSBpcw0KPiBwZXJpcGhlcmFsIG9ubHkpLCB0aGVyZSB3b3VsZCBiZSBubyBy
b2xlIHN3aXRjaC4gSW4gdGhhdCBzY2VuYXJpbywgY29ubmVjdGVkDQo+IGZsYWcgd291bGQgc3Rh
eSAidHJ1ZSIgZXZlbiBhZnRlciByZW1vdmluZyBjYWJsZS4gSW4gdGhhdCBjYXNlLCB3ZSBjYW4N
Cj4gZ2VuZXJhdGUgZGlzY29ubmVjdCBpbnRlcnJ1cHQgb25seSBieSBjbGVhcmluZyB0aGlzIFZC
VVNfVkFMSUQgYml0IGFuZA0KPiBpbnR1cm4gdGhlIHN1c3BlbmQgd2lsbCBzdWNjZWVkLiBTbyB3
YW50ZWQgdG8gdXNlIG5vdGlmaWNhdGlvbiBmcm9tIHNldF9yb2xlDQo+IHdoaWNoIHdvdWxkIGNv
dmVyIGFsbCBjYXNlczoNCj4gMS4gY2FibGUgZGlzY29ubmVjdC9jYWJsZSBjb25uZWN0DQo+IDIu
IFJvbGUgc3dpdGNoIGZyb20gaG9zdC0+ZGV2aWNlIGFuZCBkZXZpY2UtPmhvc3QNCj4gDQoNCk9r
LiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gSG93IGV2ZXJ5dGhpbmcgdGllZCB0b2dldGhl
ciBzZWVtcw0KYXdrd2FyZDogVGhlIGNvbm5lY3RvciBkb2VzIGEgcm9sZS1zd2l0Y2ggdG8gIm5v
bmUiIHRvIHRyaWdnZXIgYQ0Kcm9sZS1zd2l0Y2ggaW4gZHdjMywgd2hpY2ggdGhlbiB0cmlnZ2Vy
cyBhIGNhbGxiYWNrIHRvIGR3YzMtcWNvbSB0bw0KY2xlYXIgdmJ1c192YWxpZCwgd2hpY2ggdGhl
biBhbGxvd3MgdGhlIGNvbnRyb2xsZXIgdG8gc2VlIGEgZGlzY29ubmVjdA0KZXZlbnQgaW4gZHdj
My4gSXMgdGhhdCByaWdodD8NCg0KVGhlIGNvbm5lY3RvciBkcml2ZXIgc2hvdWxkIGhhdmUgYSBz
ZXBhcmF0ZSBpbnRlcmZhY2UgZm9yDQphdHRhY2gvZGVhdHRhY2ggaW4gYWRkaXRpb24gdG8gcm9s
ZS1zd2l0Y2guIEJ1dCBJIGRvbid0IHRoaW5rIHR5cGUtYw0KY29udHJvbGxlciwgVVNCLWNvbm4t
Z3BpbywgYW5kIGdsaW5rIHNoYXJlIHRoZSBzYW1lIHdheSB0byBoYW5kbGUNCmNvbm5lY3Rpb24v
ZGlzY29ubmVjdGlvbi4NCg0KTGV0J3Mga2VlcCB3aGF0IHlvdSBwcm9wb3NlZCwgYW5kIGtlZXAg
aW4gbWluZCB0aGF0IFJPTEUgTk9ORSBpcyBmb3INCnNlbGVjdGluZyB0aGUgZGVmYXVsdCBtb2Rl
IGFuZCBub3QgbmVjZXNzYXJpbHkgbWVhbiBkaXNjb25uZWN0aW9uLg0KDQpCUiwNClRoaW5o

