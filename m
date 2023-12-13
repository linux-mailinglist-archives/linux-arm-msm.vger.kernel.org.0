Return-Path: <linux-arm-msm+bounces-4610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549C812097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5571C20971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8855B5DC;
	Wed, 13 Dec 2023 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2euGlk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71AFAE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 13:20:30 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5e2cfece112so10466917b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 13:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702502429; x=1703107229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FqXQr8abf4Sh2kGebNrfb5oJyMJpF6xCUKnEE12XH/Q=;
        b=X2euGlk2KYiKPYXeuHgb4Jak78J6YJBeCek0ZLpQRNXxVlDzaaTdjp8eXSFcltE5BO
         IG69q0FP7SySyPxgPoWj2pb/bQFz7c9tyG/rDTmKTMsWgUIFHzFU4VNhkKwIB0W1UJxG
         SMlMjYqYZ2P6b7gLdrcyvriSSuJZHDkR6B0gxqIiXGocLdFpSGqiWWzA2FQ0l106eDv3
         0/XE+Y99J9Ag61NdOE0yju0fFUFYs1b10hnNULVPFMW4BwjE5g5bonRfPF2c5NAoXgZC
         ockDEQmjFFSk770VtZ7I0Ov3eCYCzFAOixHwBw6BPD6Cnpdkvn/Z1h0q/SgG0Im7iyWR
         Ugxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702502429; x=1703107229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqXQr8abf4Sh2kGebNrfb5oJyMJpF6xCUKnEE12XH/Q=;
        b=pttoUUs3dW/CMJFD6Pkzb1c2s8Xm8Y7a13UE4bpGcBWt0Sz4FuG+RYxMoAfJWkIHzZ
         HFyJBuQv/quKCWRHkqw6yY+HIsgGmP1sYiXKe/tdu/taWkcUC/sL61TStDq1Hlb/yoXF
         TmlxJ1cxuRou8fDhtMGlmiE8R9GdcHPrQgd3sQGLvSqblv79RZV9QyVJVMIqXS3Jb8aP
         sYCI+YEIM7qOfLfBnquXpSBjYYHYjT/wk7BG4AoHDOxf+KO131a7yov4gJG0+D7EwwLf
         7JuYbfPF216+IDVy/o9zwWqumLeVCM9UudlDvzuTpc+pN/676ob2b0+8WMoJ4/9YrRpX
         bj4w==
X-Gm-Message-State: AOJu0YwfYSr/nijbgBiWPjdvkl+ESiTNC5C/xzqK9Oc6oW0lMoEOroMk
	kFNaygSRTDcyCXV/E/CDDX0USs5uRApx7bCrnnaIfA==
X-Google-Smtp-Source: AGHT+IHeo1UY1ULCcNk0KgK5peeMfa7CxbPjWoOoAA82PaXMtiZ9blILD4Z6ZOVhguzGfUKhUFB2iVcj8GUGo2GD07g=
X-Received: by 2002:a81:6582:0:b0:5d3:cd07:4c05 with SMTP id
 z124-20020a816582000000b005d3cd074c05mr6091652ywb.0.1702502429619; Wed, 13
 Dec 2023 13:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com> <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 23:20:18 +0200
Message-ID: <CAA8EJpqr0akUZoDYR1Q2+WBC4vvAgp_xfjBSq2ZTuoS4HLxnUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: Set input_sel bit for INTF
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 22:51, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
>
> Reported-by: Rob Clark <robdclark@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 0b6a0a7dcc39..226133af7840 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -322,7 +322,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>
>  static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 25af52ab602f..bbc9756ecde9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -85,7 +85,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 0b05061e3e62..87716a60332e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -477,7 +477,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
> -               bool enable, u32 frame_count)
> +               bool enable, u32 frame_count,
> +               u32 input_sel)
>  {
>         u32 config = 0;
>
> @@ -487,8 +488,13 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>         wmb();
>
>         if (enable) {
> +               /*
> +                * note: Aside from encoders, input_sel should be
> +                * set to 0x0 by default
> +                */

Even if it is not a proper kernedoc, please move this comment before
the function.

>                 config = (frame_count & MISR_FRAME_COUNT_MASK) |
> -                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
> +                       ((input_sel & 0xF) << 24);
>
>                 DPU_REG_WRITE(c, misr_ctrl_offset, config);
>         } else {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index fe083b2e5696..761056be272b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -357,7 +357,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
>                 bool enable,
> -               u32 frame_count);
> +               u32 frame_count,
> +               u32 input_sel);
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

