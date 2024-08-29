Return-Path: <linux-arm-msm+bounces-30002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD2996437F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8465FB238A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204EE1922D6;
	Thu, 29 Aug 2024 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxToPF9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E218C03D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724932306; cv=none; b=hTsYzK3kc8TgB4ekMEnJHRs5VpWRQmuc4bVnDaBtPkIuH/bYjEm+YGS2BNeeC7koeYzZNYyDG5wfHyj3tOX03v5FYj+BLrk2pR95xxF63BGLCgYUpmiQ57RFTv//Nfjzquz5CbNQnBy4aFk92bUNM9MSCiCPqdTdk6KGM/2SqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724932306; c=relaxed/simple;
	bh=sbSDLBD7brxIdwmoafO/MhBWjafiSDS+QDNe4Zevel8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB0/XgT8fN2zI9IrgYmR7CIAWxiB7gyDKxvHt9Hrbr04gAJbMCgdUd8lU85x5KRafE34QVJuxPqdk+fh6wJnuEKmqFsTjKa5WTYOdA3tiy1w9fFOOBsEjJMJE3Wxp9a3m1Oh+r5Z5ZB82N5Bt3xITsRAxTzcm3A6pgg3nvZX2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxToPF9N; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6cf6d1a2148so5278837b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724932303; x=1725537103; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADjazXa2UYYZoyIa934Wbzo/pDx1HciCmyz3zetZEmw=;
        b=JxToPF9NSAiHhSVtJieNpLW6UmYd5zniuZ06ucWz4Rna7pV0JGEHSk3QrPoool1chs
         f6gvAq6DDEb55QgLfgqlsCurA1JHRPlR7sUf27djIQMaXE2nsu7TWIIbHSm91UwxGK62
         Wd811RzaeJZSvNhyU9xW1qG/8/70/e9SxDDtAg4aB0qrfP+PFwnE6xWG1YDey+uqD78p
         WPr5nWoZ2o154lEEHuMF+dvYcRi07F90zNhXqB1atYG2SA0eMigkscelSUh3k6Qf8XJX
         UC5GrTp28eh5KQ0miyCFk0iZ8KPxfgq0ZZi7oBpou2da2XwZtHYBoL51yQQLE0lRavOD
         CmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932303; x=1725537103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADjazXa2UYYZoyIa934Wbzo/pDx1HciCmyz3zetZEmw=;
        b=cswhPJFyLNwtNIEVvBFXiarRdepRCumeEPZG+Ew4a92GKkMUncYRpt6dl8nSeUNpBB
         yQIwRFg80PPrHQvu0n0oLPtzLgbYvGE3ncDPmTRMDNvdYlHUJo9sglw72WCovO5fCDl8
         OvXezrccG8eNMEQalNNmsHUGRF569qUU0DlaVISU1WAKyGAtzNRr0aU6K2+lpv5iiiJC
         PeaP/3JS4GTtEtnOJULmEmSqlnwKVjnfjz8BzK8kuEA8xXrs2fTSxQwDsLQbxv8OHzxM
         L04j0jNqQdlqylLf6i6k4zmyoJKhO0gJKuXGNpDBNzzNAyduMpT9J1F6xJ55c8JouB3r
         +juA==
X-Forwarded-Encrypted: i=1; AJvYcCW1csiBeu+QK+8PkXC7Vx8qxNT2o4sf7bSEDrGS16QE0SEdlLH27vqeVUgX5q4gMTouvQUd8KiH7V9esj3w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7EorTCkdwu8KW6J2nHZWzd4OTw24Wz/OZjJMQ+I7BvqN0I95
	lHEQl0ZuYWQ+d2NQUSKcAU/USRgSnFCkfR2fgwINEtHd9EK20YXwz4nsLm3dfFRIjqW97bT8eHB
	4b+zkYA5FTlJCcu7oUidFvDI8PY833/fNoX2WVg==
X-Google-Smtp-Source: AGHT+IHM1biX7BPGHYNLG30VmvjSr6bvRec9+xxWR0NidjjN7pSt1m9npJbRC3W75m5/3m4thgqZi2aUNr67Rb7+mIo=
X-Received: by 2002:a05:690c:6e10:b0:6b9:d327:9ad6 with SMTP id
 00721157ae682-6d277a78f56mr33393267b3.33.1724932303041; Thu, 29 Aug 2024
 04:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:51:32 +0300
