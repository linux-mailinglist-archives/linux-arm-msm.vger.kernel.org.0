Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541BD26CF47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 01:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgIPXMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 19:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgIPXMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 19:12:20 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F47AC061352
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:17 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d9so4256pfd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vQWyqptY3/t5uPqktUODKCWGysxRPNVOB11hc4WNlKc=;
        b=STxRO58mTU27leQTS7nT+hlyd/f04pOIKX/Uhx0MTw/Q02kFkx7d+u72PUiLEBCfXc
         OQGEXyA/N2XVUpWADGnrCckt579iH3EOY7HdykHR+ptmfn+gZrqzrLwIJ5WnhWjI7fhM
         nRCW7CAaoNiWw2Dp7nELFrXZgLQ6pPRSoycao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQWyqptY3/t5uPqktUODKCWGysxRPNVOB11hc4WNlKc=;
        b=VgfKz++U2lxPXvRUjExkXJd8ZEB0wlM2KPm65iRIILUzMxFUXjS5UGyaOgaLM1fac+
         LlfwuCkWYcplhRYYSfhfwAAUULfVt2qv2cQZb2dpQTnzwoU3p7IQY8HnyD+FO6QvawHp
         reFNGTtgbjbH9ZK/cD0GuMcCy2NCVZ8eCQB5xJxxc7oFaXfNT173R3qYUxUGgh4t90E/
         q9FcOU3uhwDC2lBb1ZTZPQAsvCkz7f2wHLqKu/a9GPRXkZqIfk1MebqCcpxPAe3vzz0u
         WJXHvKEBxvp3Pzl/72bLoQurChX6lYI+tdj7nZrWP7SOQ4PZ25OeXDY8fQ+1jgCbmW5k
         wplA==
X-Gm-Message-State: AOAM531NbQTcaqBHcTe/rSaUekuNzbUC/9M+Hf+R8FAUAWose2bNQyrE
        jOM0iB36xnQkIqBNc4z3eNqtIQ==
X-Google-Smtp-Source: ABdhPJxjx40yLeOpBHOO+BFgq9RMyS1TCtI+WYrdZ/2zeTVWXQtrqEPc/wsOCfOPlHWk8idADDYxOw==
X-Received: by 2002:aa7:9986:0:b029:142:2501:39db with SMTP id k6-20020aa799860000b0290142250139dbmr8380668pfh.42.1600297936665;
        Wed, 16 Sep 2020 16:12:16 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u6sm3643254pjy.37.2020.09.16.16.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 16:12:16 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v4 10/10] drm/msm/dp: Use qmp phy for DP PLL and PHY
Date:   Wed, 16 Sep 2020 16:12:02 -0700
Message-Id: <20200916231202.3637932-11-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200916231202.3637932-1-swboyd@chromium.org>
References: <20200916231202.3637932-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the necessary changes to the DP driver to use the qmp phy from the
common phy framework instead of rolling our own in the drm subsystem.
This also removes the PLL code and adds proper includes so things build.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/Makefile            |   4 +-
 drivers/gpu/drm/msm/dp/dp_aux.c         |   7 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c     | 287 +-------
 drivers/gpu/drm/msm/dp/dp_catalog.h     |   9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c        |  48 +-
 drivers/gpu/drm/msm/dp/dp_display.c     |  17 -
 drivers/gpu/drm/msm/dp/dp_display.h     |   3 -
 drivers/gpu/drm/msm/dp/dp_link.c        |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c       |   1 +
 drivers/gpu/drm/msm/dp/dp_parser.c      |  12 +-
 drivers/gpu/drm/msm/dp/dp_parser.h      |  12 +-
 drivers/gpu/drm/msm/dp/dp_pll.c         |  99 ---
 drivers/gpu/drm/msm/dp/dp_pll.h         |  61 --
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c    | 930 ------------------------
 drivers/gpu/drm/msm/dp/dp_pll_private.h |  89 ---
 drivers/gpu/drm/msm/dp/dp_power.c       |  39 +-
 drivers/gpu/drm/msm/dp/dp_power.h       |   9 -
 drivers/gpu/drm/msm/dp/dp_reg.h         | 213 ------
 18 files changed, 79 insertions(+), 1763 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 6d31188cc776..af868e791210 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -109,9 +109,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_parser.o \
-	dp/dp_power.o \
-	dp/dp_pll.o \
-	dp/dp_pll_10nm.o
+	dp/dp_power.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index ff38bd140b32..19045b109a32 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_aux.h"
@@ -380,8 +381,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % retry_count))
-				dp_catalog_aux_update_cfg(aux->catalog,
-					PHY_AUX_CFG1);
+				dp_catalog_aux_update_cfg(aux->catalog);
 			dp_catalog_aux_reset(aux->catalog);
 		}
 		usleep_range(400, 500); /* at least 400us to next try */
@@ -438,7 +438,7 @@ void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_update_cfg(aux->catalog, PHY_AUX_CFG1);
+	dp_catalog_aux_update_cfg(aux->catalog);
 	dp_catalog_aux_reset(aux->catalog);
 }
 
@@ -453,7 +453,6 @@ void dp_aux_init(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_setup(aux->catalog);
 	dp_catalog_aux_enable(aux->catalog, true);
 	aux->retry_cnt = 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 67abb90953e4..39d38e1bfabd 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -8,8 +8,11 @@
 #include <linux/rational.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
 #include <linux/rational.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
 
 #include "dp_catalog.h"
 #include "dp_reg.h"
@@ -52,41 +55,6 @@
 #define DP_INTERRUPT_STATUS2_MASK \
 	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
 
-static u8 const vm_pre_emphasis_hbr_rbr[4][4] = {
-	{0x00, 0x0C, 0x14, 0x19},
-	{0x00, 0x0B, 0x12, 0xFF},
-	{0x00, 0x0B, 0xFF, 0xFF},
-	{0x04, 0xFF, 0xFF, 0xFF}
-};
-
-static u8 const vm_voltage_swing_hbr_rbr[4][4] = {
-	{0x08, 0x0F, 0x16, 0x1F},
-	{0x11, 0x1E, 0x1F, 0xFF},
-	{0x19, 0x1F, 0xFF, 0xFF},
-	{0x1F, 0xFF, 0xFF, 0xFF}
-};
-
-/* AUX look-up-table configurations
- * Pair of offset and config values for each LUT
- */
-static u8 const aux_lut_offset[] = {
-	0x20, 0x24, 0x28, 0x2C, 0x30, 0x34, 0x38, 0x3C, 0x40, 0x44
-};
-
-static u8 const
-aux_lut_value[PHY_AUX_CFG_MAX][DP_AUX_CFG_MAX_VALUE_CNT] = {
-	{ 0x00, 0x00, 0x00, },
-	{ 0x13, 0x23, 0x1d, },
-	{ 0x24, 0x00, 0x00, },
-	{ 0x00, 0x00, 0x00, },
-	{ 0x0A, 0x00, 0x00, },
-	{ 0x26, 0x00, 0x00, },
-	{ 0x0A, 0x00, 0x00, },
-	{ 0x03, 0x00, 0x00, },
-	{ 0xBB, 0x00, 0x00, },
-	{ 0x03, 0x00, 0x00, }
-};
-
 struct dp_catalog_private {
 	struct device *dev;
 	struct dp_io *io;
@@ -128,83 +96,6 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	writel(data, catalog->io->dp_controller.base + offset);
 }
 
-static inline void dp_write_phy(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	offset += DP_PHY_REG_OFFSET;
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, catalog->io->phy_reg.base + offset);
-}
-
-static inline u32 dp_read_phy(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	offset += DP_PHY_REG_OFFSET;
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(catalog->io->phy_reg.base + offset);
-}
-
-static inline void dp_write_pll(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	offset += DP_PHY_PLL_OFFSET;
-	writel_relaxed(data, catalog->io->phy_reg.base + offset);
-}
-
-static inline void dp_write_ln_tx0(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	offset += DP_PHY_LN_TX0_OFFSET;
-	writel_relaxed(data, catalog->io->phy_reg.base + offset);
-}
-
-static inline void dp_write_ln_tx1(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	offset += DP_PHY_LN_TX1_OFFSET;
-	writel_relaxed(data, catalog->io->phy_reg.base + offset);
-}
-
-static inline u32 dp_read_ln_tx0(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	offset += DP_PHY_LN_TX0_OFFSET;
-	return readl_relaxed(catalog->io->phy_reg.base + offset);
-}
-
-static inline u32 dp_read_ln_tx1(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	offset += DP_PHY_LN_TX1_OFFSET;
-	return readl_relaxed(catalog->io->phy_reg.base + offset);
-}
-
-static inline void dp_write_usb_cm(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure usb reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, catalog->io->usb3_dp_com.base + offset);
-}
-
-static inline u32 dp_read_usb_cm(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure usb reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(catalog->io->usb3_dp_com.base + offset);
-}
-
 static inline void dp_write_p0(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
@@ -334,27 +225,14 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
 	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
-		enum dp_phy_aux_config_type type)
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	u32 new_index = 0, current_index = 0;
-
-	if (type >= PHY_AUX_CFG_MAX) {
-		DRM_ERROR("invalid input\n");
-		return;
-	}
-
-	current_index = catalog->aux_lut_cfg_index[type];
-	new_index = (current_index + 1) % DP_AUX_CFG_MAX_VALUE_CNT;
-	DRM_DEBUG_DP("Updating PHY_AUX_CFG%d from 0x%08x to 0x%08x\n",
-			type, aux_lut_value[type][current_index],
-			aux_lut_value[type][new_index]);
+	struct dp_io *dp_io = catalog->io;
+	struct phy *phy = dp_io->phy;
 
