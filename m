Return-Path: <linux-arm-msm+bounces-16177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D334A896293
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 04:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FD82822C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 02:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A663A1429B;
	Wed,  3 Apr 2024 02:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lne1jgL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9679F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712111747; cv=none; b=atr6u9afBzuU5HPE/qmHteK8zzFvJLyWvLxbI5DvkgyyRYd6aOyaA9zNijGuDgF82VvkFNeQ8ZU5ak8eKzX5ckCN/oF6cVTh6E1sq8kaXDklWv6i97rRTmc1/+4qBgaof5Gj3BioyTlqIIZx0++db3TjGf/PJNmT6aHM+OYB08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712111747; c=relaxed/simple;
	bh=b7jgja4+NYvVsB/7E56PfTSynaKJrT20mBx1wX6uiZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njk5lXpsgBsdEAseM+L+b1x8XPH3pF0rTa30917qdGDko7j3NSx/kA4AtXdiUTZ2Y6ZxLR56FEePdaxIZtfub6WsD6BGn2sczJ7fbPbSwbCWQOf3l90vTGFJEqNrnGeLMzTu13bywgwIi/dBX5WvT1TlR0iIIRYT80MR661ygQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lne1jgL9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-515ac73c516so443216e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 19:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712111743; x=1712716543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8VzvbIvZUqUsbzF90itURicxpIVMmC97qdhjpsuRak=;
        b=lne1jgL9PMNV9qFtfbn7TgsqJ0GEl1ZBISHIRHS9DP1ckF5QYIweqj6BBn3WkJk7jQ
         u6jxSV0oKn0rd+O47aoDbnjvexrSbWrbBWOH/3E+kvglLb8rMypwJuHLWJgfBohEoENH
         O/j9WjCPIrZPS7iwuNg4qdUa6o6ultRk0LkD1CUNOWUQ2NB3Q1vzIDilrPijuY1pxxVA
         fhnccNakCR4U6Mt2MZhrPQrfn8O4zKWfZLwwewsMdUpRW3f/t/dowzMBGs8H0JThSNs+
         ccxyiZoIZFeRkCcqdXjRkeB6SvL8y7FGzK30vGbM9XYmQSKmwE9Wp2rRXrHqDaXFXjtb
         vayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712111743; x=1712716543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8VzvbIvZUqUsbzF90itURicxpIVMmC97qdhjpsuRak=;
        b=scNPMVntLnsm7ZXDq5NB9j80N9vJVtlo1CqHTsKAFj2GqQhkG9OkYpXdd0oCR1X2RY
         Ieo8twU5THebyodN7rcuc/k5F1uXIXK741S5XvdPVYRuCeNZUyvFd3sxXJb+4LHhKNdY
         vEl/E823FIq8RWGZOc4vCUehH8uhyiKD2vP6A9CYDM5nLwIG+1aXpRNuMtPPwc50a1g8
         /RkWtZDLR2xSLQVxAfnbVamsgoGe3BBxsGuk+Bq/Wg7NeCGdi9OIp6fF7I0YokczAPbf
         OP/n/wRpfU8cby2Z8aRRVAubKPLZuTTqx9TqjWDt//tAin5gQ+kvsxhl158pv2owwFxj
         1bFg==
X-Forwarded-Encrypted: i=1; AJvYcCUFBaYKoeK+Yak5s7HY28xTE4x348EmXKfE3Bi+KlijNBi86y7RCYh7bUEDpm+7+qvK642f0PvAMmtnzA3RgbC8kwGGO6OfZRuNZwmtzA==
X-Gm-Message-State: AOJu0Yxpeg4Rq82p5dpCG7X8Qyi3dgRGzy1D9Jo7H+5gvkZGgyG/lIbT
	eMnnurZ6vfHPqKPLm6IvJXx0Lbsj/HK4vrDBnAh7oovRvPSFhLnfiVqTYs0GTNE=
X-Google-Smtp-Source: AGHT+IEpBE/QniA46Q09+tzLd/yM8WPzlg3OeroU44yFIFF96IeElPJ3blpP497K5qTVuhDGY4AjvQ==
X-Received: by 2002:ac2:4827:0:b0:515:c17f:725c with SMTP id 7-20020ac24827000000b00515c17f725cmr378282lft.2.1712111743419;
        Tue, 02 Apr 2024 19:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b00515c7ec957fsm1878878lfg.220.2024.04.02.19.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 19:35:43 -0700 (PDT)
