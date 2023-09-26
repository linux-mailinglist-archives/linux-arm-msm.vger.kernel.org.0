Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175867AEA43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 12:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjIZKWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 06:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjIZKWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 06:22:21 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441A5DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 03:22:15 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bf1dde73fso106822247b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695723734; x=1696328534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a98I+/enWVs0BEjUps7tbFx8/Tj78e5XZIx5A8fkfhE=;
        b=eT/u6bJUvD3zAQnvIe1VnlKFkKwyk7s+H5HFzh0L7pvVn3OtZ0x38c0K30VkyEGBhJ
         hPBTNKjiTEeOipNfw+6fbf9pvV7qnXJY6TAjhNH5/tFgrmk7QIV/XAV/iZgJTxInPvyh
         4dRzTZDs3DSze7gTdR8uud7MHfYD3BRBXlOctDewLRxSD0vpzkdbtS1+ZX0XaN0NIIe7
         vd7kkDQ6iGjP451lIBiiqC2722J9ROG0M+41vEfmWRws1217ENwA5pyeqmVmcR/vyDKs
         Y66qzSDp7h+agAbVFtqxz2rJMvOzqVGkPtuzqX047utvdSsFE3yhBTjE80t0XANAxEa7
         FB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695723734; x=1696328534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a98I+/enWVs0BEjUps7tbFx8/Tj78e5XZIx5A8fkfhE=;
        b=qWL/Ry2dFQgzUwftVnGATfJ7dZ5UCjmdMQz9dem4+5xOq8tDrBFe5RLY8fE8gDkiGk
         7SS7ycTSY8MvgzYVhdriHr+8cm1Zp9Y4N+5qt4PjysBLDflTQOMnFoNa9koLZy41gQoq
         /ov7Tabz8Dnns7/Dj7VpePlVGZEz42FEF6Ink+wiWBEvujgO1JSovoleeTsz+wruaPrY
         bHPl+LnfsW4NIyPKfDEC04ICgDnfJqpJ4YMUtpYZReGP2KzBIvOqj7P0v0pzTd+Abla3
         /Hm2HfLqufY0W0tWrHYQJmxUJtOiutjijnePL/bmsqivo/8MGLCP7LxCQL54MVAdINcV
         x+Lg==
X-Gm-Message-State: AOJu0Yxy21V2LE50/Gs5uLPF3ACcoB/VutnoDMlNBU9MSJpAIwbwcgKs
        7V0EyxqY8DN6a2N9zHe8y6IjBTuuSWkf9s+LoeP4Lw==
X-Google-Smtp-Source: AGHT+IGmLuat8sSPGzk/B0CHDauKNfvhdOvdCcSe26K4vrmzaiM9ls0m20+5wDgFIeDnTqlnb5On9IWTdPLMoG6LBvQ=
X-Received: by 2002:a0d:d046:0:b0:586:c27c:3eee with SMTP id
 s67-20020a0dd046000000b00586c27c3eeemr10831532ywd.38.1695723734453; Tue, 26
 Sep 2023 03:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Sep 2023 13:21:08 +0300
Message-ID: <CAA8EJppsY059KXaw6fh2Rdyuh210ibMa_MwsPz-mxivK3QE=Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fail dpu_plane_atomic_check() based
 on mdp clk limits
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, nespera@igalia.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Sept 2023 at 01:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently, dpu_plane_atomic_check() does not check whether the
> plane can process the image without exceeding the per chipset
> limits for MDP clock. This leads to underflow issues because the
> SSPP is not able to complete the processing for the data rate of
> the display.
>
> Fail the dpu_plane_atomic_check() if the SSPP cannot process the
> image without exceeding the MDP clock limits.
>
> changes in v2:
>         - use crtc_state's adjusted_mode instead of mode
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 98c1b22e9bca..0be195f9149c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -733,9 +733,11 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 struct dpu_sw_pipe *pipe,
>                 struct dpu_sw_pipe_cfg *pipe_cfg,
> -               const struct dpu_format *fmt)
> +               const struct dpu_format *fmt,
> +               const struct drm_display_mode *mode)
>  {
>         uint32_t min_src_size;
> +       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>
>         min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>
> @@ -774,6 +776,12 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 return -EINVAL;
>         }
>
> +       /* max clk check */
> +       if (_dpu_plane_calc_clk(mode, pipe_cfg) > kms->perf.max_core_clk_rate) {
> +               DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk limits\n");
> +               return -E2BIG;
> +       }
> +
>         return 0;
>  }
>
> @@ -899,12 +907,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>         }
>
> -       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> +       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
>         if (ret)
>                 return ret;
>
>         if (r_pipe->sspp) {
> -               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
> +               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> +                                                 &crtc_state->adjusted_mode);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
