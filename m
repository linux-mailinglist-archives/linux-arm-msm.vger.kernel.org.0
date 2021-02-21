Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFBC320C8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Feb 2021 19:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBUSXe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 13:23:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51818 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhBUSX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 13:23:27 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ADAE8B6;
        Sun, 21 Feb 2021 19:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613931762;
        bh=ELeo/YYr7PiQSGC65qRaVofy0coNywtyWv2mSUttBog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IW3KOdfSne7xsixiEObAy92RTmpb6KGm8IQFmq5BSjMcqjXShAeMHE0zekRl17t/z
         1hP97UYars/z/70NecAZAdflxHEABTAiJel2ACipeOimF5y1ADfyaRpajJ0F7iNcap
         U+glr/SmuYripVN318IWH3C9WeLJlhiENLeCqnwE=
Date:   Sun, 21 Feb 2021 20:22:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Imre Deak <imre.deak@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 19/30] drm/dp: Pass drm_dp_aux to
 drm_dp_link_train_clock_recovery_delay()
Message-ID: <YDKk2C+UAXR/sIOG@pendragon.ideasonboard.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-20-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219215326.2227596-20-lyude@redhat.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lyude,

Thank you for the patch.

On Fri, Feb 19, 2021 at 04:53:15PM -0500, Lyude Paul wrote:
> So that we can start using drm_dbg_*() in
> drm_dp_link_train_clock_recovery_delay().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c              | 2 +-
>  drivers/gpu/drm/drm_dp_helper.c                       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                      | 2 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                    | 2 +-
>  drivers/gpu/drm/radeon/atombios_dp.c                  | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                      | 2 +-
>  include/drm/drm_dp_helper.h                           | 4 +++-
>  8 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index 6d35da65e09f..4468f9d6b4dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -611,7 +611,7 @@ amdgpu_atombios_dp_link_train_cr(struct amdgpu_atombios_dp_link_train_info *dp_i
>  	dp_info->tries = 0;
>  	voltage = 0xff;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 194e0c273809..ce08eb3bface 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -132,7 +132,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>  
> -void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
> +					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
>  					 DP_TRAINING_AUX_RD_MASK;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 892d7db7d94f..222073d46bdb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -441,7 +441,7 @@ static void intel_dp_link_training_clock_recovery_delay(struct intel_dp *intel_d
>  							enum drm_dp_phy dp_phy)
>  {
>  	if (dp_phy == DP_PHY_DPRX)
> -		drm_dp_link_train_clock_recovery_delay(intel_dp->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
>  	else
>  		drm_dp_lttpr_link_train_clock_recovery_delay();
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 36b39c381b3f..2501a6b326a3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1103,7 +1103,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>  	tries = 0;
>  	old_v_level = ctrl->link->phy_params.v_level;
>  	for (tries = 0; tries < maximum_retries; tries++) {
> -		drm_dp_link_train_clock_recovery_delay(ctrl->panel->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
>  
>  		ret = dp_ctrl_read_link_status(ctrl, link_status);
>  		if (ret)
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 57af3d8b6699..6501598448b4 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -608,7 +608,7 @@ static int edp_start_link_train_1(struct edp_ctrl *ctrl)
>  	tries = 0;
>  	old_v_level = ctrl->v_level;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(ctrl->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(ctrl->drm_aux, ctrl->dpcd);
>  
>  		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
>  		if (rlen < DP_LINK_STATUS_SIZE) {
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
> index c50c504bad50..299b9d8da376 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -680,7 +680,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
>  	dp_info->tries = 0;
>  	voltage = 0xff;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 8272eee03adc..5cc295d8ba9f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -713,7 +713,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
>  		if (ret)
>  			return ret;
>  
> -		drm_dp_link_train_clock_recovery_delay(dp->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
>  		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
>  		if (ret < 0)
>  			return ret;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 45ec74862212..e4681665231e 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -29,6 +29,7 @@
>  #include <drm/drm_connector.h>
>  
>  struct drm_device;
> +struct drm_dp_aux;
>  
>  /*
>   * Unless otherwise noted, all values are from the DP 1.1a spec.  Note that
> @@ -1475,7 +1476,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
>  #define DP_LTTPR_PHY_CAP_SIZE		3
>  
> -void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
> +					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_clock_recovery_delay(void);
>  void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
Regards,

Laurent Pinchart
