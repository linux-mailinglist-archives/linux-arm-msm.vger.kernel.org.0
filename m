Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A311A4298C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 23:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbhJKVTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 17:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhJKVTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 17:19:10 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E62C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 14:17:10 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id r17so12381927qtx.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aFaiNjeTvld1X0vmZ2G8WJDTc5Mp6lRCwddZ5BoVR2Q=;
        b=Gb2RHde2HCKly4rPx15NmHm1f7OWhrDTPB3a0iaNuflguTgncOk7Kvaw1KLKEdTaJO
         J3AGNOCXxeWy7w2MnHfbSydxQuJhSg4TWodM8k8FSXRmijzpYmSwwufNcfKGVqScyex+
         2Ozg675RNYEVr4++41Mr1WyJwkpyvI6Gt2UuzdHqsTjlUaRrtfxqCgiLIjrIYqhOo1zk
         7LT0LEsYSqoEn4P2vgDEl2xHywR5AZulDVopV0wnwTW9xV2e6ncAFzzUXosQGjpp1txA
         zIylJcrs6sMShuvPgi8O+by4rUyYbYOXiTVrQnoRjeWfM4dz+kVNmgl+hHigM/8Z/uzx
         LDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aFaiNjeTvld1X0vmZ2G8WJDTc5Mp6lRCwddZ5BoVR2Q=;
        b=2Qsm2MawuHUBzJdGxmqxIpFC3fns9jxIad/y+400wES1g0JUYeaF0JUZLS71jAQHso
         7SerkAvCki5flmWMvT19+0xi/ez7xqTinzepLg0BXoGKlN2e/a29yDybi0tZp/wl1w4X
         TbODmrgOhtG4UaE5lZQqnE218ONwFbZp0vrFUq43RwLoCGhTc87ch+fKDwSNeYK8Z7M1
         1NSc6/j481YiCAt9TLVLPV1MpOOb/1kren3Mhn1XdO9nvGEi218V+VtPwW/HU1Fse1dh
         tDsUMImWJUYFDctJxDuhAVxzAjN5BiDGF8SlCDhVIEOdF1PgUboP3oNEbZmSHMbpUURB
         YFHw==
X-Gm-Message-State: AOAM533yJokq3EZRWCCGVMPlBJA0u+xQ1XR25CaQMbXje8Px0ozUMWr+
        ACTUTnPND5J4K2bI/BMDxHi/2Q==
X-Google-Smtp-Source: ABdhPJz7OaV0k5DNpo+Cq2aVen8Ye/B/FsyQaMp+I9D3BUe3XJWtXSXSh7FNWC9QRXKN+u3xiB6WjA==
X-Received: by 2002:ac8:3e8a:: with SMTP id y10mr17839236qtf.31.1633987029152;
        Mon, 11 Oct 2021 14:17:09 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id c7sm3252830qke.78.2021.10.11.14.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 14:17:08 -0700 (PDT)
Subject: Re: [PATCH 3/5] cpufreq: qcom-cpufreq-hw: Update offline CPUs per-cpu
 thermal pressure
To:     Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com,
        will@kernel.org, catalin.marinas@arm.com, linux@armlinux.org.uk,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        viresh.kumar@linaro.org, amitk@kernel.org,
        daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org
References: <20211007080729.8262-1-lukasz.luba@arm.com>
 <20211007080729.8262-4-lukasz.luba@arm.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <be6fb99f-90bc-9ba1-b5a7-034b30734158@linaro.org>
Date:   Mon, 11 Oct 2021 17:17:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007080729.8262-4-lukasz.luba@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/7/21 4:07 AM, Lukasz Luba wrote:
> The thermal pressure signal gives information to the scheduler about
> reduced CPU capacity due to thermal. It is based on a value stored in
> a per-cpu 'thermal_pressure' variable. The online CPUs will get the
> new value there, while the offline won't. Unfortunately, when the CPU
> is back online, the value read from per-cpu variable might be wrong
> (stale data).  This might affect the scheduler decisions, since it
> sees the CPU capacity differently than what is actually available.
> 
> Fix it by making sure that all online+offline CPUs would get the
> proper value in their per-cpu variable when there is throttling
> or throttling is removed.
> 
> Fixes: 275157b367f479 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks for the fix.

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

> ---
>   drivers/cpufreq/qcom-cpufreq-hw.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index a2be0df7e174..0138b2ec406d 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -304,7 +304,8 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
>   	if (capacity > max_capacity)
>   		capacity = max_capacity;
>   
> -	arch_set_thermal_pressure(policy->cpus, max_capacity - capacity);
> +	arch_set_thermal_pressure(policy->related_cpus,
> +				  max_capacity - capacity);
>   
>   	/*
>   	 * In the unlikely case policy is unregistered do not enable
> 

-- 
Warm Regards
Thara (She/Her/Hers)
