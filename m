Return-Path: <linux-arm-msm+bounces-59642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CCAC5F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 04:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A163F3A3DD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 02:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0D918EB0;
	Wed, 28 May 2025 02:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qAjafs5V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GCpGHfzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F632382;
	Wed, 28 May 2025 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748398544; cv=fail; b=iXMHUQx8tv8W//btC9LzZVjnnbiL7O4Tr1Oi7z4bA9i7Y5emxLhBE6duNHZ/m0IViijANOR1TyB36Ewu2bw9vI2C9w1qoa+ra1H5I+61ChU3QgqxoSJFo3gy7l3bBlKD/aGVEXTr+ly1qkCpeKmJmeOHLrpyioYwBba+RLmNvv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748398544; c=relaxed/simple;
	bh=lCdXgV0IRtwQ/U+OTBgHAc02YMlTaGA7EzX+N9zvFOc=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=bNU0TUKckXF5+hDteMlKZPkNB94+fGbAbcCZbE4yBwbNiFMwhyKUS1WQ3vhBMeJNhcDqzocpPkhXp9rlywUituCg2Bt/DUoSwOxyyi7IoKwTVam/TDxqesYJLGs9O3Q/9/JhwutLByJy71SU39Qj8/Bt5B9jJg4Q68VXjFaQfQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qAjafs5V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GCpGHfzI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1fuQs022756;
	Wed, 28 May 2025 02:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y48q0JFRyFJF8Y+Giy
	J68DaKJ5LYHATy3AjgGI5nokY=; b=qAjafs5VEy0KhXKXLSDf4yRD5PgZpgACgX
	d49yYfKjTf721yn1AnIp5Db20YDXO6fZZlMHEIbxYwUjFBvdNUrxNWEN+QYLihYy
	7AdSisjZRQYXVMY/ncBbhPaez7ItqclKFpglIKSVd2t89btg0HsxTKe4OaOKBJQx
	2gKdtKM3QdF4B1fML/H1SeaNhKPhcRcxKHAIBET+ACwh7Qn+YSZ7Di/msCJAi74q
	I0MoC+SbTWyQCszCPyFOmmATOikA00dbcgcz0/rlk5jlGxShCijSH8201VRycTp3
	cn1zaZ1b1zN3U0QJShILuo4WvCpu149vYdtiyhKNLt0l4cDp60yA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0g2d06j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:15:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1VgAd024624;
	Wed, 28 May 2025 02:15:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4ja2w7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9K612CJuBqD+eTD5iBl20BAAA+S8kZuqplSn7Dd84jSXeckP/EfVRCtZmaBE2B/kSNMNbIVFGv9w/UHytO8dnqNSIwq/OuoQJWmmW41Ycpj5v+vOV/AXpNIKVRUHg5R0cwqZSAHDcjKKcVWWUHmbRUtAmGVzKvdbNgnCHqAVtyGuLbJGeoYqDBJXUq5jTNHpBwDLm6h9eQhKV9x/h6bqkDC1z2dfSZ7XBFGcAjsNDjSEedBvhglwRkSXI4isBUubHe7kh5QtgAT2weX53ciS2A+sycvkpuNSrzf1eMlTZ1hbjE37evwJjEw7AvMcinK+/vvLGa6UIv4QK2v/FyRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y48q0JFRyFJF8Y+GiyJ68DaKJ5LYHATy3AjgGI5nokY=;
 b=cpnKNpa0XqxyCMWJJfOuJoNE791K1XqrCPeJ/oCcoN5t1uA2Kz5KUE75oP6SJYGHMrKlSmin3+q2qiaqDI1t4tSLKjdnuj4QTOWT5k1LlSlf9lbmuNAP7Jj3Sy5eoQEQuNF5UDYNbeH02oGDxAEPGRcWH3D0KKOTyCc8NZRFyXRKElXIKTD7lf7cwZvpMWcpMk9qArZZe5R2PJhx0kmVw69sDb/RSvFZIdZaNNw3+p6gD3ChiG407hJlNKK5UDtIRN4bmEoQ1K59Eu1PYlx8j+gq84onegIKyEKxNHBd9VFMlWwtK3WQiaT/WiJrB2Kxy4RjxSVW4xy4FWchMidc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y48q0JFRyFJF8Y+GiyJ68DaKJ5LYHATy3AjgGI5nokY=;
 b=GCpGHfzIXnZJ99g+5KKcMoCOkXbQ86t4/soDICwKEFnsYR1XPdZdlX/0uqDvUQDedRJu1h5sOyHZEMli9yae+mjce0ngZOMxO1FuM9rlmyuHSfGMowSCG0D0SUr2EC7jhKm/gsEmIEd0EZSgWIpTueS+nN3q8XHtT3JdEIDtFAM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7610.namprd10.prod.outlook.com (2603:10b6:610:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 28 May
 2025 02:15:17 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 02:15:15 +0000
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V6 00/10] Refactor ufs phy powerup sequence
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com> (Nitin Rawat's
	message of "Mon, 26 May 2025 21:08:11 +0530")
