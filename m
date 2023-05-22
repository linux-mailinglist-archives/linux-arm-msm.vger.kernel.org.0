Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F016270B907
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 11:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjEVJfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 05:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjEVJfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 05:35:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F0FAF
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684748140; x=1716284140;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2yLoCurvsm+Am4n+8Po4obmzXAOhFU5SVLIQzAYdKM4=;
  b=WjdHPb5xUaSiuLlWHNh0XLM+cZ19XJ+JzPDSiTdgxNzkizhxO6llWPmN
   hS/oroawmLQJk3oTEwGzGUiqnbW/yojhPZQ+kFeLm2BgXgMzf+fDJfh38
   TMMGQV41CB+g/ZtB3SPhTpBMZV+NHrJFFM4sqnaomTd4I5xQPtXPjYNgd
   PoGVuF8E7JqS1La6kam000UP0VLXMM1SbgsskgWCGurBeRT5dMrLVXng7
   JHXV9HEfrLPJ5SJI9/d0le107ZRWk6xB8d5bK94olHDWl7vubPGO9pqU2
   xBzd+mwAVJ3F5402WJVitXuky06yNUIUsarcgnNMaCEUYdDUYBEe9ZYBZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351722752"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="351722752"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="734201147"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="734201147"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.54.228])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:35:35 -0700
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
Subject: Re: [PATCH v12 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Date:   Mon, 22 May 2023 12:35:33 +0300
Message-ID: <87a5xwogii.fsf@intel.com>
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
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/display/drm_dsc_helper.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index e0cbc38ada26..7bf7e8ff8eb4 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -9,6 +9,7 @@
>  #define DRM_DSC_HELPER_H_
>  
>  #include <drm/display/drm_dsc.h>
> +#include <linux/bug.h>

Seems like a small thing, adding static inlines in headers usually leads
to more header dependencies like this, and gradually slows down build.

Does it need to be a static inline?

BR,
Jani.

>  
>  enum drm_dsc_params_type {
>  	DRM_DSC_1_2_444,
> @@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *dsc)
> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
>  static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>  {
>  	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);

-- 
Jani Nikula, Intel Open Source Graphics Center
