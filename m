Return-Path: <linux-arm-msm+bounces-82686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8EC74502
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3ED4230267
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F284C33D6D1;
	Thu, 20 Nov 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSiaEF+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE3233CEB7;
	Thu, 20 Nov 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645845; cv=none; b=OZ30o7aot2qPMw502uewzoPqXc29kW1e7Fm/Q755hvlL+8wc2o+SNo+BhhasSCIebsP6zAtkivpyY5305K6XWgvU/8YJphzKJIPIcd7BLJa2hqA/b8tBgFlC3zACku8uFvfMCqhynhMyFNYAFLSSwzPORei1y1L+hE4llyTZk44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645845; c=relaxed/simple;
	bh=VxQ5KoenGhTfG4s4dES9bE2YxDxJGNe0ebeFjslWVnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx0P+NonvjJXsO+wUbeGHOlUjZbrVVcc4r1arc6rjt5ATJYHQDbew7wb08yD2MW2VvblYO6Rfr831GunBaX15A5HCHuRiWyhMrccNDN+hpyPmxMsKNzluMA1K99P/VK87xoPzMovRbwWbCZxovH/e0ZhJStIZLMeEZ4/4qgezyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSiaEF+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48FFC4CEF1;
	Thu, 20 Nov 2025 13:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645845;
	bh=VxQ5KoenGhTfG4s4dES9bE2YxDxJGNe0ebeFjslWVnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSiaEF+9+w3xOLviYs2O3UXANoGiXZ2HWbldxHbhmvmaYHnUF+BBtmbCKWaE4mCvu
	 D/exhxNnobQXLvUvoJmFUHCcwiwfj4vYj7EhDIIdx5IyJBLrUgqYDEEn9UgtxNF/k1
	 fJvhhRlQkLb8jJko3vQSzmr3cQikRffGEwy91GXT4KTue7Zha2uYh30+VtbL7nCBwx
	 wUYXu3KDudPjdTSVEPWQE4FIizhSfzYG03qXiK8vnd5Qzwo3mN55mq133+FjUkl9BI
	 D5/aX+RFZMcMGtgQ4tAITmqKImiHSnNyHkPLNWQnv6/u6UR94SVhjQuK6qhpCvJifM
	 bg45SqSyZLQHg==
Date: Thu, 20 Nov 2025 07:42:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <ofxrykxcywloaajt6sv6nb7shfmdlips4tezrimiycsis4vamb@thkoqsdwynie>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:44:32PM +0530, Abhinaba Rakshit wrote:
> Set ICE core clock to turbo (max freq) provided by dt
> entry at ice device probe.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Didn't realize until your two patch series ended up next to each other in
my inbox, but adding this support for UFS and for MMC are very much
related, so please include all three patches in the same v2.

Thanks,
Bjorn

> ---
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> ---
>  drivers/soc/qcom/ice.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	struct qcom_ice *engine;
>  	const __be32 *prop;
>  	int len;
> +	int err;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	/* Set the ICE clk rate to TURBO */
> +	if (engine->core_clk && engine->max_freq) {
> +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> +		if (err)
> +			dev_err(dev, "Failed setting the clk to TURBO\n");
> +	}
> +
>  	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
>  
>  	return engine;
> 
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251001-set-ice-clock-to-turbo-ecab9ea46a89
> prerequisite-change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6:v1
> prerequisite-patch-id: d66f521e5e625b295a1c408cdfce9bd9524ae3ba
> prerequisite-patch-id: 23934f3fee5aabe4a2324130ed02909352b5cf61
> 
> Best regards,
> -- 
> Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 

