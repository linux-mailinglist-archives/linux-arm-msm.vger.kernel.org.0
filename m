Return-Path: <linux-arm-msm+bounces-52757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41AA74960
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9487C176E8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A766213E7D;
	Fri, 28 Mar 2025 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cZmlAT3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB20621ADB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162149; cv=none; b=QmnQgpx3PA3ezAHYVpdXQTKkyzGgrB7WYiNcIRCRTzBRB8SPuIlyq7xF/hZjyT2sL9b/Dw0XskBGSVWVV/zp1iMeQVDbs6ziB7IC/KdsALIWTWHgId7WbKJf7rXJ3oqinYhFFgJu/MXw6Z+5ZCbb7LuT9De4DaiTTtmW2Ar2Ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162149; c=relaxed/simple;
	bh=vZ9aZc5oltQu+Eme5irpb4TgemjkwrHbSOE8v32c6yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9Re5W0QoIW+ju3rsLCQ0MAC0seJdaRgKRmYMM8HY+lQLggjT5G4YXKghM3WS8lQ4hXZdooTGi8cJZBsHLPxCO61z4oKCqMrXK7f6mqM54THo3aY4osmpUDh2i/99EV59FWpcZTzSAuxKzQ9ysnlV9J4l6YllVXXSR2IxS+oKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cZmlAT3x; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso15755425e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743162146; x=1743766946; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AS/0CIBsi1C255m5jqDocxDCw5rV2cEQ21vMKmlqX4M=;
        b=cZmlAT3x3weqEIefP6gSZ3+7Ud4N+zrjeOEOn2en3REGt6uvIHC7APpg/pGXwJeNt8
         +4ZDQQ3rPEtj+UCi77S7yX0zcYDH+qKGnvXedI5EuRXhfO9xp4JMLyqVAfEPyzgeDzvt
         BpxDA2aD9mHS8yxjTmqfJj3lG4ZxqF3hKWUSWm62brj9n6FdCEOf7W9UrnqQuF1kv6NU
         o0DcUpKEEWOwKuPN5Cxvc5U4mm6ol2V9QdmnQNcuSQ6QLjQxb9fChpHXZzf8HTgOtl3x
         ZCbL7UAw3bPaqHNa4pTGpQDTuCMRUTeJFtTMinZsacHbUcih2qtOiVyCWpEinjm5OXkd
         Kxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162146; x=1743766946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS/0CIBsi1C255m5jqDocxDCw5rV2cEQ21vMKmlqX4M=;
        b=fXC/k1hLI7jPafTfjbCp0+7Xvk6DD0LFTWphI/W2SfqBQ25UWlcnFLdBauNafVu88Q
         CPAl9UcEtTMorI7bVgoIxek5drR/F+mObd+aHjjcHBiQuat70T76pc0KqqszTkvvrS8S
         GkL7pCmTGO2CtS74MEODCRcEtCWs3M+0eX5unY4xmbJ1XYpfNzMZRN6CIT67u/Av2dKa
         pnzsjFoAo1+gLXu7yPqYmzBjg4F8SQRtR5wrPFfJD8EadF5mMG0Xue40ue5gKXGMZjNP
         UNDHxR+POur1vY9t6Lz/SgeIPzmY1AIyIFhJ+ST4BmQcsj+bQkEuJG/rXtkZc0r46vKP
         dzcA==
X-Forwarded-Encrypted: i=1; AJvYcCVoVauCgvNJhzRt7z0qYss6mig2TIy5TeHAMpLgx0iYQiOTtK1d47YFTwn78olIH1HrCzX3SfD5fQrLJnYb@vger.kernel.org
X-Gm-Message-State: AOJu0YyfnEZ/gEzMjrm0872wt2AlZLxw02XG0/wHkapnRKnvTxQOrp7O
	Lp7HhswD9UdlE1VYymnPMHaRF99fkniFgaL1KQuKDOgfO+GOjRjcBwwIVmUUgFuW0zPbLe53UtD
	8Z2exk7rcIPotg9nqZelA9nk7KNBPLvpBA0LR2w==
