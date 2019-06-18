Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D64894ABFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbfFRUmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:42:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36075 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730350AbfFRUmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:42:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id p15so17177656qtl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sIyXF/EzZipTYqrIluZkq/5+UTS8byL1khSMDYNgjl0=;
        b=Z0iwbsTWYrYJl7fKykmsYH4TK1f6rLcLerOklZtHs1BMCUQd12tIkE5PnTFzM4n7pi
         crG+hbmqoSCM+QNJHlAkGWa7zxUJCzQM+SDlUbSJaqUcVBeZgRTxk5vUzPLF5UoyWa3P
         aL0Kh9ji0ML4btsWj+JuIo0Vw5uaA5WGu8yM9vTgMDpYUj9JD29qyk0OpAMRdP/nfJ4I
         zrccJrHyfN1+BZE/xEs8xCjMgLk7Qgv3hnf5Ge+jShrcb2+OeJl8l2f+lQZ4iR0jwLsN
         gaUa5oFUkCKE/dv9K38yeujMGf6Vzed0U9TC8mlX1nS+dgWyiqHDp2b8fn3NhCUYnkF4
         WXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sIyXF/EzZipTYqrIluZkq/5+UTS8byL1khSMDYNgjl0=;
        b=swJalM78txRCeaaYlTRh3MnPcK368FVaWxK59JhTlHE7WFHyY8va6JvN//dm8FLLor
         KNK1BUYacJEoc87wKstDxqi89WRnuDmxx6gd0HcwoF9WE7nMdFRwrW1zNjscCdcExUbg
         8N6ULpRej0KcjkyCk2T3aIjr9Q38aT9lMCROS0z3f5QBQrrk5EYAHKLZZYtJmk71VfCF
         gRPsTEoWZA7S2q9qmLTIVm8NZjlFgNFv7q1fuT8ELwac59rhJZ5BwZiWuC6XAL64XkLi
         p+N9mLAv/++G6dkbg1BGmCHm1SOTGSkPfY6NHnGbiSKOD07snD6D1QOe9efHq5pP/eS6
         mJvw==
X-Gm-Message-State: APjAAAWVzzL2nx1Uim5NReQ6kWjVQDHyVJuCZEfbgwW6AgfsBHW9N8qS
        ICvWmRA1xKAoukmV1T67f3tWFw==
X-Google-Smtp-Source: APXvYqzG4FV1GER3TEOBclI2H7u38D8xfKStoBg533TdSJHWwbLjRPAwjz1iX+pTjoEUZr9jurx6Xg==
X-Received: by 2002:aed:3fc5:: with SMTP id w5mr85910114qth.317.1560890523926;
        Tue, 18 Jun 2019 13:42:03 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g10sm8262045qki.37.2019.06.18.13.42.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:42:03 -0700 (PDT)
Date:   Tue, 18 Jun 2019 16:42:02 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dpu: Integrate interconnect API in MDSS
Message-ID: <20190618204202.GE25413@art_vandelay>
References: <20190618202425.15259-1-robdclark@gmail.com>
 <20190618202425.15259-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618202425.15259-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 01:24:10PM -0700, Rob Clark wrote:
