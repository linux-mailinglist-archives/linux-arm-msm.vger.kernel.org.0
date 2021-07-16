Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0076E3CBFB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 01:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbhGPX35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 19:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbhGPX35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 19:29:57 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E6CC061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 16:27:01 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so11636417otl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 16:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pC+75Q6bZWHNYlQLaT6yD7A5xR9zyhLKX7BOI3hWIBs=;
        b=vxCw3QS78UHb2GLB/dBYTJlCR7yXdHxjPpl/68jQCRl1xhK/SBCMhtlizm62ffE117
         yKqSbsXO7jMCzrkVeOjeSt4t3iRbvm6q5iCtrEea155w7kaJjOJQgiaADBUIviSkoWpf
         UL6OtUFsOC3i7TgxWZph34ruCa0EsUIGlAICR0rHVHfM3+JC6ccs/sRQnhZwMbHU8T2O
         FCssQwEVjBIW6fpvD7fJOVDvCNpA7zQsPj6pCI9IW+KFBfGQTwKDb9IBiXv9dhRkyVXW
         4jQOc5X1gsMmRUHs9s1R59xUNaQfzNZuxJu+5hxj/D1g7k9o6/0V2LrNZ2sN5bfuFkRl
         R/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pC+75Q6bZWHNYlQLaT6yD7A5xR9zyhLKX7BOI3hWIBs=;
        b=QH0lhqpbLmRyH1SdZNIIzZ86+nG0USZFRw7En5yptoeotkfwcOvhk+nuw1j2VQpW93
         oXbD1usvQZZELcjfbxSnGKEqRuMcZLR1l6Gvu1txACdC089sZbbkLyXAdHVlzGd3qeUa
         pYZRLxrilAkXHYmPOftbljoHW7NPLxEgATR5aCF91Trdw4BG0Dm19JXfycYaYil8BUth
         ja+zhVaflwrj0o/Ejxmvsz0G91f5oyFdnkeKQ5+3InwW4+EV+SCIdJdfg3PCzgulAQk/
         md2wh3dWKW/MEDTWIUM7DkeQ7H+YYwwTWz58XIqgKgQ7E3hYvOO/Ku6YHYxtHXp0mcYz
         vI8w==
X-Gm-Message-State: AOAM530hlXPhEcFgUj/+u3WqddxHdSSydg5dGwgzpR1guzAchqDTvK4Q
        TXCmEbRkaDaQkQ3PyBaLZCbnrw==
X-Google-Smtp-Source: ABdhPJzmhNoo3A/E2TGiFjQOff6FN8yMqQoPo/kn0If+n0SqMcP0qvpO8ihHI4TqtakrRMqJ0BlEmw==
X-Received: by 2002:a9d:30d:: with SMTP id 13mr10032842otv.66.1626478021227;
        Fri, 16 Jul 2021 16:27:01 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b11sm2219677oti.30.2021.07.16.16.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 16:27:00 -0700 (PDT)
Date:   Fri, 16 Jul 2021 18:26:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: move pm_clk functionality into common code
Message-ID: <YPIVwgAjb/JdTowQ@yoga>
References: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
 <20210710140130.1176657-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710140130.1176657-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 10 Jul 09:01 CDT 2021, Dmitry Baryshkov wrote:

