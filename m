Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177EA433E83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 20:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhJSShe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 14:37:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:32802 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231783AbhJSShe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 14:37:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228473969"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="228473969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 11:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="526760120"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga001.jf.intel.com with SMTP; 19 Oct 2021 11:35:09 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 19 Oct 2021 21:35:08 +0300
Date:   Tue, 19 Oct 2021 21:35:08 +0300
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
Subject: Re: [PATCH v2 01/13] gpu/drm: make drm_add_edid_modes() consistent
 when updating connector->display_info
Message-ID: <YW8P3GPGezUhoBcW@intel.com>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-2-cssk@net-c.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211016184226.3862-2-cssk@net-c.es>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 08:42:14PM +0200, Claudio Suarez wrote:
> According to the documentation, drm_add_edid_modes
> "... Also fills out the &drm_display_info structure and ELD in @connector
> with any information which can be derived from the edid."
> 
> drm_add_edid_modes accepts a struct edid *edid parameter which may have a
> value or may be null. When it is not null, connector->display_info and
> connector->eld are updated according to the edid. When edid=NULL, only
> connector->eld is reset. Reset connector->display_info to be consistent
> and accurate.
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/drm_edid.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..c643db17782c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5356,14 +5356,13 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  	int num_modes = 0;
>  	u32 quirks;
>  
> -	if (edid == NULL) {
> -		clear_eld(connector);
> -		return 0;
> -	}
>  	if (!drm_edid_is_valid(edid)) {

OK, so drm_edid_is_valid() will happily accept NULL and considers
it invalid. You may want to mention that explicitly in the commit
message.

> +		/* edid == NULL or invalid here */
>  		clear_eld(connector);
> -		drm_warn(connector->dev, "%s: EDID invalid.\n",
> -			 connector->name);
> +		drm_reset_display_info(connector);
> +		if (edid)
> +			drm_warn(connector->dev, "%s: EDID invalid.\n",
> +				 connector->name);

Could you respin this to use the standard [CONNECTOR:%d:%s] form
while at it? Or I guess a patch to mass convert the whole drm_edid.c
might be another option.

Patch looks good.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


>  		return 0;
>  	}
>  
> -- 
> 2.33.0
> 
> 

-- 
Ville Syrjälä
Intel
