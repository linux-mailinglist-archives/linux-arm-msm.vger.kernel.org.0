Return-Path: <linux-arm-msm+bounces-58822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DCDABE942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 03:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2573A6A84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 01:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72EE7081A;
	Wed, 21 May 2025 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oFV9nE7J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GampJ98L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960C23A9;
	Wed, 21 May 2025 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791972; cv=fail; b=oBDTNQJkaJ9enN5bNn5isVaFZWOB9qIxufSYLrgXV470//9u+BVl75YYcBSVE/DnIWvroFP1Mf37XFlAlvp9l2iiiZcN660R+yF7rWEx/Ocaj8PmgMZVGmGx38RZLiPz2c9anWFS1VCB14tXy3XGO5fSQSQ0ghwWI0GtjLsm/hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791972; c=relaxed/simple;
	bh=bXorj6b1OcNy1xxhwC1R6EyirjG03wXZoc6eEGwy4Uc=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Iq/x/G1Ck3vjd/aM0w8/yEzElz3lAbV8WtKEl9J01tnHAokKD+4dlwAjll1A1bZWkGJh6yWZ54C265NJjbw3rXaDRCelLIXoFTSsbWK1fPcocET4LY8Ju7q3Sj0vHp6hQCYkF70aPtuHmCMOy4P4i0jxUgZhvpZYlqp5KvZaDlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oFV9nE7J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GampJ98L; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L1ge4S004351;
	Wed, 21 May 2025 01:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=O6tUB6KPndK+PrLxWs
	3FVIB4VgjwCOk4LS/1zJb7ddY=; b=oFV9nE7JXV5otgzXPPHMOJXM+6qmYNQplz
	nvNH1j99I1qdgPp1gbdm/h/lKnTbIEhVqAXXByQsOoN++OxLgd7UUSHn0TfnHZOC
	IkQtBVBJCNHl/Ee4eYLqlGNzGs7+ir6fxL6x4dagftAzChBdROJcXdhnVmmVk/Cz
	sN40spDsZDyEikh1P5H4mDSSirU059g2ZQNrxAJuKrnPjq7rrdNes+idiJgGisA1
	X+8FuGkBJz/UgqhiFUmvFxZyk2wktzJRHkM+WJYUCB4bAVSOj0vQ2P8XY9rdgebu
	cf6uQZlIE3vuAtLuSu8B3+O4f5SEil8Q5iICnrzEL70ScUf3tVWA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46s4esg3qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:45:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54L0qMZU023894;
	Wed, 21 May 2025 01:45:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwemgnrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w768h1/mCXnaXAgh8W8kulPilHOIUEV8brc6g7x1QFfnMIuG25ph64e1HzuE52Kv7rMh9xM1n3ci9mljYQkZ4samXNbpQDRPUWg/P5iUmIEGWX1oj5Jp0BGLfJxvUoBQg/3BmzrXH5WoHJi/YK4sEn4HfedvCgwyX3/kqWh6mrOcoR5EkeHmWbeQTuI+BCWK62fW0pw3E0rRiXIkZK527gg5uaXVzkdhbByjf0QUiTDA5+ENk5JnrA7vPa7GyZNpg7NebeL6J4OmX7Uq1z3Fpf6PF0NUsNjcltv2NR4YOBcIDFFqg0IB/ZIOduttTBVOHC4wT4tHxDC25/wSe5Zxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6tUB6KPndK+PrLxWs3FVIB4VgjwCOk4LS/1zJb7ddY=;
 b=CdoDSN+A4lG7EwYwWdvfSE0bgn+LEmDyq6GXdF49DJv7oTIo0F/W8nbE2vhk4Rb7VJV362+sHPqAPTtm07rSdqzaTnA8s3E3NkBWQcOusPseo7O/BhIvLqRRLsqbB60jVCHKvQ/usmCSjFOFcvvrk4es9g9hyAXmul20RV3bLn3KoAo8/qYxwe7XawN4W1G+k3wgfT95r0PXMKPGHRHgdSuCxtaZ/cYFKky6B0L5iuTUBRRuDMbUfgOCY8ZyPLINX4Om30iP+fUyDFc17qid2wvrcWbf2mmvmkL23gG0zVjbM6HV3lznnCOdZ6zCJ5UF0DHgs8nkj83f2k2s6ge2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6tUB6KPndK+PrLxWs3FVIB4VgjwCOk4LS/1zJb7ddY=;
 b=GampJ98LGZRbaaZ8TXZFdlLEY42/E7DmJYJJN4Q3tn3vsqJZzzREcCdmalqRir4xUDYzyS+9cwprlXDBtb3SGIyzF/70RV00OoVe6CunlXQ8pVCW7GlSP2a6BovB5RsgRk9PsTCrNry98e9yPeCTxOMR7DckQ6bAdc/dxflsIvE=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 01:45:41 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 01:45:41 +0000
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 00/11] Refactor ufs phy powerup sequence
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250515162722.6933-1-quic_nitirawa@quicinc.com> (Nitin Rawat's
	message of "Thu, 15 May 2025 21:57:11 +0530")
