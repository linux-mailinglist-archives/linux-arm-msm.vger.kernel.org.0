Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529DC44D991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 16:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbhKKPyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 10:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbhKKPx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 10:53:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD646C06122A
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:51:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id n12so5561228lfe.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VE8Mlr7JeF5rcTb8FIHtkH/fG/cfOojy0GSI5vjR3+0=;
        b=H+ZXkEuBQ5Vpfh47y/8sRNqCH9aIJ06X+1pLMK+VG3qBZAKgcoNUTo8/PGSjIHrQ33
         qfcqPwYEmsu6NWagagmbDm2Qwh7/kTqrW0qn3d5lgvoPIRSlYbQSgAi0Kh0TrJtG/Zu9
         7OA0SdICHKYxk8v8pFNYzGzk/Kqwlh8htpsP6LH8kf/gEWw6dsq3lRbXDODvaPz3zVtG
         +yX9zhp6IbsSIft3zxQAJ5Bcq7NN1dhVKdQNqlLvavmiRiDqnAayOda7Zi23Di0O+Olm
         F8EhIakHcig7mBUxlyHB1yg5xip7+5SueiKcxHv8+WpXkUW//+CHGrWNyrGJoTYScq96
         KKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VE8Mlr7JeF5rcTb8FIHtkH/fG/cfOojy0GSI5vjR3+0=;
        b=0drPi9N2jR1DHjC3irryAe1ljQwafs/pe244JNA+sRXG3vGzxlbNhJ4/0rM9og7Dip
         igRrTfG2WSGU0JckCW9vTi5hP4bQk31ZJfyRfoCT9o+so+mO5OPkAMbYgWRxVeTIuvWJ
         ptEBUvPx32jUljVwQEiP14CrhTg7cUSXFjPzzrNfzSgkO06aMSdmROCg0BtVbteyq5hk
         /9lv1LctbJYLC0OZIsaiyJC5xB1Qpb2Bb0yOLrkHeZGLqqJOuo4/YJyZdtmve2gmC6Me
         cgiAe5u3LRJObXv1tUkuU/TNx6jXo9yPrBVnwBp+o8WlwVD3ZO/7fgW6sDw69E+VNwIG
         KwDQ==
X-Gm-Message-State: AOAM532MjR4Fxr9xr4L5286Od7l1Jd94S0kBg/eogMg0I2Jar7g4u538
        viLYKBgz8Bk1AcGJzJORuUk0pw==
X-Google-Smtp-Source: ABdhPJxJrli2k5aVSGjSNTAmCbWcGFBCpqr3QkIpR7jRH4fag3R5WyIQS712gnKcIsqjGZaQ75wemw==
X-Received: by 2002:a05:6512:1023:: with SMTP id r3mr7364158lfr.47.1636645867088;
        Thu, 11 Nov 2021 07:51:07 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id bu25sm315676lfb.229.2021.11.11.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:51:06 -0800 (PST)
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix exposed stack contents
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20211110152745.1868099-1-vladimir.zapolskiy@linaro.org>
 <YYvn1CJBrWprEKCD@ripper> <20211111012503.rmz2kvcdzmht5rnw@vireshk-i7>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <3b340026-2fb0-a6f8-b0ea-a8010e2fbf72@linaro.org>
Date:   Thu, 11 Nov 2021 17:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211111012503.rmz2kvcdzmht5rnw@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Viresh,

On 11/11/21 3:25 AM, Viresh Kumar wrote:
> On 10-11-21, 07:40, Bjorn Andersson wrote:
>> On Wed 10 Nov 07:27 PST 2021, Vladimir Zapolskiy wrote:
>>
>>> On irq request it is improper to pass its designated name, which is
>>> allocated on stack, because the irq name string is not copied, thus
>>> there is a risk of leaking partial stack contents to userspace.
>>>
>>> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> This was already proposed and reviewed at:
>>
>> https://lore.kernel.org/all/20210901084732.943248-1-ardb@kernel.org/
>>
>> Could Ard's patch please be picked up by the maintainers, preferably
>> with above Fixes added, so we get this backported onto v5.15 stable...
> 
> It never reached any of the PM guys unfortunately.
> 
> Ard, can you please repost it again ?
> 

I've resent the rebased change under a series of new fixes:

   https://lore.kernel.org/linux-pm/20211111154808.2024808-1-vladimir.zapolskiy@linaro.org/T/#m2bbf2c57686

--
Best wishes,
Vladimir
