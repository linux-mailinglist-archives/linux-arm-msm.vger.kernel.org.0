Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE26732266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjFOWF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbjFOWF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:05:56 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91952D4D
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:05:35 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1CE6820559;
        Fri, 16 Jun 2023 00:05:33 +0200 (CEST)
Date:   Fri, 16 Jun 2023 00:05:31 +0200
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
Subject: Re: [PATCH v2 16/21] drm/msm/dpu: inline DSC_BLK macros
Message-ID: <73pqnayg6fuqjbrmc7yw3n5sdbthedumgluvjonc5vzl2mhf75@ab3poosthmcd>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-18-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-18-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-13 03:09:56, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 11 +++++--
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++---
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 ++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 ++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 +++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 10 ------
>  8 files changed, 91 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index a07c68744b29..7c3da4033c46 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -200,8 +200,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg msm8998_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = 0,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = 0,
> +	},
>  };
>  
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 786263ed1ef2..ca3bb6a1a93a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sdm845_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 6b9bfeac6e0a..5b068521de13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm8150_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 414f0db3306c..ba5420f334ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sc8180x_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_4", .id = DSC_4,
> +		.base = 0x81000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_5", .id = DSC_5,
> +		.base = 0x81400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index db3a65b011ca..01b61467a700 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm8250_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8250_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index bf1c0024a55a..20262eb56b48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm6350_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm6350_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index bf50ae6c525d..b9984ae6e7ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm6375_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm6375_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index eb046079bb37..f563e513cbd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -482,16 +482,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.sblk = NULL \
>  	}
>  
> -/*************************************************************
> - * DSC sub blocks config
> - *************************************************************/
> -#define DSC_BLK(_name, _id, _base, _features) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x140, \
> -	.features = _features, \
> -	}
> -

This doesn't apply.

What happened here?  This is patch 16/21, however the patch before it is
16/22 and that already deleted DSC_BLK and DSC_BLK_1_2... Did an old and
new format-patch -v2 series end up in the same local folder by accident?

- Marijn

>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
