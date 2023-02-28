Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9804B6A58F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 13:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjB1MZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 07:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjB1MZI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 07:25:08 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E9E2A6F9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 04:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677587107; x=1709123107;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=UcW9L9D8QR0mMBNIpMxNQ+qVeLDD7cewz3A/ZJ0bFAA=;
  b=DfgAnUrd74Lu2LKrW/5R3CvDuIOm0/1myXEBfsE5+s5NvNf9ZNBfWrFR
   PsqpFy5s5GyIXwKd1RN4ZqDaFXhwkKyiW4y4soN3lgPZSbHavrJbhBqTI
   Ko77hBnzzfzT19q0b5ICwPoTC6BgkHVbW/ezKrm8nKAUguXSBN01F3Cej
   4i1JJAUn1E12DnlfPl85LGgPwyHJd1RHRthj5z7EiUeSPGjIAphLZ9FhN
   JDhiwJKHVvwdQ5sfNBgJMbSnQ1uzHFr9/lXMtknlNDgpVnZH2hitpkGW3
   fD2x8WMb9QIDK9sIj+NIhwPxFOzY9QlyCl+NjBlr9fkfj28pAcfR+Y+EM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317921570"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="317921570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 04:25:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1003221191"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="1003221191"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.26])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 04:25:02 -0800
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
Subject: Re: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
In-Reply-To: <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
Date:   Tue, 28 Feb 2023 14:24:59 +0200
Message-ID: <87mt4yyo2s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The rc_buf_thresh values are common to all DSC implementations. Move
> them to the common helper together with the code to propagage them to
> the drm_dsc_config.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
>  include/drm/display/drm_dsc_helper.h      |  1 +
>  3 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index c869c6e51e2b..ab8679c158b5 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  }
>  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>  
> +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> +const u16 drm_dsc_rc_buf_thresh[] = {
> +	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> +	7744, 7872, 8000, 8064
> +};
> +EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);

This needs to be static, without exports.

> +
> +/**
> + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
> + * in accordance with the DSC 1.2 specification.
> + *
> + * @vdsc_cfg: DSC Configuration data partially filled by driver
> + */
> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
> +{
> +	int i = 0;

Unnecessary initialization.

> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {

Please use ARRAY_SIZE(). Maybe add BUILD_BUG_ON() for DSC_NUM_BUF_RANGES
vs. ARRAY_SIZE(). (Yes, we should've used ARRAY_SIZE() in i915.)

> +		/*
> +		 * six 0s are appended to the lsb of each threshold value
> +		 * internally in h/w.
> +		 * Only 8 bits are allowed for programming RcBufThreshold
> +		 */
> +		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
> +	}
> +
> +	/*
> +	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> +	 * as per C Model
> +	 */
> +	if (vdsc_cfg->bits_per_pixel == 6 << 4) {
> +		vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
> +		vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
> +
>  /**
>   * drm_dsc_compute_rc_parameters() - Write rate control
>   * parameters to the dsc configuration defined in
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index d080741fd0b3..b4faab4c8fb3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
>  	MAX_COLUMN_INDEX
>  };
>  
> -/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> -static const u16 rc_buf_thresh[] = {
> -	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> -	7744, 7872, 8000, 8064
> -};
> -
>  struct rc_parameters {
>  	u16 initial_xmit_delay;
>  	u8 first_line_bpg_offset;
> @@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
>  	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
>  
> -	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> -		/*
> -		 * six 0s are appended to the lsb of each threshold value
> -		 * internally in h/w.
> -		 * Only 8 bits are allowed for programming RcBufThreshold
> -		 */
> -		vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
> -	}
> -
> -	/*
> -	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> -	 * as per C Model
> -	 */
> -	if (compressed_bpp == 6) {
> -		vdsc_cfg->rc_buf_thresh[12] = 0x7C;
> -		vdsc_cfg->rc_buf_thresh[13] = 0x7D;
> -	}
> +	drm_dsc_set_rc_buf_thresh(vdsc_cfg);
>  
>  	/*
>  	 * From XE_LPD onwards we supports compression bpps in steps of 1
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 8b41edbbabab..706ba1d34742 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);
> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
>  #endif /* _DRM_DSC_HELPER_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
