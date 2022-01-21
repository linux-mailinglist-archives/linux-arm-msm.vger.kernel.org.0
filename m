Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07996495CA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 10:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379697AbiAUJRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 04:17:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:51790 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234934AbiAUJRU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 04:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642756640; x=1674292640;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+vKN7iTjxod+Fyp3Notbf7x2rCsKmuFBBQG0spUXmBM=;
  b=LQmaovnDTj9IS1GNIb69LfUyGxSRVjlNz9SpctL00tnR8m42i8QfRBMa
   knMEX5rBpUAsi6dUIrCKEraJbIl+HtZXzieA8u8+eFiSWex9MzRBMvkfi
   4lKf36JiOkVL3MAeqkd6ztDo9XPGx3dHvDBwMLngW8Hz2XHWDlmC5S/bl
   XmYTVgJ3Ttxa1MDpIdZ0l0z+LKATeWYaZIq/qBqh+4whhkz9xLnpC+Wgc
   cwiqj0PZnb8TRuevBeUr4bm7imZ9hkgsDWG3XSXh+NkELOubOOvUUdVBP
   ku60unO2o4uLXTTfMdm6IhaGqY+OyfdgwMmpd5OOhpiw2wdwEJ2lYrcYE
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245829478"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="245829478"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:17:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="533200849"
Received: from chandra2-mobl.ger.corp.intel.com (HELO localhost) ([10.252.48.104])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:17:14 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, swboyd@chromium.org,
        khsieh@codeaurora.org, nganji@codeaurora.org,
        seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
        dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, suraj.kandpal@intel.com
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
In-Reply-To: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Date:   Fri, 21 Jan 2022 11:17:07 +0200
Message-ID: <87bl054fe4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Jan 2022, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> Instead of creating an internal encoder for the writeback
> connector to satisfy DRM requirements, allow the clients
> to pass a real encoder to it by changing the drm_writeback's
> encoder to a pointer.
>
> If a real encoder is not passed, drm_writeback_connector_init
> will internally allocate one.
>
> This will help the clients to manage the real encoder states
> better as they will allocate and maintain the encoder.

See also the thread starting at [1], and please try to coordinate.

I don't know what the end result should be like, I'm just saying please
collaborate instead of racing to get one set of changes in.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20220111101801.28310-1-suraj.kandpal@intel.com

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 11 +++++++----
>  include/drm/drm_writeback.h     |  2 +-
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504..fdb7381 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -189,8 +189,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  	if (IS_ERR(blob))
>  		return PTR_ERR(blob);
>  
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +	/* allocate the internal drm encoder if a real one wasnt passed */
> +	if (!wb_connector->encoder)
> +		wb_connector->encoder = devm_kzalloc(dev->dev, sizeof(struct drm_encoder), GFP_KERNEL);
> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>  			       &drm_writeback_encoder_funcs,
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret)
> @@ -204,7 +207,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  		goto connector_fail;
>  
>  	ret = drm_connector_attach_encoder(connector,
> -						&wb_connector->encoder);
> +						wb_connector->encoder);
>  	if (ret)
>  		goto attach_fail;
>  
> @@ -233,7 +236,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>  	drm_connector_cleanup(connector);
>  connector_fail:
> -	drm_encoder_cleanup(&wb_connector->encoder);
> +	drm_encoder_cleanup(wb_connector->encoder);
>  fail:
>  	drm_property_blob_put(blob);
>  	return ret;
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d27..f0d8147 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -31,7 +31,7 @@ struct drm_writeback_connector {
>  	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>  	 * function.
>  	 */
> -	struct drm_encoder encoder;
> +	struct drm_encoder *encoder;
>  
>  	/**
>  	 * @pixel_formats_blob_ptr:

-- 
Jani Nikula, Intel Open Source Graphics Center