Organization: Oracle Corporation
Message-ID: <yq1a56xiir9.fsf@ca-mkp.ca.oracle.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
Date: Tue, 27 May 2025 22:15:14 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:208:2be::21) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 4664a40a-649c-4c42-e2bb-08dd9d8d7c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EwQs5IQDCT7JU0GyPgBg8551KVFuBO6184KE77VulAqdo7daR0aIp9MnLTH3?=
 =?us-ascii?Q?7+CHX8OsjQ5C45bz2mLQlFebI7v7/ud/dC+zrrdRj1w+cVI9bDPOACykPpMP?=
 =?us-ascii?Q?2Bakn+vkrHBT7EsoitTIqaJnpJL0ltOvT7xuLUektOBbNLq6L1gMYMYk1yJM?=
 =?us-ascii?Q?YIg79m6X0OMicWt8Sj7bpT2AwL1WpvAEjOvffj30jN3Nay6EnPbOT03hvAEZ?=
 =?us-ascii?Q?vcjZojh5pGe4GP8luUWO9WvfEbu5AqKEK5sei157sZ6dCCXaWvqlYOvGIs4X?=
 =?us-ascii?Q?gxeiFUYtiwzOaSPzlYhNtv9FG3uOQxA9NXkL4h69e1YtRJy1lz+ff1rYrC2a?=
 =?us-ascii?Q?Rn/cmX0F5y+DX2QBZuogmt5SzdxcgH44doedasuhU///Q51mflAXretFwfz3?=
 =?us-ascii?Q?eD3dT5EVTlXCdOE7wcu4MXV7UhiAzv2hFBWFykmlShP3+dMMz0q7TKJQzFN0?=
 =?us-ascii?Q?yhPmwFRb9jnaeXWTubFPPKvJzmCVVpVFMQSxHjPV9ONNhHRzJnLqJncZCDg7?=
 =?us-ascii?Q?Vm1M5LdAMbweA5lA8qsJdn9Z2vEe2i/tNYiiNuWSwehGJTw8adltFYO1vEho?=
 =?us-ascii?Q?0AiiMCDKEA7sqBndiB3/3PVd8VoJgibv1PhxQqm2zZTtjl5FQ/tc0R6bhvwT?=
 =?us-ascii?Q?b/AfJgZnDFdOZ81AQ7bEspE5MHvqfUCbFmxsWIhMSo7GM24KUy8FfvGTv24E?=
 =?us-ascii?Q?wNBEd34aTB74GFWA6F4nwEJjzRZWeZfliyvfphYUxJjOKm1BOKPUvgFyhdq4?=
 =?us-ascii?Q?0QD0qHSQg+ca2452kqF9rQKDVpRKyw9RuxE6OkHCVoXdJ3FRtznMdZovu30t?=
 =?us-ascii?Q?oE1eKzssQpiT6Kbiav4X7a366uhKI2SpIHkb6OJYkMS+vxzfFZoEcf3rPBFd?=
 =?us-ascii?Q?/TPnh0Hghg5gMQBBTkDV1cb/Vdy37hIXsGrRBWAtfPe49THcsVFHPJlktIz8?=
 =?us-ascii?Q?p8Pw/AcvRkFuKe8wKn/MbcBcBZqDYUYcpW/aZdx8HjfJiEVvUk/aAWaXLqRo?=
 =?us-ascii?Q?eDlPBHNp9RGJclre84/8y2dNx3FIzb6trfr4i+D+C7lIKBsgB4JveLDjO+dV?=
 =?us-ascii?Q?BkI0sU3fn6pllU6RqEU+6OVwCY0gUPXbf9GoeCLss7xULR+40oO2An0ZGCKE?=
 =?us-ascii?Q?U9NeTrIsuNBzu/DhfzjGG6D3Spiq+fGpFWpp6KwtbO3PKiwrrzpHq29kWjc9?=
 =?us-ascii?Q?hMTy9+OfY1SmjDhILUmCFNYKw6E6bqMSm255ct4x6X+h7vCKM8kkWILCJKha?=
 =?us-ascii?Q?GObGeV5dlPJSqM2uxyOTbA7gZEb6ZVzRVrxmwKkIlOk8dL1mvPY6Gbq6iVAK?=
 =?us-ascii?Q?6uI7J7x+Efk5ngQUSJGaZvz03kOzPefXrnZhThLwFgtkxEOmFmGOosu8c5y1?=
 =?us-ascii?Q?MlsXVJf4eqr3jz7Txz1dms5VFgHeZ6Q+xsNe3TM+0cTl59AW2qiRw/4RRQkg?=
 =?us-ascii?Q?xOKYvBcLY7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bZygTZr9qFtB0ha1FKMBylm29lQ9hQctoXNUDFM9KlpyrV9rJNPnYvxme/Ow?=
 =?us-ascii?Q?BZJGhJL2ZPHhUMPegNxmvA8pybx9byq2/ts3L1RD3C/NltvDJ++aEqtGwIL4?=
 =?us-ascii?Q?rQ0DHUXriOLbE8ZMouq9a/od2KZ0riQmo/ATk8qQqA9ZtOaXy3ZGGpErNsat?=
 =?us-ascii?Q?sWAnlGsu5Ra4tUbq5T/2eCaZJUQENogc8zqOkvIbue0121otQrP+X181vDmV?=
 =?us-ascii?Q?+QaZ4HM5xxMjmu+T3Jsd5BIXnSwh1vlBzm1dmFH6xIsHVoFsbsPR2hiv5Z+z?=
 =?us-ascii?Q?NFjAIQWXwZ9cUflA0Uw8UoRMZVrIR425UJqdvYZfQPO3se9ov+eC0sbwxGzN?=
 =?us-ascii?Q?+13Fupjwyh1Hrto6mrYHIRli3N7/5/rExaS4Cuy2LQiTRFmvJoZMSx2Ybipe?=
 =?us-ascii?Q?k14AbtAd/SLxr1IuEq6j842XpuL7AP+5S1AJNCy2Q9Pt8PwexWNz7b3K3W4L?=
 =?us-ascii?Q?bLRj86tK4I3UMvJ0qAtZ2krZyOVqbsBKsrmYB3PgaNm4bExorQlCBo/Esskd?=
 =?us-ascii?Q?hGkskprRoSB2pK9ikbX07iG01J7nJoF3AUdQgXSV+4almPyJnyEAxmjPv8Ny?=
 =?us-ascii?Q?yR322XhzO+3QHBwj+R73PU1pi7nM8DvJN1uq0DHSISMyOmRN5x5pfN4ExbvQ?=
 =?us-ascii?Q?vBFQnH/s6TNFt8uj8IS0QubY/vgs3NzQKSMQkMB7WsOmBD1WX2yQ1z4XWoaM?=
 =?us-ascii?Q?26VgeGtT5BzQ1WXQIgj6z7Dlq1umJTrAUhWvfVQnJfSN3zVtr3O0Uh8KEjHL?=
 =?us-ascii?Q?QBY/ByAlbnpeU6xTCH+S83myJXz23JmttvSDd6hZ7ZddY7uRWHlAXv6BLjPh?=
 =?us-ascii?Q?mFeURBkkZWntutyFgPSNdSpD1REOmHhwZO33PKab/PLEBS6a+JpweSaAyGMw?=
 =?us-ascii?Q?IHE1H7pL//umz2XCHI2yq6B7rsC5vkYWvhqr0dgFi0F/rI0Rc34k+f5JTAkv?=
 =?us-ascii?Q?CmQCvtVmKJU79NU4QjAbNUiBTlXCKyotJWTf5sH+6GUEynpBLAizu/nY5GES?=
 =?us-ascii?Q?5Bc6jvVjUwgPexvs+RBtq94kr0LJDuSC0330LuuRA3eqSUjhHYcHyvouqNm0?=
 =?us-ascii?Q?Wxpvi68dgtuZPTZLSQWemU3qWNqayi5zk+4MXC0WGwVvtDr6ZPrDgJ2lyJGz?=
 =?us-ascii?Q?5At/kYA8oYbHVjOIT/LYjBiDyWYHeV5rftLLt+Vp70AMQKCRtv2CjFvFMgcH?=
 =?us-ascii?Q?b8ynCtss5Yw+YKeFfOo+xgi//48bg14QyrxCVBl0jERp+K7OQlEO8iHdVugh?=
 =?us-ascii?Q?Z2I2VcdDXOkpbvg24wUU8PGFULvZ+ruA5MUH3lb0sDnT82K1/l1lPto/z2Yy?=
 =?us-ascii?Q?l5q6SkEMrNJ7zVNMm2l3if7Q0bnql9/UBErntufSRqXrTphahAt2jpGISiHd?=
 =?us-ascii?Q?7SkZzTOZ9rvc0g0/joccVrd1U5XVGK4FRXD13MhtCGlDj7wiNMnu2PPmbwk3?=
 =?us-ascii?Q?TlaC8giMSwOF2tl7eOn9ObW/o0pkJ4T/E+F6YfNdTDqOTaFJZ1CCdv1+1RVf?=
 =?us-ascii?Q?941bBr4nNhSLC2S00ORUr8GmxuHSHtRDyDOLoipCgf2wkx1yt+I8/ywjgBpV?=
 =?us-ascii?Q?uSkRJyJd+Jzu1AZAMS365+EegyT/KT+KFzOFWzDDHd/yqO/RimH8hDSKS+bY?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7/Xu7c68xoMy4w4IvgJJsDI1I+CbaI2csjdlvplwknHo09WeJPmjuKvR5rPtM7trtJWtbHr+jLr84s6Ca2H5wrMiiUpT1HuPaKO7ysdTgCymPODC3MYv99G0K4ELOkC0iR61GudjWpL73elMNPzM2MMvLWEwBdd3zxT5ZKu/SNbweKTzf6JNRAfPmI5ULQbzh6z6/cOhLppp1cNr6LeA19iscbQa5kz0ArKd5bUb1G0IuGGc6asdo8LM9TWIBR3QgwVk4eaOTD/5HVXSgiYPs77fs+ZGzPjISYvGJOSAbqSE07kZ+6rRpxwR8YOlbsqFeZke3fyeMvb6hWPiCHO3C8BDZvYyfYJelu8T7LxzHqWsMgRHG1Z/QXRxYtS5if/uZr/vi6HBkq/5LdVLO6iOme1ztEgOm7EIdVLOFhre0kxKVHcPuKbbhbS1/tZXpHnSQNmg6BAimrgHk5T4iJpQSjj8RLY1OJJY9088XDPnmFC/nTrA8AzvB6Mj+09E29AabdAM3Z3vENw/+cSvgkrKLwq4Y2hXiMdQcCkDsHXvOoI8lOiojAEHnnZbROF4vAiNlsgfhBKeHUDRbCAQwKUdDervHsqbmuZuFCEYCo4KefQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4664a40a-649c-4c42-e2bb-08dd9d8d7c31
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:15:15.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rSk3/9dDzxcaj3kIHsDlvAiurQq98PlrHpEzZ179izqr4NIpfRWu2DWfjYUWMEYbkoYahxpGKLs64/bMvWMzlW8wZyf73Sv6lNlNQz6y9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7610
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280018
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAxOSBTYWx0ZWRfX1MgyO/LVLDkl HFG9H5vf5E7oW4ZwIa1/WGqic3dioZ7+oyhbWOx7XUn9zK8zm0g4Rg/ensPxe8cF5CevX4lLxQl ElJhbp7PuCLVjfBlbhEtoAeup3eu85Y7ZJ9zY+6fnvhzgHNc4ujFiAI/bgfuykpy/cuwX9EA5ce
 7FyTEEuriuLya12gGZRQA6Dv1P6VN8Qbo6XFJahKsCs0u66nkRm0A2vNJRfKzSlUl171H1G4+et 8CO5winiJUXBHtY0+YvHcRdOMi2FUvoe55gWAjtArCGGqD5OYJB8qTQ53vavpsLzprPUaZYFHu3 sr/Ox6b3aTGvPc5XJsxSfvhlXEZEenBiTXdwOJnytDfMxEn3OkJxN+eAGfwEKt3vqzzBmzI6Iev
 mrK0Ko7SaBipbQuoh/MWHa4IkPlVOXoPwG3PkwU6CC5B+ASRU7KCNXGCOVURbCnPIaVJ6m9i
X-Authority-Analysis: v=2.4 cv=NJLV+16g c=1 sm=1 tr=0 ts=683671b7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=_JRBnDy2IwGp1LpB7sMA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: 8yAdkMAPWLLk3He-GjLsnmlUWYhIYeUk
X-Proofpoint-GUID: 8yAdkMAPWLLk3He-GjLsnmlUWYhIYeUk


Nitin,

>       Patch 1 is a fix for existing issues, which doesn't have any
>       dependencies on any other changes.

Applied patch 1 to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

