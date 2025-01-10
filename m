Return-Path: <linux-arm-msm+bounces-44723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655ADA08DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 11:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786453A209B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3718B1CDFD4;
	Fri, 10 Jan 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loLG3CMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720420ADEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504147; cv=none; b=CVa1wklYEIfvVBJW0RhFV5QOSxNe20veKrVGiG1uXHXhJZbNqDaq7x/1ZKTAdS9s1aImGZ/7V8b6ZAMearTHBdReHlBUX+AxxCvDG7Mcv5RVPcasIqsCO6+7N/wiTg9fBZtYRRoapqtjMTw1vJQcjA9VG/T70yGSTKnUkSgEc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504147; c=relaxed/simple;
	bh=OG5Slfzzn+4YZ57E3I8Aah1Mfpy3Cxh1SjEqcqb7rMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTRbUjXhMtp+GK6TipGZunpB2FdFR+f32fTYf7irK1ecalTH/cfUNvLTJ3AZcrJZNpXDyEZa9IThhmbpt5oTAKOi+C+eht9DNim95Iwd1rka0/Uv1DQfiUJ2wIOl66AQfB/SPV4gpw+6FrgizQebKylxohKEX+7JcNpsHDs6oxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=loLG3CMo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec61d0f65so350433666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 02:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736504143; x=1737108943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8I5F2q/E1Uyw0awphW5FocvFmJIVkEVv/Vv7zorOGUY=;
        b=loLG3CMo7Hl/ncnnldCodaVvckSO1hOXgE7NsB7BfPOoe/dmLNMeZVS4WXDPuc7lyr
         om8DkFWMd/7FB9kNjZuGpt96qtyRTao/+Xb/gQbRPUb5aH4/vHu7ejBnaukbCrKsL/OH
         1eIrRhY4hx5niuI/wirw1Ifah0P92g9STnrYkzYpxZ09dGLyrz7ZYEv/89BvbDcDmxRR
         sCXoFpFVTNH2Cs04FYupVm/JuKS7hQg/UOCSKwfPWb6xL+7wuaZmJ0dCRCaQvW9+0+T6
         31xiLMDk9AnqZti0Omlp5j2WQ1TVF/1DB4Kc04EAj/GvCyPCtZVTODUUF42DRz3NJxyv
         LBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504143; x=1737108943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I5F2q/E1Uyw0awphW5FocvFmJIVkEVv/Vv7zorOGUY=;
        b=OiZ6ffmY2rLrU4keCIFxbGx41aFA/WjtJv92+G3ztn6pn0tmhxL9nG+SSxDK9jnzhv
         tVqFgKTFb7QA6xYl0EWkzjyG5wkPFyyay5vQeNrgiutlQciOKokdjZ2XMLWKkdtG/7h1
         6A9SZ5ENAjqVLXxHJU3KepVqafGvxBEGGIRqnSXR8W3IQcx7DVrDgixF4V767SUB5nOZ
         91h0atxPks/F5mVsGnKPbxx7/P0lsVUbvNwvaw/0iiCe0LL8hUB26L/Ky6byDb3/5NYL
         nQHOlfywZeuUNkKCAZBpyC628fTMW1nevG14jRW65MxeYkLyN8plLrzHNnr/eH4gFSF1
         uCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUIVJpaKaasUgbjuJ74VLZCiZ1gFx2nE044fpQtDAZKMBQPN5np6mpDv+TBlt5V1mha3/nwha3V8FHxcw/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1tyJptkHX3+wIwdF1tcyx30FWsiDhmHAwmyeRZtU3QREDIEx
	5Z3GZG2MWtyej4lorgiBMxlr7GmblHEL5pR2bRF+GNgdu6zASkqQnzQHay8Plv0=
X-Gm-Gg: ASbGnct3XLhxIF2dkKjsjwgRGgnQxzf8mFpNFgvfhLTjH/uSRP73Kx6MP3kpxSWG+QA
	hh53HE2EjjN1JRbgMsdS5esnTaYCM+iHoLHPfIVZXjv/3HFVtF9C9fJJysrjPQaRqV0pN7SwB8y
	JGBCBqQ60Q2GlHascC7QNap1US63lB/2rAjcoDYfVZZbgdynmj9QCZI9t6Z5x9tijl0FQ6QJbSN
	kDaZUg6gBBI8nIDxDColkVE8e24uI0+wJfkJFWpevzQ8nZAK4M+kGx0TZBcDIJw0upI
