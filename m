Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D277F3C2C30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 02:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhGJAvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 20:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGJAvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 20:51:10 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08299C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 17:48:25 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u11so14449449oiv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 17:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TuSJh55QbqxFnjo9s4TmIfsRI6TdtjKL8hePg5u9G/o=;
        b=CwdY23+kuTNUsq03GzPEcGh/nrMzlWIv/e7kTVtISSe3XigaxnxL/alqvI0B8rjid1
         WfNVWuNiSga+50IRWdViEhdemMbn+lfwt+OXMex3pcInU6Z8AmNTObmB1EmS8RE4OfRz
         mc3QQk20arIIWVeRHTC38klogR9B2lVXeyBKLX32J5AJFpx+7PnOGZZKSoaz/RJYUHwl
         0lPduduYYXgyR/5l5lNHou9qEkSsgmXFpkKmSK5a9z3R2+DMiJYDnM45yMJgblqeC7wA
         W1zc+/dQGmG1xKO1J2CJr8avt9BWyTOvJyvCX6bbDWuQ/yF9USFeemkOSMZwxweHKWTE
         H25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TuSJh55QbqxFnjo9s4TmIfsRI6TdtjKL8hePg5u9G/o=;
        b=NNDlajRk0i53WFM191jiYGNaanjsLLFODSHn3f7WbrSDRrRSmXr1lnkjYUzEsQf5Ak
         5aGhrleSv58AkUZz6OqmrK+JSyg33ujVxj5XFtHKhA6HTcQLjEuDeYcF76mJnAlDCF6g
         oaWKXXsGxjgveV+TzvaAXL9Jwb7Xvw9rUVpq/+Yvh/PxTL2r+CQCEk61MyIVhpOvmdnB
         netRhEgBMsJ2zODeaiHDTzSjWmhLHvY+2jkhsGvMfTiqHhOohsMgtTFKnI3nW/5IQfJC
         Y17AHol2iY2F/tdv3KxNAVjg4m6pO2qG6y4no2hLecUhwuaiaFBAbgSaebS1Fr566dtL
         07pg==
X-Gm-Message-State: AOAM530LEekPpGHbz0juc0CpbVd1ZWtn+lxJyTbDu21z7lAQFzM70ywL
        2gN4BHmtp0WLypfxtM+SSN87lg==
X-Google-Smtp-Source: ABdhPJyhpJl2MH9nsaMu3TotS8aTVix37aMx3OggQ8RNfDQML8DSQVQFcLGJk7YhA6mtFzS2KDdEPA==
X-Received: by 2002:aca:abd0:: with SMTP id u199mr24927135oie.125.1625878104385;
        Fri, 09 Jul 2021 17:48:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v3sm1288483oon.11.2021.07.09.17.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 17:48:23 -0700 (PDT)
Date:   Fri, 9 Jul 2021 19:48:21 -0500
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
Message-ID: <YOjuVaaQM8G1rnNf@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-4-dmitry.baryshkov@linaro.org>
 <YOiXsnXFKP5qD5qX@yoga>
 <35110e0e-5223-d3c6-51e4-03d96951bd4a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35110e0e-5223-d3c6-51e4-03d96951bd4a@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 16:28 CDT 2021, Dmitry Baryshkov wrote:

