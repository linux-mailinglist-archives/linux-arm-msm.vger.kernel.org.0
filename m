Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA7B275A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 16:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgIWOmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 10:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWOmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 10:42:16 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58214C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 07:42:16 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 60so19184376otw.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z95oVIBTfkEbl+uyir3w0ZqJF+KtX0tYet5L68ylfls=;
        b=jN3IOG05bDUzWPEZI2JtQSs5EhccGAKx+0OTFGga22R+/qSCLm7fz055FWzDM/kIBI
         D1HvGfm2xYgOwHSfLI+4CTZRh35oijmrknboOpEN5P8deS3cA29+/BCGdFdVEVwLIuM1
         IcnDqt42s88BbbRLeO7ASmMK/Rp4CFcP0goVLfHVzRDSSRu41DW5iVVtVxuPss4ZJsLt
         v2zmETmt+6xm4vdqUhaFIYQH7CVB2/Y98mw+poM1gHW+u8GPYnThpPW97Sn90TEmErq9
         v6Q8/AGvwoCcQ1qm4dH0pkrIGrN5coTafx2Al4S3RhzpNTbL4bTsBs1zazVkkp5yW3Ac
         0Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z95oVIBTfkEbl+uyir3w0ZqJF+KtX0tYet5L68ylfls=;
        b=MfQgVr8rzw+JDCx+qyxUZCEj5bqvzvLUtfz31AdGKLr/B2rms1qx7M0UoNXs3ae1Oa
         emN1AHNyO0tZaCVu/albyR7dIb41wZvJ4OV55kFQqvzoJUD3nppv2Kp7pnxz0Xz1uT6L
         IWWGUcGln89iRi7Y6nBbCWqpwLW6oic088C1UGIlsmKBIBQTTAZo3oWRuh7LQvHvKK6Z
         uOwRV+x34wIjARdw/G9BZjjtte668iiGFRL36NVgXzpxbmgIxYppza7iVQSvIZgUvoC+
         PWXQHqppEbWH/OvoPtFP4crsTJs1G64yHm/9hXpVMZhslmu/d3SMrpA1K8dhV9PyHCqH
         kq7Q==
X-Gm-Message-State: AOAM531v3aCyMMdKj6YBlVZM5xgHHWJQupPzaT28twB5nFhp1mdZ1/WD
        R3wRPhAdpovMq1PTiNmDLy7+zw==
X-Google-Smtp-Source: ABdhPJw0JPdlhxUtcDmd01TXvVVR8Olrf8Kh/0esOGyHXPL0W46rzAC83xIx+falqXeT8astKcMsHA==
X-Received: by 2002:a9d:2641:: with SMTP id a59mr6326903otb.217.1600872135602;
        Wed, 23 Sep 2020 07:42:15 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id p20sm46378oth.48.2020.09.23.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 07:42:14 -0700 (PDT)
Date:   Wed, 23 Sep 2020 09:42:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/4] clk: qcom: gdsc: enable external switchable power
 domain
Message-ID: <20200923144212.GB40811@yoga>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
 <20200911130950.578483-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911130950.578483-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Sep 08:09 CDT 2020, Dmitry Baryshkov wrote:

> Some GDSCs (SM8250's MDSS_GDSC for example) need switchable power domain
> to be on to be able to access hardware registers. Use dev_pm/opp to
                           ^
What you describe here ----+ sounds like the GDSC controller is part of
the power-domain specified and hence needs to be enabled in order to
control the GDSC.

But in contrast what the patch implements is a mechanism where the
GDSC power-domain is a child of some other power-domain. So the commit
message needs to better reflect what's implemented.

Then looking at the DT representation I think it says that the
controller sits in the specified power-domain, rather than the exposed
power-domain...

> enable corresponding power domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 56 ++++++++++++++++++++++++++++++++++++++---
>  drivers/clk/qcom/gdsc.h |  5 ++++
>  2 files changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index bfc4ac02f9ea..a522e062a79a 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset-controller.h>
> @@ -110,13 +111,31 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  	return -ETIMEDOUT;
>  }
>  
> +int gdsc_toggle_on(struct gdsc *sc)

