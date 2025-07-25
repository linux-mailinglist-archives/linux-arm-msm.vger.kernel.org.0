Return-Path: <linux-arm-msm+bounces-66640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923FB11595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 03:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB1A81CE480F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 01:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC4C199EAD;
	Fri, 25 Jul 2025 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xdc0WdHS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G78VHHNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F005194124;
	Fri, 25 Jul 2025 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753405972; cv=fail; b=c+yyFi5uawfMlnJdK3UYL0b+WUXniXV42CAVPcynkn/TGvDWMDq9Gr7kWa28ivraK1LkfyPyGi2ZmDMP/PgHtKoxXkekE+/GKz2kcFasyCU9/GWtLocQzOWTLX58XwbRct5ar9Aj+LfIzf9WIrIDHF3oIfIjdfj/QyyTQ5TmhsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753405972; c=relaxed/simple;
	bh=+wsyB2Juj7cpeukIv6yE8idIrpcUQzd+v+0PGsopqn0=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=czVSvLHXPRqhO2j8YCdk0L2FiHDX18hFKPqHgYJQ6IQo/Vlk/yBE7VOWF8bvqtqrHYCLUKrNrKJ8rCzejhosmqzpk04E8ptq0PbfjY+WpD6ZCOez9R9LL3+9aBbt2eaFM+CvUrvTQ7Gf8B04VC7+RZV0+dajdttU+QJvibeIwQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xdc0WdHS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G78VHHNB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLjvNE008614;
	Fri, 25 Jul 2025 01:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YFneAFTEoZk3Vf4ybU
	70hvi0cbLKJpbbv+5SnjN8FHE=; b=Xdc0WdHSgTGmUy4WvRQ/9JTNwFNKwZcI7v
	ANEPd3xT0HtLL76hbfhM+HtteetgZBDKgyOiXE1wIk2UFy7IYZTI1oolLir0HkjF
	7DVPvR2YrzelQBCw9zxuyoqplBMZB18AMxCHu47t3BlX7QAVeBUlsvPOvivA1kgq
	G7lw0uwm2rU8oPPKvGMvrmU7OzE6sxW+fYRTEkdMA/DR/b6l0D7/B0ATlFUcI1RY
	MMwMqFDKTs4b8vM8uPc+KngkJm0GjkQubUq/tQuaFI+dUNwQ/VnLxuMHOUXVpgDm
	Umk5YWCEwFGRhh3uh9vCnHw5DHeAnA1+u3PIUd1hs+BZslR323ZQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1jg5tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jul 2025 01:12:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OMGK3M005774;
	Fri, 25 Jul 2025 01:12:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tcgk2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jul 2025 01:12:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB4/8918TiDnHRkj9ANMbC2yT7O3FQpZ2gIkIEfhVYHVK6FBzwWt26R4zePksOCWBpfGEiP3WDM3Kg4NzoNk9AnsKnAE/yEJAXb7KdKCJ0WBKphgWoJPIzrgnXGDQF+a/5I7KdeJo2mcUtwN6F6m+X3ubTWMyCHKcQ1muwWS5fvNb//KwcMTw6CoFNZifU8ErrAwIhGXm2tpjQyOWf0oVa8sgWiW9GxIr6bsyDHiydouKmyW54u/E4RFvJGEc+IzD39pHAchEr/O/da4fPtTdrYhKj51/6z4MRqRH/SrN1E6+YQHIXU8YULEKZ4ilzJqO6nN///v7XQ81B28sHr3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFneAFTEoZk3Vf4ybU70hvi0cbLKJpbbv+5SnjN8FHE=;
 b=TNyRkFLI5imzjl+voSy3TeYrNgwmOjmMym2/5M7/SEkfkFE07O6+Ub+UjYZM6qrssbnTxns7aTqUYQm9RLxKncjfk9vWNfvpd46ZWLMxinX1BzEbN7wQ4d3A38iysRrzqzwqI7F8GSRqltHljHwiNzpDV0+ZUYrfilpOZB3a1HkKPJ8piSnUMUgG1Dkt6r+l4S233hdGRQVZPeBYy/NfIlw/u9EmZjPGo4/OXShh1b/2NBo+JgvNWWqMNH3IeU1UAWmQxwlp8ddXISYVa41aBEwA1wwBBKU3+wbUhluY+WJL+VaCKdN/G2HGzVXUjNdsrWu7nzcHBtbqBOF1FYpX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFneAFTEoZk3Vf4ybU70hvi0cbLKJpbbv+5SnjN8FHE=;
 b=G78VHHNBNxLmgg16qe0Wzp2jwEExatt745aki7Mg3h1R41VN9Y0xm541BWiMfoQqup8MN5xT3Nb383yh6sseJOEnYeXkx16V5etRGdWjRVzYvAroOJgeBV0N91D3PQptleDqCQoA7JxDravy/65jO5vPpgflx4gxdNWNoql+CMo=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS4PPF9FE99AC64.namprd10.prod.outlook.com (2603:10b6:f:fc00::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 01:12:34 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 01:12:34 +0000
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Drop dead compile guard
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
	(Konrad Dybcio's message of "Thu, 24 Jul 2025 14:23:52 +0200")
Organization: Oracle Corporation
Message-ID: <yq14iv1t6o9.fsf@ca-mkp.ca.oracle.com>
References: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 21:12:31 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS4PPF9FE99AC64:EE_
X-MS-Office365-Filtering-Correlation-Id: b9376be9-9dc8-423a-0be0-08ddcb185667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmRObETMY74+MgrJkv2HmSdZ7qUxA8+aDjPEoLskTIp6zWwtFblUAc2gnaim?=
 =?us-ascii?Q?IHEDLqsKCSxm1csPFmExE0HHvtvBOFM8jKFf2GLVlg3I9bDCWqnzwKqxB9c6?=
 =?us-ascii?Q?jf4+u2A+mp55GozhnzvSImt1VMd5qaYXyYbUedCRLWCgci+CgCxHRqOi2ZNU?=
 =?us-ascii?Q?wyGuEo7fL0doLHAcEDLer87mGUtvrw281nCNxjNVPZjQYQdRxh/Zqo51AWLF?=
 =?us-ascii?Q?z2z9PbvXGuU35VGQInl7+NZWPgKnQPqOs+oZa+cPVMgb67rTOcdLeLZ+bLn6?=
 =?us-ascii?Q?XQ2KWtWJh9gb/LpX9S01b6DZuFajuPxHctpvyhmJRTVhEShC7sUkaHKBMPeQ?=
 =?us-ascii?Q?DB81WtuoFcKWpo80+OumoBk3KwMd+MSFycT/VtVZqRirGGGUPD28eXsZmBWy?=
 =?us-ascii?Q?mgKuIvWROm1wZLW20W1a9bepIectuCSj5T+lZxyjqmy3mObaj0B/7b/77z1M?=
 =?us-ascii?Q?DwEmiBhv22yfUdZrBnX5oOvsBi3AqnCIwV+xgc9pSM9/zizwKIXZaxJPhPlG?=
 =?us-ascii?Q?7UGm/rX5IbZ5CWlFJbS+cFlQZvC4h+/O0nvCw4416QvkKyAZKf7s1ISWTyJi?=
 =?us-ascii?Q?XpXpzp3jTq16o6xq51BNEHP18chTIlLNdlHeuEe822DOoAdNOwAmGmtEjpjj?=
 =?us-ascii?Q?G0HlZpwBsGpHWmWX9Qx443oAfKt6ATZaRDK7+OhvLVTiTcnUa2Cc4/sIPoB4?=
 =?us-ascii?Q?O424w3EUnt9cyBBSminy1JIhp0D2/xMgP2vrpP3zouhM8/IoyNLJu/h5/BMG?=
 =?us-ascii?Q?mw7fxFJO5FQEQeXsHoVsXzPPWKg+S+FYU2GqvQ3JZvPIS3Mr1tG0MVBHy0kW?=
 =?us-ascii?Q?oR7lB1BR7TcxEU5sMQ8v7bj7KvPCPe2k+cJ+jUqImGwQuETaMTPArLkoHPOE?=
 =?us-ascii?Q?8mlcxipB9ZJDy3bzFZ6wf18HGD4mqJ3MsmKL4I2T5ydKFwlaht09k+NB3Rwo?=
 =?us-ascii?Q?jmMPMfWpeMG8MkoJMKmxDuaCQo7Qz3U8e50P8UOCtEXHw3+E6PTP9f1bZio1?=
 =?us-ascii?Q?z2Tn6/N7HFdJZWyHvlD58XJw9rr2b2HgSePiAz+N7mbHkcjsck9yriz1Rpgc?=
 =?us-ascii?Q?osvSd9QNFNWLYUZol7KAh+4u6jTgR9c4UTurz7iaLETLoqAwBiQjWdRHH3X1?=
 =?us-ascii?Q?XImJRKyKLJcN5JZ9vf0IPtGlPPbTPqLLD6EITwf8TRP4PvhkVb+XgnuzG6jC?=
 =?us-ascii?Q?nCSPTOkl5G42YooYbU+lZgeghLN/uD6ZKt8qxX3f0Xo6xNNhdVwOOHuF88I9?=
 =?us-ascii?Q?QCLX4XEWVNaUwTAx9ZRO2SHrEbthfFE4aNkVZMR7/1EKILgpMxOOFOUOEvKN?=
 =?us-ascii?Q?ydZDGNj0I377/S+ybxRrS+yf34P46iKvMLDuPfIPaXk9JbrJRNjda5Nt+5Ty?=
 =?us-ascii?Q?QONIvG0XlOdELG/oAfljh7MTOGqfQtcg++VHqpVDEKyQdemuZMEnJEyVADho?=
 =?us-ascii?Q?poaRRpfvX/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9CdbgWuQK5bHmXEgfpNHbohiJZj/k7D0PvrYPUPHLzn+LOmetynZ8tCeDa7?=
 =?us-ascii?Q?wUPVj5I3sKSNEr6c78b/QG6KCnsPnoi01p0xF7cvbSIZuGmkggv+HglyS9bK?=
 =?us-ascii?Q?0lvts0FhhmcBAL/NXfHBv42G94z44cL/EcsTP9mFVbGsYrplbZ2ChOH+67m4?=
 =?us-ascii?Q?AS8sVuZcA5aXxigXzeGSFlmwXm6JwhV0QO7WrleO5O9U0ypOUoVl43c91kqm?=
 =?us-ascii?Q?aEVzgQvjq8kVGH1qmssGKHcZq65XN0dLTlrk+1ZJuwl+HwDUJ/LT93tu8UkU?=
 =?us-ascii?Q?I5EXlp6++2rCqML3+GCam1tRQyN+w+kOyXE8f8pokn2HyfNlo1yXCv/d6EB4?=
 =?us-ascii?Q?lZk53ZwFPwaqewXW9liQVqNaAAuYZnAH6mIDqr4n0YaBjll52du4FWcc8RSg?=
 =?us-ascii?Q?/jzXcNCMrNNJI1C5ReOWW4aMxfbJnc0XgS9J76L9yMz8KtFcvWzl0fm1DWbU?=
 =?us-ascii?Q?tzQBJ43w823n0Aot+ZXKnOr9VrWEb+76CNyUNTUc1k71Xjoxrq4X8iUKLeGB?=
 =?us-ascii?Q?z9/wRx+OJvYltGFpiKflinpuxmCwwM7AiKZNlucHHN3LeeNwcahoR/1xiJIy?=
 =?us-ascii?Q?O/wjz8QH09Wjxz8Oi4vDPE5RrKjkjRw0JPTG5A0Qt4ir5KnCDDNgn00ZTORc?=
 =?us-ascii?Q?Mjb1fWicX5/XWMCBHKWAdHoauKzWAw4w0VXzgyaoHA/VPrQuwUeFvOYoQqZ/?=
 =?us-ascii?Q?xPYyxMX9PByR0XjvdqccZzJMUqR+mzgAWMfDq8BxvCbLPpUOHMlD/0didje2?=
 =?us-ascii?Q?LlWV6xZc3ghGPIqM4E1DgaT6BGfw6oy8ep6rpYSZlXZf3wm/Fvx5bAlEhDzV?=
 =?us-ascii?Q?NYqsPcA9K1OqmxJVdqqVO5igUtNFxUyN6Cf0rdBKLGFpF1C4qpa8CckIc3sf?=
 =?us-ascii?Q?sdSkuTtjBMm+WMOn88VLMYZAo1mTsdkxAvdCzMygLG00IJGunH0qA+KkzZWF?=
 =?us-ascii?Q?RnCRNeIq14u33ihmPd/p0TNOzwupWajnIO4uTLgiqlht98dEqSY7KZVLo/N0?=
 =?us-ascii?Q?1Zf7itbwHqPSeYV8N4+wWH4Cv/T3lecidUXpuItXYHtW4uGpT0dj3pTn214N?=
 =?us-ascii?Q?bZ4DQzXvTp3gnnlxXY9zPmxOaEwVjWlzzYhlzWiNweU2g0KknnbsnI1Boch9?=
 =?us-ascii?Q?I7zZRGP2StLbeWQOgmUW2SnkqTcKFr3yJzip1xAlGIGN+Yd03EO+ATS/MSs5?=
 =?us-ascii?Q?Tps7AggAnbYc12SZ7gbldrldYvtZ+ozDQMq4cWcztmHdu8dBdNeapmyJ69vq?=
 =?us-ascii?Q?mK4etqFv/vn7rWr+HAgX7N+vk6pW9O5BN2ahHesOnBFz1rOUJxu3Rw6X5o8s?=
 =?us-ascii?Q?Y5CJdTsz2rKf2b5YpKaUGPovrQHA4BgmQDftnzWRtgGCSsxvSrrFQSHJ9siq?=
 =?us-ascii?Q?hHmbxuJposZbAV4B1kdhGYcJKW3mvYRlshrFyk+gKgCX9jFloJEw0XGIRD74?=
 =?us-ascii?Q?t/O6pnWBKaavNREftA9riESFQ2lxWI5FeqeWasRZOary/SosOJLC/JiYxTxH?=
 =?us-ascii?Q?gXnF7Yj5I6Oqjxcc7PzlMEv9DUl2LWmII4uKYDOYan9UR2k19vwlJdcGsx3O?=
 =?us-ascii?Q?rQyT2zZrhqT29JHP7yp+sE7DuVTZOWGmbio29vnwloCJqSxLvnFjA6jHAumW?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EF43c/1LMRQsIcNj6vxPFPL6sAbfEECCxuLiv25KR7SXWJqPxI8gOXjKnLjSCgvf9SGwYDHybtgKNWRoa7GUuMjlcz/sVO1AbSHC+oedsDjI/lKFZ7TuIYFbIMhwwu1LnCDZ+wMzciVUHt4wlMiyrqPqV3mGmJys6g7ROUxB7N22tvR4N/KiA6604u13nYQB9106I+Y3lirQPqisnGL+tnOpCY+N8C4Lm4y15Goihfz/N4k1EUu+8AFOlOFfYPZ+vm84I4XtiL8lh3oKC6nIpx94CKXM7+gzTXLdlFJVyzGwcm9vnxKLNuvXmGkRckMiI2ji4+7dbWSMx4Gw7eCux+/C6wgDqMnHjNBnTKPYLNkVTPLeMGfOaaB2LNHfjzSy0g3U3v5VuPYTNWWSXPhsMCxaD87LxmYqu0QCqFJrGPSeKsGhwOmofJgXZgE45jDe9/JgkNywveUHUx6vd3hK/jgWtuHs64sU7q0GISIYKWQMVP1PEGuAi4pbjpV1Upe6DbnUtrwWPcCKoOjGh3XJcj8Xxwt3HvrnE7fXNEHQilxV5HZs9zfLaiDWCGsgxMgotLCnFHggmQalHgB+x/SgZMCcJ0oKJ2PihPXzpQ0TfEs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9376be9-9dc8-423a-0be0-08ddcb185667
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 01:12:34.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaPoMPgOvaXGuAEQPu/3uyWIrvy+is5t3kh2kD//V3+rGT8Y8az3+Z50z+7parYVLiqWO+/D2TaM3aYaomENvxgFPMn7xxggw/OEjskcOjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9FE99AC64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=783
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDAwOCBTYWx0ZWRfX64ZpFA2c4qXF
 gXVB0BGEtRK/7omykJ3MPGADtMjCRBOfb7chhCGKQjpTlgBTPBd2MNObAcew2ftKemdj9o7mcvj
 G/3oCzb8zXW7UDLk1m6Oo4JoO5yMVo6370tnPjUaVlvF46m23D/OHTnysiFCNtc5EVJsgI6Nl99
 Q4A4cx89QsOx/7qw3gftyQM8E2UcSdgNdrT77YeRBZs393uq04fkpoDpeRqk6itfgSD4O0Md/ax
 wns+lLDwl2iIxNRrmzOrLGC1lxyv1sWZn7IL7QnqKiDPqFY4YJav0jntOLbTNhXjcWD3knaIoir
 zC/C7tfXSzZ9s6sDrnpHgr4X92+Kvxy3D0S5sqWw4ZiBAHqJ0wva12Hz/+ECfNOhPctary7agcz
 rxWNX5ejUCr9adUGf8k4LMGDonhHoWnfdWdhIULNacCmyByhMzer/4V4sr6Tm7LTK0iq9/lF
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=6882da06 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=cewXuGIsSzsw8c2jRYwA:9
X-Proofpoint-ORIG-GUID: LFLyzVnJwZ26SvXQ0Q-R3m-EXtYnItWL
X-Proofpoint-GUID: LFLyzVnJwZ26SvXQ0Q-R3m-EXtYnItWL


Konrad,

> SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
> check.

Applied to 6.17/scsi-staging, thanks!

-- 
Martin K. Petersen

