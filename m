Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C77E495867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 03:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348468AbiAUCnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 21:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348457AbiAUCno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 21:43:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F748C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 18:43:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0703725B;
        Fri, 21 Jan 2022 03:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642733021;
        bh=VYeqWFt1o2QV8Re3/czlLdUiRJWXOWazgFd2rtpOUtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xozw0VmuEx9RdmGW3mPeScbJx6gsROGLe81+9/+ttEVu4qHC/1kFLTcbPOvh6dqwK
         mbsGYzfRgavr59tKgLNfGSLlRgamZKYiqGuCGtSEHXZ4RU5/rosRWYe/n03xil6+f8
         eJF+4db3e06iqeRvkWYh87mIf8m6Syn7r3agxpCI=
Date:   Fri, 21 Jan 2022 04:43:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        dmitry.baryshkov@linaro.org, daniel@ffwll.ch
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
Message-ID: <YeodzTsHmejDm9M6@pendragon.ideasonboard.com>
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

Thank you for the patch.

On Thu, Jan 20, 2022 at 06:29:55PM -0800, Abhinav Kumar wrote:
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

A writeback connector is a bit of a hack. It was implemented that way to
minimize the extensions to the KMS userspace API for writeback support.
There's no "encoder" there, as there's no real "connector" either. The
only reason we register a drm_encoder in the writeback implementation is
because encoders are exposed to userspace and are thus required (this is
considered a historical mistake that we can't fix anymore). Why do you
thus need to create a "real encoder" ?

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
Regards,

Laurent Pinchart
