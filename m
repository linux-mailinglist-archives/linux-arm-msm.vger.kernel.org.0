Return-Path: <linux-arm-msm+bounces-53197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7247A7B874
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1EF178869
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91082193062;
	Fri,  4 Apr 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="od0iCFjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FF847B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753285; cv=none; b=Kjz5B4513Bl+Y5G62orOeRhWp6/biuCYTEIGXRnXqVCbzqz/b8QnVFwENrk8KJ8LTCE1X2U7N5UuMVPRftc7NlpF5ADhg2pII1GPeWh6Uef/VmLV7ZM/G2gr8KOmXlvCbCiZ+8ZLbWWurIYLlizYvQ40eVcVjcWnbKTpNjPvINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753285; c=relaxed/simple;
	bh=OlVTyvvOtBDRzpaWR1wlPpCpGCbZL+NEpJp5LiS6ghM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cP9FaIu7MbrkAKbe8QrcUc4wQl+wsvY1pbPf0JpFnR4FFoJI0fZs155ATdfi8OBTBjBkIBUoX/4UX/lE91l1sGOqf0moRmyftrXEQSBzZ/jo84fVjmsAF8g/Z7LboQ8BNzfPwgyQXDpLtSrA/g41PTlIpaPy0rucjDOsdn4VTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=od0iCFjf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so16009865e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743753281; x=1744358081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nkuZ4fVXpLrSH/Uvc9xUgqho8doERlfYtGRqy5O0mmQ=;
        b=od0iCFjfTAVn8djDHpo5zIoIuTZI70g9xVrdomwLkGP3Y4y628omvNWX0S949tACks
         l2xvntDwWO837AF32cmnkGLapRtJRvtmCmn8AXV3IquKWn5/2t6KpgNHuFTWwUbu75LJ
         Olpa6lVXTbTJkxLPEjoF4d2H1H+Jv4NzEfVNytE5TSKydt0W/bDqVh3BSWOtT9Qh+qf0
         dXCLz8RchXgVyHDnJNY9UaU0mIUzE+hePAsRAADpvcKfvno2UejzheKrIOkvBKLpSMKP
         0ORSBFqfMOEsbFfMFPsKnAvC/KwrpOl6P6JbHjupHAmk977kaKIvkiDQuqsztrlV4bKd
         1XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753281; x=1744358081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkuZ4fVXpLrSH/Uvc9xUgqho8doERlfYtGRqy5O0mmQ=;
        b=UBVTcJyFqVb5C3MRiQ+4EU+TL4TL1Ovoz3PlosUcSLBaRUgha7Mtz6GlSODLTFKmS1
         6MNQ+D0cQVTIP1B+JeqOWfCiaNajQHDbCqADKR7XTcft5SyWM1n9WytVqBqABA56Tc9E
         yx7pIHktlWDeLsImVc20uJWa3FJAzvNqv0V1ZZnNQrsPRX5/PJs7iK3fLL0bOQaTnOKI
         KYllFu5sSDDOMP+kE2AFTSW0dNkwKImBaT4gdbHc78QZ1/MpyWpd7gU6j7MViURCSd1c
         smDz9TpUnK0TIu0DnrB7i09xlX/A6MAV2S1iy1RyGyON15EhN/4ce8oph1vTlN32CXl+
         IqSg==
X-Forwarded-Encrypted: i=1; AJvYcCVfOt2b1RCMwXWNtzMbqOMlYW3ARoP2jDy7Mcb976mPvVvDpkrAROxKto9YP7M2vKTaOj/ndZIyaehr0PGS@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtUZxEOdz8rMJpRIkQAi1LiCfv314POyuUG28lc6SO/SMUDaw
	vD+W7gZ5dvW07tqqG+FlNzy+rh6CsOiNIOAxK9ot32wZkr9G+Cnlu0vBXfJuLRRKEGqsWa99kmP
	ZodNfRlBLoB3CREzJkj8Y1YaBTETL2xsZXSI69A==
X-Gm-Gg: ASbGncuKh12nTyO5AO3p1lxaNHZtDwRDUjPXiQ3qxvEqOoUwnm5TTr4sGX5wr5+0P4h
	xPBM4RCQcdn2uKGZeE0NQkK5dyhhbOqPD+JdomTcZJWkfAusDojthov88V+bDF2Vzw6Q328dn7O
	RYBLxnzV28WjwueSxrpk2Iz/TcS7UspeiurGpnjBGHtkx5UxZfjEyCuRJeBDj4Yqx8ZRKxXw==
X-Google-Smtp-Source: AGHT+IEnvSgFxsnk8Iaa8NC1B0+A9BOHH30S3F6CvKMOM+vZqDuf3lRprSiLDiCiIG1i3TYnqSn8Gunnhk4ZCcvWNLo=
X-Received: by 2002:a05:6000:1788:b0:39c:d05:3779 with SMTP id
 ffacd0b85a97d-39cba9418c5mr1489289f8f.49.1743753280900; Fri, 04 Apr 2025
 00:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
In-Reply-To: <Z-pTcB0L33bozxjl@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 4 Apr 2025 08:54:29 +0100
X-Gm-Features: ATxdqUE7yCYl5XlKqq5UiiO-MEOiByz26VjIsn9-FP2sQVcw5HFwQVWMPTy5k2A
Message-ID: <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>
> On Sun, Mar 30, 2025 at 08:31:07PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> >
> > As part of this change, the behavior is modified such that reading both
> > _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> > bl->max value could end up being not set although
> > drm_edp_backlight_probe_max() returned success.
> >
> > This ensures correct handling of eDP panels that report a zero PWM
> > bit count but still provide valid non-zero MIN and MAX capability
> > values. Without this clamping, brightness values may be interpreted
> > incorrectly, leading to a dim or non-functional backlight.
> >
> > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > supports AUX backlight control and declares a valid 11-bit range.
> > Clamping ensures brightness scaling works as intended on such panels.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
>
> > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >       }
> >
> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret < 0) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret < 0) {
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
>
> You never make sure that pn_min <= pn_max so you could end up with
> pn < pn_min on broken hardware here. Not sure if it's something you need
> to worry about at this point.

I am honestly not sure. I would hope that devices follow the spec and
there is no need to be too paranoid, but then again we do live in the
real world where things are... not so simple ;-).
I will wait for further feedback from someone who has more experience
with eDP panels than I have.


> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
>
> Otherwise this looks correct to me and does not break backlight control
> on the X1E reference design:
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for testing!


Chris

