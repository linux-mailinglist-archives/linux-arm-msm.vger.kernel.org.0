Return-Path: <linux-arm-msm+bounces-6101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD082026E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D6F283B9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68CC15494;
	Fri, 29 Dec 2023 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsb2zZuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479915485
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e70b0b869so5561996e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890617; x=1704495417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siIradHTXx7UPEZ4VsbiUoMRC0DlsLeXsrytGTLnmC4=;
        b=bsb2zZuzOHwdkF6D4Y0kXHGlVhjSnhx8MqGFwRDVDxUsovllXRyY9+/s5e1rLyJPcU
         x6dYzzLL4a7VSUln8+AiaQFVi/ICJ/snuLg3FzCEwkzvwMiFTjGUpF0VItUM/T/BaxbY
         2e2IVIFmlVU8Et4u9kVpoP4oVYMtaO7s07JE57eTwpkZJMRucaiTGci/WVkeZECGmphI
         f0qs4O4WqcWP/J9nKjGdf3Q0bckN3/8zQE9JoasDvyk3yV2OSC6nJsYQQdebasHwH7gV
         3I8Bsx7qo54ZKB0Ho2LPM25LvmIsOy3uDliiUnhgh3pw9BKn9dRkTRc+Pj4upu3YeuP3
         whkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890617; x=1704495417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siIradHTXx7UPEZ4VsbiUoMRC0DlsLeXsrytGTLnmC4=;
        b=jpUUSquMXH40J8ooC8wHVCQ+5Bk27302IdPOTu1qAxuJaSaCr2gbY8aP4Ytxmhvc6W
         4/UNAYO0AUH0jKPUQbvLraRyBxroNFwL3Op4k5QuHsNgsjIh6LJbj1+Y03FRYbFeWcmj
         zsX4fw6PtqJ3iQtGr9X9IyJVTtDJpRexs2yT94l7v4he8vbxNcAcC0vZOymaKRwkp2qv
         5bCp4vu3Do1nfOOE38t1QcjbVNbVxcDW4VsWWghXcTm/AxVuzXNBWUTd7x6OGtjWm4w8
         Hy9YHOO+h/h/2TyD1XqlapLs8OlVi1INZkij56U6Z+P89VNOcAHozS/AvG9K4KEctk6u
         bXGA==
X-Gm-Message-State: AOJu0YzLrtXLKBep/vkVw1168fJr6M+gp7RLmNYDPO63/bQdKjGznq9Z
	FAe7UxngS+6SfKaQ+E52lU978uUC9/wk+g==
X-Google-Smtp-Source: AGHT+IEnk5MK6DWvjh9qZ5tpFgC7sIJdeWJehaAZ6kwUu4Ik6e/TOg42UP2khL2RKm7JD0FFHvAh/g==
X-Received: by 2002:ac2:5dc7:0:b0:50e:455d:1bb4 with SMTP id x7-20020ac25dc7000000b0050e455d1bb4mr4362062lfq.17.1703890616985;
        Fri, 29 Dec 2023 14:56:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:56 -0800 (PST)
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
Subject: [PATCH 07/14] drm/msm/dp: stop parsing clock names from DT
Date: Sat, 30 Dec 2023 00:56:43 +0200
Message-Id: <20231229225650.912751-8-dmitry.baryshkov@linaro.org>
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

All supported platforms use the same clocks configuration. Instead of
parsing names from DT in a pretty complex manner, use the static
configuration. If at some point newer (or older) platforms have
different clock configuration, this clock config can be moved to the
device data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c   |  55 ++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h   |   6 ++
 drivers/gpu/drm/msm/dp/dp_parser.c | 112 -----------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  22 ------
 4 files changed, 54 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 088bd35695f6..9b59a29547c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -69,6 +69,11 @@ struct dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
