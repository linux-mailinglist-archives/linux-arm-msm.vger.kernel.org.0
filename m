Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A12702819
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239520AbjEOJQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbjEOJPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:15:39 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF643583
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684141929; x=1715677929;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=dhM3m8vOuQXUzo4VYwSqzWC32+ahxslyhibsQL5kqac=;
  b=nF4GQu+oGFtXWGq9WHOcsZlQI5jBI5M96KV4/z0llwHMLmYZ69DIzHDv
   7RA14yocLl8yPce9epiKp7HXRPXlg021ugN2wPyF18fm+c86QLW+CuDl0
   Yv/DQCS74fPuZm3oSdNpPqREnDWM+EoY0tFMKx2w7RTULzDyKGOc+kmZE
   jkx6KO3ScFX06WOlSfbGav8uqu7wGbhkJETrIO7q89zIxOmrZEPe8S6GP
   1QMjQGCBIQePVvqLz4kDuKGz3huowmc5ZM1L7tN/BMyHQNjL1xDJwjPZG
   y3rWje7unJC7jcE2iC536TsFN6IVn5D+FMcReiyBSoEF6UtgzRAezSF18
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="437489748"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="437489748"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 02:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="812870323"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="812870323"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.56])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 02:12:04 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
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
Subject: Re: [PATCH v5 0/8] drm/i915: move DSC RC tables to drm_dsc_helper.c
In-Reply-To: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
Date:   Mon, 15 May 2023 12:12:02 +0300
Message-ID: <871qjij6vx.fsf@intel.com>
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

On Thu, 04 May 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Other platforms (msm) will benefit from sharing the DSC config setup
> functions. This series moves parts of static DSC config data from the
> i915 driver to the common helpers to be used by other drivers.
>
> Note: the RC parameters were cross-checked against config files found in
> DSC model 2021062, 20161212 (and 20150914). The first patch modifies
> tables according to those config files, while preserving parameter
> values using the code. I have not changed one of the values in the
> pre-SCR config file as it clearly looks like a typo in the config file,
> considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

As I believe I've said before, I think it's fine to merge these either
via drm-intel or drm-misc. Which do you prefer?

BR,
Jani.



>
> Chances since v4:
> - Rebased on top of drm-intel-next
> - Cut the first 8 patches of the series to ease merging. The rest of the
>   patches will go afterwards.
>
> Chances since v3:
> - Rebased on top of drm-intel-next
> - Dropped the msm patch to make patchset fully mergeable through
>   drm-intel
> - Made drm_dsc_set_const_params() ignore rc_model_size, picked up
>   drm_dsc_set_initial_scale_value() patch by Jessica and switched
>   intel_vdsc.c to use those two helpers.
> - Added a patch to make i915 actually use rc_tgt_offset_high,
>   rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.
>
> Chances since v2:
> - Rebased on top of drm-intel-next
>
> Chances since v1:
> - Made drm_dsc_rc_buf_thresh static rather than exporting it
> - Switched drm_dsc_rc_buf_thresh loop to use ARRAY_SIZE. Added
>   BUILD_BUG_ON's to be sure that array sizes are correct
> - Fixed rc_parameters_data indentation to be logical and tidy
> - Fixed drm_dsc_setup_rc_params() kerneldoc
> - Added a clause to drm_dsc_setup_rc_params() to verify bpp and bpc
>   being set.
> - Fixed range_bpg_offset programming in calculate_rc_params()
> - Fixed bpp vs bpc bug in intel_dsc_compute_params()
> - Added FIXME comment next to the customizations in
>   intel_dsc_compute_params().
>
> Dmitry Baryshkov (8):
>   drm/i915/dsc: change DSC param tables to follow the DSC model
>   drm/i915/dsc: move rc_buf_thresh values to common helper
>   drm/i915/dsc: move DSC tables to DRM DSC helper
>   drm/i915/dsc: stop using interim structure for calculated params
>   drm/display/dsc: use flat array for rc_parameters lookup
>   drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
>   drm/display/dsc: include the rest of pre-SCR parameters
>   drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
>
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 986 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 443 ++--------
>  include/drm/display/drm_dsc_helper.h      |   9 +
>  3 files changed, 1042 insertions(+), 396 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
