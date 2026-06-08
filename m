Return-Path: <linux-arm-msm+bounces-111978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QEr3H3o7J2rMtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:00:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC965AD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:00:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b="R5a0N7/F";
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=zebEr3Fz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111978-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111978-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A28305A5D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED31F3AFCF5;
	Mon,  8 Jun 2026 21:54:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B433A0E85;
	Mon,  8 Jun 2026 21:54:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955693; cv=fail; b=R/9nOPbwV7JKI0FyRY7U6ZuoPZgTNBWtXm2Ay/7kPt5u5dA2XGqMltyc4dzc1tiTOThOX+uUcd80gEi18eqiZqBv/z9H28jZLBfHpbv/mzfcb4cemwuzAzTpeWEo4MPF9n43/NSa167l+pxbCas2eAEMoBZvIzDY4GO9Y/hzZ0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955693; c=relaxed/simple;
	bh=oziLaIL87HuvCdHO2KiikcabIpvd1jMhu3pdikJxWBs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=XzMORtFpOJ+pke83SGGL+QR4cp3eTeRH1G6Z1mEpXNG5hWy2Fic+5f0nNP0TPEbwwwd65eteHYjaUg2CfNDyU/IWlzcerBB6aN565502epMl6dyh5+GPx1V9iJMmWiWYNPKqaFw7ni/OBJ08V9bWxbnni4WuoC78dKlaBQUyLrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R5a0N7/F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zebEr3Fz; arc=fail smtp.client-ip=205.220.177.32
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658HSUxx1242849;
	Mon, 8 Jun 2026 21:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ddUYuhTULPgsM6+ffX
	VATsY0vN/yZqrygzKB8PY438w=; b=R5a0N7/FGow9Od1FxQ89+rL7nHex21xBH3
	WM9XF/vvHlkczSK6JDM6VpHIs5pHIuF2b1/ms18ax5M6IZg1uJju2xQirucq+Ru/
	nWfW1935cb5LlyRXk4rl1lEo67RjECz0UVODUGG1Is9b7VfyD3xdaNAqeTXA/2E7
	k813oYRKdK1asI10/rZuEVPKcVirhmUbrEgSvLayHuAlt3v4cPHt6fYjF1XGbmFW
	o0cOpxSdwmQbfRDz4qe8uFLA5NnOSQM8xTg1Ro7LITelc4NBsk4ExrdPZSFtuOr5
	9iLACOGcq5pOtFCPYc6BS07Kspo7MzpdJafRkG0JAALu2zZm8JQw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4em9ybbars-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 21:54:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658LrdLg014555;
	Mon, 8 Jun 2026 21:54:45 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0pb2hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 21:54:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn7+Znsylf70KWEKCd0J7U/Vvb/9Xm9YG3YTWj2HWWUHgsBg4m1+3/l9ZEhmeNMsje4B+7h2qv8XyrfPsw8EnWW5mj4wYRdDxkO2xCcKsImcHHMoYAK610oYYID4jVdJ6sRIK2JRbm2xPZFdXji4Isxco2U/wJJbGRV7+led0tuIoBPjVRhmV60F0B/vAcZxR5ZUQhsoUHHsmitz0vzfNsPX/TEWf3AwomwMi9UonIM8A7zLpt4UmpDwNgKACgKBA7iKwGYVZISHxosW3p1UXJOaAIhvlnG32SSSAv8AGyQ72aHBN0C744tppTZ0keIbA+9yaBCIfwrzUeOFWo/mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddUYuhTULPgsM6+ffXVATsY0vN/yZqrygzKB8PY438w=;
 b=rEXlb+F0XOpV757U83SaXVSb7gSBSl9DzqzheDGLeO4tjhbhwcGYk4UC07oFmg03k2AsNo8Lbhtt3HRcwxAmfdelTHNcsWF6udR0BVkR/pkHNQxOq+DPsWUFd8PIBT7SuNf93VaYlfoOKKpDb5seSig/6cIs+czVv4Vl5lFRJCmzcaF/mgl2qgqYckIBUTsBvpCD5Az1f/mDhMuurByMygye9FtOEOjhnYARV2yDjP+iuI3IwmlT6xRlctQwisLx622l5nFshkHeRywfyuXLwHCxN0NxBYDXpfAijQcQa1DD7XWfe0l7cOommkkrNrq4HniKf0V1s/RYtlc7NKv/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddUYuhTULPgsM6+ffXVATsY0vN/yZqrygzKB8PY438w=;
 b=zebEr3FzJscUWVgqjCyeE8l/nEtsdPcr+WTJYl3M8Nq/m2m3ytu/Rmrn7uuL5WL51xeQRmjYFR8IQhlEbU+487ri62uYPW9SJojBukhRnuOTEH1bmHp8m8m1X0w2KfzB/sR7rItYD2qrO2eKJDkFFvcIfdsZ+XA2ND8jEeytIto=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CY8PR10MB7368.namprd10.prod.outlook.com (2603:10b6:930:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 21:54:37 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 21:54:37 +0000
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter
 <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh
 <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 2/5] ufs: host: Add ICE clock scaling during UFS
 clock changes
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-2-b0b728435356@oss.qualcomm.com>
	(Abhinaba Rakshit's message of "Wed, 03 Jun 2026 03:53:54 +0530")
Organization: Oracle
Message-ID: <yq1ldco3dh5.fsf@ca-mkp.ca.oracle.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
	<20260603-enable-ice-clock-scaling-v10-2-b0b728435356@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:54:36 -0400
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::31) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CY8PR10MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: e5972fa3-da1c-42b4-2e00-08dec5a888d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q1j3RAej7AZZxgbOdyZMSI2DHlMF3KS9zix+BRRHB6edjYw78fTG4qHMGAmeiMVM3MEiWfqNiEpKt1K1lwtgTk1WGameSty+kN1ls52OctJVwSWoHlfxI+idef3cRNTN/5Foaia5aZVSM/5pDHrhfiRaVCEXqqLarstuQnKBeJQ5Q9/eE0TIVzROLHk632vthS8jBV3qM7i/4DVVEDz1iMIuw3O5jUQ15Yv2QunsW02Qehryevs7iSVc1C9e5QKAQNCyk61j+PRYE57Rn0WDwgBNOiWIHCbxsMAj9T8hUiKKHBK+v08YFaXi/3vP+39s0CbD+SNyAMiLDP7KaP/fWYj4niiPkOW6CNxWonMTovwgb380cWBUGZR2Xann3ATaPXtGiNmkMmvFXcCifTAYle/eTHMJUndSuYr7ykE6+aDdws6rSkbI2DlNsuyvcSZGjN7ECWa2la+Arpt5KRuGiOs46UJK3ZM19gX4s7HzI6y16hPT5cIUm0Ym3ZRDmy4MdzMOS0R5+0v4YrmNovmCWNUm+bJ6KYwI8jjkqBNPfZVqMrt5TABN/6MVfRi5oKlvDhDcMV1/gqmEuyVABOVyPSImQxTh/srzeeffd+yBAUi42k23SfbRmJ8sHsgoGg1rp8aiLfNlk4hwMWNKo6OipA7SypZOD8xMr4ycNHnm0lIA6uzLfS4EbKtBYe2/Un9r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qNPuLqgXnzWr9UHzq2DeEbc0+4Lt+rjJGEJcdnv/eX0rluYbvDO8YrDNZbpq?=
 =?us-ascii?Q?0WdCqo6CtxHAcAdCsw+JPt7pdgwaEWpx3Aw9j/YizIOQDJ3WK6yQcGo9sDSu?=
 =?us-ascii?Q?SiXJiybojWgDTdJ0TGikvBDSI5dIxjx3awnDIzgFu4Y/jKWPmvRAee1521xP?=
 =?us-ascii?Q?goUfZUfJmYhR4FQxVm2AgTt9zEKwONtOT3rBMCEWNLjJvXJLBaP2HJy40TFb?=
 =?us-ascii?Q?pBY99Iwf+sjTZk8AqS1szPZm9twIjtAzyeo2YKGIZkXszuao0CNycbVSrHYD?=
 =?us-ascii?Q?XSYbho6flfwqOqBGkBqzzOFo2T0ph/IsrmhywXI2miyX9rTwTNsQySXH83iE?=
 =?us-ascii?Q?f+rb+G7QcjYPMybdK6ZXGeWLGhBT2PF88p3MEdjpedGYVwE9nnEmfgdJ4OmV?=
 =?us-ascii?Q?kxUkG6ZGqd93yVCv0rAkKlQXr1eVlRE7y29wbSm0lb91PwwZOk5UaoE/JCv5?=
 =?us-ascii?Q?K9OraNbDhwSbokROv5bph2I0ApJF97BbZBo85WLBKK94IRzDm013IYImhaxP?=
 =?us-ascii?Q?9KF0tAlqINB+4H4WBORrvn1+zL30b5vH7JUMnwe4kf9MAwrOo4p21wet3sYh?=
 =?us-ascii?Q?8Rji1o57FKJiifUej314kmBAx4clWxHQwfgFnoZow4dXau6DVvFB6foGJfig?=
 =?us-ascii?Q?uj1N6aNcjUeGzNWJpz1o2WQxDz8DEf9IIa8B6FX6+v//30oNdufPSEq/VSVn?=
 =?us-ascii?Q?bQSPYR7tBi6saxzIs2uapyoG6rdcAGlo/mzi4BMemAPq2SKTE4997azX7fAX?=
 =?us-ascii?Q?IP77638M5b0g9LcCNlTOIMnT8hTyoTDugJap16CNZf86rDkyQK3DvYwMSoRc?=
 =?us-ascii?Q?pnkwCqoXqcSvO05UK9Ipuz/K+8dtpdbNH8aqSjJ2BQrqgEnzLVDYxusAh+tr?=
 =?us-ascii?Q?sgfSsW4gbZ9I3ug8Aqg+2PZLDI00FpKPXeFpk/Ya0f6CGI3UG/M2VqF84f4b?=
 =?us-ascii?Q?dG1FoCIJ8/y5jF7/ln1N5VoHihY3Fk6QDGiCGwPB1Otb/OEgf/b7rq3F12lp?=
 =?us-ascii?Q?7h5w8iFmbgBzNwQaJ61LU0rsIKQhh7qfPbYjZDuqSMGdAdzmmCO0xsHAHewq?=
 =?us-ascii?Q?UoGHY4/8s+HEXB2DOKWbPWR0fSsEazsUKBR8vNcrMsAuEtlMO+jmVfL7mGUl?=
 =?us-ascii?Q?jRU8FkaRBxFZGmVrG1QkBIWEGK9OIdNBf/y7JLKaY/svjWZmCfoeh+47PsjF?=
 =?us-ascii?Q?pFknNVQljjQcJsjJIMzYWq1UlaJIQcTsKvnf6Tyv1v3Bzo9aeQMI/G9XlXBh?=
 =?us-ascii?Q?y3iZ36nZwtIbSqaxdxov5rva47fY34vpKoK+jm1O0GODW3cSMp8UOBe60WAN?=
 =?us-ascii?Q?j52w1+QguhlVU5zPs8qdymUhPUCfSqDeixVxN8lOJZRCyAYaq4jOW6zAd7in?=
 =?us-ascii?Q?jBw0xURKyeaVsXypMEdjiEi9oZ8bYYDBbxaNGUoRw+FEGMSHT44f8cMQeOHe?=
 =?us-ascii?Q?7yWNTKVjJr6zNkvLD0myG5gichzkw6CT5go7K8QvdBEYsGUgTDVt38bYjur0?=
 =?us-ascii?Q?KEbBYhNfMLOty2IrhEhX3NbP4EMSXNLuztg7ZDxyxybeoh/4KXhJkZhtvJzG?=
 =?us-ascii?Q?3ScGzRmTglXZkCGrAb8EgCVEREOaUlq8Fj9al9ETJ9CzRyMiTgB9ZXbOrxep?=
 =?us-ascii?Q?0q1HVfSx/m4EBHGo65VJj/z7rF/ZcnjG78IVcapqiBS9j/eDT+cSUEMTzLWu?=
 =?us-ascii?Q?6ZFzb6k7Kw2Ev89zH1WdIbW9qkK4Cq5Ga2KkJBlJJpmL9epmTjyjs9E1l6Zr?=
 =?us-ascii?Q?w5OHYAtQRBrQMWDccvCF7XpugOqDO3w=3D?=
