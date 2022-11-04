Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E220E61987E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiKDNyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiKDNyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:54:18 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B4E29B;
        Fri,  4 Nov 2022 06:54:15 -0700 (PDT)
Received: from [192.168.31.208] (unknown [194.29.137.22])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 91EAE3EE24;
        Fri,  4 Nov 2022 14:54:12 +0100 (CET)
Message-ID: <fdea9d9b-a91a-06b9-a467-315af0c0fed4@somainline.org>
Date:   Fri, 4 Nov 2022 14:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 4/8] drm/msm/dsi: add support for DSI-PHY on SM8350 and
 SM8450
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221104130324.1024242-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04/11/2022 14:03, Dmitry Baryshkov wrote:
> SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
> with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
> variants inside the common 5+7nm driver.
>
> Co-developed-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Kconfig               |   6 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 128 ++++++++++++++++++++--
>   4 files changed, 127 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 3c9dfdb0b328..e7b100d97f88 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -140,12 +140,12 @@ config DRM_MSM_DSI_10NM_PHY
>   	  Choose this option if DSI PHY on SDM845 is used on the platform.
>   
>   config DRM_MSM_DSI_7NM_PHY
> -	bool "Enable DSI 7nm PHY driver in MSM DRM"
> +	bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
>   	depends on DRM_MSM_DSI
>   	default y
>   	help
> -	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
> -	  the platform.
> +	  Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
> +	  is used on the platform.
>   
>   config DRM_MSM_HDMI
>   	bool "Enable HDMI support in MSM DRM driver"
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ee6051367679..0c956fdab23e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -569,6 +569,10 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_7nm_8150_cfgs },
>   	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>   	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8350",
> +	  .data = &dsi_phy_5nm_8350_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8450",
> +	  .data = &dsi_phy_5nm_8450_cfgs },
>   #endif
>   	{}
>   };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 1096afedd616..f7a907ed2b4b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -57,6 +57,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>   
>   struct msm_dsi_dphy_timing {
>   	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9e7fa7d88ead..00d92fe97bc3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -39,8 +39,14 @@
>   #define VCO_REF_CLK_RATE		19200000
>   #define FRAC_BITS 18
>   
> +/* Hardware is pre V4.1 */
> +#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
>   /* Hardware is V4.1 */
> -#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
> +#define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
> +/* Hardware is V4.2 */
> +#define DSI_PHY_7NM_QUIRK_V4_2		BIT(2)
> +/* Hardware is V4.3 */
> +#define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)

Quirk is quite an unfortunate name considering what we use it for.. but I

suppose it can stay, as otherwise even more renaming would have to be done.


>   
>   struct dsi_pll_config {
>   	bool enable_ssc;
> @@ -116,7 +122,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>   	dec_multiple = div_u64(pll_freq * multiplier, divider);
>   	dec = div_u64_rem(dec_multiple, multiplier, &frac);
>   
> -	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
>   		config->pll_clock_inverters = 0x28;
>   	else if (pll_freq <= 1000000000ULL)
>   		config->pll_clock_inverters = 0xa0;
> @@ -197,16 +203,25 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>   	void __iomem *base = pll->phy->pll_base;
>   	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
>   
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>   		if (pll->vco_current_rate >= 3100000000ULL)
>   			analog_controls_five_1 = 0x03;
>   
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		if (pll->vco_current_rate < 1520000000ULL)
>   			vco_config_1 = 0x08;
>   		else if (pll->vco_current_rate < 2990000000ULL)
>   			vco_config_1 = 0x01;
>   	}
>   
> +	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) ||
> +	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
> +		if (pll->vco_current_rate < 1520000000ULL)
> +			vco_config_1 = 0x08;
> +		else if (pll->vco_current_rate >= 2990000000ULL)
> +			vco_config_1 = 0x01;
> +	}
> +
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
>   		      analog_controls_five_1);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
> @@ -231,9 +246,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
> -		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> +		  !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22);
>   
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
>   		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>   		if (pll->slave)
>   			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
> @@ -788,7 +803,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
>   	const u8 *tx_dctrl = tx_dctrl_0;
>   	void __iomem *lane_base = phy->lane_base;
>   
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
> +	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>   		tx_dctrl = tx_dctrl_1;
>   
>   	/* Strength ctrl settings */
> @@ -844,6 +859,12 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	if (dsi_phy_hw_v4_0_is_pll_on(phy))
>   		pr_warn("PLL turned on before configuring PHY\n");
>   
> +	/* Request for REFGEN READY */
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
> +		udelay(500);
> +	}
> +
>   	/* wait for REFGEN READY */
>   	ret = readl_poll_timeout_atomic(base + REG_DSI_7nm_PHY_CMN_PHY_STATUS,
>   					status, (status & BIT(0)),
> @@ -858,23 +879,53 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>   	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>   
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x00;
> +		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;

msm-5.10 has it as 0x3d : 0x00 for both v4.2 and v4.3 in DPHY mode


> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x88;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
> +		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x00;
> +		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x88;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
>   			glbl_rescode_top_ctrl = 0x00;
>   			glbl_rescode_bot_ctrl = 0x3c;
>   		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>   			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>   			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
>   		}
>   		glbl_str_swi_cal_sel_ctrl = 0x00;
>   		glbl_hstx_str_ctrl_0 = 0x88;
>   	} else {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>   		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
>   			glbl_str_swi_cal_sel_ctrl = 0x03;
>   			glbl_hstx_str_ctrl_0 = 0x66;
>   		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>   			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
>   			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
>   		}
> @@ -883,7 +934,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	}
>   
>   	if (phy->cphy_mode) {
> -		vreg_ctrl_0 = 0x51;
>   		vreg_ctrl_1 = 0x55;
>   		glbl_pemph_ctrl_0 = 0x11;
>   		lane_ctrl0 = 0x17;
> @@ -1017,6 +1067,13 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   		pr_warn("Turning OFF PHY while PLL is on\n");
>   
>   	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
> +
> +	/* Turn off REFGEN Vote */
> +        dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
> +        wmb();
> +        /* Delay to ensure HW removes vote before PHY shut down */
> +        udelay(2);

Either thunderbird is acting up (again) or the code after the first 
comment is

indented with spaces instead of tabs.


Other than that,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

> +
>   	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   
>   	/* disable all lanes */
> @@ -1040,6 +1097,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
>   	{ .supply = "vdds", .init_load_uA = 37550 },
>   };
>   
> +static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
> +	{ .supply = "vdds", .init_load_uA = 97800},
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>   	.has_phy_lane = true,
>   	.regulator_data = dsi_phy_7nm_36mA_regulators,
> @@ -1079,6 +1140,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>   	.max_pll_rate = 3500000000UL,
>   	.io_start = { 0xae94400, 0xae96400 },
>   	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
>   };
>   
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
> @@ -1102,3 +1164,49 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
>   	.num_dsi_phy = 1,
>   	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_37750uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_37750uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> +};
