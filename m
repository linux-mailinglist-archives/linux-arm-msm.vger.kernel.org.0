Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C412AB935
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392285AbfIFNZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 09:25:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55585 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390255AbfIFNZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 09:25:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id g207so6499658wmg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R9GWG5wY/iepwMnyG4oYLLomYTv7fOjvDEM4YE/5Ts8=;
        b=vAvdYJHTPWzSQjVkZ8S3mi4tdcxieXnkxnzSfhP2tKQ07aoJyay8oAM3N8LX2DDdeJ
         DCE06I2ab8RqEeOVeVnDhMauiM4gh8gt96w/YnGxXJ/+BsNY98G6gi4zwXPUN1g4RTsd
         ZcpO1KjQv8z7bSlreJmtFPibmMF6H18mfnpf6IgdAYFCXSD5ehLFyAlVQYfnmAxGU8yM
         z5Ydjp1+KIS+UiUTA/TrSheKcR+XabuXOyFvBSTqA3UBd0mgX2D4x/zlqX1cyumY4b0t
         mU0qXqcIgMZTTV2wBHE1h0PyKmMKlKIFIpWAooA+QpCsCNnOEttaB/3zV1132+yy59d9
         A9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R9GWG5wY/iepwMnyG4oYLLomYTv7fOjvDEM4YE/5Ts8=;
        b=k/ZbEFrDIlaP6EHHqTEMtrlPyEI9nJC4RA2/KicGhSYOu0YRgJX40ZmlhNzebXZ0uH
         he/bxYqpbgBx56VlmlEtl9IKisU+NGKDsFsXdx6AKHIJNXlpk/6z7Grlth0j+svMGws+
         3ool7POxaXGl6p09rh8ju2IkTDeKTwU6aS5ODpDo52KicCFdnqT2ZUjzsRlKMm0CjAuY
         KBY17A4bTOvBnjmKIc8iNLEgIHPKyG2MZ6XFlBkYHypdOsxu4reosLSjXCIuQIVpPF3c
         3Vigmt4zKZ/NQLzfhPJfkWDxarEO61BTZ2SD+NKbuHVcAnQ8nWu0zLAf6j+h76cqzeR9
         xejQ==
X-Gm-Message-State: APjAAAUOTtdBB1paejpVDncsMAzf3JyYzfvnl9zUfxkLm/1mEBvsJo6Y
        nGWYeqR6HEidUsLFmKnEG4Dasg==
X-Google-Smtp-Source: APXvYqzv8i3XmPWmf2CAOvd7eCXPNRrxKC4w1pA8ySv9OMt4DOq/XTjB17qT9vFU+6GApqkJmHBlFg==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr1096553wmd.117.1567776339388;
        Fri, 06 Sep 2019 06:25:39 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id d9sm2480551wrf.62.2019.09.06.06.25.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 06:25:38 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190905211913.GA31094@roeck-us.net>
 <68ca07e6-efa2-d5bd-111b-faaa86808192@linaro.org>
 <20190906125937.GA7255@roeck-us.net>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <3721c11b-6a18-9459-ef37-dccb0ffad198@linaro.org>
Date:   Fri, 6 Sep 2019 15:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906125937.GA7255@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>>>
>>>>  static const u32 reg_offset_data_apcs_tmr[] = {
>>>>  	[WDT_RST] = 0x38,
>>>>  	[WDT_EN] = 0x40,
>>>> @@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>>>>  	return container_of(wdd, struct qcom_wdt, wdd);
>>>>  }
>>>>  
>>>> +static inline int qcom_get_enable(struct watchdog_device *wdd)
>>>> +{
>>>> +	int enable = QCOM_WDT_ENABLE;
>>>> +
>>>> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
>>>> +		enable |= QCOM_WDT_ENABLE_IRQ;
>>>> +
>>>
>>> Again, the condition needs to be that pretimeout != 0,
>>> not that it is supported.
>>
>> no I dont think so. doing that would propagate a possible error in some
>> pretimeout setup code which would end up enabling an interrupt when it
>> shouldnt. so I dont think that doing that would be correct.
>>
> If the pretimeout setup code is buggy, it needs to be fixed.

the condition whether to enable the HW interrupts (IMO) should be
controlled by the DTS as part of the static configuration.

> 
>> The interrupt should only be enabled if WDIOF_PRETIMEOUT is configured
>> (independently of the pretimeout value); as a matter of fact, if
>> pretimeout is 0, the interrupt will trigger at the same time than bark
>> (which is what the original code used to do).
>>
> The original code did not set bit 1 of the WDT_EN register,

sure, this is true

> and it did not set the bark time.

actually no, unless we are looking at different files, the original code
did set the bark time even though PRETIMEOUT was not enabled... so yes
bark was being set to bite. Maybe I am misunderstanding your point.

> 
>> so I'd rather keep this condition unless you strongly oppose to it.
>>
> 
> Please feel free to petition  to Wim.

I'll change to your recomendation and repost v5 - I thought
WDIOF_PRETIMEOUT was formally correct but functionally there is little
difference (if the hardware works as expected)

thanks for all your comments Guenter.
