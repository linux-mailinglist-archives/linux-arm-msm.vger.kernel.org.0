Return-Path: <linux-arm-msm+bounces-17396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5038A3EEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 23:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F821C209F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDE25644A;
	Sat, 13 Apr 2024 21:50:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7555C2C
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713045019; cv=none; b=Qtkzcei+1I+F0SNIiN8A2IJEXG9pGD4zdirAqvBbD/owY/c/GsOTgVGsgOTSo3wnzHyN7PQfO9PrJPWgMiAbkX3+5rcxMsXFtUKcJqmNBKxJEhYdrpxCs2ABbcKr5cgvOlaWK5FTnJD+0rlBbh1SiVkGqq99Gheuu+quje/RT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713045019; c=relaxed/simple;
	bh=sSRLyOrAPUnlICcYlFjeeGuacJ5dYEn8lr800sZSWnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5UMgYxUNombgEcGurk+k+wJR34ye1AN+3Ppj9l6Y7W05+LoBkCJmWQy96TUow5vy49NRKMT5w3XBJGfrGJl6YFBvuM6H4hreGaPKqJgP8suiPSbnPDVI68y1EybvseRL6GDriOrsQVpOctzbPkJius/5KA9Zr7qTGjR+B+udGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id ADFAC205A9;
	Sat, 13 Apr 2024 23:12:44 +0200 (CEST)
Date: Sat, 13 Apr 2024 23:12:43 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
Message-ID: <ne2pxdg5fridoixlw46r66lcsl4okewvnucklrpwqiuxkqljmz@7tggpzxev5wo>
References: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
 <20240408-lg-sw43408-panel-v5-3-4e092da22991@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408-lg-sw43408-panel-v5-3-4e092da22991@linaro.org>

On 2024-04-08 02:53:52, Dmitry Baryshkov wrote:
> Add the extended version of mipi_dsi_compression_mode(). It provides
> a way to specify the algorithm and PPS selector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Something doesn't stick with me on the _ext() naming, but I don't have something
better to propose.

- Marijn

> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 41 ++++++++++++++++++++++++++++++++++-------
>  include/drm/drm_mipi_dsi.h     |  9 +++++++++
>  2 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 9874ff6d4718..795001bb7ff1 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -645,29 +645,56 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
>  EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
>  
>  /**
> - * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
>   * @dsi: DSI peripheral device
>   * @enable: Whether to enable or disable the DSC
> + * @algo: Selected compression algorithm
> + * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
>   *
> - * Enable or disable Display Stream Compression on the peripheral using the
> - * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> + * Enable or disable Display Stream Compression on the peripheral.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> +				  enum mipi_dsi_compression_algo algo,
> +				  unsigned int pps_selector)
>  {
> -	/* Note: Needs updating for non-default PPS or algorithm */
> -	u8 tx[2] = { enable << 0, 0 };
> +	u8 tx[2] = { };
>  	struct mipi_dsi_msg msg = {
>  		.channel = dsi->channel,
>  		.type = MIPI_DSI_COMPRESSION_MODE,
>  		.tx_len = sizeof(tx),
>  		.tx_buf = tx,
>  	};
> -	int ret = mipi_dsi_device_transfer(dsi, &msg);
> +	int ret;
> +
> +	if (algo > 3 || pps_selector > 3)
> +		return -EINVAL;
> +
> +	tx[0] = (enable << 0) |
> +		(algo << 1) |
> +		(pps_selector << 4);
> +
> +	ret = mipi_dsi_device_transfer(dsi, &msg);
>  
>  	return (ret < 0) ? ret : 0;
>  }
> +EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
> +
> +/**
> + * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> + * @dsi: DSI peripheral device
> + * @enable: Whether to enable or disable the DSC
> + *
> + * Enable or disable Display Stream Compression on the peripheral using the
> + * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> +{
> +	return mipi_dsi_compression_mode_ext(dsi, enable, MIPI_DSI_COMPRESSION_DSC, 0);
> +}
>  EXPORT_SYMBOL(mipi_dsi_compression_mode);
>  
>  /**
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 3011d33eccbd..82b1cc434ea3 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
>  	return -EINVAL;
>  }
>  
> +enum mipi_dsi_compression_algo {
> +	MIPI_DSI_COMPRESSION_DSC = 0,
> +	MIPI_DSI_COMPRESSION_VENDOR = 3,
> +	/* other two values are reserved, DSI 1.3 */
> +};
> +
>  struct mipi_dsi_device *
>  mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  			      const struct mipi_dsi_device_info *info);
> @@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
>  int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
>  					    u16 value);
>  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> +				  enum mipi_dsi_compression_algo algo,
> +				  unsigned int pps_selector);
>  int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
>  				   const struct drm_dsc_picture_parameter_set *pps);
>  
> 
> -- 
> 2.39.2
> 

