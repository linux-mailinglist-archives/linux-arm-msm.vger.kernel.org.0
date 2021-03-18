Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D58F340ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhCRUFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 16:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbhCRUFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 16:05:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D4CC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:05:39 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u20so9042915lja.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q6PUygLd2CXnygyW6bbcAwIFdQAJc7wY0uz9i6YRMS0=;
        b=DtivWm1nvHqukfWwBGl4J3c0hQqnc0JsIjWj5R0TYAwuPrZoYwFZcc2a0V1GLyZI9P
         Qh5P9znKxGvJTkdApwli9nR+ug98QG8eP/eNKE9TaLYtCAGn79L/alcPpfGcOIAj8Crx
         79Dcwiu3WFQW5rnu8dx7q744DpDahY0qUXCs7Kcx5HcL/W+ABMMD2i9s3UOB6Xu8jTRA
         S5Z2u018BC7V6DuT7aeDGIqijVge8vwhtluFerJYq3AKTNA44TR28hkgJc20+R4dwDOK
         l1lNl+jnxO/Y4pOhBw6vZzHSiUvYyqiG9OAi6YQpw0wPFP0kYQWRSwIrRDGPjSN5O8a5
         c9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6PUygLd2CXnygyW6bbcAwIFdQAJc7wY0uz9i6YRMS0=;
        b=ce5+Hl6lu8Dm2YPDhuTJjHUMqDmwgGJ8LWoW/6tFCitv12TZhgw/QUF0PnjgWtNUF/
         QODUjMP4UIrT8ykiha8NYxhxkFi70a3yogq/BurG0GVDpXi3R3uy+T+zkxxFzqBUq7Qa
         Q63sgUZscgqR+W3x+Z14EbGhT1mMcQt7PgodWiUz2o2aVJQvq5Jb41O7Ha//p5hcWVLl
         ZInQmS5ZHaDEytFLkL3U8+OBELtPFZpZcMipuyQcwIQOUIwz6mdhpaoqhgo0KQu1kc8y
         lMKsAQSZj6fea7gZp4Nr1dpnrWTcMQuVP3xbfsOPA7n1nPN5AHJDyCgnVRkgY2krj/VN
         D24w==
X-Gm-Message-State: AOAM533QoTQO74ihHwHssVi4CqGfv2rPPUJS3/LDLgg+4ri6KedGB1CG
        NfyCAcjYI+RCt0Y3MUvkcd+t2w==
X-Google-Smtp-Source: ABdhPJxcOJr/aMUfBKt/Y/rK28TCbP0BBmj4XsdjXBJTN8Si5Ans5n49zdCt4gfieQeUk+b0F5JSLA==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr6523479ljk.289.1616097937524;
        Thu, 18 Mar 2021 13:05:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q17sm346659lfm.168.2021.03.18.13.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 13:05:37 -0700 (PDT)
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAF6AEGsN4s_wF0kHx4Y=vMM3AMTCewE4oiBdaxguVAku_nkODw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b0f44785-b56b-5451-9e7a-e75821d34563@linaro.org>
Date:   Thu, 18 Mar 2021 23:05:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsN4s_wF0kHx4Y=vMM3AMTCewE4oiBdaxguVAku_nkODw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/03/2021 19:25, Rob Clark wrote:
> On Mon, Mar 1, 2021 at 1:41 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> if GPU components have failed to bind, shutdown callback would fail with
>> the following backtrace. Add safeguard check to stop that oops from
>> happening and allow the board to reboot.

[skipped]

>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index 6a326761dc4a..2fd0cf6421ad 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>>          struct msm_kms *kms = priv->kms;
>>          struct drm_crtc *async_crtc = NULL;
>>          unsigned crtc_mask = get_crtc_mask(state);
>> -       bool async = kms->funcs->vsync_time &&
>> +       bool async;
>> +
>> +       if (!kms)
>> +               return;
> 
> I think we could instead just check for null priv->kms in
> msm_pdev_shutdown() and not call drm_atomic_helper_shutdown()?


Good idea. Sending v2.

> 
> BR,
> -R
> 
>> +
>> +       async = kms->funcs->vsync_time &&
>>                          can_do_async(state, &async_crtc);
>>
>>          trace_msm_atomic_commit_tail_start(async, crtc_mask);
>> --
>> 2.30.1
>>


-- 
With best wishes
Dmitry
