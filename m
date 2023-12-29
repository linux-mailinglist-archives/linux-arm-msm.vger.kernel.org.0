Return-Path: <linux-arm-msm+bounces-6104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC629820272
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58DDE1F22EA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3A91549E;
	Fri, 29 Dec 2023 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtU4gRRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23AC15496
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so8985254e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890619; x=1704495419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+n4zmIJgPGhlrCx+ymYjTaNE07H0sOzwMO3nSpHFEA=;
        b=PtU4gRRfwJpkZ2KTZY3quasZSLbH1zsQ1k4Skr1G8LSvQWPaB17ypgQCaLQjWAabKK
         pkepGrnkdPrtEdxjcAzarqESIBocBK+by8+1Rfwl026BfoaugU5MTPPOBQnkM7LG7tDv
         0ZVPFuBxOaEWVOLyZHeIEDy7ix6d4Oc4azc+A3wBIpGV4K2QP3gLkJlzxJTj3G4jYf0N
         oYFhFxIsSmW7J9U4cewWFags9J37LglcttKjsTWhQJP6sbSJhjbOfjC2hQRv241Q3TuH
         nG+1FoT2i8z1hdN4KS+WCBn/UDRvv3hPgS00MuGxpIz4YPvmFXnjF3IdCi8CRkqgfYMG
         DlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890619; x=1704495419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+n4zmIJgPGhlrCx+ymYjTaNE07H0sOzwMO3nSpHFEA=;
        b=VWn9M13Qxa+7DnFz017ZkDKEvOqLAiaAU6TinokUTj+tkWxPTA8VoqKCSNo1MXZgNq
         UOvLSyYXx3eZ9/bcy5X9eXEenO8vCVJ7YMFfJkBQxwJyUhuuGKSuewVFT4ZrzKG0rsxK
         QF266av8Ywx2M7Xx06LTGv++hqQw//uUw/uVuMjra+5bdUCVDoP9Fsu9MO3lXkkA/cuT
         NYppHkmvqf095NxH5PMoaCvsM2sdqk92SmzLALC1XMi9FUTKwaSIdFNd5kcnvtFvVgGd
         z24iC3JLyrsS5tsPX6SNMwY2vBB8auyXqGFp4zYfWD7m5l+Gb5PXIQIOLhRhlOsv16pT
         fzrg==
X-Gm-Message-State: AOJu0YycpJ5taScM61pbqloztX5AzMdRMMwQ2xKKdw8oR3hV6dDNPjH1
	/K3Q4IF3+tmUrrUUKaKGVDO04CoQwXWFfA==
X-Google-Smtp-Source: AGHT+IGEl0bqCbFO8c+9YZtUJk4iBcvs6kPBPf4tj6evlzaHsvPOoBSZKS5d8o9dyhi4mabFux2Iqg==
X-Received: by 2002:a05:6512:466:b0:50e:7928:d368 with SMTP id x6-20020a056512046600b0050e7928d368mr3719156lfd.118.1703890619057;
        Fri, 29 Dec 2023 14:56:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 10/14] drm/msm/dp: handle PHY directly in dp_ctrl
Date: Sat, 30 Dec 2023 00:56:46 +0200
Message-Id: <20231229225650.912751-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is little point in going trough dp_parser->io indirection each
time the driver needs to access the PHY. Store the pointer directly in
dp_ctrl_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 ++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 3 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 3bb8bd83fff4..1ab39b402a0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -81,9 +81,10 @@ struct dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct dp_panel *panel;
 	struct dp_link *link;
-	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	struct dss_module_power mp[DP_MAX_PM];
 	struct clk *pixel_clk;
 
@@ -1037,7 +1038,7 @@ static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
 	phy_opts->dp.voltage[0] = v_level;
 	phy_opts->dp.pre[0] = p_level;
 	phy_opts->dp.set_voltages = 1;
-	phy_configure(ctrl->parser->io.phy, phy_opts);
+	phy_configure(ctrl->phy, phy_opts);
 	phy_opts->dp.set_voltages = 0;
 
 	return 0;
@@ -1357,7 +1358,7 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
@@ -1455,12 +1456,10 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
@@ -1472,12 +1471,10 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
@@ -1503,7 +1500,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
@@ -1534,12 +1531,10 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
-	struct dp_io *dp_io;
 	struct phy *phy;
 	int ret;
 
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -1972,13 +1967,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	/* set dongle to D3 (ctrl off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2011,13 +2004,11 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2040,7 +2031,6 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 	int ret = 0;
 
@@ -2048,8 +2038,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2242,7 +2231,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser)
+			struct phy *phy)
 {
 	struct dp_ctrl_private *ctrl;
 	int ret;
@@ -2276,12 +2265,12 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->parser   = parser;
 	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
+	ctrl->phy      = phy;
 
 	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index cc0cd5be9f40..f801774fa8a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -34,7 +34,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser);
+			struct phy *phy);
 
 void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 19d9ec1ad48d..405cd30c8d7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -760,7 +760,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->catalog, dp->parser);
+			       dp->catalog,
+			       dp->parser->io.phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
-- 
2.39.2


