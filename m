Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726C9136E37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 14:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgAJNi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 08:38:59 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:37392 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbgAJNi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 08:38:59 -0500
Received: by mail-qv1-f66.google.com with SMTP id f16so728341qvi.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2020 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fMAknfduyJ4KGyOdOztEB55i6TuQcuStmuAf8sYi2eI=;
        b=Y4E1E1wUN53of8IKrA0UNXWcZ0od9J5pJD4CL7BcST6fyGUAy9OBi/XHtSE0+st8gq
         TGEE9zurQhxWwAhggI0+8iYrga2zsnu8EpueVcqg2M2WD9Kx0fvEliLvArowBqdDC/78
         myfyPj/1qPFqWZQRf5dvWU7rWU0D3LAmSgaoMY1vQaMxYPR5rhUwu4BN0f7jUzFjj6X9
         veF4h408LAm5cEyifzScQA+MFgplBXPnY60Qz5+lEuBujA8lMIePhoDGpOQwqj/Vdu76
         4Ot9ZIbZ+/sXDrTxktGCT3LrDOnvNu6KIEPYgKeEaa8E9HRwaRxEQyxwyGvhG9yTXm8B
         uWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fMAknfduyJ4KGyOdOztEB55i6TuQcuStmuAf8sYi2eI=;
        b=WlJSbl3RUd2rox6+wMxfYx+XHD8LO4jZ8Jimbdv1Up25XwEC+Jb662HA6ASlQf/NN5
         bklYz/QpoX6KsUjwNk9ZE/bDh6PRXBt24S7sUj4PU84y5wq7Mc35ukWXW8O1oUfop9P3
         2HGJogrqAla/8nyi1zV96Y2T7wBXgveq0dyucy2mwoQa4fzInbVomEZbFzCe1Fxig/Dt
         kxDYNqDXMrWBjYxXIryDu5+8UiYAhbyh3TTRN1x1WzN10de2aPNBxZ0vtvOxPBO6pGvz
         nh218sHQVj/mdcC9WDgPsMO1yTroTzuPsv3HVTybUBUETf5YDeqAsOC+e7/XABntBkB3
         Y37Q==
X-Gm-Message-State: APjAAAU4wBZOH2IejE04TOCLHZNGy6jiuxTCXrFbJu/kPn1OiWUcpOcQ
        CczScORH6WSJlmlJzbNE8Mldz2dfq9ZvRal4ALNlnQ==
X-Google-Smtp-Source: APXvYqzt0hS9515d/LMBMh30b3dDfboM+EvgjQK5PnPq9CxP8nSXa8zseir0K/ItbGYsdAvOkTTPA7bWz+aHqvETPhQ=
X-Received: by 2002:a0c:f748:: with SMTP id e8mr2753245qvo.233.1578663538806;
 Fri, 10 Jan 2020 05:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20200110092127.27847-1-tzimmermann@suse.de> <20200110092127.27847-19-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-19-tzimmermann@suse.de>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Fri, 10 Jan 2020 14:38:47 +0100
Message-ID: <CA+M3ks5ejLV2ggi3kzkR5YOV6+SJavOHDT7oT6HBCHe33LqtcA@mail.gmail.com>
Subject: Re: [PATCH 18/23] drm/sti: Convert to CRTC VBLANK callbacks
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        patrik.r.jakobsson@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com,
        Thomas Hellstrom <thellstrom@vmware.com>, bskeggs@redhat.com,
        Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le ven. 10 janv. 2020 =C3=A0 10:21, Thomas Zimmermann <tzimmermann@suse.de>=
 a =C3=A9crit :
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert sti over.
>

Hi Thomas,

Since you remove the last calls to sti_crtc functions from sti_drv.c I
think that the include could also be removed.

Anyway that looks for me:
Acked-by: Benjamin Gaignard <benjamin.gaignard@linaor.org>

Thanks,
Benjamin

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sti/sti_crtc.c | 11 ++++++++---
>  drivers/gpu/drm/sti/sti_crtc.h |  2 --
>  drivers/gpu/drm/sti/sti_drv.c  |  3 ---
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crt=
c.c
> index dc64fbfc4e61..49e6cb8f5836 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.c
> +++ b/drivers/gpu/drm/sti/sti_crtc.c
> @@ -279,12 +279,13 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
>         return 0;
>  }
>
> -int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
> +static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev =3D crtc->dev;
> +       unsigned int pipe =3D crtc->index;
>         struct sti_private *dev_priv =3D dev->dev_private;
>         struct sti_compositor *compo =3D dev_priv->compo;
>         struct notifier_block *vtg_vblank_nb =3D &compo->vtg_vblank_nb[pi=
pe];
> -       struct drm_crtc *crtc =3D &compo->mixer[pipe]->drm_crtc;
>         struct sti_vtg *vtg =3D compo->vtg[pipe];
>
>         DRM_DEBUG_DRIVER("\n");
> @@ -297,8 +298,10 @@ int sti_crtc_enable_vblank(struct drm_device *dev, u=
nsigned int pipe)
>         return 0;
>  }
>
> -void sti_crtc_disable_vblank(struct drm_device *drm_dev, unsigned int pi=
pe)
> +static void sti_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *drm_dev =3D crtc->dev;
> +       unsigned int pipe =3D crtc->index;
>         struct sti_private *priv =3D drm_dev->dev_private;
>         struct sti_compositor *compo =3D priv->compo;
>         struct notifier_block *vtg_vblank_nb =3D &compo->vtg_vblank_nb[pi=
pe];
> @@ -330,6 +333,8 @@ static const struct drm_crtc_funcs sti_crtc_funcs =3D=
 {
>         .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
>         .atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
>         .late_register =3D sti_crtc_late_register,
> +       .enable_vblank =3D sti_crtc_enable_vblank,
> +       .disable_vblank =3D sti_crtc_disable_vblank,
>  };
>
>  bool sti_crtc_is_main(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/sti/sti_crtc.h b/drivers/gpu/drm/sti/sti_crt=
c.h
> index df489ab14e2b..1132b4586712 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.h
> +++ b/drivers/gpu/drm/sti/sti_crtc.h
> @@ -15,8 +15,6 @@ struct sti_mixer;
>
>  int sti_crtc_init(struct drm_device *drm_dev, struct sti_mixer *mixer,
>                   struct drm_plane *primary, struct drm_plane *cursor);
> -int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe);
> -void sti_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe);
>  int sti_crtc_vblank_cb(struct notifier_block *nb,
>                        unsigned long event, void *data);
>  bool sti_crtc_is_main(struct drm_crtc *drm_crtc);
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.=
c
> index a39fc36f815b..8e30001bf545 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -146,9 +146,6 @@ static struct drm_driver sti_driver =3D {
>         .dumb_create =3D drm_gem_cma_dumb_create,
>         .fops =3D &sti_driver_fops,
>
> -       .enable_vblank =3D sti_crtc_enable_vblank,
> -       .disable_vblank =3D sti_crtc_disable_vblank,
> -
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
> --
> 2.24.1
>
