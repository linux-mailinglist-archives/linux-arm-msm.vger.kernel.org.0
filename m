Return-Path: <linux-arm-msm+bounces-97772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HKmHIy1it2m4QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:51:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDC293AB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15D9830072A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7D8269B1C;
	Mon, 16 Mar 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N4sjvD2p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rSSUWRVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D1613A3ED;
	Mon, 16 Mar 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625623; cv=fail; b=h7BKFAp/mKRmjHTlMTdaow2ngDXq39Hjwr47cAY7hF/sTrip4R+Ry7IBaVVue7a97vdzlWWDHiMuvY8InVqjcBbqXk7SSuAVViJUHqlhEF3Ll0ZXhk84Kpv0o6K8jQP3fyHPxk4muIxFG0gz52YorER4KWi1i/oAyhZgHAlI790=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625623; c=relaxed/simple;
	bh=thA3r/pC7CuGvI4LsmYs45UngmJDendidDDLCGXj7Ew=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=BgY2+f2bFYEzXhFmJMo0UkMPM8/OjtUOS1eSfwV8GqD6DF89OvxBLIc2RYS+iid1kKZQRW4VPos+uXSequpbmVEINsJESRvOzjznoJVCASKbx114pRduYvco0l9urOV3LDg3w70eZN4RIlhyN3kFf8j88i+61Y1Rorp/cktVtRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N4sjvD2p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rSSUWRVB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FMvhv7713267;
	Mon, 16 Mar 2026 01:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QDa48ODJxHTGWv5a5Q
	BdLBiKuz1jnfEqbVMCVwxNPkQ=; b=N4sjvD2pgSyzV7UTUALYAW15xBzHTbEs55
	4Qxk8XBJzOg6RlnrqT/I6rgyQQo7XdCkprvBHVCRVJre1RhLEs4jT++BkQ/+iBKr
	FISav9bAR6QOz0Rgrj7Yepsv6VvUj8voLOiwX0Q7ha/xOoXX9nKzOT2BsBPu6DAk
	LVSz2/YnBfyIvrnaPe4J3rHA89mJ98f/IkyHkxajKHKkBOjR19/cuqdswKQu1dpL
	ZD7+eGymaExEYs944eQA/QXS0bVnzk4TZ6QV5XYPNubJIhoCHmD+SBDyTpCIrcOV
	OrBM/x748mPPF2X8VrypMcMPaEIJ+ujr3UnUKWFb3UjS1K2aQgVA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvyj61b2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:46:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62FLQDXX030470;
	Mon, 16 Mar 2026 01:46:53 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4808bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:46:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP3HkPd5+M92OJHDl78ILpAQOR95gGwtG6b1PGqq+2LBgRhojcPZZWJvMxR1ew4GTndcSpz/Zs9GOuCp6Lc2Y0jxNiPyUl3rfrO/5PQSWIB+HAfXOFfd5LFV5ru8BdhZuH0x6L2TeGYjTH1wtakE8MBFXh/RUmhUND6tWbP5LJYlOV8l0UhHuBTwFf1cErejjpxnYVd5iVSGCRSa5MF/s5PkjSdp6kkyajmc895Gv6RTARgbGpOylmnt2feZulzMd11yVcGJplYxxHEOouC6dHomz7ko9sZVmg6Ug8LFibYBlzhPeonum0xA8Wf0neIN9dY9pP7DyD8YhHKfuEUnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDa48ODJxHTGWv5a5QBdLBiKuz1jnfEqbVMCVwxNPkQ=;
 b=CqLfBijejrtN3WUjLcdi22H6g4N4GUOC3eTea2mZgEA+N63WCU3XlZ+gqizvnndF50ahDHJeTBFiA/ewpIlsv7EDiVTw5b1UeXhoxl9Rgo6Z8uMIj0H1gwZWjYxIPhpajhvvhROmeZo0TivpPNDQlWtN2hmGZPaxK7k5ddEIlTx62vFavhn4wER+JeO1HaUJukiRdhZQ/3WstjdHSMxwIfGsgi+cahcBSOM6K1sAiUJUGxHunjZILUsG3DiVx7T3hqgpFbgl9/bLpFvau+1ADgmsc78pqhXcuPqWkQPE/0WqAMxpSvd6x8E0fwElNYF62X2cc1uE3jBSV9RBHAqQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDa48ODJxHTGWv5a5QBdLBiKuz1jnfEqbVMCVwxNPkQ=;
 b=rSSUWRVBsek5xHawGUL9Xyjpbp7q4cqddDxWouFZzvBFPlyxCGMeuks+7EHP+M/3PPUGUPcYm5SznC7ai6vAKEu/Ypb7gjZHGaNgdYYnBZNzpQcK0AGwIcGN7BqeRpyvMZk8Lumjg54HHcZxrMUWVCQcFIUb3tDraO9UOaKuh9E=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by PH0PR10MB5660.namprd10.prod.outlook.com (2603:10b6:510:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 01:46:48 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9700.020; Mon, 16 Mar 2026
 01:46:48 +0000
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260311-eliza-bindings-ufs-v3-1-498b26864182@oss.qualcomm.com>
	(Abel Vesa's message of "Wed, 11 Mar 2026 15:04:04 +0200")
Organization: Oracle Corporation
Message-ID: <yq1ms08r1hz.fsf@ca-mkp.ca.oracle.com>
References: <20260311-eliza-bindings-ufs-v3-1-498b26864182@oss.qualcomm.com>
Date: Sun, 15 Mar 2026 21:46:46 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0161.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::29) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|PH0PR10MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cdc6cd-d1bf-4848-7fe2-08de82fde331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZNKIjcTpo8pPhfBtbXrRIWI45IPwAwnTs1GX6ZKhAE9HbZJUEDm2+R7WXh0jvwvNC0tXP2sp+l1IT5nWt41HURIrxywoLONispm0kUD92SpT2g8EPGv6ORuo5dLnrdfYHTOSPXv44xeq6L3oRtMBfeHLIq533bVrPEosbTshMkOARp7wkR4nYMCAX9SlqfKV9dLauUonRyx2ai4T6lIl5J+Nsfeex/nJvzmk349/iafhEL+ABC4WrAaf9d/R0gvaLaZmV+3AMtC5IBBksIwNsl49ouecGs9Fv9qFcascY8qYjvZYz/DjTKPpm/KfcuBFbIdyNCOnupGyGr2iHNIfGEZ04P0T9qlrPhVQRgucKGmlwZaS2vbVK5jIi9L/60NA1R+dCgXu0fqONm5cJatx/Dg8dM4spDN2muwumxinzg/TUgnuusoeRRnQwtRmIDXY+GC1uQPr1jG0l14bMN5Qai4c+gF3HXCYLPrUyN0kpur2byEfDn8vJ+cAFwsjzVvncl3PKueIqHeipaC+d6/Mo57i01N4xcK86dPdZikTh2F99jaVgtzcCQLJ7r9xOudLUBUENuUNW8OO4WPyT9RZQHuVU03ehCnI+a+uzwgptnuyLUZ70UyoCOs5lJ7vn0rfBIi5FgNqFK27x2mcnleNDGk4FOnIt1Unnajn/YZ6MOSz8YWsT2pfxipAaCfj1f6PfuZmbh4vW7RmBtcBcAQpcSWy1AFZJPx4BO1D/HplL5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fSejLuSc3ByDiTZv6ken/OZepdmluSvgHxrCLbLE8Je/sxMrXxQDf00CdvaB?=
 =?us-ascii?Q?Cb5zdZC6mupq7lSRIdfyi3os5dee1svdM7VDsZ/vp1WRZEsvefLzJ++7mGmH?=
 =?us-ascii?Q?XomIbZYJ0fgTHETU5mevsA8g/702c49NP17kzxO/RHmDdEAEfBQCO95c/5hx?=
 =?us-ascii?Q?LqbuObsGfKaVDN6W4rpslYGPP5oi4WUbOABaxxJXi0Dz8lKl7+z6Wm60g01N?=
 =?us-ascii?Q?67D8k0+COQrsFEc9UDRvYDvaBBjlM1O4hTMCPVQdjiYDP9lHDJf4zwrZgYfl?=
 =?us-ascii?Q?na+gBHFCL6/RY/hyyGX/zfC/M7aUaHUCr9AcuL/DwVH2wArTrgkWkCdDunp/?=
 =?us-ascii?Q?NXHL5kBxX05JMLdBuMgIm3rZ3vF9VJpScfuUbW0B1A9J3B3brVCXFo1NA0oO?=
 =?us-ascii?Q?uddR4KFEpPzyhZo2rYLKYLUWKbFU0FzXib5mCccPlfEu7MZ2ONVRAfmH/sL4?=
 =?us-ascii?Q?A6TMjIhivCb2Fl7mGOEe6BkM4XU2NgR8kerqAU0nqJuUVgjW12cKO3RvQg5j?=
 =?us-ascii?Q?BZ389VYzYXKDHEFQqJSmKT8RMbTRL42AvIFOoiwhpjYxOUK8zgqm+4SCdzs+?=
 =?us-ascii?Q?etjZydpe2Y5YcgHY9M8SNRz+IkU156C0/4yhOQJCMZ6JDdGf8sYWI6zm/cF/?=
 =?us-ascii?Q?XyIktA0+0ZE8GPeAXftu1ywiFonyNUF6vp3rgjvmSiF+WipNQld6pFrb9e4Q?=
 =?us-ascii?Q?WhF7Ieo4MjpKd1GXQrRItD7Njp7Odjq9kAOaWjONbnr0OOvjyGTBVvaSdn2q?=
 =?us-ascii?Q?zuZiYkbWuXG/yQEHWzXDjJgS38dMTtAZ7/rbMoStJiV9wFNzkWT8148Fubez?=
 =?us-ascii?Q?XToWEpZHxqwWDfZ9aQyBKnGVj+wzSoHeFSaNv05AxlQtjNJI7X0oOb5bJQdF?=
 =?us-ascii?Q?/K3s5ctRkPUhzbmbzK8zygtidHfsGaP0gBDVKBP1pqAHPYfDCGGhvE0/mTvP?=
 =?us-ascii?Q?4+XImyuLfFhDFlrNrzVjKO4NZtVZeFrooB5eaOci0xf03tC7lIztzTxUOFqv?=
 =?us-ascii?Q?uL520W2Mg/UujEgtzLujcmMAz2cFtEWcNVumpwir9QlJC+Cj7isD2kil4lmE?=
 =?us-ascii?Q?m40LiBu7BPkKb6sW+7U6Z79OvcdKaVrD5WGfnL9ZKDnZaO80FCHvSjJuCjM9?=
 =?us-ascii?Q?A+kNDiUOgIuTL52QjXe/2tActfQmx4hw6tdMKkfQhqeptnoAZQAVou5lAw8N?=
 =?us-ascii?Q?F9DqeCDWY90dnOtfEORFGbCg4ttkWRAr0rpzAuj6WouIHB2GeMjsRBGFMkZl?=
 =?us-ascii?Q?WWdFGlgNl/DgvvUW0WeXIM3FY+XdrGI8kzsFCYFT6YFmGMK1M7pSsNF7J/Nj?=
 =?us-ascii?Q?IxRTwU9qLn7++F02/8UjWcKKg5SfgpP9JfhfpDLDPB3Vdtog4VnULwtQMCy4?=
 =?us-ascii?Q?dRsdb+sPJlwka2oWchafpw+z0edpHDyuqLx5F0UTBPMR5D+ocsxG91oXIf/6?=
 =?us-ascii?Q?OKg/ppVl/Vrm/61Q47yXRIJ59N3RwNnYyY+h0kVnAy7jWIxmnj9sjuvNiYgd?=
 =?us-ascii?Q?IYFHhsgdtkf6rF2g6tWL3Mql/vjuoKnKYHTZb8NCFJ3vO6OOprbH76myjHEX?=
 =?us-ascii?Q?EKV/wkKgWdphrKO4+eF4sUyVRqPJj6fJ3PwXUsxFrNdDzHrD2jEaoMLVSQIi?=
 =?us-ascii?Q?Z15Xc3T4sYkUq6wJQxxJlzWKRusbYJQ9Cy7e3D2pnqrKq58ySGzo0H8fFICb?=
 =?us-ascii?Q?wUi4qHmjmYXeyLQLuJyoHh478j1vA+jwYJ4s2M9JmHl1DL6XsRkd3Eee867V?=
 =?us-ascii?Q?M4+vMp3vURcUxuEDvs5+4bpsu2MxNXc=3D?=
X-Exchange-RoutingPolicyChecked:
	Z91l33+2yoCkfuK9xcvXT7zwOn6s4lzxzzfbB10yKqJ/WA10yRA81qaEZ3qN19Dns5gwlxH/3nCS7B8Md0a9Dj/iOnN/QMtAM+sE3CSjr5BH3wgL4BqmJDiURAiNrOFS14CflmI040XvcsreUpHGlU+YYec/Q3SsQ/VIfOpPl+OrGpV7PmEKoL7l+BPcoP5oqYT1jtLAb6ifVP/ptxEoZavotbaZWATXD76pDvQKSnAsr5DeUz8LiWPSUQENQkO8vV7eBFMZWQ366VshcRZlQgQX0STZoMKWAAfr1Cp6acPlRfsrf8O69BcrGZrxju1yNPq/1YwTzR3p2fjDLRM3MA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UtRQLsxwQf4Yus5uoFhsOD/P6ctPMqDvubj6TELSXJRDslpJ2a2YHgUe0KxI/5RwD+3Ly7RUu1GTxHU3a6RaE2JCRaaoZyBGwgnZAeZVBaCze0sFp0rbpAOQAawsuATjY/d1izJI3WNPRwCOh3eWmAzn5+M4zhU2r/nE2VMlByKtZ79PkwTNhv1pmy4cf7YhbLAbVyUURvJ4imTs5ZOjCRpmulEIvmQHof8x6SsUK1dIZqitMIUWMZQV18bx8rtpTfIqcNRbhAzqZxIY/tSzLign3WwUh3n0jhOSUycoCk/SXf+KbUJgBWQ8p2y9x98TvE4hv1o07dc+0bywm+R3uXf55BVayY+1I/a0bOfmMuj0durI7pUko9AL+0kpk4Hp32L6BUoi3369izVuALqWxrF9lFsoe0Ihj2Ce3Gt5AF5abmy5JZCHz9FwW23lTTuDeBfZ11USuOnFYjBJ5CRNFe389MiaXKx/obN1XrzydxtI5uAptQSKbESZMxhRTdJBLm8tlZgSYuKIWJeDyZL/yNKY/WlffhfKyz1c1QYtfBpgbgLkcocr4qqWWRosCEIgk2lGgMXyEqIXqBzFrqvBzv/yqELKnN5jlbpbsvj0VRE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cdc6cd-d1bf-4848-7fe2-08de82fde331
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 01:46:48.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3u/WMypTHuDZeT13cmyDM7HFwgoQggI2XeOuXISYkAhydOwzDAtQyRtZwc6ooJ6ca+eXIuYXTmApogSQw44Rj+/NRdQWAdK2dDOGwM73H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=811 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603160012
X-Authority-Analysis: v=2.4 cv=LKFrgZW9 c=1 sm=1 tr=0 ts=69b7610d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=8_KZ64PC4dpFt_kjVC0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxMiBTYWx0ZWRfX45rkmAslgJVT
 1W+b/gqs9Lnv5cNJ67XTTzqu0ScoFXA2imTlVhCsNSgwRJsgzXZwbilehcqJDZarIgqtgdliTWi
 uq4+1ZTIKXBwO6Qd/cJQPifg3pcvFSb/uCzZzmcYsI67GYzMZEqTG57trBMCneFyZDPNafknQoQ
 YrtI8PkW6ExBY92pFMTkUUQv+toammuodhOsa4rf87Yky8Nj1U3pcAWo4XZN0wDxZzCmKkiJ9OI
 lxcqu6IBOqHoG2LJ2ZUYTBilzF8YQ9awqaKKA6M4qH4nLJ5j2VYjddBOXzCp+nJnFFOJYgHf+8A
 VELdx7OW8opfOcNlYh8GV5EcJn3ZwTQ2F2+svYxnB64WtS3A8Udr5LdTbHS4pUcYCwnXRP5DTt8
 +8Gsfsf5ewHrHZrIS0lzslrgSWAkk7jczayWCSodG53E5W7A0tgJSzNYMHRDm6rDUgb8PW6wiCD
 GWTId3FUOtvDznfgaqA==
X-Proofpoint-GUID: 0LEuTbtmUNwzveBILQQ803_yXHcMBuMM
X-Proofpoint-ORIG-GUID: 0LEuTbtmUNwzveBILQQ803_yXHcMBuMM
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97772-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,oracle.com:dkim,ca-mkp.ca.oracle.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8ACDC293AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Abel,

> Document the UFS Controller on the Eliza Platform.

Applied to 7.1/scsi-staging, thanks!

-- 
Martin K. Petersen