> Several Qualcomm clock controller drivers use pm_clk functionality.
> Instead of having common code in all the drivers, move the pm_clk
> handling to the qcom_cc_map/qcom_cc_probe.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sc7180.c       |  44 ++--------
>  drivers/clk/qcom/common.c             | 113 +++++++++++++++++++++++---
>  drivers/clk/qcom/common.h             |   6 ++
>  drivers/clk/qcom/lpasscorecc-sc7180.c |  56 +++----------
>  drivers/clk/qcom/mss-sc7180.c         |  40 ++-------
>  drivers/clk/qcom/q6sstop-qcs404.c     |  36 ++------
>  drivers/clk/qcom/turingcc-qcs404.c    |  34 ++------
>  7 files changed, 142 insertions(+), 187 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index 9bcf2f8ed4de..1c6c1b7fab51 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -9,7 +9,6 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_clock.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,camcc-sc7180.h>
> @@ -1631,8 +1630,12 @@ static const struct regmap_config cam_cc_sc7180_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const char * const cam_cc_sc7180_pm_clks[] = { "xo", "iface" };
> +
>  static const struct qcom_cc_desc cam_cc_sc7180_desc = {
>  	.config = &cam_cc_sc7180_regmap_config,
> +	.pm_clks = cam_cc_sc7180_pm_clks,
> +	.num_pm_clks = ARRAY_SIZE(cam_cc_sc7180_pm_clks),
>  	.clk_hws = cam_cc_sc7180_hws,
>  	.num_clk_hws = ARRAY_SIZE(cam_cc_sc7180_hws),
>  	.clks = cam_cc_sc7180_clocks,
> @@ -1652,33 +1655,9 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
>  
> -	pm_runtime_enable(&pdev->dev);
> -	ret = pm_clk_create(&pdev->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = pm_clk_add(&pdev->dev, "xo");
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to acquire XO clock\n");
> -		goto disable_pm_runtime;
> -	}
> -
> -	ret = pm_clk_add(&pdev->dev, "iface");
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to acquire iface clock\n");
> -		goto disable_pm_runtime;
> -	}
> -
> -	ret = pm_runtime_get(&pdev->dev);
> -	if (ret)
> -		goto destroy_pm_clk;
> -
>  	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
> -	if (IS_ERR(regmap)) {
> -		ret = PTR_ERR(regmap);
> -		pm_runtime_put(&pdev->dev);
> -		goto destroy_pm_clk;
> -	}
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
>  
>  	clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>  	clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> @@ -1686,21 +1665,12 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>  
>  	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
> -	pm_runtime_put(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
> -		goto destroy_pm_clk;
> +		return 0;
>  	}
>  
>  	return 0;
> -
> -destroy_pm_clk:
> -	pm_clk_destroy(&pdev->dev);
> -
> -disable_pm_runtime:
> -	pm_runtime_disable(&pdev->dev);
> -
> -	return ret;
>  }
>  
>  static const struct dev_pm_ops cam_cc_pm_ops = {
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index ed7c516a597a..e1d34561cab7 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -7,6 +7,8 @@
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/clk-provider.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -69,12 +71,86 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
>  }
>  EXPORT_SYMBOL_GPL(qcom_find_src_index);
>  
> +static void qcom_cc_pm_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
> +static void qcom_cc_pm_clk_destroy(void *data)
> +{
> +	pm_clk_destroy(data);
> +}
> +
> +static int
> +qcom_cc_add_pm_clks(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	int i;
> +
> +	if (!desc->num_pm_clks)
> +		return 0;
> +
> +	ret = pm_clk_create(dev);
> +	if (ret < 0)
> +		return ret;
> +	ret = devm_add_action_or_reset(dev, qcom_cc_pm_clk_destroy, dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < desc->num_pm_clks; i++) {
> +		ret = pm_clk_add(dev, desc->pm_clks[i]);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to acquire %s pm clk\n", desc->pm_clks[i]);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +qcom_cc_manage_pm(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	/* For now enable runtime PM only if we have PM clocks in use */
> +	if (desc->num_pm_clks && !pm_runtime_enabled(dev)) {
> +		pm_runtime_enable(dev);
> +
> +		ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = qcom_cc_add_pm_clks(pdev, desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Other code might have enabled runtime PM, resume device here */
> +	if (pm_runtime_enabled(dev)) {
> +		ret = pm_runtime_get_sync(dev);

As I said previously, don't do this. Look at how clk_pm_runtime_get()
and clk_pm_runtime_put() are invoked throughout the clock framework.

At best this would be an optimization to ensure that the pm_runtime
state isn't toggled back and forth between every operation, but this is
typically not how we deal with that and this is certainly unrelated to
the rest of what the patch does.

> +		if (ret) {
> +			pm_runtime_put_noidle(dev);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static struct regmap *
>  qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)

I really don't like the idea of having a function with a name that
indicates that it's mapping hardware blocks to under the hood also play
pm_runtime.

Afaict the reason for this patch is to avoid having to sprinkle
pm_runtime_enable(), pm_clk_create(), pm_clk_destroy() and
pm_runtime_disable() in the various clock drivers that needs this.

But as I said previously, there's a lot of drivers in the kernel that
does exactly and only that, so there's definitely motivation to create
devm_pm_runtime_enable() and devm_pm_clk_create() and then go back and
clean up these and a lot of other drivers.


Perhaps I'm overly optimistic about getting those interfaces landed, if
that's the case I would like to have some explicit
devres-pm_runtime_enable/pm_clk_create/pm_clk_add added in the common
code, rather than piggy backing the existing map function.

But either way, I would much rather see you land the subdomain setup in
gdsc_register(), the pm_runtime_enable/disable we need in the
dispcc-sm8250 and the pm_runtime_get()/put() we need in gdsc_init(),
gdsc_enable() and gdsc_disable() - before refactoring all this.

>  {
>  	void __iomem *base;
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = qcom_cc_manage_pm(pdev, desc);
> +	if (ret)
> +		return ERR_PTR(ret);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
>  	base = devm_ioremap_resource(dev, res);
> @@ -244,8 +320,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	struct clk_hw **clk_hws = desc->clk_hws;
>  
>  	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> -	if (!cc)
> -		return -ENOMEM;
> +	if (!cc) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>  
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
> @@ -257,22 +335,25 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  
>  	ret = devm_reset_controller_register(dev, &reset->rcdev);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	if (desc->gdscs && desc->num_gdscs) {
>  		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> -		if (!scd)
> -			return -ENOMEM;
> +		if (!scd) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
>  		scd->dev = dev;
>  		scd->scs = desc->gdscs;
>  		scd->num = desc->num_gdscs;
>  		ret = gdsc_register(scd, &reset->rcdev, regmap);
>  		if (ret)
> -			return ret;
> +			goto err;
>  		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
>  					       scd);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	cc->rclks = rclks;
> @@ -283,7 +364,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	for (i = 0; i < num_clk_hws; i++) {
>  		ret = devm_clk_hw_register(dev, clk_hws[i]);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	for (i = 0; i < num_clks; i++) {
> @@ -292,14 +373,26 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  
>  		ret = devm_clk_register_regmap(dev, rclks[i]);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
>  	if (ret)
> -		return ret;
> +		goto err;
> +
> +	if (pm_runtime_enabled(dev)) {
> +		/* for the LPASS on sc7180, which uses autosuspend */
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put(dev);
> +	}
>  
>  	return 0;
> +
> +err:
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_put(dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
>  
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index bb39a7e106d8..5b45e2033a92 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -19,8 +19,14 @@ struct clk_hw;
>  #define PLL_VOTE_FSM_ENA	BIT(20)
>  #define PLL_VOTE_FSM_RESET	BIT(21)
>  
> +/*
> + * Note: if pm_clks are used, pm_clk_suspend/resume should be called manually
> + * from runtime pm callbacks (or just passed to SET_RUNTIME_PM_OPS).
> + */

I don't like the fact that you're hiding most of the pm_runtime boiler
plate code, but each driver still needs to do this.

Perhaps there is merit to have a qcom_cc_pm_enable_and_add_clocks() and
qcom_cc_pm_ops exposed by common.c, but please let's add the pieces we
need first.

Regards,
Bjorn
