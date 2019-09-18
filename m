Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261B2B66BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfIRPI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 11:08:57 -0400
Received: from ns.iliad.fr ([212.27.33.1]:60502 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728330AbfIRPI5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 11:08:57 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 8EF02206A6;
        Wed, 18 Sep 2019 17:08:54 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 3BE1720840;
        Wed, 18 Sep 2019 17:08:54 +0200 (CEST)
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <20190906051017.26846-1-vkoul@kernel.org>
 <20190906051017.26846-4-vkoul@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <ab149ba9-ab2e-5013-34ab-b01af51abc0a@free.fr>
Date:   Wed, 18 Sep 2019 17:08:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906051017.26846-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Sep 18 17:08:54 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2019 07:10, Vinod Koul wrote:

> SM8150 UFS PHY is v4 of QMP phy. Add support for V4 QMP phy register
> defines and support for SM8150 QMP UFS PHY.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 125 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  96 +++++++++++++++++++++
>  2 files changed, 221 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 34ff6434da8f..92d3048f2b36 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -164,6 +164,11 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
>  	[QPHY_PCS_READY_STATUS]		= 0x160,
>  };
>  
> +static const unsigned int sm8150_ufsphy_regs_layout[] = {
> +	[QPHY_START_CTRL]		= 0x00,
> +	[QPHY_PCS_READY_STATUS]		= 0x180,
> +};
> +
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>  	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xd9),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_SEL, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP_EN, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_IVCO, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_INITVAL2, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_HSCLK_SEL, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_DEC_START_MODE0, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP1_MODE0, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP2_MODE0, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_DEC_START_MODE1, 0x98),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP1_MODE1, 0x32),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP2_MODE1, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
> +
> +	/* Rate B */
> +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x06),

IMO, the name of the symbolic constants should be QSERDES_V4_COM*
(like below for QSERDES_V4_TX* and QSERDES_V4_RX*)


> +static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_BAND, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0xf1),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x1b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1d),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x10),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xf6),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x3b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3d),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xc8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xe0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0xc8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
> +
> +};
> +
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_RX_SIGDET_CTRL2, 0x6d),
> +	QMP_PHY_INIT_CFG(QPHY_V4_TX_LARGE_AMP_DRV_LVL, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V4_TX_SMALL_AMP_DRV_LVL, 0x02),
> +	QMP_PHY_INIT_CFG(QPHY_V4_TX_MID_TERM_CTRL1, 0x43),
> +	QMP_PHY_INIT_CFG(QPHY_V4_DEBUG_BUS_CLKSEL, 0x1f),
> +	QMP_PHY_INIT_CFG(QPHY_V4_RX_MIN_HIBERN8_TIME, 0xff),
> +	QMP_PHY_INIT_CFG(QPHY_V4_MULTI_LANE_CTRL1, 0x02),
> +};
>  
>  /* struct qmp_phy_cfg - per-PHY initialization config */
>  struct qmp_phy_cfg {
> @@ -1038,6 +1130,10 @@ static const char * const sdm845_ufs_phy_clk_l[] = {
>  	"ref", "ref_aux",
>  };
>  
> +static const char * const sm8150_ufs_phy_clk_l[] = {
> +	"ref", "ref_aux",
> +};
> +

Why not just reuse sdm845_ufs_phy_clk_l?

>  /* list of resets */
>  static const char * const msm8996_pciephy_reset_l[] = {
>  	"phy", "common", "cfg",
> @@ -1284,6 +1380,32 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  	.is_dual_lane_phy       = true,
>  };
>  
> +static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
> +	.type			= PHY_TYPE_UFS,
> +	.nlanes			= 2,
> +
> +	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
> +	.tx_tbl			= sm8150_ufsphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
> +	.rx_tbl			= sm8150_ufsphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
> +	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
> +	.clk_list		= sm8150_ufs_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(sm8150_ufs_phy_clk_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= sm8150_ufsphy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +	.mask_pcs_ready		= PCS_READY,

I think you need to rework your patch on top of
"phy: qcom-qmp: Correct ready status, again"
(it removed this field)
