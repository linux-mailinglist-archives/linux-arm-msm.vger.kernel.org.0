Return-Path: <linux-arm-msm+bounces-62120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A3AE57FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B8C1C2604E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF0422A7E5;
	Mon, 23 Jun 2025 23:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ko9QeDXH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Owl/3Aeu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IChMDu3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078141ADFFE;
	Mon, 23 Jun 2025 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721092; cv=fail; b=n8S8x8i9nk2h9h0ac27R4XX1CTjFGYUOhwmKmoCeuvnZN6r0DbPZSGwk3DHPd0I1GxtRC9xO9FxsvacReWTFo9G7d6SlM/ekau/djrVfI548r4J06kYIk8Un5Sasy1AbzvQVXT3ZamsM2rtuiMnBKW7ld09SfCUnHgLJOOHQlSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721092; c=relaxed/simple;
	bh=Wg1rBkJrVPOCCs2xbuzF18LiKLNzvg1AIib0anQjfOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NUEcLuJDGVwToX9x1A94f+klF5/HalfaKRsyQn7dRpW2nDuH2CyYI6q5wb5mh4ooBVi6kdBqne8lQcBe/UTv5F6NCN2TVX+OzN6ykzBSAs1ASZWnCVf5ROgHCrdi3r3aDQjqt0DfWWBG0fjA82Z7R7T17lba1hdUHcy8wPfAE5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ko9QeDXH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Owl/3Aeu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IChMDu3b reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWCjT024229;
	Mon, 23 Jun 2025 16:24:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Wg1rBkJrVPOCCs2xbuzF18LiKLNzvg1AIib0anQjfOU=; b=
	Ko9QeDXHrKhZQXEBg0+GkzSdfK1MZVxdNxvV61AdYPZqLF+10j5NvKus9HAG/p/Q
	BdpJpIx5DeM8SDMjqCx/5GOoa8wqfOsQkLtSNKSuQkddihusZjj7x2jqKHkeMEZI
	DIsrL1bKFl8yVLKN332JceNvAFc0eSGesfeXqE68/jMq0WlhJ2TFhmFQ9itOz2uh
	RzbaFTfqksuTkY2j58ce8Ho7ScCkNIxYVD3Mc8lJqLD7Ozjs+JZ9+xfJIGDDk5DB
	2dA2YyzSZYBSd30fFrAcFxnT+zegL9FTMWRoQQdIeCu/a7g7LQ5OANfHimdlbVAx
	6uetdV9KPRaHGDEq/jcXMQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 47ducgfybf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 16:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750721086; bh=Wg1rBkJrVPOCCs2xbuzF18LiKLNzvg1AIib0anQjfOU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Owl/3Aeuaw5SefHyzwduG/zjmVlx6CSV5ugBvvVUX8H3mgERxZUeHLhS9EG16OrUy
	 j92MvRJ10HychQS+b03HHePdSGGumJppZNm/9fqrIwCX9SntfSyvdtv1l4B9TQd4M9
	 48Pe1lau8apQNueY4T1EVRtGKWlck5Az/nfkmO1gHpkngQ1swmcOrgyzec3YCSko6Z
	 JfaGjEkpJym53l88YMqLkGfHfCo6wkzi+Xwcy8rfMTijWqjC/Coo/+I9RSm2FosGHK
	 /gKn2V+aRyzAoOkXhzCbMuvMZmeUuiyUiWXtE9EiiiziiBFdBj2yVsc4IwVGEipaM+
	 XP6r64El98Ubw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 003CF4034A;
	Mon, 23 Jun 2025 23:24:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6CD01A0083;
	Mon, 23 Jun 2025 23:24:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IChMDu3b;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5F65D40143;
	Mon, 23 Jun 2025 23:24:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu7XTi9k4ek0WQbt8T3TnJ1GbjGk/eHTwU6+3XuIUnF9E9cbwe33I2zx2yNxqbkne4LKg07RixYwhtWvThj15H2cviLZN3t8lrs4lERmA/ePMMDh2VG+hk3Pb/1Uxdf6obHVxJBCOITQP/nz6y5ggcSQV6iYplp0thTgimnk6L+nbxa+ELrMSbG+G/aIryXfPLr9uQyvTvTZenOS3OK/RXvk4b/UNvTDnaaXfOva9fZ0/WtY1KQaKHq4UQP99Q1QSfCgp9yRL0Q/4JD7f126a8XS9QY1nly7+Z6nXRbehfC1d4dsjTuSCo+JLSV1BsLQPzFKxVNRYztZMm4WJODlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg1rBkJrVPOCCs2xbuzF18LiKLNzvg1AIib0anQjfOU=;
 b=mGJ9Fl4km7eOLq49j/IOQjbYcAdl/GTKVyknPuQuHPvxuEdHQ5rpeJ8MmR03beBDAXoW6l0PkVofQ8z5PvBiqOuu14lfOzNWbBorsIJCgf7G/72vxwneV1mRyPvWI5G0XRBe+PbEklPZ3MW1R3/Zuo4cR6iwGYCczb2zL4Yd8Qrv+KhP7y+Rm2VSKMnlrIIA+R58u5hbiAzGQujIK1XXoel3qh7RERVldyzeJMCW643lsnNyqv06fXYCJ23QxP5LLho2HeZ+zHHSDENK1BsflE1Obd3xqU/xDSQvKNoRXTKhMezLx9al6Rx6wSu+n9bgP4R5aKlco+2JC8S4A+06/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg1rBkJrVPOCCs2xbuzF18LiKLNzvg1AIib0anQjfOU=;
 b=IChMDu3b0Bne5JxKD4lLTNR75HlVKOqXryaEVOHUhJzc/6838LkXrnEGKA/h77eS+24tHs+KQ3WqDKk/CJmeUhhmJstHAlRA79oBopNfvlI7TQAqsD2vDgQdbDhgd7fmX9M4yI3S9B5J684EI0D1YA3Cnu7Xha++BbDdNPbKG/U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 23 Jun
 2025 23:24:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:24:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Topic: [PATCH v2 1/4] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Index: AQHb2egKJtlrelB7lU6Yt8ediWYrnLQReCOA
