Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B963E8F6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 13:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237268AbhHKL1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 07:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhHKL1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 07:27:45 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48570C061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 04:27:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id e14so1919460qkg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M8xB0E2B1K+5eOLxbxOIv4aQXqMJ7e2Gt5MyPt4i1Sg=;
        b=nL/Xhm/jqNW742WksYFcYXw88JayWRSdCcC7mtJuyJ+1sT0Btf03OBt7djwxwRIGKh
         whc/Kpe4MxLoS2EGqgHgx43YrkIJwxxZwPjyYzPOx0TMJ8/dR0vw9VQUPVy1JCLmTrjc
         FEpzCJkMZk6hWb91p3CLrMg1D9Pr2vlyvHP2/syvo6ic9yFf3ygOTFzJUn9ruBtLZmsz
         C9XwoGI2gb1uRVv7h4BhHPBmKE0x7+VvpIm9CNhEiBaAsH0UvI2Hr1BBxAFPym5OOanS
         8NWYKqRtHfalYAU/Bvb2dcxOEnL/q/xYLlbtUTGHVuK0bLwQigZKGlXomBIEVOO1ffR7
         s1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M8xB0E2B1K+5eOLxbxOIv4aQXqMJ7e2Gt5MyPt4i1Sg=;
        b=FD4bUrb5canTsGSLgE3ioOfL1CYc4rg8hYkHvnmKPWU5BUtIV1YnxFHwZaQ3B5puk+
         MmE5AgL9BtBSMqkOQy+xlUY4tGb7RehjjHJdJf56An9+Q17i/4YAFHeOBagky9WE47pV
         E5vv/n4hAVTjqNh1C/qufg5+dw1Hwoo/C8cOrumXnJ4wPAMI/jSGxkdAnFKBB4h9b7bA
         Zw4fdK5jFvAsrvw5UlGNG4/+IGcy3hdIfoByQ0rL7HBlytlU7FcDSH0WOmLYbO3eivZ2
         qHwfDXvL0C6/1vMj3T+7/EUSd9ZVdbECN4eFTnwOm5hLnfxqBM7qxoYLSFT6WyQP25GK
         y+sw==
X-Gm-Message-State: AOAM530rFdqXT8mseoDLi0FLw0JKYppIBI08QfYkAcI+a0ZNWD6fbq7N
        IfnXF8VW8i6phGRbY4By3ZFsBA==
X-Google-Smtp-Source: ABdhPJww/x+iu4ttunbR4CGsUfuQLgc7BaGhPZS72OfL2EQHH4R1Z3rVtsaKuWqV03jE4AysrY8mUg==
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr30777288qke.191.1628681241460;
        Wed, 11 Aug 2021 04:27:21 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id d4sm9153573qty.15.2021.08.11.04.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 04:27:20 -0700 (PDT)
Subject: Re: [Patch v5 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        steev@kali.org, tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210809191605.3742979-1-thara.gopinath@linaro.org>
 <20210809191605.3742979-4-thara.gopinath@linaro.org>
 <20210810024723.qne6ntjtv5zxf576@vireshk-i7>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <2ea49a1c-5336-5a52-43ff-2000a7b0d25e@linaro.org>
Date:   Wed, 11 Aug 2021 07:27:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810024723.qne6ntjtv5zxf576@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/9/21 10:47 PM, Viresh Kumar wrote:
> On 09-08-21, 15:16, Thara Gopinath wrote:
>> Add interrupt support to notify the kernel of h/w initiated frequency
>> throttling by LMh. Convey this to scheduler via thermal presssure
>> interface.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>
>> v4->v5:
>> 	- Changed throttle_lock from a spinlock to mutex to take potential
>> 	  race between LMh de-init sequence and reenabling of
>> 	  interrupts/polling after a thermal throttle event.
>> 	- Other cosmetic fixes as pointed out by Viresh.
> 
> How do you expect this to get merged ? I pick up this patch alone ?

Hi.

Yes, you can pick up this patch alone. This patch is standalone and has 
no dependencies. Once you do that, I will drop it from my series.

> 

-- 
Warm Regards
Thara (She/Her/Hers)
