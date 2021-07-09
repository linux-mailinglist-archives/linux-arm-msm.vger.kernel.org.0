Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867783C2B2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 00:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhGIWNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 18:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhGIWNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 18:13:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFCBC0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 15:10:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a18so26081322lfs.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uVekkBCXr4urFNfCMQxnITdCN/ES/x/lzFoar5LQqTw=;
        b=GcJWh0B5u907ldfCF3RPOO/yD60iEF/fCXS6YCJqTvP8mSuZXcSCTXOo+toAA7Ffjn
         OWfYlXi/ErTPbn8ReCPhHpb8G5EzEpGFxcZTKs3Mb6jWKJuECwze8j8JQT6hlRAEFvhJ
         yLQODEuFGIk68GW4Im5F13bwukQ0f5tQIajLQoerjqECUv/WjMVWuNuHPRlC4f2NatSs
         t39ld5Wq3QpXd7FGHaiV8N1QmlbbtVCmgZ2bZtJ4sEQI6ef5LwMle4fJHt/DO2Ju0F7U
         NHO0o7YX9HzRxMlPx0VZdoGvwNUw5EeupU4zoKwmAuPkE9xiF94jK8N800ETjRammpC6
         kp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uVekkBCXr4urFNfCMQxnITdCN/ES/x/lzFoar5LQqTw=;
        b=jyBlmK7UygPWAh7/1aVVqj0e0wLSMvao6YrzH3xd0BztaqpQpmxFSJ2GMXwIFLxlXc
         ohtcb2+yc2yZHRPiLFcZhWZbJsxsQ3snw1ux2FiNzuYdGjuZuDMhMFaMnn1pljGv+0wG
         ItOl+PVboBaWD9hW1r6T8IUcp7FL0fWrDnBVDeVW2W0+vqZamNvF+HTl5fdGDxCLF+tb
         lCijAj8CEcFp3fevQEPdueGKEI6pTGkAlG8yO4LJMQ9vVEM0YoXoPEnxtszYesrd3F/+
         4aBsp4vb6KxYVgzOa6JuXS1QU0AnjdgVkdM15GITwLTeW/1h08IXjXmitEAdGaEFwZTx
         b/VQ==
X-Gm-Message-State: AOAM532/5h5CgmRRyYHZjqE/AoXcejxfJq1VEB1rGkn4B3/yLT3YzbzB
        rrsortLQ+MWgHHzBO2CDw3enOA==
X-Google-Smtp-Source: ABdhPJyWQKDoo83HNZLdGACJlz1IfQyi1PreZXjqp6g8VGQEp76C3eaWxPrykp/WIHlLny20ybErqQ==
X-Received: by 2002:ac2:5e39:: with SMTP id o25mr19305928lfg.504.1625868635334;
        Fri, 09 Jul 2021 15:10:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t7sm560505lfc.103.2021.07.09.15.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 15:10:34 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] clk: qcom: gdsc: call runtime PM functions for the
 provider device
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
 <20210709173202.667820-5-dmitry.baryshkov@linaro.org> <YOibXCHvnG70ftQ0@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <613b2f07-ffea-9c65-ebd0-6ad3b4fe10b8@linaro.org>
