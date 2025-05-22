Return-Path: <linux-arm-msm+bounces-59059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EBAC0E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DD9018893F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9620B28D8FF;
	Thu, 22 May 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="0RZeRKQt";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="liOO39DW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4528D8D1;
	Thu, 22 May 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924559; cv=fail; b=ngvzW5wwKUtfm8albhXykoSGEzMI/Pna7Tz9YccApmbkSRJlb+4qbVyBWLLzmH7C1mrdK0hpzrvXQz6ZZrMiaOB6XwVjxd8XenMFkmxfK7UqhxtI3l5HC5otEUEL0rXFRt6OkRnW6q2/DIww4WQNRAQdV6+mpN1m9ucs/qmxjlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924559; c=relaxed/simple;
	bh=U/+oNXbEn1dFTfKnbu212IOdZtWWT2FHHuLvLle3r4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjI2oMyBAnOoj59kFoXDyjaWIkW1cDenPBU95MlSTDIR2WBHj7rxNz1T5gIE6y9wkk7tXUD1YQf1rKhV3UEuxMWGQf28zRnsf+Ywx2MreD0aAX7OIx5/GR7N78+sudXwlQPQg96MY3SMoqj+qW4M2yX3TrTqGYUOv8DRv/nE94w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=0RZeRKQt; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=liOO39DW; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4j0Hx024668;
	Thu, 22 May 2025 16:35:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	NjIwBOrfrzEN9jcd0DxgBkFZRQvbJhuE3We2xHdp6Kg=; b=0RZeRKQtUyxg+apT
	KAMsbjH3Hq5o2dkjizChO046boE4pXakS/cLTlSouVacxRB3gf3aVdC7siIODNPe
	u+iOxYMTKL2/0N79oorJxAkeAiXD2y2p05fh2sxU9LsoLRC8mH7e6nWEWdftlHj/
	mtwp73Z3hI3ZZJZS1U9APIQTQ/Z/CnPcYLTB+d+pjFCKzyKrzwxRKA/sp01/CLJd
	qyAl98idHRivj6LpE3L6rfZUdjIR8ApvL/EkYAKLlpPmnqtTjFkGrDd/UXCmruQ5
	TfuhYBfCQfs8OZDFotiVrZ1gyAsUkWgeIxrAz00UH2Xm8++7qa5yNUmVIK1gochI
	B9MS5g==
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3ju5q-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 16:35:40 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yboS/95IBfiDxgjnRJR66z1ZEh6XTA1t4eogL5XYVc7mf6lSWPnfw28odn6Y/wBN/5BWWCy0tnLTc9uquiZ8Y9gbnT1TlN42Wj/wlNN2VQgbNjcuz43SfheHbM8AsUj1FZf5Yp6MRiL3mRKItOMlc+TEMb+YN6wrG2hA9XmteaeFBzNpgtpDPkuiVEjbMw8ZnPr5jPtvWgl+v9ohKPT+CEeEoYZwyp1l3/1lm4eygPcGDSZmdHlbHA2p033PDeP1Rk8Ag1lJeR0a9kGzzpRfXGR8cFEGTmBxiRExrx95lyOWzobgx46wcDLCYRDtpgof9LtApSAj9DHvQVw9dGEDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjIwBOrfrzEN9jcd0DxgBkFZRQvbJhuE3We2xHdp6Kg=;
 b=Wem0WohhWq/70nN7pqR9g+QY1CmbT6WBLS9z9cnZzX2Tz/LnX6SqzZxBq4tsZ4c9V0nLunAGYDF7QD/8VFn2KKCFghgAXf6EOglKfprp+dLZnWWWL4elEFYKq2ASn15KutluYSSbl8owMnhQZrwIBrG/uSvoSluNAjFp0clulh9+LH41Kuf/R9oIlKUaSYMyDEiUkkTq7td8RTMYBlA9Sma/JCvK9Bt4wSPhnwKw6laiu0nyQZiCNwblKYhcpwaBmN3c01Cye2CDlgMBnTyFSEuPjiIbR7eTdYTARio4z1NTEkJ7TgWmpeXdkwcNJEjsJLHlBXGhzYdKudlLcn1dGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjIwBOrfrzEN9jcd0DxgBkFZRQvbJhuE3We2xHdp6Kg=;
 b=liOO39DWluLSQjMOY8oR0OP/GBCCnotiHTWknt628Pj5d8mmBNRO0XjfVhtUwdvycDSNw9yegAfV7dXxLZwio7PQYcP4GHVw8HpJSbaS8ZEw0gmOmOnzjjcpVRqvA/MK5Zysw9pL/aqvFO3BlMqDeisLvrXyZLub30SpKk0FFTI=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PR3P192MB0682.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 14:35:39 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 14:35:39 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Date: Thu, 22 May 2025 16:35:30 +0200
