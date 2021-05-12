Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1491037EFE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 01:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhELXgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 19:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244063AbhELXDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 19:03:39 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0D1C061364
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 15:58:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id 76so23925332qkn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crILB0hhv0hNKVlUwBvFM1O6CswwRksJjO7o4jYP+zo=;
        b=BcZRxJofWQi+RfMmRGzhgQ7hP1SgD/QxQUNR7e3Ggn65rHbFIvWp/03Fy0xtQIYc1i
         5Ag0XcZPlNaM0QIAd+xc/x7dRdzsZYATigQsa2mSF/Nh6PLbVm0YetI5bBDWu+HjSpZ7
         Mih4KsNjXcWN6uV6BQXf5/BE6fmHeEyk9THadZdazaBjk4pIVTSVNarZigYImtRkdA9c
         JyaTM0t9U/1Mk+YzSyYak+mOlhjESrhuTz0GXzJoCXbXMZ3C3nOee12k7EUTfwkjwSbU
         pfze8LTdZ+5XyjyGlcMkYu3oLeCwbNNnKYDla7v+fhrJ3REZp4+NNi+06gxqDsfnAVfV
         /anA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crILB0hhv0hNKVlUwBvFM1O6CswwRksJjO7o4jYP+zo=;
        b=sHh7/u7n7SEuXlI+tmBkjVskswL2t+akKrk/OepLkNVI1SYuNsCnqRFivAKcne8GWP
         EmEEyUn8bzKOP9DDxR/tF45KKWc8h+xX4s4gnji92mlvmABMZKIsCaeuCWHdatiplCYh
         EeBnoA/iXBLIulImltY1+m3mkekUL8BhO9FC8tdATjJeht4V9Xj166Vl3wNmUJFYiYPo
         B34VUyJ0VRExf5i8mxCMOPC/8kNw2c34JDXmHJbV+ACbRKSaoIuiuR8ZQIPiX8xW995i
         aT7fnzSDATI9G7YtlxvexpEDGWSUCg0sQQ5BOs8a4DQedjVzaw7hUQNQOuCH/07c0FSl
         EVUA==
X-Gm-Message-State: AOAM530Z/pAvZUBVQKtdJ5S/H8Zl9z3PCsJh83mUi4/ey4+oKSNBTR42
        ZRsVzzvS3elXaIrJeJ9qzZwk/sweT5CZf1QcpUhkhA==
X-Google-Smtp-Source: ABdhPJwAsFBVPBiWabbyJu2VvQSqB990ZrHEb1w5kgVBSjV5eIVjrSTZdeUTLSgIHX20wU/9i9pGW7L1BIglWuZeE6M=
X-Received: by 2002:a37:b83:: with SMTP id 125mr36315717qkl.162.1620860332416;
 Wed, 12 May 2021 15:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210511041852.592295-1-bjorn.andersson@linaro.org> <20210511041852.592295-4-bjorn.andersson@linaro.org>
In-Reply-To: <20210511041852.592295-4-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 May 2021 01:58:41 +0300
Message-ID: <CAA8EJpoBrBP0HT0x24kbcgBnt6e1B7zhxo5vQf9ck9Du5XB5ig@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: Add SC8180x to hw catalog
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 07:19, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add SC8180x to the hardware catalog, for initial support for the
> platform. Due to limitations in the DP driver only one of the four DP
> interfaces is left enabled.
>
> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
> the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
> is flagged appropriately to ensure widebus is disabled - for now.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu.txt   |   4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 121 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>  5 files changed, 128 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 586e6eac5b08..b98258374a60 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>
>  MDSS:
>  Required properties:
> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sc8180x-mdss"
>  - reg: physical base address and length of controller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
> @@ -41,7 +41,7 @@ Optional properties:
>
>  MDP:
>  Required properties:
> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sc8180x-dpu"
>  - reg: physical base address and length of controller's registers.
>  - reg-names : register region names. The following region is required:
>    * "mdp"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b569030a0847..81c429ce94a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -56,6 +56,10 @@
>
>  #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>
> +#define INTF_SC8180X_MASK BIT(DPU_INTF_INPUT_CTRL) | \
> +                         BIT(DPU_INTF_TE) | \
> +                         BIT(DPU_INTF_WIDEBUS)
> +
>  #define INTR_SC7180_MASK \
>         (BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
>         BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
> @@ -197,6 +201,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
>         .max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>
> +static const struct dpu_caps sc8180_dpu_caps = {
> +       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +       .max_mixer_blendstages = 0xb,
> +       .qseed_type = DPU_SSPP_SCALER_QSEED3,

Is it qseed3 or qseed3lite?

> +       .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +       .ubwc_version = DPU_HW_UBWC_VER_30,
> +       .has_src_split = true,
> +       .has_dim_layer = true,
> +       .has_idle_pc = true,
> +       .has_3d_merge = false,   /* I think? */

Hmm. Are you sure? Judging from two DSI interfaces you might have merge3d.

> +       .max_linewidth = 4096,
> +       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> +       .max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
>  static const struct dpu_caps sm8250_dpu_caps = {
>         .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>         .max_mixer_blendstages = 0xb,
> @@ -265,6 +285,35 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>         },
>  };
>
> +static const struct dpu_mdp_cfg sc8180_mdp[] = {
> +       {
> +       .name = "top_0", .id = MDP_TOP,
> +       // TODO check len
> +       .base = 0x0, .len = 0x45C,
> +       .features = 0,
> +       .highest_bank_bit = 0x3,
> +       .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +                       .reg_off = 0x2AC, .bit_off = 0},
> +       .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +                       .reg_off = 0x2B4, .bit_off = 0},
> +       .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +                       .reg_off = 0x2BC, .bit_off = 0},
> +       .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +                       .reg_off = 0x2C4, .bit_off = 0},
> +       .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +                       .reg_off = 0x2AC, .bit_off = 8},
> +       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +                       .reg_off = 0x2B4, .bit_off = 8},
> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +                       .reg_off = 0x2BC, .bit_off = 8},
> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +                       .reg_off = 0x2C4, .bit_off = 8},
> +// TODO ???
> +//     .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +//                     .reg_off = 0x2BC, .bit_off = 20},
> +       },
> +};
> +
>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>         {
>         .name = "top_0", .id = MDP_TOP,
> @@ -789,6 +838,15 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>         INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK),
>  };
>
> +static const struct dpu_intf_cfg sc8180x_intf[] = {
> +//     INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK),
> +       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK),
> +       INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK),
> +//     INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC8180X_MASK),
> +//     INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 2, 24, INTF_SC8180X_MASK),
> +       INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 0, 24, INTF_SC8180X_MASK),

