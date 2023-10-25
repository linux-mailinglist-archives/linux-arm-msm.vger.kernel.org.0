Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4B47D6486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbjJYIGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbjJYIG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:06:27 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB811AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:06:24 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a7e5dc8573so52797897b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698221184; x=1698825984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9N86T/fG3CiL6tT7DD8PpjcJ48kzS/vl5vzR+4WaF7s=;
        b=euVgzlqej9zF40s+9aOrsaeALFO6JgjShqLrbccIEY+r2UmxDAx5yyL/IKjaTDzX0L
         hKDqCy8s0oOeoVsMG+tlgEhDNV7nlJVLknopfVIY+lQgfTJ5q+6aO0R5FHTsoN8lihBb
         rwHnHGAuRFr5NN/DFtI+DWl5MwyH3zdsd72xbt5QAtLOWcYxKOIvj6RYNt+6SRViKg1D
         ZI5ZkM7hPpBe8y/5QbiYxbXQSWOQRq7jyUciPX3SvNYnHTAZiRZmKuyyspaH6rFASWgY
         6CX8iu+NYTKCWrDNrYQtvk+Y5Z8Kg5nYR5toZXkMr73nMgrC1uTPmoLBCrzbH981a041
         NiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698221184; x=1698825984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N86T/fG3CiL6tT7DD8PpjcJ48kzS/vl5vzR+4WaF7s=;
        b=uSdCoKG2GtBQSMM6uv1ZuT2WOIqNgGwGHWnZIt0AKWyE9PTGucFMUulVR32Tre4xgQ
         bfmXhcOPRBKM2nDjrxEbKrkqPhKyZXezt606IFG4Kw4sEpg1QS/bgASxQnXuUGyB/Hst
         dy4RCNG6cIt0lgBIb3cnhU2UWLcElJodnOAOU6cr7iAIS3t3j4x2MEabEcMLq0sc16+S
         1YFJhmgSA2UBi1E5sXHQtse7YWttljL7iIISpvjsSK0qRp7dMH5ZK0BDqGPQARnw/jbm
         7KWiMfBZUU4jHVr4c3KpLc76JQx/DH3a6aTOugVOfqiowqgFvCDh5JhR4F+HCqCRJjCt
         vgrg==
X-Gm-Message-State: AOJu0YwVJ+Za4+ICkIhXHo0qFn3Uic9ljho1u0pNW4OY24ijIf3K96Ww
        J6boNy/8LMllDPY7RTwf+0oVwDAdyC1hnrDoOMpYrw==
X-Google-Smtp-Source: AGHT+IFOv7ktMHogTahZY8772P50C84Y6Y6IVMSF12aYBnzD0gZtk/sfInd6pg/uGamC/Q/rKxezX3XuQVgFyeYbTQ4=
X-Received: by 2002:a0d:cb10:0:b0:5a7:c4a7:21c3 with SMTP id
 n16-20020a0dcb10000000b005a7c4a721c3mr16860297ywd.38.1698221184039; Wed, 25
 Oct 2023 01:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org> <20231025-topic-sm8650-upstream-mdss-v1-8-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-8-bb219b8c7a51@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 11:06:13 +0300
Message-ID: <CAA8EJpowPrNyXfyXC5wHz4OugzNFfp0E7qPo=5WS4k18U1LSqA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/msm: dsi: add support for DSI 2.8.0
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DSI Controller version 2.8.0 support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 1f98ff74ceb0..10ba7d153d1c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -190,6 +190,21 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>         },
>  };
>
> +static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
> +       { .supply = "vdda", .init_load_uA = 16600 },    /* 1.2 V */

Same comment regarding uA and sm8550 cfg.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +};
> +
> +static const struct msm_dsi_config sm8650_dsi_cfg = {
> +       .io_offset = DSI_6G_REG_SHIFT,
> +       .regulator_data = sm8650_dsi_regulators,
> +       .num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> +       .bus_clk_names = dsi_v2_4_clk_names,
> +       .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +       .io_start = {
> +               { 0xae94000, 0xae96000 },
> +       },
> +};
> +
>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>         { .supply = "vdda", .init_load_uA = 8350 },     /* 1.2 V */
>         { .supply = "refgen" },
> @@ -281,6 +296,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>                 &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>         {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
>                 &sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
> +               &sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  };
>
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 43f0dd74edb6..4c9b4b37681b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -28,6 +28,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0    0x20050000
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0    0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0    0x20070000
> +#define MSM_DSI_6G_VER_MINOR_V2_8_0    0x20080000
>
>  #define MSM_DSI_V2_VER_MINOR_8064      0x0
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
