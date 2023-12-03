Return-Path: <linux-arm-msm+bounces-3151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB25802620
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 19:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF38B208E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4698E17736;
	Sun,  3 Dec 2023 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unYOaL6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898EDE8
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 10:10:43 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-58db7d8f2ebso2533248eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 10:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701627042; x=1702231842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
        b=unYOaL6GmKGiXQQvTG3eiOK0jsCalp+D5BcbGe2XQfAv756BIqOvNo9m6J6D6JfFMA
         vutdEKQ3i9xcZH5u9N6By923F1m316v9Qu2vZQatBhQYznZx8JonJVbqs6Olhp4IUrMC
         C2R4zsXgNBHWbf9v5LrAN4s0yuKaoKdZKkyAFA781CRekh74nE5X/EGbRZy0Qtvj7sSv
         93CayLV8+tBjrJG3g4u5o+LfJtvgoW7yk60NjjQ+NfWa2Sb84LKnt9JLcg9l+9CwyC+W
         krdu/Pusa3JpopTeJMffBIFcLWOAUEEOeZ8IN8zI6WbnsbDTqSstsoCEMTRAJamAMVPl
         PBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701627042; x=1702231842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
        b=TWtgFiwc06mEuTz6ETfOf7lpKMy6sJcKEzn1kZFQv6LOVIPoKFz2A92GASbEr6CMDN
         ZEWx8q8+a24JYUf4asfwvD/B2/0KaXDRQc5pKxoOel2xKk/wFF24cd+hDTCx60uvuEu1
         82xt72EOiuZSZQoMsqSUE0N/t9gVeCx3FsUG8wToN4hfpfPKKgh8b0y6zx+Sk6l8ea1X
         C3Ns3kdGv+sagQy8FUQtiJpynwWdyOtomHcseaN7A1FVYI0d8v8mJeoxKLkfm01yJV6c
         e1n1lrlPJdD7sc9FsqqZY6hgOy7MjFfJxEmi0EhV1xLIK/Sam1wuhMcCndEgJ19TE1b+
         cR5Q==
X-Gm-Message-State: AOJu0YxNVlQOi95LMCAJ+ZcP2N0OXhJKnWWRj1FhIaf2mSJnfQBBzEWm
	OSvWwMXCEo7pOt5xsn2f6SIS/1hgzVvY88PMV7TZ6A==
X-Google-Smtp-Source: AGHT+IHb3Z+Gg112hSwn2ALLmEQLugH9ogYS6oGgilydDX+dwhOwywfw0uwnNsBepyMljqTdUfek1dtr5E8c4G2RWMA=
X-Received: by 2002:a05:6358:9214:b0:169:49f7:cb1c with SMTP id
 d20-20020a056358921400b0016949f7cb1cmr3149078rwb.8.1701627042402; Sun, 03 Dec
 2023 10:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org> <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
In-Reply-To: <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:10:31 +0200
Message-ID: <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
To: Simon Ser <contact@emersion.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	quic_abhinavk@quicinc.com, ppaalanen@gmail.com, 
	laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com, 
	ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Harry Wentland <harry.wentland@amd.com>, 
	Sebastian Wick <sebastian@sebastianwick.net>
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Dec 2023 at 14:15, Simon Ser <contact@emersion.fr> wrote:
>
> On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> >
> > > Some drivers support hardware that have optimizations for solid fill
> > > planes. This series aims to expose these capabilities to userspace as
> > > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > hardware composer HAL) that can be set by apps like the Android Gears
> > > test app.
> > >
> > > In order to expose this capability to userspace, this series will:
> > >
> > > [...]
> >
> >
> > Applied to drm-misc-next, thanks!
>
> Where are the IGT and userspace for this uAPI addition?

Indeed. I checked that there are uABI acks/reviews, but I didn't check
these requirements. Frankly speaking, I thought that they were handled
already, before giving the ack. How should we proceed? Should I land a
revert?

-- 
With best wishes
Dmitry

