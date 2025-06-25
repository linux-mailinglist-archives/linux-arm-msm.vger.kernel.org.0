Return-Path: <linux-arm-msm+bounces-62264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D79AE7453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 03:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6CD77A20F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 01:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A062414A639;
	Wed, 25 Jun 2025 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l2XqVdBj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PkbcLUgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DD730748D;
	Wed, 25 Jun 2025 01:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814938; cv=fail; b=Ela+/IluduVg2lzGjOsaShmSGG3o6AZ9B24bQKtVOuD/ZkSW3XeMIcIcWZ3mTC8DW5fjYHBJ/dhbiwS3frXzsWC08+L9qbeP4565EGUkB6FFpUmNpP18ls9VodaOvmfVq6SAZdpfJ5RMTcXQxw2SCnHSCcla1RPOTsQqkWeEeRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814938; c=relaxed/simple;
	bh=ttEa6e2LzE3JOh6GyRTUInQ34amIJiIbBq9KbkrrMoI=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=awutLwSizCTdFecr2KvujXImNb7ZmAv/XBUuVKQxxrYNF4pnMUUGOOG1t3rLgUANhCLLi3BwhW1W0+OA7AJsR+Ul889yQ/VpH8hbJ/l8BZwnsjyr8UJUY53QAkheyWP73YfZGBobHxYNBZR/WzIajS5KTnWv8Elli142N7ig72k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l2XqVdBj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PkbcLUgt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMj20N005384;
	Wed, 25 Jun 2025 01:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IFb6/Xdh9OJb4b8XkO
	niZy0UrPFlEg9tcn4wN47ulGY=; b=l2XqVdBjTkrKkrfopkzE23dZSUXGGCr5aw
	d296HkwQOVUCwau8137B5GXSL4QUjzZ95AaAvSUP6kDHn642Vvt/NuVqumzmtWHH
	sax4J4umZPsZHeW2ZsfwlY+guzSws0pctoqRT7H3TqhYmBImgwcF3/WephX4Tn0I
	Royg6I7O6oNo3Q/CnsbDTgUr/5WYfl42+ckHD2tayErWW5o/3gQOkdCvaF85/xY8
	fuIQ8JEyx+xxeX8a3JVS8Mqc7dQ8peNG1O4O4bRm9H6G6uHLymcxkBmF0dthQLZe
	KpcuGD6y2n6xux7hSUrCDryS3Vy1sMnf64Ioc9gF1O0OAi4/FiKQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7d8ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 01:28:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ONHf9o039945;
	Wed, 25 Jun 2025 01:28:35 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5d4yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 01:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo490/yDXOzxyrVgxw/kGKmr1qNuVQJMe/uFJN1ojptsQ1OJAGcjLMPRqTncWo7UbrQOkzvuJDKiCA2Nq8r7sWPqf+6o3WIlpTSQtAyrqam2lVsrEzxwTo0bISF5xG4SmOR4QNHUJsRIWz2MrV3oPQeo6w2pUeOx0eOMPBEdBCxDRlPBF+vh8YbTBks3v2BVrsdeYikAfxLSZxiP9dckT7AsNj/A0BKOSXwFKbs+N0X5lxGzS00jBH0SiJLu9DuCc8u49Lz33a8MaysS17Udxw2skaNjLk8cZvAcTRq1yVySaCNhO0k7viiIP7Y+q4COjHEfj9HSfxsTYVOwbf6+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFb6/Xdh9OJb4b8XkOniZy0UrPFlEg9tcn4wN47ulGY=;
 b=oZH0L2MvGqqqZa9tobwWBYecwVWBYjpusCrG3KewP/7S276ghEBlC6JOtCAgJJBu96teeRUN7N8aoEPkImWEnrhGd0ObjfXlCkPEkskExVMJ13+dWk3ogx6sx8fgF8545tIiSQTpEDpuFTThSc/Lci9hD+dQKg3Tjwa1m8hXR7Dzl5NZ3h/DkaRKHLF+xtbIk/tUoH9GjAlu1InMKl5pXonxPK+khZtVtc9ICKS6+0k9gtM32QBO58hmv5C3XK18otdsi0RDa86ktrnhhQNba1YwvJJWWC/IbrBBO5rykIe0nxB9Jx4hJHrGCYeIeRv5wWB96A3/X/a2DW2KjKYwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFb6/Xdh9OJb4b8XkOniZy0UrPFlEg9tcn4wN47ulGY=;
 b=PkbcLUgtTu4l+Ba8+GW+SLh2D+kbxJCYmgMxbqsbyI3K3bPBrxeMNE5xjiu58ky1SGF5kEQW32RBYGGxql+BAnA39dJ6EVw1uMqUK3HXQJFYkI5QS+WN/qqirSdCHs6/KRexwMBs7T2iFoBXCnGMmmpGHiEvOrRo3oPTDx+jEts=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7415.namprd10.prod.outlook.com (2603:10b6:610:139::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 01:28:11 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 01:28:11 +0000
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, andersson@kernel.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, quic_cang@quicinc.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Naresh
 Kamboju <naresh.kamboju@linaro.org>,
        Aishwarya <aishwarya.tcv@arm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH V3] scsi: ufs: qcom : Fix NULL pointer dereference in
 ufs_qcom_setup_clocks
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250623134809.20405-1-quic_nitirawa@quicinc.com> (Nitin Rawat's
	message of "Mon, 23 Jun 2025 19:18:09 +0530")
