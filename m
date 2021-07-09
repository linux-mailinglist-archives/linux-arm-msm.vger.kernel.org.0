Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A2B3C2AD0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhGIVbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbhGIVbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:31:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2530DC0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:28:57 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id p1so25888642lfr.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CY1SRvQcLbz0taU4BGyVae346fvB6IbmXql1r9MTOV8=;
        b=xZpb1WpUdECphf+EZ3GDLsNObWGVZYpdwsfYQfnlEyphT0hnq61f4Ugz8kRz7tkn9O
         4TxpUhmERcafFPiPiHqJ3muhOodW9TBE9wgWCl5gPueGBzEHXN4za0kvyW4Vx/e3cXVp
         ofLBTU7nOwU4+3W0Dn8zJnogkGEm9ASawOOv4qUxn31GgfvU2gyIH8Qc0TLmFvGD58x/
         u8bDvOVj+htmRRHY9Ee/QwunaA6DcEgAn8Ev18g0fe7YRpXt1uRtkrW+ltDFrwoZ/Lhd
         r6NaW2PhF/e6+DqD6jaobowWvWvgVm1kyf/QO/r5IHiMMayukfmeMU+FHVaU9SGn7w0Q
         Y1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CY1SRvQcLbz0taU4BGyVae346fvB6IbmXql1r9MTOV8=;
        b=Gr6rDq9mOGT9jewHHLPRFJ3kR62OI+maJlSIttwO0OfHG+lrYs+5TmrTRlKRB3h/Yk
         3vaEdeTRg7KZTmbP5rkCR87ut+eZRs+QkCBDw872SZ//PCVU9xbSkeNAmsq9ssft9TdB
         /URUPjOpA9M6Zwzd91Q6XHkR0nS1kmY1cSpfVp3QFj3nD9vMXSBmMmunkInBJm0BMmvj
         5IyupnItRVJEFPPnkJaFRSeQ0poay8YZL+DSQOw37HZOHF/JpOGOhs/zhCsZACoMNizm
         Dr0dIFzg/MIBiRp+ZdfjHl9oGe3K+jQL5PArA8INnJOKOCo9+Ggszyxy+b3pjr1gHCOK
         4wAQ==
X-Gm-Message-State: AOAM533x/zLxlyQqVvPTic3+dVt8YLE9QHSFgpAIEpuslTe7QGf6UIk1
        j9d6+BlH4Yrj0M/6suWiAq6O2w==
X-Google-Smtp-Source: ABdhPJxGzWuNqn/me5KgPT4Kq3K438B6ZD7cAOrIe89lCb68qnUm+jczVCmR2A3JWEdwHdgpT+smKA==
X-Received: by 2002:ac2:57c7:: with SMTP id k7mr14939668lfo.608.1625866135389;
        Fri, 09 Jul 2021 14:28:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu21sm593040lfb.180.2021.07.09.14.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 14:28:54 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] clk: qcom: gdsc: enable optional power domain
 support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-4-dmitry.baryshkov@linaro.org> <YOiXsnXFKP5qD5qX@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <35110e0e-5223-d3c6-51e4-03d96951bd4a@linaro.org>
