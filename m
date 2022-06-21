Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB5C552B39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 08:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345805AbiFUGnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 02:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345687AbiFUGnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 02:43:03 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93C6FD16
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:43:01 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id n197so9380278qke.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDMAfmpcVtwHtSL8Cukz2KZ68UxxlQ/r6RdB8dvo9Ps=;
        b=ZP1XDFtBZOGEQIt5GmVSpGQXPu6SdOzeRbvSacSQmMVLMUJU7zbGB/CF+ax4KYARi7
         P7dzOKiTx2c/Tq0myy9Hc1hJ/nkUrGEVNBb7njzYpwsI6NtwaJZNwuOrQA2xgyxd2o1S
         XrQhjLOsQQQeyg+quhdGtwgz6EGVzSjFtCP3ks13HeEyuqk1GaR7ENXaRz6CUUYEcTA9
         SACEMNa7vv13oLm5xA6aMA4K5ic8t0Dbg0jlZLVtSBTu54icam8aDkhQNUTiZqQ9nppm
         j1V3pBSE6aEEBcSWmDKkpUrbCoCSUZyC+JYSrBjMqSae/jIOeKEFGr59Zk1keyEYrPyg
         5K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDMAfmpcVtwHtSL8Cukz2KZ68UxxlQ/r6RdB8dvo9Ps=;
        b=jr+0zwqoe5XLK9TZYN1/wuX4CjgmYhLD0RuPHsbWZLQv2W7EeSD0Fa82ai2qKQFyJZ
         dyfTCMRosmWoafd1nIWBW0iAFHthmU5+TcxRWCTPXj3VS1WV/YDLYM3GAVrWWOBVpTWc
         kIiHpi0kuyZkWkcbo0KKfrX8J+BKYsxjLtLfSOwqcrOjzkXzdhTUSEOAtpTGxBVA7QG/
         mG0CYW6Dg1q3K4I80kIFWvcMBc/7Anadcc53yEh7/M868j4oRbiHvj6CcxQ5Q86IbG0r
         JbwJfDpaiM+BJ1n7un7OStB/QtuPR8vn+AgUIL6IsFWTYg36XTAmTT8BKS/ojqSvV+dA
         QFVg==
X-Gm-Message-State: AJIora/szw78rNMNmzM5prr7/vK4vw3UzcUEpmvSLga2FVdwdpIUPUGD
        Rgre7lnpAEi68BWOYHc6Xrpybz6aSwlE9G4vfY4MYV3d0Dm2vXfM
X-Google-Smtp-Source: AGRyM1vUeJfYyjh3kydXYSrKDxW/3xDhctDH5Qd9V09GQdUT8GXa3CTxKM7Xu6pn9tKOlomHVaw63TTOqwenOFgDFPQ=
X-Received: by 2002:a05:620a:4305:b0:6a9:3829:c03 with SMTP id
 u5-20020a05620a430500b006a938290c03mr18734199qko.363.1655793780796; Mon, 20
 Jun 2022 23:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220621005033.274-1-quic_jesszhan@quicinc.com> <20220621005033.274-2-quic_jesszhan@quicinc.com>
