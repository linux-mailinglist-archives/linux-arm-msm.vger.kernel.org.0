Return-Path: <linux-arm-msm+bounces-79553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A961C1E31A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 04:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2E740200C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9B722173A;
	Thu, 30 Oct 2025 03:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UssCSccG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CIvfb2uW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3051DF26E;
	Thu, 30 Oct 2025 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761794619; cv=fail; b=j0lIQ3jTDHTtAnO79AFpeTO9Qar8L/uMRiVhTtMpj+eB5PfhFzcildAJ81heBCWbqHmsn+jxmd0Ak/+tAIg99iHt7DhrpyEyCIkuUqIGAWU+wtxwWruxfnH4q+isM2idJp2GQdO21rrSsBuk1Oqb4nZkvf4vzOaTRiLvcyeQaXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761794619; c=relaxed/simple;
	bh=zXIoas5jC9ZsD6HIHZwa4JXPo3/xySBEfbiHulvRbyE=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=XFgUUoyJOD11NgTxp33WE1foCOT+UcVsrgf31yHdFort9zs+sG8HAjhM8OXANsxuqJb/sp6ABN6euW7REtqK0IgdlNHpaBNUfVG8IBi4mCBP4cAR8tBnmnLYqPJRb9QCZDn6y+LBLNJhQEwyuL1ZfjkNWb1lDfapAyi4rUlOuqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UssCSccG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CIvfb2uW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59U2Ycnq023047;
	Thu, 30 Oct 2025 03:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tEFtCHYz2mpZVcDgj3
	W8RApmfNy4L8WwTavEKKPN6ik=; b=UssCSccGaBviEHLMUxu8yxWS9RI37YrFPj
	DwVi20e7ldlqCD/MD/KLiLNMMU6fVVDAdfyAhBlH1ccG2OPHX/4BHVdtG3aEWiNr
	8tc544unY4luypBovRmtThBoAo3ieZOv3zgooculg3uP55pUlhWV85lvJg9keZK5
	DUcMBiUqZ+oet0t4SmcZT2aujQD+3e0/0WJMETLklc0xB/UUX4nxXXLaUDT9QXIG
	ApnEnvc9rDAmpcsPHSurSHpckVL6JrTtcIai3LLVhNzkwjYtuBswNtF+eCAohyAA
	B8a4dFGbu1bQ3KqZqMmhGurnCC2BbZtE97nXzmoBzAEH6dEw02tA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a3ybsr1vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 03:23:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59U0HXGe011581;
	Thu, 30 Oct 2025 03:23:26 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a33vy1d9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 03:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrJNhVazERRsVocroOSHygNjh+fgavhudGFe8ehlfueb0Q53i6oMr+Um1wy37D6S3sfMU347IRVhwODhPzg2Xv+kc5qwBBwQpH45AG9nZOwnm3wQkdjpp4zCkJnEH7aSbEOXbmWOD62zfks1DWz2yB7pP/nTdftYXbbsmXi8a7vxZ9OSGloy6fsXmI29xpKiGB0afNmhrI7JbzXdupOh6VV7if0cBw7DVsBIRJqWe+6Gjn1eqREwaP6RaCiCsnDHwcHWYBV8+6Rd6Yc0Nq3obtlHhhm9V52eg7x9+OgAKDfM021QxWLuwg1RyawHcz8pTM4U1cg/g+PnxlcYL0kkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEFtCHYz2mpZVcDgj3W8RApmfNy4L8WwTavEKKPN6ik=;
 b=QpR5ZzEx3hU51sql4SzxGumXMIWW3Bgk/uUEJ2uEuKkcDXGxKDb3zhCJDphM4eT7Mswm2ECLHyHtiJJWmW+MXCy5LbgceSHeBX07pwcvprFMqGLSF3UQz63mQ+/m9bt9fpInr+6shNr1x17AmnEKcR9F4bBTnDaqrU3a9F8Kay7D3FYXsWMtjAq87Y1D3j9pxSJeN3d759lrXmZOLlK3a3mQNkfdi0j8nTlFLYJA0paa14L/5hWRe0Ef6C9XnyynCs5ZklnpVR5JABx+HpUZApfZ+qO21tmSj+96kUOPQdyrAti59cBXe8UppqaHFNCNkZnrhAQzCLIAI+3Hqdmp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEFtCHYz2mpZVcDgj3W8RApmfNy4L8WwTavEKKPN6ik=;
 b=CIvfb2uW/lYJour1XlMU1HamCSQFFxyuEntnmYEYLvrrDNFmtxBfvQdu3ph8nadK16iEJ3/NcRwKakYsLGWVuJ1o6k22I+VdnvUVOQSDXv7/xKyOSF+UusnqCtPYhIAWszYQkuuSoqBGgHTjLtEWbaCmfjVJ+xdeUwtKZtKSzJE=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by LV3PR10MB7938.namprd10.prod.outlook.com (2603:10b6:408:217::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:23:13 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 03:23:13 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ufs: qcom: Drop redundant "reg" constraints
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
	(Krzysztof Kozlowski's message of "Mon, 27 Oct 2025 12:31:08 +0100")
Organization: Oracle Corporation
Message-ID: <yq1h5vht6nb.fsf@ca-mkp.ca.oracle.com>
References: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 23:23:10 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::13) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|LV3PR10MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aaa203-9f9d-4493-119a-08de1763a86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Snxt5bm1WqRdDN9FTcgJijOAO6RaG6yvFDLzJIXL8RcIVfU57xC9pvZwOP6g?=
 =?us-ascii?Q?PvKF6Q2nYyvUSqBpVhyky7wOg3pYjIOMBLuMcldfulOXXALRQkQTHfWsTDmL?=
 =?us-ascii?Q?x6jbzjNRGFol4j9KKt6SerRJlwT46R+mBqzfv5b8bLVRQCj9BuCC3kF/EovA?=
 =?us-ascii?Q?QtAEMqIUxDGbMGRE6EVLVdznnEbIEg+1qlmtg3SAYr8nHRSL2DIV02kq2DF7?=
 =?us-ascii?Q?3huw9XcCCHJbrJBfrIEzeP8OVwW/lzZmlZgToMrBya9qT4c4Z35Al/0rWp4Y?=
 =?us-ascii?Q?fo1C2TAfl4pEbr3bi2AQvimxNO/CdAaXyi75MDShcpzc33ziLs4ObUXObYC7?=
 =?us-ascii?Q?lL0sfIFLXY/uRsnPRLecFaboHYGYoxuCAwV7kXyau+A84ebUA1EzG8S4MMiC?=
 =?us-ascii?Q?QOvOqsTRmUFj7D7t1KMdolbe6e5mnGPR6hUPe3Hkcd7YqS1DYp2zcB1XoKEd?=
 =?us-ascii?Q?I4+WWxpnfjqNEtJliLN5x2SGtKTVMW96CHUujwV3fRCzKYScRRi66YC9545O?=
 =?us-ascii?Q?9eJ9JHNx3X9O6v/TpRWPIyVsh6r1kYVk5Vy6+N+Rg06K501pNfWvWvdwc4zB?=
 =?us-ascii?Q?O9BdnSmkB0+zfSo7x3lWG4Rb1RwfWGVWLciCPaNlFEF0fWMLJacIcS3Jv2rD?=
 =?us-ascii?Q?GoBzTfgDDgPxsdKF7NVJdnNgAfzvad0y2tajjbDeT5cjXooJR3hT3JGhHOQJ?=
 =?us-ascii?Q?GZbDxVSxtMm+WmAVJKmbOvKZr3da5rWbEXs3dKaOHSHCTiKnhw4WNizRgm5E?=
 =?us-ascii?Q?+QeiYVnH7OcDVsajFb92hejFmSlQ+DA6pJAhKj2K/bd3u5fmADdgYYfZSN6W?=
 =?us-ascii?Q?eHXh2fOkexzC/CoUXgutZJlqyuUNvJhVlu0zhX6reEcCjhiOV9whQ/xCeBJi?=
 =?us-ascii?Q?uLC28di8/poFclnL2FIuw6LRunEaoNsQIHDD8G8fmSQGg4iDc8ZbaEYcsMvz?=
 =?us-ascii?Q?OnzxaEcsiq9e8wgitWpHGBMlnT0a+e6iCRKwFrZbYAHAuc8ynOGV9lQeRQ52?=
 =?us-ascii?Q?XKW88wn6iIs84PqK8OTlqbvjHiSDfh5EQfnDWXI54llX4mriHAb4MbBshaIF?=
 =?us-ascii?Q?rhVGTRNLjl0AKY2N9OkxAe9/rOJVMMthYLBRLAlly4q1mUPhU7+18IRiI5dQ?=
 =?us-ascii?Q?SpRdYE/J6yvObAE01udz+8qB6DQk11H+3Ilz2xdoKv1ouu82Q/vx9YGTgmwi?=
 =?us-ascii?Q?mF3i080npiz6AfDO0YyyKSq3jhQ/7wKk7DU3MWfNMfTa3qtjZLrPh92dWzAn?=
 =?us-ascii?Q?v2uYn/tnGuf6NMKCSdCdI9uI89JcfQMkdnrnF4GafAFK3xItNaPru3m1b81N?=
 =?us-ascii?Q?W7gUHSPSH+BwZ/nj8FJ0eOYvIxMqAETAblKKXeVwAys2YLmTxjPKQOLR5qWk?=
 =?us-ascii?Q?frA3+wQztgOHlpIgL8Y+TiEKpg6RgxwVquDk2tPpVgQdh/qBW4HUaN/kTRTX?=
 =?us-ascii?Q?/7y+MFzze793pqz9WJGv89EYa59H4S1l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4cxbCH0aZSnTe7VnL+g12ODKnRI8U/n75XguFhppcLDUKq49FdyVtoj/xyy?=
 =?us-ascii?Q?6OguDUYbjMrktnc1ImB+It1bC4BNWpE0ciNxy+vwy1K7WWgGJ2s1pjLSsLdu?=
 =?us-ascii?Q?ZvOGxazlwWkcIjIIC7/iem6ReJJna8oJuCRM2BFgccMWQhfcTJ2b3J4bxVa1?=
 =?us-ascii?Q?1H17eqmFC+IMx5xToa1uMwwsmCN0TNtJmGdyE1/h+fiyhGcHYxLE8SZNJ+Z8?=
 =?us-ascii?Q?fHV77pfY8BuUixQjAwjhkin5Q7mtSVDJCkBmiK1UGmlS7WLZe+nzqiD4zkVF?=
 =?us-ascii?Q?dUdOhLCTi+nbQUO1Yki1wbAuw+Ve834NAhV86c8VNiU6/gNDXd7mNclU9Mjv?=
 =?us-ascii?Q?m0wLnl2Fhm30EXTBN2aaiGPKM4IA3ZSlF75PFeAijxOZOxI0U9QGtJ7m8Thn?=
 =?us-ascii?Q?7UCyqqtKCM7dlNj5M1MYN23Z6Q457hnw7Ae3mney2qmA5lxQzX94bGVwM2K8?=
 =?us-ascii?Q?0ZI5vvEPIAgOMGtBd6iAXNTslm07bbQqzcoy8QKbOC9G4i3W446SKj+RrVIb?=
 =?us-ascii?Q?PmHdGqvdbZkd+xSwUbZYeU6hJUXxcAFTtfA857cZJ59PUF+xpC1g7l4TwwdZ?=
 =?us-ascii?Q?dkWtmKRfJ/PQ40CxdE6zBNSML4AN8AR4GQavSgg2KlLKrvO6OYOlwlLG3geU?=
 =?us-ascii?Q?fhT3Nj5qju7ES6anHw+3wdO0pEw0BdxUyeD6I5yl/r1DFOEcy6FlDwjpe1KL?=
 =?us-ascii?Q?PTIry+Hvy2WKONJZlZQsbetmxedqPC/vxRc1VehlaoDe69Ev/3a6gfB92IEU?=
 =?us-ascii?Q?djlEzhyu7WN+m01XqDEArfuwMGsNqfJrXXywWzD2+lZxJ0nYd65at7iheWkY?=
 =?us-ascii?Q?MR0phlVH25NfE/sfK+8m/0fAiy9+g8vbw3xwXAuoZT/Fh71Q5Mj+qI3Burcu?=
 =?us-ascii?Q?pAAD55rNnr5BhJfaQij7ixsu1/amFaZTRH33+QlXjKVq5UViIZH/rbQfVTyL?=
 =?us-ascii?Q?ljv+cVUe/lXIFIpR7JczbRlCX2+4t2jqr+DeijrVgtfoqtpRAfzSnYv4Ynjp?=
 =?us-ascii?Q?1XsaDPe0YqZG4PHDV/t/+kindKXjrtprXW3pCAhs5tnv6owWnyLp0B+ibxPU?=
 =?us-ascii?Q?rqNBGAjIMUuZumB7nOoaeRCRjd3XYAuoC4LXKbWikSiOQQCSq3JfKD4uuP1v?=
 =?us-ascii?Q?iR/ZlRPPKQdgg5NMqa71nQ71YmRw3dBphmGKmVwLTQItLC51lu6iolG3HnYv?=
 =?us-ascii?Q?M6lkK3JF19O3hy6742Pr/11JX6NeCqEoJkC0C90nKuoJqQBRLomUzdNPdKua?=
 =?us-ascii?Q?6flLS53q+KR0/1oFH9MTlXtMmWZAVJS/a7Eqe2mfGgOW00CsrhLrOqvnHGhT?=
 =?us-ascii?Q?VmdRukGdHRIBZH1IsfnuVgX8k19AyW8otZTEJswvtGWVDkH4giuYe4cDMiEr?=
 =?us-ascii?Q?nkX//38HslTYYoavJy7D6JOhnn+n75r4/gT5YUhBba+jFk0f2stTZgGlP6Vn?=
 =?us-ascii?Q?EfYU5Alt76dvq38BZTReLvV5bs6SZqpfm+5UARCAywskio/DcqiQSOMIfjH4?=
 =?us-ascii?Q?AQn3YmiyhoZT/ufpyo+eI3eLFaeBJcCTxqLVTihlhe9hyMnX2e41r7s31e0D?=
 =?us-ascii?Q?XL9qV3MPWRURlwV7kv2BxPbSjEfytH3qHE6w9A1lg9pK/jgM1LyZX94RJX1H?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GJg6DuyqmhXAPjILxI/S7cVrajLCncPfvC6f/TXIOMMDY+2su/1Yb2hycZluuaZjaReUJrP6QuqBDSQ7ES7HugicJ4KgPph5uo7LO0VHOXoNyshXyMXocIS4oJLXMUgYCiBNZvBJ5YUnNw0GAracGWpJ0hVCWeTOJseRfMPQ9rmkU843dxkYE8YVa9GtWXCSyxiRsI6cfoAu4IevQu7PP6lQ+XC6KWv0D5OQS9pIKpsfCg+QkNnbWLboRB0zRovGWoX3ykKkTBXO18ewdHplFUHSHT1FRUoacmlH/3BLXPWYp/tg8AkmgsjiL8TV5rXIx9giGFNRIRKtsl1oJvTnW+xTL9yiOkK7YHY2qn4L7hiAo7w8rHNkaPuhMTIS7MNozZUO4eDYTPdhAzzmb//dTUvz2tnIGaGzM+y8vnnikMFRT3/7Ox8yXDj8LAbOLs+YITuu+VouQcauQlHBLFQDvvlUTXCVwj5R3KkKDzPUmTI83Mm4lw5SsXIVsaLGw1ViSQvlndzGG4a02loOKwKCmv/UcksGcotvvfFJ72C8Ar1tO9cmerSBWiXRKZ+vAwcOs2uKqDo4fiuddJk/jKQCvPHGjWc/xQvRxeJJ6K7xWno=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aaa203-9f9d-4493-119a-08de1763a86a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:23:12.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1byhx5PXu8a4XH+CdIjntSn7y+oLzbZUmMDaenBXBkYndJsvVXcuL6z536wmErCuXc6p1mXHrbjJfMPJy3NF5KM5aRJIjfGEEhct0f5xsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7938
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=796
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2510300025
X-Proofpoint-ORIG-GUID: nZ6kUuuzmNNfTOB13w6is9ukNeSxusOU
X-Proofpoint-GUID: nZ6kUuuzmNNfTOB13w6is9ukNeSxusOU
X-Authority-Analysis: v=2.4 cv=afxsXBot c=1 sm=1 tr=0 ts=6902da2f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=APdTsy1mPjVvL4qEmPYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxOSBTYWx0ZWRfXzSM21g43O4oN
 8oUOlPcnrz/qE5zWp1vZKGvNB3uQsrCPVpUBt139doM0jSUdSIERV8gMTi3m8fCZzXF8Ld3L1vR
 0MdDceyNlMBSv8RHR3jf/33M/+9rO9nb6O5f3sB/8MIGM3rZIG6cghhFsF6FCHhQrVfDq7SBs+d
 ZplUsrL7+2nGeTBfRc3oHYesDq4ldQdAjYnCaBUlT/3zxPkBPTowGyt9dQmt8SKb+3cjD8Rh5ey
 2vqJQgJbDoFfr5b0ZzoTYeBIhP7E5+9trEb9HZB6xG7K0Evky087+dQNhbVoGBOI5vYWrP0xjjW
 IEAtEYiN8qVWTI5YHCg8Lbq80fSLdbHIPWW4UKKbR3SUHOqJarSe4N8R6mOHbBXT5kt3iCEiyUp
 i+PRWxJFCj8bItG7wrMWX6WZA0NbsA==


Krzysztof,

> The "reg" in top-level has maxItems:2, thus repeating this in "if:then:"
> blocks is redundant.  Similarly number of items cannot be less than 1.

Applied to 6.19/scsi-staging, thanks!

-- 
Martin K. Petersen

