Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47B014C76B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 09:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgA2IZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 03:25:43 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:34247 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgA2IZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 03:25:42 -0500
Received: by mail-yb1-f196.google.com with SMTP id w17so8341946ybm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kih+TB9JP3PedQhp/1CUreRPEItaPe2QPQz29F9tWDc=;
        b=Zo0D/9Q0JQHqmfuylFPaI2+qH2RjwZzwG4K152c5478sSjjcwX16A0/NJcorfJ9iDx
         bf8aor95/I4UP6Fc6h/0NB8NbUx2e+R1UOAILFIzAFKl27BxiikZR1CoUV3e9kHoVGNf
         gkhykrsUC6XYxDCPa7Y3PoN6FiedgCpcGjqxOqDzSqiSnzN5+WTS+YZuVXYb9JwtXbsG
         /qQ2OV38+RlT/YzUgiW6c5unXTOd84tK+8cGKIT3k+v9hBXU5/pAUC/lCk1COC9bWHdA
         PwLBvI/BiMPzC+fMF9l6KijnjBJS2nW7xcQyxWyq8HFS2hr2aErWCcHOvCXtlbWtqQcR
         rWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kih+TB9JP3PedQhp/1CUreRPEItaPe2QPQz29F9tWDc=;
        b=bxbGMLWEJ9hxCbpiiygvBtjiZe0tnMKv/cXmB3zpwR/RvvZlnMb1/qnmYGJgn6w5uJ
         46Y0rxjEz+6yKAAC2JuL2j+j9QPP8TSfy3O4WfGtTTykUWG4C36dx7bvInnNZPtoMq/U
         5m2HLt5AqiRsN/O576wt3h9xtl/MEarpam7uiL/y1RyysRkuLllASHVI8e/wYwi4bUhb
         dt6yfZkVIsWlf7mQRQ2GWwPpgmUxleCCAkvuuwzC2C8b/sGfg7Txf8/LrPQuY9CgGjvO
         KHQxe7iCPDMWqcZMWnOJphCPC5S8KTIKoveBdA2oyhGjb6NpWIyMNnzgFqx7IEs8kMrE
         BezA==
X-Gm-Message-State: APjAAAXoEsKnCPJTK2JcgFX0uFN0XWVb20Yg05S/6ADnY9iNjKWhWshU
        FZHafDCRjW6pW4UStUeDoetw30WAmjaFMHjomVw=
X-Google-Smtp-Source: APXvYqzYYS+fbLJS92hXCLIiPAKjDMfVajoV30W9JVMhPXXe6xeykGWBSC5YEHENiobwTVVUd7ZcBIkpRfTJyb1W+VQ=
X-Received: by 2002:a25:b950:: with SMTP id s16mr18652397ybm.147.1580286341707;
 Wed, 29 Jan 2020 00:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de> <20200123135943.24140-9-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-9-tzimmermann@suse.de>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Wed, 29 Jan 2020 18:25:30 +1000
Message-ID: <CACAvsv5vN1FJOF0EuxEwqa4_=ptfK2xTyvRpPrBaS8ac0MvC4w@mail.gmail.com>
Subject: Re: [PATCH v4 08/22] drm/nouveau: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com,
        patrik.r.jakobsson@gmail.com, Rob Clark <robdclark@gmail.com>,
        sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        Ben Skeggs <bskeggs@redhat.com>,
        Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
        Jani Nikula <jani.nikula@linux.intel.com>,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        linux-arm-msm@vger.kernel.org,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        ML nouveau <nouveau@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Jan 2020 at 00:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> nouveau over.
>
> v4:
>         * add argument names in function declaration
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c   |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c | 14 +++-----------
>  drivers/gpu/drm/nouveau/nouveau_display.h |  7 ++++---
>  drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
>  5 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 37c50ea8f847..17e9d1c078a0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1258,6 +1258,7 @@ static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
>         .mode_set_base = nv04_crtc_mode_set_base,
>         .mode_set_base_atomic = nv04_crtc_mode_set_base_atomic,
>         .disable = nv_crtc_disable,
> +       .get_scanout_position = nouveau_display_scanoutpos,
>  };
>
>  static const uint32_t modeset_formats[] = {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index d9d64602947d..41852dd8fdbd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -413,6 +413,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
>  static const struct drm_crtc_helper_funcs
>  nv50_head_help = {
>         .atomic_check = nv50_head_atomic_check,
> +       .get_scanout_position = nouveau_display_scanoutpos,
>  };
>
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 53f9bceaf17a..86f99dc8fcef 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -136,21 +136,13 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
>  }
>
>  bool
> -nouveau_display_scanoutpos(struct drm_device *dev, unsigned int pipe,
> +nouveau_display_scanoutpos(struct drm_crtc *crtc,
>                            bool in_vblank_irq, int *vpos, int *hpos,
>                            ktime_t *stime, ktime_t *etime,
>                            const struct drm_display_mode *mode)
>  {
> -       struct drm_crtc *crtc;
> -
> -       list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -               if (nouveau_crtc(crtc)->index == pipe) {
> -                       return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
> -                                                              stime, etime);
> -               }
> -       }
> -
> -       return false;
> +       return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
> +                                              stime, etime);
>  }
>
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index 6e8e66882e45..26d34f1a77da 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -63,9 +63,10 @@ int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
>  void nouveau_display_resume(struct drm_device *dev, bool runtime);
>  int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
>  void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
> -bool  nouveau_display_scanoutpos(struct drm_device *, unsigned int,
> -                                bool, int *, int *, ktime_t *,
> -                                ktime_t *, const struct drm_display_mode *);
> +bool nouveau_display_scanoutpos(struct drm_crtc *crtc,
> +                               bool in_vblank_irq, int *vpos, int *hpos,
> +                               ktime_t *stime, ktime_t *etime,
> +                               const struct drm_display_mode *mode);
>
>  int  nouveau_display_dumb_create(struct drm_file *, struct drm_device *,
>                                  struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index b65ae817eabf..fcc036a08965 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1122,7 +1122,6 @@ driver_stub = {
>
>         .enable_vblank = nouveau_display_vblank_enable,
>         .disable_vblank = nouveau_display_vblank_disable,
> -       .get_scanout_position = nouveau_display_scanoutpos,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>
>         .ioctls = nouveau_ioctls,
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
