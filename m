Return-Path: <linux-arm-msm+bounces-3929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CA80A202
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B14E1F2140F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CB61A71B;
	Fri,  8 Dec 2023 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ec4tCp6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3A5E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:20:10 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d3c7ef7b31so18896377b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702034410; x=1702639210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjkH0OgEXUrXFF57deKZ2Z1C3PCEiKPWjgS+DscQXoo=;
        b=Ec4tCp6i2C/paIpbWwfzIZkshQlG+CMvb5qMdT5mT1YQl7qxGG+Iig+Sr5kQ1k2INZ
         hWygx2urZF/gLU28DHba0Q0WX/jpSBx7H+F2+MBtiLkRVCRolbgwjYQuVC93k1Rbx2uU
         xwsLYjPuojsNpiZ1qi+pO2+YRWB3q4UrDlLJoB7axwyL625Id0wdYLu+1ZtXLGfegT+o
         +EyoXdFNOEa6cbSIhnfQ60yruFvP4rKcN2sewbSHaiVLJDoj/C1i22cyqFZ6I/+atIi4
         SXvuKeg9VzyIY72sgtUdzU50wFkZC/c2EYY1xBeN+vxYLrnSvGJDT3CZtbghtolyVtrQ
         w+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034410; x=1702639210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjkH0OgEXUrXFF57deKZ2Z1C3PCEiKPWjgS+DscQXoo=;
        b=Mh1QCgPmc2GZH6/f77tFllTXfp0FfUS0D5pC+RwJ0Lba87d+gKS9qtDeDrC3HTJxS+
         7fulviEk8dCw4mCb43bUKnt/P41Fx4nWOhU8x3FV4wzeSU9x1IHBA6fxntxK8f1KUgAO
         GCnSbSDYN3gf+1nTpuhGQp4FAHuI10DET3I2I0S9jCEwRKyjXOZKqS0Y7xQaH4jRZlkQ
         9mHmu7SXoEbT3X6/9R8Aud1vL7eyQwHXTTuqxrSTl70y61W+HH5Iv5DeKBA3JqU9vEZ9
         sPGEiODeXgkU4GYWWp8HBRzudg8/tnq0AF8aKUy2HB2GogSIE71em07Rq+ghHTwevarD
         PjNg==
X-Gm-Message-State: AOJu0YxcbFny8A0JnYf4hmchPJfjwSrV3gRpJZutXibEZiRQ69VLfRyD
	0O6pghARpINEsscaDIGr60ymBY3nExNcFyAww1UixQ==
X-Google-Smtp-Source: AGHT+IENzXnL65rUKcfXc1UjBloxQGOKo/9sIvlcivy8/yrcy30Yfl5penQ9BvNYc36tu7FXKcpXwLrUyO/1eJhTnzw=
X-Received: by 2002:a81:f205:0:b0:5d7:4d53:192c with SMTP id
 i5-20020a81f205000000b005d74d53192cmr3948363ywm.26.1702034409712; Fri, 08 Dec
 2023 03:20:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-6-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-6-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:19:58 +0200
Message-ID: <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - remove explicit zero assignment for features
>         - move sc7280_cdm to dpu_hw_catalog from the sc7280
>           catalog file as its definition can be re-used
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>  4 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 209675de6742..19c2b7454796 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>         .mdss_ver = &sc7280_mdss_ver,
>         .caps = &sc7280_dpu_caps,
>         .mdp = &sc7280_mdp,
> +       .cdm = &sc7280_cdm,
>         .ctl_count = ARRAY_SIZE(sc7280_ctl),
>         .ctl = sc7280_ctl,
>         .sspp_count = ARRAY_SIZE(sc7280_sspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d52aae54bbd5..1be3156cde05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>         .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>  };
>
> +/*************************************************************
> + * CDM sub block config

Nit: it is not a subblock config.

> + *************************************************************/
> +static const struct dpu_cdm_cfg sc7280_cdm = {

I know that I have r-b'ed this patch. But then one thing occurred to
me. If this definition is common to all (or almost all) platforms, can
we just call it dpu_cdm or dpu_common_cdm?

> +       .name = "cdm_0",
> +       .id = CDM_0,
> +       .len = 0x228,
> +       .base = 0x79200,
> +};
> +
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e3c0d007481b..ba82ef4560a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
>         u32 memtype[MAX_XIN_COUNT];
>  };
>
> +/**
> + * struct dpu_cdm_cfg - information of chroma down blocks
> + * @name               string name for debug purposes
> + * @id                 enum identifying this block
> + * @base               register offset of this block
> + * @features           bit mask identifying sub-blocks/features
> + */
> +struct dpu_cdm_cfg {
> +       DPU_HW_BLK_INFO;
> +};
> +
>  /**
>   * Define CDP use cases
>   * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
>         u32 wb_count;
>         const struct dpu_wb_cfg *wb;
>
> +       const struct dpu_cdm_cfg *cdm;
> +
>         u32 ad_count;
>
>         u32 dspp_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index a6702b2bfc68..f319c8232ea5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -185,6 +185,11 @@ enum dpu_dsc {
>         DSC_MAX
>  };
>
> +enum dpu_cdm {
> +       CDM_0 = 1,
> +       CDM_MAX
> +};
> +
>  enum dpu_pingpong {
>         PINGPONG_NONE,
>         PINGPONG_0,
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

