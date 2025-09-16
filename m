Return-Path: <linux-arm-msm+bounces-73620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42DB58B83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 03:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6624D7A0F55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 01:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE0C21E082;
	Tue, 16 Sep 2025 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FE+lifkQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nxHAd4S5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174721CC4F;
	Tue, 16 Sep 2025 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757987509; cv=fail; b=QByEmi0pyAysRzUAmKittudz2F3tviYxaGmvLMpLLk0tIvQnWs9OYnDAolgbMGH5X50EPDNNrafvc82rBUJwx98PBnWTaMj5cwY7zzloYEGajHUrSOa0DkpjTJl9IshPkTUueBZI/r6DFNC0VuF7YWlkLMM3NobZfXP2IUf++M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757987509; c=relaxed/simple;
	bh=Be11Dx+j9xRD97xR8XvkmBbbTD15Dl7tb/qEc284Vtg=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=QPnqdsvvIYeKiVTT1G24t80jFxxGu3xQGjgN0pPqxIyYbCCDA/d5Ky4JTHgoXgLewkMUyH3GtrD4ka3n6uJ+oBlVht6uaWqgZ42/YhiN7eajyxUPqFhAWo2pWbqU9G3xewsPqgr7f3EQJ26M+s4Iu4efA3Hn679LkwxiIM5TXHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FE+lifkQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nxHAd4S5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1fo2M029016;
	Tue, 16 Sep 2025 01:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZsqZ4nUi9Ygp/cRaaG
	snckQ2GtUc6rfMmZBvFD+JWnA=; b=FE+lifkQfbtZGQ5NHB4zAAwX5B167cn7DV
	XDmrrMTx9WYFDYXFi6uyF7YMZQtZ2J0g7Z5aLuqRJ5TrLIbbn2slh0XSqvsMEGpz
	d08+C6+QTB4WC8CvMyyGZiwbrpkRD2IdKdCwMSPyGX9B53Yu1c4FEFpuQAW8J17B
	CPepdCv9DxXnOL07ke+vf8awi9HRrB+7gvUEeX77HXXJTk434neS5TK7KP4xEbpj
	0zf8CDTzUm+L45kvCvhP9ZN5p7X0+cE3+Q6kdla35JTlT3bYLTVCw9JjVB0AjOI3
	DFGzBDlTwrNgaV07rEF7OVgBhOlvf4U7PBwdehZd69jy+BIH1anQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w3ktt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 01:51:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58G0mmkL036956;
	Tue, 16 Sep 2025 01:51:41 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2brtpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 01:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8AOWp3rwtH4VH4JOtHHQia9vYZ8e83SdPoRPQzloJb908UQXSfP0klsQYoDATQXHb/Eauf/10c+rukthnvY8t4gOOc9FaYY5O0eHsHeHVJkxGvLZfbQvQ/dtJXi9Er84UbibQajsyQwwPTZL1YoMaxxJyAC8ce39mJ7fRWkNN73cy16DTDa2fa9EGDeBY0ocoe5Ww9TJbzVKP+heG4ASW7vte37M/idCcX1pk/4nU5qhlVXvucYW4nzZQjLOcQd09GqWfLgMV6GtGO65EMthg8iAgZjHbbM32yJiGF/7wZ1AK7aT04HVi0uZM/zPlTzKEGJi7ToIE/2FoD8Zt3+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsqZ4nUi9Ygp/cRaaGsnckQ2GtUc6rfMmZBvFD+JWnA=;
 b=XMLZ8/JVDRfCYw9Sh3/qTjh5CM7wXREBeBC/OnSyy6lpkzMTOGNdjAakUkykVoSK56ewp2LgfVbKi/RMP2daVn0RPnqSLsdY98kFRxxU/PDR1uY+WdUF2x+Jaf88LgPj+htmFcs29X91MqqquGCaRUCu0EKHO3Gkhe3srSEf32vBviGp5Mv0cWhPV0L8E8LCArWuUXvFxme/k6+UtEUlY19RoOhAm1aAUaa0Y4u7KlhOVKIsNOzWYeu0quhd5l9BAT8CFQiFojdXT4ZjNxMpBFju+gbCAdDqyGmmYvDse0FdwjCMzf7gfx4zpJXz0nq/m3vftrCWkNrNLHvCcGL9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsqZ4nUi9Ygp/cRaaGsnckQ2GtUc6rfMmZBvFD+JWnA=;
 b=nxHAd4S560PpWTQqKTR/ueytGLqQVtMLwz+0lWH6I72j4Rgfo8WM5C+9jbRzWdZTwscDdelzGZSREx0r6bQCOIsPBJoCdpHSnpjeCI3byWwJ6ZosLg139JUKlLwQrWCkRp4er4eyPzcZ6G4EJlHtnMKvxQLwKTLQigAlkZ+SREQ=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 SA1PR10MB7856.namprd10.prod.outlook.com (2603:10b6:806:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 01:51:33 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 01:51:33 +0000
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V2] ufs: ufs-qcom: disable lane clocks during phy hibern8
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250909055149.2068737-1-quic_pkambar@quicinc.com> (Palash
	Kambar's message of "Tue, 9 Sep 2025 11:21:49 +0530")
Organization: Oracle Corporation
Message-ID: <yq1ldmf2mi0.fsf@ca-mkp.ca.oracle.com>
References: <20250909055149.2068737-1-quic_pkambar@quicinc.com>
Date: Mon, 15 Sep 2025 21:51:31 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0163.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::24) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|SA1PR10MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 224afb41-d3b4-43e8-1d37-08ddf4c39038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pye2EjguPsEhDLOUYCUytXAqVqvMYga9JTkylcwMMB/rcFr4MCzdh2RDJLAt?=
 =?us-ascii?Q?LMg70XYIZFjdbRkCUBCxC+Xs3POrf3EZl/6lckIRyFRVRhoD5f/4aW/PUAS/?=
 =?us-ascii?Q?SW3Xq3OBTQSygoYbUQ1U3QItDM7wPlOpPPJFdjiuxi0eXtYXfYapfGnW2m5m?=
 =?us-ascii?Q?AKoxHzgtJzTlIuJ0yfUtTiAYrIMO8oYDrUorH5C6QkA1igJ2gg5sBTc/42rc?=
 =?us-ascii?Q?xIK7fkYUyZrbnpLzk+Y6utPfCTNsy5XfZ30T/M//01wiJaEOeHMvDzuBSKyV?=
 =?us-ascii?Q?+tcKf9EiL0hBsmGZGlHEyXaKK14ntrHwq+SRABdCVcl/cSWP2qq9Nf8keND8?=
 =?us-ascii?Q?siAyFHBefgj7TxfYz/z/IgL35D62dOrOreUaFi+j1C1JEWvR39J9oknfwRyy?=
 =?us-ascii?Q?yGbG5LSc1X/LeenbsCcivGD9y6iNPmfb0NVbwXy0LCb8QJD8vHLDY15+b7WC?=
 =?us-ascii?Q?yR3DLiV529hkywZEZqXUV3xwNzEsoBVj5Lk08AhktECmi1l4s5uQo9CzvZyW?=
 =?us-ascii?Q?Y0nQ+Tsa+H6FUpsPZtcMvRdveYlqgmy6JNqRf8gipPRXWoBrWV5jeo8gV3Oi?=
 =?us-ascii?Q?T2Br8/2qX0k67kmS2VHpPi1OYm2tNvJV8WjdzSOuCXlehtTad/tS6E6rfGDM?=
 =?us-ascii?Q?s49VZaH0C0P2mBAcC6I/G0Ueq3Urv/1o142MI8YzSHoRfaT6kNS5xgD/uOfG?=
 =?us-ascii?Q?fBeQqZQAeaLtbr4Wi9tj6u8M56aLb2hOgFBT+c0ooWRZDwov2GaZD85NdfQl?=
 =?us-ascii?Q?9+CFF6l3w78qJm/Uk9+YisnxjZvNU1eACuZFVHU3LO+CLriNhG4cUMPpV0w9?=
 =?us-ascii?Q?QAdTEY5cVvCptPkrflgqs5u5DtRtTIIWhi7x0yCA6y1a91mibmnp0osOMCO7?=
 =?us-ascii?Q?+drHakVB5ATK4Vis1P2zx+F8TKhUqs07x/6LIeXasaIhcuVeU63LxmIIxzjW?=
 =?us-ascii?Q?QErF1Zq+rIg7biUxqXBqXdsbucYhhOgvNT6Rn1a1QKtR1j/ouoG/ctTKROQu?=
 =?us-ascii?Q?9k08nfkpW88ZX/YluzjvpAIKbq7Gt6SatVrIospULPAAeY1A7MDJoDo1HAw1?=
 =?us-ascii?Q?WvSYe6Qv31CacRq8dPoxqeAOHa8i5HxQWy3ybG6N9Ji9gISnZvQiSKN7nq+J?=
 =?us-ascii?Q?XT4wd0BcafdxKTaTxEH9DVobMpfXNnvujf3SI4ToyuqJKMPI2kRgv4W2N5w8?=
 =?us-ascii?Q?Irl6ne9Ed+m9lPZpnGMZjouF2Ph0QxMUvAG2WOSmrHmACIWy1n+SWbPAnt02?=
 =?us-ascii?Q?iBdX8ma23rSBGXdh+6nBORVeig4qv93vFHzA8uGmIFYj4Qo+23BdCbxW5ddg?=
 =?us-ascii?Q?LpbYx/6sUgQ0ImHcr5jqgzY2hTZbZayxndGDozmysIypHliU6wO6kVxHxJY8?=
 =?us-ascii?Q?8hGpyMkYM1wB/+U3fkHPTYHVRasRgrwPpcHXaAqZZ99/SLEnix3h/wwJzk45?=
 =?us-ascii?Q?2/nKk1Yubz0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cE9a+csEvVOhLIZlKV16wGZmVIWl0bKkYwaDHtuK10c2gDG7slwA0ji76Sz3?=
 =?us-ascii?Q?VizdlqjBLCllNhP6NKomC+jiJcaLSxxDRr70o7cJGyS+uu21cq58Xxo3bSQk?=
 =?us-ascii?Q?x/sgipDEQiqFRVQpoaLfmGzbfA6Ini2WnnwbShAZUzGLxBlL/gIGpdOXLQw3?=
 =?us-ascii?Q?hAvw4brYj0btFhwuVo7+1ltOVXlh+vzu7l6i2rybJZcjhD4+RsBAdOboXzZG?=
 =?us-ascii?Q?/TwBQ5V6vWvGPZWtb5g3DZAl3MH6pLAAmPWkOSwuKLAI+hBwwWCeWaLTLSk8?=
 =?us-ascii?Q?CHzN9lUzfqiGcL29HmshlN+InIK73vTLFgAweUZ2BoCLaSciMp668m5EQmRd?=
 =?us-ascii?Q?lUxm+IJFjfMY/QbPSu7SODh4r/dAkPAU1VUqx59S/aFE2C0lShDJEVOkQyav?=
 =?us-ascii?Q?we9CykBNHNCT0rItxKNcikG5A05Cp+UrpGkOGq5c66eMKYahP3EMxqcqaOwA?=
 =?us-ascii?Q?+n97NvpI6FfPrR1NohkFISPlzGK0R3E8BEjGNTfwiLS/8lv/ncTzid7e2Y9K?=
 =?us-ascii?Q?l27BgM3zV1cbMA/+CqIgCO25aycWX2mB9NbAC8FPPQusaLyTh7rwY+CTcZ9D?=
 =?us-ascii?Q?+OWqWRLUo7FaUhGCQTqhHpXLugAa3okdEEzN9Y2idw27zAShsBPBhdvA5LD6?=
 =?us-ascii?Q?qyYK5SzsnkrDCRauTRNhcsuMXh8xqS/UkzRFE7ed+NCv8ExTCLCH5F4piTEM?=
 =?us-ascii?Q?Wsvlp3n1u/QMBVyDmOkJFBO1/RuASI6GUjEtjT2kxnP4QeKwE2RJj0fqG0QX?=
 =?us-ascii?Q?5Bm6BariDd0ZnXYr3auZGLlvkHnVzcZhCzYjrclRVYkAgf9/OpXiUTCq23G/?=
 =?us-ascii?Q?qtfCv7lrmZOxctSGoSyeqb9qXPmZaOTg0sLoBlYqu8tQg25h85Z5Xz3cdMRW?=
 =?us-ascii?Q?0+M56flnKssJLiVczpnPRHoM19F737hPTSJQrw1mJ5cl80DI/R/3UwGKlS0o?=
 =?us-ascii?Q?Wua+vZ4eGBl/dTOagHekDNQV8SDtuIHecR+1QZVOuwNc1HUOhu3GLuXK3gGV?=
 =?us-ascii?Q?nb1DS8ktqNRy95nCS09POhEWGtfnf9IRpyGAoVBV6Y/EE4EBtuRnKq8yGus7?=
 =?us-ascii?Q?hrBI327o1Mm6enSj3f6NS/nTisPc2jsVqR2LqWWyeBGuYoN0MYnajcnLPCHb?=
 =?us-ascii?Q?rfOhYlSJuerq+GGuitJ+8K1etcdpwtNvu+2hS06xlkplQpOUe2wZtdcR8o2b?=
 =?us-ascii?Q?60ABLbWWPOp97MqFPmcjhHCdEDKESvHZBAXRzuNOdnXJ3COLRoAvoP+32zPm?=
 =?us-ascii?Q?VRhNu3odO0kgoNx//BekmdmSmVRAkEdzlhqkHpv4baXnXuYkM+6S4/7Myt5t?=
 =?us-ascii?Q?gntQlm8ydMHV747hcsn4tcu9WV37DamuelqfHVlmmACYdwYPu9Xjeo8GP8ey?=
 =?us-ascii?Q?nNTsa7nTk80TBKZn9s46/VBm40X70EPhMlnXOWPbRouWyU4QnqPnntKX9LTh?=
 =?us-ascii?Q?y8ljm3tTejnHXa27oWCubwTDaKdTMeM+hmYyBS9nQjC5TNctMmgrEjAr+fzn?=
 =?us-ascii?Q?cZ19c2JfvfkJealz9rUTRAtB6SUkuxM7QULKtHk5Kum9ufcc0cUOCT5xkEPe?=
 =?us-ascii?Q?iSY9m/zrnt4OvkwYvIBHkFvPKMzuFU4VBHmKSWL2rG29r0O22xwhlYUhQ/Oc?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vTW/wL8NAkzlqRo5y0QeEB0L2ezIDWEcm+w/Ym9vE+PynFJmU5bc3GSYOoOVk7Rx+tfH/gkmV9Zm0qvyZqp1Sv8uPWFFY+SJLRobqYGLlofwefMKQg/yfNrRspcN6nZZFUdMorwQQWft1ZSXzZkBvwtFoieHMv9xYkYpHG62h75WY23X/Bj5CTQphFwBlV22i3FIIrtBNMQhLm95YsJniYenigHrhFmJm0vmI3c6mB8OBBKgogP9Ffu6gbVEarsq6EkGTBolVG7lMZiP4J/24K+SfTx3VmIs6GysV5UIDiTPkgjmg/b17kki4UZBUw3agop9TB5ZclQX+YZu0sYQjpaz64bUypGcOfeQ4FBpAP1QbjX+rZs+blzubvw+HE6v+6LUouGeQbHuanhdteJwhweTazri39pgncJ4zKU2ZJDgc2zieISDOyOfe1p0NfwJCSgbrnSQEnBhvYLEMn5LK/CxkdLNzZugOS6hXen7C8TQ13S/cL0bghAQYEIVG3ukPa+FEmI315OxFaf62W84NKul2HIiNkAUdItAaN6pA4Qz5BbB/6Md/8N/X+N3cBE4QUnxhLCDEtltoQuBdN6cvYFRdmOc+3HHBwFeh0DbtAA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224afb41-d3b4-43e8-1d37-08ddf4c39038
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 01:51:33.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpKOsKwlmmsFwzpwJfBT8j2FwO2aj343GYBuqDPi0zxMhmNVWuem92tvS4pD8TFq09R8TpPv22w3Dw2efrsTvZpItnVDtHtw60OFjOAPYCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=555 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160016
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX5i0ba+dVQluC
 7tAjsWQUOkdO2VRRIkvSIh98QLnzitdOpH+L8QBDe8Z8YRaG2MFmkudmqysx3VFNYPI7sw3tcZg
 sW+vWw8Zme7k0z/NfLBFyZutB188OC1XeWqi0npzUs2vDrpg2FyNHK5j/8nYt232rTbvH/4i4Rn
 SKu10LqCIJiXzs/aqZrvKWykyXx1rlHu78Rp+u7r1Sv0Z/gX5ijqyWLoaN9FcO+0hLsXjf5mnj6
 JylwJ5PPtiJyyRj6ukvBJrwV+Qf5QZ+puUiX0HC0dUAQkW6rVMwuXbOpQbQjPmMH7/VxVoa+eNC
 Uyn5JNh+iHepX1jGlei2UE4n3+9FBKF7utlrZSng0anLg+1Pqfdhlo7JXyJOXkIkEmERQtJytrO
 rra9N2cD5PLsVnwESVaCQMq81zLL3g==
X-Proofpoint-ORIG-GUID: yQ6jXypbf2EprtIKFwqmDTAoMPd80Ox4
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c8c2ad b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 cc=ntf awl=host:12084
X-Proofpoint-GUID: yQ6jXypbf2EprtIKFwqmDTAoMPd80Ox4


Palash,

> Currently, the UFS lane clocks remain enabled even after the link
> enters the Hibern8 state and are only disabled during runtime/system
> suspend.This patch modifies the behavior to disable the lane clocks
> during ufs_qcom_setup_clocks(), which is invoked shortly after the
> link enters Hibern8 via gate work.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

