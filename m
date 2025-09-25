Return-Path: <linux-arm-msm+bounces-74884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF90B9D321
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABD0F171A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4AE2E7BA7;
	Thu, 25 Sep 2025 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="POpDMIBF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m9DBktkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943292E7179;
	Thu, 25 Sep 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767450; cv=fail; b=kLwNLnIA12PFI5qjsjWVNoFsdRJT30K1Ph4PZ+C1WR27fV+4ZCKHuetKTNJ262JpSN6MTPbNXtOnIgb6q2jQeBpaT1wBjzHHk6QdpRRt2wxu4epIpzuPZtwvN75i2jeMakAsrsSuGBYYStpUHaoyJ7WkilnpSxRyEw6SFolSkDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767450; c=relaxed/simple;
	bh=ZDHjrnQa/rp3Y+xv63artqjOi/I0NmiOzJaGUPRnRM0=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=rQEZp5UgfWef5stb9CfW7zbjbioPHtFXkNLPFrEa56yjIHBousZV0bNFTXoZ37bT1wEZ/jY5RF9sKBVtTTaFsCcViHz8NdEdAuFDFYPG+R0LjJlh5LKdltb1+S/INFQHgfcjjFO+eqWln97vr2jqUkP7HoRz/HBm5LUWiVSHbOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=POpDMIBF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m9DBktkb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OIu2re016551;
	Thu, 25 Sep 2025 02:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QQuUDVysTXvCOCdC0O
	FmwN2KlA/E6VeW33OKh2YfKL0=; b=POpDMIBFWqQWq3bhGM8bznLvqfrYNKn//1
	8Brf2JlxPdJXDURDw0KKtE8spt4Mq5WTfoBGoeCYT2+mOkQ0ltYAmdig4zwekPmG
	xC/GPmgmvdTODN0Jxfg6KM4hge4lasJkEh1gZmSvmcsNenkuUOgJexvAF/w/dWJT
	luOmnWoEGWFH75PMrXyhnYue4B8htYoUo/e1/Z/ZwZxhj5Qca9Zhrq02GIXCinwL
	iIpoU4Juz+XOdFJ2fdhIcFeq4KS3ZeH3UaATcM5oFdYBt88JgalBdyI62SfL9EIL
	mzDZbnZl1rUvepgopzpW/BzJ8fPyXxxDZ/VP6z/EOeJq3S8BTQkQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499jpdrx29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 02:30:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58P03uRt014842;
	Thu, 25 Sep 2025 02:30:34 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010006.outbound.protection.outlook.com [40.93.198.6])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49a951h17f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 02:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VODreN16mvVflmhWYgTtZMT3iYCNb55ScsIO5VkteOacXy2QMVILxZw2oKBeC6mhVibZFFpaUgzx72/CbEIUwYLemRW9Of4PGu/RnZ5KuUBQWGPnRO4d37Ss2vpKho52MU84uug2NWgaI/mxwB8StPA0s9DZF59W62P3ByfSQ8nF39R8I2pWLzyr03XwoUUVOiV6KznleE5zIRjKAQ5geFQqdG/oON4TbVID+0aCrPS4KRScmeCdneSMGgJ0V5/whf6fVGNR0B0HzH6PJIaQ4pyZ5TZcTDiUmz6Xs9dZh9/A2jhwD7LIiUaLe0V27VKyVBWCNR8kztJ7wMrmhYtJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQuUDVysTXvCOCdC0OFmwN2KlA/E6VeW33OKh2YfKL0=;
 b=ILm79q1fYjGPirZbVi5Yoaz8/5auZs1b/SY+goqXUncgh9+YZ0nOAt1TZ80Tr0VbQ46BYCrFkzF+VcBJeGg/SAYPFbJkbPS/AxsYc0dWhx56cA6/gtUWWboA2YgnNPuDO/PB/Kxv8VEuD+u47m+gbpqqzx2a4/Ip43uevYDc18PeAFu/9ZRN+Xpf9/JPQSL/220Q2zJDzaGvkOLWAN3IFSo5uHJOe/bcGyhq64SvpKHqt4Acpu9fmX7wDwP1CP4lju3KH1jxGrcoyWRWXdLP0PCIa2+OXeI8Ry9R/mF6lwHMx3vh6D+KYQdrVte0FVpn1v3W8KvLCtFh4DcVh7e4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQuUDVysTXvCOCdC0OFmwN2KlA/E6VeW33OKh2YfKL0=;
 b=m9DBktkb9xlEE+6bjO4Ze9JMrqxtyqjzfRgx5AaWJ8nMyhXMuSQ7UD83DqT6EHnQ4AxKfWm3EuNk+A9Bwg0XOAQI9Q7VfxmfAcS8UBmjWNXol0b5WOIudEHsudAN8vMdjbbUkY8TPu9l0TXNN4VUnKPju03d2Vstt7YpD4MxgCE=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA3PR10MB8708.namprd10.prod.outlook.com (2603:10b6:208:572::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 25 Sep
 2025 02:30:31 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 02:30:31 +0000
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V6 0/4] Add DT-based gear and rate limiting support
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com> (Ram Kumar
	Dwivedi's message of "Wed, 17 Sep 2025 19:39:29 +0530")
Organization: Oracle Corporation
Message-ID: <yq1cy7fqn5z.fsf@ca-mkp.ca.oracle.com>
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
Date: Wed, 24 Sep 2025 22:30:29 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::9) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA3PR10MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8628ab74-f1a3-42bb-df3d-08ddfbdb7fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGvYBJtSqThOD+MIfoP+1/+HcOtW7ENOxhcCG+otFH5vds1zyD8KwWIiYadZ?=
 =?us-ascii?Q?cYAt5eNM1H1CmSNUt9/WjXI+QpuAQgGAXUWli24h1fG2f1bpwjVkkB1+YCZM?=
 =?us-ascii?Q?Phhsh4OXhgr7Nb6chYXF2XhMcEo1tztvzvTtl9a1Ndf/qvRTPPiENAH7FM71?=
 =?us-ascii?Q?Oz1ThUmaLmXnQ1LMZ09y9FRdIydxjT7xqAU7apZk2qeoh1UhNIk5o+VprSX0?=
 =?us-ascii?Q?MXlWr5qwWJQ4XD324fwcNGwIAtMLXTIyE4gxd9xC7vk016S1agQ5sSW7nnO7?=
 =?us-ascii?Q?MfaC4YSJadeK794PBJyQKO8rV0DZVfFgweYV11AT5MqHdYKEzfvTwQyJrntF?=
 =?us-ascii?Q?S4SwZ8ejHEEkhKAtps+CevbSg8EC8GT7bVG9zvMH5ZKF2/nGsRF6I+RmrYGq?=
 =?us-ascii?Q?kaY2BQk1OReMCjoPREYqdQK3zl1z00PqW7cETNvpw/RmtPHz0VGhbSbp5a3p?=
 =?us-ascii?Q?5uesFrestOAgbuXXIo/18FGNf2OtXZol5mFhPjT5mFPL7nn76FSBZAWiXU9K?=
 =?us-ascii?Q?NKXH5lxLjldHmOolPUEt4q/yFc1WFG1agZ8TogC0AVL0KxW/sjzQrX4kTsVB?=
 =?us-ascii?Q?Wa93szKAWO204Nz2HyqLz3P/D60Sfj/gNDc55iJX4EBgC3iasftCN69lx3K5?=
 =?us-ascii?Q?KVAxtoQERmfvhg/Jz8B3R3ESM2HyaQyVSSfAC+ChF3bKzVfcxgM9S0UTOe7b?=
 =?us-ascii?Q?UcA8Qteag4JJNyWXiV5TjSt82SWJo3LZe95YZL0J0jBKTp5H+HN3NbEPm9dP?=
 =?us-ascii?Q?V34s5LLkLw4qGJPV0J7N+VopJX4YhfEmTIrt2tn3cAI+jjvpAKOJDltcjSCv?=
 =?us-ascii?Q?HqVOzYAqA8mB5Mxx/1OE37c7o5x2r1Cu1tpMXIxNb1N7/mbTtjLHo3bn419c?=
 =?us-ascii?Q?O2H0j+7GbP//Ft7/7VsjWaCUCGZ+89KlursnHS8nJXPNKDSBQvhIbwDGgH+G?=
 =?us-ascii?Q?Qy/I3UlyrrYMOqIPy4whFyTQWOXQu4kViU8jdQSakGTpq7ZY4AOwUMaihsQD?=
 =?us-ascii?Q?b5zDxwCqOeUja54DoMwgcU41RT+j9XQzyGm3+koCdkQJY2gn8q4oUw0NDb+S?=
 =?us-ascii?Q?7pvJVuPswwMpVbJccIoGHhnM65e3npduT2VUQFNOZJa4F5AGPbW6zMqbwfV6?=
 =?us-ascii?Q?EB6vHOrRJYcTVWdFnsDG750PqhV1B8yjvgXh9vC+bccHW5tWIGnjG4YwIEoE?=
 =?us-ascii?Q?Uv5IFPhp4dPTN17tyNRI3kUvaFAXrewyW2jzTUiklohWwSbBpsRlS7OwSNQb?=
 =?us-ascii?Q?lVSDRH3fQaWSkLEpWSxQATAF2PBjSOrZR6xclzw8zU+1oT+MhiCSHTdJ+cBK?=
 =?us-ascii?Q?i20XW8h3atkl0IY085vCFWCKP/pTBs3+M0TJfMst+OJ11YiLYmf8bBzwwVa3?=
 =?us-ascii?Q?Y2nwsQwld9I30qIvXoI/K0saTyuvajk7qlC3RkHrYAkgCvw8xYsEWXhiNf6K?=
 =?us-ascii?Q?YAkJPiObuLk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?neOUQ+l6F3Xij5uy4+1S2VHUeE90zmk2kWwKSXJNTi6pCXdC598mgXsDlrey?=
 =?us-ascii?Q?dOHSdHJ5fcvkV0gH51kT7yxWz7begJ6I6VitpryeBRRUu2hZTBF4VdvCbLc1?=
 =?us-ascii?Q?BMgkXl9C2voV4bqRG0QrMOz8KP6yr0LrYl8DcjU09ayPGhf40KsTT6DuTU/i?=
 =?us-ascii?Q?pKY6DG0bZFcWmuxKFAVzI8esli7R8nR1I/1wJOc6M9Yj/nHHQyQbkRjrU4sU?=
 =?us-ascii?Q?WnqOqT7evAcXbHfY1w0/j/Pfj9YBh7N3FFK6Pu5RKmi62LH9pO/aCBP8JnTu?=
 =?us-ascii?Q?BC326vlls5CD5IhQkFga9xef2OkNSJvY7xHLPasFq0JWKXf0LS4TNiyDRLwB?=
 =?us-ascii?Q?E1Uqt1M10d/aAcJLSAZghtAuqjgWAaD/sgIZZHjjHibHneBJNUh+AYW5FVeC?=
 =?us-ascii?Q?+ORnEZZR36tpIQ7+Q1IlV6yUKyNU3mj0gwJ6F2TfQ/kpufkc4sOWMzyz/hSk?=
 =?us-ascii?Q?6H/p8CYzDtL0elB+P7pGmlhr/5jkEFSnILNV0IzbVobC7OPt1C4vuIA8Fo7m?=
 =?us-ascii?Q?0PJMLU9O5ZjzpsIr9hyf0II/ctV5rgCCrOin73rWE1fE8nW4GEbZBK4aBS1B?=
 =?us-ascii?Q?Q+v6HsFFhxNnhry4tg9AT00zeC5sOjE+NvE3/B6i6NjUHJ3M/1aRSwiL1dz0?=
 =?us-ascii?Q?EiWfJ71NXtnjBJp1JbAtJ9/t2ZduT1YgYNWandFLMqV1De3NgZMsUU1Pv25V?=
 =?us-ascii?Q?3tYi3Mj/pD61FERN+jAP92Ysb6q0dYTGyRh5Krci9dbtUbozqLTTJepEx0W6?=
 =?us-ascii?Q?sqHMHtWZJv9V9gUXa+6MupAWpJWGoRF8QYBpLlUhh9/TSFxVLHVjqDRWxEVq?=
 =?us-ascii?Q?PjOJiaFFMdQOOD8Hrm1oXAQ28Y5cwkZ9IX+lzp801PGUo/oblPwh4lfuGroG?=
 =?us-ascii?Q?OAJ+D8sbhdJ2bAjcd+Z2oGaFzoKaAwDp/xHnHIHd6qWrVOtSiwMmuVLVh/nh?=
 =?us-ascii?Q?vng8bzwJWxfmnvjdbdqGXL/Esyt/4Wh+dwZYyCbEII1r2Yj9KZ/0NbZR6wtm?=
 =?us-ascii?Q?xVplKD6SQLGcZP1Rj7hn0lmSO0+zbi9am57PRJWV2VnbW0rhITECG/eVZ6Tm?=
 =?us-ascii?Q?1gr8MvPkcd8VwZ3l0vMuSBNN6CPK2csKCVsnNuKohtVC12LsYV/Z0mov8Z4C?=
 =?us-ascii?Q?2txXO+9GoVs6onaY1jWNIwmm8iGLxsGWHhWc8oF6k4HwBNXtiae2wIynuoDp?=
 =?us-ascii?Q?E+IPtIW31K6YmbKXqrE+GvW7KfOaDJGJEeT78OW+YmfLnmWZpTmA7sbBgIZx?=
 =?us-ascii?Q?yjWs4s7GflTNTVOjVGPd/YTwsrKEQ3Ia7eLrsoNFUYvosqHbM34Cne/vza9o?=
 =?us-ascii?Q?Vf+a+oWEtYP2ED2DsPc9f11Jx/xlTPsNzyou4lfPOLcnPCDxm24N1Vo30bnN?=
 =?us-ascii?Q?7lMbNKZEVw8Ya13+xu5+FelZKir4bRfvPhwfMJ0a/1GQiueVlLbLo6AN5xdx?=
 =?us-ascii?Q?KHXHxFl0iEGyN6wiA/Ircp+K/T2K+xV6auMmPkKc5sAWyhj6tjosjdg1CL7Y?=
 =?us-ascii?Q?9KJWivRkg7vALQZq5PsJLPbPgftimcRjeL0yfQVS7/jI/h/jJ6YLZaKQHjY2?=
 =?us-ascii?Q?0qA+xRAKK1vXEhzKcJfZ7loS13wfnv7cIPA5rTKrXln8kSs81FQgd62z+C5k?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gRTb2kwcR3IRMalyQ3DjF32lHrDQjQzQtbibuJcZ2Hk5PDW2TUGkKmA/LtfMyag35/TRCRqcX1knPXTnvdXNc1dz7XHvU2cmsuOKYSugy/yTWQiVuK/X9idY3KKu7pR0e9qEMVnSe5LNpk7IMXXRpqLaIaMJDyWeZQBmIuOou4S9eVpnQcITfHIpyprzCuu7dxacuFtOfmr8oq+9vz+HWmIsFPxlNzEbl1OwNPKdpBonV/WRY1W0X1wl7fnZwhHi5kNP+dcEAU2YQi5E9ukXtpZKug/oxhNj4DFBvHpyswr1f426AkYMPufDXPHznNsNxGO93tzAvWdZIplyt1aOAw3odohnAOM9VIt/mA/lr2UMMDEzaj/CpKOzTMEnGWBzim88ic+Wzq2Rny6ra+dM/oqoxM2l/8aWHq7V1HgPxScfcE85waWvnOrnm+gv1IIvC0FdWZNKwN/JhfoxCCNmdFQ5cqy36oYQPdN69h4lfPY8KxLM/Y91VIKsBbiOQklvvtK1Rh3tPu327xSvNW4kVWc0q/eqxt58MA319uGw6VMKmG3MkHpMqfzLN0+wSzuxQRBmo4hXuuHh7H8kOr7/aJ/3Rt3QQhRSiG/RBKonQmA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8628ab74-f1a3-42bb-df3d-08ddfbdb7fae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 02:30:31.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvdJoMr2ubj9dtPZHDeqkLKjwElIEUPS2lyWu1u6sQiHBiurhVbal67aYKRrOGzSOmIxgVy6A8K4uDVH+YORKQlKHOlhHWsPF9paVWI3WBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=831 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509250022
