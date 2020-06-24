Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD71207CE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 22:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406325AbgFXUZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 16:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406285AbgFXUZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 16:25:15 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776EDC061573;
        Wed, 24 Jun 2020 13:25:15 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q19so3737963eja.7;
        Wed, 24 Jun 2020 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AIOfbi7IvAHWTFwhOSciS+mbpizJqu08bqyXcucoS5M=;
        b=nUhGLW3eDrlXs1vQzcd3HopBFOlouYaMr9vDYVY6nynmwc6MmZ0kaiqmpZ79ejDyD3
         9Rh7hT7jp4Uu02HiccxvXZuxWCJQY+ghf8qzIGgnyeXGrk7x8aRf604LcK4o6iQ7FME1
         WjONCe6aOoRfvLAqI6laKANxYC4lMbs5tmzAhvLvPWRWvArkggso1KymMtn5H0kmXfqO
         1eKKXnUGkQvS9nPTi6EfFvkC0N388p4zmbjR6YIPXRZRWu+ltLW+c6x01IztBjL+vM5H
         8QLg7iTON4Oix62ng62fZ2bFeuNNXIV8rRs+QNSoKGngXaiVvK797CDPbDCSQaom0gOi
         EKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AIOfbi7IvAHWTFwhOSciS+mbpizJqu08bqyXcucoS5M=;
        b=DLNkxGPR1NugMKYH0KimazkKOk9UgeYH4XQN3Vwr0do9zZucRNsUugXRzDwwvznBkV
         XO8zga+xxHViC+6rzfN7JFOXBB4a+8IX9tR4OoeO9qVu7t5HVgxLNDePB74gODWRoRBr
         9HRSr4uX8W5A2FodlmyZ/L9OZF+ZizvebaxkxVCZZYMJZPhBsOq+JGPZWLZyRPov3ais
         SyXFO4P2QLzp5aUlsqloQCWc90BhSWD0Jzfzz0mE3C6X8PWz3pDhcz/FjBuMifYEC8kR
         gVGUt5SYgt0zG5Hy2OdC4qW47Bw/M0/bD0C7ymXAvAXYuQtowo+fXSDeXvQzQ8xeSLML
         CCVQ==
X-Gm-Message-State: AOAM533W4HI8ylT0iI5PukKPBpx6JFadpN8C71o3fLrOa4jaDF60U0Ak
        lMZ9hF8+ITOr2y3yblQSjcM5D0U67E5mUDtLVnI=
X-Google-Smtp-Source: ABdhPJw/iDHgooLID2Ky+/3ZRdFuED7kHW7EMlqnbsWxPn5Wdf67DTKrgCJkW7NZvUPX0bi8xOT9Fri0vmHg/4aMFZs=
X-Received: by 2002:a17:906:7c54:: with SMTP id g20mr10689573ejp.460.1593030313919;
 Wed, 24 Jun 2020 13:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <1592999796-30501-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1592999796-30501-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 24 Jun 2020 13:25:43 -0700
