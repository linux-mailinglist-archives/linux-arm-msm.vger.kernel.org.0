Return-Path: <linux-arm-msm+bounces-76149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82985BC0099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 04:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F293F3C43F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 02:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9401DF759;
	Tue,  7 Oct 2025 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sMIUx0gM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zcRcDNkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F11A0712;
	Tue,  7 Oct 2025 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759804739; cv=fail; b=MsyBTq4YL6LORwYJ4+0utdTRzvqkc+TYsussgRTkWGIbMnK+HKLfdBI5qAFz6S4QIaL9hpwAtKBwcILbIYHL0Tni6VlAeoXKOz+Otm7CkjQu01BhPWb8zj4hHfFxvw28B2caUgYJgIbtLEhLJQIa+dxDtEzsz/Po+6EJ6RwhivA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759804739; c=relaxed/simple;
	bh=bI0KBJm6pk2FRQ6hNFuCUlRc+FkgW/bEIS0QLpBpIHY=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=eslLDMF+8ssZ70mMD3KWoD4gwrUPJCpL4gLaBT1QdmxK+Cxpsx5PeNGItKvGglN47lc/gRPc0aQAxmZ+oqXHorO/GZTg1E1QFGpnK6QmUg2vsPkoIwoTRwPGH25RYA0s6Ahv0zcwCRmoWqfxX8Xm+iZ9JFXy8Vm4xKp/YNkvn+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sMIUx0gM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zcRcDNkt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972D9rq024642;
	Tue, 7 Oct 2025 02:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0BQf6VRVLuwk1zbCaR
	ji5aQ6uu7pzvxZu0aOwuCfW3U=; b=sMIUx0gMJlHnitedn4aVhZnmcldFgZP+ea
	rtG/81AzdA7uBKcwX3OSsi0YUQhMNqeLm18eZeOD46Uc0WgGVVM1QYnY2fIYqqoA
	RSfB0n5sMFT+RoyTEdLKqPjMhPox4fpHmVvW96JwgEI0b7mE5hGPMlApS5+cD4ih
	Zhaxa5shrRpuESD2VJ7FPVV62dc4sWsVcv/p+pcl/2PlPb3ZNiNVn5RNWCCaZOKN
	wkYRxkh56Nr51FuK0T1hxsmCYmv22yhdjbzAGsmq1lrDcNbwvGwNdoirovP+kq/A
	kjQ2nmDF14Jl99M5T0t6u0vSEc9v6FhsLbv67FBxJTpPqROtN3qg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ms8a01pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Oct 2025 02:36:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5971JWHd028599;
	Tue, 7 Oct 2025 02:36:34 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17ks5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Oct 2025 02:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytgDKzN+RhNcukR8njKZ00VdO6isf3mMA/MJH35DP+Mdx/23HCySAdZzukWEFhYYbKtiBA6J2k4DJlgRtzAiy5Fj+MvMLNBay9odeYkINPujzJNQywcPlIyGR7JOeJohXgr2lCc5cWkWdPNdZkYExWyeO1RCXwlwPIIgBGX3EgPbZnFoZIDtg+E2W4E126qvFTQynTMtLQPH0qlD/Cty6hxZHfVtic4nH9PhRElr2KLkWDsB8HCFvJD1Tg93VIEubJB54mvSiGkcZFcL1IbrPMhAF/SyZuUwCL2+DPRZ71W87/cbeRxd8dIgL0ehGIm7xO67toR6FCOzt4n5f56zTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BQf6VRVLuwk1zbCaRji5aQ6uu7pzvxZu0aOwuCfW3U=;
 b=Sos7xzqJ4wJ/4M4/kKOh44Txjrj5/7PjckloXZKR/2lmp7K57Y0ceM2PV/quNo0dwameuxdMl9ZSaku9KQjTIetaagsDK3+K/AXNZJkAltbo+bqaqPZ5DPQnMCvGPSmhYOOuOuTps3izsBeVMWi7VKcvf99CvCI4rvxNwp1Gic1+5CBR3pDHQydnj3eQzYopep7BqJXtnDOVRJvHyN6WjlCR2eu/gjezMixnCuw/9yfoCfiZgySrhmdBLNzYjSLt6sH3G7SSNUoDzQBoOi3+D6qR/CUaO2pRzTHOzEZfprzrKk+MUNvjGKt+Spquwv1MQwJLeE3hX4jyABWm5ooM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BQf6VRVLuwk1zbCaRji5aQ6uu7pzvxZu0aOwuCfW3U=;
 b=zcRcDNktnwusvItAbMMzMBU8iwjb6FA3r+Grd+3g4qJG7/6ZTJgoyjf91qXDRFPFfDSfsdiBmFXUQFX9ijsTIlRv4ASTA7HWWvsFP+pvlJbHtcDe9tcG3K0jcAS+U79LVr0ylBB9WEa2dMo5bdxgqJb4mX/5xOkxvaziNWkfVfs=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA1PR10MB6831.namprd10.prod.outlook.com (2603:10b6:208:425::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 02:36:24 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 02:36:24 +0000
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I
 <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Nitin Rawat
 <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Add UFS support for Kaanapali
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com> (Jingyi
	Wang's message of "Wed, 24 Sep 2025 16:28:59 -0700")
Organization: Oracle Corporation
Message-ID: <yq1wm57e8vb.fsf@ca-mkp.ca.oracle.com>
References: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 22:36:22 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0029.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::29) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA1PR10MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b39797-e716-4c1a-374f-08de054a4eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RqzZvSlT4wBihzUVa++aMmuNKcS4vuDQYSx/e/FdiXV2MnRlCelH4ToubU64?=
 =?us-ascii?Q?uVrV1CAmlfYtiBn6Qft1uduD83rSzFInN8XJ9gEhMaVxRa94y4lUC7/i8D90?=
 =?us-ascii?Q?eNuwRkhfNP5VDLBU/uxr+JXvX6z1aX5IcULuUeyqH+8FvfNlqs7+FLp3DsN2?=
 =?us-ascii?Q?L8r0yaGyzs6+t2HRp4Hb7X7urYeYjgcKJXLtBV+Cb2/8vlNNkRKp0j1FW4K9?=
 =?us-ascii?Q?ktQVd5SWjQBaHKgShztnvrYHxtxDobwKHZ1e00+ty5OLVL+A8zdb6oA+3FEb?=
 =?us-ascii?Q?k5rtaUEGsDn4+ogeY5sCNAilHvjsdgsSA40umpZTtrba1qZyaYO6oLosv2OG?=
 =?us-ascii?Q?DIn047aLMU4tvfJzRrw5i5QnFADrVmrn+3laWm6vLPXYG2fRVMLj+frEIk+E?=
 =?us-ascii?Q?Vh8V094w2callVimtrcjhKbjsg4eWUJo05oAv0IGSZ5J8wKVPIcoEQBFmVRI?=
 =?us-ascii?Q?jgfvrper6674XfIu3CyeQ9H38glS2l/tMw8Y/kN2lM6AoFDRLDhxss0OjjEU?=
 =?us-ascii?Q?NPWO7E34dvVxIxw8NO4dsq9yd4tEGmaiXyDak6mED0Ph9CiEUVpH7K91z3/t?=
 =?us-ascii?Q?3VBh8TJIG0SGCWQBvcvHi8tyf6DZLjqm7UlpqnsI4flUnIOO9EzMvLszpCLn?=
 =?us-ascii?Q?9p6y2CwM8raLVbZHl4ldB/J7R5792BVNsbmqt2es29AUc0sH1oqL1CvwbheB?=
 =?us-ascii?Q?5oClrq68AnKnxBLqxhuc/USHM7Ef9vipjedt/MUV++GzUp4NzB3YzgbHrhzf?=
 =?us-ascii?Q?FTJa1jKYAANJ8AdPcCEk9w5obxCo5Zz9xnNd8NrIcbsBjleuyekcyaGUZ4iy?=
 =?us-ascii?Q?TsFP09A08THF3xDzpx6FQOuG2L5Qo0F/nnmNcvqQYGcrlyC3k5iOaB8ZYunW?=
 =?us-ascii?Q?Ol7CjAszSn4PM8DRS9aZCYeqsKnIoL/nOAfe0ULySMTK4ri6XOvjSSzoVged?=
 =?us-ascii?Q?mz2vRXX+rtUVQeHdu2paKgF9KQG+pg0rhIPqtrAGvC5Xbx7GWbryJ9n0vaVr?=
 =?us-ascii?Q?HibNsR4pqUh09Q/e0wYhjhkxCUGkmRMKsEltIsbYtjlpwtpvHqZ+K0zlqDW7?=
 =?us-ascii?Q?ZJ8jGxegU9W2+2p1B862KVnG3H9u9Hl6KdTrt4WURVszlx7vN/e7ULzCq+kk?=
 =?us-ascii?Q?30NhpKGYDDselpPlVex8hqyjlPk1XFjGMcgJBknXiEoQX1A8CDk31JAkkBzh?=
 =?us-ascii?Q?5ONaXtx9uW7EIflgxqN3Eh0uRJsJ5plt0yJXASKyubFMqdAZDXHpxRHtrGuO?=
 =?us-ascii?Q?zlC07X4r0tSBikHGtIigzxTFNeL5oknqvibftNecSZvdxjUdjDFdUfkDqszy?=
 =?us-ascii?Q?276fcn8lDvS9kIqN+XHNPpxmVFz0khPqIQ+GMCy0jas9e7HQ68LTAf4hGsZx?=
 =?us-ascii?Q?S9kuokw2HkFbxNJbqiYrSXMxrk3gUJ2tLWYFBZl/VH+cywx79ow+rQEH5vHH?=
 =?us-ascii?Q?7zRswBkRHB7yFxrGl9NBzR+LHlYzIJnT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9WZqzlwQzR9QfBKJr+baws+RncLzesLdAZhYZpdTeS+/4yQj/IrpIEeyNb3?=
 =?us-ascii?Q?+0b69Lx+AutHS1oZv91gWXwSEgD38RZ2iELhacCoG5ZUWlQ0q4OLULe8EwDs?=
 =?us-ascii?Q?9Lf/VZHOFTEzOkCn+ktEtXZyxl36vXnXAB4MDHP3A7lc+NxDDzk/pvjwtpvw?=
 =?us-ascii?Q?Sl32zYzEbkBKtopxrx/CK9GGKpD1B4Dg06rJwpTUQ6l9MoGYZAdqPR6H5Uab?=
 =?us-ascii?Q?mP8ZBNMv8NQ0/LIPh41oBGXRhvq5Zkt+8gNsNdKSSVrxG1JOIprV72U6AyPs?=
 =?us-ascii?Q?C5UGXR86/MK/hDtCHHmTT+ryhFRQVGAGvuDMamwGC07loq8Hnk4KC08xhl3+?=
 =?us-ascii?Q?vrVZWAi5AWuxqGX+rML7ubyPBB5lqrgsAxFPa7Z+PmbDzIcGTkYLkiDZSL8p?=
 =?us-ascii?Q?MxItXjSI1AR31/fMIG2BKyYf0ZMDrmwOomBmMKeS04oItC02FVreT1H2T/AD?=
 =?us-ascii?Q?JhjFr0NSJ1XZjcO+VA9FB1B+Lf2IlUfILYcs94wpRVMNSWLv2RPd5QRfMwZl?=
 =?us-ascii?Q?t+9rsqDTF3HZPmmamMd5NlnPqFRRVHfolBqNpgKUjOsYX5nOaEStSDrWkclm?=
 =?us-ascii?Q?2DRQN3//26zMOyej+MHQa+4d+RnYLITXnIvtg4sA3Re8fZUDW+ec74B1JNYv?=
 =?us-ascii?Q?5avhrILUbshQZSDtRtdjCPeuOoXpqupmtT+ag9vxJEdOm+gOryfRobyIdZiY?=
 =?us-ascii?Q?fe9k107ktbIvW81j/ibgI20oLbjWEHyen/UfQbU0twAK5ujAzABPmMpryPA4?=
 =?us-ascii?Q?2K9vnQAGLk8SZoGz5EeGBVTiM4qFjyJqrQCfVA7OxCcx6cjFZKdtPHAfwXhx?=
 =?us-ascii?Q?bZ+FWb5bI69grfryt+UTI54G3dFdrZo+vsHvEjZHa4Hc4Bmg5vtDEUSj7YMx?=
 =?us-ascii?Q?TQ3q8v3CW+pvsirYO9oOaK+JcXaputPEu4qp3vzqKgnJWKaKHpjWvIeF5e5h?=
 =?us-ascii?Q?BWQOlztAjFWJkncjeInRqH4A6/kL2fJJnKevXHcdX7dCDgVkjx1HA0nQy+rL?=
 =?us-ascii?Q?AfCRV13SySzkrVVUChHLu6zJ52GfVqOG1vJ8FwoPdCDCM9wexPUJk96nXwA7?=
 =?us-ascii?Q?gpSPI92aQNakGEr8/GUIAmouOpiOK1AejZSI5FgyR/vZXqB0GGYb8slXn/zw?=
 =?us-ascii?Q?wqGBwlwMUeT86UTjEwhU16ZRn3qSJh5lXzcaqSsgd4zoRb/QSk2JA8Z9BKCc?=
 =?us-ascii?Q?uP4F8I6FpSRVR1As6yHL7qRw764eCHsQRrNUJSqSZn1nH4ylkpZdwLp/miBO?=
 =?us-ascii?Q?Id8DNyOr5OlqWoPqNdCvJulCv4DDaoypMtBusfseBgD+9RlOpgSHxyrm4O2Z?=
 =?us-ascii?Q?IzSHxjXxgTooZrCT5VUV1BRjAwj1/wjswc29+olViEFFjQAgSM2GIizaO6VQ?=
 =?us-ascii?Q?LpOURcxCpaw/ODQ/XKZCXX6iCClnz/yC1OIm63EKCf9kshrRmG0xKhHnSkaT?=
 =?us-ascii?Q?KCaayXMvdLUZoF5dr0GaCBTV1K45vl1fLZiLOH/Hd10kcRFxBL1DaOHAIgzE?=
 =?us-ascii?Q?m3cN0rKJH0JENHqRl7ulykuHCvXMrx+dCsi/PpxsEwhqqjtNgDjKGDJuYeGW?=
 =?us-ascii?Q?Wm1WG1BNTXOBS8T1u1oyt8NsIeE6L0hApRElERzpUkCde56/TrkV/L7BKFFp?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Wi+q+t1IzUbehwMukQTDGeG94+yo1Yp/vBo5vqzPQ6jVp3hfGWU1x6ZwKnj3gFR6TGyjdpHUc9OJESW5LMSwp15bCDcSXWcc90Ejr+b+tTznbQuzvJWSmNQKLCJBFoj6mZB8tRVU19axS2YuaxUJ4nuRuMOVD3XiWaTMaqsUvgf6BErYprGvTwYuNS9OzXsJI/Dq8X+MIV9bqZ5Z8/Q83Pv1hmVnDnrzg3ME7nnz/01eW5gaRPnk0PWiJUwiQtBh+drgB5vrWOHSD7S2VOqgkjolhsBhekZ5hxATPsDYPNZOxDIh9aeqhoM9IrBL8MFWCcFsnKBdKVeyJtWDrxAfljRaIQemyGxRtYh1G07dwSOo1rHDze6ho3iwdNdj+c/eJ+mF8Lws6+wF2qZThb6+80ltb/iqfHDnhYCKth4/LB6UnZW62q9UbK2YDIyzOCfyu74GzZWAwPv3vzRl+//r+fYP4AMxTkFqUtlxkVfc44nNAmOjMSOaZdKJx20evYuiZAcPAb3yYhBko0h8sQY1WoYSccvj4KSEjJlq1Npk/IarN3Gy92xTC84VTufKLcvv0qLnED/zCppZlLMHYsNgW7la9r11MAxBk0aSgO4B38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b39797-e716-4c1a-374f-08de054a4eef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 02:36:24.4589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgFXMnZJZgzEXbwFg0uRJMeda2nBS8eWiH85jdw15K8GDEdV7Bo/Rc7x3VGIQ8HDwV1a+C3loXEMhS42+mA1XgC+fbFPYC3rjIlwxDbArYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=765 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510070020
X-Authority-Analysis: v=2.4 cv=X9hf6WTe c=1 sm=1 tr=0 ts=68e47cb4 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 cc=ntf awl=host:13625
X-Proofpoint-GUID: xmqmJOiPdkJDY-hBIHCH1HRsBysdWdOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDAxMCBTYWx0ZWRfX7hNdVTvC7+d5
 nvea7h4NYfBmgm/kI3rbAXRCU2dAyOkoNvNP4R+5wkpIg8zyW0TYYpcladv9DxxYv+WxRkSEeoo
 FurMutVYjVb5mKoC+Q0DTjeomnB1VkrCpDOJtNY8tr3rArXDWAUn+8vNSs7GeSH9vsog7w49r4J
 XMjVrgxEEXWryK6VM5nz+rt0bCXgV2CZs4opmAu6ATW8VQpmV5mNOEOxjoNtFK0T7PXdBkNcDHZ
 dVAY8oc2PCEI6C/jinuIhT9zeEkIeWuin8SaCmcU0SRx8Jw9pIyTMvvTMwATX8k47pMmc25wMQg
 iP2G6l3p7Fb8w7GEBVjufLtxjd59cx2otiVOPpalM9qtmNa2vOP7rlrizXZHgXhcM/AdQicVHmf
 ZwEozKHNmrfIAcdkEWhjCFiE/3nvcwNZrAtZU90UPYEyjs2fCA0=
X-Proofpoint-ORIG-GUID: xmqmJOiPdkJDY-hBIHCH1HRsBysdWdOn


Jingyi,

> Document the Kaanapali UFS controller and QMP UFS PHY.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

