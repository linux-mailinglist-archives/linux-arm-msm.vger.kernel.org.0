Return-Path: <linux-arm-msm+bounces-59641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB10AC5EF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 03:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B9254A1C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 01:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC71ADC69;
	Wed, 28 May 2025 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ks+R2uwf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z98uRRlP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27E10942;
	Wed, 28 May 2025 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397552; cv=fail; b=UXFFR2pW3JVAwv122w/gbS3mac1twbEz1aPgNu/u2tEfcHrZO7DCechZIf7bzPOViBxTZ81S1zZJUYj24QFGZfeXl5IMQqb4xHQ7c7Vmy+/gqsoTNCe1JyJkw/KaWk0yrp0F9X5K1UbXyjGJkiTKSfR6ByUHgvgI3PVoVj5aXao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397552; c=relaxed/simple;
	bh=jLvBmAGzVCtTe1dV0DRNLhbx0Oj6tlek3YCRCIzkhDM=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=ouLsPMjhF6Ro/Hge6jWMDNg4h3WbhB/nSFt+3nvgjep7OrwvoSUnGyvJ43S8UiVOQhPlGah50qDPngBNqZbtcUw9ZkbmIWBszdJ3yQ+1dPYLwY9Quf6uV3FiOyQcNu9RAoUxjpYvVjLKfmM9ND3jtpah8aHzHtGkmeyXK/Bwrs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ks+R2uwf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z98uRRlP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1gC42002321;
	Wed, 28 May 2025 01:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RCpG9v3AKn2gDNQUOo
	10tjbK27fshEubnYMWrVm7g3k=; b=Ks+R2uwfWNhD1OQ/6WLPZQz+yj+6wEtlsY
	wCpOJso1RZDZTs06kAh3wBAYnrdmqjWYV8vOpIMPE03q/c6RjNkKiL7lloVkPiJJ
	zEM195XJzzeh4lH+0v+ayy+tYiEs5p8xS30yrqhxLI4ct6mlUkb0y1z6ZfEz9sCg
	LlkaGeMexZAf+b46jz2GKTuMDiNOpHnrGgmi/5U4MBaKAxWpAUV5pQ/sSxlJDdsM
	vb5D89cDw0TsDeXC5q5Oeuxks2Q0MhXJuTZg4u+LSPIPKTw/DMb16LsCso/rUKwZ
	cKSrC5/kxrQ1IkJGGXRK7ZKJYhRinSAKSmLaej/3jh8cjaKC2Epw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0ykvxr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 01:58:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RNFBRa021275;
	Wed, 28 May 2025 01:58:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jgam08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 01:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTLyujeibM/6h4DN9ciLb83tmU0sX82/7hgwV30GqEH/hZrFEWEafOvGbgThxs+UKm2Vb6qH5JpvWoVOB4ZInincsZkVHgd9hJPZo+h+xpFV/TeCxQhccBg3ra09krwdkdL1Cs5hSFrhFQQjmlOJ5C4tzINVoaVFh7jdJv34/yAMI/TtVMB0X/UW4B1esPyE+PBkdnSLqxKizN2GgEnWVjCM0siRrkmV58Zrq8Cxdo4I8AQqXrqxbtKrCteJsxorVBTxBPcjXPRKkqU1zECMFty0Ojcg7FpSP3XZAoJD/+mcVzaKd/b6XFHJ59t3d+f3zER1pjoeullLzjuNl2Iu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCpG9v3AKn2gDNQUOo10tjbK27fshEubnYMWrVm7g3k=;
 b=q08q/jZXSkPB4iHrsDmtItPNzwyFFvvmwFqimKoNkp/x9WofRFP/vzzgQbRg/NlJwtXqA+nFBJW6UYFV8O4ETOEtkEsmJp5uLS0Tt4Vzg32i3p2R9iTiOlmU61wYTeNPwKI4UTDxcGr7e+Atqib0EC+4g92im9+rCz4DHPB9FGC0Yq+S+90/mvV1llkhIpiV+LLinki0ARgXYF3mXkMF8aVyFvTF+wK4vgkNunCIgi+oBjTUawwwJGduJp8blEV/JCtmYHuBvWpzi7XvYVTtPvyBElwe1QqN935rLQJXIgNKczrdolu2PTKMfGEbR7zK9D7gT2UK0K6euvEE3y9lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCpG9v3AKn2gDNQUOo10tjbK27fshEubnYMWrVm7g3k=;
 b=Z98uRRlPdIQPj7HWjuGALCbX+P8SrRQqTP5Ix+w/D4Nhov8WnaGpKFrs8l7JKwHWwRNQnCb6SQOs49TJY3qyqwl1065E+FYgt7sc8AzxNIEEdBHGoraW8fAZIzada416p6kZAPqmrNxHRw2AUZQ8UxNig5AXF1QqfQ6DOQhmWNs=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO1PR10MB4530.namprd10.prod.outlook.com (2603:10b6:303:90::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.34; Wed, 28 May
 2025 01:58:28 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 01:58:27 +0000
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com,
        konrad.dybcio@oss.qualcomm.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org (open
 list)
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250522081233.2358565-1-quic_ziqichen@quicinc.com> (Ziqi Chen's
	message of "Thu, 22 May 2025 16:12:28 +0800")
Organization: Oracle Corporation
Message-ID: <yq1ldqhijig.fsf@ca-mkp.ca.oracle.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
Date: Tue, 27 May 2025 21:58:25 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO1PR10MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 150c3ff3-30e9-4a18-fd5e-08dd9d8b236a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JBcDR3OZdH2eJKcGubkuFwRFJK9NE0cycTJjZQAy+pntKYfWSeneu5oAlKSj?=
 =?us-ascii?Q?ZsbxBJNIhymlp72FZ8OeFfBR6TKkrTDPIQNTGMVGMYorb9l8OLRSRXPNij2n?=
 =?us-ascii?Q?E2YhpUzotEf/IzMlDCH6mhRCND1rDRV80zZQ/fyw5DGXYa+rL3NIqJQ1q9wb?=
 =?us-ascii?Q?3HUEvp3EZX74RaxTKrZLm8ZSEUh7c7NyBZItsaEW3s9GymWafTs/Zhxl59rZ?=
 =?us-ascii?Q?4a8ZxmFS4oIt6sbp5qcTgo6p0z0pOfwJY3OAVr5GZ7RRGdf/ACqw80zwOISi?=
 =?us-ascii?Q?IC1WdaQXus1LRkQwfbOZppwq/4ZNLWkjWytZxX0rsvac0zojTeSwNCol4VHc?=
 =?us-ascii?Q?X5WuetipMG81H3U3kn4Y0jp1tY69KVdXwAjDnT9LrtzbD35BnwYIcPhHzuJn?=
 =?us-ascii?Q?yHDt9gsKcRKP1Te1WuuDuZ6hEk+T0SBTtTle7rwd7KXOZTYNLG3x/6Drg16b?=
 =?us-ascii?Q?5pcjY9vdh6Qbq3Qqt8JKePBJMenddp/4zEt0K3mnroHA9uvzK9IjS5ryuo0d?=
 =?us-ascii?Q?yuTOM1GTmQQT5/FzDjePgYH/G9nM64TPqC1f5LGfgQVnsQURgPaH+zwrAOiI?=
 =?us-ascii?Q?0CaCNde4q+XzKT5SiqdDVvu4GyS56vEE24Few5F7FJSBe/5TNxY3tQvmbMNS?=
 =?us-ascii?Q?ZAB47EnaIXTgvhrM5KnHUKqyM/73I0XPtihwtfrQT4ZF2uLDkSPxDbzJH57h?=
 =?us-ascii?Q?6l9aZ5FY8DQV5F0Amdug34r8/iMd8DVHZWek3P9C3BIyjGS9sUYUcq6+7FaA?=
 =?us-ascii?Q?768AreD2/UXCnq+6b4E9g3mUxst46r1qo2OB28eUN4r1FjvXEYdIh9PIX8m0?=
 =?us-ascii?Q?4T88FftJb0Lp7mrnf/DG7uEdkX8fEtjVLQjGllkOS9RYpD7ozsdTinJodyte?=
 =?us-ascii?Q?MPdaZKww9MDLgQGqB7enZc9uFldkRnJu9n2mZobXV0bAdA0gx8rQmI4WzQpk?=
 =?us-ascii?Q?r0UOC7G9LJrCkcBrojAYhDkrrJWCSyuBChPiYYUab7g/57Gmt+zm11TUtV11?=
 =?us-ascii?Q?r4VK9MT4lbr+LY9jhTZYQEs2Z1AN8lGdpIssaO6PP9DZ4jqq4hNv2EUA2FJ2?=
 =?us-ascii?Q?W8mbA4kVhrL0lXYCCO71FD/aaDXGxJycN9oThs+37eGwjbSOvaZEM+ST+lKt?=
 =?us-ascii?Q?qQVCUbRC51fC80LFUQPg8zEjSQThFiWfn6q7x6zsqBC4GjUZzaTW1QKQkgZZ?=
 =?us-ascii?Q?Xi0RuupTZ4rJ+f2z8GNQBu4MD8AMWAL6W/8cHqGoAVOn/oJ3kYwBqPvQpa7r?=
 =?us-ascii?Q?3E9VKtt1Gs9HwXtjFyVAOVQAIo4bhllFYLE/Qn19nPw8Jc8fD90Cd0qR5qeq?=
 =?us-ascii?Q?MVlgQbY6gaYDkmpTKmA6lfz/t4IvFv52zGUa5f04wBIt2QcA6btIGEFdkJxT?=
 =?us-ascii?Q?jhEnjYVpMk1a19D1ZvQeh6jBY5bLBZGFTglJeFVipkE9VBXC6c4TpCWHvOaL?=
 =?us-ascii?Q?FJM3w6sqcy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YMjzl7y+7hoyGLWE4G30hYUh3Lz1+yECEmqsbrB8sUGteM+17EnHzPIgoPre?=
 =?us-ascii?Q?tAYtB7bAx4H+WNLKEhX5rAOBCde+tHQFI0zVjubHgUhiipPWZptUHBF+a01z?=
 =?us-ascii?Q?c389yY5ssvdlliFyNj9iIqsBdpA6oX4j/vCRwzsMCfIv2bEdb800VdNP0Jye?=
 =?us-ascii?Q?NAxkZo05vbC8QjV5bDpU2UhhlKfaRC1s0wNgbV6785NYStfn1ZI/+XkQUgX6?=
 =?us-ascii?Q?R+W+me4JTS19eg9l6zcnk8I5msBSsV4djFvkTGVT3qwzWSJSEUe0OV0D1TXD?=
 =?us-ascii?Q?jzeJnfXcQX9wcR5M4zMcZDb30oe9EcREFxUHiSiXb2Yzt/4K0vj29A0Ui/HG?=
 =?us-ascii?Q?6c0qDcmykITyLpfux0QNwfqId35i41comnX7fjXAKMRyiGT+YASU65cunEE5?=
 =?us-ascii?Q?ucYTR0CHhaAtM4Dt5+Z5VAvRitlNs2MXXO7zSi1vw1kpN/v+FUFMT/fj67kF?=
 =?us-ascii?Q?THwqwTxu7594PTWR4xEexHZywK9NnS2kX2nnoACE0si+d9rL+ww+hDH0TVZ3?=
 =?us-ascii?Q?zkVeikHHuXCOOeIxYfp/xYbtaFQ/dpjsQZy+4/WbByyxdLkOVDZ/4eSZ5Yxz?=
 =?us-ascii?Q?dOnIqqRqXUmVdrZ4gfq6c/ICKUvaSPWPFxZpC9aOVOe2+7voGWGRP2f8+ALC?=
 =?us-ascii?Q?cO3jORLKrBfHlH7dsIykSGeTVEC69UADYyQh/Q8LV+yGEulWRSEXwSY4HvMT?=
 =?us-ascii?Q?rwMxY1CobRFl4DdY9va2z6/eLaAemR1Z44p3YJH1jlGHcnNrd7rfx1Cq6l0D?=
 =?us-ascii?Q?ogv6+YXsfA4rMW4BZaYPjkfgCAR0nr+T2ABYbYMztzW4s3pAokt5k9N/3/GM?=
 =?us-ascii?Q?QmLfWW3dTLYAIBW2t4//UH2sIzd2rYNd6PPryVrgMxSQ2JVcnmQkCSw2DVFd?=
 =?us-ascii?Q?QXPnBS1WfI45Jo68qvzyusCAFSMuyjXp/bZtEZ+1DRZAqWX0jtlX+lfGz6tW?=
 =?us-ascii?Q?B3QdfbgMnnoi/jHSirZgVdvy43Y2t2TCyyojI6vbRsvi7DoHJrJd4adh6cy1?=
 =?us-ascii?Q?v+JajJY/HT21zIr39lV3IpUNaS6bDMRybwjEY4a1FI5vJjuA9fW2kqUbh3An?=
 =?us-ascii?Q?UMiPs3PxQ7NqoaBtHmZYini0DUncAwvRT3FWEy8v7tbhCNfmL2jIMmpM22iB?=
 =?us-ascii?Q?bypsjEDvZc0Bgb6oBqAG6a4SOswYow6An5FPFOtZ/R1DtwPSeH3kkNkprk0w?=
 =?us-ascii?Q?HzVKzcgHGeDKjVltunFQMm79X4vh8kjFAAo7ZQ5SbN2KAV3gTTnNCjJOr6sW?=
 =?us-ascii?Q?LPpBOYHyQI+3fg50Mbkmhrp4Nn55L2VxO5YaWyVX9v+7aYuxpLTBQ5dOtRhV?=
 =?us-ascii?Q?Hw4tdNdMVumHeabzO4XIrtT3L1v3Lv5TjJOe1ciRq96KUykRkv5mcb2RDhAc?=
 =?us-ascii?Q?xdBcarcaFJcRdS44ir0jIO0xcrZyk2dMZBfqqLk3hH5xdP3eBXCJvjf27wL2?=
 =?us-ascii?Q?mzREN4rZfYROMEoqkK5VXrqBIf86Z9Yc0eKQ6y3K6WztybwQ5TSqs8qABvqi?=
 =?us-ascii?Q?b5Ar6ZmbcpP7Wvk8Plzl93y9hofeubhsv6yPE0OlZt/XFzGixt1zDMh5PqN2?=
 =?us-ascii?Q?SC9c51a7OJuYcSq4n8zgxgBYJ2yMnac5iflOiFshLxVkt7MiYZzELnlTslVi?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sfjBi9HB4FwkTAF/zVUEVlMU6IHJzXsiioC/LaqoerodRRVDh76GZ8CJP6OvXm8r+L+MIHcWs7YMx/se0M/gR1tWzK/Wv/Q7Ak8zuaYG6AK29du/ZK9MnmFZCFqLf0yWwfznlSfhwh37ODm/95AiI/UU8dF41rQf7WAAUAvk2BVjQy4Iz6Qg5TNeJa6rYFB61PWcebCOWT8ac9aALemJpENqrng8EDimMfQHVUmMNc49kiLODaRbOfEj9hWwuZY1V+rnlrksv55bN/p1P39/eOYjZYSuqC1cHUfAwznR+O3UGuYwTpjYoEfrK6f4yzAMRdHQkDtvRAMm0GTLPI2XbRG3VppAIEoR32BkzM2DdtloR5XZEenzVJU/Amvcn/QxmmYLeIBQMz7iSTs83t1vARcPUqwht6rmJW8T+DjMKhIBCog1lTo0o7f7YOLUlMZfhQDrH5TqVhGaWpnDOsTaHbNJV5ibJwRjIUy+fd/hx8uV47aO+Mn2PDu5vyEO0bHfskMOfSOHpHhHc7jRWBEM65hGQDZSh/2tEXpgGuJJtWhWlwQ7UYvMoxIXDtTPheqD2rSjgsjT8me6UbnmxMC3tlDFaWnMkgquNg9uO0M5t2U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150c3ff3-30e9-4a18-fd5e-08dd9d8b236a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 01:58:27.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPWX0QKn+mFS6e3XWp5txmoTW1NvvqHauBXQAPgT+5dikn1sFFqLzae8bqmgI9H8FpDZdaKSaSO26yP4NgWW6mAvMNEZ7B1GSTafvGtg60A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4530
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280016
X-Proofpoint-GUID: HNRaVJW0-QUMDibXcSnhN20V1n68Zh2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAxNiBTYWx0ZWRfXy0vGiOyqIw/I ZO1JMGmR9Tgm96bcICCUSxt5/Aa4DsUKE2Oq0gxmqmoiDS8o2FoNWLm+D6DUU/oENDarkUL2YhN AQix7vOlEvmxUiPoO3V94dUU9ZUzkorvjg9gJ9c3Ys++ukTAQA21pGcHKeRLaXsO8Qs2Vc88pYW
 ZhQNQVj2TjCkRaaUcgdWSrv4yYmVNQZPpHPjX6L09IoZcqTcpvWIIJN2T8IcpnY6ObQXBqCtAEs zoqkj6tVJkFQhgsQtVK5ITSwG2kPls4v5zi0A4fphf6ZbQoQk5nZe/NUaTTlU3fNd2sFx7DX78P AC+FgLMuR3P4TJ0CedHJj+SWO2+AaGhCX7lmnFb/whi730Qoi+jrmNyfsFO9I4V+jgq+EzkpPLe
 tPXCIcqURWXPBuKuEpvROWqzweMFA8moT9irffRbcGMuEmxmTypMCCeYIHBCQhQ+5ZEZPi7U
X-Proofpoint-ORIG-GUID: HNRaVJW0-QUMDibXcSnhN20V1n68Zh2M
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=68366dcc b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=rPkxEvNIbvuxDDlJIxwA:9 cc=ntf awl=host:13207


Ziqi,

> When preparing for UFS clock scaling, the UFS driver will quiesce all
> sdevs queues in the UFS SCSI host tagset list and then unquiesce them
> when UFS clock scaling unpreparing. If the UFS SCSI host async scan is
> in progress at this time, some LUs may be added to the tagset list
> between UFS clkscale prepare and unprepare. This can cause two issues:

Applied to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

