Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB89552B0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 08:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbiFUGgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 02:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344171AbiFUGgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 02:36:54 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FD61A385
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:36:52 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id cu16so18416367qvb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SdYAf0CG4PNu6HaL1R4YWUXvsANAVZ1d3Ff5jO+XX/o=;
        b=BgyjGi8Kll/nY9iMWbO+yX4P1KrWvK2SXIDlYEwzzNSs2Gy4JRRpX+YPBUur1kpzRn
         3XW7G/g68fFsPqXFA7XVxjAB2MXJ2moX3X3aZZEPvhkowJzhH6+YXq0G9gsWd4UlYZaf
         CAkWw3n4EhMQRpMvBGudJ5WvQLDAsGveqxwAOub+NgVo8KdytiMHEwdTAT0tFATTD5OW
         bOe0d3H8KzFO0kuPZvFsvBwoBZmcBgiHoFHlcJQ/pAVvfK6P0S3UK14MtbPF9NBjQA7E
         ziX3SrmL6z/YyBZc6xRAiYZC6CGCYjup/bXqMIFudKjVfdpUbCxjxCE+qvpH7VeqesWY
         Q07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SdYAf0CG4PNu6HaL1R4YWUXvsANAVZ1d3Ff5jO+XX/o=;
        b=y2+3NtPnqbD0aIKYRaBmK7m3h8Ae0ji8pZupFHlgCuaMgr5pA21nG7FP4F9uNQCVPf
         FyHO4KmdOjdvkz4Tu58HMrdCjMGmnSYIe3t3mYW4wMy6K+inXUkFiVMFFubiyEGVx+5G
         k5OpmnJj9MWKkJiMj0qUo2p+lpVzDFI0h9LcIOhREytp6X5EUEOUKiy0zbl2nMFAex4P
         9wcbNdFHp16NISkUbocgM4cv9N6FTUicDlRooOlG6TeR2/MJ1WyU+4pV1+1Ok3kfsgKU
         eaTBLmdNp7m+gn+awYhpcwyq49aPbXRmEJZ7fi1Sgn03azNyPpoHeLeSxoGKM9MJzSyf
         LjuA==
X-Gm-Message-State: AJIora/ncCz+RdLmNBV94soccryC/wHevN1Bs6BZaDHGEIJQJCLjffAy
        Snmc0Hg92DHrUnG954Ct//V7fB+25tr4Uyg007cBvw==
X-Google-Smtp-Source: AGRyM1sgvs4T1KdbFI2Xrz2PHWL1lxqs/p7pJoPRU/K6IcKDHFKXdMSnBsogQ4/oyuZ68tf23uUtkph1CYn1/AxiHZs=
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr21900114qvp.119.1655793411659; Mon, 20
 Jun 2022 23:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220621005033.274-1-quic_jesszhan@quicinc.com> <20220621005033.274-4-quic_jesszhan@quicinc.com>
In-Reply-To: <20220621005033.274-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 09:36:40 +0300
Message-ID: <CAA8EJpop8=4_2xGrNt0fL4qGjYQK9+0VuQ8nq=OOXVJF7aoauQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: Add interface support for CRC debugfs
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

On Tue, 21 Jun 2022 at 03:50, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for writing CRC values for the interface block to
> the debugfs by calling the necessary MISR setup/collect methods.
>
> Changes since V1:
> - Set values_cnt to only include phys with backing hw_intf
> - Loop over all drm_encs connected to crtc
>
> Changes since V2:
> - Remove vblank.h inclusion
> - Change `pos + i` to `pos + entries`
> - Initialize values_cnt to 0 for encoder
> - Change DPU_CRTC_CRC_SOURCE_INTF to DPU_CRTC_CRC_SOURCE_ENCODER (and
>   "intf" to "enc")
> - Change dpu_encoder_get_num_phys to dpu_encoder_get_num_hw_intfs
> - Add checks for setup_misr and collect_misr in
>   dpu_encoder_get_num_hw_intfs
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 50 +++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
>  4 files changed, 138 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 69a1257d3b6d..b4e8a4432796 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>         if (!strcmp(src_name, "auto") ||
>             !strcmp(src_name, "lm"))
>                 return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
> +       if (!strcmp(src_name, "enc"))

