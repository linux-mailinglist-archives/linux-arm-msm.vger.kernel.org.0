Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE693FE2F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344574AbhIATYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344595AbhIATYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:24:00 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C10BC061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 12:23:03 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id 2so714463qtw.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 12:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PNSj3S3zepNDk0huxSqEYDStv1BaVNx7txAZ5A/RtYA=;
        b=GCe9AH6PK5n84wZn3bz8shHLZ3ncukDMdJqhJhfy6RSOkgVV+ss05++fY7xP1r3gh9
         5f0g5LUtRlEIvjgnugGF2UBNOpBQp/nxnTW7PRYB11cNpMXrrfR5Elg5dTi4zdF+sm/t
         +2dpZeBpYcVXb6uTg9OFYB3wTZHrHA5sii7s5Y/tKeq1sXr8xHdUcCltUcVI1pKlX7bo
         siB8X10sAfatqGhgZzLtJlLCDB0t8CWpNHKP61aTb4sA/dGRt5QkPyZ4Y6OTCyDDJS3X
         5pAhV0U+NJDIsmsheMFTW+FtcagsAUg5LwJiRmf3tJfcx/z+nvuMn5EU4sLUm3Rxjr2Q
         EH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PNSj3S3zepNDk0huxSqEYDStv1BaVNx7txAZ5A/RtYA=;
        b=NfiHY6szmttaNnA61WmSiuBk7/R8CdOml8ZcDPTcVq8Fo42S12uJ7mETlKCfY9+cyn
         JsG6uig0oYMejqzlOo+HQqilWP60rbLpYe6mZTwApooOfp+ac8xQkLqiZt9MWxtW9N0O
         O8Y/chZuAp80dStBMeLPf01Koy/a9+ZTtc/SeP++oairf8MO32EVe7gigT4La37smGPa
         f9vJJrf/f9MQqM2JD6alSOPi5reVxzOCqeuVs4Abv4/rqgltffvh+K3EvjX5mKDZc0Qn
         KV8iQWz4944+jsI62Gc05UTQ0aMk0sXc+Y2vV8l33fP1FgDn9H2iDIBqdT8hRuYPZeOA
         qosA==
X-Gm-Message-State: AOAM532BbpJX9t/+u3rK+lcexgxwujmsRXoztcZKN8oA07U1IGpRj3MV
        3ta/Dx1G7w8qBQgNIX8v509KaUCgZ79HKA==
X-Google-Smtp-Source: ABdhPJxRfAtsOcUjsEj8j9HdsdrMVuox3ur7DiYI0dxvCYKAMtNpNVJdqHhKRPeZcOb6jD3KoLjNpw==
X-Received: by 2002:ac8:1195:: with SMTP id d21mr983941qtj.267.1630524177124;
        Wed, 01 Sep 2021 12:22:57 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id 102sm476652qtc.62.2021.09.01.12.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 12:22:56 -0700 (PDT)
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
To:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20210901084732.943248-1-ardb@kernel.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5bdf0bb1-150b-6b60-6f9d-86542b4d7695@linaro.org>
Date:   Wed, 1 Sep 2021 15:22:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901084732.943248-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/1/21 4:47 AM, Ard Biesheuvel wrote:
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

Thanks for the fix.

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

-- 
Warm Regards
Thara (She/Her/Hers)

> ---
> I'm not following msm development closely, so apologies if this was
> already fixed, or if this is not based on the right tree.
> 
> This fixes a crash on my Yoga C630 when reading /proc/interrupts.
> 
>   drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 3cc27d9e2ed1..6613228fe68c 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -44,6 +44,7 @@ struct qcom_cpufreq_data {
>   	/* Lock to synchronize between de-init sequence and re-starting LMh polling/interrupts */
>   	spinlock_t throttle_lock;
>   	int throttle_irq;
> +	char irq_name[15];
>   	bool cancel_throttle;
>   };
>   
> @@ -371,7 +372,6 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>   {
>   	struct qcom_cpufreq_data *data = policy->driver_data;
>   	struct platform_device *pdev = cpufreq_get_driver_data();
> -	char irq_name[15];
>   	int ret;
>   
>   	/*
> @@ -388,11 +388,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>   	spin_lock_init(&data->throttle_lock);
>   	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
>   
> -	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
> +	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);
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