X-Exchange-RoutingPolicyChecked:
	ZYmVyYasTt3My/OLYGlZqnDs8pIPD27PmD4I3bA+N5cuDZU4kHIfuGAuFa5WB75Lx/Xb1m5o8AWNUNghWUlmMeUCkhhwwoD3rR+/GtWIBiI/GUH+bA9Q68QnZ+Eug8llFUmYew9iyDk+0eBz3GXjqUcSqgiAmX1Awf2ZIH+YaoIF7qwvB8eA/tu5UsZkwDym6Rj/DfobUsJIH1QBW4KP12vbXiTvKXifCrlWgVgU2hRigA+2QXHauMTAFCs/giNFdwTMtKOfnsvU2BgHkxlS1ajdAPcW6rl34EP5NiiPATaUC1XJnpHMIvOp7ZVLWNv5w15Vhafxfa4GbL7YtbiZvg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y1MsHSla5BMdJsh7MvMiSGxGqcvimIPW/gcIbM8ZMYCC5XUj/lVHzdeIDIvy/StEY0AkZdqV3+OOT+l6sjjX8CNKEoojX57c8eoJyBdMPJ3sbuRodZiU1C0UemIM0pluEppVwtzV1Jf/OMbwrGizDyzGmFfyq+IB3I2YdYbZBoFAmh2JB7NQqfJho1TuJCSI83MajbAs9miiZ49gY114JmcTBD8RpTwy65GMAV+Y7tDUuczbkp2NdNagREqbhDLPMMw72wM+i2ZQOwjKxrFqKdsdnOQ0ts4SbBaU6njgXRNj0QEotFFq2Shz/DxbrzY5rfiH0Fb7xs2tADIwD9mJ3IPs3gIRNiMvrxFqQvdWTABUlEYu6FVCVlS67md4k4TS4vUtjmrgeLCv4TsalDym28nLfI6haf6EnLGsGXLiQIoZ5wiXdHBu4UfUeGlys5OsJQCR2TMG3k2PfgmVt0ZpIvfbrpdZYo/warOHqcp9Opo8yPyB2NLyxyk88p+7ZKUNZ8OXDv0coIbo+OtPtCUh+1c6EJtb3+nSNPexTwfvU2QUn9F95dBAufQcumPL+8Ka3+7hIC00EDi9j2SMvo69TJqPIEjZ4Rt8G7yLz0Ep964=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5972fa3-da1c-42b4-2e00-08dec5a888d6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 21:54:37.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRxr7h4rff1EeFO/FecQyYUjCXMXF61w0Rct/n2VVRqb7m1gFH/dRvUmtjKF4JXuUD/A7DOBV/8mxZEj1/Xu72AI3I4Ys1HuyOk0gVnkXg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7368
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080200
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIwMCBTYWx0ZWRfX8m4R40Rl9vNv
 C3Z5SdHLuZZYtAQTv/XV9DVifvrluc5TscP87R5p2biYEFOHUikxvWQGF7HolrA4tYwSI4SarF6
 LcvEabvSRry5p/FRT7UcOcArA5AYmge/w3uB5zPT1eU4RtdVL9qDUAmMVwcBCP+UFDP1ZzcppI0
 zQAgfNne9S4lSXM5NApw/dmcOqniQeYNVlrL030sSZofYaX0D0TwhsY4Iz4ipsw0xyB7onD82tJ
 ihIdk8LER8DahhClb/dQA2K/NOOkE0SropgNkx95XgsvCHKYBAp+SeMsuikYWPaOb4MOfplFtD0
 /Jq9tstU1qACea4mHbxHfNezwqsBZgEe/RWozbwzB0Hbt7quATM4gZ7EOMjoV1EmJjSSZy/NHHd
 HA7f4I8ndHkxVHqx+ngDMfYhj2rl4cMFbOG9vkP9bl3jcLOsU5LRr+enczyzF8ZjjRttT40fZIN
 b9YsKf1uqRpuoj/OIibmNFO/GNFFnvIISUOU45T8=
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a273a25 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=xy4oZan2cbFDXSxVChgA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12312
X-Proofpoint-GUID: mfAlVAzS5RMpMxza3VEt6pMNW_s1JQdp
X-Proofpoint-ORIG-GUID: mfAlVAzS5RMpMxza3VEt6pMNW_s1JQdp
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,oracle.com:dkim,oracle.com:email,oracle.com:from_mime,ca-mkp.ca.oracle.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8FC965AD72


Abhinaba,

> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen

