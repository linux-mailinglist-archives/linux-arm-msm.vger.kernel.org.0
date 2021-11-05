Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B06F446B01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 23:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhKEWtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 18:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbhKEWtI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 18:49:08 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64795C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 15:46:28 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so15247529ott.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hp5yDR8Prvk1XOLHiJfiiyB7kBL9249Yo9SKWwYcurc=;
        b=fGfqNbnk2ABvhMLmmytPWqSyXS3vqgLp/RW8uAetdm0Cf3iesPucRqyyvJNF7r0Q0p
         llJgco8xvycR18ObUR7xkFgLtHf4wCvKrFgsafbzEthUpZ2QrQ/bIeJT8GfvqlEedjcv
         iKwKJ2Q5F24ztUUhf4RvV7kl+3mahObZwskzURGwwjWy2+VkB1O/U6QYXpe19uBU2TST
         IFocwXviedARStv0DlCnQR7Ik0ADeMCPrwLR26FdfnDyOunBFQiDG7XMQn5jELVyOcZ2
         +TtaLKkUegCepqXB+bWAFRHFUaaC+DKjYWDZOCBvv1B3TVOAnSrRUMoPxThIH98QGRmE
         9Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hp5yDR8Prvk1XOLHiJfiiyB7kBL9249Yo9SKWwYcurc=;
        b=XAkicvNOPLLJU/H3cTfuTYN7Zi7Ivii1yPVX8xWkObFx3gGMZETS09eJGQzH2ox3gs
         9VSKRB9YZK3nphIUhBPx0ArnOsm2XfvoPU2FcSk8b/PYo9eUTGQUIpyrYr+mDZQsvNqt
         bZ3AK4FlNxlJOC1np4TvAYxVbCnhuydpUmqHxumlELAkcnnpWowqLo2xrOogqSUR3uv1
         izMci4NY0NBP6E3PTEzOcDsnQjqwWcm3rrIQV/l5jxexYDaWijAkUIcEZ4VJPt897DMC
         fVZI/SlpVHQkBneUCmbKwV41w2OGapJrmUoKUr4S2AFDVS2X3mZdOhQWaZJFJhgcOLz6
         xasQ==
X-Gm-Message-State: AOAM532IHn69I8fjWPiStTWxtOeorhdjdC0IGd1Kygg7OLwMPKLTPvQ6
        cP8IboUdNM03C/9ANY3aiKZhdA==
X-Google-Smtp-Source: ABdhPJyEJdiMXWfm/UqxBA2WDu4DzGeeV0uKlRlzpuKENRl1YQIIQp1eeo/rNJm6rSb5svD8o3XdZg==
X-Received: by 2002:a05:6830:4009:: with SMTP id h9mr45877669ots.186.1636152387820;
        Fri, 05 Nov 2021 15:46:27 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id i11sm2991821oof.36.2021.11.05.15.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 15:46:27 -0700 (PDT)
Message-ID: <f955a2aa-f788-00db-1ed8-dc9c7a1b2572@kali.org>
Date:   Fri, 5 Nov 2021 17:46:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/5] Refactor thermal pressure update to avoid code
 duplication
Content-Language: en-US
To:     Thara Gopinath <thara.gopinath@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com,
        will@kernel.org, catalin.marinas@arm.com, linux@armlinux.org.uk,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        viresh.kumar@linaro.org, amitk@kernel.org,
        daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org
References: <20211103161020.26714-1-lukasz.luba@arm.com>
 <c7b526f0-2c26-0cfc-910b-3521c6a6ef51@kali.org>
 <3cba148a-7077-7b6b-f131-dc65045aa348@arm.com>
 <9d533b6e-a81c-e823-fa6f-61fdea92fa65@kali.org>
 <74ea027b-b213-42b8-0f7d-275f3b84712e@linaro.org>
 <74603569-2ff1-999e-9618-79261fdb0ee4@kali.org>
 <b7e76c2a-ceac-500a-ff75-535a3f0d51d6@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <b7e76c2a-ceac-500a-ff75-535a3f0d51d6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> [snip]
> Hi,
>
> So IIUC the below logs correctly, you are never hitting boost 
> frequency (with or without this patch series). Is that correct ?
>
> w.r.t temperature , how are you measuring it? Do you have LMh enabled 
> or are you using tsens to mitigate cpu temperature ?


Hi,

I was wrong - it does indeed go boost with the patchset applied, it's 
just that it doesn't boost up to 2.96GHz very often at all. As noted by 
the 0.03% when i ran it while compiling zellij; I reapplied the patches 
(and the 6th patch from Lukasz's email) and after boot, 2.96GHz was 
showing at 0.39%.

Most tools that read the cpu frequency don't really seem to be well 
suited for big.LITTLE, and seem to throw an average of the speed, so 
cpufreq-info was the best I have.  We're apparently supposed to be using 
cpupower these days, but it doesn't seem to know anything about arm64 
devices.

Temperature wise, I'm just getting from the sensors, and I am using LMh.

Now, I have to admit, while I've thrown a patch here or there, I'm not 
exactly a kernel developer, just enough knowledge to be somewhat 
dangerous and know how to backport things.  In my mind, and my line of 
thinking, I would expect with boost enabled, that the cpu would boost up 
to that as often as possible, not require a specific workload to 
actually hit it.  But then again, I would expect multiple compilation 
jobs to be one of the workloads that would?

So I think, the part about never hitting 2.96GHz can be dismissed, and 
was simply my lack of knowledge about the cpufreq-info tool's averages.  
It does seem however to rarely ever hit 2.96GHz and I would actually 
expect it to hit it far more often.

