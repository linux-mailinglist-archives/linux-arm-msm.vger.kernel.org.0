Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F9D502033
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 03:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiDOBww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 21:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbiDOBwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 21:52:51 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6038D6E342
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 18:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649987423; x=1681523423;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Pg/gisp5zSlm/8HZotOwissyFmYbSGvEHkLO2Yt21G8=;
  b=m+cOxC7QhjQdlcagNZI/nnrXR0uvN8Mz7WX6iRoXE83GV3FXGKLA5OJD
   P2itLgb5LIoKdPR6JmkuxXVX11O2PUN4mVAZ+VIV9mZC9TXEC9RWJNHjF
   xgHPxPhbYZ1mliysAG/QzB+2yQndPW6pQNutN7REcXM7NC02bWa0IK272
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Apr 2022 18:50:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 18:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 18:50:21 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 18:50:19 -0700
Message-ID: <261d5551-0fdb-ccf5-5108-fd7521c7c93b@quicinc.com>
Date:   Thu, 14 Apr 2022 18:50:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/12] drm/msm/dpu: gracefully handle null fb commits for
 writeback
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <markyacoub@chromium.org>, <quic_jesszhan@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-12-git-send-email-quic_abhinavk@quicinc.com>
 <28766af1-58c8-5930-9433-e6b1e3f5f284@linaro.org>
 <7a0d0584-3d86-8ec3-e1a7-cf8fccf8a882@quicinc.com>
 <62e5b7c9-21cb-74ec-2b5f-5d85538a95c3@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <62e5b7c9-21cb-74ec-2b5f-5d85538a95c3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/14/2022 5:36 PM, Dmitry Baryshkov wrote:
> On 15/04/2022 02:17, Abhinav Kumar wrote:
>>
>>
>> On 2/4/2022 2:43 PM, Dmitry Baryshkov wrote:
>>> On 05/02/2022 00:17, Abhinav Kumar wrote:
>>>> kms_writeback test cases also verify with a null fb for the
>>>> writeback connector job. In addition there are also other
>>>> commit paths which can result in kickoffs without a valid
>>>> framebuffer like while closing the fb which results in the
>>>> callback to drm_atomic_helper_dirtyfb() which internally
>>>> triggers a commit.
>>>>
>>>> Add protection in the dpu driver to ensure that commits for
>>>> writeback encoders without a valid fb are gracefully skipped.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 
>>>> +++++++++++++++++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
>>>>   5 files changed, 49 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index e7c9fe1..f7963b0 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc 
>>>> *crtc)
>>>>       DPU_ATRACE_BEGIN("crtc_commit");
>>>> +    drm_for_each_encoder_mask(encoder, crtc->dev,
>>>> +            crtc->state->encoder_mask) {
>>>> +        if (!dpu_encoder_has_valid_fb(encoder)) {
>>>
>>> Two small comments here. First, let's probably rename the function to 
>>> dpu_encoder_is_valid() or dpu_encoder_is_valid_for_commit() (ugh, too 
>>> long). There might be other cases (in theory), why encoder is invalid 
>>> at this moment.
>>
>> dpu_encoder_is_valid_for_commit() seems fine to me even if long.
> 
> Good!
> 
>>
>>>
>>> Also (a minor nit): I think that we should commit if at least one of 
>>> encoders is valid. So we might want to create an encoder_valid_mask 
>>> basing on the calls to dpu_encoder. And then use it later for calling 
>>> dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff().
>>
>> Its not just these two calls. These can be easily skipped within the 
>> encoder itself. I had to bring this to the dpu_crtc level because of 
>> the frame_pending.
> 
> I see. Let's settle down on a question which should have been aksed 
> initially. If we have a set of encoders, some of which are valid and 
> others are not (for whatever reason), should we proceed with kickoff of 
> the valid ones or should we skip it completely? Which encoder would call 
> the frame_done callbacks, in the end decrementing the frame_pending?

Well, to answer this question, lets consider two cases:

1) If we are talking about only the encoder having a valid fb as the 
criteria for validity, and lets say there are two encoders one having 
valid fb and the other not having one. This is not possible.
We map the same fb which is passed from the prepare_wb_job to both the 
physical encoders today so such a case wont happen.

2) In future, if we extend this valid check for other cases like you are 
suggesting here, even in that case, lets say we have two physical 
encoders, one master and the other slave. Even if one of them is 
invalid, the frame is invalid in my opinion as it will end up displaying 
corruption on the screen.

I dont think we are missing any other case here.