Message-ID: <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/msm/dpu: blend pipes by left and right
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
>
> Blend pipes by left and right. The first 2 pipes are for
> left half screen and the later 2 pipes are for right in quad
> pipe case.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 19 +++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 +++-
>  4 files changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 3b3cd17976082..8fd56f8f2851f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -574,8 +574,17 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>                         mixer[i].mixer_op_mode,
>                         ctl->idx - CTL_0);
>
> -               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -                       &stage_cfg);
> +               /*
> +                * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +                * There is 4 mixers at most. The first 2 are for the left half, and
> +                * the later 2 are for the right half.
> +                */
> +               if (cstate->num_mixers == 4 && i >= 2)
> +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> +                               &stage_cfg, true);
> +               else
> +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> +                               &stage_cfg, false);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 76793201b984e..5d927f23e35b2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2049,9 +2049,13 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>                 if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
>                         phys_enc->hw_ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
>
> -               /* clear all blendstages */
> -               if (phys_enc->hw_ctl->ops.setup_blendstage)
> -                       phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
> +               /* clear all blendstages in both left and right */
> +               if (phys_enc->hw_ctl->ops.setup_blendstage) {
> +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> +                               hw_mixer[i]->idx, NULL, false);
> +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> +                               hw_mixer[i]->idx, NULL, true);
> +               }
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 602dfad127c2a..2072d18520326 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -478,12 +478,13 @@ static const struct ctl_blend_config ctl_blend_config[][2] = {
>  };
>
>  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> -       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> +       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg, bool right)
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
>         u32 mix, ext, mix_ext;
>         u32 mixercfg[5] = { 0 };
>         int i, j;
> +       int pipe_start, pipe_end;
>         int stages;
>         int pipes_per_stage;
>
> @@ -502,13 +503,27 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>         if (!stage_cfg)
>                 goto exit;
>
> +       /*
> +        * For quad pipe case, blend pipes in right side separately. Otherwise,
> +        * all content is on the left half by defaut (no splitting case).
> +        */
> +       if (!right) {

I think the approach to set PIPES_PER_STAGE to 4 is incorrect. It
complicates the code too much. Instead please use two separate
instances, each one representing a single LM pair and corresponding
set of SW pipes. Yes, you'd have to iterate over them manually.
However I think it's also going to make code simpler.

> +               pipe_start = 0;
> +               pipe_end = pipes_per_stage == PIPES_PER_STAGE ? 2 : 1;

pipe_end = pipes_per_stage

> +       } else {
> +               pipe_start = 2;
> +               pipe_end = PIPES_PER_STAGE;

So, the right part always has 2 pipes? What if the
DPU_MIXER_SOURCESPLIT isn't supported?


> +       }
> +
> +       DRM_DEBUG_ATOMIC("blend lm %d on the %s side\n", lm - LM_0,
> +                        right ? "right" : "left");
>         for (i = 0; i <= stages; i++) {
>                 /* overflow to ext register if 'i + 1 > 7' */
>                 mix = (i + 1) & 0x7;
>                 ext = i >= 7;
>                 mix_ext = (i + 1) & 0xf;
>
> -               for (j = 0 ; j < pipes_per_stage; j++) {
> +               for (j = pipe_start; j < pipe_end; j++) {
>                         enum dpu_sspp_multirect_index rect_index =
>                                 stage_cfg->multirect_index[i][j];
>                         enum dpu_sspp pipe = stage_cfg->stage[i][j];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 557ec9a924f81..2dac7885fc5e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -25,6 +25,8 @@ struct dpu_hw_ctl;
>  /**
>   * struct dpu_hw_stage_cfg - blending stage cfg
>   * @stage : SSPP_ID at each stage
> + *          The first 2 in PIPES_PER_STAGE(4) are for the first SSPP.
> + *          The 3rd/4th in PIPES_PER_STAGE(4) are for the 2nd SSPP.
>   * @multirect_index: index of the rectangle of SSPP.
>   */
>  struct dpu_hw_stage_cfg {
> @@ -243,7 +245,7 @@ struct dpu_hw_ctl_ops {
>          * @cfg       : blend stage configuration
>          */
>         void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
> -               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
> +               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg, bool right);
>
>         void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
>                 unsigned long *fetch_active);
>
> --
> 2.34.1
>


--
With best wishes
Dmitry

