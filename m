Return-Path: <linux-arm-msm+bounces-47373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382EA2E6B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2782163881
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261C31BEF90;
	Mon, 10 Feb 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tXn/xoGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65615AF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177080; cv=none; b=rYyPAudsx3dgMA8vnuUEk0VxWxP7Z4VRTHRXJVBBCDCmyxoGe2MMB4u0Ru5xhRErbAL5ePj1jrimODNRVp+5msWXfpR0SRX/fgzV/gdefnUNhR1ewGDjjb9JT0P7JyF9ihdyfpLAAYAqsqV1QVDOURN+p9j7dcZT+N7IlDs+YgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177080; c=relaxed/simple;
	bh=4fZ8hkk0JfCQHZ3YWUau2oqwdEOKuxV5oYRE3kgnKgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkFzoT1db2H4XfhRCbnbu3R/mu7/XAtNgFMB5973en9fQprtPt69EHBDPLeBf6w6FPd42syMNJNS5ulHbHUI5fXG+HmZ8g/Vutee0S9H3DF/cNEdwOYwECheZKE3JujhFc0v5Ays612dQjFbNWOgBaLv8bBJZ++kVbY5rHwLXNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tXn/xoGa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso26959665e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739177075; x=1739781875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9jWy1Q5jX1SgFclMU8WZwRWsNWJuzin+o6tDoU266o=;
        b=tXn/xoGawRSLSqMTkgezffT1G3FlX5wJBLkivK8WnL9Lqt6Cmb3uCu385D+HUh+7lN
         Iu+/qEm/7VDBrh/BEwxAuehSRyVPQjb2kpj7kO7bnhDXtfJNznC1J9hlg7hjIssMrjk/
         MJyokiGlvX0D0INFqXA1/DoQgVZ457c9pI5KzAoLAVcFU+4gwM4k7VV5E+5pxWlGdBZ3
         bOldhGd3fTLCZoNci1geLdYUpfCvClzDp9EHXF5YEpoYC5S06TlZQe+7hzBn+uraHKKT
         vwAvAM7ePK5+vi2ZL1gQFrNrU9jap+MFKMbE/VoYA2AKW95yr8TICO+UHCtGcOqIIxvx
         zgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177075; x=1739781875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9jWy1Q5jX1SgFclMU8WZwRWsNWJuzin+o6tDoU266o=;
        b=vvpidFWc1MhTAGQyPkpwg7UuNN5z0tTtweKmGwYg5gSSYpt6HW74gVfquoCPllFruS
         3lEC7wOIONwab11KrKSrcxJtkmPHDN4DImahv9I2VJD28Qri91PuDAvuedWCPUcHJeft
         8T+5tQ0fgB9FayQ/3XjMiaorwb3/9whgDhr1U0xkgujON+5FtMAj1ECudtW9ognYMEn1
         /4Aes6AKbLq5+VH+c5K01fCsd9eH1M6tUNe0MmlKn/VfP0bm4FgB35rVXgwflI2cIwyp
         65We8DvcrLu3AmcJTLH/oEgTnrOZwCLh/HE5uKkEsh175ic4FUEQefJn8irn0th3rkMB
         Hcwg==
X-Forwarded-Encrypted: i=1; AJvYcCWIb8gpGCme/AQbYIxAmp8y9p5qKINis5ca9N+EqjOpiR7j9i/qY9f2iQFPsl01L8gDNAsWHMUpJkIJb3BK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+t47S2Ehuv1/bc2xqZZixHQYvP+JM0zUmBQ1Yxf/HCiyDa4h
	D8xtS+CULNCyWjEHuH6DJZx/POwlTGeP1V+YBTLKqqBhL6IMG7dGBBzUYBXhPKI=
X-Gm-Gg: ASbGncuBJrnDNgyMGlP8wQOYL2WzYfirRiryhJ56Od7DgZsPmI0h7E/Bklxb8wHSbLl
	qke71azZbCjw+FM9NyvIM5n7UkmP6o6jVF4kwSDazbt1YgyDxkEDsoBRTqtFItkNWdvO8i5zefD
	zdP7CABCLe34o/2W9Ch2iGUOJhyt99Woshdixpo44bU0Pq/uiL4rrvP2jd9ntgP8fPNfXHX6JW9
	rXiO6vMFtJAYMQmBaMUmhCThcY+zXHEhiBLsX0hDeDKO2pYpRg08tRvMSvPh9XGpORKF6SVDAMO
	g73frCbNokoJzGxbUwCm9XaZE6E=
