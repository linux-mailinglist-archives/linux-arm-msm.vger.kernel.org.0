Return-Path: <linux-arm-msm+bounces-37446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF919C3985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA891F20EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218EE1591F0;
	Mon, 11 Nov 2024 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCjNU1ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6120820B22;
	Mon, 11 Nov 2024 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312699; cv=none; b=Vk1arJYaNGO39x1vYcDzRRE/A+okmrJStiGChC9Q5Jio5k/EnLkOgyUfu43GfvbgkZS1l3iskf4oXtySKdq2sKti9o7WdFZstsr5X6QuLgCWnTGtKD7I+44WFhsgva55pLxHPkTdGFBAq+8c8sxfrUQI84X6Br5XvTWbof+wGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312699; c=relaxed/simple;
	bh=6jJwGR0OZ353UMWH14ChXmJeglWJyzDkeiqIAP0cUxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMw2m52GPp8v1IculZBjsQIDI5zL18Z1jqHbqn7OWuG15SOVVS8BLdBpeWTkrYXigVGCJd9thMeFLTpgP3lHzm5LJs8Xh3l9V+rPNKRQlSI324yVe0vsowZEYQ1bEkRg588lKZOpGYyegB/D/eLQszJt+henF9fehJvWI3CnXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCjNU1ay; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312697; x=1762848697;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6jJwGR0OZ353UMWH14ChXmJeglWJyzDkeiqIAP0cUxY=;
  b=SCjNU1ayPbVReZIuXu7ZpVuIUDOjXAskh1qxYFFwuJEbxv6nN/k0VCfN
   zXIEnbUhlMyTR0pwnFt1b7Gik4H0U4ZZSbGP44pm0yFGCZvGdJ54NbQLS
   Blb212lZ1B0C4zUI32oCvXSDWbzLW0Z5cT/Q15NsEjozy82q0gftMplub
   KKakVAjfvaacBQfUMLQhss8DzDPvp3Ai6vhzAXqfmcbAdsVh037FEtpiQ
   +bT51dvOlFtx1SmlX1rQdbVL1PDz05wlz4lm7SNZX/gsau8kibf1YvDjd
   DaxbqkDSrfIrxuOMYSUZknO9zljtiY2zrKZyORagCW7ugneeHNfzjeCFR
   g==;
X-CSE-ConnectionGUID: LJhndhDzQKCII51nSIuXMA==
X-CSE-MsgGUID: z2zq8dCOQq6+nCqHkWD+7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="48627845"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="48627845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:11:36 -0800
X-CSE-ConnectionGUID: 9UvOKwY+QPaH+OraXzd1iw==
X-CSE-MsgGUID: E5WE2EC5QXKGuu4eJJefXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86962891"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.89.141])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:11:31 -0800
Message-ID: <48df0005-34d1-4bac-9517-16dc6018aa85@intel.com>
Date: Mon, 11 Nov 2024 10:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, kernel@quicinc.com
References: <20241105093513.16800-1-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241105093513.16800-1-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/24 11:35, Sarthak Garg wrote:
> Make sure SD card power is not enabled when the card is
> being removed.
> On multi-card tray designs, the same card-tray would be used for SD
> card and SIM cards. If SD card is placed at the outermost location
> in the tray, then SIM card may come in contact with SD card power-
> supply while removing the tray. It may result in SIM damage.
> So in sdhci_msm_handle_pwr_irq we skip the BUS_ON request when the
> SD card is removed to be in consistent with the MGPI hardware fix to
> prevent any damage to the SIM card in case of mult-card tray designs.
> But we need to have a similar check in sdhci_msm_check_power_status to
> be in consistent with the sdhci_msm_handle_pwr_irq function.
> Also reset host->pwr and POWER_CONTROL register accordingly since we
> are not turning ON the power actually.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..443526c56194 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1516,10 +1516,11 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> -	bool done = false;
> -	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
>  	const struct sdhci_msm_offset *msm_offset =
>  					msm_host->offset;
> +	struct mmc_host *mmc = host->mmc;
> +	bool done = false;
> +	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;

Please don't make unrelated changes.  The above 2 lines
have not changed and should stay where they are.  If you
feel the need to make cosmetic changes, make a separate
patch.

>  
>  	pr_debug("%s: %s: request %d curr_pwr_state %x curr_io_level %x\n",
>  			mmc_hostname(host->mmc), __func__, req_type,
> @@ -1573,6 +1574,13 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  				 "%s: pwr_irq for req: (%d) timed out\n",
>  				 mmc_hostname(host->mmc), req_type);
>  	}
> +
> +	if (mmc->card && mmc->ops && mmc->ops->get_cd &&
> +		!mmc->ops->get_cd(mmc) && (req_type & REQ_BUS_ON)) {

It would be tidier to have a separate fn for calling get_cd()
e.g.

static int get_cd(struct sdhci_host *host)
{
	struct mmc_host *mmc = host->mmc;

	return mmc->card && mmc->ops && mmc->ops->get_cd ? mmc->ops->get_cd(mmc) : 0;
}

and put the other check first to avoid calling ->get_cd() for no reason:

	if ((req_type & REQ_BUS_ON) && !get_cd(host)) {
		...


> +		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
> +		host->pwr = 0;
> +	}
> +
>  	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
>  			__func__, req_type);
>  }
> @@ -1631,6 +1639,14 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  		udelay(10);
>  	}
>  
> +	if (mmc->card && mmc->ops && mmc->ops->get_cd &&
> +		!mmc->ops->get_cd(mmc) && irq_status & CORE_PWRCTL_BUS_ON) {

If the card is being removed, how do you know mmc->ops
won't disappear under you?  You need READ_ONCE otherwise
e.g.

	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);

so like:

static int get_cd(struct sdhci_host *host)
{
	struct mmc_host *mmc = host->mmc;
	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);

	return mmc->card && mmc_ops && mmc_ops->get_cd ? mmc_ops->get_cd(mmc) : 0;
}


And again, put the other check first e.g.

	if ((irq_status & CORE_PWRCTL_BUS_ON) && !get_cd(host)) {
		...


> +		irq_ack = CORE_PWRCTL_BUS_FAIL;
> +		msm_host_writel(msm_host, irq_ack, host,
> +				msm_offset->core_pwrctl_ctl);
> +		return;
> +	}
> +
>  	/* Handle BUS ON/OFF*/
>  	if (irq_status & CORE_PWRCTL_BUS_ON) {
>  		pwr_state = REQ_BUS_ON;


