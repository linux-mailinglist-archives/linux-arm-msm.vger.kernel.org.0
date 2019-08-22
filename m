Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9408599360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 14:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfHVM05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 08:26:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:63270 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729659AbfHVM05 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 08:26:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 05:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="196236911"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 22 Aug 2019 05:26:53 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 22 Aug 2019 15:26:52 +0300
Date:   Thu, 22 Aug 2019 15:26:52 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bruce Wang <bzwang@chromium.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm/dpu: add rotation property
Message-ID: <20190822122652.GM5942@intel.com>
References: <20190822015756.30807-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190822015756.30807-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 21, 2019 at 06:57:24PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 45bfac9e3af7..c5653771e8fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1040,8 +1040,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  				pstate->multirect_mode);
>  
>  	if (pdpu->pipe_hw->ops.setup_format) {
> +		unsigned int rotation;
> +
>  		src_flags = 0x0;
>  
> +		rotation = drm_rotation_simplify(state->rotation,
> +						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_REFLECT_X |
> +						 DRM_MODE_REFLECT_Y);
> +
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			src_flags |= DPU_SSPP_FLIP_UD;
> + 
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			src_flags |= DPU_SSPP_FLIP_LR;
> +

UD vs. LR (assuming those mean what I think they mean) seem the wrong
way around here.

>
>  		/* update format */
>  		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
>  				pstate->multirect_index);
> @@ -1522,6 +1535,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>  	if (ret)
>  		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>  
> +	drm_plane_create_rotation_property(plane,
> +			DRM_MODE_ROTATE_0,
> +			DRM_MODE_ROTATE_0 |
> +			DRM_MODE_ROTATE_180 |
> +			DRM_MODE_REFLECT_X |
> +			DRM_MODE_REFLECT_Y);
> +
>  	drm_plane_enable_fb_damage_clips(plane);
>  
>  	/* success! finalize initialization */
> -- 
> 2.21.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
