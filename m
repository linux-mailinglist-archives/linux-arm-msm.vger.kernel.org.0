Return-Path: <linux-arm-msm+bounces-50087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47492A4CFA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 01:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3A593A82D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E051B2905;
	Tue,  4 Mar 2025 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PmlPMqx9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cG9qxk0Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TljvPptx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB688EC4;
	Tue,  4 Mar 2025 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046756; cv=fail; b=hqhKSAmWFwZgfKQGH3Jun0bSYr6iEzHMefIXLnMRBM6Dt23fWmz04QvJo17HIyqPD7j7ymIuadpYhwmaZf3wV5PWtkVh9C5QqbfuJxGKzKjIR9nhFpALK6KLEiZEtsTCX5XYHEDRl/18eH9QC5on5rrQ1XHkpGR/oP66lVIn6ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046756; c=relaxed/simple;
	bh=U09DWeUQIB3BqJGlQEL3NXf26+QQa/CZk6+gkXspil4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdOmyZn1G60G/ODbFBQW+XbeLc+j1pJpx6yPSMWc85gPL6NPF0LQco12sY9CmuenlMGZa5M6Xsq3+pqE99QEBu3pegnRrVAkt070QBbfutXqFN05Br5XVQYBtkVXcKLqUgQLJ+sMVRTnDbN281Lv1AzVKt/5w5g3QSML9ooIMUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PmlPMqx9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cG9qxk0Y; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TljvPptx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523K6ogo011318;
	Mon, 3 Mar 2025 16:05:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=U09DWeUQIB3BqJGlQEL3NXf26+QQa/CZk6+gkXspil4=; b=
	PmlPMqx9dWxCMYb7C01IGAFpSWVMGjUVySt5P9467qXWF7UezdR9YhXgMdRsrezd
	SgEkh3rUT0T7hRMnvfc0/NQliSxyEMIcKJsfu7OkIDnO+0ISuX8UhY+JN72lqvMD
	dMpaTw3srVCKLVVqYw8D3TPb3sKedxag9aagyWmk2KyAZUVywpS4E34bnRSL3egI
	TGi6v8pmvAo0EPSoAM6I3iaIwsyCnlbOS99fvl9vO+nTqz5CrVM1YkBFzdq9jjFM
	g8GWuRDQ1LGySooZTr4UFUuZu6LOBsqGNNEQxVZTCjQv5111DDytOz8UzE5DIJzs
	BD1W8QUEdWaAfQuHueVxwQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4541rk3hvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 16:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741046731; bh=U09DWeUQIB3BqJGlQEL3NXf26+QQa/CZk6+gkXspil4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cG9qxk0YCYkE/7JHWNOupR4rA+D05CjkTgYCcySTy9BJ/9K2oafDRvM7QngauMksA
	 GGAkigYsY3o5kmDMezc0l6lqXmMyFW5NEx3EWznwK4YcpzurrBkRcnSPHKq1N5FA9S
	 LJj/j3Zx9gU1v4Zaz78g86EDDLenwTURUeABg3FPSDLVs0UrDpjOFZ3VJ5xqnOgDDF
	 MBBrLNxno6JYo/cnD+5da1U+ffv3aFJgGudcIlYOREZkD7+2oDSVGVgiL0rpLe8nmZ
	 kZt9ML7B+VdMXNUocxjypSjc40c6LmYuNDMxDdE+/yUa0x+jJ1km89x7xqAzPqOM57
	 jJE+xPmB6Vp3Q==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 74BA44071A;
	Tue,  4 Mar 2025 00:05:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 98327A00B9;
	Tue,  4 Mar 2025 00:05:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TljvPptx;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 983A840110;
	Tue,  4 Mar 2025 00:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4JLDf7EhvrJObyeMVCd98UjeGBuHVDwKdgRV4VpZQQzusSO9qaG9M6qZp0x7CZnEWr1nWBo/I7YXMbPKKPrMnrcmzAq2LnSKPOse7Ui0P1ojwlbfv1/thnHB5tF/8M0SJnPse4/sD4hMo8k7/UPAlkWdzh6co5g4pSNcLa8JjeXv3q/9wFF360xfZZt83BvUU1iPXDI0cTCZ5OqOfYsybSwuSVTkZ7K5YtyBVrV/83RFx+jBb7BdebHvN2LYMMwj6wcjx1xnAQSHufPP0ss8Bx60uIKOCY0ZOm8SNIGIdGTy9o9kezD6+5+XcH1uKg422e0Zhi3bDnVstFq7A1AZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U09DWeUQIB3BqJGlQEL3NXf26+QQa/CZk6+gkXspil4=;
 b=vtwgaNuTBYVYlNrLlYjQ30rzdeL8m4Zq2n/KS2FqVCvhLkjPrEu8z+Bnmeia9PnQk56uS9/XGoDz0zqATQb8YmVc1BlkHN9DRn3ONfDkw3zz6tLrUwFI5ocUftLZxnJFG6okSA1TsdpieKpywIaoeLqWxri2CRqlapdIFyP6/EMpZpybrkZAEAozhNWo8EA/VdrWotSvGkcYVpxE31EJVuHDYHITE3QF4a4KrMsAYwmfKPSQIdhU5LbZvGaHSPoi6oMBOFfAZDPdNhbIMHW36zTVztwUKswK3PqJdvFMKqW9navxZUgP2ZAXVZPjLtU1xvvqJjwR0YMp0bROSv1uPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U09DWeUQIB3BqJGlQEL3NXf26+QQa/CZk6+gkXspil4=;
 b=TljvPptxlMJwbyUmk6L0Nw8ynJH/HzS7/jM5iQ3c8bMCZlpOroODG8+eFbfxl1NrnkvHJt7Mq1s0+OskzDek1/nm1QRst+sXnjqt19eTxhy7Ydze9QTAxoxq9m5eWGDm86cdpfeFhjpxVSu0b1ammOEkc/rzPsoLUyH9PgQHN40=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 00:05:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 00:05:24 +0000
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
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Topic: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Index: AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyA
Date: Tue, 4 Mar 2025 00:05:24 +0000
Message-ID: <20250304000527.ybxfdjx5xzypcals@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4367:EE_
x-ms-office365-filtering-correlation-id: 2eadd261-a0e0-42d0-1d60-08dd5ab0435f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R215Z2FZTUU5R3paSTFOV09GYnNWYktONGZhQ2RxZWJGRXExOXlwcWd0ZWpz?=
 =?utf-8?B?UXBQa2J6YWYrTWdMQlZqTFdZQ1NrZi9IYTlwaWJQRWZHSGtYZG5pdHZpSlo1?=
 =?utf-8?B?OUROL0xuRmt5enh0elZZOElUdjBkcEtBamw5ZlMvcWtCS3hsWVV6cEw0ZnNn?=
 =?utf-8?B?bHlwNkF2ajdFbUJOakdYRmNMc3dCT0R5T1RlVGRiUDJYSWdrOStZZ1FOYmJk?=
 =?utf-8?B?SUtLb3U5S0Zld0liOE1nKzRjQ2xmTGNHVTZjeGtJeHlsdFQxbVMzazIrOWo5?=
 =?utf-8?B?aVJNZTFPckxYTy9Ubk40ZnVMVmxnZlAwczgrdlc5d3NBRHZNdGlIU0kyVHRE?=
 =?utf-8?B?Wk1UOERQcUVzZXBIVzBkMFhTL3oydkxxL2s4c0VvSDdZWk11TUNrZUNSSHFX?=
 =?utf-8?B?SzNvWlFKMXNRTU95d0J0Qko1KzlsdHVuS0luNUl1SFFIKzVhK1d5elkrMWJ3?=
 =?utf-8?B?clhkNHZ2dmc1TG5FcUZmRGpxUkVHOVcwa2ZHTVBCVzU4T0lKQUkyc3E2Y1Ar?=
 =?utf-8?B?U1g4S1UvWWdwMGxPV0RvWVM4MGMvTVpFOVY4Q3R5UVV0ZWl6TThFZTAyV0k2?=
 =?utf-8?B?RmNxejFDaDNPZWRZTmNqWS9CcnRJVlRpSTFSYm5SSGd0Q01wVzU4NXd5TXVK?=
 =?utf-8?B?VkZSN1VvdURibXROOTJlbm51U1hianpKN1MxLzFaK3RqTEtBZnFOV3ZTTFIz?=
 =?utf-8?B?VXhwNDB5RjBRUm5HUGNVM0VFcnVXQkpHZ1RHMFYyVENsU3BLOHowTWtMa0th?=
 =?utf-8?B?YU5QcFFGeG9qcVYxY2VOVEJIaVF1eE5HVlZuY3ozakZsUTY3Z2xHZDJhNFpp?=
 =?utf-8?B?NGVjRlFkMFlUMlk2R2gwbFF4eEsrWGlPM2tKVmVaK25iajk0UGFDdXNDM0Fl?=
 =?utf-8?B?d2VweVozdlBMa0VSWGswdE94d0JKTTVDcXNhME8veUozTlRjRzFITjFMWUlQ?=
 =?utf-8?B?LzI0aEREYU40eC82ZWRxTFlFMENTUjdwOTNyYnpVNE11MzRCMEVseEo4SWN0?=
 =?utf-8?B?Znk4Y1M3cnJWNDJLSjdCMHdHR0dVVWtqYmNmMFZBNDRRSmRFT21jYXZLWHdE?=
 =?utf-8?B?d3UxdGFhVzBmSGpKMzhLWDNHb1FGWHNXYkFzTDhyWGV3d0Z3VVo5REFEV0U3?=
 =?utf-8?B?WlpTSzFXWk94dDk3NjlKZm9CV042QVBORFVNblI5TXJVbkNYV0xNSXg5dzRy?=
 =?utf-8?B?dHdMS2tEU2ticVdDRUNyOHlRRmgzY3hzL1dlR1FzUVVnLzNFOTlZQUI2cDJJ?=
 =?utf-8?B?aUFZS3ZJajRHRWRWL20zKzMxL1hRU3FhWWtrYnk5M0lqRkc4RjBPeDN2QkRS?=
 =?utf-8?B?UThNTm5YU0huQWJsYXBoQktWNkZBMkV4L1lDSFFsdzZiS2U4bW1lM3dMWVhl?=
 =?utf-8?B?czAyREh1R0ViL2srOHQ2akwxNjRPaUttWFdBVlg3NEFHRWN1UmhGZzBwVmV4?=
 =?utf-8?B?eTF0Z3RRamVjZGZ3M2tuc2p6VEhPUEp1R3E4bEQ1anlQd2VjMm9icWRGRGl4?=
 =?utf-8?B?bTBPNXBYRmxoRWtSbWNybkZaa3NicDV3bUk4WFQ2SFl0NzNvYzBnaTc5WkJ0?=
 =?utf-8?B?cmFxOVl6aTR5czIrMS81SmsyQWtKM3RZZUhvVmxYMDB5WGFmWHB5dUI2cytH?=
 =?utf-8?B?NTRTOXV0dmYzV3ljYXM3Vml0bFdmdGQ1THNxallDelltdlRUSlZKejVVMEJU?=
 =?utf-8?B?VEpZVVJ2SlordUwxUWVxUUhLZnd5YzBXalBhajE1R0tYNnNMOUtXTVFqNTMr?=
 =?utf-8?B?WFhSVWgxK3ByTjNzK09wdVp3MDJaZG5xN0xLS2hlM2FKRVlCY0ViS292dmp0?=
 =?utf-8?B?Wng2dXR6RDlNejFZNGY5SSsxU1JETXdpM25IRmFGelVtY2U0c3ZwODJsVGU4?=
 =?utf-8?B?ZHdFN0NqanpZcjFDSDlNd09ZVzVKenJLME5zWCt1RXJPZHlreEJxbFFuaEpB?=
 =?utf-8?Q?AvAA+o7G5oCXDSRitZGVfdJ+7J3nbL6e?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OENtOUd6ZUs4akpQdjVBUmFnZjZQR01ROGNkWHA4cGlyb0JjUWN3Wm5zaEw5?=
 =?utf-8?B?MmxjY2RXNkpheXhoaHFINTV4ZGg3NlFUb3dKeEpob3dUaHkxOE4wVVR6WFk1?=
 =?utf-8?B?a0UzMjhrNktZZTN2WnpYRWJzamFiaysxOVNmUm1mdmhMaCtsbDlkR01wNmNS?=
 =?utf-8?B?bkVUWmVydHJUMThON1dOMHAzaFIrczBqUjV5VmVodzBBTS93ekRSK2kyYWlC?=
 =?utf-8?B?cU41NTJheStzdDNHd2R4Q2FuQS9razIySkNudmptK1M0MjlBSGlmWStPajEx?=
 =?utf-8?B?NFBnWkZTV0pFVG5pYXRXTFplVDQzZmpiOVVRdnFHNGdZTVo2cWo4L2F6aWs1?=
 =?utf-8?B?cys1STNoTTN2VWRLM3NNZVNUWGFERm42bmpBMENDS2dGaFlqays0MHRTYWwx?=
 =?utf-8?B?V1pHREtCcDBTNTQ4UUpyYzgySGxxMWJVMEZNQ0FKUnlpa0RVRGJTQ3Q1dzlL?=
 =?utf-8?B?Uy9hN0hlSzVkR0k0bitJVUQyblhGcEk2ckhBL244ZEVmbmdtWXRUSzYxcGFy?=
 =?utf-8?B?MXhqdW9icGtRUG5hTktRNm44NU5xMjR0RndCY0MvSTZzZ1VoOWJLczQ3eW4w?=
 =?utf-8?B?ZkZ1bElTNldjaWZxVUxNOGs3dkYvSUZxeUFaZTUrYnBCQ21mUmJGdWJzeEVJ?=
 =?utf-8?B?aXFUZjRXaXpNZ3ZrcmtlK2J0alY0ajVvRG1LekFmKzMrTi9BWE0xNFdqdDdY?=
 =?utf-8?B?RkdtcS9WVTdCYkh5R2N6Wm9QdVlZZkZPTDZ4SlZzZmdwQXg4ck95VTQ4a3BW?=
 =?utf-8?B?K1BxT0xkQ3lhMzVCTy9CZHNHNGdmRzFYMm1CelVIR05HRVNxZTFzb0YzL3B0?=
 =?utf-8?B?TkNtdXlocHhMMmY1U29rQ09JY3ZVbHhDSlBMbzdVYzBKTnUwREM2TGhYZWp3?=
 =?utf-8?B?WEpYaG5JcEkxN3MrSFFKWHNzKzh2bVdjSXpnNWRibGpNWEFBRkR4azRJRlQ1?=
 =?utf-8?B?cGFUQmhrMGZ1QjBYb21Pb21jQ2orNEJoeHRZbFJKS2ZiY1F2S1ppRXZHTGMw?=
 =?utf-8?B?dnp3dGlpSVhZLzlybFFMb0hxTkFhN2sxaHBuZkk0dmQvY1hBaEVVYjUrS05y?=
 =?utf-8?B?bVdyWnFDSytzNk9NNkJIckdSRG1nb090TENXMWRXZkdMWlpRZkJzcHNJMnYr?=
 =?utf-8?B?YmY5MFpPM2VhTDFqTzdLRUZONmx5NGRTaEJSZ2dhMlhNRDRGS25wNjN3VS9P?=
 =?utf-8?B?V1FYbGhIczZ6WTdJY0dzek9GOWV1S210VmYwME5peVZpTU9lOW9uU1g1cUxC?=
 =?utf-8?B?ZkVEbFRVaDlTNkNRYkVQRGJlRnBjZUdCRFp2b21URk84eVNCc21yQjZBSmJr?=
 =?utf-8?B?VEtyQS9vRktudXBPMFh3Vi9aUnJMcTM2YVc2V0ZySng4ckdRUmc3UDZlM3FV?=
 =?utf-8?B?UEw3aytFbjgrTm9yYjNwVUZPek5SbVF4NSt5elhPNkNFVXlIdk5wK1k4bC9s?=
 =?utf-8?B?ek1VYUxGbDRZNHlWVnEwR3VXWjJzdTFjaW9hbW9DTmtpczRWWThqTTBJcGlz?=
 =?utf-8?B?cmtpR0FZTUpzdGhCOE5xWmlKRWR5UGU4dStlMy9kMExXc0FzQ2ZFeTlqZGNB?=
 =?utf-8?B?UEZVbHNscWUyYWNRMWdBZUI2Rllid3RMN0RqSUR1VVBJSXZINmVKNzkvMk5j?=
 =?utf-8?B?emRBN1Y1QmNRWmw2MUd6SUhuZ0dCRVUwSUJlVWVSemZlOVY1M3JpaGxEU1hZ?=
 =?utf-8?B?OVU0blpVVkhPeEM1eHF6eHhzNWIvcm02RzVPQ3BHSEdYdzhFcWVZekdnMmhN?=
 =?utf-8?B?a01PWXZzRFlOZlVnMjAwSUVJV0g0ZENpVzY4WXUvNE5lclpHWnpyTU1xN1dJ?=
 =?utf-8?B?N2JtSEZydFJTWVcrWjJ3VTdWbkp1MGR6L0hMZnBieWF0dGR2eDFFdUs1Unlo?=
 =?utf-8?B?LzhGRE41S04xeUxvdEZ4N3VrT3k2aTZZUndlTVQxbHRoZEF6dGdNVE4xdm9m?=
 =?utf-8?B?SVVNRXliOWg0UnovQWdzUGk1Qzd0SGtMYndXaTE3eXAwMkVaais2M1hEWUxp?=
 =?utf-8?B?dzlNbUwwMEhCYU9hZ2ZoNXZzc2J2UHhPYVlYNzNHMUlGUjdubFRFUGc5RHJh?=
 =?utf-8?B?eDZ5WFlxc0EvZGJid2lxZFA0U1QzV3NQdUtZM2xySW50T1ZFR1VBVXJ6Rm9r?=
 =?utf-8?Q?0KERMVXXmORNd7fA+RE/KKUvl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56D1A51613CBCB4784F92325120676B6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zzXa3ribHKShi63cy5aymRILpXmeExya4oYjSjfhgK7s+3x4LZFpyOmjXR9g26S0snSz+YHUYQnadkfGVzVixGa7K0tf6cmHSI0mXYFMgRqUfCe0zrz/7U0XnTNy62juB7pFpawHXLX8jHYpikOoNacm6iZRnF+uX3niiqP38GzYpjolrsXMXyuM07/2zR9EZMm1u1ZjQipj1hxCrdeFORpFCccfuVKPwGtOzfS58hHEtd0jqMIbEyj8bL2jZSzOK9d+Q/fa+IVTlCrX9KXw7c5wXyWalCt2fSpRF8PuXo6pCsIx4YsiatFm+3Q9Zdg6d/5gaOUvTDlPO4gwv1RzD1D9L1kp4xJ/OFqHwgwf8vwNg5sEjYLCULRJ8OH+lG+xwpL/HWnlmdyJAHu+4sqhmB61Hk4WHu7j7iEq6rpkVo2WHD9M7LLKAkmBKf0Xl04x+1Dn6elZIePB33yEVD46aEqb53egge0WVNAxHhWX/In9JW5Xb+U/IqSjYc5JmSSHmJmkUfm5V8tP7sQytsETdCElKQvMUAgpwhkUEYbyyPYNu2eH4BsfVqvgVJn1awUaBoCjlBlIsbfSTCilN2Uq9hLaWTVkF913KV+gE5sVhN0fMLzodE/Ln0GaEnbANnwPmWNRGT7Ozom4n+5AKWfWWA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eadd261-a0e0-42d0-1d60-08dd5ab0435f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 00:05:24.7475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtBxxM9tKlsQ/g6mwzR4yBS1n9YLXKW2fxRkxpGWnHojq6NsFdHxU/gBqjmg4CZwdgxtuqsvJaCe1Geu6XRsAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
