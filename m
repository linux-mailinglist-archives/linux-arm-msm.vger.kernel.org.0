Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B6C3B97E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 22:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhGAVBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 17:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbhGAVBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 17:01:49 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91CEC061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 13:59:17 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so7966197oti.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jul 2021 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XrWzpSfGWJs4mU7AbSR6+V4VHnkU5pSgSDyg2slAt30=;
        b=EjzKi5uaP0VQcEGw8pTiCdQJVucKkhHNVO7oowIqztIsBsjAHtES6A14HBthDpEGta
         57pnzLXTcp43YW9JZGFdYjUgM4+9YFW3k/k1zvZu6T6tzU/5hjYNcyrDdaqOEwaqCftI
         6QxUCK3daPHzh16hsFrq6UJTRrDsofcZkB/lKIHxIEhOHe1GmGBRNSnKMiZvzqj8NI5m
         HOYuqbF5IBS4bA/OVFUnkff/K3pmjP6sOm8iDdUzlECcYsMqI48mgH0zSmf5o0NRymmT
         D1mzIaTYnktp9+AFm1+zGiTvsHHFf4ZYI4zvUbY6wmUtGz/QOgaux2QhM2WJtVouc0Ea
         cuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XrWzpSfGWJs4mU7AbSR6+V4VHnkU5pSgSDyg2slAt30=;
        b=klsKOpLQNRgkMdgLzUYy3ThVbMUbDQvmYVQ7D4+L6HIUUrt5f1XSt9ZZ1qP9ErW00w
         f9C9hgeXuUBJM21j63JiwPzM0JG6vRzl6r3zwyethuxKafRqVCISipAV5j4kLjY+8Np/
         mM+3ETWzpdSAaDMYQAlgI0MzB2aROlcLisGaPj8N/746b+WaUo0dCPaA7jdElhRIlbdq
         HVEjrySn33dFdW38J4GWG1jKvxhNQAZTKpEgOaGlwSRB/BQzFG3hvHPmXUGjBLTfU1lX
         HThTRxNyU9hAp3q20vg9PNrbfE+kS/NQKf4qSNYXMZchnk3ZKTvJnU3P4uez0KVEmvGt
         M7Tw==
X-Gm-Message-State: AOAM533zs6mVVrVgYhpbtMEKqkBea8nUkXJRVfFnsVYcVtit1AJ15FYB
        C20Qcgh31FiGmvoBAL7VeMUk5g==
X-Google-Smtp-Source: ABdhPJwIRnpPxwiwaPUqDIjDQDPpGe2AzdWrhxL+vmnF9x4fm6rwS0DFjgoK+0VtbGYBZ5MIhWlfcA==
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1578919otf.25.1625173157128;
        Thu, 01 Jul 2021 13:59:17 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id m11sm177944otp.29.2021.07.01.13.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 13:59:16 -0700 (PDT)
Date:   Thu, 1 Jul 2021 15:59:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: drop gdsc regulator handling
Message-ID: <YN4sojVhCpfHDpgZ@yoga>
References: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Jun 19:00 CDT 2021, Dmitry Baryshkov wrote:

> None of supported devies uses "gdsc" regulator for DSI. GDSC support is
> now implemented as a power domain. Drop old code and config handling
> gdsc regulator requesting and enabling.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 12 ++++--------
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++-------------------
>  2 files changed, 7 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index f3f1c03c7db9..32c37d7c2109 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -32,9 +32,8 @@ static const char * const dsi_6g_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 4,
> +		.num = 3,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdd", 150000, 100},	/* 3.0 V */
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
> @@ -53,9 +52,8 @@ static const char * const dsi_8916_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8916_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 3,
> +		.num = 2,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  		},
> @@ -73,9 +71,8 @@ static const char * const dsi_8976_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8976_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 3,
> +		.num = 2,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  		},
> @@ -89,9 +86,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>  static const struct msm_dsi_config msm8994_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 7,
> +		.num = 6,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.25 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  			{"vcca", 10000, 100},	/* 1.0 V */
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..66c425d4159c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -203,35 +203,22 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>  {
>  	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
>  	struct device *dev = &msm_host->pdev->dev;
> -	struct regulator *gdsc_reg;
>  	struct clk *ahb_clk;
>  	int ret;
>  	u32 major = 0, minor = 0;
>  
> -	gdsc_reg = regulator_get(dev, "gdsc");
> -	if (IS_ERR(gdsc_reg)) {
> -		pr_err("%s: cannot get gdsc\n", __func__);
> -		goto exit;
> -	}
> -
>  	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
>  	if (IS_ERR(ahb_clk)) {
>  		pr_err("%s: cannot get interface clock\n", __func__);
> -		goto put_gdsc;
> +		goto exit;
>  	}
>  
>  	pm_runtime_get_sync(dev);
>  
> -	ret = regulator_enable(gdsc_reg);
> -	if (ret) {
> -		pr_err("%s: unable to enable gdsc\n", __func__);
> -		goto put_gdsc;
> -	}
> -
>  	ret = clk_prepare_enable(ahb_clk);
>  	if (ret) {
>  		pr_err("%s: unable to enable ahb_clk\n", __func__);
> -		goto disable_gdsc;
> +		goto runtime_put;
>  	}
>  
>  	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
> @@ -246,11 +233,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>  
>  disable_clks:
>  	clk_disable_unprepare(ahb_clk);
> -disable_gdsc:
> -	regulator_disable(gdsc_reg);
> +runtime_put:
>  	pm_runtime_put_sync(dev);
> -put_gdsc:
> -	regulator_put(gdsc_reg);
>  exit:
>  	return cfg_hnd;
>  }
> -- 
> 2.30.2
> 
