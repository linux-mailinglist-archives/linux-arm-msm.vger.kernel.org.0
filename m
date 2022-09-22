Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080675E610F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiIVLab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbiIVLa1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:30:27 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59CFD5762
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b24so10596888ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BXt4OEFvsDaoJSngcw2xjx6/o+MAz+ChUdCtVOID8FY=;
        b=m83dRdPeNSk4JoQzKbZUXdOOfjIVMb+bj35EA1AHxkQ28BnLdBDkUONzP/qAUdqNW/
         EDjpeu1W0G/m2feblvB3zLLiXbyQqq/FD9JF1fUc1iN2Pm5BO10Z0SRmiAFHU7u/swCN
         TLZHN2/ys35fXdO69Xd7xbhWf0FHNPaooZ1noRziVg04CCHyg3K46kuOI0Bwo9L8xaYs
         IvaM/CgC1SVcRz213YLMVE4puq77yJERDWrggTsArdusdEt91m0NsFXbfygna2h0vwIG
         eCcQr7TrE/tTh+yLCv3jI0oZ2cWZOm6ssfnpJx6ti4re7xzWrVMbn598F/R4hzVS6sFz
         57MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BXt4OEFvsDaoJSngcw2xjx6/o+MAz+ChUdCtVOID8FY=;
        b=H66ArF/vWn4Y8HCgndiJRkhi9noKXM+waftpc2YqBy8JdfZaffojstDlfwS8ybSOig
         tRqoIGBbHy0Fpzqhh3NWOnviLjVuMa2q7LL94vUf138V2z4HtpePG510MowJMB3YkjYO
         G0lWdavXRPyBocall/raMNOB2tvWkP7AGRG647JnjS/QRZ4M/tw/bj8DAHnUSL9naRRN
         gc//O42sdtpH1r4qOpRLTZ3tLRA4O/4A/W+2yTFtxNIIsrM1V+VEPvwqTLT3J5xreqSP
         bWj81WiQfo7tFW/FQkT5e9JWCXq+JABDjgGCJek2D/VYqJu0Lj7SAsqSYsMo74IgPXu2
         fPCA==
X-Gm-Message-State: ACrzQf0v3VBlP9kYvxUgk88YOnSqdD3yAUllcUZIbcNuAotm/CQ0IAHB
        A7zBl0si5YDSmLJuR6txguGNnQ==
X-Google-Smtp-Source: AMsMyM5t+phPK84Y67fC0bT0gQnRWQ/1Yc6KDpVYgnXOwOoIrJ7jFhMbrdMyF7XH2I13dVm9qfOu0g==
X-Received: by 2002:a2e:8190:0:b0:26b:d94b:75e9 with SMTP id e16-20020a2e8190000000b0026bd94b75e9mr955823ljg.379.1663846219395;
        Thu, 22 Sep 2022 04:30:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 04:30:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 1/5] drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
Date:   Thu, 22 Sep 2022 14:30:12 +0300
Message-Id: <20220922113016.355188-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
variants inside the common 5+7nm driver.

Co-developed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig               |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 132 ++++++++++++++++++++--
 4 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 4e0cbd682725..e6c5dfbad009 100644
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
index 7fc0975cb869..97cf6b8b34cc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -567,6 +567,10 @@ static const struct of_device_id dsi_phy_dt_match[] = {
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
index 60a99c6525b2..654cbfa14d6e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -56,6 +56,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 9e7fa7d88ead..1696ff150b9e 100644
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
@@ -858,23 +879,53 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
+		if (phy->cphy_mode) {
+			vreg_ctrl_0 = 0x51;
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
+			glbl_str_swi_cal_sel_ctrl = 0x00;
+			glbl_hstx_str_ctrl_0 = 0x00;
+		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
+			glbl_str_swi_cal_sel_ctrl = 0x00;
+			glbl_hstx_str_ctrl_0 = 0x88;
+		}
+	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
+		if (phy->cphy_mode) {
+			vreg_ctrl_0 = 0x51;
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
+			glbl_str_swi_cal_sel_ctrl = 0x00;
+			glbl_hstx_str_ctrl_0 = 0x00;
+		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
+			glbl_str_swi_cal_sel_ctrl = 0x00;
+			glbl_hstx_str_ctrl_0 = 0x88;
+		}
+	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (phy->cphy_mode) {
+			vreg_ctrl_0 = 0x51;
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x3c;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
 		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 		if (phy->cphy_mode) {
+			vreg_ctrl_0 = 0x51;
 			glbl_str_swi_cal_sel_ctrl = 0x03;
 			glbl_hstx_str_ctrl_0 = 0x66;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
 			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
 		}
@@ -883,7 +934,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	}
 
 	if (phy->cphy_mode) {
-		vreg_ctrl_0 = 0x51;
 		vreg_ctrl_1 = 0x55;
 		glbl_pemph_ctrl_0 = 0x11;
 		lane_ctrl0 = 0x17;
@@ -1017,6 +1067,13 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 		pr_warn("Turning OFF PHY while PLL is on\n");
 
 	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
+
+	/* Turn off REFGEN Vote */
+        dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
+        wmb();
+        /* Delay to ensure HW removes vote before PHY shut down */
+        udelay(2);
+
 	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* disable all lanes */
@@ -1079,6 +1136,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
@@ -1102,3 +1160,57 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 37550, 0},
+		},
+	},
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
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 97800, 0},
+		},
+	},
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

