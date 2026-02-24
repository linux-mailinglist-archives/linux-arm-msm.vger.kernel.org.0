Return-Path: <linux-arm-msm+bounces-94012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFBtAO75nWnHSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 20:20:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4D18BEC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 20:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F3D43043079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6263ACA5B;
	Tue, 24 Feb 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BtzHx8kj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RueKA476"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21523B61E;
	Tue, 24 Feb 2026 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771960808; cv=fail; b=ucXfoRJreMRWE0PqdQ7hZRmOooges8P7ycSJIPbbfPultvrQyP1b1XmHBZeAprjg4FYvcLoB5ckvPdXZpf2qLQ1mXjeA6kge1aYWz97g/Dc+WF/rHrjFjn3LKPovZxSBhhVxdB0S2VBigtJq3A9gM94ySppOiESSxYVmB1QH5xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771960808; c=relaxed/simple;
	bh=2YaqDh7mJyzNXRcq3YwkPS9qNF1r90RGSEtkYX3Vycc=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=pKPG9HYnAwMXdc2H2fBEsnXo3IDXMrM2P7k6WwFgI2V++iKN9fSfmL1LXTDDhXyFx4/eBi2ZForzb0RbQIFx6Cj7PhgaC5Agph4WvFXS+iGKBzOYhWa82zSSE3qPvdxLFk/yysuYNZehme1toppaX7CnEgHxyYdWfkADnn07Nso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BtzHx8kj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RueKA476; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OItvpR3927984;
	Tue, 24 Feb 2026 19:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MBC1hrvCvQSZOsRQYU
	b+ZUftiQ/r7cNag3EOfsCDAoM=; b=BtzHx8kjlAL9PmnqOCXtKjmPomIO1jVAi3
	drnDp6g07QJrxVgX9IHdIgN4D4UjUjbYb6liz2BC3JiYdanXdP+92+yLHgqDu3lQ
	ho4KImSQtXenLLd4BJye5xY4bviGZ8HLZlCrJIuOQwQ8X/RBTnRONUs4aZY5d2+y
	2cDguxgAJQ56CmkdjE0dl1mzysJlqWvo0pygJsjKdFtEgua0zr3mZINbNbUyKOEk
	jaeiIRaIgvIO8KURwZtCEYScx2u2zEmQygd3C9HvxEGNXtZKVbaHJNczWgoRbi3U
	AIKesA3wyra8q+SMeEAq2+6hpOihKhhiVn+lDLiQpyMmLnRzSyiw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf58qcu8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 19:19:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61OHYrSm028708;
	Tue, 24 Feb 2026 19:19:43 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35a3y8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 19:19:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ba6+CGGkgzekqCArrC3Tw+kMfPMgKWkBOAqHdvYlx3kCNrVNNVDd4kB3LJws2ZJV7Y3KSZJH4am1LmkYczq9eVMGLjS7lBB0n9zyNAJxYpCJnMxEccXaeGEPpRY8ICXNX1Dvh7gBJzn48aWdORIsGc1hZt4uEB8szwIdafHnW/w0/1Q+jivgL+If+yEbAwuVK98N1daBCl6PWkXeLhIt+QcZSMmKkT2BFecB+k84Ai26HYF0WunJJgfJDrHvKTZ0QZpg44gtfRILz2by/0hdh/vG7otKui7cO/rLRZ5SoS9ZQ5w1NuT1gxllQWpZzoMAxiA1MZjQsPbGc1JqaDoHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBC1hrvCvQSZOsRQYUb+ZUftiQ/r7cNag3EOfsCDAoM=;
 b=THiGKZ6cxh+9AuXIkDDS3GTyKqIZUuSiezYHgwWA9rzViDS8vmUpprxtY1/PIYGMZeeSt5+yiZwzSWH4a76FwgGMmnvIFXW/MZbjLUzoWtpR2ns6Og1rssJgmCPTczC+8qj4JxawQFYYJWW1NWfrqI4h+dh9sHe5Nuq0i6bQPHwWzkii89AMKfdAgDeuAWIB1mmawND2l5K1sPQqWTyW5tYyDdrvsojpAE+JmEx6UvK/vk/6whBKSv/OHpAE2Eno6pLXt62MqjYG43cfjw3Qe1b1y7emPfHQOGR/fZzTm19ZsDeU4FOTWBVoVZ2Z5hL3Rr+KeFiP88axplqldeWDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBC1hrvCvQSZOsRQYUb+ZUftiQ/r7cNag3EOfsCDAoM=;
 b=RueKA476f1vfRmhtQ/HI1WvgkCRRuCyr/vrD2Y7LXTkuXeajIQ9RxlIAWwDijVJ2dCXO1Kb5oozKCSntV6mpIxjFOOOEV/cyMmczXDGgOmF70g2t63jjwSwuT+xzou+9jA+AUpr4Wm7fiXg4ZawdW+/Pvd5zJI8QQzBR/X6vi9M=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 CH3PR10MB6836.namprd10.prod.outlook.com (2603:10b6:610:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:19:38 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:19:38 +0000
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Herbert Xu"
 <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        "Alim Akhtar"
 <alim.akhtar@samsung.com>,
        "Avri Altman" <avri.altman@wdc.com>,
        "Bart
 Van Assche" <bvanassche@acm.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        "Konrad Dybcio"
 <konradybcio@kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com> (Luca Weiss's message
	of "Fri, 13 Feb 2026 15:08:51 +0100")
Organization: Oracle Corporation
Message-ID: <yq14in67xwd.fsf@ca-mkp.ca.oracle.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
	<20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
	<DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
Date: Tue, 24 Feb 2026 14:19:36 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::22) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|CH3PR10MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b99396-2a76-4910-bf17-08de73d9a74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NyTfxaz9VJSawQ7FnsoC5gCUiu662EScz/1W6BFMEfrP53TYjsQmEssEnISg?=
 =?us-ascii?Q?OawxSt1ZB1fMLnFHJ5bPZaAGbwXFlTTYC2EQUrFbwdnW/I33ShIh7qr0na+8?=
 =?us-ascii?Q?xU7MIVutbCDOwnorHaVHOMat0sWnZkoDPjzVlPgG6r7TT+lN/9oBa18T8cYr?=
 =?us-ascii?Q?HH8C3FJVKbwuOJ57MO3PiWF6efSPW8nzJMegEU7Q5BFkKgvvw7a6hPVt6POl?=
 =?us-ascii?Q?9QVQOjPbDwOVGvotlh4qtcUEpi4cxyTz0RreA+cI41dnPnJtdnI0rxYqetON?=
 =?us-ascii?Q?c5bC+ZBzvNJKVryvmx6VseGCgLwph5WcChdYfjZIt+24jPCeaEKRKGkzSIH7?=
 =?us-ascii?Q?8g2vUb6Kch72abjrOJWZrkqX9P1RAtwh2DCPVpY1mnQTPzKFWmSLM+cFaJfu?=
 =?us-ascii?Q?VTXePJdxP5amnH/iEZzOjLLFvVc8UDiINExvFaw7fT1wnLZlwon9Vb1zEv+N?=
 =?us-ascii?Q?xN2xX4CDQ3sBPHm7FSEWpUn8eMjZZ4SHuNjqCdAwftIVchVBM4h+yI1edBeK?=
 =?us-ascii?Q?hgfoYWNpMVAFVO46WxueF8IwuV7+dOV6Ljm8sT8FDcpmk6J6lot9VVJl8Hdl?=
 =?us-ascii?Q?Uf9aXEf9210/ZdcMnrhrG7/hOpLaiAgnsmfu+2W1Y6SgrRCw5vgh7RSYkkFD?=
 =?us-ascii?Q?MYU0gcfyyEQdyM7T0TPiX7hphHoTRD6NQAHBclJ6jZUxShckUSPV+9rXt9Fr?=
 =?us-ascii?Q?1j1uSdoztnYHegfb5qFYh5/x5DI4riFcR4r3aw/2ftn89BDhXYjF2FdXUQ9/?=
 =?us-ascii?Q?SNapL6x3hy/pDBM0Zk/zzoFkNSMDmPRLwc2CqcJUSZWxJG3vTl48HcE9D7ng?=
 =?us-ascii?Q?+ec8lSxvSLtB+xudtl9RRxmbzsZXAU5muv+Jr6wqQZylwlUDoQAZDJZSQvvM?=
 =?us-ascii?Q?8J9Zr6QQ38Uvy5zyGwVtMOEl6iVyeptw3lryAo/hdxTzftDa4agCzk5GjSIm?=
 =?us-ascii?Q?QmGR2zUKw3XESRiH0yLJ/7y/wAw7+5OrEBQYVAZTqzOnucVOIxkpOcRh9/g2?=
 =?us-ascii?Q?Lr9Re1EJeNvU+piZ7BONvXfsEsfKI0umEdYZ3xtxSz5olfI/RSgdKLQGL9S9?=
 =?us-ascii?Q?o46pKdHCVb/gP7HrUakwHaEeQnrLcNkMPotKp8oyWG2vxrtHCqkaR7wEnh6/?=
 =?us-ascii?Q?cHpEXaWc5amQHDko+KPqfqYk8Izoe0wJ3DbIoM28Nrg9x8b58QEOpxuMGMs7?=
 =?us-ascii?Q?w7rFRVwJRkK6SA30xQ05NH5IkGRys4GaRtgTgEsOOaEPN/xmsVb5FMDbRHVD?=
 =?us-ascii?Q?9hz8ABfpyAl98MkxuZn+/1cRnN7t2rT+Wl4XVsar3aFeJK10KphQ7DXts8GP?=
 =?us-ascii?Q?GGB+wSGZiiONRQ7hC+Y/Dh+dZw93oNzD0edr7P0Ycwh07bMNTX4ilcK+ydXA?=
 =?us-ascii?Q?vw50cZOcExeUAUvoaBODO9YSsB5A+FkyL9tKHVJFCYgWqlp+HKAWCcOV5yz+?=
 =?us-ascii?Q?S0MRoPpzDN/PQ4HATQQ7YhH3sltdVgjeFaK4HufSnEJWUQ2dQTQXPmS7omQ5?=
 =?us-ascii?Q?Pxdr1qRGStDIXsZ6b/pEI3xWFNdY1Ndnn5AiDvf9b/K8eMh3YtB6vuymuAum?=
 =?us-ascii?Q?oIL7LAzOVIpSkhJjm6k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iechnsQIwrQaq3BypW9pH6zN1dXOtB04TZECyleTra3OOOA+/Tyhi5mK4/Ru?=
 =?us-ascii?Q?8gWdciGo9J4nZj/WqCLfSU5yWmFNxu7uC80Afm2V32PzBis2Jc5oH4PB3zEA?=
 =?us-ascii?Q?zxMA4uuiDK72q0nNXLrUrfwNpUHn2bncIvIZ2gAfexTdkVopYj3ok9jwTc+a?=
 =?us-ascii?Q?pf8icFPAo8uw7tm59wjnidxLbfz+dLOU/15+hh2r5+xsodC/AhAIiUMDU2Sn?=
 =?us-ascii?Q?I+DeDbRh3dTbNCynGcvt65okQjtDiBLnsBXJq60YNxZ0kftn/bovPXJYfenW?=
 =?us-ascii?Q?0OSZAkOc9RKy/qvwxCg6EYrDlPYmFfi2Ws/yBlRNo43rXUszwX0i3pU/hQ/e?=
 =?us-ascii?Q?w9hElbGQcT4i1Fn63gThM7GIw+gfO6aItC8bWtzhh/JHbn6wZhAKnn0XknTc?=
 =?us-ascii?Q?3EBU2nbdJUpRt9XoW2qcZtTQZ22SKfX1L9vcBD+a8FBa/b8K0skpzKzzb5Ps?=
 =?us-ascii?Q?ta7WFq2ZNV+aaGaidC0lgHC6lxO9iJ/SE7atIThviPIzs5yNqypuiZ1Ixy0W?=
 =?us-ascii?Q?yvw2ytlpUjgmF0Z+iKnIjy46zfw/RJHzq9L1j96uRMnHsOFqUTPZxNy/gKLa?=
 =?us-ascii?Q?ZBfBBDbeAAr0RTCCN0WhsnH5TZKHQiB8GXpZPbTNCfwof+ZIJ3Z1WwIneCtT?=
 =?us-ascii?Q?/h1DbI/ixWhFcfkTwTMAiV7pEgsDGrdrLFbi1OTm0lhlTE7ine1+p9vQ0XMs?=
 =?us-ascii?Q?C1RE3sqQWe+1k1ic+/Okb8lX2pLG505wYGNCOg1NTmdizSaq6F5Rk/19FDuY?=
 =?us-ascii?Q?ufTywbH0LDmxwmQ+VCH0sTb7+mP9E0XK5snUxO8wpnPTxrQ9+kuyaMfQgLMG?=
 =?us-ascii?Q?7qQeSyVo4MECSvb5kU3GqnDCT361Mg2+ZRYNe3+NWzJKllMOgwV2gbFSTPBO?=
 =?us-ascii?Q?P+Q/ERmDn/65xbr0epokdqhkn8HTP4jQm38jI/mT+Ktkszyux8DPKQ15yQRN?=
 =?us-ascii?Q?9tYZxeHuT8pOMy8zQ31d7SlhWN3IgIUKKEOJKxfTSpb8u18cY1WsIEMtpfnC?=
 =?us-ascii?Q?bn/PmONerUY+vSYaNjinprof7VgkyK4SaN2MKHFPA9qOPyv33wnKvuI2dss6?=
 =?us-ascii?Q?WBKuu/wK9duLLURIPyFQSYwE80wyfbzNaIS+ELVY3//DbMPxBjpnCg41NeXE?=
 =?us-ascii?Q?KhHM4QRbZwBI/B853vWwJixOPrVxc/PuT6bgAR15g1lDwdtyPJUXnBuq+Mtn?=
 =?us-ascii?Q?YIsMnpfE+pLzpEL5k2AoqEMkYLuxYvTxRlqhPcXaDQ/gA37+o16Sm1GzkL/R?=
 =?us-ascii?Q?aBkhHw+e6QD0ZGPNizm6qvZEvnI84RyLwhOXgcK3xmGET59vRi/4oWkczo7z?=
 =?us-ascii?Q?H0IgToiWYJMb2qS4lir2pk/9YjNpCtCUFN2BTdgzEhNA8Ukg7kd0dxeZfuhJ?=
 =?us-ascii?Q?0z2fjNsHXMolXLD1fuVVmArLViGF8axsVtlv67vSQmoiuAorCOWCSZh7TnyN?=
 =?us-ascii?Q?JnwYIIwi+pRWhqz7XrVO+10hBLz7923IAgFunxmkF8M+rBY06WpWr0VwRl8T?=
 =?us-ascii?Q?e9NX7q3TBP09ARZlNsp9EmqDd1QCmSFCZLtdzMGjPs9s5rfb02dVcJ6bZUsI?=
 =?us-ascii?Q?6dMw2CgPQOqJhusadaExsNp4PQHrrzy7UPRHT8zO53ZAYDn1Z040mei0wgHA?=
 =?us-ascii?Q?iBkyoqNXcG9R143j83QztADrqiF7v0M6VNyzRteIkf+ZkYyPu+d+w+0jq0dM?=
 =?us-ascii?Q?uP1YzDUvdD4dCUmlVnGEzViQT4cKyIivXVxBWpXY8wybu0MtE9h9zHLxWLK3?=
 =?us-ascii?Q?N/HweYbgl6xpFtq/Oqu8TDb53QX/j2E=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uPMlzY3QCgJ4zfAilckih1I8l1kkTxB5fiGunKcqd12PlGFi4HYhFBtkr8aNmG/ci9oCdtdtXFAm9CmMvJzLph3IFyH08kyqh60EQuU6h1R/7AXJIBkFju8xKNnmCKkvidkNZwQ4+3jlePMyktcbuPjWf5g1VsVqJoiQGny4X2+Ht7mhJDF3onMGfNYeBQszGe4DGxgr5ag/t2JTP6Dv/LRiuvszUKho5pbyr3EGiQhgc166xkYD5sdczweTzucDacWH/RqfzI3yPdmzeqMd+t8oNI2zWaZEnaUsJKvxXHvEhxTEG5DaO/mVa/A1gwL53uJvaqSTJlQFxN6054QAdYFcu9J7AjnhEr4JMtTC0DEtZVtqWKfEqyDEIW/Tdgw+w+nSByj9hIQcqpGOnNzRI/5hoBWxpcXjc43IrlXtAGCI0X2FSsojNQmXUFXIc3vXunfnXa5HGaQ8fnIt+f1F+afnaB5zld2ce0/XdIH2RSQ6iOXyDmtzu+Sqz+eBgoXSTd9YcdoyLno2djZY4bFnY3+r/nTQQYorDwH/11b4AS/Jqt18HJi0FThctLd/ZOMD2CTcHkCwHE2RwS51yvs0ITNnZ3XOIfQm83N+oLlOn4E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b99396-2a76-4910-bf17-08de73d9a74a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:19:38.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NCa9TvTLQ8EB1OgbW7wiHk7obUV5g8a/75Pcpp6grnXQO+Fk/bwqt8+sJnstxFBgXWYyPxNZV6gRi5qQOM0svj0zCDtr4Iqv7n9BAM1YJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602240165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2NSBTYWx0ZWRfX315IlaR2h4JX
 R8fr6O5uIkVvFTClm6vEqQTfTOAuJf3x9j8VLVPbD1KftJSn23fLpZ2zOIoi7sHuliwfsJBJSlR
 FzhTVTQyNml6eNj7cwsGivgC+FP8e8UJSGt9y3IM3mM1XXuRV2oT6TKPOAT87G4KIOSklfjMlGC
 WvCgPLOR8haupDUVMZYssQEMY8bydfD3N06kfxwjSzkNVOP2urXWfuumrUICmNLc8F4hDtNQ2jM
 6U5aVpyEovu7D3+WG53gk7IrRO55ZN/EzXWIqnju0yAbbTqM1mMtnMn6L7Sef7315Opex/WwjTP
 V8zHfvO5vumfIKYFcefC7G6e1E6Fkq7T3Sqo/yWesfyNDCH0wxv/UZAZHs+gO/NOEYagkFvh9BS
 UW6pLxeAWqWObARragWyDit9ej1VBKV+zjD2a85YyozXCSw4MIZFT58cqCI5KhTZsNiO+W5LqO4
 I8ZpwPtMxXBVN85CjVA==
X-Authority-Analysis: v=2.4 cv=XNc9iAhE c=1 sm=1 tr=0 ts=699df9d0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=4s1KKpUvOwl09uUjxcEA:9
X-Proofpoint-ORIG-GUID: I4Dae05uBAfHnCuojSQCYAJI4jh49hK5
X-Proofpoint-GUID: I4Dae05uBAfHnCuojSQCYAJI4jh49hK5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94012-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim,oracle.com:dkim,ca-mkp.ca.oracle.com:mid];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A1A4D18BEC0
X-Rspamd-Action: no action


Luca,

> I've added you to this email now since you seem to pick up most patches
> for these files. Could you take this one please to unblock Milos UFS
> dts?

Applied #2, #5, and #6 to 7.1/scsi-staging, thanks!

-- 
Martin K. Petersen