Message-ID: <CAF6AEGs_E+8p=-o1BHkAbAa8qY1ZaU8rPJsfzqV5L4wBBhvcAg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for dither block in display
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 4:57 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change enables dither block for primary interface
> in display.
>
> Enabled for 6bpc in the current version.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 45 +++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 66 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
>  3 files changed, 130 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..26e870a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -208,6 +208,42 @@ struct dpu_encoder_virt {
>
>  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
>
> +static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> +       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> +};
> +
> +static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
> +{
> +       struct dpu_hw_dither_cfg dither_cfg = { 0 };
> +       struct drm_display_info *info;
> +
> +       if (!phys || !phys->connector || !phys->hw_pp ||
> +               !phys->hw_pp->ops.setup_dither)
> +               return;

it looks like other than phys->hw_pp->ops.setup_dither, you shouldn't
need to check most of these conditions.

> +
> +       info = &phys->connector->display_info;
> +       if (!info)

and definitely not this one

> +               return;
> +
> +       switch (phys->connector->display_info.bpc) {
> +       case 6:
> +               dither_cfg.c0_bitdepth = 6;
> +               dither_cfg.c1_bitdepth = 6;
> +               dither_cfg.c2_bitdepth = 6;
> +               dither_cfg.c3_bitdepth = 6;
> +               dither_cfg.temporal_en = 0;
> +               break;
> +       default:
> +               phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
> +               return;
> +       }
> +
> +       memcpy(&dither_cfg.matrix, dither_matrix,
> +                       sizeof(u32) * DITHER_MATRIX_SZ);
> +
> +       phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
> +}
> +
>  void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
>                 enum dpu_intr_idx intr_idx)
>  {
> @@ -1082,6 +1118,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         struct msm_drm_private *priv;
>         struct dpu_kms *dpu_kms;
> +       int i;
>
>         if (!drm_enc || !drm_enc->dev) {
>                 DPU_ERROR("invalid parameters\n");
> @@ -1104,6 +1141,14 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>                                 dpu_kms->catalog);
>
>         _dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
> +
> +       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +               for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +                       struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +                       _dpu_encoder_setup_dither(phys);
> +               }
> +       }
>  }
>
>  void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index d110a40..cf7603d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -28,6 +28,16 @@
>  #define PP_FBC_BUDGET_CTL               0x038
>  #define PP_FBC_LOSSY_MODE               0x03C
>
> +#define PP_DITHER_EN                   0x000
> +#define PP_DITHER_BITDEPTH             0x004
> +#define PP_DITHER_MATRIX               0x008
> +
> +#define DITHER_DEPTH_MAP_INDEX 9
> +
> +static u32 dither_depth_map[DITHER_DEPTH_MAP_INDEX] = {
> +       0, 0, 0, 0, 0, 0, 0, 1, 2
> +};
> +
>  static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
>                 const struct dpu_mdss_cfg *m,
>                 void __iomem *addr,
> @@ -49,6 +59,40 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
>         return ERR_PTR(-EINVAL);
>  }
>
> +static void dpu_hw_pp_setup_dither(struct dpu_hw_pingpong *pp,
> +                                   struct dpu_hw_dither_cfg *cfg)
> +{
> +       struct dpu_hw_blk_reg_map *c;
> +       u32 i, base, data = 0;
> +
> +       if (!pp)
> +               return;

can this ever be NULL..  at least currently you are checking this both
here and in _dpu_encoder_setup_dither()

BR,
-R

> +
> +       c = &pp->hw;
> +       base = pp->caps->sblk->dither.base;
> +       if (!cfg) {
> +               DPU_REG_WRITE(c, base + PP_DITHER_EN, 0);
> +               return;
> +       }
> +
> +       data = dither_depth_map[cfg->c0_bitdepth] & REG_MASK(2);
> +       data |= (dither_depth_map[cfg->c1_bitdepth] & REG_MASK(2)) << 2;
> +       data |= (dither_depth_map[cfg->c2_bitdepth] & REG_MASK(2)) << 4;
> +       data |= (dither_depth_map[cfg->c3_bitdepth] & REG_MASK(2)) << 6;
> +       data |= (cfg->temporal_en) ? (1 << 8) : 0;
> +
> +       DPU_REG_WRITE(c, base + PP_DITHER_BITDEPTH, data);
> +
> +       for (i = 0; i < DITHER_MATRIX_SZ - 3; i += 4) {
> +               data = (cfg->matrix[i] & REG_MASK(4)) |
> +                       ((cfg->matrix[i + 1] & REG_MASK(4)) << 4) |
> +                       ((cfg->matrix[i + 2] & REG_MASK(4)) << 8) |
> +                       ((cfg->matrix[i + 3] & REG_MASK(4)) << 12);
> +               DPU_REG_WRITE(c, base + PP_DITHER_MATRIX + i, data);
> +       }
> +       DPU_REG_WRITE(c, base + PP_DITHER_EN, 1);
> +}
> +
>  static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
>                 struct dpu_hw_tear_check *te)
>  {
> @@ -180,15 +224,19 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>         return line;
>  }
>
> -static void _setup_pingpong_ops(struct dpu_hw_pingpong_ops *ops,
> -       const struct dpu_pingpong_cfg *hw_cap)
> +static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
> +                               unsigned long features)
>  {
> -       ops->setup_tearcheck = dpu_hw_pp_setup_te_config;
> -       ops->enable_tearcheck = dpu_hw_pp_enable_te;
> -       ops->connect_external_te = dpu_hw_pp_connect_external_te;
> -       ops->get_vsync_info = dpu_hw_pp_get_vsync_info;
> -       ops->poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> -       ops->get_line_count = dpu_hw_pp_get_line_count;
> +       c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
> +       c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> +       c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> +       c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
> +       c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> +       c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +
> +       if (test_bit(DPU_PINGPONG_DITHER, &features) &&
> +               IS_SC7180_TARGET(c->hw.hwversion))
> +               c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  };
>
>  static struct dpu_hw_blk_ops dpu_hw_ops;
> @@ -212,7 +260,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
>
>         c->idx = idx;
>         c->caps = cfg;
> -       _setup_pingpong_ops(&c->ops, c->caps);
> +       _setup_pingpong_ops(c, c->caps->features);
>
>         dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx, &dpu_hw_ops);
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index d73cb73..065996b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -10,6 +10,8 @@
>  #include "dpu_hw_util.h"
>  #include "dpu_hw_blk.h"
>
> +#define DITHER_MATRIX_SZ 16
> +
>  struct dpu_hw_pingpong;
>
>  struct dpu_hw_tear_check {
> @@ -35,6 +37,26 @@ struct dpu_hw_pp_vsync_info {
>  };
>
>  /**
> + * struct dpu_hw_dither_cfg - dither feature structure
> + * @flags: for customizing operations
> + * @temporal_en: temperal dither enable
> + * @c0_bitdepth: c0 component bit depth
> + * @c1_bitdepth: c1 component bit depth
> + * @c2_bitdepth: c2 component bit depth
> + * @c3_bitdepth: c2 component bit depth
> + * @matrix: dither strength matrix
> + */
> +struct dpu_hw_dither_cfg {
> +       u64 flags;
> +       u32 temporal_en;
> +       u32 c0_bitdepth;
> +       u32 c1_bitdepth;
> +       u32 c2_bitdepth;
> +       u32 c3_bitdepth;
> +       u32 matrix[DITHER_MATRIX_SZ];
> +};
> +
> +/**
>   *
>   * struct dpu_hw_pingpong_ops : Interface to the pingpong Hw driver functions
>   *  Assumption is these functions will be called after clocks are enabled
> @@ -82,6 +104,12 @@ struct dpu_hw_pingpong_ops {
>          * Obtain current vertical line counter
>          */
>         u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
> +
> +       /**
> +        * Setup dither matix for pingpong block
> +        */
> +       void (*setup_dither)(struct dpu_hw_pingpong *pp,
> +                       struct dpu_hw_dither_cfg *cfg);
>  };
>
>  struct dpu_hw_pingpong {
> --
> 1.9.1
>
