Return-Path: <linux-arm-msm+bounces-48790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F191CA3EB21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E151891E83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E1C1D7E37;
	Fri, 21 Feb 2025 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MXk2V9NU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sZfVLel3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027F23A6;
	Fri, 21 Feb 2025 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107661; cv=fail; b=c/ADmbPBpvt7AQpWvXpSn87br8qg6mWudPUZSq67kdaiLq5/INBBYnkDtMX5o/RY2R3HGhjGmC7z1g331eFEWCS3k+a93ArPOUsR300BNmfCAv0NesZY/vfI1Hre4PSaciMH+99lNVOCvdW5g5SgU8/9ie8FGg2FoevfOHdW2sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107661; c=relaxed/simple;
	bh=bVxfA8IEJ6TU/DEKx5KjOtd15imOZvJ6doV/vtfpXCY=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=CwBVujJm9dUrtJw6h63BAIDLDyDjr47e4QLoI86kQhWRM+wBTfT85lifqnYtKAnOX125q8wKxa+weU36+XrZ5VMkw9ZJikySEl1CUSwHwkFELkw9P67IB/zrN9t9hd5PVuXhr5nurfVc1Fpqla7hryAWYa/MLPzhGzwf7jVvzVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MXk2V9NU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sZfVLel3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLrZ00016233;
	Fri, 21 Feb 2025 03:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VXrynxMPLRjIkOKywL
	bq1IYCQmll6GRJgbz98TyBVaU=; b=MXk2V9NUtderl2sgS7duLcp8C5NWf5BbyU
	L5zyd8LUY//7j3pPZYzsBlEsqjXzyZqWDm9JZhaHYO0uvetwwAI/nMJHo39iuuXD
	XrbpFev+AemG4dX0OKTZmxcFXC4rQio1iHC2JccsAOEHN05t0jaMLzYQfhiOwtGD
	HlBFPsfRg58SUI9OU+hptzeJSDaclrqVukxotmCl28xfuCYUy4T8LJcFuZLirm39
	26JwRfANnSSi+vhFpZJl/PYxLQHoGth0UdmZMHkChuQ2gogfvstHwPTFly8bbasC
	dZ+9lTW1t2YL+LHWAHu6dwBa9p1G3jGUj+Y2+ih09bzBE6H3MOyg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w02yngp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 03:13:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51L07d5O026435;
	Fri, 21 Feb 2025 03:13:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0srbat8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 03:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ll+h9KEoMjwkx1oVKUfF1XDtg4B7OCndSkJTLxMwcUhqoL3QgoRwm7bWKB06Z3snqg86MLn4F5fpAgm4a7wS0fadH7Wp7+0naBdw/k8eJQVmZvck6lqhhm1Z2MnDXiYEK5K/M1cr7uG9JlkO860Ecn+QcjNrjt1ZFHYM3WqIZDEMGmS3JR5TQkdIuOyi2c0EUTZZsKwMCEWf5zpBWCn17n77yRQlPVtXTo+L+NB375aIG4CliMwY+Y8e6k9v7kAquXyjy1ejB0ndTj3CzD5jdPn/mssV2aDCL+7bNjxah3Z3mGeWxdNy5rHUaj3IfxPCEdpBHUWpdtrUMQBzSEfw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXrynxMPLRjIkOKywLbq1IYCQmll6GRJgbz98TyBVaU=;
 b=n/aanVVG66NYLPR9ZV53MxKs7czhysyZbq5PA5mmr31tmEg8EqtqMaFOLroMbsAXUoGGuFLeOTwj8n1cCYDrE65U97lLRnDtfzbtGpbbBrwbKTI/n6GkNByObAI5VYech7kZOzhxnKB+/5jcgUh16xGRfKkagme1n7cC53PYaTHJlM3I3CNlW2flIbgVT0R51L8drmUTp+S5KrKf8aFTBRTisOpIcslxVYGMKEVIxQgaXUb7TNKVbW/bGMQV3vyDsWYfGBbigGm128D7rlUljh38LtcR4hfYPm2WeiI0RSCRB4dIGK0gTLr17w2hAytCtRA/pGfxzaLOtwbQJzqPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXrynxMPLRjIkOKywLbq1IYCQmll6GRJgbz98TyBVaU=;
 b=sZfVLel3i7UUHp/eDe8Z/ZTbpGPMtXoaJc5LKA3gtCoJPgZpdTz7XsVuBFOtzMQixwlmnS4yBmBMtNpcgG2E6fcyuytHSLu7ekW842krWekrj8KwBcloncjDoqmX+5TRn/xNMXU5/665neqLOVVcjhK1xUIeZuqrIRv0pw+5M7E=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Fri, 21 Feb 2025 03:13:37 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 03:13:37 +0000
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, peter.wang@mediatek.com,
        quic_rampraka@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com> (Ziqi Chen's
	message of "Thu, 13 Feb 2025 16:00:00 +0800")
