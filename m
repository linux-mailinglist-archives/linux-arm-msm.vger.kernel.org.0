Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6185731E099
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 21:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhBQUhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 15:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbhBQUgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 15:36:40 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B49C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 12:35:59 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id g3so6959188qvl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PtFYCUOobnFXmegfiYZJ33XeNVIXq0ITGP2K5dRUFqw=;
        b=IKN8NDde24/KFJ5MVx2fp5NwVTpJ8+pX0A1BaZJu5w8HXkW+kzGerFd5H0klrfnV6G
         kt39mImE05ClNR63gYQxCaNgdQQg9T6RcQWUyEKu5PtxHordLlS7A7kpAeGAikhTOziD
         38sSsyfRXB8pjqWJhLFUUyf5LVzo0lOYlDIB+ZTV9oqXxD67aLL1cLhv14QVxjz3j+CY
         lTALrsLRA3hI8cNprAqweyKfwGk6J8jd6FWQDd8rfJau4E2xyG8xR2QtZMyF+7IlZ+j9
         P/SvJKd+iAlCHKKsXjj1jlDndo5jsNYSpabUsNdQ7kZjLz/8avUyAc4IbBxW9+JqXdEH
         2eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PtFYCUOobnFXmegfiYZJ33XeNVIXq0ITGP2K5dRUFqw=;
        b=Zp2z2PVYE1lpGlmKDdGrhchHm5Dz9tmJjuzt0UoOp33ORdW8Kg6PwvSRysKbHvUU/v
         OL/VpokgmSPq0AHOYccB1vko+nKVj04YulSr2El5eK4styDFwouIdfyQ/d6rDZRQuxKd
         SPEsPn+EKURxUTuhB7twgZEHImMff+7OGvvKcI+AA7nDMxWhT7k+pWYaW6rYDvTrCCqG
         p1nBIcHAFcNIgpIz3h3/bD82wjYourem2dOd8hrtarTupvkYDpSPNKAZI8WT9qsWDwU1
         sXhdFw5PJoNhhvND06BrEABszyjEeS7LkvBq3k5S/YGTiQiV7OBq8QT4yBt2edCv8FMi
         EzzQ==
X-Gm-Message-State: AOAM530rTHCVYDBCsIUY/olD8TV5iC02tapN+ekvK9utnP3anw2E6Wku
        gTz1x+hTNGwhj1Tqg8a+55fixQ==
X-Google-Smtp-Source: ABdhPJx6Ee7D1e/VOvTXn/LiULM0iNhsJf5Ojv96o578uqlRaqjKtbKZxZ3drkgpdjmIr4alTTbdww==
X-Received: by 2002:ad4:4390:: with SMTP id s16mr1061338qvr.10.1613594158760;
        Wed, 17 Feb 2021 12:35:58 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id 136sm2450099qko.12.2021.02.17.12.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Feb 2021 12:35:58 -0800 (PST)
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
Date:   Wed, 17 Feb 2021 15:35:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/17/21 3:18 PM, Rob Clark wrote:
> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>>
>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>>>>>
>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>>>>>
>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>>>>>
>>>>>          cell = nvmem_cell_get(dev, "speed_bin");
>>>>>          /*
>>>>> -        * -ENOENT means that the platform doesn't support speedbin which is
>>>>> -        * fine
>>>>> +        * -ENOENT means no speed bin in device tree,
>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
>>>>
>>>> very minor nit, it would be nice to at least preserve the gist of the
>>>> "which is fine" (ie. some variation of "this is an optional thing and
>>>> things won't catch fire without it" ;-))
>>>>
>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
>>>> we should have a harder dependency on CONFIG_NVMEM..)
>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' property,
>>> we will see some error during boot up if we don't call
>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, "speed_bin")"
>>> is a way to test this.
>>>
>>> If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.
>>
>> I'm not sure if we want to go this far given the squishiness about module
>> dependencies. As far as I know we are the only driver that uses this seriously
>> on QCOM SoCs and this is only needed for certain targets. I don't know if we
>> want to force every target to build NVMEM and QFPROM on our behalf. But maybe
>> I'm just saying that because Kconfig dependencies tend to break my brain (and
>> then Arnd has to send a patch to fix it).
>>
> 
> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> other dependencies, so I suppose it wouldn't be the end of the world
> to select that.. but I guess we don't want to require QFPROM
> 
> I guess at the end of the day, what is the failure mode if you have a
> speed-bin device, but your kernel config misses QFPROM (and possibly
> NVMEM)?  If the result is just not having the highest clk rate(s)
> available, that isn't the end of the world.  But if it makes things
> not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
> seems to be way harder than it should be to build a kernel that works,
> if we could somehow not add to that problem (for both people with a6xx
> and older gens) that would be nice ;-)
> 

There is a "imply" kconfig option which solves exactly this problem. 
(you would "imply NVMEM" instead of "select NVMEM". then it would be 
possible to disable NVMEM but it would get enabled by default)

> BR,
> -R
> 
