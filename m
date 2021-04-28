Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159C836D934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 16:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhD1ODw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 10:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhD1ODv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 10:03:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07DCC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 07:03:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n138so99564909lfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hIlZcAoSbYPGRqVrq1QW1VGSSVC9v2Q8BKI4bIbHGWE=;
        b=hJ0AFlu82jzBPuRmLSQ7D7SqUBH1V2fY11cf4JrWJ1nTp6ZtolN0+wZKDr6WplTRmh
         8LWa1+1xasUijb3AJaGv0RWr9W4cuZkqPRHAe3+gHq4RSNs50442wwfZTHhW2od9x4Hk
         sZODx3vv9bcIBTKNuJ8d/rnTq8aRInMWhsIjwejnWdn318XZNJujvpfE7dVgORaGnGyu
         bM2WkuD4PjIURZNOSrfc8zsUJdgYMGIIN0ibQTeFlW4bsERdxXaWbZ3P91j7YoVLAhOz
         W0a8jglsrVYh9/1+/jazB2AxxUVP6DcMBI9VVG6Ngq0p5voMYDLNze9LkuqWEV4ReBEG
         owHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hIlZcAoSbYPGRqVrq1QW1VGSSVC9v2Q8BKI4bIbHGWE=;
        b=ZjizMO7wCQtRd7gfIOkbEqVPpjmIEISoXeIv9KgkEvBZG8MfvPgAsR6JiwpkHGMtZE
         8kVRn6mApzgvZKPcHTqo51EqZC0TME+fzPFq7I/LBJf1L1YxhCO73nLV8l3ns0c8wwXu
         TT9NoCodPH14bB4POJTOQja4sxQb2SG1ISiUi2LOFuxSZVEuk3imeS9o0b1sT6ARk8fc
         L/UJt1DZv7Lr5CsG0THc73YOecMr58E+KQCxELUS1TN8aBbQTDrml56i8nowoIJ0yq37
         mv4v2fpf6RyA+toQSO9okeocK4kV1JHj4AgP/BdeBO/VuRowxMhbP05sXzf81no8AOg3
         Alhw==
X-Gm-Message-State: AOAM531V1A5q1oEBTdzECYzXvqTVqLQLikq1tiOu/uUEpmQ2exD/H+7L
        gpHza6o1JSXcKeFXMMXhRQej2Arvk8Nxtw==
X-Google-Smtp-Source: ABdhPJwYPf7XPgjwdPAFFKGQ/RLPs3pjlVEgdifm7lbHkjGOkCxRrFZMRyNQF9IY/tYNzFapwDdf2w==
X-Received: by 2002:a19:ee0f:: with SMTP id g15mr21587709lfb.407.1619618583470;
        Wed, 28 Apr 2021 07:03:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b29sm1166981ljf.87.2021.04.28.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 07:03:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
 <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
 <20210428135901.GK1908499@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7b9e9b69-1817-6884-21ba-dde5e24d8f4d@linaro.org>
Date:   Wed, 28 Apr 2021 17:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210428135901.GK1908499@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/04/2021 16:59, Bjorn Andersson wrote:
> On Wed 28 Apr 08:41 CDT 2021, Dmitry Baryshkov wrote:
> 
>> On 28/04/2021 05:47, Bjorn Andersson wrote:
>>> On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
>>> [..]
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>>> index 92fe844b517b..be578fc4e54f 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>>>>    }
>>>>    static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>>>> -				  const char *dbgname, bool quiet)
>>>> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
>>>
>>> size_t sounds like a better fit for psize...
>>
>> I was trying to select between size_t and phys_addr_t, settling on the
>> latter one because it is used for resource size.
>>
> 
> I always thought resource_size_t was an alias for size_t, now I know :)
> 
> That said, I still think that size_t (in line with resource_size_t)
> gives a better hint about what the parameter represents...

Indeed, I'll change that in the next version.

> 
> Regards,
> Bjorn
> 


-- 
With best wishes
Dmitry
