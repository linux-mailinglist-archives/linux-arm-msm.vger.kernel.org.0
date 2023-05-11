Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76C96FF180
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 14:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbjEKMaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 08:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbjEKMay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 08:30:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2D6198C
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683808254; x=1715344254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M5r4I8zzSsceCqKbpdOjv0skHgUUayzExsp2nd1tp4U=;
  b=BsMeWmgqV8oxJZkdpwQG3jwuIbGcYUBotfqYFwQWJ9XokIztlEiHG1xe
   5lI7ixEUybdJQMzFCUV9FC+njb0eaVf0w6VX4haIdrfiCuD+Kkca4VgXF
   Jyi8H6gC4M0WfATDcjyHNt9kp5V+grVhrdzN3BPlKHXwpL6GeZ/ZbopOp
   GvMKyDDmrgYHPXAn5cXeLhyj4fK9QFt/X0PP33Bybeno559HuilGWPQ9g
   ISl0GZD6ORZ57/WXJzi59rVSSVApQpacg8nGTL5N65z+lGZpWOkFqqzyd
   KS7JbAzkH1fEd8M+PJaUUSeA/TdxtP9pyCiSli1y+w1GRHlPk4D1lrDf7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347955793"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="347955793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 05:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811575114"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="811575114"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
  by fmsmga002.fm.intel.com with SMTP; 11 May 2023 05:30:50 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 11 May 2023 15:30:49 +0300
Date:   Thu, 11 May 2023 15:30:49 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v9 1/8] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <ZFzf-firnfYKwmy1@intel.com>
References: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v9-1-87daeaec2c0a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329-rfc-msm-dsc-helper-v9-1-87daeaec2c0a@quicinc.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 10, 2023 at 03:54:41PM -0700, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/display/drm_dsc_helper.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 0bb0c3afd740..422135a33d65 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -25,5 +25,16 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline void drm_dsc_set_initial_scale_value(struct drm_dsc_config *dsc)
> +{
> +	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> +		(dsc->rc_model_size - dsc->initial_offset);
> +}

I would suggest using pure functions whenever possible. Makes it much
easier to reason about the code when you know there are no side effects.

> +
> +static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)

'dsc' can be const. The word "calculate" seems pretty much redundant.

> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}
> +
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1

-- 
Ville Syrjälä
Intel
