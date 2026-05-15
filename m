Return-Path: <linux-arm-msm+bounces-107698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPoOFJeDBmqdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 04:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BC548B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 04:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AECFA301050B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 02:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA7E3B9DA6;
	Fri, 15 May 2026 02:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CEPbIhoI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LMtwZ8fd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32BD3126DA;
	Fri, 15 May 2026 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778811646; cv=fail; b=Q0r2glZS+Tapj079zZjjsDQDsKd1GNOl7bT0f+35Bque9/8W19szo2ZtvqbaeyjSIwi3JMOL0yi3Gg43MGQQ8OJD+sNK9bbSrAdCOwq5/VvUclTV2BINgHPq6aeAFuTr9nAEjcPeF2krWOKDGA50VZMOkEqgEDcmcOFICUDbo6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778811646; c=relaxed/simple;
	bh=a7KAPTvLBKqfeXbloOIIwU7v+ttM1d+SwtpLafpwly4=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Mh/OeSfgMs3Ha38U703pLFdLPO7dqd1KCmD6F+S/FSMbGlZANIjjRcfl45P6611ZbanlDNIm0DwTpo9N1Op+u92Lh5T9Qu8kGhIlNERJDHXuOrO2HGDT5lzC7O/sipRLkMFLfXVKuhwfM6Y7fF4ERFORSWZYAN/baK8fH6VPAcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CEPbIhoI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LMtwZ8fd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F0T40o1504283;
	Fri, 15 May 2026 02:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8xYaG9n4ojxch3GwNN
	EnCdlRdKQ+cHrWkOwh0O3JWX8=; b=CEPbIhoIIFUuzekREEUWGu4P8NXvatdzcj
	tSUwSoMetXiJIUtaGcqJ2zq3aXepBEyQ8nvT+1ARTNuAU8wn+pInp0K4mbwaEYlG
	LTGJzIzqcmOL92A7ppT2qte6noG8mv7UMT8VyI/qf75dSPtMa7oKjTi0LtQ8/lJV
	Hic9drHyExWVZtnr7lRIkMS9PMrF3qdM1V5Zp8SjKuc6CjV4kQOLlKahGrPJpUzo
	zBfYDYGqVt73JY//ZqzzdCyo7bWgg/SyKC8rCeVBGc8Fu226UERY4yI6G+uZ3rnH
	fEm2cwaymFpDChrWg8dm5/J8iHA8gbr/SYM8PBECePcwvyfw1YGQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e5m1rrdvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 May 2026 02:20:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64F2Jxf0025482;
	Fri, 15 May 2026 02:20:09 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4e5kw559mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 May 2026 02:20:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVvDL4rPb7KCsPoGM+9Z2ulUnOjUZNtFf/I5ON6JFVJdkVLUwHl+hiDlPNseNkSlnU8ah9ZMdZgP81F+7aCU/3Pc+wtcWs6JI+rfrnZADErlXPkpNhLY9F71L0A9Cm5vjG28VGJ8pJMud4Vi+MQOyeDR0kfA4GDuP1elyQSpxchIknAt8qWIuiIDNQp0mPGUd0E1THfsrt4HAOX4Z41SIgIDXvZFhZyCaQ2wsYgaVqD0JQ+IPb7ZKnHGxCFpVjSzR2Qb4jL5QT0LLk+TJW9isxTWFMYa8gtlISJ7JLlSa5KelBI7UMgrhrm+kQ6smqxY6xNCvzMUVvPU9/0cvVYWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xYaG9n4ojxch3GwNNEnCdlRdKQ+cHrWkOwh0O3JWX8=;
 b=rLb2NqCgtt78aTscferH7YKqrvaufryvT6lpuR0xk2Tz8SaNeuflzMbP86/0QFjMhaxzIreqfNweCy+melETYqOdzdIJCmVrpllebWWakVr8PG/fGsgdE0cBRoiek6CiE9GHu7cc9/NMQKrviXr96rWmuxsSd9e84zt3gFt9eQZEklb/WL8c6lGjycMKuQcPuQ09l1VIuLbFnvNAx6p2G5xcfluzpopd0MRXB648iks9gAHY8MmIVJUXJgDZDwROQfWLwH4bR5ZtKZmtTBKWzBy+Z0pWYfxsZUNQxQ1xLQdVo2w12BgcLcPVXEekGQMv+z/cnyxU1Auzhd2HRzLrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xYaG9n4ojxch3GwNNEnCdlRdKQ+cHrWkOwh0O3JWX8=;
 b=LMtwZ8fdM9PX/FKifqHcenYm/75+hqbk+l0/7JEKyvcgZgRlAqfCifXfAvzM5I8SYLV3veaGpPjSRenooGLNCc5g2HTjbYcW2vJBTz9Fv5d1guqxQNYclfksiJEa6cps0XhQaANrIh3kbKTnAD0skM3HuhjiEkjf6A1tw2v9PsU=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7763.namprd10.prod.outlook.com (2603:10b6:610:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 02:20:03 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:20:03 +0000
To: palash.kambar@oss.qualcomm.com
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, shawn.lin@rock-chips.com,
        nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V7 0/2] Add post change sequence for link start notify
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com> (palash
	kambar's message of "Thu, 23 Apr 2026 15:50:21 +0530")
Organization: Oracle Corporation
Message-ID: <yq1qznd4doe.fsf@ca-mkp.ca.oracle.com>
References: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
Date: Thu, 14 May 2026 22:20:01 -0400
Content-Type: text/plain
X-ClientProxiedBy: CH2PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:610:4e::12) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e4ee55-3ca3-40d9-2fb7-08deb22878e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bPVRqrTioekBqEDpVYhzfiBath2K46S0SiPP0VotelJD0vV13sbLonCqAXvzY3FYv2qXweW8yUxpenPtSecnrpi+9og/k2pr9+JpdFSho4YG8wbUl/ZZ1gae57aZg2f5Q0S4T3G0v8gFtzl6d5+PD6IvhOHJgJi9fXbG0sUiqFRxrfz+gtgtCedzTa68m1ChO4MvWbgNK0EAz/HJC6OscUznsNIkL1JfCCTyfn45tgTtenOOXORmko1YBpD6loD5MWuxAcSl7dPY2bf4ayvMHJKW+CHgFn/Vtj/ay833O5UeI3kV5QqMGNijdAfKuYYkLvLRTpU9l/5HiDEdabf6TZKzQQ9ccJcQPb7nEPTpQOPP/sdSYVtuKa99Dh2UEy9XlBjufH6vLmTip91tJc+j+8qn/4Vy2jyHHz85pueMjgdbLFil651worLjukxWn6XPYQl4HagtdHHWE9y4SyysGFh1SbFPIPV6R4TMgKZM6E0TDBDkUJkwHAqVK23NoVKQA8GhDAwg9tWZcSqylGC4dhZACbx2kp+FpdU+9FHVbetwG+e0c5MtjibdAV135pAK4lAlqJffHIoWtTthWvqSiW3XGV1YK8vo+Q/RWUGPAv/dJw8YCLgaJos08+4CQ6LAluVlWXPa4YZFj1K/S9d1tgBzT7kAbDs5kbAdn4Lb0AvLECdo7MOk2rAUf1wpIhY+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y/X0A6BJHCLvUU+ngrXkJKJbkOd6KtZ9nnUeB1nlm4jQAgS0NR9OxVEj3IRq?=
 =?us-ascii?Q?+rAnSyGnKlCsJVSccOLD8YVhSgOX5VHsqq6qLuFIB4JoMfwEE5tOHLaUPoYd?=
 =?us-ascii?Q?wrLCvCDFOPAEBIK1Oe10hioUqu9ROJberFJVtEj757joJeRT57QtCBRNk7wS?=
 =?us-ascii?Q?MgajQwxtG5Qe0khgES7MI3SDibM8uQT/R6Sk1djYWQi30lnulJ8hkUHZZbrz?=
 =?us-ascii?Q?FzS/XzmMCmt3fsmCC2t7+vCPJCampydlbMg0FWpFSuBRgQObAL51fwwtgVDl?=
 =?us-ascii?Q?RD6tvxEPDOXOtKfqnVBmc6MRoGKJCV36ydGEdJpRc9yRN95T5j2CKfrJGbQI?=
 =?us-ascii?Q?JKkFvAQokO0cNiFTOwXD1IxdRF9dko78y4wqqsdQhVx04hrDpONMsjKuqdNf?=
 =?us-ascii?Q?d+MlC3+nB2BW5kZNDlKnzyPfwxTt27WOrWWkaMffLRNH0OqtHAx+kFLFffKa?=
 =?us-ascii?Q?HZ+bnvjyyB7eo6j7FMGHzBRC4EUU3/ZE1RGwuz86jqwWerLIw4yf8l9mNOzN?=
 =?us-ascii?Q?8hFr0nNh47evaEqYKBL6sFItElNJ2DJ9JX8L/ims3eRN9Rn0sWkF1h2MMxij?=
 =?us-ascii?Q?qA6j8DEKfGLxTJMXfHonNPgZSAXgCjiQ89yMHhJzI1hYxegI4vJdRe/iSZ0c?=
 =?us-ascii?Q?DHl8b5hA7vE9P2x4wCMy6TWB5jA4u54a7fw3QEFuCeIBoURxht3Rjfq9wEN0?=
 =?us-ascii?Q?Cg+0/ytGuDQgR/4AbdULMp9G5c7MiFJHYeQ5rCgLvNXmGWbj+IFZ5Ybfqbaj?=
 =?us-ascii?Q?MINs0hY5EtY4gCO1/44iOyEx6wPWOKSHYEps5cdR8jERNjZQlncsXlV4jwL8?=
 =?us-ascii?Q?YyGWW1RMoJasYrVjp1cgy2psps0IznATNNccv2tw4uwc2dgv1v0XJMszLjIp?=
 =?us-ascii?Q?haNNWbauyXQD5aqnqP0fY69qGsweqG2vxs8I9364jDSIdL+8hjgjgGyd4dft?=
 =?us-ascii?Q?oJ+/lFktsRpc9yidNxcwqshaEwSa6bMrzIFcrXWXDivuWAzbpNAyfSJr0s7T?=
 =?us-ascii?Q?m9Oh4Awe/y1LfiD+N21cOTIKM9eswlGVGHFZrlc/1Qmurf6WOXapKa+HReHY?=
 =?us-ascii?Q?18Cri5G+NDQVH1BR8g6IHW9v18vro6+6n/07frnityUKSuXtyiSIpQBSmeBS?=
 =?us-ascii?Q?kJku24jiX3IMSGki+R4yD2FL8b8aShv1grx2mZaCflbFJTlJoX+NVeTv7fUS?=
 =?us-ascii?Q?mCg9cc0l/OrHCd8T4YGzCPtccfyyf8O95PqVW2+ZuLRE52Y2nc8wYfu8G6WC?=
 =?us-ascii?Q?rHbhM0KXlCCOY9RFsq0xei3sqjjpZZ33kcHthaHuIFXbs4peiYZdV8tMR1hw?=
 =?us-ascii?Q?O5Bk+HlF48RjdU4tmLYK6QVz0C/HiCRjpDzYkU9MjwUfuL4MKHsumKK8dUiq?=
 =?us-ascii?Q?p0P1ZxxCaAsmmpqOQqol3xgLCZkotLVTXXmnIm7xcRg700f3URzbF0xv9Hbp?=
 =?us-ascii?Q?H629fetnE2YqESXMPoormers8Uz2HNTXZc7nbgqOf1YC51QhiZXsYiPBaN71?=
 =?us-ascii?Q?Swqwg3Q+SqYPAz5YzeN4qyxFxav0BLD1hVZIf4TIoffFqGpkKWeGwAfgEkL9?=
 =?us-ascii?Q?BtVIWG0gOoFkonSabb3HjFs4d1KYkCzZPxsv/StWECYoBhLcCUfwjAnDVhF6?=
 =?us-ascii?Q?5505EwHfDYMXWgf/QQb8cIhwewesnK28O30QrujVa3HgKwQdw2zlltX4PVcX?=
 =?us-ascii?Q?sqPpJj5tul1WelCzBXDMRgVy9OC9/v6bT1pIFsconrfpM3n9bgNqqMv0JKnT?=
 =?us-ascii?Q?ZKvQnhBoIyB6CnqyX/gGHQXaTfkYjfY=3D?=
