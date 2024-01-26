Return-Path: <linux-arm-msm+bounces-8470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA783E146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BAD51F25ACD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDED020DE1;
	Fri, 26 Jan 2024 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cnp1n5eW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12720DC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293596; cv=none; b=VUD4ZEJX2QnbkY9AxCfTxEZUVf8zhoysOyJcUbZoF9pCo6KYMSlmF5s/ASuURgMPRHxD4D+7uSv3lABccoeJiXBG1YxZtvmjs/pJsY6UsnhWzujGJw3pgGosMlG5eylXkMQLLT7HSacQI+m2PvpUZl4KllYFpRjbva2Ry6BwWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293596; c=relaxed/simple;
	bh=JHMCbSPE7gZXRzZ8Yh8uYk+Fdg3YzXkUqA/+AlXGaYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+rlYmBRS022P8dZkDcsxr+teHn6QkcNHLROrOYI+n3hXJoJ7sBSqhQRHriMYRAczLUQKLD6PELn7vHSa3rKX/68pi1+FXszbA/wjKSqe67F83rQRK9E7+3T/ekrkzAIPCY9b7lUIkbYnwmeSeuQ/ymOehZkG2sxliVQKsI3nlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cnp1n5eW; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cf3a095ba6so7708031fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293593; x=1706898393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f23f6k2NURR3hjj9IxLe37rVyBQBMzjyoSIDJiZdG1c=;
        b=Cnp1n5eWx1NXQ/hS9a2XNSywEXowx06PMVO9nLLTQV/LOx+AozLbaqX3GIdCnCGpil
         ew2botblkYpm6AXC7IpF2BmFueJIiDjbvV/v7apaAsgKRfZ2cLGQMkp0p28QZI8RHiHC
         ph1zHKevz4+BbTc33hJLkOYxL6ugB+ujUgA5atb6q48i39gltv6qNmvW33T+0S/oSVyx
         dMhUDQ363MBkhne4qlAH6YVHODOyTg2yAK8PXT/W2XU5xSu2eorAU4OEjYcJ0NQzQZ56
         EPVjdyQwO6r5OXH3MGpUXQaYDzFmC1AX9gPk53fQq3lfz3XdMbQcdNpgzC1RE+AraEYq
         xycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293593; x=1706898393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f23f6k2NURR3hjj9IxLe37rVyBQBMzjyoSIDJiZdG1c=;
        b=vwEff/ukJv2TWMGJgJxLOcc5w2AFjAKGaRJO0/qgI9MKjR0KCTVN/YXMJmTvC7ufi1
         ldqznR/0bVJfRRxzkdYi/2Z81qu8cw0NZW3xdVwWl8N+MVikTF1eoXfIXg5eMPfVEXkI
         nW7bYYKlpFNrbMa0JiEoUp+f9KOYUI7XfL7dvzM4xChlQt1DIEkjmvQQEayfp9LhiViJ
         kWWewSqBn0ckecmO8MG+Q+QAZtf0NIuIg8mW8yRLzpOl3iUsmQc/pwwaMQFiUh7GrEN3
         boEPMb7jzZyfG6RGK0TmLylvg/JkG247z4lRmBNlGiZvxk18y/1vBFZFhjXlHxAV5Sgm
         ersQ==
X-Gm-Message-State: AOJu0Yz3HDTtnphRdmjVxby05JDLF7E09DhZNJzWnWNIlWEFBQrsVaUp
	TtKOWtffJ9fNo327bueKonuFToP1wyOQIz4pSNwXLkPg0e3kEgZP+LJmYsxxCVY=
X-Google-Smtp-Source: AGHT+IGjlUrMhEpbIMW/rvZqRa/hDjK0BsUf0WeeaJvymIi56Gh1h1xsa5PM34V2c6oCS7P/cmRcjw==
X-Received: by 2002:a2e:bba4:0:b0:2cf:2db4:cd88 with SMTP id y36-20020a2ebba4000000b002cf2db4cd88mr101343lje.106.1706293592858;
        Fri, 26 Jan 2024 10:26:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:28 +0200
