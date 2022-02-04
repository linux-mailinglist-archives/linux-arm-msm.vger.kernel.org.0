Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84C54AA35C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243812AbiBDWnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbiBDWnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:43:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4DDC061353
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:43:40 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n8so15366549lfq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WHZYbfKylsDOffPTe+KnN1sqyzmhE4v4MJUJA7VTcqQ=;
        b=Pwtzqp4tWt1L3zWsgbE0av7Hsc2++t5Ng3G+ZoFo+smjijfeHWrduHMqv2NydtttTu
         62ALj3UOkHknHi5OQRnajlUAK+XWgVec7kNMt9nq/9YKj/Kf0KybQIumY3wic/8m764T
         +h4dtaX5xVtSDJa4wQcB/oaJ5G3lY6Jjcq+LcK1bcVMpyl3hRBKf6x8b/fqTEABXyUD7
         3e1rlhnFJrIUPkFpwEefnO5Ml7AcqmVUpOJEy3Z05xTTrbUho0+6qQizZKjLbrxDmJdo
         fh/BW0uxthO6ko+lC3I80nrlI8N8aMU8dU7rVNgW9TC2aOVI5EEw7xyijpBib6oWoqRi
         ulxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WHZYbfKylsDOffPTe+KnN1sqyzmhE4v4MJUJA7VTcqQ=;
        b=gbAxoeC7Y+use0X7W5hKleKdW0PnIekDLHKsw2XjNi/EK+RniVhS798pHz0DAMEGEj
         kLFwqZYt2AY51BX+dsGWvTA3a6frhTy/ac2+aA3n3JQKn0nYSKBb6wv2EtSIDm8bxlcZ
         HAaVpl3B3BmmNZsE3Q7vq7Hri0SX4rVMfpvW3agD9W8C5PXMoZhlQx/pa8lANpAIhLqz
         D3e1Z8idN3XOVfEBUDDuxvEz/QbPsNqCe8FjSInoCuvtHIyfAqZsLwy7wFELv6a6GuVj
         Fh17TbKimQ8S1akE2q6SUQfuWYBeiZ8a2olVyFaa3JYMGaA4HKbC2lu6oWjOcBlnDwQs
         ujrQ==
X-Gm-Message-State: AOAM530Sq3IRttX57LTfgI2bITO0FDGTFSd9gdbgBynDjls9HPzfody0
        tea8GFB4o/7lEH4mRzVwzwz/mA==
X-Google-Smtp-Source: ABdhPJyxc1snqe5KNi6ZWWy5yZnBa4TvFXmi4Hccf0Tshw21ZQsIx9GMBplIlHHVe1CO/ochMaxs7Q==
X-Received: by 2002:a19:4f4a:: with SMTP id a10mr801947lfk.397.1644014619054;
        Fri, 04 Feb 2022 14:43:39 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t6sm479513lfp.128.2022.02.04.14.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 14:43:38 -0800 (PST)
Message-ID: <28766af1-58c8-5930-9433-e6b1e3f5f284@linaro.org>
Date:   Sat, 5 Feb 2022 01:43:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-12-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2022 00:17, Abhinav Kumar wrote:
> kms_writeback test cases also verify with a null fb for the
> writeback connector job. In addition there are also other
> commit paths which can result in kickoffs without a valid
> framebuffer like while closing the fb which results in the
> callback to drm_atomic_helper_dirtyfb() which internally
> triggers a commit.
> 
> Add protection in the dpu driver to ensure that commits for
> writeback encoders without a valid fb are gracefully skipped.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
>   5 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e7c9fe1..f7963b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>   
>   	DPU_ATRACE_BEGIN("crtc_commit");
>   
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +			crtc->state->encoder_mask) {
> +		if (!dpu_encoder_has_valid_fb(encoder)) {

Two small comments here. First, let's probably rename the function to 
dpu_encoder_is_valid() or dpu_encoder_is_valid_for_commit() (ugh, too 
long). There might be other cases (in theory), why encoder is invalid at 
this moment.

Also (a minor nit): I think that we should commit if at least one of 
encoders is valid. So we might want to create an encoder_valid_mask 
basing on the calls to dpu_encoder. And then use it later for calling 
dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff().

> +			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
> +			goto end;
> +		}
> +	}
>   	/*
>   	 * Encoder will flush/start now, unless it has a tx pending. If so, it
>   	 * may delay and flush at an irq event (e.g. ppdone)
> @@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>   		dpu_encoder_kickoff(encoder);
>   
>   	reinit_completion(&dpu_crtc->frame_done_comp);
> +
> +end:
>   	DPU_ATRACE_END("crtc_commit");
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3746432..e990dbc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1832,6 +1832,27 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   	}
>   }
>   
> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	unsigned int i;
> +	struct dpu_encoder_phys *phys;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
> +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +			phys = dpu_enc->phys_encs[i];
> +			if (phys->ops.has_valid_output_fb && !phys->ops.has_valid_output_fb(phys)) {
> +				DPU_DEBUG("invalid FB not kicking off\n");
> +				return false;
> +			}
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index da5b6d6..63d90b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -187,4 +187,10 @@ void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>   		struct drm_writeback_job *job);
>   
> +/**
> + * dpu_encoder_has_valid_fb - cleanup writeback job for the encoder.
> + * @drm_enc:    Pointer to drm encoder structure
> + */
> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 80da0a9..5b45b3c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -151,6 +151,7 @@ struct dpu_encoder_phys_ops {
>   			struct drm_writeback_job *job);
>   	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
>   			struct drm_writeback_job *job);
> +	bool (*has_valid_output_fb)(struct dpu_encoder_phys *phys_enc);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 783f83e..7eeed79 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -717,6 +717,16 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
>   	wb_enc->wb_conn = NULL;
>   }
>   
> +static bool dpu_encoder_phys_wb_has_valid_fb(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> +
> +	if (wb_enc->wb_job)
> +		return true;
> +	else
> +		return false;
> +}
> +
>   /**
>    * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>    * @ops:	Pointer to encoder operation table
> @@ -738,6 +748,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>   	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>   	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
> +	ops->has_valid_output_fb = dpu_encoder_phys_wb_has_valid_fb;
> +
>   }
>   
>   /**


-- 
With best wishes
Dmitry
