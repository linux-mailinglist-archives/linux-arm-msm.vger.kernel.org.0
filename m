Return-Path: <linux-arm-msm+bounces-64898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FAB04D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 03:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3661C1A66C57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E40B126F0A;
	Tue, 15 Jul 2025 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rJ4SMI8m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TdVjle3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03033F6;
	Tue, 15 Jul 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752541529; cv=fail; b=BOsZ4Ll0MsjetGInSZ9Ar4HzFkIvVpiQ+NR0OyzpsKJ+js5ecrQdn+0bIx57K1NMiq0gN1gnVQu4X5yPBPisyhFcvhIAo7Y9vI3E0tX6PfBIlA/MV5T+2nMTm7OF4RjI2cR67WTw84o0bqNDSneqYlfliXBxtfuI0+3Df1xbi0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752541529; c=relaxed/simple;
	bh=HPcITuvixhKuLAVy/t1th0uUqQxLh/9bgmr0YT4wMUU=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=bMwpFVjLOHDdaanT5sv9sEUTcw10kCPgpkYS8h1yLwgA3NfqrWrlj6afS2+0L6iMf1AeG8c9W0N9t6jdAFF0s/bzxVpurgUlu++9HEz7bRx8HndrmuFmOi/dpDjDyWA+1mor7SpzINmlaqIrZ7sXnLZ+6clfD51w47JYwnPFMM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rJ4SMI8m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TdVjle3y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ELa9vp032763;
	Tue, 15 Jul 2025 01:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3OnY7t1OlQIfwUziyY
	avfy+wrNrzVUzhbI7gHnhrSxI=; b=rJ4SMI8m3Qqb4zsALqdS9WeQUSQV9ZpLcg
	Vv0t/XkDBiBVJl2Kc+VYCcI7SxGfnk/Px/CRfnW5IOzhkQvsxXLGwbMLKVi+Q3bq
	VF0vLzehEgqTYTKUFNOCl94sEXL3KG449wwgL2QhP/BaBo0DtN2s49Ntm73/8VR8
	Qjpm2DdOZcGI/otR86SdweafoJ121zRX1q8+5LAX3KTKKe7zf0kDW4uA1MOzfYlU
	l8u4kQjL45TSW+ZhR8tntF90poAUqLJS0ASEfwuV0q7cZU5vFVGghZsQuJ2IDj4a
	6Fi3vqBCA9AybcLchJNxsnxoRy6uuIM/qver8C4fCtMGVpL2qrYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx7wrex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 01:05:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F04TFn029558;
	Tue, 15 Jul 2025 01:05:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59937x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 01:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb01Sssiq5VVAk9vIsILDH2353xaM7ExsqFbILYUkf6gAs1oF+JtWj4UTg24TBOg2lXCey3wSJHfWfovXhtgHtAc4aAJtHB49lPjXXD5n0cShWGwtX6jTfq5VNoEPAKy7Pt7ZiQWDDLAgIlhLXBOkqTGb3ozsfz8GJOcoT2zmFafQWqF87t4UmbIW9+9CdAMx+/BWWnTbDE1oQ3J3DUV7+cH+ONQdHZyBPanhAbVKMHwgTXoAwEizoQvbVOlOnSKzAnYYhbk8dpO7Ufty340ezY3HNERzSI6/18kHsen2bMLpOlQI43nOW/+W3cEhh8kDysbYSt+N4mDM1+e4I0OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OnY7t1OlQIfwUziyYavfy+wrNrzVUzhbI7gHnhrSxI=;
 b=bOj9iJ8rURpCjrvq4qEDH6xJ2BehWwKyXbjl26HXC9UONqRVKuNlQuWzyIEUNePy08eBdFqOMWDUA+Vkh7J8CXvTdbfHqF5qno4GnXyXu5s+JldwUthoz/Jh/z02ljHgaHouOuDsldUIkh/Ph/VjCvs3WDMTz5MzBpG40sjj4MR/2Z04W49w5BdcRfdx4kzHf+Iilju5/GhAb/F/o4yth/AiyPoIlXaeaR23IketDnpkCF8832ccqnIapbD7adV8bZIa9bupAIA9CfOoNZdPSILTalpVuMylBcLTowaVUXAlzuGVi1qsBnzC/amdXA3QS3ZdfPqF9q2kdGraVbqrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OnY7t1OlQIfwUziyYavfy+wrNrzVUzhbI7gHnhrSxI=;
 b=TdVjle3yBBKWg2yWWhQMqHilTIvKLknw+VDqRMSgGRO8P4KOFPRekihOjFEZGQHgOIzjcusJscFUdNo6U7kn7Nwe+GvLgXsVDqeH84BrFnSqpOT5CLorutoa6xb+ck5MFx/VMiJah9yW7RjsswbkKpuw1ePu5mgiXwErirL9j0E=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SJ5PPF6998A7572.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 01:05:07 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 01:05:06 +0000
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 0/3] ufs: ufs-qcom: Align programming sequence as per
 HW spec
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250714075336.2133-1-quic_nitirawa@quicinc.com> (Nitin Rawat's
	message of "Mon, 14 Jul 2025 13:23:33 +0530")
