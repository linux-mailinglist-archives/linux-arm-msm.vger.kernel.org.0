Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CA370B92C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 11:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjEVJiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 05:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjEVJiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 05:38:11 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA488139
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684748263; x=1716284263;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=WFvO+9FcvlRH0vg9/maiDOK1v6r6UcosEKsoxcaaaxg=;
  b=TiD6Fd5MxGtIMtvb/Y6U6MQ47bH1Dlop1yRN72kKergLkyomNqATRHhX
   Y0KF/k28NUX7KZqkRmoBJtPSoMR/2cDxehDnJEwNX66Xn6d2Z3xNPG3Dy
   1H3VyAtfsKjrm7kyLyxkfKJKmfhNd9yEv4WvN4zNbMriKNmX1xd3gDxj8
   p8tPgFsFx+Dd3rBQzHgiiE8oKuXXF15Fb9YB/fEyC+tGsFNUg1HHvOfYP
   9FTGCFymMl+8Gabt701i8oUdO50rqimFwJ4o2xQqU7FGZtaB8+29wX1Ht
   +1zU4nAUI+RGFYFuydmNud+I//DAO5JX4qon3mPYnxsFZsU5AlwpRI5S1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416336682"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="416336682"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="847777256"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="847777256"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.54.228])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:37:28 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
Date:   Mon, 22 May 2023 12:37:26 +0300
Message-ID: <875y8kogfd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 May 2023, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index fc2104415dcb..753b0034eda7 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> +}
> +
> +static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}

kernel-doc? Maybe make them regular functions instead of static inline?

BR,
Jani.

> +
>  #endif /* _DRM_DSC_HELPER_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