IF we just consider these two, then perhaps current approach is good 
enough with just the renaming ofcourse from dpu_encoder_has_valid_fb 
---> dpu_encoder_is_valid_for_commit()

> 
>>
>> The issue is atomic_inc_return(&dpu_crtc->frame_pending)
>>
>> We have to skip this call otherwise it leads to incorrect "frame done 
>> timeouts" because CRTC thinks frame was kicked off but it was actually 
>> skipped.
>>
>> Maybe, what we can do is first prepare the mask.
>>
>> if (hweight(crtc_encoder_mask)) {
>>      if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
>>          /* acquire bandwidth and other resources */
>>          DRM_DEBUG_ATOMIC("crtc%d first commit\n", crtc->base.id);
>>          } else
>>              DRM_DEBUG_ATOMIC("crtc%d commit\n", crtc->base.id);
>>
>>        dpu_crtc->play_count++;
>>
>>          dpu_vbif_clear_errors(dpu_kms);
>> }
>>
>> do the encoder_kickoff
>>
>> if (hweight(crtc_encoder_mask))
>>      reinit_completion(&dpu_crtc->frame_done_comp);
>>
>> calls to dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff() 
>> can be protected by dpu_encoder_is_valid_for_commit() checks.
>>
>> This is probably the best we can do here.
>>
>> Let me know what you think.
>>
>>>
>>>> +            DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
>>>> +            goto end;
>>>> +        }
>>>> +    }
>>>>       /*
>>>>        * Encoder will flush/start now, unless it has a tx pending. 
>>>> If so, it
>>>>        * may delay and flush at an irq event (e.g. ppdone)
>>>> @@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>>>>           dpu_encoder_kickoff(encoder);
>>>>       reinit_completion(&dpu_crtc->frame_done_comp);
>>>> +
>>>> +end:
>>>>       DPU_ATRACE_END("crtc_commit");
>>>>   }
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 3746432..e990dbc 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -1832,6 +1832,27 @@ void dpu_encoder_prepare_for_kickoff(struct 
>>>> drm_encoder *drm_enc)
>>>>       }
>>>>   }
>>>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc)
>>>> +{
>>>> +    struct dpu_encoder_virt *dpu_enc;
>>>> +    unsigned int i;
>>>> +    struct dpu_encoder_phys *phys;
>>>> +
>>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> +
>>>> +    if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
>>>> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>> +            phys = dpu_enc->phys_encs[i];
>>>> +            if (phys->ops.has_valid_output_fb && 
>>>> !phys->ops.has_valid_output_fb(phys)) {
>>>> +                DPU_DEBUG("invalid FB not kicking off\n");
>>>> +                return false;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>>>>   {
>>>>       struct dpu_encoder_virt *dpu_enc;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> index da5b6d6..63d90b8 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> @@ -187,4 +187,10 @@ void dpu_encoder_prepare_wb_job(struct 
>>>> drm_encoder *drm_enc,
>>>>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>>>           struct drm_writeback_job *job);
>>>> +/**
>>>> + * dpu_encoder_has_valid_fb - cleanup writeback job for the encoder.
>>>> + * @drm_enc:    Pointer to drm encoder structure
>>>> + */
>>>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc);
>>>> +
>>>>   #endif /* __DPU_ENCODER_H__ */
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index 80da0a9..5b45b3c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -151,6 +151,7 @@ struct dpu_encoder_phys_ops {
>>>>               struct drm_writeback_job *job);
>>>>       void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
>>>>               struct drm_writeback_job *job);
>>>> +    bool (*has_valid_output_fb)(struct dpu_encoder_phys *phys_enc);
>>>>   };
>>>>   /**
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> index 783f83e..7eeed79 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> @@ -717,6 +717,16 @@ static void 
>>>> dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
>>>>       wb_enc->wb_conn = NULL;
>>>>   }
>>>> +static bool dpu_encoder_phys_wb_has_valid_fb(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +
>>>> +    if (wb_enc->wb_job)
>>>> +        return true;
>>>> +    else
>>>> +        return false;
>>>> +}
>>>> +
>>>>   /**
>>>>    * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>>>>    * @ops:    Pointer to encoder operation table
>>>> @@ -738,6 +748,8 @@ static void dpu_encoder_phys_wb_init_ops(struct 
>>>> dpu_encoder_phys_ops *ops)
>>>>       ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>>>>       ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>>>>       ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
>>>> +    ops->has_valid_output_fb = dpu_encoder_phys_wb_has_valid_fb;
>>>> +
>>>>   }
>>>>   /**
>>>
>>>
> 
> 
