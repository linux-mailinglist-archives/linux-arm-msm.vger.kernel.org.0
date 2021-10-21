Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15608436D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 00:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhJUWZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 18:25:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48314 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhJUWZI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 18:25:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634854972; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DKdN4kS4XquW39kHKwreYKB02Rjb2DhCf+ANkMaF5Bg=;
 b=j48MWBAjO2uA8fNkUZM1qg5iZuuwXvSuHtnvFJzSkfyCXZSrcLk09B/LafhvmM8oWub2TSWL
 rA5FtpvhbY1EfUOGhT12eSb/Jna4i1PAqZqyzMNIyfY5b4/KBmvVnltUMN00y1ELs4V63baE
 lABmIB6SXq/IG9XMKIhum3Dw8Jo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6171e815308e0dd330b1186b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:22:13
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6340C43619; Thu, 21 Oct 2021 22:22:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BC42C4338F;
        Thu, 21 Oct 2021 22:22:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 15:22:11 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 01/11] drm/msm/dpu: move LUT levels out of QOS
 config
In-Reply-To: <20210930140002.308628-2-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-2-dmitry.baryshkov@linaro.org>
Message-ID: <b593436bc0024f98312a2d2157bb5a44@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> LUT levels are setup outside of setup_qos_ctrl, so remove them from the
> struct dpu_hw_pipe_qos_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 15 ++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 ++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++++++-----------
>  3 files changed, 20 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 69eed7932486..cbafb61404d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -569,19 +569,20 @@ static void dpu_hw_sspp_setup_solidfill(struct
> dpu_hw_pipe *ctx, u32 color, enum
>  }
> 
>  static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_qos_cfg *cfg)
> +			u32 danger_lut,
> +			u32 safe_lut)
>  {
>  	u32 idx;
> 
>  	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>  		return;
> 
> -	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, cfg->danger_lut);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, cfg->safe_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, danger_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
>  }
> 
>  static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_qos_cfg *cfg)
> +			u64 creq_lut)
>  {
>  	u32 idx;
> 
> @@ -589,11 +590,11 @@ static void dpu_hw_sspp_setup_creq_lut(struct
> dpu_hw_pipe *ctx,
>  		return;
> 
>  	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, cfg->creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, creq_lut);
>  		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1 + idx,
> -				cfg->creq_lut >> 32);
> +				creq_lut >> 32);
>  	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, cfg->creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, creq_lut);
>  	}
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index fdfd4b46e2c6..27263bc1a1ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -166,18 +166,12 @@ struct dpu_hw_pipe_cfg {
> 
>  /**
>   * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
> - * @danger_lut: LUT for generate danger level based on fill level
> - * @safe_lut: LUT for generate safe level based on fill level
> - * @creq_lut: LUT for generate creq level based on fill level
>   * @creq_vblank: creq value generated to vbif during vertical blanking
>   * @danger_vblank: danger value generated during vertical blanking
>   * @vblank_en: enable creq_vblank and danger_vblank during vblank
>   * @danger_safe_en: enable danger safe generation
>   */
>  struct dpu_hw_pipe_qos_cfg {
> -	u32 danger_lut;
> -	u32 safe_lut;
> -	u64 creq_lut;
>  	u32 creq_vblank;
>  	u32 danger_vblank;
>  	bool vblank_en;
> @@ -302,20 +296,22 @@ struct dpu_hw_sspp_ops {
>  	/**
>  	 * setup_danger_safe_lut - setup danger safe LUTs
>  	 * @ctx: Pointer to pipe context
> -	 * @cfg: Pointer to pipe QoS configuration
> +	 * @danger_lut: LUT for generate danger level based on fill level
> +	 * @safe_lut: LUT for generate safe level based on fill level
>  	 *
>  	 */
>  	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_qos_cfg *cfg);
> +			u32 danger_lut,
> +			u32 safe_lut);
> 
>  	/**
>  	 * setup_creq_lut - setup CREQ LUT
>  	 * @ctx: Pointer to pipe context
> -	 * @cfg: Pointer to pipe QoS configuration
> +	 * @creq_lut: LUT for generate creq level based on fill level
>  	 *
>  	 */
>  	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_qos_cfg *cfg);
> +			u64 creq_lut);
> 
>  	/**
>  	 * setup_qos_ctrl - setup QoS control
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c989621209aa..5e0d06f26e53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -348,8 +348,6 @@ static void _dpu_plane_set_qos_lut(struct drm_plane 
> *plane,
>  	qos_lut = _dpu_plane_get_qos_lut(
>  			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
> 
> -	pdpu->pipe_qos_cfg.creq_lut = qos_lut;
> -
>  	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
>  			(fmt) ? fmt->base.pixel_format : 0,
>  			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
> @@ -359,7 +357,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane 
> *plane,
>  			fmt ? (char *)&fmt->base.pixel_format : NULL,
>  			pdpu->is_rt_pipe, total_fl, qos_lut);
> 
> -	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, 
> &pdpu->pipe_qos_cfg);
> +	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
>  }
> 
>  /**
> @@ -397,24 +395,21 @@ static void _dpu_plane_set_danger_lut(struct
> drm_plane *plane,
>  		}
>  	}
> 
> -	pdpu->pipe_qos_cfg.danger_lut = danger_lut;
> -	pdpu->pipe_qos_cfg.safe_lut = safe_lut;
> -
>  	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
>  			(fmt) ? fmt->base.pixel_format : 0,
>  			(fmt) ? fmt->fetch_mode : 0,
> -			pdpu->pipe_qos_cfg.danger_lut,
> -			pdpu->pipe_qos_cfg.safe_lut);
> +			danger_lut,
> +			safe_lut);
> 
>  	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 
> 0x%x]\n",
>  		pdpu->pipe - SSPP_VIG0,
>  		fmt ? (char *)&fmt->base.pixel_format : NULL,
>  		fmt ? fmt->fetch_mode : -1,
> -		pdpu->pipe_qos_cfg.danger_lut,
> -		pdpu->pipe_qos_cfg.safe_lut);
> +		danger_lut,
> +		safe_lut);
> 
>  	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
> -			&pdpu->pipe_qos_cfg);
> +			danger_lut, safe_lut);
>  }
> 
>  /**
