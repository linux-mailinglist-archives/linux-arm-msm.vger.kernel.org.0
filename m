Return-Path: <linux-arm-msm+bounces-48781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0CA3EABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F979189F834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 02:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7689718C936;
	Fri, 21 Feb 2025 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b3sZ8YsT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yiwPmOoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE002286298;
	Fri, 21 Feb 2025 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740104672; cv=fail; b=jm0vNMypaPOCkchlmdZprz9Sd0cexJQ480yNEzXDUkdJV5uAnEqtXzHcNpbhOVY2AhZC5LBbyt19gjSWGnxduyA3TE034hPIGDggUMbHUw3u8WnMQzlt5NH9qrQEtpOJ8FbPFPLDTeZu01EH3sR7dt3ZPhIAzdbKk1iU3+ODvso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740104672; c=relaxed/simple;
	bh=H7LzooURg2r8cKA36Z/6SKBwoMz5oUmRKKV31SJH9Gc=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=iDbrrf4NFroyUvq9sKBmsR2clLsa+92W08Au7f7Shul42srJho7mpXFj9kUh4QKFGC3toUy0n8kHXXIkVxTUw1JaVhj4wpT1zGjyObKld5uBFgPmJUht7cBmW8q0tguhpXojuPrrbI6pWDK69YXh1EHaAPi3+qnEjuJKYAmiz4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b3sZ8YsT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yiwPmOoL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLrZw6016233;
	Fri, 21 Feb 2025 02:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UBTrlWX5CpikDjc1DY
	/Jr0VaDQEK6KczEKNryI5/Lt8=; b=b3sZ8YsTQkXnq9M5vQSOinjk+h/QAKHH9Q
	X8bUV5P8hAoVxmnosOstbYwmuRL35p71I9s70PSx9keiddj4wKvk+L/T06kWqpat
	BiFdsRAmr87zfGHU5OGx1AeYqJJMOv91gGXBEf959yGCsXEhtdu3ee1jx5RtXYh2
	5Q661fNfrZRv88ePVF6UQUI3OD9XWek64yskkUnulzIA2hEd2pU0g7pozQqevDZ6
	X4evf9Sh+2orIs8nQo2bKIBJ36k1EwYDBiW8wKODMFZUe6dSGTJXdOAfFtLU1t9v
	dYtjWaaGwlC1W2UcG3uB3mwDkZO/02Q0m7IIlT/qshyGOdaRfsuQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w02ynfe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 02:24:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51L17BZd025214;
	Fri, 21 Feb 2025 02:24:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44w08ysx9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 02:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le7SOxGrjIRB5Kfabj3Z7HTlL4rrbrnxI9Wa5HxDMoe3+M7WvzYrKxomNxrW5WROiRQUmCKTFa653kea9aUllp1aS5VTXmcf5edgjR974gpFLd2Pd3ioeQ+q/13eqKEWbMmEC5CTM3zB9jssmR5K3JPn2pPxDAorwutJzeBm4fDZ1DArdOnbQ0H2hxjEh9huqsNLIf66483SaGpwbYHIw0pJ26shMrRLHUpC72WWPIZHa7s4oUz3T3eWS3C/gqF2n/u5OW9cSdTIs53bMlmF7QO0joh+NdgRS+fp+BeRU0WDLwb7OVLUffzF8BhX13JoseVzf3cmTZ8Ctw3Cc3MFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBTrlWX5CpikDjc1DY/Jr0VaDQEK6KczEKNryI5/Lt8=;
 b=jdKdT4TDCFOamd97GmVv/rYi1IGBtF7mMpFfb6uftFYhkrV5jEg3JKEMNkFP0tW0DF/jCEGRwUNDYS7e4anOQ9ld3Bmb4BQTaof/V5ZARYRlKrcqocFJbAU1RNjwVdqZz039m9ZTZufLvHphh9/shkjAgfOb2JQ3CyBhEzxGE4zynxPYwF+d62pOSISdbMYM3zkaW2kvojuHmNJCnOKEsn+QwxTwSgrjy1aEg5LEkYvL/2uEtsw+DfOMoEj7pbzWtprQ9VJ4A0lD7il7jlIiTKVe2n02//9QKI/Zi6IuajaKoJCBS26bfweCxvaFv5XeVy51WeSK2qUq6Zi5KWj9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBTrlWX5CpikDjc1DY/Jr0VaDQEK6KczEKNryI5/Lt8=;
 b=yiwPmOoLjU6/5O7vXJv6uhRInZ1x3aFLNZq8TJK8YlYk0HLq3kV7T0SsGZRAra6HfXg/Pzb1onOy6FDEljIT5Ml+pWau3khktjEp9sMBDPKTByTx9NUmWZ6K2fbFtpIdgz9CgY+fhcjHDHpFOhHFGfvzDmJUUHOkG2lUKeP93xo=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SA3PR10MB6972.namprd10.prod.outlook.com (2603:10b6:806:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Fri, 21 Feb
 2025 02:24:06 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 02:24:06 +0000
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <manivannan.sadhasivam@linaro.org>, <minwoo.im@samsung.com>,
        <adrian.hunter@intel.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "open list:UNIVERSAL FLASH
 STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
        open
 list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] scsi: ufs: qcom: Remove dead code in
 ufs_qcom_cfg_timers()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
	(Bao D. Nguyen's message of "Wed, 19 Feb 2025 09:16:06 -0800")
Organization: Oracle Corporation
Message-ID: <yq1jz9kjarq.fsf@ca-mkp.ca.oracle.com>
References: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
Date: Thu, 20 Feb 2025 21:24:04 -0500
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0036.prod.exchangelabs.com (2603:10b6:208:71::49)
 To CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SA3PR10MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df94999-120e-467e-b01b-08dd521ed0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m810hRC/5H4hNRQ1SH8joDL+z7kj8Cl5lzY4/jDXfiezmb07MDIOOqrDZ6Yk?=
 =?us-ascii?Q?C5RNkZonq+I+gja/tOw71hEXlpqCkrS8RFJVI1qAo7bzbpF7xatJr8tTNmWP?=
 =?us-ascii?Q?jEV0xj/o9zRRL0k6XVAI6Imw43zcTdPKwCa14MYckheEsy3jSDeBISbTTnIn?=
 =?us-ascii?Q?QMPO43uMmhuFb1fGQPmv87lDdU2to5b2oDNropgISFGq+C5iCGdudTVjUPhF?=
 =?us-ascii?Q?KLQJfUPOFFzU6l53q2MAl5wWiCNpgPWT2iqLJXVuSWPySV906mtI50fJHY/F?=
 =?us-ascii?Q?DDJmgKYdMERV6ImvAc4SwI7IA27pkZD2htVuCiXagKuW0pDKaYSMPEJa/B2P?=
 =?us-ascii?Q?LkCGJy1ELl48nDK8zofxHdgg8P+PsH7EvqMiyFzKe7P9KadaxkAJH1ZFdr6D?=
 =?us-ascii?Q?3mPAJDPuoqREbzmVQvV2N3uNxKSUC//JvJ7zRAJLHceK5Ksiqa8QmoUvCZe2?=
 =?us-ascii?Q?Vcb/04u7wkrMA88Ah/i+/AdpC36fPX4DKzBT9lpBTqmpLP3iuj3lV7GZwArj?=
 =?us-ascii?Q?g8Hpx5+k2QDl9hJ58pWn7p5hmwpBcaWnIgdhsRIpjGzSGx8O1DQ5RG30oFpr?=
 =?us-ascii?Q?DZ9RYoHRNCSAAqC29NRl1pp3mh/s4ONkM0CRruqv4s7MPDX/NHMtuN8HyGDv?=
 =?us-ascii?Q?GajTKiMtBc2dIBZtok7rKO/uTklx/mbNdVzJ86Jh+4tV6a8mS3HzImpjAPMF?=
 =?us-ascii?Q?4ibqN5L8cwZLBmN69RhW6QoQBRVCY9P0DS0cv7Vy/69Rfc1c2fXrWhdWqS4a?=
 =?us-ascii?Q?Ih6mUd1hZCaW+lMNKrETpMsejh1ZbhXH8HWe3TdXTc0G1zF0NTtt3aHon7PY?=
 =?us-ascii?Q?vWK65b3GzaKp7V4hNEdP+OtUjQdSH0GsicEKzJdPwRDdvGaz3sLMkzu0439P?=
 =?us-ascii?Q?yyWvdB+dzNgmwygRjhK96IKZuB9VlaXagwxGUQmRVSKUxQO4JbiAzj+O7SMG?=
 =?us-ascii?Q?/z1RMNbptZd35gw/uNVfF9W6cPyeF8I5uM/F+i5yo2affJqV5H0DvIem5fsi?=
 =?us-ascii?Q?CorXN9TXflVGetjHU66NtPqIzgzu7Th/Gq4l91Pvm//LDqNGHH2a8f6UukrL?=
 =?us-ascii?Q?pnzMvRa098SBfjGGxpzlkwTN+2lo+8uBRK43mqBuwFAGujW3RM/wuJtsU1yg?=
 =?us-ascii?Q?3XGRzzpzvWPA0py6NBQn1vGTNJux8X1Dk0V2iSg30kGf4G5BuEM8IO79WyNj?=
 =?us-ascii?Q?XCRlgOKtL8X6MFe+Fr9fgFnCX++4p1HRtc+hBD8NKm1TrKOC93YllFhZWmv2?=
 =?us-ascii?Q?FmR1kmASNtB2536HCIlY/Dh76dTpFrC6Hrzd8+E7Y9iQygS4TCrQ1Z8QF9qM?=
 =?us-ascii?Q?OsKUQB0zz5GQ/urPl+BKLO++4kOttUOdNxqCfsYihfeLs/mAPH0R9RtN3XEq?=
 =?us-ascii?Q?+Qgm564R+7sWsZ5eh9DeFWDww5KN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d6P8NBvS1BQ0zUZ0+JnyUyWhBnCShIQIsL5p5gB0GhcXbjq4cG2khnEBZ7Ym?=
 =?us-ascii?Q?Z4cPJx/z8B73r+ZYH+87bEFlsOYhu70ex8E9dXZCQ9CxnJT4FRy+UPgPQajz?=
 =?us-ascii?Q?RA7M8oD1HQTIS4AFc+je5jaRKm+j3RIO2MrfNh6PNpF+kn6qz1xngbVB5JIs?=
 =?us-ascii?Q?NDP6BTKVgtMEJ6KctV5zWtiSO9udgSLs0qtuEYzVkBVpHCSxN2fmC/7sz+4Z?=
 =?us-ascii?Q?9iF8wZmyapTag++jLQBrGEhOo13YBdWqdob1EmpYG0S3o3qT7114JG19TPW4?=
 =?us-ascii?Q?EKcT4ma8SniFJf3qHvMgl8HewucwZDdZFFtasy1IWHp+oI4HY4WDEDY8KqF7?=
 =?us-ascii?Q?NwxMVK1jj5qB2dPlMgTug+IWsgq1uBMLmdc6/r1jeJjwij23uHFYgl5ZSJ7q?=
 =?us-ascii?Q?TLB17Xyt7meEqL7+cWt6XgKfuelxKXQi/OEpx3U3APYzuyznMyAGnBfC4rCt?=
 =?us-ascii?Q?8SciUutlIVjXViv29kcNDD+KpX8XnZbssFtxG0ts0nvgndLx54oEDtOvcuF+?=
 =?us-ascii?Q?7AqPiEBcOMtTKcWm4JtFygq7PHhfZos+4+RSIdMh4Uih6+4Mv/0FAFzbre9n?=
 =?us-ascii?Q?pp7FWOK6PJxfRftftOdii2eLWXZeKYZA7/17RufDr0uWQ4AQ1tMxyHtGxWuv?=
 =?us-ascii?Q?Ws4NHlLg0dbMY0U6WFuPYAvSx8HcCVDfMkOWZde3NpKvuJOLEVsWsgl2Tsnv?=
 =?us-ascii?Q?frFuVpAIj3d0yOfpgmY5p8iZKBDkp4T0DrvHEqxrCPFYPkgpxUqL39FuR4SX?=
 =?us-ascii?Q?dmn9dLxs44cQWKZQymLF1W76r/SeNiXuQ8znIK2eaq1Ji4iTXks5SHieL5p2?=
 =?us-ascii?Q?mHJsVyuSE9oZpED5oe6pJjbkrvi/5r3or3CwtFf6zDyQPIYIStiEnXibjw5k?=
 =?us-ascii?Q?dJcwL++KzqLZW1ytcnoH7rwHVY+Zx0RUl2rBJM3kuzJ2B6GzKOW9bSdxWpvE?=
 =?us-ascii?Q?TbeEYvLkL7R9nR9xqP8u03aOtas8qq8PamrFhsj4KeSaiNoRQr4u2Ftfb/JD?=
 =?us-ascii?Q?jcyBlGxVxP5mxphzHX5iuQy7seFxQlUIhEJUNR3YxQtnmdWkNk7vjR5bFXYi?=
 =?us-ascii?Q?F9uPAxmbSpgmtlxQ7ebmcBHOakzsArLs9T8X1JPBpAgmeUtTgzDflX7aTkvv?=
 =?us-ascii?Q?hwG8sRlzIqtWn7Jr5QBfoKOam/f+KaSr+XOcTkDxxjhftjhgdGHhWym6mrpa?=
 =?us-ascii?Q?8imeptTcTelTag9mZuaElgMMezNIavVdJY0EIjtwIx4hcQDzzf32HvQLwHOw?=
 =?us-ascii?Q?8PfakB/bvBSnFTq72lEreID9Ffi6r6oPJo9PZThfyXCrGtK2DRYueKV1f33M?=
 =?us-ascii?Q?LrvjxuekA4HgvHSeNlhrVwr7H9/xsGSPJhtnPsnnfnNu9YdNA5jE4Mw/TyhA?=
 =?us-ascii?Q?pNh49VOlx5kWtbX1C88TOeHYTI3auQikxPilfpAkXbKLDVBwOInMHQhS5shT?=
 =?us-ascii?Q?Sl2uie2Ib1FrzLI2TvSjqrfTFUYKR1fOYk5ca/MTopff03Veq85EBQU2ttRR?=
 =?us-ascii?Q?zF6xutvw93sk8lFgtDqsd8lzDLlQ60OUSOC7dOawJe3G7bH8BYw+K/FY9xBJ?=
 =?us-ascii?Q?SEx7zWQvRO9YFbY1YcsOmX0sYvzTGQZ5eu1TFjElqBquQSe2N4xSsHtyTE52?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	safSdhLAF5gKdvKD+zFRTcYheIXK0AeIQkLEYtx0A3h1a50DpHORhhqLTHKGnqzNSHdMUhPGLuI1hZrlhnK08KuyjVK7ZZbflkIvRmpN/SZYYjxCzqnrbdSmihs8IC7WlfZrpOu2poZVnlkAEOJHj48sqtQrYX8AZn4q2wLGh+8aFPlh4AYe24JNCoDOrC7YUe1KjlTxvYALsCqyWMyGSsrkLOn0p8AGkTXe2KdB4ye9voXRP5lrox8Z8KpfLWJF4KF5AiDo1EFqv/KP5fashC0pOC9LvZ/acJ497d9mVQ6QQ36KvVe5uaRL81bFxafoXB9LBcPRaC5tED3NcVUeEtXyVvaqpbj/uU6F0+0QrGUJbb69NBapu6oGt7ebZvYhCTJR/2hTvMKnfzfKaOejHhdqhtC+W7qDQzm0vSmxU9iAbbZNpP+Xxl0K6pQ5AHhYcXXp84sROgzA4oyQqlLv8sT7B2o6xcsJN7NOqPTQri5+TrVYBjKzjilzjYPLWOmXQow/5ax6pce+elDwoJkfNHB/XhbOHFUUTpWWpATINbAjgve/fwz09lzmjfRKxFLnpnta8d/Fw0YaMfDDtBDITGLfa3L1vrGbwoPAFqokbf0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df94999-120e-467e-b01b-08dd521ed0a1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 02:24:06.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVs+Lit5X8wXq/biD3EuqN4bl2Fb6CaLeNmp1AOicWsADUERThsQEELZ9FuVpUqjJZdZ2mv+RtPcbVvC8whmFlTpnTjEheyq12nqQ/aTYCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502210015
X-Proofpoint-ORIG-GUID: 9uRLbpQlOlD-W4HfZKdPpVrnKf2OQkwX
X-Proofpoint-GUID: 9uRLbpQlOlD-W4HfZKdPpVrnKf2OQkwX


Bao,

> Since 'commit 104cd58d9af8 ("scsi: ufs: qcom: Remove support for host
> controllers older than v2.0")', some of the parameters passed into the
> ufs_qcom_cfg_timers() function have become dead code. Clean up
> ufs_qcom_cfg_timers() function to improve the readability.

Applied to 6.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

