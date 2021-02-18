Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F7631EDA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhBRRsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbhBRRO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 12:14:58 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C363C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 09:14:14 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u4so6403132ljh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 09:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LJucnLZINNrSDuVv8E6pwPE7WZH833ZqfXyQrmQm3Fo=;
        b=Niii2g9fr4XuWVOV3DJfOAQov1x64xnNIVzF7XuCmCxLHwFNq2Zzen4fN9j9TwgmZQ
         uWHqAEsQS09JDXJoKibTt/8ujSDsyNH6REb1SX/kGiVWh3WjhjOA7yQvpGonjdzrn8ve
         HpmuZyUpbtaYL94XF3m1BQZfRLwf8JoIgp2fyDmgwuYDQ2Tz/qW2Fy5Oj2gXcRoi4J05
         MY1W+9FT8LjMRyJZ14Zy+QTO5QBpyBxHmI6okru+jHOIBBAFAGAqqIElUUwMLXZ9DWZF
         XeJCTMJG/XMlRf7u/uCjEBdrTFFT5C9k5Wp8ichc//FYiv9IVfqeu8cjPK+YNBgB4lAj
         wA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LJucnLZINNrSDuVv8E6pwPE7WZH833ZqfXyQrmQm3Fo=;
        b=Xn+NtaOKfcI/Vc/cd5cXUZQKwG8QQH4ta1mQZ3FG0UyPGuHTJO8TDgUsBdEJK3ZN+u
         naIklaJ+NftVpU4MaKaSQMrmgHYXgt7UYpRO7gOv6v30Lx7VPdPlvtsl7l9qWtKFQYdb
         NWFrOKCwgUwaxS1P3TFmHgO9B2MCHYwEeGyAZI7ALxaGziXobybKxoMVwD1d10p93Zh5
         bVTm0ZOF4ZLEaYLvOYGSDjWfg2yeQJaZ9syvme3s7kP5/e8tcGwxrH3tmm0vX/xHPUf+
         5QFROOPc0oKIoFrqShTmdmjSLcUrY1bBeoCHg6XwdkxKt9EczWNEC7DWNSk1xVOc6tow
         0ojg==
X-Gm-Message-State: AOAM5325vMy3ApjoAerfI4vRGpII/Mxb9zbFyrnRO+9coKTODBLNjekE
        JdLxLKoEH9xhjv7OLLvFgo9cLQ==
X-Google-Smtp-Source: ABdhPJze4u+Habg52Udah3aKNOaYLld4j/fKs7dkbyHI+wI75S4+7wBzbZB+cu3YPUzf+N0JYE++gw==
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr2865681lfu.40.1613668452720;
        Thu, 18 Feb 2021 09:14:12 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id a2sm684900ljm.135.2021.02.18.09.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 09:14:11 -0800 (PST)
Subject: Re: [PATCH v2 1/3] v4l: common: v4l2_get_link_freq: add printing a
 warning
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210217221134.2606-1-andrey.konovalov@linaro.org>
 <20210217221134.2606-2-andrey.konovalov@linaro.org>
 <20210218075510.dcqbpmft46bymmnd@uno.localdomain>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <b9bc3f15-ef8e-af4d-32dc-83cb82c1197b@linaro.org>
Date:   Thu, 18 Feb 2021 20:14:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218075510.dcqbpmft46bymmnd@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jacopo,

On 18.02.2021 10:55, Jacopo Mondi wrote:
> Hi Andrey,
> 
> On Thu, Feb 18, 2021 at 01:11:32AM +0300, Andrey Konovalov wrote:
>> Print a warning if V4L2_CID_LINK_FREQ control is not implemented.
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 133d20e40f82..f1abdf2ab4ec 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -461,6 +461,8 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>>
>>   		freq = qm.value;
>>   	} else {
>> +		pr_warn("%s: V4L2_CID_LINK_FREQ not implemented\n", __func__);
>> +
> 
> It's a shame we can't access a struct device * somehow :(

Right. Otherwise the message could be even more useful.

> Also, nitpicking (please bear with me here) it is absolutely correct
> that V4L2_CID_LINK_FREQ is not implemented, but I think the real deal
> here is that the link rate is estimanted from PIXEL_RATE and that
> might be wrong.

Correct.

> What about (insipired from the error message in match_fwnode() which I
> find useful)
> 
>                  pr_warn("%s: Link frequency estimanted using pixel rate: result might be inaccurate\n",
>                          __func__);
>                  pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
>                          __func___);

This text is fine for me.
Just the both of these pr_warn's wouldn't fit into the 80 characters limit.
I tried to think out something more descriptive within this limit, but
gave up soon.

Let me post the v2.1 of this single patch with the longer warning message.
Then the maintainers could probably merge whatever they prefer.
Or I could post the v3 of the whole patchset if the [PATCH v2.1 1/3]
gets positive feedback.

Thanks,
Andrey

> Anyway, whatever works
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>     j
> 
>>   		if (!mul || !div)
>>   			return -ENOENT;
>>
>> --
>> 2.17.1
>>
