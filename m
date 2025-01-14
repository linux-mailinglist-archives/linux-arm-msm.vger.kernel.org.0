Return-Path: <linux-arm-msm+bounces-45037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7EA11152
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6D21884278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A92207DE0;
	Tue, 14 Jan 2025 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oDOJLN8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8DB2063DF;
	Tue, 14 Jan 2025 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883857; cv=fail; b=IXsTar7EJKgzQbU3KO/6Od/5eb7+JFqOjm/5FMM1+8vUrIjjE2rmNAe/B7L2jYF0+zSLed8f9JkvFT18kKp17GOP2hVExMAvTEWxU+NslJZFvbVogu7ViNTt0eVC4ujxTNSy90qsE3na5Tyajo9yNIvrMP5Oqarn3L+dQlhskeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883857; c=relaxed/simple;
	bh=U+H8vyqZiWxtOBtmM8T8ax/x1Zrn2LmNYo5I78xLE9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uUxaa6cUYSI898GRkxCguxoXn2w1OQLlW0E7mj1NBM2EaUY406VgXFBtOS4kNbpXKFPE5j3cz7+9JVZVvd6+739Oz38Q0cGF5W22u1tIbfcBf/Wxm2NEjoRKLSW2XhWmuotpfg1jXfcT0KIyLfZ977w3Ls6s4P1LenvFox3k25E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oDOJLN8t; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2kggz+4r2zahWjn6dyVUAzQCXHH+cV3dIyQlV35UQpfVQ+0CG2Vf37f3HuB9kNHPt0EKXkVX3Sahal9F+CYU2I67aEkI4vjbrpR0Ru/KSqkD2wvVYQE79++z+1ieL0rUlJ9xikESB/2nx6YSaH6n7tRpWkWzX59soxr7kgpWgNPANUj+eF00AfTyqIHCyzvOgg50hJGufOdu7vgP5w8aGEiRn/ueZ8wHtGhGRcxCv1yew1CWqNADCgXkH+spbcdy5Mghonij19G6nXfY6wkmwE3xhN4JrU8dGnosDucKDKlkLkpyOfrsM9S8utDOBly2Rjw7WTF1XK60GNZ2g+vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/dz7QBu43jRjqxqE/oM6KQLNHoapZZJxKUWdqITkkI=;
 b=faK6HPs4qiFN8UX+hUVms1zdA3MRxzJB4WsksdH3MIkuVHKYP4xoZe1QFrCJMFpYw+rvr5lJnBZxQkR76LpBrL80tbK6hQW4T89kkHSwO1x/SZdoyqgvsbL+8UPf9gRqQsZ7bN1tS2z8U5JSIlM8idcSes3eghS40sEWGHeL9j+BURIPiyQwL2iCRSuSMv1oaOC8nNgsI3K5hOPAN4XIpVZ6YcW/KcaFR3u2zFaKceXeweymKjGAL25HR2co9VXS7+3jDZsrk+CIWRU/l/cBRY83EchI3LUozVYys7KjS9WqKu0ZgFSlCG2GYbAk8H3ZENUxMCxgsn/J98jsCLKfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/dz7QBu43jRjqxqE/oM6KQLNHoapZZJxKUWdqITkkI=;
 b=oDOJLN8tKdc/o0YWE4LZUaJPlfYnSHM7bgB7O+q4I6MVVUYr2+8nvZS4UnGHZyHSIOJ5NqjJ9KjZ094ByQYNwboiiUFOtAQZXZ4NfV4murmNbzOTf8Gyzh9nq96hwUBCgN8OBZNPesQknCUE4q9EhHZKhx/O1wfRIfTlkUmkaMEd8odsx31Xot+9xlbWCswyAyVbXNUbzDcEdQswO1Me46HLlFg0VOYe0umcgeJ2lwsHg3POqUA3s41bF0m6Si1g9E1IPkjIoIFLREHoSoTkdgFfLSiQ594fU8K5tCRkcAl4huUSN8aKfLPmQDeQJSfrigbsOzK18voPNkZq3RNENQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10936.eurprd04.prod.outlook.com (2603:10a6:10:588::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 19:44:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 19:44:08 +0000
Date: Tue, 14 Jan 2025 14:43:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/12] usb: dwc3: core: Expose core driver as library
Message-ID: <Z4a+fyhInS7ETgKh@lizhi-Precision-Tower-5810>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dff71e-b75c-4ea9-4d85-08dd34d3cf70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xvqY+FU2R751QD3L6CZ8AfYHUj4kIv90qP3hfwRkGE327cWTL9ZzuCud9VxK?=
 =?us-ascii?Q?cHQ0IrIpuDidZoBBrFDEVXmSq4eHknrtB3EClg1MyjOvPyUK+bV1KXRpSGJH?=
 =?us-ascii?Q?hIOozXh9r9lSbbkoTqscrrP7Y0c6cS1dPW1Au6840SjMquDEL6LaJCYXXoDr?=
 =?us-ascii?Q?VLSKf5QV9WpUKoz2GOWAaNUVBSvIBh4kXP274AqxS7+DfO2dgrJiC1kSINe8?=
 =?us-ascii?Q?HDKwFRY7GiMVzDqzvVwg8JbYYuVsTE8y/loa3EYWd/WVyYbAmrM0GMGG4dq8?=
 =?us-ascii?Q?ynYdNkTjZqe6tBkioFGjRitxrG+VeBTkl26v0D663btfn8zMIh4ZR7i4QK0d?=
 =?us-ascii?Q?8IcE7LfVZyRhWFZ8PZx4wHirLmRPvYOTzYYKIp7hxKeVCHSW3mEmxXl/nrSV?=
 =?us-ascii?Q?tpCt6Z9FdoL/ar7K0EuNx7TLzdcM8ZcVeUTLOBKPOJ8upAONaULiaovTXzD/?=
 =?us-ascii?Q?I186dDkQ6WXWbKkZtFfBG5xjZ9bXTfTWCISEOUlTe7Vw4XUXazo1vTvX1/Cg?=
 =?us-ascii?Q?zp6s5woOrIuzH0NX2o0hGhgJ3G8opPTGLMutoB0wiHMk6d3b1PaQmeVpZAfr?=
 =?us-ascii?Q?qdKoMzn/yDh9eamzWev3hb4SGonLs4Ya+DJJk2ORoCHgiaMTxQ0FcdPPlhgi?=
 =?us-ascii?Q?j8/lh49LEUPv5NDaBJr8F6Sdjk3DyH56QgirjnFpfXMcBjoSWlvM38cjb65G?=
 =?us-ascii?Q?Njgto+Q6ZbG8x4EA2ehCePba8ftjM+gLV6M0RS1lV1PEy7I8+BZ0EipVA+vQ?=
 =?us-ascii?Q?YGp721vuFU6Ln+ny60NaVzwX25mYMLrmvbd/mul7lj/JD/NKWmcJ9iHbiQ3F?=
 =?us-ascii?Q?4nPWDqdiE9cabc3EB87+aqO/TK3yth+cewCSbJN0IUjffjhulAMfLQ/8DKmx?=
 =?us-ascii?Q?oA/xVjhhz/3hK2HCivUKdSIsJP3zExy4dQ/rgYNeKSPhTIMprO/rRJuC33DO?=
 =?us-ascii?Q?BpODREpa4vm0XSPwUokvYijsBCIM9jntQIde94azt25ehcycHxtcfdlcmTnE?=
 =?us-ascii?Q?O8ENijKjGLuuYvUnxyvWa1dJbQvbTqwOr1hWp7pkTqn2p+xp+VPFeFMV97Z7?=
 =?us-ascii?Q?SwDlGBMITyxJ6BdK68iYagTMzLHw3CCmSyIQpjdOB/sFn0jE7xwEeW46zVCs?=
 =?us-ascii?Q?Z8B8W3VSq6RLZs+tIu2A+58HZIbRnnIR+dr1jZ2FR9g230fkRjzLmY/7Qxum?=
 =?us-ascii?Q?swt7p1Eq9KPAuOEIcH5WhPEU5W6VVTmtzGeHVgo2tUajiqWcT6LrJEirKKb9?=
 =?us-ascii?Q?vV31XfmT8bv47OQM004m7XLwDSpGMzhFiexPTp6hSYIV+qdF4kv9jk43OUKO?=
 =?us-ascii?Q?r8RAX86ExdnaF1KPG/V5QtG/cOtSevCktsMOOr2bgh9aWdURCFnyME6U7plC?=
 =?us-ascii?Q?xKDbtMCZD2RYvGMEu4Xa4RGX77oGvvLjnx+oKiXflnQFIpJ9Ie9/5tQm8/Sg?=
 =?us-ascii?Q?sFV7lHx8QchPSxGBrjVK5zheam8RtFmG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aVpeNhacUIVc/JDW3kpz8Qn5tIBbux3hOi9oDTzjA5zl5v0Vf7dlKG3AGOUN?=
 =?us-ascii?Q?r/ILwvszrJdx7MOhh8USZDun1cWRmuDLxwmizN7IObEZhk0JqE09oeydfyiJ?=
 =?us-ascii?Q?R4/c2NLuYiCA8xUjfIGoRKhsYxq2Ps8HwfADgvoZWQEAfRvrGE0RvGxlaYDz?=
 =?us-ascii?Q?5XXLSdxXUiBmixqVY7V6LDrTl+1mRiP/rEAs3b78HyAoqgO28KuxFDlHSQkV?=
 =?us-ascii?Q?giI1m5WOXNbq7JhiT6Bcp8iK4LUm0C8Na1IetzGLskyF+C3LMuVa6oCLn6K/?=
 =?us-ascii?Q?eLzeSRJN7/9WVUpsbvi2FE2pi56J4ncVkfdJvtByU+aF1QrZGmUglj5YZz+3?=
 =?us-ascii?Q?G4HCt0l4JCHusTQL5imPxfuhSKp6aQQHz1gBJFi54+pICPbfIsEl2AVJKT+a?=
 =?us-ascii?Q?8beeFxl1jhKKxLSuUJpd0OR5hNutFvyBsZJapjOm1KNega1SK2URzPsAT/nE?=
 =?us-ascii?Q?f5Ju23Mr6CzmpGD2yQrQHgNTUbrQbaIUSlb7EYFbwWY5ykIyCeaoNK51rC7i?=
 =?us-ascii?Q?RypYksqv/LCnF0+y/Ik+gwet9Ive1lK6fV/zt6/ICLBt7Ycs7n16ABrU0Onb?=
 =?us-ascii?Q?y9J5I6eAal8T2AjHYVwD3D8dw2pQmRPDEHbIjEl7qwldY4WBoAhSNI0n5UVi?=
 =?us-ascii?Q?Pup60wlRWwFVPmsitGNkdwd+7LUMZY+EK577NIiVwogZj0Py76JpJ323QU6m?=
 =?us-ascii?Q?2C+o6kNu6mEF0sjReoarrXXnZsrq46bh7TWmYhD5pkPRTmrf9LFUSVel2CjZ?=
 =?us-ascii?Q?CIPsHz5USF+vqmOlhl/XOtifSCGDFrdJnk6ypjTbcmmfqg2FyycAn9H7c+Zw?=
 =?us-ascii?Q?hqFWPI7rFLf4G/sult28Q/2a5pvSi2VasQMjyN5d8KrKZl61lOkYPQWFUks4?=
 =?us-ascii?Q?XZDCnuFONF4Os9rywnoJTRKcItYw0Z7BtaPwCPUA6y52m60muxbIMGyTBZl+?=
 =?us-ascii?Q?BFORW1k+Ks88SYFgcPJdFASb+/PWl1BHngXaX0P5fPeei84Yul0Kh6GQWpj7?=
 =?us-ascii?Q?7ASZbzocCEPnFDbl7sAuzC2YQ67/S2T1TFFIz0tJjhS67hKDs1cjtm6QjVGQ?=
 =?us-ascii?Q?6td7uGHJjD0IQ8dD+pUuVLuWj0zUSLEToiEGDw5y4CmbOd1dUG8skN7K+gXF?=
 =?us-ascii?Q?jCdw5JNNfOCvU3uZBflQEEIHg3Zhh2Ql/pSkXCCKTpPRsFC7CFbGyTQDqxrp?=
 =?us-ascii?Q?OU20k1yKBMj/nJl9R4vSctDy6gOoBiwPfykIOf3js+0ItbNL2R9EpsMbMH4X?=
 =?us-ascii?Q?AD0fc6ovb67OJifK4jFK/huKCjubhFtn2uZuf6X3n4b/p6CZHKokBdSLnPC8?=
 =?us-ascii?Q?ME1orMgxgGifC4ajrqjQxqcZEaerkcevBJh+fg1OFn2uOA10qeE2/TthOW4I?=
 =?us-ascii?Q?6NOAxbpoYe8zK+RgB/Du67f0yTMaiYb3KdAzj0KV1cJncdDSouvH1iKzFUsr?=
 =?us-ascii?Q?K0BsfHXcNp3vwpI5mTNLBLH5jYCnjMmweW8E85SuIs1dBrlNyoC2hfYYfauE?=
 =?us-ascii?Q?ITEwE6hns+FlSb5jxds3Xcl5utYKx1bfM2UrLg7EErmeovRC6xNAtDgsYuRC?=
 =?us-ascii?Q?N44p9WxUVbH2zLC1J+Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dff71e-b75c-4ea9-4d85-08dd34d3cf70
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 19:44:08.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1CB8nvQ/4VpnortIm8hjtLwJXjHd9/8xZzOvKqIEhrETgzDvS4SQAmnaSe+oen2ZqIUA5P8im/8eDh2ajOw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10936

