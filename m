Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39866151137
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 21:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgBCUmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 15:42:35 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40154 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCUmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 15:42:35 -0500
Received: by mail-wr1-f68.google.com with SMTP id t3so130776wru.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzlJFFaD07r1rSVSfJW74lHsWleRykLVi2lypDCCujU=;
        b=hqhPOmaq4Q0ocbcPBXrM5vPpLy9AsXTC6lDDsOKX08OYoX3DqYcSVzV2aLM3qGuV5/
         +ibvKXMm9H/DsOrP92SDQZLTOqo1xnipz0oRzL6iHh7e6PCxwUTb12aniMkqRRMo4+Am
         N8bI2NhK/6CxFWKUWlfPvRgJlAGnoe761yaG2dprsiBzByqOClKGAJT4bRsM3CkDWNoH
         dONhghq22ShADwsahLLGltJ2DXE/mOOA7sxFeapuIRKZR8hl4VP0yI2JtiAb1l47OqYM
         BLn97YbXRSY17GXBTvFRtQxlLhfiQZMawKPGxD4D+zy1R+AbUDHbLWlzNuqAPyuBhCEp
         MkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzlJFFaD07r1rSVSfJW74lHsWleRykLVi2lypDCCujU=;
        b=pmvPDyyqFP+aIevtawFjmktUvaOulfMfMcDi3ohAJYVVZmFgjcLdHa/wQCFJzbOfLp
         k53scAtEpKYP4BVa2tEiLrjgVAQLR/JNNpb7XRYuFaaiP2WBAE70aAGVbhAye3hyF+OY
         IsxOop1rNWYmCE06r5IgwCdpDCKQaTjNstaQlhQ9hIRKDVCwWAGFpMDPOgrtIZaXe8ER
         we7/gmkS5cT+r6y1JBt3XvNN2wuZ6FIf+fHUycby+7U++WZd/ZWNhlB48Q/lbTG1YjTu
         vavMNBgmy0UhcaBP6r1F3V3+GL0qxrO0v6MbL3rBuhTWPcpuhTH+cqbY1lUvPz1B1ETf
         5nRA==
X-Gm-Message-State: APjAAAWHQeovlCFN7NxzSq0V4h7ZKbNCVU59yCybJoztdqlFvMPLYGfY
        FJVcKCSeOy13cmDKl24HQY4at8NEIWnojsHukRA=
X-Google-Smtp-Source: APXvYqwa0813ELVjcYzyEmJrNB03hNWfizoiM4FJwty/sLjp/+bC7+JcuEWxCHY2C7bhHs0oYZhEtnsD53UVmhKVglQ=
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr15116368wrv.111.1580762549913;
 Mon, 03 Feb 2020 12:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de> <20200123135943.24140-6-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-6-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 3 Feb 2020 15:42:18 -0500