Date: Mon, 23 Jun 2025 23:24:40 +0000
Message-ID: <20250623232433.apv23svbaql7ce4u@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-2-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-2-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8983:EE_
x-ms-office365-filtering-correlation-id: a9904e13-19a6-4fa2-68ea-08ddb2ad20e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SEpjVk9BcTUrVE9OVjJPaE1kbi9tWVk0dEdyc2xsdldPZFhhYkRGUFNZT3Z0?=
 =?utf-8?B?MVR5UjZNeDNsQkNyeXBiUjVXT3pLWjRHbEdGaGl2Z3V6SHFSZHdNN0ZCK3RN?=
 =?utf-8?B?SVVpVHVpQWVQNzlaUjJNQjd0MUt3ZTFXSWhjdFlxQmVsdE4zUWN0ZWgyTnBo?=
 =?utf-8?B?T0Y0bDg4V3gycUNqKzhvNWFEb0psdG9MeXdoVGg5ak50WXNPVVp1RmQrUDNo?=
 =?utf-8?B?L3dSbGd5ZDhxcFhsU2JvVWQ3dld3UStuNFExaWFoZWxwRXArV2dYOWdVWTRN?=
 =?utf-8?B?NjRPQWc1a2UzQnpMOGQ0NExXQkVvUXhDaVpoNzdaUDAyVklFbTVoa01IcEtC?=
 =?utf-8?B?UEN6ODF0MTUxVVlHNVJIYXJsdnRBdnV4UzhDQlVTVG1JeUtxbUo5Q0xwWXRN?=
 =?utf-8?B?SU5MVHY5ZW5BUytFSHFFYTFsREJNUE85MXVON29IM0hLU05ZY2tLRSszb2xr?=
 =?utf-8?B?aEhUUTBPa2RnTlFDVXRvRHB6Z2Yza3E1d0NUclE3aXdaNjBadzFVL2phQm15?=
 =?utf-8?B?UStNK0xOWjhNR01DVjdBU21TZDZpR3Ftd2svb3hWRTVqczkrVkRWTVd2UjRD?=
 =?utf-8?B?MEtLbi9qRmRqaTYxcm02dmltZGdsWGxKdjFDOGRoaU9xOVNKWmQ2VWtkRnNn?=
 =?utf-8?B?NGJvUGhBNUJmV2ROOTRlbWlYMjg1RTFyTmpUVWRsMlVJekhydTgxMnBBK1Rv?=
 =?utf-8?B?MGlobXRDRGtSZG0wQmFmRkZtemJaWTBDbTlkV2NscDQrT0dXVHVzR0ZreVBv?=
 =?utf-8?B?TmNxRDhRbmNUM3BMOGI2QldtRTk5YzNqL0VHcDloK214TzFIMU1mamF0aitQ?=
 =?utf-8?B?ekFkZFM3RTZieE1kMVRSYnlwWVlGbzhOQi92a1NNM0RwYmFyaHlkV29GaHlN?=
 =?utf-8?B?bFg3NFVOQnp0RDFXVnBNbStpZ3cwemFPdTJJdmdiTDJ4cWtFN0F0NWt1VEVX?=
 =?utf-8?B?ZWFKTW50NmpPMXU1eVVQWGptUjBvblJKRmRBVXVPeGtxcnZnUHIvOWNiL3NL?=
 =?utf-8?B?S3l3VG9ib05tbkJqRldmMnNOSTVmSTRaeXYyY1E2QVorM2FVUGhCdG5Xek1G?=
 =?utf-8?B?UmpHb1paMmdHUlRDZ3RtUGVORGRNc0RpcUhJc0VIaVN2QklvMFh4YkQ0dTBT?=
 =?utf-8?B?TnNPZ2FGeERIZzJYcFdGTlA0L2VZUFhUb3lYdm13QlM5emNUaUhOUi90TnVj?=
 =?utf-8?B?NUppRUN6NUNpZ0J1WmhiMVVrRmI3ZVNvblhDU0VTZ0pSVkErQnZzMGVvTnQ0?=
 =?utf-8?B?ZUpadm1NNlBQREd4VzVLSzE5S1BWVW5zVFNNNFYrYUkwK3B6RHlXelF6YU9I?=
 =?utf-8?B?aEtYTTBWd2s5NURpQk9iZ09DbHJRT1BvVTZKSURPVVZ0L3orMUMrQ2txVjRn?=
 =?utf-8?B?b3dCTXBaTVM3M0lQSjZucUV2NTRKRVB1WGFLNkp0clAvTWhDV25XSHdLek1J?=
 =?utf-8?B?TGl3Rm05dFFtUnBMNUJvYy9CRW1vZ2Q1Sk8yNnkyaWxtOFlXVE5XdUhsc1E0?=
 =?utf-8?B?VGdibFVJaHcxM1RLVUpoVW9jZ1YwV3F3QklmemtLNTh4U2MzcHZNQkZ1eGpE?=
 =?utf-8?B?ZEYwNUYxQkR2REZTb2VUbWZyV2MrWjZEK21ma2xmbUtjdDF1VEZNSG9xdytt?=
 =?utf-8?B?MzhXa3FaTndncnFtaUNjajltbTA1Z1NXL21QekdDOHZ4UlBqaURwejZKS3dU?=
 =?utf-8?B?dzc4Q3JBRm5OYlpwcldXUUZkOU94aXNYaWE5TjZSL1paeUpYNEhlZnhtTEUv?=
 =?utf-8?B?RDZkMmVnUmRCZEJHeE83WXk4UGxPczRXQ0RNWEhERHJxODZaOWJlMWhpZ09n?=
 =?utf-8?B?Z3FEaFF6d0RsdTVsbnB3b1Y4aHQxWWVsNzBZdnMxSEgxbmhrWHBvVlUrR05h?=
 =?utf-8?B?dnhoazRBRjlYR3RGOXN4QStRb0VQZmVRSzFnL2xNVjRnbkhudXhib1NnSjUy?=
 =?utf-8?B?QjZuV09QWEUvNklrTXFsSEMyLzhZTHEvdUR0dy9pVktUK1I3QTMzUTUwSDF6?=
 =?utf-8?Q?tRL8++yjp/8o9LUPOYA++08O/GQhFE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c08zb0pIUkxYSHRPb1VRN3hiMjhXWUFTZDRHSmFoZElCR05VeWhDeGRDR29O?=
 =?utf-8?B?THBIbnRsWHBwa1Y4Q1o1ZDVENi91Mms0bzZ5WUpNZC9qQlJibWIzTGlzcCsv?=
 =?utf-8?B?VThDektSdHN0SVJpSFA3VFpsbTdRMjR0SDc2aGVIT2ZaSzFhcUtEVVFPWWR5?=
 =?utf-8?B?TjZObUhZaFpJOFF1ZTQ1a3p5Q3Z2T0t1NEhRRGlJTnQ5dHNTTU4vOG02VVZE?=
 =?utf-8?B?dUh1NDlxbEFqMUhRZ2Rhc3ljVWNpb0VzSE14SFZPajFlUitvdnJHdE5jWldu?=
 =?utf-8?B?QzhYWEhKL3BpbTlhQ0k3VjNDYWJDMElkOEdESTFrdTZHVGR1KzZnU2Z0SEpW?=
 =?utf-8?B?Qks2OW11RWxNY0FMTWJBdmY3dkxzMVN1ZGJYV0FmOS95MkZtM3FZeEFhTDJ3?=
 =?utf-8?B?ZWlqRnpPZWNmZVpjRUQzTzdWeWxXWmpOU2VTZGx0T2poM3ZQWk9FcG1GN2ZK?=
 =?utf-8?B?KzVZWnlUMllKUXB1UzB4RmZZMHZUbnV4OGZEOHAwOTZaQ0NFd3VYK3FwOUNO?=
 =?utf-8?B?amlrKzRSczRQRmxoRTBiMVZlc1djR0g0MGk2N0ZhZVg2TGRXaXh3dEdkREs2?=
 =?utf-8?B?N0NVK0oySm1MNEN3blhjZzRjWTh3ZXlhODRkVG1sZGorVlBYcWlWSkg2a3Fp?=
 =?utf-8?B?bGpxQXR1REk0RXZyVUozYlRUT01wRVdSNm81ZmhJaDcweDFFcngvV3c5bTJo?=
 =?utf-8?B?cm5Bb1N3dmF2dU8rUlp4TldNYjNqcnhWK3MwYUZuL0EzeVExVkZwVDlYUkF0?=
 =?utf-8?B?MkFMQUlxbExlSCtKZGk5ZS9NUzk1a2loVUNxa1UyYm1QVUszMXRCZUk0RFdj?=
 =?utf-8?B?aEMrbzk0SWVPa3EvaFl6ZDMxdUlROU9WUkZCNmZ2ZERQRWY5QXRXZTVSZzRI?=
 =?utf-8?B?a2p1cWc2NWtGdUFsc2M1Q3gxWFRpK2Uxb1B1enRaR2pjVktOOVpDRGZmSVJp?=
 =?utf-8?B?REVBcmN0ajBBOUovM080dGNlRU9iSVEvVExrWE9qMEJhWTdiMzAxNzZVTko3?=
 =?utf-8?B?VlNBZ1JpdmQxRFVRZ1JIU2ZxQ2FocENQMHAyUCtXdFM5bDBQY1VrNE1VWUps?=
 =?utf-8?B?dTVqT0laWitraVVMTVhVckZuVHNxYkp5ak40VHkrL1E5RVg2MTZWeTJ4RVBI?=
 =?utf-8?B?MUlJSnl1QkFBdGFZVUJmd1o5S0Z0MjdERjBabzZ2UDRZcXd6b3hweHcxbzJG?=
 =?utf-8?B?T2tYaTNBUEozZmlqQitseWFkdzd2Q2dXV051cnM4WVFtSkMxNW5mdTBNakY3?=
 =?utf-8?B?eGc4Skk3T29VMmNQdzdZTWpHeUdpanhIYnM1bTJOS2dTa0YzWGZwMy9KMW5y?=
 =?utf-8?B?R2Z3UUo1dzdSVGFLNTF4bWZ5MmZuUjRJL0JkMVZoM2dBOUwzN3NxeVE2OUdP?=
 =?utf-8?B?SHJnVDhwUlArSkZsRVRtRTIydkFQOEtpRFV4NDhCaWNXTjE2UHdNQXF4eUsz?=
 =?utf-8?B?V1VBUFhRSzIvTDdUVlliMzg0KytPS0lMckhoSytMaThoK3AvM0sreUdCRGVK?=
 =?utf-8?B?L2hVUmw0QlhtR2JwbStzMzI2VWZab2VPUmxFYWRtQksyWjJmdWtpODMxZ2ZE?=
 =?utf-8?B?S3g3U3RmVEc3Z3BkcndTbEFiaUxPRGhXa1RLV3o4cDl2QXUxRllyQ1RTRito?=
 =?utf-8?B?TER0TUV3aGwxRFg1eGh4SGl6NkhXVVdmNVB0TGtxdmRtTWNHZG9wSnphdVZ0?=
 =?utf-8?B?RzFxNkZYYnhuUDVzSUh5QXBYZ0NYYUZYc2RZMEtCaDdBOFMybER6Z2ZoWEl4?=
 =?utf-8?B?UWdHZkJYR0RsM2x4L1hDbGNVanhsUGxUcXpSZUtWTExUUFN3WFBKMGxIME41?=
 =?utf-8?B?b0NRM3pUL0YzeEg3WnlQWGs1M0IxcUZNNXdROHBkdlNVSitoaVN5bnJaWWtC?=
 =?utf-8?B?eWM0OGdMTDg5Q0pGaVd5TW4wSXZZNmlIKzFHbDA5U2JPQ0ZKQW8ybzRtMTNV?=
 =?utf-8?B?Q1ozUXp6Z0RIR0x5MXdPOS8vZml0NjBPeVlBbzZGbklUdmh4N2dhbktjTWNj?=
 =?utf-8?B?ME9YWFVaRmJkSlo2bjI3YS8zZTRJNEVoZ1piL080bEFYMU43bU5SeXpJa0tS?=
 =?utf-8?B?Vi9veWNMZ1NWRVFIenMxdEpDa0VmUEhLWGZjTmZ6cGtLYXRQWHliRTc4UE90?=
 =?utf-8?Q?p0VzAXZ+Nf1neeObmxxCImueL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFD28D0EA56FB44BAB4848CA506E236A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qcgxWPwHofyletKujWbn6dyT8gG4UvYRae3Ucqn8/jMmFE0ntYqHL0Vo/d0i9HQvEi4HSvvy7xiaZGpM/XVoFbmNwCahEu77Q0Mws6oOp1FJldP/+hehwxi+6jxYjmGieh1qj2W6QL8bXMFPNzGxa6pbXpniGHUrwaLu4luqVLKQ2Pp9d3rx88i5K+yGHuPKHF5h6zBiOPIxb9LN+o5DteEstA66Iic2rv2gyglwL8RMTwEJl/22blxaVWeNeavO2M6d89/Ypxj46pUgSQNXsaqvAW/NGzfNUz6A6L+ZeFy2lCiiEqf1JFLVowZPXrndC+j0MJ3GSC8RVCI4v8r1gbEJpgOctsqO7ZbjCp075D9eWq+0jyzc4ApASJ40nPMcH06lzHh4NeoOhclkGkKb0dh13/A55NMDn8kjiDeGiyKJbzZTWHxlV1iDgN0A2VdlSknXbshp5hviSFQq3wQYDDoc0o5TGVTXh2tBvo2geCmE1FTu29tfVOs6c4+kePnGvT5B+Jg0ptYj8Yk7Q8CxNmkCFOerpm/wyblDuz5W91XkO5494Sk+4eq6nmQGlTMEzMjpyohvlgW0Qy4lbaqr2w4UTjaTHuObUASW6mPIK9mtAsoW6LxBI/qQk5pjmZudEdVRajawxKIbpQKagsYPgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9904e13-19a6-4fa2-68ea-08ddb2ad20e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 23:24:40.7312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvKLzheHvVIwEjtIt6aVUDXvLk4iTkHYEp0D02UyGXvwqmzkZYQihrvY2DoW6eaeoaqBZp5SFmlE4OWPULBu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2MSBTYWx0ZWRfX9EmAHQ+9grfI
 xLgNJRD/d2CqqFAeB0AYObWa1obMDo0uCkFyxUH7B0LOGehEjH3amcP1WGgtpYtAoCOQwUoSBrV
 z7lKNMhZBAw8rniRcDJ0beWpD1fQA707MOkYfjBkeYNWU0Qpdlc3dXXkVesAd+6VbRsCdON+hl/
 ukNSJz1rtYfKV8EyJwoAC8Tae968imdObEyzDPLok67UypLICBK5MldjqbrhgjXpCJAaZ3qCleP
 XJ3UiYtYDnN9sFOFP/J4iSUrllyfEDP595MhhDAhmpilQRvY0GGGzT0QXOwStQhoj8spuTZGiYi
 tGuTlUtDlHiErv6L4BZbfFZz+AHK9hfUN+M14F6De4xAEM0doh8BtBXgNt6PLdVwOF7SdGnTmFi
 1th0U/VHCsdxLuXq6SQGh+RArDC62En8zaM9uApuHvdcBK0GBfEzg6dy88kjFhZE2Rdpj0mj
