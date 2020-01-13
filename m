Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC2613994D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 19:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgAMSwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 13:52:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33481 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbgAMSwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 13:52:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id d139so541522wmd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 10:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p7v0w5hosGHI1CkbvO/wa0BjKIctp9SJfcdILuOrw5Q=;
        b=DSLgEJknWIkiDU/DcQHY86u7vKK3zs1dLi5siA0FmA/Ih+Nvv4JaJAyQ2N10wEJkgW
         SUHrQ5nxIcl2oqYpiLECKDRDrEalIWPEYYrMwRUKBH242prtxFXslwsdI1ImJOmSoyob
         DPmK6iKNe0i2FLbGDRx/cDFNhX0Na8gnwDIMvCPn7Nf5bwfilIbb3aYYoTnHOgHazmhU
         HH9bCXMCb7vcune6lPQfeBuWBkdsaRGD+oEMGUdutYcHuD81DmnPSYGg3fbNdrygMq/O
         WUQND87nI+67IFfLuIypukzVQ17ICFA7PqlY01nuDcvjwHlJGpOdilaOBpdBY6CsSgbQ
         ezhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7v0w5hosGHI1CkbvO/wa0BjKIctp9SJfcdILuOrw5Q=;
        b=six/Yld/OzQiov6OvLizm80JB/LKoMAXmdKhegLT/hrX2a0AksKZwNtrisr9RoQR5O
         ECU8G/OrVKtI19V+rWD+BNyCySMRF2Bjke48OeXv9RT4fFm8vDf47qqaslivGFfs2Fv/
         MLO4C31Vx29t1oY8VbJYAjsnKXsfgC8zL9vxy3hiHyRDh1u1AgorhnIkQw3lXujggKts
         UKCqi7yzhYrKXnpw5Lt31eXbWrwvhAuV88BxtPspYlwr9Pg2tYCvc4XdmsjTl4D+XnKR
         PfFhL9DnYqSayVrJQBfuV+KteUPiKENNKnGgw+q8qvt8ployNoPO9BnaZg1N9zK2IM4C
         HOYA==
X-Gm-Message-State: APjAAAXosVMQUnHkHmbOuEK1k2mIgL4leM+02O5gDn0BO6aKPe3jEyUO
        5nw6gB7C8JJajs72XLFav08jg2tzO71qlzM/zjU=
X-Google-Smtp-Source: APXvYqxKgBuiU1PlNQNzWY1fbdm2g15SW9NwPiqz9OhySsm3mMkzmLlQjjV8+/2/tz24Th9SiQPoJIWK4iqn3ubwOG4=
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr21976811wmq.65.1578941555215;
 Mon, 13 Jan 2020 10:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20200110092127.27847-1-tzimmermann@suse.de> <20200110092127.27847-3-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-3-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 13 Jan 2020 13:52:21 -0500
Message-ID: <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com>
Subject: Re: [PATCH 02/23] drm/amdgpu: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Chunming Zhou <David1.Zhou@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, Eric Anholt <eric@anholt.net>,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        "Wentland, Harry" <harry.wentland@amd.com>,
        "Leo (Sunpeng) Li" <sunpeng.li@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        nouveau <nouveau@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 4:21 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> amdgpu over.
>

I would prefer to just change the signature of
amdgpu_display_get_crtc_scanoutpos() to match the new API rather than
wrapping it again.