Organization: Oracle Corporation
Message-ID: <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
Date: Tue, 20 May 2025 21:45:40 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e76d0f-d973-4104-af0a-08dd980931bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NpUHkVnbxYcYQX0lCC+aE3r9FMdXDueDnIb0OIjJUkB98c28ozg+51waairB?=
 =?us-ascii?Q?4sLc7ErmA9cJZi9+qVHiqTIzJrMqUVCV0LZwMg3Vri6MUsBgMmFNXH/ydSwy?=
 =?us-ascii?Q?aXKOspcVrdFuJ83QRW9MZBklYHSElgjMUO84hy6PZSLW7t3noFs2XIBwnXXQ?=
 =?us-ascii?Q?wtFGvuQptdG5Cypv6y42h6O/0xyxNEA8nF8mgu6M2teGlwNbSd4GvNGkt4GU?=
 =?us-ascii?Q?c6QmfFh2bcQao+akfKbWZDBLU3mpYRxRuG9b8edi7+husLbGxerZZdp+zX2r?=
 =?us-ascii?Q?Icu8/AzuLwtXwttDo/sKueV2jaqA8nMeT/1mhw/QnlDO5hRlbp2PASZiqn1t?=
 =?us-ascii?Q?mNU46GuF6KiHlzvrr9waQzeEdNUdvMgsl4nck+yUZeNrCsoTf4m5HIQFkeJE?=
 =?us-ascii?Q?8CLwNLdje3Xj5uEYzhxLrqo7DQvorJ2irU+GbzcyowbAUy2lLorYh8xV4ZRO?=
 =?us-ascii?Q?ulVQKiy8xgdQHuSkhinMkfnHVwZ91bjFbOPmb2PTDHxvj4pLgkg2hHi7KNrd?=
 =?us-ascii?Q?DxH7dnj6g4M4yMeyB7NATDIF+9jvBCWCs1xbGFaF6Rl/neTM33UkfPZPMcw1?=
 =?us-ascii?Q?a+B8xxVDLZgmz9m5D//mHx8luleJaqKlxAPB8Nk0I5ecY3/ElRgeBtyEmCII?=
 =?us-ascii?Q?Vmku3XA1GNAePpTGQk2xbWoM+vwcTmmFz+UeUWwQ32xtXMoREBetk1ifma6S?=
 =?us-ascii?Q?aF8XQaX6ItXRGoVxEBpJm37ozgDhHSYo/PxiIJZieXeVBlGZK8fPsSyWLyXh?=
 =?us-ascii?Q?X2lH6p+MU73zQKzkjcA0WY6qhWOd/rFYTe56n4JS5bc4X9WL7FfewxTGinIy?=
 =?us-ascii?Q?+RCV9N2ySdDE28s3HniC9IzzSQ3Bf5JKy5O/9IldWWrOmE49+tEIdte/sjay?=
 =?us-ascii?Q?nVK2kzFbluVcQ2crPPAB5VJT7ewfVfsyXDFNna9XabSQiKC7kLh221W3khXR?=
 =?us-ascii?Q?8b7wKZN3vlLJ3rjZJujJigVbtw7H53UtxPus4C9b4bz7JrDlUF9VSA/xLTkP?=
 =?us-ascii?Q?MOtZYe1db19obO/Tcce6YspJjn7UN/sOArzDHZg7B/C+PFa7xdj4ek2KwE77?=
 =?us-ascii?Q?ZqDGn5eAv83+RSdvtnqK1Y3zoW97UYMBPbIhtdlS25BCb7Qu97+a1XIIh6AW?=
 =?us-ascii?Q?t24HqL779EAeZRdFvipiUOK11D95B0n4mxkalKK2TSYmhXUFphC1/I2V7hHD?=
 =?us-ascii?Q?57AiaJygYAZo1z2TCYQC44ZkFAnNWJAE/joSHq7lqiiEvAjEztuEzvkCrA6h?=
 =?us-ascii?Q?4E5ws6e8LvMFwKtDu5yl/xaBc/wK40On27enKqIJ2kua/6qFo6rjsU7Bg+Lj?=
 =?us-ascii?Q?VZEnLUnVR85QHdTiiNSJIFuEOur/10D0ZOwXmayw4uri9a8t+LkohIctiRR/?=
 =?us-ascii?Q?Pe/j4IWOAp7SezAWGSF2X2ceIgg/tMmZk2Yhj+HXACOn85dvjPNal7FTkK4/?=
 =?us-ascii?Q?DZy4lDOhmrU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iJeJ7BqTFH8yWj1AuRoRDQM7DoOHEOKmj0O6usOg+AdF6pewn4yB+dmV62PL?=
 =?us-ascii?Q?HJ9O/eWGCjtMmkEDSABAAaNMhTkF3n0K0vYK2doVoaKbq5rMzD7haocZ5pJp?=
 =?us-ascii?Q?kEXr4LkWqBBkJKKId/KerruosHQWAhmAhbjAqsh5oI4UCk+Lqzk/xncHKlAn?=
 =?us-ascii?Q?hPv2mHJQyhO1AASCg6H4kmEo7evkK8132k5OAqkYzqsxP6JJFWuUI01tosvF?=
 =?us-ascii?Q?FwlqM+WyErGp5SLIxVZY9C/wQX1Xc5ebI1sMhpNqeZSVDtIB1ETiKh9k68F9?=
 =?us-ascii?Q?sl9Fa6qLELwkeMzjNEVqwvGL92sfp6za3aLfZL8ogTqKIYrlTuYuSAb3kbun?=
 =?us-ascii?Q?iNxudBzepudg7swQXBGmNzsi0Se0o0GRXShvlLWKbsJgkBSv1utQNONngXqd?=
 =?us-ascii?Q?mwHhlvPWv9ZRMR7ugEePUQ4055duVFNFjfH4zXWtoxkr/B3rlgf282mGVplb?=
 =?us-ascii?Q?hSDd/rfiYn9iZWleL3gRti2OnOqTmRVBfzGAZupX03a7ulYhY8+/C3NLEiYI?=
 =?us-ascii?Q?7ZWIImu9wPJV8mTl6g8ai8DJkiY9LX6V8VA4mnd4hs7fRAyUXgVKgIYf2nJO?=
 =?us-ascii?Q?xOYzoYJ0y6/bu1dJZ+UdZz9Ex1m3kGkKG7l/KrLFErI6/Ote/YC8VMEl+PtJ?=
 =?us-ascii?Q?/qCKwLAZSEiE3AwJTwA+GvWtHgxgHRM12tV+3XNwZytesiJ0s++4gGViRGwB?=
 =?us-ascii?Q?VEQAvrhNj6tHuf/1QX92P5S07JlUVJi/3JFpyOGVYEpbKlXUZfFeNScZHfso?=
 =?us-ascii?Q?urRTcd6KlUSuO11SNhNGYHHt+ccfPCMVHWxK5KxHT8a3Rw4kDElIKE5l1exG?=
 =?us-ascii?Q?zZDujLfFwbP4OeRBzRcuyJX+eAOLS4yjJdmjvueN8b/DFQh0OKwiaPGeAw72?=
 =?us-ascii?Q?JEBPY6sgAnp7cCMATz3vSA/FY4g398jrPOGXMOrLxfFkz6/Zvs/9M74Cdcn2?=
 =?us-ascii?Q?TXpyGcTR8tWRS8Xo6LEb/OGSHBTDTRboCUT+j6AQmena+SG02qv0twh9X4zv?=
 =?us-ascii?Q?F9CLlsC8nSLG3MGldU8ObL6mWIPwcFNr935L9awNmkT/UXeHmdSo2uDMA+MW?=
 =?us-ascii?Q?U361vqxh9cVoHBTuTf9SGpiFUin681lRBVjsgFDPE2sm8BJHOzZXVKnuu8P0?=
 =?us-ascii?Q?PE1EIqrZrEejS1sw8yOzo9INtieaovpVMuoMQp7WH7XDLYpg3TAgdyLzRWiA?=
 =?us-ascii?Q?qQu1OWB/g9v8uqqrdMgsuw1A+c6FGcG+hOWJfUAevrQrLOAL88zzTWF1KJQm?=
 =?us-ascii?Q?Fi4eNFewr0pDOqzUM46imNlGWmKt/JQM6Ub4HibMB/qp/ko7HHQVbaxkMZxG?=
 =?us-ascii?Q?HTbmeQ/tiwyVEHtX3leLIPsa8QDpTFmXeGH0bpJr8BaisocFWAWGDMwk7Lfv?=
 =?us-ascii?Q?NYxd5g3n5Vo/ouygtAkoc3VeZK2TSjUnnQvWjc9RNYu/6dC/qZCV9e4sk9sA?=
 =?us-ascii?Q?BVrVypaPAZHxTXfoUuj7IUvL852RoWUO6hATDBzZPBbBS4phpoDKkZWmG8Tf?=
 =?us-ascii?Q?2KfrAAL2x6+HWHOjQdh9szwiQUOtwNJehf63QFEXDKD5Pv62absh3kkfszEY?=
 =?us-ascii?Q?PNnPD6IOzni19TALRS+uiViCsHquPJzYU3J5dZQaASX9SkoQlf+0ysEWDYuJ?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PirNm0zX71v5zxlYswgVF7rn/hHz+1Pf/6bgGNFPq7bZBGdNrSHqZ294MTQaCWbZwKagFjhFCIfgVrFVn9spMRpAopUdIq0NSn6fxEh3W/lQ5Fm5Hea3zg0rKJ5PAinU6ps6bF/jaFuJFXn4C4IZHkrT4oStdmaQL4qIEqr4hRUR51Ev23JzWHc05F3W17/tyMDHDB01GH+b2GXLUaBKd7eni6kjN1zRNQDmIwdEDu0GDoi+vfoG6X96EvpfXkMPmY3VD8sHuuTwFl//j1NcSNEEOzNKi2zC2sdt6CWM1dWEyNixmIOPu3PahpZDIF6Z5Qzf3hXOHeLRZLIpuZa+0mwvG7BqOpShaJ2GcOVteoxT3SIL5Of+Xr/yLTBf6aAm68Ky374QHN6ccFqfs0WyvWmzO/JGAzlw/23PKahnDzkQnEeE3zvzgFXwexX/jRWAIkVzAVPW6GgZUlhHbhTcuYO1vGnPixyR+OhSBy6zxZgOo03PCSBlxFWsoFTLQV+5Z9bTZrAV/bUJ1B3fJ3svhC4tKlrwhtpW5S030LGwJHPXrUpCROh1tSq4tn8FXhgTo/6NO9KoFA+rZOkGf0AZem/w2SVFgkYLAHzzhecXHc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e76d0f-d973-4104-af0a-08dd980931bd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:45:41.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8e0LndLzxCU9GqZtCyE8Ut7Nlp6Nd3V5E3GVlYUbltJhCmS7aZ4UlIvCthdunns6+aATKzN3N1JRSTSEugQN4oqBz4eTIJ2S9l/DcanxlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=940 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210015