On Mon, Jan 13, 2025 at 09:11:41PM -0800, Bjorn Andersson wrote:
> The DWC3 IP block is handled by three distinct device drivers: XHCI,
> DWC3 core and a platform specific (optional) DWC3 glue driver.
>
> This has resulted in, at least in the case of the Qualcomm glue, the
> presence of a number of layering violations, where the glue code either
> can't handle, or has to work around, the fact that core might not probe
> deterministically.
>
> An example of this is that the suspend path should operate slightly
> different depending on the device operating in host or peripheral mode,
> and the only way to determine the operating state is to peek into the
> core's drvdata.
>
> The Qualcomm glue driver is expected to make updates in the qscratch
> register region (the "glue" region) during role switch events, but with
> the glue and core split using the driver model, there is no reasonable
> way to introduce listeners for mode changes.
>
> Split the dwc3 core platform_driver callbacks and their implementation
> and export the implementation, to make it possible to deterministically
> instantiate the dwc3 core as part of the dwc3 glue drivers and to
> allow flattening of the DeviceTree representation.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c | 149 ++++++++++++++++++++++++++++++------------------
>  drivers/usb/dwc3/glue.h |  22 +++++++
>  2 files changed, 117 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index c22b8678e02e..930d812a9fbb 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -36,6 +36,7 @@
>
>  #include "core.h"
>  #include "gadget.h"
> +#include "glue.h"
>  #include "io.h"
>
>  #include "debug.h"
> @@ -2129,27 +2130,14 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
>  	return 0;
>  }
>
> -static int dwc3_probe(struct platform_device *pdev)
> +int dwc3_init(struct dwc3 *dwc, struct resource *res)

