Return-Path: <linux-arm-msm+bounces-3684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E1808772
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D7F1C21D72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB40639AF5;
	Thu,  7 Dec 2023 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTGRLcy3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDDBC9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:15:25 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5dd3affae03so6543797b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951324; x=1702556124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd4LCG8G1EhGHUqbdXTSlaSYTue2O4P5J0HEKGW07dg=;
        b=KTGRLcy3RxSLYA1PQ0ArzRNj9KB2jYC6MPt2LlNuvIQeZK5as2LZsP+scCIv7yoeZn
         9qqNCkUgf4SoaY/rpChyxtbFXaRxArUTyazoBJWkG7TsF44YjW0XZLeB9W4d0K7BeioL
         oRC0y6idSV7vBrnJ6yKdsmvJIsOAhlKLfSKR1EZjE7n2GgSJDKBKk9f5wRQZYsK4EO/Y
         vurSoq8pP6kyuVtWnFrmVE4kandmnsnK7OSyyOvJfvwSoH+Cnw9ySIQYv0yN/BedIZYo
         JH+Xy2S6hI7RuR4VUtUK2FF/Q7vaDb2U7l/Vr8U5XdSlY/p4d9C/li6bnmUa3o8swBlJ
         06Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951324; x=1702556124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fd4LCG8G1EhGHUqbdXTSlaSYTue2O4P5J0HEKGW07dg=;
        b=Qbn3Tgg9FiOO7moqV45vFogpuxLVRIQtpwLVAngl7DtXB+8NgddT7TfUZMeozmBblH
         pmOVdtlQ1jpr2Qts07/ShufEzsbo/0nzXyRSM0Z+Tw2IpzCyeeeAn8VJwrZAL1jd4PGA
         rjZo1pJWknb9Sb+DDW8h9ZJnSB/znX3+sOtyABFqQpeBL3U59GoOZEPoVLYuISO97kDD
         K0sK5dBQp4C/lqPb87ShFK/o89mgaVlD6uW3UyKCMw+yAeFGfod2+Ax5cpgOCNPUYyxH
         T3leZbzxQJZ+4/gl9ulTWPVrcKJoQEymeBv7nHJNyyuUoJXwbvecHyJLYcGBSkHkZfu9
         Wj9A==
X-Gm-Message-State: AOJu0YxynhahFNq8X8XyKTVwWORAU4eeIwtmAANoitl8ILGzbTTo9Com
	eH3cp4WIM26C24Qzb0LjtXm0ol0nLfx39/08jksxvA==
X-Google-Smtp-Source: AGHT+IF1EtX1IrpEgTYCo1uyfnPaP8DcJ1TLBRfdKDWcuhbnv6ec5p9oSwzvhOSMA+SYaPr/FGCsXWfAM9ThqtumU8o=
X-Received: by 2002:a05:690c:4482:b0:5d7:1940:b37e with SMTP id
 gr2-20020a05690c448200b005d71940b37emr2425689ywb.74.1701951324029; Thu, 07
 Dec 2023 04:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org> <20231122-phy-qualcomm-edp-x1e80100-v3-3-576fc4e9559d@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v3-3-576fc4e9559d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 14:15:12 +0200
Message-ID: <CAA8EJpqnDPsDv6rhUScxJ5Lhk9d+vHbB09ZxfhGEcLQei_Y6EQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] phy: qcom: edp: Add support for X1E80100 PHY
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 12:53, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The Qualcomm X1E80100 platform has a number of eDP/DP PHY instances. These
> are based on QMP v6. So add support for v6 QMP COM registers by supporting
> configuration-based register offsets. For legacy platforms, keep the eDP and DP
> compatibles different, but for new platforms, use the phy-type DT property
> instead. So add platform specific configs, specify the version and override
> the PHY type where compatible dictates it.

The phy-type should come as a separate patch. Note, that you also did
not provide the bindings update for this property, which is a must.

Last, but not least. I think that type should come from the host via
the phy_set_mode() call.

