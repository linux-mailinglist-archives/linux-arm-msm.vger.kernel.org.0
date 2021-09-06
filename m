Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516C1401947
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 11:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241680AbhIFJvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 05:51:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:10721 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241691AbhIFJvV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 05:51:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="199463756"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; 
   d="scan'208";a="199463756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 02:50:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; 
   d="scan'208";a="536692853"
Received: from isandweg-mobl2.ger.corp.intel.com (HELO localhost) ([10.251.212.194])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 02:50:10 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/16] drm/edid: Break out reading block 0 of the EDID
In-Reply-To: <20210901131531.v3.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210901201934.1084250-1-dianders@chromium.org> <20210901131531.v3.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
Date:   Mon, 06 Sep 2021 12:50:07 +0300
Message-ID: <87k0ju8240.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 01 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> A future change wants to be able to read just block 0 of the EDID, so
> break it out of drm_do_get_edid() into a sub-function.
>
> This is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/drm_edid.c | 62 +++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..a22c38482a90 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1905,6 +1905,43 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_add_override_edid_modes);
>  
> +static struct edid *drm_do_get_edid_blk0(

Maybe base_block instead of blk0?

> +	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> +			      size_t len),
> +	void *data, bool *edid_corrupt, int *null_edid_counter)
> +{
> +	int i;
> +	u8 *edid;

With void *edid, this function wouldn't need the cast internally.

> +
> +	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> +		return NULL;

Could split the allocation and NULL check to two separate lines per
coding style, while at it?

BR,
Jani.

> +
> +	/* base block fetch */
> +	for (i = 0; i < 4; i++) {
> +		if (get_edid_block(data, edid, 0, EDID_LENGTH))
> +			goto out;
> +		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
> +			break;
> +		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> +			if (null_edid_counter)
> +				(*null_edid_counter)++;
> +			goto carp;
> +		}
> +	}
> +	if (i == 4)
> +		goto carp;
> +
> +	return (struct edid *)edid;
> +
> +carp:
> +	kfree(edid);
> +	return ERR_PTR(-EINVAL);
> +
> +out:
> +	kfree(edid);
> +	return NULL;
> +}
> +
>  /**
>   * drm_do_get_edid - get EDID data using a custom EDID block read function
>   * @connector: connector we're probing
> @@ -1938,25 +1975,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	if (override)
>  		return override;
>  
> -	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> +	edid = (u8 *)drm_do_get_edid_blk0(get_edid_block, data,
> +					  &connector->edid_corrupt,
> +					  &connector->null_edid_counter);
> +	if (IS_ERR_OR_NULL(edid)) {
> +		if (IS_ERR(edid))
> +			connector_bad_edid(connector, edid, 1);
>  		return NULL;
> -
> -	/* base block fetch */
> -	for (i = 0; i < 4; i++) {
> -		if (get_edid_block(data, edid, 0, EDID_LENGTH))
> -			goto out;
> -		if (drm_edid_block_valid(edid, 0, false,
> -					 &connector->edid_corrupt))
> -			break;
> -		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> -			connector->null_edid_counter++;
> -			goto carp;
> -		}
>  	}
> -	if (i == 4)
> -		goto carp;
>  
> -	/* if there's no extensions, we're done */
> +	/* if there's no extensions or no connector, we're done */
>  	valid_extensions = edid[0x7e];
>  	if (valid_extensions == 0)
>  		return (struct edid *)edid;
> @@ -2010,8 +2038,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  
>  	return (struct edid *)edid;
>  
> -carp:
> -	connector_bad_edid(connector, edid, 1);
>  out:
>  	kfree(edid);
>  	return NULL;

-- 
Jani Nikula, Intel Open Source Graphics Center
