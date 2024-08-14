Return-Path: <linux-arm-msm+bounces-28520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A831951EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0E61C21A89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705191B5833;
	Wed, 14 Aug 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DKx7XT2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11F1B4C5E;
	Wed, 14 Aug 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650329; cv=fail; b=dARP3b0ucQVAiyNq+gyfUAabJsbTA19LXGNzU43eU9G/9u2aN0hPSWK+PE0sJ/X/ENLHIBOZkx83cmRl2AMzL38AbMnrURnJWMCuD3TTZFTLS9CX2hn4Bhh7GW8PHDdqsM0ajGWNFxWS1k0IA01SYHTaZEoiRWVhFi+c2z5OLcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650329; c=relaxed/simple;
	bh=8h1gbkoMGFwU/2spaXVVOLNvjbi3RxrdCXqghI8bbXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vAfHb/OIvNQSTzhTJnO+Z9ri681z5G/sqeD5Ineha/ydNT8un35WfJWpylvYZsV6dnnVi9ijyBG4r0TWnVijS2SRm0FSO5y+lFvDdSse7LFdZyTQz/2DQHidbtHgovnqS+XX/aO99P1nDymgXYtIStO9ujRzN+EWnGrj6aLSw1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DKx7XT2o; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2Z936vUKikEC46gz0aW6UN2C/TdwMgHDL4kAHv9aBXhmcJELZ3+I7Drc4LgruzshvUk7PxPq10OsMtBUXMj279GeeFbVBVmSduyC5uSha0YJ1swvYsdE3Mu+Wf/2DQKTPbapDNsYc9MnOemGGtBB2KM5Paz+bTzopZ5EyEH0JmT9dMzYZwtjvXc7/esMm9wvyErHRYUXvI7XyvGaMrCCb2tMaCUlDRXUZFP+3u/RXbu8dm8CfNaXZvri9Iih8X9QJa8qrHLFmCglVRL/6S+OzB6ORPjH7Avfx0C5aMiQLRWMpIQ25Tf/e8smpuYZQ/vGD2VxxUrggMWkY0CFkYCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mokccAiMNLX4Y3aa5oiORLbplIkUg1JHbLLL8+qTPmg=;
 b=iLF45SBy0IuS6rDMHGGAVVsngHRaPVz9D6l8VsInE0NsQ7Ue/Iauct/Y9M5aHkoMkRd/gT0FcEPg0UxYsJP3K2Weay0fDjihLCWYbdl3u5TDAWi1V+hhB9WPQHP7Xt3C7eUgAbzf4eGnLoTX4ncTd9PmaqoqXa7dKWhFlHKtI7K4JlkqqMRBcTcozJgd2IHUI+AIchwiqPpEd7ZzNQyTFBbQQkw8MsqeHoZpy1dLQzoAPLFmXDJUv1BAzK4IyhWrtmjNy+w0Zupj+cfEFYCNq0VP39O1aoFTBm+1rpGhev6/H8QTAvwwnCCWaoeGzNOMvx+DVimABl2V7u9HBVx07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mokccAiMNLX4Y3aa5oiORLbplIkUg1JHbLLL8+qTPmg=;
 b=DKx7XT2ooKILIhKu0LftHAs15VtFoyL5pkhjPM2jhnuw3zFAm645PQ2pPO7+pl1SvrU78xLal3ovzSPMUHfUYqbieuWTIDhtPLmsvA9OhCweS1vxSNAM7hvxjiDx+6AEiLcoT/Xh7Ri/RidqJYtbFqyWSJN/FyK6eEoBvqbLu8EdvXHfIZpYsEBCVQHZzcwiSNsPJEcXFw0LvUmmOuZZo6sAWpVVJcUWBjC27Rg87Dn8/fUFy4fE3YhfPXc/SZknQ9MY+5vVQFZnBNNxu9Sv5QgKGWqn6iQRAZgL/RJsaHJ2OwgE26/B0qH7U/521qfDaSQZI9L3pnJyl2R/U+KQZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8534.eurprd04.prod.outlook.com (2603:10a6:10:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 15:45:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:45:24 +0000
Date: Wed, 14 Aug 2024 11:45:17 -0400
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
Subject: Re: [PATCH 04/11] usb: dwc3: imx8mp: simplify with
 devm_clk_get_enabled
Message-ID: <ZrzRDdeyaVzZJ7NP@lizhi-Precision-Tower-5810>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-4-95481b9682bc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-4-95481b9682bc@linaro.org>
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d959d61-0dfc-4ff6-659b-08dcbc781cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	dIQ38/XlgSs1jqd8INU9LQdQdZ45VnywQYeWKeMyU+3j1FsCyxWd2TUNuguE0UgxfkwcxAfCaNCgchp+SiNhoPo/rC/Gfe/4z2aOnrLm/+INr+uS/ZPXHpUi55+TWrlJ40QbK+r6ybtXJhQzvdUwfj4mqA9DiC5mlMsUjAnBTxyLbAFD4E++yjbf7SxU7TJWAEca+c5lsCZXrdDpX1mnL7i+efm+9XWyyY/PXP7B7TQvU3GoL02Aj8xIHSOpw7bRwh2ijEXGxCXvpm/gTuqM+ceT+aaCGawCD0Jh40MEYhHPIzuAzggfuIbkvgaaANx81+ZkUnKDACV1LoOWl51Vxu3xLyQB+9OQM+4A90QkPsckoO2N1D/06FEA7koZJIt2or1iKLB8TfTeztTf+XW9bn+8XLZfZbuaxbDwrunA24Up7bpLZEVc5dHn5SAvarV1SUV3KVqPrnmPYfD7vtKRpB16b0rcYbEdMs1236dBxoIgWoNJJcW+bFOyNUj+TkeJyf8N1I+VcWNkrfJnNcTmkom0K5DmddA2f1dUHzNtf2H7ZR1tItSMJYwpXjF2XtP0IfpoV8f7jzw6ji7No3oAQLOsk26g2NzPihBHFqVnK7vYJIlj7m7OnURNiZZzY1tGHpSn0aLavFms4V8wUHqS/fMA1jvpvYYkjs4mfsH2faIwgPFGmYHoBCHgaNb/hz3u242kjW+Z5zSSII9cU7nomJehM7C1HbIQcMUUuonHdvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qVGgeVKtDzYvFLMY2HhF0Px3Jm1H6QxftX1D1Cw2Un558Wu+thd+tzuiqaBc?=
 =?us-ascii?Q?0ddWCKv0wZZ5iazAnPf0ZCQQ4roI0BT30zDc14Cq38tU8+fbH8fkpSCMxPaQ?=
 =?us-ascii?Q?DGIR+/ybBN+y37phquwS6puAtWNte8xnz1jSm99VDCa7F+5n4ULPtEudMiKg?=
 =?us-ascii?Q?0x+Oz4vuzWg8XP36pV6juZ+lF/7xYZwO10kVFw3ESKDtaPRG3R16YWuvTFhT?=
 =?us-ascii?Q?Zp2jFSRrLslpcvTXOwpBJdj/jCLfJ433+IHYE989KK99L9+BYXsQP5iU4jsD?=
 =?us-ascii?Q?d+7vWTSCQ2OfO1yli1VBbdw8QGxUwahX0+z+8QmvES80mEwJgf3775FD4IgF?=
 =?us-ascii?Q?eoQXnlSDD2sAfdaeD5sk/5Fo0/HEjwSuLgp0f69QruV2ThAFh3sPry5tMx5D?=
 =?us-ascii?Q?Xj5JBlM68ka5z/AX8NYfc/t9yZB24hKOT+IJsCYapA1djISUKM3EQrg3Yb71?=
 =?us-ascii?Q?GkIGjsHGIQ3HZo3OaKiD+eyNdkaZrT5KXipakVa9NzvIzubj+C1a4xOeDqBX?=
 =?us-ascii?Q?F9tz2WAq+rdLRP+VqGAXsLnzS3QE61MSH+OBDpfqu4idyOSbH4hpqKiaRjLu?=
 =?us-ascii?Q?iNZwBfLjHtz65APsr/5K2Wcc8+Ckr6+uqgcjJRQCzxgAtaWjwmU+4fHI7ORN?=
 =?us-ascii?Q?ZPFVskb662rHWohSfiSxI2KbjMgUJiaLNawYz/8U+00hgErIpR4lTQdo4Z4Q?=
 =?us-ascii?Q?IdynL7TOBN6C+KUk+XlswjN3ten9KtQ3sqO1sPuVQVOm7DuAXVCzRs88m6cO?=
 =?us-ascii?Q?1rybqjRAainsESaYV++4G2ethBMuJfOwaDmy9sJEDfIk7eN+3ug1vl+eG9uS?=
 =?us-ascii?Q?rsD2xlqp+n9YHCMQ+N09E5gnWPF0OfzD9Mo+N8bOZSr3uGizfUIjC4hTdxGt?=
 =?us-ascii?Q?TFUzrDdk+i76WSNsC+0vJ4lLzjJBF5tpCOAPYFR6b8VIns57ux2rSkNVRlKp?=
 =?us-ascii?Q?dYIJbm+WPG8kCxbk3F8Kd2tL+3T0Bh6NxFCbassHAEFZrrRGpi4jKtKEqYao?=
 =?us-ascii?Q?A9e4chQtDL0NabNh3ayvNjNIWRiKLHValGmTQEqkMEO/YlPnm/HDw6eCAkQW?=
 =?us-ascii?Q?idupeXdtguSTYXV8mQ2Ro5uj6Codor5KRv659MKpGyOoCwGiyQ/L1oTAt/zb?=
 =?us-ascii?Q?zI/K1U6/xXQt/n/rOc3uyvHipZ2WzgAubvXV7wKXAnYrw/KKTHWV7/9BF9gn?=
 =?us-ascii?Q?WmCoZwwHBsynLckxE5BEAwwjbN9wSgWUJY0cUK5xUjxvMsG4rVbE2bP5d/XS?=
 =?us-ascii?Q?TwcPQQzd41cQK7bxyUFD/stHgEr8GF24rI+SiUanwsId4Ik3Y7EWSR75BSC3?=
 =?us-ascii?Q?7FfiCPTINyjvH5mCdmXzuNNoz2x/FZhYsKK/Pxbf4eMB77ms05ERiV6aCqYu?=
 =?us-ascii?Q?Wvq85tvWoADWB4IT4+MwWXQhTfSOCFH47QkgCe16zu9/W6QxdGoaw6fn4jV2?=
 =?us-ascii?Q?OnyLBJrAXQa7mzvHqxrftvUWv98JOv5u8zPYQE+zK+6BoKQjIg3DrY52SpPg?=
 =?us-ascii?Q?eOWNHdh4hq7DfEQTtMr2b+lTHW3lFVT3PTIXV/4m/vAjIrle8xiR5AGpLDT4?=
 =?us-ascii?Q?3xCOUX8FTzxcUJUf8FM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d959d61-0dfc-4ff6-659b-08dcbc781cdc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:45:24.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1iDsx28p9YlFSWs8S1XMUB8VxnevQTt+whNPN+rbj5w/4r92/oE1P0LIMX3Gm60uHVDyWfpUO4vFaj052kUcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8534

On Wed, Aug 14, 2024 at 12:35:40PM +0200, Krzysztof Kozlowski wrote:
> Use devm_clk_get_enabled() to drop clock preparing and handling from
> error and remove paths.  This makes the code a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 32 +++++---------------------------
>  1 file changed, 5 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 392fa1232788..8c91e595d3b9 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -178,37 +178,23 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  			return PTR_ERR(dwc3_imx->glue_base);
>  	}
>
> -	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
> +	dwc3_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
>  	if (IS_ERR(dwc3_imx->hsio_clk)) {
>  		err = PTR_ERR(dwc3_imx->hsio_clk);
>  		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
>  		return err;
>  	}
>
> -	err = clk_prepare_enable(dwc3_imx->hsio_clk);
> -	if (err) {
> -		dev_err(dev, "Failed to enable hsio clk, err=%d\n", err);
> -		return err;
> -	}
> -
> -	dwc3_imx->suspend_clk = devm_clk_get(dev, "suspend");
> +	dwc3_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
>  	if (IS_ERR(dwc3_imx->suspend_clk)) {
>  		err = PTR_ERR(dwc3_imx->suspend_clk);
>  		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
> -		goto disable_hsio_clk;
> -	}
> -
> -	err = clk_prepare_enable(dwc3_imx->suspend_clk);
> -	if (err) {
> -		dev_err(dev, "Failed to enable suspend clk, err=%d\n", err);
> -		goto disable_hsio_clk;
> +		return err;
>  	}
>
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		err = irq;
> -		goto disable_clks;
> -	}
> +	if (irq < 0)
> +		return irq;
>  	dwc3_imx->irq = irq;
>
>  	imx8mp_configure_glue(dwc3_imx);
> @@ -259,25 +245,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  disable_rpm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> -disable_clks:
> -	clk_disable_unprepare(dwc3_imx->suspend_clk);
> -disable_hsio_clk:
> -	clk_disable_unprepare(dwc3_imx->hsio_clk);
>
>  	return err;
>  }
>
>  static void dwc3_imx8mp_remove(struct platform_device *pdev)
>  {
> -	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
>
>  	pm_runtime_get_sync(dev);
>  	of_platform_depopulate(dev);
>
> -	clk_disable_unprepare(dwc3_imx->suspend_clk);
> -	clk_disable_unprepare(dwc3_imx->hsio_clk);
> -
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
>  }
>
> --
> 2.43.0
>

