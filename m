Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE64449EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 00:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240916AbhKHXYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 18:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238610AbhKHXYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 18:24:05 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B66C061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 15:21:19 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id be32so7961422oib.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 15:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aglDua5AdbsngBR/JjVxVOGN4ojYR1I4q1+qjCDZ8kY=;
        b=Eg7aarpr23Ymmm+qLTN10NI1ZvqC/lnX626amIjCU5JPmst7qh8jx+QYoQ1nEpxHYg
         TQA9umINVSCeM2Zed5qvr6rUkMHzL/B7CB4kKwig3pjtqTZQqEao96aNtKcEe92Buhcb
         xZtMWJbSpYUR6/6qV5jOsxZOVFZpFZd8GcLoegr9NPEXjvTuLoKiB/6JwE4RszLny2aq
         tKcLUys/j7B2MdX3qSx7kXvXFo07Tvv0eH5jFA4pWuyEVlVew1sj4VPNQV6hClDDjqID
         oY3YBXfSdwQIenLWtOGdKdvYRIwz937qas2r/XaTaTVWGRcgRu8GVt29OwRbyfOwv5My
         tyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aglDua5AdbsngBR/JjVxVOGN4ojYR1I4q1+qjCDZ8kY=;
        b=u5V/7TW55aS6xqE2LGPV8wEtqhBgdWPdwZj5vCDPgIPbxLoUfgYIqeV4udb35uWc92
         0uP4lYf4OabgmMAy93R6QuaAwzVXPt2bNVOeeqRXJYSfE6H5nH197yGDeO8NRFlzPm+M
         in0Btx0VpMLl0Lqrx2j9H3ENnCqlL/Ew6jzLyMcKEoHPCBnobXXE3HUJIvVNX6Nudt8T
         HSSKOlq4M8iiGF7N/Hh7Bi+jKd8Oj+ZYFUnCFtwGmbjpQLUJN+x0HVDhZyxHvLv34JBB
         p2Pj6CmMZkGDlsCwelSsk7XBBIK9Zr31/RD7TM8zByjdOMck17yNeUQqMUNZvkXxRJbD
         Navg==
X-Gm-Message-State: AOAM531B059bQ8By1o2GnTX/XqWnJRSwghIo+kWsnC5uM7crx9wD/azc
        cRUhAHGxY9uL1V8tSD1/BmwLwA==
X-Google-Smtp-Source: ABdhPJwQPnBe2Z1YRuYGi21p43LHxeumd8a7Ehm4+kcXJPHdfw2SjGwwrqr7bfUNnge764Y9jctRig==
X-Received: by 2002:a05:6808:13c6:: with SMTP id d6mr1818543oiw.177.1636413678648;
        Mon, 08 Nov 2021 15:21:18 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id w29sm5555627ooe.25.2021.11.08.15.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 15:21:18 -0800 (PST)
Message-ID: <97e93876-d654-0a89-dce1-6fe1189345e2@kali.org>
Date:   Mon, 8 Nov 2021 17:21:16 -0600
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
 <f955a2aa-f788-00db-1ed8-dc9c7a1b2572@kali.org>
 <59054c90-c1cd-85bf-406e-579df668d7b4@linaro.org>
 <eac00041-a1b8-0780-931d-52249d538800@kali.org>
 <2c54dbbd-2ecb-fb76-fa9f-9752f429c20e@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <2c54dbbd-2ecb-fb76-fa9f-9752f429c20e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thara,
> Hi Steev,
>
> IIUC, PineBook Pro has Rockchip RK3399 which has 2 Cortex A-72 and 4 
> Cortex A-52 where as C630 has Qualcomm sdm845 which has 4 Cortex A-75 
> and 4 Cortex A-55. Task placements and subsequently cpu load will be 
> different for both the platforms. With the same workload, I will 
> expect Rockchip to system to be more loaded than sdm845. Having said 
> that, what cpu-freq governor are you using on both the systems.
>
I'm using sched-util on both of the systems.

I've tried a number of different ways of forcing builds only on the A-75 
cores, and I simply cannot get the load to be "enough" to kick in the 
boost frequency.

An example being

git clone https://github.com/zellij-org/zellij.git

cd zellij

taskset --cpu-list 4-7 cargo build --release

git clean -fdx

taskset --cpu-list 6-7 cargo build --release


On my C630, it never goes higher than 85C with the 4 cores being used, 
and with 2, it never goes about 65C and I do not get any 2.96GHz.  It's 
currently sitting at "6" in the time_in_state for 2965800.


--steev

