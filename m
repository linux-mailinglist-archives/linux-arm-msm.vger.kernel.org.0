Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF5B139981
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 20:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgAMTBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 14:01:09 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41163 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgAMTBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 14:01:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so9752336wrw.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txhlzjhtz2crzIWsW0US0XlO6E3afS+6WvmgblPj+ME=;
        b=cIDnciPyl7/fEXw5tnpLgZ5lOzZmAY+wCslzxyqKNiJNJdNdEE0F+3wR0spGp3tY0T
         LzmkQvJjRlEpMc34ZsuBQUsNHdFR17cMZ6mC8dU1Nl7+bbB50RxBGGDtuV9JDMPXHxQs
         ARuKN9zZgD9aXy9ldvKO6bjSEpsv5QPgqnobyejey4BhiBmIMTqOt8YJwoxKHEvsh0lE
         uBwUk9t/BMsYsTtBCdKWPbAw6lhjgVQOUoC0JiJcWHgMmdFd5vM/6JyHYLX8hzQQBJx2
         N8/nHtsHhBTYoKYCSkhWISyww7D+43AFI2jdJM5kUttfuMXCSEyzvknFNpBN0lOjpfAX
         Tqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txhlzjhtz2crzIWsW0US0XlO6E3afS+6WvmgblPj+ME=;
        b=pEtLZf1WUqxTS4PaXSdHBRAzztIwgDZ8Y/Cb2nBW4BX9am0TkpBgsbIJAdAnPOjgVt
         VwO0sMLn1mU9ppk0uvvdPY2FeAh0uzhBadOzfGKcDs2ZwT+NBCyNdy1XgzoXi4ceLRPH
         l47D2uItolLsQsmFw9M6tYHWgizN+JqaMA23JecHhNULLOvVc7ZNoAM5IZ1kOgTaagOX
         Hfl8Lag1a4WSdka2fNNSj6hOMhY0c7dwztqwfef9rWbjjgzkyRYD/pPWwm/ThptpiTvn
         6KZzZtpTxWlRulAVZdC6MhirEOFj+vRjlbSbU7u6I0KRb+eTf8Otm5WiAn9AgzlHTyI7
         g3Iw==
X-Gm-Message-State: APjAAAVJXMXJOJQvBVeasNVVXRJs5bmQYFzS4POFXrbw1JYb7JcAKFET
        XiVIwn31NOhvcGvhjOv1W262+F8fWNrIS7SKIco=
X-Google-Smtp-Source: APXvYqwwMECd9wW0HPP1j0PyV69hnbZ9WVApySLd3xpfZRVoEeeTMikdah645ea1lb7GkgO7tenI21NlPOe8MtzowAk=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr20244881wru.154.1578942065812;
 Mon, 13 Jan 2020 11:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110092127.27847-1-tzimmermann@suse.de> <20200110092127.27847-13-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-13-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 13 Jan 2020 14:00:53 -0500
Message-ID: <CADnq5_OkU+kwE5P8SoTNrmXK2BSfh0crDq=r9NQCEL3vAsoRFA@mail.gmail.com>
Subject: Re: [PATCH 12/23] drm/amdgpu: Convert to CRTC VBLANK callbacks
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

On Fri, Jan 10, 2020 at 4:22 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert amdgpu over.

I think I'd prefer to just update the signatures of the relevant
functions rather than wrapping them.

Alex

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 24 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
>  9 files changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 81a531b652aa..c1262ab588c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1197,6 +1197,9 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>  u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
>  int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
>  void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
> +u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc);
> +int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc);
> +void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc);
>  long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd,
>                              unsigned long arg);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 0749285dd1c7..9baa1ddf8693 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1377,10 +1377,6 @@ static struct drm_driver kms_driver = {
>         .postclose = amdgpu_driver_postclose_kms,
>         .lastclose = amdgpu_driver_lastclose_kms,
>         .unload = amdgpu_driver_unload_kms,
> -       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> -       .enable_vblank = amdgpu_enable_vblank_kms,
> -       .disable_vblank = amdgpu_disable_vblank_kms,
> -       .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>         .irq_handler = amdgpu_irq_handler,
>         .ioctls = amdgpu_ioctls_kms,
>         .gem_free_object_unlocked = amdgpu_gem_object_free,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 60591dbc2097..efe4671fb032 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1174,6 +1174,14 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
>         return count;
>  }
>
> +u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return amdgpu_get_vblank_counter_kms(dev, pipe);
> +}
> +
>  /**
>   * amdgpu_enable_vblank_kms - enable vblank interrupt
>   *
> @@ -1191,6 +1199,14 @@ int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
>         return amdgpu_irq_get(adev, &adev->crtc_irq, idx);
>  }
>
> +int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return amdgpu_enable_vblank_kms(dev, pipe);
> +}
> +
>  /**
>   * amdgpu_disable_vblank_kms - disable vblank interrupt
>   *
> @@ -1207,6 +1223,14 @@ void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe)
>         amdgpu_irq_put(adev, &adev->crtc_irq, idx);
>  }
>
> +void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       amdgpu_disable_vblank_kms(dev, pipe);
> +}
> +
>  const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index bdc1e0f036d4..8e62f46f0bfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2494,6 +2494,10 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v10_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 0319da5f7bf9..9e37e4a78403 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2573,6 +2573,10 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v11_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 78642c3b14fc..2d4c99d3b352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2388,6 +2388,10 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v6_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 1e8d4975435a..cd51fd155349 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2395,6 +2395,10 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v8_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> index 4b2f915aba47..53c260deb384 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> @@ -123,6 +123,10 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_virtual_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 39c5cf242c1b..0c51c4dd8c46 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4214,8 +4214,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>         .set_crc_source = amdgpu_dm_crtc_set_crc_source,
>         .verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
>         .get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
>         .enable_vblank = dm_enable_vblank,
>         .disable_vblank = dm_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static enum drm_connector_status
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
