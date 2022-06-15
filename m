Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D697A54C4F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 11:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347328AbiFOJpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 05:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346676AbiFOJpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 05:45:08 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D81D43AC3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 02:45:07 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id j8so7730360qtn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 02:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVzPTt5ybHvSo/JJgtXOWK9z2Uviq4kmrIh51iBfsRM=;
        b=UM7vqC3LhCYi4nn2SZ3MHsX+PBJ1vqD23LVbhUFjDabsOb3o2YFi/6/FohIKpoFxFn
         JTobzw3imTUVOofin7xbWyk++CJDd19EhqqVg/Y1jDZCNwTqcslvhzF8ExCCtdhV7n1A
         ddJTJKJiK+VtVLM7ohoTF/sPcrBTMvJVVnBjBypVa/qztei/46wo2jSuKDXwEBLgerla
         ONH02nnXWyqtt1wDczGHGzEemhA/GIOe1bqbh/QfEKP9F6T07jCABNWEjKNxG8tBRJ+A
         zfzas/okvMqdkt9wk/7AOOA4Dg2HG/f+XJX0huMUKjbhJ55Yvxv+3+kXkQ50JeOLBwsj
         ciOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVzPTt5ybHvSo/JJgtXOWK9z2Uviq4kmrIh51iBfsRM=;
        b=K54O6e0oGlk/jP95LFOI2M52nDCMn0a/bMOXF0/9v4jt1FDM2YjThGcyKzrEYqKn6J
         61mm6EvGkwNu4X+xwKosTJzdXtXvPZVhnFv4mjVEJZDcrzwTJvH2Z6QA8vPQSkg1mAJT
         wsRo9jepHq2L8hoxKGXzD9IiEtxUL/EOL6H8FdppfFehnQnPU+SmaMvfpSpkXmaOqzy2
         Um3hQYONvODuEghMmXb0am0VSRYHKXUPwvcpRkL587vC8Wq8F4AjCYXM76kbr3FkMSgZ
         +Pyxeo7LSoBXy66NZisD1sr2sGBhRSYPr310i/JZLuE0Sya3BcIt2RGy/0jn8em9MAIX
         8bxw==
X-Gm-Message-State: AOAM530Wd8OrAuZ8RbNJLVjEHczt0Z4nOqCer3pbUF9w4ekzSL8hBqQN
        jxRKmn93yfbftcNdKVczg9UjmtlLp25j8g0WIkS+Dw==
X-Google-Smtp-Source: ABdhPJyDkXzzkmd0mD2GL1PFCRBzEQHG4PaOauI1u5SBGCnKSOTU7jVRkmGaK4EtYQWi81FMV5JFqMKHgh0+FNWBdJc=
X-Received: by 2002:ac8:7e87:0:b0:306:6575:6035 with SMTP id
 w7-20020ac87e87000000b0030665756035mr6366162qtj.629.1655286306278; Wed, 15
 Jun 2022 02:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220614211328.216-1-quic_jesszhan@quicinc.com> <20220614211328.216-4-quic_jesszhan@quicinc.com>
In-Reply-To: <20220614211328.216-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Jun 2022 12:44:55 +0300
Message-ID: <CAA8EJprHBdbAfTEy7wsoyLday6hWR2pBuOrBWjckB_saYDE7DA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Add interface support for CRC debugfs
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jun 2022 at 00:13, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for writing CRC values for the interface block to
> the debugfs by calling the necessary MISR setup/collect methods.
>
> Changes since V1:
> - Set values_cnt to only include phys with backing hw_intf
> - Loop over all drm_encs connected to crtc
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 49 ++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
>  4 files changed, 134 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 16742a66878e..8c9933b2337f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>         if (!strcmp(src_name, "auto") ||
>             !strcmp(src_name, "lm"))
>                 return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
> +       if (!strcmp(src_name, "intf"))
> +               return DPU_CRTC_CRC_SOURCE_INTF;

What about "encoder" / DPU_CRTC_CRC_SOURCE_ENCODER? You basically
offload CRC generation/collection to the dpu_encoder, so I'd ignore
the fact that only INTF's support MISR generation and use a more
generic word here.

>
>         return DPU_CRTC_CRC_SOURCE_INVALID;
>  }
> @@ -99,8 +101,14 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>                 return -EINVAL;
>         }
>
> -       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>                 *values_cnt = crtc_state->num_mixers;
> +       } else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
> +               struct drm_encoder *drm_enc;

Zero values_cnt here.