Organization: Oracle Corporation
Message-ID: <yq134g8j8h7.fsf@ca-mkp.ca.oracle.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
Date: Thu, 20 Feb 2025 22:13:35 -0500
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: f3060089-a07d-4d59-ffb7-08dd5225bbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+wujBN78q1Ks6PA9r8dPkJ5e/DyUrmN/pz3U/4dEtvpnkiOtRprjY81TKk9?=
 =?us-ascii?Q?i2LI/x0I8foruU6zgjvgenyG1rtBbu2nnehNP6DTJIiCe2xWGeXKHSg1QOYl?=
 =?us-ascii?Q?xliUx7J4Q4v6pA2twfTiL3gDeLtTfGRX6VtNhe590r7m4fwFTQE/WPqEbjRY?=
 =?us-ascii?Q?YRsSCPizh0jiauE8RYHo/67D6ctwqYLrqLOY0yZ6txeIrVaNWRBbOFDjqPmI?=
 =?us-ascii?Q?u3ZK4B+iH3pNv4W8x+LBBxPUgpsfRkolhJ/kHqj+4wHiTxRis4+SrIFGnvy+?=
 =?us-ascii?Q?0FZlG+lNK/Vn5bDOn0zJ6TZad/Mofm/iK8vTZW+z+TdF1T+Y8hhC2bP6fpJt?=
 =?us-ascii?Q?RmlrLONHSNHkZ6UxxS3HKyq/L8WpQFYRxjpXZE3FDQr4VrQyUvQTg52hBu49?=
 =?us-ascii?Q?X7IpTMRECKh3j2QFSyiLh8AU17lvnm3MBnoNwY9IJxmW41VlKR+8gkz/jxSY?=
 =?us-ascii?Q?YAWIWtoOYQrXvZxmxCipKfX6Fyak1mJt0xAriZLJvyT95Y2v06J2lDtkknTB?=
 =?us-ascii?Q?YR11DnoiDfPD7cUiEIBYwidX9+2fOfr7joYxhJQhwOe/KVMIAl0JQ6XhLrBf?=
 =?us-ascii?Q?pYsQkfTyPrMOUN2dIDnFLWv/8Tf4MKfRDrEinEbZiXPkgPcsUVgs7OlDvU8+?=
 =?us-ascii?Q?sihgLSmxUAPbDSoR7gxN8eKxb1DmWR9urjPc5kdzTsVoHI6xF0uGvYp4c311?=
 =?us-ascii?Q?/QUii0mHD/fZI9UKXrwTCSIvF3uzMMc6bAhc23G3LL4oPGZ4PZukU68XABko?=
 =?us-ascii?Q?pWNGHyH2aFAmhSvwI7GM1FbLkDypfR2zqDmaWpr4rq4y4P1KW/MqFH58VQhq?=
 =?us-ascii?Q?c//ThuCuQCnrNeLVeqFVZXhNnEVOPmQFbES3mTWG4Y65/JOKX90cFWF/eNK/?=
 =?us-ascii?Q?adMzMhLF4UqBzd2w5M9el5eOGWmylO1LNJxdAqcnvI6qdsTOxJS4C7IJMzFi?=
 =?us-ascii?Q?+Mgnlm3/bHaFBkMT3r2/qWxPHZAqm+SG8a2Wwz26z/ia9raXJKfehvzsC1cc?=
 =?us-ascii?Q?LtFc5ekf6PXTiFRBbr4yq3kYzIY/vMp9q15KvJDGCUrMBF+JD3FGuuN7JCxP?=
 =?us-ascii?Q?jtGIaaAh72ACGJSPGNDz5gQ9/r8JGF23NZrICU0FjOB/uElcI7Do40N4Y1Wu?=
 =?us-ascii?Q?O0LeG0l0IpT/kFiMTeqNyQwV7WicL+tA+1rx2PQduwd8OhBchbCiiyK2iQCY?=
 =?us-ascii?Q?Xg7d541BxRZ6QOuJylY9lYbKCK8YU7h5vul0QPH7z/ifLXVgcDiYgWKnlnz6?=
 =?us-ascii?Q?iXUMpfg+NGI8ZUPpqYoMOl0I+3FBT8abPXkl+HsUaj8rWFINQdPC4tvdFi1Q?=
 =?us-ascii?Q?58HnBn9Im/2d8hXI/9vgAwJFNk8GWP4DYfoJpIkZKvNdKXg3sFXmMVjk1bRs?=
 =?us-ascii?Q?to2PuFiv5RHeA4Nukshrbu2sZJL2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hxyGagcu8NoHcVMvyoa2stb7BNjwXASzr5XH/9hbtp64m7RJO2zyKqMLwgT1?=
 =?us-ascii?Q?wkHW8LOTpIoNm3U2RSESB93rbiBZgQ5ROuV0RAPmumkEeSlsn3obceap6HfD?=
 =?us-ascii?Q?mIWb5i+H/Yy08UF6iWoHwVDS9y9Smu3SzkWM8zxWKS/HfvXm+KPR5J/xbJ2/?=
 =?us-ascii?Q?kWcg/6qyCeVQgoEiC7K4YQeiZFQqaccv8N7P6Z79jOhJEqQThAB7qAdbL4UW?=
 =?us-ascii?Q?In3bp/Qa3V8PZguOzSFdhHjKkEho+9QOXPff9NCHtpsl2VPciVot1fNwu2Ts?=
 =?us-ascii?Q?OvQFC5g6zv68Qrj6ZugROUOLb8UxNa5DYTbvQru7dklbzVyGXakrAz1JJufq?=
 =?us-ascii?Q?tzHBPaeybTeqqQKZ4PaYtCQ3J297IDfiZm6KRtId+O9rxjl2DSQbzewVNOJA?=
 =?us-ascii?Q?XD3UVELjdKs8gMCPjpghuLDumIQWNSUDqK/xvuTz7hM2+ESzmYqWcyQZCXhy?=
 =?us-ascii?Q?Jr7BxPHHogGaqaenRwB+fqCudKwewZp91GMcD8AN+FKwVAgsMf2vgfFQNpBT?=
 =?us-ascii?Q?TcHB2eKdIPlmy/elETUbLSDxB0adgc013v5sUqZg/VafQ/9TwRbqr9XavIYE?=
 =?us-ascii?Q?6yZlAid9R741I4Wm4aPEFtrk1fmA3/TJQEQbKBebLa++14jlOEEkR0S/a92Y?=
 =?us-ascii?Q?JcjqfC2iJkNJCaDbOlSpKO+7Q0XlUHikYuQkjWD45uy79I5E0y2abH/dI+JB?=
 =?us-ascii?Q?bIe9hRsUcqngAfGFYJ/uDclVcjVAGoB62QGaJzpbD+1Cq6xJAcNBrJaLFSv5?=
 =?us-ascii?Q?yTNbVXzAWgojf/htkJSlBR1hEFRn2hj0dpKWsJ80J4gS32JvhxA+PgEba7wN?=
 =?us-ascii?Q?IVRpacbXIIrskqaxrOce2Zf1p1TDarGDFcrgJqPQ5hUq4Db3gx+NnauxId/x?=
 =?us-ascii?Q?1XgA0iys66SQiEBvxVnhnLNT6DcRESkoSG50YrGfGHagSlmJQXsiTR4swWrp?=
 =?us-ascii?Q?GE94RsVBZcEhAL5gN0xvMu9adMoVgD6ZkVLHG7eK4BWQTo69PLYe4E+M/+Ye?=
 =?us-ascii?Q?qov9GLMn7uB9AnrmDUy2jCaTYWKEr1PqCC8G6JMw9Da4H4Y3V4caX3rQeoGX?=
 =?us-ascii?Q?1BC9Jb9Gr+UbDLp7UXCsCOYMD6O7jkuuHeS98/TPwQ+vPQJtB/BmoV1Pd2ZU?=
 =?us-ascii?Q?dsancSG/iA2AknxBrOESGLWivhHxlsrjue/jeHSZYxPxuAIK+IW3+K2gzph9?=
 =?us-ascii?Q?nzsURrWENlG1I+aN0dv+/kIxDrFg/UTIAV1Uj3Reb9j59CxKV2hxHumuCgti?=
 =?us-ascii?Q?wjSyeNy2lc4RJz4TZHfgkcZT+PXdLdx27T+Sy16z81P09NntD96y6jNTwCai?=
 =?us-ascii?Q?+UuiWs3d8P37YJ6A50QtxO8imIZg44ich6YVXp/jL4IdmIMoGDmubUXgMbLF?=
 =?us-ascii?Q?QsJU2P0r/3NZsoPhoIxydNDiu/PzHMvL1qVSa5d4XI/fKPgzf6OVwwl5MWn3?=
 =?us-ascii?Q?o9N/XHtlqkJem+H84w0NMDmOl7qkQNaMpaydXCAX86iJMNcLcv3fGwc1ealQ?=
 =?us-ascii?Q?jZc0pyyEsuS8vNGgmorStmliaY7v+N45mz4igjs8ngvjaDvAkLGwhzQULZ2M?=
 =?us-ascii?Q?PipwHxf4p5mC6/g3E0tg+aPpvb8qyHfd5vkr5qizr8Z2zsce9Eq9W+ONQmb/?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vTut9P1L3nYFzPL0b9hHNXCMEN9J1osb63wTxTJyM9m/ZnDfwGG7AefG1HP/9H3UXqf9gItZRrEp4LRe3S/QyC7IILr+df1qlqE8uXg233iXktE6n5CW+5/1rSTWioyxp2Y1LVXsVecQ0Ngl2gMt6Kiwb4TScYdO2ZJc1LFWRAgLg+eYtFkNu5AfCgdhxlzd3pdvzFi4+FAVCJYhFl0h4WNuW5jPR1/p4qIpuPgO3vNV0UBDW6ULRMCgR0crvmE7YUsp6xcupCjLgdneETF70tbQ9n+oOVRvGPstFLgLyu9I4x6sA+qSsFlxg4MWBV1uUocJAP2LwpO+NcrQdkg4wkDxKBMR4I6XtUdH1SPuIvdX0l0VIUCf5eqYra24IjcmHDooxoH6kzgBzAxLAPut9S0czRFdl3B5SyA1vmB0tz61mxjQwlQK1nNjL6vJOUOx2/Mxw0zDexHtAr7nVeb3wunXsWfNntBX2tH86bcHKU648NO2+N6FoI/CEGUNZ2aUNrBLH90loEFfvGEKj25GFTrhBYsqPesIHqsTkSE4B38zAr3LZt9FmmRU1eeebyFBGD+p1k7+XbaP70mgJxf4RzkspPhvt9OKLD8eA7BDcIg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3060089-a07d-4d59-ffb7-08dd5225bbb2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 03:13:37.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNhMAeHQvRaoZw9Kfn8iqYHMkP8Pf3lynSTfU6nsvb7wLGIZbNogg2KqDKb6EyWktjZai6JoGNJP4zMbXAOmnGa20NIZUmegmjQia5FgSkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=938 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502210021
X-Proofpoint-ORIG-GUID: sUECtE0M-9zizjZFvvhgY8KzUJI9PjME
X-Proofpoint-GUID: sUECtE0M-9zizjZFvvhgY8KzUJI9PjME


Ziqi,

> With OPP V2 enabled, devfreq can scale clocks amongst multiple
> frequency plans. However, the gear speed is only toggled between min
> and max during clock scaling. Enable multi-level gear scaling by
> mapping clock frequencies to gear speeds, so that when devfreq scales
> clock frequencies we can put the UFS link at the appropraite gear
> speeds accordingly.

Applied to 6.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

