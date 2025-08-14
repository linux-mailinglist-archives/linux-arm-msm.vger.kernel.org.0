Return-Path: <linux-arm-msm+bounces-69090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13062B2581C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E5487ACA48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222452FF66F;
	Thu, 14 Aug 2025 00:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jrerriwU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hg12bZbP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CkJqJoVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15D4179BD;
	Thu, 14 Aug 2025 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130583; cv=fail; b=LxiJHYCsfu7LsxKodKBlhTH32fA2HE41/MXjHUIf72kMOJZjIdmkghxyzZGOeQeYn1ccVvIeHphXlG+hKOthIFPUf9HUVCrH7pXR3HebC7s6exgWCh9iFX+o3VKqbIQM2wRC7ApemQm1ob6k29W5yHR4ECx0Ol9T1+jOPxLOZt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130583; c=relaxed/simple;
	bh=YF4yMP8f/E79PDHMuIG7VPja0pFg8rZ5l4rah/Rh/Ck=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RUr6YLiSFy6Y51KjgjALiLEGoK/wClZLnhVIbHsoQTAysbpLZMBfaaefVxBA4mi6Y2NP8LAiWib9Hmcxio2b/JXYM5n1XzFvwSx/EsPT8qgW0d7T0JSLVIbDDVRhPa9I2i9so2Kb/FaTr0BXzcFX4YqQEovewlV+0Vtw+BoyR0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jrerriwU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hg12bZbP; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CkJqJoVf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMFOQr005124;
	Wed, 13 Aug 2025 17:16:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YF4yMP8f/E79PDHMuIG7VPja0pFg8rZ5l4rah/Rh/Ck=; b=
	jrerriwUEPAPIL97/GW56m87C4v5iNAw/qqzNuqB4f1CSAUNongZ0LS1TKe2CvFo
	BCCHbaQJefADmzGqqMv0272StQnDqyKNlS8DJy9z3aRqzxIVTgmShSbA+3wVToDU
	N8T8BaKy83EMyJIF5+L126asyH9BTELPjn6qkz7FfF/lV0uW3OMvhah4G32w3dbS
	cgSeSv5P2Dcowy8I2ymUwkjhY2ozlFqGTgmeFUAMPzQ6zdRU8qVvei2IxmzIYNmW
	XqghHVM6qy1jXi+kwMuft9puOARd5/G8Ls+6OebNifnXp4qLKmjdVE90xrJM4uBr
	powGiLcREjgt/GFaejTrpg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48e5bmw9xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 17:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1755130565; bh=YF4yMP8f/E79PDHMuIG7VPja0pFg8rZ5l4rah/Rh/Ck=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hg12bZbPIseSujPMgsNax5kVgvaELCLXCWqTK9MvDkhaMXb1Du1ntB4ZITMNo2LBw
	 3zzDp8K2vBc4/JfkDKvyj/roTDc2e8sQKzuBjLK/R+OPOOrBl4JzP0x/fI0YqtuGzn
	 bxQStb+ul2UyShvD4AFbkl9yuxo9yKPLDqvsakl1nEYJXwNhlJ4Rd5bGA+yQWtqhMF
	 4wT2CurY1p5h4Ie/dbWcN3w9TeNWhsv30OC59fESr+LN83rA+uGOMgx9E+vISGEFgL
	 CeGJozMZJ/RMW8Ouuil/WoFgGmQqkDxAYUcm/HryYmAq41iQuWdLte6nhI9UiUdR8/
	 IYtKZSMqHerCQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C054403A2;
	Thu, 14 Aug 2025 00:16:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CE72FA006F;
	Thu, 14 Aug 2025 00:16:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CkJqJoVf;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3F11C40561;
	Thu, 14 Aug 2025 00:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT913hpkWk24LOkBIYf2wOh6sy8GsMo1zDvlYWTZqQB+heQ9a2w45EBjv4Ja6me9chfU4RiGCeXPXmBMiUEyrah2Ctpmi00sfbvjVqtINHwjhs1SR6b738uipRDZKMDOeDesivUP5lfQBbTFifCovJupkyIv6gDQSR64wqYP1dQ2DPLtpZPIYyJES20/z7LrsR63NvRV0sQ8HLuqQHb/vKalpL+CFrdjLosQxFb/76NHM4UUxPinHzv+D3D0uERuK3ZNczC/wcznn3EGv8nmNzbcTvK5it61DAmIuhObh+Alcj/GcrWmnEoenGhOVovccvR6Kej41GhZrzk3ko/c4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF4yMP8f/E79PDHMuIG7VPja0pFg8rZ5l4rah/Rh/Ck=;
 b=JFzmXe6FHF/XPM4OHiNk5XveoMIC7QVWGA9w/0ORNQV7GDDxMU02rAtG9dZ/bjZ7lH/hUzfNOEWmP1uAcNrt6Bm8IgK+hQ+rAAalKdcqBLkKE25h7LoW3NnLuXnUkCLnV/QJIWV3oMWo60lQkK1lg4odlxC/JSbAfA+kh0fEtQ+FTO+2Moj7LiVAEQCkF3FAm5o92fdUtB+PwvUM12nBN7v+8H3OkCrpzKPqFsYPF2vXfLlQsByaivjB5w14unR3j7hCJU/bG8vQ548FgVpBVlIHngkaOpkNKOyTcgd9FAmQ0gKSni83L97UGBtUDJ45mV5bvfp9zR6SJ/8qI2OmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF4yMP8f/E79PDHMuIG7VPja0pFg8rZ5l4rah/Rh/Ck=;
 b=CkJqJoVf5O8BgNDYClnmunx/+EBx9JTYj5gZV4PmkCZcL5gRLMJ9MiDo+wj5s4xOvXnwaMsSKQCurjYKYXTi0vKHv7TGA5v2bFciOIgXcFdnu7Jzb6dXz2kf0lG/HRV7riqeOFysBoV6HiVugbs/qt5Ij2FzEaqYGdrNQMyj4uc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 00:16:01 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 00:16:01 +0000
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
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index: AQHcC03KeWU33o7dKE22z1EMVODUyrRhSpQA
Date: Thu, 14 Aug 2025 00:16:01 +0000
Message-ID: <20250814001552.gtbrgqthtjpilq23@synopsys.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB6047:EE_
x-ms-office365-filtering-correlation-id: f35027b9-4678-4b73-34ad-08dddac7c015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmFGaTJXVjB5aEcxTGllRXFGdFo3YVIvRy9JZ2RHd2JETml4RFFSTzNHR01Y?=
 =?utf-8?B?bEtBZ2xoRzkzbU5VUURMbFlwSHg4M1ZYUTJaekdoMGk4NDJGZTg2V056b0Yy?=
 =?utf-8?B?RElOVkpUUEdKQVZZeTBIM3IrZEZWLy9KTEVXUzIxczUyc25vaVZISnhiRkVp?=
 =?utf-8?B?RVJlSDh1Z04vQlJRRWl1UmVqQUF1QXQzaHZYNTg0cVQ0aW1LcDR4eHc2eGFQ?=
 =?utf-8?B?K2c4OUdjV1F4M1lDdDNyVkZmaGNFMU5iN0huZjJ4MFpWQzF0ei9DcEsramNj?=
 =?utf-8?B?QkFnZEtobFFaUjVqR1I4Z1RtWTZCYVI5emJGMVU3Ym9IdUxITExRRzdHOFla?=
 =?utf-8?B?ODM1cmh3Y3U0MExNcnQyZ1NUb0tYcGptK2xiaEp1bmJJMkxMSWRaRnN2aFZG?=
 =?utf-8?B?VnFxSWNQbEJpdE1Edzk0U0l0dU52SmhMWUVUejhRb3JsZTFyVng5cHhGUWFG?=
 =?utf-8?B?dWZJcDJhZFRmQUN5VGUrdklDYWc2Z29CeEo3czdqYUJ4Z3FXU3dXM3k4S0N4?=
 =?utf-8?B?Z1hZcDh0a3VOZXprbHVIRnllK2I2Nm9GR1l1WHNkWStMRFRqbE1iLzRQRys5?=
 =?utf-8?B?eHg1a2YycWZjakEyQmtNWE5MYWpBOGRiWGw2TEVtNmdRZjlxa1o1bEZYUlg3?=
 =?utf-8?B?RjR3WlJUT3Y5cmYxOG1QdURUeXZNbERkcy84bndGUjE0SndyTk1qZjM1ZzBn?=
 =?utf-8?B?cU45NHNzajlXeHdUS1pzem5sT25HaXdkMlRmekNidVFlVVFoTVRXRmZXMWZo?=
 =?utf-8?B?Q1VsVUx4TU1qMUdkTXc4UWgvOWFwY1l1N2U1RlNtY1hxam8ranpsUlNvblV4?=
 =?utf-8?B?bWxJTU5YWllxMWxiMnFnbUJQRHRwejJ3N1hIdVpaNlU2b0xkQ3lZdHc4eDhC?=
 =?utf-8?B?Szk5bkJOUmduTlFYNjhKbU5WL25QUHZDQmwreFFsVm1jaG90ejFlYXgwa2gy?=
 =?utf-8?B?UVA3SXFBUTY3R0ltR2J1YTNUY08xQWZwUGRYM3VlcWhtL0ljRjRDeE5FMnFW?=
 =?utf-8?B?UW5UZWF3czVjNlgrRElPMzdJZHR6U3JGYVhwYyt0emhERzhveXhlYlNtckJ2?=
 =?utf-8?B?MWZwK1ZzdFBxVjlkODZ2QWJLMHUzcXFjelZNTkxZMTNiSFNrblB4NnJ0VUJM?=
 =?utf-8?B?Z1FwUjVNZCtTc2QwZnpHSTh0bEFZcEtpbFRJZjQ3dzA2SC9yRllPdmFJTkJa?=
 =?utf-8?B?WkFjakpiMmU4emRzUW92MXRXNlh4S1dDaGg2V1k3VzdZYmRlWVoxdDVCdXJ2?=
 =?utf-8?B?K2FCTkt4RzZlT1BzNzB5MTdJcUVtNEF5M0dQdnpnRHNnc2VQMDkwVmcrVFF3?=
 =?utf-8?B?VWtZYkFoUmwxRk5WSXo3ZDQzZEprNEpJbzAycjRlbjd1dWRBa0hUekV3cnRP?=
 =?utf-8?B?M2VHY0k1czV0OXpSWUFZOG1OUU9zaGFuellSVEdXVEd0bVg2TGo2UU9aWFJ4?=
 =?utf-8?B?ODMwbHFzZzRiQUF2QlRlZ3Q0WDdDYXhLMWwyVkM2d1J0c3QrdHphZ2d4cHBa?=
 =?utf-8?B?UnMvVlV3dlNvdXRHa3RZV044alBCcTNIR2E1OUFGSUhqVmk2bDdxZzFWTGhl?=
 =?utf-8?B?eG9lUFdFREVIUEdwTEJEUXVOQ05ndzNyNlBoNjZ3dmhrQjJoZ0cxKzdEQ09v?=
 =?utf-8?B?eitxcGhldGtNR3J3YUVSeVNHbldjUDVjVHVmNTVraGp1M3hnWmpzVXFralZW?=
 =?utf-8?B?Qmg5WVYwSWprd2NOT2J4MHdIWlA5cWdMM2VRUlZzeDYxTEp6RW9PNU1YOFZT?=
 =?utf-8?B?bUEyNktSd3lST0ZwTkZLS1FwZVpHdHd6dHMzNk55dTNadmt1bnpGSndaS1U1?=
 =?utf-8?B?ekhaY0IwSXBrQXNRTkNVM2VIK05qd1RqUTJPNmpwdWVBT0tseSthN1Q3R016?=
 =?utf-8?B?ZXJrT2k5N04vS3RmazFpcWN0SGtpSHlSR1N0T1EwdFlHQWR0RnVvMVg2d1Rs?=
 =?utf-8?B?WHlZSXR0TGRlZDRXc1NOOGJSK3VNdGhWWUQwQWNSbDhLOEdlS3NFNXdTcUp1?=
 =?utf-8?Q?sGA8KkkHpQffO0q36FGeBUrm3jLMvk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UU9KSW5zWjRqVkNvMjRtNHNjdlVhYjRSdDFzdysrNFU2UFpINmVlM3pzWlVp?=
 =?utf-8?B?RUZibUJZanFCVUsxUm5DT3g3OEFCT1dzd040RUJjSVJuMUZkNUJIME94aW10?=
 =?utf-8?B?M1AzSFA2VkE3RmJwT2g2d0oxZVpZR09xblRWcVhoVE9mSUxwRDd1Vnd5YTlk?=
 =?utf-8?B?THBsc3hyQ3k2OVU5ZUJ3SHd3SllpbER3dy9HV0NVdnpwRnhCc014dUtxTkgz?=
 =?utf-8?B?M1pFVURVT0NJcStFdGtwMk9CQXRSQ29OZEhPVzAwUHNTNVFzWTBPSGVOd2Mx?=
 =?utf-8?B?Zjg5czVTclJXaVlNd1JQcXdOSUlGVFFDVnFjc0Vqdzg4b2FQVjRlTUIwcDFU?=
 =?utf-8?B?MFR6RkR4b2dySUtxV2pZUFdHUEhybEg5bCs0dFVtU3U4TVNpNnZoY0dEMkQw?=
 =?utf-8?B?L3hhNzU0UWZQdytmY1ZpV2JNUVZHd25LbGx3TU05eXl1NXFEanVKbEN2dzFI?=
 =?utf-8?B?NGRwV3NnUzVqc2NNMHhSSUV1TzdXcnowQS9KWFJUNFRUZ0kwK09mZWt0elFj?=
 =?utf-8?B?ZWpOVVZLVzVPdDdxR1RrUHdSM2hMSTAyamxzbVliMFpyWUtnTUlZVUppNG1p?=
 =?utf-8?B?VmtmVUNISFBqRlRrZjU5RGtNb29ER25Hc0tQMWtNc1d6QWN0bmdCK05MMGEx?=
 =?utf-8?B?MzZLWjBzRUhkRHFHNzlTbE5BYTN3WXJoM0dRb0NuZWc2bUR2SXNvblo4L3Q3?=
 =?utf-8?B?M0Z5Smt4L1hrc1lTUnBLTWFlMGtPb3hRMVlERHJ3Q21WdHd1cThDMERib29o?=
 =?utf-8?B?V0FIT2dpUWhGdlpXdnEvRjFPQXFVZTd4WXJhNlBYWEtlTVgzMDdnUE9lVGtS?=
 =?utf-8?B?VFIrMmxsUXBIWmhPNGZ4UUxXV3FSS1gzM1Y2Q0V3aW9QMWdzTEtSK1pVU0tt?=
 =?utf-8?B?K3F5bXRUdjN3SnpYcTA2eEhHK0tNUVU4YWhrU1hOaHF3Vm9OTktxQkhkM2lN?=
 =?utf-8?B?bE9LN04rbXFaQ2Y5NUtybmlFamhxU3JsWGZhV0NzV2NSUEJvWk1JVDRLY044?=
 =?utf-8?B?dGREWHF2YjF6QUEzWUFVcm9lbzFMbU9mU1B0QjhuRU1yV1lUeFF0RTZldi91?=
 =?utf-8?B?VUsxbWRTMHU0eFoxekRhOHZIRUJxNkFmUGtvbEoxRUdYMjFjWkRKQXpmZnYz?=
 =?utf-8?B?QlRMZFlSRFovTEdrTm95ZFpuOUROUE9uYjk2MGVoUlVGMDlRUkphbmxEL0dw?=
 =?utf-8?B?MklWeXVXdmRkcVJNN0pqUmtIZGg3RThoQW9ydlc4Y2JKcXNlV1pGSzg5cWlK?=
 =?utf-8?B?Z2gzSWw1bDFHa1dqRmwxZ1ZoSExDL2NWaDc3c0NqaXI1ekZubXZsUU11S1lT?=
 =?utf-8?B?ZGhLK2p4eEFPUlUzU3h1c2dDWDJPbDR1cEZJZm1KU2lQeDBCNG9lY3dhTzVq?=
 =?utf-8?B?TldOYnJpejVGSEJaZGxMYWF2TW5zaHVlQWh3TWlIODROMkhGdTQvZkFOYU5p?=
 =?utf-8?B?dVF1V3lUTElUNjlibEdOdGtDNXVyS3oxSTZDakFhSDhrM3J4cERpZGFacldN?=
 =?utf-8?B?NnQzaTh1WkttdDMrRzBVZ0NzRDF1ZnVhdzBMTFc4d04vY3dQMVMvZUo0R0No?=
 =?utf-8?B?OG5GcGk2OGd5a1YxR2d5bUsyeGovQlNvNnNCOFR3am1uV3Zoc1FHdjVNQUx3?=
 =?utf-8?B?OGJIbit6SGl5ZVBTa29tS293SmFJNXhyc3J3RjlrdkYyMTBmdklBc3pqQmh4?=
 =?utf-8?B?MU1UcFdGVE9JdnJHZStlWVpMTGFObWN6UUxFcVE1a3orSm1PTmZuaHFZMlpn?=
 =?utf-8?B?V01OQ3JwUVAvMGg0em0zYWMzUjJUdS9MalFqRVF2WFd5VUpNeml0VVpoZytm?=
 =?utf-8?B?MU4rNStydkl0QUxncTI4d0luWnVoSyttaFc2eUoxcXFiY3NsSzI5OUt1di9B?=
 =?utf-8?B?MHkwT0NGcW1mazV4aXJCLzh3YjJKTkdPMjdVanIwenNzcVN3Tm4wQktKMDlI?=
 =?utf-8?B?NThzQy9CMUFyQVBCN0xUZ1NxNkYwSDArT21helVwQ0p6RnBCWDlXYlRkVTVm?=
 =?utf-8?B?MzV3c1dzcW1ZL29TQTRYb3RJQlA2dks3eGVZY096ai9teUwyd0RrWmNOZnpS?=
 =?utf-8?B?SVZ6cDVJVjF2WExVNm5GbVY5aFArRkFUMjZYTytBcVBhUmtEWEpjOXE2N3hI?=
 =?utf-8?B?MW43bFdIcmpBakdNbjJ1VmlINzlneUN3bzJoLzFuVzNqbjJwZU5YYit4a05R?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B422C6129041948ACA676CF41CA56AD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uudI5LyEkRCp7tyWp86WWRLxOquAMC63GSD/FBBn5Y4hPi3LnTwkmmgYW97eANSXi8YwW1sMPFKaKLz0PvhVnJxXRCtjzwvR/X8HEXAhUxKp2+yEtvbD2j+4e3qV7rPcvANMpuclKyNrjiPwMd1HsfcPj8+F7vhYueCR2qV6x/RZeIBt9UJNcOxvK2vRdSJIribuia6W3DzEv+yFJ6RLVMAmHiBLTc1be19m1IpMjebyJa5/kKv3wPj2XfKUSa//ZBNDciDcPxsu1a6Feoy85q4lwiZDJBpLDxfgCdu79yyXwMbfjk5JoV6LEw9ZEpZ/l/gvLX4cqxB3jFecFzcscZ+wC5n0EmAcLDa/Z4itKFA7a58vOHzdsrJ4a+cvD2qd8F9Sj8B7PWbaV7IurejHg2MZ2yTe+d+cARJit8f0Jc3dg7nJi3z9vZ/2cD7ox0W3xCMlUCPdcS0Fm7K+ejT7rh/bnIlKHqXKynR2RCJpoXG8MU1/LreQNs3w726DDqUAxe/hpXGhfEwQ6n1p32LzoO3v70XoUq28A9O9iNUw8AwrbqI6mqpLBGEJddOCwuhANjAkzOkdFz2g4uZE/Fan7/4RTeZ4MU71e4By/R3dP23xfDAKJr/U+LrgqiG8eFl9MZZuP8JQNJuFVtnXg8jKXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35027b9-4678-4b73-34ad-08dddac7c015
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 00:16:01.2079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFbAOMDLhNbepqbRyC1vxcKVHFOxdUW4jqHTa486EHN7b+RSur2DorzXachyCp0HO4KMSQlRmIH0dVonKhOnmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDA5MiBTYWx0ZWRfX4OxDCbqkro4t
 zZXNsV15otT81DyxYgjZv0dnneb5PotAxIeCw6XVFPMeL4b2WKZyJ2rjJ0xwmpCWZCkZlYyExGX
 plzRZvNHWnvILkNUhVytJYn1dtFgP/J9zi1Ow+/kHVE26s9Emgq7WYuicKjzA86YTpqNt21zVRa
 fu8b8UB6nNhQ2zotbwQTsygBb38DOQVsyfyzMNkWcsAgF5iAL7pM0dlbCVDRdxBBcVNOgQcwo3v
 5OQXseZI441ikCNCnKxm/YXlAdesn2eGRA0r4IRl01b08X4bxI/hu74FuNqrp8ToJSPFLvDzxvC
 6mhx/XVJeNp5uf3pNU5Kzrqknryt+cXb4CBDE+mqJzbX0KNukxTvKeUNrYEa5wEpEivG+Kd85fX
 78FebS/T