-	dp_write_phy(catalog, aux_lut_offset[type],
-			aux_lut_value[type][new_index]);
-	catalog->aux_lut_cfg_index[type] = new_index;
+	phy_calibrate(phy);
 }
 
 static void dump_regs(void __iomem *base, int len)
@@ -400,64 +278,6 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 	offset = MSM_DP_CONTROLLER_P0_OFFSET;
 	len = MSM_DP_CONTROLLER_P0_SIZE;
 	dump_regs(catalog->io->dp_controller.base + offset, len);
-
-	pr_info("USB3 DP COM regs\n");
-	dump_regs(catalog->io->usb3_dp_com.base, catalog->io->usb3_dp_com.len);
-
-	pr_info("LN TX0 regs\n");
-	dump_regs(catalog->io->phy_reg.base + DP_PHY_LN_TX0_OFFSET,
-						DP_PHY_LN_TX0_SIZE);
-
-	pr_info("LN TX1 regs\n");
-	dump_regs(catalog->io->phy_reg.base + DP_PHY_LN_TX1_OFFSET,
-						DP_PHY_LN_TX1_SIZE);
-
-	pr_info("DP PHY regs\n");
-	dump_regs(catalog->io->phy_reg.base + DP_PHY_REG_OFFSET,
-						DP_PHY_REG_SIZE);
-}
-
-void dp_catalog_aux_setup(struct dp_catalog *dp_catalog)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	int i = 0;
-
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
-		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
-		DP_PHY_PD_CTL_DP_CLAMP_EN);
-
-	/* Turn on BIAS current for PHY/PLL */
-	dp_write_pll(catalog,
-		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
-		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_L_EN |
-		QSERDES_COM_EN_SYSCLK_TX_SEL);
-
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PSR_PWRDN);
-
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
-		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN
-		| DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN
-		| DP_PHY_PD_CTL_DP_CLAMP_EN);
-
-	dp_write_pll(catalog,
-		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
-		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_R_EN |
-		QSERDES_COM_CLKBUF_L_EN | QSERDES_COM_EN_SYSCLK_TX_SEL |
-		QSERDES_COM_CLKBUF_RX_DRIVE_L);
-
-	/* DP AUX CFG register programming */
-	for (i = 0; i < PHY_AUX_CFG_MAX; i++) {
-		DRM_DEBUG_DP("PHY_AUX_CFG%ds: offset=0x%08x, value=0x%08x\n",
-			i, aux_lut_offset[i], aux_lut_value[i][0]);
-		dp_write_phy(catalog, aux_lut_offset[i],
-				     aux_lut_value[i][0]);
-	}
-
-	dp_write_phy(catalog, REG_DP_PHY_AUX_INTERRUPT_MASK,
-			PHY_AUX_STOP_ERR_MASK |	PHY_AUX_DEC_ERR_MASK |
-			PHY_AUX_SYNC_ERR_MASK |	PHY_AUX_ALIGN_ERR_MASK |
-			PHY_AUX_REQ_ERR_MASK);
 }
 
 int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
@@ -584,7 +404,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					bool fixed_nvid)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, div, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
@@ -593,14 +413,11 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	div = dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);
-	div &= 0x03;
-
-	if (div == 0)
+	if (rate == link_rate_hbr3)
 		pixel_div = 6;
-	else if (div == 1)
+	else if (rate == 1620000 || rate == 270000)
 		pixel_div = 2;
-	else if (div == 2)
+	else if (rate == link_rate_hbr2)
 		pixel_div = 4;
 	else
 		DRM_ERROR("Invalid pixel mux divider\n");
@@ -666,36 +483,6 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	return 0;
 }
 
-void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	u32 typec_ctrl;
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL,
-			USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET_MUX |
-			USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET_MUX);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_PHY_MODE_CTRL,
-						USB3_DP_COM_PHY_MODE_DP);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET,
-						USB3_DP_COM_SW_RESET_SET);
-
-	/* Default configuration i.e CC1 */
-	typec_ctrl = USB3_DP_COM_TYPEC_CTRL_PORTSEL_MUX;
-	if (flip)
-		typec_ctrl |= USB3_DP_COM_TYPEC_CTRL_PORTSEL;
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_TYPEC_CTRL, typec_ctrl);
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SWI_CTRL, 0x00);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET, 0x00);
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_POWER_DOWN_CTRL,
-					USB3_DP_COM_POWER_DOWN_CTRL_SW_PWRDN);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL, 0x00);
-
-}
-
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
 {
 	u32 sw_reset;
@@ -819,58 +606,26 @@ void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	dp_write_ahb(catalog, REG_DP_PHY_CTRL,
-			DP_PHY_CTRL_SW_RESET_PLL | DP_PHY_CTRL_SW_RESET);
+			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
-void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog,
-		bool flipped, u8 ln_cnt)
-{
-	u32 info;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	u8 orientation = BIT(!!flipped);
-
-	info = ln_cnt & DP_PHY_SPARE0_MASK;
-	info |= (orientation & DP_PHY_SPARE0_MASK)
-			<< DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT;
-	DRM_DEBUG_DP("Shared Info = 0x%x\n", info);
-
-	dp_write_phy(catalog, REG_DP_PHY_SPARE0, info);
-}
-
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
 		u8 v_level, u8 p_level)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	u8 voltage_swing_cfg, pre_emphasis_cfg;
-
-	DRM_DEBUG_DP("hw: v=%d p=%d\n", v_level, p_level);
-
-	voltage_swing_cfg = vm_voltage_swing_hbr_rbr[v_level][p_level];
-	pre_emphasis_cfg = vm_pre_emphasis_hbr_rbr[v_level][p_level];
-
-	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF) {
-		DRM_ERROR("invalid vx (0x%x=0x%x), px (0x%x=0x%x\n",
-			v_level, voltage_swing_cfg, p_level, pre_emphasis_cfg);
-		return -EINVAL;
-	}
+	struct dp_io *dp_io = catalog->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
-	/* Enable MUX to use Cursor values from these registers */
-	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
-	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
-
-	/* Configure host and panel only if both values are allowed */
-	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
-	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
-	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
-					pre_emphasis_cfg);
-	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
-					pre_emphasis_cfg);
-	DRM_DEBUG_DP("hw: vx_value=0x%x px_value=0x%x\n",
-			voltage_swing_cfg, pre_emphasis_cfg);
+	/* TODO: Update for all lanes instead of just first one */
+	opts_dp->voltage[0] = v_level;
+	opts_dp->pre[0] = p_level;
+	opts_dp->set_voltages = 1;
+	phy_configure(phy, &dp_io->phy_opts);
+	opts_dp->set_voltages = 0;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 35c90b248b5d..cf7c0edb3ae0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -6,6 +6,8 @@
 #ifndef _DP_CATALOG_H_
 #define _DP_CATALOG_H_
 
+#include <drm/drm_modes.h>
+
 #include "dp_parser.h"
 
 /* interrupts */
@@ -58,9 +60,7 @@ int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
-			enum dp_phy_aux_config_type type);
-void dp_catalog_aux_setup(struct dp_catalog *dp_catalog);
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
@@ -73,7 +73,6 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
 int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
@@ -81,8 +80,6 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog, bool flipped,
-				u8 lane_cnt);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
 				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 70b0e06953f6..2e3e1917351f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -8,8 +8,11 @@
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_ctrl.h"
@@ -1302,7 +1305,7 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 }
 
 static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
-			enum dp_pm_type module, char *name, u32 rate)
+			enum dp_pm_type module, char *name, unsigned long rate)
 {
 	u32 num = ctrl->parser->mp[module].num_clk;
 	struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
@@ -1312,23 +1315,29 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 		cfg++;
 	}
 
-	DRM_DEBUG_DP("setting rate=%d on clk=%s\n", rate, name);
+	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
 
 	if (num)
 		cfg->rate = rate;
 	else
-		DRM_ERROR("%s clock doesn't exit to set rate %d\n",
+		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
 				name, rate);
 }
 
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
+	struct dp_io *dp_io = &ctrl->parser->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
-	dp_power_set_link_clk_parent(ctrl->power);
-
+	opts_dp->lanes = ctrl->link->link_params.num_lanes;
+	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
 	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
