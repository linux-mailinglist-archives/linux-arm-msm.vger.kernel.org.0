Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C426910B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBISvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBISvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:51:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46BB29413
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:51:36 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id da9so2890218edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1DbNEMtf10a14hvNdce76hr3Dsz4w8UKfPwnlDGhP0=;
        b=cg064PxElrCjrz6I93ZGpXf15FEDyKBNdFL5CLjI8L9Ca76dS9W6V0Q8IoVuv+HCSy
         gWIuUo8IlFpX5sTnRpckdRHoGpD0H0z5lmtXBzGTyvvZ5+fsPtLD1lm8wGPATUaxDW+6
         bj/y1mrz9RofrRZlYZY+3pjMX3rxEYocSF5Z64lKVuZH95PlhVQtpKERWvBUBrtAjtAH
         T0DOkwAf11VQzygqJyCR9eH0YH/EsjfHgR5Kp2UMbFmzILlEmSzpTR0jp439TBVRA3QM
         1AaHdaBj1g0g2EVQuIEZW7gaxHEM4ontnpdlgPYlRfGJjZBjkCyMdGr6w+nEGYrjh0VK
         xcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1DbNEMtf10a14hvNdce76hr3Dsz4w8UKfPwnlDGhP0=;
        b=wbMU9KxHx6XfrOxipyhDELM4b0d7ivb9u6mKHSoJcF3Wfk2YoQIR5hbn0C/TtKTFfW
         6x1dYQFBQuEe8UJm5xbfCdoWfgBhb+vcMh3bOQh5a3umiZu8FdbidlY9pzDiZ/QIypJ+
         pruXiwRkwIbfsRnkI8E/BQYfkDYBewZjEMSZoPB6RZa9yKTFO9oiM4et86TDV5XoSF56
         20XAcWFB0wSeJ9oJqOH6ryApYW0HceWs4MNswi8R++bpSbTjAj/qZ3ac83nrcqnezIT6
         vQut/ZKcQpLvj1yUBwIf42fiRvQBNzRS255ny/N7AUTv8jfihtTZ+lhPMgoPROyIxfRQ
         pVTg==
X-Gm-Message-State: AO0yUKUsB4/g5d7h5WHHyB/cpwFA7w4FNnB1xgQMhXirDdlDQo63ttv5
        7XnPamzHo/Drfhm0BjYCqqftTQ==
X-Google-Smtp-Source: AK7set+SeUeAupr9P2RmU2gEzbrmvt5VdUsnN8z+mZrkgoEaML577b12xrQ8v54QZJ6Enrfh7RDzTw==
X-Received: by 2002:a50:d48b:0:b0:4ab:2503:4039 with SMTP id s11-20020a50d48b000000b004ab25034039mr2800645edi.17.1675968695236;
        Thu, 09 Feb 2023 10:51:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v28-20020a50d59c000000b004aaa09d50adsm1119276edi.94.2023.02.09.10.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 10:51:34 -0800 (PST)
Message-ID: <43b80bc0-b057-16dd-b20a-871bb1f40b81@linaro.org>
Date:   Thu, 9 Feb 2023 20:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 3/4] drm/msm/dpu: Remove empty prepare_commit()
 function
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-4-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 20:44, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(),
> move empty prepare_commit() from DPU driver.

s/move/remove/

Also the DPU's prepare_commit() is not empty. Please mention 
dpu_encoder_prepare_commit() becoming (or being) empty.


> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>   4 files changed, 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dcceed91aed8..35e120b5ef53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	ctl->ops.clear_pending_flush(ctl);
>   }
>   
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
> -{
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
> -	int i;
> -
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		phys = dpu_enc->phys_encs[i];
> -		if (phys->ops.prepare_commit)
> -			phys->ops.prepare_commit(phys);
> -	}
> -}
> -
>   #ifdef CONFIG_DEBUG_FS
>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236ef34e6..2c9ef8d1b877 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
>   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   		struct msm_display_info *disp_info);
>   
> -/**
> - * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
> - *	atomic commit, before any registers are written
> - * @drm_enc:    Pointer to previously created drm encoder structure
> - */
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
> -
>   /**
>    * dpu_encoder_set_idle_timeout - set the idle timeout for video
>    *                    and command mode encoders.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 561406d92a1a..4c189b9fa9b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -703,11 +703,6 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>   			atomic_read(&phys_enc->pending_kickoff_cnt));
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -}
> -
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -807,7 +802,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
>   static void dpu_encoder_phys_cmd_init_ops(
>   		struct dpu_encoder_phys_ops *ops)
>   {
> -	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;

Also please don't forget to remove prepare_commit from dpu_encoder_phys_ops.

>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
>   	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 165958d47ec6..6f7ddbf0d9b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>   	return ktime_get();
>   }
>   
> -static void dpu_kms_prepare_commit(struct msm_kms *kms,
> -		struct drm_atomic_state *state)
> -{
> -	struct drm_crtc *crtc;
> -	struct drm_crtc_state *crtc_state;
> -	struct drm_encoder *encoder;
> -	int i;
> -
> -	if (!kms)
> -		return;
> -
> -	/* Call prepare_commit for all affected encoders */
> -	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> -		drm_for_each_encoder_mask(encoder, crtc->dev,
> -					  crtc_state->encoder_mask) {
> -			dpu_encoder_prepare_commit(encoder);
> -		}
> -	}
> -}
> -
>   static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>   {
>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
>   	.enable_commit   = dpu_kms_enable_commit,
>   	.disable_commit  = dpu_kms_disable_commit,
>   	.vsync_time      = dpu_kms_vsync_time,
> -	.prepare_commit  = dpu_kms_prepare_commit,
>   	.flush_commit    = dpu_kms_flush_commit,
>   	.wait_flush      = dpu_kms_wait_flush,
>   	.complete_commit = dpu_kms_complete_commit,

-- 
With best wishes
Dmitry

