Return-Path: <linux-arm-msm+bounces-16892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94D89D6E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 12:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8240E1F22480
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540DF85629;
	Tue,  9 Apr 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQRABpDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782FB84A56
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712658079; cv=none; b=b36M8IcOJRHNLiUGcDJsAg4uobxqx/z7pkS57R57DXZvaJoZgG/vioWzlBizFvUu2Zr80ZJWEey46jadYmCoDBFUk+7yWaqpXPWAQ/Js/eNt2mV+O/zIjhcNksANrFjxr8mBHVPv3wRZk+5cHj1/q9ESH7LkdA0n/2ng1+0z2zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712658079; c=relaxed/simple;
	bh=xBMuq5ATN/9n0DXa4xw8nkdN5AbMaNC1V3ZyLhX6uPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlHcR4EL36XRbAlJqB1939xkTax1FIwx+0I7ZgWAMnJcYNBrmD2cqbxTIA29e4KcEh8B15SLaLQgGVKrGcJiek81d3l+x6HN8oE6P8BCz0oHuFHkkKg/CQZtsEfwG9U/yoPaE581bFfECLrQLMu0/LUFgEuWlgzVNVAz1ubv7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQRABpDA; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dd161eb03afso4771487276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712658076; x=1713262876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWwXBuCpt2WVV1igmSkZ3Gc1gu3BCr64ng4Lu9JXpTQ=;
        b=lQRABpDAq1OdX0p8yLkajR0WYsdDFrU5AgDXXF6CzwrZxqA+fqvEJj41NKdt8rMDP+
         nBozHjRcXW/KEXRKS1z6AYroqO56sKW2S+3C73bi7LG0fUQ75+ip42Cv148ki+2GsQi5
         DyQ5aQvLGEUPqckHR4DCnv9fmfpAcLgWNgR3dIVC90bvWKRfLOX6AcHdBJv64uo514D7
         Wlbdyd7FxNXImsZA9qapfWbduYnnw+Mng6OwJH3OlW9lU8ad9EX8KsTy0fDq2EKa4sNf
         D0Ojy7c71l7o+9MF5QsTN8r2ESFPpmVQwqsu4xRans9secI9CWbyqFkEs/c8cax59Y6D
         Dwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658076; x=1713262876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWwXBuCpt2WVV1igmSkZ3Gc1gu3BCr64ng4Lu9JXpTQ=;
        b=HE47Xh+ymQSxLw+Gp30gsd8NzbcxFirjt7nKHg0UqVFrKixp7GaIdmvjSMS5CcJd3f
         XYxEXuStX1lvbqbsBXonplp8m2jfxu2nWnpgpmQKgVj0DfGHona6t3+PITZ/Ev6Odh+X
         bVHCSJ336hPEzXjPDTjJd9NJjzWVU49T6NKE+rqArm7IPG7rmlVZlyWqbgxDzotVufZZ
         ID6H8zYxtg5H0ZM9YIL6d2dBBa8NPIUwFLsRJCxYqqvhMW/P6OKh4GOmXhSuaIZ0BH97
         3jUrSltywcA9B6iiLcaYtsnv8S0Vk5K9KJBq4rCzpq7nT/0JYpmxGoA+l+rqL+jnvP8R
         x56Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdfjPTo97bGkG7+5IyG1lXVLB0bto+x3+O5OcIEtS1WmSp5oVbQEMAQsyrs8JCihxjfrxw4cQwoWhjzOOMaAjv9EHmGhfEo+99R6lAtw==
X-Gm-Message-State: AOJu0YyfKlTHgCEy3gcZJBlfC+TjhZh3kqfZ7C8J8tNUoVHfCgzoOA4I
	1YFhp5AFqPARdsQjUCY6Ck+G0YrtRoVmGh7sUAJuPaF4GA5mu2t9ccCEffMipJFWoZnbUvvf0xJ
	91/QgUznSEi3TJam3YvAp067KiBeyAb50Urohpg==
X-Google-Smtp-Source: AGHT+IHB/X3bKDCAcgw4GqXGkGt7Q/04TdhIPWS4terd8u6WP5xftXuoDL3uOiPqtNxbGDmnwR7QD/DSiOse5OxJ/oE=
X-Received: by 2002:a05:6902:1101:b0:dda:a4ba:2a5 with SMTP id
 o1-20020a056902110100b00ddaa4ba02a5mr9368224ybu.63.1712658076559; Tue, 09 Apr
 2024 03:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
 <20240408-ucsi-orient-aware-v1-4-95a74a163a10@linaro.org> <ZhT2tUFHinglhQu5@kuha.fi.intel.com>
In-Reply-To: <ZhT2tUFHinglhQu5@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 13:21:05 +0300
Message-ID: <CAA8EJppzVuFX0FE914teBmnH8NFnASYvPku+wqkMuWQH5YEi5Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] usb: typec: ucsi: make it orientation-aware
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 11:05, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Apr 08, 2024 at 07:30:52AM +0300, Dmitry Baryshkov wrote:
> > The UCSI 1.0 is not orientation aware. Only UCSI 2.0 has added
> > orientation status to GET_CONNECTOR_STATUS data. However the glue code
> > can be able to detect cable orientation on its own (and report it via
> > corresponding typec API). Add a flag to let UCSI mark registered ports
> > as orientation aware.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 2 ++
> >  drivers/usb/typec/ucsi/ucsi.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 7ad544c968e4..6f5adc335980 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1551,6 +1551,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
> >       cap->svdm_version = SVDM_VER_2_0;
> >       cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
> >
> > +     cap->orientation_aware = !!(ucsi->quirks & UCSI_ORIENTATION_AWARE);
> > +
> >       if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
> >               *accessory++ = TYPEC_ACCESSORY_AUDIO;
> >       if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index 6599fbd09bee..e92be45e4c1c 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -410,6 +410,7 @@ struct ucsi {
> >       unsigned long quirks;
> >  #define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> >  #define UCSI_DELAY_DEVICE_PDOS       BIT(1)  /* Reading PDOs fails until the parter is in PD mode */
> > +#define UCSI_ORIENTATION_AWARE       BIT(2)  /* UCSI is orientation aware */
>
> You are not using that flag anywhere in this series. But why would
> orientation need a "quirk" in the first place?

Patch 5 sets this flag.

> I'm not sure where you are going with this, but please try to avoid
> the quirk flags in general in this driver rather than considering them
> as the first way of solving things. Use them only as the last resort.
>
> I don't want this driver to end up like xhci and some other drivers,
> where refactoring is almost impossible because every place is full of
> conditions checking the quirks, and where in worst case a quirk meant
> to solve a problem on one hardware causes problems on another.

Enabling the orientation_aware flag in the capabilities enables the
`class/typec/portN/orientation` attribute to be visible. This way
userspace (and more importantly the developer) can detect in which way
the cable is plugged. We have had several issues with the driver
mis-detecting the orientation and having the valid orientation
attribute helped us a lot.

Note, the UCSI 1.x doesn't report orientation at all. So by default
the UCSI driver isn't orientation aware, it doesn't call
typec_set_orientation(), etc. UCSI 2.0 introduced the orientation flag
in the GET_CONNECTOR_STATUS data, but currently the driver just
ignores it. If we enable orientation_aware by default this will result
in the useless 'unknown' value for that attribute. I think this is
what Badhri tried to evade when he introduced the orientation_aware
flag.

We can probably get the same result by adding the port_capabilities()
callback to be called just before ucsi_register_port_psy() and
typec_register_port(). Would it be better from your point of view?

--
With best wishes
Dmitry

