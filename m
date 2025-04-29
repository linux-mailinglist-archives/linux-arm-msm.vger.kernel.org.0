Return-Path: <linux-arm-msm+bounces-56001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A746EA9FF66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 04:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0443A480F4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 02:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C558924DFF3;
	Tue, 29 Apr 2025 02:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="npTVCCka";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BQmnUUia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEC22A818;
	Tue, 29 Apr 2025 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892529; cv=fail; b=k/PBeVil1yhSeop8gzs1NIRtvV/wbCUD7Dg6n9b6W/6308ZcyScjXXZNOu40P9I32HBgL2IVHiaL1gNiWx6Y890dirwi6xJxt883rTtr2UiV7m6p08/K8NcYetd4kmphHSVc8SjUdqgERjpDegJ09X4PUd32/v2yOx2Vmy1KwDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892529; c=relaxed/simple;
	bh=XzXhMmGMQbQQAyFkadVx4c/zSAkA/VUfPeHMAFTIlOs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=sbn42jlQRbmetfVFe5sHtB2HZ9qoJJy3oLRkfCNW8Fp2NSX/WyR22WeChy+MmaqioWdtr4naItUm/xwv2ivYqAnQ2XJ5diNZi4ggI4onzi+9iSef5M9aTmgwcJmtmiN3g4iAiificHLITZYnXlzJR4vUzJlY/mEP/wxfwfg08sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=npTVCCka; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BQmnUUia; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1gJEG018971;
	Tue, 29 Apr 2025 02:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lOlIQ9MxTTb4VNaaSN
	YALf924QJ12wxuGXEUQL/fl2s=; b=npTVCCkaPuuaBxS7OOnFNYtNysPZ2d6zBt
	CQ0Jm5T/KbhXUtik45alRxgBILcYwfi/2JUIGh1cOvVESLTuVPe0xjvlLOc/81oh
	2GpxpQig8ZhKOf1q8tngjzE3YGfBjphnA4rM/v9smdn8hMi9S0s4YhigUpAqxMEm
	1EruK1EHPRdSfhULy2uLiZUT7pVj6uVVcMpW1ISt20IHUtY9bJex7YyI5DVRdHH0
	eMGemL+Q/ejb6jlPdxy0GoGdK/z+gUZx8s2mwXu8KLZzmBdUTWwXtbmWoMp8IDww
	VUiyCab8vZwLCM/BTRJHUYnWpg1bmFCdug62lXYJ2cH9QebrOvWA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46an4781cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:08:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1Bh5P011981;
	Tue, 29 Apr 2025 02:08:37 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011027.outbound.protection.outlook.com [40.93.13.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9qm7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVta9g7Rubo4mh5Jteb0EmUNnVonP5iAuZRqiLOfAICOWx27ySVqZzQnWFJCDQ/qiKLKRJeKNSWb0E26PQSgM1zYOsRIKKe5ioW/xhQDhzvcnIE+shtuDM7f+cL1868etz+ZrSkMyKf6FaX/hD9vVG7QS6WflRW07mZvM2WQ/owZWX6kgkx0Z2n0Ml350mdyO8BTylkPzjYuU3Ox694StES8JXgtCq3cw7LZMJxZR8iG6HJwdKQwErWcy+YVC1SC9QitYyd4KSXJVyOUUccKJIv0rPw+KEUdlPtaSj5XURsa73jETbueQewg1iYVUaJZQpSd4o/S2Q+qJfkodQRM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOlIQ9MxTTb4VNaaSNYALf924QJ12wxuGXEUQL/fl2s=;
 b=s4XJQqtPUFBmr0BR4/Nrclgqot3/Di2H72SKhlFNKk5jbfFG8KA7ligxWvKQVB97rLSimYApUpz+DXwjo+j8djFIHRiwhZSeWo2t6lD7j3mKS+3WQqrQjpB2nH4bl3PokKzt39A6fWCr9eO7H34IRcm58wSL9BA9IlLv5IlRznDXBR1Nkxxwtfbr1CqE6f/UTHFmiw0R8GC6is19L14C2NiW/rR0S51qdwTP2Sj2/a1NxizwL0WEUG0MQaD4q97wmwfwly7B2jBi5xaaSTywa90OYpikjqmDNtN5eEMDTVlVj1f+PWkbO0yLy29sz7ZQkPigfb1Hq2ub5zIVfby1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOlIQ9MxTTb4VNaaSNYALf924QJ12wxuGXEUQL/fl2s=;
 b=BQmnUUia2c24xkXMm5Y8F/AosvemkD23q3jIo/U/vI+tRjsZQVVZGl9J0gsWvbBx2BVzky5XxyOya+/I4foOnQwN/KakdZYH1cL9bFwgy3BejLMU0u8yvaFMunB4AiqbvIA2GJ3StbLbAzXUNGgKFDEdC19GByW7glDqysVvXLI=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 CYYPR10MB7567.namprd10.prod.outlook.com (2603:10b6:930:be::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 02:08:30 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:08:29 +0000
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V7 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus
 registers Dump
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250411121345.16859-1-quic_mapa@quicinc.com> (Manish Pandey's
	message of "Fri, 11 Apr 2025 17:43:42 +0530")
Organization: Oracle Corporation
Message-ID: <yq1o6wf1zzf.fsf@ca-mkp.ca.oracle.com>
References: <20250411121345.16859-1-quic_mapa@quicinc.com>
Date: Mon, 28 Apr 2025 22:08:27 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|CYYPR10MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 585129d3-46da-4c56-4fc4-08dd86c2bc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vbbHwZNcNM7ry7ha48cFaVQL9yN/FVZC592oYg8CSVJWt7lGmqCFudYqSHA4?=
 =?us-ascii?Q?0ySRjm5gkAJfuPAet8zfgQDailXeINIkX7Y/DVGzStTLy3ZtI/MQTQYJsKx0?=
 =?us-ascii?Q?avL9Xear0xyf+ceYdI6VyNH3peSI9NlsONrFM5j46kpUzs4LpABc1Kz1pgGn?=
 =?us-ascii?Q?pQDIcH43BDwQc68tPXcpDLSE/63mbWSiPBv8bxKNmz13rHv9m3HXhdZqzCXE?=
 =?us-ascii?Q?BQvRdfyqORvidnc1Td/lgq+QtUHs5t542ac5yHiOuSgqwzCHerNC9estH2ee?=
 =?us-ascii?Q?tum3VnuNpUAAeswXVUV+bEALoGKANQmjEeDPIWg1Pm3NISXOfigNy6+l0gZb?=
 =?us-ascii?Q?V2IpJTmieoZwpItm3A7yZx85NyqVJvIezio+UQ5gehBspF9nIKMUc9eokKaM?=
 =?us-ascii?Q?lLpbtqmEORJrHmUW1LG/Q4YcBaV9LB6vIAw41uYL8oI2i3WbJf6/jqQ+U6Ju?=
 =?us-ascii?Q?/9qhTrSEn9raRhv+GQMGG30GP9Nbu99r+s8JjTeRTPm5/sU+4MXtp3X2jV6v?=
 =?us-ascii?Q?kJXFuvuHTGqaWclZyKVD9A6kHonx5bVdo93U34V0tCMzv3zLWO0TgEKfnvM1?=
 =?us-ascii?Q?uiQelgn6aiaG338H3VN3t2BB3hThzDS2ouyPRrnha4aAr2GU2HnWhed2l+iT?=
 =?us-ascii?Q?FjS2xjuwsfMIVy/r3jzjUUJ5R3fbCnRUcpaQjAk3MZ0WsenjShJr5dtx+77/?=
 =?us-ascii?Q?en7O3FRDiYHssPMoFD36saAODyBmw1h0nhY5GA4HqmsAfA+mXGNJeae6Jo5G?=
 =?us-ascii?Q?dpGaXRTTmSwp7Ydb0fgrTxa/i8CnT75zpYklj7uUysNVPiP62VouS54+hFuV?=
 =?us-ascii?Q?7qJfz8B2uNWm8OHdyPhNzgTjFjafd69XzUWA+R/DMh0OTEBxSvHQLBLJkbrV?=
 =?us-ascii?Q?Wye9gmoETIMt3jOWZxiSTTLy5hfOyGf9CzFyCVWxHyMGYd2819jxgT32S110?=
 =?us-ascii?Q?nL/y6fW4g1ZGu45L4qrjU/9QV0GhEA4Dbwoh/AlYToKCe+SbATBio/GmTXOw?=
 =?us-ascii?Q?NSjUdAPJZXGFrkjY5V82tAYvBXFWuksk5NGnzd2APdCWe8x6GUw6kZa55z6g?=
 =?us-ascii?Q?ODfwAO2Ii9OSjqFa5Lh97SxAGbrknB5Q55+YbfvXH8HfTeKbA0Unc4szkRV3?=
 =?us-ascii?Q?ofwJL35rLfstwoAo82CCNSMpTHa9jjj6CksyLPxuHcmUGO2QDPVJbl1ypGSe?=
 =?us-ascii?Q?rNuGyzs8ToxXb+kmfFOrpR1l8GPdRZKy62fWFkOom5Emg4sAUi1zkBHV03ue?=
 =?us-ascii?Q?H/5N/0SEDKXznBiEx8dQgcf4XYdECrijAWMJE7MJ90eSPUZ3ftmjKkZCLmP3?=
 =?us-ascii?Q?UTNAPJof1vYrOBOcnQLeFjdD8BbnlUJ69O/vRx8vIWrtYLHxPWYBCJ2zyDcr?=
 =?us-ascii?Q?gOIpEb5nhcWi5OiCgiJFMltIA7+it1roDgSS7csdhFZhXfeYLaoQDlfaeaH1?=
 =?us-ascii?Q?h0gem+LWYdo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C733KjsqKxOtbAQaLclKN1u/zYPhs4l8ZpFXUU6EcD4fPfaIeygWo2Gfgc6s?=
 =?us-ascii?Q?rgydW4XInPYWqum+6O+La27RN9EzSJL5VlTl6vsWQH5TDQyd7L8gUVYTjZDX?=
 =?us-ascii?Q?gKWW80G9KfrlSq/7ePv/paL5gkrpfM/90IsTVpFRUPyImGA3/S5EKidgfMM3?=
 =?us-ascii?Q?xAmZ38JKJItFF8GPGiVZPLXmlRUUn8bLaIpdKwQ4kygJsZCbSBM1DnjvI4Fv?=
 =?us-ascii?Q?QlC2iVJElzmp7E7nsPUohZ/ZQ0N+yMqRPvvYLh0wM3g4rZXd1ubV9OQ1SRtl?=
 =?us-ascii?Q?P6bTBeWQQrIrYioDOGiBCvHNIR/Vmx2baBvgjDJ84L7wCvN6K2zVuJCwOUxi?=
 =?us-ascii?Q?s9ym11CmfnnjCSnfCDAtyz8GeN+oz8DMiLDV5lLsMQsTLibIgQkEsFHo+x2M?=
 =?us-ascii?Q?EKGG26zkpvz1j7ife1ntoQ8npknQ+ZtGeVtTl58O+m6jgxU+FgC6+mg6uWbI?=
 =?us-ascii?Q?RHANNrB67aLKWMf8zuTUk9TRHyBwt4gsRXXhBmWy5AAK7VpwTxyCkYjvMr8w?=
 =?us-ascii?Q?UIrwEYkpyqPM7ylvNSr8XuuBKHjVp+pvRzzMFb6+bUSvTZBWqYS7g6e+/wmc?=
 =?us-ascii?Q?pUDCmKmg2W4macBLZBhOXQMWKCYaHUOJuAwiKVs9GfU1E+7mntz/p5TLDFEa?=
 =?us-ascii?Q?/ozoDW5OdCgYEbUsdFQLgOxT6zwI/LTpHLEy27bLQVEyDiDvZnAoZ9nWp6I3?=
 =?us-ascii?Q?RkBBtHg9939oVmyzQPvvU4MD7pSOsKFQG/FWepZEvjFjAkgh7lBVaxSmZd1U?=
 =?us-ascii?Q?FzkORJsDdZsovck+UD5WXXmdFycrtQrLoScGMLU/kfHtXESmnX9fi9IJG54v?=
 =?us-ascii?Q?YdvOmF/miRwzNA2LCaOojlCepVDiYaF08vIGa1O1mvB3SSFyAX2od+7HTuUn?=
 =?us-ascii?Q?J8y+ntQXYOZr80LVTC3O4/QxQjxPnlV0DQMjCZ2KhupnGLzK0h9NzSrwmP05?=
 =?us-ascii?Q?IJjyHkePkIx1l5AUSpVRuspfVpt4PxKKp/7VuEwYcx8oOnjEO9wE9ELa0ePy?=
 =?us-ascii?Q?iHylRWZ4bTs6LHNxHzUmwtN8TIQPYyKCxNyi+pV4MZK0ZP3irneE+NP2F6L2?=
 =?us-ascii?Q?io1yNQl5qtpHknyVP7ZADMqprXXdbgs24ps4CqUy/ZPL3lQEO48rydTOLda6?=
 =?us-ascii?Q?nwGRdNNVEG93mJbXaywlJrAx4LEg0OJ09Ub8SDBlYYWC+JVKVKH7UOPJWAxe?=
 =?us-ascii?Q?D039m8NCaZEWaM4IMDKWCWTTUBvADNReOEWnHSfOtyV5IdgUVz65GEiqL1CL?=
 =?us-ascii?Q?SOsQwTImpJlFUXaD1DBbF3vKH4inNjXsQlSzHvvem+r/qm2UjPLhH3/9zCLJ?=
 =?us-ascii?Q?4cN7ezbiOVMJMcsZAupCzOrqaj0XoXB4JE0apM1gsm7VgUGZlZA1ICLsRhlV?=
 =?us-ascii?Q?X+laVLtlpjH7h5Ll6/OEQE5VuRuAT4KRWAwUMHjsHKpaox0B5mQiLniD+Rp8?=
 =?us-ascii?Q?RIWA0jDD50knmCt2Ptw3xjvvOjHzyIf3oWFUbIH4hDHepvR2gppUkQVj7I4U?=
 =?us-ascii?Q?bhA570k1EwW76zfGcBfoaqQ+1kfhiKfGaD83WiyvgfGgMLK8SWlzkIO0QkTy?=
 =?us-ascii?Q?TWr6qA5y0P6YQR9hfq9h/rAc3mf57O4mHMKQSNdn5tVPArclRjUzi13KnxL9?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	upQBNJG910WCdcn0vjbKVSmbgZmzJPI8ixmzGGPUV+O/Yf316W/8diLo6dq8lfGkZ5c4SHXwyjI5wO0KJPgOwNW952DTgGK7xAUUm/GXlQ57rFggLjqK4/HNZO8yIizNCXezCpvZpVwhfctBuL1uwSHSyvwDRb2GdFT12CYHBpjFh9KtNdHcl9I1b0UP9ZsaQFwEwRPSc6+eqNns87UqQJPXlBI3q+qkgDbZBgMkZapRzbtcQnZFkCUk0MPNdv7T6C6QIqhXbk55yuEh1l+vlC1ZsPcCj7kJWk1ZjdVHt9pz/oqVrbVGCH5gizRYwXhP0ElNyj4sVBTILK94hiJVRtLGFAjZK6R6R6AuuLGUqSYEvgdSvaBOpY4byrWm6uglh0BobXhyyDwT9u9UjamJM31/LzR7aW30FFHpV6501K8m44olC8/rUSSnzuGI1Oo5nyJHzCcsE2DUaMVmOSC3B24puQjsTYoabaSiBRCUnUJoJf7+T4OZ6BPoK5cEJGShoN43t/1R0voM/cjxTe+pFfl+TLKrUnPCUompzIk+NCXHB+VpFtxbee0ZbWPZAbYs9tXvagWEZOiihJ2F/yMitQ1cBefcVPxUXnG5FUa0cRI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585129d3-46da-4c56-4fc4-08dd86c2bc4f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:08:29.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRwvnCiXYLK4/CBe+/mkY7eWgL4DPjlfToEi+RCTuRVrFX+fpoOqo0sPmipFr9UKI8MNJ3ZuDj6I2ENb9FnY78Ix/oCQE3CuPy8vKdwG1BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=542 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290015
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxNCBTYWx0ZWRfXxUKF49Wiv3uN jCcofniMhJtHWAaJ60K8m6vRAslG9NfmIhREA+dSDcyAUYiTQwtWxNF5bdWezoopSefCeaQW5g2 B3OSgvYipNdIz6tM9UuIyqjdLP3a7zB8yJfFLwZJPEQ3fwwd3NakaMkrE7FPerVYVAWbomOq+3h
 S55xsLWzSCtEJUwULW/ufQH/Mmm/yiC5NCVe0c1P6sCngl6i+3eDByvQfED6d36r1BtA8wTXkx7 Hm7duCiM8qeosV6lX8V8tH7/bd9V3xHNjvlpggoWMwKDe5d7k2pWDIClS9/I9+a2YM6kJwi9Eed r71QYKhlm4A5fVUMsZ9d33qhW7nNCK+G7uMNIr/UkSvMXwfAZBXaZFRgcAJcR8bMJ9HluSPgT0N T2yywKNY
X-Proofpoint-GUID: EfuGsyfwV5uwoKS68_Jj5fkPxKS-M0GG
X-Authority-Analysis: v=2.4 cv=OsVPyz/t c=1 sm=1 tr=0 ts=681034a6 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=q32mctcrirO_PcNCel4A:9
X-Proofpoint-ORIG-GUID: EfuGsyfwV5uwoKS68_Jj5fkPxKS-M0GG


Manish,

> Adding support to enhance the debugging capabilities of the Qualcomm
> UFS Host Controller, including HW and SW Hibern8 counts, MCQ
> registers, and testbus registers dump.

Applied to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