Organization: Oracle Corporation
Message-ID: <yq1bjqcoblg.fsf@ca-mkp.ca.oracle.com>
References: <20250623134809.20405-1-quic_nitirawa@quicinc.com>
Date: Tue, 24 Jun 2025 21:28:08 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: feebfc82-998c-4fca-9721-08ddb3878bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OTGydn2VHCepAtoY1/R5/NKuIzniyLWGHVTi4h+zWl8/daX7KPC/sBpNmzaD?=
 =?us-ascii?Q?7MOrpT6psctG0a+0rElBjiKV7uTzomum7VLA2PMnxHVeDUt3jP+b3GoF1C8/?=
 =?us-ascii?Q?49BCU14nf4mYJZhr7L63D/v56gBX3bIWI7MFx7GUGbeEwlKDVYIn4XmEIyOa?=
 =?us-ascii?Q?ao2OaJtxQDVdHqJohKohWHLHsyhSA7GPzE46YYVSmN+0Yrijd1ug/vyiohPz?=
 =?us-ascii?Q?cHondkwhFA1rroM6mZl8TJkXpvc8Q4KDnxohcehZGBGOgJ2wf+4V2fH+WP7l?=
 =?us-ascii?Q?6Fh5QRx63ynw2ESHOkLpUy6J/QMbx/rAs0sYfPuA2Iv0N9Ptr1Ffe9j4iEFN?=
 =?us-ascii?Q?MY8gZMxsBMuimKqfUxA3R3p48+NETRx78O/ogRz81MrIiCmwGxhdv3S+oHsF?=
 =?us-ascii?Q?AJfLARITUXd8awgtMpcye805ecnO9Lea8q4GZiIokqpLKx1sTiRUsDvTnueP?=
 =?us-ascii?Q?NpFub9hPB+LIfbByXAUp461EgCUl2WoBC1Yt2NVN710NXYzpYfm9uzMsacXz?=
 =?us-ascii?Q?8DaCAckpl+Fqwbz32wb7bjzTyaTJCpgR0iMnrTUeV/7dEy7qojAv9kcglhVa?=
 =?us-ascii?Q?70177qK/ijw7DJz4R5Ik238k824P8ExiFLl8hsZ7+G3QaK7QeOH1Dlta+TAz?=
 =?us-ascii?Q?VnlDk1KuZACt4jcO2ToJwQ+0LKINmLw6vzZOUTtLhIOagOllfnbXR4NrR13v?=
 =?us-ascii?Q?1Wj0YzieqDt0uKDpDmU8OvHzt8XG3aAfWPsZhSNJf3CKj9NE2In6CsBt9/Xp?=
 =?us-ascii?Q?v5ic8JhmynMvT0QLIrzbfBVjl1GYczxB+NrN788/dgyLfzpH0fsxkmcYaTXp?=
 =?us-ascii?Q?S7VpJftpVWnP17Ldj21EiYsjmDeDljBj1XAkNEsM9D97BFduW4Zc2wo8qv4R?=
 =?us-ascii?Q?nj0cp/9B144Dbe75hii2xyxq08/zf6uy0UMIJ3Y+b05+5KByiRGpxNIpRD7q?=
 =?us-ascii?Q?Ik9BHTghG4sbyxgtSIXoIOFui2hG5wKtZKD2/ykU07g288k/4yOcJQYQPdJZ?=
 =?us-ascii?Q?5fL2t7nqXUfY8mdnMQ6HCmAr8sADDGq8KatGPp9qItDnjbtA1PamNWAlUqsT?=
 =?us-ascii?Q?1RGGMLTK59ZScRlLsmvkg8noATu2KtMAaNVca2vEPQ0gbwLRcjY81NirguQU?=
 =?us-ascii?Q?IMIv9P3b6h+goqnCSn4fFiNWWskWs+cCcmygzPmYTfMuUZhfBHYohfSdUtiI?=
 =?us-ascii?Q?U2Gdf+XWkQEZ1AN0EwPy/7Mr7kbf0GYAK8ZHaLZVAA75bkjXRO/th7y4HDeb?=
 =?us-ascii?Q?s0i6+CQQSze4e/NJQnv0G9ZGEEF4qnUkCqQysz27hgvtWX13Jas60yoySnqb?=
 =?us-ascii?Q?gjJagoWM5LSppE9eS9aSjEFxDY/cpQfPxLxFNQJoYWfynNu86RCxx0Jbwpjy?=
 =?us-ascii?Q?tvpKnKad9vrJGX9VqQ27soyBEjQZu9Bdp8H6VSCj2aAOoN80+LVVhXtRREnl?=
 =?us-ascii?Q?H8O4NtMWlMM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mkHkCv72VOwQjfJwRA+xrIhLi9lYDanvfNuGtDySS2vath6Z7OHCsK9Vxqlc?=
 =?us-ascii?Q?PsAM3/jwBurjNZhYRPN7KOXnHX80DhSsTdWzjMjsk+9f7Yr/jgZSSFkvYZ7Y?=
 =?us-ascii?Q?D/S5R/FTgebrWjb7LCrX0qBbLRHTKcQvn0sUzSZ/p7h54I8j5vdA0ARcqRVc?=
 =?us-ascii?Q?KfAgHbXiRQlWoJAwJJ3pfzbz1W2AcZF8JZS+yKM6bBNtcuxiJtoX/miZpA3B?=
 =?us-ascii?Q?EJ0dCBMND4fAh0Fr8XwAwiUkGToU+ZzH8ocei+zaUC59rYlL9Thc9mhDVcGZ?=
 =?us-ascii?Q?I0Qk46PLyy4R8w6FttTwwBNvNrWy1/doeyO/ZHsNzYcNJbazTuRTVCMOtgWR?=
 =?us-ascii?Q?7FQJdj8Bik0W9eNhLCUbelFbrPnm1Z7h49r43KL8cAffeF4VTsxox5EAI+AR?=
 =?us-ascii?Q?d706QApUAUpt0jlBh0EgrNShEKQWpMNIU9kc4Iih2QR39fXFZ/ykVtZbUaVT?=
 =?us-ascii?Q?gs0rsN3lx1eazUIMeJmeAsNCEu1EEjvBM2ejmxclHsiFhF94oL4Lj+Vf3fP4?=
 =?us-ascii?Q?NrkTyzQlS746qgSCM9RGIURQDfvtWsZaBsRG4FPMXIA5vT1HR0nIxV6E60+6?=
 =?us-ascii?Q?LL3EN5irKR+JnrbgMLZvG8xq97XqiqMEfaxnKZISmZK6r0ZCSoFQKjbNYV32?=
 =?us-ascii?Q?HrIpNRbBaMdv4DL9pY4s7VfznyBPnzfJr9GpDPDYbIt7V0XBiIGkr8dgxDUG?=
 =?us-ascii?Q?3/YQvJlyBCKxJJhzjPf0mRxqccho/lAA3SlwuMu+L4/N/W5N3O4X6tzC3Hxx?=
 =?us-ascii?Q?EcAdolo7U4q7zazH5j2Jk83vmZ6BkRj8dRpfVAUbs7mR0t/IFXrbJ/TgfYcK?=
 =?us-ascii?Q?YNawU5W9dPzwJ0pXO2ehWJ6xS5h/bl7UUYCBKW177TeYLZHeY5kvh43fugOG?=
 =?us-ascii?Q?ITOJxefcWV5xh2NwAduuqEI33cpHAr3iWa82tE38NBkU+VzGYAeYtrVapL9G?=
 =?us-ascii?Q?E0aJUUWBSieXZY8ncg4FXCbbqBZnU32yV1v6DFdJxWJJIwglZyKHeHTzAjlA?=
 =?us-ascii?Q?53/PQvef/1e9sQeEZRhUR/R5L87HqpFZtt7PlN3Bky9ZHbhXUomL1/1lL4Qa?=
 =?us-ascii?Q?sFxdcM5ykT4o5B69P1e6ZnVOfg7f1znEQPX0DP8gMCqCGpw8G6udYCMrM8OT?=
 =?us-ascii?Q?cN4uEKPFlGP7shrPR1HAmvHNIKs6PoCdo5mWrJKxBKl4xQfK1YECIBpaR3ny?=
 =?us-ascii?Q?DRvUa/3w0NYji4HW98gLzYU6mJZAn1/5XDh/21XZk7emI9t66eLrm+UTl6LP?=
 =?us-ascii?Q?vGu5Q/KbkP3eeDcpSOwPJUzHOfXDorL3Usv6dgkHleIL35fazeblR1ODzIdj?=
 =?us-ascii?Q?mwIdJeW8F3t3xM4M4KfhMg5QFn5nCUjCZGdiddTtIUqcHB6O+UFh1vTOI3Si?=
 =?us-ascii?Q?oqUyxkJYzYBLG3TDG7pXlAFY5VaP3BaGvvqsGbClZCfHJQJbfW739UpTP9Ho?=
 =?us-ascii?Q?g7YHUraJIG19qjNLSd/Gevk83C43YVqLKyhLE0LhfDMqGuVdvDJRG3b73mmJ?=
 =?us-ascii?Q?6rD13SsZ4bR7XblH6QvG0vUvz6cLw+oWcUC5gO7SIstx5kA31MrCMfsShc3N?=
 =?us-ascii?Q?OhURPUO4qJGkPARW+NTOsq5gpYF6AgvqzC3JN10kYYbfl8e2Dm+cOICOwPeE?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9tq44IRd+7Fkwb2iApqb9nBPcFUyihHfzSO5tw7pRjanBJsSZQwtg5/2F8C62PUAc3CV+pZlMAQDcKg56fn4DeLn9rIJ8rCxMQyoEUMjq2KvkSBGLEx7lp25DP3cxYwMNvfq9Sa3QnnjvQL9gzKjLow4B1bxRzosIEMbB7IT3UhKyouESwh5im7b61pSlvHnL7k3yj2+UZbmzmfLp9z+GuCJbFLYs2kcSiGcVNu7ZrgPEckI9vOu9iUDuTqPfBYZDKq9LzFW4t/DUhkTbD13TP+qPUMXJk0GgfSzWMJEDFzeASiYESRglzEodrvjgbA/NXhdcxcyv1+q+VOwiJAMwXUBJBQB4ulhRqOIZ3NaT5vb+EQ6a0e2BaD8oxyOx5cDKMYOryulQcCxQ+3eSrNAIMufYDl+S73hneT9FzrFNrLkwfPDNXWPpeTs6iYk9/f1RCiOv+I+Aa2aFOKrX7jnQ+9d1p20a6/4X1wuP17ciOyLpdJDBWamWp8RvwYA53h/B093VWfdw+5Z+Q9NmeaRw7Ow6IYawT2Do3y6ZTmlpyeE/zpaGJZKHLZ0U/LM64XlA9s26OFYSo4VS1nrZgLQHrS7ECLVEFoenrz49PrOWMc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feebfc82-998c-4fca-9721-08ddb3878bfb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 01:28:11.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sEK+e3yPI7WQKiKJoRO6Mw4zu07yNpXAJw8btOc05GorwAlwx2I3bb3VcC7onYpIy3N3xryuq8QAlM0KC9MwN4DpZdfgPqpfJ8wcPxPI20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7415
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250010
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxMCBTYWx0ZWRfX80UOAac3OaUH 1rlCzLe2GSaLlSHDHhgV7Iok6muJiku6Fka0oeCkf9TN28X4GLOLEtne/idoQNlVfj5FFJxVK8B dpRayD1VqiZnxFFogN0NUNpPQg00E11ZknGLu30DNqFW1IzLZwrSOwyBp9tHs50A8ofg100+Cm+
 KrYSjICG7Vz8CB0+kfYJ4VINxL66rrvlOADO08ju4l1oTgfRV4T4Ueo4ROP8mERy1Jrxpv0VdMP webxQo3jMxr2336OsWvvd9aJ/SySqDnWNTyvtEt1Bk7cJT1LtoVK11GrAYxM62rjXljZ1G4sbd/ AObcE2Z9Esrl8ZPsbIX9m191GZK1nLLO7HFheKNqaysPLcDFDBsu3ogmuEx7qB04OvgmtRuIxhK
 aa9BbxyjFc1wR4R5Tw60tElryKqHOM4u/qYTT8L0vQQTuAS7UYZ/2fYLNxNV5M9y4yyHpp8r
X-Proofpoint-GUID: YPJmB4KWkZRDW4qcoMcGakun-msay3kX
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685b50c4 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6qUahXRsZjBSjJgzgs0A:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: YPJmB4KWkZRDW4qcoMcGakun-msay3kX


Nitin,

> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
> uninitialized 'host' variable. The variable 'phy' is now assigned
> after confirming 'host' is not NULL.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

This will have to go through the phy tree since that's where the rest of
these changes went.

-- 
Martin K. Petersen