+struct dss_module_power {
+	unsigned int num_clk;
+	struct clk_bulk_data *clocks;
+};
+
 struct dp_ctrl_private {
 	struct dp_ctrl dp_ctrl;
 	struct drm_device *drm_dev;
@@ -79,6 +84,7 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct dss_module_power mp[DP_MAX_PM];
 	struct clk *pixel_clk;
 
 	struct completion idle_comp;
@@ -90,6 +96,15 @@ struct dp_ctrl_private {
 	bool stream_clks_on;
 };
 
+static inline const char *dp_pm_name(enum dp_pm_type module)
+{
+	switch (module) {
+	case DP_CORE_PM:	return "DP_CORE_PM";
+	case DP_CTRL_PM:	return "DP_CTRL_PM";
+	default:		return "???";
+	}
+}
+
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
@@ -2101,7 +2116,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM) {
 		DRM_ERROR("unsupported ctrl module: %s\n",
-				dp_parser_pm_name(pm_type));
+				dp_pm_name(pm_type));
 		return -EINVAL;
 	}
 
@@ -2121,7 +2136,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
 			drm_dbg_dp(ctrl->drm_dev,
 					"Enable core clks before link clks\n");
-			mp = &ctrl->parser->mp[DP_CORE_PM];
+			mp = &ctrl->mp[DP_CORE_PM];
 
 			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
 			if (rc)
@@ -2131,7 +2146,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		}
 	}
 
-	mp = &ctrl->parser->mp[pm_type];
+	mp = &ctrl->mp[pm_type];
 	if (enable) {
 		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
 		if (rc)
@@ -2147,7 +2162,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
 			enable ? "enable" : "disable",
-			dp_parser_pm_name(pm_type));
+			dp_pm_name(pm_type));
 	drm_dbg_dp(ctrl->drm_dev,
 		"stream_clks:%s link_clks:%s core_clks:%s\n",
 		ctrl->stream_clks_on ? "on" : "off",
@@ -2157,23 +2172,49 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	return 0;
 }
 
+static const char *core_clks[] = {
+	"core_iface",
+	"core_aux",
+};
+
+static const char *ctrl_clks[] = {
+	"ctrl_link",
+	"ctrl_link_iface",
+};
+
 static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl_private;
-	int rc = 0;
 	struct dss_module_power *core, *ctrl;
 	struct device *dev;
+	int i, rc;
 
 	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dev = ctrl_private->dev;
 
-	core = &ctrl_private->parser->mp[DP_CORE_PM];
-	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
+	core = &ctrl_private->mp[DP_CORE_PM];
+	ctrl = &ctrl_private->mp[DP_CTRL_PM];
+
+	core->num_clk = ARRAY_SIZE(core_clks);
+	core->clocks = devm_kcalloc(dev, core->num_clk, sizeof(*core->clocks), GFP_KERNEL);
+	if (!core->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < core->num_clk; i++)
+		core->clocks[i].id = core_clks[i];
 
 	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc)
 		return rc;
 
+	ctrl->num_clk = ARRAY_SIZE(ctrl_clks);
+	ctrl->clocks = devm_kcalloc(dev, ctrl->num_clk, sizeof(*ctrl->clocks), GFP_KERNEL);
+	if (!ctrl->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < ctrl->num_clk; i++)
+		ctrl->clocks[i].id = ctrl_clks[i];
+
 	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
 	if (rc)
 		return -ENODEV;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 36e7c52a730a..cc0cd5be9f40 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,6 +17,12 @@ struct dp_ctrl {
 	bool wide_bus_en;
 };
 
+enum dp_pm_type {
+	DP_CORE_PM,
+	DP_CTRL_PM,
+	DP_MAX_PM
+};
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index fe2b75f7555a..de7cfc340f0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -141,114 +141,6 @@ static int dp_parser_misc(struct dp_parser *parser)
 	return 0;
 }
 
