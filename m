Return-Path: <linux-arm-msm+bounces-28518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D1951EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2733E2847CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAE1B5831;
	Wed, 14 Aug 2024 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hjkFdZMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013030.outbound.protection.outlook.com [52.101.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC31B580C;
	Wed, 14 Aug 2024 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650290; cv=fail; b=fzXEgYfHAo5CAeamKaNZaL3kY86oYDS8qKnUSCUHjbTovpSeVj02kNHWfkf2SQd7rlCM3UTc0V7W/6XjxZqiaPAJu1mkTdxtVkywkI+J/FOUCRnqlTn7a0e6jNvDvjw+Zf/ndNlCKzqnyGzTEJ/FF53DmyX1k+Y21ytWSCz3Tq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650290; c=relaxed/simple;
	bh=woZSqDmjJQx7PoyfnCcDpVIGsXLmHOfOPJ3r+fk5RvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eBIp4M+9lsSfqFMwwHo9AB9V27D4EtCCw33NMMm0J60Iok2Pkyb/RFd8MVHDxsWouKsTy03WkGMwvb6mnEBdRa0eppKwVgCHlpoPl1iJi2FBgQ+thd5RLiK5I2p9hCkNebZhGbZuOwdskS8dLAKlcjHAzJdskge0W5L1COWPnzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hjkFdZMq; arc=fail smtp.client-ip=52.101.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL8cf9aQMH9uQYEhD5SY0UePy5B3mCD4dnvqZnpEPEiHRTjN5PpzzYc2ifUg3ZGTyiBo+9u/EB1RKrgB6LkF/cAkICy5ZSB6A2XM31s28LlJHSFWf9Z9D5Bjm//j8q4Ggy7o9xxiUuihWOuBQQzrZi9YRF1ke0L2J8ePpIt/uQX2b3HpqS+JuYrXGtMYwv694DOmBNB64r22FRDeZ5sQ6nDsuXWTa6O4OIDRnUE4317NQoF5bKWlwQIYDQbNAjzrzyrTvP1Txev+AgCSNI9cunX0nmK4z2BaMEBaAZE8il1oe1fmj8wyD7FzlR9a2j3V5TJ6CPgadRtXNgYHzxTOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z66tAmdqhaXuA/F1sFsQJ+tV0ETa593Ad+mpRYypsIo=;
 b=qpo7cdHLhmPwgxCYaU88GcP9Y1DIdM171DgQfOJCgdsNk9n/upq4zZlbWisQzMqVdDLE493DuBI+A3pqSCEynNj4Ai0k2f8/UQUD+xavJxgxpmeCxfpul+waByW5lff3kWxM/q/XVysYBAYO86vyDz98J1TnazBPzeQrtRxCPtHBopUnuPAoWAm+ESmnEfcVQB3yZXojlve76IzQ8BB2fMESqWSMk+6o4pLopKHYkC0+XhF7Ff2T96j7uMJWnTmFOxI97J/1dAhRYwRb6wL3MSYNBP5S1Tqe9jSgYfyVCB8XmNC9YW8IzmMMjiQuh+iVYu2ZxrQuPGpdxNEN5wzIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z66tAmdqhaXuA/F1sFsQJ+tV0ETa593Ad+mpRYypsIo=;
 b=hjkFdZMqw88GhvhEqdx70PYW5kU2fcj0ZJFyobj64jJxtcjeJpzx/NoGpsusaWn+6ua/bA6IvXbahyXQLnbC0a3UnUUCeGU6eEjvinxygEsc8eaTXXmDlh/tvHcX1BoPMrwKFBp8C8HzDJ0TBngPIcV2Q4Zli1S15i5acU2srYGOxIzbTRl8bE54nTMN1eVvvJ7cYDULVN6ju4hbPNKuJ05lMsMFwyVRG3QV2iIJLU1EIuoXulalH7IUHgo/1xrw1POb8156G698vAFGCdsDFCIvYG/XFm52bBAQbM9ndSKv9nXWG1Yhe0FDSXyO0yGXUdh8q6h02Uj2yA4ukITrHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8534.eurprd04.prod.outlook.com (2603:10a6:10:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 15:44:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:44:45 +0000
Date: Wed, 14 Aug 2024 11:44:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 05/11] usb: dwc3: imx8mp: simplify with dev_err_probe
Message-ID: <ZrzQ5DQyiD5ytioA@lizhi-Precision-Tower-5810>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-5-95481b9682bc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-5-95481b9682bc@linaro.org>
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9289e8d4-0005-4fb7-5280-08dcbc780594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	bp6uoVWaAJd7O9Oau5w2hoACtpeOcu5zDwl4uRHbWU46m7fQ+i5fYQVTGRhxcisOnTepiOi3q6nD6i/l2ae8xByCwGJ8YHxMsLAZg00Jb6emHw6SRZwJo8LN3tLYs55bhFmjUn7ZkrgQF2qeFAVWYNuXDDBK8lFRuzkrrDEXmWpzW1DNMkEaELGtdVbO1JnirnTXUUdb005n7xJyMNW3N2WM8bK1EGLZ5MVgdsyvyQBAFxHfL7IbRv64lMIy5dLUbYASApwS2tiOkZPiCHCapfqIWo4ylFHh0M1Q+62unfPif/cXDEmEmSroXXThXcpFOTNb7s6MUVBlkz8BiyuQ2iA+edqltMWKvUtsLdakuWzPW63UrMjGlVBdRiYerunCs4s0BPcpG/idx4dK6iDTsiZ15DYlodBg6QJo0VgTxz/VyY5ZfDI2UQYcPZcsurvNF5Or/t7NLy3dbSZ3Yx7lhnPEJjMHCDEc5SJzaZ18rP4xnM9ZISgxwjA6as5nSTKWKYOblKqv8AWTN01YTkXKF5O4qkAAByncbtQcjjcyc6Zm/5Pkw0bNtdoNUGY9A7yJGWI/2vbIHltALiLJqRFhrNuVbnsCvJ8qSU5c/7w4szd7Pvw6Llx/OjWiQJbsDfmgYfWZqZ5qwSvKMkQ9KcnGOktLPzqqcyyP6dhaAchQTrIRzcXByrGkbumOEeiUNk42yfxA8XwTI7zBfYDu01Fz61qJXDe3Gus1rRCJJxZ6RLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6BHCXuKo8yibfAyPG97+S0EE430JgYizfhr/T4PLsz1PctK+Bog8CvOIKPJM?=
 =?us-ascii?Q?8vDrYKvq9vDzd+jOLzyZsZLsPr2wQDkJbEDUHGSIQqr4Eo/PG2ix87mkPv5a?=
 =?us-ascii?Q?Z1BjIztRbVZFR261gEwb9fr5TYGgG0kzrsfQqqMnQSmQVgoa7qL5HE3BmEXz?=
 =?us-ascii?Q?YD7VI9ybF+75eYWFbijfms12B+Bzmox1oK2hly8irKH1GP49oc9/uoQ1mtlt?=
 =?us-ascii?Q?MgyTLL43jHXgbTJYpivayHBlOnd6R33wbM9ZV/t/M4h1MUzr67ZNY+9RkMTZ?=
 =?us-ascii?Q?2E3WBgPYJ/Agglep0wKSSTKm2loTv4QF7ZDUlKPwJ7pdgyfGU/hZiz5C1cw6?=
 =?us-ascii?Q?wWGsmLsxTeYtz1OJN18wCBGr3C932ZS0qjFE6wSSDtviICwMb9BQUE3/KHaT?=
 =?us-ascii?Q?zMwWSg76ykRGROf/nsl92IgjhlX8jciQ+WzcSfjHrMG28MpuWcUoIWItMWAC?=
 =?us-ascii?Q?3B3921P8rI2kBY/AWH7q8/oFK8BbMo/Zp+/hBr5ANfixSQdzEE/RCEcII2n0?=
 =?us-ascii?Q?Uo6rYGDNz8miLX7Yp6WfqsMTieeSP5TmXZgtJXOk+Ry3gZOk5yp2du5XNIX3?=
 =?us-ascii?Q?f9qnMOQenNnRS/N7kXb2+LSCBM/s8GyS646Kr3spXdTgERAn4kk6QMotlcO+?=
 =?us-ascii?Q?BzGM49l9qdxHU+ewrU+U+PZ873NvvYUeq/fE9qtxHu2WrxzlNaNDq3yiAR+Q?=
 =?us-ascii?Q?y1DGtWVLK/YF23Sa/NArBdFhYPD2LcEYKQOVp5Bz00oLKI5wGrw70vji3Lm0?=
 =?us-ascii?Q?EkNH8OPT1Km9plKxXoFU5ZiRjKkEl4MO9ez3ZQK8t6Rx/8aDLmLBJstqpFJt?=
 =?us-ascii?Q?+yWV14DszLXvmJuzHTkfEFWvG72+ftw+0vYWCGFQlvwR4jRH0Ptnc4/49q/v?=
 =?us-ascii?Q?Hc8RW6Yl6XEBDMDkfJDjsbbNTwuwCq8+SORLMLGU77sBSBRp44WNL79yidf3?=
 =?us-ascii?Q?GXB7klOhdVcG61TsUdPehjtf7ZzIvEq8ogZzOlO/8c+0Wra3H+YwRJkAgYhG?=
 =?us-ascii?Q?aBiJoTVvHKJXOsWmbq2RzkeOAWqjlJVtxhz5b0H6PJ36xNVgtVbkEuaHtpr6?=
 =?us-ascii?Q?B0oi+36W3vS6IR80HdJS1GVD/CRSQSxw0R8vLnb2CE3DSjotNsW0AetNZdHe?=
 =?us-ascii?Q?XoRqnynfrPiqPXZcNpX2s9yRzV5nFgkP+hzNlIXP2QgZjA6MiWzKQUDRv598?=
 =?us-ascii?Q?VJwv+y1et6XxEJ17MNBGGwUfHhe4SCIalVVfYlCu5QSV+vwTgcGBDmyioqys?=
 =?us-ascii?Q?fCcQHZ/c9uad+ce17t3Jb1ZNXwDQASa/V4vke7nr3TR6go7lguc9u80HXcZv?=
 =?us-ascii?Q?16iPX+HhkrF2jSQgRENgLp9UcSgfBxc2SACIjMtpmvtJn6mZ+MWI7Z5VIzfJ?=
 =?us-ascii?Q?3Ghz7vA4lqFFXHcZbcnqh9R5U7nrdRbsR4FnWKyFwzWh5r1L+WAc0BjrbLO0?=
 =?us-ascii?Q?wEZUV8ouqj1x9k0h/qarZxRO+cPcOol9WIDnJ7TxUoma5w1OxpptNHz60Er4?=
 =?us-ascii?Q?UXEdptUOsK6TPQJFEqJ7P5kbeCMNr3oFJGh1p28krrzkzn5jKrQnPnJmS4oD?=
 =?us-ascii?Q?1fgFHVpSPh3gyQLzNulHMAfn9ngW/XIvqPehC5p3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9289e8d4-0005-4fb7-5280-08dcbc780594
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:44:45.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxmJSDQYqy0xNlTvRKBKoODUHb+ghOtBVFYstWCU3A/MWfE6SnQM2GF5FVOEg9ezVAE8fl2MgK89N1jmFVgonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8534

On Wed, Aug 14, 2024 at 12:35:41PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make the error paths a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 8c91e595d3b9..869b5e7c15ed 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -179,18 +179,14 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  	}
>
>  	dwc3_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> -	if (IS_ERR(dwc3_imx->hsio_clk)) {
> -		err = PTR_ERR(dwc3_imx->hsio_clk);
> -		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(dwc3_imx->hsio_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc3_imx->hsio_clk),
> +				     "Failed to get hsio clk\n");
>
>  	dwc3_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> -	if (IS_ERR(dwc3_imx->suspend_clk)) {
> -		err = PTR_ERR(dwc3_imx->suspend_clk);
> -		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(dwc3_imx->suspend_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc3_imx->suspend_clk),
> +				     "Failed to get suspend clk\n");
>
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>
> --
> 2.43.0
>