Message-Id: <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::30) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PR3P192MB0682:EE_
X-MS-Office365-Filtering-Correlation-Id: 226ff186-0fd7-4b62-6d85-08dd993dec62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E42EOv0tlIW8bdE/tPAhHuLSCFKfELQ2e4zQ+TaIwo4bC461/U5Xm5JmJVcZ?=
 =?us-ascii?Q?nSBelmDhW030OVI9cFy/Er9vX5GzFkOKvOtiQxbm3WcGY9DBPFyFx74BUhoP?=
 =?us-ascii?Q?Bas0MGWN9oMQQtoe6aBg1KD1aHmsrH85nMqN5YGWelxappEn28vY9lgbKM3k?=
 =?us-ascii?Q?noGlkQIw6CMybzRLPAbSkKpSgbthd5HTQL30Hj5VEDbcJ2i09Ksl/qtF5D9/?=
 =?us-ascii?Q?Ps3RLlyvsQ+FNaHEz+ao0uM1XaQ+uLqDTItIu146fKlopGqAWzarklZhnLis?=
 =?us-ascii?Q?u7MJfiFwDQ9/epVe0tNoe2lhPNdnc4My2wJzcW1DZFtW/BP/t9D8+slg5aXW?=
 =?us-ascii?Q?J4SygJ+jvaJfAy7vSdYF7SzWyBFYZlyyOyM3OQjeKpBClMMQMlbyUlsUScNm?=
 =?us-ascii?Q?yQUTVivbMyDZDy4dEI9BIzgxm4H+8oOjP8Unc3HLPJT+Ukj8g1Ao/YW67rPp?=
 =?us-ascii?Q?Wzh6iwgr7thIQXCq/dy7UxB+beLuUolXhSj1+voQKy361r31NeQR9BiBc6qj?=
 =?us-ascii?Q?FELIBls8WpzxWwVegsfFvjFOSeb4yyT0b1o+tujEg15RWhHE33bvKMCfjcHp?=
 =?us-ascii?Q?WBaNkdhNZL1MfS10qXTJLUkf6H9k9bpwDgWDBn6CvIDcVXkxAjQ/Tg5cwBYL?=
 =?us-ascii?Q?rK6q1khsCFYGb2iWawyZRSPnQhXqr4blz5ZnKEZHWC7MVGRnfd8l8a3p0aoj?=
 =?us-ascii?Q?ebAWA4JM5A4+MBUhxPnP8noIZQozC7U5qHGkvXvIYrhIHWkwMniJhb7q76RT?=
 =?us-ascii?Q?8Mo0xkN8Kaw9kv5BAsYw2pTtcDbZkQ6Ro06YGsnO98ZGyZEj4YyVbzl8WMw2?=
 =?us-ascii?Q?LSHrwnfvt6HPZMAE2CVqlDcfRjb0dbMVqS7byEauyW/bGWXkF7fwoj/2hmib?=
 =?us-ascii?Q?Yyu0eFXDezzNYmr74JI95SwtJrocKD5mnhqO+x8dt3q1ENreiSIahqWd1uOT?=
 =?us-ascii?Q?Vt4z4CohFqsLAJsIkfPTIR4VlSs6xXJiPgYHdfYJ+yts9MBMK5z7piDWAfah?=
 =?us-ascii?Q?OaOMp2WoIpWY1BMTc64h8FFxnQvGY7rtLaCgA6+Bcx79eHORA+g/GMGwOTnj?=
 =?us-ascii?Q?42G1Q1j5hmCfCvt+MwymqYSNAxWQP8sB357TZGvirFLMs0K2ikTiZLa5FVNV?=
 =?us-ascii?Q?vvexu/AM4QcpQ6XFRZKImULeKR2mfFu/4ljCWiecqkS7A3i0ehCTV6lqK3Np?=
 =?us-ascii?Q?Hz0sLRWS5XLLkGhwmVhhEEduf7YavWUjCoGGGsHxsvodhr4+DV7m0S4fZbrL?=
 =?us-ascii?Q?exTR3fbj0s+CJJtWscmOBYU0rz2FYvfNbYC5SqYRABTf76IJ43E3bBKqQmu8?=
 =?us-ascii?Q?amrsWWIzcigI+KXpbDZHHLlkYXT3T3PZ2iQ+JZBZhytegZ1Vlpi0VljDXCMs?=
 =?us-ascii?Q?ijBtPsrv92tt6xHbW/H+hPsx6FhwHpFJpFAkQE6kQx7c2oj+q5Tt4Z/47sz6?=
 =?us-ascii?Q?FVBXzBhJDGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1k4+j2ii0p9XTnFJ3O6UzaENT5J+/xU9B+kpUOxzpeERC0/QXfocOG0kUrGR?=
 =?us-ascii?Q?7hl+jFVT2wJ3QYnkDyx7hPEMOo2S1py+C2g9pbq0p/sRNehPE9t6NHh3/wbN?=
 =?us-ascii?Q?uKdxzcgwzZX2ncTPDdA2lPLdjs3Bv50NRa1tBhfpBaUzGh+60t/OfhHALFC+?=
 =?us-ascii?Q?5MCnLRHGOwFt173EpCWjB1LEjWxrP73OMEf3aLUrKd22mRJMzuT3JNvye5Nj?=
 =?us-ascii?Q?fggX47r3NDKrdXC44c5mYvC57QyqtnIqpEJnRFbCIAra/ApWSogY/XJZxqxl?=
 =?us-ascii?Q?RyJzchdCr364/hD+GZ7AJcmxf79nc2XZ9jPJURsK3wgR1taA+r0fxU7rjFSI?=
 =?us-ascii?Q?sN+EB71OKcOiLOUkSD3YBSeKNCGzJmu3N/1tBZYcdRRwwIDNzk7HnqOT7qJl?=
 =?us-ascii?Q?dB0V+UhrLEVr4yFhZlbCKofqDnsSguh2+xe3Ix1R8PxxJN52BfPVOK652Tfo?=
 =?us-ascii?Q?gVb7XtuQDbHF5iksviRkGyjHr070jrnZCSBg41wiDCtRHpOs2pMRy8gkOX9z?=
 =?us-ascii?Q?zAzxQ6F4jJFghxRhWycX6Sp4VLgpZC/I4rrRCgfcSmtr/sZo6XVcLx11EliY?=
 =?us-ascii?Q?eL1SpxA9Zk6GccFiuE+6QhcE34edbz7H8tYkcujXhuBz4FTSujNSUnY82D0E?=
 =?us-ascii?Q?22CMeBWVZLzl8FuH1e8iNKPq0tSYqPiC+NSaBuZDNrxxtRgYPBwv3723S6ae?=
 =?us-ascii?Q?e2iUGDGCr+HMELaAMZxBsr0/VxFtulKtZ1/35JX/SvmyuNuMUFI8nRZTMgbX?=
 =?us-ascii?Q?bfwWsEWZW18C9x5MQMrFG9vyqqQ2LriDfhstFUylDSAKG8mOoxFwzn9kyVA+?=
 =?us-ascii?Q?zwG9XFaRlfplCg6LppSJPEaCaleqidqFDdK2JpGSFp6H68t/cYrfnR2N6EUF?=
 =?us-ascii?Q?q1U44NsQJSClqm44qXzSOl57v2JGFdSrKiU76PuMbbCmFZy75Hb8w2JaRvIf?=
 =?us-ascii?Q?iOXfJE0PLClYaZUnyL/LFKR9hqTeiYORfDF1Odi7GHsOvvAFY3exymoSYk0n?=
 =?us-ascii?Q?qHdKZ/sslCTNg67Rp+TT4GIOZ53N6Xe35eWVvo+oSlN4ckFzAdn3Jq3jLja8?=
 =?us-ascii?Q?NgAY9df9f5NK6/In8fvQgvKZxH0yKZdHdtq+MHCrOR4AV2H2aoM+MEkOOOKQ?=
 =?us-ascii?Q?Y9/AwjQFUVCeFu4rMhxRp7LCrDvxvFtgO0YpSywhbtqr4xjhJeY4864qCygX?=
 =?us-ascii?Q?d2ROTWcIRg/P4n98rrQ5xbFFUEHaWS/KkSTW2Q1snKHzOcN2LBqFflsVxpmR?=
 =?us-ascii?Q?hquws3b+W8NjkTFzg4/miBNHqrO1Et4vPGPuk2qq1MmpbGp+LH+96jqlb3wx?=
 =?us-ascii?Q?NiLIdDWn7q2jJ3QuYry1l7QwksEFvuY/Z3NW49WlQ0rbVJREumdG+gMUkxW0?=
 =?us-ascii?Q?WwH4nw+jbC2KIM7ineCWwQf1RTVHdAFCBiY9K2YdVOXIxxrub7xU8lGM914C?=
 =?us-ascii?Q?vSyMJDptdjvnqjEgG/8dBn25W8WuHPNU3tHftXD04fDEWyl5yXoltFFiUUCR?=
 =?us-ascii?Q?ovUcH9he9v8Mh8CxqhbCOXf+s8X7tq7HxSpthdW/HN8TIx1Q9oYV5Wbj7Z09?=
 =?us-ascii?Q?8dXJUwGZXDXPO6wpYpqPtS3xPlw8uYkUWxe4dQbP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XIZn6gdWiFEksHyVohUUeIO31/DPjMUyqAdmv0SM56N3zg1nBDP4ZmxsfJS3u3ygL2B8jW4vVjSfoHPDpMbggz45LFkT6cSoCUE1jgWlUaSjl3cmb+6IitYSOlqDSGRVXKmxn1TF4xygJ114pO5YNv3SlgE3R/pff7rODGf518ptTlrzqCf1oD6e4zRM7li6OMb94Mylww3V1UYeNnrHWxArmeDD5A7z5FthGLVi/cneEgx9VFtpbu3nOtWi09VKi/mVYXgtd7WqiitkvxfRj+MSRsbbkC+CUaUnFOaV34kANB+DNquq7cz5z5uM8yVzOn8SHFD+O6xVw0KmMa03dtVYg7iHRgVRaQR+8aQBFgQRO67SxF4dmozH5sEai6ujSC6zJZV52j3zx7QadNEQoRSSiptfKspujXLBHgmTuBPAEUHHeFtczRsLaacIAckNf/SLh5JeUWWySvVvKQd+P62yB5d/SeSi+M2ttZibqPR5UAr2PadN2PEYvdWnlenqu5VP4L5mr7DoblMeoO4XRAB58mXjke7iDaIQijRYReeNn03kGQj5Qiiw9+pxEs7DHLoCrVgZpmkT2dj7ARFHV1w+P3xUnoCz0gjeQYYawF4JkH5ECj2quNmDzbCqMkm5
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226ff186-0fd7-4b62-6d85-08dd993dec62
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:39.5326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjwTNmjeC9fdtOjahmJCdl/P9hDkIpSjfjXmzN3785yYcEFKPWFt8zPD/QNYvzhSm14hRJ5uX2cBQNa8sYAbvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0682
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0682.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE0OCBTYWx0ZWRfX83sC6GjBZ4TO WfWwQt1Hyz4Hk0SvyYnOYiidVOxx0QmQSVY3RL4gaV8FcLek/S6dNjI6WFbvAxtc3eLuJIuX62h 5kxE/LYdOCUJPXgsEtBF7GFiQG3Mr54ibO4P4sV/uLClLyccHSmtTPvInO232u9fy0wtaV6ZOiq
 2XzmqFomcWrEijV8wf3lvJJWl7iOU0wgZIkEKCNpMvDsatby8BWJ7kw2lBcKCKghWjZ9AWlK1br 9xWbaFK9xiI+uBrIOmVutD2lP9LphkJhP6wvAcEJqzPuAWmMh/HV3mmrinJMJMWx5lmriG7AtRS j8mUleEjdjleo1eo4ieh9vmrqlo0yMQprLXhX84YCZqq7waHJ+XsfVv6mBEYxRCE8jxQOz2WzWF
 2tPyuE7D/R8ZIfTpOAGFNITfMmsl+B0Pxz0LL0kaV3E+Ht7eK07Ozod0ax3bYE1zxwnH9Ids
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682f363c cx=c_pps a=ZbF0nDb3NYyigRfKXiLIKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=T0L45qBzl8X6T0AR6ckA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: BD9reDSgNGQbI1yYGe7rB5-bEIfr112Z
X-Proofpoint-ORIG-GUID: BD9reDSgNGQbI1yYGe7rB5-bEIfr112Z

