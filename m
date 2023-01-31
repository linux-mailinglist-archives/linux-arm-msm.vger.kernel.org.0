Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75066682D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 14:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjAaNFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 08:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjAaNFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 08:05:33 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2249D4ED1A
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 05:05:00 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id s4so13157985qtx.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 05:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upUJ2TncehU87L41tsPtlPueesxjmVktEg4rw1YCSSo=;
        b=NI5AGL3V8hG523ljGEOljP3vZ30GikQg9ymSVEFzCSDY/MI4cBkwgYby64z7O0OlCd
         oVDzM83dlOcz6OemcQi/bsY8RLbOPlrY1aX849FruSM3CCSJd67By+wjkvLAQXj7ma0J
         9+P2NUiGZ+hMSa+WojA0C5+5xRjDF3dF0uuZGmnNtdQHHpeaeUjQHHHG2+l1bE6YhC2R
         C3UhEslTzmWt2+V7r5UM/A5dEAzRUAyaqxcdyCTf1rJs1w0jdZGbNkyNv6jCwWphOo3j
         MtIIUY4l+vz4cokNasEXOQoULlJoBguymstNOl0MpdjpVS7hOW5gyuwMR0vRJQpiorGJ
         VtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upUJ2TncehU87L41tsPtlPueesxjmVktEg4rw1YCSSo=;
        b=xpcb5sOXKQy7jjWXUn+jPsbi2DCpHR6yoD3J81SVrjxk0yUHnP8U5Iv+3Gghv1YhBA
         FZ2U1+6G2hsFpSpz+t7SisVzKm8mg0xM1oMQsws2h5hOOsjyzi43gZM5oOPdYVMVl1kJ
         wM8G82fpBzFX1RKpD13OE+V5Jnx3CvB+c80ygt8zhIoZtK2+LFbVWZfHml6LitpIS+lZ
         rp1/5tZrtguFqhL8g36q/EFYrOpNxGKCg+6y/LizYfKUCJ9/1Ppawbpy34icRWExXn+K
         UX/ruZsAuwZt/uAPccwOsT85UpYTuR8UjsqP2Hs22IaSxYbnepK71Bi5Bz9H1TR9xsW7
         sYEw==
X-Gm-Message-State: AFqh2kqo/gpUUOen76gtSLVmaHoVsWjXhkbgs4K4rBRNBsVo45pHmfvb
        POeBRTdT4Ww5o3LpVbj5b3thg9iQWVu60WNf
X-Google-Smtp-Source: AMrXdXu0eIn8QTBeXZ5tBgL5FbWrJ7vV8Ix4v7hcStH02gwfN7CTdZf9t9myJTmM3AdhHw9cFzh4cA==
X-Received: by 2002:ac8:7107:0:b0:3b6:2f22:75bd with SMTP id z7-20020ac87107000000b003b62f2275bdmr68744159qto.28.1675170299158;
        Tue, 31 Jan 2023 05:04:59 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id hf19-20020a05622a609300b003b643951117sm6968680qtb.38.2023.01.31.05.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:04:58 -0800 (PST)
Message-ID: <42080e79-e7c6-0e2b-5e8c-95aedb5823a0@linaro.org>
Date:   Tue, 31 Jan 2023 07:04:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next] net: ipa: use dev PM wakeirq handling
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20230127202758.2913612-1-caleb.connolly@linaro.org>
 <8deaed16-385b-6108-e971-0168df2b3c2f@linaro.org>
 <bc54d9ea-aaa5-eea6-a954-807b3451d070@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <bc54d9ea-aaa5-eea6-a954-807b3451d070@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/31/23 6:40 AM, Caleb Connolly wrote:
> 
> 
> On 1/28/23 13:47, Alex Elder wrote:
>> On 1/27/23 2:27 PM, Caleb Connolly wrote:
>>> Replace the enable_irq_wake() call with one to dev_pm_set_wake_irq()
>>> instead. This will let the dev PM framework automatically manage the
>>> the wakeup capability of the ipa IRQ and ensure that userspace requests
>>> to enable/disable wakeup for the IPA via sysfs are respected.
>>>
>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>
>> Looks OK to me.  Can you say something about how you
>> tested this, and what the result was?  Thanks.
> 
> Ah yeah. This was tested on the SDM845 (IPA 3.5.1) based SHIFT6mq in the 
> UK with an EE SIM card.
> 
> All network connections were disabled except for mobile data which was 
> configured using ModemManager. Then I set up a basic TCP server using 
> netcat on a public IP address and connected to it from the device.
> 
> It is then possible to validate that the wakeirq fires and the interrupt 
> is handled correctly by putting the device into s2idle sleep (echo mem > 
> /sys/power/state) and typing some data into the server terminal.
> 
> Then I disabled the wakeup as follows and repeated the test to ensure 
> that the device would no longer wake up on incoming data, and that the 
> data was received when the device resumes.
> 
> echo disabled > /sys/devices/platform/soc\@0/1e40000.ipa/power/wakeup

Great explanation, thank you.  This looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

>>
>>                      -Alex
>>
>>> ---
>>>   drivers/net/ipa/ipa_interrupt.c | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/net/ipa/ipa_interrupt.c 
>>> b/drivers/net/ipa/ipa_interrupt.c
>>> index c19cd27ac852..9a1153e80a3a 100644
>>> --- a/drivers/net/ipa/ipa_interrupt.c
>>> +++ b/drivers/net/ipa/ipa_interrupt.c
>>> @@ -22,6 +22,7 @@
>>>   #include <linux/types.h>
>>>   #include <linux/interrupt.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <linux/pm_wakeirq.h>
>>>   #include "ipa.h"
>>>   #include "ipa_reg.h"
>>> @@ -269,9 +270,9 @@ struct ipa_interrupt *ipa_interrupt_config(struct 
>>> ipa *ipa)
>>>           goto err_kfree;
>>>       }
>>> -    ret = enable_irq_wake(irq);
>>> +    ret = dev_pm_set_wake_irq(dev, irq);
>>>       if (ret) {
>>> -        dev_err(dev, "error %d enabling wakeup for \"ipa\" IRQ\n", 
>>> ret);
>>> +        dev_err(dev, "error %d registering \"ipa\" IRQ as 
>>> wakeirq\n", ret);
>>>           goto err_free_irq;
>>>       }
>>> @@ -289,11 +290,8 @@ struct ipa_interrupt 
>>> *ipa_interrupt_config(struct ipa *ipa)
>>>   void ipa_interrupt_deconfig(struct ipa_interrupt *interrupt)
>>>   {
>>>       struct device *dev = &interrupt->ipa->pdev->dev;
>>> -    int ret;
>>> -    ret = disable_irq_wake(interrupt->irq);
>>> -    if (ret)
>>> -        dev_err(dev, "error %d disabling \"ipa\" IRQ wakeup\n", ret);
>>> +    dev_pm_clear_wake_irq(dev);
>>>       free_irq(interrupt->irq, interrupt);
>>>       kfree(interrupt);
>>>   }
>>
> 

