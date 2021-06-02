Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA4B398D57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhFBOqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:46:11 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:43547 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhFBOqK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:46:10 -0400
Received: by mail-lf1-f46.google.com with SMTP id x38so3772607lfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLB3XwmxK0zMI/2Bdlf99xPYv4+65cX8NiEmcXIBNu4=;
        b=KjSQ8Np8t9HvPOoGH0lPLWrBVeIuTnB6BbpmrASpGO3TD579VkNIWpIBoUY0uMMAkp
         QMoCmPYWET7a1cGyWMc3JTtzu/5ELyPyHmmOEyq3KQRCaBHJ92/c0vleAAG5+cDMM8JR
         qs43pjzjS1CoUQFKbkjCQLmcD4hvSbG3aCM7dXfcX/GDUdEGj5RXqT/PRtEGlSN4IS/b
         a9n4ZsMenuzdEEveAEyeztQlS6XGZzvJx/jJLAbZcJ3ckJ+XRXUMKtvToKbfBzXV3DqQ
         /5mIZChCsq7fE4IdWE9RX8BDDMmeVljjPYsTQVOgGdU4ePL1SbiRpAT8TRFo1iHwEW5Q
         sfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLB3XwmxK0zMI/2Bdlf99xPYv4+65cX8NiEmcXIBNu4=;
        b=Vvezu/XqwaSfduisvN4v6BJLbwYVL58U512+Wq8pyNyjwxEcDMBXtrQ8jqJ2H/lCmj
         KBPV5as8D4cvwCfwHcMVa7SyOsP0+7uq+YfdGLFJZkFJLY9eP8FEYgX5t2Sh4V6E4Biq
         H+Wp/S9c3gyQ98OBh1jdi9Xb8ozZJCQDO4/WOOFmqlQh7oldI2ccaaA5hKOyBxzsMRLc
         8WRgpFlnfdrD862O8GyL6OnSEfEqQ4Xragbj2g/jJzjSHO1cnHS0rGOeNCKpRxaXMQ/S
         bO1OyBoP9Gbdny5+8sJUZT4SX/RMM8D7F0Nkj6oo8zM1bPfmO5yG9+hgk13/Y5uP4HO6
         fGvA==
X-Gm-Message-State: AOAM532uYkV+cBFiJNN+dfHFbjhiAqSaAajHWHsy2yMnt4Az5971EvcE
        HZijlMJGl1yDtZY8e2tIhj6vQw==
X-Google-Smtp-Source: ABdhPJw7P/BCAOSQX3byZQarwxQsK6P7A43ULyli3J1aVu2kfeFZl/AAUakQIKCh9hlItQqnTXGysg==
X-Received: by 2002:ac2:4e8e:: with SMTP id o14mr23110001lfr.8.1622645006798;
        Wed, 02 Jun 2021 07:43:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t3sm1997ljo.71.2021.06.02.07.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:43:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: add continuous clock support for 7nm PHY
Date:   Wed,  2 Jun 2021 17:43:25 +0300
Message-Id: <20210602144325.901560-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unlike previous generations, 7nm PHYs are required to collaborate with
the host for conitnuos clock mode. Add changes neccessary to enable
continuous clock mode in the 7nm DSI PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h             |  4 +++-
 drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
 7 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7abfeab08165..c4e7cace120c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -108,7 +108,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host *host);
 int msm_dsi_host_disable(struct mipi_dsi_host *host);
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_dual_dsi);
+			bool is_dual_dsi, struct msm_dsi_phy *phy);
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
@@ -173,6 +173,8 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
+bool msm_dsi_phy_needs_hs_phy_sel(struct msm_dsi_phy *phy);
+void msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 50eb4d1b8fdd..b1b668ff7e10 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -511,6 +511,7 @@ static inline uint32_t DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
 
 #define REG_DSI_LANE_CTRL					0x000000a8
 #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
+#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
 
 #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
 #define DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL__MASK			0x00000007
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 41e1d0f7ab6e..4507c16c9385 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -835,7 +835,7 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
 }
 
 static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
-			struct msm_dsi_phy_shared_timings *phy_shared_timings)
+			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
 	u32 flags = msm_host->mode_flags;
 	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
@@ -930,8 +930,12 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
 		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
+		if (msm_dsi_phy_needs_hs_phy_sel(phy))
+			lane_ctrl |= DSI_LANE_CTRL_HS_REQ_SEL_PHY;
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
 			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
+		if (msm_dsi_phy_needs_hs_phy_sel(phy))
+			msm_dsi_phy_set_continuous_clock(phy, enable);
 	}
 
 	data |= DSI_CTRL_ENABLE;
@@ -2360,7 +2364,7 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
 
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_dual_dsi)
+			bool is_dual_dsi, struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
@@ -2400,7 +2404,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 
 	dsi_timing_setup(msm_host, is_dual_dsi);
 	dsi_sw_reset(msm_host);
-	dsi_ctrl_config(msm_host, true, phy_shared_timings);
+	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
@@ -2431,7 +2435,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
-	dsi_ctrl_config(msm_host, false, NULL);
+	dsi_ctrl_config(msm_host, false, NULL, NULL);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 0);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index e138a0c16085..082a20565886 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -382,7 +382,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
-	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi);
+	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
 		goto host_on_fail;
@@ -390,7 +390,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 
 	if (is_dual_dsi && msm_dsi1) {
 		ret = msm_dsi_host_power_on(msm_dsi1->host,
-				&phy_shared_timings[DSI_1], is_dual_dsi);
+				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi->phy);
 		if (ret) {
 			pr_err("%s: power on host1 failed, %d\n",
 							__func__, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ccbd19f7d9cf..c2c7a46463ac 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -851,6 +851,21 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
 }
 
+bool msm_dsi_phy_needs_hs_phy_sel(struct msm_dsi_phy *phy)
+{
+	if (!phy)
+		return false;
+	return phy->cfg->needs_continuous_clock;
+}
+
+void msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
+{
+	if (!phy || !phy->cfg->ops.set_continuous_clock)
+		return;
+
+	phy->cfg->ops.set_continuous_clock(phy, enable);
+}
+
 int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
 {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac364d3..16d974f4d536 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
+	void (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
 };
 
 struct msm_dsi_phy_cfg {
@@ -38,6 +39,7 @@ struct msm_dsi_phy_cfg {
 	const int quirks;
 	bool has_phy_regulator;
 	bool has_phy_lane;
+	bool needs_continuous_clock;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..771fb31eb607 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -930,6 +930,19 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	return 0;
 }
 
+static void dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
+{
+	void __iomem *base = phy->base;
+	u32 data;
+
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
+	if (enable)
+		data |= BIT(5) | BIT(6);
+	else
+		data &= ~(BIT(5) | BIT(6));
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
+}
+
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->base;
@@ -970,12 +983,14 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
+	.needs_continuous_clock = true,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
@@ -992,9 +1007,11 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.needs_continuous_clock = true,
 };
-- 
2.30.2

