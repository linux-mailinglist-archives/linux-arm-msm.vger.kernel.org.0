Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAD37075A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 00:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjEQWxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 18:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjEQWxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 18:53:49 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CDC5B9A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 15:53:47 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 188E520313;
        Thu, 18 May 2023 00:53:46 +0200 (CEST)
Date:   Thu, 18 May 2023 00:53:44 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 8/8] drm/msm/dpu: tear down DSC data path when DSC
 disabled
Message-ID: <ydojobluzb4cujqzd5wjztj42h625sx3x2dbqrmvzf2lxnpum5@guk7gzkc7bht>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-9-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684360919-28458-9-git-send-email-quic_khsieh@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Title: Tear down DSC datapath* on encoder cleanup*

On 2023-05-17 15:01:59, Kuogee Hsieh wrote:
> Unset DSC_ACTIVE bit at dpu_hw_ctl_reset_intf_cfg_v1(),
> dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() functions
> to tear down DSC data path if DSC data path was setup previous.
> 
> Changes in V10:
> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
> -- move both dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() to above phys_cleanup()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 ++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1957545..ec2a55a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2036,6 +2036,41 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>  	}
>  }
>  
> +static void dpu_encoder_dsc_pipe_clr(struct dpu_hw_ctl *ctl,
> +				     struct dpu_hw_dsc *hw_dsc,
> +				     struct dpu_hw_pingpong *hw_pp)
> +{
> +	if (hw_dsc->ops.dsc_disable)
> +		hw_dsc->ops.dsc_disable(hw_dsc);
> +
> +	if (hw_pp->ops.disable_dsc)
> +		hw_pp->ops.disable_dsc(hw_pp);
> +
> +	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, PINGPONG_NONE);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> +}
> +
> +static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (hw_pp[i] && hw_dsc[i])
> +			dpu_encoder_dsc_pipe_clr(ctl, hw_dsc[i], hw_pp[i]);
> +	}
> +}
> +
>  void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  {
>  	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
> @@ -2086,8 +2121,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  					phys_enc->hw_pp->merge_3d->idx);
>  	}
>  
> +	if (dpu_enc->dsc)
> +		dpu_encoder_unprep_dsc(dpu_enc);
> +
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>  
>  	if (phys_enc->hw_intf)
>  		intf_cfg.intf = phys_enc->hw_intf->idx;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4e132d9..2663626 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -578,6 +578,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	u32 intf_active = 0;
>  	u32 wb_active = 0;
>  	u32 merge3d_active = 0;
> +	u32 dsc_active;
>  
>  	/*
>  	 * This API resets each portion of the CTL path namely,
> @@ -607,6 +608,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  		wb_active &= ~BIT(cfg->wb - WB_0);
>  		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>  	}
> +
> +	if (cfg->dsc) {
> +		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +		dsc_active &= ~cfg->dsc;
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> +	}
>  }
>  
>  static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> -- 
> 2.7.4
> 