Hmm. I think this should be INTF_EDP (or the _ctrl_id should be 1).

> +};
> +
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> @@ -859,6 +917,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>         {.fl = 0, .lut = 0x0011222222223357 },
>  };
>
> +static const struct dpu_qos_lut_entry sc8180_qos_linear[] = {
> +       {.fl = 4, .lut = 0x0000000000000357 },
> +};
> +
>  static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
>         {.fl = 10, .lut = 0x344556677},
>         {.fl = 11, .lut = 0x3344556677},
> @@ -872,6 +934,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>         {.fl = 0, .lut = 0x0011223344556677},
>  };
>
> +static const struct dpu_qos_lut_entry sc8180_qos_macrotile[] = {
> +       {.fl = 10, .lut = 0x0000000344556677},
> +};
> +
>  static const struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
>         {.fl = 0, .lut = 0x0},
>  };
> @@ -976,6 +1042,31 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>         .bw_inefficiency_factor = 120,
>  };
>
> +static const struct dpu_perf_cfg sc8180_perf_data = {
> +       .max_bw_low = 9600000,
> +       .max_bw_high = 9600000,
> +       .min_core_ib = 2400000,
> +       .min_llcc_ib = 800000,
> +       .min_dram_ib = 800000,
> +       .danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
> +       .qos_lut_tbl = {
> +               {.nentry = ARRAY_SIZE(sc8180_qos_linear),
> +               .entries = sc8180_qos_linear
> +               },
> +               {.nentry = ARRAY_SIZE(sc8180_qos_macrotile),
> +               .entries = sc8180_qos_macrotile
> +               },
> +               {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +               .entries = sc7180_qos_nrt
> +               },
> +               /* TODO: macrotile-qseed is different from macrotile */
> +       },
> +       .cdp_cfg = {
> +               {.rd_enable = 1, .wr_enable = 1},
> +               {.rd_enable = 1, .wr_enable = 0}
> +       },

Could you please add .clk_inefficiency_factor / .bw_inefficiency_factor

> +};
> +
>  static const struct dpu_perf_cfg sm8250_perf_data = {
>         .max_bw_low = 13700000,
>         .max_bw_high = 16600000,
> @@ -1129,6 +1220,35 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>         };
>  }
>
> +/*
> + * sc8180_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void sc8180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +       *dpu_cfg = (struct dpu_mdss_cfg){
> +               .caps = &sc8180_dpu_caps,
> +               .mdp_count = ARRAY_SIZE(sc8180_mdp),
> +               .mdp = sc8180_mdp,
> +               .ctl_count = ARRAY_SIZE(sm8150_ctl),
> +               .ctl = sm8150_ctl,
> +               .sspp_count = ARRAY_SIZE(sdm845_sspp),
> +               .sspp = sdm845_sspp,
> +               .mixer_count = ARRAY_SIZE(sm8150_lm),
> +               .mixer = sm8150_lm,
> +               .pingpong_count = ARRAY_SIZE(sm8150_pp),
> +               .pingpong = sm8150_pp,
> +               .intf_count = ARRAY_SIZE(sc8180x_intf),
> +               .intf = sc8180x_intf,
> +               .vbif_count = ARRAY_SIZE(sdm845_vbif),
> +               .vbif = sdm845_vbif,
> +               .reg_dma_count = 1,
> +               .dma_cfg = sm8150_regdma,
> +               .perf = sc8180_perf_data,
> +               .mdss_irqs = 0x3ff,
> +       };
> +}
> +
>  /*
>   * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
>   * and instance counts.
> @@ -1191,6 +1311,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>         { .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
>         { .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
>         { .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
> +       { .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180_cfg_init},
>         { .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
>         { .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
>         { .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c2f34a4f82d9..644e315df0fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -39,6 +39,7 @@
>  #define DPU_HW_VER_410 DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
>  #define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>  #define DPU_HW_VER_501 DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
>  #define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
>  #define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>  #define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
> @@ -287,6 +288,8 @@ enum dpu_qos_lut_usage {
>         DPU_QOS_LUT_USAGE_LINEAR,
>         DPU_QOS_LUT_USAGE_MACROTILE,
>         DPU_QOS_LUT_USAGE_NRT,
> +       DPU_QOS_LUT_USAGE_CWB,
> +       DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>         DPU_QOS_LUT_USAGE_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 8b01cb660381..7e8f0df2bd88 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1228,6 +1228,7 @@ static const struct of_device_id dpu_dt_match[] = {
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
>         { .compatible = "qcom,sc7280-dpu", },
> +       { .compatible = "qcom,sc8180x-dpu", },
>         { .compatible = "qcom,sm8150-dpu", },
>         { .compatible = "qcom,sm8250-dpu", },
>         {}
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2454e2..b5bcbf5c2306 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1342,6 +1342,7 @@ static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>         {}
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
