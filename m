Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6EA697278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 01:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjBOAIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 19:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbjBOAIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 19:08:18 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75766301A9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 16:08:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so42112903ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 16:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuPcN5FwXg0hpu1WLElrLMDIH5eQaQD3QTDGZs1+Gfo=;
        b=xZsd1GGbDJKU23hoQNoo5/KnBD+QrriUjk8RXwmIvueAgjS4OZRNNIzSAsgM4Chcaj
         7SCInCKLnhq813pyMQB+yejkwrlqR/ID6+bPkwUQh8bPgPI8dgf5nQcZMiEvB3rGmSe1
         XDG/Yy9OL5omWLckqo3cC4LRBNrbyd2Zn/yB5TN5hx/3+OpeJfRHVmkygERnr6ua0C6L
         UkIr+crQiS6JBoil+ONeAnCL3IzfQNwuGUtT7m8AkSHF29+KyCtQipR7JXaZ2ueDuLUS
         IJaF2BdNtkfUzk7e0fm59UoM7ffrGb9CfUCozdqtAdYlnuHoOgRjSP98NAr8zwk/EjEQ
         3vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuPcN5FwXg0hpu1WLElrLMDIH5eQaQD3QTDGZs1+Gfo=;
        b=4nh7CdL3KKDfU52dxyb5AtiUb355gArHIp8iVgTlOCopO6zA0oBc86sxSlGWtixqvV
         4G/VuPGNU2YJKV26hTrIK66wNRGBa9jEDReEBjo/9++Aotva5nk0stzBb68BkPcSQDL6
         oxoCDfWx0HeVvIidw3mzjkOy9O6Q8ADqQPn3gF3qiAojtsLSJXLnAIelbFwCSmBKBxWq
         F2b/9XryPzum9finiRDjICYTuioMkNGwQ3sl+A7lxY+0QljawiixZcmdkJRBYr9UDUJ5
         oEWcXXcfab8qKqiCOl1sgFPnCYALXufEBNKioe/nN6UxvwEc5awB3FC+QKdOzzTHkPnz
         B9qA==
X-Gm-Message-State: AO0yUKXebZrPlDPS/+bGGblIZSbPHJB6VAX/4oQCgNS/ZYTrUSANsupZ
        pCr0T94vg5qL82acTiUZfhO4nV8cv+OpjeUm
X-Google-Smtp-Source: AK7set8gdvwZv+eCjxaskjM3bEKYVNba7TYOteutiE0gvwUynOYG8czn8OHIPPrKDTe05lQBE9ZfXg==
X-Received: by 2002:a17:906:7e12:b0:88e:e6ee:feab with SMTP id e18-20020a1709067e1200b0088ee6eefeabmr295468ejr.62.1676419694802;
        Tue, 14 Feb 2023 16:08:14 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fn17-20020a1709069d1100b00880dbd4b6d7sm9018083ejc.170.2023.02.14.16.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 16:08:14 -0800 (PST)
Message-ID: <005030a5-bcc3-14ea-121f-fba794555626@linaro.org>
Date:   Wed, 15 Feb 2023 02:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 15/27] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-16-dmitry.baryshkov@linaro.org>
 <121827e3-3ec4-c0fd-d3fb-771150e79717@quicinc.com>
 <269a9f0e-b9c2-427d-acc0-e18262c0c4ff@linaro.org>
 <fb94f386-22af-c2c6-9071-8dcbe8c547c1@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fb94f386-22af-c2c6-9071-8dcbe8c547c1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/02/2023 01:25, Abhinav Kumar wrote:
> Hi Dmitry
> 
> Sorry for the late response on this one.
> 
> On 2/3/2023 2:55 PM, Dmitry Baryshkov wrote:
>> On 04/02/2023 00:44, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>> Move plane state updates from dpu_crtc_atomic_check() to the function
>>>> where they belong: to dpu_plane_atomic_check().
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>>>>   3 files changed, 11 insertions(+), 31 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index b485234eefb2..bd09bb319a58 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>                                         crtc);
>>>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>>>> -    struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>>>       const struct drm_plane_state *pstate;
>>>>       struct drm_plane *plane;
>>>> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>       crtc_rect.x2 = mode->hdisplay;
>>>>       crtc_rect.y2 = mode->vdisplay;
>>>> -     /* get plane state for all drm planes associated with crtc 
>>>> state */
>>>> +    /* FIXME: move this to dpu_plane_atomic_check? */
>>>>       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, 
>>>> crtc_state) {
>>>>           struct dpu_plane_state *dpu_pstate = 
>>>> to_dpu_plane_state(pstate);
>>>>           struct drm_rect dst, clip = crtc_rect;
>>>> -        int stage;
>>>>           if (IS_ERR_OR_NULL(pstate)) {
>>>>               rc = PTR_ERR(pstate);
>>>> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>           dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>>>> -        dpu_plane_clear_multirect(pstate);
>>>> -
>>>>           dst = drm_plane_state_dest(pstate);
>>>>           if (!drm_rect_intersect(&clip, &dst)) {
>>>>               DPU_ERROR("invalid vertical/horizontal destination\n");
>>>> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>                     DRM_RECT_ARG(&dst));
>>>>               return -E2BIG;
>>>>           }
>>>> -
>>>> -        /* verify stage setting before using it */
>>>> -        stage = DPU_STAGE_0 + pstate->normalized_zpos;
>>>> -        if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
>>>> -            DPU_ERROR("> %d plane stages assigned\n",
>>>> -                    dpu_kms->catalog->caps->max_mixer_blendstages - 
>>>> DPU_STAGE_0);
>>>> -            return -EINVAL;
>>>> -        }
>>>> -
>>>> -        to_dpu_plane_state(pstate)->stage = stage;
>>>> -        DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
>>>> -
>>>>       }
>>>>       atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> index 1b3033b15bfa..5aabf9694a53 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct 
>>>> dpu_plane *pdpu,
>>>>       return 0;
>>>>   }
>>>> -void dpu_plane_clear_multirect(const struct drm_plane_state 
>>>> *drm_state)
>>>> -{
>>>> -    struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
>>>> -
>>>> -    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>> -    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>> -}
>>>> -
>>>>   int dpu_plane_validate_multirect_v2(struct 
>>>> dpu_multirect_plane_states *plane)
>>>>   {
>>>>       struct dpu_plane_state *pstate[R_MAX];
>>>> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct 
>>>> drm_plane *plane,
>>>>       if (!new_plane_state->visible)
>>>>           return 0;
>>>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>> +
>>>
>>> But I am not sure if clearing the multirect belongs here and now I 
>>> want to clarify one thing about 
>>> https://patchwork.freedesktop.org/patch/521354/?series=99909&rev=4 
>>> which was R-bed in the v1 and carried fwd since then.
>>>
>>> So prior to that change, we were only clearing the multirects of the 
>>> planes that were staged to the crtc and we were getting those from 
>>> the crtc state. But now we are clearing the multirect of all the planes.
>>>
>>> Dont we have to keep that in the crtc_atomic_check() since we do that 
>>> on all the planes attached to a certain CRTC.
>>>
>>> In that case shouldnt we keep this in the crtc_atomic_check() and 
>>> bring back pipe_staged[] without the multirect and source split cases 
>>> ofcourse.
>>
>> What for? In other words, what would be the difference?
>>
> 
> So, please correct my understanding here. drm_plane's atomic_check() 
> will be called for all the planes which are getting updated in this 
> atomic commit using for_each_oldnew_plane_in_state() and drm_crtc's 
> atomic_check() will be called for all the CRTC's in this atomic update 
> using for_each_new_crtc_in_state() >
> If the plane is not connected to any CRTC, why do we need to clear the 
> multirect pstates.

If the plane is not connected to any CRTC, then we just don't care what 
is there in the multirect state, so we might clear it as well.

> 
> OR in that case would atomic_commit not even be called if the plane is 
> not connected to any CRTC?
> 
> One case i can think of is the disable commit where the no planes will 
> be connected to the CRTC so in that case, before this change we would 
> explicitly clear out all the planes connected to the CRTC but now with 
> this change is there a possibility that only if the plane state changed 
> we would clear it out?

Ah. Maybe I understand your point. I think 
drm_atomic_add_affected_planes() will ensure that all planes attached to 
CRTCs are also a part of the atomic state.

Regarding the change itself. Think about encapsulation. CRTC should not 
care about plane's multirect state. It is a plane implementation detail. 
As we delve upon a path of using rect1 and then even using different 
SSPPs for the plane, these implementation details will change (mostly) 
behind CRTC's back.

> 
> 
>>>
>>>> +    pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>>> +    if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>>>> +        DPU_ERROR("> %d plane stages assigned\n",
>>>> +                pdpu->catalog->caps->max_mixer_blendstages - 
>>>> DPU_STAGE_0);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>
>>> I agree that this check belongs to the plane_atomic_check().
>>>
>>>>       src.x1 = new_plane_state->src_x >> 16;
>>>>       src.y1 = new_plane_state->src_y >> 16;
>>>>       src.x2 = src.x1 + (new_plane_state->src_w >> 16);
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>> index 228db401e905..a08b0539513b 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct 
>>>> drm_device *dev,
>>>>    */
>>>>   int dpu_plane_validate_multirect_v2(struct 
>>>> dpu_multirect_plane_states *plane);
>>>> -/**
>>>> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
>>>> - * @drm_state: Pointer to DRM plane state
>>>> - */
>>>> -void dpu_plane_clear_multirect(const struct drm_plane_state 
>>>> *drm_state);
>>>> -
>>>>   /**
>>>>    * dpu_plane_color_fill - enables color fill on plane
>>>>    * @plane:  Pointer to DRM plane object
>>

-- 
With best wishes
Dmitry

