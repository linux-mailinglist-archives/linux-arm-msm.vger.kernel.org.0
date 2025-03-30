Return-Path: <linux-arm-msm+bounces-52837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD8A75B4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 19:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE623A8507
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 17:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9882E1D7E57;
	Sun, 30 Mar 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBLUe03q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D61C5F25
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354688; cv=none; b=LNeZpaxpBYWtmKb0uLKjP54I79AvAJ8kGi542LQ31wXC5nGSg2X5mlpc+rPCn9k6P4uEM0SliQXU5Uo/oN2gPwLps1/TKNtt0XfG7yTb4bUjswFNmw6SqsmN8GJb1BAp+jVEOHW23NQ2V18jDkmWl9oNCLQDHC106bv6qqwz9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354688; c=relaxed/simple;
	bh=vrOmDU2L3or7tMPIaYN+lHEC3T2bj1QLD0Aj0Jn2JM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecQR+3eEYK+cWhIhaFiOd+YhVhdCp+hCFKha/L5J1Nf/a5Gy3glJ/d/TE+cIyg9dOyMnTKfTCfnldI5SpRTgs1lf2i3Mvr7W6+0NWX6t0sfeWaHufRMfzZuNnx7LembK+4R74Z9QPySUPy9tW7ANYN79/zJPgR29ap9OSnjfcgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZBLUe03q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1602990f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743354685; x=1743959485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R4b97t2iNZAKut7KLkS83Rc79uAyUXLWxPQ6C5bVTrU=;
        b=ZBLUe03q0/KsHINQin8t2MrfIG0q2kWwGjIUFWf55iW4pGGSwh4mWqontQhWvdwSLA
         Z5kQSrfKGFbzCddrJIYPokg8Dj5wiOPAucuA22Aq2WAlQFUa1X61xqXxjbxMFUBAgsuF
         /iWCeoP9MxzXR2DcuPsHvzUQqFXqbyg+DbAc1wsXZVlE4QKXA9oJwXcrO2XiTQyW3Eoi
         YKbrIurpugUi5X3OPi+VLc0a5wAIvT3F+aOkg+JLqzlSgpVMOVMN7VDYNV5sXpHDJu7I
         P/WwMl42Yt50GlBJ5E+S0z2Ij/9blxqLGvpDOVHPegXeZktICFrkqg72RcdU5DeKS4Jw
         92lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354685; x=1743959485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4b97t2iNZAKut7KLkS83Rc79uAyUXLWxPQ6C5bVTrU=;
        b=sjXab32B6M9JgApfsAsVkIvcR8NRA7U2gceLIf9FeuThejwfh2jbKurH9uvWUVQ/ok
         iHlegsDN1jkmlfxtThlC1LPpGSIF1S7B26LfhlEQifo1A6qcH9uUL19sV57FO6Cq55cb
         O7xw2YQuxT5W9a3T1MKkV/JUlQUPd6MGtX8hli4l7bvCnPqtO1BB6aBpxbkX69bu1zt7
         pD13Kouuv2NcOjZWIKT5pcLLet3e+zAqbDtKXvg6PLZR4HdJMry7c2HwvpswZjX0uko/
         +tKDptMNmY1ITw0Q9D0O4ADDjcjL7esfMpWEQ2pbz4WXjSBcwLEp0zIyET20Inn6o0/l
         46Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXRkDbHZANjHAl5EReFsp4sHOLoJggtkryXBCOWwoqlS7dOIr6S/hlSviSIbUhJ7n+q5YiNQbT0jqU8vEdY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt27iDzXuRoGQWXf3Zha7E0narh28G3/SRUxgWtzIQniLi1APv
	AUMubZQ1xuZNbBp2adeQzdMWA/64KGGvxjpk+YtJe3p+4UdHlsbgGasMQzJ6LKVzMvrK96zqshn
	aphmXFLbKATKKN21ACk5BUL+RPd+R2gs4Ai+c5Q==
