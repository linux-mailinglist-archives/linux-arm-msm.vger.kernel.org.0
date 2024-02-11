Return-Path: <linux-arm-msm+bounces-10557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3BB850843
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 10:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A72B628360A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319115915E;
	Sun, 11 Feb 2024 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Slwnpc/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A659148
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707642044; cv=none; b=iZrPLKe0m01etrf11KjjIxrjq/mQDn0cHD0AI+LtZ2Uh25+K59RFXe7sIk2LAIlAzjhzayRfA9AcCTNkVXq3JVSif6S7oxp43MEgp4mTsJlwogsIN2BZxkjSNKAWUlheMl3x12X1cq+dHcKmEMkGw/dK7ZAvn4zC+KfkOYNNpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707642044; c=relaxed/simple;
	bh=XrHwrzxKGSdwsco+wfaSYcU3QfPkEgggvtskzGwRyCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgU2IND3zZsfAWz216R08RQ8rMJ5jT9F/rPtM/WALTxIunhh594jL3D/J+lKgs9H3nogiyYh8HI+4r3ZC/A07s66QgF4MI86Wi7q42BPxNGqMFxNZyF5aP08BNi4Ml8tGxxEDnUXr+Nywq0V9Xer6R0RRdj5iSHcuP2MeUCh0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Slwnpc/Y; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74898644cso2219221276.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707642040; x=1708246840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mi/SpXz7LSnm9nqKcH5GMvmtd5xZKu9gLFg7P9Q1mlg=;
        b=Slwnpc/YvZBiIlJwcFHulIRXDBGqKUOajk7oVTCQjFzK4In1umhzfiy28KtmKcvfB4
         DtRinA84JO9CK/8QMcfSmH+fCwnFHxbKv5gLlzzhGCX+lLcFCHB/eI4XKy/7VJgOKhWL
         rZXhvXdzefU/jmMyVP94F2Vkpz387r4bPZG7nDjbBwc3db9ieBRgKm8ZdXLyeygaIWrh
         efUP/Vcv2zSQAPFKci6ZlSrGASDCoJzbXIYVj2UZ9hwfA7OEofePCvFnRm2pMmZJJKD+
         SwIOF56f4Dphiz4QRiybWBAgoKo2zBINXlLzFWxJMeHGD3U6EeLJnBo8ERlwgLDA0wpz
         WTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707642040; x=1708246840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi/SpXz7LSnm9nqKcH5GMvmtd5xZKu9gLFg7P9Q1mlg=;
        b=PJfJpSgN8c3mQvKTx3axlPB5rNLCcyO6XyRojwyDb2/xnCrwShB5nVeZotd6l2d3U+
         w6SGNGrqd6pAiWoCAIah7RA4rsRbvjgcaaqzWtQ1iNgYmDj7d14DgzlT5Vrnt8wUIBet
         Zxernt0cp2A+4P7Eq+lA9w+pHSDPcVUyj1pSplmxiybFX6pu9cXWTQ3rxyWLZ5GrhXC5
         2SGghTmGhbSRHUisz5pvUYkzrpVSpaIMBPMpvT5AN3jXDQDn7o0pXVhpptRaVxcN0HKo
         s7g9FG44bL/JxD9hY2lB16qgV5X6HJBcVJwHK3cVZrOhmbG2GM6WBs2G9VQ636vvfSqH
         H7WQ==
X-Gm-Message-State: AOJu0YzBlzw1lIosyFc0SnygX3fxkTLf53bLHQsBjQmF7RFNx7zUywBB
	nIWoecMIeeCqU2gWD8rtynY6LpqyXl2YqyMFux6ixScqM2aytpNds47gyE8yTEEO+jNGK9T4G1A
	i29ZzFDnFhjNFYPkvy0GOjLYoh75hwGYHXQkykw==
X-Google-Smtp-Source: AGHT+IGnqXQT+rt8SOauyM3KPLwqHogauXwMjge393R11SwTd2z8GYYPmJjOl9GRzbCoKIahL5xtbQ4ROEMUeKHCI2Q=
X-Received: by 2002:a25:2fc2:0:b0:dc7:4c52:38f7 with SMTP id
 v185-20020a252fc2000000b00dc74c5238f7mr3396239ybv.40.1707642040036; Sun, 11
 Feb 2024 01:00:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-15-swboyd@chromium.org>
 <CAA8EJpo1g9QKq1skibqSj9yc3mNSfkcts9oVf_vGjVjDzVZwiA@mail.gmail.com> <CAE-0n50xu83yYoXoFYEDrkuMw_exS=UGqsU+EwtTOGZyNW+k=Q@mail.gmail.com>
In-Reply-To: <CAE-0n50xu83yYoXoFYEDrkuMw_exS=UGqsU+EwtTOGZyNW+k=Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 11:00:28 +0200
Message-ID: <CAA8EJpp7NW0nT5vWdZcQ+A9GjreO9b20wfFBBnOZe6E6GcTNYg@mail.gmail.com>
Subject: Re: [PATCH 14/22] platform/chrome: cros_typec_switch: Add support for
 signaling HPD to drm_bridge
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Feb 2024 at 10:52, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-02-10 06:10:31)
> > On Sat, 10 Feb 2024 at 09:14, Stephen Boyd <swboyd@chromium.org> wrote:
> > > diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
> > > index 769de2889f2f..d8fb6662cf8d 100644
> > > --- a/drivers/platform/chrome/cros_typec_switch.c
> > > +++ b/drivers/platform/chrome/cros_typec_switch.c
> > > @@ -18,6 +19,15 @@
> > >  #include <linux/usb/typec_mux.h>
> > >  #include <linux/usb/typec_retimer.h>
> > >
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +struct cros_typec_dp_bridge {
> > > +       struct cros_typec_switch_data *sdata;
> > > +       bool hpd_enabled;
> > > +       struct drm_bridge bridge;
> > > +};
> >
> > Is there any chance that you can use drm_dp_hpd_bridge_register() /
> > drm_aux_hpd_bridge_notify() instead of implementing another
> > drm_bridge?
> > If something is missing from the existing implementation we can
> > probably work that out.
>
> Yeah I think that can work. I had put the drm_bridge in this driver
> because I needed a 'struct device' per DP phy, but I think that problem
> goes away with an auxiliary device, so that is nicely solved.
>
> I'll have to add logic about typec ports to that auxiliary driver
> though, like mapping data-lanes and handling lane assignments. And then
> I'll move this code from the cros_typec_switch driver to the
> cros_ec_typec driver so it can be called outside of the typec mux set
> path. That's probably better because it's sort of bolted on to the
> cros_typec_switch driver. We'll need to know if the DP phy needs to
> handle orientation or if the EC is doing that somehow, so probably I'll
> need to add a DT property to the google,cros-ec-typec binding to
> indicate that orientation control is needed.

I still haven't fully got into your usage of data-lanes. I hope to be
able to comment on that part and on the ports / endpoints tomorrow.

>
> It looks like I should add a new auxiliary device, like
> 'dp_typec_bridge', and have some other function like
> drm_dp_typec_bridge_register() for that. I can wrap the 'struct
> drm_aux_hpd_bridge_data' with a 'struct drm_aux_typec_bridge_data' and
> then the typec port information can live there. HPD can still be
> signaled with drm_aux_hpd_bridge_notify() but other functions can be
> used to set the active typec port, e.g.
> drm_aux_typec_bridge_set_active_port(), and then get orientation with
> typec_get_orientation() in the atomic_check().



-- 
With best wishes
Dmitry

