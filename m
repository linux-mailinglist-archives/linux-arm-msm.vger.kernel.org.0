Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D51C7687B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjG3Twd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjG3Twc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:52:32 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A0CE5
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:52:31 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 86A09203AF;
        Sun, 30 Jul 2023 21:52:29 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:52:28 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Message-ID: <iicue6zvfcv5jhwhemivl7fjjiil6w7a74owafrztqlc4eakzp@fao3dzsil2tf>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 03:35:18, Dmitry Baryshkov wrote:
> As the INTF is fixed at the encoder creation time, we can move the
> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
> This function can return an error if INTF doesn't have required feature.
> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
> useful, as this function returns void.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 012986cff38c..adbd559a5290 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	unsigned long vsync_hz;
>  	struct dpu_kms *dpu_kms;
>  
> -	if (phys_enc->has_intf_te) {
> -		if (!phys_enc->hw_intf ||
> -		    !phys_enc->hw_intf->ops.enable_tearcheck) {
> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> -			return;
> -		}
> -
> -		DPU_DEBUG_CMDENC(cmd_enc, "");
> -	} else {
> -		if (!phys_enc->hw_pp ||
> -		    !phys_enc->hw_pp->ops.enable_tearcheck) {
> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> -			return;
> -		}
> -
> -		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
> +	/*
> +	 * TODO: if/when resource allocation is refactored, move this to a
> +	 * place where the driver can actually return an error.
> +	 */
> +	if (!phys_enc->has_intf_te &&
> +	    (!phys_enc->hw_pp ||
> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {

We're probably overdoing it here if I request a WARN_ON when has_intf_te
is true while enable_tearcheck is also non-NULL?

> +		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> +		return;
>  	}
>  
> +	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
> +			 phys_enc->hw_intf->idx - INTF_0,
> +			 phys_enc->hw_pp->idx - PINGPONG_0);

Note that hw_pp wasn't printed when has_intf_te is true.  And it doesn't
seem like that pointer is dereferenced anywhere in that case, perhaps
hw_pp may even be NULL within dpu_encoder_phys_cmd_tearcheck_config() at
some point.

> +
>  	mode = &phys_enc->cached_mode;
>  
>  	dpu_kms = phys_enc->dpu_kms;
> @@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>  	phys_enc->intf_mode = INTF_MODE_CMD;
>  	cmd_enc->stream_sel = 0;
>  
> +	if (!phys_enc->hw_intf) {
> +		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
> +

No need for this newline?

> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	/* DPU before 5.0 use PINGPONG for TE handling */
>  	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>  		phys_enc->has_intf_te = true;
>  
> +	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
> +		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
> +

Same here?

- Marijn

> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>  	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>  
> -- 
> 2.39.2
> 
