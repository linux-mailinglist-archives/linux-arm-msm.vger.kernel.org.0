Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7851AE49D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 20:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgDQSR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 14:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730671AbgDQSR1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 14:17:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0F7C061A0F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 11:17:27 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r4so1493694pgg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XsZBU4bhjV6O9KVbO6JPEje7KJLsMy5gzQ4J0zuUoG0=;
        b=a7UCge8KsNi+LrELJHDknwsXaFe2Vfj8hoi97RUEfDhQKmg2JbLscHmOe+FVZS+emQ
         3KX6TUXU4du4NXQKSWyuf6DVtoloiXA/aJUzax11Ye4Xuj9TUwpK/I1U55VfbVwAIjJd
         Ybsh+3YSspq2pYRQchoW6mLkb2AU7yekjxUTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XsZBU4bhjV6O9KVbO6JPEje7KJLsMy5gzQ4J0zuUoG0=;
        b=mZ9lhvafCQHLKCu6RvvkR18uIOaCIdG2gwQCRIpU/MCcfo0Kr3qxuSLJOuCWXAPUEN
         6Chv8e1ZkOPJKfP7PKKcUH/ODkV++zq7L4OjqPqguZQo1baTakwPVQLOoBgVbXd2babJ
         V1xTpCmHEe1l/rDxRqFXp+Aoloc57A7yk3cDQZAnODmhmiGBXu6rbFQmz8wQVBVbdkz6
         oivIi9K0fK3HIw/sNQsiG7oDZ4lnxLa+im2Kcf75088UjXyd0Xqd5FK0iQ1nlbdXSH/+
         beQgd2yAjW8SEtpkzIN8eFlkOfWoFS/6NXZMpAh6CIBWBikIXcuDdIVBVPJ1vkvry4dP
         2xSQ==
X-Gm-Message-State: AGi0PuY+05ZCOXU/tAooyIYoQJpx6uu6BiDTf9x2hHQjDEph0phwVgdL
        P66UKc8uJy9FD1UF5uhKA7VY/g==
X-Google-Smtp-Source: APiQypIkeXBu6ylolmkKJSsiQ23LPbMq+pU1hKJH7sJLHh1ACpzIu3GZNXg9hm13C8XctxztyUIMFA==
X-Received: by 2002:a65:4908:: with SMTP id p8mr4231124pgs.413.1587147446841;
        Fri, 17 Apr 2020 11:17:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g11sm19806944pfm.4.2020.04.17.11.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 11:17:25 -0700 (PDT)
Date:   Fri, 17 Apr 2020 11:17:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
Message-ID: <20200417181724.GE199755@google.com>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-6-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1587132279-27659-6-git-send-email-rnayak@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

I have essentially the same comments as for "tty: serial: qcom_geni_serial:
Use OPP API to set clk/perf state" (https://patchwork.kernel.org/patch/11495209/).
about error handling of 'dev_pm_opp_of_add_table' and misleading struct
member names 'opp'/'opp_table'. Please apply the requested changes to the
entire series unless you disagree (we can keep the discussion in the patch
referenced above).

On Fri, Apr 17, 2020 at 07:34:27PM +0530, Rajendra Nayak wrote:
> On some qualcomm platforms DPU needs to express a perforamnce state
> requirement on a power domain depennding on the clock rates.
> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 20 +++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 11f2beb..fe5717df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -7,6 +7,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/mutex.h>
> +#include <linux/pm_opp.h>
>  #include <linux/sort.h>
>  #include <linux/clk.h>
>  #include <linux/bitmap.h>
> @@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
>  		rate = core_clk->max_rate;
>  
>  	core_clk->rate = rate;
> -	return msm_dss_clk_set_rate(core_clk, 1);
> +	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
>  }
>  
>  static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..cfce642 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/dma-buf.h>
>  #include <linux/of_irq.h>
> +#include <linux/pm_opp.h>
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
> @@ -1033,11 +1034,18 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>  	if (!dpu_kms)
>  		return -ENOMEM;
>  
> +	dpu_kms->opp = dev_pm_opp_set_clkname(dev, "core");
> +	if (IS_ERR(dpu_kms->opp))
> +		return PTR_ERR(dpu_kms->opp);
> +	/* OPP table is optional */
> +	if (!dev_pm_opp_of_add_table(dev))
> +		dpu_kms->opp_table = true;
> +
>  	mp = &dpu_kms->mp;
>  	ret = msm_dss_parse_clock(pdev, mp);
>  	if (ret) {
>  		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	platform_set_drvdata(pdev, dpu_kms);
> @@ -1051,6 +1059,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>  
>  	priv->kms = &dpu_kms->base;
>  	return ret;
> +err:
> +	if (dpu_kms->opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(dpu_kms->opp);
> +	return ret;
>  }
>  
>  static void dpu_unbind(struct device *dev, struct device *master, void *data)
> @@ -1059,6 +1072,9 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
>  	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>  	struct dss_module_power *mp = &dpu_kms->mp;
>  
> +	if (dpu_kms->opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(dpu_kms->opp);
>  	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>  	devm_kfree(&pdev->dev, mp->clk_config);
>  	mp->num_clk = 0;
> @@ -1090,6 +1106,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>  	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>  	struct dss_module_power *mp = &dpu_kms->mp;
>  
> +	/* Drop the performance state vote */
> +	dev_pm_opp_set_rate(dev, 0);
>  	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>  	if (rc)
>  		DPU_ERROR("clock disable failed rc:%d\n", rc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 211f5de9..0060709 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -128,6 +128,10 @@ struct dpu_kms {
>  
>  	struct platform_device *pdev;
>  	bool rpm_enabled;
> +
> +	struct opp_table *opp;
> +	bool opp_table;
> +
>  	struct dss_module_power mp;
>  
>  	/* reference count bandwidth requests, so we know when we can
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