X-Proofpoint-GUID: nyx28iC7F8rrgTMB8EdqLp5ddkexu5wz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxMiBTYWx0ZWRfX2ADbsLAJDayb
 mOvfvslsOzLDubnnmTRn1jX2Eo68y/HMf53aY2GToli6+nt9PVqXEVSU7rnqoe3mjbmvEo0KMus
 urjkBVV44Q2UELJfEcfSScXLPinrQrSZn0jmRTW5zvNCun2EVvoekT9dXQLgcfl9tCXpvLWN4o1
 3rWJD0J9y38pqDDAM3za7UGOZXZD4OGUdw/O0TfCmo5kufHtfEUqHjxv1nMygGyxtN19OSc/Ix9
 MeEh4eKjtXLJ3YWTUyM4wLcV+Q5pAca0sFZVsaum0AxX7QvzBeJTdJL1qFDyFifsWS/WiIFgBRa
 RA6EbwbNt0asJR1MSqsm914KA4Q4LLdNIT4IyImf5gJWl/HP1qwsTuh2jnzKygmEVD0KOlRoe2J
 L4JKwtMFg8yYZDXGNGQW/96yY9Wumw==
X-Authority-Analysis: v=2.4 cv=aJPwqa9m c=1 sm=1 tr=0 ts=68d4a94b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 cc=ntf awl=host:12090
X-Proofpoint-ORIG-GUID: nyx28iC7F8rrgTMB8EdqLp5ddkexu5wz


Ram,

> This patch series adds support for limiting the maximum high-speed
> gear and rate used by the UFS controller via device tree properties.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

