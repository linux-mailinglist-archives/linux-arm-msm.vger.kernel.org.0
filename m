Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8FA5B7917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 20:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiIMSDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 14:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiIMSDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 14:03:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321047198B
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 10:04:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s6so9957976lfo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=C1SHrY0bzxKJ2NJT55YgREa1pzMItM4ioi+jr7Uh69I=;
        b=ZyzHm7wCckAHL4Gs1yvJKUehjmxAlog/Jx3GoSEfC4baYLnjiY7xzQVbg1PkrG4KFC
         v97vC0Qk1DFJl9ilEx3cLWjd/j9NES0HBuZanV/u/bcCIliA9ktXGZrjhAAxQLsg7oqC
         9USwMMYwfKr+JzxZQ3Su1k9TpWSYbZccBk5Go25P9wOiQWcuB/EeDpKNudTt/UDESMDq
         CCTylyfCgb0/lOANY0qNvTCv2F/hLzFA3m7UOUKmAX+hSZnuxTD+4IRPuhmBEJ5+SwMj
         ZuFKikE00gDHXMjuVbTrIoI7n0Swziqp6aJViDdPykGVFW9DXifyATtfJz+1ysj3OPLs
         u4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C1SHrY0bzxKJ2NJT55YgREa1pzMItM4ioi+jr7Uh69I=;
        b=bAwFw/iOtW0m0j8MkOhmlg0hml2883Pcxaca9D544lIS3LYQUKHBg0ihqiuETTaRUO
         eER0nTWJhHQt71/nc70gmg45iPti4ro3xCrhXsWbVpAYCu9NzslQaIdqGYCO7+GBgRbF
         tCVNcj//ni3g3FiYR9KThft9Bl1dM53fmeM7Tdk9H14EMXfHz75loA8fqJsivCMJxg72
         pJWSNytnwjEoqdjBa/AL5j7xUjoJx2ZWWR+vTuXqe58KCA1a4kkR5A+KUnPm0ifPZuMr
         Iy1ss6kloXT695/VnShFcPRYogxrgsgQLtBuJOdRf0kImW2a3xQt9OP76tpJF1YH1D8s
         zkAQ==
X-Gm-Message-State: ACgBeo3jFQ5C5/vTmDBscncsS1WT4bXROCnpuPsqcVdqb14DNXnZ3AvP
        h44wJhEp2MG60zHVFd8mPZoN7w==
X-Google-Smtp-Source: AA6agR4rAimnm7a205Tjxp1N64zK3JZcXpBZwm3oeZBBQMHWEgaM2PIlpoha5yNCcLjv3U9HBWcOyQ==
X-Received: by 2002:a19:f805:0:b0:498:df1f:858e with SMTP id a5-20020a19f805000000b00498df1f858emr9917460lff.610.1663088690486;
        Tue, 13 Sep 2022 10:04:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i24-20020a0565123e1800b00492e5d31201sm1833989lfv.7.2022.09.13.10.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 10:04:50 -0700 (PDT)
Message-ID: <fc45b986-99ae-b63d-9ed4-0ca622b16a8f@linaro.org>
Date:   Tue, 13 Sep 2022 20:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com
References: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
 <1663080676-12936-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1663080676-12936-2-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2022 17:51, Vinod Polimera wrote:
> Update crtc retrieval from dpu_enc to dpu_enc connector state,
> since new links get set as part of the dpu enc virt mode set.
> The dpu_enc->crtc cache is no more needed, hence cleaning it as
> part of this change.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 -------
>   3 files changed, 14 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321..8ec9a13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			release_bandwidth = true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
>   	}
>   
>   	/* wait for frame_event_done completion */
> @@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>   	dpu_crtc->enabled = true;
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> -
>   	/* Enable/restore vblank irq handling */
>   	drm_crtc_vblank_on(crtc);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..0c7d8b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> - * @crtc:		Pointer to the currently assigned crtc. Normally you
> - *			would use crtc->state->encoder_mask to determine the
> - *			link between encoder/crtc. However in this case we need
> - *			to track crtc in the disable() hook which is called
> - *			_after_ encoder_mask is cleared.
>    * @connector:		If a mode is set, cached pointer to the active connector
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
> @@ -181,7 +176,6 @@ struct dpu_encoder_virt {
>   
>   	bool intfs_swapped;
>   
> -	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
>   	struct dentry *debugfs_root;
> @@ -1288,6 +1282,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	struct drm_crtc *crtc;
>   	unsigned long lock_flags;
>   
>   	if (!drm_enc || !phy_enc)
> @@ -1298,9 +1293,14 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   
>   	atomic_inc(&phy_enc->vsync_cnt);
>   
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	crtc = dpu_enc->connector->state->crtc;
> +
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc)
> -		dpu_crtc_vblank_callback(dpu_enc->crtc);
> +	if (crtc)
> +		dpu_crtc_vblank_callback(crtc);
>   	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);

Stephen's comment about reading the state from outside of the lock and 
then using local variable under spinlock is still valid. Moreover I'm 
not sure that enc_spinlock protects connector's state. I'd say one has 
to take the modesetting lock here.

>   
>   	DPU_ATRACE_END("encoder_vblank_callback");
> @@ -1324,29 +1324,22 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
>   	DPU_ATRACE_END("encoder_underrun_callback");
>   }
>   
> -void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	unsigned long lock_flags;
> -
> -	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	/* crtc should always be cleared before re-assigning */
> -	WARN_ON(crtc && dpu_enc->crtc);
> -	dpu_enc->crtc = crtc;
> -	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> -}
> -
>   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>   					struct drm_crtc *crtc, bool enable)
>   {
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct drm_crtc *new_crtc;
>   	unsigned long lock_flags;
>   	int i;
>   
>   	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>   
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	new_crtc = dpu_enc->connector->state->crtc;
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc != crtc) {
> +	if (!new_crtc || new_crtc != crtc) {
>   		spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   		return;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..eda5cd8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -40,14 +40,6 @@ struct msm_display_info {
>   };
>   
>   /**
> - * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
> - * @encoder:	encoder pointer
> - * @crtc:	crtc pointer
> - */
> -void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> -			     struct drm_crtc *crtc);
> -
> -/**
>    * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
>    *	the encoder is assigned to the given crtc
>    * @encoder:	encoder pointer

-- 
With best wishes
Dmitry

