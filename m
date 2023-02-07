Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BBB68CB1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 01:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjBGA1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 19:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBGA1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 19:27:47 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42031F913
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 16:27:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so39155679ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 16:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNN/yEucdvE9qtFJOD7m0WYAz5jGvOE/q6P52/59zOs=;
        b=ilNiR/gTEqo8ajK27YvjnIc8UBezZoLFKGw4FFedFXUmcDGU0uty+M6pHe1eiRzmno
         PvRJddYdX1YpslFW1NUd83rygTu4tKP7+aTSOzU/6+5LkCv4f3kF3PF9918nOTl+Q9zl
         70mvGmdnuGfZwyXCuEiPEcDmXeSOZFy9qHVzyAPks9WHUlO8BTwflQl3SgIZqVZnUKVl
         aek/mnaSO8WcbnuMY++pHMpnaILPCPvHlm1OGZ4lLhNN0kcrARW2/9O0vsACUsAOYfhh
         WjaQ/QKUCrgVY+Awfc3YgOxqqZSpMZKRHeNvbEkJ0KPa9dPHszNRf1thmaWBXtERAge6
         /anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNN/yEucdvE9qtFJOD7m0WYAz5jGvOE/q6P52/59zOs=;
        b=KYpeGsqr5/Ax+90LcaBrmh1qrRZkIs1V5dmkM0AWe+6k1s+pogEngTtInxecGhQlSF
         oorTRsdZ5WlXMYV+N+Zz9I4rFYZQ3++63e8Xl1rtSk3+kKeqcsmYnkwtzAJQgN63a0SJ
         LHtdWrQZejxubgSAVCW1ja+az98iG+gk/Nb3qO4XJOOEW5yg0vWehq6jMWHUmfJ/lupZ
         QVtWJG3EzkWrIHzMWutKqyTx0z8qEk3hSs2XFwAnMGxKf79yLGhA8Wla3lmPU39iMPtH
         184Xs4vcYhzYXCwYtpfLqkqtEmNBVod3bzl+QFmhKHxlfDl8LojlH2pyw78sU03AbLvg
         jcnQ==
X-Gm-Message-State: AO0yUKWoUgDGSCsNxGQao9Mk+eZfCRpjgW1N3rGgpeYmbksecsbhCZKC
        RW1rtOjROLpNmf2gTXwOpLnhpQ==
X-Google-Smtp-Source: AK7set+aLIxNJfR9zQNOF4rhNxXJeKjzPSyFQbAvQSWaAeqCQoLvIpVIA2q7VctyMoDt5qwdLLMdmQ==
X-Received: by 2002:a17:906:40d3:b0:88f:895f:1ba4 with SMTP id a19-20020a17090640d300b0088f895f1ba4mr1428398ejk.57.1675729664242;
        Mon, 06 Feb 2023 16:27:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kb18-20020a1709070f9200b0088ef3c38a52sm6211460ejc.19.2023.02.06.16.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 16:27:43 -0800 (PST)
Message-ID: <d55bb351-bf0d-e8ae-8473-3903ad9419c0@linaro.org>
Date:   Tue, 7 Feb 2023 02:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 21/27] drm/msm/dpu: simplify dpu_plane_validate_src()
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
 <20230203182132.1307834-22-dmitry.baryshkov@linaro.org>
 <502f2c4b-193d-07ca-3b73-8fe7a608e736@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <502f2c4b-193d-07ca-3b73-8fe7a608e736@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 00:40, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Since the driver uses clipped src coordinates, there is no need to check
>> against the fb coordinates. Remove corresponding checks and inline
>> dpu_plane_validate_src().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Can you please explain how the clipping in 
> drm_atomic_helper_check_plane_state() can allow us to remove checking 
> the fb co-ordinates?
> 
> The clipping is done using the mode parameters.
> 
> So lets say the FB being used is smaller than the source buffer by an 
> incorrect usermode setting.
> 
> Then the src sspp shall try to fetch the full image of src rectangle 
> size from a FB which isnt that big leading to a fault.

This case is checked by the drm_atomic_plane_check().

> 
> How does the clipping avoid such a case?

clipping itself does not. However using clipped coordinates from 
plane_state->src ensures that they already were validated against the FB 
dimensions. I'll see if I can change the commit message to make it more 
obvious.

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
>>   1 file changed, 10 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index ecf5402ab61a..0986e740b978 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -894,25 +894,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane 
>> *plane,
>>                   old_pstate->needs_dirtyfb);
>>   }
>> -static bool dpu_plane_validate_src(struct drm_rect *src,
>> -                   struct drm_rect *fb_rect,
>> -                   uint32_t min_src_size)
>> -{
>> -    /* Ensure fb size is supported */
>> -    if (drm_rect_width(fb_rect) > MAX_IMG_WIDTH ||
>> -        drm_rect_height(fb_rect) > MAX_IMG_HEIGHT)
>> -        return false;
>> -
>> -    /* Ensure src rect is above the minimum size */
>> -    if (drm_rect_width(src) < min_src_size ||
>> -        drm_rect_height(src) < min_src_size)
>> -        return false;
>> -
>> -    /* Ensure src is fully encapsulated in fb */
>> -    return drm_rect_intersect(fb_rect, src) &&
>> -        drm_rect_equals(fb_rect, src);
>> -}
>> -
>>   static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>>                           const struct dpu_sspp_sub_blks *sblk,
>>                           struct drm_rect src, const struct dpu_format 
>> *fmt)
>> @@ -998,6 +979,14 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       fb_rect.x2 = new_plane_state->fb->width;
>>       fb_rect.y2 = new_plane_state->fb->height;
>> +    /* Ensure fb size is supported */
>> +    if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
>> +        drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&fb_rect));
>> +        return -E2BIG;
>> +    }
>> +
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>>       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> @@ -1012,7 +1001,8 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           return -EINVAL;
>>       /* check src bounds */
>> -    } else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, 
>> min_src_size)) {
>> +    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>                   DRM_RECT_ARG(&pipe_cfg->src_rect));
>>           return -E2BIG;

-- 
With best wishes
Dmitry

