Return-Path: <linux-arm-msm+bounces-25316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D72928096
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 04:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FE461F2101B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 02:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EFC14AA0;
	Fri,  5 Jul 2024 02:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ak7hr3or";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XmiNeA7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03877367;
	Fri,  5 Jul 2024 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720147754; cv=fail; b=niZkweGlZiSZ7YBQ3qv7C94gu0k9SihIN/wLIh8VYv0YjCpSXtN9KzhuUoPixK2qvvJ4q8Moyysl5+HeJ1XjM6m8WO1F9ee4/Y940Z53vELC9tT2gnIT6fANXiAf/w59CeO8yJpg3jHybXClENe2kRq9wVd3xvLFZGa7vhZr4Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720147754; c=relaxed/simple;
	bh=Aj64S0GQrPqYP6qpYs6aHrYeGsHR0cSYaHNTX7G+hLs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Fpu3c9o9KFkmBYnCn1dqDygk/A+T89vSomjuZfwKV+XnbjONu4CQge6T8HTrzPRWo37savK4WlXyPDZhvvRK37kyS+tzB7QGg59EjzNX0Kh9zqZ76QoUHQdhIr3QV0m4tce0CqS4lpRxa2cEz9jyEausGTPyUAtqI7Sz449OTNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ak7hr3or; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XmiNeA7A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464DoowA032193;
	Fri, 5 Jul 2024 02:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=rCbp4FFeU/MqwE
	MlE1FjNmsiOz3psDM/DJ1VLAMbntU=; b=Ak7hr3or6cbHsz8c78QRZvaaf/Q/R+
	lZtzP08zGE/6aKyNL/UG8G4yxG+ey5brG7hXyJE0/JjnDhoyxxptRHrEu5nSthhm
	hnstek8w2Z9+QbiehFOtiE51DyDfqu4QNn9xj5criYcncYdoDv/CjSwdjtQNCM6s
	8+e5qwX7BtbYv2hp3OaqJJjvnU4vI2l6/Dq7kAmtanTvKMU+uKI/lioB3mkDb4Kt
	PzGRBEOEsrCZt+KpM3fKY5d+dvhUwJbNR6yD0J5GPZDX3X8gXAXkQl2KSAjZ+UAR
	k0lP98UBO7izhV+gk11zODFtsLhVTKutpttN11+/qGeb4lz//+xDbyQg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 402a59as70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 02:49:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 464MqmZc021495;
	Fri, 5 Jul 2024 02:49:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qgy70m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 02:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgV24ghybVwHpbY/NYGgfcEbNTuIqot7Iyaw3iCn0JJND+E5F9fXhKQygFklHgvCH0zrpERYYyoJVyPSU0o9MsQ+i18QvL4wRM5xbpMFHPpcYi+ZUlgBbs9TixCu385YUFYOc5K/f0+YzP2mMJ7g03BcEfWQWGeeaws4zVyGW7Gt/E55+ZSd2+6oVQQnU5F4Mooz3X9cXARNf5V4o2K8do3hMPJbIHtjXxsVdcg7HQXIMQc6N3tE7/E9y+aXlF3AmmxUkBC+DPZ+ictZmXdfrEtVNpDT7ssFnnLSlhuJghDQ0i8gl26abMXSvYvzPDgHvSz1QRzhVnQO0AKOdHqF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCbp4FFeU/MqwEMlE1FjNmsiOz3psDM/DJ1VLAMbntU=;
 b=HMjO2FVXHmAU7oOOiHqtyBP/OKJ0cPGbzCCCdsiFDMrlOT/8kbKHiJmHTK/6JMEMXIjsskFE3A5/xP2gHtbEXzkHdJJdUqbkExlV0elUfUkwIpIDWkWmk6mNuRRngeG0OGxL0hgO2jS6auBGKjflZED1AJnudzkZYhEVC5iMaja1vSST0KwdtEESMuNlp8wVNTemG/Yss497aIODTyjFhQ9Q1ssEmEnwc4NfYVQoY6ssdiX8ypYEiTskBPcoQMzY4evT95GK5EfmbPg3zWMwCG2BIA+pGWAjjEPgeHLh98lJfRY85dxLuuQuWRTXPjOFP3usUG7kaKmsrzqSiUsf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCbp4FFeU/MqwEMlE1FjNmsiOz3psDM/DJ1VLAMbntU=;
 b=XmiNeA7AtLPeW3k03K+TPRN73Gsozr0PqV1U9Ar9HPtqICsCfT8hAErLy77awXVljprifVpA+kdJQpt5pmkVjOITbznlXH6S5QNizjSO88UhwFIwKtGABV6a6MKamwtKTbGx3pj8NgegH5tYm5xIx9pRd47ElIucExnYfXipz6s=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CH0PR10MB4874.namprd10.prod.outlook.com (2603:10b6:610:c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 02:49:01 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7719.029; Fri, 5 Jul 2024
 02:49:01 +0000
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_pragalla@quicinc.com, quic_nitirawa@quicinc.com
Subject: Re: [PATCH V2 0/2] Suspend clk scaling when there is no request
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com> (Ram Prakash
	Gupta's message of "Thu, 27 Jun 2024 14:07:54 +0530")
Organization: Oracle Corporation
Message-ID: <yq18qygblkd.fsf@ca-mkp.ca.oracle.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Date: Thu, 04 Jul 2024 22:48:58 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:91::21) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|CH0PR10MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd2eedd-eed0-4c13-7fa4-08dc9c9d0646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f3Ily36+mpahbBXuWdyZ39tHMZqbJBbtFELu64kC6OlsgM3WGMh8iX01iPQw?=
 =?us-ascii?Q?tUlF7oqV5guA0DIymmjCJi+XpyweOxPlyPNlcB/gocqnXYGeNNLPxAq0XI+5?=
 =?us-ascii?Q?gMiAppPbt0EpEhTGysqcbOY/n/H1yeLVf0Ag9Gwk/3L/SwEdH5Ch0URsejaY?=
 =?us-ascii?Q?NTdBQ/iz6dPdtYuUi6GJ4hagHx5hahpJN0hlvxHos1pN3h1lL3SGOfZ9N7WA?=
 =?us-ascii?Q?HGmin0mTjI6oiL35dotnUMYkvwSn54kvUejJYoO+RNvSZFYVjy2JeKhOTI49?=
 =?us-ascii?Q?GWXL99wW9mNuxD3Z3YgMZzKHv7qLuCb5QAptm/x5ixy6qI249GzMh6+8q3Zl?=
 =?us-ascii?Q?rs3o86TJJomXcfWI8zkYeBU5Ovd9duJkE+Cp7isFKtAECeWAKqm1uqyyu1QL?=
 =?us-ascii?Q?C/NJMzOE8Oudob/hgtSsf60FuWAzlfjSh8iqAvfegLTOguZKHyA56BWBBL1I?=
 =?us-ascii?Q?Os7peCaD7mpy4oI7pldJRmZQ8YaPe2vbkXqUmPW2Lqj+pgasxOWzYwLhy/Yk?=
 =?us-ascii?Q?6gmEInuXuYL7EaHNhg3oKMVbo7m3/1C1DxNGpSk2vygf1+18iKXeytx4Zsqq?=
 =?us-ascii?Q?u860PswUG9fo4Xf9Gdhn2SHlQ/lS0ttyvDj3x16sEX4GUXiXOrSmU6/9UKBb?=
 =?us-ascii?Q?jxvn1tuqjbynMCniWF7H1QyRN3SyHAb7ddeo1GzdRA8/lXlV22MepuxsqpKc?=
 =?us-ascii?Q?HrSUi7RRAxaEH1nsUhKdumrfsm2YBKwXWaMEbU9E0M1qgtG8F8m25wZg185d?=
 =?us-ascii?Q?YY/XnFK79fs6DXbCI7/dgqA8gTwz80+ZK9BkLdvRjkxcFK6wwTf7hwkQItVC?=
 =?us-ascii?Q?5UXtxwCDiZaPe51zHpI6yerZfCuEo7qquIpepzJD4dBw4OG0aIMYqgr3MjQs?=
 =?us-ascii?Q?FGV1zB8rcGbh4UjcpXORpoHUclIE/kxcQ22BDU87nAq1Uusx75rk1fsdhHd8?=
 =?us-ascii?Q?l5PW0id+NEQQ9/uAYSjRBRpq/Uan0zzhioLyrjGhHoc1zEJhEvH1cM2Jd4a6?=
 =?us-ascii?Q?GLl8r5p/YbVo9O0B1AymhdJGYDWMuYabnS53X8NECB4yX8dyqyLAj6Xb3OFs?=
 =?us-ascii?Q?aklsMYqgPrGFnQk8A08MT05O5fNOr5oC9NjP7jWNOPicghKd+dacqLT4OORP?=
 =?us-ascii?Q?D32BcaAg32HgKWxN3aXX61wP1YprA4QXfDnyp0QFNC2Drnnw/RJKMJT3bM94?=
 =?us-ascii?Q?vGTHg6CPVOPw+PImHGxxslKZGpJqvQSpw2JbIQUk2Zr17WOQkCDnNN0yv0MC?=
 =?us-ascii?Q?RZoKq5/qv4sBGd5t9sPgLniGDVwy186OgzqVRaRaKGQtHqZGbWM9omNXVpxo?=
 =?us-ascii?Q?xGRLVjHgYVCeHu8Qy5I3mjo6fBgPQsWsb7az3ymBdlkJ/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LcaSLJuxzLSqVJGB6l6CBsivHIGT0AdnARfxYrtti4b8JikvFtQowGVExc7u?=
 =?us-ascii?Q?xnS4Jl5xAhA5NZqTWtt25oIrO/rA4CvzYAUDwXYgoPWFYd6sepBkJFXVLYy6?=
 =?us-ascii?Q?vSs2pR6jCTK+V8WD2X+Uv5IEBfHjJd+Ndpk2cdKDqPYE1N0mNVQed53b6z/I?=
 =?us-ascii?Q?eQuV6tFSdb5ShPVfoQRMvH0tFoX3aEb7h+CQGGOQVUDyhoK5JHIExu0N7pTk?=
 =?us-ascii?Q?4tY0N/LXQI2zrO+1ba1uAUB2/OtXB7bHsKxfVV5KP2nH5loKYWOI4L1Soq9p?=
 =?us-ascii?Q?CgG7Y75rGkz6dcDrIrEUGjFQKr1jW7/PSCucd4mHds+3WoD4RRTFn87/n/hE?=
 =?us-ascii?Q?k22xcAfAjavYXzbyA1aeUi51f08YNdSJSZOzmLNYfvip6p0W9zFxbc6VJvQd?=
 =?us-ascii?Q?nncvnN9VtNjWKrFmc+2dxEsSpo71bkGCzY2e8tDa+axwPbWvxIoE4ahDtyy1?=
 =?us-ascii?Q?G3YWHP8+8H2xR0n2e3AdENb4kZMDDqtKcAiCqAbLFrgLJdWk9U38bO3EYJRa?=
 =?us-ascii?Q?GfoGLDT4Qfyza4xcB3fH0R9rYWBm0Q+M0i97i7LhAPnPa2LJTnPyW8auZz6W?=
 =?us-ascii?Q?q5tT3VpDDHnae0ltYsxDilc5nzdMhjWJPsfHq2+DUpvv3lB6lh1CToBLj6yn?=
 =?us-ascii?Q?ygVVjDdPTA5ZMTvZjZWQkn/BdA66zmfMDIDMBMva1UPovDxZlhbdH3wIZn1T?=
 =?us-ascii?Q?MaZaggxMh8cMUSqPDmHvpmzjxTAJyFmqWkoQxERXipHi3jv63MplcLornByP?=
 =?us-ascii?Q?JAd67jNTVH0PmeKW7qS1S54wjPZAcRN5WeNoFqdM53dxaZZR1wMaklL0neE9?=
 =?us-ascii?Q?XSnCkSL6CLYQAmz1Klyi4lrOzuoRft1Aym98r/LWNmXo7OGNVePHIecpLMxJ?=
 =?us-ascii?Q?zficUo1krFqu9Jxuv4h4WbkbBAHErzYxyURsr9swgLZQYvfJ4d74nK5gBkmo?=
 =?us-ascii?Q?hw1S3nsODQJXjXN13O/p6nJbR9uiDSc/FuL6B2Yao0DLZvrRVa94OSNvqB4s?=
 =?us-ascii?Q?k8FhPODd5JlYfcXPe3RimLNxIz8+uI0lmZuc+2iX5zn6KwAgm+iNbWYDskm3?=
 =?us-ascii?Q?Ol4tJoiljko2NsmtEKjGeyHOr3QQnNKTwoFYA2tdCyTnUy6aJDLinUauuVfn?=
 =?us-ascii?Q?CAHLvXd69SxIdLiqsc4AHTrTOXEyEdLIcl1hmNhAB6Z8fdMy5rMaSaMBubKr?=
 =?us-ascii?Q?98lAyhMmia08X8/icvcrnHvRCjRRkXQZHvdfEfD/fyBd+UsAAH/cUgz61/44?=
 =?us-ascii?Q?UTFG3iv+Oju60cYlcdBA06U3+la/1lC139W3v44OjhflfkrqnY0g6dpuEo41?=
 =?us-ascii?Q?dWk7ehu4Y2oAd4Cc8GtYp3MIAjpnYr1hl0pQw3pT09As1pu5KIqdeY6AW8io?=
 =?us-ascii?Q?CSZM2bWXyQjRjUPFuYGqakyREUpIryY3NuWGGr+EEtdH4wYBuKwUYvKP0RY/?=
 =?us-ascii?Q?TagyrIRfnubPgA7v0QrpXDPN4kDe4g2O0H8MXT8ol1SJL96Qx01I8GsFgTP+?=
 =?us-ascii?Q?MUX5BBuVfEFzXE+uw/DGy7kgaJ1asopK5HIJyPs/TmZXmf14zDEnwWnYa6si?=
 =?us-ascii?Q?dL+nEsOP1ITobf+fKK1SCakKxIjH6h3+8O7As0ULbe0fl5BfOe/rXRcXiCuW?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lARidyHcjcduwySDhvbGW455kHmgqLmF+LNtcD/f4aMxSh35gtIdUGAqbx9++BytdIP48u0+/g4EuXyJNhupbHCcEfGfMa7wJQLrsrKy3bl4G5rH05FC7Z+FsU2MgZP17yDe/WboGTiI6/9Ae2nyW2ui5Oz09eyQtanyUqUO0zz/6SaytQeGn6tHg1zPbi8ou7dnoj//s47swG5UrN9rFtQR2MiEWwEFo0eSkexDgcaEWes7dLjuOdSFtOm/fFojrH+FflZktrj7cVxLQCrdevE1BaA6KBVfDB3CbepQU1jbHN2+J6oPHJQ9S6jWUG18tJN6rEb2F590RiEsezEE778HfDB1UCymVKX98M6pzUx2x4G6l1AikKFwEMpzUSF9wAZYQGfGAKHz7/BMVlO5vexx9ERSSzm/dvzkhePvXOgIk4A/1jIgMHpvAXyunCqdMDs0f/0tYck0pTA9LgdifL4UW1U4hIQUYr0st4EqUBgkKMbi9XvKJE6NRYKUooIFohhjuY0aRWSA5tN2kkYUe5WL9MPHtUiOibbcXOg4TD+wVXugquSGwrMj3y+bBIsNDeFlXnsPldC5gTpHxskxatcmSbFw3ZP3fDultbKwwhs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd2eedd-eed0-4c13-7fa4-08dc9c9d0646
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 02:49:00.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMXrVMCLsDDdPQC6Z9BXGctO4/ofiHF/EMbcjIwru7U8rAxawzwSXd60R8kTM+HBbs+AxL9Hyti69Lc2RiXU72NGrgUCPEXyqSbAqlgsDMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4874
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_21,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=795 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407050019
X-Proofpoint-GUID: HiIRdU3bsbN1u-a5GVW6L3x5t2cX6jNw
X-Proofpoint-ORIG-GUID: HiIRdU3bsbN1u-a5GVW6L3x5t2cX6jNw


Ram,

> Currently ufs clk scaling is getting suspended only when the clks are
> scaled down, but next when high load is generated its adding a huge
> amount of latency in scaling up the clk and complete the request post
> that.

Applied to 6.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