Date: Wed, 3 Apr 2024 05:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
Message-ID: <h3tc6hc6pomfjegionssupcxqz3az7zhxexfbu4jwqxkpxyzp4@6gldlmtp2jxo>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-3-144f17a11a56@linaro.org>
 <dgvztw55cr4wsbfxhf4ondzhaetodfcv4pndfug73suae5vp3v@4ozlmmsemfbm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dgvztw55cr4wsbfxhf4ondzhaetodfcv4pndfug73suae5vp3v@4ozlmmsemfbm>

On Tue, Apr 02, 2024 at 11:09:29PM +0200, Marijn Suijten wrote:
> On 2024-04-02 02:51:14, Dmitry Baryshkov wrote:
> > Add the extended version of mipi_dsi_compression_mode(). It provides
> > a way to specify the algorithm and PPS selector.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 33 +++++++++++++++++++++++++++------
> >  include/drm/drm_mipi_dsi.h     |  9 +++++++++
> >  2 files changed, 36 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> > index 9874ff6d4718..0ecbc811eb7a 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -645,19 +645,24 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
> >  EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
> >  
> >  /**
> > - * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> > + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
> >   * @dsi: DSI peripheral device
> >   * @enable: Whether to enable or disable the DSC
> > + * @algo: Selected algorithm
> > + * @pps_selector: The PPS selector
> 
> Not a big fan of paraphrasing the parameter name, it adds no value.  How about
> describing what this parameter means and what it does?:
> 
> 	PPS table index to use.  Corresponds to a table pre-programmed on the peripheral
> 	or a table programmed with &drm_dsc_picture_parameter_set.pps_identifier.
> 
> (That should be a valid kernel-doc cross-reference to the field)

I don't think such meaning is defined in the standard. In the end, the
pps_identifier is 8-bit wide, while this field has just 2 bits and 4
possible values. The standards are pretty vague about this field. 

> 
> >   *
> > - * Enable or disable Display Stream Compression on the peripheral using the
> > - * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> > + * Enable or disable Display Stream Compression on the peripheral.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> > +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> > +				  enum mipi_dsi_compression_algo algo,
> > +				  unsigned int pps_selector)
> >  {
> > -	/* Note: Needs updating for non-default PPS or algorithm */
> > -	u8 tx[2] = { enable << 0, 0 };
> > +	u8 data = (enable << 0) |
> > +		(algo << 1) |
> > +		(pps_selector << 4);
> 
> Do we need some size validation (if > 3 return -EINVAL)?  FIELD_PREP() might be
> too heavy though.

Ack, let's add it.

> 
> > +	u8 tx[2] = { data, 0 };
> >  	struct mipi_dsi_msg msg = {
> >  		.channel = dsi->channel,
> >  		.type = MIPI_DSI_COMPRESSION_MODE,
> > @@ -668,6 +673,22 @@ int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> >  
> >  	return (ret < 0) ? ret : 0;
> >  }
> > +EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
> > +
> > +/**
> > + * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> > + * @dsi: DSI peripheral device
> > + * @enable: Whether to enable or disable the DSC
> > + *
> > + * Enable or disable Display Stream Compression on the peripheral using the
> > + * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> > +{
> > +	return mipi_dsi_compression_mode_ext(dsi, enable, 0, MIPI_DSI_COMPRESSION_DSC);
> 
> I hope the compiler complains here that it should be MIPI_DSI_COMPRESSION_DSC,0

Nope, it didn't. Both are integers.

> 
> (Enum algo first, int pps_selector last)
> 
> > +}
> >  EXPORT_SYMBOL(mipi_dsi_compression_mode);
> >  
> >  /**
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 3011d33eccbd..78cb7b688b1d 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
> >  	return -EINVAL;
> >  }
> >  
> > +enum mipi_dsi_compression_algo {
> > +	MIPI_DSI_COMPRESSION_DSC = 0,
> 
> Add 1.1?  Or does it also allow 1.2 (when the version is also set via PPS)?

I have only DSI 1.3 at hand, which only talks about 1.1. I think 1.2 is
allowed by inheritance. That's why I skipped the version here.

> 
> > +	MIPI_DSI_COMPRESSION_VENDOR = 3,
> > +	/* other two values are reserved, DSI 1.3 */
> > +};
> > +
> >  struct mipi_dsi_device *
> >  mipi_dsi_device_register_full(struct mipi_dsi_host *host,
> >  			      const struct mipi_dsi_device_info *info);
> > @@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
> >  int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
> >  					    u16 value);
> >  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> > +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> > +				  unsigned int pps_selector,
> > +				  enum mipi_dsi_compression_algo algo);
> 
> Oh, this declaration is inverse from the definition...

I'll check it.

> 
> - Marijn
> 
> >  int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> >  				   const struct drm_dsc_picture_parameter_set *pps);
> >  
> > 
> > -- 
> > 2.39.2
> > 

-- 
With best wishes
Dmitry

