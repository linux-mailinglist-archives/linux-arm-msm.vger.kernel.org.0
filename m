Return-Path: <linux-arm-msm+bounces-84722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47460CAEC7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 04:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07771301AF74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 03:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58352FD7B1;
	Tue,  9 Dec 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KeU90LP3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="whwQdNLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C963B8D67;
	Tue,  9 Dec 2025 03:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765249888; cv=fail; b=bykSPpk10V8GBGFb+2ERPGCFt07y0dHiMt86WJ33fInE2MnVB59vvhzHlJJ78KPU7ISQ7exLLLyKVaXMYNNC5vzLfZ7dZOYcAyAMC/pTWwIdDwX4dgdd0PUcmrJtNQXLkDM0sERtEEijePdry6GV0uXY13MqfOzDFBjyemjIuG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765249888; c=relaxed/simple;
	bh=Rwe4kQjGA7xoKuyT7YBC3hPz+RiG8jZOGDBkyBr9z3Q=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Pu2KMns6nB+aTRqTqeu7LZ6OWR9oUmmGcHURSnjmBcnh9mmyxCRD2BPNmtVTS8eyGChn7S9FE2MrHD6xzt1slMjcUe8FJl3SbefTYHS/070gstXaLmeb58YdYj3AxcM6uPwgzolzGWQmRzlCNPF83OGnDy7E6i0Zd7gT4cCU4ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KeU90LP3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=whwQdNLi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B91vIsZ3883306;
	Tue, 9 Dec 2025 03:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w9QJbSsjB5mClXPshN
	Rz2UUHNk8ziPXMv9rshMYroGc=; b=KeU90LP3uQiyW32bRkCmljni2bls0H+IO/
	EcVWekFXVLeO5n4pU57OeVLFOIonjvdqgD98I1B7+tO9h6WxN42zI3AYG6hypZ7u
	u0uQCEl8+Pn6e8AD7dGsXFctBTMZzgr03UjcEMePCsLN+JuueDiPmh8eK/N15R1y
	HAp4dBwuqLSAM6/HhlR1sGXHIEZrNetkAw5hz1pP9fjjpOOIbSBDRwzZraw8bc0d
	bnpdWzulOHYWLj3uekgkbIw7F5eAgrz0ajAZN9hmgPQAPbY2WK1PQgd5eseU0CFu
	pICelbpdrMZcm633YIcuFN+XrAcXtP60wKVKjpILeVzsQ1G22jXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4axaj6g1r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 09 Dec 2025 03:11:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B90Ho2T040702;
	Tue, 9 Dec 2025 03:11:20 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxcaf08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 09 Dec 2025 03:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnKg+DbsbK2UNPlKgvgCrv0dOer3t8EwSZFYETgEZXPDeWrC/GeQAjYrwMDJ/34DGg0wZHAFhrV6ZZi3eP+yWIDtANqbAPjpxLGkEDmNIigL11PnjXEAYQVkRF07m47wvbDtu7qPE3SN/qHWZZB5+ExOIkIwEGjsjB0nNMzyieykrrebfHnS/8F2kUKm0HbI5gcLNSzkA95r21u+0uMwQ4tCu5oB/rcEqvDgg3U2/lbtrNxUtQJ6krrbnvkmwmxHBkq4X2pOIZDUzV6ZLMcObH2wMVG96k5wfL8HiLW30dK5v5e1WdtAAK8hZb2lNPAvkuuPbFQzTV8+2Mj/gaV6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9QJbSsjB5mClXPshNRz2UUHNk8ziPXMv9rshMYroGc=;
 b=tquEqM1JD2rqnWlZfp5Q5zrjNmxqDWEWbg3TXCipR2Aav7G8dbWjdFscDEduJyZmBlY/tYK9BtxsUb5svRIDFUQqKMJ5dBDhxUqgvHNis1HU2xLuLYvWMCI4H57dGESsY6DU8SUw79zw1y0RU98TssfrPOmp6U9KGcOPcFUJsOBnCMgT+tAM2eK2/3yyhefYULTHqpwqWoeqvLVcrs4dKbP1eDMQu5Pg29fCsWD5G6Pp/+Sb1wIMu8KC2w6ybbnU7lFCuTiMY3Ua2AguSv+/PI4zfB86irZPHTW4AWRG7FMUT9dUZWkoN5ENqn6afHHvcFVXogH2Z9J6CMuurMrUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9QJbSsjB5mClXPshNRz2UUHNk8ziPXMv9rshMYroGc=;
 b=whwQdNLi5/oj/sjzO7jrb/JjPOPb9QsxXiyrbqraYtlD92pW1I4lq6J056uKVasHwuYJGZ5tTkTG15JxO7KQ1uMAJIpHRYpr551RObt2tpmZajkMmuNCYhV5iCJnoyba/WihMMSayBD6UnkvfR2Zjv/TnwUoyz80k/RvHoSuFxc=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA4PR10MB8610.namprd10.prod.outlook.com (2603:10b6:208:55f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 03:11:18 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 03:11:17 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ufs: qcom: Fix confusing cleanup.h syntax
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251208020807.5043-2-krzysztof.kozlowski@oss.qualcomm.com>
	(Krzysztof Kozlowski's message of "Mon, 8 Dec 2025 03:08:08 +0100")
Organization: Oracle Corporation
Message-ID: <yq1v7ignyd1.fsf@ca-mkp.ca.oracle.com>
References: <20251208020807.5043-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 22:11:15 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::7) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA4PR10MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: ab83ecff-c277-4f0e-1f55-08de36d09eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a78+/SeGrorKDsIJKS+qJOBJYqyD+UPuFJXX+okby9R+3CTaSzE+EZBIgZqp?=
 =?us-ascii?Q?oUXDxKx9/3iJJXpgaOsNnowHN5eeQKg+YXmupNXBJm8anCMC72yKUUTnRzay?=
 =?us-ascii?Q?HjWPjk/F3GeAURDsNxKDwdj9xy0j1p6YZ5z+OPXMbIlQhNurjJsL7TxYCMND?=
 =?us-ascii?Q?mdwyJOSH1tcYFSZrGOccuO3SPMMi5Bpx4WbND+lG//GjscRwmPAnvM/1+cx7?=
 =?us-ascii?Q?ZL2EiE8P0KzbwfhlstaDI6NopksQ7eI2mH7SabRE9+F53XYQPQYxV0+B4UDD?=
 =?us-ascii?Q?2Isf33IyoAclpd7LydJwFaLpotd6w8eosyz/InQbhrjWS77YzO0JR0NzOdBV?=
 =?us-ascii?Q?QAuwoT19JwHLuypbB7jBMjW7NYYP9ohH+j6Hg+H4jCaAxYDtCD645FZxyXc4?=
 =?us-ascii?Q?b+1h37egA+bJONAtcz9wUpn39ZnCcbJY4BKxt//L1wP67/B2/6r0ztxyVMg2?=
 =?us-ascii?Q?qab3OZcrgiKbfC3G+/4bneRprJvdMwssY+LsV5dwXmBG/6Yfa6pTsqHFxs3o?=
 =?us-ascii?Q?0VOhIa35AUNNA1qgaG9rLVjvPUpAsIDxr24y4KzeINg34jYEZHAOIK0uA7IC?=
 =?us-ascii?Q?AhSpZVJx15uBJd46zhutSGNzyG77sz2c7CE92FuksXPgekyRASLmS0gWPHzY?=
 =?us-ascii?Q?nW75S4Kr7+kQNB4SyEUT52BckrKyibRiSaMqKgwBI7n9A7XH4l/bJC3arTYU?=
 =?us-ascii?Q?lAetLYI25VnmAZjWMulhWowH+5vsHPxfGsG5zAPptBhTtkd2jwrnPSi5EsDt?=
 =?us-ascii?Q?PycnC48vs3Tulo7ydF73gFpjCi06X9q28caILZ46e58OL4kaTVZIUMCgr1/L?=
 =?us-ascii?Q?CYtb57Zzm/OeXUQePbcdwm3ZOZi0ddGngsKsyO/NlmPiOtURfZS2thAY2zsX?=
 =?us-ascii?Q?T5GulXao9VOhftfDO6a8PzYpAdNTBhkDfW4ymEDC6Gnd+efMZxd1alqjAcea?=
 =?us-ascii?Q?V6XpI0uW27O/GeVQcLboISLN12rh072Iu8UEpgH4nzvCTaasMKaV3jdPOZtY?=
 =?us-ascii?Q?1+HD43ggF5K8k6JoqwnAeolz6/J5NxacBAshSfm+eHCsCchWDnHTaxQNr+bK?=
 =?us-ascii?Q?epatcjApRn9mytygakM/rUnNlTE7nomd90jYy7BtGpo9kEc8utQGOK8QiqeZ?=
 =?us-ascii?Q?0sezesHmR+ifssJcU/SH0xKIpTmrfOMQMrFcks+GBmZ4RrBPlJ2E2vygCeGf?=
 =?us-ascii?Q?q25IYfoyMHWA6shYsI46u/9L4WsMmynq89UKQlSHv5Qemf0F4HClPivmAVdv?=
 =?us-ascii?Q?v2e9cfeBVxsr4GGegxljYFMD63t5bMUtYwBXAvc+MJY6PjLp3dIf6pyxoBH5?=
 =?us-ascii?Q?xmbrcDyx6XChz+elBVf7IGQcyrc5rPpGnuzRRxFBgv4xTdg1Rhpa+rKHBIKi?=
 =?us-ascii?Q?xFf/7eB++J4po9mn04xWtrcScxnqXac1iiFkD7IzytSpfgd6b7C2wS80z7nc?=
 =?us-ascii?Q?l9D30NskGP4nCRK82fOwNthsKaop34aE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IxktkQwKkaYo/YHF+hnjuxQHAbYWnDWFc1D6hzXzZriMNn1fc++Xhvt1xLZC?=
 =?us-ascii?Q?UhBbGr7CaVAhITfA7Lb0tXIjCpwmN1Dv/J1TqEopU8nR1Fx1QXrRgjhg0uu/?=
 =?us-ascii?Q?g2WkVf9SbNHr47LeQNGAC1CFpsKEz2tGT3BxlsGQgMBaUkaAnVDrEXB0EEY+?=
 =?us-ascii?Q?0fRPb2FMN4o1Jc0k3HfQrd/QJAhK6JfsYDpjLUer81ah+Me3DalpE2lOvqji?=
 =?us-ascii?Q?is90Oq5+HIoELZ4cIDgQvUrE7CWx0c8zstPyzVn4SrM3EbycQO+kn5iMK7FR?=
 =?us-ascii?Q?UhT5KbBhxpAKkExhifVEqtZ1YVYr/UzfgHuok8y3HvDVABAN1zVz+bPt2ZR7?=
 =?us-ascii?Q?yVuTV+nBngoB/shbD4c4HiZ3WO4hyLYLCE4/hwOJtSO7iJsFhbBb+Tn5725I?=
 =?us-ascii?Q?/SPXSEQ31PlhjvEhWdpfKedMt+RmjPfvQJeFlVJy3P58cSsOCUsTQE+83vAy?=
 =?us-ascii?Q?EeNr68b9RrXmtbpVhEhlcG/ZXm8bATpG7apKXHkYUFWhu6xXroGydvOOZUH3?=
 =?us-ascii?Q?sJmfIL7/EK7GTogKmKZ3D2XwH8HYET7Cdkp0xK4M+ZgR5M2Xb061J5R2ZJ6j?=
 =?us-ascii?Q?cVQGYJbts7Jk5urbEaPIWXlVkPgKAybw6nVALGetfUhcB93mMYS1FvQMLoUB?=
 =?us-ascii?Q?/9cgRAltei/3b6puFkOK87JrvsnYn+S6rUJ/YvqIhsQ5VNX3/fbufQO7K2tN?=
 =?us-ascii?Q?PM1xm8ODBUOZHvVkLDdzyhnvIecmjc4rKdgOTTLf6qQyg3XjynkStGxtdWyE?=
 =?us-ascii?Q?CwegeUkLZfUMwL0RpKN9EKMrQuJL+RlBfnUYIuf+FWt29UiYTVRiO0srf9ie?=
 =?us-ascii?Q?b69vuiuUpZZPrN+d38+ngVITQWaz28HDktSvNPJbcRoYNsciNdxGzmdvotwH?=
 =?us-ascii?Q?7lbpKNTUMjfjg1P1Mqn5Mnk4L8OIEdomJjFxBIGRM48AQSTWRBLz5FXquLGh?=
 =?us-ascii?Q?m9O0HkHjbMLjAwOa4gb3mGLA8A9OYfbpO37vurnhNkg2Duu9uoZdRiHI81lO?=
 =?us-ascii?Q?petsG4LrSQZ1bArPUNRdDrgVHPvJrdp6WKqNXFo9VMH7WMpDWC5jaJJ4dA4/?=
 =?us-ascii?Q?KzcY7CUAR2i2TazXB0J+zzGQjN9EObmB4K6VzwgSnfzBs8bHv5300aJnH8mP?=
 =?us-ascii?Q?h0RxVg74eCkQiTmZobG0sr1fvqG2f0XIYO43gAH7Wr/ijhwgxiGn/KqMefKd?=
 =?us-ascii?Q?+UbsjGYSHIOVPpIu6MdzpeMIg1EkbiGsESCRPoMEkFgcAzZjMn/xhWxKXmgX?=
 =?us-ascii?Q?hupqSTB7uU9jU0YFaGcByRQeamOuKIEgl6/vJC5hRXi2jNbQKVed26vqwc8T?=
 =?us-ascii?Q?iY9E/aMLUgLipQeP/lauzmJUfwzWJNjKomEEoo8pfXfNFGsG9qdUz4XyZ+3g?=
 =?us-ascii?Q?H3Up3XrxHkt/Z1rYBuCCHwR/9b4Ogdr5ZcXhMgkIQ/TJME8tqsoVy+7IKuDm?=
 =?us-ascii?Q?xSFdq56/gTkyAuU/9/B6piABY8sPnk4AXWRa76e1B8sw6JjYPndDXU5oqGhz?=
 =?us-ascii?Q?es4H1iCR6FJTxnSM9V3517gw8j5RJ08G8Sizl2d9DvCXLxlyovlH9gtI2kEQ?=
 =?us-ascii?Q?flIQRq54nnqaieimiHudgt/F87ivXhtn0Qb+4tQC5C/yrvxV+gY0xSRwZKwH?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BNVfQA32Q5tc1dbakmRil3VovIuV5v69WFt7rKQwd4a3FWJ18ksES95m7Xr99pnFnv85H6zGqv9//zwRKQ77A07/oY9mpzRIXaeTNs0aKxK3SoUnoHWBLs/d37Pprs1ffdR5nXMriIFhiMrMuTlJB/8hgqmwwgEY94jsofL813wl0FcB4J4cobEgYUN2Js8WMSP6XuQWMZciQgMZ6xKmIhlyDvyJVqNGW+kwPxCgWxh5ENHj6zE2znji6ay6d3y2VS4X1fGgkU4glG1A+RhH0V7YKCfW/Yhdrzhiu9QN+FL8dymDCPBQohWR9TprJefH0lu2aX2QUC16JO6YNw67Vp6crcySFwAXoTAb69L2RLQoMmKbh088YeMvC1KeIIanSaFebR2oEezEKV2E/6mIv1I9di0s/GS654bLGtGuZN7Y2FOv8uRwGa0MnsP4qWaBi7UzbAMcTHe+64XFtp544gVmG+ZA83dyvZGBWR2cOBnKa0juvFBI4AKM4p+ThXfx17BddQwrLHtDUwmLd9ZjNwlXt1TVuwf04wI1cIM59hH+9DLEeq07P0Dvt2Oh5BbWvHHRddkMURpkT7XR134kQapWa5vGDcyJ7DTAlo/QrkE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83ecff-c277-4f0e-1f55-08de36d09eb7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 03:11:17.8168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shsq+MVD3d2+xe0eb3YQZFWLJyJHAk0kQaUSqiHRVwHY+hO2KfCH+/u1jKyay8cZKNltKbGHmoEznk0YQGOHYoC9JWCUl55cxlV+cge2XWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8610
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=514 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512090022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAyMyBTYWx0ZWRfX0t8+s6D+vphJ
 gmHMHAfmSj5dy00PLfBejnMLhl15c6poIt2dZg1ClFk5wbzrKM1MP9XhMqCl4AFdFd5EgMkMnwT
 +njnebLFJF9n5abO7wN9gZQXDda1C7BhR4tAa2DQ7b0Wqre5gGRyNRu9tIVwqRkPQmoWZ+pa2nu
 cjscHURBwpVG831rcrqtpx0onUQbPRNBjWAGhRhxKn7oaJXsTPKx6Y0mwJPlHX/6gjrpVlfMH7X
 Tik0h3kWZKtczfR6uAwlXtIgoKKqnvrV3xGNh+3xnR86BRF6mXK7baKQnwJvRE/vL7K3WINerJz
 IBSStXUUEaREuTxm1lL2j+hZgzPb3o5bAnYpp3X9EIGYAO6LxXr3BWKoaM2ILZbwCtXCvWa/hob
 4ECMVQ4EEqhN1GG8xQdheyFGZiDhV3VkQa0JiBf/pXkEhCknvZE=
X-Proofpoint-ORIG-GUID: lqdZnmweUMfhD0S4YE3batkiRvz-Uz-f
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=69379359 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZqE8iiNBColObR7-44oA:9 cc=ntf
 awl=host:12098
X-Proofpoint-GUID: lqdZnmweUMfhD0S4YE3batkiRvz-Uz-f


Krzysztof,

> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:

Applied to 6.19/scsi-staging, thanks!

-- 
Martin K. Petersen

