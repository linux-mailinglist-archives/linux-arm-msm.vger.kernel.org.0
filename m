Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60528752B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 21:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbjGMTyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 15:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjGMTyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 15:54:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12241BEB
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:54:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso2023320e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689278053; x=1689882853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0PYM0UrWih48djb/uyUnMby6/gvfb7iVYx22EYJs4k=;
        b=m+rIfx6P7LvMs6REVDW0Wib+N+7v1FLYFxaUGf0eC5CAQVVGFyGjybas/Uj1HDXu4j
         15DueT0E/ltT41JNlrQz1edX0sipbMLry39wTQixtzGO1ELichHvnkMMqTUWxySKa5oW
         aXKbmtKwAsKywxylA7UrLf4EfdlgFCt11QTuPRfHm2Xd+NWzeffb5eqxEGWPsEXIiV64
         ZzgU1tnKYlsPe93OowPB+UwA1nHDoUONWR5cLISaUgb2enRzB2xWFa8X0Lr/CknXQOjF
         hi3xiV2s+0uPqqSH8XWdXyBbTtQEM6F8FFOwsz3tHEhlzGnuChaDw1aOsEzLfxRznQ3m
         xv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689278053; x=1689882853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0PYM0UrWih48djb/uyUnMby6/gvfb7iVYx22EYJs4k=;
        b=j2b115IQkDYayTOIEcIWP3MVBJB2rfmvWOY5QRMzS8gmD0azECkpgl20c4MUG+jx20
         VSWzv2kw29ejf2i0p2F/sya4pK2H8PPnQaj++KKgdkv/mpK4MTRx0PuJPewy6zrmhGgr
         5LPaspmF5Mfp8WndrdWyrJH1N3iX2BdVjZwvrj2xywOLeu298HeHoh71nTJIYhKJlYRx
         BDvFgijv43zWM7cEOBihqZLxJxeIDG/faFFEa+E4av1kvOWSvmemI7y4af8jjlNWasbi
         7uJrIQzdzg2vZiVl7Mh81JUzEoW4goBd0obyA7jZSA0OGPoL0gzK+BLYDyBNKxuKG7vv
         r+yg==
X-Gm-Message-State: ABy/qLYWm+KVwb3fyELZYhwD8R8qehfBBJlRIwOBUsTHR1YWGDbmvgC5
        5eCuONMmZFIE36IO1jSmTdkkxA==
X-Google-Smtp-Source: APBJJlETnvibsCCmERXIHJK73TAkEeVSmNjnAyh0pV4MqOqRRJ6kzrri5+/drueama2aunZKEETH6Q==
X-Received: by 2002:a2e:8ece:0:b0:2b6:9ed5:bf15 with SMTP id e14-20020a2e8ece000000b002b69ed5bf15mr2332564ljl.23.1689278053181;
        Thu, 13 Jul 2023 12:54:13 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y6-20020a2e95c6000000b002b736576a10sm1096097ljh.137.2023.07.13.12.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 12:54:12 -0700 (PDT)
Message-ID: <8c55ea7b-8ad3-48bc-d1e7-83c7d1a75a2f@linaro.org>
Date:   Thu, 13 Jul 2023 22:54:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without
 revn
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230704163640.6162-1-robdclark@gmail.com>
 <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
 <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2023 17:42, Rob Clark wrote:
> On Tue, Jul 4, 2023 at 10:20 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Recently, a WARN_ON() was introduced to ensure that revn is filled before
>>> adreno_is_aXYZ is called. This however doesn't work very well when revn is
>>> 0 by design (such as for A635).
>>>
>>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index 65379e4824d9..ef1bcb6b624e 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>>>
>>>   static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return gpu->revn == revn;
>>>   }
>>> @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>>>
>>>   static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return (gpu->revn < 300);
>>
>> This is then incorrect for a635 / a690 if they have revn at 0.
> 
> Fortunately not any more broken that it has ever been.  But as long as
> sc7280/sc8280 have GPU OPP tables, you'd never hit this.  I'm working
> on a better solution for next merge window.

Sounds fine with me then.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> BR,
> -R
> 
>>>   }
>>>
>>>   static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return (gpu->revn < 210);
>>
>> And this too.
>>
>>>   }
>>> --
>>> 2.41.0
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