"encoder" unless you have any strong reason (like being compatible
with other platforms).

> +               return DPU_CRTC_CRC_SOURCE_ENCODER;
>
>         return DPU_CRTC_CRC_SOURCE_INVALID;
>  }
> @@ -94,8 +96,16 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>                 return -EINVAL;
>         }
>
> -       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>                 *values_cnt = crtc_state->num_mixers;
> +       } else if (source == DPU_CRTC_CRC_SOURCE_ENCODER) {
> +               struct drm_encoder *drm_enc;
> +
> +               *values_cnt = 0;
> +
> +               drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> +                       *values_cnt += dpu_encoder_get_num_hw_intfs(drm_enc);
> +       }
>
>         return 0;
>  }
> @@ -116,6 +126,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
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
> @@ -164,6 +182,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>
>         if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>                 dpu_crtc_setup_lm_misr(crtc_state);
> +       else if (source == DPU_CRTC_CRC_SOURCE_ENCODER)
> +               dpu_crtc_setup_encoder_misr(crtc);
>         else
>                 ret = -EINVAL;
>
> @@ -212,6 +232,28 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
>                         drm_crtc_accurate_vblank_count(crtc), crcs);
>  }
>
> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc, u32 *crcs)
> +{
> +       struct drm_encoder *drm_enc;
> +       int rc, pos = 0;
> +

Extra empty line.

> +
> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
> +               rc = dpu_encoder_get_crc(drm_enc, crcs, pos);
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
> +                       drm_crtc_accurate_vblank_count(crtc), crcs);
> +}
> +
>  static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>  {
>         struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> @@ -226,6 +268,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>         if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>                 BUILD_BUG_ON(ARRAY_SIZE(crcs) < ARRAY_SIZE(crtc_state->mixers));
>                 return dpu_crtc_get_lm_crc(crtc, crtc_state, crcs);
> +       } else if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_ENCODER) {
> +               if (ARRAY_SIZE(crcs) < INTF_MAX)
> +                       DPU_ERROR("crcs array of size %ld less than %d\n",
> +                                       ARRAY_SIZE(crcs), INTF_MAX);

Ok. With the crcs array being local you don't have to preallocate it
here and pass it as an argument.
Just declare it in the dpu_crtc_get_encoder_crc(). Then you can
allocate it as `u32 crcs[INTF_MAX]` and remove the check.

> +
> +               return dpu_crtc_get_encoder_crc(crtc, crcs);
>         }
>
>         return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index aa897ec28ad3..b49cf8ae126f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -78,11 +79,13 @@ struct dpu_crtc_smmu_state_data {
>   * enum dpu_crtc_crc_source: CRC source
>   * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>   * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
> + * @DPU_CRTC_CRC_SOURCE_ENCODER: CRC in encoder
>   * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>   */
>  enum dpu_crtc_crc_source {
>         DPU_CRTC_CRC_SOURCE_NONE = 0,
>         DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
> +       DPU_CRTC_CRC_SOURCE_ENCODER,
>         DPU_CRTC_CRC_SOURCE_MAX,
>         DPU_CRTC_CRC_SOURCE_INVALID = -1
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..a8f841180383 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -225,6 +225,70 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>         return dpu_enc->wide_bus_en;
>  }
>
> +int dpu_encoder_get_num_hw_intfs(const struct drm_encoder *drm_enc)

dpu_encoder_get_crc_values_cnt(), please.

> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       int i, num_intf = 0;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +               if (phys->hw_intf && phys->hw_intf->ops.setup_misr
> +                               && phys->hw_intf->ops.collect_misr)
> +                       num_intf++;
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
> +               rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + entries_added]);
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
> index 781d41c91994..749e0144d2de 100644
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
> + * dpu_encoder_get_num_hw_intfs - get number of physical encoders contained
> + *     in virtual encoder
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:     Number of physical encoders for given drm encoder
> + */
> +int dpu_encoder_get_num_hw_intfs(const struct drm_encoder *drm_enc);
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
