Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B077073E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 23:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjEQVSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 17:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjEQVSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 17:18:09 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609A17ED5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:17:45 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 08A3B3F7F8;
        Wed, 17 May 2023 23:15:38 +0200 (CEST)
Date:   Wed, 17 May 2023 23:15:36 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v11 2/9] drm/display/dsc: add helper to set semi-const
 parameters
Message-ID: <zdu5ygvokqjdcqzeajt5dpsxrpf5j3ine3grjf7mvmu4he25vj@qywiv5kyon45>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-2-30270e1eeac3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-2-30270e1eeac3@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-17 11:51:11, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add a helper setting config values which are typically constant across
> operating modes (table E-4 of the standard) and mux_word_size (which is
> a const according to 3.5.2).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 22 ++++++++++++++++++++++
>  include/drm/display/drm_dsc_helper.h     |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index 65e810a54257..b9c4e10ced41 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -270,6 +270,28 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  }
>  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>  
> +/**
> + * drm_dsc_set_const_params() - Set DSC parameters considered typically
> + * constant across operation modes
> + *
> + * @vdsc_cfg:
> + * DSC Configuration data partially filled by driver
> + */
> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg)
> +{
> +	if (!vdsc_cfg->rc_model_size)
> +		vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
> +	vdsc_cfg->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
> +	vdsc_cfg->rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST;
> +	vdsc_cfg->rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST;
> +
> +	if (vdsc_cfg->bits_per_component <= 10)
> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +	else
> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
> +}
> +EXPORT_SYMBOL(drm_dsc_set_const_params);
> +
>  /* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>  static const u16 drm_dsc_rc_buf_thresh[] = {
>  	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 528dfb5e25fc..ea99b0b90674 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -21,6 +21,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);
> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg);
>  void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);

Dmitry changed this to `type` in "drm/i915: move DSC RC tables to
drm_dsc_helper.c" v6/7, hope that's not going to give context conflicts
on a strict apply/merge.

- Marijn

>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> 
> -- 
> 2.40.1
> 
