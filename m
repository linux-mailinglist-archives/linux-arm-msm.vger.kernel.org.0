Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDEB3DDC69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 17:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbhHBP1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 11:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234885AbhHBP1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 11:27:41 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69422C0613D5
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 08:27:31 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y18so24526550oiv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=612/JVdKAz1qdrtNpS+wKTTb6C92VSuWsomQcNmS5Mw=;
        b=k3gDCijKpvOLyL5osu46BBobyi+eSCbNv6R0x4S/mAxFFGoTA25WmxUEzODNRjvTKt
         Xk+vmOzepQRJMVRqvx0hSVVErn6TK0GTe14yxFEc02uwNkgAMVgUl2kl0lT3elgNYmTt
         L7HFIfl3pAqQ4JZ60bX2stn3eMNAdvibdRjceyHRUOgdfNWq8EH2rswHqgH/mKmlYflA
         wbu0IDekH+x7W4PibMOZRxgx6UwJeAf+apaD0H6iJhYwLSMZD4qo07rhnsNNjK801nwH
         qGbGuaVRn7G7az9xcoRi9BBDrPzZcqVIW5hpMh0m5CZ55dv7xcBaxaHjLGIbYlSpo2th
         uM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=612/JVdKAz1qdrtNpS+wKTTb6C92VSuWsomQcNmS5Mw=;
        b=Vae45gl4drFgyXOg7QRIWbIZLac0l9X/yYXomVBr52SyWn1A07bP35AlpLBTeyEC/4
         4rQqzvvkZFkjExR1si/djvmrWp6rvrv1drlqO/94yCbvHrQY6xNVt2zFza6RXhWnUvOh
         71KD3OAIK/uSu1grPjIN+N0Qb7dTH2qDdXNRohnbgV3XWqC40o8k9imLItNkzfPwv2mD
         pv6+kM5i0apU3td7eiTUhKH6ZzN0z2Rxk+JsueTZcWq8wwMwlUoonqwhQATMoOAc0DV9
         BfZDVMrfaJPznhR0LbjVxeYrtMcstfJO8asiwD5RkqKZr/X29S5GYNkM2WlefXi/eqU9
         gxEw==
X-Gm-Message-State: AOAM530LJz6HMfcIH+grRhpyerIkxrwW4ZjlyulmwlvICijMuimlu8qo
        PWCbUqdGgGFeTAf3puwc0HVim8UgNE9ZQ5olbYs=
X-Google-Smtp-Source: ABdhPJwKUpNeOIXqOAgml/bHU3F1D89teHU+7ObGdkrtZ0l8aGwF4bh0Xdvq4fQzSAcsYvJIyhG0YWEombYoR93sNYA=
X-Received: by 2002:aca:53ca:: with SMTP id h193mr8387560oib.5.1627918049331;
 Mon, 02 Aug 2021 08:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210727182721.17981-1-tzimmermann@suse.de> <20210727182721.17981-10-tzimmermann@suse.de>
In-Reply-To: <20210727182721.17981-10-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 2 Aug 2021 11:27:18 -0400
Message-ID: <CADnq5_O+ahz4_rgc5gGv=ZJ+vj21s2=6Y2wSkSoC7j55CP_LHQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] drm/radeon: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stefan Agner <stefan@agner.ch>, alison.wang@nxp.com,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        anitha.chrisanthus@intel.com, Rob Clark <robdclark@gmail.com>,
        edmund.j.dea@intel.com, Sean Paul <sean@poorly.run>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>, jyri.sarha@iki.fi,
        tomba@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 27, 2021 at 2:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> DRM IRQ callbacks are now being called directly or inlined.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_drv.c     |  4 ---
