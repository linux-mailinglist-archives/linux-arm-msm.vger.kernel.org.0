Return-Path: <linux-arm-msm+bounces-10498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE48503BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E7371C21958
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D12C3611A;
	Sat, 10 Feb 2024 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/pLwCnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5632C9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558748; cv=none; b=fkNS0b8sxPy8lgOr+vku2Yi9VPeCM7GIAN9XPSFIyfkEjTk5bzEWlsdi/d0K3kR1HeoB4UMenNJhx/HNlsYA8MhmChYclcZTSsPmLuwUBiDk80eckA569bpq8vjA83to64kaycO74VkIzzpREhMumCjzFg/YA8l8C1ohpDax1dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558748; c=relaxed/simple;
	bh=PoW1EUylIqEHP0uV5CWKEzAM2tzU0ggZ/+eK7jog+4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOWk6iXbfqObI9nib+IXTstTZao0CRz9Vl16NFbGBGMhahU1JLE4oJJCcC6eH9y/KcmX7lkcTzbH+/BFnaJiNfsIKOLT7eoG7pC3rqQhTws6+lQpK4WJUAGGJnBibs5OMQA4nA9P4471y/P9DemqsetvYJevj5uzDrRZ/pnmnuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/pLwCnU; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc755afdecfso1296997276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558745; x=1708163545; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/rSrkLEnZ/NnQ2Np+XYCh7vhWSFNxT7YNWrrjOmWEs4=;
        b=O/pLwCnUlDAxAGjS47U7NZH5ZG5Je1GRJJHAgP+Y5zhUid2zwBnT2YOgM0qDnVVfhJ
         w4lR934hkXV23uJKJ2S/AXjJ6Q1ybLNUgfbY9NFLcF7AGpWBiMV3rfP2sfbzDHYVVHJT
         agHvByW8mFay3Sus/U9IaVqkL1z/ehUmNQ7ARpd0k7LJwRMWg27eQVr2/xj/cUXfNGeZ
         xxUv7Ckek1Ad6wbvwUx34LGG5rKcS/i075BnlOiQRGoEFxUhWzmpiMZUcGg4QxK97gty
         1/rI5IF6aDNq84pzlTaDo+xLXmeBilCKLPL7NKRNagi5JXM6lK/G3FIbdyrwQ61Y3AAT
         OHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558745; x=1708163545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rSrkLEnZ/NnQ2Np+XYCh7vhWSFNxT7YNWrrjOmWEs4=;
        b=m1SaDN+9UDsWkw3UiR+AbSMDmguMJqNqbJ0MzHMrSmN9Qes/zRx9oi8PWgcjjxVN4x
         YUPXxqg5xRCoFhAU6hYy/Kav+ES+yS/6O+KWfQotY4l6JpuIqzbR5JGugnZKGwZ0ImJd
         zC5shjVJWPLm4/5BfiqKwUVevWrZNNjz866kH3vNDlpjwtEKNMViv8PIbicRooMYoGRS
         uWHG1nV1/O5Ve4LSWgYiT3fUc1fK6fb0htu4te04GB57jwjW/tvy4PDY7V3PY3l3zlPA
         oycDlQMv+qDu7JLpnFDIdGGOYnWaLbwrAQomDOxOFKZ3n1J/8Ske4TI6C8cn6J2X2W3G
         hgYw==
X-Gm-Message-State: AOJu0YxPSVPgl5LjIGilYQ9DSLSbztVxNPm5nO3atBDfr495lODKpBAX
	Jt17bJM7Jt0490dRIUkv0mghhLZjvOW3vmeoH0ovHZ3Md6yfbujsSeTEQ2QNirrbYRo3OV25qrE
	GlJFZdcmLl8VO5uV1YzqzAaVXYjv6Fca5xQKV/Q==
X-Google-Smtp-Source: AGHT+IEglTdZGiXWk/+m1AJcXQ0fjrneGALl1T3mcJqvkGKmXiD4oxFb+/K2jTdnhOFjYDnniCk51B2y0hARKWKhywY=
X-Received: by 2002:a05:6902:543:b0:dc7:4bab:c390 with SMTP id
 z3-20020a056902054300b00dc74babc390mr1113002ybs.61.1707558745587; Sat, 10 Feb
 2024 01:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-3-quic_parellan@quicinc.com> <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
In-Reply-To: <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:52:14 +0200
Message-ID: <CAA8EJppXmr3QAtv3kOj+VyGrxtBULQFJEFm-Yz+ERHkYN1SuUQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] drm/msm/dp: add an API to indicate if sink
 supports VSC SDP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 11:37, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >
> > YUV420 format is supported only in the VSC SDP packet and not through
> > MSA. Hence add an API which indicates the sink support which can be used
> > by the rest of the DP programming.
> >
> > Changes in v2:
> >         - Move VSC SDP support check API from dp_panel.c to
> >           drm_dp_helper.c
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  1 +
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index d72b6f9a352c1..c6ee0f9ab5f8f 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2917,6 +2917,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
> >
> > +/**
> > + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> > + * @aux: DisplayPort AUX channel
> > + * @dpcd: DisplayPort configuration data
> > + *
> > + * Returns true if vsc sdp is supported, else returns false
> > + */
> > +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +       u8 rx_feature;
> > +
> > +       if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> > +               drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> > +               return false;
> > +       }
> > +
> > +       return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> > +               !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
>
> Nit: we don't even need  the `!!` here. I'll probably drop it while applying.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also the prefix should be drm/display/dp, not drm/msm/dp.

Could you please send this patch separately to dri-devel, fixing the
prefix, dropping double inversion and adding Intel people to cc? We'd
need an ack from the drm core team to get this applied.

>
>
> > +}
> > +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> > +
> >  /**
> >   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
> >   * @dpcd: DisplayPort configuration data
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index 863b2e7add29e..948381b2b0b1b 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
> >
> >  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> >                         const struct drm_dp_vsc_sdp *vsc);
> > +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> >
> >  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> >
> > --
> > 2.39.2
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