> On 09/07/2021 21:38, Bjorn Andersson wrote:
> > On Fri 09 Jul 12:31 CDT 2021, Dmitry Baryshkov wrote:
> > 
> > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > domain. Currently we use a regulator to enable this domain on demand,
> > > however this has some consequences, as genpd code is not reentrant.
> > > 
> > > Teach Qualcomm clock controller code about setting up runtime PM and
> > > using specified for gdsc powerup.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/clk/qcom/common.c | 37 +++++++++++++++++++++++++++++++------
> > >   drivers/clk/qcom/gdsc.c   |  4 ++++
> > >   2 files changed, 35 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > > index 60d2a78d1395..43d8f8feeb3c 100644
> > > --- a/drivers/clk/qcom/common.c
> > > +++ b/drivers/clk/qcom/common.c
> > > @@ -10,6 +10,7 @@
> > >   #include <linux/clk-provider.h>
> > >   #include <linux/reset-controller.h>
> > >   #include <linux/of.h>
> > > +#include <linux/pm_runtime.h>
> > >   #include "common.h"
> > >   #include "clk-rcg.h"
> > > @@ -224,6 +225,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
> > >   	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
> > >   }
> > > +static void qcom_cc_pm_runtime_disable(void *data)
> > > +{
> > > +	pm_runtime_disable(data);
> > > +}
> > > +
> > >   int qcom_cc_really_probe(struct platform_device *pdev,
> > >   			 const struct qcom_cc_desc *desc, struct regmap *regmap)
> > >   {
> > > @@ -241,6 +247,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >   	if (!cc)
> > >   		return -ENOMEM;
> > > +	pm_runtime_enable(dev);
> > 
> > In turingcc-qcs404.c I'm using pm_runtime to have the clock framework
> > ensure that the iface clock is enabled during clock operations, so this
> > will result in a "unbalanced enable" warning.
> 
> And later I register the disabler:
> 
>  ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> 
> You might want to add this to qcs404 code.
> 

Let's land it using the apis that exist, then I think there's plenty of
examples throughout the kernel to make a case for introducing
devm_pm_clk_create() and devm_pm_runtime_enable().

But introducing that would complicate the path your patches would have
to take towards mainline.

> > 
> > > +	ret = pm_runtime_get_sync(dev);
> > 
> > I don't think you should wrap the entire initialization in a
> > pm_runtime_get_sync()/put() region. Instead follow the clock framework
> > and wrap gdsc initialization that needs to touch the hardware in:
> 
> Init should be wrapped in the pm_runtime_get/put calls, so that the MMCX
> domain is on through the fall init sequence. Otherwise it can get turned off
> during it, boom, failed register access and reboot.
> 

Right, we need to wrap init in pm_runtime_get()/put(), to ensure that
the registers are accessible. But the clock code has these surrounding
the initialization and therefor I think you should do the same in
gdsc_init() - instead of here.

> > 
> > 	if (pm_runtime_enabled())
> > 		pm_runtime_get_sync();
> 
> I don't think it's worth doing that. Having single lock for the whole init
> sequence is safer (and cleaner).
> 

Right, you need to cache the pm_runtime_enabled(), just as is done with
core->rpm_enabled in the clock framework.

The majority of the code involved in dispcc's initialization already has
more granular pm_runtime_get()/put() sections, so I don't think you
should override that with a big section here.

> If you check other pm-enabled drivers, they would either call
> pm_runtime_enable at the end of the probe or get_sync in the beginning of
> the probe and put_FOO in the end. In this driver calling pm_runtime_enable()
> at the end of the probe function will not work, since this way clk subsystem
> will not pick up the device for runtime power management (as
> pm_runtime_enabled() would return false).
> 

Right, just as turingcc does, we need to call pm_runtime_enable() early
and gdsc needs to check during initialization if pm_runtime should be
used for the particular clock controller.

> > 
> > I do however think that as of this patch, when probe returns MMCX might
> > very well be turned off, as the only user (this driver) has pm_runtime
> > enabled and it's idle. So I think you should introduce the
> > pm_runtime_get()/put() in the gdsc functions before this patch.
> 
> Maybe I'd just squash them together.
> 

With what I suggest the two patches are reduced to adding pm_runtime
support in the gdsc driver, and then a separate patch adding
pm_runtime_enable() in dispcc and videocc.

> > 
> > 
> > To summarize, I think you should rely on the individual clock drivers to
> > pm_runtime_enable()/disable().
> > 
> > > +	if (ret < 0) {
> > > +		pm_runtime_put(dev);
> > > +		pm_runtime_disable(dev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > >   	reset = &cc->reset;
> > >   	reset->rcdev.of_node = dev->of_node;
> > >   	reset->rcdev.ops = &qcom_reset_ops;
> > > @@ -251,7 +269,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >   	ret = devm_reset_controller_register(dev, &reset->rcdev);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto err;
> > >   	if (desc->gdscs && desc->num_gdscs) {
> > >   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> > > @@ -262,11 +280,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >   		scd->num = desc->num_gdscs;
> > >   		ret = gdsc_register(scd, &reset->rcdev, regmap);
> > >   		if (ret)
> > > -			return ret;
> > > +			goto err;
> > >   		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
> > >   					       scd);
> > >   		if (ret)
> > > -			return ret;
> > > +			goto err;
> > >   	}
> > >   	cc->rclks = rclks;
> > > @@ -277,7 +295,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >   	for (i = 0; i < num_clk_hws; i++) {
> > >   		ret = devm_clk_hw_register(dev, clk_hws[i]);
> > >   		if (ret)
> > > -			return ret;
> > > +			goto err;
> > >   	}
> > >   	for (i = 0; i < num_clks; i++) {
> > > @@ -286,14 +304,21 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> > >   		ret = devm_clk_register_regmap(dev, rclks[i]);
> > >   		if (ret)
> > > -			return ret;
> > > +			goto err;
> > >   	}
> > >   	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto err;
> > > +
> > > +	pm_runtime_put(dev);
> > >   	return 0;
> > > +
> > > +err:
> > > +	pm_runtime_put(dev);
> > > +
> > > +	return ret;
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > index 51ed640e527b..ccd36617d067 100644
> > > --- a/drivers/clk/qcom/gdsc.c
> > > +++ b/drivers/clk/qcom/gdsc.c
> > > @@ -439,6 +439,8 @@ int gdsc_register(struct gdsc_desc *desc,
> > >   			continue;
> > >   		if (scs[i]->parent)
> > >   			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > > +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > > +			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > 
> > Nice, I didn't know that we could fish it out of the dev.
> > 
> > Regards,
> > Bjorn
> > 
> > >   	}
> > >   	return of_genpd_add_provider_onecell(dev->of_node, data);
> > > @@ -457,6 +459,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
> > >   			continue;
> > >   		if (scs[i]->parent)
> > >   			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> > > +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > > +			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > >   	}
> > >   	of_genpd_del_provider(dev->of_node);
> > >   }
> > > -- 
> > > 2.30.2
> > > 
> 
> 
> -- 
> With best wishes
> Dmitry
