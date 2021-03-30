Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5314134E9CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 16:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhC3OCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 10:02:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:22732 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232126AbhC3OBn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 10:01:43 -0400
IronPort-SDR: Zy3N3y632acAkcvIej9owgs0FIhABpwrRfGy1/4nDPSE/53KBD7L5svn4M5R1CkStteGXlwvQ5
 bM/SmFLJPo8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="255761686"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="255761686"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:01:41 -0700
IronPort-SDR: 5W+Pm6pxQg6paSSW3ZNE+fcuk5O4p375dGVxqhVSMpGKPVVVIqYWkyXryVZ5nDiysAb0acP8mz
 X3GqIRXqeH+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="393618051"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga002.jf.intel.com with SMTP; 30 Mar 2021 07:01:32 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 30 Mar 2021 17:01:31 +0300
Date:   Tue, 30 Mar 2021 17:01:31 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/14] drm/edid: Use the cached EDID in drm_get_edid()
 if eDP
Message-ID: <YGMvO3PNDCiBmqov@intel.com>
References: <20210330025345.3980086-1-dianders@chromium.org>
 <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 07:53:40PM -0700, Douglas Anderson wrote:
> Each time we call drm_get_edid() we:
> 1. Go out to the bus and ask for the EDID.
> 2. Cache the EDID.
> 
> We can improve this to actually use the cached EDID so that if
> drm_get_edid() is called multiple times then we don't need to go out
> to the bus over and over again.
> 
> In normal DP/HDMI cases reading the EDID over and over again isn't
> _that_ expensive so, presumably, this wasn't that critical in the
> past. However for eDP going out to the bus can be expensive. This is
> because eDP panels might be powered off before the EDID was requested
> so we need to do power sequencing in addition to the transfer.
> 
> In theory we should be able to cache the EDID for all types of
> displays. There is already code throwing the cache away when we detect
> that a display was unplugged. However, it can be noted that it's
> _extra_ safe to cache the EDID for eDP since eDP isn't a hot-pluggable
> interface. If we get the EDID once then we've got the EDID and we
> should never need to read it again. For now we'll only use the cache
> for eDP both because it's more important and extra safe.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/drm_edid.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c2bbe7bee7b6..fcbf468d73c9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2049,15 +2049,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter)
>  {
>  	struct edid *edid;
> +	size_t old_edid_size;
> +	const struct edid *old_edid;
>  
>  	if (connector->force == DRM_FORCE_OFF)
>  		return NULL;
>  
> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> -		return NULL;
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
> +	    connector->edid_blob_ptr) {
> +		/*
> +		 * eDP devices are non-removable, or at least not something
> +		 * that's expected to be hot-pluggable. We can freely use
> +		 * the cached EDID.
> +		 *
> +		 * NOTE: technically we could probably even use the cached
> +		 * EDID even for non-eDP because the cached EDID should be
> +		 * cleared if we ever notice a display is not connected, but
> +		 * we'll use an abundance of caution and only do it for eDP.
> +		 * It's more important for eDP anyway because the EDID may not
> +		 * always be readable, like when the panel is powered down.
> +		 */
> +		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
> +		old_edid_size = ksize(old_edid);
> +		edid = kmalloc(old_edid_size, GFP_KERNEL);
> +		if (edid)
> +			memcpy(edid, old_edid, old_edid_size);
> +	} else {
> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> +			return NULL;
> +
> +		edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
> +		drm_connector_update_edid_property(connector, edid);
> +	}

This is a pretty low level function. Too low level for this caching
IMO. So I think better just do it a bit higher up like other drivers.

>  
> -	edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
> -	drm_connector_update_edid_property(connector, edid);
>  	return edid;
>  }
>  EXPORT_SYMBOL(drm_get_edid);
> -- 
> 2.31.0.291.g576ba9dcdaf-goog
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