-					ctrl->link->link_params.rate);
+					ctrl->link->link_params.rate * 1000);
+
+	phy_configure(phy, &dp_io->phy_opts);
+	phy_power_on(phy);
 
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
 	if (ret)
@@ -1345,7 +1354,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	int ret = 0;
 
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
-					ctrl->dp_ctrl.pixel_rate);
+					ctrl->dp_ctrl.pixel_rate * 1000);
 
 	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
 	if (ret)
@@ -1360,6 +1369,8 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
@@ -1367,11 +1378,13 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	ctrl->dp_ctrl.orientation = flip;
 
-	dp_catalog_ctrl_usb_reset(ctrl->catalog, flip);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	phy_init(phy);
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
 
 	return 0;
@@ -1420,10 +1433,13 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
+	struct dp_io *dp_io = &ctrl->parser->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
-	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
-		ctrl->dp_ctrl.orientation, ctrl->link->link_params.num_lanes);
+	opts_dp->lanes = ctrl->link->link_params.num_lanes;
+	phy_configure(phy, &dp_io->phy_opts);
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
@@ -1434,6 +1450,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
 		return ret;
 	}
+	phy_power_off(phy);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -1622,10 +1639,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
-	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
-			ctrl->dp_ctrl.orientation,
-			ctrl->link->link_params.num_lanes);
-
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
@@ -1763,12 +1776,16 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 	int ret = 0;
 
 	if (!dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -1783,6 +1800,9 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
 
+	phy_power_off(phy);
+	phy_exit(phy);
+
 	DRM_DEBUG_DP("DP off done\n");
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d584d415ad6e..c6296e02c06f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -24,7 +24,6 @@
 #include "dp_ctrl.h"
 #include "dp_display.h"
 #include "dp_drm.h"
-#include "dp_pll.h"
 
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
@@ -84,7 +83,6 @@ struct dp_display_private {
 
 	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
-	struct msm_dp_pll *pll;
 	struct dp_power   *power;
 	struct dp_catalog *catalog;
 	struct drm_dp_aux *aux;
@@ -604,7 +602,6 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 	dp_ctrl_put(dp->ctrl);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
-	dp_pll_put(dp->pll);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
@@ -615,9 +612,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
-	struct dp_pll_in pll_in = {
-		.pdev = dp->pdev,
-	};
 
 	/* Callback APIs used for cable status change event */
 	cb->configure  = dp_display_usbpd_configure_cb;
@@ -648,17 +642,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	pll_in.parser = dp->parser;
-	dp->pll = dp_pll_get(&pll_in);
-	if (IS_ERR_OR_NULL(dp->pll)) {
-		rc = -EINVAL;
-		DRM_ERROR("failed to initialize pll, rc = %d\n", rc);
-		dp->pll = NULL;
-		goto error;
-	}
-
-	dp->parser->pll = dp->pll;
-
 	dp->power = dp_power_get(dp->parser);
 	if (IS_ERR(dp->power)) {
 		rc = PTR_ERR(dp->power);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2f2d1279dfc6..11a02a2b9eb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,7 +24,4 @@ int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 
-void __init msm_dp_pll_driver_register(void);
-void __exit msm_dp_pll_driver_unregister(void);
-
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 3cbae92deff0..6ae1908ffd3d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
+#include <drm/drm_print.h>
+
 #include "dp_link.h"
 #include "dp_panel.h"
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7cdf37c525d8..4fc49005314d 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 struct dp_panel_private {
 	struct device *dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 255a800535d5..0519dd3ac3c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/of_gpio.h>
+#include <linux/phy/phy.h>
+
+#include <drm/drm_print.h>
 
 #include "dp_parser.h"
 #include "dp_reg.h"
@@ -53,8 +56,6 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 	struct dp_io *io = &parser->io;
 
 	msm_dss_iounmap(&io->dp_controller);
-	msm_dss_iounmap(&io->phy_reg);
-	msm_dss_iounmap(&io->usb3_dp_com);
 }
 
 static int dp_parser_ctrl_res(struct dp_parser *parser)
@@ -69,6 +70,12 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		goto err;
 	}
 
+	io->phy = devm_phy_get(&pdev->dev, "dp");
+	if (IS_ERR(io->phy)) {
+		rc = PTR_ERR(io->phy);
+		goto err;
+	}
+
 	return 0;
 err:
 	dp_parser_unmap_io_resources(parser);
@@ -90,7 +97,6 @@ static int dp_parser_misc(struct dp_parser *parser)
 	}
 
 	parser->max_dp_lanes = len;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 841e776124c4..34b49628bbaf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -7,10 +7,11 @@
 #define _DP_PARSER_H_
 
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
 
 #include "dpu_io_util.h"
 #include "msm_drv.h"
-#include "dp_pll.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
 #define DP_MAX_PIXEL_CLK_KHZ	675000
@@ -62,15 +63,11 @@ struct dp_display_data {
  *
  * @dp_controller: Display Port controller mapped memory address
  * @phy_io: phy's mapped memory address
- * @ln_tx0_io: USB-DP lane TX0's mapped memory address
- * @ln_tx1_io: USB-DP lane TX1's mapped memory address
- * @dp_pll_io: DP PLL mapped memory address
- * @usb3_dp_com: USB3 DP PHY combo mapped memory address
  */
 struct dp_io {
 	struct dss_io_data dp_controller;
-	struct dss_io_data phy_reg;
-	struct dss_io_data usb3_dp_com;
+	struct phy *phy;
+	union phy_configure_opts phy_opts;
 };
 
 /**
@@ -117,7 +114,6 @@ struct dp_parser {
 	struct dp_pinctrl pinctrl;
 	struct dp_io io;
 	struct dp_display_data disp_data;
-	struct msm_dp_pll *pll;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_pll.c b/drivers/gpu/drm/msm/dp/dp_pll.c
deleted file mode 100644
index 53f82cd97027..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_pll.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/device.h>
-
-#include "dp_parser.h"
-#include "dp_pll.h"
-#include "dp_pll_private.h"
-
-static int dp_pll_get_phy_io(struct dp_parser *parser)
-{
-	struct dp_io *io = &parser->io;
-
-	io->usb3_dp_com.base = ioremap(REG_USB3_DP_COM_REGION_BASE,
-					REG_USB3_DP_COM_REGION_SIZE);
-	if (!io->usb3_dp_com.base) {
-		DRM_ERROR("unable to map USB3 DP COM IO\n");
-		return -EIO;
-	}
-
-	/* ToDo(user): DP PLL and DP PHY will not be part of
-	 * DP driver eventually so for now Hardcode Base and offsets
-	 * of PHY registers so we can remove them from dts and bindings
-	 */
-	io->phy_reg.base = ioremap(REG_DP_PHY_REGION_BASE,
-					REG_DP_PHY_REGION_SIZE);
-	if (!io->phy_reg.base) {
-		DRM_ERROR("DP PHY io region mapping failed\n");
-		return -EIO;
-	}
-	io->phy_reg.len = REG_DP_PHY_REGION_SIZE;
-
-	return 0;
-}
-
-static int msm_dp_pll_init(struct msm_dp_pll *pll,
-			enum msm_dp_pll_type type, int id)
-{
-	struct device *dev = &pll->pdev->dev;
-	int ret = 0;
-
-	switch (type) {
-	case MSM_DP_PLL_10NM:
-		ret = msm_dp_pll_10nm_init(pll, id);
-		break;
-	default:
-		DRM_DEV_ERROR(dev, "%s: Wrong PLL type %d\n", __func__, type);
-		return -ENXIO;
-	}
-
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: failed to init DP PLL\n", __func__);
-		return ret;
-	}
-
-	pll->type = type;
-
-	DRM_DEBUG_DP("DP:%d PLL registered", id);
-
-	return ret;
-}
-
-struct msm_dp_pll *dp_pll_get(struct dp_pll_in *pll_in)
-{
-	struct msm_dp_pll *dp_pll;
-	struct dp_parser *parser = pll_in->parser;
-	struct dp_io_pll *pll_io;
-	int ret;
-
-	dp_pll = devm_kzalloc(&pll_in->pdev->dev, sizeof(*dp_pll), GFP_KERNEL);
-	if (!dp_pll)
-		return ERR_PTR(-ENOMEM);
-
-	pll_io = &dp_pll->pll_io;
-	dp_pll->pdev = pll_in->pdev;
-
-	dp_pll_get_phy_io(parser);
-
-	pll_io->pll_base = parser->io.phy_reg.base + DP_PHY_PLL_OFFSET;
-	pll_io->phy_base = parser->io.phy_reg.base + DP_PHY_REG_OFFSET;
-	pll_io->ln_tx0_base = parser->io.phy_reg.base + DP_PHY_LN_TX0_OFFSET;
-	pll_io->ln_tx1_base = parser->io.phy_reg.base + DP_PHY_LN_TX1_OFFSET;
-
-	ret = msm_dp_pll_init(dp_pll, MSM_DP_PLL_10NM, 0);
-	if (ret) {
-		kfree(dp_pll);
-		return ERR_PTR(ret);
-	}
-
-	return dp_pll;
-}
-
-void dp_pll_put(struct msm_dp_pll *dp_pll)
-{
-	if (dp_pll->type == MSM_DP_PLL_10NM)
-		msm_dp_pll_10nm_deinit(dp_pll);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_pll.h b/drivers/gpu/drm/msm/dp/dp_pll.h
deleted file mode 100644
index 5a10c8f3cfea..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_pll.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DP_PLL_H
-#define __DP_PLL_H
-
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-
-#include "dpu_io_util.h"
-#include "msm_drv.h"
-#include "dp_parser.h"
-
-#define PLL_REG_W(base, offset, data)	\
-				writel((data), (base) + (offset))
-#define PLL_REG_R(base, offset)	readl((base) + (offset))
-
-enum msm_dp_pll_type {
-	MSM_DP_PLL_10NM,
-	MSM_DP_PLL_MAX
-};
-
-struct dp_pll_in {
-	struct platform_device *pdev;
-	struct dp_parser *parser;
-};
-
-struct dp_io_pll {
-	void __iomem *pll_base;
-	void __iomem *phy_base;
-	void __iomem *ln_tx0_base;
-	void __iomem *ln_tx1_base;
-};
-
-struct msm_dp_pll {
-	enum msm_dp_pll_type type;
-	bool		pll_on;
-
-	struct dp_io_pll pll_io;
-
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
-	struct platform_device *pdev;
-	void *priv;
-
-	/* Pll specific resources like GPIO, power supply, clocks, etc*/
-	struct dss_module_power mp;
-	int (*get_provider)(struct msm_dp_pll *pll,
-			struct clk **link_clk_provider,
-			struct clk **pixel_clk_provider);
-};
-
-struct msm_dp_pll *dp_pll_get(struct dp_pll_in *pll_in);
-
-void dp_pll_put(struct msm_dp_pll *dp_pll);
-
-#endif /* __DP_PLL_H */
diff --git a/drivers/gpu/drm/msm/dp/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
deleted file mode 100644
index a2bf2fc24d6a..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
+++ /dev/null
@@ -1,930 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-/*
- * Display Port PLL driver block diagram for branch clocks
- *
- *              +------------------------------+
- *              |         DP_VCO_CLK           |
- *              |                              |
- *              |    +-------------------+     |
- *              |    |   (DP PLL/VCO)    |     |
- *              |    +---------+---------+     |
- *              |              v               |
- *              |   +----------+-----------+   |
- *              |   | hsclk_divsel_clk_src |   |
- *              |   +----------+-----------+   |
- *              +------------------------------+
- *                              |
- *          +---------<---------v------------>----------+
- *          |                                           |
- * +--------v---------+                                 |
- * |    dp_phy_pll    |                                 |
- * |     link_clk     |                                 |
- * +--------+---------+                                 |
- *          |                                           |
- *          |                                           |
- *          v                                           v
- * Input to DISPCC block                                |
- * for link clk, crypto clk                             |
- * and interface clock                                  |
- *                                                      |
- *                                                      |
- *      +--------<------------+-----------------+---<---+
- *      |                     |                 |
- * +----v---------+  +--------v-----+  +--------v------+
- * | vco_divided  |  | vco_divided  |  | vco_divided   |
- * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
- * |              |  |              |  |               |
- * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
- * +-------+------+  +-----+--------+  +--------+------+
- *         |                 |                  |
- *         v---->----------v-------------<------v
- *                         |
- *              +----------+---------+
- *              |   dp_phy_pll_vco   |
- *              |       div_clk      |
- *              +---------+----------+
- *                        |
- *                        v
- *              Input to DISPCC block
- *              for DP pixel clock
- *
- */
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/regmap.h>
-#include <linux/iopoll.h>
-
-#include "dp_hpd.h"
-#include "dp_pll.h"
-#include "dp_pll_private.h"
-
-#define NUM_PROVIDED_CLKS		2
-
-#define DP_LINK_CLK_SRC			0
-#define DP_PIXEL_CLK_SRC		1
-
-
-static int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate);
-
-static unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
-				unsigned long parent_rate);
-
-static long dp_vco_round_rate_10nm(struct clk_hw *hw,
-				unsigned long rate, unsigned long *parent_rate);
-
-static int dp_vco_prepare_10nm(struct clk_hw *hw);
-static void dp_vco_unprepare_10nm(struct clk_hw *hw);
-
-static struct dp_pll_db *dp_pdb;
-
-static const struct clk_ops dp_10nm_vco_clk_ops = {
-	.recalc_rate = dp_vco_recalc_rate_10nm,
-	.set_rate = dp_vco_set_rate_10nm,
-	.round_rate = dp_vco_round_rate_10nm,
-	.prepare = dp_vco_prepare_10nm,
-	.unprepare = dp_vco_unprepare_10nm,
-};
-
-struct dp_pll_10nm_pclksel {
-	struct clk_hw hw;
-
-	/* divider params */
-	u8 shift;
-	u8 width;
-	u8 flags; /* same flags as used by clk_divider struct */
-
-	struct dp_pll_db *pll;
-};
-
-#define to_pll_10nm_pclksel(_hw) \
-	container_of(_hw, struct dp_pll_10nm_pclksel, hw)
-
-static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
-};
-
-static struct dp_pll_vco_clk dp_vco_clk = {
-	.min_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000,
-	.max_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000,
-};
-
-static int dp_pll_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
-{
-	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
-	struct dp_pll_db *dp_res = pclksel->pll;
-	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
-	u32 auxclk_div;
-
-	auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
-	auxclk_div &= ~0x03;
-
-	if (val == 0)
-		auxclk_div |= 1;
-	else if (val == 1)
-		auxclk_div |= 2;
-	else if (val == 2)
-		auxclk_div |= 0;
-
-	PLL_REG_W(pll_io->phy_base,
-			REG_DP_PHY_VCO_DIV, auxclk_div);
-	DRM_DEBUG_DP("%s: mux=%d auxclk_div=%x\n", __func__, val, auxclk_div);
-
-	return 0;
-}
-
-static u8 dp_pll_mux_get_parent_10nm(struct clk_hw *hw)
-{
-	u32 auxclk_div = 0;
-	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
-	struct dp_pll_db *dp_res = pclksel->pll;
-	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
-	u8 val = 0;
-
-	auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
-	auxclk_div &= 0x03;
-
-	if (auxclk_div == 1) /* Default divider */
-		val = 0;
-	else if (auxclk_div == 2)
-		val = 1;
-	else if (auxclk_div == 0)
-		val = 2;
-
-	DRM_DEBUG_DP("%s: auxclk_div=%d, val=%d\n", __func__, auxclk_div, val);
-
-	return val;
-}
-
-static int dp_pll_clk_mux_determine_rate(struct clk_hw *hw,
-				     struct clk_rate_request *req)
-{
-	unsigned long rate = 0;
-
-	rate = clk_get_rate(hw->clk);
-
-	if (rate <= 0) {
-		DRM_ERROR("Rate is not set properly\n");
-		return -EINVAL;
-	}
-
-	req->rate = rate;
-
-	DRM_DEBUG_DP("%s: rate=%ld\n", __func__, req->rate);
-	return 0;
-}
-
-static unsigned long dp_pll_mux_recalc_rate(struct clk_hw *hw,
-					unsigned long parent_rate)
-{
-	struct clk_hw *div_clk_hw = NULL, *vco_clk_hw = NULL;
-	struct dp_pll_vco_clk *vco;
-
-	div_clk_hw = clk_hw_get_parent(hw);
-	if (!div_clk_hw)
-		return 0;
-
-	vco_clk_hw = clk_hw_get_parent(div_clk_hw);
-	if (!vco_clk_hw)
-		return 0;
-
-	vco = to_dp_vco_hw(vco_clk_hw);
-	if (!vco)
-		return 0;
-
-	if (vco->rate == DP_VCO_HSCLK_RATE_8100MHZDIV1000)
-		return (vco->rate / 6);
-	else if (vco->rate == DP_VCO_HSCLK_RATE_5400MHZDIV1000)
-		return (vco->rate / 4);
-	else
-		return (vco->rate / 2);
-}
-
-static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
-				     struct clk **link_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct clk_hw_onecell_data *hw_data = pll->hw_data;
-
-	if (link_clk_provider)
-		*link_clk_provider = hw_data->hws[DP_LINK_CLK_SRC]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DP_PIXEL_CLK_SRC]->clk;
-
-	return 0;
-}
-
-static const struct clk_ops dp_10nm_pclksel_clk_ops = {
-	.get_parent = dp_pll_mux_get_parent_10nm,
-	.set_parent = dp_pll_mux_set_parent_10nm,
-	.recalc_rate = dp_pll_mux_recalc_rate,
-	.determine_rate = dp_pll_clk_mux_determine_rate,
-};
-
-static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_db *pll_10nm)
-{
-	struct device *dev = &pll_10nm->pdev->dev;
-	struct dp_pll_10nm_pclksel *pll_pclksel;
-	struct clk_init_data pclksel_init = {
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 3,
-		.name = "dp_phy_pll_vco_div_clk",
-		.ops = &dp_10nm_pclksel_clk_ops,
-	};
-	int ret;
-
-	pll_pclksel = devm_kzalloc(dev, sizeof(*pll_pclksel), GFP_KERNEL);
-	if (!pll_pclksel)
-		return ERR_PTR(-ENOMEM);
-
-	pll_pclksel->pll = pll_10nm;
-	pll_pclksel->shift = 0;
-	pll_pclksel->width = 4;
-	pll_pclksel->hw.init = &pclksel_init;
-
-	ret = clk_hw_register(dev, &pll_pclksel->hw);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &pll_pclksel->hw;
-}
-
-static void dp_pll_10nm_unregister(struct dp_pll_db *pll_10nm)
-{
-	int i = 0;
-	struct clk_hw **hws;
-
-	hws = pll_10nm->hws;
-
-	for (i = 0; i < pll_10nm->num_hws; i++) {
-		if (pll_10nm->fixed_factor_clk[i] == true)
-			clk_hw_unregister_fixed_factor(hws[i]);
-		else
-			clk_hw_unregister(hws[i]);
-	}
-}
-
-static int dp_pll_10nm_register(struct dp_pll_db *pll_10nm)
-{
-	struct clk_hw_onecell_data *hw_data;
-	int ret = 0;
-	struct clk_hw *hw;
-
-	struct msm_dp_pll *pll = pll_10nm->base;
-	struct device *dev = &pll_10nm->pdev->dev;
-	struct clk_hw **hws = pll_10nm->hws;
-	int num = 0;
-
-	struct clk_init_data vco_init = {
-		.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
-		},
-		.num_parents = 1,
-		.name = "dp_vco_clk",
-		.ops = &dp_10nm_vco_clk_ops,
-	};
-
-	if (!dev) {
-		DRM_ERROR("DP dev node not available\n");
-		return 0;
-	}
-
-	DRM_DEBUG_DP("DP->id = %d", pll_10nm->id);
-
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
-	dp_vco_clk.hw.init = &vco_init;
-	ret = clk_hw_register(dev, &dp_vco_clk.hw);
-	if (ret)
-		return ret;
-	hws[num++] = &dp_vco_clk.hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_phy_pll_link_clk",
-				"dp_vco_clk", CLK_SET_RATE_PARENT, 1, 10);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	pll_10nm->fixed_factor_clk[num] = true;
-	hws[num++] = hw;
-	hw_data->hws[DP_LINK_CLK_SRC] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_two_clk_src",
-					"dp_vco_clk",  0, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	pll_10nm->fixed_factor_clk[num] = true;
-	hws[num++] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_four_clk_src",
-					 "dp_vco_clk", 0, 1, 4);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	pll_10nm->fixed_factor_clk[num] = true;
-	hws[num++] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_six_clk_src",
-					 "dp_vco_clk", 0, 1, 6);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	pll_10nm->fixed_factor_clk[num] = true;
-	hws[num++] = hw;
-
-	hw = dp_pll_10nm_pixel_clk_sel(pll_10nm);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	hws[num++] = hw;
-	hw_data->hws[DP_PIXEL_CLK_SRC] = hw;
-
-	pll_10nm->num_hws = num;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll->hw_data = hw_data;
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-				     pll->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n",
-				ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-void msm_dp_pll_10nm_deinit(struct msm_dp_pll *pll)
-{
-	dp_pll_10nm_unregister(pll->priv);
-}
-
-int msm_dp_pll_10nm_init(struct msm_dp_pll *pll, int id)
-{
-	struct dp_pll_db *dp_10nm_pll;
-	struct platform_device *pdev = pll->pdev;
-	int ret;
-
-	dp_10nm_pll = devm_kzalloc(&pdev->dev,
-					sizeof(*dp_10nm_pll), GFP_KERNEL);
-	if (!dp_10nm_pll)
-		return -ENOMEM;
-
-	DRM_DEBUG_DP("DP PLL%d", id);
-
-	dp_10nm_pll->base = pll;
-	dp_10nm_pll->pdev = pll->pdev;
-	dp_10nm_pll->id = id;
-	dp_pdb = dp_10nm_pll;
-	pll->priv = (void *)dp_10nm_pll;
-	dp_vco_clk.priv = pll;
-	dp_10nm_pll->index = 0;
-
-	ret = dp_pll_10nm_register(dp_10nm_pll);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ret;
-	}
-
-	pll->get_provider = dp_pll_10nm_get_provider;
-
-	return ret;
-}
-
-static int dp_vco_pll_init_db_10nm(struct msm_dp_pll *pll,
-		unsigned long rate)
-{
-	u32 spare_value = 0;
-	struct dp_io_pll *pll_io;
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	pll_io = &pll->pll_io;
-	spare_value = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_SPARE0);
-	dp_res->lane_cnt = spare_value & 0x0F;
-	dp_res->orientation = (spare_value & 0xF0) >> 4;
-
-	DRM_DEBUG_DP("%s: spare_value=0x%x, ln_cnt=0x%x, orientation=0x%x\n",
-			__func__, spare_value, dp_res->lane_cnt,
-			dp_res->orientation);
-
-	switch (rate) {
-	case DP_VCO_HSCLK_RATE_1620MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_9720MHZDIV1000);
-		dp_res->hsclk_sel = 0x0c;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x6f;
-		dp_res->lock_cmp2_mode0 = 0x08;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x1;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_2700MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_10800MHZDIV1000);
-		dp_res->hsclk_sel = 0x04;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x0f;
-		dp_res->lock_cmp2_mode0 = 0x0e;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x1;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_5400MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_10800MHZDIV1000);
-		dp_res->hsclk_sel = 0x00;
-		dp_res->dec_start_mode0 = 0x8c;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x00;
-		dp_res->div_frac_start3_mode0 = 0x0a;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x1f;
-		dp_res->lock_cmp2_mode0 = 0x1c;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x2;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_8100MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_8100MHZDIV1000);
-		dp_res->hsclk_sel = 0x03;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x2f;
-		dp_res->lock_cmp2_mode0 = 0x2a;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x0;
-		dp_res->lock_cmp_en = 0x08;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int dp_config_vco_rate_10nm(struct dp_pll_vco_clk *vco,
-		unsigned long rate)
-{
-	u32 res = 0;
-	struct msm_dp_pll *pll = vco->priv;
-	struct dp_io_pll *pll_io = &pll->pll_io;
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	res = dp_vco_pll_init_db_10nm(pll, rate);
-	if (res) {
-		DRM_ERROR("VCO Init DB failed\n");
-		return res;
-	}
-
-	if (dp_res->lane_cnt != 4) {
-		if (dp_res->orientation == ORIENTATION_CC2)
-			PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x6d);
-		else
-			PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x75);
-	} else {
-		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x7d);
-	}
-
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SVS_MODE_CLK_SEL, 0x01);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYS_CLK_CTRL, 0x02);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CLK_ENABLE1, 0x0e);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CLK_SEL, 0x30);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CMN_CONFIG, 0x02);
-
-	/* Different for each clock rates */
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_HSCLK_SEL, dp_res->hsclk_sel);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_DEC_START_MODE0, dp_res->dec_start_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_DIV_FRAC_START1_MODE0,
-		dp_res->div_frac_start1_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_DIV_FRAC_START2_MODE0,
-		dp_res->div_frac_start2_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_DIV_FRAC_START3_MODE0,
-		dp_res->div_frac_start3_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
-		dp_res->integloop_gain0_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
-		dp_res->integloop_gain1_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_VCO_TUNE_MAP, dp_res->vco_tune_map);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_LOCK_CMP1_MODE0, dp_res->lock_cmp1_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_LOCK_CMP2_MODE0, dp_res->lock_cmp2_mode0);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_LOCK_CMP3_MODE0, dp_res->lock_cmp3_mode0);
-
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_BG_TIMER, 0x0a);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CORECLK_DIV_MODE0, 0x0a);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_VCO_TUNE_CTRL, 0x00);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CORE_CLK_EN, 0x1f);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_IVCO, 0x07);
-	PLL_REG_W(pll_io->pll_base,
-		QSERDES_COM_LOCK_CMP_EN, dp_res->lock_cmp_en);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CP_CTRL_MODE0, 0x06);
-
-	if (dp_res->orientation == ORIENTATION_CC2)
-		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_MODE, 0x4c);
-	else
-		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_MODE, 0x5c);
-
-	/* TX Lane configuration */
-	PLL_REG_W(pll_io->phy_base,
-			REG_DP_PHY_TX0_TX1_LANE_CTL, 0x05);
-	PLL_REG_W(pll_io->phy_base,
-			REG_DP_PHY_TX2_TX3_LANE_CTL, 0x05);
-
-	/* TX-0 register configuration */
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
-	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_BAND, 0x4);
-
-	/* TX-1 register configuration */
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_TX_BAND, 0x4);
-
-	/* dependent on the vco frequency */
-	PLL_REG_W(pll_io->phy_base,
-			REG_DP_PHY_VCO_DIV, dp_res->phy_vco_div);
-
-	return res;
-}
-
-static bool dp_10nm_pll_lock_status(struct dp_pll_db *dp_res)
-{
-	u32 status;
-	bool pll_locked;
-	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
-
-	/* poll for PLL lock status */
-	if (readl_poll_timeout_atomic((pll_io->pll_base +
-			QSERDES_COM_C_READY_STATUS),
-			status,
-			((status & BIT(0)) > 0),
-			DP_PHY_PLL_POLL_SLEEP_US,
-			DP_PHY_PLL_POLL_TIMEOUT_US)) {
-		DRM_ERROR("%s: C_READY status is not high. Status=%x\n",
-				__func__, status);
-		pll_locked = false;
-	} else {
-		pll_locked = true;
-	}
-
-	return pll_locked;
-}
-
-static bool dp_10nm_phy_rdy_status(struct dp_pll_db *dp_res)
-{
-	u32 status;
-	bool phy_ready = true;
-	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
-
-	/* poll for PHY ready status */
-	if (readl_poll_timeout_atomic((pll_io->phy_base +
-			REG_DP_PHY_STATUS),
-			status,
-			((status & (BIT(1))) > 0),
-			DP_PHY_PLL_POLL_SLEEP_US,
-			DP_PHY_PLL_POLL_TIMEOUT_US)) {
-		DRM_ERROR("%s: Phy_ready is not high. Status=%x\n",
-				__func__, status);
-		phy_ready = false;
-	}
-
-	return phy_ready;
-}
-
-static int dp_pll_enable_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	u32 bias_en, drvr_en;
-	struct dp_io_pll *pll_io;
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	pll_io = &pll->pll_io;
-
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_AUX_CFG2, 0x04);
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x01);
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x05);
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x01);
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x09);
-
-	PLL_REG_W(pll_io->pll_base, QSERDES_COM_RESETSM_CNTRL, 0x20);
-
-	if (!dp_10nm_pll_lock_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x19);
-	/* poll for PHY ready status */
-	if (!dp_10nm_phy_rdy_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	DRM_DEBUG_DP("%s: PLL is locked\n", __func__);
-
-	if (dp_res->lane_cnt == 1) {
-		bias_en = 0x3e;
-		drvr_en = 0x13;
-	} else {
-		bias_en = 0x3f;
-		drvr_en = 0x10;
-	}
-
-	if (dp_res->lane_cnt != 4) {
-		if (dp_res->orientation == ORIENTATION_CC1) {
-			PLL_REG_W(pll_io->ln_tx1_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-			PLL_REG_W(pll_io->ln_tx1_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		} else {
-			PLL_REG_W(pll_io->ln_tx0_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-			PLL_REG_W(pll_io->ln_tx0_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		}
-	} else {
-		PLL_REG_W(pll_io->ln_tx0_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-		PLL_REG_W(pll_io->ln_tx0_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		PLL_REG_W(pll_io->ln_tx1_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-		PLL_REG_W(pll_io->ln_tx1_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-	}
-
-	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
-	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x18);
-	udelay(2000);
-
-	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x19);
-
-	/* poll for PHY ready status */
-	if (!dp_10nm_phy_rdy_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
-	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
-	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
-	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
-	PLL_REG_W(pll_io->ln_tx0_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
-	PLL_REG_W(pll_io->ln_tx1_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
-
-lock_err:
-	return rc;
-}
-
-static int dp_pll_disable_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
-
-	/* Assert DP PHY power down */
-	PLL_REG_W(pll->pll_io.phy_base, REG_DP_PHY_PD_CTL, 0x2);
-
-	return rc;
-}
-
-
-static int dp_vco_prepare_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	struct msm_dp_pll *pll = (struct msm_dp_pll *)vco->priv;
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	DRM_DEBUG_DP("%s: rate = %ld\n", __func__, vco->rate);
-	if ((dp_res->vco_cached_rate != 0)
-		&& (dp_res->vco_cached_rate == vco->rate)) {
-		rc = dp_vco_set_rate_10nm(hw,
-			dp_res->vco_cached_rate, dp_res->vco_cached_rate);
-		if (rc) {
-			DRM_ERROR("index=%d vco_set_rate failed. rc=%d\n",
-				rc, dp_res->index);
-			goto error;
-		}
-	}
-
-	rc = dp_pll_enable_10nm(hw);
-	if (rc) {
-		DRM_ERROR("ndx=%d failed to enable dp pll\n",
-					dp_res->index);
-		goto error;
-	}
-
-	pll->pll_on = true;
-error:
-	return rc;
-}
-
-static void dp_vco_unprepare_10nm(struct clk_hw *hw)
-{
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	if (!dp_res) {
-		DRM_ERROR("Invalid input parameter\n");
-		return;
-	}
-
-	if (!pll->pll_on) {
-		DRM_ERROR("pll resource can't be enabled\n");
-		return;
-	}
-	dp_res->vco_cached_rate = vco->rate;
-	dp_pll_disable_10nm(hw);
-
-	pll->pll_on = false;
-}
-
-static int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
-					unsigned long parent_rate)
-{
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	int rc;
-
-	DRM_DEBUG_DP("DP lane CLK rate=%ld\n", rate);
-
-	rc = dp_config_vco_rate_10nm(vco, rate);
-	if (rc)
-		DRM_ERROR("%s: Failed to set clk rate\n", __func__);
-
-	vco->rate = rate;
-
-	return 0;
-}
-
-static unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
-					unsigned long parent_rate)
-{
-	u32 div, hsclk_div, link_clk_div = 0;
-	u64 vco_rate;
-	struct dp_io_pll *pll_io;
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
-	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
-
-	pll_io = &pll->pll_io;
-
-	div = PLL_REG_R(pll_io->pll_base, QSERDES_COM_HSCLK_SEL);
-	div &= 0x0f;
-
-	if (div == 12)
-		hsclk_div = 6; /* Default */
-	else if (div == 4)
-		hsclk_div = 4;
-	else if (div == 0)
-		hsclk_div = 2;
-	else if (div == 3)
-		hsclk_div = 1;
-	else {
-		DRM_DEBUG_DP("unknown divider. forcing to default\n");
-		hsclk_div = 5;
-	}
-
-	div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_AUX_CFG2);
-	div >>= 2;
-
-	if ((div & 0x3) == 0)
-		link_clk_div = 5;
-	else if ((div & 0x3) == 1)
-		link_clk_div = 10;
-	else if ((div & 0x3) == 2)
-		link_clk_div = 20;
-	else
-		DRM_ERROR("%s: unsupported div. Phy_mode: %d\n", __func__, div);
-
-	if (link_clk_div == 20) {
-		vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-	} else {
-		if (hsclk_div == 6)
-			vco_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000;
-		else if (hsclk_div == 4)
-			vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-		else if (hsclk_div == 2)
-			vco_rate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
-		else
-			vco_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000;
-	}
-
-	DRM_DEBUG_DP("returning vco rate = %lu\n", (unsigned long)vco_rate);
-
-	dp_res->vco_cached_rate = vco->rate = vco_rate;
-	return (unsigned long)vco_rate;
-}
-
-long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
-{
-	unsigned long rrate = rate;
-	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
-
-	if (rate <= vco->min_rate)
-		rrate = vco->min_rate;
-	else if (rate <= DP_VCO_HSCLK_RATE_2700MHZDIV1000)
-		rrate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-	else if (rate <= DP_VCO_HSCLK_RATE_5400MHZDIV1000)
-		rrate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
-	else
-		rrate = vco->max_rate;
-
-	DRM_DEBUG_DP("%s: rrate=%ld\n", __func__, rrate);
-
-	*parent_rate = rrate;
-	return rrate;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h b/drivers/gpu/drm/msm/dp/dp_pll_private.h
deleted file mode 100644
index 434abdc396f5..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_pll_private.h
+++ /dev/null
@@ -1,89 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DP_PLL_10NM_H
-#define __DP_PLL_10NM_H
-
-#include "dp_pll.h"
-#include "dp_reg.h"
-
-#define DP_VCO_HSCLK_RATE_1620MHZDIV1000	1620000UL
-#define DP_VCO_HSCLK_RATE_2700MHZDIV1000	2700000UL
-#define DP_VCO_HSCLK_RATE_5400MHZDIV1000	5400000UL
-#define DP_VCO_HSCLK_RATE_8100MHZDIV1000	8100000UL
-
-#define NUM_DP_CLOCKS_MAX			6
-
-#define DP_PHY_PLL_POLL_SLEEP_US		500
-#define DP_PHY_PLL_POLL_TIMEOUT_US		10000
-
-#define DP_VCO_RATE_8100MHZDIV1000		8100000UL
-#define DP_VCO_RATE_9720MHZDIV1000		9720000UL
-#define DP_VCO_RATE_10800MHZDIV1000		10800000UL
-
-struct dp_pll_vco_clk {
-	struct clk_hw hw;
-	unsigned long	rate;		/* current vco rate */
-	u64		min_rate;	/* min vco rate */
-	u64		max_rate;	/* max vco rate */
-	void		*priv;
-};
-
-struct dp_pll_db {
-	struct msm_dp_pll *base;
-
-	int id;
-	struct platform_device *pdev;
-
-	/* private clocks: */
-	bool fixed_factor_clk[NUM_DP_CLOCKS_MAX];
-	struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
-	u32 num_hws;
-
-	/* lane and orientation settings */
-	u8 lane_cnt;
-	u8 orientation;
-
-	/* COM PHY settings */
-	u32 hsclk_sel;
-	u32 dec_start_mode0;
-	u32 div_frac_start1_mode0;
-	u32 div_frac_start2_mode0;
-	u32 div_frac_start3_mode0;
-	u32 integloop_gain0_mode0;
-	u32 integloop_gain1_mode0;
-	u32 vco_tune_map;
-	u32 lock_cmp1_mode0;
-	u32 lock_cmp2_mode0;
-	u32 lock_cmp3_mode0;
-	u32 lock_cmp_en;
-
-	/* PHY vco divider */
-	u32 phy_vco_div;
-	/*
-	 * Certain pll's needs to update the same vco rate after resume in
-	 * suspend/resume scenario. Cached the vco rate for such plls.
-	 */
-	unsigned long	vco_cached_rate;
-	u32		cached_cfg0;
-	u32		cached_cfg1;
-	u32		cached_outdiv;
-
-	uint32_t index;
-};
-
-static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
-{
-	return container_of(hw, struct dp_pll_vco_clk, hw);
-}
-
-#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
-
-#define to_dp_pll_db(x)	((struct dp_pll_db *)x->priv)
-
-int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
-void msm_dp_pll_10nm_deinit(struct msm_dp_pll *dp_pll);
-
-#endif /* __DP_PLL_10NM_H */
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 34fdb2e5d644..17c1fc6a2d44 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
 #include "dp_power.h"
+#include "msm_drv.h"
 
 struct dp_power_private {
 	struct dp_parser *parser;
@@ -102,16 +103,6 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	ctrl = &power->parser->mp[DP_CTRL_PM];
 	stream = &power->parser->mp[DP_STREAM_PM];
 
-	if (power->parser->pll && power->parser->pll->get_provider) {
-		rc = power->parser->pll->get_provider(power->parser->pll,
-			&power->link_provider, &power->pixel_provider);
-		if (rc) {
-			DRM_ERROR("%s:provider failed,don't set parent\n",
-								__func__);
-			return 0;
-		}
-	}
-
 	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
@@ -312,34 +303,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 }
 
-int dp_power_set_link_clk_parent(struct dp_power *dp_power)
-{
-	int rc = 0;
-	struct dp_power_private *power;
-	u32 num;
-	struct dss_clk *cfg;
-	char *name = "ctrl_link";
-
-	if (!dp_power) {
-		DRM_ERROR("invalid power data\n");
-		rc = -EINVAL;
-		goto exit;
-	}
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	num = power->parser->mp[DP_CTRL_PM].num_clk;
-	cfg = power->parser->mp[DP_CTRL_PM].clk_config;
-
-	while (num && strcmp(cfg->clk_name, name)) {
-		num--;
-		cfg++;
-	}
-
-exit:
-	return rc;
-}
-
 int dp_power_init(struct dp_power *dp_power, bool flip)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 5333a97d5c35..76743d755833 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -69,15 +69,6 @@ int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type);
 
 int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
 				bool enable);
-/**
- * dp_power_set_link_clk_parent() - configures parent of link clocks
- *
- * @power: instance of power module
- * return: 0 for success, error for failures
- *
- * This API will set the link clock parent source
- */
-int dp_power_set_link_clk_parent(struct dp_power *power);
 
 /**
  * dp_power_client_init() - initialize clock and regulator modules
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index de32f6204a50..43042ff90a19 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -6,22 +6,6 @@
 #ifndef _DP_REG_H_
 #define _DP_REG_H_
 
-/* DP PHY Register Regions */
-#define REG_DP_PHY_REGION_BASE			(0x088ea000)
-#define REG_DP_PHY_REGION_SIZE			(0x00000C00)
-
-#define REG_USB3_DP_COM_REGION_BASE		(0x088e8000)
-#define REG_USB3_DP_COM_REGION_SIZE		(0x00000020)
-
-#define DP_PHY_PLL_OFFSET			(0x00000000)
-#define DP_PHY_PLL_SIZE				(0x00000200)
-#define DP_PHY_REG_OFFSET			(0x00000A00)
-#define DP_PHY_REG_SIZE				(0x00000200)
-#define DP_PHY_LN_TX0_OFFSET			(0x00000200)
-#define DP_PHY_LN_TX0_SIZE			(0x00000200)
-#define DP_PHY_LN_TX1_OFFSET			(0x00000600)
-#define DP_PHY_LN_TX1_SIZE			(0x00000200)
-
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
 
@@ -290,183 +274,10 @@
 
 #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
 
-/*DP PHY Register offsets */
-#define REG_DP_PHY_REVISION_ID0                 (0x00000000)
-#define REG_DP_PHY_REVISION_ID1                 (0x00000004)
-#define REG_DP_PHY_REVISION_ID2                 (0x00000008)
-#define REG_DP_PHY_REVISION_ID3                 (0x0000000C)
-
-#define REG_DP_PHY_CFG                          (0x00000010)
-
-#define REG_DP_PHY_PD_CTL                       (0x00000018)
-#define DP_PHY_PD_CTL_PWRDN                     (0x00000001)
-#define DP_PHY_PD_CTL_PSR_PWRDN			(0x00000002)
-#define DP_PHY_PD_CTL_AUX_PWRDN			(0x00000004)
-#define DP_PHY_PD_CTL_LANE_0_1_PWRDN		(0x00000008)
-#define DP_PHY_PD_CTL_LANE_2_3_PWRDN		(0x00000010)
-#define DP_PHY_PD_CTL_PLL_PWRDN			(0x00000020)
-#define DP_PHY_PD_CTL_DP_CLAMP_EN		(0x00000040)
-
-#define REG_DP_PHY_MODE                         (0x0000001C)
-
-#define REG_DP_PHY_AUX_CFG0                     (0x00000020)
-#define REG_DP_PHY_AUX_CFG1                     (0x00000024)
-#define REG_DP_PHY_AUX_CFG2                     (0x00000028)
-#define REG_DP_PHY_AUX_CFG3                     (0x0000002C)
-#define REG_DP_PHY_AUX_CFG4                     (0x00000030)
-#define REG_DP_PHY_AUX_CFG5                     (0x00000034)
-#define REG_DP_PHY_AUX_CFG6                     (0x00000038)
-#define REG_DP_PHY_AUX_CFG7                     (0x0000003C)
-#define REG_DP_PHY_AUX_CFG8                     (0x00000040)
-#define REG_DP_PHY_AUX_CFG9                     (0x00000044)
-
-#define REG_DP_PHY_AUX_INTERRUPT_MASK           (0x00000048)
-#define PHY_AUX_STOP_ERR_MASK                   (0x00000001)
-#define PHY_AUX_DEC_ERR_MASK                    (0x00000002)
-#define PHY_AUX_SYNC_ERR_MASK                   (0x00000004)
-#define PHY_AUX_ALIGN_ERR_MASK                  (0x00000008)
-#define PHY_AUX_REQ_ERR_MASK                    (0x00000010)
-
-
 #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
 #define REG_DP_PHY_AUX_BIST_CFG			(0x00000050)
 #define REG_DP_PHY_AUX_INTERRUPT_STATUS         (0x000000BC)
 
-#define REG_DP_PHY_VCO_DIV			0x0064
-#define REG_DP_PHY_TX0_TX1_LANE_CTL		0x006C
-#define REG_DP_PHY_TX2_TX3_LANE_CTL		0x0088
-
-#define REG_DP_PHY_SPARE0			(0x00AC)
-#define DP_PHY_SPARE0_MASK			(0x000F)
-#define DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT	(0x0004)
-
-#define REG_DP_PHY_STATUS			(0x00C0)
-
-/* Tx registers */
-#define REG_DP_PHY_TXn_BIST_MODE_LANENO		0x0000
-#define REG_DP_PHY_TXn_CLKBUF_ENABLE		0x0008
-
-#define REG_DP_PHY_TXn_TX_EMP_POST1_LVL		0x000C
-#define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK	0x001F
-#define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN	0x0020
-
-#define REG_DP_PHY_TXn_TX_DRV_LVL		0x001C
-#define DP_PHY_TXn_TX_DRV_LVL_MASK		0x001F
-#define DP_PHY_TXn_TX_DRV_LVL_MUX_EN		0x0020
-
-#define REG_DP_PHY_TXn_RESET_TSYNC_EN		0x0024
-#define REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN	0x0028
-#define REG_DP_PHY_TXn_TX_BAND			0x002C
-#define REG_DP_PHY_TXn_SLEW_CNTL		0x0030
-#define REG_DP_PHY_TXn_INTERFACE_SELECT		0x0034
-
-#define REG_DP_PHY_TXn_RES_CODE_LANE_TX		0x003C
-#define REG_DP_PHY_TXn_RES_CODE_LANE_RX		0x0040
-#define REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX	0x0044
-#define REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX	0x0048
-
-#define REG_DP_PHY_TXn_DEBUG_BUS_SEL		0x0058
-#define REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN	0x005C
-#define REG_DP_PHY_TXn_HIGHZ_DRVR_EN		0x0060
-#define REG_DP_PHY_TXn_TX_POL_INV		0x0064
-#define REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN 0x0068
-
-#define REG_DP_PHY_TXn_LANE_MODE_1		0x008C
-
-#define REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN		0x00C0
-#define REG_DP_PHY_TXn_TX_INTERFACE_MODE	0x00C4
-
-#define REG_DP_PHY_TXn_VMODE_CTRL1		0x00F0
-
-/* PLL register offset */
-#define QSERDES_COM_ATB_SEL1			0x0000
-#define QSERDES_COM_ATB_SEL2			0x0004
-#define QSERDES_COM_FREQ_UPDATE			0x0008
-#define QSERDES_COM_BG_TIMER			0x000C
-#define QSERDES_COM_SSC_EN_CENTER		0x0010
-#define QSERDES_COM_SSC_ADJ_PER1		0x0014
-#define QSERDES_COM_SSC_ADJ_PER2		0x0018
-#define QSERDES_COM_SSC_PER1			0x001C
-#define QSERDES_COM_SSC_PER2			0x0020
-#define QSERDES_COM_SSC_STEP_SIZE1		0x0024
-#define QSERDES_COM_SSC_STEP_SIZE2		0x0028
-#define QSERDES_COM_POST_DIV			0x002C
-#define QSERDES_COM_POST_DIV_MUX		0x0030
-
-#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN		0x0034
-#define QSERDES_COM_BIAS_EN			0x0001
-#define QSERDES_COM_BIAS_EN_MUX			0x0002
-#define QSERDES_COM_CLKBUF_R_EN			0x0004
-#define QSERDES_COM_CLKBUF_L_EN			0x0008
-#define QSERDES_COM_EN_SYSCLK_TX_SEL		0x0010
-#define QSERDES_COM_CLKBUF_RX_DRIVE_L		0x0020
-#define QSERDES_COM_CLKBUF_RX_DRIVE_R		0x0040
-
-#define QSERDES_COM_CLK_ENABLE1			0x0038
-#define QSERDES_COM_SYS_CLK_CTRL		0x003C
-#define QSERDES_COM_SYSCLK_BUF_ENABLE		0x0040
-#define QSERDES_COM_PLL_EN			0x0044
-#define QSERDES_COM_PLL_IVCO			0x0048
-#define QSERDES_COM_CMN_IETRIM			0x004C
-#define QSERDES_COM_CMN_IPTRIM			0x0050
-
-#define QSERDES_COM_CP_CTRL_MODE0		0x0060
-#define QSERDES_COM_CP_CTRL_MODE1		0x0064
-#define QSERDES_COM_PLL_RCTRL_MODE0		0x0068
-#define QSERDES_COM_PLL_RCTRL_MODE1		0x006C
-#define QSERDES_COM_PLL_CCTRL_MODE0		0x0070
-#define QSERDES_COM_PLL_CCTRL_MODE1		0x0074
-#define QSERDES_COM_PLL_CNTRL			0x0078
-#define QSERDES_COM_BIAS_EN_CTRL_BY_PSM		0x007C
-#define QSERDES_COM_SYSCLK_EN_SEL		0x0080
-#define QSERDES_COM_CML_SYSCLK_SEL		0x0084
-#define QSERDES_COM_RESETSM_CNTRL		0x0088
-#define QSERDES_COM_RESETSM_CNTRL2		0x008C
-#define QSERDES_COM_LOCK_CMP_EN			0x0090
-#define QSERDES_COM_LOCK_CMP_CFG		0x0094
-#define QSERDES_COM_LOCK_CMP1_MODE0		0x0098
-#define QSERDES_COM_LOCK_CMP2_MODE0		0x009C
-#define QSERDES_COM_LOCK_CMP3_MODE0		0x00A0
-
-#define QSERDES_COM_DEC_START_MODE0		0x00B0
-#define QSERDES_COM_DEC_START_MODE1		0x00B4
-#define QSERDES_COM_DIV_FRAC_START1_MODE0	0x00B8
-#define QSERDES_COM_DIV_FRAC_START2_MODE0	0x00BC
-#define QSERDES_COM_DIV_FRAC_START3_MODE0	0x00C0
-#define QSERDES_COM_DIV_FRAC_START1_MODE1	0x00C4
-#define QSERDES_COM_DIV_FRAC_START2_MODE1	0x00C8
-#define QSERDES_COM_DIV_FRAC_START3_MODE1	0x00CC
-#define QSERDES_COM_INTEGLOOP_INITVAL		0x00D0
-#define QSERDES_COM_INTEGLOOP_EN		0x00D4
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x00D8
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x00DC
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1	0x00E0
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1	0x00E4
-#define QSERDES_COM_VCOCAL_DEADMAN_CTRL		0x00E8
-#define QSERDES_COM_VCO_TUNE_CTRL		0x00EC
-#define QSERDES_COM_VCO_TUNE_MAP		0x00F0
-
-#define QSERDES_COM_CMN_STATUS			0x0124
-#define QSERDES_COM_RESET_SM_STATUS		0x0128
-
-#define QSERDES_COM_CLK_SEL			0x0138
-#define QSERDES_COM_HSCLK_SEL			0x013C
-
-#define QSERDES_COM_CORECLK_DIV_MODE0		0x0148
-
-#define QSERDES_COM_SW_RESET			0x0150
-#define QSERDES_COM_CORE_CLK_EN			0x0154
-#define QSERDES_COM_C_READY_STATUS		0x0158
-#define QSERDES_COM_CMN_CONFIG			0x015C
-
-#define QSERDES_COM_SVS_MODE_CLK_SEL		0x0164
-
-/* DP MMSS_CC registers */
-#define MMSS_DP_LINK_CMD_RCGR			(0x0138)
-#define MMSS_DP_LINK_CFG_RCGR			(0x013C)
-#define MMSS_DP_PIXEL_M				(0x01B4)
-#define MMSS_DP_PIXEL_N				(0x01B8)
-
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)
@@ -492,28 +303,4 @@
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA11     (0x01C)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12     (0x020)
 
-/* USB3 DP COM registers */
-#define REG_USB3_DP_COM_RESET_OVRD_CTRL			(0x1C)
-#define USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET		(0x01)
-#define USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET_MUX	(0x02)
-#define USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET		(0x04)
-#define USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET_MUX	(0x08)
-
-#define REG_USB3_DP_COM_PHY_MODE_CTRL			(0x00)
-#define USB3_DP_COM_PHY_MODE_DP				(0x03)
-
-#define REG_USB3_DP_COM_SW_RESET			(0x04)
-#define USB3_DP_COM_SW_RESET_SET			(0x01)
-
-#define REG_USB3_DP_COM_TYPEC_CTRL			(0x10)
-#define USB3_DP_COM_TYPEC_CTRL_PORTSEL			(0x01)
-#define USB3_DP_COM_TYPEC_CTRL_PORTSEL_MUX		(0x02)
-
-#define REG_USB3_DP_COM_SWI_CTRL			(0x0c)
-
-#define REG_USB3_DP_COM_POWER_DOWN_CTRL			(0x08)
-#define USB3_DP_COM_POWER_DOWN_CTRL_SW_PWRDN		(0x01)
-
-
-
 #endif /* _DP_REG_H_ */
-- 
Sent by a computer, using git, on the internet

