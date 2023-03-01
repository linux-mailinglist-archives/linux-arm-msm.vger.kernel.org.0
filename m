Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD1176A6A7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 11:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjCAKIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 05:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjCAKIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 05:08:20 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20E812BEF
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 02:08:18 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 600BD3F8C3;
        Wed,  1 Mar 2023 11:08:16 +0100 (CET)
Date:   Wed, 1 Mar 2023 11:08:15 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit()
 function
Message-ID: <20230301100815.2mwzickezovsg2oe@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-4-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221184256.1436-4-quic_jesszhan@quicinc.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-02-21 10:42:55, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(),  we have
> not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()

s/not/no

> do nothing. Remove prepare_commit() from DPU driver.

And again, this:

> Changes in V3:
> - Reworded commit message to be more clear
> - Corrected spelling mistake in commit message
> 
> Changes in V4:
> - Reworded commit message for clarity

... should go below the cut.

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

With the above two issues fixed:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>  3 files changed, 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dcceed91aed8..35e120b5ef53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  	ctl->ops.clear_pending_flush(ctl);
>  }
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
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236ef34e6..2c9ef8d1b877 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
>  int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>  		struct msm_display_info *disp_info);
>  
> -/**
> - * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
> - *	atomic commit, before any registers are written
> - * @drm_enc:    Pointer to previously created drm encoder structure
> - */
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
> -
>  /**
>   * dpu_encoder_set_idle_timeout - set the idle timeout for video
>   *                    and command mode encoders.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 165958d47ec6..6f7ddbf0d9b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>  	return ktime_get();
>  }
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
>  static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.enable_commit   = dpu_kms_enable_commit,
>  	.disable_commit  = dpu_kms_disable_commit,
>  	.vsync_time      = dpu_kms_vsync_time,
> -	.prepare_commit  = dpu_kms_prepare_commit,
>  	.flush_commit    = dpu_kms_flush_commit,
>  	.wait_flush      = dpu_kms_wait_flush,
>  	.complete_commit = dpu_kms_complete_commit,
> -- 
> 2.39.2
> 
