Return-Path: <linux-arm-msm+bounces-58821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE84ABE930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 03:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6092E16C069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 01:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373321A5B86;
	Wed, 21 May 2025 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GVIbmP7w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n4qbVD2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248F3C38;
	Wed, 21 May 2025 01:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791569; cv=fail; b=oczJmGQFLls2xoSN1gsRRcLsJ3sT84V4IWWmwn4hAodMjx1XhZWTY6tFAzvWq3DpchBdZnzSuq7STyMezoHZECpLOxFiWn0bPo1AYVAyqGcn44GpBG300QuBWxAqrag7aFgnYQrHcrUV6QQJBN8L9OsmVYvlADclfaD0c9CbQeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791569; c=relaxed/simple;
	bh=QEwUP+6c/IRPv4zynlBZLldImP+oCX4xCt1vLfFRLNE=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Oik5dZa9tqtEqYWDJC+QXez+PqxcLCHbB63OJoTnIoFI2A1WKij9444mHFYFfg67dkyWkY4b5YiUKb9Cd21FZuqeFMlIvVK9fr0r1KBjJBZrGhjlVeLVo3u55rrQ1wkMIzF41NnAB3QdZC+glVIcmtl2Uxapc+Hecu/cr4klMx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GVIbmP7w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n4qbVD2i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L1MspW025477;
	Wed, 21 May 2025 01:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jBRNFrm2zQtuZNmtEU
	AfltM5IFfnxztiF8AEcRVAczs=; b=GVIbmP7wytodN6HjFh+FtvYlislnLTljQi
	aR/K4LbJHYdt2qrxc1f4xQB3eGyd4KSjDjeTefprvv0sgjxH17GK0HgGkiqSXUgK
	gXo5wxHPXyCq6VggxEPSNGWW0nhA4SFE2kpc2yu/GeMl/50Xy1M/TCSnb0cf351r
	H7HQMawl3uqlQ3ItIhN5Lmf5lEChTY3Rj59GUWhrev45cSw8k5Ofm2doio8X/mch
	590UaaqrRiZhP0/Uomei+LFuP5wWwxD4jDIO1eIw0ddz7ZHFQZYHXgQ3Lp+fbwiy
	nkbvgSFqe5ZPWQtT8qry1tuz/SxrarJy/AsPgtjsn+4hyFzt8DVQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46s53vg0pk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:39:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54L0vbEn015567;
	Wed, 21 May 2025 01:33:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwep86b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE7HpM+dTrY6XhV+1DZJ1LREpunxMWEHD1vhac1wOp0HBH1toO6xp3HWfCXPx9RsTyffI2GCNCGhGqX5XrEuPUYMnj3eFO1Mm/Iew9HAuijon8+D5ov8FjOoRhOforvFxRBW/pCxKrIX9QFsLk3V06kKQZueSnBEIsQzbyQ1lsdEVpn8Gm2r4FaHfYJXQ6vf0c+E9hU7MYIpaYSWNNPVQ70p3wVuFIOBRKRAasyVI4NVOBe5uYahHJMXMJXgBxPFvuf9SMFIXXiRwJaOxgjolb6i1sN7QGnmKT4Hv9W4pz4p5DO9RuxSBJZCQRGGENYv5j/MV6qMPJlauRLk5IoSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBRNFrm2zQtuZNmtEUAfltM5IFfnxztiF8AEcRVAczs=;
 b=bSmtmQcr9r2g6MCZL1h2H0aXe55asXKqQdpZdTBYwwMx3XxXuBxMVU6cuSznBbCp2wj4Os88D2rIXLYKGD25/BWskXz5UGwxySLjUpOsyB3Yp5nUaC/vap8vPpaX/3q9JOvMUMfdtGenYHg6bSOLG912Qgaxiaj9nsYEGV+7HGgCGO3zwdn7EEQnVCRsmnMcw/ZFoJF5Gpw25LWt2tUb4TkbmoXlXgMo51fi4RVqBc8smlCkiMJqhjguvnMKT3iHlINfs0LaKPHqOYpUw8/EEfOyf8uPmFMs9EGpxc0x/x8sJ88Y7XVtvW6cs+AvWTELA1HOfOH3duMj3gWHEBd5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBRNFrm2zQtuZNmtEUAfltM5IFfnxztiF8AEcRVAczs=;
 b=n4qbVD2ihYxJanLL7x4k78wzV1VNlW2ZLWqejA0GiQrKGCbjdo8z47TOUbgfX0gM9/k/EeSaNhEiBbyww3VVPcIsFRDAku04wv1XLtKAah/zj46Jgx2X5YbBhoZCaAvydFyPRqr6kyhp17/tRNtPCEv/ZLB8YlKGgsE+x7IVm8U=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DM3PR10MB7945.namprd10.prod.outlook.com (2603:10b6:0:47::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 01:33:03 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 01:33:03 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy
 Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nitin Rawat
 <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <ivyxgka65ahbwu7juszd7pf4wc3rns2siztibrtbnm6eoqjjwk@57nsyim5qyz7>
	(Bjorn Andersson's message of "Sat, 17 May 2025 19:02:19 -0500")
Organization: Oracle Corporation
Message-ID: <yq1y0uqlpdx.fsf@ca-mkp.ca.oracle.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
	<20250327-sm8750_ufs_master-v3-1-bad1f5398d0a@oss.qualcomm.com>
	<ivyxgka65ahbwu7juszd7pf4wc3rns2siztibrtbnm6eoqjjwk@57nsyim5qyz7>
Date: Tue, 20 May 2025 21:33:00 -0400
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DM3PR10MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 91da4066-dabb-4f60-b775-08dd98076dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cEK2tjsuAcb10mADC90rQVPeHkK+w3X+NmYgpbXOB8HBGcJVqbjD8j41PCK5?=
 =?us-ascii?Q?FsfjdVQaxPS7xlR+yAQeVQFtnkWByDW1tn1dRUj/KGvyDMIty/0zLzR2ogYd?=
 =?us-ascii?Q?PqMHzYlGf/y5/VwuJFaFLW2mN0+vT01Y987FhzwpyUZKSvlZX2BI+oGKRnr1?=
 =?us-ascii?Q?LmYS2gIORdALb55ZIxFg2SsjGzepU7uf5c/zGb+2YiA9VZV8BwR9S+8wK4I1?=
 =?us-ascii?Q?I4xZT7vzXOVkEhPFLFZ/3JyMbo3YoNvcXquwXR1ScfSR3R2w/WfVnAT9EY5+?=
 =?us-ascii?Q?2KrEZpXFNNH7xoPwpbTzD57qdKy4Ljp2JfINoYhZ4uNoIZaR8wyw8McLeEk+?=
 =?us-ascii?Q?Llm5BTi7HRAJ+HFYejR4WB6g4CJBkeDuMsC/2XlbKGecAzNycN7FM0KL+LFp?=
 =?us-ascii?Q?cwkMcJHEADOkqN3Gvnp426wMjJTfXHBPi4/ob6vKvdWu9P/yIb8BNBvse2rw?=
 =?us-ascii?Q?Cl24lMkOAQnjPP8fM8IBmGka3U4P95wJgJMFwdwDpr6W4HBTalvXWHcYnpO3?=
 =?us-ascii?Q?G0D73vza2EeSzOK1IHWBHCVa2cwhH7121VC5SOJxAlAa7imPfMHor9GaSUIA?=
 =?us-ascii?Q?6F2bSnizxYYmP1b4yJa2UNLIhlkwhbXoCD+1+is0O2gA8xnn5y4gBbj5jZa+?=
 =?us-ascii?Q?6S2f0M6F4WAs8JN+PwmVoPvzjyd4L9atUWFKcwDZGlrf6tU5x89l+szvEtCf?=
 =?us-ascii?Q?BEeXfeSgJB1Nx4BNcvrRJ9VJlhhOwXspqlmxjgT3ViUa0N7L0G3gJtd/op6y?=
 =?us-ascii?Q?2xQizMIMP5wBb9+w/IxAGWePtJ+mguqW61DaEAS5HztW3s0IohXLcGosA1Ve?=
 =?us-ascii?Q?0z1WC4DQlAOZXPH5/Mwm/D5EXvmK8hwszk/uI3kW7z+7QamN0fgRJDn6F3rp?=
 =?us-ascii?Q?uiMIfIUQWa5QN8z3VKYrPDVeRvXpvxWhX4jxThA3m4hRBCxYyHUxxJD02o1s?=
 =?us-ascii?Q?SMTIyFx5CeN7TVzIxjgns8icwr2QZbjOqVrsJ5rysq80xZsS8L/gYjeHQqpL?=
 =?us-ascii?Q?YY8HMm4bWWZRtOvp59cZy5YXScbKaahj/4XotI0rrSAOxlbagHRWh1lV5BCs?=
 =?us-ascii?Q?RQgwTB4qgZJi33IO/Mvz7BQ/FHgl9zegeapyHSlQ8pbP3N/obE2gJFrmSquN?=
 =?us-ascii?Q?OUVOR21rigops+anzAj93UARkGykf4JpikjBKsGF59iAP+LI/Q6MYBtIykAs?=
 =?us-ascii?Q?yaabPH5rrxzaOGPtNyOZJm9vQzSaDWH7r50kSxbJNIcccI/mrTId5I94zAss?=
 =?us-ascii?Q?GmLBSUiaEjwScVPtDRNyi4JYdAYKEtgnBv4beJzK2jYObVH03eCM7PHhEanL?=
 =?us-ascii?Q?3LNKX6uKPxPRV5+QqSy1iQn2HGxJgglKlarf1oC3AiCrNfyMaKf73lYArq0t?=
 =?us-ascii?Q?hDua9Ze0jgH7hoIpUu4Ngmuz1fa1TDquo80EzeRPfH9hCNl468Fd9vOzypvC?=
 =?us-ascii?Q?kP/snKS7N4k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5E2ff3aMV12jiCZdBxgWYp/WqAtTVUhgIazEDWyQG8LO1kQ6J/ooJPspKDQC?=
 =?us-ascii?Q?bpI7is2wAwtu7j7n6GbFGpLAszzm0sG5IPFdRA2Qo06upDgtVn1h2sWXd4D/?=
 =?us-ascii?Q?iNRAvNrb5gudDlVqFEXoQis1nRJaOiub6vQnalCyVt9MhHrut2vBx74TvInE?=
 =?us-ascii?Q?vlBtWUMFFwpjlvTAQXbCSapFMlJgix8JSlmVdmV6DG2vTVmvqaWYLXHUmej/?=
 =?us-ascii?Q?aImWOPRSFAsTAyMq4fWueQf3YeGB9kbZBEydoTY1H+71znJxiyL6rHiuVQTK?=
 =?us-ascii?Q?loA0klW4hgVDYsDUyLxFQFuC/+vab+Y+0qfxiOaEmteCKniFHgKKWxvtR8/x?=
 =?us-ascii?Q?BeY2oxYuUIif9cWjuLTFOP4Gt7b6hNzmxPfumGVSqE53rzeF6/unv1e5N3kp?=
 =?us-ascii?Q?XdegJpPkgVlcML8xUM9B80tsC3Ja2X3iYrBfSKBtSIvD0aW1aBk4f3zCiCXe?=
 =?us-ascii?Q?3Hn9WwrT2IbVU4Y3P8KsN7sq5ukqZA3oMIV9+N+qZT0WAYRNGG/iBn1NCU7P?=
 =?us-ascii?Q?FMvXfFfJsRJWJ9+ZZMVhFPZFUS0A6PDHaljopCcPIXHjPCc318XR+CKjg4YA?=
 =?us-ascii?Q?yfC9r8a9XnK47GtU/fTYIqxA2a6PLmNL1765iRx253bdNF+RhVfIkR+p2XsP?=
 =?us-ascii?Q?Myy0CxtprhrLhOHPQYnab2CUQ5MiyAuwalpBMRMBviwIG394YXGL0TzBWG+v?=
 =?us-ascii?Q?L7Jo+KnjCwKSRW/tcwPAvdl2OhJYkUVwy/+5oMg7HerVaOJfvuv+MkVjMQD5?=
 =?us-ascii?Q?GHSACMitD0ZVmz2RMg22oud3gDBPyURN9hr15Uqawx+oLpyal1FgnCZesttz?=
 =?us-ascii?Q?mBTrKY+T2gF/rx4QYNJXD8Fkpx1bG7NY+x8mtplKvoNRVaY7WvWZ8fegEufB?=
 =?us-ascii?Q?4fBOS9Rn4zYTJxCA4ZdMaV/C8TwwfZfuRSURFPjS/89lK1na7yvRk5Rek+e3?=
 =?us-ascii?Q?SoE2hsllFrvmDvmx7fiX+543enFc8X1VEtjpK+4UB7ROg7vq5BS+VSYm9jPT?=
 =?us-ascii?Q?Thaon0SqoMYSzu/vGf98YCIEDvt1k59cLUdBX7Otd6E3SmkWkD72nnWNnOV9?=
 =?us-ascii?Q?nTmCKDLXfoozmkD/OfwHO6WCut/ex5YaI2yFx+dfoFDmyyUBg31va0o2WB7H?=
 =?us-ascii?Q?Xc1UdwRBGQ9eaCqzsr9R6rMg8Fuym9U2NroM7JGCxFrYRo6MVQWvr81k91Sv?=
 =?us-ascii?Q?rINKfCA9TU+DuY9tIXdNfVu+DUibv1oYQp3v8U6rHCy7Fc6Z0LGve/c4ccRE?=
 =?us-ascii?Q?wS7E4rx5cwLxjla9AWHvSnNtkgx8qs59K2t/BRKzNm7CJAwqR3JNUNNhyuih?=
 =?us-ascii?Q?Q+uZan6CiPpXK1LBxwNHiJcq2IrNsIbBto/MwHF5roMuO4Des7wAMvuMI/c+?=
 =?us-ascii?Q?WNtm/4URpVgJKAKZSKZa4Kqh2zoLoEUbrteHuDQHquSSV9HJrpRS+iuhK4RT?=
 =?us-ascii?Q?89+WLDzZV6TtrPQCpmZst660UINvX57U6pKMphrmdgDeArPtApwb2gZ+DQNy?=
 =?us-ascii?Q?cGxOqI9kDcA/zGcP/o/3eMTDzQypR/do5ZI33GPn9CIwiJ4VqenKxv9k954Y?=
 =?us-ascii?Q?Mv+ZHvD2unlP8tmW1WX1FIroJDhb++A3A7pCwEa/jhNcHkm/goWV8MvtvYbX?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7WqCqI6fdWBfN5KhOwNlt/phNgxjJmckb778f9AjwR5sgraF+xHu92ogsUABfx3tc3itx5wTOKmZeXbYMAy0c7qDmJDBm0pDbpTJyyJlDKw3uLZl7j9SdGxCx2N5lIDXut7oST0NtKRH88GXab7jtwVmdLRiUDdaYolXbDerxLMnajYEHc5Xgyslgp0dUlgFiCro6q4mn8MhjxdVsyKhNNWym5bVZJnJ1a0qSN6rMdAs/sOv8PYdZYxj2R22OT1CLnFgiz1zxztqrm3OxAyL3T2BYBCffWNvCE/TKzeQHkNi1WocvvdmKCIjbummKd8m9YpNOugKfShHlQ/c0LJBNYanpMByZqtdI318N4ipqvpchXOU4huXDQwEnwI7N368U6mcJyKs+9mWtMuhbfhzSZXbIyHB43ado/B+GZUrlfxyklrxw8kKtL3HOU/eyFqKsw0RUy8eGZ9XNdbJTJhu/Zi6z3jG6lMtXiRqwn2nYQxEf9eBb3ibGsTRVRfp4PoDPuuzznlSh1WVdHzd7zI/i6afNKkRDuMSN/UhGgcgEUtVDxv/qXaN0FLr7q6j5brF5Pl/paYKJf0DpZ/uRQ7y+jJPlI/5e9+PC5ZuNeEzrew=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91da4066-dabb-4f60-b775-08dd98076dff
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:33:03.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt9/wmyHTbwZzi2mSNPe9YGjbwZcWepZQ0ZAPLKHjaO3FRdxI3S6r/lACPmePyeZIogC8lYg7Qzq5GIbL7Nhc8nzKaWURh2aZA/QBjp9m60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7945
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505210014
X-Authority-Analysis: v=2.4 cv=cKrgskeN c=1 sm=1 tr=0 ts=682d2eba b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=3Cno-gKpN4ypsa_tLcAA:9 cc=ntf awl=host:13188
X-Proofpoint-GUID: vTZDA1TqjUZ1KFIBGXHLwIea-Ve31uY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxNCBTYWx0ZWRfX1D3pfhxDsHfJ jfHVrrrklmIc/6ZxZW+DWGctPK4OHFZ4NFaonhMSDEKSaTdYPK16HEXKdf3KSSd6B6RAMrObwJy TqaQgk71OlPt0/cdveXTZnFx03IOY5ReuDJIDzaBMd0ZR+sPSkJS35lhPgiqh4FvW6KLHTSfTtX
 urvkKrga7NvSqKrwoytlSm9FynXevKy2nwUl9GJBbRRbarS0ewgtl764sUZxi+620Lw1EphKufj HKYxcIdbeI2DprmjT51BRgXIpaujKTwmlOqjgOHLPHuoQIPBkU/+ZILpVX4e5fLGsd58PKjpFBO MEzl8uN5/QwTGmssgIOdYB+b+pBNjhayA1kVHCErM7z0/sVU1ET4+3FAfYR7lXkpNNvO/Qp/KMW
 1gCZHtbBCa6l3w973yLWh9pT3snvUQa1YT3u2e6DB53ntOqDlo73s5swtkPdHdJ+UV+XDMIY
X-Proofpoint-ORIG-GUID: vTZDA1TqjUZ1KFIBGXHLwIea-Ve31uY3


Bjorn,

> @UFS-maintainers, could you please pick the binding (this patch)
> through your tree, so that I can pick up the remaining dts changes
> through the qcom tree?

Applied to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

