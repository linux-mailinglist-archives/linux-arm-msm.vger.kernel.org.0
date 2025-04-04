Return-Path: <linux-arm-msm+bounces-53245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FFA7BDAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 15:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79C21898AEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 13:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053231DF97C;
	Fri,  4 Apr 2025 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kiR8xCYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7F8635C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773086; cv=none; b=Fz9k/YJligZn3jaXMnwzfIy99tZr0iiM3t95Vb+q8JqHFWCfXVFeHGiTAYN5NDx+d1lf4eQIAUF0HB+YDr29ZrU7NQqG0CuED2YF63cpdLOsBTjJfXPlWzFSJ+vEqAm+QCMbPIxzyz9+w+JFDXySivKyOBWKow8pUNCnIFycksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773086; c=relaxed/simple;
	bh=GyarVBp62jqrSOtWoIxdE0AcKQ1SkgUJIsWxfsIjo2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kArhj5ZN40jToXxOCC9RDaZNe7yGFSgXqSX52POq8oqbExhu1LgGqJtkF24PVe8xJfnUaKIrRPaS8flFrOtUZCTHsS2jOYdCbVcsTQKeZDi98O/nJMp0muP1x4qlwqpSNno5NguuDaB+M+M9G8baQjD3q7b0Jf0nBJZHEuIUnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kiR8xCYz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2463512f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743773083; x=1744377883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
        b=kiR8xCYzb//NXFCEdI8kL4JzPnIqDO8RJ2TBETTaMPT7Kb7tqPj196So2C1Ir/1ooH
         tXJnj8kHT/PehECevXH2hwuksUBk+O2BMGKrGbdjYqfjsFNFm9BRD7r5zcLVglP0/MAU
         V6gbCB3BxalDubSsD4CQOmPuDr2QaEseF+7+ASWg4zdlKBKUMazhOKtpjXhxGWEMR3G5
         QWoU8026RcZM4LQjSdtiyftwPWYTJ5xbSaIoLpbIC1YIiVRxQjtqv8mic2TR/f52S9T1
         lmPRVJ5EZrVxr+AlefYO5fLtAl/kHqZL6fQQluSG7dZRmMzcFi3Oew7LrlBuJYhRJ62r
         eZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773083; x=1744377883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
        b=T3sk0wbe4LKvy9iLfvrfAhkyGVJPZyzK7mhdmfKNxv00rx3lwEGNqKh9GAl8720cy2
         NOsiP5up08h2k9viNHBwA3/fBCaUodOenJ3uP4ebH0hgAYeK3ffefccaOB1BSg0zDSLF
         3zTjaVAy0kZ+Wlay56Q4Z+x7kpwyRbFfoAQZoOwksyyLooskFjiv+X2JyUwRpUDr1x3g
         hzpuXDSC1UdnoalN/fONnrimvE+7vtvJGkGAIS2WRAvl0km43/HJlreoD1wTLvhsG18R
         4z4lIBY5gTqJCAmO5SiyDx7niBLBd6VknnjTlDgxGobZUQOJ/Sxpq4buWHpkbHi1VZUB
         aczg==
X-Forwarded-Encrypted: i=1; AJvYcCUAAz72lnYupQHozMOMytfq+aRDhAAv2i2RqRhkIdqkOc3mw44bfrp1wvzIxU130cbh1EQ/993ezD0ubkfd@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjQdrcXNfBvS5yXoIukTSCAnT/IlRKiA8pGEV/hGrIMZzmisZ
	XynkjooR4SJFb41kCDfy06w3Zi1Pejga/1rJjYudquNSDuGkTOd4rmB/NX1l4dUxUDKzjeCIVi0
	zh+fOXXwgj9/+EpYRBPgxvi4oGOLMo/e6YtQlaw==
X-Gm-Gg: ASbGncv6nlDbmRt9jxZ+jPs6lCMD+UwChvTO03tPIisZEohK5P90lLl7FK+L6vJYnFx
	3k4c/auctTiaSpzHzgC/OO5biLnw+7mDttYY+2nEgzlUGKaJ2fYYtteMNK95dREV27m1VHBmDsO
	ec8oz2BDZ45W13eGjGfU2P9N6BDoqg0in/CfQasd3F+SBvSqhh3sTSo+dMssE=
X-Google-Smtp-Source: AGHT+IH+MryZk670LI+vb8g6AGQzjTKgC/A+Ysy8cvkGHq9W3yQmNkcMxSeio1SQx6Re2aTqU+InOAD5FiP0RNumBkQ=
X-Received: by 2002:a5d:584c:0:b0:39a:ca59:a61d with SMTP id
 ffacd0b85a97d-39cba93712amr2831530f8f.47.1743773083319; Fri, 04 Apr 2025
 06:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com> <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
In-Reply-To: <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 4 Apr 2025 14:24:32 +0100
X-Gm-Features: ATxdqUGnTvLH_MOTicwPOTsv0Kyq_s2vv3HxYqY2Tmgfq0NrzRxurscl_9sCHeU
Message-ID: <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Johan,

On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>
> > > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >       }
> > > >
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     /*
> > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > +      * correct brightness scaling on compliant eDP panels.
> > > > +      */
> > > > +     pn = clamp(pn, pn_min, pn_max);
> > >
> > > You never make sure that pn_min <= pn_max so you could end up with
> > > pn < pn_min on broken hardware here. Not sure if it's something you need
> > > to worry about at this point.
> >
> > I am honestly not sure. I would hope that devices follow the spec and
> > there is no need to be too paranoid, but then again we do live in the
> > real world where things are... not so simple ;-).
> > I will wait for further feedback from someone who has more experience
> > with eDP panels than I have.
>
> There's always going to be buggy devices and input should always be
> sanitised so I suggest adding that check before calling clamp() (which
> expects min <= max) so that the result here is well-defined.

Makes sense, I will do so in the next revision.


Thanks.

Chris

