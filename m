Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3D4455D7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 15:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbhKROLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 09:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbhKROLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 09:11:06 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863E9C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 06:08:06 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id t6so6433853qkg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 06:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PGT3zZBITe/LWXQCMhqSdshUMMzhyWhRVp97Kizl7zw=;
        b=ve7v04KxgBj3+YWB/sPKKYeAwhPuff5ROtGzgYXp8XRFG3VZ3AhF2q18SafpzoZLbn
         dkyAebe1GvnHzsocxknJGYYHyrSLotXmR5Zf3rU7emsqtw4mVOlx6hW0hyo2YTiQjvDI
         5UThyYavtHhA87j2BwDULh0AOcCpVH4mCnhxraECqHP9tYFfYW8hVi/yOY/8HAlsLDjh
         oiUyzW99HKQ0k9KN+h+VTnjY4DbTLrL/ak6N3gqPbbfgWw5DhZ4tqHuoelqsTM0yZwsk
         1lxc/HV/S2cFWMxetPnpmJ2X5Zpfk8lCadurL1UDaHE8KHU+D+dbpY+R/n2kxxB7Wufo
         UeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PGT3zZBITe/LWXQCMhqSdshUMMzhyWhRVp97Kizl7zw=;
        b=D1nua50iE6L/zzfQdXAUprd+qaCzYEa/vaDkr3tWVK4dFgQ1yM44Spwek6zskGUtsa
         ywQv4B2XdFn4XFHQS0BPQCw3LtACp6WmOrGBqjg+ujh9h7DGWSggOuFK0Z+aXfBxvStF
         sOXLCkecAob8FDZe6Oj+yhHPtgnqSzQUtU5a56KBUXrvS+pVxv1I+Nsp75tNLhXiNl53
         7ZcxMr22F+kzuCp5v9DTnyQSC+hzKWnDMVHZKX6f/Y7OC4z3LCgBF4NENGnzbR3OoJ7T
         90sbAxLYJl7kJ2qFqok4FrBNaMwPgMyrlDreMul/7Asb+IE97aEQiN9a1rmOyWQ/EDuJ
         LF0Q==
X-Gm-Message-State: AOAM533VfZl97wmZLpMS4veScuPq1CE9KYXuHY1jUjqx0uUgZZzZtSCm
        vY64E3TRoAUQCkn/JKTpe2RJ/w==
X-Google-Smtp-Source: ABdhPJySk9up+d6zujaC7A6Ap/eUcdJjJDvIzKooJVC8PYjF52/J+133C9wbmnSLJLlTkhBGWZ2mQg==
X-Received: by 2002:a05:620a:a45:: with SMTP id j5mr21033392qka.392.1637244485660;
        Thu, 18 Nov 2021 06:08:05 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id n18sm1503314qtk.9.2021.11.18.06.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 06:08:05 -0800 (PST)
Subject: Re: [PATCH] cpufreq: qcom-hw: Use optional irq API
To:     Stephen Boyd <swboyd@chromium.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20211117020346.4088302-1-swboyd@chromium.org>
 <76b103ec-7034-e6c1-1ab4-174cf16f9fc8@linaro.org>
 <CAE-0n53HNSRTdADO1dbQTyLafyajUTatMq5tsLeNDLQ4g95YpA@mail.gmail.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <f1038a3e-57fb-ec01-26a0-452a11dfcf3a@linaro.org>
Date:   Thu, 18 Nov 2021 09:08:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53HNSRTdADO1dbQTyLafyajUTatMq5tsLeNDLQ4g95YpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/17/21 11:32 PM, Stephen Boyd wrote:
> Quoting Thara Gopinath (2021-11-17 18:55:17)
>> Hello Stephen,
>>
>> Thanks for the patch
>>
>> On 11/16/21 9:03 PM, Stephen Boyd wrote:
>>> Use platform_get_irq_optional() to avoid a noisy error message when the
>>> irq isn't specified. The irq is definitely optional given that we only
>>> care about errors that are -EPROBE_DEFER here.
>>>
>>> Cc: Thara Gopinath <thara.gopinath@linaro.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>>    drivers/cpufreq/qcom-cpufreq-hw.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
>>> index a2be0df7e174..b442d4983a22 100644
>>> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
>>> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
>>> @@ -382,9 +382,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>>>         * Look for LMh interrupt. If no interrupt line is specified /
>>>         * if there is an error, allow cpufreq to be enabled as usual.
>>>         */
>>> -     data->throttle_irq = platform_get_irq(pdev, index);
>>> -     if (data->throttle_irq <= 0)
>>> -             return data->throttle_irq == -EPROBE_DEFER ? -EPROBE_DEFER : 0;
>>> +     data->throttle_irq = platform_get_irq_optional(pdev, index);
>>> +     if (data->throttle_irq == -ENXIO)
>>> +             return 0;
>>> +     if (data->throttle_irq < 0)
>>> +             return data->throttle_irq;
>>
>> Here the idea is to return only -EPROBE_DEFER error. Else return a 0 ,
>> so that cpufreq is enabled even if lmh interrupt is inaccessible. The
>> above check returns errors other than -EPROBE_DEFER as well. So I would
>> say make irq optional and keep the below check
>>
>> if (data->throttle_irq <= 0)
>>          return data->throttle_irq == -EPROBE_DEFER ? -EPROBE_DEFER : 0;
> 
> I'd like to catch other errors, for example, DT has an irq specified
> that is outside the range of irqs available. If the DT is correct, then
> it will either have a valid irq and this will return a >= 0 value or
> nothing will be specified and we'll get back -ENXIO now. Do you have
> some scenario where my patch fails to work?

Exactly. Like in the scenario you mentioned above, I do not want cpufreq 
to be disabled. This interrupt is a throttle notification interrupt. The 
action taken on basis of this is to send thermal pressure signal to 
scheduler so that scheduler places tasks better. Even if the dt has 
messed up this interrupt, I think cpufreq should still be enabled. May 
be we can print a warn and still return 0 to enable cpufreq.

> 

-- 
Warm Regards
Thara (She/Her/Hers)