-static inline bool dp_parser_check_prefix(const char *clk_prefix,
-						const char *clk_name)
-{
-	return !strncmp(clk_prefix, clk_name, strlen(clk_prefix));
-}
-
-static int dp_parser_init_clk_data(struct dp_parser *parser)
-{
-	int num_clk, i, rc;
-	int core_clk_count = 0, ctrl_clk_count = 0;
-	const char *clk_name;
-	struct device *dev = &parser->pdev->dev;
-	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
-	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-
-	num_clk = of_property_count_strings(dev->of_node, "clock-names");
-	if (num_clk <= 0) {
-		DRM_ERROR("no clocks are defined\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < num_clk; i++) {
-		rc = of_property_read_string_index(dev->of_node,
-				"clock-names", i, &clk_name);
-		if (rc < 0)
-			return rc;
-
-		if (dp_parser_check_prefix("core", clk_name))
-			core_clk_count++;
-
-		if (dp_parser_check_prefix("ctrl", clk_name))
-			ctrl_clk_count++;
-	}
-
-	/* Initialize the CORE power module */
-	if (core_clk_count == 0) {
-		DRM_ERROR("no core clocks are defined\n");
-		return -EINVAL;
-	}
-
-	core_power->num_clk = core_clk_count;
-	core_power->clocks = devm_kcalloc(dev,
-			core_power->num_clk, sizeof(struct clk_bulk_data),
-			GFP_KERNEL);
-	if (!core_power->clocks)
-		return -ENOMEM;
-
-	/* Initialize the CTRL power module */
-	if (ctrl_clk_count == 0) {
-		DRM_ERROR("no ctrl clocks are defined\n");
-		return -EINVAL;
-	}
-
-	ctrl_power->num_clk = ctrl_clk_count;
-	ctrl_power->clocks = devm_kcalloc(dev,
-			ctrl_power->num_clk, sizeof(struct clk_bulk_data),
-			GFP_KERNEL);
-	if (!ctrl_power->clocks) {
-		ctrl_power->num_clk = 0;
-		return -ENOMEM;
-	}
-
-	return num_clk;
-}
-
-static int dp_parser_clock(struct dp_parser *parser)
-{
-	int rc = 0, i = 0;
-	int num_clk = 0;
-	int core_clk_index = 0, ctrl_clk_index = 0;
-	int core_clk_count = 0, ctrl_clk_count = 0;
-	const char *clk_name;
-	struct device *dev = &parser->pdev->dev;
-	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
-	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-
-	rc =  dp_parser_init_clk_data(parser);
-	if (rc < 0) {
-		DRM_ERROR("failed to initialize power data %d\n", rc);
-		return rc;
-	}
-
-	num_clk = rc;
-
-	core_clk_count = core_power->num_clk;
-	ctrl_clk_count = ctrl_power->num_clk;
-
-	for (i = 0; i < num_clk; i++) {
-		rc = of_property_read_string_index(dev->of_node, "clock-names",
-				i, &clk_name);
-		if (rc) {
-			DRM_ERROR("error reading clock-names %d\n", rc);
-			return rc;
-		}
-		if (dp_parser_check_prefix("core", clk_name) &&
-				core_clk_index < core_clk_count) {
-			core_power->clocks[core_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-			core_clk_index++;
-		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
-			   ctrl_clk_index < ctrl_clk_count) {
-			ctrl_power->clocks[ctrl_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-			ctrl_clk_index++;
-		}
-	}
-
-	return 0;
-}
-
 int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
 {
 	struct platform_device *pdev = parser->pdev;
@@ -280,10 +172,6 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
-	rc = dp_parser_clock(parser);
-	if (rc)
-		return rc;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index c6fe26602e07..cad82c4d07da 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -16,12 +16,6 @@
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
-enum dp_pm_type {
-	DP_CORE_PM,
-	DP_CTRL_PM,
-	DP_MAX_PM
-};
-
 struct dss_io_region {
 	size_t len;
 	void __iomem *base;
@@ -34,15 +28,6 @@ struct dss_io_data {
 	struct dss_io_region p0;
 };
 
-static inline const char *dp_parser_pm_name(enum dp_pm_type module)
-{
-	switch (module) {
-	case DP_CORE_PM:	return "DP_CORE_PM";
-	case DP_CTRL_PM:	return "DP_CTRL_PM";
-	default:		return "???";
-	}
-}
-
 /**
  * struct dp_ctrl_resource - controller's IO related data
  *
@@ -55,20 +40,13 @@ struct dp_io {
 	union phy_configure_opts phy_opts;
 };
 
-struct dss_module_power {
-	unsigned int num_clk;
-	struct clk_bulk_data *clocks;
-};
-
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
  * @pdev: platform data of the client
- * @mp: gpio, regulator and clock related data
  */
 struct dp_parser {
 	struct platform_device *pdev;
-	struct dss_module_power mp[DP_MAX_PM];
 	struct dp_io io;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
-- 
2.39.2


