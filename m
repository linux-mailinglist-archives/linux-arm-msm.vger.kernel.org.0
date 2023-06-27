Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C2A73F76C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjF0Iff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 04:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjF0Iex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 04:34:53 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236A426A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 01:34:49 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DD8F920079;
        Tue, 27 Jun 2023 10:34:47 +0200 (CEST)
Date:   Tue, 27 Jun 2023 10:34:46 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
Message-ID: <hme5byfn2ym2wm5qd2qfuz7fenqccto2deod4nk2bmzi43zulp@vddfyix3xuro>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-20 00:25:14, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Validated that this incurs no changes by checksumming a stripped
dpu_hw_catalog.o.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 21 +++++++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 21 +++++++++++++++----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ----------
>  8 files changed, 99 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 9b2de5986e82..0e09e759dc99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x83000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x83100, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x83200, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sm8150_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 683602e54c0e..4d2b0409a244 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -238,9 +238,19 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x83000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x83100, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x83200, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sc8180x_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index a98d63f6c47c..50f857565dbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x83000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x83100, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x83200, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sm8250_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 8a9bfc4af72a..0added438239 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -237,9 +237,19 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index b676819db42c..0b4915dabe7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -235,9 +235,19 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 568523abc1d0..45cda9162685 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -247,10 +247,23 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> -	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_3", .id = MERGE_3D_3,
> +		.base = 0x65f00, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 419624948e83..66dd414253f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -261,10 +261,23 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> -	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	}, {
> +		.name = "merge_3d_3", .id = MERGE_3D_3,
> +		.base = 0x66700, .len = 0x8,
> +		.features = MERGE_3D_SM8150_MASK,
> +	},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ee24402bf253..72634a8109e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -471,17 +471,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.intr_rdptr = _rdptr, \
>  	}
>  
> -/*************************************************************
> - * MERGE_3D sub blocks config
> - *************************************************************/
> -#define MERGE_3D_BLK(_name, _id, _base) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x8, \
> -	.features = MERGE_3D_SM8150_MASK, \
> -	.sblk = NULL \
> -	}
> -
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
