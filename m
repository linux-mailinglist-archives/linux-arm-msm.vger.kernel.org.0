Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D5131A42B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 19:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhBLSC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 13:02:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhBLSCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 13:02:53 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFAAC061574;
        Fri, 12 Feb 2021 10:02:15 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o15so392736wmq.5;
        Fri, 12 Feb 2021 10:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVEdZq3GXiVFA/Hko3DC5hV80mFfZHXwzqSPv2+Qh3I=;
        b=ZzgZiI5k0XMEAkPdDut+jSWlIMgtK1K1YKjJmKtVh7e6Y7zOFL+dZcp1z8CebuM1I4
         DWJWK+SR/O2UKUwfoi9goozcqXNa5tDBo3bA2o/NifZerhGU9jkuSTBxZXuNfVZHGfWR
         4r9BPzBigCObUlynW+T2ALDq7qe419Rfskb6+KikDTLCI+B5CEUfJdf/9Qyqx7hbpXBW
         NFrFjTMA5wuCEGYb2/QwUx2RtOdZnKyhYQl0JzUpLFkhd9HY6JdyoOmbauUBMz4O4ePP
         Fp+Et6xq7caTC6h/FhySN+MMBf++Irmqg/8sCHtOw6KtcAy1SgY6Q68b/n91rhcqe5hT
         G+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVEdZq3GXiVFA/Hko3DC5hV80mFfZHXwzqSPv2+Qh3I=;
        b=GIA2Sy7gRVwZ1H64ufxV0ANcJi4OFV34crzvtT1ZG3V+DeOhomzswmSeuf4HqnrRaC
         R6NDoCDfxwTrUDKSq3HjQSLofCXO5DQ7aTQZtEW07V+fhTFK5kduZL7lUipIcchB/KwM
         pmPW58xsWRbaxYlv6AU/03ywlsP34bxOQcavQc5LVJ/12yfEz5HVb81pWje3jbppJh1f
         ROylxv9TL37w0wZp1m4e2mng+Ryp4Hr2+ag1MqOXx98n04jPFtX5d7f/EUeDyuFTM9Ml
         6VGtnwgIj1JeG3QiKcUkC3OmBtsh6ndmmRVpqnpvol15SU9iukxAzycX3z4yhG2TmT1/
         djJA==
X-Gm-Message-State: AOAM530j6ww6zA1VkwWXJ6/ueZDxo0NHWJT23q2aaXxs7Qbkv4XQ9rth
        thI1irrqU2Bo3DE4ku2oMJiSjfA3X2jxGdAbTfJ2O1m3Qls=
X-Google-Smtp-Source: ABdhPJy55WTrl7HX52ZANz2U9Sl1yhlrkaWTzoX7iaehNGJUg0wrUyilFtlsgBqKa1sAHLIxVP0otPwFNp9bSxJ9rYo=
X-Received: by 2002:a1c:31d5:: with SMTP id x204mr3123920wmx.175.1613152933703;
 Fri, 12 Feb 2021 10:02:13 -0800 (PST)
