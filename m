Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1452679816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 13:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbjAXM3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 07:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbjAXM3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 07:29:43 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA981BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:29:41 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qx13so38465677ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pbaALvZfGKZR89O9yJVvAw31OgYjy8eozk7I0/5t+k=;
        b=qetHalKpXD5noqFdbUmYFkwTTAYInSQDVgEL9f71EGHKPV5kOtRhFh7T9woeSt0kuX
         MFO7jey+7mZPD01/O+uHUBBfgLF7Ix6If2SQyU4g0W0te/W7AUiFyYdpCeUYvGIQJQtP
         u8ELsC+wL0+VPlrylYQBGCZ8/wVGu5fRZiNdvYSaREyZzp1mJem7uG1f+4J/2GeXz2yh
         mWVuaTgIRMsI3JnrNweYiZyekXmqZlInyhnvpryMpVEZj0rNKi3mmae15oX/Rye1Dxar
         9VmKRZ2QhW9rZIzgvsnn6dhY0Vs2okr6kFH3+DPiJcFZjIOJZkgMtLF+H8f/JJjjKKNU
         WPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pbaALvZfGKZR89O9yJVvAw31OgYjy8eozk7I0/5t+k=;
        b=WQn0LzFIxSuxyHjewVTNjFhJdBk+4auDtLykZ0ITVktSwJ2IndzyPAV2GUyanbTUaF
         ZgzJFmcceRwHXKrEIj2WszFVstR621cvXMUSq7Mf0aUFjUvpJV5YHvciRqUbWKlppfvb
         Omrd6+em/pPLC3ZIwYKFEqCJahpPkFxJ98/WcIrGaNVSx383Wd435vxGzZvojo+oS87i
         9YOHR2IJkUDmnOLqVB1CSQabNGJUedpm4yClLq2FRnT1pP+D3WfWc6hMvkf/EQMUwzSU
         a5/2dNoAHe9mswcT8QSjQewDURpcDov7PZLgHSr3iaH94DbPkicwAsNBABmSxI7gko25
         hDAQ==
X-Gm-Message-State: AFqh2kpKhZZbpAcWPnVG4O7LDPW4/9j4YphUXQAg6KnngBlGt3bbrkaD
        DMSJpBBIwU6iXrh/5KNEGPAUbA==
X-Google-Smtp-Source: AMrXdXvUG3CNd4TX0r7ANETYAlo2UXSppJlihCvO6HzRKDzCaqkLbJ649nwFoNFBWyCovFtX1sqMIw==
X-Received: by 2002:a17:906:6d9:b0:7c0:bbab:22e5 with SMTP id v25-20020a17090606d900b007c0bbab22e5mr30004351ejb.16.1674563379832;
        Tue, 24 Jan 2023 04:29:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7c908000000b00482e0c55e2bsm589583edt.93.2023.01.24.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:29:39 -0800 (PST)
Message-ID: <8cd7b10a-bc1e-76b6-89db-32d1cf09bfd9@linaro.org>
Date:   Tue, 24 Jan 2023 14:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        David Airlie <airlied@gmail.com>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
 <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
 <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
 <20230124120652.rqmaj2j4jytmvzbl@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124120652.rqmaj2j4jytmvzbl@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 14:06, Marijn Suijten wrote:
> On 2023-01-24 13:20:57, Dmitry Baryshkov wrote:
>> On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
>>>> On 24/01/2023 11:59, Marijn Suijten wrote:
>>>>> On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
>>>>>> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
>>>>>> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
>>>>>> planes). Correct corresponding SSPP declarations.
>>>>>>
>>>>>> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
>>>>>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>>>> Cc: Jami Kettunen <jami.kettunen@somainline.org>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> index 0f3da480b066..ad0c55464154 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>>>>     SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
>>>>>>             sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>>>>>>     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
>>>>>
>>>>> Drop the _CURSOR mask here?  And the double space....
>>>>
>>>> Ack for the doublespace. By removing _CURSOR we would disallow using
>>>> these planes as hw cursor planes. This would switch all compositors into
>>>> sw cursor mode, thus damaging the performance.
>>>
>>> Doesn't that require special hardware support, or can any DMA pipe
>>> support "hw cursor mode/planes", whatever that means?  Sorry for not
>>> being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
>>> have a different set of features / capabilities.
>>
>> Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
>> DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
>> used internally to tell the DRM core that the corresponding plane is
>> going to be used as a "userspace cursor" plane.
> 
> Different capabilities for userspace, but not in terms hardware (/driver
> support, yet)?  If so, then:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>>> Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
>>> to believe that it's mostly to let userspace use these DMA pipes for
>>> cursors (having cursor planes available in uapi) rather than requiring
>>> any special hardware support (though semantics do seem to change in a
>>> nontrivial way).
>>
>> Correct.
>> DRM/userspace cursor planes = planes which userspace can use to draw
>> mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
>> using them
>> DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without
> 
> But these DMA pipes are _not_ lightweight/limited?

No, they are not.

> 
>> additional features, targeting HW cursor only, not present since
>> sdm845
>> DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
>> 'DRM/userspace cursor plane'.
> 
> Ack, so it's not toggling anything hardware specific /yet/.  However,
> does this prevent userspace from using these pipes/planes for other DMA
> purposes as they're marked as a different _type_ of plane? 

This is what 'universal planes' API is solving.

Historically there were three kinds of planes: primary (iow background), 
cursor and overlay.
By default an application sees only the overlay planes and has some 
additional API to manipulate cursors and backgrounds.

Then at some point it was found that this split is not worth all the 
troubles, since applications can better utilize the hardware if they can 
decide on their own what should be done. So now we still have all three 
kinds of planes (for the legacy userspace), but behind the scenes they 
all are the same. If an application knows how to knock the door, it will 
see all the planes with the capabilities being exposed through plane 
properties, etc.

Back to our case. We mark these planes as 'cursor' ones, to let the 
legacy composers to use them for hardware cursor. I think it was decided 
that not having the cursor is worse than requiring another blending 
step. On the other hand newer composers see a full array of planes.

> And will
> that change when we do end up "implementing more rigorous/strict
> hardware support"? 

Once implemented, there will be more planes for msm8998 (and eventually 
sdm660/630, once we have them too). Some of them will be limited in size 
or in the Z order (cursor), some will not (rgb, dma, vig).

> For the other SoCs, are their DMA pipes also
> featureful and would the presence of DPU_SSPP_CURSOR severely limit its
> functionality? 

All DMA pipes have the same set of features (in the same generation of 
course).
No, it's just a software marker.

> And is this thing that "virtual planes" would be going
> to "solve"?

Included. The virtual planes is trying to solve a slightly different 
part of the story: to remove 1:1 correspondence between planes and 
pipes. Sometimes it would be nice to use two HW pipes for a single DRM 
plane (e.g. the kernel expects to have a single primary plane whose 
resolution matches the resolution of the CRTC, 4k = two SSPP because of 
hardware limitations). Sometimes a single HW pipe can be used to drive 
two DRM planes (see multirect). So, pretty much in the same way as we 
use one or two LMs to drive a CRTC, it is useful to use 1/2, 1 or 2 
SSPPs to drive a single DRM plane.

> 
> <snip>
> 
>>> As we've seen in [1] (specifically [2]) there are a few more driver/hw
>>> changes required to properly implement/support DPU_SSPP_CURSOR?
>>>
>>> [1]: https://github.com/rawoul/linux/commits/next_20220624-msm8998-hdmi
>>> [2]; https://github.com/rawoul/linux/commit/7d8d739cfbfa551120868986d5824f7b2b116ac1
> 
> Referring to changes like these ^.
> 
> - Marijn

-- 
With best wishes
Dmitry

