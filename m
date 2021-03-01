Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9993332A112
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344047AbhCBEsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbhCAX20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:28:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B88C06121D
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:19 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d3so28282127lfg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EospFfvus4caWhWGOkiWteCah6KwbWR4s5z+0VbUhO0=;
        b=sC99un7nGMhNRkNYBwk/OrP1ce7D76FJsrIm4sd/TpPz2zAQBdH4fFqxYJReMkY71n
         WKRLUj1jFbc9c5k80Kq1kf+wp0YPXjrbI6Wjq52vycFIRdqzTo4C2aW5aur8Hb+7FGQk
         qMkLd1QRX1toe1cOZTe5+QmRlUogpMkgMiC0LfCjaa/HDnHu85JZTk0WhrQhlupq0MwN
         Bdh6L7HV+3ElAYF4qEoauA4aUNzHdXWAwSHDYjuixmzW+cZVsOV9EPaso3/fRATX/d1+
         05BtVU+M8RdXDQBFkdhMNCrBHmQLyI23dRG7aWIr9XF/Odl9T30J0jHe3bwSQUWzR6jX
         k19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EospFfvus4caWhWGOkiWteCah6KwbWR4s5z+0VbUhO0=;
        b=Xn0SyglkCK8Wx/+LY4iG+3mEOc3U6SWMCGM0v0BpRk8yXpQPR1KmTOqYDfjd9fKtX0
         d3BTIu4wludjp0MsA2vdq/rkl0pEnLD9Rt2qGQ4EzdWmDkpWVlR+1xFC7Ge6JPCpS+w7
         wbEy89NtsiB8J+79q3NAAMtLyD4Kk3MBrA1Dxk+eJVDSL77vT3GhK89as863ARREFu00
         DEpGf9uHBr2A/5a9IyAn4RqunheWujzfi7TfGYJ7Ou5+mb0AMcVJxjC5V+voQ2DwWhww
         krNxkYaa7mKtM6zKOcIXAZ9zQ9OYFv3APd4FMBin3g6zc/BuBegHGHu2KNL4rjM5+W8L
         uwOg==
X-Gm-Message-State: AOAM533GoBwg+briGpF/0/Bknck8Im6PSIXNuTVm1NeOPtbS3Z4X4k8q
        G+p8JfcKZaq5dnoBd/BgZnuq/aNsVqkXjw==
X-Google-Smtp-Source: ABdhPJxXQx2dwMXM7Zp7bjzH0jKCkDwR4fa8nfvPJFvtSCiX0N3CqeIfUUfI0SJp3fG842xxIzbW2Q==
X-Received: by 2002:ac2:4c0b:: with SMTP id t11mr10976224lfq.241.1614641177952;
        Mon, 01 Mar 2021 15:26:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 13/24] drm/msm/dsi: replace PHY's init callback with configurable data
Date:   Tue,  2 Mar 2021 02:24:56 +0300
Message-Id: <20210301232506.3057401-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSI PHY init callback would either map dsi_phy_regulator or dsi_phy_lane
depending on the PHY type. Replace those callbacks with configuration
options governing mapping those regions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 42 ++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 +--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 19 +--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  6 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 +--------
 8 files changed, 31 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 0c26451db310..4535cc5d22a5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -638,24 +638,6 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
 	return -EINVAL;
 }
 
-int msm_dsi_phy_init_common(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-	int ret = 0;
-
-	phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator",
-				"DSI_PHY_REG");
-	if (IS_ERR(phy->reg_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n",
-			__func__);
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-fail:
-	return ret;
-}
-
 static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
@@ -700,6 +682,24 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (phy->cfg->has_phy_lane) {
+		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
+		if (IS_ERR(phy->lane_base)) {
+			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
+			ret = -ENOMEM;
+			goto fail;
+		}
+	}
+
+	if (phy->cfg->has_phy_regulator) {
+		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", "DSI_PHY_REG");
+		if (IS_ERR(phy->reg_base)) {
+			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
+			ret = -ENOMEM;
+			goto fail;
+		}
+	}
+
 	ret = dsi_phy_regulator_init(phy);
 	if (ret)
 		goto fail;
@@ -711,12 +711,6 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	if (phy->cfg->ops.init) {
-		ret = phy->cfg->ops.init(phy);
-		if (ret)
-			goto fail;
-	}
-
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 049feaaa479f..06e560548c8e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,7 +17,6 @@
 #define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
 
 struct msm_dsi_phy_ops {
-	int (*init) (struct msm_dsi_phy *phy);
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
@@ -49,6 +48,8 @@ struct msm_dsi_phy_cfg {
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
 	const int quirks;
+	bool has_phy_regulator;
+	bool has_phy_lane;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
@@ -124,7 +125,6 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask);
-int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_PHY_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 6ddf852782a4..9910cee8c9a5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -992,24 +992,10 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 	DBG("DSI%d PHY disabled", phy->id);
 }
 
-static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				     "DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1019,7 +1005,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.ops = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
-		.init = dsi_10nm_phy_init,
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
@@ -1035,6 +1020,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1044,7 +1030,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.ops = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
-		.init = dsi_10nm_phy_init,
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 6f3522c0dd68..c531ddf26521 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1144,24 +1144,10 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 	wmb();
 }
 
-static int dsi_14nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				"DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1171,7 +1157,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.ops = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
-		.init = dsi_14nm_phy_init,
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
@@ -1189,6 +1174,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1198,7 +1184,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.ops = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
-		.init = dsi_14nm_phy_init,
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index eca86bf448f7..b752636f7f21 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -127,6 +127,7 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 	.type = MSM_DSI_PHY_20NM,
 	.src_pll_truthtable = { {false, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
@@ -137,7 +138,6 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 	.ops = {
 		.enable = dsi_20nm_phy_enable,
 		.disable = dsi_20nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0xfd998500, 0xfd9a0500 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fc9dbfcf3178..fa96bfc21fdb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -779,6 +779,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -788,7 +789,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
@@ -806,6 +806,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -815,7 +816,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
@@ -833,6 +833,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -842,7 +843,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 		.pll_init = dsi_pll_28nm_lp_init,
 	},
 	.pll_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 81338c12352b..558d311b13a9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -638,6 +638,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.type = MSM_DSI_PHY_28NM_8960,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -647,7 +648,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 		.pll_init = dsi_pll_28nm_8960_init,
 	},
 	.pll_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index abe4d2d680ed..0b9438bb8050 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1025,24 +1025,10 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	DBG("DSI%d PHY disabled", phy->id);
 }
 
-static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				     "DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.type = MSM_DSI_PHY_7NM_V4_1,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1052,7 +1038,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.ops = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
-		.init = dsi_7nm_phy_init,
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
@@ -1068,6 +1053,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.type = MSM_DSI_PHY_7NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -1077,7 +1063,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.ops = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
-		.init = dsi_7nm_phy_init,
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-- 
2.30.0