> From: Jayant Shekhar <jshekhar@codeaurora.org>
> 
> The interconnect framework is designed to provide a
> standard kernel interface to control the settings of
> the interconnects on a SoC.
> 
> The interconnect API uses a consumer/provider-based model,
> where the providers are the interconnect buses and the
> consumers could be various drivers.
> 
> MDSS is one of the interconnect consumers which uses the
> interconnect APIs to get the path between endpoints and
> set its bandwidth requirement for the given interconnected
> path.
> 
> Changes in v2:
> 	- Remove error log and unnecessary check (Jordan Crouse)
> 
> Changes in v3:
> 	- Code clean involving variable name change, removal
> 	  of extra paranthesis and variables (Matthias Kaehlcke)
> 
> Changes in v4:
> 	- Add comments, spacings, tabs, proper port name
> 	  and icc macro (Georgi Djakov)
> 
> Changes in v5:
> 	- Commit text and parenthesis alignment (Georgi Djakov)
> 
> Changes in v6:
> 	- Change to new icc_set API's (Doug Anderson)
> 
> Changes in v7:
> 	- Fixed a typo
> 
> Changes in v8:
> 	- Handle the of_icc_get() returning NULL case.  In practice
> 	  icc_set_bw() will gracefully handle the case of a NULL path,
> 	  but it's probably best for clarity to keep num_paths=0 in
> 	  this case.
> 
> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 49 ++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 7316b4ab1b85..b1d0437ac7b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -4,11 +4,15 @@
>   */
>  
>  #include "dpu_kms.h"
> +#include <linux/interconnect.h>
>  
>  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
>  
>  #define HW_INTR_STATUS			0x0010
>  
> +/* Max BW defined in KBps */
> +#define MAX_BW				6800000
> +
>  struct dpu_irq_controller {
>  	unsigned long enabled_mask;
>  	struct irq_domain *domain;
> @@ -21,8 +25,30 @@ struct dpu_mdss {
>  	u32 hwversion;
>  	struct dss_module_power mp;
>  	struct dpu_irq_controller irq_controller;
> +	struct icc_path *path[2];
> +	u32 num_paths;
>  };
>  
> +static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
> +						struct dpu_mdss *dpu_mdss)
> +{
> +	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
> +	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
> +
> +	if (IS_ERR_OR_NULL(path0))
> +		return PTR_ERR_OR_ZERO(path0);
> +
> +	dpu_mdss->path[0] = path0;
> +	dpu_mdss->num_paths = 1;
> +
> +	if (!IS_ERR_OR_NULL(path1)) {
> +		dpu_mdss->path[1] = path1;
> +		dpu_mdss->num_paths++;
> +	}
> +
> +	return 0;
> +}
> +
>  static void dpu_mdss_irq(struct irq_desc *desc)
>  {
>  	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
> @@ -134,7 +160,11 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
>  {
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
> -	int ret;
> +	int ret, i;
> +	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW / dpu_mdss->num_paths : 0;
> +
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_set_bw(dpu_mdss->path[i], avg_bw, kBps_to_icc(MAX_BW));
>  
>  	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
>  	if (ret)
> @@ -147,12 +177,15 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
>  {
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
> -	int ret;
> +	int ret, i;
>  
>  	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>  	if (ret)
>  		DPU_ERROR("clock disable failed, ret:%d\n", ret);
>  
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_set_bw(dpu_mdss->path[i], 0, 0);
> +
>  	return ret;
>  }
>  
> @@ -163,6 +196,7 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
>  	int irq;
> +	int i;
>  
>  	pm_runtime_suspend(dev->dev);
>  	pm_runtime_disable(dev->dev);
> @@ -172,6 +206,9 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>  	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>  	devm_kfree(&pdev->dev, mp->clk_config);
>  
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_put(dpu_mdss->path[i]);
> +
>  	if (dpu_mdss->mmio)
>  		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>  	dpu_mdss->mmio = NULL;
> @@ -211,6 +248,10 @@ int dpu_mdss_init(struct drm_device *dev)
>  	}
>  	dpu_mdss->mmio_len = resource_size(res);
>  
> +	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> +	if (ret)
> +		return ret;
> +
>  	mp = &dpu_mdss->mp;
>  	ret = msm_dss_parse_clock(pdev, mp);
>  	if (ret) {
> @@ -232,14 +273,14 @@ int dpu_mdss_init(struct drm_device *dev)
>  	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>  					 dpu_mdss);
>  
> +	priv->mdss = &dpu_mdss->base;
> +
>  	pm_runtime_enable(dev->dev);
>  
>  	pm_runtime_get_sync(dev->dev);
>  	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
>  	pm_runtime_put_sync(dev->dev);
>  
> -	priv->mdss = &dpu_mdss->base;
> -
>  	return ret;
>  
>  irq_error:
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
