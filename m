Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30003433E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhJSSjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 14:39:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:7641 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231783AbhJSSjp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 14:39:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="289446817"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="289446817"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 11:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="462869280"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga002.jf.intel.com with SMTP; 19 Oct 2021 11:37:23 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 19 Oct 2021 21:37:22 +0300
Date:   Tue, 19 Oct 2021 21:37:22 +0300
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
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YW8QYsmkm3ZrBAx3@intel.com>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211016184226.3862-14-cssk@net-c.es>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 08:42:26PM +0200, Claudio Suarez wrote:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi. Retriving the same information with
> drm_detect_hdmi_monitor() is less efficient. Change to
> drm_display_info.is_hdmi where possible.

We still need proof in the commit message that display_info
is actually populated by the time this gets called.

> 
> This is a TODO task in Documentation/gpu/todo.rst
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index b04685bb6439..008e5b0ba408 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  	to_intel_connector(connector)->detect_edid = edid;
>  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
>  		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
> -		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
> +		intel_hdmi->has_hdmi_sink = connector->display_info.is_hdmi;
>  
>  		connected = true;
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 6cb27599ea03..b4065e4df644 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
>  		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>  			status = connector_status_connected;
>  			if (intel_sdvo_connector->is_hdmi) {
> -				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
>  				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
> +				intel_sdvo->has_hdmi_monitor =
> +							    connector->display_info.is_hdmi;
>  			}
>  		} else
>  			status = connector_status_disconnected;
> -- 
> 2.33.0
> 

-- 
Ville Syrjälä
Intel