X-Proofpoint-GUID: 38HKeLkBaC9IbZh9KdrkkLTgpGLaFmFj
X-Authority-Analysis: v=2.4 cv=FZw3xI+6 c=1 sm=1 tr=0 ts=682d304a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=zG5Ccyl25999pGuOUW0A:9 cc=ntf awl=host:14695
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxNCBTYWx0ZWRfX0m1M00RQ+djr T34AwUt0WWNMOE6/KjMAPV/ujqhDmRF1cvI+s0re1LL5vCNKkfQwaLZ00aY7MkJOnCAMQkuMzWC df8VJTa0dADEh7uRgJOs0unet9+lVAVmIrWBAzfYMX7AdH9Af2hO5ztvIkZDz95DeS9vVYS4X0i
 0saXZHxjwXY/8FhM6ZIhmqSfPjSiUpF7X8Q/3H0DOohSZyCFBI98L09AUYaHFin2z5riTkkQO/2 bFDTeLyruKA+FfG4Y3DR+pi3iKRTI/Bm/vSOulIedU7HrSOoL+Kz+ZKTGECeOC01qQcGbWnpZwb xmP2XFujeZ2nZAfjMhxPlJhrZvP/aUprmDpn0v+hqhQybO9BKhGi/agzdPnp/c9GF+vwcql/X2U
 OYLNE9YGjkz6zKOvzMPODPqwjxRjb7lhxdCAVf8kJciuF9XR/OUikFS9fhIigjnVQzW0+aav
X-Proofpoint-ORIG-GUID: 38HKeLkBaC9IbZh9KdrkkLTgpGLaFmFj


Hi Nitin!

> Nitin Rawat (11):
>   scsi: ufs: qcom: add a new phy calibrate API call
>   phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
>   phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
>   phy: qcom-qmp-ufs: Refactor UFS PHY reset
>   phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
>   phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
>   phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
>   phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
>   scsi: ufs: qcom : Refactor phy_power_on/off calls
>   scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
>   scsi: ufs: qcom: Prevent calling phy_exit before phy_init

What is your intent wrt. getting this series merged? Can the phy: and
scsi: patches be merged independently?

-- 
Martin K. Petersen

