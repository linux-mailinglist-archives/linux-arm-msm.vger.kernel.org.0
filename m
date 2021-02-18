Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57E931ED8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhBRRqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbhBRPNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 10:13:48 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A19C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:03:23 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id w19so2276395qki.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p89DwoOOsvw+CnJ+KQOJKP+OK4RgyV7iDfRp7yPRuZo=;
        b=sgctuxKei7vpMxAFsHQIa8x6kCjgbaZvDkmVddN/LebhlxKF/pKp6tjD2DTiXUgLCt
         1cz7XUznrCNS7chrttB3GVbH2iITgGkEtzHzD1aLraA2mGEz1aU8d0vo+6V19zbzlTQp
         t4u5OBodgkj8GBJO1U6v4tGZz9yUUMo/kB720eV6RZjLH15grwDdYcBBTitxrohj0hGy
         HZ4oJUxIow1RUSGGTJttrInJn2tM97F6Ii1y9uIIduW/WO9LxAmlO3z8ZCTcL/jHMFxW
         Pqgm2El0fVG5MnU9qCwEGnKK7g37Y18a6/jWLnMR7yIruP1Rw4mrmzXr3vQQCSS8Aovn
         T7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p89DwoOOsvw+CnJ+KQOJKP+OK4RgyV7iDfRp7yPRuZo=;
        b=qIs8LEQSCws5fj1IRE1H6ulssQRXdKMD0U5JMfJqNc9IbvSXvg28vVj/sfYXbA1Pk8
         Q5Dye9VenJhP7e1STNJ3qyM/0aZDBCJA/CzNxHQgPmYV9sYA3MAzkivb/mx5PCLpn+wG
         mJg3h7kEuyaj0Kw7q3kgujjjPLGXnkguHzQbPB080AFc7zFKFnZJD9Vpxg5WPvrV1v3g
         rxi8YOIHhYoKZ055nBFaSEAXckgfFFTZZFvlXa09G6+Pk3wFi2mW8T0QoYVE5DJB3sUl
         P/E5McCtOcMfFCdbvjbvT0y0SsPw2R/NdGr7kmq1Ie2436gE9DrDaxrWIRhQ1tAgwt6m
         jb4Q==
X-Gm-Message-State: AOAM532s5QACWh5f7MUEr50wpfO2iMo7bXPlxsLZ0Kif302iENsAyLVn
        KJEL+vepL7gYQqy/UjUFmkLBasUu/+zorQ==
X-Google-Smtp-Source: ABdhPJwHIjGq2Qhgr/H2XVcUdMeLSumIo6vhlXYJH+GBjSxPPlh97AiMJ2XZSq5xQoedh4g2E5DQBA==
X-Received: by 2002:a37:8b84:: with SMTP id n126mr4461711qkd.223.1613660602315;
        Thu, 18 Feb 2021 07:03:22 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id u133sm4135077qka.116.2021.02.18.07.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 07:03:21 -0800 (PST)
Subject: Re: [PATCH] cpufreq: exclude boost frequencies from valid count if
 not enabled
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rjw@rjwysocki.net, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210217000013.4063289-1-thara.gopinath@linaro.org>
 <20210217055029.a25wjsyoosxageti@vireshk-i7>
 <4c9d9d44-5fa5-3ae1-e9bb-45cf6521b764@linaro.org>
 <20210218084847.743rttqwlmwyx6pz@vireshk-i7>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <d693d999-7734-3e69-edb9-9e03fd2f0d1a@linaro.org>
Date:   Thu, 18 Feb 2021 10:03:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218084847.743rttqwlmwyx6pz@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/18/21 3:48 AM, Viresh Kumar wrote:
> On 17-02-21, 10:32, Thara Gopinath wrote:
>> First of all, I am still unable to find this setting in the sysfs space.
> 
> The driver needs to call cpufreq_enable_boost_support() for that.

Ok. that makes sense.

> 
>> Irrespective the ideal behavior here will be to change the cpufreq cooling
>> dev max state when this happens.
> 
> Hmm.. recreating it every time boost frequency is enabled is like
> inviting trouble and it will be tricky. Maybe it can be done, I don't
> know.:)

Scheduling a notifier for max frequency change from the qos framework 
should do the work, right?

> 

-- 
Warm Regards
Thara
