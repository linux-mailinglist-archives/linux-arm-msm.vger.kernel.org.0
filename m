Return-Path: <linux-arm-msm+bounces-2825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D868004CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0167A1C20959
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273FF154AD;
	Fri,  1 Dec 2023 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7JTPBFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7088810F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:38:19 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d05ff42db0so21005497b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416298; x=1702021098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t5ltP7JnAqGdZ2Sp4RPC2GXccpajF1dUrRHA2eZOnmE=;
        b=M7JTPBFYdQrfKPpLlPhBSQ5Ck9QDEN6Jo+37Z/5U392d8n0bTtznB1bkKHbYQMafYe
         BJH0hhmlfvaj03MkgG+Xpdup4aQ4njyp+edQUHEH5riDHHb1e87OAUNKM4n3jbTP8xcC
         4SBsWaWEJ2yrz0Klom2G++HhrvNEEg7ESC+BFYlmX4wAOtYAnjpqWy3/IQ62r7M8g9go
         Y+aHfScf2OARCdgP4ZhRHgU7Eg8E2KAfkuiORM7vqZFMmcTYVV1N280xU/0Bb7RDBaMu
         1Vuv/nCOlcp8b1h74NMA313p+mMUeDLcbBltkkiouHfVBMfM95CUsUBV7zv5o9aFF7NZ
         mAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416298; x=1702021098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5ltP7JnAqGdZ2Sp4RPC2GXccpajF1dUrRHA2eZOnmE=;
        b=VkDHg6/5xvTj0onnQ+/SjyUSWOyFH4Dqpc1p72etQvPOYzDFDuaAgsbeD6bbETIqgg
         TFraSm7z4v8GXnJqNgCzK9nX+Wa5NP7e7QrneosZlY7xMdnQ+qvTzFzmHZDksxFN0h6w
         7gxk98bKskzg9M3k1MwXNnlNiYBo1AlsES9BwwT8eMND6LLZu5UrWRTpcvgAuBjrx9zI
         Pjk8llC+KhROUdV7Vwxc6n4CNkp2tJhXV7GoZhnQeZ69fgOw8BqVDCu4Z9SbBIq8nG8v
         HU8zBd6/sW2DeP5alV1GaLh5XuzqRJOF9kSUlXxjxM8yE6Ue4PpamBU3ML7CsLandDhh
         LFDQ==
X-Gm-Message-State: AOJu0Yx3NXM7TGiSbmMMqUX8qiBre3t/HlvOQczHRc6y2JLwP4QAlPBq
	tSFgvc8zhUFLAJZgT6JP/P8NW4MsJ41OvPIpdXZSCw==
X-Google-Smtp-Source: AGHT+IF0yiC8SvlzOvT4YdxY8UgBhf+uk3X3+lfII02wkBd6NeZQKwamOZxCMI/0fSzQwajNKRQGJ4z4xDo20zqjAPU=
X-Received: by 2002:a81:e502:0:b0:5d0:7361:1e53 with SMTP id
 s2-20020a81e502000000b005d073611e53mr15379280ywl.25.1701416298561; Thu, 30
 Nov 2023 23:38:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com> <20231130-encoder-fixup-v1-1-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-1-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:38:07 +0200
Message-ID: <CAA8EJpqriB8H+6THJGx6qhV0ZszbnAFbvd2+aFtNJYvjo+g0pA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Drop enable and frame_count parameters
 from dpu_hw_setup_misr()
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop the enable and frame_count parameters from dpu_hw_setup_misr() as they
> are always set to the same values.
>
> In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
> frame_count is always set to the same value.
>
> Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")

No need for the Fixes tag, there was no issue in that (or the previous) commits

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 17 ++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
>  8 files changed, 21 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 2b83a13b3aa9..79f2b69429c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -125,7 +125,7 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
>                         continue;
>
>                 /* Calculate MISR over 1 frame */
> -               m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> +               m->hw_lm->ops.setup_misr(m->hw_lm);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1cf7ff6caff4..5dbb5d27bbea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>                 if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>                         continue;
>
> -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> +               phys->hw_intf->ops.setup_misr(phys->hw_intf);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index e8b8908d3e12..3442cf65b86f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
> @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>         return DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
> -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index c539025c418b..66a5603dc7ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
> @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
>
>         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>                         const enum dpu_pingpong pp);
> -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> +       void (*setup_misr)(struct dpu_hw_intf *intf);
>         int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>
>         // Tearcheck on INTF since DPU 5.0.0
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index d1c3bd8379ea..f38473e68f79 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>   */
>
> @@ -81,9 +81,9 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>         }
>  }
>
> -static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
> +static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> index 36992d046a53..98b77cda6547 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>   */
>
> @@ -57,7 +58,7 @@ struct dpu_hw_lm_ops {
>         /**
>          * setup_misr: Enable/disable MISR
>          */
> -       void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count);
> +       void (*setup_misr)(struct dpu_hw_mixer *ctx);
>
>         /**
>          * collect_misr: Read MISR signature
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 18b16b2d2bf5..a8a0a4e76b94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>  #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -481,9 +481,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                       cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> -               u32 misr_ctrl_offset,
> -               bool enable, u32 frame_count)
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>  {
>         u32 config = 0;
>
> @@ -492,15 +490,8 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>         /* Clear old MISR value (in case it's read before a new value is calculated)*/
>         wmb();
>
> -       if (enable) {
> -               config = (frame_count & MISR_FRAME_COUNT_MASK) |
> -                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> -
> -               DPU_REG_WRITE(c, misr_ctrl_offset, config);
> -       } else {
> -               DPU_REG_WRITE(c, misr_ctrl_offset, 0);
> -       }
> -
> +       config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +       DPU_REG_WRITE(c, misr_ctrl_offset, config);
>  }
>
>  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 4bea139081bc..bb496ebe283b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>   */
>
> @@ -13,7 +13,7 @@
>  #include "dpu_hw_catalog.h"
>
>  #define REG_MASK(n)                     ((BIT(n)) - 1)
> -#define MISR_FRAME_COUNT_MASK           0xFF
> +#define MISR_FRAME_COUNT                0x1
>  #define MISR_CTRL_ENABLE                BIT(8)
>  #define MISR_CTRL_STATUS                BIT(9)
>  #define MISR_CTRL_STATUS_CLEAR          BIT(10)
> @@ -357,10 +357,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                            bool qos_8lvl,
>                            const struct dpu_hw_qos_cfg *cfg);
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> -               u32 misr_ctrl_offset,
> -               bool enable,
> -               u32 frame_count);
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
>
>  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