X-Proofpoint-ORIG-GUID: SIxfIghq7NQUZz1A8A2oaGmFEz3VrMAq
X-Proofpoint-GUID: SIxfIghq7NQUZz1A8A2oaGmFEz3VrMAq
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=689d2ac5 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=oe_8UlTYjYQtnziEGooA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090092

T24gVHVlLCBBdWcgMTIsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IE9uIFF1YWxj
b21tIERXQzMgZHVhbC1yb2xlIGNvbnRyb2xsZXJzLCB0aGUgY29ubmRvbmUvZGlzY29ubmVjdCBl
dmVudHMgaW4NCj4gZGV2aWNlIG1vZGUgYXJlIGdlbmVyYXRlZCBieSBjb250cm9sbGVyIHdoZW4g
c29mdHdhcmUgd3JpdGVzIHRvIFFTQ1JBVENIDQo+IHJlZ2lzdGVycyBpbiBRdWFsY29tbSBHbHVl
IGxheWVyIHJhdGhlciB0aGFuIHRoZSB2YnVzIGxpbmUgYmVpbmcgcm91dGVkIHRvDQo+IGR3YzMg
Y29yZSBJUCBmb3IgaXQgdG8gcmVjb2duaXplIGFuZCBnZW5lcmF0ZSB0aGVzZSBldmVudHMuDQo+
IA0KPiBVVE1JX09UR19WQlVTX1ZBTElEICBiaXQgb2YgUVNDUkFUQ0hfSFNfUEhZX0NUUkwgcmVn
aXN0ZXIgbmVlZHMgdG8gYmUgc2V0DQo+IHRvIGdlbmVyYXRlIGEgY29ubmVjdGlvbiBkb25lIGV2
ZW50IGFuZCB0byBiZSBjbGVhcmVkIGZvciB0aGUgY29udHJvbGxlciB0bw0KPiBnZW5lcmF0ZSBh
IGRpc2Nvbm5lY3QgZXZlbnQgZHVyaW5nIGNhYmxlIHJlbW92YWwuIFdoZW4gdGhlIGRpc2Nvbm5l
Y3QgaXMNCj4gbm90IGdlbmVyYXRlZCB1cG9uIGNhYmxlIHJlbW92YWwsIHRoZSAiY29ubmVjdGVk
IiBmbGFnIG9mIGR3YzMgaXMgbGVmdA0KPiBtYXJrZWQgYXMgInRydWUiIGFuZCBpdCBibG9ja3Mg
c3VzcGVuZCByb3V0aW5lcyBhbmQgZm9yIHRoYXQgdG8gaGFwcGVuIHVwb24NCj4gY2FibGUgcmVt
b3ZhbCwgdGhlIGNhYmxlIGRpc2Nvbm5lY3Qgbm90aWZpY2F0aW9uIGNvbWluZyBpbiB2aWEgc2V0
X3JvbGUNCj4gY2FsbCBuZWVkIHRvIGJlIHByb3ZpZGVkIHRvIHRoZSBRdWFsY29tbSBnbHVlIGxh
eWVyIGFzIHdlbGwuDQo+IA0KPiBDdXJyZW50bHksIHRoZSB3YXkgRFdDMyBjb3JlIGFuZCBRdWFs
Y29tbSBsZWdhY3kgZ2x1ZSBkcml2ZXIgYXJlIGRlc2lnbmVkLA0KPiB0aGVyZSBpcyBubyBtZWNo
YW5pc20gdGhyb3VnaCB3aGljaCB0aGUgRFdDMyBjb3JlIGNhbiBub3RpZnkgdGhlIFF1YWxjb21t
DQo+IGdsdWUgbGF5ZXIgb2YgYW55IHJvbGUgY2hhbmdlcyB3aGljaCBpdCByZWNlaXZlcyB2aWEg
cm9sZSBzd2l0Y2guIFRvDQo+IHJlZ2lzdGVyIHRoZXNlIGdsdWUgY2FsbGJhY2tzIGF0IHByb2Jl
IHRpbWUsIGZvciBlbmFibGluZyBjb3JlIHRvIG5vdGlmeQ0KPiBnbHVlIGxheWVyLCB0aGUgbGVn
YWN5IFF1YWxjb21tIGRyaXZlciBoYXMgbm8gd2F5IHRvIGZpbmQgb3V0IHdoZW4gdGhlDQo+IGNo
aWxkIGRyaXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBzaW5jZSBpdCBkb2VzIG5vdCBjaGVjayBm
b3IgdGhlIHNhbWUNCj4gZHVyaW5nIG9mX3BsYXRmb3JtX3BvcHVsYXRlLg0KPiANCj4gSGVuY2Ug
aW1wbGVtZW50IHRoZSBmb2xsb3dpbmcgZ2x1ZSBjYWxsYmFja3MgZm9yIGZsYXR0ZW5lZCBRdWFs
Y29tbSBnbHVlDQo+IGRyaXZlcjoNCj4gDQo+IDEuIHNldF9yb2xlOiBUbyBwYXNzIHJvbGUgc3dp
dGNoaW5nIGluZm9ybWF0aW9uIGZyb20gZHJkIGxheWVyIHRvIGdsdWUuDQo+IFRoaXMgaW5mb3Jt
YXRpb24gaXMgbmVlZGVkIHRvIGlkZW50aWZ5IE5PTkUvREVWSUNFIG1vZGUgc3dpdGNoIGFuZCBt
b2RpZnkNCj4gUVNDUkFUQ0ggdG8gZ2VuZXJhdGUgY29ubmVjdC1kb25lIGV2ZW50IG9uIGRldmlj
ZSBtb2RlIGVudHJ5IGFuZCBkaXNjb25uZWN0DQo+IGV2ZW50IG9uIGNhYmxlIHJlbW92YWwgaW4g
ZGV2aWNlIG1vZGUuDQo+IA0KPiAyLiBydW5fc3RvcDogV2hlbiBib290aW5nIHVwIGluIGRldmlj
ZSBtb2RlLCBpZiBhdXRvdXNwZW5kIGlzIGVuYWJsZWQgYW5kDQo+IHVzZXJzcGFjZSBkb2Vzbid0
IHdyaXRlIFVEQyBvbiBib290LCBjb250cm9sbGVyIGVudGVycyBhdXRvc3VzcGVuZC4gQWZ0ZXIN
Cj4gdGhpcywgaWYgdGhlIHVzZXJzcGFjZSB3cml0ZXMgdG8gVURDIGluIHRoZSBmdXR1cmUsIHJ1
bl9zdG9wIG5vdGlmaWVyIGlzDQo+IHJlcXVpcmVkIHRvIGVuYWJsZSBVVE1JX09UR19WQlVTX1ZB
TElEIG9mIFFTQ1JBVENIIHNvIHRoYXQgY29ubmVjdCBkb25lDQo+IGV2ZW50IGlzIGdlbmVyYXRl
ZCBhZnRlciBydW5fc3RvcCgxKSBpcyBkb25lIHRvIGZpbmlzaCBlbnVtZXJhdGlvbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1
YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwgNzgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NjggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMN
Cj4gaW5kZXggYTdlYWVmYWVlYzRkLi5kODlmYmIxZDg5OTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFj
b20uYw0KPiBAQCAtODMsNiArODMsOCBAQCBzdHJ1Y3QgZHdjM19xY29tIHsNCj4gIAlib29sCQkJ
cG1fc3VzcGVuZGVkOw0KPiAgCXN0cnVjdCBpY2NfcGF0aAkJKmljY19wYXRoX2RkcjsNCj4gIAlz
dHJ1Y3QgaWNjX3BhdGgJCSppY2NfcGF0aF9hcHBzOw0KPiArDQo+ICsJZW51bSB1c2Jfcm9sZQkJ
Y3VycmVudF9yb2xlOw0KPiAgfTsNCj4gIA0KPiAgI2RlZmluZSB0b19kd2MzX3Fjb20oZCkgY29u
dGFpbmVyX29mKChkKSwgc3RydWN0IGR3YzNfcWNvbSwgZHdjKQ0KPiBAQCAtMTExLDEwICsxMTMs
NiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHdjM19xY29tX2NscmJpdHModm9pZCBfX2lvbWVtICpi
YXNlLCB1MzIgb2Zmc2V0LCB1MzIgdmFsKQ0KPiAgCXJlYWRsKGJhc2UgKyBvZmZzZXQpOw0KPiAg
fQ0KPiAgDQo+IC0vKg0KPiAtICogVE9ETzogTWFrZSB0aGUgaW4tY29yZSByb2xlIHN3aXRjaGlu
ZyBjb2RlIGludm9rZSBkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUoKSwNCj4gLSAqIHZh
bGlkYXRlIHRoYXQgdGhlIGluLWNvcmUgZXh0Y29uIHN1cHBvcnQgaXMgZnVuY3Rpb25hbA0KPiAt
ICovDQo+ICBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUoc3RydWN0
IGR3YzNfcWNvbSAqcWNvbSwgYm9vbCBlbmFibGUpDQo+ICB7DQo+ICAJaWYgKGVuYWJsZSkgew0K
PiBAQCAtNTYwLDYgKzU1OCw1NSBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9pcnEoc3Ry
dWN0IGR3YzNfcWNvbSAqcWNvbSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcA0KPiAgCXJldHVy
biAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3Fjb21fc2V0X3JvbGVfbm90aWZp
ZXIoc3RydWN0IGR3YzMgKmR3YywgZW51bSB1c2Jfcm9sZSBuZXh0X3JvbGUpDQoNCk1pbm9yIG5p
dDogVGhlcmUncyBubyBub3RpZmllciBoZXJlLCBjYW4gd2UgcmVuYW1lIHRvDQpkd2MzX3Fjb21f
cHJlX3NldF9yb2xlKCkgZm9yIGNsYXJpdHk/DQoNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19xY29t
ICpxY29tID0gdG9fZHdjM19xY29tKGR3Yyk7DQo+ICsNCj4gKwlpZiAocWNvbS0+Y3VycmVudF9y
b2xlID09IG5leHRfcm9sZSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJaWYgKHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQocWNvbS0+ZGV2KSkgew0KPiArCQlkZXZfZGJnKHFjb20tPmRldiwgIkZh
aWxlZCB0byByZXN1bWUgZGV2aWNlXG4iKTsNCg0KTWlub3Igbml0OiBzaG91bGQgdGhpcyBiZSBk
ZXZfZXJyPw0KDQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwlpZiAocWNvbS0+Y3VycmVu
dF9yb2xlID09IFVTQl9ST0xFX0RFVklDRSkNCj4gKwkJZHdjM19xY29tX3ZidXNfb3ZlcnJpZGVf
ZW5hYmxlKHFjb20sIGZhbHNlKTsNCj4gKwllbHNlIGlmIChxY29tLT5jdXJyZW50X3JvbGUgIT0g
VVNCX1JPTEVfREVWSUNFKQ0KPiArCQlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNv
bSwgdHJ1ZSk7DQo+ICsNCj4gKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHFjb20tPmRldik7
DQo+ICsJcG1fcnVudGltZV9wdXRfc3luYyhxY29tLT5kZXYpOw0KPiArDQo+ICsJLyoNCj4gKwkg
KiBDdXJyZW50IHJvbGUgY2hhbmdlcyB2aWEgdXNiX3JvbGVfc3dpdGNoX3NldF9yb2xlIGNhbGxi
YWNrIHByb3RlY3RlZA0KPiArCSAqIGludGVybmFsbHkgYnkgbXV0ZXggbG9jay4NCj4gKwkgKi8N
Cj4gKwlxY29tLT5jdXJyZW50X3JvbGUgPSBuZXh0X3JvbGU7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIGR3YzNfcWNvbV9ydW5fc3RvcF9ub3RpZmllcihzdHJ1Y3QgZHdjMyAqZHdjLCBib29s
IGlzX29uKQ0KDQpNaW5vciBuaXQ6IGNhbiB3ZSByZW5hbWUgdG8gZHdjM19xY29tX3ByZV9ydW5f
c3RvcCgpDQoNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19xY29tICpxY29tID0gdG9fZHdjM19xY29t
KGR3Yyk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFdoZW4gYXV0b3N1c3BlbmQgaXMgZW5hYmxlZCBh
bmQgY29udHJvbGxlciBnb2VzIHRvIHN1c3BlbmQNCj4gKwkgKiBhZnRlciByZW1vdmluZyBVREMg
ZnJvbSB1c2Vyc3BhY2UsIHRoZSBuZXh0IFVEQyB3cml0ZSBuZWVkcw0KPiArCSAqIHNldHRpbmcg
b2YgUVNDUkFUQ0ggVkJVU19WQUxJRCB0byAiMSIgdG8gZ2VuZXJhdGUgYSBjb25uZWN0DQo+ICsJ
ICogZG9uZSBldmVudC4NCj4gKwkgKi8NCj4gKwlpZiAoIWlzX29uKQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNvbSwgdHJ1ZSk7DQo+ICsJ
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShxY29tLT5kZXYpOw0KPiArfQ0KPiArDQo+ICtzdHJ1
Y3QgZHdjM19nbHVlX29wcyBkd2MzX3Fjb21fZ2x1ZV9vcHMgPSB7DQo+ICsJLnByZV9zZXRfcm9s
ZQk9IGR3YzNfcWNvbV9zZXRfcm9sZV9ub3RpZmllciwNCj4gKwkucHJlX3J1bl9zdG9wCT0gZHdj
M19xY29tX3J1bl9zdG9wX25vdGlmaWVyLA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGludCBkd2Mz
X3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1
Y3QgZHdjM19wcm9iZV9kYXRhCXByb2JlX2RhdGEgPSB7fTsNCj4gQEAgLTYzNiw2ICs2ODMsMjMg
QEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlpZiAoaWdub3JlX3BpcGVfY2xrKQ0KPiAgCQlkd2MzX3Fjb21fc2VsZWN0X3V0bWlf
Y2xrKHFjb20pOw0KPiAgDQo+ICsJcWNvbS0+bW9kZSA9IHVzYl9nZXRfZHJfbW9kZShkZXYpOw0K
PiArDQo+ICsJaWYgKHFjb20tPm1vZGUgPT0gVVNCX0RSX01PREVfSE9TVCkgew0KPiArCQlxY29t
LT5jdXJyZW50X3JvbGUgPSBVU0JfUk9MRV9IT1NUOw0KPiArCX0gZWxzZSBpZiAocWNvbS0+bW9k
ZSA9PSBVU0JfRFJfTU9ERV9QRVJJUEhFUkFMKSB7DQo+ICsJCXFjb20tPmN1cnJlbnRfcm9sZSA9
IFVTQl9ST0xFX0RFVklDRTsNCj4gKwkJZHdjM19xY29tX3ZidXNfb3ZlcnJpZGVfZW5hYmxlKHFj
b20sIHRydWUpOw0KDQpTaG91bGRuJ3QgeW91IGRldGVybWluZSBpZiB0aGVyZSdzIGNvbm5lY3Rp
b24gYmVmb3JlIHNldHRpbmcgdmJ1cyB2YWxpZD8NCg0KVGhlcmUgYXJlIGEgY291cGxlIHRoaW5n
cyB0aGF0IHNlZW1zIGF0IG9kZCB0byBtZToNCjEpIFR5cGljYWxseSB3ZSB1c2UgInZidXMgb3Zl
cnJpZGUiIHRvIGRlc2NyaWJlIHRoZSB2YnVzIGNvbnRyb2wgb24gaG9zdA0KICAgdG8gdHVybiBv
bi9vZmYgdmJ1cy4gV2hlcmUgYXMgaGVyZSwgdGhlIHZidXMgb3ZlcnJpZGUgaXMgdXNlZCBmb3IN
CiAgIHZidXMgdmFsaWQgaW4gZGV2aWNlIG1vZGUgZm9yIHZidXMgZGV0ZWN0aW9uLg0KDQoyKSBJ
dCBzZWVtcyBsaWtlIHlvdSBhbHdheXMgZW5hYmxlIHZidXMgdmFsaWQgd2l0aG91dCBjaGVja2lu
ZyBmb3INCiAgIGNvbm5lY3Rpb24gc3RhdHVzLiBZb3UgYWxzbyBzZXQgdmJ1cyB2YWxpZCBldmVu
IGlmIGl0J3MgaW4gaG9zdCBtb2RlLg0KICAgT25seSB3aGVuIHRoZXJlJ3Mgcm9sZS1zd2l0Y2gg
YXdheSBmcm9tIGRldmljZSB0aGF0IHlvdSdkIGNsZWFyIHRoZQ0KICAgdmJ1cyB2YWxpZC4NCg0K
QnV0IEknbSBub3QgZmFtaWxpYXIgd2l0aCB5b3VyIHBsYXRmb3JtL2Rlc2lnbiwgc28gSSBjYW4n
dCBqdWRnZSBtdWNoIG9uDQp0aGUgYWJvdmUuIEJhc2Ugb24gdGhlIGRlc2NyaXB0aW9uIHByb3Zp
ZGVkLCBJIGRvbid0IGV4cGVjdCBmdW5jdGlvbmFsDQppc3N1ZXMgZnJvbSB5b3VyIGltcGxlbWVu
dGF0aW9uLg0KDQpJIHRoaW5rIHRoZSBjb21tZW50cyBhYm92ZSBzaG91bGQgbm90IGJlIGJsb2Nr
aW5nIHlvdXIgY2hhbmdlLg0KDQpXaGV0aGVyIG9yIG5vdCB5b3UgZGVjaWRlIHRvIG1ha2UgdGhl
IHVwZGF0ZXMgZm9yIHRoZSBtaW5vciBuaXRzLCBoZXJlJ3MNCm15IGFjazoNCg0KQWNrZWQtYnk6
IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA0K
DQo+ICsJfSBlbHNlIHsNCj4gKwkJaWYgKChkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwg
InVzYi1yb2xlLXN3aXRjaCIpKSAmJg0KPiArCQkgICAgKHVzYl9nZXRfcm9sZV9zd2l0Y2hfZGVm
YXVsdF9tb2RlKGRldikgPT0gVVNCX0RSX01PREVfSE9TVCkpDQo+ICsJCQlxY29tLT5jdXJyZW50
X3JvbGUgPSBVU0JfUk9MRV9IT1NUOw0KPiArCQllbHNlDQo+ICsJCQlxY29tLT5jdXJyZW50X3Jv
bGUgPSBVU0JfUk9MRV9ERVZJQ0U7DQo+ICsJfQ0KPiArDQo+ICsJcWNvbS0+ZHdjLmdsdWVfb3Bz
ID0gJmR3YzNfcWNvbV9nbHVlX29wczsNCj4gKw0KPiAgCXFjb20tPmR3Yy5kZXYgPSBkZXY7DQo+
ICAJcHJvYmVfZGF0YS5kd2MgPSAmcWNvbS0+ZHdjOw0KPiAgCXByb2JlX2RhdGEucmVzID0gJnJl
czsNCj4gQEAgLTY1MCwxMiArNzE0LDYgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIHJlbW92
ZV9jb3JlOw0KPiAgDQo+IC0JcWNvbS0+bW9kZSA9IHVzYl9nZXRfZHJfbW9kZShkZXYpOw0KPiAt
DQo+IC0JLyogZW5hYmxlIHZidXMgb3ZlcnJpZGUgZm9yIGRldmljZSBtb2RlICovDQo+IC0JaWYg
KHFjb20tPm1vZGUgIT0gVVNCX0RSX01PREVfSE9TVCkNCj4gLQkJZHdjM19xY29tX3ZidXNfb3Zl
cnJpZGVfZW5hYmxlKHFjb20sIHRydWUpOw0KPiAtDQo+ICAJd2FrZXVwX3NvdXJjZSA9IG9mX3By
b3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsICJ3YWtldXAtc291cmNlIik7DQo+ICAJZGV2
aWNlX2luaXRfd2FrZXVwKCZwZGV2LT5kZXYsIHdha2V1cF9zb3VyY2UpOw0KPiAgDQo+IC0tIA0K
PiAyLjM0LjENCj4gDQo=

