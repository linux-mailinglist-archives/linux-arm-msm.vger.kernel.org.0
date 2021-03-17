Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A906C33F38D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhCQOlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhCQOlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:41:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFB2C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:41:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p21so3303039lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQzPfZNgs/RI9SHlybC6kTwo7b0PPDxFfUXKq7+6f+c=;
        b=fZgT1aoogywIpHIDaBMOkDuOEOTEMKxD0MJF5mUXesN1G0AVlnTvvgMWHPRFO2ABum
         +rYt9CQF4CKy3mYVUlbQt90PTTbWUwpH+EufviaPJ2a2Kr/76KEo7TM4AWNbYhd9keou
         BRLbJxDEWpXl6ZpJc3MzsHulSqBLTnWcGZbgB/HCJIm5SqKze3n9dl5i/QluSjeNEZq3
         q13lFfa2LAqB3bnN4cs3rxU3CRJLjPJ4RZjDvcOBzZSMhmc+yA1mTRmgz+u7Yw+K8OBH
         kJpYP943AbgyXa9mzoo5XfFwtrfkIqdKThUpIJ3UmEpPZr37Ayz+QgTayr73/UisOw7/
         UnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQzPfZNgs/RI9SHlybC6kTwo7b0PPDxFfUXKq7+6f+c=;
        b=DB0v+EgYTgn6Fw997vsTA+X1hwArpmHx0S3MheAyjBO6aCVyC2ab9JOSNPeTYMvb/d
         aRL6IRXySofFXn3/3KYaZStnhNO/cKM53QxT2EFeyoLh0yz7/kHjA6k42kuX0Fq4fMZz
         ZO3ndktE+d+55VAtgEXIlzeBQdM+y8QehRnUjGPGHxs5wbrhbs6dGtGlaiXRnsIxlqNq
         R3TEknYO14/aXomWLog+LnO64UxTQitekhLdyqoBTZPY2u0Xf9NZiQcEljKAVCTnwosO
         2zDVMvm7hxTvqJWaCdrcS2prcI3jhByQwnbsUGYxWR0kFnKArED+JnLx0jIwFZm7nGMc
         rAJw==
X-Gm-Message-State: AOAM531E+kmnJQpAPmVOL3VUc3tZVGk//fHeFrGktQoGRFvmxI7ZIt7R
        8xtcEKV4yu957YJDT4QFGWbM+Q==
X-Google-Smtp-Source: ABdhPJxEQz+VGMHz89aAzgSoLzHI6Dbz62FrbBH3bJWCmPO+AzmRMSO+JvF7PjBW+kjRRgFYZOh5QA==
X-Received: by 2002:ac2:43d4:: with SMTP id u20mr2486184lfl.210.1615992067079;
        Wed, 17 Mar 2021 07:41:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:41:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 26/26] drm/msm/dsi: stop passing src_pll_id to the phy_enable call
Date:   Wed, 17 Mar 2021 17:40:39 +0300
Message-Id: <20210317144039.556409-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Phy driver already knows the source PLL id basing on the set usecase and
the current PLL id. Stop passing it to the phy_enable call. As a
reminder, dsi manager will always use DSI 0 as a clock master in a slave
mode, so PLL 0 is always a clocksource for DSI 0 and it is always a
clocksource for DSI 1 too unless DSI 1 is used in the standalone mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                   |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c           | 11 +++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 +-
 10 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 5c32ee2b3605..c422c8690ab3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -160,7 +160,7 @@ struct msm_dsi_phy_clk_request {
 
 void msm_dsi_phy_driver_register(void);
 void msm_dsi_phy_driver_unregister(void);
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 2976b09a881d..20bcb6afb52e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -109,7 +109,7 @@ static int dsi_mgr_setup_components(int id)
 	return ret;
 }
 
-static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
+static int enable_phy(struct msm_dsi *msm_dsi,
 		      struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct msm_dsi_phy_clk_request clk_req;
@@ -118,7 +118,7 @@ static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
 
 	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, src_pll_id, &clk_req);
+	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
 	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
 
 	return ret;
@@ -131,7 +131,6 @@ dsi_mgr_phy_enable(int id,
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *mdsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
 	struct msm_dsi *sdsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
-	int src_pll_id = IS_DUAL_DSI() ? DSI_CLOCK_MASTER : id;
 	int ret;
 
 	/* In case of dual DSI, some registers in PHY1 have been programmed
@@ -144,11 +143,11 @@ dsi_mgr_phy_enable(int id,
 			msm_dsi_host_reset_phy(mdsi->host);
 			msm_dsi_host_reset_phy(sdsi->host);
 
-			ret = enable_phy(mdsi, src_pll_id,
+			ret = enable_phy(mdsi,
 					 &shared_timings[DSI_CLOCK_MASTER]);
 			if (ret)
 				return ret;
-			ret = enable_phy(sdsi, src_pll_id,
+			ret = enable_phy(sdsi,
 					 &shared_timings[DSI_CLOCK_SLAVE]);
 			if (ret) {
 				msm_dsi_phy_disable(mdsi->phy);
@@ -157,7 +156,7 @@ dsi_mgr_phy_enable(int id,
 		}
 	} else {
 		msm_dsi_host_reset_phy(msm_dsi->host);
-		ret = enable_phy(msm_dsi, src_pll_id, &shared_timings[id]);
+		ret = enable_phy(msm_dsi, &shared_timings[id]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 72c97c7173fe..44db7aba0a5b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -753,7 +753,7 @@ void __exit msm_dsi_phy_driver_unregister(void)
 	platform_driver_unregister(&dsi_phy_platform_driver);
 }
 
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct device *dev = &phy->pdev->dev;
@@ -776,7 +776,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 		goto reg_en_fail;
 	}
 
-	ret = phy->cfg->ops.enable(phy, src_pll_id, clk_req);
+	ret = phy->cfg->ops.enable(phy, clk_req);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
 		goto phy_en_fail;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3b207cf9f6b4..74fffcae0f10 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -19,7 +19,7 @@
 
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
-	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
+	int (*enable)(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_state)(struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index c6c41a811780..d6d94dabeec8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -786,7 +786,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 			       struct msm_dsi_phy_clk_request *clk_req)
 {
 	int ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index b1f3b411e268..092ff0204cc9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -938,7 +938,7 @@ static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
 		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
 }
 
-static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 			       struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -996,7 +996,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
 
 	glbl_test_ctrl = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
-	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+	if (phy->usecase == MSM_DSI_PHY_SLAVE)
 		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index f5b88c85a8fc..e96d789aea18 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -63,7 +63,7 @@ static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
 }
 
-static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -85,7 +85,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
 
 	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
-	if (src_pll_id == DSI_1)
+	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_STANDALONE)
 		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 14432323c28d..93fe58b2c111 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -721,7 +721,7 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 		dsi_28nm_phy_regulator_enable_dcdc(phy);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -768,7 +768,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
 
 	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
-	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+	if (phy->usecase == MSM_DSI_PHY_SLAVE)
 		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 1e004c330599..8b4335010c57 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -585,7 +585,7 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index d26bf387c0fe..6c75addec6b9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -800,7 +800,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 			      struct msm_dsi_phy_clk_request *clk_req)
 {
 	int ret;
-- 
2.30.2

