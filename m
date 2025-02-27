Return-Path: <linux-arm-msm+bounces-49750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49406A488D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436ED163104
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 19:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511C526E648;
	Thu, 27 Feb 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YcugmafE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDF27005C;
	Thu, 27 Feb 2025 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740683878; cv=fail; b=nBzmn7oRb3jgXmykJkMhd6XO3GxNSTlox7jzYka6J/iZS4RtF9NZBuUzQrpya17qp++tQpAwyoYri2xcjSdOMV+5QKkjDh0oth0pQz0LyBOD4dQzVVAnOW59SzbNuVcU/ehLMsR/zNGA9wcRT3WjjMXtZUkH+rgEfMWZuk5zYNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740683878; c=relaxed/simple;
	bh=OpcNJagR04YkwxAszUBbOxbR92rHwpfp7HYL4LldA7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pF+FQrlkILvZxlH1nwo7e7Jy9ivb+Xy6GUxUkdC9uUnk9O19yTh66h+SQoRyGbmuOfEPXYLFF1Kq3uBVvteYIi/7xNPW6hxEkdoe8ZRUf2zIOICyhsPxyx5u1DVOuZHUB0occJUDAY6Ym3+4I3CD9oG2OWo791fJrwyq9YWnLFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YcugmafE; arc=fail smtp.client-ip=40.107.20.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ0XNMniFv2NpQwovvB4vLp+aCmLURFR+plaUIHPrTy/Lc5jqFXyQ9cFdgvo53gPAgM6bjc2QU5RpD3AkKvDWQ5xcNSajoxm3LgOimD7i4Dd011P64TrRklCuFw5t441fAonJ7PxKnlzAto6VeRMebWGp2ywF+Y/ncFlGVSFVWqETPK5I6Fac3XqJa+xPCsDvx16OIruLvIJV1GzKYAfjv2Acmp0TMRrtSKN56AAtGtq4duJtMAG0Nl13PHTVQD/RxCGu932jyP8Z3H2M35BE5ie0ODn57BpOLlysDnMTNl1oI9+Nelk75gyHBSP+r+/XCj8/+NOiWdv+MQC6FIXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIlD347RWXXVN8TA/cezFIfYDEjg6UZDWJ3TC3wpQvU=;
 b=PRmzldnXSLDPIV8vvffHuYAR+99FR4lG2JeJ0IiwFC0F/yq/imUDLGmmSn+YJRuQrHhW/yIhnzS3CgkDKD8EmWcX18LP8owb5Y1XiDJ92jQfbxH/ACByiaJrgoX52FFU2Zu21kztXtNy2Pp1Sg8L0Ywlh96YsyzPHYpVklZCkCIbWyTgan627aLQ69uO5APfIrXog4JbFrVRMBWx1PlfHfn1YaL0cTWJ1vJNy/Q2E2QVyLxaZHHgIeyFUWapC1W5qyJbfWGzzB30OYtcoeWvIwNxo2px+qcHbK0spBBHVhPGJA6Y6hqWqBiRwicl8X0Vl+vP8k1QsmTuIORuWF9UtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIlD347RWXXVN8TA/cezFIfYDEjg6UZDWJ3TC3wpQvU=;
 b=YcugmafEKVQBifr0+CCG38qgZa0Y9/uOjbeuLvrGqxmmaxGPdAt4AuJTk0U/42nduhbJEv/jxrQVSAaafrKdmbx4rlvZBK2KjvIKCOj+5G35HNDVkMfjLfCQWVx3YST9EggOef4BuvxKWqQ/kRTLrxXIkyhxa6T4OMgsczho0OPkVJRHR/0IeEnYzmsSAx1hA+Gv/ARuMLJTlmvofGg9lEc9NIjoXp5scWiLz7s/XcF93NM/dBDQA/FYiyjy54sI/D8f4JamldtMo+SOk/H3GLRmDPPxZ0EqJ0trIbXN+Ldk7+91AtiyweNfRWGY0/NW4wJrX7Q0whInq6Gl3e4nMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8816.eurprd04.prod.outlook.com (2603:10a6:102:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 19:17:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 19:17:52 +0000
Date: Thu, 27 Feb 2025 14:17:43 -0500
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
Subject: Re: [PATCH v4 2/7] usb: dwc3: core: Expose core driver as library
Message-ID: <Z8C6V8SADaUr0n+n@lizhi-Precision-Tower-5810>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-2-4415e7111e49@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-dwc3-refactor-v4-2-4415e7111e49@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: da2bcd0b-c033-410a-8188-08dd57636e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?omypPFG9a3QV0T2R+tO5f4ujVeq5e2N1llxZqSzQTYQLu5zTKhkWDtaxdx1O?=
 =?us-ascii?Q?b1kgAOinutEvlYixAv8mSaiwpd11O31EAJSKMuNZnc6AZqFsA7+m35LShH+g?=
 =?us-ascii?Q?DU3ueS6veidx1ms9sMNHaq1+9nJnZx1oL2Jk2tckEQYByGXWT051HWaBQaFb?=
 =?us-ascii?Q?9itbkiW88U8orxP2r7sZxEDZHqZ/tM64kNhScoCjaTmvR3pMTOuvYf3q48gw?=
 =?us-ascii?Q?lrDCjcMOS0xffTNO/oylJF4d345k3rHVEsdMkD/oNvoRud8Zy0R/yLU0YgyU?=
 =?us-ascii?Q?buSX9azXt/6L+WDfQkyOKFAFKkoaYYpC5OTjrgs/xnsKSBYrvS5EdCbqV1Kr?=
 =?us-ascii?Q?pwzzHZBZdbnqW15s3z94pwLqyd4D4EVymhLlDkLhfYnSLNPlVhj6XuuJNjiw?=
 =?us-ascii?Q?rnK3ApcQ2pqTDB2Hq3pwf+zlln+u0I8bFayDpV1C9VKjPBet1MmXLNlZDsU9?=
 =?us-ascii?Q?1+hHVnVJ7D2mImVtBBC6NXjTxaFxw/ThATRXgT1Bp+O9FcxeW5w/dSFk9IXI?=
 =?us-ascii?Q?SXKq9qKUHMVfqantAUauyz8zALZm8k1/+KqwnmuKaWD0qSfiGWjgRBIPsnmY?=
 =?us-ascii?Q?Kfc3++EOKwWlDyNBWKigHkeMzDRd4cqaFB/7szRznFIMYgMZzvDElEKKXhL6?=
 =?us-ascii?Q?bSigl6S46ZUo/UJVuQ12NCkBSFsoMtH03Wq9zNJseDvaHJ9HFUBuP1+BXYN5?=
 =?us-ascii?Q?lQyTgLxrl3rJVl6jkvOhFVPy6ee6VuFH6ill36fMjsF68qFj7XQtpq4kfhxh?=
 =?us-ascii?Q?d5pJa7J3EAW1Z/Dy0EhDtNz3PyCyLaxFz5BQmxxU1DA7Nm8AOlmTi8jLH+I7?=
 =?us-ascii?Q?UxBS0jARmcZRtB1S2o7FcURGlB0QfWjWfj6dsPj3yeADFDGXsmQdMnoHs2FM?=
 =?us-ascii?Q?shmWIvRV+9q8zURaKGVsBUHb/m+3h+9ubnqXq1ZfnNj+ADdNEvQG8eTyHXBX?=
 =?us-ascii?Q?iB4l0NSwEUhsmeq1+kPs2nc8UpbpgAuKZXh+wV9NSTykr0rNhW+BzZVhWY+g?=
 =?us-ascii?Q?UoKw/EJTQ5114NaZr2rySKFB4Ik1m0+zQIBnZCs8uDXP71zWxpiC/j+fbSk+?=
 =?us-ascii?Q?Icyxyx6mGBGd36b4WZQRfzpzhqutjdy8GBmvbzdFJxyhIUiSNHZltNNSQ4g1?=
 =?us-ascii?Q?wnbhRuKHhlKbJYybsdPpYCxNj6iF4uNPbKO7ihslIGGqIJoVmaVQaoRRrZNx?=
 =?us-ascii?Q?BPRA+whttObsDRV8hlnEJW6T1BeJ28u77nZ9IZnfAlBX3SjMjt/IyZlmpjfD?=
 =?us-ascii?Q?tFYaEaYx1yXqWA2P2TXcBjRBwjN58PgDdsaJSYn/TZ/CXvUNXK8K564tgbFM?=
 =?us-ascii?Q?SLJSBTwwCq0hz+fdK0ZO/18sBkdG5zOcIDjbCvesAhwqzij2aq3/0pQhjRBn?=
 =?us-ascii?Q?mzsO8PrKT908kabSZnhBkw4nn8967aQDmjzGCvgoOKTWQ4WXOY/HWd7UTSwO?=
 =?us-ascii?Q?27B/SmUj8DeF6f7FO1MM8apYn9hZpKxE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LlFhskTS6EC9frvEe4sOc3BF69M7i3xtdgiHWQTx8ZTwy7xG8KYq33Cxq5yc?=
 =?us-ascii?Q?dPVbzAPZ6soiNzWPFpfpBJOkInux0XwEyvgkprBqnQtpWR5314lTlIWkrfmp?=
 =?us-ascii?Q?COLBrQ7RYjBJWCC84aKWE4EqeD9SRowJOGTVyanyAwTLdM2yR4hATCd3IZ9o?=
 =?us-ascii?Q?3GhRw9E4UQhYpmjF0Xc7b3OtRqJVXfDDZ4RRPOWOX7xzWNLeGf/dw95/2Mj6?=
 =?us-ascii?Q?zI/GggQI32kzU6lZqke/yZbQiMh/74uxnVjGV1LtOXSm74t4NAPIogbnaOdj?=
 =?us-ascii?Q?RZD4tRiqIW8c8mgvSKKj1HOjoFQ7sNA+RAAYnzgc6mCair+44pMHYFdEqqpd?=
 =?us-ascii?Q?CiHNg3opIdwbrC7yDx2nvZRY1hZm7CG8iIbWTxwX8qZPctKDBKbnKtIKbMWV?=
 =?us-ascii?Q?qZjMcqzkL1XXBYOhIxVUT0xiCqjDVbVY1XfCh6aRv6LXj4JnTgd3s5j+UeSa?=
 =?us-ascii?Q?ZrTjWPAYGiMreJlLc4LFtX6/da/PpsUD4Tkvp6ZNSUIHT9tiB3PqkcTqp7AM?=
 =?us-ascii?Q?OZ2D34TV/tfavcrqqGkzylPCvqgYWVXCyiKPhdhcpEiMawiy1CuDz4b+JszJ?=
 =?us-ascii?Q?qeYy/CuwMu8TrjajZ5ETBT4joSdXed3DkA25wNbkPxYxBoaV/C4lwP9BmuZV?=
 =?us-ascii?Q?uNeu5MAoTRxzEr8vICO+2PR9OF5sPFAzW8oq+u1piH6tkuEyKjZGWwQNFc3H?=
 =?us-ascii?Q?coOas/fmZX0KqPIyLAq7dW5Umpt3i78reA84fV60lYPA07nWBO0zxULfnx80?=
 =?us-ascii?Q?SCudl4tXvLCL7HEVxVh4N/aESeS5RaanA1TBHfDgsVHLzqxznx51L4a2hsl1?=
 =?us-ascii?Q?eRwgerI1kOrL0zWi4W6CNVworW3syjevGXTAMMWYDq7L/2r/Y7/FV4bhBWdM?=
 =?us-ascii?Q?yLaHJKja55uobA2fUjzRQxbcqT1MwiVXdTQbxDd5AytTt39MAVrk6r+FZrin?=
 =?us-ascii?Q?GpJgMBv8iV+H668sRoCgRlEokAPvg3UFwWPSyuf928X0jB/X64XGKLmhanN7?=
 =?us-ascii?Q?2DyEyTDkUNsg+xzi6Uz/Z5nCELpCGInKOCtZOHOK9E7Hf8wa34kMrUWgHc1e?=
 =?us-ascii?Q?831bUIq/VNMcccrK++OK9wmwO1OV0UjDVcLMr7q4jxfhgk4QgwVBmPVrdM6A?=
 =?us-ascii?Q?WBiYqnYKS50ceiFq8+eCoQUZPBEofjHKiEsKelXt+EYZLX56md7LP3bRxXI9?=
 =?us-ascii?Q?vhJDswfOjVY/Ybzupup/m2TZnODHHBFW1+NxkJzG0VaTqvBh0sA0NPE5eMF0?=
 =?us-ascii?Q?yfXQVAEQ/gZHJtBt7f38Ex/PfoOr8sXfNaCmDzYhTx0IAhJVTizUqiFBlwTX?=
 =?us-ascii?Q?2KxSswNe0AvtA0Iy7OIRXt+4jQgB5lVgxLnhm9IZWk/92QvLfrJpZHuXBBcG?=
 =?us-ascii?Q?Bn/ThmnPIytVTXdD+GMk6KxepSkSvwT/U6SbjOlfMfduiyibo4QaZoDNnBW+?=
 =?us-ascii?Q?JwB6lAV90LMJNwtnx5a5mPxCMKcHb9FNCL5mAh3KArfz0NaC5qND/JnldjMU?=
 =?us-ascii?Q?xgdqu7FF27YShoJoOCRpEl9RTrF3QB3TDGwOYUMM2TxDGfyH0nEqTNvvbcLh?=
 =?us-ascii?Q?3udGZAEQyIc6zQ5j+RbvojOBbRDYC1VKHMaSRDhN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2bcd0b-c033-410a-8188-08dd57636e53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:17:52.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6wAdCzUWoc7Z42/25vRXYJMaX7f2Rm+AVvwEXIN5kus7xrqquEoYed5sASxbLPWcWhSxsWBi4TGMpMQTGq2Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8816

On Wed, Feb 26, 2025 at 04:17:49PM -0800, Bjorn Andersson wrote:
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
>  drivers/usb/dwc3/core.c | 155 +++++++++++++++++++++++++++++++-----------------
>  drivers/usb/dwc3/glue.h |  32 ++++++++++
>  2 files changed, 133 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index dfa1b5fe48dc..d9f0a6782d36 100644
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
> @@ -2137,27 +2138,16 @@ static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
>  	return usb_psy;
>  }
>
> -static int dwc3_probe(struct platform_device *pdev)
> +int dwc3_core_probe(const struct dwc3_probe_data *data)
>  {
> -	struct device		*dev = &pdev->dev;
> -	struct resource		*res, dwc_res;
> +	struct dwc3		*dwc = data->dwc;
> +	struct device		*dev = dwc->dev;
> +	struct resource		dwc_res;
>  	unsigned int		hw_mode;
>  	void __iomem		*regs;
> -	struct dwc3		*dwc;
> +	struct resource		*res = data->res;
>  	int			ret;
>
> -	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
> -	if (!dwc)
> -		return -ENOMEM;
> -
> -	dwc->dev = dev;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "missing memory resource\n");
> -		return -ENODEV;
> -	}
> -
>  	dwc->xhci_resources[0].start = res->start;
>  	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
>  					DWC3_XHCI_REGS_END;
> @@ -2221,7 +2211,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  		goto err_disable_clks;
>  	}
>
> -	platform_set_drvdata(pdev, dwc);
> +	dev_set_drvdata(dev, dwc);
>  	dwc3_cache_hwparams(dwc);
>
>  	if (!dwc->sysdev_is_parent &&
> @@ -2316,12 +2306,35 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_core_probe);
>
> -static void dwc3_remove(struct platform_device *pdev)
> +static int dwc3_probe(struct platform_device *pdev)
>  {
> -	struct dwc3	*dwc = platform_get_drvdata(pdev);
> +	struct dwc3_probe_data probe_data;
> +	struct resource *res;
> +	struct dwc3 *dwc;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc = devm_kzalloc(&pdev->dev, sizeof(*dwc), GFP_KERNEL);
> +	if (!dwc)
> +		return -ENOMEM;
>
> -	pm_runtime_get_sync(&pdev->dev);
> +	dwc->dev = &pdev->dev;
> +
> +	probe_data.dwc = dwc;
> +	probe_data.res = res;
> +
> +	return dwc3_core_probe(&probe_data);
> +}
> +
> +void dwc3_core_remove(struct dwc3 *dwc)
> +{
> +	pm_runtime_get_sync(dwc->dev);
>
>  	dwc3_core_exit_mode(dwc);
>  	dwc3_debugfs_exit(dwc);
> @@ -2329,22 +2342,28 @@ static void dwc3_remove(struct platform_device *pdev)
>  	dwc3_core_exit(dwc);
>  	dwc3_ulpi_exit(dwc);
>
> -	pm_runtime_allow(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_allow(dwc->dev);
> +	pm_runtime_disable(dwc->dev);
> +	pm_runtime_dont_use_autosuspend(dwc->dev);
> +	pm_runtime_put_noidle(dwc->dev);
>  	/*
>  	 * HACK: Clear the driver data, which is currently accessed by parent
>  	 * glue drivers, before allowing the parent to suspend.
>  	 */
> -	platform_set_drvdata(pdev, NULL);
> -	pm_runtime_set_suspended(&pdev->dev);
> +	dev_set_drvdata(dwc->dev, NULL);
> +	pm_runtime_set_suspended(dwc->dev);
>
>  	dwc3_free_event_buffers(dwc);
>
>  	if (dwc->usb_psy)
>  		power_supply_put(dwc->usb_psy);
>  }
> +EXPORT_SYMBOL_GPL(dwc3_core_remove);
> +
> +static void dwc3_remove(struct platform_device *pdev)
> +{
> +	dwc3_core_remove(platform_get_drvdata(pdev));
> +}
>
>  #ifdef CONFIG_PM
>  static int dwc3_core_init_for_resume(struct dwc3 *dwc)
> @@ -2533,9 +2552,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
>  	return 0;
>  }
>
> -static int dwc3_runtime_suspend(struct device *dev)
> +int dwc3_runtime_suspend(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	if (dwc3_runtime_checks(dwc))
> @@ -2547,10 +2565,10 @@ static int dwc3_runtime_suspend(struct device *dev)
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
>
> -static int dwc3_runtime_resume(struct device *dev)
> +int dwc3_runtime_resume(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
> @@ -2571,15 +2589,14 @@ static int dwc3_runtime_resume(struct device *dev)
>  		break;
>  	}
>
> -	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_mark_last_busy(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
>
> -static int dwc3_runtime_idle(struct device *dev)
> +int dwc3_runtime_idle(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
> -
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
>  		if (dwc3_runtime_checks(dwc))
> @@ -2591,53 +2608,68 @@ static int dwc3_runtime_idle(struct device *dev)
>  		break;
>  	}
>
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dwc->dev);
> +	pm_runtime_autosuspend(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
> +
> +static int dwc3_plat_runtime_suspend(struct device *dev)
> +{
> +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_resume(struct device *dev)
> +{
> +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
>  #endif /* CONFIG_PM */
>
>  #ifdef CONFIG_PM_SLEEP
> -static int dwc3_suspend(struct device *dev)
> +int dwc3_pm_suspend(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>
> -	pinctrl_pm_select_sleep_state(dev);
> +	pinctrl_pm_select_sleep_state(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_pm_suspend);
>
> -static int dwc3_resume(struct device *dev)
> +int dwc3_pm_resume(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);

Can you add varible dev to reduce difference.

	struct device *dev = dwc->dev;

also for other pm functions.

Frank
>  	int		ret = 0;
>
> -	pinctrl_pm_select_default_state(dev);
> +	pinctrl_pm_select_default_state(dwc->dev);
>
> -	pm_runtime_disable(dev);
> -	ret = pm_runtime_set_active(dev);
> +	pm_runtime_disable(dwc->dev);
> +	ret = pm_runtime_set_active(dwc->dev);
>  	if (ret)
>  		goto out;
>
>  	ret = dwc3_resume_common(dwc, PMSG_RESUME);
>  	if (ret)
> -		pm_runtime_set_suspended(dev);
> +		pm_runtime_set_suspended(dwc->dev);
>
>  out:
> -	pm_runtime_enable(dev);
> +	pm_runtime_enable(dwc->dev);
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_pm_resume);
>
> -static void dwc3_complete(struct device *dev)
> +void dwc3_pm_complete(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);
>  	u32		reg;
>
>  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
> @@ -2647,21 +2679,36 @@ static void dwc3_complete(struct device *dev)
>  		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(dwc3_pm_complete);
> +
> +static int dwc3_plat_suspend(struct device *dev)
> +{
> +	return dwc3_pm_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_resume(struct device *dev)
> +{
> +	return dwc3_pm_resume(dev_get_drvdata(dev));
> +}
> +
> +static void dwc3_plat_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
>  #else
> -#define dwc3_complete NULL
> +#define dwc3_plat_complete NULL
>  #endif /* CONFIG_PM_SLEEP */
>
>  static const struct dev_pm_ops dwc3_dev_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
> -	.complete = dwc3_complete,
> -
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
> +	.complete = dwc3_plat_complete,
>  	/*
>  	 * Runtime suspend halts the controller on disconnection. It relies on
>  	 * platforms with custom connection notification to start the controller
>  	 * again.
>  	 */
> -	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
> -			dwc3_runtime_idle)
> +	SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_resume,
> +			   dwc3_plat_runtime_idle)
>  };
>
>  #ifdef CONFIG_OF
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> new file mode 100644
> index 000000000000..e73cfc466012
> --- /dev/null
> +++ b/drivers/usb/dwc3/glue.h
> @@ -0,0 +1,32 @@
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
> +/**
> + * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
> + * @dwc: Reference to dwc3 context structure
> + * @res: resource for the DWC3 core mmio region
> + */
> +struct dwc3_probe_data {
> +	struct dwc3 *dwc;
> +	struct resource *res;
> +};
> +
> +int dwc3_core_probe(const struct dwc3_probe_data *data);
> +void dwc3_core_remove(struct dwc3 *dwc);
> +
> +int dwc3_runtime_suspend(struct dwc3 *dwc);
> +int dwc3_runtime_resume(struct dwc3 *dwc);
> +int dwc3_runtime_idle(struct dwc3 *dwc);
> +int dwc3_pm_suspend(struct dwc3 *dwc);
> +int dwc3_pm_resume(struct dwc3 *dwc);
> +void dwc3_pm_complete(struct dwc3 *dwc);
> +
> +#endif
>
> --
> 2.45.2
>

