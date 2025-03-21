Return-Path: <linux-arm-msm+bounces-52240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CFA6C55C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 22:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCC75465921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 21:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E03D1F12F3;
	Fri, 21 Mar 2025 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qkKVoFs2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gxJ6SQQf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Pm7SFZMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289328E7;
	Fri, 21 Mar 2025 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593569; cv=fail; b=AXY07DzJ1g2rKRV0pgL/sRwWcrHBu305TWIewET2RczgLHxsrkKsSFi5AyAHbJ7DnHNk86IX6UZOPsC9pbBjlSY/PDJ3rBaIeVf8kyMM8WfX1qpUSMnYQvkTnhv3kzzX/84elarp7TIsHJ2LB/AfvCK6ppGX1U+mGlkE2AkMMIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593569; c=relaxed/simple;
	bh=6lKtQPFchk/X57lzTzjJofLGsiqzzonp94StXBR4HOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rtqxi4yzTuHo6NJwM0DMSuuEURW1caAnaZZx5/F9VQ3dnc6GbXS1nAHFzh6ZcFXqLCTrHSw293ws5temdt8ipKkpkqJSY3nl3EUZghX4ButJQwvvHoHNuvtW/NxKsVL2a01ovH9GoFCt34hiy2boLGl6TifoCWqgWM378ONXHls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qkKVoFs2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gxJ6SQQf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Pm7SFZMF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LJeajY022571;
	Fri, 21 Mar 2025 14:45:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6lKtQPFchk/X57lzTzjJofLGsiqzzonp94StXBR4HOE=; b=
	qkKVoFs2BvyNkdnxJhPKaCKZIdVusUxMZf7HcaMQfNBi674iSqybSvSGqTZBY3yl
	fHalaJi1TNbShtqQYNGPn0142LADV6S8ZW4Gg2+zXE3UNyOY61IuQZlC/ZG80aQ8
	foJDhh8TsFbaz6pIF3L3I44R6D7SL3Ari5OfsTEPPV3/h/2390CNDkvsm+LkEOBn
	L/w+pYUnBxC23zmn0B374zGesk5FTpEYgvnaPPacstjhmv29iZQNiw/3np8XB7h2
	Yqu7dM5yRPDdPlIKOnhl1iZlqBfzOBUETVHZQIjqKd18h/SJHtWL/rMeZzu42XNR
	Vof1cF5ompC+JQMu3xobtg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45d8jpvxq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1742593552; bh=6lKtQPFchk/X57lzTzjJofLGsiqzzonp94StXBR4HOE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gxJ6SQQfqx/zKcnatEnwFD/25RZtl4wgNDVa5hzVAd0sPESII5Pf+7FEbEwyC3rOv
	 M1RN9Cpk/GXejbzwN57/s6OEZX2qna6vzTTKAxMsQ7uUF2C4xPHeQ/OSWhUarGIDhK
	 IAb40ji1MUUBh6V2Ko/xJ8EmB0O/mjUyib6fJjK3aCfxicNkQ/eGEUbWhl4lrTvoaF
	 +ANGINN87K5sDh9nE3+cGL6UKfY3NUG/fzpuVgsWtIHWw9s2f56LG7Sd8LD3Bkt0om
	 SC0e7nR3ME5IZ28ItXnapbXkGkaCE1LBX8ZOmrzfv8VYOTAoNNr5hu2J3vrxqpu3X3
	 ePfO1W4Fdb4jA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7C6C401B7;
	Fri, 21 Mar 2025 21:45:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B7851A006F;
	Fri, 21 Mar 2025 21:45:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Pm7SFZMF;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 807C2401CA;
	Fri, 21 Mar 2025 21:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fADXo+P8hK5DfyhjH9IgTPiNyogwXHFZwVCUr+7LYrRn3qOk/+6mT8RhvMgkbm4bBPkUGRT31ancUSsXHA8m/5WOIF9GvSNcwv7244tAPcv7eKvGEz+o+tKy0YncNgbw7m6Wgn271JE4Kye80Y/4ua9Hxaoav6RgKd4ai45R1nzgmtMOIB1F68qDs2pggwJEzaVquUfPXzr1xKxL6u3nMLl6TS8v+ASOz40afutMs29xXEjZdVIWgZC4Yyz28+M66V3IByz94/+unmx71SYi6vD0/xVI1YbyBBinSoc9F+yfoP8SKtb2HjOjCAs1YAek0K/lMUBLja0n5vq+SYPJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lKtQPFchk/X57lzTzjJofLGsiqzzonp94StXBR4HOE=;
 b=lAutlqrYizUEeqOcSIwCSE4ieCdkagMW7WQbBKHo3ECaWE5LSzogbE2hD0C2v1T73Bx2JmQTGwXnTDSHjqs/7ViVRyEYF8IiBMgaytrPnJsORh5e3h8PECbowgyeXKpLi8W/AKqe7P2rY1iJ9lFNO8JcEBjMpG+V4X2p8UZyC0lcJ8bhvNhY2jBic4EppSkaNP4RoRnj6VFAGI1Jm2zDEux8SJLSnuBdxLajm9EuzgVgdIZjfFf+sj9rwAJKMNKlsyPblTHGvWsqwkNt+npUUMfdC1ZQzZECGe1R+ZpwaYJ4DLb7pBoiKpdvc3cuCnD0yTY4Wun19sWoANx2HpINPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lKtQPFchk/X57lzTzjJofLGsiqzzonp94StXBR4HOE=;
 b=Pm7SFZMFyWZ2cshcPoDG3oCnXphHVPRYhH2b/+h4fd9COWky/xS5RIAGWNQ3rrgQqTXNyQObXX7Gk3N7nuhZdF1UJZ806L74tMRtNG1FtFhatmQIfcZNo5EgbkqRPlVNowKYBekGKDD+iKnIoXeOOOtefvIlUtsj3uAH3kzC5aA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 21:45:47 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 21:45:47 +0000
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
Subject: Re: [PATCH v5 3/7] usb: dwc3: core: Expose core driver as library
Thread-Topic: [PATCH v5 3/7] usb: dwc3: core: Expose core driver as library
Thread-Index: AQHbmDiycNcP5woWMEidSI152rwYELN+JMGA
Date: Fri, 21 Mar 2025 21:45:47 +0000
Message-ID: <20250321214545.zlpcz4v6llltjjs4@synopsys.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-3-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-3-90ea6e5b3ba4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8302:EE_
x-ms-office365-filtering-correlation-id: 87223dee-e24d-47db-c0f0-08dd68c1bd79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFZjM2F3THBzMENOS0ZGSWlGMXBEZ3RwbDhhU2ZQSStud3dvaVpIR092Wlhw?=
 =?utf-8?B?Z1lPblVWbG16c0h2M0VtbHc2TXU4YitPVEVLSXJ0NVMvYlI4SU0zN0MxWmx3?=
 =?utf-8?B?Y0dNSlpwUG1YakZ6cldlV25UeFMrZWR3OVQweWNCc0czOGt6VTBZMVRzclZy?=
 =?utf-8?B?WEtsTWVOK2pxM0FEcHFYZmtCS0UwN2l6UTgxWnVaSFNMN2pvRm5LODUwZ2ox?=
 =?utf-8?B?eGZhSXI3NHVmVEo1clRWUjdBOU9aYnE3WDZKTCtLZWtORlFNcG1idW9aVXRL?=
 =?utf-8?B?ZE9qRGhoQkxmSG9PUFRlR2YzRkhzUVdwcTdlL2sxRXR3U2pXeDNwSjV2YUh5?=
 =?utf-8?B?WFhkWHlldzM3TlNhaXJ2Q1B3Z1VWdWRkazVJOW1RcXJOUmNVZlFYOEpIdTlY?=
 =?utf-8?B?MXQ4ZHBSQ3ZRZ0hUTXpuTWw1NG5RUWdMUmt0SFV2c0ZyWnZUTlBERXp4S1VC?=
 =?utf-8?B?VHFDMmNnVVp0ODB0dldra2pQQ2pac3I5OUlucS9BYkV1dVpWSUIwSm9CcWEx?=
 =?utf-8?B?TVBnVUxDZFRPMWFxNEpEQUozKzMvckllZ25WR0ZESDFaMDRyTUNPS3VpQWcz?=
 =?utf-8?B?WEdGVGdIYk9XTnVMOVl4MnBja0RnbldPWDl2akYxZ1pESnBuM1Zpc294RzhJ?=
 =?utf-8?B?bmpvaDBTa2FBc3E5RnVyOGhmNFNWMDJtNDFSSjJaR21TbXQ2amdyU3pCWnZT?=
 =?utf-8?B?ZzFOV3lNbmU4eHB1K2tMMHE1NGdPU1lQdTM3Nk1NTFZDRlNZVzMwMWowb3Zm?=
 =?utf-8?B?VUFEMHRTNkwrcmRGRnl4S0xkcEg0djRScXNkVkFZeFp5aEFCUkVQU2tIaFg4?=
 =?utf-8?B?OUhCWFJ0NEE5eUllZkpLaWx3TVE4VCtiUTVYQm02ZUlSTHp6SitvczN3OGdw?=
 =?utf-8?B?dnNJSHNlTlBiVXhTRWljUWhHajVYTnFwdUttSkNzRHRNOE4vdHYvN2h3Zmpn?=
 =?utf-8?B?MUs2TjExT0c3ZGpScmwxRzJiS2Zud29FZWlHT3VKNGQ4VW5zNDR3SFVhQ2ZF?=
 =?utf-8?B?VlRwa0FqZ01mVVJHZUtsSzErVDFTb2JTK1VsVkl2LzlHczZmaDcvNUg4Zkxo?=
 =?utf-8?B?TDJJbXY4RVRHclI4YXpVUHR2THFUdk1YZVA4U1RjZytRMWk2V1NXSkg5YWpl?=
 =?utf-8?B?ZjdsWFhKNXVVN2g0eU80ZGFFK3RISWZKdE5OVU5NU2RUY3NVUkFRQlIyak5P?=
 =?utf-8?B?b2ZpbEFlNFQ1VmRKY2tvWFJiNzVjWDB0STNmdTdCVmpBWUFHVGMydXdpMFdH?=
 =?utf-8?B?d0Y0V2N2QUxOM1Fqc0ZyckhRZkpsVi8rTGZPSHp5VktUN1duWVYyY2xlNmRC?=
 =?utf-8?B?dUtVMUF1TWFpN0svR0tUQ0kwN0x2NjJqbjEvdVN2azhNejgvZ3JVWTVROWZS?=
 =?utf-8?B?WnBBbTZ6QkV4TDdhS2tsYWx1NHZLUUQ4ekRDaHRhVktsVHNhOVY5eEtVSXdJ?=
 =?utf-8?B?MElxUGE3cFpGbWRJRjdPUko5V1lGK0h5TExMenFkUDZkazgzYUc3VTB4YXNN?=
 =?utf-8?B?QXhnaVhmbGVkWHNhSk1JSEpVUDRyM0NIaDNjQ1FTWUo4Y2NTV1RZbEc1dkc4?=
 =?utf-8?B?eURSREQza3NyY3ZSRGI0Q0lzcUtLdFI2ajE5K1k4eXk3RGh6RXhiSDVYQTBk?=
 =?utf-8?B?YkhWcndGaE5ob0tuQjBNQWdDaCtGUGI0Tk1abUd2b2FGTEs5enlZYXFhclB3?=
 =?utf-8?B?MkVXR2U3dUQzdWd6YzhsVFpaS21QZE5yQTVIMmtIZGJXTTBhaXl5L3B5Sisy?=
 =?utf-8?B?YU02YjRCaGthNm80SzdtZ2h0VWxjcUZTTy90RWFTZkxPazNEVlhWWmt6cWRS?=
 =?utf-8?B?eHhSK2UrZTlPYWVMRW9UM3docEpvRFZoUGZJdVlhWWdJcTlLOWJnSnJzM3RX?=
 =?utf-8?B?bUxSalJsZFhkVDVROWltUlZZQy9aTFlxZ0E1VlZtRm9RbHNGUGYxTDM4QldT?=
 =?utf-8?B?Vyt4ZzhTU3A4a3BUeDVtWUM0d0xkQ1ZvQnZUYlpqSDVQUTAwTDE0SVNzMUdW?=
 =?utf-8?Q?j4EnKGWL9QqBGWKX+8r/VDSLlx/4/w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkFJMG1oUDExZEVjMUg0VSt3bVBWcVBha2p4NmN1eFVKQjVWc3hRWVF5clha?=
 =?utf-8?B?OXpFeFcrV3QwbVRtcGdtVG1VV0w2K1J1ckhHM3J3U0NLVXFuNzFlcitZOEpL?=
 =?utf-8?B?MWhyVlJzQXEzVUxvWkZJczl2eTM1ZmRFNzhKelFJTndWR2ZreVJKR0NzUjB0?=
 =?utf-8?B?MEZCSHp1ZXNSbU9qYjhYelk4MGpMR0NGRTlkdlBmNi94S2Q2Sm9LTW83dHRt?=
 =?utf-8?B?dm1lQmtkSVVrZXlzVEk4SUJvZHN2K3RlWjkyOWhEUU03dmtjNHFOOHVBMWdp?=
 =?utf-8?B?VkFRa2NuQ0pJUWs0RTFua3ZWOFVISDBYRnM5bGxtalNjWlpGR3J6SjdpRHRn?=
 =?utf-8?B?c0VHOU9KWVljMVdYZHRmZ2kvZWNwbGV2Q3hFK1RjQmNxVWVlbDVrSjFHQVFr?=
 =?utf-8?B?M1RVbG9IclNEM3dQMEttNDZmRkxzVUs0TUd5TVZvWnk2SzNVaVE3UmErcTBD?=
 =?utf-8?B?Q05IMmsrbTdTbjJIQzZEaXNmY29ocmg1K082UFdPMDQ1eFM1U0hHVUU5L1N1?=
 =?utf-8?B?eDBUVlFlOWtmNDVLdVBUSEdYaldHWmhUTW1DZGFBZlJ4WWh4bEtjV0RhYlVk?=
 =?utf-8?B?NW9FMExxcmhvbzFUeEkzTlI2ZHhLcDJsaTNjN3ZNL1hTNTFyaDIyblFPdWRX?=
 =?utf-8?B?OVM5TnJoWVBCSG83K2R6a1JEQ1Jtd2txbXlhL2N0M1RobUZhTFgzRWxUSTdq?=
 =?utf-8?B?Mmp5Z0JMdDJLbG5Rck9ib2Vjam9CV0gyTEhDSnh1TDNpZms2b0RleTBuVGV0?=
 =?utf-8?B?ekVBNmcxSTA2dERqZFJXSnI4MXUrOXpNNU9XRVRyQ2JuUENkZG1qaG5SOE9F?=
 =?utf-8?B?UncrOGh3NmFJT2tleXBPNGZmNEVzdjhEVWFPcTI4SUxlSmFFVjEyUWU2cWll?=
 =?utf-8?B?K0FzMVk1TGNSZTUxYWVhbEIrWVZDN2pTb3dGTVZ6blVMbmlYVk5QOHd0Y1dT?=
 =?utf-8?B?cFhUUWVkTDY3T1BsVy9Jd2JnVmduNUZNNWlyQ0lFU093d0hKekwwbG1LM0ZI?=
 =?utf-8?B?SWtzLzhiZkw5ekt3cW5SeFJsOVMzNEs3NnRrZkQyRGloM1pIVG5JVFJ6Y1Jo?=
 =?utf-8?B?d0MvWVZYY3lYeVJVZEFqNEE3S3ZpTzNRaFdCZTYxaFBPMXZma2tOTkd3WE81?=
 =?utf-8?B?VG5xRStoaWgvMnZ4VXVIU1lWSFBoZjQyVVVtM0E2aTVGTWcwbmZhMkJmeEtv?=
 =?utf-8?B?d3FZNDBiYVdsbDVyMWxMN1lnQXhtLzVDWGFHSmV6OU5XSDJMY2xZSkpwcDZy?=
 =?utf-8?B?eElRZHBpZVNmTzJ3Y0IvcExBNm1mdE9rZ29nRjRzSnZITkJDaVh4c1JCVGdL?=
 =?utf-8?B?RHZEMGt6OEZPdTByejZIRHRGZ1R0blN4TnBxdVRBQVdJbmk5NTJkbmZjWTdm?=
 =?utf-8?B?RVUrYi9sbmVPVWdUMHJ5S1ZQODZEbHZTQWlYYVJ1MUd5eTBUWDBHNWRwcUpL?=
 =?utf-8?B?R3lBbGZ3SnFtay9wL056UU5NTVhIbjQ3eFJIeXVRMnJ1WEJzbVdtRCtKbm5p?=
 =?utf-8?B?elJHWFFJZDJvczlPYlQwank4Q0p1Ulo2dy9sQllYQStYN2ZXdXhvUTcxZmIv?=
 =?utf-8?B?RGNzUzZOV2hXWUxqNWswUkFieG9pMnEvbC9QdVZmZVpIcmpOZEw0MEpTUk43?=
 =?utf-8?B?TmM0N0Z1OVZITlRaS2hmb1F4TlZwaW14RU5La1M1ekVvNGQxL1RYcEdvQjNK?=
 =?utf-8?B?b0FHcFJYdmQzTS9BQTkveFpFVVlnTFJPbzFrNDRLZjJ2KzR0L1FpTUlsaG5X?=
 =?utf-8?B?NWsvdjZpVUFIK0ZJZmZxclFNdStPUUZiTndXTUlZV2ZMSlJHTmVKTHNQakp5?=
 =?utf-8?B?S3hnMGdhdE1pOU83U1JKdHorNnBrbzhNSDhmVzF3eDhaSXcxc085NzJFMlVu?=
 =?utf-8?B?c3NJcDR1a2trQiswOVQ0TWQ1bERFczhqamtOdHpRV3VIWllCRzFLTmpoSWNB?=
 =?utf-8?B?Mml6c3JmQUJKckc1ZEtqTDR0NW1mMDVvcHRnMFBCRU9xTzBNUEdPUk02WXdW?=
 =?utf-8?B?b1pneU9lZittREVIdkxJLzJONzkzTVprM3c1Wk9vcFlYMzhndnJJSTBFVTNN?=
 =?utf-8?B?MWkwT1QvQWhraHAvNHdHS3pjWWU4dWJPMjZZcnNudGFTbEtaNzRoZ0kwaWF5?=
 =?utf-8?Q?UsvB/VqlRpts8tChvwByotF7f?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFA745B795F840479A6A5125BAD7F2E0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	juZ7qx3UbK5iT1HKYrqFmC9T04xtwSMc71zT7nPk2KvHZ1PmuX9n7bnRZsSgOsufx45EesPib107naoJDCxM/NY5IUA07qbTkR5bbtISP0bCTToOoSIj8bnS+33TcjkHJU6WER0eucgW93JlCXllfo1Wsp5okrnEsIiEJMtHhcEsZGcbI5iZgudfMRlK/o6Zkf7+Ag3Z5CLjdJj4oP/LCxcHx0EJLIzYwsVpZ9giru9HdNnUOfOhCVvh3C7zaIhqvlgSqLgWfRZEIzFNgR35UZ0hsdjzWtfDVZHhwdhKj+nvfD7T6MNreiiyYFxXZ4L8eESvCcVmsGQ7SLIdfvoemhxmzK4dJV0hhe2YRZ4oTm15yuzGCLsOL9VnOmSyL360dX7R0ljhDBhxs2wCjb/vbe4kr3teEK6FuW5yNa3xpbieHz7S5DighHAOcxjb1VZF0J2XSHQggOWvJjkFgGpEB7JWWJoH/bYuuXRJ37juvUNuWFfMJHb8YCbDwnqSphlY3/I8s7lIheK0ONhKc9V2jvAu4uX2I6n227MiIE+Wk2zzWhqhTTpguZ4dMY4YK9gnUJU8Wt4Ydj1A8cFi280NdEThvuspCc4B2hIo0qcxhL0qRx8ezE5MLtVk6GNgBO3X8lmJqC+jA6zlEXV5E0eLJQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87223dee-e24d-47db-c0f0-08dd68c1bd79
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 21:45:47.3227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4Cnx7Rc/itzjOP1U+Tcf05DcbNVaHjIPFvm9upA/zNXrGrx1nZiBSBPKGhAY+pyAEI0dwHFlgrOLvMwz0R/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302
X-Authority-Analysis: v=2.4 cv=Ua9RSLSN c=1 sm=1 tr=0 ts=67ddde11 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=i8vjgqFBS4AwiQPOH7MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VSmzNo00-I5b2U4rnuqloHnb1-Xd1lvO
X-Proofpoint-ORIG-GUID: VSmzNo00-I5b2U4rnuqloHnb1-Xd1lvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210159

T24gVHVlLCBNYXIgMTgsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gVGhlIERXQzMg
SVAgYmxvY2sgaXMgaGFuZGxlZCBieSB0aHJlZSBkaXN0aW5jdCBkZXZpY2UgZHJpdmVyczogWEhD
SSwNCj4gRFdDMyBjb3JlIGFuZCBhIHBsYXRmb3JtIHNwZWNpZmljIChvcHRpb25hbCkgRFdDMyBn
bHVlIGRyaXZlci4NCj4gDQo+IFRoaXMgaGFzIHJlc3VsdGVkIGluLCBhdCBsZWFzdCBpbiB0aGUg
Y2FzZSBvZiB0aGUgUXVhbGNvbW0gZ2x1ZSwgdGhlDQo+IHByZXNlbmNlIG9mIGEgbnVtYmVyIG9m
IGxheWVyaW5nIHZpb2xhdGlvbnMsIHdoZXJlIHRoZSBnbHVlIGNvZGUgZWl0aGVyDQo+IGNhbid0
IGhhbmRsZSwgb3IgaGFzIHRvIHdvcmsgYXJvdW5kLCB0aGUgZmFjdCB0aGF0IGNvcmUgbWlnaHQg
bm90IHByb2JlDQo+IGRldGVybWluaXN0aWNhbGx5Lg0KPiANCj4gQW4gZXhhbXBsZSBvZiB0aGlz
IGlzIHRoYXQgdGhlIHN1c3BlbmQgcGF0aCBzaG91bGQgb3BlcmF0ZSBzbGlnaHRseQ0KPiBkaWZm
ZXJlbnQgZGVwZW5kaW5nIG9uIHRoZSBkZXZpY2Ugb3BlcmF0aW5nIGluIGhvc3Qgb3IgcGVyaXBo
ZXJhbCBtb2RlLA0KPiBhbmQgdGhlIG9ubHkgd2F5IHRvIGRldGVybWluZSB0aGUgb3BlcmF0aW5n
IHN0YXRlIGlzIHRvIHBlZWsgaW50byB0aGUNCj4gY29yZSdzIGRydmRhdGEuDQo+IA0KPiBUaGUg
UXVhbGNvbW0gZ2x1ZSBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gbWFrZSB1cGRhdGVzIGluIHRoZSBx
c2NyYXRjaA0KPiByZWdpc3RlciByZWdpb24gKHRoZSAiZ2x1ZSIgcmVnaW9uKSBkdXJpbmcgcm9s
ZSBzd2l0Y2ggZXZlbnRzLCBidXQgd2l0aA0KPiB0aGUgZ2x1ZSBhbmQgY29yZSBzcGxpdCB1c2lu
ZyB0aGUgZHJpdmVyIG1vZGVsLCB0aGVyZSBpcyBubyByZWFzb25hYmxlDQo+IHdheSB0byBpbnRy
b2R1Y2UgbGlzdGVuZXJzIGZvciBtb2RlIGNoYW5nZXMuDQo+IA0KPiBTcGxpdCB0aGUgZHdjMyBj
b3JlIHBsYXRmb3JtX2RyaXZlciBjYWxsYmFja3MgYW5kIHRoZWlyIGltcGxlbWVudGF0aW9uDQo+
IGFuZCBleHBvcnQgdGhlIGltcGxlbWVudGF0aW9uLCB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGRl
dGVybWluaXN0aWNhbGx5DQo+IGluc3RhbnRpYXRlIHRoZSBkd2MzIGNvcmUgYXMgcGFydCBvZiB0
aGUgZHdjMyBnbHVlIGRyaXZlcnMgYW5kIHRvDQo+IGFsbG93IGZsYXR0ZW5pbmcgb2YgdGhlIERl
dmljZVRyZWUgcmVwcmVzZW50YXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCam9ybiBBbmRl
cnNzb24gPGJqb3JuLmFuZGVyc3NvbkBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIHwgMTQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9nbHVlLmggfCAgMzIgKysrKysr
KysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNjZhMDhiNTI3MTY1M2FiZDQ1OGY5ZWM4NWNhNzMw
YWZkNzc3OWQ3MS4uYjQyOGI2ZmMzZDBhNTU4MTFlMmY3NWQzM2Q3OWRmNGIwYzY3ZGNhYyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gQEAgLTM2LDYgKzM2LDcgQEANCj4gIA0KPiAgI2luY2x1ZGUgImNvcmUu
aCINCj4gICNpbmNsdWRlICJnYWRnZXQuaCINCj4gKyNpbmNsdWRlICJnbHVlLmgiDQo+ICAjaW5j
bHVkZSAiaW8uaCINCj4gIA0KPiAgI2luY2x1ZGUgImRlYnVnLmgiDQo+IEBAIC0yMTQ4LDI3ICsy
MTQ5LDE2IEBAIHN0YXRpYyBzdHJ1Y3QgcG93ZXJfc3VwcGx5ICpkd2MzX2dldF91c2JfcG93ZXJf
c3VwcGx5KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJcmV0dXJuIHVzYl9wc3k7DQo+ICB9DQo+ICAN
Cj4gLXN0YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAraW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRh
KQ0KPiAgew0KPiAtCXN0cnVjdCBkZXZpY2UJCSpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAtCXN0cnVj
dCByZXNvdXJjZQkJKnJlcywgZHdjX3JlczsNCj4gKwlzdHJ1Y3QgZHdjMwkJKmR3YyA9IGRhdGEt
PmR3YzsNCj4gKwlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gZHdjLT5kZXY7DQo+ICsJc3RydWN0IHJl
c291cmNlCQlkd2NfcmVzOw0KPiAgCXVuc2lnbmVkIGludAkJaHdfbW9kZTsNCj4gIAl2b2lkIF9f
aW9tZW0JCSpyZWdzOw0KPiAtCXN0cnVjdCBkd2MzCQkqZHdjOw0KPiArCXN0cnVjdCByZXNvdXJj
ZQkJKnJlcyA9IGRhdGEtPnJlczsNCj4gIAlpbnQJCQlyZXQ7DQo+ICANCj4gLQlkd2MgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKmR3YyksIEdGUF9LRVJORUwpOw0KPiAtCWlmICghZHdjKQ0K
PiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gLQ0KPiAtCWR3Yy0+ZGV2ID0gZGV2Ow0KPiAtDQo+IC0J
cmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4g
LQlpZiAoIXJlcykgew0KPiAtCQlkZXZfZXJyKGRldiwgIm1pc3NpbmcgbWVtb3J5IHJlc291cmNl
XG4iKTsNCj4gLQkJcmV0dXJuIC1FTk9ERVY7DQo+IC0JfQ0KPiAtDQo+ICAJZHdjLT54aGNpX3Jl
c291cmNlc1swXS5zdGFydCA9IHJlcy0+c3RhcnQ7DQo+ICAJZHdjLT54aGNpX3Jlc291cmNlc1sw
XS5lbmQgPSBkd2MtPnhoY2lfcmVzb3VyY2VzWzBdLnN0YXJ0ICsNCj4gIAkJCQkJRFdDM19YSENJ
X1JFR1NfRU5EOw0KPiBAQCAtMjIzMiw3ICsyMjIyLDcgQEAgc3RhdGljIGludCBkd2MzX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCWdvdG8gZXJyX2Rpc2FibGVfY2xr
czsNCj4gIAl9DQo+ICANCj4gLQlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkd2MpOw0KPiAr
CWRldl9zZXRfZHJ2ZGF0YShkZXYsIGR3Yyk7DQo+ICAJZHdjM19jYWNoZV9od3BhcmFtcyhkd2Mp
Ow0KPiAgDQo+ICAJaWYgKCFkd2MtPnN5c2Rldl9pc19wYXJlbnQgJiYNCj4gQEAgLTIzMjcsMTIg
KzIzMTcsMzUgQEAgc3RhdGljIGludCBkd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICANCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwo
ZHdjM19jb3JlX3Byb2JlKTsNCj4gIA0KPiAtc3RhdGljIHZvaWQgZHdjM19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAtCXN0cnVjdCBkd2MzCSpkd2MgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gKwlzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhIHByb2Jl
X2RhdGE7DQo+ICsJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICsJc3RydWN0IGR3YzMgKmR3YzsN
Cj4gIA0KPiAtCXBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ICsJcmVzID0gcGxh
dGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gKwlpZiAoIXJl
cykgew0KPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJtaXNzaW5nIG1lbW9yeSByZXNvdXJjZVxu
Iik7DQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArCX0NCj4gKw0KPiArCWR3YyA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmR3YyksIEdGUF9LRVJORUwpOw0KPiArCWlmICghZHdj
KQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCWR3Yy0+ZGV2ID0gJnBkZXYtPmRldjsN
Cj4gKw0KPiArCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KPiArCXByb2JlX2RhdGEucmVzID0gcmVz
Ow0KPiArDQo+ICsJcmV0dXJuIGR3YzNfY29yZV9wcm9iZSgmcHJvYmVfZGF0YSk7DQo+ICt9DQo+
ICsNCj4gK3ZvaWQgZHdjM19jb3JlX3JlbW92ZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiArew0KPiAr
CXBtX3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPiAgDQo+ICAJZHdjM19jb3JlX2V4aXRf
bW9kZShkd2MpOw0KPiAgCWR3YzNfZGVidWdmc19leGl0KGR3Yyk7DQo+IEBAIC0yMzQwLDIyICsy
MzUzLDI4IEBAIHN0YXRpYyB2b2lkIGR3YzNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICAJZHdjM19jb3JlX2V4aXQoZHdjKTsNCj4gIAlkd2MzX3VscGlfZXhpdChkd2Mp
Ow0KPiAgDQo+IC0JcG1fcnVudGltZV9hbGxvdygmcGRldi0+ZGV2KTsNCj4gLQlwbV9ydW50aW1l
X2Rpc2FibGUoJnBkZXYtPmRldik7DQo+IC0JcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVu
ZCgmcGRldi0+ZGV2KTsNCj4gLQlwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnBkZXYtPmRldik7DQo+
ICsJcG1fcnVudGltZV9hbGxvdyhkd2MtPmRldik7DQo+ICsJcG1fcnVudGltZV9kaXNhYmxlKGR3
Yy0+ZGV2KTsNCj4gKwlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKGR3Yy0+ZGV2KTsN
Cj4gKwlwbV9ydW50aW1lX3B1dF9ub2lkbGUoZHdjLT5kZXYpOw0KPiAgCS8qDQo+ICAJICogSEFD
SzogQ2xlYXIgdGhlIGRyaXZlciBkYXRhLCB3aGljaCBpcyBjdXJyZW50bHkgYWNjZXNzZWQgYnkg
cGFyZW50DQo+ICAJICogZ2x1ZSBkcml2ZXJzLCBiZWZvcmUgYWxsb3dpbmcgdGhlIHBhcmVudCB0
byBzdXNwZW5kLg0KPiAgCSAqLw0KPiAtCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwp
Ow0KPiAtCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmcGRldi0+ZGV2KTsNCj4gKwlkZXZfc2V0
X2RydmRhdGEoZHdjLT5kZXYsIE5VTEwpOw0KPiArCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZChk
d2MtPmRldik7DQo+ICANCj4gIAlkd2MzX2ZyZWVfZXZlbnRfYnVmZmVycyhkd2MpOw0KPiAgDQo+
ICAJaWYgKGR3Yy0+dXNiX3BzeSkNCj4gIAkJcG93ZXJfc3VwcGx5X3B1dChkd2MtPnVzYl9wc3kp
Ow0KPiAgfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19jb3JlX3JlbW92ZSk7DQo+ICsNCj4g
K3N0YXRpYyB2b2lkIGR3YzNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICt7DQo+ICsJZHdjM19jb3JlX3JlbW92ZShwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KSk7DQo+
ICt9DQo+ICANCj4gICNpZmRlZiBDT05GSUdfUE0NCj4gIHN0YXRpYyBpbnQgZHdjM19jb3JlX2lu
aXRfZm9yX3Jlc3VtZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiBAQCAtMjU0NCw5ICsyNTYzLDggQEAg
c3RhdGljIGludCBkd2MzX3J1bnRpbWVfY2hlY2tzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJcmV0
dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19ydW50aW1lX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiAraW50IGR3YzNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkd2Mz
ICpkd2MpDQo+ICB7DQo+IC0Jc3RydWN0IGR3YzMgICAgICpkd2MgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gIAlpbnQJCXJldDsNCj4gIA0KPiAgCWlmIChkd2MzX3J1bnRpbWVfY2hlY2tzKGR3
YykpDQo+IEBAIC0yNTU4LDEwICsyNTc2LDExIEBAIHN0YXRpYyBpbnQgZHdjM19ydW50aW1lX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICtF
WFBPUlRfU1lNQk9MX0dQTChkd2MzX3J1bnRpbWVfc3VzcGVuZCk7DQo+ICANCj4gLXN0YXRpYyBp
bnQgZHdjM19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICtpbnQgZHdjM19y
dW50aW1lX3Jlc3VtZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAtCXN0cnVjdCBkd2MzICAg
ICAqZHdjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0g
ZHdjLT5kZXY7DQo+ICAJaW50CQlyZXQ7DQo+ICANCj4gIAlyZXQgPSBkd2MzX3Jlc3VtZV9jb21t
b24oZHdjLCBQTVNHX0FVVE9fUkVTVU1FKTsNCj4gQEAgLTI1NzEsNyArMjU5MCw3IEBAIHN0YXRp
YyBpbnQgZHdjM19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJc3dpdGNo
IChkd2MtPmN1cnJlbnRfZHJfcm9sZSkgew0KPiAgCWNhc2UgRFdDM19HQ1RMX1BSVENBUF9ERVZJ
Q0U6DQo+ICAJCWlmIChkd2MtPnBlbmRpbmdfZXZlbnRzKSB7DQo+IC0JCQlwbV9ydW50aW1lX3B1
dChkd2MtPmRldik7DQo+ICsJCQlwbV9ydW50aW1lX3B1dChkZXYpOw0KPiAgCQkJZHdjLT5wZW5k
aW5nX2V2ZW50cyA9IGZhbHNlOw0KPiAgCQkJZW5hYmxlX2lycShkd2MtPmlycV9nYWRnZXQpOw0K
PiAgCQl9DQo+IEBAIC0yNTg2LDEwICsyNjA1LDExIEBAIHN0YXRpYyBpbnQgZHdjM19ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4g
K0VYUE9SVF9TWU1CT0xfR1BMKGR3YzNfcnVudGltZV9yZXN1bWUpOw0KPiAgDQo+IC1zdGF0aWMg
aW50IGR3YzNfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK2ludCBkd2MzX3J1
bnRpbWVfaWRsZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAtCXN0cnVjdCBkd2MzICAgICAq
ZHdjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gZHdj
LT5kZXY7DQo+ICANCj4gIAlzd2l0Y2ggKGR3Yy0+Y3VycmVudF9kcl9yb2xlKSB7DQo+ICAJY2Fz
ZSBEV0MzX0dDVExfUFJUQ0FQX0RFVklDRToNCj4gQEAgLTI2MDcsMTIgKzI2MjcsMjggQEAgc3Rh
dGljIGludCBkd2MzX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICANCj4gIAly
ZXR1cm4gMDsNCj4gIH0NCj4gK0VYUE9SVF9TWU1CT0xfR1BMKGR3YzNfcnVudGltZV9pZGxlKTsN
Cj4gKw0KPiArc3RhdGljIGludCBkd2MzX3BsYXRfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4gZHdjM19ydW50aW1lX3N1c3BlbmQoZGV2X2dldF9k
cnZkYXRhKGRldikpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfcGxhdF9ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJcmV0dXJuIGR3YzNfcnVudGlt
ZV9yZXN1bWUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50
IGR3YzNfcGxhdF9ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXJl
dHVybiBkd2MzX3J1bnRpbWVfaWRsZShkZXZfZ2V0X2RydmRhdGEoZGV2KSk7DQo+ICt9DQo+ICAj
ZW5kaWYgLyogQ09ORklHX1BNICovDQo+ICANCj4gICNpZmRlZiBDT05GSUdfUE1fU0xFRVANCj4g
LXN0YXRpYyBpbnQgZHdjM19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK2ludCBkd2Mz
X3BtX3N1c3BlbmQoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gLQlzdHJ1Y3QgZHdjMwkqZHdj
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gZHdjLT5k
ZXY7DQo+ICAJaW50CQlyZXQ7DQo+ICANCj4gIAlyZXQgPSBkd2MzX3N1c3BlbmRfY29tbW9uKGR3
YywgUE1TR19TVVNQRU5EKTsNCj4gQEAgLTI2MjMsMTAgKzI2NTksMTEgQEAgc3RhdGljIGludCBk
d2MzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9
DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChkd2MzX3BtX3N1c3BlbmQpOw0KPiAgDQo+IC1zdGF0aWMg
aW50IGR3YzNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK2ludCBkd2MzX3BtX3Jlc3Vt
ZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAtCXN0cnVjdCBkd2MzCSpkd2MgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkd2MtPmRldjsNCj4gIAlp
bnQJCXJldCA9IDA7DQo+ICANCj4gIAlwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRl
dik7DQo+IEBAIC0yNjQ1LDEwICsyNjgyLDEwIEBAIHN0YXRpYyBpbnQgZHdjM19yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiAgDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGR3YzNfcG1fcmVzdW1lKTsNCj4gIA0KPiAtc3RhdGljIHZvaWQgZHdjM19jb21w
bGV0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt2b2lkIGR3YzNfcG1fY29tcGxldGUoc3RydWN0
IGR3YzMgKmR3YykNCj4gIHsNCj4gLQlzdHJ1Y3QgZHdjMwkqZHdjID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQo+ICAJdTMyCQlyZWc7DQo+ICANCj4gIAlpZiAoZHdjLT5jdXJyZW50X2RyX3JvbGUg
PT0gRFdDM19HQ1RMX1BSVENBUF9IT1NUICYmDQo+IEBAIC0yNjU4LDIxICsyNjk1LDM2IEBAIHN0
YXRpYyB2b2lkIGR3YzNfY29tcGxldGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCQlkd2MzX3dy
aXRlbChkd2MtPnJlZ3MsIERXQzNfR1VDVEwzLCByZWcpOw0KPiAgCX0NCj4gIH0NCj4gK0VYUE9S
VF9TWU1CT0xfR1BMKGR3YzNfcG1fY29tcGxldGUpOw0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNf
cGxhdF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4gZHdjM19w
bV9zdXNwZW5kKGRldl9nZXRfZHJ2ZGF0YShkZXYpKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlu
dCBkd2MzX3BsYXRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4g
ZHdjM19wbV9yZXN1bWUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgdm9pZCBkd2MzX3BsYXRfY29tcGxldGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiAr
CWR3YzNfcG1fY29tcGxldGUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0KPiAgI2Vsc2UN
Cj4gLSNkZWZpbmUgZHdjM19jb21wbGV0ZSBOVUxMDQo+ICsjZGVmaW5lIGR3YzNfcGxhdF9jb21w
bGV0ZSBOVUxMDQo+ICAjZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovDQo+ICANCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2MzX2Rldl9wbV9vcHMgPSB7DQo+IC0JU0VUX1NZ
U1RFTV9TTEVFUF9QTV9PUFMoZHdjM19zdXNwZW5kLCBkd2MzX3Jlc3VtZSkNCj4gLQkuY29tcGxl
dGUgPSBkd2MzX2NvbXBsZXRlLA0KPiAtDQo+ICsJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHdj
M19wbGF0X3N1c3BlbmQsIGR3YzNfcGxhdF9yZXN1bWUpDQo+ICsJLmNvbXBsZXRlID0gZHdjM19w
bGF0X2NvbXBsZXRlLA0KPiAgCS8qDQo+ICAJICogUnVudGltZSBzdXNwZW5kIGhhbHRzIHRoZSBj
b250cm9sbGVyIG9uIGRpc2Nvbm5lY3Rpb24uIEl0IHJlbGllcyBvbg0KPiAgCSAqIHBsYXRmb3Jt
cyB3aXRoIGN1c3RvbSBjb25uZWN0aW9uIG5vdGlmaWNhdGlvbiB0byBzdGFydCB0aGUgY29udHJv
bGxlcg0KPiAgCSAqIGFnYWluLg0KPiAgCSAqLw0KPiAtCVNFVF9SVU5USU1FX1BNX09QUyhkd2Mz
X3J1bnRpbWVfc3VzcGVuZCwgZHdjM19ydW50aW1lX3Jlc3VtZSwNCj4gLQkJCWR3YzNfcnVudGlt
ZV9pZGxlKQ0KPiArCVNFVF9SVU5USU1FX1BNX09QUyhkd2MzX3BsYXRfcnVudGltZV9zdXNwZW5k
LCBkd2MzX3BsYXRfcnVudGltZV9yZXN1bWUsDQo+ICsJCQkgICBkd2MzX3BsYXRfcnVudGltZV9p
ZGxlKQ0KPiAgfTsNCj4gIA0KPiAgI2lmZGVmIENPTkZJR19PRg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9nbHVlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwLi5lNzNjZmM0NjYwMTJmMDcyMTQyOTFhYmU1NjQ1NDkzNGFiMDE0MDEzDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nbHVlLmgNCj4gQEAgLTAsMCArMSwz
MiBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gKy8qDQo+
ICsgKiBnbHVlLmggLSBEZXNpZ25XYXJlIFVTQjMgRFJEIGdsdWUgaGVhZGVyDQo+ICsgKi8NCj4g
Kw0KPiArI2lmbmRlZiBfX0RSSVZFUlNfVVNCX0RXQzNfR0xVRV9IDQo+ICsjZGVmaW5lIF9fRFJJ
VkVSU19VU0JfRFdDM19HTFVFX0gNCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+
ICsjaW5jbHVkZSAiY29yZS5oIg0KPiArDQo+ICsvKioNCj4gKyAqIGR3YzNfcHJvYmVfZGF0YTog
SW5pdGlhbGl6YXRpb24gcGFyYW1ldGVycyBwYXNzZWQgdG8gZHdjM19jb3JlX3Byb2JlKCkNCj4g
KyAqIEBkd2M6IFJlZmVyZW5jZSB0byBkd2MzIGNvbnRleHQgc3RydWN0dXJlDQo+ICsgKiBAcmVz
OiByZXNvdXJjZSBmb3IgdGhlIERXQzMgY29yZSBtbWlvIHJlZ2lvbg0KPiArICovDQo+ICtzdHJ1
Y3QgZHdjM19wcm9iZV9kYXRhIHsNCj4gKwlzdHJ1Y3QgZHdjMyAqZHdjOw0KPiArCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzOw0KPiArfTsNCj4gKw0KPiAraW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBz
dHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKTsNCj4gK3ZvaWQgZHdjM19jb3JlX3JlbW92ZShz
dHJ1Y3QgZHdjMyAqZHdjKTsNCj4gKw0KPiAraW50IGR3YzNfcnVudGltZV9zdXNwZW5kKHN0cnVj
dCBkd2MzICpkd2MpOw0KPiAraW50IGR3YzNfcnVudGltZV9yZXN1bWUoc3RydWN0IGR3YzMgKmR3
Yyk7DQo+ICtpbnQgZHdjM19ydW50aW1lX2lkbGUoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ICtpbnQg
ZHdjM19wbV9zdXNwZW5kKHN0cnVjdCBkd2MzICpkd2MpOw0KPiAraW50IGR3YzNfcG1fcmVzdW1l
KHN0cnVjdCBkd2MzICpkd2MpOw0KPiArdm9pZCBkd2MzX3BtX2NvbXBsZXRlKHN0cnVjdCBkd2Mz
ICpkd2MpOw0KPiArDQo+ICsjZW5kaWYNCj4gDQo+IC0tIA0KPiAyLjQ4LjENCj4gDQoNCkFja2Vk
LWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywN
ClRoaW5o

