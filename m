Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8AD68A660
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 23:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjBCWzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 17:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbjBCWzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 17:55:52 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645167E6F9
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 14:55:47 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id dr8so19327521ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 14:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4nzD47GbZriHQX9YpnSnHEHeYL8boOcj4qhgeAkumk=;
        b=q9qkkaOLQStN2FLJoJ+UB5X0JfGJ0irbBesMfXEfigAMzFPrsLCBU7vnL/w8+fe56Q
         Vb3YKDgolKeyzW+fWxV83U8hBOMQdOPMCtJUdxKzn/os3u5+UuXh8CeDkUuofLKdfnkG
         N/ab4ct89kBES2VjNm3RfHYflPXhUJgo5R2u5qcFyL+XEwlbiT5yVE732/NROGae0CtU
         d29mBrsK5dPrdyQkR4Y4+tHSU7rRYDueT3Jul5g8YvYgtaWdcAx5xa3V60WIphGfyuN6
         o1i2EH6vwMVGLcJi3nQNrSkGd0zFY8fVKB0JJy4WdV66pxoo8Bad/M3LefmA2asH5RoG
         k+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4nzD47GbZriHQX9YpnSnHEHeYL8boOcj4qhgeAkumk=;
        b=TFOgeDgTk3PyyXTId8UJUOmA+wzd3takySfAN3Jk9l4QOcv21PbERplHpSQCNa/+E0
         XbamiyeUbb9y+MZs5GaixCatSBEf1Y9sLN1QO24tLhgI9mxus3Ooj8YAXadgs+LN0lEM
         uNBV6R5udZoveeMtftfX8cSMquOgut9M7PVaOGYLK6h43/xeK9yw+OGaLQhf3EVaAoC+
         Tj0UWWMYsfsHGNc1t7W009e+O7Al1ngBSTN7TSWIn+kfGrhGBG3pru8tW2TKmXkTDLg4
         BJoyeGv+5TotEpNJpx3q8qKM19Qz7o6oU1zomGlx3s2TNwBbiIOM8Gy3ydsSSSDpD2HR
         unNw==
X-Gm-Message-State: AO0yUKXR6VKOGQyrmpftdv8TaGl6ChlUXw/9pVJEqVaTIXIerJvU713C
        lMK2VetTqC+gTt4wT751YUQGoI9tH3oouC51
X-Google-Smtp-Source: AK7set8EBxTRydkn1ims9Qq+YLJLP3KrWExhrjFOXjGWJnISWezDAOOrWPxBvK2KqRksh+aiWQgsJg==
X-Received: by 2002:a17:907:2ce4:b0:888:6294:a1fa with SMTP id hz4-20020a1709072ce400b008886294a1famr14831438ejc.14.1675464945807;
        Fri, 03 Feb 2023 14:55:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ac5-20020a170907344500b0088f92a2639fsm1718231ejc.17.2023.02.03.14.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 14:55:45 -0800 (PST)
Message-ID: <269a9f0e-b9c2-427d-acc0-e18262c0c4ff@linaro.org>
Date:   Sat, 4 Feb 2023 00:55:44 +0200
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <121827e3-3ec4-c0fd-d3fb-771150e79717@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/02/2023 00:44, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Move plane state updates from dpu_crtc_atomic_check() to the function
>> where they belong: to dpu_plane_atomic_check().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>>   3 files changed, 11 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index b485234eefb2..bd09bb319a58 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
>> *crtc,
>>                                         crtc);
>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>> -    struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>       const struct drm_plane_state *pstate;
>>       struct drm_plane *plane;
>> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>       crtc_rect.x2 = mode->hdisplay;
>>       crtc_rect.y2 = mode->vdisplay;
>> -     /* get plane state for all drm planes associated with crtc state */
>> +    /* FIXME: move this to dpu_plane_atomic_check? */
>>       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, 
>> crtc_state) {
>>           struct dpu_plane_state *dpu_pstate = 
>> to_dpu_plane_state(pstate);
>>           struct drm_rect dst, clip = crtc_rect;
>> -        int stage;
>>           if (IS_ERR_OR_NULL(pstate)) {
>>               rc = PTR_ERR(pstate);
>> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
>> *crtc,
>>           dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>> -        dpu_plane_clear_multirect(pstate);
>> -
>>           dst = drm_plane_state_dest(pstate);
>>           if (!drm_rect_intersect(&clip, &dst)) {
>>               DPU_ERROR("invalid vertical/horizontal destination\n");
>> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>                     DRM_RECT_ARG(&dst));
>>               return -E2BIG;
>>           }
>> -
>> -        /* verify stage setting before using it */
>> -        stage = DPU_STAGE_0 + pstate->normalized_zpos;
>> -        if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
>> -            DPU_ERROR("> %d plane stages assigned\n",
>> -                    dpu_kms->catalog->caps->max_mixer_blendstages - 
>> DPU_STAGE_0);
>> -            return -EINVAL;
>> -        }
>> -
>> -        to_dpu_plane_state(pstate)->stage = stage;
>> -        DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
>> -
>>       }
>>       atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 1b3033b15bfa..5aabf9694a53 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane 
>> *pdpu,
>>       return 0;
>>   }
>> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
>> -{
>> -    struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
>> -
>> -    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>> -    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> -}
>> -
>>   int dpu_plane_validate_multirect_v2(struct 
>> dpu_multirect_plane_states *plane)
>>   {
>>       struct dpu_plane_state *pstate[R_MAX];
>> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       if (!new_plane_state->visible)
>>           return 0;
>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +
> 
> But I am not sure if clearing the multirect belongs here and now I want 
> to clarify one thing about 
> https://patchwork.freedesktop.org/patch/521354/?series=99909&rev=4 which 
> was R-bed in the v1 and carried fwd since then.
> 
> So prior to that change, we were only clearing the multirects of the 
> planes that were staged to the crtc and we were getting those from the 
> crtc state. But now we are clearing the multirect of all the planes.
> 
> Dont we have to keep that in the crtc_atomic_check() since we do that on 
> all the planes attached to a certain CRTC.
> 
> In that case shouldnt we keep this in the crtc_atomic_check() and bring 
> back pipe_staged[] without the multirect and source split cases ofcourse.

What for? In other words, what would be the difference?

> 
>> +    pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>> +    if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>> +        DPU_ERROR("> %d plane stages assigned\n",
>> +                pdpu->catalog->caps->max_mixer_blendstages - 
>> DPU_STAGE_0);
>> +        return -EINVAL;
>> +    }
>> +
> 
> I agree that this check belongs to the plane_atomic_check().
> 
>>       src.x1 = new_plane_state->src_x >> 16;
>>       src.y1 = new_plane_state->src_y >> 16;
>>       src.x2 = src.x1 + (new_plane_state->src_w >> 16);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> index 228db401e905..a08b0539513b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device 
>> *dev,
>>    */
>>   int dpu_plane_validate_multirect_v2(struct 
>> dpu_multirect_plane_states *plane);
>> -/**
>> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
>> - * @drm_state: Pointer to DRM plane state
>> - */
>> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
>> -
>>   /**
>>    * dpu_plane_color_fill - enables color fill on plane
>>    * @plane:  Pointer to DRM plane object

-- 
With best wishes
Dmitry