The members of QMI header have to be swapped on big endian platforms. Use
__le16 types instead of u16 ones.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c    | 6 +++---
 drivers/soc/qcom/qmi_interface.c | 6 +++---
 include/linux/soc/qcom/qmi.h     | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index dafe0a4c202e..7660a960fb45 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -776,9 +776,9 @@ void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
 
 	hdr = msg;
 	hdr->type = type;
-	hdr->txn_id = txn_id;
-	hdr->msg_id = msg_id;
-	hdr->msg_len = msglen;
+	hdr->txn_id = cpu_to_le16(txn_id);
+	hdr->msg_id = cpu_to_le16(msg_id);
+	hdr->msg_len = cpu_to_le16(msglen);
 
 	*len = sizeof(*hdr) + msglen;
 
diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index bc6d6379d8b1..6500f863aae5 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -400,7 +400,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
 
 	for (handler = qmi->handlers; handler->fn; handler++) {
 		if (handler->type == hdr->type &&
-		    handler->msg_id == hdr->msg_id)
+		    handler->msg_id == le16_to_cpu(hdr->msg_id))
 			break;
 	}
 
@@ -488,7 +488,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-		txn = idr_find(&qmi->txns, hdr->txn_id);
+		txn = idr_find(&qmi->txns, le16_to_cpu(hdr->txn_id));
 
 		/* Ignore unexpected responses */
 		if (!txn) {
@@ -514,7 +514,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 	} else {
 		/* Create a txn based on the txn_id of the incoming message */
 		memset(&tmp_txn, 0, sizeof(tmp_txn));
-		tmp_txn.id = hdr->txn_id;
+		tmp_txn.id = le16_to_cpu(hdr->txn_id);
 
 		qmi_invoke_handler(qmi, sq, &tmp_txn, buf, len);
 	}
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..291cdc7ef49c 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -24,9 +24,9 @@ struct socket;
  */
 struct qmi_header {
 	u8 type;
-	u16 txn_id;
-	u16 msg_id;
-	u16 msg_len;
+	__le16 txn_id;
+	__le16 msg_id;
+	__le16 msg_len;
 } __packed;
 
 #define QMI_REQUEST	0
-- 
2.34.1


