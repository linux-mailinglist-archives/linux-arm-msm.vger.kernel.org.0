Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FCF44C499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhKJPsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 10:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhKJPsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 10:48:20 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B046C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 07:45:32 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id d11so6096855ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Evhl9Rnbo6uGgtOTWwfei9Et0IZhF1n9wlVeq6oIj1A=;
        b=XvHKB56mv5C90vcBjAZBO7aaT4t9iqxblYkip8T5trmXnoz4XYw7Olww682/lZ/P9I
         EAuFNfQIi6Y0sMgc1XNsguFdmHuvsRIObaddzr6sv0YwILUKw61H5JQOew6NWs+cjC2r
         ALhEd5Dy/qwHEMG5sEXqxToSUQLBPHb5d5GUS/Z77x0a7oCj0jsmegSuM/8bYAFV7IoF
         x15YysBtWWmxm2qrfoVTQ8NfnNjTk2hSFrCeOk4Sl14EQQ2rR0nMij3SKZdV0vP1Z/rW
         aFZfo3s3yC4p3Go6S5pY8mwow0YWu9C+He3KN+m4qsuczvRNBSrHQWMXf5aMgpb2zbnX
         ZFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Evhl9Rnbo6uGgtOTWwfei9Et0IZhF1n9wlVeq6oIj1A=;
        b=Wa6bZRlBILn0eC71Nr2vravti7u+mt7xKvrHWqAaxz2b3i9SrSedmxf0zV5nSn3l0N
         ewyojgUdkOS+Ag0m0z59PauLnN2r1alfdvIjvSQlReYJZ7lHoK/OQmu3Gray1t0GX9K+
         abjf9HQtUmqeJNSE5xQPZkMFS8oDaYd8XYpogSGLZ7k0tYD4l1HPVv/NXRnDLNHJGcwJ
         0WttiXpHCB8CFWyWkGxu8hhxPUJGRhHQEPODJztg3CZnJCNdwPm2jRXvGU8PlfplUytk
         bg2OWIbbkagIx15UGNPnhbQaItcpiQJ2SCOusYWF+lVfZxOZ0IoGSTRmi5h6GnZiB2KM
         m4+Q==
X-Gm-Message-State: AOAM530xFixKPHVhv3KbPWso6LXaI5GBc1hASYZArjgn/R67vzviHvOM
        aGjc/IfSp65lqS+lveeFBS/PRw==
X-Google-Smtp-Source: ABdhPJyDNSBBZhe8ArtBHOdesPHCOUbDOWVH5GndVM9ompCdI+efQgsi7WtTpUgIXin/FubpBdihBw==
X-Received: by 2002:a2e:a413:: with SMTP id p19mr382804ljn.252.1636559130895;
        Wed, 10 Nov 2021 07:45:30 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id d16sm13817ljj.87.2021.11.10.07.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 07:45:30 -0800 (PST)
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix exposed stack contents
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20211110152745.1868099-1-vladimir.zapolskiy@linaro.org>
 <YYvn1CJBrWprEKCD@ripper>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <8e6c81de-9cd3-5f05-f310-a5d3df36a151@linaro.org>
Date:   Wed, 10 Nov 2021 17:45:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YYvn1CJBrWprEKCD@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 11/10/21 5:40 PM, Bjorn Andersson wrote:
> On Wed 10 Nov 07:27 PST 2021, Vladimir Zapolskiy wrote:
> 
>> On irq request it is improper to pass its designated name, which is
>> allocated on stack, because the irq name string is not copied, thus
>> there is a risk of leaking partial stack contents to userspace.
>>
>> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> This was already proposed and reviewed at:
> 
> https://lore.kernel.org/all/20210901084732.943248-1-ardb@kernel.org/

thank you for pointing it out, missed the fix in my mailbox and have to
reinvent it after stumbling upon the problem.

> Could Ard's patch please be picked up by the maintainers, preferably
> with above Fixes added, so we get this backported onto v5.15 stable...
> 

Right, the bug is quite critical and needs backporting.

--
Best wishes,
Vladimir