Alex

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 12 ++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 -----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  5 +++++
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c          |  1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
>  9 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 4e699071d144..a1e769d4417d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -914,3 +914,15 @@ int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc)
>                 return AMDGPU_CRTC_IRQ_NONE;
>         }
>  }
> +
> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> +                       bool in_vblank_irq, int *vpos,
> +                       int *hpos, ktime_t *stime, ktime_t *etime,
> +                       const struct drm_display_mode *mode)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> +                                                 stime, etime, mode);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 3f6f14ce1511..0749285dd1c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1367,16 +1367,6 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>         return 0;
>  }
>
> -static bool
> -amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
> -                                bool in_vblank_irq, int *vpos, int *hpos,
> -                                ktime_t *stime, ktime_t *etime,
> -                                const struct drm_display_mode *mode)
> -{
> -       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> -                                                 stime, etime, mode);
> -}
> -
>  static struct drm_driver kms_driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_ATOMIC |
> @@ -1391,7 +1381,6 @@ static struct drm_driver kms_driver = {
>         .enable_vblank = amdgpu_enable_vblank_kms,
>         .disable_vblank = amdgpu_disable_vblank_kms,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
> -       .get_scanout_position = amdgpu_get_crtc_scanout_position,
>         .irq_handler = amdgpu_irq_handler,
>         .ioctls = amdgpu_ioctls_kms,
>         .gem_free_object_unlocked = amdgpu_gem_object_free,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index eb9975f4decb..37ba07e2feb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -612,6 +612,11 @@ void amdgpu_panel_mode_fixup(struct drm_encoder *encoder,
>                              struct drm_display_mode *adjusted_mode);
>  int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc);
>
> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> +                       bool in_vblank_irq, int *vpos,
> +                       int *hpos, ktime_t *stime, ktime_t *etime,
> +                       const struct drm_display_mode *mode);
> +
>  /* fbdev layer */
>  int amdgpu_fbdev_init(struct amdgpu_device *adev);
>  void amdgpu_fbdev_fini(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 40d2ac723dd6..bdc1e0f036d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2685,6 +2685,7 @@ static const struct drm_crtc_helper_funcs dce_v10_0_crtc_helper_funcs = {
>         .prepare = dce_v10_0_crtc_prepare,
>         .commit = dce_v10_0_crtc_commit,
>         .disable = dce_v10_0_crtc_disable,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 898ef72d423c..0319da5f7bf9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2793,6 +2793,7 @@ static const struct drm_crtc_helper_funcs dce_v11_0_crtc_helper_funcs = {
>         .prepare = dce_v11_0_crtc_prepare,
>         .commit = dce_v11_0_crtc_commit,
>         .disable = dce_v11_0_crtc_disable,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index db15a112becc..78642c3b14fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2575,6 +2575,7 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
>         .prepare = dce_v6_0_crtc_prepare,
>         .commit = dce_v6_0_crtc_commit,
>         .disable = dce_v6_0_crtc_disable,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index f06c9022c1fd..1e8d4975435a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2593,6 +2593,7 @@ static const struct drm_crtc_helper_funcs dce_v8_0_crtc_helper_funcs = {
>         .prepare = dce_v8_0_crtc_prepare,
>         .commit = dce_v8_0_crtc_commit,
>         .disable = dce_v8_0_crtc_disable,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> index e4f94863332c..4b2f915aba47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> @@ -218,6 +218,7 @@ static const struct drm_crtc_helper_funcs dce_virtual_crtc_helper_funcs = {
>         .prepare = dce_virtual_crtc_prepare,
>         .commit = dce_virtual_crtc_commit,
>         .disable = dce_virtual_crtc_disable,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static int dce_virtual_crtc_init(struct amdgpu_device *adev, int index)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f2db400a3920..39c5cf242c1b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4821,7 +4821,8 @@ static bool dm_crtc_helper_mode_fixup(struct drm_crtc *crtc,
>  static const struct drm_crtc_helper_funcs amdgpu_dm_crtc_helper_funcs = {
>         .disable = dm_crtc_helper_disable,
>         .atomic_check = dm_crtc_helper_atomic_check,
> -       .mode_fixup = dm_crtc_helper_mode_fixup
> +       .mode_fixup = dm_crtc_helper_mode_fixup,
> +       .get_scanout_position = amdgpu_crtc_get_scanout_position,
>  };
>
>  static void dm_encoder_helper_disable(struct drm_encoder *encoder)
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
