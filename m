Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566776450EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiLGBWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiLGBWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C4D1B784
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:39 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id cf42so20617421lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sR+/4QdlI/OFEF02HVcM+RtUIv2qlrBtDLesY4zvTY=;
        b=o9E+ntJcFtuLJjvwdAotW6KXSZMH2mxydYO3PT58izTKx26zA4T8t4vUnIyGTwecRo
         YPGNBpRmi0j2u4Mcysdp3ExZqmO2/Ryy3s9ihOQaNsUasWGZsLnwLItr09TzkpQCGCgB
         Ag9L1HOR4iTX+OtxSiUiCO1w8X72iy/JPKU3StqrRcPI8vrFI3NzVqSi1eLfMa1kV2Sh
         i1BqDoqa9mVRaeDPoDmRughQLg4wMP6ZztZpFlvjY359AadLL5YZZKEW1x78LdGknhJl
         DG090eqfLJRlU+FIrbl+5bCFxnzCqza7+wYv8B95xPF2DTyTOYCukxcXQMjpc+Am/JQQ
         lFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sR+/4QdlI/OFEF02HVcM+RtUIv2qlrBtDLesY4zvTY=;
        b=So6nyGEKwAqetjuFt4KLNAVGeJlXx8zegwifuEkWTiNWhIKOugRfbfZpPcGg4W0e3A
         7KXtDLrd+8pZMcAq6qGjiNBgpc9xUpszX6uZuoqu2qpYtI/1RQjG1PIP++yZtLOGz7qt
         FIs2Ryno2TlkEKP0VbODvSqA0A/zplMO4JX1WgAXrD2a+dyUXnzXbwGAzJJa5+XWZR8g
         wXsi4yNIVHieWpcdt2MR+BirXeXwQAqwczkwxuwIHylyiEvmIwXdjx35daDDJzNETvbf
         CaUE74QiqSZWMWHaMx8by6qto4iosoKWPpQu2ClZBOUIE2mDsJnO30FkCs41YBrJ79Do
         KwkA==
X-Gm-Message-State: ANoB5pkuv+AYBk+3UZjGe8l5iVgg0KV1Vc+KFBlwEfGhdYtthu/+haUI
        GIldxwWXGI1xdOKOmJMM40PVvA==
X-Google-Smtp-Source: AA0mqf5YzqP7p6xZr0AHpr89XLGuorf4mKj9xc4NorxlbmZJn6uYyj/TK/FI8pOg160c7lW7p6fU5g==
X-Received: by 2002:a05:6512:3416:b0:498:f589:c1b3 with SMTP id i22-20020a056512341600b00498f589c1b3mr23614254lfr.406.1670376157441;
        Tue, 06 Dec 2022 17:22:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Subject: [PATCH v6 06/11] drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
Date:   Wed,  7 Dec 2022 03:22:26 +0200
Message-Id: <20221207012231.112059-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
variants inside the common 5+7nm driver.

Co-developed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig               |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 119 ++++++++++++++++++++--
 4 files changed, 118 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3c9dfdb0b328..e7b100d97f88 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -140,12 +140,12 @@ config DRM_MSM_DSI_10NM_PHY
 	  Choose this option if DSI PHY on SDM845 is used on the platform.
 
 config DRM_MSM_DSI_7NM_PHY
-	bool "Enable DSI 7nm PHY driver in MSM DRM"
+	bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
 	default y
 	help
-	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
-	  the platform.
+	  Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
+	  is used on the platform.
 
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ee6051367679..0c956fdab23e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -569,6 +569,10 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_8150_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
+	{ .compatible = "qcom,dsi-phy-5nm-8350",
+	  .data = &dsi_phy_5nm_8350_cfgs },
+	{ .compatible = "qcom,dsi-phy-5nm-8450",
+	  .data = &dsi_phy_5nm_8450_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1096afedd616..f7a907ed2b4b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -57,6 +57,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 0b780f9d3d0a..7b2c16b3a36c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -39,8 +39,14 @@
 #define VCO_REF_CLK_RATE		19200000
 #define FRAC_BITS 18
 
+/* Hardware is pre V4.1 */
+#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
 /* Hardware is V4.1 */
-#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
+#define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
+/* Hardware is V4.2 */
+#define DSI_PHY_7NM_QUIRK_V4_2		BIT(2)
+/* Hardware is V4.3 */
+#define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
 
 struct dsi_pll_config {
 	bool enable_ssc;
@@ -116,7 +122,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
-	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
 		config->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
 		config->pll_clock_inverters = 0xa0;
@@ -197,16 +203,25 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->phy->pll_base;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (pll->vco_current_rate < 1520000000ULL)
 			vco_config_1 = 0x08;
 		else if (pll->vco_current_rate < 2990000000ULL)
 			vco_config_1 = 0x01;
 	}
 
+	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) ||
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
+		if (pll->vco_current_rate < 1520000000ULL)
+			vco_config_1 = 0x08;
+		else if (pll->vco_current_rate >= 2990000000ULL)
+			vco_config_1 = 0x01;
+	}
+
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
 		      analog_controls_five_1);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
@@ -231,9 +246,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
+		  !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22);
 
-	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
 			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
@@ -788,7 +803,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
+	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -844,6 +859,12 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	if (dsi_phy_hw_v4_0_is_pll_on(phy))
 		pr_warn("PLL turned on before configuring PHY\n");
 
+	/* Request for REFGEN READY */
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
+		dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
+		udelay(500);
+	}
+
 	/* wait for REFGEN READY */
 	ret = readl_poll_timeout_atomic(base + REG_DSI_7nm_PHY_CMN_PHY_STATUS,
 					status, (status & BIT(0)),
@@ -858,28 +879,46 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
+	glbl_str_swi_cal_sel_ctrl = 0x00;
 	if (phy->cphy_mode) {
 		vreg_ctrl_0 = 0x51;
 		vreg_ctrl_1 = 0x55;
+		glbl_hstx_str_ctrl_0 = 0x00;
 		glbl_pemph_ctrl_0 = 0x11;
 		lane_ctrl0 = 0x17;
 	} else {
+		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		vreg_ctrl_1 = 0x5c;
+		glbl_hstx_str_ctrl_0 = 0x88;
 		glbl_pemph_ctrl_0 = 0x00;
 		lane_ctrl0 = 0x1f;
 	}
 
-	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
+		if (phy->cphy_mode) {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
+		} else {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
+		}
+	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
+		if (phy->cphy_mode) {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
+		} else {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
+		}
+	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (phy->cphy_mode) {
+			glbl_hstx_str_ctrl_0 = 0x88;
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x3c;
 		} else {
-			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
 		}
-		glbl_str_swi_cal_sel_ctrl = 0x00;
-		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
 		if (phy->cphy_mode) {
 			glbl_str_swi_cal_sel_ctrl = 0x03;
@@ -1017,6 +1056,15 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 		pr_warn("Turning OFF PHY while PLL is on\n");
 
 	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
+
+	/* Turn off REFGEN Vote */
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
+		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
+		wmb();
+		/* Delay to ensure HW removes vote before PHY shut down */
+		udelay(2);
+	}
+
 	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* disable all lanes */
@@ -1040,6 +1088,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
 	{ .supply = "vdds", .init_load_uA = 37550 },
 };
 
+static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
+	{ .supply = "vdds", .init_load_uA = 97800 },
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_36mA_regulators,
@@ -1079,6 +1131,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
@@ -1102,3 +1155,49 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_37750uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_37750uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae94400, 0xae96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
+};
+
+const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_97800uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae94400, 0xae96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
+};
-- 
2.35.1