>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 44 +++++++++++++++++++++----
>  drivers/gpu/drm/radeon/radeon_kms.h     |  4 ---
>  3 files changed, 37 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index c8dd68152d65..b74cebca1f89 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -607,10 +607,6 @@ static const struct drm_driver kms_driver = {
>         .postclose = radeon_driver_postclose_kms,
>         .lastclose = radeon_driver_lastclose_kms,
>         .unload = radeon_driver_unload_kms,
> -       .irq_preinstall = radeon_driver_irq_preinstall_kms,
> -       .irq_postinstall = radeon_driver_irq_postinstall_kms,
> -       .irq_uninstall = radeon_driver_irq_uninstall_kms,
> -       .irq_handler = radeon_driver_irq_handler_kms,
>         .ioctls = radeon_ioctls_kms,
>         .num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
>         .dumb_create = radeon_mode_dumb_create,
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index a36ce826d0c0..3907785d0798 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -31,7 +31,7 @@
>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> -#include <drm/drm_irq.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/radeon_drm.h>
> @@ -51,7 +51,7 @@
>   * radeon_irq_process is a macro that points to the per-asic
>   * irq handler callback.
>   */
> -irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg)
> +static irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg)
>  {
>         struct drm_device *dev = (struct drm_device *) arg;
>         struct radeon_device *rdev = dev->dev_private;
> @@ -118,7 +118,7 @@ static void radeon_dp_work_func(struct work_struct *work)
>   * Gets the hw ready to enable irqs (all asics).
>   * This function disables all interrupt sources on the GPU.
>   */
> -void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
> +static void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
>  {
>         struct radeon_device *rdev = dev->dev_private;
>         unsigned long irqflags;
> @@ -150,7 +150,7 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
>   * Handles stuff to be done after enabling irqs (all asics).
>   * Returns 0 on success.
>   */
> -int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
> +static int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
>  {
>         struct radeon_device *rdev = dev->dev_private;
>
> @@ -169,7 +169,7 @@ int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
>   *
>   * This function disables all interrupt sources on the GPU (all asics).
>   */
> -void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
> +static void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
>  {
>         struct radeon_device *rdev = dev->dev_private;
>         unsigned long irqflags;
> @@ -194,6 +194,36 @@ void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
>         spin_unlock_irqrestore(&rdev->irq.lock, irqflags);
>  }
>
> +static int radeon_irq_install(struct radeon_device *rdev, int irq)
> +{
> +       struct drm_device *dev = rdev->ddev;
> +       int ret;
> +
> +       if (irq == IRQ_NOTCONNECTED)
> +               return -ENOTCONN;
> +
> +       radeon_driver_irq_preinstall_kms(dev);
> +
> +       /* PCI devices require shared interrupts. */
> +       ret = request_irq(irq, radeon_driver_irq_handler_kms,
> +                         IRQF_SHARED, dev->driver->name, dev);
> +       if (ret)
> +               return ret;
> +
> +       radeon_driver_irq_postinstall_kms(dev);
> +
> +       return 0;
> +}
> +
> +static void radeon_irq_uninstall(struct radeon_device *rdev)
> +{
> +       struct drm_device *dev = rdev->ddev;
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
> +       radeon_driver_irq_uninstall_kms(dev);
> +       free_irq(pdev->irq, dev);
> +}
> +
>  /**
>   * radeon_msi_ok - asic specific msi checks
>   *
> @@ -314,7 +344,7 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
>         INIT_WORK(&rdev->audio_work, r600_audio_update_hdmi);
>
>         rdev->irq.installed = true;
> -       r = drm_irq_install(rdev->ddev, rdev->pdev->irq);
> +       r = radeon_irq_install(rdev, rdev->pdev->irq);
>         if (r) {
>                 rdev->irq.installed = false;
>                 flush_delayed_work(&rdev->hotplug_work);
> @@ -335,7 +365,7 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
>  void radeon_irq_kms_fini(struct radeon_device *rdev)
>  {
>         if (rdev->irq.installed) {
> -               drm_irq_uninstall(rdev->ddev);
> +               radeon_irq_uninstall(rdev);
>                 rdev->irq.installed = false;
>                 if (rdev->msi_enabled)
>                         pci_disable_msi(rdev->pdev);
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.h b/drivers/gpu/drm/radeon/radeon_kms.h
> index 9b97bf38acd4..36e73cea9215 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.h
> +++ b/drivers/gpu/drm/radeon/radeon_kms.h
> @@ -31,9 +31,5 @@
>  u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
>  int radeon_enable_vblank_kms(struct drm_crtc *crtc);
>  void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> -irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
> -void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
> -int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
> -void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
>
>  #endif                         /* __RADEON_KMS_H__ */
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
