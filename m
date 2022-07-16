Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A903576D4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 12:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiGPKaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 06:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGPKai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 06:30:38 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C4B6584
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 03:30:36 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 824253F778;
        Sat, 16 Jul 2022 12:30:33 +0200 (CEST)
Date:   Sat, 16 Jul 2022 12:30:31 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: use drm_dsc_config instead of
 msm_display_dsc_config
Message-ID: <20220716103031.qdmoywixofu3xzb6@SoMainline.org>
References: <20220711100432.455268-1-dmitry.baryshkov@linaro.org>
 <20220711100432.455268-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711100432.455268-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-07-11 13:04:31, Dmitry Baryshkov wrote:
> There is no need to use the struct msm_display_dsc_config wrapper inside
> the dpu driver, use the struct drm_dsc_config directly to pass pps data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 +++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 74 ++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |  4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>  5 files changed, 54 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c682d4e02d1b..07b22b7df2e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -162,7 +162,7 @@ enum dpu_enc_rc_states {
>   * @vsync_event_work:		worker to handle vsync event for autorefresh
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
> - * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
> + * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> @@ -208,7 +208,7 @@ struct dpu_encoder_virt {
>  	bool wide_bus_en;
>  
>  	/* DSC configuration */
> -	struct msm_display_dsc_config *dsc;
> +	struct drm_dsc_config *dsc;
>  };
>  
>  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -1791,12 +1791,12 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>  }
>  
>  static u32
> -dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
> +dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>  				  u32 enc_ip_width)
>  {
>  	int ssm_delay, total_pixels, soft_slice_per_enc;
>  
> -	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
> +	soft_slice_per_enc = enc_ip_width / dsc->slice_width;
>  
>  	/*
>  	 * minimum number of initial line pixels is a sum of:
> @@ -1808,16 +1808,16 @@ dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
>  	 * 5. 6 additional pixels as the output of the rate buffer is
>  	 *    48 bits wide
>  	 */
> -	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
> -	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
> +	ssm_delay = ((dsc->bits_per_component < 10) ? 84 : 92);
> +	total_pixels = ssm_delay * 3 + dsc->initial_xmit_delay + 47;
>  	if (soft_slice_per_enc > 1)
>  		total_pixels += (ssm_delay * 3);
> -	return DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
> +	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>  }
>  
>  static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  				     struct dpu_hw_pingpong *hw_pp,
> -				     struct msm_display_dsc_config *dsc,
> +				     struct drm_dsc_config *dsc,
>  				     u32 common_mode,
>  				     u32 initial_lines)
>  {
> @@ -1835,7 +1835,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  }
>  
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> -				 struct msm_display_dsc_config *dsc)
> +				 struct drm_dsc_config *dsc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> @@ -1858,14 +1858,15 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  		}
>  	}
>  
> -	pic_width = dsc->drm->pic_width;
> +	dsc_common_mode = 0;
> +	pic_width = dsc->pic_width;
>  
>  	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>  	if (enc_master->intf_mode == INTF_MODE_VIDEO)
>  		dsc_common_mode |= DSC_MODE_VIDEO;
>  
> -	this_frame_slices = pic_width / dsc->drm->slice_width;
> -	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
> +	this_frame_slices = pic_width / dsc->slice_width;
> +	intf_ip_w = this_frame_slices * dsc->slice_width;
>  
>  	/*
>  	 * dsc merge case: when using 2 encoders for the same stream,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index d4d1ecd416e3..9e7236ef34e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -36,7 +36,7 @@ struct msm_display_info {
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
>  	bool is_te_using_watchdog_timer;
> -	struct msm_display_dsc_config *dsc;
> +	struct drm_dsc_config *dsc;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 184a1b27b13d..20a033cd323d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -37,7 +37,7 @@ static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
>  }
>  
>  static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
> -			      struct msm_display_dsc_config *dsc,
> +			      struct drm_dsc_config *dsc,
>  			      u32 mode,
>  			      u32 initial_lines)
>  {
> @@ -52,89 +52,89 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	if (is_cmd_mode)
>  		initial_lines += 1;
>  
> -	slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
> +	slice_last_group_size = 3 - (dsc->slice_width % 3);
>  	data = (initial_lines << 20);
>  	data |= ((slice_last_group_size - 1) << 18);
>  	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> -	data |= dsc->drm->bits_per_pixel << 12;
> -	lsb = dsc->drm->bits_per_pixel % 4;
> -	bpp = dsc->drm->bits_per_pixel / 4;
> +	data |= dsc->bits_per_pixel << 12;
> +	lsb = dsc->bits_per_pixel % 4;
> +	bpp = dsc->bits_per_pixel / 4;
>  	bpp *= 4;
>  	bpp <<= 4;
>  	bpp |= lsb;
>  
>  	data |= bpp << 8;
> -	data |= (dsc->drm->block_pred_enable << 7);
> -	data |= (dsc->drm->line_buf_depth << 3);
> -	data |= (dsc->drm->simple_422 << 2);
> -	data |= (dsc->drm->convert_rgb << 1);
> -	data |= dsc->drm->bits_per_component;
> +	data |= (dsc->block_pred_enable << 7);
> +	data |= (dsc->line_buf_depth << 3);
> +	data |= (dsc->simple_422 << 2);
> +	data |= (dsc->convert_rgb << 1);
> +	data |= dsc->bits_per_component;
>  
>  	DPU_REG_WRITE(c, DSC_ENC, data);
>  
> -	data = dsc->drm->pic_width << 16;
> -	data |= dsc->drm->pic_height;
> +	data = dsc->pic_width << 16;
> +	data |= dsc->pic_height;
>  	DPU_REG_WRITE(c, DSC_PICTURE, data);
>  
> -	data = dsc->drm->slice_width << 16;
> -	data |= dsc->drm->slice_height;
> +	data = dsc->slice_width << 16;
> +	data |= dsc->slice_height;
>  	DPU_REG_WRITE(c, DSC_SLICE, data);
>  
> -	data = dsc->drm->slice_chunk_size << 16;
> +	data = dsc->slice_chunk_size << 16;
>  	DPU_REG_WRITE(c, DSC_CHUNK_SIZE, data);
>  
> -	data = dsc->drm->initial_dec_delay << 16;
> -	data |= dsc->drm->initial_xmit_delay;
> +	data = dsc->initial_dec_delay << 16;
> +	data |= dsc->initial_xmit_delay;
>  	DPU_REG_WRITE(c, DSC_DELAY, data);
>  
> -	data = dsc->drm->initial_scale_value;
> +	data = dsc->initial_scale_value;
>  	DPU_REG_WRITE(c, DSC_SCALE_INITIAL, data);
>  
> -	data = dsc->drm->scale_decrement_interval;
> +	data = dsc->scale_decrement_interval;
>  	DPU_REG_WRITE(c, DSC_SCALE_DEC_INTERVAL, data);
>  
> -	data = dsc->drm->scale_increment_interval;
> +	data = dsc->scale_increment_interval;
>  	DPU_REG_WRITE(c, DSC_SCALE_INC_INTERVAL, data);
>  
> -	data = dsc->drm->first_line_bpg_offset;
> +	data = dsc->first_line_bpg_offset;
>  	DPU_REG_WRITE(c, DSC_FIRST_LINE_BPG_OFFSET, data);
>  
> -	data = dsc->drm->nfl_bpg_offset << 16;
> -	data |= dsc->drm->slice_bpg_offset;
> +	data = dsc->nfl_bpg_offset << 16;
> +	data |= dsc->slice_bpg_offset;
>  	DPU_REG_WRITE(c, DSC_BPG_OFFSET, data);
>  
> -	data = dsc->drm->initial_offset << 16;
> -	data |= dsc->drm->final_offset;
> +	data = dsc->initial_offset << 16;
> +	data |= dsc->final_offset;
>  	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>  
> -	det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
> +	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
>  	data = det_thresh_flatness << 10;
> -	data |= dsc->drm->flatness_max_qp << 5;
> -	data |= dsc->drm->flatness_min_qp;
> +	data |= dsc->flatness_max_qp << 5;
> +	data |= dsc->flatness_min_qp;
>  	DPU_REG_WRITE(c, DSC_FLATNESS, data);
>  
> -	data = dsc->drm->rc_model_size;
> +	data = dsc->rc_model_size;
>  	DPU_REG_WRITE(c, DSC_RC_MODEL_SIZE, data);
>  
> -	data = dsc->drm->rc_tgt_offset_low << 18;
> -	data |= dsc->drm->rc_tgt_offset_high << 14;
> -	data |= dsc->drm->rc_quant_incr_limit1 << 9;
> -	data |= dsc->drm->rc_quant_incr_limit0 << 4;
> -	data |= dsc->drm->rc_edge_factor;
> +	data = dsc->rc_tgt_offset_low << 18;
> +	data |= dsc->rc_tgt_offset_high << 14;
> +	data |= dsc->rc_quant_incr_limit1 << 9;
> +	data |= dsc->rc_quant_incr_limit0 << 4;
> +	data |= dsc->rc_edge_factor;
>  	DPU_REG_WRITE(c, DSC_RC, data);
>  }
>  
>  static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
> -				     struct msm_display_dsc_config *dsc)
> +				     struct drm_dsc_config *dsc)
>  {
> -	struct drm_dsc_rc_range_parameters *rc = dsc->drm->rc_range_params;
> +	struct drm_dsc_rc_range_parameters *rc = dsc->rc_range_params;
>  	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
>  	u32 off;
>  	int i;
>  
>  	off = DSC_RC_BUF_THRESH;
>  	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++) {
> -		DPU_REG_WRITE(c, off, dsc->drm->rc_buf_thresh[i]);
> +		DPU_REG_WRITE(c, off, dsc->rc_buf_thresh[i]);
>  		off += 4;
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 45e4118f1fa2..c0b77fe1a696 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -31,7 +31,7 @@ struct dpu_hw_dsc_ops {
>  	 * @initial_lines: amount of initial lines to be used
>  	 */
>  	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
> -			   struct msm_display_dsc_config *dsc,
> +			   struct drm_dsc_config *dsc,
>  			   u32 mode,
>  			   u32 initial_lines);
>  
> @@ -41,7 +41,7 @@ struct dpu_hw_dsc_ops {
>  	 * @dsc: panel dsc parameters
>  	 */
>  	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
> -				  struct msm_display_dsc_config *dsc);
> +				  struct drm_dsc_config *dsc);
>  };
>  
>  struct dpu_hw_dsc {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 75ed2b36e1b3..8016d0a3aade 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -585,7 +585,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  		info.h_tile_instance[info.num_of_h_tiles++] = i;
>  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>  
> -		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
> +		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i])->drm;
>  
>  		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>  			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
> -- 
> 2.35.1
> 
> 
> 