Subject: [PATCH RESEND v3 09/15] drm/msm/dp: move phy_configure_opts to
 dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-9-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JHMCbSPE7gZXRzZ8Yh8uYk+Fdg3YzXkUqA/+AlXGaYM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQxLXdlmfBOU6OoF+Yl2vx9gwZWj+dopw7a
 YnF4Cr3us2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1URoB/9sQLRTGk6UHNgPhrcEHssY0Wls+S8HiMKWxanXOLJ7WbMEC1PXKafmwQcktR0XUSrI1Bt
 sTjdzMhZj7iK5uH7R+D/q2k8DsG86BWVCH5U/VHDY22i7jO+bPLQ4qMmVKqxrWQNamWW9mFNw0K
 eDVEj1AaN+lUvAmMF8AkyrhW2l62FsQCOrYmUGrAKaT2Sq5deizJhAASB19EhBqJ8pBTPKKYW71
 Wz5kAlYTbJqKt22o8g8U5Zz5x15OvXT8lKsWS7nZJTXaNwHm3KwgixT6emyNwr4yu0IVL8HAj6a
 t36IBZKgS6Qys9Gn1/JmwmzpFLA3IfTQ6gHXWe/awJYBIpVH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is little point in sharing phy configuration structure between
several modules. Move it to dp_ctrl, which becomes the only submodule
re-configuring the PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 19 -----------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 41 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ---
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a4..e07651768805 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -765,25 +765,6 @@ void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
 	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
-int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
-		u8 v_level, u8 p_level)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	struct dp_io *dp_io = catalog->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
-
-	/* TODO: Update for all lanes instead of just first one */
-	opts_dp->voltage[0] = v_level;
-	opts_dp->pre[0] = p_level;
-	opts_dp->set_voltages = 1;
-	phy_configure(phy, &dp_io->phy_opts);
-	opts_dp->set_voltages = 0;
-
-	return 0;
-}
-
 void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 			u32 pattern)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51..ba7c62ba7ca3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -111,8 +111,6 @@ void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
-int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
-				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
 u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e367eb8e5bea..4aea72a2b8e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -87,6 +87,8 @@ struct dp_ctrl_private {
 
 	struct clk *pixel_clk;
 
+	union phy_configure_opts phy_opts;
+
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
@@ -1017,6 +1019,21 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
+			     u8 v_level, u8 p_level)
+{
+	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
+
+	/* TODO: Update for all lanes instead of just first one */
+	phy_opts->dp.voltage[0] = v_level;
+	phy_opts->dp.pre[0] = p_level;
+	phy_opts->dp.set_voltages = 1;
+	phy_configure(ctrl->parser->io.phy, phy_opts);
+	phy_opts->dp.set_voltages = 0;
+
+	return 0;
+}
+
 static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 {
 	struct dp_link *link = ctrl->link;
@@ -1029,7 +1046,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	drm_dbg_dp(ctrl->drm_dev,
 		"voltage level: %d emphasis level: %d\n",
 			voltage_swing_level, pre_emphasis_level);
-	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+	ret = dp_ctrl_set_vx_px(ctrl,
 		voltage_swing_level, pre_emphasis_level);
 
 	if (ret)
@@ -1425,16 +1442,14 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct dp_io *dp_io = &ctrl->parser->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	struct phy *phy = ctrl->parser->io.phy;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
-	opts_dp->lanes = ctrl->link->link_params.num_lanes;
-	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
-	opts_dp->ssc = drm_dp_max_downspread(dpcd);
+	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
+	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
+	ctrl->phy_opts.dp.ssc = drm_dp_max_downspread(dpcd);
 
-	phy_configure(phy, &dp_io->phy_opts);
+	phy_configure(phy, &ctrl->phy_opts);
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
@@ -1572,14 +1587,12 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
+	struct phy *phy = ctrl->parser->io.phy;
 	int ret = 0;
-	struct dp_io *dp_io = &ctrl->parser->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
-	opts_dp->lanes = ctrl->link->link_params.num_lanes;
-	phy_configure(phy, &dp_io->phy_opts);
+	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
+	phy_configure(phy, &ctrl->phy_opts);
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
@@ -1659,7 +1672,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "request: 0x%x\n", pattern_requested);
 
-	if (dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+	if (dp_ctrl_set_vx_px(ctrl,
 			ctrl->link->phy_params.v_level,
 			ctrl->link->phy_params.p_level)) {
 		DRM_ERROR("Failed to set v/p levels\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index cad82c4d07da..b28052e87101 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -7,8 +7,6 @@
 #define _DP_PARSER_H_
 
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-dp.h>
 
 #include "msm_drv.h"
 
@@ -37,7 +35,6 @@ struct dss_io_data {
 struct dp_io {
 	struct dss_io_data dp_controller;
 	struct phy *phy;
-	union phy_configure_opts phy_opts;
 };
 
 /**

-- 
2.39.2