X-Google-Smtp-Source: AGHT+IEIHivwIw1YLGXpQln/J8OfUdVcDuE29uK5Y0cehr1g+Cm1qc4Jrq0qwsltV208ZxXpHMxo2w==
X-Received: by 2002:a05:600c:5248:b0:439:422d:d642 with SMTP id 5b1f17b1804b1-439422dd712mr30757655e9.23.1739177075235;
        Mon, 10 Feb 2025 00:44:35 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:ef53:9f00:dac2:a172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcde66729sm8119137f8f.81.2025.02.10.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:44:34 -0800 (PST)
Date: Mon, 10 Feb 2025 09:44:30 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Avoid accessing BAM_REVISION
 on remote BAM
Message-ID: <Z6m8btwhJ9q4RjB6@linaro.org>
References: <20250207-bam-read-fix-v1-1-027975cf1a04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bam-read-fix-v1-1-027975cf1a04@oss.qualcomm.com>

On Fri, Feb 07, 2025 at 12:17:33PM -0800, Bjorn Andersson wrote:
> Commit '57a7138d0627 ("dmaengine: qcom: bam_dma: Avoid writing
> unavailable register")' made this read unconditional, in order to
> identify if the instance is BAM-NDP or BAM-Lite.
> But the BAM_REVISION register is not accessible on remotely managed BAM
> instances and attempts to access it causes the system to crash.
> 
> Move the access back to be conditional and expand the checks that was
> introduced to restore the old behavior when no revision information is
> available.
> 
> Fixes: 57a7138d0627 ("dmaengine: qcom: bam_dma: Avoid writing unavailable register")
> Reported-by: Georgi Djakov <djakov@kernel.org>
> Closes: https://lore.kernel.org/lkml/9ef3daa8-cdb1-49f2-8d19-a72d6210ff3a@kernel.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

This patch fixes the most critical regression (the bus hang), but the
in_range(..., BAM_NDP) checks are also wrong. They do not consider the
plain "BAM" type where the register is apparently also available. The
check should be !in_range(..., BAM_LITE) instead to fix this.

I mentioned this twice to Md Sadre Alam [1, 2], but a fix was
unfortunately never sent for that part of the regression.

I think we should take Caleb's patch and revert the entire patch for the
6.14 cycle. There are several incorrect assumptions in the original
patch, it will be easier to review a fixed version with the full diff,
rather than looking at incremental fixups.

On a somewhat related note, I'm working on a patch series for bam_dma to
clean up the handling of remotely controlled BAMs. It will make it more
clear when it's safe to access BAM registers and when not, and should
allow reading the revision also for remotely controlled BAMs. This would
avoid the need for all these if (!bdev->bam_revision) checks.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/Z4D2jQNNW94qGIlv@linaro.org/
[2]: https://lore.kernel.org/linux-arm-msm/Z4_U19_QyH2RJvKW@linaro.org/

> ---
>  drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..d42d913492a8 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -445,8 +445,8 @@ static void bam_reset(struct bam_device *bdev)
>  	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
>  
>  	/* set descriptor threshold, start with 4 bytes */
> -	if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -		     BAM_NDP_REVISION_END))
> +	if (!bdev->bam_revision ||
> +	    in_range(bdev->bam_revision, BAM_NDP_REVISION_START, BAM_NDP_REVISION_END))
>  		writel_relaxed(DEFAULT_CNT_THRSHLD,
>  			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>  
> @@ -1006,8 +1006,8 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>  			maxburst = bchan->slave.src_maxburst;
>  		else
>  			maxburst = bchan->slave.dst_maxburst;
> -		if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -			     BAM_NDP_REVISION_END))
> +		if (!bdev->bam_revision ||
> +		    in_range(bdev->bam_revision, BAM_NDP_REVISION_START, BAM_NDP_REVISION_END))
>  			writel_relaxed(maxburst,
>  				       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>  	}
> @@ -1199,11 +1199,12 @@ static int bam_init(struct bam_device *bdev)
>  	u32 val;
>  
>  	/* read revision and configuration information */
> -	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> -	if (!bdev->num_ees)
> +	if (!bdev->num_ees) {
> +		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>  		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
>  
> -	bdev->bam_revision = val & REVISION_MASK;
> +		bdev->bam_revision = val & REVISION_MASK;
> +	}
>  
>  	/* check that configured EE is within range */
>  	if (bdev->ee >= bdev->num_ees)
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-bam-read-fix-2b31297d3fa1
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

