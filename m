Return-Path: <linux-arm-msm+bounces-13962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 482E487A07E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 02:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C93CE1F22076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE93BA33;
	Wed, 13 Mar 2024 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVteNtJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1A8F4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 01:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710292043; cv=none; b=FgxoS7jWTCJqIWMnrOyDzOG6U5iwh/hHEdlF6XRgOXG5DVEWPWDAfSPOXYaAdOpMxSeSMRrd5k+ctNDqXSIpyJW0ic9diguu3HDv0fDIoeRfsyjBVpnxZDNA3C81ItEg1BdB4sy6Tfbnx0gQ6Ql7sqd0wUissmv3p8wynrj9YMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710292043; c=relaxed/simple;
	bh=5/uSKQNaEe0Kl6LRxzXAukjH6ITvVcXQ/0HIFE00Y90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQn4n6TlMzZSH6AHyVltWdb9MT/ca0Mf6G0cGrVJrw/lld64is8TYMPTmZz0I6awgmcJGxPvEZuQUn+2jNyMgqSLscrH9SpXoC0VwDBlsJjZ3jUY2W0NrI3q6MRL2Aaz64ztwYEVZ9WG33TRbGhqcTz85ipih+6qMx/MG2kIqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVteNtJ1; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-690bd329df2so30931016d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710292038; x=1710896838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cBmwXOg30OCoUF4GxOWpYW1K34Mj5YUqwZWwZ2HLAE=;
        b=cVteNtJ1iG5M5PJuDTwQ6Jkx/WEN7tcoh5uUbUvOtNkVemNcrdAdCXDO/1Zm9kKvq6
         w1mjBD4ut92Xpsgu9/aNGtJB169LeDe0hd5klQrlYWdIjZCl+8Agb1dd5k/CJHfnrLu6
         47VRPe53XgE/B5hD7lkONiuKP8GsQOrgX0dwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710292038; x=1710896838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cBmwXOg30OCoUF4GxOWpYW1K34Mj5YUqwZWwZ2HLAE=;
        b=vgNczvYzA3TrrHmrC5BjfCAbE/9FfNAOjioLiLx7XrC/aeKdk/3lp+hI++CBNuIVo/
         RCCzrmLMgDCcYH2tg6PoYJjrtzyEKfI+vdiEIyWHK1CvxmQqXOWq6RYKyiQLxE8Zb+u3
         wFqFQx7e2Ydr4TVdZ2blHuGakJcxKQqb1lsUE7CDRV6+pjmz7rAEc1bCxks4mdhB3ux5
         wn9ZPGiO6ieNv1ivU6Kjme0eqY5eN6Vw5fZcOOxElFcLcpBTE4YBh+4RO+YrJmxkathZ
         Orv7l63Ixsul9PNHyKvIYU2MZBYf9qLyVx8Bho6/g0sCTXb2881neLRMkMFsA3yfMUdF
         zCvg==
X-Forwarded-Encrypted: i=1; AJvYcCUVz4fZMSNfF81B/0HUdEA93tVxTjf87pBjPIK2KPfiGg4B0kWaoZk+7bSAcE32O5BS20/j9298K2Neh5zAAMV/UKTdnyA1zTCl+m99Xw==
X-Gm-Message-State: AOJu0YzdLOFm8Qz0keUiGSQh+MEy46JwQozH/07Q2a+5LzzL9NqUrG2p
	3VIkIXvYuEztJcbGQMzibbaq3ZEg3qu3qyUxf1LpH3gNGJTZnvRFwN3gc4wmUaObJJLIac/tM48
	=
X-Google-Smtp-Source: AGHT+IHIrw47YPvOfeMkVC40ne9xftOPtQ5WrLyJxJ9BDoOyVXc4RkBgjMGsIrD4hZ1Hnax//C97zA==
X-Received: by 2002:a05:620a:28c4:b0:788:663d:6946 with SMTP id l4-20020a05620a28c400b00788663d6946mr4600111qkp.49.1710292037818;
        Tue, 12 Mar 2024 18:07:17 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id l10-20020ae9f00a000000b0078840795751sm4218366qkg.8.2024.03.12.18.07.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 18:07:16 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42ee0c326e8so128141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 18:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCq7HziUBRYEXFqL63nV0V9jMNv3UUVX2Uto+rIeG8fmy0TxAYd4emQQlJin8lBf+//AtCD6Fgf87n04FXStJT3xPo6F7AD5fJ1H3MCQ==