Message-ID: <CADnq5_N2+b2n_w7tTmQxFCkAHNrM=L8w3Mihg+QBASzx8R6L2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/22] drm/amdgpu: Convert to CRTC VBLANK callbacks
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
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert amdgpu over.
>
> v2:
>         * don't wrap existing functions; change signature instead
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 21 +++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++----
>  10 files changed, 43 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index f42e8d467c12..2319fdfc42e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1191,9 +1191,9 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
>  int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
>  int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
> -u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
> -int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
> -void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
> +u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc);
> +int amdgpu_enable_vblank_kms(struct drm_crtc *crtc);
> +void amdgpu_disable_vblank_kms(struct drm_crtc *crtc);
>  long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd,
>                              unsigned long arg);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index a1e769d4417d..ad9c9546a64f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -99,7 +99,7 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
>              & (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK)) ==
>             (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK) &&
>             (int)(work->target_vblank -
> -                 amdgpu_get_vblank_counter_kms(adev->ddev, amdgpu_crtc->crtc_id)) > 0) {
> +                 amdgpu_get_vblank_counter_kms(crtc)) > 0) {
>                 schedule_delayed_work(&work->flip_work, usecs_to_jiffies(1000));
>                 return;
>         }
> @@ -219,7 +219,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
>         if (!adev->enable_virtual_display)
>                 work->base = amdgpu_bo_gpu_offset(new_abo);
>         work->target_vblank = target - (uint32_t)drm_crtc_vblank_count(crtc) +
> -               amdgpu_get_vblank_counter_kms(dev, work->crtc_id);
> +               amdgpu_get_vblank_counter_kms(crtc);
>
>         /* we borrow the event spin lock for protecting flip_wrok */
>         spin_lock_irqsave(&crtc->dev->event_lock, flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 955b78f1bba4..bc2fa428013f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1388,10 +1388,6 @@ static struct drm_driver kms_driver = {
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
> index 60591dbc2097..98c196de27a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1110,14 +1110,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  /**
>   * amdgpu_get_vblank_counter_kms - get frame count
>   *
> - * @dev: drm dev pointer
> - * @pipe: crtc to get the frame count from
> + * @crtc: crtc to get the frame count from
>   *
>   * Gets the frame count on the requested crtc (all asics).
>   * Returns frame count on success, -EINVAL on failure.
>   */
> -u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
> +u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct amdgpu_device *adev = dev->dev_private;
>         int vpos, hpos, stat;
>         u32 count;
> @@ -1177,14 +1178,15 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
>  /**
>   * amdgpu_enable_vblank_kms - enable vblank interrupt
>   *
> - * @dev: drm dev pointer
> - * @pipe: crtc to enable vblank interrupt for
> + * @crtc: crtc to enable vblank interrupt for
>   *
>   * Enable the interrupt on the requested crtc (all asics).
>   * Returns 0 on success, -EINVAL on failure.
>   */
> -int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
> +int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct amdgpu_device *adev = dev->dev_private;
>         int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
>
> @@ -1194,13 +1196,14 @@ int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
>  /**
>   * amdgpu_disable_vblank_kms - disable vblank interrupt
>   *
> - * @dev: drm dev pointer
> - * @pipe: crtc to disable vblank interrupt for
> + * @crtc: crtc to disable vblank interrupt for
>   *
>   * Disable the interrupt on the requested crtc (all asics).
>   */
> -void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe)
> +void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct amdgpu_device *adev = dev->dev_private;
>         int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index bdc1e0f036d4..2512e7ebfedf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2494,6 +2494,10 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v10_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +       .enable_vblank = amdgpu_enable_vblank_kms,
> +       .disable_vblank = amdgpu_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 0319da5f7bf9..0dde22db9848 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2573,6 +2573,10 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v11_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +       .enable_vblank = amdgpu_enable_vblank_kms,
> +       .disable_vblank = amdgpu_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 78642c3b14fc..84219534bd38 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2388,6 +2388,10 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v6_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +       .enable_vblank = amdgpu_enable_vblank_kms,
> +       .disable_vblank = amdgpu_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 1e8d4975435a..3a640702d7d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2395,6 +2395,10 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v8_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +       .enable_vblank = amdgpu_enable_vblank_kms,
> +       .disable_vblank = amdgpu_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> index 4b2f915aba47..5707e4ad1a62 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> @@ -123,6 +123,10 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_virtual_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> +       .enable_vblank = amdgpu_enable_vblank_kms,
> +       .disable_vblank = amdgpu_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3b68cddc4c81..42acb7775ee7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -383,8 +383,8 @@ static void dm_pflip_high_irq(void *interrupt_params)
>          * of pageflip completion, so last_flip_vblank is the forbidden count
>          * for queueing new pageflips if vsync + VRR is enabled.
>          */
> -       amdgpu_crtc->last_flip_vblank = amdgpu_get_vblank_counter_kms(adev->ddev,
> -                                                       amdgpu_crtc->crtc_id);
> +       amdgpu_crtc->last_flip_vblank =
> +               amdgpu_get_vblank_counter_kms(&amdgpu_crtc->base);
>
>         amdgpu_crtc->pflip_status = AMDGPU_FLIP_NONE;
>         spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
> @@ -4266,8 +4266,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>         .set_crc_source = amdgpu_dm_crtc_set_crc_source,
>         .verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
>         .get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
> +       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
>         .enable_vblank = dm_enable_vblank,
>         .disable_vblank = dm_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static enum drm_connector_status
> @@ -6478,7 +6480,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>                          * clients using the GLX_OML_sync_control extension or
>                          * DRI3/Present extension with defined target_msc.
>                          */
> -                       last_flip_vblank = amdgpu_get_vblank_counter_kms(dm->ddev, acrtc_attach->crtc_id);
> +                       last_flip_vblank = amdgpu_get_vblank_counter_kms(pcrtc);
>                 }
>                 else {
>                         /* For variable refresh rate mode only:
> @@ -6507,7 +6509,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>                          & (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK)) ==
>                         (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK) &&
>                         (int)(target_vblank -
> -                         amdgpu_get_vblank_counter_kms(dm->ddev, acrtc_attach->crtc_id)) > 0)) {
> +                         amdgpu_get_vblank_counter_kms(pcrtc)) > 0)) {
>                         usleep_range(1000, 1100);
>                 }
>
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
