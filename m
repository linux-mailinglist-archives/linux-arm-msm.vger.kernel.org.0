Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2228F65AA22
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 14:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjAANcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 08:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjAANcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 08:32:19 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD62BFC
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 05:32:15 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s22so26737221ljp.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 05:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cWKBAqAeaVVu9SDscu9vFx9sQyBTLRM5OuitYzSqAs=;
        b=oRR6NRVVtjHXlNLUxR9+zmwq8Q1n05sHMJtEUFqBatLIFloLhznLilaKMfMo/79b6n
         lgSWt+rUMlv9KbnpVXXMhD9t5HA3PXHB6eADcMfPVlvsU+JlQcC3+CDeDAb6w+drteP4
         5KMSq2T/yJoJ1R5lzzVjLXec8hsO4z5ma0Mi19m0beS7K9PglODTwrXdcWWGeq1fKzzE
         mtFEJR0H4yGR1BR2mldhmbgbWHJ1C9UI8SUF38c5+0dof74ezY2KxLF9AfiozjYx1qHG
         BMspX8abXtiaV2zl1YuXBv5LBjnD+n3Vba2ggCBsyPbYy8xDOG0RCLKG6PM68Rumd4qo
         IkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cWKBAqAeaVVu9SDscu9vFx9sQyBTLRM5OuitYzSqAs=;
        b=QPGyx1aEAnyFeYScGqPWFplOgrTrLSh3UK4BZqPGGsMIUM6FcYtztUb6ZvbYzE9hju
         iZpcvhUZj44vVj/us42aI+FGcGZVtUIfdWuqhXJCnVqk3wCpesQ9Vz3utZqmQm9pYQd4
         FIGcUjnAFMulQplfy3nXK853w9xSAtKBA6viFrseAZS/IEFaJwDdidunv+eY+YNmpby+
         1GIzxrDEq6dps4fJBSoly8opowUxpTKTbR9K5OEZHak8QB4Q251rMFgxdwH+4bvSeJAu
         jNbBnsKJjMwvuKAzzx7YjWO1WSzcmjI09EzFn8YLF6zQFpqbfAX9qu5boAQM59V3hZIb
         33yg==
X-Gm-Message-State: AFqh2kpx5VUGZETd7++9S2Q+QiAxdeGFbj7jafjZAj8uZfE+Aas3D3dT
        hF7BZ8TnvsTLmeX0D+ZcY7MT7g==
X-Google-Smtp-Source: AMrXdXvymt1y9eGVA0eZuPaegObMip12PUTuKWA5QzYc2+LIXAc0BqVQsEbmarNpXEIOrWsdQTP0Uw==
X-Received: by 2002:a2e:9cc9:0:b0:27f:bb8b:7527 with SMTP id g9-20020a2e9cc9000000b0027fbb8b7527mr9888752ljj.13.1672579933288;
        Sun, 01 Jan 2023 05:32:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j20-20020a2e8014000000b0027fde521991sm720952ljg.40.2023.01.01.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 05:32:12 -0800 (PST)