X-Exchange-RoutingPolicyChecked:
	qQN9fvVmKLAQjF8Wn5oIH85vhpa5xS9QFwPXBsVmCfmu9BRc+UcBh4W5QrZQmAvxe6RgKaEewnJqk78ebmIkhtgqWMya8qyJ2g6ElJ25GIC+pmPHYdkXFpxDat2+z+zB5e8WxzStCkoTvvCHAkEOOF8WuLANIhfcEdjZxtSDJx0eIfXRm9hMC3fxQ8GEIVpOWAHCVo7T9o/XZOegT1E39eeEcKxA3m9xnkx/DHZLYm3dWISp3jL84pfdPlVB7Va6YRWx+EF2jhZEgCJiUzQPX0rPJ6avgy4QM5Hjim9vT7OZZ57Ot9PhGuzE4KSD/GpIM57xmdrC0t9wYhqzuvCqlQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dbEb9mfYG3LBSfDrC2YIercVCYxOfvzYWOA3hAVozU1EO8IC1NagQCyY36u9f1zPsrr8UFkQG+ruapAkyNyuSFszXpGsTpXZguFQ4YhZcqFmE3dUbrN8x1I+fqiVwVy9W86C1Ik5lsWVYRvFBI3MhKhtYKFMYF1QvM3HTXGCdmEpx/4lh0xrZMtP97LdOcJ7TvRBWXVNazN2KkLtvGN4sZcFpQbO8Zzh6Hb4PJsqZHJ80vsgc/9v8isnW+APyCjFYsqiEuKRB5IG6xZiFOvo2QtWdB/1Qf+3jDKdWff8Zu47N8Ud1gE2oB0JCi3cU/9OuU80tDJKA+t3VjKohsNCUKrGdNjXZT5YHl80zDuJFa0Um4pReknvj/HKhkWZeWuMNcgFOnnnXq5fR31/N818sqAjosrQiC2CJVH6FXclsnAumt5uZCbnGh28yrgaF73yj3cYGzNY6ZQ+uPRgekujzq459is66UGpzWQKlS1sWgPUXyq8KwSchASOdYDdIWI1gjyegtge9RI4q3Xn53xgn9QHGe8K2Nq3Z156DyLdKUfNpFA8m71Re9hdlSGGsaJ67U674ilrj24g4Ebd5wxBzbDE58fBibajjAp8TQcQEE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e4ee55-3ca3-40d9-2fb7-08deb22878e1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 02:20:03.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiFULdLZ8QhNq3tJYl6IgmePZFKtyriuiEPZmKaIPY7AUaT2wnwlNyL861i8/pq4oY6Zw2FmhwYzwNZFMMiy5eHpXz9lzcWGfMcxhXT2/UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 mlxlogscore=905 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605150021
