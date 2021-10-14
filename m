Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382A542DACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 15:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhJNNwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 09:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhJNNwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 09:52:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0316DC061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:50:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g36so10489402lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FeldPiWn9ag7Oy8X667duUFU5654P/5o0/76FcM7dDw=;
        b=TdQk31R/CfKlW3MjylkHbKcYtCElhjZRFiJ+0fc5ktCnXv/FZPEcV6SV+JN2K78cWc
         lJFk5GvJOK2mL88Um0b3o8nSOQ9t+NUcailOc6EK1lStK+t3RhgMxLD3dD9+czJ664LT
         jn/OD+KgEjbD/jWpFb9v2zFnoMNPYwQeJz5X6WeozK559XJqM3FTWssTpMCQUjuYJX11
         InQ6LEt9sHuLuVP67UpHcXSUwJg4rQ+Z0htdsSuVSPlUwbdjJ+gKMu45MSc6b4ze2Gb1
         ttcCWCCuO+cH4qU0aGyX0LbSTLtHGhzhd6CgZdGMsRsetubuqjCY0wu/433ErJrJniWu
         KC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FeldPiWn9ag7Oy8X667duUFU5654P/5o0/76FcM7dDw=;
        b=Z7Kaw3EdYKLCeAzTEta4DBD0F9F5YDV/s6z5mq6Fp6elfreI5SO/Nz2Qn9lzaXHf6s
         quIGQW2+EdOFkzvEez84xDM55i46dsBaW99nKToeetoOZvMBWIfElXFZmbISiZIMRKaU
         3n2NY7wBJb8aoWUJZUWJnlkHOGxpdTww9mFa9Ns74h+xLIUpoA4WIGMM3Hr1bvksUhQo
         94kEB1eSN0m1jHZGmiRZ6cYme6rVyF+61jLoU1ZQjJXbQ+TZgFl7fb0Vxg2IzktvW6VU
         vU+XD20QIqQS/amSNkqvOsP6rD043RnQl8N1FzPZ+Wh+Sqggp5gEyQqheCGfYt8lvwnQ
         M26g==
X-Gm-Message-State: AOAM533wZCUPypdD3fXrj4SQ2TT///zC26DMzw5jSl+95TLIENTSobNO
        QqR7cqLHuGmT4i/mGFlID6emhA==
X-Google-Smtp-Source: ABdhPJz5acG0GgG3+00Xw4ApUtyake79G7jTdzqYaiPQzIZglPh4q5pDmu5nJWi8EHqxIdEWn0uHBg==
X-Received: by 2002:a2e:7012:: with SMTP id l18mr5952471ljc.426.1634219432354;
        Thu, 14 Oct 2021 06:50:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q17sm230771lfp.225.2021.10.14.06.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 06:50:31 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
Message-ID: <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org>
Date:   Thu, 14 Oct 2021 16:50:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2021 16:41, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:
>> We cannot enable mode_3d when we are using the DSC. So pass
>> configuration to detect DSC is enabled and not enable mode_3d
>> when we are using DSC
>>
>> We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
>> enabled and pass this to .setup_intf_cfg()
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>> Changes since
>> v1:
>>   - Move this patch from 7 to 6
>>   - Update the changelog
>>   - Make dsc as int and store the DSC indices
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>>   4 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index e7270eb6b84b..fca07ed03317 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode 
>> dpu_encoder_helper_get_3d_blend_mode(
>>       return BLEND_3D_NONE;
>>   }
>> +static inline bool dpu_encoder_helper_get_dsc_mode(struct 
>> dpu_encoder_phys *phys_enc)
>> +{
>> +    struct drm_encoder *drm_enc = phys_enc->parent;
>> +    struct msm_drm_private *priv = drm_enc->dev->dev_private;
>> +
>> +    if (priv->dsc)
>> +        return BIT(0) | BIT(1); /* Hardcoding for 2 DSC topology */
> 
> Please use defined values here rater than just BIT().

Ah, it's a list of DSC blocks used. So the function name is misleading 
(as it's not a mode). I think we'd better pass DSC_n names here. What 
about using an array for cfg->dsc?

> 
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * dpu_encoder_helper_split_config - split display configuration 
>> helper function
>>    *    This helper function may be used by physical encoders to 
>> configure
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index aa01698d6b25..8e5c0911734c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>       intf_cfg.stream_sel = cmd_enc->stream_sel;
>>       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>> +    intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
>> +
>>       ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index 64740ddb983e..3c79bd9c2fe5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -118,7 +118,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct 
>> dpu_hw_ctl *ctx)
>>       return ctx->pending_flush_mask;
>>   }
>> -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>> +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>   {
>>       if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>> @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
>> *ctx,
>>       intf_cfg |= (cfg->intf & 0xF) << 4;
>> -    if (cfg->mode_3d) {
>> +    /* In DSC we can't set merge, so check for dsc too */
>> +    if (cfg->mode_3d && !cfg->dsc) {
> 
> The more I think about this hunk, the more I'm unsure about it.
> Downstream has the following topoligies defined:
>   * @SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC: 2 LM, 2 PP, 3DMux, 1 DSC, 1 
> INTF/WB
>   * @SDE_RM_TOPOLOGY_QUADPIPE_3DMERGE_DSC  4 LM, 4 PP, 3DMux, 3 DSC, 2 INTF
> 
> While the latter is not supported on sdm845, the former one should be 
> (by the hardware). So in the driver I think we should make sure that 
> mode_3d does not get set rather than disallowing it here.
> 
>>           intf_cfg |= BIT(19);
>>           intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 806c171e5df2..5dfac5994bd4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>>    * @mode_3d:               3d mux configuration
>>    * @merge_3d:              3d merge block used
>>    * @intf_mode_sel:         Interface mode, cmd / vid
>> + * @dsc:                   DSC BIT masks
>>    * @stream_sel:            Stream selection for multi-stream interfaces
>>    */
>>   struct dpu_hw_intf_cfg {
>> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>>       enum dpu_3d_blend_mode mode_3d;
>>       enum dpu_merge_3d merge_3d;
>>       enum dpu_ctl_mode_sel intf_mode_sel;
>> +    unsigned int dsc;

I think this should be:
enum dpu_dsc dsc[MAX_DSCS];
unsigned int num_dsc;

>>       int stream_sel;
>>   };
>>
> 
> 


-- 
With best wishes
Dmitry
