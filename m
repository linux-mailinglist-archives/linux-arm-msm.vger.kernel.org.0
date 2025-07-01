Return-Path: <linux-arm-msm+bounces-63165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 018ACAEF20F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAA2A7A2F00
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86212701CE;
	Tue,  1 Jul 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dSiSqfYB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WnzjtLeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AA26E71B;
	Tue,  1 Jul 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360241; cv=fail; b=O2hhtzrpjyMDieOaKRPJhhKrGUUXFAHJc2NQ325Wa7hpIKSOBcun8yGCEOFe6EV8k+8czKp5DN0lWPFfMwvb2JtDWLT+5voXrp8s2Idp13cYUI4m4Q21kK9Q7yLEwGTFU2sya+DrqyIbxYgpgVcEPhWhi6ikBSehNMqc8eMeOEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360241; c=relaxed/simple;
	bh=gKa15zuehVjVsfB1kIhZ9mo/g5NCUdNvzxAzE8l6+U0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CKWi+N9xd9FhcLMNUpLBJyIXfJcENpXbammHnOZtPMS9zEEsFbTOFUlA6/2Rh0bxs7IuikC1x325iqtDgU5YdmEU8o1J93O83sKjDIqdl/+NLqht8pg8jN0j4rq2Jbb0gNJI9iJVjSMpRA8WoQtlX/QBsW44YkMonIBth+mW8dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dSiSqfYB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WnzjtLeG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611Mlgt023852;
	Tue, 1 Jul 2025 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SlbSz/7eOM6pOLOSbN25mtjIfpjHsH4RxTD16Xrs2G0=; b=
	dSiSqfYBE5NW9syNPLO97qNCAECAnR1nOc8vO5Awxvff40eqhHLo7UxebUCz4sVe
	MsFSWttwJmI7wmcmn9/nnlQcNX2juFE24oEg54+TOHQdvTaX9SoTMknmyM1jR5Zu
	95ukDUisVs0pT8sU0gCYHZ1A4dXPnipYtuWkuOgsOI6QCIesa1gyw991zPl0fV9W
	hc4BO7qzLG89VoHYAD/pr9+RLLAWVG7xt/UAPvuFllTAGylhh8E51TCUTrTceOIz
	Z1lBgrBRVvFWSlE4RU+cJ8Jz81VbFE4OVgBfMMlcFX48ciZUG6JxE3Z3cZqw7HoG
	mErxMTxF9mxB93XtfPxEmg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef4ac7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:53:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56171IDY017418;
	Tue, 1 Jul 2025 08:53:31 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013071.outbound.protection.outlook.com [52.101.44.71])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1e7n90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THFDGEzdudmxc8zTE7CL6aJKIWbhtpb59GdFsOqa2VgKaU1IDiTdrFFudPBHpsupToo9GRhdhffJG12mwGQUsmO0iYoSus8Yll5uo5UrVyYgjXmF9N1G3Il0PRh7julzYVL1IyyZt4lSK8e+Z1JfLW2chYt3ZeEqeOLVLi+LvNtTq7EhbDCsgr4zvtKdePS14hFBtlr/7Mv6WDoCBlGd7VRlLFjddJk23qOB0rZYgwVAmhd8K7HNo16t+lDS74WpaEmAqBI9OTeHO+70xFq1yQkmm4bcYeqCtte5mCNV5/gadPKGJtZmAvtTKSrc7vnEYCVSvztJ589Hr7b4su9Jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlbSz/7eOM6pOLOSbN25mtjIfpjHsH4RxTD16Xrs2G0=;
 b=leyNVHBRYTftbZcY8Ud7HNKPqoJVOIeaeAJ6CqealrpoI50PjfblKKvdyYR/l0AiNrND82fd9a0iruzQEGkvbdFrdcbx9NEdsLQaP5KpxDrlEcUzbAM8uq3IP0oYJmUpnvBJ6rVnlIEVuxH6cbLLjgBSi7i8R2+uTGdSKfrAAn5cwd/GDERax4jzapbRKWXM+5CtxsvdC0ElFmZYKr3xyM5YiSIW72doDsSi+K0GvfEWBBr/kXwDQ4Sr0B5PqcsxXaqG8EnwkF+5eNhLMloTdhN/oByUTgItVlJ/OmfNMZAP1+Q7Z1Ravb37j1XzVJZTlHDDl7HDffUbkjGUyQZOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlbSz/7eOM6pOLOSbN25mtjIfpjHsH4RxTD16Xrs2G0=;
 b=WnzjtLeGwwTiQGka8NIFlBbuI7jhH0RVEH2c7MX1iqUSQc0RP9IS62fQrb8XxUIoWchaclR6n0yLqdjz2P7tvDT1ihTmlkupgKKSmrZdfWP6xAEPjbKuIJ+TMzWNSjW5KQG96SRlzo6WZv1SLh6orgIfurgZ295tWnuH+fYf3xs=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by IA0PR10MB7547.namprd10.prod.outlook.com (2603:10b6:208:493::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 08:53:28 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:53:28 +0000
Message-ID: <4e571a20-3971-4181-aaff-d066a146656b@oracle.com>
Date: Tue, 1 Jul 2025 14:23:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::8) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|IA0PR10MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: ec399c59-7039-44a8-dd66-08ddb87cbf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHZpUHR2RjV6cDR5MVJOcjlYRU81dWl3OTZFWU9XcFFkL0JUUllhT1UxVElN?=
 =?utf-8?B?TUo4K1U5V1F4ci9saFkrNEdEa0ZnY01HNDREUWJEZVE3NUZuamFtNkc3eUFy?=
 =?utf-8?B?a2JCeVB6cnpnMmNLS3pCKzdVZ2VYVzkrYm14QkpDMlIwTjdJcmp6ZjF0WXlD?=
 =?utf-8?B?ZUdISHFzd0VCaFgrYjFBWWRVdU4yY0RxUFlybVpQUzR3U0RsRlhmWmVnR1pR?=
 =?utf-8?B?YjcyaGFTMkJ0eHdlN2h3T1BhMGZxT2xKVEcyUFpGRGQwQXVETWhuRmxYN2U3?=
 =?utf-8?B?MEtvSnJrc2FaS0NmS2orNVhYYzNpTEZTMVQrVU5hanh0clF0R1FFYzVEc2Z3?=
 =?utf-8?B?KytUNUd4RmJpQlZ4OGRDRnQ3VTdURnZWazRkYlc5QnJqOGw3dVFmM255Nkl3?=
 =?utf-8?B?Qkt0MTZtS2VUMWRBZDFFQmRzc05heTdJTkh4NWx6UHh2YkZJOUw4WFgvbEFk?=
 =?utf-8?B?Ymc5TUdmN0U0T1RwdjR5cHUzVlF3a2FpWkhrVFlSN0FUY1h2UlFRM1BkQUhi?=
 =?utf-8?B?cnZPMEdrRTNUMnFyV2thZkZ3YkxJb0YvOFduZFE5TUp3RDAvZHJ2cUhUeHlw?=
 =?utf-8?B?cmZzVHd0KzlZeDBPVllNQWtUMHJLRlVZWTlqRVpxNXFXa1NuaERONkgxUFhD?=
 =?utf-8?B?eFVzS2g5SXNDM0VTVCtzODFncnAvMGNoeVJtQVErTHBTQnFyU1pSVmdTOHdB?=
 =?utf-8?B?VVZuc0Y3b2diMnNqVnVMTVNYcTJmK0p3UVBEbUo5ODJXQlZyNmduSXJpRVFU?=
 =?utf-8?B?VTQyN2VNSjdyRmhPMFJDZWpJeng4cmdyYmNHVUVoc1MyNUZjWDUzUUlhSVI2?=
 =?utf-8?B?dGpEaFJKUFJNc1NOeFhaMExFMWdZa3QzSk5mSkhXSm1Fb3FUZkVHUHIwa2pB?=
 =?utf-8?B?QmY5c1IrVzMrNjVYaFA4bk11UUo2d2pFVU5nQ1N6YWppbndacnNrU1FPN0ZQ?=
 =?utf-8?B?cU1XZEsxTDlKUGdxbUVUUTBKZEpsbFQyeHJwUkVNaHVKaWRyZHNDQU14T2RM?=
 =?utf-8?B?cHluYUlLSXFVclJqQnRsd1lVNkJnU1hld0dIRXo3N092dVB6ZWlLSmt4ZVJH?=
 =?utf-8?B?ZnlSWGRnbWFwbzF6ZjJObkxMdzVrMzM4YStrWTMyNU55Wk5xNk1rb0s4Y2FP?=
 =?utf-8?B?Q0Mzd29pS1dFa3EyS1h4SjBQeDRxYjdWSDZrVVlsK0RqektQbDRSVzZuNUpu?=
 =?utf-8?B?elI3R09SeldBUWZkUkJkUjJyUUZWWGllbEtIVFFiSkdsRDBzT0ZhK05hWEZW?=
 =?utf-8?B?WW10VzZEbE5rc28ydlhHTjBHYjNRRTBUSW5WOVdQTE05ZEp6RnRxV09sU1lI?=
 =?utf-8?B?NXVPVGdOSzZxemo3ZWhzNlpMNEMrOEFWY3QramtUQXg4STNnTUlkOUtmNWwz?=
 =?utf-8?B?eWxNREI0aTdlU01rMmNVN3BaL1VYM05HdjYxT2dYMTkvcGc2bVpXOFpZNjFI?=
 =?utf-8?B?T1RSTk05MWJ5RDBnUFZwYk5HeVBibzU2anE4Tk5YUUdLSEVOcjBOdStENUcx?=
 =?utf-8?B?c01mdjZqdC9ZSjZPU1R0aXhLR1NLbjNSM3VSQmI1OEIyVlkrRGxsVWlnYTNV?=
 =?utf-8?B?aDV1SCtrRmtGLzR2aFRRZ1l5ZnBQZWxhdktRYW9pUHRrd0IvVXJHRktLNDh0?=
 =?utf-8?B?VndVN0ROV0xEcyt1dklMWlJaNmE5MTU3WlpGaFZHeU5KTVVxVE9ZVVJiM3k4?=
 =?utf-8?B?aFI4NU92clVBKytwVzQxWnU3cXNOeTRQTm5IZUJuTUpmbnQzcStCNkNRMVJS?=
 =?utf-8?B?MnIwMjNISjg1eHdNOVVMaFU3c2QyTWttamY1bWEzUFpzckhsT3VMMWZnNERZ?=
 =?utf-8?B?czNMaGZjeXVrd3loS2FTL0R0WXlEQ0MrdHo1dDFYQ3pmbUNVcDFmTnRjcGZN?=
 =?utf-8?B?WXRoV2xKM3VrOXpuTHBBbGg1d2xaeFdrcDVOTEh0eXpUZThoN1k1cmx2a3ly?=
 =?utf-8?Q?k9Ho4dnvO9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlpRZk5kUGFhVFd4WC9hVUw5cEtQaFQ3djZFT1RtZGZxYlF4VG1rQ1FMcnlD?=
 =?utf-8?B?OWNzR2FxbnB6RkZjSERRLzdkM1JxR0Vhdmx3NDlMdkIrSkROVzlmT0xpRzVO?=
 =?utf-8?B?ZGljR0h5aFdQbXpHRTV2UFNicWoyMjB4OWdCMnZEQW52KzhnZkloMFZuMzJu?=
 =?utf-8?B?R1BLMmpjMGtkakFJS1gyUkptOEtVRURNcE1LM0JYQlZuUitDRFVkM3hONVU2?=
 =?utf-8?B?c1kvcWhXRWFVSlF6b3kzMVQxeWtsMThWbVBVT3p4dEd6dzZoUWkzZjhFNEZm?=
 =?utf-8?B?NzBUcktMdkVjZnl4VmdrdDZ4ajNuL0I0aWtjRnNMWVFzK3I4aGhDd2xJdStQ?=
 =?utf-8?B?MzY4V2owaDZKMHh0WXZtd2dXbjd1d2dEQ3ZzdVp5M0dhOGhSNm1xRyt6Y1h6?=
 =?utf-8?B?dkltZ2F2SzkxbS90aC8vZGpPVDIzZEhVVy81S0ZLRHBoN2t2OWZrbWdGVHhh?=
 =?utf-8?B?MzA3TVhkMUIxT2E1djZ6aDlMMi8veEloajhrVHFvQXJId1Jxc3owZStNclgw?=
 =?utf-8?B?VVZBRkR5Y1crQmF2Qk5CSkxzUFo0a2tWVnJLZjNkYmwxVDBIMGxIS04wWGto?=
 =?utf-8?B?WGhBSDZYaEN2WHNGeWtrQXpiMmZYTTBmdG84K0pEakxJUWNyc1lIQUkyeTNq?=
 =?utf-8?B?bmtzNWlPcmhnRnlWQms1ZTZYbStJNzRWQkdhemYveEZCbXlxOHo1ek1pR0NW?=
 =?utf-8?B?MERGV1paeWROTFk2MCtLbHdYdFFVKzEwY1h6Ri95TUcvWXpMNWwvWHpvNGZ6?=
 =?utf-8?B?ZUpWM2t6QUsyZW9XSXVFYUkzSTRTOVp0a1RuVldDMkFobGlCbC81MEl2QzJ5?=
 =?utf-8?B?cEY0TE1UOXhYaEcxSWl1V0VYMW1VdmZUWWp1RzBOd0YwN0l1NWpXZXdHRXph?=
 =?utf-8?B?RXpiekpNbXoycFFYQnVXSXczcS9DWjFYeVRvWnVPVGw3Q25NQVBtUWJXQ2xE?=
 =?utf-8?B?YnVnODM5aXhVajRQVHRVeVlLcjBhUVBDQWlLWGljZzZMZTdDQVRiakQyaENU?=
 =?utf-8?B?TFhHUkN2ZmVaZVVPRDM0dHVscUFLeDNLMzJZQnh0ak55QkRMcjdiWER5NDV4?=
 =?utf-8?B?Y0dadHVSeEt6NHcrc0lXOHo1UE5OTXR1MkhNSVVNMVhzQnQwOW9BVlFRZ3Bk?=
 =?utf-8?B?RUFSMUZQQUJLdWdqS3pTV3pOcmFzaDRmMkpxM0RDVEtjWWljcTVhS0ovaVpy?=
 =?utf-8?B?VTl0QVArN1FVNTJRekwyelphYzYyVkNKeW5LMTNMOFZMMUFzTFhlLzlSdFRC?=
 =?utf-8?B?blVZbkdjNHk3dU5sQ3crQ3dnaXBMY2JSTTF6RlpPek1iZjNaMW81UEoxTlV4?=
 =?utf-8?B?RVhMSXQ3MWxrY3p1L01TRjA5Nzd5OFp1Rm1NbEhubE0xVkl5dkwweDRoS1Vo?=
 =?utf-8?B?d0picEVCUURKMGF0eG5aeTY3dmtjclZzWUV1U3FwbmErOUlzRmU1bHN1b3hY?=
 =?utf-8?B?WHZZcHZxTitGQkQxRXgyOE1wWHZyeHVMVTJmWFp1RGhlVld4MGlYNnpkODJh?=
 =?utf-8?B?aUVSU0NpSlBQRkg4aGNnVlR1KzF4UW5vMkgwbHMzRCsyT2xoQW1qbzdwSkdw?=
 =?utf-8?B?RWJHMyt1Qm1OaElBeFVXei9VcjEwUHFYbmVNc0pOekhYaFcrZkR3QTlycXFm?=
 =?utf-8?B?Ny9rcWo0RXdmdFRxbXF4OWxRYWJNQlVMMVBpMEtHWmNEZlAraEpvVmVLUktm?=
 =?utf-8?B?Q09sM3RQYTA4U25mWjNseElPanlnZXlPYkNHWFV3YnQwL216bEgzdEtnMTVh?=
 =?utf-8?B?ZzRRTFB0LzZYbXdGWFQwdVVFdFpKTklqaitPN1d6c25IR3M0NnNTbUpFdHdw?=
 =?utf-8?B?ZjNNeGVJeFliU1ZKUm5lTlRlVXlFSlNGa3IxNVp2NUlLWnM3aUhEU0xsd2Uw?=
 =?utf-8?B?UGcwTUZZSDI2WHRSNmlxckR6MEFVM1dzYnJJL1BMT3lacXBIbDF1Umk4cGNr?=
 =?utf-8?B?c0QyTHJOVW14Tit1bmRIVUNUVm5vOUJ0ZW1ObHRnQm1PQTZhcGNObW9weXZr?=
 =?utf-8?B?ekpnYkFyY1doL1NMc2VQejl5R1BtRkZTb2tqMVVBY1ZlY2VzK3R1T3RZT1V3?=
 =?utf-8?B?OEJNbDlxOU5BRlZPYTJjaW1BUEt4SVIxTUx5Yk5xbmhIYkJmUm95NHhLczN1?=
 =?utf-8?B?WGdYVUJmdmZCOGZVcGNaT2N4M3NZb2lLZHhXdHlkUzJFdVRMeGF5dS9ZRU00?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8g3iDvYUqK8iueWSups+av/tQe6ed3s+N3PQfIaSvfRy/ssEAMTsrhI4AJysLwjsIDJt4kaMLBrgSlKODZJLHJ8qxavzMi7jwhkSMV9GonTu/k0tlXqM0Tfuxyopl2W/Ln+zpCrz1WSGqXtQwrkLXX88l2kSJGiakhgP9E6royTt3xLwncihcvDp+YtMlbUJwztFTuCGLkf6iJ4E8RViJFE1yeA4C5h7jpSYpFxOVKrwE6z5O6VjXiljEWGlx1OYxiBymJojTJ4yx0JCDTcZVyesgYb3LcuFvGV+TcNSKyTMmraduL1lzbk/lvSs4DSzuQ52+wjnuOq8hI1K8uczVhWKODCW4Rlc+QlKgCp47v1tcFQnlAh35fmTUxB7a1VMaFgcuHfXEQCmYv8nuOTRRnwuLJmtHWV7V/uy0blboh3rJCbG93O2YgnRp+JTsWM/GhUv1k6Iq3qQccVWi39x9H1+/c6zP5pK8BBYR8WxH/+Cro07L/8+//H4gSigd3UqNi0mfTy//lEOa9Z8q5gEuM6ULqhoxG9HHQVJUH133or6HoywtH0Pi9KfJEptm6iI1awB1cEeLiGVRDOk5iUO+aWvgwB5CDScHOdck6497Jk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec399c59-7039-44a8-dd66-08ddb87cbf4f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:53:28.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9W2X9fY/yYAPxvjipfbu3WmT94rJU4X0prRQtkDGzoe24cbcATG/pBtAEA6WgiD3k+qxYG4P2g/QuVJqkTRxEQvzCOccGDKULTAfTu01DI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010051
