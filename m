Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033093AD498
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 23:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234689AbhFRVzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 17:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhFRVzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 17:55:24 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D80C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 14:53:14 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id p21so8687113qtw.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tlfC7guzHnGUhI3CYP6SsQ3L2F2bpnWxpAP26B/r4lE=;
        b=c1PJM9IMsmEV7WTgP5glA28gcryVt11Yy9rOy4sMWcHpuAuYctnhMoRA/TnndaEXu9
         Rbcd4FhRPcC5JhriCLMuoqQm3ez0POjKf7G/OaRDnad4p2XwpEGRFybzjb5qAh+5I9wx
         V9zRDm2/O+uNQtirG2wWc6MwxGhSbuqdaBDhxZUayBY84NvbB1/47euOL7Jy8HDPhdrU
         joJ/K5EijUK5LXR60pm/3S8eJNDlO93A/vTG9eNu2UIt/j+Wbt51cqiXirPWCDO08Wts
         pJzlIn37eTLTSKfOrUKBIPiWrVe0DbvU3D0cueSAOYhR4zhKuHuIC1ulTai/nATOxii4
         iAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tlfC7guzHnGUhI3CYP6SsQ3L2F2bpnWxpAP26B/r4lE=;
        b=NPqmNhe+MbuUeG9Lr4W0lqKnUIApHReXWmWH5qKO8gbw7Obs6S46sN/iYZwKlhrq+j
         3yj6Spkc8FMsZdrbMUGrphPUi6odswYGkvhBXuMXyraIg4wVSPdN/B+QxUa/d22bFYvH
         9pT2PmRtLIiHe+slRrIM0Hh0A5cRyu2Kqh1RKj9ce72l5VDh/FwvdOEXFN4h57jJpikW
         qhGOi/A6dZVxoDB6/1O0m2k9ONcUotwSTn1tFdDH6G2iFwMp3J6SgaUudlYvZddbynAS
         VoeCip0rdNTueQ7Fe7X8BYyJkzHdIWWkIpBEazLO9TLd6dyg0jPV8t6Dyc7fl8LFD2YX
         bSmQ==
X-Gm-Message-State: AOAM533/pufZV4xlHOMm7vUE6r/th8uUexx8ZYUnuz+Qc9sTn9/HVEys
        GiUocjL0MXH7+zRmMGR5s/eWsw==
X-Google-Smtp-Source: ABdhPJwE91wGSAlfUJ9FU4CUkiG2NiKNvaCkaB0RyBPbh6dTpxuRmWrOGkt55gHzGx6RZk5nygbmMQ==
X-Received: by 2002:a05:622a:40b:: with SMTP id n11mr12438838qtx.60.1624053193550;
        Fri, 18 Jun 2021 14:53:13 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id w8sm4761888qkp.136.2021.06.18.14.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 14:53:12 -0700 (PDT)
Subject: Re: [PATCH 2/5] thermal: qcom: Add support for LMh driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
        viresh.kumar@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210608222926.2707768-1-thara.gopinath@linaro.org>
 <20210608222926.2707768-3-thara.gopinath@linaro.org>
 <YMfBtSap7fR3rdku@builder.lan>
 <4996de55-daa9-18a4-3c03-cf194d85500e@linaro.org>
 <YMzd5OEhG4PYYv+E@builder.lan>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <be5f133e-5fae-9a61-3cf5-7e611a17bc77@linaro.org>
Date:   Fri, 18 Jun 2021 17:53:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YMzd5OEhG4PYYv+E@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/18/21 1:54 PM, Bjorn Andersson wrote:
> On Mon 14 Jun 20:38 CDT 2021, Thara Gopinath wrote:
>> On 6/14/21 4:53 PM, Bjorn Andersson wrote:
>>> On Tue 08 Jun 17:29 CDT 2021, Thara Gopinath wrote:
>>>> diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
> [..]
>>>> +static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
>>>> +{
>>>> +	struct lmh_hw_data *lmh_data = data;
>>>> +	int irq = irq_find_mapping(lmh_data->domain, 0);
>>>> +
>>>> +	/*
>>>> +	 * Disable interrupt and call the cpufreq driver to handle the interrupt
>>>> +	 * cpufreq will enable the interrupt once finished processing.
>>>> +	 */
>>>> +	disable_irq_nosync(lmh_data->irq);
>>>
>>> The contract between this driver's disabling of the IRQ and the
>>> cpufreq-hw driver's enabling it when we're done polling does worry me.
>>>
>>> In the case of EPSS, don't we disable the interrupt during the polling
>>> there as well? If that's the case wouldn't it be better to implement
>>> irq_chip->irq_disable and have the cpufreq-hw driver do the disable in
>>> both cases?
>>
>> Yes. You are right. In case of EPSS, the cpufreq-hw will have to disable the
>> interrupt. I did think of the approach you suggested here. My only issue is
>> that we will dispatch the interrupt to cpufreq-hw without it disabling it
>> and hence the interrupt could fire again, right ?
>>
> 
> Does it fire again before you INTR_CLK it?

You mean clear it ? I couldn't reproduce it either way. I did not try 
the irq_chip->irq_disable either. So I will give it a try and if my 
tests pass , I will post it.

> 
> Regards,
> Bjorn
> 

-- 
Warm Regards
Thara (She/Her/Hers)
