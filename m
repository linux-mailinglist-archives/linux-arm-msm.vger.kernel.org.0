Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E33451489B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbgAXOgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 09:36:50 -0500
Received: from mga17.intel.com ([192.55.52.151]:47412 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387620AbgAXOgn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 09:36:43 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 06:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="230314446"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga006.jf.intel.com with SMTP; 24 Jan 2020 06:36:37 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 24 Jan 2020 16:36:36 +0200
Date:   Fri, 24 Jan 2020 16:36:36 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, adelva@google.com,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        aravindh@codeaurora.org, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
Message-ID: <20200124143636.GY13686@intel.com>
References: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 02:40:45PM -0800, Abhinav Kumar wrote:
> From: Uma Shankar <uma.shankar@intel.com>
> 
> CEA 861.3 spec adds colorimetry data block for HDMI.
> Parsing the block to get the colorimetry data from
> panel.

Why?

> 
> This was posted by Uma Shankar at
> https://patchwork.kernel.org/patch/10861327/
> 
> Modified by Abhinav Kumar:
> - Use macros to distinguish the bit fields for clarity
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_edid.c  | 54 +++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  3 +++
>  include/drm/drm_edid.h      | 11 +++++++++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6..148bfa4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3136,6 +3136,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> +#define COLORIMETRY_DATA_BLOCK		0x5
>  #define HDR_STATIC_METADATA_BLOCK	0x6
>  #define USE_EXTENDED_TAG 0x07
>  #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> @@ -4199,6 +4200,57 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>  	mode->clock = clock;
>  }
>  
> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (db[1] != COLORIMETRY_DATA_BLOCK)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, const u8 *db)
> +{
> +	struct drm_hdmi_info *info = &connector->display_info.hdmi;
> +
> +	/* As per CEA 861-G spec */
> +	/* Byte 3 Bit 0: xvYCC_601 */
> +	if (db[2] & BIT(0))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_601;
> +	/* Byte 3 Bit 1: xvYCC_709 */
> +	if (db[2] & BIT(1))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_709;
> +	/* Byte 3 Bit 2: sYCC_601 */
> +	if (db[2] & BIT(2))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_sYCC_601;
> +	/* Byte 3 Bit 3: ADBYCC_601 */
> +	if (db[2] & BIT(3))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_ADBYCC_601;
> +	/* Byte 3 Bit 4: ADB_RGB */
> +	if (db[2] & BIT(4))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_ADB_RGB;
> +	/* Byte 3 Bit 5: BT2020_CYCC */
> +	if (db[2] & BIT(5))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_CYCC;
> +	/* Byte 3 Bit 6: BT2020_YCC */
> +	if (db[2] & BIT(6))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_YCC;
> +	/* Byte 3 Bit 7: BT2020_RGB */
> +	if (db[2] & BIT(7))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_RGB;
> +	/* Byte 4 Bit 7: DCI-P3 */
> +	if (db[3] & BIT(7))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_DCI_P3;
> +
> +	DRM_DEBUG_KMS("Supported Colorimetry 0x%x\n", info->colorimetry);
> +}
> +
>  static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>  {
>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> @@ -4877,6 +4929,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			drm_parse_vcdb(connector, db);
>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, db);
> +		if (cea_db_is_hdmi_colorimetry_data_block(db))
> +			drm_parse_colorimetry_data_block(connector, db);
>  	}
>  }
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 2219109..a996ee3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -207,6 +207,9 @@ struct drm_hdmi_info {
>  
>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
> +
> +	/* @colorimetry: bitmap of supported colorimetry modes */
> +	u16 colorimetry;
>  };
>  
>  /**
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index f0b03d4..6168c1c 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -224,6 +224,17 @@ struct detailed_timing {
>  				    DRM_EDID_YCBCR420_DC_36 | \
>  				    DRM_EDID_YCBCR420_DC_30)
>  
> +/* Supported Colorimetry from colorimetry data block */
> +#define DRM_EDID_CLRMETRY_xvYCC_601   (1 << 0)
> +#define DRM_EDID_CLRMETRY_xvYCC_709   (1 << 1)
> +#define DRM_EDID_CLRMETRY_sYCC_601    (1 << 2)
> +#define DRM_EDID_CLRMETRY_ADBYCC_601  (1 << 3)
> +#define DRM_EDID_CLRMETRY_ADB_RGB     (1 << 4)
> +#define DRM_EDID_CLRMETRY_BT2020_CYCC (1 << 5)
> +#define DRM_EDID_CLRMETRY_BT2020_YCC  (1 << 6)
> +#define DRM_EDID_CLRMETRY_BT2020_RGB  (1 << 7)
> +#define DRM_EDID_CLRMETRY_DCI_P3      (1 << 15)
> +
>  /* ELD Header Block */
>  #define DRM_ELD_HEADER_BLOCK_SIZE	4
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
