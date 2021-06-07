Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20B939E807
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 22:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhFGUIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 16:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbhFGUIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 16:08:02 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1705BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 13:05:57 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c11so23898792ljd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSaqR2b5LZGGwRjzWgSOKXTxYCoRREr+gBUV4lLBnSM=;
        b=bIyEyiUE1LIJeVoyTLdBAImVOpTz+pbKEoiASLiOuzh7Z7SZek5C44VsjJjKs9xIhP
         wF6VgkhOpy1ZRAbo518Zo+gnKFuyiEmvzdCeEa+z3/Ejc6aUx+m6GxTJh+Rk3TZj40Ug
         UdmOyhVtj3Vu26DsPAN41LwekIYhshNFzH3Liq9P7hPbIlx+81qCjmHl8RRzF9rz9ZHA
         iOWyI+Sz/O0vgmWaxUpaH8k2zXs1pmPwkiyEJrJaVPZ62J63UhqRnlIx407ijOgR8yin
         LOiUITth7NQutw3jVGiM9xobW6BH5TeAhhAu5a3HjG+Ryr7Gq5vPvBK6/nOHNtnpJe3F
         y2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSaqR2b5LZGGwRjzWgSOKXTxYCoRREr+gBUV4lLBnSM=;
        b=ij1pi4K3TAg77nK/pSQouDruvv/r9lAWeu6TCDX3QqsFoPk5nwDJXa0nO1E/FliVm7
         Ojr/Axq5Uc9mmeVEQaqfKP4C9JHvX6hUboCskI0Uxwo3DseVfj9Ui7gARI4YRM2u3/Oq
         HzCOZj10G4Hr0Mboqs8K+gdo0fxKn5jfLtrqHYngZNEgiJdmH1NvEVsqt+pkgDgioO6l
         bFP3mu9BitabHAoAL19GbBzV4RL8F5mN853tSKJAfTZ153jZc6sVsFRreNNZDeI3zp0S
         cyXmpU6lzk5CIxSutWyZDW4c9ZTmUR+sRCElTrmT3pvO/t7qfntDu7o2JW+Im4555nDz
         5Qfw==
X-Gm-Message-State: AOAM5301Rir+0dSWtxkE/2/5P99JocDOQ5Y/3BX1yc5g7Nc+IpzVnzHN
        S7HrwULavHp4880TAzAi/3n4Tg==
X-Google-Smtp-Source: ABdhPJy0z3M+C4qNGSkl/wzIbsr9YTQzhHn6PpGnaIlMktg1GL6Wpz/pFaaBZIQGRBbYKpznrlu72Q==
X-Received: by 2002:a2e:bc06:: with SMTP id b6mr16096143ljf.342.1623096355401;
        Mon, 07 Jun 2021 13:05:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c14sm1149209lfh.257.2021.06.07.13.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 13:05:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dsi: add continuous clock support for 7nm PHY
Date:   Mon,  7 Jun 2021 23:05:54 +0300
Message-Id: <20210607200554.2146513-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:

 - Remove the need for a separate msm_dsi_phy_needs_hs_req_sel call
 - Fix setting continuous clock for a dual DSI case.

---
 drivers/gpu/drm/msm/dsi/dsi.h             |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
 7 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7abfeab08165..5be458c701d2 100644
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
@@ -173,6 +173,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
+bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 50eb4d1b8fdd..9762af6035e9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -510,6 +510,7 @@ static inline uint32_t DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
 #define DSI_LANE_STATUS_DLN0_DIRECTION				0x00010000
 
 #define REG_DSI_LANE_CTRL					0x000000a8
+#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
 #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
 
 #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 41e1d0f7ab6e..50be935edcad 100644
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
@@ -930,6 +930,10 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
 		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
+
+		if (msm_dsi_phy_set_continuous_clock(phy, enable))
+			lane_ctrl |= DSI_LANE_CTRL_HS_REQ_SEL_PHY;
+
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
 			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
 	}
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
index e138a0c16085..cc18ea2b244c 100644
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
+				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi1->phy);
 		if (ret) {
 			pr_err("%s: power on host1 failed, %d\n",
 							__func__, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ccbd19f7d9cf..f2a7ed1d8d4e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -851,6 +851,22 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
 }
 
+bool msm_dsi_phy_needs_hs_phy_sel(struct msm_dsi_phy *phy)
+{
+	if (!phy)
+		return false;
+	return phy->cfg->ops.set_continuous_clock != NULL;
+}
+
+/* Returns true if we have to enable DSI_LANE_CTRL.HS_REQ_SEL_PHY */
+bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
+{
+	if (!phy || !phy->cfg->ops.set_continuous_clock)
+		return false;
+
+	return phy->cfg->ops.set_continuous_clock(phy, enable);
+}
+
 int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
 {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac364d3..08e516d0dac4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
+	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..310b15653fa3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -930,6 +930,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	return 0;
 }
 
+static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
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
+
+	return enable;
+}
+
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->base;
@@ -970,6 +985,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -992,6 +1008,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.30.2