X-Gm-Gg: ASbGnctO+xQ4YBp2upJWV6hIMZeSbzX60QZAxtAgSvN+kT7Z10tWPT9BjbDUwTpQXIr
	4ldRpXcpc7oE21v7PFeaFf8Ys191iMlZEyqKYZOySG+OoF/VrcEUyQHQH+DpIm1u4e4tLwXilhj
	k2n+bNARk0U9wilka9qpulhxQu3wMdcp8JwtX/H06/xbAnE2+bg+fpWHtQmo5SYawLclH9FA==
X-Google-Smtp-Source: AGHT+IE6DFwevMI8umQ4tgADXxarbv7OqWe6Kyd18SAYlOSWPmoAsgrW20v3mTBE3zBuxdlvqAAzLVExBU+4czelYKA=
X-Received: by 2002:a05:600c:1d1b:b0:43b:b756:f0a9 with SMTP id
 5b1f17b1804b1-43d84f9a35emr69100225e9.11.1743162146129; Fri, 28 Mar 2025
 04:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com> <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
 <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
In-Reply-To: <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 28 Mar 2025 11:42:15 +0000
X-Gm-Features: AQ5f1Jq1trXav_HDawVpwNUELxJsb6YJEQRW9zlHX1OK6pOv_cw0hfl6gg857F4
Message-ID: <CACr-zFCuAm2eUOV_Rm1fzS-rsDMy4E=-euiUTJwL5h4z4cvbSA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 11:25, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, 27 Mar 2025 at 20:19, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > Hi Dmitry,
> >
> > On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On 27/03/2025 19:25, Christopher Obbard wrote:
> > > > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > > > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > the sink is required to use the MIN value as the effective bit count.
> > > >
> > > > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > > > valid non-zero MIN and MAX capability values. This patch updates the logic
> > > > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > > > backlight brightness values.
> > > >
> > > > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > > > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > > > bit count of 0 but declares an 11-bit PWM capability range.
> > > >
> > > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > ---
> > > > Changes in v2:
> > > > - Split backlight brightness patch from T14s OLED enablement series.
> > > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > > - Rework commit message to reference eDP spec.
> > > > - Rebase on drm-misc-next.
> > > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > > ---
> > > >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> > > >   1 file changed, 33 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >   {
> > > >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> > > >       int ret;
> > > > -     u8 pn, pn_min, pn_max;
> > > > +     u8 pn, pn_min, pn_max, bl_caps;
> > > >
> > > >       if (!bl->aux_set)
> > > >               return 0;
> > > > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >                           aux->name, ret);
> > > >               return -ENODEV;
> > > >       }
> > > > -
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret != 1) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return 0;
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret != 1) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return 0;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > > > +     if (ret != 1) {
> > > > +             bl_caps = 0;
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > > > +                     aux->name, ret);
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * Some eDP panels report brightness byte count support, but the byte count
> > > > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > > > +      */
> > > > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > > > +         && pn_min)
> > > > +             pn = pn_min;
> > >
> > > I wonder, what stops you from implementing this part according to the
> > > standard, rather than adding a hack for 0 value.
> >
> > I am simply quite dense, I do not know this spec or the DRM code well
> > at all ;-).
>
> Okay, no worries. It should be pretty easy:
>
> pn = clamp(pn_min, pn_max);
>
> No need to check for pn being non-zero, etc.

I think you probably mean:
pn = clamp(pn, pn_min, pn_max);

I will look to use this macro in the next version later today & make
it more generic; thanks !


PS: I also found someone who tried to fix this in 2019; I will add the
author to CC of the next version.

https://lore.kernel.org/r/dri-devel/a766c3498d3754b598a8bf66f59a76e78ec57080.camel@intel.com/T/

