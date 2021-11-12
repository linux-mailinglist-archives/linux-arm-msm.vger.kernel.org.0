Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0EB44EDC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 21:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbhKLUTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 15:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbhKLUS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 15:18:59 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2442C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 12:16:08 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id l22so25069925lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 12:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qXdqyoOTzA1MfaAt4NKVmOl7lozLaEGQxWE+UzP9OQs=;
        b=aWJo6LfuZl1l4KGxNPnp4rIOeRfMgyL04NxcC9HAQwA67/cGg2bmVeRkgDRxQoZk3Y
         vLQa2fHo6Q2FnNpLFPjqinqH5/Qe5KtZ/gWFcWKHqVOBGHgYOmqZ4mcZarvsi50YehvH
         0hj+Jf8pGD5eXjLCOq3DKisCyL0nu/4A6YJk2eyF4LL2YBILBqB1V/gFbaxVls/zgbK0
         lCdGjY/PPy/uXv2V/UT1mYgNtr8oJSJcLkYgKbjq1zvZpDCde9U0MnHlB6HkkG/3+mnK
         ldDghmSniuwmDpgR2IzaTj22q6LauxqPQDlk3LM1c3adDFGItCSbSJO1qPY0BB5ynjBM
         XZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qXdqyoOTzA1MfaAt4NKVmOl7lozLaEGQxWE+UzP9OQs=;
        b=MKyyxUXQZjylj10Djf+NhODWnxwRnFHUQaM6mu65ukXO9tO9lW1EeFPpBVtNSCxZ0A
         IjR8zpY8QhbYKlwusihk6hzQDF1UTeXvQmaPMMFJE5Ihat4VVdbIHOjbgjK1Hqt1GBu/
         VsZ+uDFkUm6B0zbvu3YJkKCzSLVA5QAMeTR0di2xoGrf/PbE/YGRJRWrKO2SocF2IAX2
         Xae0YATO2AZny1dOESHt5xk6W4hJCDitOuFTfHAlA/Q5G2PrPT1ylipfYvj2uLvHR6Nz
         DOHt6zobGcfzySMQAUqRkoEXM+mYGYN+X+IOQ+td3GKKKmQ5SaNtM2J3oSJ+jYgcMakI
         ZDEQ==
X-Gm-Message-State: AOAM531IeTXTzTUSOCE5SudskhfUmMiZbC8YeHavWziq3tnfi5sp7utD
        oifQ4Gybk1sZnrfcmiSvvjuEWA==
X-Google-Smtp-Source: ABdhPJycBrGTUBv4pQ+OqvmpMgKeRju5vwUV30Q9CKdG2o3WSKcQ/Ub9cPCkFx3kBw4RBmd38hnxfA==
X-Received: by 2002:ac2:464f:: with SMTP id s15mr16471127lfo.590.1636748167010;
        Fri, 12 Nov 2021 12:16:07 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm411986lfj.59.2021.11.12.12.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 12:16:06 -0800 (PST)
Subject: Re: [PATCH 1/3][RESEND] cpufreq: qcom-cpufreq-hw: Avoid stack buffer
 for IRQ name
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3711b990-a00a-9fce-0e08-657070d0a990@linaro.org>
Date:   Fri, 12 Nov 2021 23:16:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2021 18:48, Vladimir Zapolskiy wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Registering an IRQ requires the string buffer containing the name to
> remain allocated, as the name is not copied into another buffer.
> 
> So let's add a irq_name field to the data struct instead, which is
> guaranteed to have the appropriate lifetime.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> vzapolskiy: rebased, added all collected tags and resend the change from Ard
> 
>   drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index a2be0df7e174..3b5835336658 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -46,6 +46,7 @@ struct qcom_cpufreq_data {
>   	 */
>   	struct mutex throttle_lock;
>   	int throttle_irq;
> +	char irq_name[15];
>   	bool cancel_throttle;
>   	struct delayed_work throttle_work;
>   	struct cpufreq_policy *policy;
> @@ -375,7 +376,6 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>   {
>   	struct qcom_cpufreq_data *data = policy->driver_data;
>   	struct platform_device *pdev = cpufreq_get_driver_data();
> -	char irq_name[15];
>   	int ret;
>   
>   	/*
> @@ -392,11 +392,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>   	mutex_init(&data->throttle_lock);
>   	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
>   
> -	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
> +	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);

It might be easier to use devm_kasprintf() here.

>   	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
> -				   IRQF_ONESHOT, irq_name, data);
> +				   IRQF_ONESHOT, data->irq_name, data);
>   	if (ret) {
> -		dev_err(&pdev->dev, "Error registering %s: %d\n", irq_name, ret);
> +		dev_err(&pdev->dev, "Error registering %s: %d\n", data->irq_name, ret);
>   		return 0;
>   	}
>   
> 


-- 
With best wishes
Dmitry