In-Reply-To: <20220621005033.274-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 09:42:49 +0300
Message-ID: <CAA8EJprJB2T0BQeaL=eoGa5YFJBKhPoXrDv8x3AkC=bXn1YqTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/msm/dpu: Move LM CRC code into separate method
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
> Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
> helper method. This way, we can make it easier to get CRCs from other HW
> blocks by adding other get_crc helper methods.
>
> Changes since V1:
> - Move common bitmasks to dpu_hw_util.h
> - Move common CRC methods to dpu_hw_util.c
> - Update copyrights
> - Change crcs array to a dynamically allocated array and added it as a
>   member of crtc_state
>
> Changes since V2:
> - Put changes for hw_util into a separate commit
> - Revert crcs array to a static array
> - Add else case for set_crc_source to return EINVAL if no valid source
>   is selected
> - Add DPU_CRTC_MAX_CRC_ENTRIES macro
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 79 ++++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  8 +++
>  2 files changed, 56 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777dbd0e..69a1257d3b6d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -99,17 +100,32 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>         return 0;
>  }
>
> +static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
> +{
> +       struct dpu_crtc_mixer *m;
> +       int i;
> +
> +       for (i = 0; i < crtc_state->num_mixers; ++i) {
> +               m = &crtc_state->mixers[i];
> +
> +               if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
> +                       continue;
> +
> +               /* Calculate MISR over 1 frame */
> +               m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> +       }
> +}
> +
>  static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  {
>         enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
>         enum dpu_crtc_crc_source current_source;
>         struct dpu_crtc_state *crtc_state;
>         struct drm_device *drm_dev = crtc->dev;
> -       struct dpu_crtc_mixer *m;
>
>         bool was_enabled;
>         bool enable = false;
> -       int i, ret = 0;
> +       int ret = 0;
>
>         if (source < 0) {
>                 DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
> @@ -146,16 +162,10 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>
>         crtc_state->crc_frame_skip_count = 0;
>
> -       for (i = 0; i < crtc_state->num_mixers; ++i) {
> -               m = &crtc_state->mixers[i];
> -
> -               if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
> -                       continue;
> -
> -               /* Calculate MISR over 1 frame */
> -               m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> -       }
> -
> +       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +               dpu_crtc_setup_lm_misr(crtc_state);
> +       else
> +               ret = -EINVAL;
>
>  cleanup:
>         drm_modeset_unlock(&crtc->mutex);
> @@ -174,34 +184,22 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>         return dpu_encoder_get_vsync_count(encoder);
>  }
>
> -
> -static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> +               struct dpu_crtc_state *crtc_state, u32 *crcs)
>  {
> -       struct dpu_crtc_state *crtc_state;
> -       struct dpu_crtc_mixer *m;
> -       u32 crcs[CRTC_DUAL_MIXERS];
> +       struct dpu_crtc_mixer *lm;
>
> -       int i = 0;
>         int rc = 0;
> -
> -       crtc_state = to_dpu_crtc_state(crtc->state);
> -
> -       BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
> -
> -       /* Skip first 2 frames in case of "uncooked" CRCs */
> -       if (crtc_state->crc_frame_skip_count < 2) {
> -               crtc_state->crc_frame_skip_count++;
> -               return 0;
> -       }
> +       int i;
>
>         for (i = 0; i < crtc_state->num_mixers; ++i) {
>
> -               m = &crtc_state->mixers[i];
> +               lm = &crtc_state->mixers[i];

Why?

>
> -               if (!m->hw_lm || !m->hw_lm->ops.collect_misr)
> +               if (!lm->hw_lm || !lm->hw_lm->ops.collect_misr)
>                         continue;
>
> -               rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
> +               rc = lm->hw_lm->ops.collect_misr(lm->hw_lm, &crcs[i]);
>
>                 if (rc) {
>                         if (rc != -ENODATA)
> @@ -214,6 +212,25 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>                         drm_crtc_accurate_vblank_count(crtc), crcs);
>  }
>
> +static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +{
> +       struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> +       u32 crcs[DPU_CRTC_MAX_CRC_ENTRIES];

Following up the review of patch 4, I'd suggest moving crcs to
dpu_crtc_get_lm_crc().

> +
> +       /* Skip first 2 frames in case of "uncooked" CRCs */
> +       if (crtc_state->crc_frame_skip_count < 2) {
> +               crtc_state->crc_frame_skip_count++;
> +               return 0;
> +       }
> +
> +       if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
> +               BUILD_BUG_ON(ARRAY_SIZE(crcs) < ARRAY_SIZE(crtc_state->mixers));
> +               return dpu_crtc_get_lm_crc(crtc, crtc_state, crcs);
> +       }
> +
> +       return 0;

-EINVAL?

> +}
> +
>  static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>                                            bool in_vblank_irq,
>                                            int *vpos, int *hpos,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b8785c394fcc..aa897ec28ad3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -69,6 +69,11 @@ struct dpu_crtc_smmu_state_data {
>         uint32_t transition_error;
>  };
>
> +/*
> + * Maximum CRC entries that can be in crcs entries array
> + */
> +#define DPU_CRTC_MAX_CRC_ENTRIES       8
> +
>  /**
>   * enum dpu_crtc_crc_source: CRC source
>   * @DPU_CRTC_CRC_SOURCE_NONE: no source set
> @@ -201,6 +206,9 @@ struct dpu_crtc {
>   * @mixers        : List of active mixers
>   * @num_ctls      : Number of ctl paths in use
>   * @hw_ctls       : List of active ctl paths
> + * @crc_source    : CRC source
> + * @crc_frame_skip_count: Number of frames skipped before getting CRC
> + * @crcs          : Array to store CRC values

There is no crcs array anymore

>   */
>  struct dpu_crtc_state {
>         struct drm_crtc_state base;
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