Date:   Sat, 10 Jul 2021 00:28:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOiXsnXFKP5qD5qX@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/07/2021 21:38, Bjorn Andersson wrote:
> On Fri 09 Jul 12:31 CDT 2021, Dmitry Baryshkov wrote:
> 
>> On sm8250 dispcc and videocc registers are powered up by the MMCX power
>> domain. Currently we use a regulator to enable this domain on demand,
>> however this has some consequences, as genpd code is not reentrant.
>>
>> Teach Qualcomm clock controller code about setting up runtime PM and
>> using specified for gdsc powerup.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/common.c | 37 +++++++++++++++++++++++++++++++------
>>   drivers/clk/qcom/gdsc.c   |  4 ++++
>>   2 files changed, 35 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 60d2a78d1395..43d8f8feeb3c 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/clk-provider.h>
>>   #include <linux/reset-controller.h>
>>   #include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "common.h"
>>   #include "clk-rcg.h"
>> @@ -224,6 +225,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>>   	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>>   }
>>   
>> +static void qcom_cc_pm_runtime_disable(void *data)
>> +{
>> +	pm_runtime_disable(data);
>> +}
>> +
>>   int qcom_cc_really_probe(struct platform_device *pdev,
>>   			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>>   {
>> @@ -241,6 +247,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>   	if (!cc)
>>   		return -ENOMEM;
>>   
>> +	pm_runtime_enable(dev);
> 
> In turingcc-qcs404.c I'm using pm_runtime to have the clock framework
> ensure that the iface clock is enabled during clock operations, so this
> will result in a "unbalanced enable" warning.

And later I register the disabler:

  ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);

You might want to add this to qcs404 code.

> 
>> +	ret = pm_runtime_get_sync(dev);
> 
> I don't think you should wrap the entire initialization in a
> pm_runtime_get_sync()/put() region. Instead follow the clock framework
> and wrap gdsc initialization that needs to touch the hardware in:

Init should be wrapped in the pm_runtime_get/put calls, so that the MMCX 
domain is on through the fall init sequence. Otherwise it can get turned 
off during it, boom, failed register access and reboot.

> 
> 	if (pm_runtime_enabled())
> 		pm_runtime_get_sync();

I don't think it's worth doing that. Having single lock for the whole 
init sequence is safer (and cleaner).

If you check other pm-enabled drivers, they would either call 
pm_runtime_enable at the end of the probe or get_sync in the beginning 
of the probe and put_FOO in the end. In this driver calling 
pm_runtime_enable() at the end of the probe function will not work, 
since this way clk subsystem will not pick up the device for runtime 
power management (as pm_runtime_enabled() would return false).

> 
> I do however think that as of this patch, when probe returns MMCX might
> very well be turned off, as the only user (this driver) has pm_runtime
> enabled and it's idle. So I think you should introduce the
> pm_runtime_get()/put() in the gdsc functions before this patch.

Maybe I'd just squash them together.

> 
> 
> To summarize, I think you should rely on the individual clock drivers to
> pm_runtime_enable()/disable().
> 
>> +	if (ret < 0) {
>> +		pm_runtime_put(dev);
>> +		pm_runtime_disable(dev);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
>> +	if (ret)
>> +		goto err;
>> +
>>   	reset = &cc->reset;
>>   	reset->rcdev.of_node = dev->of_node;
>>   	reset->rcdev.ops = &qcom_reset_ops;
>> @@ -251,7 +269,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>   
>>   	ret = devm_reset_controller_register(dev, &reset->rcdev);
>>   	if (ret)
>> -		return ret;
>> +		goto err;
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
>> @@ -262,11 +280,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>   		scd->num = desc->num_gdscs;
>>   		ret = gdsc_register(scd, &reset->rcdev, regmap);
>>   		if (ret)
>> -			return ret;
>> +			goto err;
>>   		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
>>   					       scd);
>>   		if (ret)
>> -			return ret;
>> +			goto err;
>>   	}
>>   
>>   	cc->rclks = rclks;
>> @@ -277,7 +295,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>   	for (i = 0; i < num_clk_hws; i++) {
>>   		ret = devm_clk_hw_register(dev, clk_hws[i]);
>>   		if (ret)
>> -			return ret;
>> +			goto err;
>>   	}
>>   
>>   	for (i = 0; i < num_clks; i++) {
>> @@ -286,14 +304,21 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>   
>>   		ret = devm_clk_register_regmap(dev, rclks[i]);
>>   		if (ret)
>> -			return ret;
>> +			goto err;
>>   	}
>>   
>>   	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
>>   	if (ret)
>> -		return ret;
>> +		goto err;
>> +
>> +	pm_runtime_put(dev);
>>   
>>   	return 0;
>> +
>> +err:
>> +	pm_runtime_put(dev);
>> +
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
>>   
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 51ed640e527b..ccd36617d067 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -439,6 +439,8 @@ int gdsc_register(struct gdsc_desc *desc,
>>   			continue;
>>   		if (scs[i]->parent)
>>   			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>> +			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> 
> Nice, I didn't know that we could fish it out of the dev.
> 
> Regards,
> Bjorn
> 
>>   	}
>>   
>>   	return of_genpd_add_provider_onecell(dev->of_node, data);
>> @@ -457,6 +459,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>>   			continue;
>>   		if (scs[i]->parent)
>>   			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
>> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>> +			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>>   	}
>>   	of_genpd_del_provider(dev->of_node);
>>   }
>> -- 
>> 2.30.2
>>


-- 
With best wishes
Dmitry