X-Google-Smtp-Source: AGHT+IFxOfe+uLe4Ftus+tUMtlwHJqHVL74w+6Tuu37QcKSdGFuUOdk5R49N8KAeZXoV1/5uRbSyeA==
X-Received: by 2002:a17:906:c141:b0:aa6:5eae:7ed6 with SMTP id a640c23a62f3a-ab2ab6a2f04mr761193166b.13.1736504143287;
        Fri, 10 Jan 2025 02:15:43 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:d2b5:f46c:e0e4:a1af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d52edsm151801166b.42.2025.01.10.02.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:15:42 -0800 (PST)
Date: Fri, 10 Jan 2025 11:15:38 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, ulf.hansson@linaro.org, robin.murphy@arm.com,
	kees@kernel.org, u.kleine-koenig@baylibre.com,
	linux-arm-msm@vger.kernel.org, av2082000@gmail.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	djakov@kernel.org, quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Fix BAM_RIVISON register
 handling
Message-ID: <Z4DzHs0gtbTPxq2_@linaro.org>
References: <20250110051409.4099727-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110051409.4099727-1-quic_mdalam@quicinc.com>

On Fri, Jan 10, 2025 at 10:44:09AM +0530, Md Sadre Alam wrote:
> This patch fixes a bug introduced in the previous commit where the
> BAM_DESC_CNT_TRSHLD register was conditionally written based on BAM-NDP
> mode. Additionally, it addresses an issue where reading the BAM_REVISION
> register hangs if num-ees is not zero. A check has been added to prevent
> this.
> 
> Cc: stable@vger.kernel.org
> Fixes: 57a7138d0627 ("dmaengine: qcom: bam_dma: Avoid writing unavailable register")
> Reported-by: Georgi Djakov <djakov@kernel.org>
> Link: https://lore.kernel.org/lkml/9ef3daa8-cdb1-49f2-8d19-a72d6210ff3a@kernel.org/
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..2b88b27f2f91 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -445,11 +445,15 @@ static void bam_reset(struct bam_device *bdev)
>  	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
>  
>  	/* set descriptor threshold, start with 4 bytes */
> -	if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -		     BAM_NDP_REVISION_END))
> +	if (!bdev->num_ees && in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> +				       BAM_NDP_REVISION_END))
>  		writel_relaxed(DEFAULT_CNT_THRSHLD,
>  			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>  
> +	if (bdev->num_ees && !bdev->bam_revision)
> +		writel_relaxed(DEFAULT_CNT_THRSHLD, bam_addr(bdev, 0,
> +							     BAM_DESC_CNT_TRSHLD));
> +
>  	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
>  	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
>  
> @@ -1006,10 +1010,14 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>  			maxburst = bchan->slave.src_maxburst;
>  		else
>  			maxburst = bchan->slave.dst_maxburst;
> -		if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -			     BAM_NDP_REVISION_END))
> +		if (!bdev->num_ees && in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> +					       BAM_NDP_REVISION_END))
>  			writel_relaxed(maxburst,
>  				       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +
> +		if (bdev->num_ees && !bdev->bam_revision)
> +			writel_relaxed(DEFAULT_CNT_THRSHLD, bam_addr(bdev, 0,
> +								     BAM_DESC_CNT_TRSHLD));

I guess you meant writel_relaxed(maxburst, ...) here?

This patch is quite confusing. We shouldn't duplicate the register
writes here just to have different handling for if (bdev->num_ees) and
if (!bdev->num_ees).

Also, num-ees is unrelated to the question if the BAM is BAM-NDP or
BAM-Lite. Typically we specify qcom,num-ees in the device tree for a BAM
if the BAM is either:

 - Controlled remotely (= powered on and initialized outside of Linux)
   This is the case for the SLIMbus BAM Georgi mentioned.

 - Powered remotely (= powered on outside of Linux, but must be
   initialized inside Linux)

Reading BAM_REVISION in these cases will hang in bam_init(), because we
cannot guarantee the BAM is already powered on when the bam_dma driver
is being loaded in Linux. We need to delay reading the register until
the BAM is up.

Given that these writes happen only for the !bdev->controlled_remotely
case, you could fix this more cleanly by reading the BAM revision inside
bam_reset().

Thanks,
Stephan