> +
> +               drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> +                       *values_cnt += dpu_encoder_get_num_phys(drm_enc);
> +       }
>
>         crtc_state->crcs = kcalloc(*values_cnt, sizeof(crtc_state->crcs), GFP_KERNEL);
>
> @@ -123,6 +131,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
>         }
>  }
>
> +static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
> +{
> +       struct drm_encoder *drm_enc;
> +
> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> +               dpu_encoder_setup_misr(drm_enc);
> +}
> +
>  static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  {
>         enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
> @@ -175,6 +191,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>
>         if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>                 dpu_crtc_setup_lm_misr(crtc_state);
> +       else if (source == DPU_CRTC_CRC_SOURCE_INTF)
> +               dpu_crtc_setup_encoder_misr(crtc);

else?

>
>  cleanup:
>         drm_modeset_unlock(&crtc->mutex);
> @@ -220,11 +238,31 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crt
>                         drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
>  }
>
> -static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
>  {
> -       struct dpu_crtc_state *crtc_state;
> +       struct drm_encoder *drm_enc;
> +       struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> +       int rc, pos = 0;
>
> -       crtc_state = to_dpu_crtc_state(crtc->state);
> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
> +               rc = dpu_encoder_get_crc(drm_enc, crtc_state->crcs, pos);
> +               if (rc < 0) {
> +                       if (rc != -ENODATA)
> +                               DRM_DEBUG_DRIVER("MISR read failed\n");
> +
> +                       return rc;
> +               }
> +
> +               pos += rc;
> +       }
> +
> +       return drm_crtc_add_crc_entry(crtc, true,
> +                       drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
> +}
> +
> +static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +{
> +       struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);

Unnecessary change here. Please move it to the patch 1, which
refactors this function.

>
>         /* Skip first 2 frames in case of "uncooked" CRCs */
>         if (crtc_state->crc_frame_skip_count < 2) {
> @@ -235,6 +273,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>         if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>                 return dpu_crtc_get_lm_crc(crtc, crtc_state);
>
> +       if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
> +               return dpu_crtc_get_encoder_crc(crtc);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 4bf45e3343ef..5db84ea796db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
>   * enum dpu_crtc_crc_source: CRC source
>   * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>   * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
> + * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
>   * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>   */
>  enum dpu_crtc_crc_source {
>         DPU_CRTC_CRC_SOURCE_NONE = 0,
>         DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
> +       DPU_CRTC_CRC_SOURCE_INTF,
>         DPU_CRTC_CRC_SOURCE_MAX,
>         DPU_CRTC_CRC_SOURCE_INVALID = -1
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..2cbfed5c627e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,6 +14,7 @@
>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>

Why?

>  #include <drm/drm_probe_helper.h>
>
>  #include "msm_drv.h"
> @@ -225,6 +226,69 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>         return dpu_enc->wide_bus_en;
>  }
>
> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)

The function name is misleading. It doesn't return the number of phys.
It returns a number of hw_intfs. And in reality you'd like to get the
number of crc entries supported. If at some point WB (or any other
possible dpu_encoder backend) gains support for CRC, we won't have to
change the name.  Please consider adjusting it.

> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       int i, num_intf = 0;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +               if (phys->hw_intf)
> +                       num_intf++;

You have to check for hw_intf->ops.setup_misr too.

> +       }
> +
> +       return num_intf;
> +}
> +
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +
> +       int i;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +               if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
> +                       continue;
> +
> +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> +       }
> +}
> +
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +
> +       int i, rc = 0, entries_added = 0;
> +
> +       if (!drm_enc->crtc) {
> +               DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
> +               return -EINVAL;
> +       }
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +               if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
> +                       continue;
> +
> +               rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + i]);

No, you should be indexing the crcs with entries_added rather than i.

> +               if (rc)
> +                       return rc;
> +               entries_added++;
> +       }
> +
> +       return entries_added;
> +}
> +
>  static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>  {
>         struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c91994..375370029cb9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>
>  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>
> +/**
> + * dpu_encoder_get_num_phys - get number of physical encoders contained in virtual
> + *                            encoder
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:     Number of physical encoders for given drm encoder
> + */
> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
> +
> +/**
> + * dpu_encoder_setup_misr - enable misr calculations
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
> +
> +/**
> + * dpu_encoder_get_crc - get the crc value from interface blocks
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:     0 on success, error otherwise
> + */
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
> +
>  /**
>   * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
>   * @drm_enc:    Pointer to previously created drm encoder structure
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
