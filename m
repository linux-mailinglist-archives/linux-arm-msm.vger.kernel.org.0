Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 981257D42AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 00:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjJWWaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 18:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjJWWaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 18:30:23 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48BF10E
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 15:30:20 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso3569408276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 15:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698100220; x=1698705020; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x9S2aROCP4k9L8N902HSEyin6tTcXlI1+jG9pBbmJb8=;
        b=Chl4R84ZAHMa4l3AW/k9I0t2xffb/22wbP4PO+RyXhi26JcTIMbosw7cvhyQGRjyH1
         UOpg9Qo6E6633nwFwQV485z0gStaarU2K1PACY2FWWI5+PG0gIybfcZtW9sFHWaPErgz
         HdmKVeevHFCDiQmdvLSFWVG3kUXL+GkbTEhPFdDdeflN6pZVnfqBtphNVf3sqEI9bUJ1
         nTltPwIL+kxXiO/+kYs61eTu2ejSSDeYC60Ogfa5uAmBLKRVIKkqr9eeZIbaxtAt/dXb
         33Lm25FiAbcFnuPo1jne9b0WK511SLW9yIW4XW45vliLlq7WXYGkHu1qxYUA4cQP9mYn
         Oobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698100220; x=1698705020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9S2aROCP4k9L8N902HSEyin6tTcXlI1+jG9pBbmJb8=;
        b=xNJ5/d2npT+kgmdt8qIyWVXk8BkXbpH1zGVY2C97d66eCR53FWqfSgeP6f+QUO1THl
         poIjDjnrLiPzXhSr4fwx4EcMFDT8J1NXV94kOiWzYnA28PbuIhYv4VdecmruwyO76nId
         lVJYAmVmaSYHKpVkehiwcThjTPQbXnvWHBN7WI2AfyGF0D3JiC8+F026Kvhsq10heaKt
         rH3t5m7mSzzAdonFzGXu3pzWKa49Iy4GUIWXKuIdenIijPSVTzyuwGca1WR0RnuQcByp
         sEKU6IrB44kHeqhWL6arATTvuSkfY06Ai+lKiP007ohlawyQro5CMJhQomE7/VBHnCGS
         rACA==
X-Gm-Message-State: AOJu0YybCiqd2UJVdBMfnD7Gq+KesW2Ra3yy1E1rXzNRoQ1hl30RBhng
        mqP3Nqw+QYY1jkBiZIvLv5tSwuOA8YtylqK8Ik+LUQ==
X-Google-Smtp-Source: AGHT+IFIO5QT3FB4wyeX/SyBEWgUIqrjgf/skE9jm/AH5eWpBBjI/EDxcDbxidwyKA2XyAPnJdfZHyI6PvZ8SiRueQ8=
X-Received: by 2002:a25:784:0:b0:da0:2d16:fcf4 with SMTP id
 126-20020a250784000000b00da02d16fcf4mr1412467ybh.11.1698100219876; Mon, 23
 Oct 2023 15:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231023221250.116500-1-robdclark@gmail.com>
In-Reply-To: <20231023221250.116500-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 01:30:08 +0300
Message-ID: <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix encoder CRC to account for CTM enablement
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Arnaud Vrac <rawoul@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Oct 2023 at 01:12, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Seems like we need to pick INPUT_SEL=1 when CTM is enabled.  But not
> otherwise.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
>  8 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 2b83a13b3aa9..d93a92ffd5df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -134,7 +134,7 @@ static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
>         struct drm_encoder *drm_enc;
>
>         drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> -               dpu_encoder_setup_misr(drm_enc);
> +               dpu_encoder_setup_misr(drm_enc, !!crtc->state->ctm);
>  }
>
>  static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b0a7908418ed..12ee7acb5ea6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -241,7 +241,7 @@ int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
>         return num_intf;
>  }
>
> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc, bool has_ctm)
>  {
>         struct dpu_encoder_virt *dpu_enc;
>
> @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>                 if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>                         continue;
>
> -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1, has_ctm);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 4c05fd5e9ed1..510783b2fb24 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -169,8 +169,9 @@ int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc);
>  /**
>   * dpu_encoder_setup_misr - enable misr calculations
>   * @drm_enc:    Pointer to previously created drm encoder structure
> + * @has_ctm:    Is CTM enabled
>   */
> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder, bool has_ctm);
>
>  /**
>   * dpu_encoder_get_crc - get the crc value from interface blocks
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index e8b8908d3e12..cb06f80cc671 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>         return DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
> -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count, bool has_ctm)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, has_ctm);

I'm not sure about the dpu_encoder and dpu_hw_intf interfaces. But
dpu_hw_setup_misr definitely needs the `u8 input_sel` parameter
instead of `bool has_ctm`.
Most likely, I'd use u8 for dpu_hw_intf operation too.

Could you please adjust?

>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index c539025c418b..95aafc4cf58e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
>
>         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>                         const enum dpu_pingpong pp);
> -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count, bool has_ctm);
>         int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>
>         // Tearcheck on INTF since DPU 5.0.0
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index d1c3bd8379ea..2efe29396c6a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, false);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 9d2273fd2fed..528b8439209f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -483,7 +483,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
> -               bool enable, u32 frame_count)
> +               bool enable, u32 frame_count, bool has_ctm)
>  {
>         u32 config = 0;
>
> @@ -496,6 +496,9 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 config = (frame_count & MISR_FRAME_COUNT_MASK) |
>                         MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
>
> +               if (!has_ctm)
> +                       config |= 1 << 24;

Please define MISR_CTRL_INPUT_SEL instead.

> +
>                 DPU_REG_WRITE(c, misr_ctrl_offset, config);
>         } else {
>                 DPU_REG_WRITE(c, misr_ctrl_offset, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 1f6079f47071..e42d9d00e40e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -360,7 +360,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
>                 bool enable,
> -               u32 frame_count);
> +               u32 frame_count,
> +               bool has_ctm);
>
>  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
