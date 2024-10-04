Return-Path: <linux-arm-msm+bounces-33073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625898FC27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 04:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1246E285C34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3313FF5;
	Fri,  4 Oct 2024 02:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CREejBwn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gEUMjIdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077EF134D1;
	Fri,  4 Oct 2024 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728007444; cv=fail; b=E3AFGErjvwDTpUq85gVwuiJiKtrj0ptR19Ow5d49p1Y/y3QTcHg858DMimFT5W6GWvxB5kBVx8xeEcjERvKMMb0Lyf4+f7FB4j8w7hHTUNNC3GOjeFdO5jiZfwMGvHoxGE1fqvwOkj5HnYOc8PGzfsOAXWOG9p/h2oYZULXuTKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728007444; c=relaxed/simple;
	bh=o3zt7lQLsgttvFSM3QqKG0mcgVJ1OU91XepBbTz9k5o=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=iT0hY18/IgKXeN8Iebo0v1G3twKSa/1Tdfbh/Sz4LcQ4V3iXynn+PQFjgupEPuG145RLkELFB3cNr45bsjeBEgLNQksCajX7EebRlxRSldZwMFm1fK5+s+6BSkchY0AfPASj32e17Chw2layLhHe9enEtln3bwjfz/IqwRAMbtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CREejBwn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gEUMjIdR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tcDn027157;
	Fri, 4 Oct 2024 02:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=UeyxE4AKEFL9Uf
	rD58v9ob/TRPAVb9W/hr02ouT0PaU=; b=CREejBwnKdWXmPDQTSoxCmOFVYbJWM
	7aN3wapfpfluth1Qkp6TzuGOYikJsff+5JZxzToyOeh7/ebw9Y4YlXDuAwojcq8/
	nWOD99gc9f67zKlxU/fBpPM2BfFlhyKN5bLJQkAFAW7qDNwkF2DjLucj37b5UBR1
	+YwIyXxs3s1uBVPCm/Ki8qqHlBP1HTTcoZ9dM33HSDmobcErsEKGaeUCED2HE095
	jGUUEekZFdmP7BdeqD68pBIHSvs0jq8prg43aCQDOwJHOTBBYrx/u81FDc+0T2IX
	X2B90nDomYjEZf6thVclPHmQNxRbxjc3xhWr6nin4JU3QK/XaNBh7JpA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204grnqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Oct 2024 02:03:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4940EP9N038473;
	Fri, 4 Oct 2024 02:03:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422054p853-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Oct 2024 02:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWwVDcQUZbFkjy4q3U0r5dlfDheHTrgxN4TGWAO9GJ+PQbMftUnTxlkl0sd1hljPtfOotsNYq3qlW97bhyfHUFoaww/i0fRR+YOFY/Zg7YgS2iHhEJNGOF5zTe+leDvLNgD5HrhPqEXankYiMtEwqgYvY5E3MUWfgc40XpCDLx86r7XJdSR1+GprTssrkBdlytomccDWeKNeNFMM2SK1M55gO83RWEeONJZNgyCBwvPOT+VbwjwK4HBlZDzfStEVtFQb2gFJJTvuIerSZcrATKLxvt8h19rlHiifIdK+9+y07nYuJF/OV698MXk9oHWSB+x1rwcadzquZFAt5B3oDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeyxE4AKEFL9UfrD58v9ob/TRPAVb9W/hr02ouT0PaU=;
 b=W14HOigmVGPtbiNB9WgybLqs2ulKZT46t/dFhkJXI5t0TgEdwGo+cdcEHjlplYdpMeZFJ6LB1J4RZrEgy8jzYRi1p8MGppdLS7B+4NpLMPg3lmNfzqB+NCBsAskIOlPkqL1U88t/HmUVqK34x7eZPL0ksZJQWDPHxPe12cvJ0SN827oiiYBtLzXFre/ENxAZhTcJw7SDlDFIbITIEnCfCYYjdoe90yqhv7PeNWyrlxJAYxHvCDFmj7h6GGqR+dsgGK+Xf7BKU+nKd9cCaG+vGgaJmYatD7NQAY8/g4H9/ZhqVp5aDq3kWNN47+Yc8CGPP0GmbiX9oWVEZG4S4TiBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeyxE4AKEFL9UfrD58v9ob/TRPAVb9W/hr02ouT0PaU=;
 b=gEUMjIdRM04mQaCUMeMAfjB9gv7aRe3AE+HPEdtegUy+ZeaL5scoWsiFJTFiUNztsuRYBimxXxEtuc++AmjX5nauWq270ynK02/9BM4prAb0CpnGEorU/1Hk8CYScBlFCiYfOqfRiq2EDMTT2CI67TwTDD/VC8S0eWbSk7VLBZs=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by BL3PR10MB6233.namprd10.prod.outlook.com (2603:10b6:208:38c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 02:03:55 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 02:03:55 +0000
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V3] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240903131546.1141-1-quic_mapa@quicinc.com> (Manish Pandey's
	message of "Tue, 3 Sep 2024 18:45:46 +0530")
