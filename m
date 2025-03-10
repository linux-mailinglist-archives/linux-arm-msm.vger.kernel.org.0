Return-Path: <linux-arm-msm+bounces-50876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CDA5A4BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2FFE3A5EB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 20:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F891E7648;
	Mon, 10 Mar 2025 20:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z7fDzV+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847511E5B75
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637893; cv=none; b=JaHroKUmyna7p9ywmKUNSssjwnJCChNn+ICiKUCJkgzWr92iRlUi+J32OsZfVNg8M0abjI8g2WRUQ+Cu1y2B49dIl+KTBpPnCPd0lcO1jWaCC9xDwdLdT8ONcs1r2tUMkCqQ8nBV1MwhzwhnjoaPVeBAayDBczpbvhus35mIaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637893; c=relaxed/simple;
	bh=EL25rNL51TXTvxkbPCKINtP+7+2cd264OtWDnAl9qwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbItjALRBMgQM8H/WHfQYRAYM1PP1lAYoxY2JtAJSfMFeEXnP9jDEwzFICyg1xAsBVp9bKeJAkNGR9ChF3Uunj+qL7vjq1UR8houi+2pgAqA6j7AmJGjQWi/E1YXNWHzdQg8SRR16LJnPV2KQ5xKTIv3zwc6mclgwBw0MCy+g64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z7fDzV+G; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfed67e08so27022881fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741637888; x=1742242688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
        b=z7fDzV+GgUCsalA5GHaGQUloUUrUk3VZ7Xodudvt6c9C7iZrZZpd0p2HFZxO2IAtq3
         KkqcQ93M7irvtEC2L7GQHFXSWrz0d9IiDAYhs2TpR/DZps5F4y3RRnCnjvSBsWwZm7qx
         lfLCMDWV1gq5j/yCAELSIAwi04ZCuhxyn5gScZuy0Lrd5MXcOlHVQ63yV3d8hvpPqQQu
         FOhUJKoaNKNSujpyKe1BPgJnwVsG7x7HBFsofYv4CO9EFLGxc6ndLgdK+oTAoBLeDemW
         gK5bVzsjXBL7kelIyENWfc4vF7Vrz9DM9rQXalpa7oGcqFmprfuvf8IJ/6ed/JkuUTk/
         B28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637888; x=1742242688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
        b=DyqdfgYo6eFrL2+7wYiUK8OXmh77GRb8B86dYgNzpffv8iKBdZPTfsWZx4sJIAqeJ5
         I7XTGSmy+6R1hVWcXKB7dRSjLdKGvLkTeNAQjDXvL9jmoeg8QuPdEApVTwr6PtS/KCAy
         CrY0XeUH1/vFBKIcaQXU9+K8PBSwbOslc8Z829VZNuYt6VmszywM78DInOCViHLS0u4u
         xsXouLY/oii13dpbv+EqC/8x2BSQ4ujHCfYs8ourE8142oOU4uIAlRNUNr98wgkyVLnY
         ajBQ6eqWum94ySukkEKRmUEhbZDm2gw0/OF+TSRpBneiR3pVPM0r9AcF+pk7qzM6Njrx
         OONw==
X-Forwarded-Encrypted: i=1; AJvYcCWBeLAeWE0I9d1gs4zIt4QuIAg/soJYK2WIC4VOmNLgCEHXIpdRYZeLg8gZhAeakNAtgP98yspfJHVK7a8o@vger.kernel.org
X-Gm-Message-State: AOJu0YxpAszSC+AlS78GDrLU4z5ipG/TBLgRkq4UR4czkowzNK5D1/Xj
	L4DoWS4EnaA5ucZ8J2XZXfatUubGguyPfuzGVfI6x9XYCTkHFItfSKZbz10ZxoWpyKrw4uOfrB2
	c
X-Gm-Gg: ASbGncuOJp8f5076AYalD5qubYo64YJYe1In+bNu/twHEHecgOSa18TVc0uj9Bp3MO3
	hHPT7H9sdkkBdKKQjIvnIgeiJ2WaF1Op+fR4h+f8yrW/rn+/t4qAibpms3jKb/v7Lsh9Vm3qSGH
	7ZSXfiAy+Nvy88LJEkhenVfMHwpetUpslIZWGVZkgTsfPaUVOns+R4/VHa6DoHBi5JDcfne1+ch
	I2YooA4ennuiDrTQZs3LaUDKrZMyHP5b9Rstxpxoh++lZGeS990XuCBeJVN64N2DEG+TlkmVztA
	9E+SpkOJHG2nkCI/XvZZhafk+bGY7FFPr2EGYSfLsxmN0tFq4ZX2MkGVkD9U27/PpqVUfvmjJ+J
	P8vKe4mkVyzPj5hR4Id6+G8NQ
X-Google-Smtp-Source: AGHT+IHcA7kOtf3sam4WAbu1ps2qyynLobUE0HG0axG5MF7JuYSDH5Zq3T6DIc7mWO7eWXCbFWGVLA==
X-Received: by 2002:a05:651c:3c3:b0:30b:c569:4665 with SMTP id 38308e7fff4ca-30bf46468dcmr39513851fa.29.1741637888405;
        Mon, 10 Mar 2025 13:18:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bef40f9cdsm16595941fa.48.2025.03.10.13.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:18:07 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:18:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-invisible-married-firefly-945c84@houat>

On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > values in the VC4 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> > 

> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> >  	 * KMS hooks. Protected by @mutex.
> >  	 */
> >  	enum hdmi_colorspace output_format;
> > +
> > +	/**
> > +	 * @tmds_char_rate: Copy of
> > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > +	 * KMS hooks. Protected by @mutex.
> > +	 */
> > +	unsigned long long tmds_char_rate;
> >  };
> 
> This should be in drm_connector_hdmi if it's useful

That would mean bringing the state to a non-state structure on the
framework level. Is it fine from your POV? Is it also fine to use
drm_connector.mutex for protecting this? Or should we be using something
like drm_connector_hdmi.infoframes.mutex (maybe after moving it from
.infoframes to the top level)?

-- 
With best wishes
Dmitry

