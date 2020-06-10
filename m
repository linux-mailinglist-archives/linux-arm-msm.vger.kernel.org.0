Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8641F5431
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 14:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgFJMGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 08:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbgFJMF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 08:05:59 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058A0C03E96B
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 05:05:59 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id d27so1479443qtg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jnTMkAZSSNPoToK/f86wPehzYJ/sCSz3yq728TnkvEg=;
        b=Ts3jLdavVWjQhbJuq+ajUxq6RscOkbjE8Nn9kxzW2cMsG7+nfMr6Ei8XTmAWSB9b2u
         dJTmKW85O+IRTZgba3VHXa0oi12kkh+RY4Vzub9Tt+j/w8A9krznHxc/MtYHJuzMm8cn
         mZCIBs0Kqi2F4tYx5OzV+05qrjFdYjmE9KrhnX6DTAgA9zs7viTZlTA4opRT1lJ1Sfzq
         YJtXLqvpjoonPZl7BKXcz2TOZ5He+qGBZhixLrTCNkYMF5tWakKM774BzsXtVXh8J7qg
         AeE+FLqXCKt92B1eLwITvgO/n6f/65dMSjlNKHILNirgLdXxVvYGmmuo/GlG4vkVyLfe
         1m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jnTMkAZSSNPoToK/f86wPehzYJ/sCSz3yq728TnkvEg=;
        b=XlP9Sr+UXg+AJN0vhM6Y+oqdBRdiBSEapqHhm+RbDJfZKuSNK+BNsdqyXZf8jge8XB
         MdXBBeqv6gCGgMr8b/K+eSjQgFOCG9EWRQXymlsAEYO74X48xVb/IOTKuXAlmH08n8RF
         sPE3nhcIoMX2J4fqbsDVT5JtKR+EOJyQdAwuxa4ANjebflBhCc/BxCBmsZCVZUd2EP0/
         PsWS3d/6M5mDsjRPbXYJ08Y5uqSzuYW/a4dkpRDnXjfM3Acda2PM9JOUNd2Vt3klO0+u
         rvWu7cVyk+son0KL4LqFOjdyf4+BPgDyrok9xpVIncAfsKSgI11US6i4afvuILHkaKr7
         vnHQ==
X-Gm-Message-State: AOAM530ibeFAO4etccuFR2GQTTIBAFoKZ9NNPZVE6KhfgppMM/F1+1/X
        nPP5uR5MfdVhZOLco6/p2dWPKoNqlbyHRA==
X-Google-Smtp-Source: ABdhPJxWirUTLUvqjo1fyyrdz/Te/YiqzLsdatsUJVAiIGX24L/VcL9MTw6j7oIDNsfJdfeSoKpj9w==
X-Received: by 2002:aed:3fa4:: with SMTP id s33mr2871077qth.148.1591790757071;
        Wed, 10 Jun 2020 05:05:57 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m6sm11779279qkk.4.2020.06.10.05.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 05:05:56 -0700 (PDT)
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
 <f3eabdb9-da43-9502-352a-1696babc114d@linaro.org>
 <dc8f59c6-2fa9-f3a3-6d77-2d03a6d2776b@marek.ca>
 <29a216a7-a76f-a4de-b62d-3043e7e25c18@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <d7ccf640-f493-4f08-a391-7b36bf6966a6@marek.ca>
Date:   Wed, 10 Jun 2020 08:06:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <29a216a7-a76f-a4de-b62d-3043e7e25c18@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/10/20 6:36 AM, Srinivas Kandagatla wrote:
> 
> 
> On 09/06/2020 12:33, Jonathan Marek wrote:
>> On 6/9/20 5:52 AM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 08/06/2020 21:43, Jonathan Marek wrote:
>>>> The driver may be used without slimbus, so don't depend on slimbus.
>>>>
>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>> ---
>>>>   drivers/soundwire/Kconfig | 1 -
>>>>   drivers/soundwire/qcom.c  | 5 +++++
>>>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
>>>> index fa2b4ab92ed9..d121cf739090 100644
>>>> --- a/drivers/soundwire/Kconfig
>>>> +++ b/drivers/soundwire/Kconfig
>>>> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>>>>   config SOUNDWIRE_QCOM
>>>>       tristate "Qualcomm SoundWire Master driver"
>>>> -    depends on SLIMBUS
>>>>       depends on SND_SOC
>>>
>>> Why not move this to imply SLIMBUS this will give more flexibility!
>>>
>>>
>>
>> If you mean to change it to "select SLIMBUS", I'd prefer not to, 
>> because this would increase code size unnecessarily in my kernel.
> 
> imply is week select, which means that this driver can be built without 
> SLIMBus selected. So removing reference to slimbus_bus is necessary in 
> this case.
> 

