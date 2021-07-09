Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B373C2919
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 20:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhGISla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 14:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGISl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 14:41:29 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A24C0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 11:38:45 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so10422266otl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qj3KpcOQKWBzcflU86gjTc8VoKi1gpmdgNDbxJviBI0=;
        b=A4Cvlv1Fh51k0o0xQWyeFWpAZfb9FXth/pz01DS5kfqkl30l5jBXktepGdqZ0NA76I
         GKY/zBF6hWK0x8wXurclALF/1ImnhNqh36ZJP5+lKjNF++8h+5rG2XyGP4hiwQXOc4cT
         OKt/mrKSL1wtzvpGE+MepNetHCVFU2MXmr/pMHlT17SuFnw9iJbL9a/yMx3Hz+lk93iA
         NeDI1fFIHnXZ5HRO50Hww+ZEWCpxOCt7Q+/WD5shDX2q+/TioKGdFtvdJpWXfYMTERtn
         QL6n/MEPjsWsd/zgIXgjV3lHhv/b30hxFeuCPode4q9g5Z2tC4vroD4SQxBcto61xfF1
         3teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qj3KpcOQKWBzcflU86gjTc8VoKi1gpmdgNDbxJviBI0=;
        b=Wu0A1s807cEbA95ZNwTaU1YLo1nN1xIKH7NSVY3dm+0NELvjGNIW1MddBku9A9oxm/
         dF9mHGAcG4llpXxH5OSha/d2JsIBMirCziUTtnmq14OJBC2RaI0El8ITrgZAO7GhPAF3
         AwV6jQrcME+zyHXI6CsFlluGYfG6tWH4NV1+SMTkLqvBOdcTAAvM4GxgcU0R6G5/8lMP
         xkJKgR6zTXW9QFctT3NJxPh8PvNh4aH5jSXlNGdwpMOIrO7r1kC5p/RzV8/eeAnqG7rI
         Gd4oD9N/ma9davfiSSsWj31qm4rE8yFL9k6rBmNKR5mFhNNyc2KnAY0IrX7JikrP/e5g
         ma7w==
X-Gm-Message-State: AOAM533RmbK5FBBqJKkewBewZJ9BtlxigyWXqIKPM638YDsbuEHcqeKO
        uCVPl1Y0dfMyH0G1ZTmpg/Ad2g==
X-Google-Smtp-Source: ABdhPJwVD+4DFQQutaGF70jDlFkhLLbo2uu0p7xx8G/lH+KQw0QFWt6ZPfJ8hME6UCVC+jyulPb9mA==
X-Received: by 2002:a9d:5e17:: with SMTP id d23mr28618905oti.330.1625855924936;
        Fri, 09 Jul 2021 11:38:44 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l7sm1277837otu.76.2021.07.09.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:38:44 -0700 (PDT)
Date:   Fri, 9 Jul 2021 13:38:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: gdsc: enable optional power domain
 support
Message-ID: <YOiXsnXFKP5qD5qX@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709173202.667820-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 12:31 CDT 2021, Dmitry Baryshkov wrote:

> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Currently we use a regulator to enable this domain on demand,
> however this has some consequences, as genpd code is not reentrant.
> 
> Teach Qualcomm clock controller code about setting up runtime PM and
> using specified for gdsc powerup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/common.c | 37 +++++++++++++++++++++++++++++++------
>  drivers/clk/qcom/gdsc.c   |  4 ++++
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 60d2a78d1395..43d8f8feeb3c 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "common.h"
>  #include "clk-rcg.h"
> @@ -224,6 +225,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>  	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>  }
>  
> +static void qcom_cc_pm_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
>  int qcom_cc_really_probe(struct platform_device *pdev,
>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -241,6 +247,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	if (!cc)
>  		return -ENOMEM;
>  
> +	pm_runtime_enable(dev);

In turingcc-qcs404.c I'm using pm_runtime to have the clock framework
ensure that the iface clock is enabled during clock operations, so this
will result in a "unbalanced enable" warning.

> +	ret = pm_runtime_get_sync(dev);

I don't think you should wrap the entire initialization in a
pm_runtime_get_sync()/put() region. Instead follow the clock framework
and wrap gdsc initialization that needs to touch the hardware in:

	if (pm_runtime_enabled())
		pm_runtime_get_sync();

I do however think that as of this patch, when probe returns MMCX might
very well be turned off, as the only user (this driver) has pm_runtime
enabled and it's idle. So I think you should introduce the
pm_runtime_get()/put() in the gdsc functions before this patch.


To summarize, I think you should rely on the individual clock drivers to
pm_runtime_enable()/disable().

> +	if (ret < 0) {
> +		pm_runtime_put(dev);
> +		pm_runtime_disable(dev);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> +	if (ret)
> +		goto err;
> +
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;
> @@ -251,7 +269,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  
>  	ret = devm_reset_controller_register(dev, &reset->rcdev);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	if (desc->gdscs && desc->num_gdscs) {
>  		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> @@ -262,11 +280,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
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
> @@ -277,7 +295,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	for (i = 0; i < num_clk_hws; i++) {
>  		ret = devm_clk_hw_register(dev, clk_hws[i]);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	for (i = 0; i < num_clks; i++) {
> @@ -286,14 +304,21 @@ int qcom_cc_really_probe(struct platform_device *pdev,
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
> +	pm_runtime_put(dev);
>  
>  	return 0;
> +
> +err:
> +	pm_runtime_put(dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
>  
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 51ed640e527b..ccd36617d067 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -439,6 +439,8 @@ int gdsc_register(struct gdsc_desc *desc,
>  			continue;
>  		if (scs[i]->parent)
>  			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> +			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);

Nice, I didn't know that we could fish it out of the dev.

Regards,
Bjorn

>  	}
>  
>  	return of_genpd_add_provider_onecell(dev->of_node, data);
> @@ -457,6 +459,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>  			continue;
>  		if (scs[i]->parent)
>  			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> +			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>  	}
>  	of_genpd_del_provider(dev->of_node);
>  }
> -- 
> 2.30.2
> 
