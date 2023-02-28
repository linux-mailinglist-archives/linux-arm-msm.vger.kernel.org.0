Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA796A5D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjB1QdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjB1QdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:33:15 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE9418A83
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677601990; x=1709137990;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KDl8nycTuTzYjqMG2woSdVN+pD+2iPSNMvBPwJxQDS8=;
  b=h5Khyz2s6dIwBgxq8i6dcqWhJK1qcO9AVl1Aros/eQiy7GUd/ZRMF+bR
   51p7Y+Ty60Y2J61AQzsw15TqI+lS2sN8+fLamM74Fp34Ae9soiC83vTZ0
   vRLZzG9hhbrw2Wbu9z+AmAA8OAVKX3ghiFILAfAPqVn+R8DgLsouERLi5
   7Us0IvrEsFh/u5lQG/BpAho7Bw894iO0Ft5uQLBjVVptgU2vo2fn8BmCC
   NGpiMamofIgACyOhZh4n+OWUU3oUDXPUqGGaMiRZ0+l//s8bqUDtpyz48
   BRos8dCRqNVNFo8j4075kDbWp3x0MWIIVxaJ7jvJ6ezmbqg7r4mr38UYJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331663822"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="331663822"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 08:33:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="783906019"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="783906019"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.26])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 08:33:06 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/10] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
In-Reply-To: <20230228113342.2051425-7-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-7-dmitry.baryshkov@linaro.org>
Date:   Tue, 28 Feb 2023 18:33:04 +0200
Message-ID: <87lekhyclb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The array of rc_parameters contains a mixture of parameters from DSC 1.1
> and DSC 1.2 standards. Split these tow configuration arrays in
> preparation to adding more configuration data.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 127 ++++++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>  include/drm/display/drm_dsc_helper.h      |   7 +-
>  3 files changed, 119 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index a6d11f474656..51794b40526a 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -326,11 +326,81 @@ struct rc_parameters_data {
>  
>  #define DSC_BPP(bpp)	((bpp) << 4)
>  
> +static const struct rc_parameters_data rc_parameters_pre_scr[] = {
> +{ DSC_BPP(8), 8,
> +	/* 8BPP/8BPC */

I still dislike this indentation...

> +	{ 512, 12, 6144, 3, 12, 11, 11, {
> +		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> +		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(8), 10,
> +	/* 8BPP/10BPC */
> +	{ 512, 12, 6144, 7, 16, 15, 15, {
> +		/*
> +		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
> +		 * VESA DSC 1.1 Table E-5 sets it to 4.
> +		 */
> +		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(8), 12,
> +	/* 8BPP/12BPC */
> +	{ 512, 12, 6144, 11, 20, 19, 19, {
> +		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
> +		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +		{ 21, 23, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(12), 8,
> +	/* 12BPP/8BPC */
> +	{ 341, 15, 2048, 3, 12, 11, 11, {
> +		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> +		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(12), 10,
> +	/* 12BPP/10BPC */
> +	{ 341, 15, 2048, 7, 16, 15, 15, {
> +		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
> +		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(12), 12,
> +	/* 12BPP/12BPC */
> +	{ 341, 15, 2048, 11, 20, 19, 19, {
> +		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
> +		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +		{ 21, 23, -12 }
> +		}
> +	}
> +},
> +{ /* sentinel */ }
> +};
> +
>  /*
>   * Selected Rate Control Related Parameter Recommended Values
>   * from DSC_v1.11 spec & C Model release: DSC_model_20161212
>   */
> -static const struct rc_parameters_data rc_parameters[] = {
> +static const struct rc_parameters_data rc_parameters_1_2_444[] = {
>  { DSC_BPP(6), 8,
>  	/* 6BPP/8BPC */
>  	{ 768, 15, 6144, 3, 13, 11, 11, {
> @@ -390,22 +460,18 @@ static const struct rc_parameters_data rc_parameters[] = {
>  	{ 512, 12, 6144, 3, 12, 11, 11, {
>  		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> -		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
> +		{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
>  		}
>  	}
>  },
>  { DSC_BPP(8), 10,
>  	/* 8BPP/10BPC */
>  	{ 512, 12, 6144, 7, 16, 15, 15, {
> -		/*
> -		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
> -		 * VESA DSC 1.1 Table E-5 sets it to 4.
> -		 */
> -		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +		{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>  		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
> +		{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
>  		}
>  	}
>  },
> @@ -414,9 +480,9 @@ static const struct rc_parameters_data rc_parameters[] = {
>  	{ 512, 12, 6144, 11, 20, 19, 19, {
>  		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>  		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -		{ 21, 23, -12 }
> +		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
> +		{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
> +		{ 20, 21, -12 }
>  		}
>  	}
>  },
> @@ -500,8 +566,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>  	{ 341, 15, 2048, 3, 12, 11, 11, {
>  		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
> -		{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
> +		{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
>  		}
>  	}
>  },
> @@ -510,8 +576,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>  	{ 341, 15, 2048, 7, 16, 15, 15, {
>  		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>  		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
> +		{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
>  		}
>  	}
>  },
> @@ -520,9 +586,9 @@ static const struct rc_parameters_data rc_parameters[] = {
>  	{ 341, 15, 2048, 11, 20, 19, 19, {
>  		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>  		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -		{ 21, 23, -12 }
> +		{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
> +		{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
> +		{ 18, 19, -12 }
>  		}
>  	}
>  },
> @@ -604,7 +670,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>  { /* sentinel */ }
>  };
>  
> -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
> +static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
> +						 u16 dsc_bpp,
>  						 u8 bits_per_component)
>  {
>  	int i;
> @@ -622,13 +689,27 @@ static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
>   * accordance with the DSC 1.1 or 1.2 specification and DSC C Model
>   *
>   * @vdsc_cfg: DSC Configuration data partially filled by driver
> + * @kind: operating mode and standard to follow
>   */
> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind)
>  {
> +	const struct rc_parameters_data *data;
>  	const struct rc_parameters *rc_params;
>  	int i;
>  
> -	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
> +	switch (kind) {
> +	case DRM_DSC_1_2_444:
> +		data = rc_parameters_1_2_444;
> +		break;
> +	case DRM_DSC_1_1_PRE_SCR:
> +		data = rc_parameters_pre_scr;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rc_params = get_rc_params(data,
> +				  vdsc_cfg->bits_per_pixel,
>  				  vdsc_cfg->bits_per_component);
>  	if (!rc_params)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 1ee8d13c9d64..4d220d24fa73 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -156,7 +156,15 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	if (DISPLAY_VER(dev_priv) >= 13) {
>  		calculate_rc_params(vdsc_cfg);
>  	} else {
> -		ret = drm_dsc_setup_rc_params(vdsc_cfg);
> +		if ((compressed_bpp == 8 ||
> +		     compressed_bpp == 12) &&
> +		    (vdsc_cfg->bits_per_pixel == 8 ||
> +		     vdsc_cfg->bits_per_pixel == 10 ||
> +		     vdsc_cfg->bits_per_pixel == 12))
> +			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_1_PRE_SCR);
> +		else
> +			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_2_444);
> +
>  		if (ret)
>  			return ret;
>  
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 1681791f65a5..c634bb2935d3 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -10,12 +10,17 @@
>  
>  #include <drm/display/drm_dsc.h>
>  
> +enum drm_dsc_params_kind {
> +	DRM_DSC_1_2_444,
> +	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
> +};
> +
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);
>  void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
>  #endif /* _DRM_DSC_HELPER_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