Will change it to "imply", I wasn't aware of this keyword.

> On the other hand, SLIMBus is going to be used sm8250 for BT audio, so 
> this would not be unnecessary. Also mostly these are build as modules, 
> so not sure why kernel size will increase here!
> 

Not everyone uses modules. I am using a config with CONFIG_MODULES=n and 
only relevant drivers enabled.

> Am not 100% sure if SLIMBus will be kept on all SoCs, but keeping 
> depends or imply in place would enforce or spell out some level of 
> dependency on this.
> 
>>
>>>>       help
>>>>         SoundWire Qualcomm Master driver.
>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>>> index 14334442615f..ac81c64768ea 100644
>>>> --- a/drivers/soundwire/qcom.c
>>>> +++ b/drivers/soundwire/qcom.c
>>>> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct 
>>>> platform_device *pdev)
>>>>       if (!ctrl)
>>>>           return -ENOMEM;
>>>> +#ifdef CONFIG_SLIMBUS
>>>>       if (dev->parent->bus == &slimbus_bus) {
>>>> +#else
>>>> +    if (false) {
>>>> +#endif
>>>
>>> May be you can do bit more cleanup here, which could endup like:
>>>
>>>
>>> ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>>> if (!ctrl->regmap) {
>>>      res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>      if (res) {
>>>          ctrl->mmio = devm_ioremap_resource(dev, res);
>>>          if (IS_ERR(ctrl->mmio)) {
>>>              dev_err(dev, "No valid mem resource found\n");
>>>              return PTR_ERR(ctrl->mmio);
>>>          }
>>>
>>>          ctrl->reg_read = qcom_swrm_cpu_reg_read;
>>>          ctrl->reg_write = qcom_swrm_cpu_reg_write;
>>>      } else {
>>>          dev_err(dev, "No valid slim resource found\n");
>>>          return -EINVAL;
>>>      }
>>> } else {
>>>      ctrl->reg_read = qcom_swrm_ahb_reg_read;
>>>      ctrl->reg_write = qcom_swrm_ahb_reg_write;
>>> }
>>>
>>>
>>>
>>> thanks,
>>> srini
>>
>> I don't think this is better, it feels more obfuscated, and I think 
>> its possible we may end up with the mmio sdw having a parent with a 
>> regmap. (it is not how I did things up in my upstream stack, but in 
>> downstream the sdw nodes are inside the "macro" codec nodes)
>>
>> I understand the '#ifdef CONFIG_SLIMBUS'/'dev->parent->bus == 
>> &slimbus_bus' is ugly, but at least its clear what's going on. Unless 
>> you have a better suggestion?
> 
> Other suggestion I had in my mind was to use compatible strings to get 
> reg_read, reg_write callbacks + some flags like (if_type) populated. 
> This can help looking up resources correctly.
> 

This is better than the previous suggestion, but is it safe to say that 
specific versions will always be used with MMIO or slimbus? (I guess the 
answer is yes, but I want to confirm)

> Thanks,
> srini
> 
>>
>>>>           ctrl->reg_read = qcom_swrm_ahb_reg_read;
>>>>           ctrl->reg_write = qcom_swrm_ahb_reg_write;
>>>>           ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>>>>           if (!ctrl->regmap)
>>>>               return -EINVAL;
>>>>       } else {
>>>> +
>>>>           res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>           ctrl->reg_read = qcom_swrm_cpu_reg_read;
>>>>