X-Received: by 2002:ac8:5ec8:0:b0:42f:a3c:2d5a with SMTP id
 s8-20020ac85ec8000000b0042f0a3c2d5amr76133qtx.27.1710292036231; Tue, 12 Mar
 2024 18:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313001345.2623074-1-dianders@chromium.org>
 <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid> <CABXOdTfNaorDgyZT8owH6ypYpZMhVpUEcK8N4Mbw2UumA8Db2g@mail.gmail.com>
In-Reply-To: <CABXOdTfNaorDgyZT8owH6ypYpZMhVpUEcK8N4Mbw2UumA8Db2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Mar 2024 18:07:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrxOmPRUa9Cw1u+JmTepMjKfKCwFLgLjj3f2O9wSdZyg@mail.gmail.com>
Message-ID: <CAD=FV=UrxOmPRUa9Cw1u+JmTepMjKfKCwFLgLjj3f2O9wSdZyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
To: Guenter Roeck <groeck@google.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>, 
	Vinod Polimera <quic_vpolimer@quicinc.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 12, 2024 at 5:47=E2=80=AFPM Guenter Roeck <groeck@google.com> w=
rote:
>
> On Tue, Mar 12, 2024 at 5:14=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > As documented in the description of the transfer() function of
> > "struct drm_dp_aux", the transfer() function can be called at any time
> > regardless of the state of the DP port. Specifically if the kernel has
> > the DP AUX character device enabled and userspace accesses
> > "/dev/drm_dp_auxN" directly then the AUX transfer function will be
> > called regardless of whether a DP device is connected.
> >
> > For eDP panels we have a special rule where we wait (with a 5 second
> > timeout) for HPD to go high. This rule was important before all panels
> > drivers were converted to call wait_hpd_asserted() and actually can be
> > removed in a future commit.
> >
> > For external DP devices we never checked for HPD. That means that
> > trying to access the DP AUX character device (AKA `hexdump -C
> > /dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
> > system:
> >   $ time hexdump -C /dev/drm_dp_aux0
> >   hexdump: /dev/drm_dp_aux0: Connection timed out
> >
> >   real    0m8.200s
> >
> > Let's add a check for HPD to avoid the slow timeout. This matches
> > what, for instance, the intel_dp_aux_xfer() function does when it
> > calls intel_tc_port_connected_locked(). That call has a document by it
> > explaining that it's important to avoid the long timeouts.
> >
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >  3 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/d=
p_aux.c
> > index 03f4951c49f4..de0b0eabced9 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *d=
p_aux,
> >          * turned on the panel and then tried to do an AUX transfer. Th=
e panel
> >          * driver has no way of knowing when the panel is ready, so it'=
s up
> >          * to us to wait. For DP we never get into this situation so le=
t's
> > -        * avoid ever doing the extra long wait for DP.
> > +        * avoid ever doing the extra long wait for DP and just query H=
PD
> > +        * directly.
> >          */
> >         if (aux->is_edp) {
> >                 ret =3D dp_catalog_aux_wait_for_hpd_connect_state(aux->=
catalog);
> > @@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *=
dp_aux,
> >                         DRM_DEBUG_DP("Panel not ready for aux transacti=
ons\n");
> >                         goto exit;
> >                 }
> > +       } else {
> > +               if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
> > +                       ret =3D -ENXIO;
> > +                       goto exit;
> > +               }
> >         }
> >
> >         dp_aux_update_offset_and_segment(aux, msg);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/=
dp/dp_catalog.c
> > index 5142aeb705a4..93e2d413a1e7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(stru=
ct dp_catalog *dp_catalog)
> >                                 2000, 500000);
> >  }
> >
> > +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
> > +{
> > +       struct dp_catalog_private *catalog =3D container_of(dp_catalog,
> > +                               struct dp_catalog_private, dp_catalog);
> > +
> > +       /* poll for hpd connected status every 2ms and timeout after 50=
0ms */
>
> Maybe I am missing something, but the comment doesn't seem to match
> the code below.
>
> Guenter
>
> > +       return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HP=
D_INT_STATUS) &
> > +              DP_DP_HPD_STATE_STATUS_CONNECTED;

LOL. I guess I overlooked that. Thanks for catching! The comment got
copied from the dp_catalog_aux_wait_for_hpd_connect_state(). I'll
remove the comment and send a v2, but I'll wait a little bit to see if
there is additional feedback.

-Doug