X-Proofpoint-ORIG-GUID: 3euJl9vf8XkKE1cB0ndAKkTo-RoTA1Vu
X-Authority-Analysis: v=2.4 cv=OvJ/DS/t c=1 sm=1 tr=0 ts=6a0682da b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=qRGbI3-KPJ_-HHNi22YA:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13839
X-Proofpoint-GUID: 3euJl9vf8XkKE1cB0ndAKkTo-RoTA1Vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyMCBTYWx0ZWRfX/J1EhQ6ooSsm
 75U7YYW/QFqCSbTnoGpHODm2mWHso0jEbs+WFmolevdLBgiVAXJHMOFS6qNLnrX2sRVEYbFSKaW
 3qHJ6QUOkjFEyqLg9bzBlobOuoVsbsAAElFDboiaBLLDnfCOzNEv6Gt8t8gmdPry4c6AI0ns5d6
 Sw9uSutUjsiq9xt9KrSu2YWgrjNXa1bmStdJZHXETW+AbzayD1gGzRo/tNJfy7F3yTJu9BfLs0w
 d41z6ZcFYUU4B7z2fqU8fMHEREJdan8Y2CKV5Th6mMrcGf6GAL7fv73wuLfPfxIGCEj4LuKasX2
 paIP5eEGRiL0W9Fy0I1xC6d7RT18W/qSMKrcz7mvvkaz7584MknWNdg0wvNF89qGT11RzHWI3V6
 aolsJ80GJpW+Vre76vUPFZ+s4M/Yq4bqSuMjmf6BP0RTDabJJqfaqIkikFPQMIQixtcSruql322
 1QIUJRfIvnYpMY/uFjXaqJ83EIUYbjzQ8NAE61fU=
X-Rspamd-Queue-Id: AC1BC548B63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107698-lists,linux-arm-msm=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ca-mkp.ca.oracle.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


Palash,

> Palash Kambar (2):
>   ufs: core: Configure only active lanes during link
>   ufs: ufs-qcom: Enable Auto Hibern8 clock request support

Applied to 7.2/scsi-staging, thanks!

-- 
Martin K. Petersen