>
> Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 583 ++++++++++++++++++++++++++++++------
>  1 file changed, 490 insertions(+), 93 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 8e5078304646..6fc18bf80db1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -68,10 +68,333 @@
>
>  #define TXn_TRAN_DRVR_EMP_EN                    0x0078
>
> -struct qcom_edp_cfg {
> -       bool is_dp;
> +enum dp_qmp_com_version {
> +       DP_QMP_VERSION_V4,
> +       DP_QMP_VERSION_V6,
> +};
> +
> +enum dp_link_rate {
> +       DP_LINK_RATE_1_6_GHZ,
> +       DP_LINK_RATE_2_7_GHZ,
> +       DP_LINK_RATE_5_4_GHZ,
> +       DP_LINK_RATE_8_1_GHZ,
> +};
> +
> +struct qmp_com_regs_layout {
> +       unsigned int cmn_status;
> +       unsigned int ssc_en_center;
> +       unsigned int resetsm_cntrl;
> +       unsigned int c_ready_status;
> +       unsigned int ssc_per1;
> +       unsigned int ssc_per2;
> +       unsigned int ssc_step_size1_mode0;
> +       unsigned int ssc_step_size2_mode0;
> +       unsigned int ssc_adj_per1;
> +       unsigned int svs_mode_clk_sel;
> +       unsigned int sysclk_en_sel;
> +       unsigned int sys_clk_ctrl;
> +       unsigned int clk_enable1;
> +       unsigned int clk_select;
> +       unsigned int sysclk_buf_enable;
> +       unsigned int hsclk_sel;
> +       unsigned int pll_ivco;
> +       unsigned int lock_cmp_en;
> +       unsigned int pll_cctrl_mode0;
> +       unsigned int pll_rctrl_mode0;
> +       unsigned int cp_ctrl_mode0;
> +       unsigned int dec_start_mode0;
> +       unsigned int div_frac_start1_mode0;
> +       unsigned int div_frac_start2_mode0;
> +       unsigned int div_frac_start3_mode0;
> +       unsigned int cmn_config;
> +       unsigned int integloop_gain0_mode0;
> +       unsigned int integloop_gain1_mode0;
> +       unsigned int vco_tune_map;
> +       unsigned int lock_cmp1_mode0;
> +       unsigned int lock_cmp2_mode0;
> +       unsigned int bg_timer;
> +       unsigned int pll_core_clk_div_mode0;
> +       unsigned int vco_tune_ctrl;
> +       unsigned int pll_bias_en_clk_buflr_en;
> +       unsigned int core_clk_en;
> +       unsigned int vco_tune1_mode0;
> +       unsigned int vco_tune2_mode0;
> +       unsigned int bin_vcocal_cmp_code1_mode0;
> +       unsigned int bin_vcocal_cmp_code2_mode0;

Unfortunately this is too specific. You depend too much on qserdes
programming details. History has shown that minor details change
between revisions. Compare e.g. qmp_v3_dp_serdes_tbl_rbr vs
qmp_v4_dp_serdes_tbl_rbr vs qmp_v6_dp_serdes_tbl_rbr. I suspect that
we should go either towards per-generation register-value tables (like
we have in the existing combo PHY) or towards per-generation functions
(like I had for
https://patchwork.freedesktop.org/patch/559997/?series=118210&rev=3).
My vote will be towards the former solution. We should really
deduplicate information between phy-qcom-edp.c and
phy-qcom-qmp-combo.c. I haven't looked into that direction for now, I
wanted to get the combo PHYs for msm8998 / qcm2290 out first.


> +};
> +
> +static const struct qmp_com_regs_layout qmp_v4_com_regs = {
> +       .cmn_status                     = QSERDES_V4_COM_CMN_STATUS,
> +       .c_ready_status                 = QSERDES_V4_COM_C_READY_STATUS,
> +       .resetsm_cntrl                  = QSERDES_V4_COM_RESETSM_CNTRL,
> +       .ssc_en_center                  = QSERDES_V4_COM_SSC_EN_CENTER,
> +       .ssc_per1                       = QSERDES_V4_COM_SSC_PER1,
> +       .ssc_per2                       = QSERDES_V4_COM_SSC_PER2,
> +       .ssc_step_size1_mode0           = QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0,
> +       .ssc_step_size2_mode0           = QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0,
> +       .ssc_adj_per1                   = QSERDES_V4_COM_SSC_ADJ_PER1,
> +       .svs_mode_clk_sel               = QSERDES_V4_COM_SVS_MODE_CLK_SEL,
> +       .sysclk_en_sel                  = QSERDES_V4_COM_SYSCLK_EN_SEL,
> +       .sys_clk_ctrl                   = QSERDES_V4_COM_SYS_CLK_CTRL,
> +       .sysclk_buf_enable              = QSERDES_V4_COM_SYSCLK_BUF_ENABLE,
> +       .clk_enable1                    = QSERDES_V4_COM_CLK_ENABLE1,
> +       .clk_select                     = QSERDES_V4_COM_CLK_SELECT,
> +       .hsclk_sel                      = QSERDES_V4_COM_HSCLK_SEL,
> +       .pll_ivco                       = QSERDES_V4_COM_PLL_IVCO,
> +       .lock_cmp_en                    = QSERDES_V4_COM_LOCK_CMP_EN,
> +       .pll_cctrl_mode0                = QSERDES_V4_COM_PLL_CCTRL_MODE0,
> +       .pll_rctrl_mode0                = QSERDES_V4_COM_PLL_RCTRL_MODE0,
> +       .cp_ctrl_mode0                  = QSERDES_V4_COM_CP_CTRL_MODE0,
> +       .dec_start_mode0                = QSERDES_V4_COM_DEC_START_MODE0,
> +       .div_frac_start1_mode0          = QSERDES_V4_COM_DIV_FRAC_START1_MODE0,
> +       .div_frac_start2_mode0          = QSERDES_V4_COM_DIV_FRAC_START2_MODE0,
> +       .div_frac_start3_mode0          = QSERDES_V4_COM_DIV_FRAC_START3_MODE0,
> +       .cmn_config                     = QSERDES_V4_COM_CMN_CONFIG,
> +       .integloop_gain0_mode0          = QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0,
> +       .integloop_gain1_mode0          = QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0,
> +       .vco_tune_map                   = QSERDES_V4_COM_VCO_TUNE_MAP,
> +       .lock_cmp1_mode0                = QSERDES_V4_COM_LOCK_CMP1_MODE0,
> +       .lock_cmp2_mode0                = QSERDES_V4_COM_LOCK_CMP2_MODE0,
> +       .bg_timer                       = QSERDES_V4_COM_BG_TIMER,
> +       .pll_core_clk_div_mode0         = QSERDES_V4_COM_CORECLK_DIV_MODE0,
> +       .vco_tune_ctrl                  = QSERDES_V4_COM_VCO_TUNE_CTRL,
> +       .pll_bias_en_clk_buflr_en       = QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN,
> +       .core_clk_en                    = QSERDES_V4_COM_CORE_CLK_EN,
> +       .vco_tune1_mode0                = QSERDES_V4_COM_VCO_TUNE1_MODE0,
> +       .vco_tune2_mode0                = QSERDES_V4_COM_VCO_TUNE2_MODE0,
> +};
> +
> +static const struct qmp_com_regs_layout qmp_v6_com_regs = {
> +       .cmn_status                     = QSERDES_V6_COM_CMN_STATUS,
> +       .c_ready_status                 = QSERDES_V6_COM_C_READY_STATUS,
> +       .resetsm_cntrl                  = QSERDES_V6_COM_RESETSM_CNTRL,
> +       .ssc_en_center                  = QSERDES_V6_COM_SSC_EN_CENTER,
> +       .ssc_per1                       = QSERDES_V6_COM_SSC_PER1,
> +       .ssc_per2                       = QSERDES_V6_COM_SSC_PER2,
> +       .ssc_step_size1_mode0           = QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0,
> +       .ssc_step_size2_mode0           = QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0,
> +       .ssc_adj_per1                   = QSERDES_V6_COM_SSC_ADJ_PER1,
> +       .svs_mode_clk_sel               = QSERDES_V6_COM_SVS_MODE_CLK_SEL,
> +       .sysclk_en_sel                  = QSERDES_V6_COM_SYSCLK_EN_SEL,
> +       .sys_clk_ctrl                   = QSERDES_V6_COM_SYS_CLK_CTRL,
> +       .sysclk_buf_enable              = QSERDES_V6_COM_SYSCLK_BUF_ENABLE,
> +       .clk_enable1                    = QSERDES_V6_COM_CLK_ENABLE1,
> +       .clk_select                     = QSERDES_V6_COM_CLK_SELECT,
> +       .hsclk_sel                      = QSERDES_V6_COM_HSCLK_SEL_1,
> +       .pll_ivco                       = QSERDES_V6_COM_PLL_IVCO,
> +       .lock_cmp_en                    = QSERDES_V6_COM_LOCK_CMP_EN,
> +       .pll_cctrl_mode0                = QSERDES_V6_COM_PLL_CCTRL_MODE0,
> +       .pll_rctrl_mode0                = QSERDES_V6_COM_PLL_RCTRL_MODE0,
> +       .cp_ctrl_mode0                  = QSERDES_V6_COM_CP_CTRL_MODE0,
> +       .dec_start_mode0                = QSERDES_V6_COM_DEC_START_MODE0,
> +       .div_frac_start1_mode0          = QSERDES_V6_COM_DIV_FRAC_START1_MODE0,
> +       .div_frac_start2_mode0          = QSERDES_V6_COM_DIV_FRAC_START2_MODE0,
> +       .div_frac_start3_mode0          = QSERDES_V6_COM_DIV_FRAC_START3_MODE0,
> +       .cmn_config                     = QSERDES_V6_COM_CMN_CONFIG_1,
> +       .integloop_gain0_mode0          = QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0,
> +       .integloop_gain1_mode0          = QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE0,
> +       .vco_tune_map                   = QSERDES_V6_COM_VCO_TUNE_MAP,
> +       .lock_cmp1_mode0                = QSERDES_V6_COM_LOCK_CMP1_MODE0,
> +       .lock_cmp2_mode0                = QSERDES_V6_COM_LOCK_CMP2_MODE0,
> +       .bg_timer                       = QSERDES_V6_COM_BG_TIMER,
> +       .pll_core_clk_div_mode0         = QSERDES_V6_COM_PLL_CORE_CLK_DIV_MODE0,
> +       .vco_tune_ctrl                  = QSERDES_V6_COM_VCO_TUNE_CTRL,
> +       .pll_bias_en_clk_buflr_en       = QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
> +       .core_clk_en                    = QSERDES_V6_COM_CORE_CLK_EN,
> +       .bin_vcocal_cmp_code1_mode0     = QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0,
> +       .bin_vcocal_cmp_code2_mode0     = QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0,
> +};
> +
> +struct qmp_com_init {
> +       const u8 ssc_per1;
> +       const u8 ssc_per2;
> +       const u8 pll_ivco;
> +       const u8 cmn_config;
> +       const u8 vco_tune1_mode0;
> +       const u8 vco_tune2_mode0;
> +       const u8 pll_bias_en_clk_buflr_en;
> +
> +       const u8 *ssc_step1;
> +       const u8 *ssc_step2;
> +       const u8 *hsclk_sel;
> +       const u8 *dec_start_mode0;
> +       const u8 *div_frac_start2_mode0;
> +       const u8 *div_frac_start3_mode0;
> +       const u8 *lock_cmp1_mode0;
> +       const u8 *lock_cmp2_mode0;
> +       const u8 *code1_mode0;
> +       const u8 *code2_mode0;
> +};
> +
> +static const u8 qmp_v4_com_ssc_step1[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x45,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x45,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x5c,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x45,
> +};
> +
> +static const u8 qmp_v4_com_ssc_step2[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x06,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x06,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x08,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x06,
> +};
> +
> +static const u8 qmp_v4_com_hsclk_sel[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x05,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x03,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x01,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x00,
> +};
> +
> +static const u8 qmp_v4_com_dec_start_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x69,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x69,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x8c,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x69,
> +};
> +
> +static const u8 qmp_v4_com_div_frac_start2_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x80,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x80,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x00,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x80,
> +};
> +
> +static const u8 qmp_v4_com_div_frac_start3_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x07,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x07,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x0a,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x07,
> +};
> +
> +static const u8 qmp_v4_com_lock_cmp1_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x6f,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x0f,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x1f,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x2f,
> +};
> +
> +static const u8 qmp_v4_com_lock_cmp2_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x08,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x0e,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x1c,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x2a,
> +};
> +
> +static const struct qmp_com_init qmp_v4_com_init = {
> +       .ssc_per1 = 0x36,
> +       .ssc_per2 = 0x01,
> +       .pll_ivco = 0x0f,
> +       .cmn_config = 0x02,
> +       .pll_bias_en_clk_buflr_en = 0x17,
> +       .ssc_step1 = qmp_v4_com_ssc_step1,
> +       .ssc_step2 = qmp_v4_com_ssc_step2,
> +       .hsclk_sel = qmp_v4_com_hsclk_sel,
> +       .dec_start_mode0 = qmp_v4_com_dec_start_mode0,
> +       .div_frac_start2_mode0 = qmp_v4_com_div_frac_start2_mode0,
> +       .div_frac_start3_mode0 = qmp_v4_com_div_frac_start3_mode0,
> +       .lock_cmp1_mode0 = qmp_v4_com_lock_cmp1_mode0,
> +       .lock_cmp2_mode0 = qmp_v4_com_lock_cmp2_mode0,
> +       .vco_tune1_mode0 = 0xa0,
> +       .vco_tune2_mode0 = 0x03,
> +};
> +
> +static const u8 qmp_v6_com_ssc_step1[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x92,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x92,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x18,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x92,
> +};
> +
> +static const u8 qmp_v6_com_ssc_step2[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x01,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x01,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x02,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x01,
> +};
> +
> +static const u8 qmp_v6_com_hsclk_sel[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x05,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x03,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x01,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x00,
> +};
> +
> +static const u8 qmp_v6_com_dec_start_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x34,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x34,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x46,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x34,
> +};
> +
> +static const u8 qmp_v6_com_div_frac_start2_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0xc0,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0xc0,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x00,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0xc0,
> +};
> +
> +static const u8 qmp_v6_com_div_frac_start3_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x0b,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x0b,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x05,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x0b,
> +};
> +
> +static const u8 qmp_v6_com_lock_cmp1_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x37,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x07,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x0f,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x17,
> +};
>
> -       /* DP PHY swing and pre_emphasis tables */
> +static const u8 qmp_v6_com_lock_cmp2_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x04,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x07,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x0e,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x15,
> +};
> +
> +static const u8 qmp_v6_com_code1_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x71,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x71,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x97,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x71,
> +};
> +
> +static const u8 qmp_v6_com_code2_mode0[] = {
> +       [DP_LINK_RATE_1_6_GHZ]  = 0x0c,
> +       [DP_LINK_RATE_2_7_GHZ]  = 0x0c,
> +       [DP_LINK_RATE_5_4_GHZ]  = 0x10,
> +       [DP_LINK_RATE_8_1_GHZ]  = 0x0c,
> +};
> +
> +static const struct qmp_com_init qmp_v6_com_init = {
> +       .ssc_per1 = 0x6b,
> +       .ssc_per2 = 0x02,
> +       .pll_ivco = 0x07,
> +       .cmn_config = 0x12,
> +       .pll_bias_en_clk_buflr_en = 0x1f,
> +       .ssc_step1 = qmp_v6_com_ssc_step1,
> +       .ssc_step2 = qmp_v6_com_ssc_step2,
> +       .hsclk_sel = qmp_v6_com_hsclk_sel,
> +       .dec_start_mode0 = qmp_v6_com_dec_start_mode0,
> +       .div_frac_start2_mode0 = qmp_v6_com_div_frac_start2_mode0,
> +       .div_frac_start3_mode0 = qmp_v6_com_div_frac_start3_mode0,
> +       .lock_cmp1_mode0 = qmp_v6_com_lock_cmp1_mode0,
> +       .lock_cmp2_mode0 = qmp_v6_com_lock_cmp2_mode0,
> +       .code1_mode0 = qmp_v6_com_code1_mode0,
> +       .code2_mode0 = qmp_v6_com_code2_mode0,
> +};
> +
> +struct qmp_phy_cfg {
> +       int type;
> +       enum dp_qmp_com_version version;
> +       bool needs_swing_pre_emph_cfg;
> +};
> +
> +struct qcom_dp_swing_pre_emph_cfg {
>         const u8 (*swing_hbr_rbr)[4][4];
>         const u8 (*swing_hbr3_hbr2)[4][4];
>         const u8 (*pre_emphasis_hbr_rbr)[4][4];
> @@ -80,7 +403,9 @@ struct qcom_edp_cfg {
>
>  struct qcom_edp {
>         struct device *dev;
> -       const struct qcom_edp_cfg *cfg;
> +       const struct qcom_dp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> +       const struct qmp_com_regs_layout *com_regs;
> +       const struct qmp_com_init *init_values;
>
>         struct phy *phy;
>
> @@ -96,6 +421,8 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +
> +       bool is_dp;
>  };
>
>  static const u8 dp_swing_hbr_rbr[4][4] = {
> @@ -126,8 +453,7 @@ static const u8 dp_pre_emp_hbr2_hbr3[4][4] = {
>         { 0x04, 0xff, 0xff, 0xff }
>  };
>
> -static const struct qcom_edp_cfg dp_phy_cfg = {
> -       .is_dp = true,
> +static const struct qcom_dp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
>         .swing_hbr_rbr = &dp_swing_hbr_rbr,
>         .swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
>         .pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr,
> @@ -162,18 +488,40 @@ static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
>         { 0x00, 0xff, 0xff, 0xff }
>  };
>
> -static const struct qcom_edp_cfg edp_phy_cfg = {
> -       .is_dp = false,
> +static const struct qcom_dp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>         .swing_hbr_rbr = &edp_swing_hbr_rbr,
>         .swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
>         .pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
>         .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>
> +static struct qmp_phy_cfg sc7280_dp_phy_cfg = {
> +       .type = PHY_TYPE_DP,
> +       .version = DP_QMP_VERSION_V4,
> +};
> +
> +static struct qmp_phy_cfg sc8280xp_dp_phy_cfg = {
> +       .type = PHY_TYPE_DP,
> +       .version = DP_QMP_VERSION_V4,
> +       .needs_swing_pre_emph_cfg = true,
> +};
> +
> +static struct qmp_phy_cfg sc8280xp_edp_phy_cfg = {
> +       .type = PHY_TYPE_EDP,
> +       .version = DP_QMP_VERSION_V4,
> +       .needs_swing_pre_emph_cfg = true,
> +};
> +
> +static struct qmp_phy_cfg x1e80100_phy_cfg = {
> +       .version = DP_QMP_VERSION_V6,
> +       .needs_swing_pre_emph_cfg = true,
> +};
> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
> -       const struct qcom_edp_cfg *cfg = edp->cfg;
> +       const struct qmp_com_init *init = edp->init_values;
> +       const struct qmp_com_regs_layout *regs = edp->com_regs;
>         int ret;
>         u8 cfg8;
>
> @@ -190,7 +538,8 @@ static int qcom_edp_phy_init(struct phy *phy)
>                edp->edp + DP_PHY_PD_CTL);
>
>         /* Turn on BIAS current for PHY/PLL */
> -       writel(0x17, edp->pll + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
> +       writel(init->pll_bias_en_clk_buflr_en,
> +              edp->pll + regs->pll_bias_en_clk_buflr_en);
>
>         writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
>         msleep(20);
> @@ -200,7 +549,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>                edp->edp + DP_PHY_PD_CTL);
>
> -       if (cfg && cfg->is_dp)
> +       if (edp->is_dp)
>                 cfg8 = 0xb7;
>         else
>                 cfg8 = 0x37;
> @@ -234,7 +583,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>
>  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
>  {
> -       const struct qcom_edp_cfg *cfg = edp->cfg;
> +       const struct qcom_dp_swing_pre_emph_cfg *cfg = edp->swing_pre_emph_cfg;
>         unsigned int v_level = 0;
>         unsigned int p_level = 0;
>         u8 ldo_config;
> @@ -261,7 +610,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>         if (swing == 0xff || emph == 0xff)
>                 return -EINVAL;
>
> -       ldo_config = (cfg && cfg->is_dp) ? 0x1 : 0x0;
> +       ldo_config = edp->is_dp ? 0x1 : 0x0;
>
>         writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>         writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
> @@ -291,20 +640,21 @@ static int qcom_edp_phy_configure(struct phy *phy, union phy_configure_opts *opt
>  static int qcom_edp_configure_ssc(const struct qcom_edp *edp)
>  {
>         const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> -       u32 step1;
> -       u32 step2;
> +       const struct qmp_com_regs_layout *regs = edp->com_regs;
> +       const struct qmp_com_init *init = edp->init_values;
> +       int link_rate;
> +       u8 step1, step2;
> +       u8 per1, per2;
>
>         switch (dp_opts->link_rate) {
>         case 1620:
>         case 2700:
>         case 8100:
> -               step1 = 0x45;
> -               step2 = 0x06;
> +               link_rate = DP_LINK_RATE_1_6_GHZ;
>                 break;
>
>         case 5400:
> -               step1 = 0x5c;
> -               step2 = 0x08;
> +               link_rate = DP_LINK_RATE_5_4_GHZ;
>                 break;
>
>         default:
> @@ -312,12 +662,18 @@ static int qcom_edp_configure_ssc(const struct qcom_edp *edp)
>                 return -EINVAL;
>         }
>
> -       writel(0x01, edp->pll + QSERDES_V4_COM_SSC_EN_CENTER);
> -       writel(0x00, edp->pll + QSERDES_V4_COM_SSC_ADJ_PER1);
> -       writel(0x36, edp->pll + QSERDES_V4_COM_SSC_PER1);
> -       writel(0x01, edp->pll + QSERDES_V4_COM_SSC_PER2);
> -       writel(step1, edp->pll + QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0);
> -       writel(step2, edp->pll + QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0);
> +       step1 = init->ssc_step1[link_rate];
> +       step2 = init->ssc_step2[link_rate];
> +
> +       per1 = init->ssc_per1;
> +       per2 = init->ssc_per2;
> +
> +       writel(0x01, edp->pll + regs->ssc_en_center);
> +       writel(0x00, edp->pll + regs->ssc_adj_per1);
> +       writel(per1, edp->pll + regs->ssc_per1);
> +       writel(per2, edp->pll + regs->ssc_per2);
> +       writel(step1, edp->pll + regs->ssc_step_size1_mode0);
> +       writel(step2, edp->pll + regs->ssc_step_size2_mode0);
>
>         return 0;
>  }
> @@ -325,48 +681,30 @@ static int qcom_edp_configure_ssc(const struct qcom_edp *edp)
>  static int qcom_edp_configure_pll(const struct qcom_edp *edp)
>  {
>         const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +       const struct qmp_com_regs_layout *regs = edp->com_regs;
> +       const struct qmp_com_init *init = edp->init_values;
>         u32 div_frac_start2_mode0;
>         u32 div_frac_start3_mode0;
>         u32 dec_start_mode0;
>         u32 lock_cmp1_mode0;
>         u32 lock_cmp2_mode0;
> +       u32 code1_mode0;
> +       u32 code2_mode0;
>         u32 hsclk_sel;
> +       int link_rate;
>
>         switch (dp_opts->link_rate) {
>         case 1620:
> -               hsclk_sel = 0x5;
> -               dec_start_mode0 = 0x69;
> -               div_frac_start2_mode0 = 0x80;
> -               div_frac_start3_mode0 = 0x07;
> -               lock_cmp1_mode0 = 0x6f;
> -               lock_cmp2_mode0 = 0x08;
> +               link_rate = DP_LINK_RATE_1_6_GHZ;
>                 break;
> -
>         case 2700:
> -               hsclk_sel = 0x3;
> -               dec_start_mode0 = 0x69;
> -               div_frac_start2_mode0 = 0x80;
> -               div_frac_start3_mode0 = 0x07;
> -               lock_cmp1_mode0 = 0x0f;
> -               lock_cmp2_mode0 = 0x0e;
> +               link_rate = DP_LINK_RATE_2_7_GHZ;
>                 break;
> -
>         case 5400:
> -               hsclk_sel = 0x1;
> -               dec_start_mode0 = 0x8c;
> -               div_frac_start2_mode0 = 0x00;
> -               div_frac_start3_mode0 = 0x0a;
> -               lock_cmp1_mode0 = 0x1f;
> -               lock_cmp2_mode0 = 0x1c;
> +               link_rate = DP_LINK_RATE_5_4_GHZ;
>                 break;
> -
>         case 8100:
> -               hsclk_sel = 0x0;
> -               dec_start_mode0 = 0x69;
> -               div_frac_start2_mode0 = 0x80;
> -               div_frac_start3_mode0 = 0x07;
> -               lock_cmp1_mode0 = 0x2f;
> -               lock_cmp2_mode0 = 0x2a;
> +               link_rate = DP_LINK_RATE_8_1_GHZ;
>                 break;
>
>         default:
> @@ -374,36 +712,59 @@ static int qcom_edp_configure_pll(const struct qcom_edp *edp)
>                 return -EINVAL;
>         }
>
> -       writel(0x01, edp->pll + QSERDES_V4_COM_SVS_MODE_CLK_SEL);
> -       writel(0x0b, edp->pll + QSERDES_V4_COM_SYSCLK_EN_SEL);
> -       writel(0x02, edp->pll + QSERDES_V4_COM_SYS_CLK_CTRL);
> -       writel(0x0c, edp->pll + QSERDES_V4_COM_CLK_ENABLE1);
> -       writel(0x06, edp->pll + QSERDES_V4_COM_SYSCLK_BUF_ENABLE);
> -       writel(0x30, edp->pll + QSERDES_V4_COM_CLK_SELECT);
> -       writel(hsclk_sel, edp->pll + QSERDES_V4_COM_HSCLK_SEL);
> -       writel(0x0f, edp->pll + QSERDES_V4_COM_PLL_IVCO);
> -       writel(0x08, edp->pll + QSERDES_V4_COM_LOCK_CMP_EN);
> -       writel(0x36, edp->pll + QSERDES_V4_COM_PLL_CCTRL_MODE0);
> -       writel(0x16, edp->pll + QSERDES_V4_COM_PLL_RCTRL_MODE0);
> -       writel(0x06, edp->pll + QSERDES_V4_COM_CP_CTRL_MODE0);
> -       writel(dec_start_mode0, edp->pll + QSERDES_V4_COM_DEC_START_MODE0);
> -       writel(0x00, edp->pll + QSERDES_V4_COM_DIV_FRAC_START1_MODE0);
> -       writel(div_frac_start2_mode0, edp->pll + QSERDES_V4_COM_DIV_FRAC_START2_MODE0);
> -       writel(div_frac_start3_mode0, edp->pll + QSERDES_V4_COM_DIV_FRAC_START3_MODE0);
> -       writel(0x02, edp->pll + QSERDES_V4_COM_CMN_CONFIG);
> -       writel(0x3f, edp->pll + QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0);
> -       writel(0x00, edp->pll + QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0);
> -       writel(0x00, edp->pll + QSERDES_V4_COM_VCO_TUNE_MAP);
> -       writel(lock_cmp1_mode0, edp->pll + QSERDES_V4_COM_LOCK_CMP1_MODE0);
> -       writel(lock_cmp2_mode0, edp->pll + QSERDES_V4_COM_LOCK_CMP2_MODE0);
> -
> -       writel(0x0a, edp->pll + QSERDES_V4_COM_BG_TIMER);
> -       writel(0x14, edp->pll + QSERDES_V4_COM_CORECLK_DIV_MODE0);
> -       writel(0x00, edp->pll + QSERDES_V4_COM_VCO_TUNE_CTRL);
> -       writel(0x17, edp->pll + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
> -       writel(0x0f, edp->pll + QSERDES_V4_COM_CORE_CLK_EN);
> -       writel(0xa0, edp->pll + QSERDES_V4_COM_VCO_TUNE1_MODE0);
> -       writel(0x03, edp->pll + QSERDES_V4_COM_VCO_TUNE2_MODE0);
> +       hsclk_sel = init->hsclk_sel[link_rate];
> +       dec_start_mode0 = init->dec_start_mode0[link_rate];
> +       div_frac_start2_mode0 = init->div_frac_start2_mode0[link_rate];
> +       div_frac_start3_mode0 = init->div_frac_start3_mode0[link_rate];
> +       lock_cmp1_mode0 = init->lock_cmp1_mode0[link_rate];
> +       lock_cmp2_mode0 = init->lock_cmp2_mode0[link_rate];
> +
> +       if (init->code1_mode0)
> +               code1_mode0 = init->code1_mode0[link_rate];
> +
> +       if (init->code2_mode0)
> +               code2_mode0 = init->code2_mode0[link_rate];
> +
> +       writel(0x01, edp->pll + regs->svs_mode_clk_sel);
> +       writel(0x0b, edp->pll + regs->sysclk_en_sel);
> +       writel(0x02, edp->pll + regs->sys_clk_ctrl);
> +       writel(0x0c, edp->pll + regs->clk_enable1);
> +       writel(0x06, edp->pll + regs->sysclk_buf_enable);
> +       writel(0x30, edp->pll + regs->clk_select);
> +       writel(hsclk_sel, edp->pll + regs->hsclk_sel);
> +       writel(init->pll_ivco, edp->pll + regs->pll_ivco);
> +       writel(0x08, edp->pll + regs->lock_cmp_en);
> +       writel(0x36, edp->pll + regs->pll_cctrl_mode0);
> +       writel(0x16, edp->pll + regs->pll_rctrl_mode0);
> +       writel(0x06, edp->pll + regs->cp_ctrl_mode0);
> +       writel(dec_start_mode0, edp->pll + regs->dec_start_mode0);
> +       writel(0x00, edp->pll + regs->div_frac_start1_mode0);
> +       writel(div_frac_start2_mode0, edp->pll + regs->div_frac_start2_mode0);
> +       writel(div_frac_start3_mode0, edp->pll + regs->div_frac_start3_mode0);
> +       writel(init->cmn_config, edp->pll + regs->cmn_config);
> +       writel(0x3f, edp->pll + regs->integloop_gain0_mode0);
> +       writel(0x00, edp->pll + regs->integloop_gain1_mode0);
> +       writel(0x00, edp->pll + regs->vco_tune_map);
> +       writel(lock_cmp1_mode0, edp->pll + regs->lock_cmp1_mode0);
> +       writel(lock_cmp2_mode0, edp->pll + regs->lock_cmp2_mode0);
> +
> +       writel(0x0a, edp->pll + regs->bg_timer);
> +       writel(0x14, edp->pll + regs->pll_core_clk_div_mode0);
> +       writel(0x00, edp->pll + regs->vco_tune_ctrl);
> +       writel(0x17, edp->pll + regs->pll_bias_en_clk_buflr_en);
> +       writel(0x0f, edp->pll + regs->core_clk_en);
> +
> +       if (regs->vco_tune1_mode0)
> +               writel(init->vco_tune1_mode0, edp->pll + regs->vco_tune1_mode0);
> +
> +       if (regs->vco_tune2_mode0)
> +               writel(init->vco_tune2_mode0, edp->pll + regs->vco_tune2_mode0);
> +
> +       if (regs->bin_vcocal_cmp_code1_mode0)
> +               writel(code1_mode0, edp->pll + regs->bin_vcocal_cmp_code1_mode0);
> +
> +       if (regs->bin_vcocal_cmp_code2_mode0)
> +               writel(code2_mode0, edp->pll + regs->bin_vcocal_cmp_code2_mode0);
>
>         return 0;
>  }
> @@ -447,10 +808,10 @@ static int qcom_edp_set_vco_div(const struct qcom_edp *edp, unsigned long *pixel
>  static int qcom_edp_phy_power_on(struct phy *phy)
>  {
>         const struct qcom_edp *edp = phy_get_drvdata(phy);
> -       const struct qcom_edp_cfg *cfg = edp->cfg;
> +       const struct qmp_com_regs_layout *regs = edp->com_regs;
>         u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
>         unsigned long pixel_freq;
> -       u8 ldo_config;
> +       u8 ldo_config = 0x0;
>         int timeout;
>         int ret;
>         u32 val;
> @@ -462,13 +823,14 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>                edp->edp + DP_PHY_PD_CTL);
>         writel(0xfc, edp->edp + DP_PHY_MODE);
>
> -       timeout = readl_poll_timeout(edp->pll + QSERDES_V4_COM_CMN_STATUS,
> +       timeout = readl_poll_timeout(edp->pll + regs->cmn_status,
>                                      val, val & BIT(7), 5, 200);
>         if (timeout)
>                 return timeout;
>
>
> -       ldo_config = (cfg && cfg->is_dp) ? 0x1 : 0x0;
> +       if (edp->swing_pre_emph_cfg && edp->is_dp)
> +               ldo_config = 0x1;
>
>         writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>         writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> @@ -512,9 +874,9 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>         writel(0x01, edp->edp + DP_PHY_CFG);
>         writel(0x09, edp->edp + DP_PHY_CFG);
>
> -       writel(0x20, edp->pll + QSERDES_V4_COM_RESETSM_CNTRL);
> +       writel(0x20, edp->pll + regs->resetsm_cntrl);
>
> -       timeout = readl_poll_timeout(edp->pll + QSERDES_V4_COM_C_READY_STATUS,
> +       timeout = readl_poll_timeout(edp->pll + regs->c_ready_status,
>                                      val, val & BIT(0), 500, 10000);
>         if (timeout)
>                 return timeout;
> @@ -768,6 +1130,37 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>         return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
>  }
>
> +static int qcom_edp_setup_phy(struct platform_device *pdev, struct qcom_edp *edp)
> +{
> +       struct device *dev = &pdev->dev;
> +       const struct qmp_phy_cfg *cfg = of_device_get_match_data(dev);
> +       enum dp_qmp_com_version version = cfg->version;
> +       struct device_node *node = dev->of_node;
> +       int type = cfg->type;
> +
> +       of_property_read_u32(node, "phy-type", &type);
> +
> +       if (type != PHY_TYPE_DP && type != PHY_TYPE_EDP)
> +               return -EINVAL;
> +
> +       edp->is_dp = (type == PHY_TYPE_DP) ? true : false;
> +
> +       if (cfg->needs_swing_pre_emph_cfg)
> +               edp->swing_pre_emph_cfg = edp->is_dp ?
> +                                               &dp_phy_swing_pre_emph_cfg:
> +                                               &edp_phy_swing_pre_emph_cfg;
> +
> +       if (version == DP_QMP_VERSION_V6) {
> +               edp->com_regs = &qmp_v6_com_regs;
> +               edp->init_values = &qmp_v6_com_init;
> +       } else {
> +               edp->com_regs = &qmp_v4_com_regs;
> +               edp->init_values = &qmp_v4_com_init;
> +       }
> +
> +       return 0;
> +}
> +
>  static int qcom_edp_phy_probe(struct platform_device *pdev)
>  {
>         struct phy_provider *phy_provider;
> @@ -780,7 +1173,10 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         edp->dev = dev;
> -       edp->cfg = of_device_get_match_data(&pdev->dev);
> +
> +       ret = qcom_edp_setup_phy(pdev, edp);
> +       if (ret)
> +               return ret;
>
>         edp->edp = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(edp->edp))
> @@ -839,10 +1235,11 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> -       { .compatible = "qcom,sc7280-edp-phy" },
> -       { .compatible = "qcom,sc8180x-edp-phy" },
> -       { .compatible = "qcom,sc8280xp-dp-phy", .data = &dp_phy_cfg },
> -       { .compatible = "qcom,sc8280xp-edp-phy", .data = &edp_phy_cfg },
> +       { .compatible = "qcom,sc7280-edp-phy" , .data = &sc7280_dp_phy_cfg, },
> +       { .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
> +       { .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
> +       { .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
> +       { .compatible = "qcom,x1e80100-dp-phy" , .data = &x1e80100_phy_cfg, },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
>
> --
> 2.34.1
>


--
With best wishes
Dmitry

