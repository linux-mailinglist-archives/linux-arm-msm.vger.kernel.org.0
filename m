Return-Path: <linux-arm-msm+bounces-2824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2538004C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72A26B20D42
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6883125B5;
	Fri,  1 Dec 2023 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yqkde56r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C92D4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:36:18 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d3d0f862f7so9252437b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416178; x=1702020978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agsfiRECeqYBBTNI5jA/GLw7ZqrRCfvXHnWiPUcu+5c=;
        b=Yqkde56rn5X/SJTsoQ2a4hUBMoNbbgMdQeC49Tqgr4zUgkc3NIt9SYFtbm6AUn5dRX
         uOzhirxKy1g9B2fqTrwoHK2qgQh4eBt4rqwgjXimZ2Mii+lk2naZXD3uJ1sFJbL3XsoT
         id3jAlX66rOufAa/eBscJCd4+KLe40Ws/DWhXLUqNycoRm1IkUY5ZVG2Hnpm+qrYrL9L
         Wl/JQse1G8qsgmMDlwEqXPQBTqBQpatrYI/j7lb6F0/4K/bMwgJ1Rk1xqURWl5zNvh3B
         Sdua1wkWUHLqCKL21IrphrWiUHVfZI55QfmkGkjrjOVwbmuFJz8Y7as/ex8KFBoKqp+u
         k4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416178; x=1702020978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agsfiRECeqYBBTNI5jA/GLw7ZqrRCfvXHnWiPUcu+5c=;
        b=dU+rs2i9ZTmabwpaWILt5JxQ2K2JwwGMtUbTUef0fzjjvtf54MJkAJQJ6Zo+I/n2AL
         ovZIphY8GS/9SaJhXPpDmlt5HgDSYNNbahsRo2xwCEATzC9HEIf3DBvVBlnc6834oPiJ
         Pv7qR16Erc31U5a1LyQLVSL9z4ScLLB/dfhlViTQII8M2rt4+CdFtVDsMKMdBYpENOmy
         d0UT6asJFccRUH0MXboQqBwBhZB9kf7/3fI4zTNMbffwBwJQPtoI4vKlDN5LNHuvk1nB
         Xp/1c0m5VF/bEis+FkPS6Y/bXBPxgtwPjP3gFNkg+H9b/xCoAaIQBpYTsc7fhUgeXVW6
         wqgA==
X-Gm-Message-State: AOJu0YxmDXPzPX1ib0pmdFfajSg/CvesHlXLocTOH790ww4eYnBHKc15
	GwDODvrfT/omI3K1uHv2llfABV27uIdllQ8YKC1kzA==
X-Google-Smtp-Source: AGHT+IGbb2baOB0YO00MsvV5IKpg+i74V1z52uF6AVI5m1Ru+KhhZ9N4dcWelfpI2abVk4W6sHR5sUCVFZgpwgYXSlE=
X-Received: by 2002:a25:8d0b:0:b0:d9b:eb86:2b26 with SMTP id
 n11-20020a258d0b000000b00d9beb862b26mr22384450ybl.21.1701416177709; Thu, 30
 Nov 2023 23:36:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com> <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:36:06 +0200
Message-ID: <CAA8EJpqeu18q4jN82fUvsEdBRmEjG_mYLQQUWD+LDxjiQQQPsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Set input_sel bit for INTF
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
>
> Reported-by: Rob Clark <robdclark@gmail.com>
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 7 ++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 4 +++-
>  4 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3442cf65b86f..d0884997ecb7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -320,7 +320,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>
>  static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, true);
>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index f38473e68f79..77b14107c84a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, false);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index a8a0a4e76b94..f441df47fdde 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -481,7 +481,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                       cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
> +               bool set_input_sel)
>  {
>         u32 config = 0;
>
> @@ -491,6 +492,10 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>         wmb();
>
>         config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +
> +       if (set_input_sel)
> +               config |= MISR_CTRL_INPUT_SEL;
> +
>         DPU_REG_WRITE(c, misr_ctrl_offset, config);
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index bb496ebe283b..793670d62414 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -17,6 +17,7 @@
>  #define MISR_CTRL_ENABLE                BIT(8)
>  #define MISR_CTRL_STATUS                BIT(9)
>  #define MISR_CTRL_STATUS_CLEAR          BIT(10)
> +#define MISR_CTRL_INPUT_SEL             BIT(24)

The public apq8916 TRM documents this as a 4-bit field. I think this
was followed into the later generations. Can we please document it
correctly and use an uint instead of just bool for set_input_sel?

>  #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
>
>  /*
> @@ -357,7 +358,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                            bool qos_8lvl,
>                            const struct dpu_hw_qos_cfg *cfg);
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
> +                      bool set_input_sel);
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