Organization: Oracle Corporation
Message-ID: <yq1plog1v5q.fsf@ca-mkp.ca.oracle.com>
References: <20240903131546.1141-1-quic_mapa@quicinc.com>
Date: Thu, 03 Oct 2024 22:03:53 -0400
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0912.namprd03.prod.outlook.com
 (2603:10b6:408:107::17) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|BL3PR10MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: d6054b8e-9fa1-41ca-5dbe-08dce418cd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ym2mGvnfBOqkKLVNvxdttamAkISNWQQutmgIG/WWD6QGvYdnKyTqSYc5XpMP?=
 =?us-ascii?Q?5BiGoQqItn4eZkmnJctWIiZZASTU9qwuC1K9aopq6Ug10HxO+CeYaNX5/jo4?=
 =?us-ascii?Q?ZGXKuWpWwRLyVYvdetfM41zIVyNwDi+K1aLdoWLge9YgSFhml1QKMvBtcKul?=
 =?us-ascii?Q?9SSxK9nCkLBgxvihqiI+RZlhM+yg4Rc8VBrxHGdc8pnauVA5s0b2TWX0iRie?=
 =?us-ascii?Q?zk7Kft/YMdEgbEcwY86ry38KDx88ZMAKBz14qmOI6aCtikY9cuDJXxxiXsf+?=
 =?us-ascii?Q?t76dJsdE5wzkbkcuWMgsYBQI/cTSbjpuv+PJus3Mv7586dJfgo2W9YuoJJZW?=
 =?us-ascii?Q?WCxu9+DVKqMjvKSijB9/agb4kPIxz2m41wZ0mLZKoQAXXG5P5F2nl2g12B52?=
 =?us-ascii?Q?fKF5LhLlO2Sqljv/TCkJA9kZzVNreTu7CstYBtoI/mnbNe+G377KG2565ed3?=
 =?us-ascii?Q?QaKvRbiknGmGJ8jW1UHuq8OmKkOTkeZmcHWPQIpPZJTU8tTYljRrg7JmPtFG?=
 =?us-ascii?Q?ckFHRHl4qqsGRyXQvt8pXl7v5uEXXglQDpnXlAVnGx/9M514gtLOzwlF7ntY?=
 =?us-ascii?Q?XdNNsO/OjdGm4wH4APzQkB7JDb8tws3zNNLbhWSx1bMBDh0oOCTg9yJ/7s4z?=
 =?us-ascii?Q?bpfjiO39P5uiIflIV6k5aacnkwHgGI03WUXRuI+R4OZGEeBRl2Kr/zOrYbVw?=
 =?us-ascii?Q?B2+Xt9UYxnD4MatYWG+h3LM01lb2Rsqw1KyQ1kjrLm8tkWTyTFPGTI15gGKd?=
 =?us-ascii?Q?XOMsqbHmu/nRSX+d8Xyxvi7ipVVCZitnOhgg8QKWYj/cERJnbbheN5aSXFsI?=
 =?us-ascii?Q?HF6vbQLEg0SqQwdjVvUq83MoeXHE24+n2j/CMYHU7kysrmbvdlnw6aGOXlsd?=
 =?us-ascii?Q?3M8Jj4FY5OxOGBAV97tvPvL5okY+XNZLT6ZEAsy9q90G2Up6wRDLzdEeaHkj?=
 =?us-ascii?Q?qZp+Gn/YmGWpZRAshAGEqso3KiO6E+MvklTapkORByz6IxZ/PXZoC2EFtI/R?=
 =?us-ascii?Q?MBKFSvfzfv+NMnIaoUdJ9p8ayFRgSi/lAKRc2ZUADU8Ljev6F/iR35+BLbMV?=
 =?us-ascii?Q?GpP+SfmjV76rIZmG+xloY9TYEwQHIHckVwSHjq3Hd+iR3/Jcxnq6d/7ozToY?=
 =?us-ascii?Q?tekqQyBqIdKFI1j3DFdMRKFY1xXzXkZolsNl3EAACYdN9w3y87HUv8mJlF5H?=
 =?us-ascii?Q?UgWxcq+c2nxefGF2yR36qNkr09x4hUXLoKQ8eCyh61e/VREtSUJrpjh8KXVj?=
 =?us-ascii?Q?Bonih9ZvgCRHqSpjzvFZH2/A6eXQzaRfD0BY0nlvEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BV2MOZVeIvy5Ju3I2q9rQQvKQD+MC5LYoLRvLJJw2n7KJCvQOl9YkdnPoQks?=
 =?us-ascii?Q?pL44AxQmn37uyrhE/kRcILSJ9q18SYinu836eRJkv1wd1/mhbvilU21Mmzo7?=
 =?us-ascii?Q?HD356vJ0ToSpeQ0AeU94DtqO3ZOJmo+OnJAV/2cVG4hqxuvjc4/n7tCayc9u?=
 =?us-ascii?Q?oLnHyBGRXdvRf+frmrl5IWZn88CWmBySPDShRgBqrILyBIcqGpZGOha6c5Gx?=
 =?us-ascii?Q?UtzhQwoIa/KffJAolf279E0+LOW8pEpSieqaPwWFdADjs3qHM8QL81REbdx0?=
 =?us-ascii?Q?uk8d0axaxucOLZmRysuewLtfoxclN58If1bl8Hw5FBtNwlkYPEF66opzWTAx?=
 =?us-ascii?Q?4MVWZWvfjUw4Wht8mlYa+Mjl4tKQKorsOUNaanhfdefdc7ErW6KfXGziEUHN?=
 =?us-ascii?Q?vyA6wZ7YhHUqxcGe6m4MEmTOdrhT/2PZ/gMBJ/SHn+y3lxpR2W1QhYoIAEXm?=
 =?us-ascii?Q?DU7U2N0Q7LkcKwbg+P9cpwjh/7kBYh2WBVJHT4eDaBm1vNlL+ckZE2o6o8ct?=
 =?us-ascii?Q?LwP+x0nbp5pabfskXJLaTX7L/ii8GohQin6MNYbHB+4gDmsmI6DbA5bTqxUD?=
 =?us-ascii?Q?mNgL6ta+XWZbu74wf+b2yhQQqAmv5dzMhzW6dZH0Nf0H44txNxGxH8r1bnNJ?=
 =?us-ascii?Q?k5IBeEmU52Sr2P4RIqE/nUqFUe9HjScT6G5u64CvuCdfNTtCcxdtSd1+joQ/?=
 =?us-ascii?Q?g7NEd6LbepltfFdtkTfwQ9gQf+ace3akazj4T7EXZuI8Qh+KjYXrSYiIQWiP?=
 =?us-ascii?Q?AEuIGebHz17GgxTZoeSW8xsD8v9COcgjU4Z7bcAe+75ERHPkE38U61PEKxsV?=
 =?us-ascii?Q?6h8Dbfs0S05ogSMjzl9EbQj5YkPAhK/OpcfK/1wav4Udl78N4rii+yUpii1g?=
 =?us-ascii?Q?CYy9NI1/A/i9haJWoFqa7G4+KhjUkkpNbtAJhXArO7f0wiGX4mSpOv//EhAG?=
 =?us-ascii?Q?dZarX0svoCGhYHfQHxbdXHXo+Oic4cmxByE3m35lyhvneDyHZo6Ld111y0WH?=
 =?us-ascii?Q?bLKzuVDYd3+tnunF2BAoCYlTimJSIMnKkLY0xOnjUa6jFxiNhyu6MMoQ8QIf?=
 =?us-ascii?Q?kgCfPh1AZK+i/GMoB+LMHF4L7m0eRholb66hv8DiGxA6aeT1kd6bk6AuGMgZ?=
 =?us-ascii?Q?LXjJX6PwsaWsZXj0eGd7O+PcaAqmDfgjW8tmBtHqcrC2JePcFr6/q+spiXpR?=
 =?us-ascii?Q?jS2fDVS0dNCcrG8vB1MMYse4cm9v/XL5Etb46kIXfUDWIRgUayQ+NVwI49Gh?=
 =?us-ascii?Q?YA9wHIl5W+R1Zue69csrDUoq/P4PQDTPMTRCuKEF3he+mT98zv+CnFY1t/gO?=
 =?us-ascii?Q?OYhjD2YvAb6eqELnF2/eWRbe4E0fiFPr9lnlyI7hKDtbFcP5ev352STaNjnv?=
 =?us-ascii?Q?XMbpo57hklH5qLIB7+XMelqlk+j3fRUBaZVSJhfM7jW934s//H0fefwdsYw9?=
 =?us-ascii?Q?a9zqEf4vy7K9tyLFyoUvEwZhlQ1IIoUgZkaTSEAdGskV/WTalJUAwFUJGeb1?=
 =?us-ascii?Q?A3eC5FBhJVzsiaYa1FzOvf4YcqkUxy1os02CpibE/CizoqaozoGxJasnf9rd?=
 =?us-ascii?Q?/zyINXdsI6EfTicQaj5JwAXOMgS0DRTLmFu3HeoUCadHyQjrqaeX1G8Dvzfp?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gMrl26U+R2CNBoFkqRw0CXcRDlC+YisZc+hZEIT7jW8gwf9eJKDr0DwhYG4gVxQeK8aYaZP+x8h/E56av3g0g0VZmgMB3RMNL5/cbhh34IW5gLP/mLuJkEQejtn7YZqcq1SkYi6gyZAEzp0sucXET+o71/DLCojGa0LhoYDnkzZvOPl8KIwozAo8TZfKeUUy2jgg7Fd7iyVDiKJHkLCXTdV/rsH47B5CkzfuPHOqF9DBS7/u6adM+Wx7CA8mfAxPXjaL6m4wIjsoKBKuskD6eP9x3G3urSEy/lKYSX87AxrXX8CsyIJF8uquEq3SjEbjxe8HOWacmf3vcpyS4m/P3xSliPq1Q6ZrxFZpgNTQsUTZRKL0s3HECIZs/yKwJSdFP2lDjdiQNnOxkD9RRGceCOyf+kRjlIqCwpkkPMrMXF4/0F2yGv1yhp9K/W3RfNNHF30fXrhhysOFJzpeXJDhYqsI9nnIq6nMPhv3F26ctujJlKelMDH+oB71ODCshEDsLxFhlukzRqql5oA2vcd2be2PvL9nneX1aMSKqkuw6Acb/Ug5kcIzj4n7Udb+FMhQh/gMJpJxx0Fyn9BejAfGyHD+bZ39R3A5xDTT7gS4Gvo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6054b8e-9fa1-41ca-5dbe-08dce418cd20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 02:03:55.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1py9OVn4CXgYmuiArsVtJZoOnvjZgxbmrS+pmMdi59SsL+E/N4T4RkCx8RmJP0bx0AMe+y3fg0whs87RLzdMwA3zaKbqVsDRJFkysy/rNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_01,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=754 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040013
X-Proofpoint-GUID: uOBRabPHU9nFvhz6j3rEVc3uLvGzAnK9
X-Proofpoint-ORIG-GUID: uOBRabPHU9nFvhz6j3rEVc3uLvGzAnK9


Manish,

> Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
> vendor-specific device quirk table to add UFS device specific quirks
> which are enabled only for specified UFS devices.

Applied to 6.13/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

