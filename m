Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDC6332C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 16:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfFCOzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 10:55:11 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:50320 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfFCOzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 10:55:11 -0400
Received: by mail-it1-f194.google.com with SMTP id a186so27963897itg.0;
        Mon, 03 Jun 2019 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsEOBXElqhiPtz7ujLSby/eJv/lO2FYQtSB33qcd3KA=;
        b=KEq0piI8pSiwFLF6xpIp/12a91YxRmspnkT43Ts1vAzOP+q9T95ISzvaLbYlmeufYN
         Cty7OllMwbmKaitSsxQoI2yjz3WIp+DMdaR6wM+GQKx3N/gmjk5Z/OfFmCEB7DPoHNGc
         9yut64uKeQPtcLL1mx5j6SfpD+Vy+p8/5Wmh7DLuWc8Ozq7z7IUnxnKIQQDmrhCab2a4
         BeroVPXWl+wewfa2ZO7X/QVKaIJLFo035Bb9vpRxMmoJ1jXAhpvJMkdx0D4r1xgeQ4s5
         Y7mQX2YSrANOlIdIqUfQT06QcunPShV4cdTbJGuGrLX6izqCLtJBdE5DAFRwotaZ/7Wf
         1m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsEOBXElqhiPtz7ujLSby/eJv/lO2FYQtSB33qcd3KA=;
        b=Lw7H3gNhhnTHh4nVDdU5e5RWbLdojjQWJkZXJXzuuuIMNQwZysnf69THVledvlnbXm
         1iPoW5p30YKn+f5L5B14aUOeoXKY9wskokmMQ439wOTJuWEy38u1Yw2F1VXdrfLdco4T
         OPkKiF2EioRl/eKJ7RFt+0jgGYUFlo3CxmLxyZAnU6WqeX7UZx9hYGD2PiwVL1X2c2s5
         nW3sdTrkg26XIHeQ/2EfHIQhh6xzEmqrxfILVl0l/EijViIplvoTKF02PcW/A7EtGvLY
         u6bb0ZUDvIXGgz410N34IDCnJfJcWfPlSoTq8RUdeKbf98PWqIZ09Z0s/AjVzlFgY5w5
         N1Tw==
X-Gm-Message-State: APjAAAV49T04mq1U1dBgKf3hqW0si/rzCZJ3BDCaMLKEcNgh41gGy1r4
        /tsLA4BmCKAVz241ToEqZfqB+HvwbRjxCYl77W4=
X-Google-Smtp-Source: APXvYqzgoaDqOAlH4O3yZ/Aq0odWtMFHQ9rblzkFb8yLmdl6SfPzGLwUQYuj3T0B6y8+Ps7k3vTgKlFr3esVREC7zSo=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr18344516itb.128.1559573710375;
 Mon, 03 Jun 2019 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190531094619.31704-1-masneyb@onstation.org> <20190531094619.31704-3-masneyb@onstation.org>
In-Reply-To: <20190531094619.31704-3-masneyb@onstation.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 3 Jun 2019 08:54:59 -0600
Message-ID: <CAOCk7NppkmSPrfVRAbDnmV=RQ5Rcn4d3xSKZND50gRTG=1K_kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm: add support for per-CRTC max_vblank_count
 on mdp5
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 31, 2019 at 3:46 AM Brian Masney <masneyb@onstation.org> wrote:
>
> The mdp5 drm/kms driver currently does not work on command-mode DSI
> panels due to 'vblank wait timed out' errors. This causes a latency
> of seconds, or tens of seconds in some cases, before content is shown
> on the panel. This hardware does not have the something that we can use
> as a frame counter available when running in command mode, so we need to
> fall back to using timestamps by setting the max_vblank_count to zero.
> This can be done on a per-CRTC basis, so the convert mdp5 to use
> drm_crtc_set_max_vblank_count().
>
> This change was tested on a LG Nexus 5 (hammerhead) phone.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 16 +++++++++++++++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  2 +-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index c3751c95b452..6fde1097844f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -450,6 +450,18 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
>         mdp5_crtc->enabled = false;
>  }
>
> +static void mdp5_crtc_vblank_on(struct drm_crtc *crtc)
> +{
> +       struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
> +       struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
> +       u32 count;
> +
> +       count = intf->mode == MDP5_INTF_DSI_MODE_COMMAND ? 0 : 0xffffffff;
> +       drm_crtc_set_max_vblank_count(crtc, count);
> +
> +       drm_crtc_vblank_on(crtc);
> +}
> +
>  static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
>                                     struct drm_crtc_state *old_state)
>  {
> @@ -486,7 +498,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
>         }
>
>         /* Restore vblank irq handling after power is enabled */
> -       drm_crtc_vblank_on(crtc);
> +       mdp5_crtc_vblank_on(crtc);
>
>         mdp5_crtc_mode_set_nofb(crtc);
>
> @@ -1039,6 +1051,8 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
>                 mdp5_crtc_destroy_state(crtc, crtc->state);
>
>         __drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
> +
> +       drm_crtc_vblank_reset(crtc);
>  }
>
>  static const struct drm_crtc_funcs mdp5_crtc_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 97179bec8902..fcb0b0455abe 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -750,7 +750,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>         dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
>         dev->driver->get_scanout_position = mdp5_get_scanoutpos;
>         dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
> -       dev->max_vblank_count = 0xffffffff;
> +       dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
>         dev->vblank_disable_immediate = true;
>
>         return kms;
> --
> 2.20.1
>
