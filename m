Return-Path: <linux-arm-msm+bounces-65836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D1B0BC07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 07:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1F71896642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 05:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51E81ACEDE;
	Mon, 21 Jul 2025 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dOqxPUjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995D3D6D;
	Mon, 21 Jul 2025 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753075955; cv=fail; b=IxITkNHIQ4c8+7zaCwJW+q4IG7m0QAQlTCPuswJoQVf2tjq1b+s21ip/9Yf0bRFZWt7i8VofDzU/3Z/grXo2bMs1mkCMOTImTxH+5bqcRemAmCP2pbBpcZOUyrrT4RUQk43Og/CmNnuL+CnSanBv4hIxlA1NRcD2YiAjD6adLy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753075955; c=relaxed/simple;
	bh=W1UT89R0qES9c4eSuS2c4hW5Y28X4AnedsE1fFYbGZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jqIGzkXCLsiSOwx9KU8Qvup8NImQoVxRyiV1SpybFEdamSsIhF9nGG6ykyRPR7XcrmPYYNhaeQj7rfvNmzS3Fe8yTXKZrXyeZYN+m5/M3lij9mLF8jaFEfNinfH1vM2xE/uPIU1PAOv8OwMC4Iw8M8LHnDSpcKHeQWvUQdpNPC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dOqxPUjR; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un6m3wWkUOxv9BsVENFzKFfhVvSHds+W0nuq7/Ic/Inhaj/X93d6mgm5Z0Yrz2y5zeoYhb9DwpPc7qFUZ5u5iZBc+jRRFg9fNKO+JqOma61/jXdkZrN29bzSgOGSmybJJYL/XX66r8n5CDD+MTVLAnZ0A9oaPkCOTZV5ajXSE02cQYsz68s6TtrRHfPJKNSx5PYYhssZrByeknUHleZB72zivJrVQkGw4cDZg3NwdupeVJOLssd9ONGHEpr0bU41o/y6eG6VseciKSuOGqtQ3Yq1L++29ycnIno1VVpBSS/bFTbMEVMNGK4BhusSQym7uel/BdR7k79TcB8QDHl5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=201JH3w8FKrWsEaxE2G+qc5V8OM82gEaufI+oS8kWh0=;
 b=Hwkuhg27Y/MC7ms8hN5ItWmVMWpTBgiOy/7L3OiMB9p5hFB3wSyUKy4kYVTMvnuQWB/yegn5n1Y1swWMZqSw0GF8soQziklGpcUa4ZkLQkCMbiLhYVcKsihAKUvLHwQ7ZhilFMHdR/BxIwksNfpOwN+IY9YVuV4GCgrEvfJWJB0xv05J77PzRdqqLkuT5n8TKU8swj/0Cs2B/59h4XpT2VUNiWSOTDqx2lE/thqsWP+iCZqiad/Ls96WFy45XjkqweHcIPC6gNJK1j2CNLYkRU7g/qpdYW7D5+lAkKv3tywNXIJ8UsNo7SaX0kjK9IWRq+VPLJ9CHaZrVMDQupgMYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=201JH3w8FKrWsEaxE2G+qc5V8OM82gEaufI+oS8kWh0=;
 b=dOqxPUjRROkGmeiWBKlTaKHbsymjUX4KfHkPrjhV+nAtVpWHVFLtxcFpOQHcUHhdym7w/2sdg54vRMoLIs7NF0VovihaDfoMW3uN/7yHAM3nNN4VH4IEusoKWuAKwaOOIyANtwbYW53YgtXonAi9fmlNAHmWmma9AmweBn8FwLFAIdgq6q90936hznzf/Cg42/rmDPX7JEEJAEXY1zUkpMOm5NbUWyFkL1b1b0tdktEuiqXaEiP7ScW03uhGCkSDzz8hOc3xYzhRH6z9YxzKgDoz4M4UzLQtSM0IfYcNabCjX8kbvyLVY88vZfOMrM7MkvUOImeT6s3uybWPC35ZjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9989.eurprd04.prod.outlook.com (2603:10a6:10:4ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 05:32:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 05:32:29 +0000
Date: Mon, 21 Jul 2025 14:42:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Message-ID: <20250721064256.GB4844@nxa18884-linux.ap.freescale.net>
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
 <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9989:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd9310b-421f-4755-9bd5-08ddc817fb91
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p4KnEeRW+1pOOwxq4+I3LkeU+bawLtzGTNHSsFDLe/bIf/tl5If8f9zVpMJ5?=
 =?us-ascii?Q?2Fgci3TlfVwP113qEKFdk6zsnGYOHML17c32mgPadId4HYo0JTCEQT5q0y8g?=
 =?us-ascii?Q?GWf56TxXN8/Ha4/qQkCnmD/hyT4tVOtqBz+AbC3txaQ+/O1FSlOd9dmpOABU?=
 =?us-ascii?Q?U/QVYcsXcb62AG1vejkpGQ31gUAsQv0DvhSxL7ByqXXW7/XlwVseJMX4s6SA?=
 =?us-ascii?Q?OOcJ3336GfcZ3NZrs7ULlDfXdAUgXj3+sqp78Wreke5rZ8Jfa/eYz5rgFi+v?=
 =?us-ascii?Q?nvzk7Ay4YGYl1GjZjPNDZklyX4QLX9S1YRXQ94rJx78FtU214rsOpgi3UvIs?=
 =?us-ascii?Q?ZmVxksOniI5IDocZt33ocS7jgII2UKGuUKO+/fmRQNwejpMkOP/N0Kzr+21s?=
 =?us-ascii?Q?f8RmX6sCrfU8vkes8hX49yfunEIctpfQrHCftgEMdJ++eEKJPRU4ZCDAszcJ?=
 =?us-ascii?Q?5HWDci+PUweEI+u7QOCOamW5WbonhD2d9O4ha+yYf/+DyNl7dpCg5t6nRF7Y?=
 =?us-ascii?Q?8fLlmQuu35WmJxn+Gi8joTgrbrFfi1lcMpcab1lQ/1R02XwO+AsDCpSJC+nw?=
 =?us-ascii?Q?MD5V+fJVPjvdeEM+WY8QeUhMgDfld6vW6OjBLvDLl/0pEB7DN9YSPZcn7G2z?=
 =?us-ascii?Q?suji0OEKzfh4iu5zjolIWcVQy/Za/zUghVBgQunV8HTF/1hdXP+XhUQJvlO2?=
 =?us-ascii?Q?th/AIIAIkobcDIvuNNPhM3f1aLuzkY7Dr1fV59uB7ruFlDIlouZKfAIJc/k5?=
 =?us-ascii?Q?u6+e6CXcHW6fMpOZLtpuZ2d49EIKIakcJrAl/IYjXbV0Lk2LZpbueEJdMlex?=
 =?us-ascii?Q?Rjy4X5JB74dqUsE2N5yXo8Erh2KDs1s7geJdkTaiSODbwR4Pjov+eECJeWBB?=
 =?us-ascii?Q?0Enp8Mv8Fr6VT5/oZ2Dcut1n39tiJ1pldB2qFbeao1QH+sCJr9SQIbv5jOVL?=
 =?us-ascii?Q?yFxgTwby9Dg6OwtBSJbPye4vPfT3htz/20D1AC2j1QvCtVtIxi1tKG4V9q4v?=
 =?us-ascii?Q?oQ6EC115QqZzcM9JqO3CTFCvmhszsqZf32kqEUfp2GFW7Hpov3/W3BWJUaHF?=
 =?us-ascii?Q?uQ37eF0zPYXPGVghOVzPEOlO2h+YVFuSz48l2ROZ/Dt/RbstqIM6xJYpfcFk?=
 =?us-ascii?Q?g89PeeRxo9/P/R7bRJZIGYKI/LiuW0FkXgaD/rF+2TCzWUyBW0hsET3nXH7n?=
 =?us-ascii?Q?Esbhlsb69yGvz0EWINEe+S/EUaxcZjxmALPs10MVc/KyC29uxDvPIRV3cj2D?=
 =?us-ascii?Q?g0pPEv+TLxB750tj9hBy3EGhhMR2sV8Gnlt63ccHrRpt6s4ugCeuc2WVi4sy?=
 =?us-ascii?Q?/QZvsvxTeEBdZ8fSaWy10K2hg+YglU8agFLdwq2v1fqfBi1WItAerHbi117q?=
 =?us-ascii?Q?nw2epmO5sHmzPXWzPrIFlqDpQ9BVChGFkUG0s9I0TLr+jnbG4/09nlEYOrGU?=
 =?us-ascii?Q?3WW4tjytWlCAd3Xas/TtM2+i66C5/yTe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P0I2eproh4GIwKIPAwXj+4lOKwNSoZMwYeXO6xInIntfCqDI4iG77tfHLG69?=
 =?us-ascii?Q?I980li28WQHNJjBI0qW86HammAmkB2HRwefq6vSjHkCTdaEJYMVOUqfGCAR2?=
 =?us-ascii?Q?5GqVGGeJJpN6uq3Or9/aXHTIqOtU1wMwIedEp9KAhbubK+XZWbV72YR6gyvL?=
 =?us-ascii?Q?LBACDZqYbwJm/E8OMNQJYf1ixteVTF8/YWqZhdjBxt038/WFWsu1JDYUwNtw?=
 =?us-ascii?Q?isczSSOMrkiaOFcL+Nb6ZmEiq+9CybVoMwCbCk7d/jWjCUj3azopW2rXhc1y?=
 =?us-ascii?Q?tGdMNu6qq02vfpuw1X3dfOYNn3F5BdKaDG+fV5fPxZsLo33xcAECLc+V/FQ5?=
 =?us-ascii?Q?f0eEetXr+fEM6O738I5B1yoGzNJhC+z1vz/pdaiu488lK6mQyPyBA404A1jm?=
 =?us-ascii?Q?kO27l6s2kgqhE58y+2l6YIkBrPzcl67qPSGAmTCJRRdqvOTYiBDT9NCe9svg?=
 =?us-ascii?Q?V9fIoYicrA5+L5wcRUD2OYV0hDyxES7lqPySYhrmwAYJnXtx7QnM49wilnQ0?=
 =?us-ascii?Q?32PcHD7Y1M7Z/5mCzlwZdNDx8a8xLg2jcV7j2JbkrKpc3WLzeNB9Jxl9SPOB?=
 =?us-ascii?Q?Ay+87Dwb8ga82qd3CUzpugy+66YLO8CrsILVVqgXr6iXxg/e78PTAxR9zC2L?=
 =?us-ascii?Q?0CLe7cnJ7X/0dHkhFXWErrDBhBS0aZ79B9yhxRiJXfbTabXiQ3BZ2Q/Tp/tP?=
 =?us-ascii?Q?de8YXoB4vbLBAiIbevUKtcvHO5kTlQS0FuWwExuq+ciU51OE1HuWFsgzo50i?=
 =?us-ascii?Q?DyN1Tz5ON4VckagEWU2ICT+fGDbOIc/M8rwv9Ld3zDaHq1XxEMQsooX1+t7z?=
 =?us-ascii?Q?wGvGn59kgUxg5imEOtpPdeRcnUtW1QIxlZOb9x0YC6yebXPXZsyR8960OC7H?=
 =?us-ascii?Q?/K3GPFGsSp1hvTQrc2wGnE84vh1W2aDC/e6cGFy80LdWLlERI/jpd70e6MAa?=
 =?us-ascii?Q?Rx5bspUUx9/gMq+zBPGWS+f3lkHdNxyWm3M0zWlLuGJKt0krYCqCyGU8U3lZ?=
 =?us-ascii?Q?oM47NmAqdTRNJaccXuB806KxfyTgxsWmR3O/m95utYx0qCsYcp50FqgIeI0r?=
 =?us-ascii?Q?DlEPBjuUInq/7hh+VA4vmCRX7DjYx1Ad0hytxsATvK26OQB67f1H7nKZ4dtI?=
 =?us-ascii?Q?wtM3TPtzjzQu9vgUeW5iAZt3/KZfCuIvvR9BeHlyxmhZrUYkRQ/D8GRKQHTs?=
 =?us-ascii?Q?YJOoI2/LTTDbN0DBbdxz5cigb6ecsu8n0wx6xTlVv/mJGxFPTARcXJ0KkmYj?=
 =?us-ascii?Q?nDn15ZkrGX0da33y/CQnvr9eTXSZ3H4hPhtDY3l4r9kifJDjDfYbI5AWkN5a?=
 =?us-ascii?Q?Gj3EKXtcTelEcYd+xBz6Te/qK8a3wr+GL78xopYzuUF+9P+XMWnrazfBaH8m?=
 =?us-ascii?Q?X0u8BBKnFaY+3Xt4xhf1QCE+MzzHoXfTGB5j5oEuJaa24b9kqhJ48CHUaMuK?=
 =?us-ascii?Q?mrsjP7BA7d4sw/2ZahalmH1aq3uDhKOPWJ7TcZ/qV3Wafy2XWyVWtShBS3S8?=
 =?us-ascii?Q?v5YweAbrvqnssb91Tf/YzVBmJp9/RfcPokbCgmGolUBRvi7UHP3wmXstH0qm?=
 =?us-ascii?Q?VGlu6KjLjTJ0GtVw2oH1xgW2l464lVuZPUn6/WBJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd9310b-421f-4755-9bd5-08ddc817fb91
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 05:32:29.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tu7W9jzUirubTfnzNkH/Bg/A11PfrqNCY+QF8rh37SUeYJ4xpclufdxPEG0XSb2aS/9L16Ng/SiCiE+Bi2Qgfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9989

On Wed, Jul 09, 2025 at 01:13:07PM +0200, Luca Weiss wrote:
>Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
>(e.g. SM7635) SoC.
>
>Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>---
> .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
> 1 file changed, 201 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
>new file mode 100644
>index 0000000000000000000000000000000000000000..790ad38a0330bf81f6333e887522ddb97690edbc
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
>@@ -0,0 +1,201 @@
>+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>+%YAML 1.2
>+---
>+$id: http://devicetree.org/schemas/remoteproc/qcom,milos-pas.yaml#
>+$schema: http://devicetree.org/meta-schemas/core.yaml#
>+
>+title: Qualcomm Milos SoC Peripheral Authentication Service
>+
>+maintainers:
>+  - Luca Weiss <luca.weiss@fairphone.com>
>+
>+description:
>+  Qualcomm Milos SoC Peripheral Authentication Service loads and boots firmware
>+  on the Qualcomm DSP Hexagon cores.
>+
>+properties:
>+  compatible:
>+    enum:
>+      - qcom,milos-adsp-pas
>+      - qcom,milos-cdsp-pas
>+      - qcom,milos-mpss-pas
>+      - qcom,milos-wpss-pas
>+
>+  reg:
>+    maxItems: 1
>+
>+  clocks:
>+    items:
>+      - description: XO clock
>+
>+  clock-names:
>+    items:
>+      - const: xo
>+
>+  interrupts:
>+    minItems: 6
>+    maxItems: 6

If minItems and maxItems are same, just keep minItems.

>+
>+  interrupt-names:
>+    minItems: 6
>+    maxItems: 6

Ditto.

Do you need to define the list?

>+
>+  qcom,qmp:
>+    $ref: /schemas/types.yaml#/definitions/phandle
>+    description: Reference to the AOSS side-channel message RAM.
>+
>+  smd-edge: false
>+
>+  firmware-name:
>+    $ref: /schemas/types.yaml#/definitions/string-array
>+    minItems: 1
>+    items:
>+      - description: Firmware name of the Hexagon core
>+      - description: Firmware name of the Hexagon Devicetree
>+
>+  memory-region:
>+    minItems: 1
>+    items:
>+      - description: Memory region for core Firmware authentication
>+      - description: Memory region for Devicetree Firmware authentication
>+
>+required:
>+  - compatible
>+  - reg
>+  - memory-region
>+
>+allOf:
>+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>+  - if:
>+      properties:
>+        compatible:
>+          enum:
>+            - qcom,milos-adsp-pas
>+            - qcom,milos-cdsp-pas
>+    then:
>+      properties:
>+        memory-region:
>+          minItems: 2
>+          maxItems: 2
>+        firmware-name:
>+          minItems: 2
>+          maxItems: 2

Just keep minItems if maxItems is same value.

>+    else:
>+      properties:
>+        memory-region:
>+          maxItems: 1
>+        firmware-name:
>+          maxItems: 1
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            enum:
>+              - qcom,milos-adsp-pas
>+    then:
>+      properties:
>+        power-domains:
>+          items:
>+            - description: LCX power domain
>+            - description: LMX power domain
>+        power-domain-names:
>+          items:
>+            - const: lcx
>+            - const: lmx
>+
>+  - if:
>+      properties:
>+        compatible:
>+          enum:
>+            - qcom,milos-cdsp-pas
>+            - qcom,milos-wpss-pas
>+    then:
>+      properties:
>+        power-domains:
>+          items:
>+            - description: CX power domain
>+            - description: MX power domain
>+        power-domain-names:
>+          items:
>+            - const: cx
>+            - const: mx
>+
>+  - if:
>+      properties:
>+        compatible:
>+          enum:
>+            - qcom,milos-mpss-pas
>+    then:
>+      properties:
>+        power-domains:
>+          items:
>+            - description: CX power domain
>+            - description: MSS power domain
>+        power-domain-names:
>+          items:
>+            - const: cx
>+            - const: mss
>+
>+unevaluatedProperties: false
>+
>+examples:
>+  - |
>+    #include <dt-bindings/clock/qcom,rpmh.h>
>+    #include <dt-bindings/interconnect/qcom,icc.h>
>+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
>+    #include <dt-bindings/interrupt-controller/irq.h>
>+    #include <dt-bindings/mailbox/qcom-ipcc.h>
>+    #include <dt-bindings/power/qcom,rpmhpd.h>
>+
>+    remoteproc@3000000 {
>+        compatible = "qcom,milos-adsp-pas";
>+        reg = <0x03000000 0x10000>;
>+
>+        interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
>+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
>+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
>+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
>+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
>+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;

This seems not defined in bindings, I am not sure on this. Just a question
here.

Regards
Peng

