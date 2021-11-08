Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752E6449E11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 22:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240147AbhKHVZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 16:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240131AbhKHVZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 16:25:52 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB47C061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 13:23:07 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id a24so12812771qvb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4SKcoo0lkoTFwqwoPK2C06hU0WWJJEw7eZhBKrffPUs=;
        b=uYVa6n/+HMqiX97UVrg6rGsHLVd/IfQ7a9mffA5FhKFrcDI298PaV3Ab1ensnTIoou
         Z662Szdc7FG8vhcKjB8O8yTw6HLFDzuZ2k3T969MD4qfDsh7oSU21xhOg5trs/ebJ8if
         4yWnoB1M7GHRtM9HCNjEk2OBt+xtMfTzNQhYyoeErNJeu5+pVY09BPSxYEpEDFMUmaue
         ZDH8aAHFGuMHi6B71gP73VHXZrkJeamof1HWU/MVJa8PdVYM3tkrCnwGZLb6G+dSlCr5
         1J2c+UqMWQnnvVbvfSbRGNUPdQCOHVVRK1OJGBSmzbMAXjh9UApioU41P7XPfCxPq6hf
         2Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4SKcoo0lkoTFwqwoPK2C06hU0WWJJEw7eZhBKrffPUs=;
        b=T5dc3YOqnww8pEOg4gemkOIl/WQyvc6j1OS5GklMcMOkWt3IZ20jClTos8cR0mWQ4L
         w9Gj9NzwzKkluMcsYFvpIsh3mwxrB9tQT9HBNt2Ti33Nlm30Wyapj0EKwRhGqhftas6J
         ypCeQjFlxq1KjXJqg15k/tNpIpqSvRZfi1sBvZOo5dBVX26xaJG+JoLxlADYMAmzxhnL
         rE5pKRRh7sCae4zrhxDEfDmFTJufv/EDLmVVq1a+aNNNlDA9tkqAL9xkRJWJDLVgS70J
         AfDLz4DFdf+XRvLxsTn89lC1BPnLCTrIPIbNGrRdlsGKScN13znFGlRri6hk8F+1/TZS
         cwOA==
X-Gm-Message-State: AOAM532cLvS+QIn7SzjOG+xuqsIqt9P3UuCrVty57qZ3a4T6FIGtz0N6
        KxhMwrg/PoIunxXwbrHRI3xNPg==
X-Google-Smtp-Source: ABdhPJylaI/WDLHxydCZIXl5yw3Xo8Hz/ksEn1jVyB58NKa+TRAjC41SlTuSIdyDWnztdbdRRXa9WA==
X-Received: by 2002:ad4:5c67:: with SMTP id i7mr2335799qvh.37.1636406586327;
        Mon, 08 Nov 2021 13:23:06 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id y73sm1900016qkb.113.2021.11.08.13.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:23:05 -0800 (PST)
Subject: Re: [PATCH v3 4/5] cpufreq: qcom-cpufreq-hw: Use new thermal pressure
 update function
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com,
        will@kernel.org, catalin.marinas@arm.com, linux@armlinux.org.uk,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        viresh.kumar@linaro.org, amitk@kernel.org,
        daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        Steev Klimaszewski <steev@kali.org>
References: <20211103161020.26714-1-lukasz.luba@arm.com>
 <20211103161020.26714-5-lukasz.luba@arm.com>
 <c4a2618f-71ee-b688-6268-08256a8edf10@linaro.org>
 <02468805-f626-1f61-7f7f-73ed7dfad034@arm.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <af73cc0a-4dd2-832f-13b0-08807df64ce2@linaro.org>
Date:   Mon, 8 Nov 2021 16:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <02468805-f626-1f61-7f7f-73ed7dfad034@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/8/21 9:12 AM, Lukasz Luba wrote:
...snip

>>
>>
> 
> Well, I think the issue is broader. Look at the code which
> calculate this 'capacity'. It's just a multiplication & division:
> 
> max_capacity = arch_scale_cpu_capacity(cpu); // =1024 in our case
> capacity = mult_frac(max_capacity, throttled_freq,
>          policy->cpuinfo.max_freq);
> 
> In the reported by Steev output from sysfs cpufreq we know
> that the value of 'policy->cpuinfo.max_freq' is:
> /sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_max_freq:2956800
> 
> so when we put the values to the equation we get:
> capacity = 1024 * 2956800 / 2956800; // =1024
> The 'capacity' will be always <= 1024 and this check won't
> be triggered:
> 
> /* Don't pass boost capacity to scheduler */
> if (capacity > max_capacity)
>      capacity = max_capacity;
> 
> 
> IIUC you original code, you don't want to have this boost
> frequency to be treated as 1024 capacity. The reason is because
> the whole capacity machinery in arch_topology.c is calculated based
> on max freq value = 2841600,
> so the max capacity 1024 would be pinned to that frequency
> (according to Steeve's log:
> [   22.552273] THERMAL_PRESSURE: max_freq(2841) < capped_freq(2956) for 
> CPUs [4-7] )

Hi Lukasz,

Yes you are right in that I was using policy->cpuinfo.max_freq where as 
I should have used freq_factor. So now that you are using freq_factor, 
it makes sense to cap the capacity at the max capacity calulated by the 
scheduler.

I agree that the problem is complex because at some point we should look 
at rebuilding the topology based on changes to policy->cpuinfo.max_freq.

> 
> 
> Having all this in mind, the multiplication and division in your
> original code should be done:
> 
> capacity = 1024 * 2956800 / 2841600; // = 1065
> 
> then clamped to 1024 value.
> 
> My change just unveiled this division issue.
> 
> With that in mind, I tend to agree that I should have not
> rely on passed boost freq value and try to apply your suggestion check.
> Let me experiment with that...
> 
> Regards,
> Lukasz

-- 
Warm Regards
Thara (She/Her/Hers)
