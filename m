Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50A9142ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 13:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgATMce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 07:32:34 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46505 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMce (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 07:32:34 -0500
Received: by mail-lf1-f66.google.com with SMTP id z26so3267237lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AbIDR9pNoiwS2RYYFY1ApWhKRrU6bjvfq6mIUb/01Bw=;
        b=EpIR8NSfxP5x2csxJaulklUlER55UqNeAKkfCrMVT+CrjYdjSbqgcL3/DEfC8DEz5g
         SqqGk83CgCetygy8cP7HzJLNg1nvDf8IuJjahfiBa6E8L28BmB+/ATssPM8Huxxebn2V
         YT+kLovTB1PwUGUnIpRExyXz6QoV8kZppdlaBFEBBkyv7REr2n52a4Ior0K+XAMKxVdQ
         fnlzPC3cHkH+6kyZ9ZPkYOLnl/8gwp3vS+DGJzY3mIgBlhkJGmSCaYasAoLRsgqDNOyx
         +Z0xfrAukB2oyzp+kWoAGrSSJg3OsckY6SQYttd0Z7zja6LA46V9pAcyPv827xYjWn3Q
         2eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AbIDR9pNoiwS2RYYFY1ApWhKRrU6bjvfq6mIUb/01Bw=;
        b=rcnHk7X2NmbD/SPH2sOJrA07SDKtflMCa3L+lTPiBW3Xd3rl7qYdiDKivw8ZQcoqFe
         fIcC0j07UZSIc+KBE4KS/iRxsDZ2xt6h6uadE+Q1onsdvM+TwUDP4cJGT01HRm7vzuC6
         FppzTGPMkYhzNRCTKMpxfmDx+KQX+E9sctJbGZJhh/dj5kxzs5iOSH5tcsAo65mTaxJE
         VtYPC5knl1RMWgaprb3yyawZ1zoWn8+qyiqXVf+XAvPD1P+Y31sQYqsEnvljdc2JDhxh
         N9l+w1tE65YLk561UvTVGzxk+PbwYmN+StD6N/+JfcaWcKqOO6skSbGKYyn3e6XypNMl
         ZMYQ==
X-Gm-Message-State: APjAAAVx98gGbG3R8GT5xRRA2jKYp/x3IRLsKius6iJnMxqFurpXwtvT
        hgnEKt/ZsugerIo+pvCxIvQXktcLUCG4z9KgMXU=
X-Google-Smtp-Source: APXvYqwntAlqjr+2aFaQ6gaY6Ui2SgQ0xx2PBNZex/DNDmgaejFFzmYMRIqgIfSQZ60PmUpyUFAuKlEJCo+PJf7Dbys=
X-Received: by 2002:a19:228c:: with SMTP id i134mr13301617lfi.2.1579523551378;
 Mon, 20 Jan 2020 04:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20200120082314.14756-1-tzimmermann@suse.de> <20200120082314.14756-7-tzimmermann@suse.de>
In-Reply-To: <20200120082314.14756-7-tzimmermann@suse.de>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Mon, 20 Jan 2020 13:32:20 +0100
Message-ID: <CAMeQTsYkvo9Pm=TNW95jH=Ffzo36bSbwf5+6p27T7T5L0aPMAQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] drm/gma500: Convert to CRTC VBLANK callbacks
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, Eric Anholt <eric@anholt.net>,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>, harry.wentland@amd.com,
        sunpeng.li@amd.com, Jani Nikula <jani.nikula@linux.intel.com>,
        joonas.lahtinen@linux.intel.com,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 20, 2020 at 9:23 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert gma500 over.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good. For this patch:

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/cdv_intel_display.c |  3 +++
>  drivers/gpu/drm/gma500/psb_drv.c           |  4 ----
>  drivers/gpu/drm/gma500/psb_drv.h           |  6 +++---
>  drivers/gpu/drm/gma500/psb_intel_display.c |  3 +++
>  drivers/gpu/drm/gma500/psb_irq.c           | 12 +++++++++---
>  drivers/gpu/drm/gma500/psb_irq.h           |  7 ++++---
>  6 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
> index 1ed854f498b7..686385a66167 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -977,6 +977,9 @@ const struct drm_crtc_funcs cdv_intel_crtc_funcs = {
>         .set_config = gma_crtc_set_config,
>         .destroy = gma_crtc_destroy,
>         .page_flip = gma_crtc_page_flip,
> +       .enable_vblank = psb_enable_vblank,
> +       .disable_vblank = psb_disable_vblank,
> +       .get_vblank_counter = psb_get_vblank_counter,
>  };
>
>  const struct gma_clock_funcs cdv_clock_funcs = {
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 52591416f8fe..36cb292fdebe 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -363,7 +363,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>         drm_irq_install(dev, dev->pdev->irq);
>
>         dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
> -       dev->driver->get_vblank_counter = psb_get_vblank_counter;
>
>         psb_modeset_init(dev);
>         psb_fbdev_init(dev);
> @@ -507,9 +506,6 @@ static struct drm_driver driver = {
>         .irq_postinstall = psb_irq_postinstall,
>         .irq_uninstall = psb_irq_uninstall,
>         .irq_handler = psb_irq_handler,
> -       .enable_vblank = psb_enable_vblank,
> -       .disable_vblank = psb_disable_vblank,
> -       .get_vblank_counter = psb_get_vblank_counter,
>
>         .gem_free_object = psb_gem_free_object,
>         .gem_vm_ops = &psb_gem_vm_ops,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 3d4ef3071d45..956926341316 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -681,15 +681,15 @@ extern void psb_irq_turn_off_dpst(struct drm_device *dev);
>  extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
>  extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
>  extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
> -extern int psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
> -extern void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
> +extern int psb_enable_vblank(struct drm_crtc *crtc);
> +extern void psb_disable_vblank(struct drm_crtc *crtc);
>  void
>  psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
>
>  void
>  psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
>
> -extern u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
> +extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
>
>  /* framebuffer.c */
>  extern int psbfb_probed(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index fed3b563e62e..531c5485be17 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -433,6 +433,9 @@ const struct drm_crtc_funcs psb_intel_crtc_funcs = {
>         .set_config = gma_crtc_set_config,
>         .destroy = gma_crtc_destroy,
>         .page_flip = gma_crtc_page_flip,
> +       .enable_vblank = psb_enable_vblank,
> +       .disable_vblank = psb_disable_vblank,
> +       .get_vblank_counter = psb_get_vblank_counter,
>  };
>
>  const struct gma_clock_funcs psb_clock_funcs = {
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index 91f90016dba9..15eb3770d817 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -506,8 +506,10 @@ int psb_irq_disable_dpst(struct drm_device *dev)
>  /*
>   * It is used to enable VBLANK interrupt
>   */
> -int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
> +int psb_enable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct drm_psb_private *dev_priv = dev->dev_private;
>         unsigned long irqflags;
>         uint32_t reg_val = 0;
> @@ -545,8 +547,10 @@ int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
>  /*
>   * It is used to disable VBLANK interrupt
>   */
> -void psb_disable_vblank(struct drm_device *dev, unsigned int pipe)
> +void psb_disable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct drm_psb_private *dev_priv = dev->dev_private;
>         unsigned long irqflags;
>
> @@ -618,8 +622,10 @@ void mdfld_disable_te(struct drm_device *dev, int pipe)
>  /* Called from drm generic code, passed a 'crtc', which
>   * we use as a pipe index
>   */
> -u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
> +u32 psb_get_vblank_counter(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         uint32_t high_frame = PIPEAFRAMEHIGH;
>         uint32_t low_frame = PIPEAFRAMEPIXEL;
>         uint32_t pipeconf_reg = PIPEACONF;
> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
> index 58fd502e3b9d..4f73998848d1 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.h
> +++ b/drivers/gpu/drm/gma500/psb_irq.h
> @@ -12,6 +12,7 @@
>  #ifndef _PSB_IRQ_H_
>  #define _PSB_IRQ_H_
>
> +struct drm_crtc;
>  struct drm_device;
>
>  bool sysirq_init(struct drm_device *dev);
> @@ -26,9 +27,9 @@ int psb_irq_enable_dpst(struct drm_device *dev);
>  int psb_irq_disable_dpst(struct drm_device *dev);
>  void psb_irq_turn_on_dpst(struct drm_device *dev);
>  void psb_irq_turn_off_dpst(struct drm_device *dev);
> -int  psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
> -void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
> -u32  psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
> +int  psb_enable_vblank(struct drm_crtc *crtc);
> +void psb_disable_vblank(struct drm_crtc *crtc);
> +u32  psb_get_vblank_counter(struct drm_crtc *crtc);
>
>  int mdfld_enable_te(struct drm_device *dev, int pipe);
>  void mdfld_disable_te(struct drm_device *dev, int pipe);
> --
> 2.24.1
>
