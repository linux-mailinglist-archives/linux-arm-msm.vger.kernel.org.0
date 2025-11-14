Return-Path: <linux-arm-msm+bounces-81889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7DEC5DCA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B8185028B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082C0329363;
	Fri, 14 Nov 2025 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Azbldzaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EE3254A5;
	Fri, 14 Nov 2025 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132028; cv=none; b=iWmEidvq6Gepi+y2my26+zygyBGIc3GCj+QMHybc7AxWbPumjYVlDedU+V2ww1F4MgqLkZO9r4ZaRzx2YhrUfY51LaG5Ss2w8UJTmAAvq4Z/MxQy8AVM++8q9pFxYDBVNXdqByK2FBsK2LmqCGnNbctX9GZDAW5vp4kNPEdZbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132028; c=relaxed/simple;
	bh=Ro/DF230ZGwthADA1lsr1FsD+fogDSrK16pFZ2ozOzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swxY9pwv7u0xg0Xfq1FtXl9sHozbameqyjFER/YZMidHsPpzuf2EtAhCr7HO5R6KzyijQW63q9NSry+WSZjgYE0oWw9HtsXbIO63h7Hfit4Dn7QAGmAWpJLxPOtukZrJ3iDuxEpO+8KNcNJScvzd6tAh1Gy0JHvnzKWsZsxDM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Azbldzaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D07C4CEF1;
	Fri, 14 Nov 2025 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763132028;
	bh=Ro/DF230ZGwthADA1lsr1FsD+fogDSrK16pFZ2ozOzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzbldzajoFm89ifePnj3q+hKc0BQlawjtpqydnTs2RlBdV/vJg4oT27SVuILz0FxR
	 GJY8ItMS7YhGfRkj3WwF0ykprGQ9Zvg81Z1oXqV8BcmiMyLNiPReu4R4eI5ydEuY3f
	 CzWUyKIMy5t2KOYmjfamKVwpuhOXyvuK7c9wtrLqsM7PoiUDvjkPGKiEKkkLCEXSv1
	 FdiWvLI0ltZtmBRlEkluHIa9udlsrDkFIqoOwt5Ze03fiDDe1a9QE5VGvl8beAiEew
	 R+Rct3HTgDEudzBRGyz0vR+/0Zp4KbTdejNBuqSjP1KZpaKaxB2nogHcaShNBbmrLe
	 9y9u/sehJ5bZg==
Date: Fri, 14 Nov 2025 08:58:15 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V2] mmc: sdhci-msm: Avoid early clock doubling during
 HS400 transition
Message-ID: <e4t2tutkygmka6ynytztjy47mey3trwekyyzxx7dzyqnb3xmqq@3gk5zgj5kvqg>
References: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 01:58:24PM +0530, Sarthak Garg wrote:
> According to the hardware programming guide, the clock frequency must
> remain below 52MHz during the transition to HS400 mode.
> 
> However,in the current implementation, the timing is set to HS400 (a
> DDR mode) before adjusting the clock. This causes the clock to double
> prematurely to 104MHz during the transition phase, violating the
> specification and potentially resulting in CRC errors or CMD timeouts.
> 
> This change ensures that clock doubling is avoided during intermediate
> transitions and is applied only when the card requires a 200MHz clock
> for HS400 operation.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

Thank you for cleaning that up.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Changes from v1:
>  As per Bjorn Andersson's comment :
>  - Pass "timing" as an argument to msm_set_clock_rate_for_bus_mode(), and
>  then pass host, clock, and timing to msm_get_clock_mult_for_bus_mode() to
>  align with the original intent of the prototype.
> ---
>  drivers/mmc/host/sdhci-msm.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..3b85233131b3 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -344,41 +344,43 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
>  	writel_relaxed(val, host->ioaddr + offset);
>  }
>  
> -static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
> +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host,
> +						    unsigned int clock,
> +						    unsigned int timing)
>  {
> -	struct mmc_ios ios = host->mmc->ios;
>  	/*
>  	 * The SDHC requires internal clock frequency to be double the
>  	 * actual clock that will be set for DDR mode. The controller
>  	 * uses the faster clock(100/400MHz) for some of its parts and
>  	 * send the actual required clock (50/200MHz) to the card.
>  	 */
> -	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
> -	    ios.timing == MMC_TIMING_MMC_DDR52 ||
> -	    ios.timing == MMC_TIMING_MMC_HS400 ||
> +	if (timing == MMC_TIMING_UHS_DDR50 ||
> +	    timing == MMC_TIMING_MMC_DDR52 ||
> +	    (timing == MMC_TIMING_MMC_HS400 &&
> +	    clock == MMC_HS200_MAX_DTR) ||
>  	    host->flags & SDHCI_HS400_TUNING)
>  		return 2;
>  	return 1;
>  }
>  
>  static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> -					    unsigned int clock)
> +					    unsigned int clock,
> +					    unsigned int timing)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> -	struct mmc_ios curr_ios = host->mmc->ios;
>  	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>  	unsigned long achieved_rate;
>  	unsigned int desired_rate;
>  	unsigned int mult;
>  	int rc;
>  
> -	mult = msm_get_clock_mult_for_bus_mode(host);
> +	mult = msm_get_clock_mult_for_bus_mode(host, clock, timing);
>  	desired_rate = clock * mult;
>  	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>  	if (rc) {
>  		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> -		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
> +		       mmc_hostname(host->mmc), desired_rate, timing);
>  		return;
>  	}
>  
> @@ -397,7 +399,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	msm_host->clk_rate = desired_rate;
>  
>  	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
> -		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
> +		 mmc_hostname(host->mmc), achieved_rate, timing);
>  }
>  
>  /* Platform specific tuning */
> @@ -1239,7 +1241,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	 */
>  	if (host->flags & SDHCI_HS400_TUNING) {
>  		sdhci_msm_hc_select_mode(host);
> -		msm_set_clock_rate_for_bus_mode(host, ios.clock);
> +		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>  		host->flags &= ~SDHCI_HS400_TUNING;
>  	}
>  
> @@ -1864,6 +1866,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_ios ios = host->mmc->ios;
>  
>  	if (!clock) {
>  		host->mmc->actual_clock = msm_host->clk_rate = 0;
> @@ -1872,7 +1875,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  
>  	sdhci_msm_hc_select_mode(host);
>  
> -	msm_set_clock_rate_for_bus_mode(host, clock);
> +	msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>  out:
>  	__sdhci_msm_set_clock(host, clock);
>  }
> -- 
> 2.34.1
> 
> 

