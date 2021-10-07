Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0977042561E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 17:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbhJGPKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 11:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242284AbhJGPKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 11:10:00 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A2C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 08:08:07 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so1982006ooh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f2IEE2E4YHMVJEM5MQhvt3XmAUfnTsdYPx8v3MA4L2s=;
        b=m4PzpRc+xMfv6d0tmbyjSiiE6f6chCnHuTBcaFnzvTdWfe5DKRBF2dUiSN6rFOXHnh
         XRQTyab0VAr+zGfGlrBoV8oygk90Z87oqI8XmKNLMRXAqMGzZoL482PFlgnRaLs3dAXZ
         CbY0kBoc7esmzMsfxNzyM+g8OgZ03e4HNWyHhxgcr6QfjHzV2P2nv0mDMe6sTMmFhWXo
         AAiXwZR0OAu9Y8D8ZTuYfWZf4bhSK8Yj5d5R4VxRUituwyNAhVdCHK2YHo09ANJpITu2
         KiuO8CXL/Dj/SNOY07hIvZ1rPdMabIWMQiQgAwogEIcDMBqZTaZOiWlbT1UvFKyp6oSD
         5MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f2IEE2E4YHMVJEM5MQhvt3XmAUfnTsdYPx8v3MA4L2s=;
        b=28YfwYAFB+uSOSj5XMQHZlZRlSPJAIx0JvFWIe2GNIfF4fcq97tio3W4XnyLzZZwhX
         9f3aHD1lL/VNKVO510/7ynp9s8nVgNVQk98WaGvkHVmr3x7v85qSid/C5PfN9XhkR5xm
         x1u3/TsbB2nKsi8aqwWwAlHiYacnsWFUssuFiJr5ksdGZYaQVV2YWyN4FLjjC3h28frp
         bX5jZAwBWlxy7ce4Gc6hW4zJXyVoBEw+SCFkou0BOY++9FCc1BHb49IB0WY7LeRhJ5aI
         4exYWnpaQRgSBX7Vuv2dE8iqhei9igjlv5LbM+R/aZaH0xp++eUf7t/AF8aIJq++ifqI
         9LMA==
X-Gm-Message-State: AOAM531BDnJZO4PJeaIXclR2kzJbz0w8aHAJN+th8HAlrkiDL+DJ4cdP
        QinANT/h8RuThyMOao2cYnrhmA==
X-Google-Smtp-Source: ABdhPJyv4HAG1yrz2NFpdFEebej0KM8Fmqp1jTDYgGE4mHhwFS6GiaodYZLoQDgFhA462a2jXpWOPQ==
X-Received: by 2002:a4a:d151:: with SMTP id o17mr3698904oor.63.1633619285911;
        Thu, 07 Oct 2021 08:08:05 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r4sm4638927oiw.36.2021.10.07.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 08:08:05 -0700 (PDT)
Date:   Thu, 7 Oct 2021 08:09:45 -0700
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
Subject: Re: [PATCH v7 3/8] clk: qcom: dispcc-sm8250: use runtime PM for the
 clock controller
Message-ID: <YV8NudkKvURyNqg7@ripper>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829154757.784699-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:

> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Use runtime PM calls to make sure that required power domain is
> powered on while we access clock controller's registers.
> 

As I said on previous iterations, the clock framework will ensure that
the power domain is powered up around all calls back into the clock
driver, so for clocks this isn't needed.

But after digging some more, the gdsc registration needs this and I
don't mind keeping it on for the duration of the registration, rather
than having the clock framework turn it on and off.

As far as I can see the reset_controller won't actually access the
hardware during registration.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>



That said, qcom_reset_{assert,deassert}() doesn't seem to be performed
under a pm_runtime_get() section, so I believe that should be addressed
as well.  I don't see that we have a problem with this in practice as of
today, but it seems worthy to correct - unless I'm just missing
something.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index 601c7c0ba483..108dd1249b6a 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  
> @@ -1226,13 +1227,31 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
>  
> +static void disp_cc_sm8250_pm_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
>  static int disp_cc_sm8250_probe(struct platform_device *pdev)
>  {
>  	struct regmap *regmap;
> +	int ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8250_pm_runtime_disable, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
>  
>  	regmap = qcom_cc_map(pdev, &disp_cc_sm8250_desc);
> -	if (IS_ERR(regmap))
> +	if (IS_ERR(regmap)) {
> +		pm_runtime_put(&pdev->dev);
>  		return PTR_ERR(regmap);
> +	}
>  
>  	/* note: trion == lucid, except for the prepare() op */
>  	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> @@ -1257,7 +1276,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>  	/* DISP_CC_XO_CLK always-on */
>  	regmap_update_bits(regmap, 0x605c, BIT(0), BIT(0));
>  
> -	return qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
> +	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
>  }
>  
>  static struct platform_driver disp_cc_sm8250_driver = {
> -- 
> 2.33.0
> 
