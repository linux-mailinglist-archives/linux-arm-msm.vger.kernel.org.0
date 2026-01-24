Return-Path: <linux-arm-msm+bounces-90397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JNNKf03dGno3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 04:09:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12E7C46F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 04:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22CE1300E726
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 03:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F64255248;
	Sat, 24 Jan 2026 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="no4kKS4D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WGbqb2C/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B4F9D9;
	Sat, 24 Jan 2026 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769224185; cv=fail; b=SiHADXuMg4u5ZkSRGerqZhSE/mx0UaqTvo7YGV93AizbX4PfqwFzqiTJtOnT1CLNbwEMAH4H1VaEljsykg9qzB312oBSuc1lk/Hy3C8ckttH4lEtjbVFP6n1fBEA3L2IPwmwX37BfC1DOUgQm+SC1+mmQaaGoADtEQpOj00Kim4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769224185; c=relaxed/simple;
	bh=kKkTZjve3wIyqmRsNOc4593H4nrR3vBeGxDj5U/UzdA=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=dRU9OmhosXtWDVNoyRGae7jGtseLVur1tYC8dr2IYNEKTtlEYZ0ow4EUJlwho5fkfEDjluObAN78s+qaguRJyzp42mpsxMRuCEUL11eK5YUgw097VDoka9qw3VL9IkBKUzJuVEG+HGZcdrgNQpYEvHyx3og888EGZo4VqIfY2o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=no4kKS4D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WGbqb2C/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O2vW4C436471;
	Sat, 24 Jan 2026 03:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CC52LjJnRCJsvCoj6D
	o/mS4DZJIn56NeOP4nOxhet7c=; b=no4kKS4D/UOFTYqQ3OxgUh2hoUjMOSZj9W
	5+gVYiXHzSjradTrbcaggD+khBGj/0tvzkJ1ucQaqwRsXmaWDSCGIZteOsDgE/8w
	khqlqtMUyU3v3A7AXPWcKwtQx7frH26LiEYq0avP3JPGCR5IYkd3zyAEN1dLOxF+
	BEt1dNs8dWSlT7Mvs43i3JTs7fHLSZFv9rGgMY4KersXK8taaD7bsUq3jFKav/d/
	TljHkRuHfQZVgAkDUU+rnvpdKWEc9BFeem5c3ddTaK8pPIZkyxOjUCXJhqkeEWoW
	fdTMrv8jDkYTOklf9/pi/i/eMJNj9nWzvB/RdQw4kRBXGUE096yw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmgbr1by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 03:09:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60O1Xe8i010430;
	Sat, 24 Jan 2026 03:09:30 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh61qe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 03:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA/SUcObgVVRD9Cg/9ncr8VvGqMkFaKRP9WjJw2jyheRw0zvKCh4V8pKlgfxphrSf4qiTTm4ylu5jBBqlhlfM7zb/6aRS/yC+vb117ezJ35GoE8ogoRf9YQoeGZcBgGNws2yCB2Zxp1abGv5+r8EWt7baE20C1jBWtMc8o1IyPsfKPqvrURG0NC51jGyoplKtG+PPMaUcxHDTXTx+KYWyiBT/ZRZ4KBTzUq2tWCengnGpki5AizBhFWOgiU5UzkZXDro5gIjVbTeC0uLOCGFibphOALPi/uXjwmK0kdYLWvGzV9xia814ZkjhAkTnwiz66IYdKSKdeIwq6EiUpxQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC52LjJnRCJsvCoj6Do/mS4DZJIn56NeOP4nOxhet7c=;
 b=uvmaBebKHPj/etxhpJU2dSGusfse3MwyGsfggodR980rthWD+SY3HTmC2aQy7m+4VRFm6RtKzWNFe5wXNn0xD5ngSnjiKbAClqAcbiLcIQLk/F59sNTnspAzfe6XMSPZWtYqjX3a/mSOMY2LILoQtjN+0YsP0JqO3vpCusSlhZYSQPadwu3QM+1wAEqjtLzndDKIJw6k1a3R1KMskYPwyVPKC6diklJolt/GVLUkUxw0PA8fmm5+IHnCFptGTyNTlqz6xpqKB/RNlYxWUNZbbq12ZTW5xsFJ1EEWLKPHt4cHt4ckuZOpzgYt+JBleqNlPEE0QH+OQwXbCH8DNhZGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CC52LjJnRCJsvCoj6Do/mS4DZJIn56NeOP4nOxhet7c=;
 b=WGbqb2C/XZDx9BCuRxKfuBpb4wfAdSsZn79CRrRt6Do3PAWhSvGyeOBVRCuQbX+1W4pAM8EotaWRR4i4zGlb/UM3JXz6aWrksoJwjgMDHn6IDHn1zPODxwoMAtlIbTzNxiqiTvrhIsVbs/+rR/3ADP1gU4aF4WVqLCw4SmsiG2o=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Sat, 24 Jan
 2026 03:09:25 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 03:09:25 +0000
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/4] ufs: ufs-qcom: Add support firmware managed
 platforms
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com> (Ram Kumar
	Dwivedi's message of "Tue, 13 Jan 2026 13:30:42 +0530")
Organization: Oracle Corporation
Message-ID: <yq1pl6zyaej.fsf@ca-mkp.ca.oracle.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 22:09:23 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0042.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::25) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 599e4afd-0a21-4f4b-bcd2-08de5af5fa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jUhKPm0G9EAcOJJk0fcOARMC71g8rpWISdMc5Wo25yqpXdNaX6oFktLhHSNl?=
 =?us-ascii?Q?oY3d9qFP6LiMDDBaemRFNP5mJZnfMiwaM94tNJBdo5O6iZB7mfsx9SrtUhlF?=
 =?us-ascii?Q?SKdHl1UZEg3rImIu7zq+DCKxlL13TPV9/IpzeNBQjlXJKtVhnA964VPCDkzb?=
 =?us-ascii?Q?ZTHkb+eGuEdjUHRAcG5kjIEeVTP9y5u7cx4B+X/Jhx5qM9veIpFiyD7djN7n?=
 =?us-ascii?Q?NDxbdt8tT42TJ/d3yBlnZvSoAHZY7lpNSZw9mCBLMUOyNF9d7V6Y2fs9jyA+?=
 =?us-ascii?Q?RwhyA+aw6R5jHhEav3qNkCE8/eer8fb5e1GHcLgkfFCBI4BlGg07pxGNYbi6?=
 =?us-ascii?Q?38d2+UvzIwJ8reXwpcBkz7UDfJ2vbaMCwIryte1Qh1Ci86FpJJ2sPxrRnIcW?=
 =?us-ascii?Q?JIauHkMxOl74Sr4rKumUWJcgPmY+YIQKY9sKnMabL0BLFf1+hGZ/xJrn1S6L?=
 =?us-ascii?Q?+m8IAUImKwUnvVELJtsZuTPSSgDq9iYB4w8JhnohIsrza7QICYETe8zZkDLM?=
 =?us-ascii?Q?iHNDMaNN6oYfnyrf9FOBUSxmpTyxwEX6gMeWgkSrjuxO29Xh3NWnwWc0k4OY?=
 =?us-ascii?Q?XnZDt4ho2SMvTxtLfY/hqeDlpUoRT7CpS8Pf+28VqbRL4pujqS4iZf6fa+Fb?=
 =?us-ascii?Q?KlfhuLV8ROLEzt4GAto3ptUmlFNn1aD/6iU9Ul6C0hTCxnVLvojXw91sQ3Yh?=
 =?us-ascii?Q?YD4qYfi8ga4TM1BC2uRmZBg2h/2DvLdbcHtG0c1ufGm/SEhIpAv1rywJof1p?=
 =?us-ascii?Q?CUi3pSR4w0Q8P16l3Qa2XvKqQJ+Ymxk3VvIXsMwK0MJUtz5i50xoFZDMeo7E?=
 =?us-ascii?Q?GVe24tIY6ta0QqO38B8nXJsIZ7oITqWctCSDgheegAvs66HT9T7Ai6A3zv+1?=
 =?us-ascii?Q?KUCuyoApXsZSOCXHfLrH5fJObsCzCP9SU6U+POKYw/pktFuflU25/1kkZ9Nn?=
 =?us-ascii?Q?GyvZQpXvO4LRXBXUVwngUMj8jsXj/0BvoZdOeiOmCQTAnI+nSdJXbQTelyr8?=
 =?us-ascii?Q?avt+uWFqWlyzRZquz082y5Tj0EwMdDwc2PFcu7G9VeAWj7TtIMbcDkMjg1q3?=
 =?us-ascii?Q?85zdnWavMWVPAForN8bjjxN+YfiJVx6RgVwkG94H+ZhgKgGqitq43O/PkAZ4?=
 =?us-ascii?Q?uBpVHA1QD5LwWaZ+SIzxIimpSlxUIEDT3vZPnl+kuVI0ImWP8G8ojkhn5n1D?=
 =?us-ascii?Q?DTUAhaHdpUobIKFfyNSMHGuSSWtjqEYiqfcE7x4RMB/uV98t6TtFnjV3L00O?=
 =?us-ascii?Q?Q+hnmx3E+lqkJ1ifL2P4GOeol+fIJ5zYZD1fjID8YEQ3ixUPV5k3l59KbF3Q?=
 =?us-ascii?Q?U7V5ej87VMumAgttF03TVd5RMx7+qVJVxdcC7ychF893iL4/SMH4Og3ln/II?=
 =?us-ascii?Q?Jsyx0ldmEaWkIhVSgXGWHa3pzGUafN/J4N17cYBBEheCMhjHSw7qJAEKET2t?=
 =?us-ascii?Q?y15E/hqPJRVXZl2enmvSVoxk1wfmqB5VuVBvObEc9Iuj3yxWggtxItPKk71o?=
 =?us-ascii?Q?BAdHU7jKKij9dCd2G6V5uTwoETJixM70KUvYQDdq14mJIhMdp8eHLsmWr4na?=
 =?us-ascii?Q?cJYK50SLjM4HioCjp8g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hqefpkVQjuccKAqbHjITW6n/2zrcxJtBwKl1dXej7nSqjBSenFnaNr8I9RXZ?=
 =?us-ascii?Q?ERTLdTQu7OtfOq1uecYlDYy2LzVQmfRkZ/3AJm4A6WMFqC5oaKhhj1SmORFB?=
 =?us-ascii?Q?J+Tgva4GzwcPtK7GVMceSPX153436XNrWDa7IO7m3kdxCPojVONd+NxWIZ7C?=
 =?us-ascii?Q?9jK90m/yT7B8bMZjV1ZqkL8UVgbvmDHKcYerZXPffhfdBbeVFrol40o2RiYm?=
 =?us-ascii?Q?ycyYIwQIrx36Q0+fzPc0pfM29FhJubhWAvGEoGksHzOiDzgu1pfUywzv4rjJ?=
 =?us-ascii?Q?It8RdIxZ626gFduQaXNzFZePnmzzn2lDYyehi7+eREFG8BAgNbbEVqReCvjq?=
 =?us-ascii?Q?ZiTCIlT0c0r6LC5HD+/2sNxeeE90Z+9807YgD6iMQ6/QE9K+BlGF8xFwn3FT?=
 =?us-ascii?Q?Oymcc61hn4z0/tTQXTRXgoS/IoxGFP9zWoxSUMk7nBUTWkC2V/WcfQPLVkcu?=
 =?us-ascii?Q?5g7HgRfky4+r7FknXV4deSW3H0+z9GXfX9KeI/gq97hXeNF1oCepmkGjXiw8?=
 =?us-ascii?Q?ZIEkJ2MxmvnZZoby4K+sbKC5Ikl/bTeEQpCUK2klpyxe6IxRGUFixggc6dNb?=
 =?us-ascii?Q?J2XoTv78DS4iGMlvW7g7Aze8a/tqPmqHFYoBuamngWcqrwruOeIuxH+rAx0S?=
 =?us-ascii?Q?CWnrkqdJ5V9PK9QXDDrGppNwFrb2vxpYdybmkZK+2q1kvPYiB3+X28avOmNU?=
 =?us-ascii?Q?N/OVXHglgIW0tzu1m+8WJKESLL3ZOP4NBUqTcHyi6OkP9GfirC501erQB0hX?=
 =?us-ascii?Q?JEf1aYLl3ZJnhsVqWL/1Iq5DWjGMvK9uNWTRyrnFMLi5GLgy8gjTRucO4t/e?=
 =?us-ascii?Q?N4e/8WBayLbk/rFzJiCtixVHAxsblJ5txgfn1BR+32qOkSRGCqzjlaCWGw+v?=
 =?us-ascii?Q?N17fM9rY1Z9NMf7Ps3/qaZtcrJ/w5tS6vdSRnK3ZCuSRgiJW7FvNuRIsqw4M?=
 =?us-ascii?Q?c5RwQ9MyTxR1ORSO/yXukgypaHFGwjN50yKZQtDdysPTJ/vf1KfcTHnh+vMN?=
 =?us-ascii?Q?ZoiEQf1l2IsAj9wtY56rhNyJPJuiDoiOgfRpK074q6pWAJosYVvMZmhzRBmh?=
 =?us-ascii?Q?9MM7VGpO5XP6korSBLUMZeUWHI8juKwJ5HbylgS5gfKDQoflTvV7NOzBNiSd?=
 =?us-ascii?Q?lQWSnkVeCNs5uCZtAEI3zAf02WIBx4V/hBIVwMYFeUQ9eQZ92/IYnmE6cU4D?=
 =?us-ascii?Q?h+bA343wIG0LyCPBSv4rFleSHegcj9efbo7qsfRhuv22wPPWpHO+73XoIklL?=
 =?us-ascii?Q?jcXGkNLNgTAcuYIHWzylxrZJa1sxb3JgIq/0GweSg87SQN7035+2ppJyngo6?=
 =?us-ascii?Q?D7OaWJdkqMkDelpjRryBkELHY15nKxWnpRq1nXs1VxruHGxwVFYGoRgPu31J?=
 =?us-ascii?Q?xInzek10px2fgp3bfT4tKD/pKCfBy8/RxCltzmiUPMcQoNUTwYoxgqDS4AHo?=
 =?us-ascii?Q?JLMYkm/E5TIaYow5UIMooEUMg/HGn2DTypkcFiaX0DsiafC+Q9PgeMTMLMB9?=
 =?us-ascii?Q?e3vmETsYd0xKafcoKD3QsZvMLMAmWJJVRYbZaCFiQZp8Z7JLJzKr0scYJaFQ?=
 =?us-ascii?Q?itEWeBscmOjRnLeZ2xPeM+sRckwtlfL/kwkz2iOKGVZY78O3IgPoGsV5zUmL?=
 =?us-ascii?Q?1SiLePJzNuEaEFXmqwt4A674Ic1p9YPvF2LWhF/nxGJ4rD6Js4h8/KvCGNsp?=
 =?us-ascii?Q?wWYIhZA7qIsF2F4iabGLYjWVFDFOnRR3HjSYglw6bpran4O27k1BKy8eX4AY?=
 =?us-ascii?Q?DI+0htoGTMRKd8A5YklsvAv86vQhudA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BPBItVJ6o9Vk6iksI43cox46sXG/i4jRC6Fwn6rmfJCIUlaQaFwaj1zmX7dSRUWg02CE0F2KCv4BdLhfy3uOPwBtl58VdtSSYZdDcR43k+O+l5nOGgyaF+oSqz+K6N80MROSRKCwrS+5umZJs3ztsSm8ZNQvPOKSFEPo5Re37f0hpDjeMKx6+uNEWk3i9fneaEix0c+O8twtikOFbxdf46hDsReIjmPVI1deUTuBqPOqDuWLOaIPu/enaGy3KJ9zUb2Psg/lz9KzbztIOlielq+TJhKQLBBLFtBSoxbo7aeUtus6EoTIM+E/Z4fbHRG7X9NUK3HS3u4JIKsUOxhkFM+R8hhv5zVC7zwnqjcHLOC17f/qpQlT8b2Rt7cQ3B5PXsS13r9M5uBTZtsdreT6hTNNbwmVJR8gsEWBkDKj5HdxqzlDKP0lAhTRVaUqP1rFQ8nEmNE4WIqwV5eUqBifOicq2WOicXlMujsWAXL5vBZECpPqKeQh9wbNbTZcU5xC63YZ3oON6LRdNp/RNIh2T+0rnhv7LwxsD2TKBh9Bj8J0i+aw9Mw1yEE4IQlKIzpv4m8GBI4zuwvgRAeJCRHbubNF5G9UFTS/gnIH7T0MHes=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599e4afd-0a21-4f4b-bcd2-08de5af5fa8e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 03:09:25.1491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9RJ879p/wJ1/59cEp/THle8dyGG8gpgs0ghwo/u0z9J4JCHHgGI+1f6CJgRzPOX0NaEfLGV02RhyVKLA4sgqJUczm0O21XUeF+dcjmKxO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601240023
