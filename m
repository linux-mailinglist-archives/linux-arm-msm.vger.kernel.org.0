Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86AE6B895A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 05:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjCNEOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 00:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCNEOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 00:14:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4474D23C4B
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:14:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z5so14713042ljc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678767281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rmcC0lW4v4l323FH0fqKLbWl8SaTnYsM/EAPXFHPrI=;
        b=L4OVtkapNy1OzowC7vdyT97LS3EhoOg/8uYiZuIiH+XKO4LPx15CTZXbkh2ZrhMM1g
         X7DCRxzfRL9nAB/U9g7AGPTejG/Le2o3Qi5vK1J8FBFNsFBaFGg3AvioqCQ0WcB8ZJ0L
         3zceFNqVzFyUS3hRx7cqgjKOVJO+8LXhFuefLv92PAS6KiELBJiTq9Vk736IoF65+UdF
         hGVl0k+48SaoUDybkM0mVDDYXSVnCYRberl9/wrq8Ky7eRxc2Lb33om5TPMBHox09waL
         wJSPzj0DsA1ErYNYkerwmA+cPF2AHJl+4KNs+7yh5qJsmS1F0xXUFEa/mi6903NnB3YW
         BX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678767281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rmcC0lW4v4l323FH0fqKLbWl8SaTnYsM/EAPXFHPrI=;
        b=VJbEmZkMhFVP4iuq9XYL+gnlD7XKCWU4NkaragE5segZcU54u5SoYpna2d6jKTm5/K
         /0x2QlCf/H8hW4lQVhs5Z+Xl62V+hzsY6aE8vPOSWgxxrYiwzliRMgFx1lQY6lViXX9T
         HMAPQq8vDhcUWpd93LQeRVkKfrODQJovlD4C689w+n4R6UXR+JITR+4n5ZFWAMjS89uX
         JuPRBo9rLf4cU7SxF3xUB5tyU4ayYKLAOio6jLT1hS2RNKamrM41I7rTppI+At5ujB9L
         BpwKmwNA9hY8Q92DBr9crC0AzTa8ZmuKaax/2EqpFePIWcYAHKzFFa+wJIqEsXHBTR+U
         dJKQ==
X-Gm-Message-State: AO0yUKXLOC3/YtxBwRQZgQfdB4fUCTifhoqOgEbiVau0J8Kyx9Q558qn
        o1WTw+0Rnz0bKDwoJJGhFeXQZ6LyPIYTTkZB6gA=
X-Google-Smtp-Source: AK7set/C7xh3I0WTP+0eoC8sVhPaZsWTaV1Gq3MkM7qXmAbPZYco+hjMApIxlSaMiPQGZhC5/XfKkA==
X-Received: by 2002:a2e:998c:0:b0:295:aca0:8205 with SMTP id w12-20020a2e998c000000b00295aca08205mr10477480lji.52.1678767281467;
        Mon, 13 Mar 2023 21:14:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z28-20020a05651c023c00b00295b1afd27bsm251134ljn.66.2023.03.13.21.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 21:14:41 -0700 (PDT)
Message-ID: <1045c715-9887-cf4d-9f1d-b9c764270205@linaro.org>
Date:   Tue, 14 Mar 2023 06:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 16/32] drm/msm/dpu: move the rest of plane checks to
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
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-17-dmitry.baryshkov@linaro.org>
 <f71027ed-e871-94b5-86d3-58986ae40462@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f71027ed-e871-94b5-86d3-58986ae40462@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 06:02, Abhinav Kumar wrote:
> 
> 
> On 3/9/2023 4:56 PM, Dmitry Baryshkov wrote:
>> Move plane state updates from dpu_crtc_atomic_check() to the function
>> where they belong: to dpu_plane_atomic_check().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Can you please elaborate a bit on this comment?
> 
> https://patchwork.freedesktop.org/patch/521356/?series=99909&rev=4#comment_949772
> 
> Is something still missing? I dont see the multirects being cleared in 
> dpu_plane_atomic_disable() before or even now.

It is done in the last patch, where it belongs. There is no need to 
clear multirect setup until we support RECT_1.

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>>   3 files changed, 11 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0260c4d6ded7..bd09bb319a58 100644
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
>> -                  dpu_kms->catalog->caps->max_mixer_blendstages - 
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
>> index ce01a602cbc9..3fba63fbbd78 100644
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
>> +    pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>> +    if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>> +        DPU_ERROR("> %d plane stages assigned\n",
>> +              pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
>> +        return -EINVAL;
>> +    }
>> +
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