MIME-Version: 1.0
References: <1613130289-16280-1-git-send-email-kalyant@codeaurora.org>
In-Reply-To: <1613130289-16280-1-git-send-email-kalyant@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 12 Feb 2021 10:02:01 -0800
Message-ID: <CAF6AEGuoc5nd=D+AVoFAVf3emjAnkGitoJcoNoOT0ZOeqv_QfQ@mail.gmail.com>
Subject: Re: [v3] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
To:     Kalyan Thota <kalyant@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 12, 2021 at 3:45 AM Kalyan Thota <kalyant@codeaurora.org> wrote:
>
> Set the flag vblank_disable_immediate = true to turn off vblank irqs
> immediately as soon as drm_vblank_put is requested so that there are
> no irqs triggered during idle state. This will reduce cpu wakeups
> and help in power saving.
>
> To enable vblank_disable_immediate flag the underlying KMS driver
> needs to support high precision vblank timestamping and also a
> reliable way of providing vblank counter which is incrementing
> at the leading edge of vblank.
>
> This patch also brings in changes to support vblank_disable_immediate
> requirement in dpu driver.
>
> Changes in v1:
>  - Specify reason to add vblank timestamp support. (Rob)
>  - Add changes to provide vblank counter from dpu driver.
>
> Changes in v2:
>  - fix warn stack reported by Rob with v2 patch
>
> Signed-off-by: Kalyan Thota <kalyant@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 80 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 28 +++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 11 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++
>  4 files changed, 123 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d4662e8..9a80981 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
>         kfree(dpu_crtc);
>  }
>
> +static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder(encoder, dev)
> +               if (encoder->crtc == crtc)
> +                       return encoder;
> +
> +       return NULL;
> +}
> +
> +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +       struct drm_encoder *encoder;
> +
> +       encoder = get_encoder_from_crtc(crtc);
> +       if (!encoder) {
> +               DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> +               return false;
> +       }
> +
> +       return dpu_encoder_get_frame_count(encoder);
> +}
> +
> +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> +                                          bool in_vblank_irq,
> +                                          int *vpos, int *hpos,
> +                                          ktime_t *stime, ktime_t *etime,
> +                                          const struct drm_display_mode *mode)
> +{
> +       unsigned int pipe = crtc->index;
> +       struct drm_encoder *encoder;
> +       int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
> +
> +       encoder = get_encoder_from_crtc(crtc);
> +       if (!encoder) {
> +               DRM_ERROR("no encoder found for crtc %d\n", pipe);
> +               return false;
> +       }
> +
> +       vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
> +       vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
> +
> +       /*
> +        * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
> +        * the end of VFP. Translate the porch values relative to the line
> +        * counter positions.
> +        */
> +
> +       vactive_start = vsw + vbp + 1;
> +       vactive_end = vactive_start + mode->crtc_vdisplay;
> +
> +       /* last scan line before VSYNC */
> +       vfp_end = mode->crtc_vtotal;
> +
> +       if (stime)
> +               *stime = ktime_get();
> +
> +       line = dpu_encoder_get_linecount(encoder);
> +
> +       if (line < vactive_start)
> +               line -= vactive_start;
> +       else if (line > vactive_end)
> +               line = line - vfp_end - vactive_start;
> +       else
> +               line -= vactive_start;
> +
> +       *vpos = line;
> +       *hpos = 0;
> +
> +       if (etime)
> +               *etime = ktime_get();
> +
> +       return true;
> +}
> +
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>                 struct dpu_plane_state *pstate, struct dpu_format *format)
>  {
> @@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>         .early_unregister = dpu_crtc_early_unregister,
>         .enable_vblank  = msm_crtc_enable_vblank,
>         .disable_vblank = msm_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +       .get_vblank_counter = dpu_crtc_get_vblank_counter,
>  };
>
>  static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
> @@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>         .atomic_check = dpu_crtc_atomic_check,
>         .atomic_begin = dpu_crtc_atomic_begin,
>         .atomic_flush = dpu_crtc_atomic_flush,
> +       .get_scanout_position = dpu_crtc_get_scanout_position,
>  };
>
>  /* initialize crtc */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c25..fb6546c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -425,6 +425,32 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>         return 0;
>  }
>
> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct dpu_encoder_phys *phy_enc;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       phy_enc = dpu_enc ? dpu_enc->cur_master : NULL;
> +
> +       return phy_enc ? atomic_read(&phy_enc->vsync_cnt) : 0;

I don't think we should use a sw vsync_cntr.. or at least not use it
for anything more than detecting that we are in this post-vblank limbo
period

But might as well keep the discussion on the v2 thread

BR,
-R

> +}
> +
> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct dpu_encoder_phys *phys;
> +       int linecount = 0;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
> +
> +       if (phys && phys->ops.get_line_count)
> +               linecount = phys->ops.get_line_count(phys);
> +
> +       return linecount;
> +}
> +
>  void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
>                                   struct dpu_encoder_hw_resources *hw_res)
>  {
> @@ -1296,12 +1322,12 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>         DPU_ATRACE_BEGIN("encoder_vblank_callback");
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
>
> +       atomic_inc(&phy_enc->vsync_cnt);
>         spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>         if (dpu_enc->crtc)
>                 dpu_crtc_vblank_callback(dpu_enc->crtc);
>         spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>
> -       atomic_inc(&phy_enc->vsync_cnt);
>         DPU_ATRACE_END("encoder_vblank_callback");
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index b491346..99a5d73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
>   */
>  void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
>                                                         u32 idle_timeout);
> +/**
> + * dpu_encoder_get_linecount - get interface line count for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
> +
> +/**
> + * dpu_encoder_get_frame_count - get interface frame count for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 374b0e8..ed636f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -14,6 +14,7 @@
>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>
>
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
> @@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>          */
>         dev->mode_config.allow_fb_modifiers = true;
>
> +       dev->max_vblank_count = 0xffffffff;
> +       /* Disable vblank irqs aggressively for power-saving */
> +       dev->vblank_disable_immediate = true;
> +
>         /*
>          * _dpu_kms_drm_obj_init should create the DRM related objects
>          * i.e. CRTCs, planes, encoders, connectors and so forth
> --
> 2.7.4
>