Maybe need data struct, which included res. It may need pass down more
information in future.

>  {
> -	struct device		*dev = &pdev->dev;
> -	struct resource		*res, dwc_res;
> +	struct device		*dev = dwc->dev;
> +	struct resource		dwc_res;
>  	unsigned int		hw_mode;
>  	void __iomem		*regs;
> -	struct dwc3		*dwc;
>  	int			ret;
>
...

> +++ b/drivers/usb/dwc3/glue.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * glue.h - DesignWare USB3 DRD glue header
> + */
> +
> +#ifndef __DRIVERS_USB_DWC3_GLUE_H
> +#define __DRIVERS_USB_DWC3_GLUE_H
> +
> +#include <linux/types.h>
> +#include "core.h"
> +
> +int dwc3_init(struct dwc3 *dwc, struct resource *res);
> +void dwc3_uninit(struct dwc3 *dwc);
> +
> +int dwc3_runtime_suspend(struct dwc3 *dwc);
> +int dwc3_runtime_resume(struct dwc3 *dwc);
> +int dwc3_runtime_idle(struct dwc3 *dwc);
> +int dwc3_suspend(struct dwc3 *dwc);
> +int dwc3_resume(struct dwc3 *dwc);
> +void dwc3_complete(struct dwc3 *dwc);

dwc3_usb_*()? There may be name polution in future. There are many IPs
created by dwc.

Frank

> +
> +#endif
>
> --
> 2.45.2
>

