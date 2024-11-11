Return-Path: <linux-arm-msm+bounces-37454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E49C3A4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEAC1F22249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58AF16DC0E;
	Mon, 11 Nov 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4Ah/gO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B3216CD1D;
	Mon, 11 Nov 2024 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315497; cv=none; b=pieBTaqnRXl0g2u6GV5bWXByfcPJQzVrEwWzz4p82hAMYOROgEL6TO2J6CG2weiRElJ3yjmJnmO3aNB+PynoWe3waVv322pzH2H1/E7P37PQZ+997CnCjVQHfk7rTdZmjMVPCYFFgl+nh5gfqsI9pQvT7AzoFhMNj8ND9QYBdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315497; c=relaxed/simple;
	bh=FjLbHsVcjXYxleIwuWfg8xqDXhVTODDJ9HddDk5h+Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vC0slesn0RVOcXVRquKJcqE+3BQIErki+SKgNR6ToaUjkANS4Wm6BEysw8Yx69JJzd5eseLrlmPGT2oFhH3or6mRAdSu1rDS0fk6fAKAqqL9r0fXmwFuc9Rtl7I6WF1XTGQbzygLXcxnqtpFFqp/wrkK9idoEeqRfSY78YzahW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4Ah/gO3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731315496; x=1762851496;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FjLbHsVcjXYxleIwuWfg8xqDXhVTODDJ9HddDk5h+Ts=;
  b=C4Ah/gO3y+ssKAdYwkY6eDZZB5/ryMaEuUjEf7T91cZwqAcyVDrzug5p
   MUrOIQoL6wjL04cBZOGRhorLAIQ7UJi0qdiD+HaEhwjzNyps+devhZFOd
   K2mFYEIOifUSjvbQlLrQUa9ojcExwMErVeb1NcooWrBmDcYn6BcfMjmcb
   GlKR4n6A3mYvbHdWdx9xyD0ftkLWKlB67wdAbRxBS3ZwlC+f/D+BxdpLr
   gBnzadTTeKkOl1mC1dxC6ZMAWO+zPNlLIcT1jiMgOIhJLPxgwb2Y0QiJQ
   mbhzn1Y/KQV5ZBaXWcxBGN959HLpfqt5wtwNkyzEKq9D0+8VBw42cY05K
   A==;
X-CSE-ConnectionGUID: HtNuvXgETgicxWa4yzzqRg==
X-CSE-MsgGUID: 9cFjWmVpTdOKkgCZJXWrrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31273169"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31273169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:58:15 -0800
X-CSE-ConnectionGUID: O1RNeuezT1Goik8uRad5ag==
X-CSE-MsgGUID: RFD2WFcnRl2eUS7HhopbAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91341505"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.89.141])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:58:08 -0800
Message-ID: <8b415442-283a-4fc8-ad0d-fbd8892d2ba2@intel.com>
Date: Mon, 11 Nov 2024 10:58:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, kernel@quicinc.com
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-4-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241107080505.29244-4-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/24 10:05, Sarthak Garg wrote:
> For Qualcomm SoCs with level shifter delays are seen on receivers data
> path due to latency added by level shifter.
> 
> To bring these delays in normal range and avoid CMD CRC errors
> reduce frequency for HS mode SD cards to 37.5MHz for targets which has
> level shifter.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 16325c21de52..5e1dc06c4707 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -138,6 +138,8 @@
>  /* Max load for eMMC Vdd-io supply */
>  #define MMC_VQMMC_MAX_LOAD_UA	325000
>  
> +#define LEVEL_SHIFTER_HIGH_SPEED_FREQ	37500000
> +
>  #define msm_host_readl(msm_host, host, offset) \
>  	msm_host->var_ops->msm_readl_relaxed(host, offset)
>  
> @@ -287,6 +289,7 @@ struct sdhci_msm_host {
>  	bool use_cdr;
>  	u32 transfer_mode;
>  	bool updated_ddr_cfg;
> +	bool uses_level_shifter;
>  	bool uses_tassadar_dll;
>  	u32 dll_config;
>  	u32 ddr_config;
> @@ -366,6 +369,11 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  
>  	mult = msm_get_clock_mult_for_bus_mode(host);
>  	desired_rate = clock * mult;
> +
> +	if (curr_ios.timing == MMC_TIMING_SD_HS && desired_rate == 50000000

Wouldn't desired_rate > LEVEL_SHIFTER_HIGH_SPEED_FREQ make more sense?

> +		&& msm_host->uses_level_shifter)
> +		desired_rate = LEVEL_SHIFTER_HIGH_SPEED_FREQ;

As checkpatch says:

CHECK: Logical continuations should be on the previous line
#46: FILE: drivers/mmc/host/sdhci-msm.c:374:
+       if (curr_ios.timing == MMC_TIMING_SD_HS && desired_rate == 50000000
+               && msm_host->uses_level_shifter)

total: 0 errors, 0 warnings, 1 checks, 34 lines checked


> +
>  	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>  	if (rc) {
>  		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> @@ -2372,6 +2380,8 @@ static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
>  
>  	of_property_read_u32(node, "qcom,dll-config", &msm_host->dll_config);
>  
> +	msm_host->uses_level_shifter = of_property_read_bool(node, "qcom,use-level-shifter");
> +
>  	if (of_device_is_compatible(node, "qcom,msm8916-sdhci"))
>  		host->quirks2 |= SDHCI_QUIRK2_BROKEN_64_BIT_DMA;
>  }


