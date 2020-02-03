Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9343C15111E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 21:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgBCUj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 15:39:56 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35605 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBCUj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 15:39:56 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so941358wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOB+jXb70psFwK6ilNyJvCjU6t2LYt+4h3WNAoOnGBQ=;
        b=oRxezjuqZkM1EZRn8OD6Aazas+pCiWl2XxZnL3WkFkHfKAX0y8nlbb7X5wixjp47Hz
         f0hlar9LplYIlfF7bRpfEST4n6OULQzG0vEOnZjvfmbzuk4REE0qOFBmFTySB6eFfkDv
         5XAyI2omeCL4fS7Au6HVxVGngPBiI9Yq4UyPdof5w70BhNN2fPyhegfB//s+zYh/XZhX
         +1zgb8oIX2RdlnQa46Q4QzdBQQE1zA9YqVUdVFNTbJkk3lcNh7fQovkchaQsQprzEqIB
         wCqcU9fvHjbnrCD8A+kk7KJ56HqeQjmw41+dhOQHErvOtoFXcV9ijhNdeq3mOpWPRqLB
         IL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOB+jXb70psFwK6ilNyJvCjU6t2LYt+4h3WNAoOnGBQ=;
        b=m3ujosdNTuRamHbpltxuB9WOlUXOhB5pX9ZtZm4iMtVJJB9fmBZX6Ttsx71sCdtrJb
         R/rCsU5263/joDwLlhl9wdYlLhIFmp6bj8z9vNgtclAkt5m15TEj9Uehwt2j/+4uGa0m
         yzj40hwWFfTFplthKC13Emvivdm5+I4To/bLMIw55lC7E8eF7PpZWS2zfSdF2WOw5Fb0
         kzhnIcg+3GPRtvUau3ehmdZJQJ8qVpPqdcQir8lP498FMOyg+nWc0WlOezx3WgV9KsxH
         2Jco4titGWbBNUsRl4S2PVFJCbnEnt5l9OnCy7EiYKIvbgOztBm+69aMDtxn3RGl7ube
         dFng==
X-Gm-Message-State: APjAAAUnAThyq/wI8zyjxl4glAzVyDLkUEqB0n9gsFWX4lkYt04bAxDV
        ItLJnRxznTws6sltHLLLfXjBW5QV1mMPIY1xzeU=
X-Google-Smtp-Source: APXvYqxvTdOavw69tuuAGfm7oJ9JVYTNTSKrsIsXBFt/8TWLfz8KY2AQETn8wjig5LG4ek97Cl+wnCAPHFTSB+EGzRg=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr806440wmb.73.1580762393328;
 Mon, 03 Feb 2020 12:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de> <20200123135943.24140-11-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-11-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 3 Feb 2020 15:39:42 -0500
Message-ID: <CADnq5_M89Hmx-5n+sJgWvMAwcwtvtF31kfjEfui1hUukxaFrvg@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] drm/radeon: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
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

On Thu, Jan 23, 2020 at 9:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> radeon over.
>
> v4:
>         * 80-character line fixes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
>  drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
>  5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index be583695427a..91811757104c 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -2231,6 +2231,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
>         .prepare = atombios_crtc_prepare,
>         .commit = atombios_crtc_commit,
>         .disable = atombios_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>  void radeon_atombios_init_crtc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 856526cb2caf..2f641f3b39e7 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1978,3 +1978,16 @@ int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>
>         return ret;
>  }
> +
> +bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
> +                                bool in_vblank_irq, int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> +                                         stime, etime, mode);
> +}
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index fd74e2611185..1f597f166bff 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -563,16 +563,6 @@ static const struct file_operations radeon_driver_kms_fops = {
>  #endif
>  };
>
> -static bool
> -radeon_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
> -                                bool in_vblank_irq, int *vpos, int *hpos,
> -                                ktime_t *stime, ktime_t *etime,
> -                                const struct drm_display_mode *mode)
> -{
> -       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> -                                         stime, etime, mode);
> -}
> -
>  static struct drm_driver kms_driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_GEM | DRIVER_RENDER,
> @@ -585,7 +575,6 @@ static struct drm_driver kms_driver = {
>         .enable_vblank = radeon_enable_vblank_kms,
>         .disable_vblank = radeon_disable_vblank_kms,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
> -       .get_scanout_position = radeon_get_crtc_scanout_position,
>         .irq_preinstall = radeon_driver_irq_preinstall_kms,
>         .irq_postinstall = radeon_driver_irq_postinstall_kms,
>         .irq_uninstall = radeon_driver_irq_uninstall_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> index a1985a552794..8817fd033cd0 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> @@ -1111,7 +1111,8 @@ static const struct drm_crtc_helper_funcs legacy_helper_funcs = {
>         .mode_set_base_atomic = radeon_crtc_set_base_atomic,
>         .prepare = radeon_crtc_prepare,
>         .commit = radeon_crtc_commit,
> -       .disable = radeon_crtc_disable
> +       .disable = radeon_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index fd470d6bf3f4..3a61530c1398 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>                                       ktime_t *stime, ktime_t *etime,
>                                       const struct drm_display_mode *mode);
>
> +extern bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> +                                int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode);
> +
>  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
>  extern struct edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