Date:   Sat, 10 Jul 2021 01:10:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOibXCHvnG70ftQ0@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/07/2021 21:54, Bjorn Andersson wrote:
> On Fri 09 Jul 12:31 CDT 2021, Dmitry Baryshkov wrote:
> 
>> In order to properly handle runtime PM status of the provider device,
>> call pm_runtime_get/pm_runtime_put on the clock controller device.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/gdsc.c | 66 ++++++++++++++++++++++++++++++++++++++---
>>   drivers/clk/qcom/gdsc.h |  2 ++
>>   2 files changed, 64 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index ccd36617d067..6bec31fccb09 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/ktime.h>
>>   #include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset-controller.h>
>> @@ -50,6 +51,30 @@ enum gdsc_status {
>>   	GDSC_ON
>>   };
>>   
>> +static int gdsc_pm_runtime_get(struct gdsc *sc)
>> +{
>> +	int ret;
>> +
>> +	if (!sc->rpm_dev)
>> +		return 0;
>> +
>> +	ret = pm_runtime_get_sync(sc->rpm_dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(sc->rpm_dev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int gdsc_pm_runtime_put(struct gdsc *sc)
>> +{
>> +	if (!sc->rpm_dev)
>> +		return 0;
>> +
>> +	return pm_runtime_put_sync(sc->rpm_dev);
>> +}
>> +
>>   /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
>>   static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
>>   {
>> @@ -232,9 +257,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
>>   	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
>>   }
>>   
>> -static int gdsc_enable(struct generic_pm_domain *domain)
>> +static int _gdsc_enable(struct gdsc *sc)
>>   {
>> -	struct gdsc *sc = domain_to_gdsc(domain);
>>   	int ret;
>>   
>>   	if (sc->pwrsts == PWRSTS_ON)
>> @@ -290,11 +314,28 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>>   	return 0;
>>   }
>>   
>> -static int gdsc_disable(struct generic_pm_domain *domain)
>> +static int gdsc_enable(struct generic_pm_domain *domain)
>>   {
>>   	struct gdsc *sc = domain_to_gdsc(domain);
>>   	int ret;
>>   
>> +	ret = gdsc_pm_runtime_get(sc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = _gdsc_enable(sc);
>> +	if (ret) {
>> +		gdsc_pm_runtime_put(sc);
> 
> I presume what you do here is to leave the pm_runtime state of dispcc
> active if we succeeded in enabling the gdsc. But the gdsc is a subdomain
> of the parent domain, so the framework should take case of its
> dependency.
> 
> So the reason for gdsc_pm_runtime_get()/put() in this code path is so
> that you can access the dispcc registers, i.e. I think you should
> get()/put() regardless of the return value.

pm domain code will handle enabling MMCX, so this code is not required 
strictly speaking. Ulf suggested adding it back, so I followed the 
suggestion. Maybe I misunderstood his suggestion.

putting pm_runtime after gdsc_enable does not sound like a logical case. 
However it would simplify code a bit. Let me try...

> 
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int _gdsc_disable(struct gdsc *sc)
>> +{
>> +	int ret;
>> +
>>   	if (sc->pwrsts == PWRSTS_ON)
>>   		return gdsc_assert_reset(sc);
>>   
>> @@ -329,6 +370,18 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>>   	return 0;
>>   }
>>   
>> +static int gdsc_disable(struct generic_pm_domain *domain)
>> +{
>> +	struct gdsc *sc = domain_to_gdsc(domain);
>> +	int ret;
>> +
> 
> If the gdsc is found to be on at initialization, the next operation that
> will happen is gdsc_disable() and as you didn't activate the pm_runtime
> state in gdsc_init() you would in theory get here with registers
> unaccessible.
> 
> In practice though, the active gdsc should through the being a subdomain
> of the parent domain keep power on for you, so you won't notice this
> issue.

Nice catch.

> 
> But as above, I think you should wrap _gdsc_disable() in a get()/put()
> pair.
> 
>> +	ret = _gdsc_disable(sc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return gdsc_pm_runtime_put(sc);
>> +}
>> +
>>   static int gdsc_init(struct gdsc *sc)
>>   {
>>   	u32 mask, val;
>> @@ -425,6 +478,8 @@ int gdsc_register(struct gdsc_desc *desc,
>>   	for (i = 0; i < num; i++) {
>>   		if (!scs[i])
>>   			continue;
>> +		if (pm_runtime_enabled(dev))
>> +			scs[i]->rpm_dev = dev;
>>   		scs[i]->regmap = regmap;
>>   		scs[i]->rcdev = rcdev;
>>   		ret = gdsc_init(scs[i]);
>> @@ -486,7 +541,10 @@ void gdsc_unregister(struct gdsc_desc *desc)
>>    */
>>   int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>   {
>> +	struct gdsc *sc = domain_to_gdsc(domain);
>> +
>>   	/* Do nothing but give genpd the impression that we were successful */
>> -	return 0;
>> +	/* Get the runtime PM device only */
>> +	return gdsc_pm_runtime_get(sc);
> 
> Per above, if you let the framework deal with the gdsc's dependencies on
> the parent domain and you only get()/put() for the sake of dispcc then
> you don't need you don't need to do this to keep the subsequent
> gdsc_disable() in balance.
> 
>>   }
>>   EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index 5bb396b344d1..a82982df0a55 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -25,6 +25,7 @@ struct reset_controller_dev;
>>    * @resets: ids of resets associated with this gdsc
>>    * @reset_count: number of @resets
>>    * @rcdev: reset controller
>> + * @rpm_dev: runtime PM device
>>    */
>>   struct gdsc {
>>   	struct generic_pm_domain	pd;
>> @@ -58,6 +59,7 @@ struct gdsc {
>>   
>>   	const char 			*supply;
>>   	struct regulator		*rsupply;
>> +	struct device 			*rpm_dev;
> 
> This isn't just the "runtime pm device", it's the device this gdsc is
> associated with. So "dev" sounds sufficient to me, but that requires
> that you have a separate bool rpm_enabled to remember if
> pm_runtime_enabled() was true during probe.
> 
> So unless we need "dev" for something else this might be sufficient.
> 
> Regards,
> Bjorn
> 
>>   };
>>   
>>   struct gdsc_desc {
>> -- 
>> 2.30.2
>>


-- 
With best wishes
Dmitry
