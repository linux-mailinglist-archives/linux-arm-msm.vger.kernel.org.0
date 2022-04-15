Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9802E501FAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244628AbiDOAis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 20:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240902AbiDOAiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 20:38:46 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781783BBF8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:36:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id n17so3051167ljc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U4RBrE8oX9dRUFdzAWTuu14SjesLXiVCV12YN/o0AAA=;
        b=Xj7rNJzsE0KusVX2+MsLKG3vXBtAiqQZ2Yln/y2OpqDcwPWpwqGSuDny0KKYiieodV
         1MaNOMZzT7YpsFUxCKGinuPSlHlbxB5Lv0mPb7EcacS5FcNy87sicl2wcDAb+98nCTn5
         M9MgSQYeN0U7L/yJEK4m5gEeT6704oIRPOizR+VvGBTPlfeh1q3NwW5IjskeRrR8tvCV
         mUwgb1iMwmgmF2A+uELgMPUN4uPGekKhHxVy5S8ejmxJDCkLHeKBFg93OOgezB2SmFmm
         yC7UTUtC5MUkBgBv7t2Pd5ok49OKntqr4L+kWK/gbI7BR4XprOrcxVA9lZVZMyKIHRdm
         ACNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U4RBrE8oX9dRUFdzAWTuu14SjesLXiVCV12YN/o0AAA=;
        b=B65LLaqvS92Mh1Cuw4peL3APEy2k6I6AchahBf3W3dPicF6UsaVT90QvRzILYT83yA
         ReM6PpYCTWgyTFPXJbmG19JCvOXF7MQQePNazPMDkX1TgZT9A0ClZ2B5zhYN6e09c/YK
         dq/448+eceJr2oG0yrNmNrCCgDCL6gSOgx6E3fu2oN3kyUTZvRyj+fyNGvnpsl8BnX3Y
         3pE1ZfOISelDa3IDAiMNIs8FhEbY+Yj2OpXGEEv8X3JHM3rQxzimQoOPJFn0qXdHnGo/
         caKA9A5f8Cvkv/315994QzSRM/xDD8lbys1WsMvisd1AaKQyrHsYOj4hWn2/gI5zhzWk
         cT5Q==
X-Gm-Message-State: AOAM531jdh31sQTnRqtjWeVfyIL581M6sa2J5E0tatGGKoNxls1ashVy
        QukT86Ddxu0JpxnMnf4Nh5PGQg==
X-Google-Smtp-Source: ABdhPJz3kbibX4cIOrwdjdQ5usmcGj4+70lk1HCoAardp+0pGL5RPrWUrtz8NURbPH7lvO3Tijucfg==
X-Received: by 2002:a05:651c:158e:b0:248:1ce:a2a with SMTP id h14-20020a05651c158e00b0024801ce0a2amr2879474ljq.172.1649982977712;
        Thu, 14 Apr 2022 17:36:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h14-20020a05651c158e00b00247fda7844dsm133087ljq.90.2022.04.14.17.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 17:36:17 -0700 (PDT)
Message-ID: <62e5b7c9-21cb-74ec-2b5f-5d85538a95c3@linaro.org>
Date:   Fri, 15 Apr 2022 03:36:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/12] drm/msm/dpu: gracefully handle null fb commits for
 writeback
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, daniel@ffwll.ch,
        markyacoub@chromium.org, quic_jesszhan@quicinc.com
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-12-git-send-email-quic_abhinavk@quicinc.com>
 <28766af1-58c8-5930-9433-e6b1e3f5f284@linaro.org>
 <7a0d0584-3d86-8ec3-e1a7-cf8fccf8a882@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7a0d0584-3d86-8ec3-e1a7-cf8fccf8a882@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/04/2022 02:17, Abhinav Kumar wrote:
> 
> 
> On 2/4/2022 2:43 PM, Dmitry Baryshkov wrote:
>> On 05/02/2022 00:17, Abhinav Kumar wrote:
>>> kms_writeback test cases also verify with a null fb for the
>>> writeback connector job. In addition there are also other
>>> commit paths which can result in kickoffs without a valid
>>> framebuffer like while closing the fb which results in the
>>> callback to drm_atomic_helper_dirtyfb() which internally
>>> triggers a commit.
>>>
>>> Add protection in the dpu driver to ensure that commits for
>>> writeback encoders without a valid fb are gracefully skipped.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 
>>> +++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
>>>   5 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index e7c9fe1..f7963b0 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>>>       DPU_ATRACE_BEGIN("crtc_commit");
>>> +    drm_for_each_encoder_mask(encoder, crtc->dev,
>>> +            crtc->state->encoder_mask) {
>>> +        if (!dpu_encoder_has_valid_fb(encoder)) {
>>
>> Two small comments here. First, let's probably rename the function to 
>> dpu_encoder_is_valid() or dpu_encoder_is_valid_for_commit() (ugh, too 
>> long). There might be other cases (in theory), why encoder is invalid 
>> at this moment.
> 
> dpu_encoder_is_valid_for_commit() seems fine to me even if long.

Good!

> 
>>
>> Also (a minor nit): I think that we should commit if at least one of 
>> encoders is valid. So we might want to create an encoder_valid_mask 
>> basing on the calls to dpu_encoder. And then use it later for calling 
>> dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff().
> 
> Its not just these two calls. These can be easily skipped within the 
> encoder itself. I had to bring this to the dpu_crtc level because of the 
> frame_pending.

I see. Let's settle down on a question which should have been aksed 
initially. If we have a set of encoders, some of which are valid and 
others are not (for whatever reason), should we proceed with kickoff of 
the valid ones or should we skip it completely? Which encoder would call 
the frame_done callbacks, in the end decrementing the frame_pending?

> 
> The issue is atomic_inc_return(&dpu_crtc->frame_pending)
> 
> We have to skip this call otherwise it leads to incorrect "frame done 
> timeouts" because CRTC thinks frame was kicked off but it was actually 
> skipped.
> 
> Maybe, what we can do is first prepare the mask.
> 
> if (hweight(crtc_encoder_mask)) {
>      if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
>          /* acquire bandwidth and other resources */
>          DRM_DEBUG_ATOMIC("crtc%d first commit\n", crtc->base.id);
>          } else
>              DRM_DEBUG_ATOMIC("crtc%d commit\n", crtc->base.id);
> 
>        dpu_crtc->play_count++;
> 
>          dpu_vbif_clear_errors(dpu_kms);
> }
> 
> do the encoder_kickoff
> 
> if (hweight(crtc_encoder_mask))
>      reinit_completion(&dpu_crtc->frame_done_comp);
> 
> calls to dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff() can 
> be protected by dpu_encoder_is_valid_for_commit() checks.
> 
> This is probably the best we can do here.
> 
> Let me know what you think.
> 
>>
>>> +            DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
>>> +            goto end;
>>> +        }
>>> +    }
>>>       /*
>>>        * Encoder will flush/start now, unless it has a tx pending. If 
>>> so, it
>>>        * may delay and flush at an irq event (e.g. ppdone)
>>> @@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>>>           dpu_encoder_kickoff(encoder);
>>>       reinit_completion(&dpu_crtc->frame_done_comp);
>>> +
>>> +end:
>>>       DPU_ATRACE_END("crtc_commit");
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 3746432..e990dbc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1832,6 +1832,27 @@ void dpu_encoder_prepare_for_kickoff(struct 
>>> drm_encoder *drm_enc)
>>>       }
>>>   }
>>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc)
>>> +{
>>> +    struct dpu_encoder_virt *dpu_enc;
>>> +    unsigned int i;
>>> +    struct dpu_encoder_phys *phys;
>>> +
>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> +
>>> +    if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
>>> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>> +            phys = dpu_enc->phys_encs[i];
>>> +            if (phys->ops.has_valid_output_fb && 
>>> !phys->ops.has_valid_output_fb(phys)) {
>>> +                DPU_DEBUG("invalid FB not kicking off\n");
>>> +                return false;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>>>   {
>>>       struct dpu_encoder_virt *dpu_enc;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> index da5b6d6..63d90b8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> @@ -187,4 +187,10 @@ void dpu_encoder_prepare_wb_job(struct 
>>> drm_encoder *drm_enc,
>>>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>>           struct drm_writeback_job *job);
>>> +/**
>>> + * dpu_encoder_has_valid_fb - cleanup writeback job for the encoder.
>>> + * @drm_enc:    Pointer to drm encoder structure
>>> + */
>>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc);
>>> +
>>>   #endif /* __DPU_ENCODER_H__ */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> index 80da0a9..5b45b3c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> @@ -151,6 +151,7 @@ struct dpu_encoder_phys_ops {
>>>               struct drm_writeback_job *job);
>>>       void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
>>>               struct drm_writeback_job *job);
>>> +    bool (*has_valid_output_fb)(struct dpu_encoder_phys *phys_enc);
>>>   };
>>>   /**
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> index 783f83e..7eeed79 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> @@ -717,6 +717,16 @@ static void 
>>> dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
>>>       wb_enc->wb_conn = NULL;
>>>   }
>>> +static bool dpu_encoder_phys_wb_has_valid_fb(struct dpu_encoder_phys 
>>> *phys_enc)
>>> +{
>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>> to_dpu_encoder_phys_wb(phys_enc);
>>> +
>>> +    if (wb_enc->wb_job)
>>> +        return true;
>>> +    else
>>> +        return false;
>>> +}
>>> +
>>>   /**
>>>    * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>>>    * @ops:    Pointer to encoder operation table
>>> @@ -738,6 +748,8 @@ static void dpu_encoder_phys_wb_init_ops(struct 
>>> dpu_encoder_phys_ops *ops)
>>>       ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>>>       ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>>>       ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
>>> +    ops->has_valid_output_fb = dpu_encoder_phys_wb_has_valid_fb;
>>> +
>>>   }
>>>   /**
>>
>>


-- 
With best wishes
Dmitry