X-Gm-Gg: ASbGncsDWIqPvJDeJx5FyRvN5gzse0Vwa3yua1Rn8MLS8tfMTjyJqe1fDIhauF3GVOW
	20h55y8oim5+7ATFDTOZY1Ad7tEwcHtYVD738NUn7535Gt2hVpwk3SPGknCfrgcxLnMGw/Mgge7
	h+QRaQDUXgqoQYfJO5thbW+s49L6obbXSfpLYgL7RBzxHrnlpPnELqzSKSy/w=
X-Google-Smtp-Source: AGHT+IESmkFX9WGZ14shJazC3f3V8SS3eV+ERa/nkxZ/7Aq1l8r8Bj4//3nkJZVG/8zeTXlVCqZeeX9eCIOFP7LVNXY=
X-Received: by 2002:a5d:6d8b:0:b0:391:3049:d58d with SMTP id
 ffacd0b85a97d-39c1208ebcbmr4512836f8f.0.1743354684676; Sun, 30 Mar 2025
 10:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
In-Reply-To: <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:11:13 +0100
X-Gm-Features: AQ5f1JrJ3kNFlKh7MDeTNlz0Vx1kwpKl57VlL4YR0kRzy7Kt_Ar9ppBDIk2TzCo
Message-ID: <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > handling of eDP panels that report a zero PWM bit count but still
> > provide valid non-zero MIN and MAX capability values. Without this
> > clamping, brightness values may be interpreted incorrectly, leading
> > to a dim or non-functional backlight.
> >
> > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > supports AUX backlight control and declares a valid 11-bit range.
> > Clamping ensures brightness scaling works as intended on such panels.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> > Changes in v3:
> > - Properly rebase patch on top of latest version of drm-misc-next.
> > - Make patch more generic by clamping PWM bit count to advertised MIN
> >   and MAX capabilities (suggested by Dmitry).
> > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> >
> > Changes in v2:
> > - Split backlight brightness patch from T14s OLED enablement series.
> > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > - Rework commit message to reference eDP spec.
> > - Rebase on drm-misc-next.
> > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> >  1 file changed, 30 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/init.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> >  #include <linux/seq_file.h>
> > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >                           aux->name, ret);
> >               return -ENODEV;
> >       }
> > -
>
> Nitpick: please keep the empty line.

Sure.


> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret != 1) {
>
> No. Please take a look a few lines below, where you are removing
> corresponding lines.

Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
ret != 1 too, am I missing something ?


> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
>
> Hmm. Why? It was 'return 0' before and your commit message contains no
> explanation.

Yeah, basically returning 0 here would not set bl->max but indicate
success. Is my logic correct? I will simply update the commit message
if so.


> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
> > +     }
> > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     /*
> > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > +      * the sink must use the MIN value as the effective PWM bit count.
> > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > +      * correct brightness scaling on compliant eDP panels.
> > +      */
> > +     pn = clamp(pn, pn_min, pn_max);
> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
> > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >        */
> >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> >
> > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > +     /*
> > +      * Ensure frequency is within 25% of desired value.
> > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
>
> Huh? I don't see a corresponding code change. If you are fixing the
> comment, it should come as a separate commit.

Sure. I will drop this hunk.
I folded it into this commit as it was a leftover artifact of moving
the code around.

>
> >        * satisfying the conditions below.
> >        * - Pn is in the range of Pn_min and Pn_max
> >        * - F is in the range of 1 and 255
> >        * - FxP is within 25% of desired value.
> >        *   Note: 25% is arbitrary value and may need some tweak.
> >        */
> > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > -     if (ret < 0) {
> > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > -                         aux->name, ret);
> > -             return 0;
> > -     }
> > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > -     if (ret < 0) {
> > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > -                         aux->name, ret);
> > -             return 0;
> > -     }
> > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > -
> > -     /* Ensure frequency is within 25% of desired value */
> >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
>
> --
> With best wishes
> Dmitry

