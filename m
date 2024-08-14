Return-Path: <linux-arm-msm+bounces-28517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EE951ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5E51F2315B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EDC1B4C5E;
	Wed, 14 Aug 2024 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U3XMrRou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C11DA5E;
	Wed, 14 Aug 2024 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650250; cv=fail; b=YINC9/IwgSU43tIXeCZhCkBnl08a8QVDR7c3lkMQoQLgVXdRM/G9RDS1hpBQ3XFjuLA9ZBqr7Coxmr6lP0Lt5VR7yJW5b9shF0jizIUqlMWVp7D4J5sKxw0gPbfqs3dirJIQMvDNeUuOJdhICNmCxyfdBGtP8WeOeOz48aAAWOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650250; c=relaxed/simple;
	bh=4bGX3eSrNXsn6admyKUXWtCLcsmWf0Af5YBOc83gkKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N+toSdXhvsRDONhFKxkUYXn2PcjP7JeXyiRhHi9Q8xRE4bavc33p3GLupLCptLPmO3zMi/XgtqXar9QQBvYKxAdSBalm6v9aE5cQ/S34Tfvux5SBrLTuV8/2kKkXZVb830y37IKKYfhBllwpj6TAm6qdGmpUMvX01JQ6obFinoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U3XMrRou; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcnqLDlMDKvLK984EPY1Y7N5lc5J9nJF7qqbLtkvDLEPeiDLb1hkD/hjbXhfKvjybBGni48Aff+YujYo6jEZDDIAaR02NXmyOUbJhJIBQFZEIGgarQScFZOSj0gwQG8l8PbUrjB0vx+y+Bdffu1z1Zf7DnQjAjcUxaAxYhbYsxQZW7iquzP9jQK1Awvmhluf7XhpQIrSDqYZrZDqvsyOKuQpW9Wudc7bqkNpyLgEOFolEjWsIi0IpJ9mRxbqJ+pM/r79TewTEC8fZBcEaE0+xMk5edkbC5WdsNYVLk8H7bTyWiOnRHzIB9oV41Q/c41ksTAyNJAn/OfLcByfNn25qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgokJyDG+uFepb9URKFujXW/dxMEkFKj5NHHhL+HcZs=;
 b=gbpO/BN6xdyzxnwZERFsE/G8Ra6npDsKdM7yb/3+NdEK/9NVHMV19VM4RCx0TfKDc5ip1r1WRn/PAHiAk80BZI/43PixaRc3+ivTQWOi0VPcH1L9lx60WeTdmwsEdo7v0GFOXH2EW3U9tO2tan+JTdkbU2nEIBw3493isNex1pXbjZe6ppR8cBvV9nwCMTzrp/cBrBH0+Uenv/Vg+a00Zbx5AushYsYkUeloeGUr1wBaHbSDoEL5Dz4h1WYSdtnrRxD344mZyIe9yL7MG0WXHtl8MFi1Tsq0gGonXHOcAbyvgsxguNFkJoDYrPsI8reuEcKwFdTtookHDG1ByzXoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgokJyDG+uFepb9URKFujXW/dxMEkFKj5NHHhL+HcZs=;
 b=U3XMrRoucuW977x+pPOb4YfD6HDIJDOKssQMHURpmiJO/aNvuflGiUssVwZn94vJVye2qrsUpdQHSq9yarf5SL+9DMDvmxj7WocyaTCUZi6r41eXfQ6fRDxwGGIEbI3i0YPxUGcGdtzfrSfqQAoTsK6rF12z8poCgOYv6LjHUzcE9W40ZqhVIktmf11bZZh1yKgtaaYLM0/5ZmPqp2cXf4Ino9dCzgijxyjzXnbQTzk2cm3hsdsWhL5V6kmhTcJLINa5J9h+nFLUiLO2Jmr4BXdECcz/t/NLl6oj2PoGOjPLbpA/LCyBxSko5N1yoZXcVFSB2h3F7u45mdJPi2m9hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8534.eurprd04.prod.outlook.com (2603:10a6:10:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 15:44:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:44:05 +0000
Date: Wed, 14 Aug 2024 11:43:57 -0400
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
Subject: Re: [PATCH 06/11] usb: dwc3: imx8mp: use scoped device node handling
 to simplify error paths
Message-ID: <ZrzQvfSa7Q9MGdRp@lizhi-Precision-Tower-5810>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-6-95481b9682bc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-6-95481b9682bc@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec51e49-5458-4a2e-674b-08dcbc77ed9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	xVuNXzZ4noY3MDraMRmIn2gJX3+Jq9bGqk+cOn70GSGydusvh0ihamTsZJ1KwjFF9JBe9QY+PIKfvToSW5nz4uAV+O2IXI5gNGI0gegYXanAGEI/Dq2BMw5dbh5pISrgwdgJajTens4XjqicVGNAvm7Sxt4EXQ4L/v1LwwLMqHuYnGhCI8cpnKZx6WM8ZLWasrP+W02BJJsAqSjHGMCoAuDEzVdvGgdFhAqRRf+ogLZRS/lhim0/seavsjuQ4yPd05SartRHs1Y1y9EBx/CVCZyRwLXLcJJxV2AIvblENHLDX4kR0LZjC2qSIx77Kwzexu2ZSp4j4ToZQ0I9MSi06wAaEMKbPJUmAU3lzJoUAl/xcSAinkSBVDa5cLgnj2MHTJrZPHcwLzI01tCRn0lSLjvPBy6Bu9qimpsYcJdN5NMmBZE7t7FtvCq/DE8lhGeIhuS5PXQ1YLy2QlsQ74bgEH/wvvI6+f0Pxj4eiUBO8tH3/c3wCNiYfA/U+H6TXtV5dyiF/5NpG+ecu3G+SwmE4eYp1k5M9ai3sabgE5Ab4wYOQ0bQZ4UQQKvBfvTwr0WzA1cKble5VvcgtTFjqWa3m8ul61CK/LxL/jIH1GRZWvTXA13y+AeH38B5jPzFQ67j82JSfIUoBMtOLrNaSmGarGFw8X8G0A5H+q3nO10le8dirT13+QgnDwNAcnB/6vWeF3tnXrZyNOFQxGN9foOje8rytgJvudNH9zEIuP0ZyIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdtn5q2LDL+xgxi/9qHw+GAcc4FUpPNIuCBN8m0Ay39DrwW1m/hbXnBMvweP?=
 =?us-ascii?Q?qj720OOf6Ixz6C2SBCaOg3bTo8eUqsTre0x4BI5frLWF82LWy814GB/39+lu?=
 =?us-ascii?Q?om81S77qWUgiQiAPs7kjn5AZY9nmo9H0kbTQOWS/1WrHVmS2VvokOkaGR2fI?=
 =?us-ascii?Q?CjoRWz9bFE7dUyeDeHxCK/B9l2tU94VPUrEZZDNbsgnBxoIcaM/hMR+eHg+d?=
 =?us-ascii?Q?gcdecQMoQiSoMPxvQOxVRNJYkwEjZgM/Y3nZXfGt6osCLS1CPKK6Ibrz3ISL?=
 =?us-ascii?Q?g3jCkiDnQOBZ/EKg2a2GBLzUnp3Mzjys0O61U8eaQiUx9E7AQQOgYWRqTtzi?=
 =?us-ascii?Q?Spgem/cqQ73VekFiBtxtS7PHULtuR5Nug1Jb4TdeasAw3v3ZkXDyEa5Mn4R0?=
 =?us-ascii?Q?cPh6MCdzcx/X+96F/KGbhwlzqvCiJQ/BAi/QK0MaZPd/c0zrUavKoJjOEi9d?=
 =?us-ascii?Q?FRw0/0p9HO7FsYvMI1dMWF4nu/7anFDCT+tb2PIhji2AVoFZ1eJcbt+gu1h4?=
 =?us-ascii?Q?m0sbYEWooahzUjlD5qaIvFdD662AvZONXmerXodCPCK66hVRMToJlnIdU1Of?=
 =?us-ascii?Q?KekB3SghaA5Di1Dt/wfTLkQsxpmKARwjQRJMlAZU8WWJBzTAiMNTgGtXT6kM?=
 =?us-ascii?Q?ytiTOoTmuabro8ONWYzz7sy6N7rveZ2TM5uQ4HGujxfN+B242ZfLiJ68yo3j?=
 =?us-ascii?Q?0e1YtH99FJy8eoInVQN3qdYb/g2VW6pePj2TiCjfLef1h5JnGrK5Xs90n2pK?=
 =?us-ascii?Q?xjj2mC3E5oEi9gvBDPzlLwcQCz4RsI9TkeX6JLr9v/2L9c5RWN8smsG6/aqS?=
 =?us-ascii?Q?DMxIyVvFZuFEv9eV+X9GQ7qfG9rw3zzAt1YyLsLykN0mmeWTuw3pav96mGOu?=
 =?us-ascii?Q?kiDBmXvaVphaFzD1/DA3G+kQyYM0zVpj5lv+EisbD8zT7McKtQ6V5+zRwreB?=
 =?us-ascii?Q?5ECQ66skL5tqGWNTCMHB2uMMVGMm27uOuPFCVyK0MkYap0ZJFQEPlUOcDlFn?=
 =?us-ascii?Q?bufzoH23wtQ0SFY57Plc9JewWhVjR/zB4+I6YtGRV5RQ31aQYQv6fISp0Jzp?=
 =?us-ascii?Q?+NBOFqLgCkdZ0T6dbgxQS2dL7MuelrDdfUbq3iEfssHc6Ai1ry5dSSncuUnB?=
 =?us-ascii?Q?MCTcUNvzXZ+I/NxEs3BEylzMuKXaPTt3cPL1YtMtw7drm2fAxJwTD3qfyWV4?=
 =?us-ascii?Q?0Y4IBHb7yQINN2anCHzT77Q2c4uTHggeOCjIRQaanfmt0r8BNqne4UVaWO1d?=
 =?us-ascii?Q?QxJVXecbOIYjjSeY163XthO2YeSpENyazzhr5xkoxnGeIedBfTC24KdBKuiC?=
 =?us-ascii?Q?3yO3tiRcBAxNjEzwAoJmobgne5bJOS94a1wEi7SO40afv6aF43ujR+9eAXLZ?=
 =?us-ascii?Q?Q0Lwo4bam9RpNKULQFCs+o7YjnHfGzwPb9U1k/3d8RrqS4NI2gHayMs3ggB3?=
 =?us-ascii?Q?8b6+MP6zEWDsQY34ODv/RDayMre8LRL3HGypYgFxn1Gw4zNL8XDXi7PMSiGS?=
 =?us-ascii?Q?j1sYRxCTR5QzsTcSVf7vmeME9rKoojxxdjAvg3BLFUgPwaj1Gct5/DsrtxVd?=
 =?us-ascii?Q?htNyP+mEcF+aR61hz8Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec51e49-5458-4a2e-674b-08dcbc77ed9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:44:05.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIG4YWAwyTGIgpQ3JBOTXtbLBO72wkfKUhx+YlPefa9b2tXdYWz41c5eJ4c1/zlSqmNYJjJVu1mc+QdaC61UzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8534

On Wed, Aug 14, 2024 at 12:35:42PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.  Scoped/cleanup.h coding style
> expects variable declaration with initialization, so the
> of_get_compatible_child() call has to be moved earlier, before any goto
> jumps happen.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 869b5e7c15ed..8b88649b569f 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2020 NXP.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -147,7 +148,7 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>  static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev = &pdev->dev;
> -	struct device_node	*dwc3_np, *node = dev->of_node;
> +	struct device_node	*node = dev->of_node;
>  	struct dwc3_imx8mp	*dwc3_imx;
>  	struct resource		*res;
>  	int			err, irq;
> @@ -193,6 +194,11 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  		return irq;
>  	dwc3_imx->irq = irq;
>
> +	struct device_node *dwc3_np __free(device_node) = of_get_compatible_child(node,
> +										  "snps,dwc3");
> +	if (!dwc3_np)
> +		return dev_err_probe(dev, -ENODEV, "failed to find dwc3 core child\n");
> +
>  	imx8mp_configure_glue(dwc3_imx);
>
>  	pm_runtime_set_active(dev);
> @@ -201,17 +207,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto disable_rpm;
>
> -	dwc3_np = of_get_compatible_child(node, "snps,dwc3");
> -	if (!dwc3_np) {
> -		err = -ENODEV;
> -		dev_err(dev, "failed to find dwc3 core child\n");
> -		goto disable_rpm;
> -	}
> -
>  	err = of_platform_populate(node, NULL, NULL, dev);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to create dwc3 core\n");
> -		goto err_node_put;
> +		goto disable_rpm;
>  	}
>
>  	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
> @@ -220,7 +219,6 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  		err = -ENODEV;
>  		goto depopulate;
>  	}
> -	of_node_put(dwc3_np);
>
>  	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
>  					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
> @@ -236,8 +234,6 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>
>  depopulate:
>  	of_platform_depopulate(dev);
> -err_node_put:
> -	of_node_put(dwc3_np);
>  disable_rpm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
>
> --
> 2.43.0
>