This should be "static" and I think you should include "supply" in the
name to denote that it doesn't turn on the gdsc, but rather its supply.

> +{
> +	if (sc->rsupply)
> +		return regulator_enable(sc->rsupply);
> +	if (sc->pd_dev)
> +		return dev_pm_genpd_set_performance_state(sc->pd_dev, sc->pd_opp);
> +	return 0;
> +}
> +
> +int gdsc_toggle_off(struct gdsc *sc)
> +{
> +	if (sc->pd_dev)
> +		return dev_pm_genpd_set_performance_state(sc->pd_dev, 0);
> +	if (sc->rsupply)
> +		return regulator_disable(sc->rsupply);
> +	return 0;
> +}
> +
>  static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>  {
>  	int ret;
>  	u32 val = (status == GDSC_ON) ? 0 : SW_COLLAPSE_MASK;
>  
> -	if (status == GDSC_ON && sc->rsupply) {
> -		ret = regulator_enable(sc->rsupply);
> +	if (status == GDSC_ON) {
> +		ret = gdsc_toggle_on(sc);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -153,8 +172,8 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>  	ret = gdsc_poll_status(sc, status);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
> -	if (!ret && status == GDSC_OFF && sc->rsupply) {
> -		ret = regulator_disable(sc->rsupply);
> +	if (!ret && status == GDSC_OFF) {
> +		ret = gdsc_toggle_off(sc);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -407,6 +426,27 @@ int gdsc_register(struct gdsc_desc *desc,
>  			return PTR_ERR(scs[i]->rsupply);
>  	}
>  
> +	for (i = 0; i < num; i++) {
> +		if (!scs[i] || !scs[i]->domain)
> +			continue;
> +
> +		scs[i]->pd_opp = of_get_required_opp_performance_state(dev->of_node, scs[i]->perf_idx);
> +		if (scs[i]->pd_opp < 0)
> +			return scs[i]->pd_opp;
> +
> +		scs[i]->pd_dev = dev_pm_domain_attach_by_name(dev, scs[i]->domain);
> +		if (IS_ERR(scs[i]->pd_dev)) {
> +			ret = PTR_ERR(scs[i]->pd_dev);
> +			/* Single domain has been already attached, so reuse dev */
> +			if (ret == -EEXIST) {
> +				scs[i]->pd_dev = dev;
> +			} else {
> +				scs[i]->pd_dev = NULL;
> +				goto pm_detach;
> +			}
> +		}
> +	}
> +
>  	data->num_domains = num;
>  	for (i = 0; i < num; i++) {
>  		if (!scs[i])
> @@ -428,6 +468,12 @@ int gdsc_register(struct gdsc_desc *desc,
>  	}
>  
>  	return of_genpd_add_provider_onecell(dev->of_node, data);
> +
> +pm_detach:
> +	for (i = 0; i < num; i++)
> +		if (scs[i]->pd_dev)
> +			dev_pm_domain_detach(scs[i]->pd_dev, false);

I think that if dev_pm_domain_attach_by_name() returned -EEXIST you
will attempt to detach the main device's domain here.

> +	return ret;
>  }
>  
>  void gdsc_unregister(struct gdsc_desc *desc)
> @@ -443,6 +489,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>  			continue;
>  		if (scs[i]->parent)
>  			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> +		if (scs[i]->pd_dev && scs[i]->pd_dev != dev)
> +			dev_pm_domain_detach(scs[i]->pd_dev, true);

Ditto

Regards,
Bjorn

>  	}
>  	of_genpd_del_provider(dev->of_node);
>  }
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index bd537438c793..d58575f8f25f 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -57,6 +57,11 @@ struct gdsc {
>  
>  	const char 			*supply;
>  	struct regulator		*rsupply;
> +
> +	const char			*domain;
> +	unsigned int			perf_idx;
> +	struct device			*pd_dev;
> +	int				pd_opp;
>  };
>  
>  struct gdsc_desc {
> -- 
> 2.28.0
> 
