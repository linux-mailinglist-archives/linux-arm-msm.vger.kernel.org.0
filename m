Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE756446EBB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Nov 2021 16:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhKFPwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Nov 2021 11:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhKFPwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Nov 2021 11:52:31 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AF3C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Nov 2021 08:49:50 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id bg25so19093875oib.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Nov 2021 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I2XcrCZXC3kXpwrbiLsfJMxA8pJG1vkYZTP/NiE+eHI=;
        b=fJ8G0Fe8wOMS95SmE2BunK2RAilgCL9+n0jttAA+ypxBEDRSqRiNdTbZEhh9UnjF1c
         MX1jyBZslRCQ3Xb+hyOChfI4jFrsmrXXVdhVJLFiVOKuPQwEV7cy5rctSkppB4HDxJeE
         /2UX0qDDRA4OsnKV5T8oFfrmIgZtoXyuDlt+Sui+yPXfHsufulWquFomm6ySL2GRFWt7
         llZKIhlmf0uxVe3UpaK5k+Mnh6eHUXKOI4/ErWx1q4V8VmeefPLB9IrEGYbc1GKgpHRq
         PlTewA8ZqWNUR7DnIUEW3Ch/Rw+1If5dXkke+abxVPiA5JessypK+Ey8gc8p8lD3f2YL
         SDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I2XcrCZXC3kXpwrbiLsfJMxA8pJG1vkYZTP/NiE+eHI=;
        b=5tUBlHIjvxdoym0TpkGsaWjSDrt/QcsGuNn2WklvvZdPnqmvUBzAo3YSOAg9EYzFvl
         RcTQKkFGGcggFtvWXTNglzJFM8SNCw5Wik5s/u9yscFFDpTiZpvk4lctVdlGR136F2hD
         R8M22pvdSn9CG1xdrW+W7WwpBsJJncUi/9clcBd+AncBkUUzsA8lZg0i1wnoiaBgR7Wx
         nTG75MvKLy5PwqDcIwYF3TjSrIM+Rt24WOUa7bQaByb/e14RnyMnYN8bnK0v9SuJbtnc
         h+bai1A27HoSKmKi/VgnzUu8fBwI/nRfbRdxKdgEoyMabrur+d8P7ELwD//1r4oOBa7/
         s2EA==
X-Gm-Message-State: AOAM5322+QnJewOR2imOBO/j80Vig+kmPTGEwo3GVqsve6iwtXycyEgB
        BoNqCdHv35MpZxi2za8+S1i5jDs/2p0KJg==
X-Google-Smtp-Source: ABdhPJxaQ57RusLOgS4ovtJ2uFfBPKe8Vn0i/VDwGrPfdJZYps6ypZz5g8qmbNMVx5ArG3FB9P6fxQ==
X-Received: by 2002:aca:7c3:: with SMTP id 186mr28571526oih.60.1636213789402;
        Sat, 06 Nov 2021 08:49:49 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id n20sm2954299ooe.7.2021.11.06.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:49:48 -0700 (PDT)
Date:   Sat, 6 Nov 2021 10:49:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp5: drop vdd regulator
Message-ID: <YYakGr30PfSq8P5D@yoga>
References: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Nov 19:34 CDT 2021, Dmitry Baryshkov wrote:

> The "vdd" regulator was used by the mdp5 driver only on downstream
> kernels, where the GDSC is represented as a regulator. On all current
> kernels the MDSS_GDSC is implemented as the power domain, removing the
> need for this regulator. Remove it from the mdp5 driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 24 ++---------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> index 2f4895bcb0b0..2ac8fd37c76b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> @@ -16,8 +16,6 @@ struct mdp5_mdss {
>  
>  	void __iomem *mmio, *vbif;
>  
> -	struct regulator *vdd;
> -
>  	struct clk *ahb_clk;
>  	struct clk *axi_clk;
>  	struct clk *vsync_clk;
> @@ -189,8 +187,6 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
>  	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
>  	mdp5_mdss->irqcontroller.domain = NULL;
>  
> -	regulator_disable(mdp5_mdss->vdd);
> -
>  	pm_runtime_disable(dev->dev);
>  }
>  
> @@ -238,31 +234,17 @@ int mdp5_mdss_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> -	/* Regulator to enable GDSCs in downstream kernels */
> -	mdp5_mdss->vdd = devm_regulator_get(dev->dev, "vdd");
> -	if (IS_ERR(mdp5_mdss->vdd)) {
> -		ret = PTR_ERR(mdp5_mdss->vdd);
> -		goto fail;
> -	}
> -
> -	ret = regulator_enable(mdp5_mdss->vdd);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n",
> -			ret);
> -		goto fail;
> -	}
> -
>  	ret = devm_request_irq(dev->dev, platform_get_irq(pdev, 0),
>  			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev->dev, "failed to init irq: %d\n", ret);
> -		goto fail_irq;
> +		goto fail;
>  	}
>  
>  	ret = mdss_irq_domain_init(mdp5_mdss);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
> -		goto fail_irq;
> +		goto fail;
>  	}
>  
>  	mdp5_mdss->base.funcs = &mdss_funcs;
> @@ -271,8 +253,6 @@ int mdp5_mdss_init(struct drm_device *dev)
>  	pm_runtime_enable(dev->dev);
>  
>  	return 0;
> -fail_irq:
> -	regulator_disable(mdp5_mdss->vdd);
>  fail:
>  	return ret;
>  }
> -- 
> 2.33.0
> 
