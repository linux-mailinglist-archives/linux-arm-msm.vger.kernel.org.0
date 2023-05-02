Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3F96F4688
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 16:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbjEBO7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 10:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjEBO7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 10:59:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FE32121
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 07:59:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso4608823e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039563; x=1685631563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYIPK0RyXV420ws+bFuhXON4Dwa7YsOqBbgK0Ucm394=;
        b=wqg09eyhhyGAtq2A6lcOW6KVIsz4uc+pQp+byl28tDjqTfhjLDEzD2DvcohSmnUUlF
         iDF9iZFqw2ToV6I0t9isJ28wKjAlORuF29IRkJ8EMJCyyYy7TGR6uRLR2CT8Jlpxgw39
         ZKLVWUtiKKC8uOOTs1C8s736+vzZRhq5z01cwo2FsFGiPaNRdcIS52yLeNK2NDFzzGrA
         WyjYuQj1zVqd8SAd5Mp15P1qoPuJrTJ03d9q/ZyhpvYzqhvI7jdVE805B8wAGSjH+RqX
         7FPDpvBAdhweonDwFuuLTyryGucuW1v8ByH/RDzA6juDfGAFh1b9Mq3urd3iHoamGTpr
         5oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039563; x=1685631563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYIPK0RyXV420ws+bFuhXON4Dwa7YsOqBbgK0Ucm394=;
        b=R77bFx6CLBGne7EVshIUcNEzOxK32Iy5Uqvn3FrKB+Z/WUrjhc9YYDRAt4BnPO6Ear
         R6WSmLi2Hf+uX3HM7Joe2G/pqBeU7f9hUR0nL1F8gzgT0/8fzxilyuN0SJjxHV2xa8dN
         L5fVaIoNAZV2VH1IBV+4FEhqVKIfusrcLWdeuvd/ICVDNLSzHOpLmG4wpvXxxMN90MNr
         1SUUrjHFn4Dp65kfPHLhKqL2WDEUFxjShVZ9WLKDEqklaN7BJgn0UK3tuZ/mSXtitw17
         FB89YRuXHLeXNeZUirlP67MEhVoJn0vUckpyWclek6odOHNmcJb0UhA1qVDgwvMxpUuX
         coDg==
X-Gm-Message-State: AC+VfDzeip8AxtRoqIv8mHs4KcPBZQnyRBtkLbw7/nh/asN3VU21Uf++
        apv6kyO0R/RRtXSQiEcfX5AM8g==
X-Google-Smtp-Source: ACHHUZ6FOPEkhUy45YwRLKoQ4LYu/pNPWGvvuBDo0//1zzEqJWAqBykvX45Pe3drLSHYQRCf20yteg==
X-Received: by 2002:a05:6512:3750:b0:4ed:bf01:3ff3 with SMTP id a16-20020a056512375000b004edbf013ff3mr64497lfs.43.1683039563585;
        Tue, 02 May 2023 07:59:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f20-20020a19ae14000000b004d85316f2d6sm5412416lfc.118.2023.05.02.07.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 07:59:23 -0700 (PDT)
Message-ID: <a8c21d66-15dd-8049-7a31-e0604d17782b@linaro.org>
Date:   Tue, 2 May 2023 17:59:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 3/9] drm/msm/dpu: fix the condition for (not)
 applying QoS to CURSOR SSPP
Content-Language: en-GB
To:     Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
 <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
 <f108e588-6671-ad4e-35b3-7771efab97ce@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f108e588-6671-ad4e-35b3-7771efab97ce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 03:56, Jeykumar Sankaran wrote:
> 
> 
> On 4/30/2023 1:57 PM, Dmitry Baryshkov wrote:
>> The function dpu_plane_sspp_update_pipe() contains code to skip enabling
>> the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
>> repurpose DMA SSPP for the cursor planes because they lack the real
>> CURSOR SSPP. Fix the condition to actually check that the plane is
>> CURSOR or not.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 43d9fbc0c687..36f6eb71fef8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1124,7 +1124,8 @@ static void dpu_plane_sspp_update_pipe(struct 
>> drm_plane *plane,
>>       _dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>>       _dpu_plane_set_danger_lut(plane, pipe, fmt);
>> -    if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>> +    if (pipe->sspp->idx == SSPP_CURSOR0 ||
>> +        pipe->sspp->idx == SSPP_CURSOR1) {
> Isn't this differ from the current sequence: The existing sequence 
> programs QOS for all the non-cursor SSPP's. This patch programs QOS only 
> for CURSOR SSPP's.

Thanks for the catch! I was thinking about inverting the condition and 
ended up overengineering it.

> 
> If DMA SSPP's are used for cursor planes, we should ideally remove this 
> check.

Unfortunately, we also support 8998 (and patches to use CURSOR SSPP were 
posted to the mailing list). The plan is to also support some of 1.x 
MDP5/DPU units (e.g. 8996), which would also make use of origin CURSOR 
planes. So we can not drop this. I'll post v2 fixing the issue.

> 
> Jeykumar S.
>>           _dpu_plane_set_qos_ctrl(plane, pipe, true, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>>           _dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
>>       }

-- 
With best wishes
Dmitry

