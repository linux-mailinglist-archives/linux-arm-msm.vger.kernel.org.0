Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DDC40B73B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhINSzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:55:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:32751 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230012AbhINSzL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:55:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="202275439"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="202275439"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 11:53:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="552654619"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost) ([10.251.216.6])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 11:53:47 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/15] drm/edid: Allow querying/working with the panel ID from the EDID
In-Reply-To: <20210909135838.v4.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210909210032.465570-1-dianders@chromium.org> <20210909135838.v4.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
Date:   Tue, 14 Sep 2021 21:53:44 +0300
Message-ID: <874kan0z0n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> EDIDs have 32-bits worth of data which is intended to be used to
> uniquely identify the make/model of a panel. This has historically
> been used only internally in the EDID processing code to identify
> quirks with panels.
>
> We'd like to use this panel ID in panel drivers to identify which
> panel is hooked up and from that information figure out power sequence
> timings. Let's expose this information from the EDID code and also
> allow it to be accessed early, before a connector has been created.
>
> To make matching in the panel drivers code easier, we'll return the
> panel ID as a 32-bit value. We'll provide some functions for
> converting this value back and forth to something more human readable.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>
> Changes in v4:
> - Don't refer to "panel-simple" in commit message.
> - decode_edid_id() => drm_edid_decode_panel_id()
> - drm_do_get_edid_blk0() => drm_do_get_edid_base_block()
> - drm_get_panel_id() => drm_edid_get_panel_id()
> - encode_edid_id() => drm_edid_encode_panel_id()
> - split panel id extraction out to its own function.
>
> Changes in v3:
> - Decode hex product ID w/ same endianness as everyone else.
>
>  drivers/gpu/drm/drm_edid.c | 67 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 47 ++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 520fe1391769..f84e0dd264f4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2087,6 +2087,73 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>  
> +static u32 edid_extract_panel_id(const struct edid *edid)
> +{
> +	/*
> +	 * In theory we could try to de-obfuscate this like edid_get_quirks()
> +	 * does, but it's easier to just deal with a 32-bit number since then
> +	 * it can be compared with "==".
> +	 *
> +	 * NOTE that we deal with endianness differently for the top half
> +	 * of this ID than for the bottom half. The bottom half (the product
> +	 * id) gets decoded as little endian by the EDID_PRODUCT_ID because
> +	 * that's how everyone seems to interpret it. The top half (the mfg_id)
> +	 * gets stored as big endian because that makes
> +	 * drm_edid_encode_panel_id() and drm_edid_decode_panel_id() easier
> +	 * to write (it's easier to extract the ASCII). It doesn't really
> +	 * matter, though, as long as the number here is unique.
> +	 */
> +	return (u32)edid->mfg_id[0] << 24   |
> +	       (u32)edid->mfg_id[1] << 16   |
> +	       (u32)EDID_PRODUCT_ID(edid);
> +}
> +
> +/**
> + * drm_edid_get_panel_id - Get a panel's ID through DDC
> + * @adapter: I2C adapter to use for DDC
> + *
> + * This function reads the first block of the EDID of a panel and (assuming
> + * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
> + * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
> + * supposed to be different for each different modem of panel.
> + *
> + * This function is intended to be used during early probing on devices where
> + * more than one panel might be present. Because of its intended use it must
> + * assume that the EDID of the panel is correct, at least as far as the ID
> + * is concerned (in other words, we don't process any overrides here).
> + *
> + * NOTE: it's expected that this function and drm_do_get_edid() will both
> + * be read the EDID, but there is no caching between them. Since we're only
> + * reading the first block, hopefully this extra overhead won't be too big.
> + *
> + * Return: A 32-bit ID that should be different for each make/model of panel.
> + *         See the functions drm_edid_encode_panel_id() and
> + *         drm_edid_decode_panel_id() for some details on the structure of this
> + *         ID.
> + */
> +
> +u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
> +{
> +	struct edid *edid;
> +	u32 panel_id;
> +
> +	edid = drm_do_get_edid_base_block(drm_do_probe_ddc_edid, adapter,
> +					  NULL, NULL);
> +
> +	/*
> +	 * There are no manufacturer IDs of 0, so if there is a problem reading
> +	 * the EDID then we'll just return 0.
> +	 */
> +	if (IS_ERR_OR_NULL(edid))
> +		return 0;
> +
> +	panel_id = edid_extract_panel_id(edid);
> +	kfree(edid);
> +
> +	return panel_id;
> +}
> +EXPORT_SYMBOL(drm_edid_get_panel_id);
> +
>  /**
>   * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
>   * @connector: connector we're probing
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index deccfd39e6db..4d17cd04fff7 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -508,6 +508,52 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
>  	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
>  }
>  
> +/**
> + * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
> + * @vend_chr_0: First character of the vendor string.
> + * @vend_chr_2: Second character of the vendor string.
> + * @vend_chr_3: Third character of the vendor string.
> + * @product_id: The 16-bit product ID.
> + *
> + * This is a macro so that it can be calculated at compile time and used
> + * as an initializer.
> + *
> + * For instance:
> + *   drm_edid_encode_panel_id('B', 'O', 'E', 0x2d08) => 0x09e52d08
> + *
> + * Return: a 32-bit ID per panel.
> + */
> +#define drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id) \
> +	((((u32)(vend_chr_0) - '@') & 0x1f) << 26 | \
> +	 (((u32)(vend_chr_1) - '@') & 0x1f) << 21 | \
> +	 (((u32)(vend_chr_2) - '@') & 0x1f) << 16 | \
> +	 ((product_id) & 0xffff))
> +
> +/**
> + * drm_edid_decode_panel_id - Decode a panel ID from drm_edid_encode_panel_id()
> + * @panel_id: The panel ID to decode.
> + * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
> + *	  termination
> + * @product_id: The product ID will be returned here.
> + *
> + * For instance, after:
> + *   drm_edid_decode_panel_id(0x09e52d08, vend, &product_id)
> + * These will be true:
> + *   vend[0] = 'B'
> + *   vend[1] = 'O'
> + *   vend[2] = 'E'
> + *   vend[3] = '\0'
> + *   product_id = 0x2d08
> + */
> +static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *product_id)
> +{
> +	*product_id = (u16)(panel_id & 0xffff);
> +	vend[0] = '@' + ((panel_id >> 26) & 0x1f);
> +	vend[1] = '@' + ((panel_id >> 21) & 0x1f);
> +	vend[2] = '@' + ((panel_id >> 16) & 0x1f);
> +	vend[3] = '\0';
> +}
> +
>  bool drm_probe_ddc(struct i2c_adapter *adapter);
>  struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> @@ -515,6 +561,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> +u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);

-- 
Jani Nikula, Intel Open Source Graphics Center