Message-ID: <593cae1c-ade3-c68a-25d3-84ba1b968175@linaro.org>
Date:   Sun, 1 Jan 2023 15:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 6/7] drm/msm/dpu: Implement tearcheck support on INTF
 block
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-7-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-7-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/12/2022 23:50, Marijn Suijten wrote:
> Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
> PINGPONG block and into the INTF.  Implement the necessary callbacks in
> the INTF block, and use these callbacks together with the INTF_TEAR
> interrupts
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Generally I have the same question as for the patch 2. Can we have some 
higher level functions in the hw_pp and hw_intf files? Moreover, as I 
review your patch I have the feeling that it would make sense to have to 
two sets of encoder callbacks, one for the hw_pp tearing handling and 
another set for hw_intf-based one.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  11 +
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  10 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 113 +++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 206 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  29 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>   6 files changed, 340 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b5a194..8b9070220ab2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -673,6 +673,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>   	struct dpu_kms *dpu_kms;
>   	struct dpu_hw_mdp *hw_mdptop;
>   	struct drm_encoder *drm_enc;
> +	struct dpu_encoder_phys *phys_enc;
>   	int i;
>   
>   	if (!dpu_enc || !disp_info) {
> @@ -703,12 +704,22 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>   			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
>   
>   		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> +		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> +
>   		if (disp_info->is_te_using_watchdog_timer)
>   			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
>   		else
>   			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
>   
>   		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> +
> +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +			phys_enc = dpu_enc->phys_encs[i];
> +
> +			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +						vsync_cfg.vsync_source);
> +		}
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index f2af07d87f56..47e79401032c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -148,10 +148,10 @@ struct dpu_encoder_phys_ops {
>   /**
>    * enum dpu_intr_idx - dpu encoder interrupt index
>    * @INTR_IDX_VSYNC:    Vsync interrupt for video mode panel
> - * @INTR_IDX_PINGPONG: Pingpong done unterrupt for cmd mode panel
> - * @INTR_IDX_UNDERRUN: Underrun unterrupt for video and cmd mode panel
> - * @INTR_IDX_RDPTR:    Readpointer done unterrupt for cmd mode panel
> - * @INTR_IDX_WB_DONE:  Writeback fone interrupt for virtual connector
> + * @INTR_IDX_PINGPONG: Pingpong done interrupt for cmd mode panel
> + * @INTR_IDX_UNDERRUN: Underrun interrupt for video and cmd mode panel
> + * @INTR_IDX_RDPTR:    Readpointer done interrupt for cmd mode panel
> + * @INTR_IDX_WB_DONE:  Writeback done interrupt for virtual connector
>    */
>   enum dpu_intr_idx {
>   	INTR_IDX_VSYNC,
> @@ -195,6 +195,7 @@ enum dpu_intr_idx {
>    *                              pending.
>    * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
>    * @irq:			IRQ indices
> + * @has_intf_te:		Interface TE configuration support
>    */
>   struct dpu_encoder_phys {
>   	struct drm_encoder *parent;
> @@ -220,6 +221,7 @@ struct dpu_encoder_phys {
>   	atomic_t pending_kickoff_cnt;
>   	wait_queue_head_t pending_kickoff_wq;
>   	int irq[INTR_IDX_MAX];
> +	bool has_intf_te;
>   };
>   
>   static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 7e5ba52197cd..ca44a8087f01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -100,12 +100,12 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>   	DPU_ATRACE_END("pp_done_irq");
>   }
>   
> -static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
> +static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
>   {
>   	struct dpu_encoder_phys *phys_enc = arg;
>   	struct dpu_encoder_phys_cmd *cmd_enc;
>   
> -	if (!phys_enc->hw_pp)
> +	if (!phys_enc->hw_pp || !phys_enc->hw_intf)
>   		return;
>   
>   	DPU_ATRACE_BEGIN("rd_ptr_irq");
> @@ -147,11 +147,19 @@ static void dpu_encoder_phys_cmd_atomic_mode_set(
>   		struct drm_crtc_state *crtc_state,
>   		struct drm_connector_state *conn_state)
>   {
> +	if (phys_enc->has_intf_te && !phys_enc->hw_intf) {
> +		DPU_ERROR("invalid intf configuration\n");
> +		return;
> +	}
> +
>   	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
>   
>   	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
>   
> -	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> +	if (phys_enc->has_intf_te)
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> +	else
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
>   
>   	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   }
> @@ -264,7 +272,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>   	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
>   		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
>   				phys_enc->irq[INTR_IDX_RDPTR],
> -				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
> +				dpu_encoder_phys_cmd_te_rd_ptr_irq,
>   				phys_enc);
>   	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
>   		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> @@ -336,10 +344,18 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>   
>   	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
>   
> -	if (!phys_enc->hw_pp->ops.setup_tearcheck ||
> -		!phys_enc->hw_pp->ops.enable_tearcheck) {
> -		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> -		return;
> +	if (phys_enc->has_intf_te) {
> +		if (!phys_enc->hw_intf->ops.setup_tearcheck ||
> +			!phys_enc->hw_intf->ops.enable_tearcheck) {
> +			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> +			return;
> +		}
> +	} else {
> +		if (!phys_enc->hw_pp->ops.setup_tearcheck ||
> +			!phys_enc->hw_pp->ops.enable_tearcheck) {
> +			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> +			return;
> +		}
>   	}
>   
>   	dpu_kms = phys_enc->dpu_kms;
> @@ -392,8 +408,13 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>   		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
>   		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
>   
> -	phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
> -	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);

A simple random example: setup_tearcheck is always followed with the 
enable_tearcheck. If we merge them, the code would be simpler.

> +	if (phys_enc->has_intf_te) {
> +		phys_enc->hw_intf->ops.setup_tearcheck(phys_enc->hw_intf, &tc_cfg);
> +		phys_enc->hw_intf->ops.enable_tearcheck(phys_enc->hw_intf, tc_enable);
> +	} else {
> +		phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
> +		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
> +	}
>   }
>   
>   static void _dpu_encoder_phys_cmd_pingpong_config(
> @@ -470,11 +491,19 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
>   static void _dpu_encoder_phys_cmd_connect_te(
>   		struct dpu_encoder_phys *phys_enc, bool enable)
>   {
> -	if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
> -		return;
> +	if (phys_enc->has_intf_te) {
> +		if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.connect_external_te)
> +			return;
>   
> -	trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
> -	phys_enc->hw_pp->ops.connect_external_te(phys_enc->hw_pp, enable);
> +		trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
> +		phys_enc->hw_intf->ops.connect_external_te(phys_enc->hw_intf, enable);
> +	} else {
> +		if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
> +			return;
> +
> +		trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
> +		phys_enc->hw_pp->ops.connect_external_te(phys_enc->hw_pp, enable);
> +	}
>   }
>   
>   static void dpu_encoder_phys_cmd_prepare_idle_pc(
> @@ -487,6 +516,7 @@ static int dpu_encoder_phys_cmd_get_line_count(
>   		struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_pingpong *hw_pp;
> +	struct dpu_hw_intf *hw_intf;
>   
>   	if (!phys_enc->hw_pp)
>   		return -EINVAL;
> @@ -494,10 +524,16 @@ static int dpu_encoder_phys_cmd_get_line_count(
>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>   		return -EINVAL;
>   
> +	if (phys_enc->has_intf_te) {
> +		hw_intf = phys_enc->hw_intf;
> +		if (!hw_intf->ops.get_line_count)
> +			return -EINVAL;
> +		return hw_intf->ops.get_line_count(hw_intf);
> +	}
> +
>   	hw_pp = phys_enc->hw_pp;
>   	if (!hw_pp->ops.get_line_count)
>   		return -EINVAL;
> -
>   	return hw_pp->ops.get_line_count(hw_pp);
>   }
>   
> @@ -520,7 +556,9 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>   		return;
>   	}
>   
> -	if (phys_enc->hw_pp->ops.enable_tearcheck)
> +	if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.enable_tearcheck)
> +		phys_enc->hw_intf->ops.enable_tearcheck(phys_enc->hw_intf, false);
> +	else if (phys_enc->hw_pp->ops.enable_tearcheck)
>   		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
>   
>   	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
> @@ -582,10 +620,19 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   {
>   	struct dpu_hw_pp_vsync_info info;
>   
> -	if (!phys_enc || !phys_enc->hw_pp->ops.get_vsync_info)
> +	if (!phys_enc)
>   		return false;
>   
> -	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
> +	if (phys_enc->has_intf_te) {
> +		if (!phys_enc->hw_intf->ops.get_vsync_info)
> +			return false;
> +		phys_enc->hw_intf->ops.get_vsync_info(phys_enc->hw_intf, &info);
> +	} else {
> +		if (!phys_enc->hw_pp->ops.get_vsync_info)
> +			return false;
> +		phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
> +	}
> +
>   	if (info.wr_ptr_line_count > 0 &&
>   	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
>   		return true;
> @@ -602,17 +649,23 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   
>   	if (!phys_enc)
>   		return;
> -	if (!phys_enc->hw_pp)
> -		return;
>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>   		return;
>   
> -	if (!phys_enc->hw_pp->ops.get_autorefresh || !phys_enc->hw_pp->ops.setup_autorefresh)
> -		return;
> -
>   	/* If autorefresh is already disabled, we have nothing to do */
> -	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
> -		return;
> +	if (phys_enc->has_intf_te) {
> +		if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_autorefresh ||
> +				!phys_enc->hw_intf->ops.setup_autorefresh)
> +			return;
> +		if (!phys_enc->hw_intf->ops.get_autorefresh(phys_enc->hw_intf, NULL))
> +			return;
> +	} else {
> +		if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.get_autorefresh ||
> +				!phys_enc->hw_pp->ops.setup_autorefresh)
> +			return;
> +		if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
> +			return;
> +	}
>   
>   	/*
>   	 * If autorefresh is enabled, disable it and make sure it is safe to
> @@ -623,7 +676,10 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   	 * 5. Enable TE back
>   	 */
>   	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
> -	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
> +	if (phys_enc->has_intf_te)
> +		phys_enc->hw_intf->ops.setup_autorefresh(phys_enc->hw_intf, 0, false);
> +	else
> +		phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
>   
>   	do {
>   		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
> @@ -717,7 +773,7 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
>   
>   	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
>   			phys_enc->irq[INTR_IDX_RDPTR],
> -			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
> +			dpu_encoder_phys_cmd_te_rd_ptr_irq,
>   			&wait_info);
>   
>   	return rc;
> @@ -793,6 +849,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
>   		phys_enc->irq[i] = -EINVAL;
>   
> +	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
> +			&phys_enc->dpu_kms->catalog->intf[p->intf_idx - INTF_0].features);
> +
>   	atomic_set(&phys_enc->vblank_refcount, 0);
>   	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>   	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7ce66bf3f4c8..42929278df8e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -9,6 +9,8 @@
>   #include "dpu_hw_intf.h"
>   #include "dpu_kms.h"
>   
> +#include <linux/iopoll.h>
> +
>   #define INTF_TIMING_ENGINE_EN           0x000
>   #define INTF_CONFIG                     0x004
>   #define INTF_HSYNC_CTL                  0x008
> @@ -62,6 +64,27 @@
>   #define   INTF_LINE_COUNT               0x0B0
>   
>   #define   INTF_MUX                      0x25C
> +#define   INTF_MISR_SIGNATURE           0x184
> +
> +#define INTF_STATUS                     0x26C
> +#define INTF_AVR_CONTROL                0x270
> +#define INTF_AVR_MODE                   0x274
> +#define INTF_AVR_TRIGGER                0x278
> +#define INTF_AVR_VTOTAL                 0x27C
> +#define INTF_TEAR_MDP_VSYNC_SEL         0x280
> +#define INTF_TEAR_TEAR_CHECK_EN         0x284
> +#define INTF_TEAR_SYNC_CONFIG_VSYNC     0x288
> +#define INTF_TEAR_SYNC_CONFIG_HEIGHT    0x28C
> +#define INTF_TEAR_SYNC_WRCOUNT          0x290
> +#define INTF_TEAR_VSYNC_INIT_VAL        0x294
> +#define INTF_TEAR_INT_COUNT_VAL         0x298
> +#define INTF_TEAR_SYNC_THRESH           0x29C
> +#define INTF_TEAR_START_POS             0x2A0
> +#define INTF_TEAR_RD_PTR_IRQ            0x2A4
> +#define INTF_TEAR_WR_PTR_IRQ            0x2A8
> +#define INTF_TEAR_OUT_LINE_COUNT        0x2AC
> +#define INTF_TEAR_LINE_COUNT            0x2B0
> +#define INTF_TEAR_AUTOREFRESH_CONFIG    0x2B4
>   
>   #define INTF_CFG_ACTIVE_H_EN	BIT(29)
>   #define INTF_CFG_ACTIVE_V_EN	BIT(30)
> @@ -309,6 +332,22 @@ static void dpu_hw_intf_get_status(
>   	}
>   }
>   
> +static void dpu_hw_intf_v1_get_status(
> +		struct dpu_hw_intf *intf,
> +		struct intf_status *s)
> +{
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +
> +	s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
> +	if (s->is_en) {
> +		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> +		s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> +	} else {
> +		s->line_count = 0;
> +		s->frame_count = 0;
> +	}
> +}
> +
>   static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>   {
>   	struct dpu_hw_blk_reg_map *c;
> @@ -331,6 +370,161 @@ static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
>   	return dpu_hw_collect_misr(&intf->hw, INTF_MISR_CTRL, INTF_MISR_SIGNATURE, misr_value);
>   }
>   
> +static int dpu_hw_intf_setup_te_config(struct dpu_hw_intf *intf,
> +		struct dpu_hw_tear_check *te)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	int cfg;
> +
> +	if (!intf)
> +		return -EINVAL;
> +
> +	c = &intf->hw;
> +
> +	cfg = BIT(19); /* VSYNC_COUNTER_EN */
> +	if (te->hw_vsync_mode)
> +		cfg |= BIT(20);
> +
> +	cfg |= te->vsync_count;
> +
> +	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_VSYNC, cfg);
> +	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_HEIGHT, te->sync_cfg_height);
> +	DPU_REG_WRITE(c, INTF_TEAR_VSYNC_INIT_VAL, te->vsync_init_val);
> +	DPU_REG_WRITE(c, INTF_TEAR_RD_PTR_IRQ, te->rd_ptr_irq);
> +	DPU_REG_WRITE(c, INTF_TEAR_START_POS, te->start_pos);
> +	DPU_REG_WRITE(c, INTF_TEAR_SYNC_THRESH,
> +			((te->sync_threshold_continue << 16) |
> +			 te->sync_threshold_start));
> +	DPU_REG_WRITE(c, INTF_TEAR_SYNC_WRCOUNT,
> +			(te->start_pos + te->sync_threshold_start + 1));
> +
> +	return 0;
> +}
> +
> +static void dpu_hw_intf_setup_autorefresh_config(struct dpu_hw_intf *intf,
> +		u32 frame_count, bool enable)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 refresh_cfg;
> +
> +	c = &intf->hw;
> +	refresh_cfg = DPU_REG_READ(c, INTF_TEAR_AUTOREFRESH_CONFIG);
> +	if (enable)
> +		refresh_cfg = BIT(31) | frame_count;
> +	else
> +		refresh_cfg &= ~BIT(31);
> +
> +	DPU_REG_WRITE(c, INTF_TEAR_AUTOREFRESH_CONFIG, refresh_cfg);
> +}
> +
> +/*
> + * dpu_hw_intf_get_autorefresh_config - Get autorefresh config from HW
> + * @intf:        DPU intf structure
> + * @frame_count: Used to return the current frame count from hw
> + *
> + * Returns: True if autorefresh enabled, false if disabled.
> + */
> +static bool dpu_hw_intf_get_autorefresh_config(struct dpu_hw_intf *intf,
> +		u32 *frame_count)
> +{
> +	u32 val = DPU_REG_READ(&intf->hw, INTF_TEAR_AUTOREFRESH_CONFIG);
> +
> +	if (frame_count != NULL)
> +		*frame_count = val & 0xffff;
> +	return !!((val & BIT(31)) >> 31);
> +}
> +
> +static int dpu_hw_intf_poll_timeout_wr_ptr(struct dpu_hw_intf *intf,
> +		u32 timeout_us)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 val;
> +	int rc;
> +
> +	if (!intf)
> +		return -EINVAL;
> +
> +	c = &intf->hw;
> +	rc = readl_poll_timeout(c->blk_addr + INTF_TEAR_LINE_COUNT,
> +			val, (val & 0xffff) >= 1, 10, timeout_us);
> +
> +	return rc;
> +}
> +
> +static int dpu_hw_intf_enable_te(struct dpu_hw_intf *intf, bool enable)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +
> +	if (!intf)
> +		return -EINVAL;
> +
> +	c = &intf->hw;
> +	DPU_REG_WRITE(c, INTF_TEAR_TEAR_CHECK_EN, enable);
> +	return 0;
> +}
> +
> +static int dpu_hw_intf_connect_external_te(struct dpu_hw_intf *intf,
> +		bool enable_external_te)
> +{
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	u32 cfg;
> +	int orig;
> +
> +	if (!intf)
> +		return -EINVAL;
> +
> +	c = &intf->hw;
> +	cfg = DPU_REG_READ(c, INTF_TEAR_SYNC_CONFIG_VSYNC);
> +	orig = (bool)(cfg & BIT(20));
> +	if (enable_external_te)
> +		cfg |= BIT(20);
> +	else
> +		cfg &= ~BIT(20);
> +	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_VSYNC, cfg);
> +
> +	return orig;
> +}
> +
> +static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
> +		struct dpu_hw_pp_vsync_info *info)
> +{
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	u32 val;
> +
> +	if (!intf || !info)
> +		return -EINVAL;
> +
> +	c = &intf->hw;
> +
> +	val = DPU_REG_READ(c, INTF_TEAR_VSYNC_INIT_VAL);
> +	info->rd_ptr_init_val = val & 0xffff;
> +
> +	val = DPU_REG_READ(c, INTF_TEAR_INT_COUNT_VAL);
> +	info->rd_ptr_frame_count = (val & 0xffff0000) >> 16;
> +	info->rd_ptr_line_count = val & 0xffff;
> +
> +	val = DPU_REG_READ(c, INTF_TEAR_LINE_COUNT);
> +	info->wr_ptr_line_count = val & 0xffff;
> +
> +	val = DPU_REG_READ(c, INTF_FRAME_COUNT);
> +	info->intf_frame_count = val;
> +
> +	return 0;
> +}
> +
> +static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> +		u32 vsync_source)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +
> +	if (!intf)
> +		return;
> +
> +	c = &intf->hw;
> +
> +	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
> +}
> +
>   static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   		unsigned long cap)
>   {
> @@ -343,6 +537,18 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>   	ops->setup_misr = dpu_hw_intf_setup_misr;
>   	ops->collect_misr = dpu_hw_intf_collect_misr;
> +
> +	if (cap & BIT(DPU_INTF_TE)) {
> +		ops->setup_tearcheck = dpu_hw_intf_setup_te_config;
> +		ops->enable_tearcheck = dpu_hw_intf_enable_te;
> +		ops->connect_external_te = dpu_hw_intf_connect_external_te;
> +		ops->get_vsync_info = dpu_hw_intf_get_vsync_info;
> +		ops->setup_autorefresh = dpu_hw_intf_setup_autorefresh_config;
> +		ops->get_autorefresh = dpu_hw_intf_get_autorefresh_config;
> +		ops->poll_timeout_wr_ptr = dpu_hw_intf_poll_timeout_wr_ptr;
> +		ops->vsync_sel = dpu_hw_intf_vsync_sel;
> +		ops->get_status = dpu_hw_intf_v1_get_status;
> +	}
>   }
>   
>   struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 643dd10bc030..1521c9475fad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -60,6 +60,17 @@ struct intf_status {
>    *                     feed pixels to this interface
>    * @setup_misr: enable/disable MISR
>    * @collect_misr: read MISR signature
> + * @setup_tearcheck:            Enables vsync generation and sets up init value of read
> + *                              pointer and programs the tear check configuration
> + * @enable_tearcheck:           Enables tearcheck block
> + * @connect_external_te:        Read, modify, write to either set or clear listening to external TE
> + *                              Return: 1 if TE was originally connected, 0 if not, or -ERROR
> + * @get_vsync_info:             Provides the programmed and current line_count
> + * @setup_autorefresh:          Configure and enable the autorefresh config
> + * @get_autorefresh:            Retrieve autorefresh config from hardware
> + * @poll_timeout_wr_ptr:        Poll until write pointer transmission starts
> + *                              Return: 0 on success, -ETIMEDOUT on timeout
> + * @vsync_sel:                  Select vsync signal for tear-effect configuration
>    */
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -82,6 +93,24 @@ struct dpu_hw_intf_ops {
>   			const enum dpu_pingpong pp);
>   	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
>   	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
> +
> +	// Tearcheck on INTF since DPU 5.0.0
> +
> +	int (*setup_tearcheck)(struct dpu_hw_intf *intf, struct dpu_hw_tear_check *cfg);
> +
> +	int (*enable_tearcheck)(struct dpu_hw_intf *intf, bool enable);
> +
> +	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
> +
> +	int (*get_vsync_info)(struct dpu_hw_intf *intf, struct dpu_hw_pp_vsync_info *info);
> +
> +	void (*setup_autorefresh)(struct dpu_hw_intf *intf, u32 frame_count, bool enable);
> +
> +	bool (*get_autorefresh)(struct dpu_hw_intf *intf, u32 *frame_count);
> +
> +	int (*poll_timeout_wr_ptr)(struct dpu_hw_intf *intf, u32 timeout_us);
> +
> +	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
>   };
>   
>   struct dpu_hw_intf {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 64b2bf219a34..773579906961 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -494,12 +494,14 @@ struct dpu_hw_tear_check {
>    * @rd_ptr_frame_count: Num frames sent since enabling interface
>    * @rd_ptr_line_count:  Current line on panel (rd ptr)
>    * @wr_ptr_line_count:  Current line within pp fifo (wr ptr)
> + * @intf_frame_count:   Frames read from intf
>    */
>   struct dpu_hw_pp_vsync_info {
>   	u32 rd_ptr_init_val;
>   	u32 rd_ptr_frame_count;
>   	u32 rd_ptr_line_count;
>   	u32 wr_ptr_line_count;
> +	u32 intf_frame_count;
>   };
>   
>   #endif  /* _DPU_HW_MDSS_H */

-- 
With best wishes
Dmitry

