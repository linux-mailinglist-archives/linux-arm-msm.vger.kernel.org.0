Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8BC310AB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhBELzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 06:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhBELw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 06:52:58 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3FFC061786
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 03:52:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id p15so7333337wrq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vb44vPm1xU56Sdqtqj9DTcMMfbUsDS3zqJgKcIDWsFI=;
        b=fHK+EYPE1VvS65Saf6F98oDkKoPI4k2Y4hqeiKRBevHjE0NAG8Y5xS+FEt1jb+hrCQ
         We9nsh42Y6LB6ebzRya8RjNokQwWZBLewFugCT/WXaX0htHwTOyHEoCUaxCwxA146spP
         uZIwGQ76EG5jRPMz4NStsn+bIRvFMpEnj/JlTMUJwlw4LweuO2iYACXV/8QDuXNx2xGU
         Mh/OpFnS19oUX2ghdifpay2HFX45HAadGhM6g8T3F69IellsxllLeTc57nlnjUPOZFTg
         oTbvM7tw9u14JehqZXej1RAhUUboZXhaEh5pTQcb9K31VhsfRks/9UuH0JDBQPo1cpkz
         kZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vb44vPm1xU56Sdqtqj9DTcMMfbUsDS3zqJgKcIDWsFI=;
        b=I67610R47no8RFQIzz07eildQb5ISa1kUuiWM9LJ73NKlgdBXCKzYsNskxjKnLLiNi
         txK5VKLnqWrVWMhFWXNiuQsBo8CfDi2zpcpgTUr9ri6iXKbAh1+jiawcUva4xAbF7x+L
         enjbZGLNYKrXWDdo54MrGdPQWmwsefksUhqUXDn0Prq4H0P3/Mezb0ygtQaQPPTnXIgW
         2AvUSK0+B1fhrOM3kGlMogPuBlH0fHrT/soPYYaokC76yuIrIIas0ay2zDmFsXh/otFo
         H9sTmHRQuQMzK8QPGGhKiKCslGyKz4LOCKKjmHofyj/BrkIQI0TrL4uaEOrqnVQD9pc8
         gl9w==
X-Gm-Message-State: AOAM530MgnYHPLmsxSQS3LBN2VLTaTYFdDx3xlLF2y5Rx/FCqh0LYiLa
        oYkQoNdht7VYe5OVwN4hHNXgdg==
X-Google-Smtp-Source: ABdhPJwRHqWuou6UirI53ljWbvlXM+visXdHWhq2tN0CxaHk6XrG0ymiBWxyy3AEr/QTVRMhZOABHA==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr4560700wrq.226.1612525930436;
        Fri, 05 Feb 2021 03:52:10 -0800 (PST)
Received: from [192.168.0.4] (hst-221-40.medicom.bg. [84.238.221.40])
        by smtp.googlemail.com with ESMTPSA id d16sm11793104wrr.59.2021.02.05.03.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 03:52:09 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
 <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
 <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
 <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
Message-ID: <d7d114fe-6255-5672-e91c-2558d56da745@linaro.org>
Date:   Fri, 5 Feb 2021 13:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/5/21 1:37 PM, Stanimir Varbanov wrote:
> 
> 
> On 2/5/21 1:24 PM, Bryan O'Donoghue wrote:
>> On 05/02/2021 08:31, Stanimir Varbanov wrote:
>>> Why not just move platform_set_drvdata(pdev, core) at the end of
>>> venus_probe() after we registered v4l2_dev? I think this way we will
>>> avoid this v4l2_dev gymnastics.
>>
>> Because pm_ops->core_functionname() relies on getdrvdata.
>>
>> I changed that in a version of this fix which I didn't publish but also
>> found that there were other dependencies in core::probe venc::probe and
>> vdec::probe on drvdata.
>>
>> I can publish a fix for drvdata and you can take your preference
> 
> I'd prefer this solution. Do you see a problem if we change
> core_get|put|power functional pointers from pm_ops to receive a
> venus_core pointer instead of core->dev?
> 
> 

Wait, venus_runtime_suspend|resume also relies on that
dev_get_drvdata(). Can we call v4l2_device_register() earlier in
venus_probe?

-- 
regards,
Stan
