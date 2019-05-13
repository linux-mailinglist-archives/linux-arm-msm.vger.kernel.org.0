Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D251B8F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 16:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730845AbfEMOrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 10:47:25 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41956 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730842AbfEMOrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 10:47:24 -0400
Received: by mail-qk1-f193.google.com with SMTP id g190so6027065qkf.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z7VBKyem/uSAaxPxkBQdn6zwT3GuO3CSomgcGPmQg0w=;
        b=MUHLKhpGkekM6pDH/oO6xNv4KfE8YOxtxR+E3TJSMvW7RgITDPa4f8RH0qR2GKCRVA
         QVKjrk8kct3oRAtv2HaVGpt0SOvm0cqqG43sPHK8vZAR+8yRaux7EBKy0pErU/Es8VG3
         ujs70I0x04BU9xfCahT4akeHjdvTdlhQq2wZbCGeR+TB1yS3cPv6FgY83divtaKR47+8
         tGtcrVc8wjB9yetqXXX8T3gofGSyLLne3rwsiQgVy1uy08lxnejO11GPYgoPgKzf5jEg
         5ABodOHZIeSAnKQlFc7z4WGjJDTS7CdfBQaBHzl0B0iRW0HOE/TeSWrDYW+Gki6T+xDz
         576Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z7VBKyem/uSAaxPxkBQdn6zwT3GuO3CSomgcGPmQg0w=;
        b=VhCFN+td5K5TmNYkXyvvTOxgs2yNlOkHKCbxeJPeNpY8pWY7hYiN0jUxuPKXzMMWku
         hW35HaSp4O7pu59g6HrkLDY48Fmt7wtOGc7C5KWhC5UBk6BFs/36bqKQKaDgX08RgyNM
         a6rHgfxfDzElSBI+Ov0LboZOiOPIG8YwxOhgtmJIZz4Zemu4M6Ga5Lr+NVxN17b/91iO
         OEnaBX65X7JX9lGp6cLWBVAuCI6TiorRqeBD25qH+daOBt/DhJbogaWrZHbUFwdRck/F
         ipezuPpfFL+cohIKYhLN/zQd5ujjxoxXfiY87N8P9+3ehbcV7AjFjzAveJsIPgs7rAVv
         pE4g==
X-Gm-Message-State: APjAAAU+72reJvl2tRy6/8xz7UJABFA3mKZN8pdi9Ih+ElQ9aTSjyB2M
        1Dq5hbA+0rh753tgCaDaX0QvKE+NhDE=
X-Google-Smtp-Source: APXvYqyZpxOKW9IuTwdrRuoIe4iKpRImEF3M/7+rl9/y+s+4d6CJHkFNA7qCY76nj1ZhQvUEduX/4A==
X-Received: by 2002:a37:9fcf:: with SMTP id i198mr22654938qke.49.1557758843565;
        Mon, 13 May 2019 07:47:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id l16sm6610039qtj.60.2019.05.13.07.47.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 07:47:23 -0700 (PDT)
Date:   Mon, 13 May 2019 10:47:22 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dpu: Integrate interconnect API in MDSS
Message-ID: <20190513144722.GO17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 01:42:12PM -0700, Rob Clark wrote:
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
> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 49 ++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 7316b4ab1b85..e3c56ccd7357 100644
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
> +	if (IS_ERR(path0))

of_icc_get can also return NULL, it looks like we also want to guard against
this case and keep num_paths == 0.

> +		return PTR_ERR(path0);
> +
> +	dpu_mdss->path[0] = path0;
> +	dpu_mdss->num_paths = 1;
> +
> +	if (!IS_ERR(path1)) {
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
