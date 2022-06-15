Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB8B54C4C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 11:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241386AbiFOJgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 05:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiFOJgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 05:36:21 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3112344C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 02:36:20 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id x16so7714685qtw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7QNEGYXUz8pQf3w+1bvDdtgFH6MUG0ZoicrR4BjVHCc=;
        b=KLhRgQIh7j56rL+CeT1/AIsPs7HbftKnmpfSQGNxEaYzR+UvgSTW/66ZG7A5uSRB8m
         rYcBEns4a0tpewjfdBSWFlOdJ0s8y18USj87ulTV0wZxDZH7R5rvTq8QqwCye9COw7eh
         oYZTlt8Xy9f1YoIylk+uIB1wTM2gwYSDLHrx3oEVXhw6f28lyIiY3ssCjtQzlBdNroFR
         VADuJcqtNdpLbPSeCv841rPmr41txzfHXdTIqX/TrEN+73hGB/AV5UxCfc0y6lrsrUQM
         0etmPt6DHp/LoihXdY3MhnrvC40sKIgGcjJTQlsFZfaxADXpvXFNVo0HSRY3t7Ji712k
         jIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QNEGYXUz8pQf3w+1bvDdtgFH6MUG0ZoicrR4BjVHCc=;
        b=ArjA8eSDBBUTYQdyMA2MUIDzQn0ZcGoyBfrvA4rUqHCfwnN7/02CUskHGIP52wUPzz
         PWZ+lP/r2Be6iugUHDf0lCxy2Tn7ZCd/aka3GL4p9VxxEaC7BiXun4LKwVsq+H1Qz82f
         ogOhfciSPltMTE7pNnWSKD4uXsFphcw7Zfin9J83+P3yLdtDH3GSFwT/aPJEl7oUL6LM
         4ZFHJaF+zJgqMv3f3trsmsVy7w6kwJPEHpv73ScQvt9Z4vLqeV2QwpAbX/X6ls4GA4YH
         QAfCgPpO+FhZdwHdd7Slm9t/mgRdRWB1TOXntFjcALYvPHe5EtI9YegQHjH7OjWANFjR
         GB5A==
X-Gm-Message-State: AOAM531NJ/TsxP/3N8LuUsz7g0om3jZNRXXLZ+5JRLDHTaP1L0V7to9A
        XpRpYDUJgGijlBSGKMo5rvh1kn0vzlyHQ6BPBt8zzA==
X-Google-Smtp-Source: ABdhPJy2bbSEedgpMZFbZEgRXdnRZv2EXPcCVH6aPnp4Gb7d93BjTJ+t4/cvMDZUeHyJwmLG6si774f6ZtVKomeNQH4=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr8051126qte.370.1655285779944; Wed, 15
 Jun 2022 02:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220614211328.216-1-quic_jesszhan@quicinc.com> <20220614211328.216-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220614211328.216-3-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Jun 2022 12:36:09 +0300
Message-ID: <CAA8EJpoNQTzMQB8Kge9LshMzAQM8NEYtrDVPaz9OJ3zrD-X2xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: Add MISR register support for interface
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
> Add support for setting MISR registers within the interface
>
> Changes since V1:
> - Replaced dpu_hw_intf collect_misr and setup_misr implementations with
>   calls to dpu_hw_utils helper methods
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 +++++++-
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3f4d2c6e1b45..0157613224fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #include "dpu_hwio.h"
> @@ -67,6 +69,9 @@
>  #define INTF_CFG2_DATABUS_WIDEN        BIT(0)
>  #define INTF_CFG2_DATA_HCTL_EN BIT(4)
>
> +#define INTF_MISR_CTRL                 0x180
> +#define INTF_MISR_SIGNATURE            0x184
> +
>  static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>                 const struct dpu_mdss_cfg *m,
>                 void __iomem *addr,
> @@ -319,6 +324,16 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>         return DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
> +{
> +       dpu_hw_setup_misr(&intf->hw, enable, frame_count, INTF_MISR_CTRL);
> +}
> +
> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> +{
> +       return dpu_hw_collect_misr(&intf->hw, misr_value, INTF_MISR_CTRL, INTF_MISR_SIGNATURE);
> +}
> +
>  static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>                 unsigned long cap)
>  {
> @@ -329,6 +344,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>         ops->get_line_count = dpu_hw_intf_get_line_count;
>         if (cap & BIT(DPU_INTF_INPUT_CTRL))
>                 ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> +       ops->setup_misr = dpu_hw_intf_setup_misr;
> +       ops->collect_misr = dpu_hw_intf_collect_misr;
>  }
>
>  struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 7b2d96ac61e8..8d0e7b509260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -1,5 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #ifndef _DPU_HW_INTF_H
> @@ -57,6 +59,8 @@ struct intf_status {
>   * @ get_line_count: reads current vertical line counter
>   * @bind_pingpong_blk: enable/disable the connection with pingpong which will
>   *                     feed pixels to this interface
> + * @setup_misr: enable/disable MISR
> + * @collect_misr: read MISR signature
>   */
>  struct dpu_hw_intf_ops {
>         void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
>         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>                         bool enable,
>                         const enum dpu_pingpong pp);
> +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> +       int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>  };
>
>  struct dpu_hw_intf {
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