Organization: Oracle Corporation
Message-ID: <yq14ive6z7q.fsf@ca-mkp.ca.oracle.com>
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
Date: Mon, 14 Jul 2025 21:05:03 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0117.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::34) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SJ5PPF6998A7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc92363-ebb4-410b-2920-08ddc33ba2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VW4ZqH9wEhOdJc2d2N4ni/EueyyWdyM1ZxFINcEjswY7lyNxL3eRrzlFL8IG?=
 =?us-ascii?Q?ZTGv6oeMBSqLLwaeo4MQpvK8sPPmJzt+I6wk/1RBWhi5hvw7vEv4v54+A3wA?=
 =?us-ascii?Q?6ER7J5kpAg9IrlbqEYyjC6yEbQg+OJ6TlvMVW41NJdd15p/FNQR6eN4HXnfi?=
 =?us-ascii?Q?SDQx5Kxm6dXxw/xgjtCYZr3uWWGlytiAQIkRY4k5QKpVdrjkH7dW6A13lisC?=
 =?us-ascii?Q?ozHhqBEfF4uUgw80Gt4GlzdNl/5dsaZK6VodZI0Xzo60v9sEUwGqninj94Kt?=
 =?us-ascii?Q?5+qhukmztHPi2lFGOBSUEXharaId6iYMQdrEbIuO1zxIOr2Dith7S5DeufTx?=
 =?us-ascii?Q?xV3qeWkxhDWTm+IeA2MCoPvBoCiaXoA7RI6ewe48OFUDFK3ejDScs9PfziCm?=
 =?us-ascii?Q?EZhXoRAeRUM5fZNTtQXkuI/gwrp3M5Imck7AUMUVApnuMcCo+sapLleTVlA2?=
 =?us-ascii?Q?dDipE41BNvfR98bQWPwPA2OSHUOHLBdfwAlyTQoU4QQXEexBoRLzxcFIbkSe?=
 =?us-ascii?Q?9K9FroRysbgoutucus7clmBCQmwwc99AHu2CwDUpIyrGAiyIt3RHFNxmQ0XB?=
 =?us-ascii?Q?2ctMShUvQ9CQCKYC5vBCbjlQ4jCmfbFbzEtnifhDuVS2DW11F8WPrFIJCfi6?=
 =?us-ascii?Q?udjMAXE4AWflCgeLi/aVYfG50TKbyOZFPxp/YC6zeBKDyWTszEof1Kg1wx2a?=
 =?us-ascii?Q?gcjuhExNDa9bYlVn9w7ICMbCnCp//TOCqlkHXGQ/bweeR+/KpHw59DFwN5At?=
 =?us-ascii?Q?edekHEK41S40ty7u2YXl82PvGlzgmACSGRWFDYZtmBkWmbe39wwB1hLeOEmc?=
 =?us-ascii?Q?NufMTq22XJn9w/0dvTN5XK0BifDf7p59EPl8glG8C4JH3m0nMX4ylnqtgN66?=
 =?us-ascii?Q?YLCH7jcB3hQ21jdmHX70AxG1e2dAPbiPAxGJBVqOLI1TRK9qccuDD+MWcyNl?=
 =?us-ascii?Q?if2U06/fM1jfxNNDv6aIYRw3P97uKmDDb7LbMI+F7hIQD/KJvVemQM9auAc/?=
 =?us-ascii?Q?kr//sqFVMT51yxaKxTRsH9zd+09WdwXPLDcFGqjYC3Ta9t+D4YLyDSSa70LP?=
 =?us-ascii?Q?e96/Xc3W41OzFIX5wDi0el9v6qL6DmhrrczbQTtBo1c5N1hrAIY0GZyn3jIg?=
 =?us-ascii?Q?AikdE0d+ZtEG25qFIRueSD2c/u7MyzsIkv3A5t1zFdQ8qgnvu87Nlogd0rRD?=
 =?us-ascii?Q?ED56tHDXiZ+Jf09vZkcbl97wz7e9Cs9Wuzhy6iIDvicsqqVcVXmarNmmZV9i?=
 =?us-ascii?Q?9zOjFQLbmafuyvRFS6CZUzJ0h7Dq6fl0jFCaZ9YHx90eMeBSf50BMSuR+4z2?=
 =?us-ascii?Q?4fkxQG/u4sW2wh7KKti9J4k7WeH7qFcxgiVR5WaIK7DwrKk11H7Z1ZfxkEQW?=
 =?us-ascii?Q?+xofyWE5ShVuY5IXm1FDrSANJGG3PFf7kUw7fo7t32lz6I3OL7U77M6esg6p?=
 =?us-ascii?Q?1Uw6EVOdFG4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+ZDbal7bQY74lIFwtpIkAR0X3DGP0+emvSEuFz6yZybT1slGcJAzWVGigYi?=
 =?us-ascii?Q?s8cWpMZnDCIJ9Fsd0jU38KLn8URKX3t4PPyLQpMOPO6/iVCtT/Ri1CcQM9Iz?=
 =?us-ascii?Q?1fAQZQsD2rmkzzDivxW5/WueOHXTakrguekYJgWfO+DCh9zqdIutropoy1h/?=
 =?us-ascii?Q?i9i9ZnGe4efFdeZAuzBM2FIfusl9dD73yIlhOBAajb/Pq7DIP53SKlvRj6hK?=
 =?us-ascii?Q?WukBhAoMUgpeAWeUeyifm6Bo6pfMAqqU5zcZ8/5RT6OEb1fVyIbAfAgpwMJu?=
 =?us-ascii?Q?KQyfVb6kRwwhq73rP4v5s2eI710WV3Wn0VcWXUlKVIJf85waBKjXwzqOXmvF?=
 =?us-ascii?Q?EWoam0gsKL/1LEAOBxZNNRUpnPF2FVnwfvb6ERFtcAk98rFstHHO4XL5yvBX?=
 =?us-ascii?Q?CRdJMJvyprwj02FZJGVkBcC0wNMdoEWSyEHouFnOZ8sExhXbAVv8nEwemiCh?=
 =?us-ascii?Q?tvbEPs51Mh5Tldwjrl8+l1Eh86nTRypM6fy1Oz4NtwTPvF1TP2gDlGkaDdsl?=
 =?us-ascii?Q?6+C5Cx4HhXiX5GJtzymH8wVE6MsnQye1NZkbJH9Trr5ECkweQ6Br7Oj4/itK?=
 =?us-ascii?Q?Oc+CohTgex3Awp8qNLow2mPMZwwyNcVDZ1a5V09xJY3EhYhM38K3eqJMTYiK?=
 =?us-ascii?Q?CSXGpoXh1Q1mURZM7Cumjm549eyOgGspwT/LkIdKLzfR7ZkTTkVFuVx+SAXM?=
 =?us-ascii?Q?Pyjh086m+TFXJAl6AsqcrLEb0ajGDcFZorG8q/DPkEvu/SvD4XZHh2LFxxGH?=
 =?us-ascii?Q?8XZ8qDJ5VDnjhsA46oT8dR3ldKVUYtXnCMNbV0jzaE6P1AsGLSF4PNKHKd/x?=
 =?us-ascii?Q?W1piwjbaqTJVPwoUvMLmP4Ae2OCxB7dFXWka+pmbubwt211OeCcBzsVWue8O?=
 =?us-ascii?Q?qoXpUIvCmuAHuQi8Xjdrew+eLfR/9BbIyH088qDh2B8yNTXb9r1fArbYrpTw?=
 =?us-ascii?Q?mCpSZBEPHeToOQpLnpwFKEerY7VrhptJqPBaNhtqezWAgYs/YllYlr6IkyAN?=
 =?us-ascii?Q?67mKykg0Y0kpeQWpE6jXgS1yw68QdpC/IrsKQqJvd+CNifyBm55Rb+FmLRAO?=
 =?us-ascii?Q?hzl1cH39YteLsGPM9Ac5tNtkSJyjt/D+v3zsDmllCdCIzI6ib1IigmFt5OS/?=
 =?us-ascii?Q?PHO9MCo+nmFwj9w5DhDli8GOxUIoNzgA1qaAeW4TFy82lJQfUztKG+KIM+Du?=
 =?us-ascii?Q?YDVDH840SgBVDTcyjZ+fa1Vtc2C7XGZMTfocaWwaQvQoSK13f0dz4keCRgFi?=
 =?us-ascii?Q?R8jBzLTy1KPkeYSSlY2Cz4Wwn8lTd1LbiyL9DZud5YXMBS3IL28UjqIaU/Sf?=
 =?us-ascii?Q?dtqRHUVOTED7gfJ06ejYSnoCONFYjpU+yu9yVG4heg7zGblsueKkkr3QRy6H?=
 =?us-ascii?Q?d/D1uYK3V7swuVfQjjKxUXw1kKx4SJG8ITw8ksQFxqlw9lKEGVA3raJCKQTK?=
 =?us-ascii?Q?nbcC96TwU4llGL0+ysv3dLT825q+2cjBem0uSjuLf3N71hEDDcgEFZH+XFE2?=
 =?us-ascii?Q?bECDmxdthXZFZb4Htoyviz2PKAIguxi8UnXG3iHyIjXCYwl2zDdN4LpXLSu5?=
 =?us-ascii?Q?DQc2hCprcaPfKzLbF4FpG3nTKvONYFYRd3vSubGBYIKTREj9inckJpFNrb5x?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aJIFAF8NrisMSzHAMoAYyvaCYoHhTBXKu0QcfluXgQ1jcVAunhn7HLs9ixzSrrgS2vvB89fcZteGJ5PkiBNx4ttBIEIkGTrIMHJmA8yjvPru1RsieDIzz8hn/SAUmrtWKU7Rmqb2R7aRmukKLaQJ5U53/52FLUQFPYz07eB6btKu+FJjj/t5iTvtz4/226/9k/+brwDelaliwaGXYJz8qrYWiWECe6dPvvwTHKyr/GX6Ph+hfgZqpvo9WOi+HPOvCYn5lmhee5foEjIa7xWXL0Oxew3wCCiuMkzLhigayP34Kn3PAtGIhd+5WcRUmOX5kJLCEcuol4NyML3uEuHnNK/489RjLHOedrUzFtbw6ttlxgy7KzKRwOgesr4I36o6PFTmAECDGEl3FJW6jX83POCwKi5nynGYItgkBm9kGSlS7XHdZNYwF0amELzO6RFd2f65sDUleYHMRu8ZvnzSE9797yycUGmhy95xp/6fDkj3lQMz5ecYIfA5TSfJh5Yqt754rp0fQXJfz/UkaxjR0KIoU+bg3SIOk9Cfg+FKee1P2OIGuumAjIdBiiGxfXxKQlnNDUIZlg/cbTLuCgMXPkiIQuJBRC25dQjYeI4J1dE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc92363-ebb4-410b-2920-08ddc33ba2eb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 01:05:06.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JWpZsOu0yl9zA6iAMqpgvkB192oKfHU/C24pST/xTblmfU4O7WmlHO58+3xETJIq7DEpDGrlsx2JvZ2zex5NCwMW6Cg81FosTvH+Zagcfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6998A7572
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=495
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507150007
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=6875a94c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=cewXuGIsSzsw8c2jRYwA:9
X-Proofpoint-ORIG-GUID: OCqjiD-JwYQd7n8JvjiWp5ekJleDAomy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwNyBTYWx0ZWRfX24co6hMdQUwU //7A7Y9wCijDFIKtU4pHf1uQKWaH9e/mWRyCzcVqVbQGIuRqjXJ3GQ5u6Qs7A9ZcM2RgimJK5Ba ib7FNuZ0HGT/9cAe+UoptIgBEB3ox6WD2+eC4Oq+rw2jz+zH1R05vuFB26iJAjW2FKG9ouONz1S
 JMliV1zih6kY91LfWIL/67SWvI7ITQii3sI2wl3dmRHk72fEKOP8uunRa5HvvzKdsFqI+6+b3f/ jvVnLC4T4Dr2aKkihbOb4xH94lY6WkuKz7G/5DNtDg1pKxZr7VkhQ/iTboJ6kELiE8QIQwm8x+H 04oYzF9/HQPeh3/YQcG0I8fSX1L2Je8hd6V1qi02O067LNJdBfySj0XgXtp7AYrR39PSFiS0LG1
 3M7Jz2pbAtSYXTZicSG02zfWluqUoI+dH2jKtsFqjne72qi3HhdJN38sowgE7DvIxX2oZUx4
X-Proofpoint-GUID: OCqjiD-JwYQd7n8JvjiWp5ekJleDAomy


Nitin,

> This patch series adds programming support for Qualcomm UFS to align
> with Hardware Specification.

Applied to 6.17/scsi-staging, thanks!

-- 
Martin K. Petersen