X-Proofpoint-ORIG-GUID: z4XkZkB5sB7YPHPukaoGW098kDojokOw
X-Proofpoint-GUID: z4XkZkB5sB7YPHPukaoGW098kDojokOw
X-Authority-Analysis: v=2.4 cv=FIrhx/os c=1 sm=1 tr=0 ts=67c643cd cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=N17t731RMO_0zPnaBiwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=993 malwarescore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030187

T24gV2VkLCBGZWIgMjYsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gSW4gb3JkZXIg
dG8gbW9yZSB0aWdodGx5IGludGVncmF0ZSB0aGUgUXVhbGNvbW0gZ2x1ZSBkcml2ZXIgd2l0aCB0
aGUNCj4gZHdjMyBjb3JlIHRoZSBkcml2ZXIgaXMgcmVkZXNpZ25lZCB0byBhdm9pZCBzcGxpdHRp
bmcgdGhlIGltcGxlbWVudGF0aW9uDQo+IHVzaW5nIHRoZSBkcml2ZXIgbW9kZWwuIEJ1dCBkdWUg
dG8gdGhlIHN0cm9uZyBjb3VwbGluZyB0byB0aGUgRGV2aWNldHJlZQ0KPiBiaW5kaW5nIG5lZWRz
IHRvIGJlIHVwZGF0ZWQgYXMgd2VsbC4NCj4gDQo+IFZhcmlvdXMgd2F5cyB0byBwcm92aWRlIGJh
Y2t3YXJkcyBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgRGV2aWNldHJlZQ0KPiBibG9icyBo
YXMgYmVlbiBleHBsb3JlZCwgYnV0IG1pZ3JhdGluZyB0aGUgRGV2aWNldHJlZSBpbmZvcm1hdGlv
bg0KPiBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgYmluZGluZyBpcyBub24tdHJpdmlhbC4N
Cj4gDQo+IEZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiBib2FyZHMgb3V0IHRoZXJlLCB0aGUga2Vy
bmVsIGFuZCBEZXZpY2V0cmVlIGFyZQ0KPiBnZW5lcmF0ZWQgYW5kIGhhbmRsZWQgdG9nZXRoZXIs
IHdoaWNoIGluIHByYWN0aWNlIG1lYW5zIHRoYXQgYmFja3dhcmRzDQo+IGNvbXBhdGliaWxpdHkg
bmVlZHMgdG8gYmUgbWFuYWdlZCBhY3Jvc3MgYWJvdXQgMSBrZXJuZWwgcmVsZWFzZS4NCj4gDQo+
IEZvciBzb21lIHRob3VnaCwgc3VjaCBhcyB0aGUgdmFyaW91cyBTbmFwZHJhZ29uIGxhcHRvcHMs
IHRoZSBEZXZpY2V0cmVlDQo+IGJsb2JzIGxpdmUgYSBsaWZlIHNlcGFyYXRlIG9mIHRoZSBrZXJu
ZWwuIEluIGVhY2ggb25lIG9mIHRoZXNlLCB3aXRoIHRoZQ0KPiBjb250aW51ZWQgZXh0ZW5zaW9u
IG9mIG5ldyBmZWF0dXJlcywgaXQncyByZWNvbW1lbmRlZCB0aGF0IHVzZXJzIHdvdWxkDQo+IHVw
Z3JhZGUgdGhlaXIgRGV2aWNldHJlZSBzb21ld2hhdCBmcmVxdWVudGx5Lg0KPiANCj4gV2l0aCB0
aGlzIGluIG1pbmQsIHNpbXBseSBjYXJyeWluZyBhIHNuYXBzaG90L2NvcHkgb2YgdGhlIGN1cnJl
bnQgZHJpdmVyDQo+IGlzIHNpbXBsZXIgdGhhbiBjcmVhdGluZyBhbmQgbWFpbnRhaW5pbmcgdGhl
IG1pZ3JhdGlvbiBjb2RlLg0KPiANCj4gVGhlIGRyaXZlciBpcyBrZXB0IHVuZGVyIHRoZSBzYW1l
IEtjb25maWcgb3B0aW9uLCB0byBlbnN1cmUgdGhhdCBMaW51eA0KPiBkaXN0cmlidXRpb25zIGRv
ZXNuJ3QgZHJvcCBVU0Igc3VwcG9ydCBvbiB0aGVzZSBwbGF0Zm9ybXMuDQo+IA0KPiBUaGUgZHJp
dmVyLCB3aGljaCBpcyBnb2luZyB0byBiZSByZWZhY3RvcmVkIHRvIGhhbmRsZSB0aGUgbmV3bHkN
Cj4gaW50cm9kdWNlZCBxY29tLHNucHMtZHdjMyBjb21wYXRpYmxlLCBpcyB1cGRhdGVkIHRvIHRl
bXBvcmFyaWx5IG5vdA0KPiBtYXRjaCBhZ2FpbnN0IGFueSBjb21wYXRpYmxlLg0KPiANCj4gVGhp
cyBkcml2ZXIgc2hvdWxkIGJlIHJlbW92ZWQgYWZ0ZXIgMiBMVFMgcmVsZWFzZXMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBvc3MucXVhbGNv
bW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgIHwg
ICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLWxlZ2FjeS5jIHwgOTM0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXFjb20uYyAgICAgICAgfCAgIDEgLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5MzUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCg0KVGhpcyBpcyBhIGJpdCBjb25jZXJuaW5nIGlmIHRo
ZXJlJ3Mgbm8gbWF0Y2hpbmcgY29tcGF0aWJsZSBzdHJpbmcuIGllLg0Kd2UgZG9uJ3QgaGF2ZSB1
c2VyIGZvciB0aGUgbmV3IGRyaXZlciB3aXRob3V0IGRvd25zdHJlYW0gZGVwZW5kZW5jaWVzDQoo
b3Igc29tZSB3b3JrYXJvdW5kIGluIHRoZSBkcml2ZXIgYmluZGluZykuDQoNCldoaWxlIEkgdW5k
ZXJzdGFuZCB0aGUgaW50ZW50aW9uLCBJJ20gYWZyYWlkIHdlIG1heSBoYXZlIHRvIHN1cHBvcnQg
YW5kDQptYWludGFpbiB0aGlzIG11Y2ggbG9uZ2VyIHRoYW4gdGhlIHByb3Bvc2VkIDIgTFRTIHJl
bGVhc2VzIChhcyBzZWVuIHdpdGgNCmFueXRoaW5nIHRhZ2dlZCB3aXRoICJsZWdhY3kiIGluIHRo
ZSB1cHN0cmVhbSBrZXJuZWwpLiBJZiBwb3NzaWJsZSwgSSdkDQpwcmVmZXIgdGhlIGNvbXBsaWNh
dGlvbnMgb2YgbWFpbnRlbmFuY2Ugb2YgdGhlIG1pZ3JhdGlvbiBjb2RlIGJlIGhhbmRsZWQNCmRv
d25zdHJlYW0uDQoNClRoYW5rcywNClRoaW5o