X-Proofpoint-ORIG-GUID: I2E6ZE3qiFfWFTU9l6PffoiFzEK8s0a9
X-Proofpoint-GUID: I2E6ZE3qiFfWFTU9l6PffoiFzEK8s0a9
X-Authority-Analysis: v=2.4 cv=KMdaDEFo c=1 sm=1 tr=0 ts=6859e23f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=-Jf55NlbPI-lzkNXMm0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506230161

T24gVHVlLCBKdW4gMTAsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IEluIGNlcnRh
aW4gc2l0dWF0aW9ucyBsaWtlIHJvbGUgc3dpdGNoaW5nLCB0aGUgZ2x1ZSBsYXllcnMgbmVlZCB0
byBiZQ0KPiBpbmZvcm1lZCBvZiB0aGVzZSBldmVudHMsIHNvIHRoYXQgdGhleSBjYW4gdGFrZSBh
bnkgbmVjZXNzYXJ5IGFjdGlvbi4NCj4gQnV0IGluIG5vbi1mbGF0dGVuZWQgaW1wbGVtZW50YXRp
b25zLCB0aGUgZ2x1ZSBkcml2ZXJzIGhhdmUgbm8gZGF0YSBvbg0KPiB3aGVuIHRoZSBjb3JlIGRy
aXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBwb3N0IGludm9raW5nIG9mX3BsYXRmb3JtXw0KPiBw
b3B1bGF0ZS4gTm93IHRoYXQgdGhlIGNvcmUgZHJpdmVyIHN1cHBvcnRzIGZsYXR0ZW5lZCBpbXBs
ZW1lbnRhdGlvbnMNCj4gYXMgd2VsbCwgaW50cm9kdWNlIHZlbmRvciBjYWxsYmFja3MgdGhhdCBj
YW4gYmUgcGFzc2VkIG9uIGZyb20gZ2x1ZSB0bw0KPiBjb3JlIGJlZm9yZSBpbnZva2luZyBkd2Mz
X2NvcmVfcHJvYmUuDQo+IA0KPiBJbnRyb2R1Y2UgY2FsbGJhY2tzIHRvIG5vdGlmeSBnbHVlIGxh
eWVyIG9mIHJvbGVfc3dpdGNoIGFuZCBydW5fc3RvcA0KPiBjaGFuZ2VzLiBUaGVzZSBjYW4gYmUg
dXNlZCBieSBmbGF0dGVuZWQgaW1wbGVtZW50YXRpb24gb2YgUXVhbGNvbW0NCj4gZ2x1ZSBsYXll
ciB0byBnZW5lcmF0ZSBjb25uZWN0L2Rpc2Nvbm5lY3QgZXZlbnRzIGluIGNvbnRyb2xsZXIgZHVy
aW5nDQo+IGNhYmxlIGNvbm5lY3QgYW5kIHJ1biBzdG9wIG1vZGlmaWNhdGlvbnMgYnkgdWRjIGlu
IGRldmljZSBtb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jp
c2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvY29yZS5jICAgfCAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHJkLmMgICAgfCAg
MSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCAyYmM3NzVhNzQ3ZjIu
LmMwMWIxNWUzNzEwZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIzNTEsNiArMjM1MSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQly
ZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAgCWR3Yy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlkd2Mt
PmdsdWVfb3BzID0gTlVMTDsNCj4gIA0KPiAgCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KPiAgCXBy
b2JlX2RhdGEucmVzID0gcmVzOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBkNWI5ODVmYTEyZjQuLmE4MDM4
ODRiZTRlZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTk5Miw2ICs5OTIsMTcgQEAgc3RydWN0IGR3
YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAJX19sZTY0CWRtYV9hZHJbRFdDM19NQVhfSElCRVJf
U0NSQVRDSEJVRlNdOw0KPiAgfTsNCj4gIA0KPiArLyoNCg0KTGV0J3Mga2VlcCBjb25zaXN0ZW50
IHdpdGggdGhlIGRvYyBzdHlsZSAvKioNCg0KPiArICogc3RydWN0IGR3YzNfZ2x1ZV9vcHMgLSBU
aGUgb3BzIGluZGljYXRlIHRoZSBub3RpZmljYXRpb25zIHRoYXQNCj4gKyAqCQkJCW5lZWQgdG8g
YmUgcGFzc2VkIG9uIHRvIGdsdWUgbGF5ZXINCj4gKyAqIEBub3RpZnlfc2V0X3JvbGU6IE5vdGlm
eSBnbHVlIG9mIHJvbGUgc3dpdGNoIG5vdGlmaWNhdGlvbnMNCj4gKyAqIEBub3RpZnlfcnVuX3N0
b3A6IE5vdGlmeSBydW4gc3RvcCBlbmFibGUvZGlzYWJsZSBpbmZvcm1hdGlvbiB0byBnbHVlDQo+
ICsgKi8NCj4gK3N0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gKwl2b2lkCSgqbm90aWZ5X3NldF9y
b2xlKShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpOw0KPiArCXZvaWQJKCpu
b3RpZnlfcnVuX3N0b3ApKHN0cnVjdCBkd2MzICpkd2MsIGJvb2wgaXNfb24pOw0KDQpVc2UgcHJl
XyBvciBwcmVwXyBwcmVmaXggaW5zdGVhZCBvZiBub3RpZnlfIGluZGljYXRpbmcgY2FsbGJhY2tz
IGZvcg0KZ2x1ZSBkcml2ZXIgdG8gcGVyZm9ybSB1cGRhdGVzIGJlZm9yZSBzZXRfcm9sZSBvciBy
dW5fc3RvcC4NCg0KPiArfTsNCj4gKw0KPiAgLyoqDQo+ICAgKiBzdHJ1Y3QgZHdjMyAtIHJlcHJl
c2VudGF0aW9uIG9mIG91ciBjb250cm9sbGVyDQo+ICAgKiBAZHJkX3dvcms6IHdvcmtxdWV1ZSB1
c2VkIGZvciByb2xlIHN3YXBwaW5nDQo+IEBAIC0xMTY4LDYgKzExNzksNyBAQCBzdHJ1Y3QgZHdj
M19zY3JhdGNocGFkX2FycmF5IHsNCj4gICAqIEB3YWtldXBfcGVuZGluZ19mdW5jczogSW5kaWNh
dGVzIHdoZXRoZXIgYW55IGludGVyZmFjZSBoYXMgcmVxdWVzdGVkIGZvcg0KPiAgICoJCQkgZnVu
Y3Rpb24gd2FrZXVwIGluIGJpdG1hcCBmb3JtYXQgd2hlcmUgYml0IHBvc2l0aW9uDQo+ICAgKgkJ
CSByZXByZXNlbnRzIGludGVyZmFjZV9pZC4NCj4gKyAqIEBnbHVlX29wczogVmVuZG9yIGNhbGxi
YWNrcyBmb3IgZmxhdHRlbmVkIGRldmljZSBpbXBsZW1lbnRhdGlvbnMuDQo+ICAgKi8NCj4gIHN0
cnVjdCBkd2MzIHsNCj4gIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QJZHJkX3dvcms7DQo+IEBAIC0xNDAw
LDYgKzE0MTIsOCBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IGRlbnRyeQkJKmRlYnVnX3Jv
b3Q7DQo+ICAJdTMyCQkJZ3NidXNjZmcwX3JlcWluZm87DQo+ICAJdTMyCQkJd2FrZXVwX3BlbmRp
bmdfZnVuY3M7DQo+ICsNCj4gKwlzdHJ1Y3QgZHdjM19nbHVlX29wcwkqZ2x1ZV9vcHM7DQoNClVz
ZSBjb25zdCwgYW5kIG1vdmUgdGhpcyBjbG9zZXIgb24gdG9wLiBQZXJoYXBzIGJlbG93IGdhZGdl
dF9kcml2ZXIuDQoNCj4gIH07DQo+ICANCj4gICNkZWZpbmUgSU5DUlhfQlVSU1RfTU9ERSAwDQo+
IEBAIC0xNjE0LDYgKzE2MjgsMTggQEAgdm9pZCBkd2MzX2V2ZW50X2J1ZmZlcnNfY2xlYW51cChz
dHJ1Y3QgZHdjMyAqZHdjKTsNCj4gIGludCBkd2MzX2NvcmVfc29mdF9yZXNldChzdHJ1Y3QgZHdj
MyAqZHdjKTsNCj4gIHZvaWQgZHdjM19lbmFibGVfc3VzcGh5KHN0cnVjdCBkd2MzICpkd2MsIGJv
b2wgZW5hYmxlKTsNCj4gIA0KPiArc3RhdGljIGlubGluZSB2b2lkIGR3YzNfbm90aWZ5X3NldF9y
b2xlKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSkNCj4gK3sNCj4gKwlpZiAo
ZHdjLT5nbHVlX29wcyAmJiBkd2MtPmdsdWVfb3BzLT5ub3RpZnlfc2V0X3JvbGUpDQo+ICsJCWR3
Yy0+Z2x1ZV9vcHMtPm5vdGlmeV9zZXRfcm9sZShkd2MsIHJvbGUpOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgaW5saW5lIHZvaWQgZHdjM19ub3RpZnlfcnVuX3N0b3Aoc3RydWN0IGR3YzMgKmR3Yywg
Ym9vbCBpc19vbikNCj4gK3sNCj4gKwlpZiAoZHdjLT5nbHVlX29wcyAmJiBkd2MtPmdsdWVfb3Bz
LT5ub3RpZnlfcnVuX3N0b3ApDQo+ICsJCWR3Yy0+Z2x1ZV9vcHMtPm5vdGlmeV9ydW5fc3RvcChk
d2MsIGlzX29uKTsNCj4gK30NCj4gKw0KPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0Mz
X0hPU1QpIHx8IElTX0VOQUJMRUQoQ09ORklHX1VTQl9EV0MzX0RVQUxfUk9MRSkNCj4gIGludCBk
d2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKTsNCj4gIHZvaWQgZHdjM19ob3N0X2V4aXQo
c3RydWN0IGR3YzMgKmR3Yyk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2RyZC5j
IGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiBpbmRleCA3OTc3ODYwOTMyYjEuLjQwODU1MTc2
OGE5NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2RyZC5jDQo+IEBAIC00NjQsNiArNDY0LDcgQEAgc3RhdGljIGludCBkd2Mz
X3VzYl9yb2xlX3N3aXRjaF9zZXQoc3RydWN0IHVzYl9yb2xlX3N3aXRjaCAqc3csDQo+ICAJCWJy
ZWFrOw0KPiAgCX0NCj4gIA0KPiArCWR3YzNfbm90aWZ5X3NldF9yb2xlKGR3Yywgcm9sZSk7DQoN
ClRoaXMgc2hvdWxkIGJlIGRvbmUgaW4gX19kd2MzX3NldF9tb2RlKCkuIFBlcmhhcHMgcmlnaHQg
YmVmb3JlIHNldHRpbmcNClBSVENBUERJUj8NCg0KPiAgCWR3YzNfc2V0X21vZGUoZHdjLCBtb2Rl
KTsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDMyMTM2MTI4ODkz
NS4uNzNiZWQxMWJjY2FmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI2NDEsNiArMjY0MSw3
IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfcnVuX3N0b3Aoc3RydWN0IGR3YzMgKmR3YywgaW50
IGlzX29uKQ0KPiAgCWlmIChzYXZlZF9jb25maWcpDQo+ICAJCWR3YzNfd3JpdGVsKGR3Yy0+cmVn
cywgRFdDM19HVVNCMlBIWUNGRygwKSwgcmVnKTsNCj4gIA0KPiArCWR3YzNfbm90aWZ5X3J1bl9z
dG9wKGR3YywgaXNfb24pOw0KDQpUaGlzIHNob3VsZCBiZSBkb25lIHJpZ2h0IGJlZm9yZSB3cml0
aW5nIHRvIERDVEwucnVuX3N0b3AuDQoNCj4gIAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywg
RFdDM19EQ1RMKTsNCj4gIAlpZiAoaXNfb24pIHsNCj4gIAkJaWYgKERXQzNfVkVSX0lTX1dJVEhJ
TihEV0MzLCBBTlksIDE4N0EpKSB7DQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkJSLA0KVGhpbmg=