X-Proofpoint-ORIG-GUID: Vy4Z729Wo3wQVLKpoN9EwpfuH1eIqwB9
X-Proofpoint-GUID: Vy4Z729Wo3wQVLKpoN9EwpfuH1eIqwB9
X-Authority-Analysis: v=2.4 cv=AqfjHe9P c=1 sm=1 tr=0 ts=697437eb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=4UmxapGgOvRovlyjj6YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAyMyBTYWx0ZWRfX0wZo3zof9N6F
 l0SCCfMyXW463eF/OJegX117nGOaLhyDV/lozovA+0B9HEbCEO0F7zevkfwLKwBumFJpHavwDni
 k+KHNPtsHlG2uEJMUxIsqjAJ/wuNrBDc2cJ/LXwqAJW+RCM6+VbxWw4h5qybY+6db4DSmn2esqv
 10/AejYibxNH/5+ljobHdJrLCBtK0pEfVsmTxCyBnTdHfZ+fSk/Dl82n8CJlsSVXrAdKPw2LPOk
 fKshUY9210QAS6tDjfrHMVMdU1p1xzLjJ0R4lglwfBMahKsb2TqNPj74AVG4c8C1uOU6+EWXPXz
 y8xWYUd2FV3R/ElcG6uBie3isHdfawyL8qLDzdDJpdwxWkS2GlWhL/SgcRWPRKRUmEMJubPCKfH
 mOwpfSITBsDxRgT1O2fFGw8MEd7b0C8hW67q4GEE5sHbFOvf5QGnoA7OL+N7zhzhWB4XBqS7XUl
 8Qi1IO+7rqzWvW+90Mw==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90397-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ca-mkp.ca.oracle.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0F12E7C46F
X-Rspamd-Action: no action


Ram,

> On Qualcomm automotive SoC SA8255P, platform resource like clocks,
> interconnect, resets, regulators and PHY are configured remotely by
> firmware.
>
> Logical power domain is used to abstract these resources in firmware
> and SCMI power protocol is used to request resource operations by
> using runtime PM framework APIs such as pm_runtime_get/put_sync to
> invoke power_on/_off calls from kernel respectively.

Applied to 6.20/scsi-staging, thanks!

-- 
Martin K. Petersen

