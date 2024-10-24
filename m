Return-Path: <linux-arm-msm+bounces-35732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BA9AEF70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7DBC1C22020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5102003C1;
	Thu, 24 Oct 2024 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tV3jxGOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DE2003B3;
	Thu, 24 Oct 2024 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793569; cv=none; b=ddcCsqJvXBUFhUq/pArGjmycJaxT5tqzsNFkCPllphWnodGoTigM3e+cjVIIsRLgqcWqUlczdsMrZJyEklNwG1Oe4UwJt93U6Fq/iNa17XT+frNpUm2RN7xWZDaaKt9ArTeN5U/VGir9I8FsNH0LjR5kjXQ1tyDvhmhwoH73q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793569; c=relaxed/simple;
	bh=0TgSPICy9GnD2ZCno7GjLIa3ps9j1BQqoM3AdyZm85g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOFF1TfoTj9X6mndcLr7upJ6icilEE/H9sRyAHZa3ami9SEtcuOC0h4yHWStwoisXXprsMDHXqSS/ARMfr/yHaeKIgPb4Fckq2WBsS92hEaCQVKcZosBJ6VQ3YVK0PYjLqAqo/mf1CbmAF3mGsUrN1YGwXHRcN8hjz8XgAeSmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tV3jxGOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA7BC4CEC7;
	Thu, 24 Oct 2024 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729793568;
	bh=0TgSPICy9GnD2ZCno7GjLIa3ps9j1BQqoM3AdyZm85g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV3jxGOW3PgajFD4afYo/ICTxja3KcvJhAtNj70eG7lBlVm1FaCCiAU7m/gVWfUw6
	 wpBF8iC4n/1fTbdpI7XYnZPXIg0Y9nDuKN6kCx3Qb5B5yjcteh22KAVDzMErnF0SUS
	 eJ1X6hQhwbk/7ZrU3t4mBsUx6hGfsPEmS1X7D5l2hDRqpWkr4leGQTrc7ourDbvf2e
	 gMVaK3u2pQz2GFqTTPRXL4gZDtQ9CTFtGfZlq+jWAW9DFtDKOh35EhDCCnC+1+0rxe
	 dDeLQ85wbuAFaE7xBWMRYcW/1RmdZHlUWUec5ZaQErcTberv6NdP5S2Qh96HkBNoaA
	 olLRDRR8krnlQ==
Date: Thu, 24 Oct 2024 13:12:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, 
	kernel@quicinc.com
Subject: Re: [PATCH 1/1] mmc: sdhci-msm: Toggle the FIFO write clock after
 ungate
Message-ID: <n5dd7fblsfppyfci3fsxyqqchc7pdaml2q5737hprbi2q6wvso@rig42wwnyad2>
References: <20241022111025.25157-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022111025.25157-1-quic_rampraka@quicinc.com>

On Tue, Oct 22, 2024 at 04:40:25PM GMT, Ram Prakash Gupta wrote:
> For Qualcomm SoCs with sdcc minor version 6B and more, command path
> state machine is getting corrupted post clock ungate which is leading
> to software timeout.
> 
> Toggle the write fifo clock to reset the async fifo to fix this issue.
> 
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e113b99a3eab..c2ccdac21232 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -146,6 +146,7 @@
>  /* CQHCI vendor specific registers */
>  #define CQHCI_VENDOR_CFG1	0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
> +#define RCLK_TOGGLE BIT(1)
>  
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
> @@ -290,6 +291,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool toggle_fifo_clk;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -1162,6 +1164,39 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
>  	return ret;
>  }
>  
> +/*
> + * After MCLK ugating, toggle the FIFO write clock to get
> + * the FIFO pointers and flags to valid state.
> + */
> +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
> +{
> +	u32 config;
> +	struct mmc_ios ios = host->mmc->ios;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> +
> +	if ((msm_host->tuning_done || ios.enhanced_strobe) &&
> +		host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
> +		/*
> +		 * Select MCLK as DLL input clock.
> +		 */

Seems you could fit this in a single-line comment, perhaps with an empty
line above if you want to create some separation(?)

> +		config = readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3);
> +		config |= RCLK_TOGGLE;
> +		writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
> +
> +		/* ensure above write as toggling same bit quickly */

"same bit quickly" is completely arbitrary. Please state exactly what
you need to wait for? E.g. is it some number of some clock ticks? If so,
which clock and is it 1, 5, or 42 ticks?

> +		wmb();

This does not guarantee that the write completes before the delay.

If you want to know that the write hit the hardware, before the sleep,
issue a readl.

Regards,
Bjorn

> +		udelay(2);
> +
> +		/*
> +		 * Select RCLK as DLL input clock
> +		 */
> +		config &= ~RCLK_TOGGLE;
> +		writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
> +	}
> +}
> +
>  static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
>  {
>  	const struct sdhci_msm_offset *msm_offset = sdhci_priv_msm_offset(host);
> @@ -2587,6 +2622,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	if (core_major == 1 && core_minor >= 0x71)
>  		msm_host->uses_tassadar_dll = true;
>  
> +	if (core_major == 1 && core_minor >= 0x6B)
> +		msm_host->toggle_fifo_clk = true;
> +
>  	ret = sdhci_msm_register_vreg(msm_host);
>  	if (ret)
>  		goto clk_disable;
> @@ -2720,6 +2758,9 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>  				       msm_host->bulk_clks);
>  	if (ret)
>  		return ret;
> +
> +	if (msm_host->toggle_fifo_clk)
> +		sdhci_msm_toggle_fifo_write_clk(host);
>  	/*
>  	 * Whenever core-clock is gated dynamically, it's needed to
>  	 * restore the SDR DLL settings when the clock is ungated.
> -- 
> 2.17.1
> 
> 