X-Proofpoint-GUID: YHPvf7lsPuUbn13JP9ZIfZw9-5G2jZit
X-Proofpoint-ORIG-GUID: YHPvf7lsPuUbn13JP9ZIfZw9-5G2jZit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX8qV9VBo+weOv Km80aBIdK3dD2jUpvmrH+S0XY3LPFeAS3Z6JphAIgKkILbTGR3+BmLHvX4Bx4967TPvaLv1Byet ae16X0Q1+HNa5MzTCzCMOy2q8W1mLhCpmUX1XpkRGn5kkGfo+lF7zn7V8wWXejryeH9D7hsFKnk
 FWbaNsB691Zdvrntv5CYNmEpbuhNQWA/axKeY/5P3mEUpUe6G2apvbxeYOW6hwzU7BQ2enKiWtY XE+TOPdNdIjn2vSMDgo0sMQfGmTw5v9fe23kBtZVM70yCXmITESOZY9c6hw/S6zROzS04CZ6uys +Z0QcZEJCQU79W8+xSCz8+lrlIcAmPxiSYnpgMYyBqgUqZIvdui2rZODFtFoN7TT3Yv6pJR8RHy
 eR+hcejlZA+nHvrOjt4CwgOZcSfm8+Cdfe4TQFXlP/RBMuv4QN1OwBW3o2VcyPatAJtgIIjW
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=6863a20c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=uherdBYGAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ohg7_4klVTTRktzzbJEA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 cc=ntf
 awl=host:13216



On 7/1/2025 12:48 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya<mukesh.savaliya@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm)<robh@kernel.org>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..45022327aee7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id:https://urldefense.com/v3/__http://devicetree.org/schemas/i3c/qcom,geni- 
> i3c.yaml*__;Iw!!ACWV5N9M2RV99hQ! 
> PBExY8d6MKcoXxa6GINMC0xaLabw8ZZ5entM7BVRBDg5TTn0wX4bOd- 
> BYUvy71WMSS1Yd5r1Fo9h40H4ug1cfxGkUxWZ0lw3TKY$ 
> +$schema:https://urldefense.com/v3/__http://devicetree.org/meta-schemas/ 
> core.yaml*__;Iw!!ACWV5N9M2RV99hQ! 
> PBExY8d6MKcoXxa6GINMC0xaLabw8ZZ5entM7BVRBDg5TTn0wX4bOd- 
> BYUvy71WMSS1Yd5r1Fo9h40H4ug1cfxGkUxWZDFlVARk$ 
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya<mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
> +  hotjoin, IBI mechanism.

Hot-join
IBI (In-Band Interrupt)

> +
> +  I3C Controller nodes must be child of GENI based Qualcomm Universal

"nodes must be children" ?

> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.



Thanks,
Alok

