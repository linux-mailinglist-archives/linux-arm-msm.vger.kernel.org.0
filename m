Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FE53C8485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 14:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhGNMkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 08:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhGNMkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 08:40:13 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC37FC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 05:37:21 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id j184so1355027qkd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zqg/oXXnwPi1uirxFlAxSo1xe+utXrq9i3VULjmSOuQ=;
        b=J3Kfa4RrBgV0eTAzR82Lviy/WfIGFLcshXMyEUFbjaa5EhzrrX4uANQk/YTbCOQYTc
         VpAWY55etdOw4IZGnUDrg4uUZOiU28Jc04Yk7q171breIPRm856q8iUuen7DfZobQvqv
         mw9TTXdIyGQn0vuHuj4n60ptEu7LIZSbwMDY8+vwg85H2o1QhooORCU94q6nwNUw1AzJ
         j86jEObFpAnbainPyN+NTLl9Oux2LcpnD8lOcDBZP1WlZuiXj8mQyh4ErbBj7B0krrDw
         adKjuFhsa65ccroVHnVikPl+Mx0EqJ59Vxj0Y8/G5G9rSDK3qW+4ksN0hBlEb2fNiDIb
         Yrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zqg/oXXnwPi1uirxFlAxSo1xe+utXrq9i3VULjmSOuQ=;
        b=t4bXczPUMeDq5pMF6moZdD2KAooncDOua/Je42bbRy1Hbuf5B6kUWukSnlwPXaVvgc
         iH5sSU4kso8NOZBNJfB4uZN5F16qUkNrpIp7x2bM/aNEhcFTuRQHqA1ajXe0or85j0oU
         HcxwHu+3BStVqaCucIuMwewDKhfBI6+gaseGSJ+/D61CmndIdMO0l4LNZQLEFOYqco9H
         tczQ/BU/TfS8Q4prkeHmlPySxyOqfqFEIgtOkN+ZzrrSuqvzJvyQi0DOfP2gi1XLhxM2
         0zeGEex/ZWWCZsP9Mo9zIqbZ8gV5OWaY49tJEwOJNduTE/1WhWCsM6c5FdG6UoTFZPJq
         Lq/A==
X-Gm-Message-State: AOAM531Y+ZrDL//V7hVk0N3jheFipqW2aTRYOhm6aBqBblzC3TMW9Tk1
        jgv3B7bqWWcFr3WBloCMVvRcPA==
X-Google-Smtp-Source: ABdhPJw2hS+EQ/pmbbFvCECMAwr7HSRkZ7n2WJXIGZ7zxABRIKXCoD5kLjmjaqy8n1JWBjYuGKAjhw==
X-Received: by 2002:a37:5b47:: with SMTP id p68mr9666364qkb.73.1626266240969;
        Wed, 14 Jul 2021 05:37:20 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id h68sm955221qkf.126.2021.07.14.05.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 05:37:20 -0700 (PDT)
Subject: Re: [Patch v3 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210708120656.663851-1-thara.gopinath@linaro.org>
 <20210708120656.663851-4-thara.gopinath@linaro.org>
 <20210709064646.7vjgiba2o7beudly@vireshk-i7>
 <5a98ef2a-d170-f52d-cc48-b838cddaa5c2@linaro.org>
 <20210712044112.svhlagrktcfvyj35@vireshk-i7>
 <b05e9c76-c0ed-9ecb-8225-9504e226677b@linaro.org>
 <20210713031848.sp5fpjg36uthnmuq@vireshk-i7>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6de43ee8-e3f4-f09e-1076-7746e44dd19a@linaro.org>
Date:   Wed, 14 Jul 2021 08:37:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713031848.sp5fpjg36uthnmuq@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/12/21 11:18 PM, Viresh Kumar wrote:
> On 12-07-21, 21:18, Thara Gopinath wrote:
>> So I really need the interrupt to fire and then the timer to kick in and
>> take up the monitoring. I can think of introducing a variable is_disabled
>> which is updated and read under a spinlock. qcom_cpufreq_hw_cpu_exit can
>> hold the spinlock and set is_disabled to true prior to cancelling the work
>> queue or disabling the interrupt. Before re-enabling the interrupt or
>> re-queuing the work in qcom_lmh_dcvs_notify, is_disabled can be read and
>> checked.
> 
> Or you can make the lmh_dcvs_poll_work item a pointer and mark it NULL in exit,
> with proper locking etc.

Yes it could work. I will spin the next version with either this or 
introducing a new variable with locking.

> 
>> But does this problem not exist in target_index , fast_switch etc also ? One
>> cpu can be disabling and the other one can be updating the target right?
> 
> The race doesn't happen there as cpufreq_unregister_driver() takes care of
> stopping everything before removing the policy. To be more precise, governor's
> ->stop() function is responsible for making sure that frequency won't be updated
> any further.
> 

-- 
Warm Regards
Thara (She/Her/Hers)
