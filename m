Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B0942F0FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 14:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbhJOMd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 08:33:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:6498 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230512AbhJOMdK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 08:33:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="208707248"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="208707248"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 05:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="627290302"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by fmsmga001.fm.intel.com with SMTP; 15 Oct 2021 05:30:50 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 15 Oct 2021 15:30:49 +0300
Date:   Fri, 15 Oct 2021 15:30:49 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Claudio Suarez <cssk@net-c.es>
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/15] drm/i915: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Message-ID: <YWl0ebn23tVXL6jP@intel.com>
References: <20211015113713.630119-1-cssk@net-c.es>
 <20211015113713.630119-16-cssk@net-c.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015113713.630119-16-cssk@net-c.es>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 15, 2021 at 01:37:13PM +0200, Claudio Suarez wrote:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi. Retriving the same information with
> drm_detect_hdmi_monitor() is less efficient. Change to
> drm_display_info.is_hdmi where possible.
> 
> This is a TODO task in Documentation/gpu/todo.rst
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/i915/display/intel_connector.c | 5 +++++
>  drivers/gpu/drm/i915/display/intel_connector.h | 1 +
>  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c      | 3 ++-
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
> index 9bed1ccecea0..3346b55df6e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -213,6 +213,11 @@ int intel_ddc_get_modes(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector)
> +{
> +	return connector->display_info.is_hdmi;
> +}
> +
>  static const struct drm_prop_enum_list force_audio_names[] = {
>  	{ HDMI_AUDIO_OFF_DVI, "force-dvi" },
>  	{ HDMI_AUDIO_OFF, "off" },
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
> index 661a37a3c6d8..ceda6e72ece6 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.h
> +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> @@ -27,6 +27,7 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector);
>  int intel_connector_update_modes(struct drm_connector *connector,
>  				 struct edid *edid);
>  int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
> +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector);
>  void intel_attach_force_audio_property(struct drm_connector *connector);
>  void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
>  void intel_attach_aspect_ratio_property(struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index b04685bb6439..2b1d7c5bebdd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  	to_intel_connector(connector)->detect_edid = edid;
>  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
>  		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
> -		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
> +		intel_hdmi->has_hdmi_sink = intel_connector_is_hdmi_monitor(connector);

Hmm. Have we parse the EDID by this point actually? I don't think that
was the case in the past but maybe it changed at some point.

>  
>  		connected = true;
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 6cb27599ea03..a32279e4fee8 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
>  		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>  			status = connector_status_connected;
>  			if (intel_sdvo_connector->is_hdmi) {
> -				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
>  				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
> +				intel_sdvo->has_hdmi_monitor =
> +					intel_connector_is_hdmi_monitor(connector);

FYI there's a third copy of this in intel_dp.c

>  			}
>  		} else
>  			status = connector_status_disconnected;
> -- 
> 2.33.0
> 

-- 
Ville Syrjälä
Intel
