Return-Path: <linux-arm-msm+bounces-6106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13297820275
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93CF21F22EA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D31415488;
	Fri, 29 Dec 2023 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiY9bb+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590115491
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e7e6283bdso4063748e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890620; x=1704495420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM7v7H4C7NJc/DYsSIJw28KxiueS/YTZkND4gF968yU=;
        b=MiY9bb+TD4djbEOQb1P6RksBEkdOsokgiBN2KWYz0Ai3uJRCDTt4ClHZr207cYdb6U
         2OxEK/OphhhZ1xtuhnhx0L4MeyCi0TRbUN/+P/j7ckceub5M9vK5F/EHews4JKv7RttP
         dIfuikxgezs5sCLRF3qnEgLP7sKEVdgZ7wsn5pTF8fsqFAwfZcIJRiCcFcpCdnx9qSaN
         3y9bjeSJh35SGS7pcaqEE1OUUYxAhrGsg/civxWn68yDfuDTdQ2cAZHaH37L4qTvDt9n
         8oVCTFL7CNb9gfWxSQMAKozGFMOB3XLjxZNgMcK65+7ghdI4e55mpM4nhhlhApm8rXb3
         3yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890620; x=1704495420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM7v7H4C7NJc/DYsSIJw28KxiueS/YTZkND4gF968yU=;
        b=wQT0cajpJ3BQFfBVDM2c0SNa61n68BNJ1GxH4Bv3sNHQbALCiLtq0Nd/xAlV5HCMJw
         LBGz8k8GLuG4F/5sOz4Qx36VZwaFPTYnWAf7x+QuAZXv74/F+hAtV0RJc9r1B1vrNoRx
         DHtl5gHkrQ78EQgca3wK9rm3FpF3LRKv+RSzxIw5NTwVDH29K/qoP7Lr/goJ13sOZdzl
         rl0WlHSW/4e5f9NC+BvJXkynci7x8P/Pj39KP5J0wh1LhRn6hSit5B8Ymejf1X7dKD57
         U+08p+2awFEG3suehICxeu405AmEgLKdhZBSdAuBUJrGWwliDYLVLuui3ShoKz0N0VtR
         lwtQ==
X-Gm-Message-State: AOJu0YwoROcO4GKgiUnDmYHWryjA0qpnCDsksFSiuzaBmiDMMGmq0ugl
	OdulTK0rlMhEyuir+cwdqxmA7zKZaoUuxg==
X-Google-Smtp-Source: AGHT+IFvCjxdR7PRLZ8XmoQ6Nz9SKbICkYIJx72GsIW9SkxbWAjPb1V7fiMVRPlT1oTtqamIHSSpWQ==
X-Received: by 2002:a19:7405:0:b0:50e:7f8b:ec51 with SMTP id v5-20020a197405000000b0050e7f8bec51mr1559242lfe.210.1703890620620;
        Fri, 29 Dec 2023 14:57:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:57:00 -0800 (PST)
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
Subject: [PATCH 12/14] drm/msm/dp: move link property handling to dp_panel
Date: Sat, 30 Dec 2023 00:56:48 +0200
Message-Id: <20231229225650.912751-13-dmitry.baryshkov@linaro.org>
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

Instead of passing link properties through the separate struct, parse
them directly in the dp_panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 63 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 54 -------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  4 --
 5 files changed, 63 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9e0217a9ec07..4de0857c31ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -356,12 +356,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	int rc = 0;
 	struct edid *edid;
 
-	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
-	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
-
-	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
-		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
-
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
 		goto end;
@@ -381,8 +375,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
-	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
-
 	/*
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 102f3507d824..70759dd1bfd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -28,7 +28,6 @@ struct msm_dp {
 
 	bool wide_bus_en;
 
-	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 127f6af995cd..8ef55cc4aa48 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -7,8 +7,12 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#define DP_MAX_NUM_DP_LANES	4
+#define DP_LINK_RATE_HBR2	540000 /* kbytes */
+
 struct dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -138,6 +142,9 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
+	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
+		dp_panel->max_dp_lanes, dp_panel->max_dp_link_rate);
+
 	rc = dp_panel_read_dpcd(dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
@@ -386,10 +393,62 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 	return 0;
 }
 
+static u32 dp_panel_link_frequencies(struct device_node *of_node)
+{
+	struct device_node *endpoint;
+	u64 frequency = 0;
+	int cnt;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+	if (!endpoint)
+		return 0;
+
+	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
+
+	if (cnt > 0)
+		of_property_read_u64_index(endpoint, "link-frequencies",
+						cnt - 1, &frequency);
+	of_node_put(endpoint);
+
+	do_div(frequency,
+		10 * /* from symbol rate to link rate */
+		1000); /* kbytes */
+
+	return frequency;
+}
+
+static int dp_panel_parse_dt(struct dp_panel *dp_panel)
+{
+	struct dp_panel_private *panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	struct device_node *of_node = panel->dev->of_node;
+	int cnt;
+
+	/*
+	 * data-lanes is the property of dp_out endpoint
+	 */
+	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
+	if (cnt < 0) {
+		/* legacy code, data-lanes is the property of mdss_dp node */
+		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
+	}
+
+	if (cnt > 0)
+		dp_panel->max_dp_lanes = cnt;
+	else
+		dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+
+	dp_panel->max_dp_link_rate = dp_panel_link_frequencies(of_node);
+	if (!dp_panel->max_dp_link_rate)
+		dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
+
+	return 0;
+}
+
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 {
 	struct dp_panel_private *panel;
 	struct dp_panel *dp_panel;
+	int ret;
 
 	if (!in->dev || !in->catalog || !in->aux || !in->link) {
 		DRM_ERROR("invalid input\n");
@@ -408,6 +467,10 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 	dp_panel = &panel->dp_panel;
 	dp_panel->max_bw_code = DP_LINK_BW_8_1;
 
+	ret = dp_panel_parse_dt(dp_panel);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return dp_panel;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 2d0dd4353cdf..aa135d5cedbd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,56 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-static u32 dp_parser_link_frequencies(struct device_node *of_node)
-{
-	struct device_node *endpoint;
-	u64 frequency = 0;
-	int cnt;
-
-	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
-	if (!endpoint)
-		return 0;
-
-	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
-
-	if (cnt > 0)
-		of_property_read_u64_index(endpoint, "link-frequencies",
-						cnt - 1, &frequency);
-	of_node_put(endpoint);
-
-	do_div(frequency,
-		10 * /* from symbol rate to link rate */
-		1000); /* kbytes */
-
-	return frequency;
-}
-
-static int dp_parser_misc(struct dp_parser *parser)
-{
-	struct device_node *of_node = parser->pdev->dev.of_node;
-	int cnt;
-
-	/*
-	 * data-lanes is the property of dp_out endpoint
-	 */
-	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
-	if (cnt < 0) {
-		/* legacy code, data-lanes is the property of mdss_dp node */
-		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
-	}
-
-	if (cnt > 0)
-		parser->max_dp_lanes = cnt;
-	else
-		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
-
-	parser->max_dp_link_rate = dp_parser_link_frequencies(of_node);
-	if (!parser->max_dp_link_rate)
-		parser->max_dp_link_rate = DP_LINK_RATE_HBR2;
-
-	return 0;
-}
-
 int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
 {
 	struct platform_device *pdev = parser->pdev;
@@ -101,10 +51,6 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
-	rc = dp_parser_misc(parser);
-	if (rc)
-		return rc;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1e2ca4efb029..bc56e0e8c446 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -11,8 +11,6 @@
 #include "msm_drv.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
-#define DP_MAX_NUM_DP_LANES	4
-#define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
 /**
  * struct dp_parser - DP parser's data exposed to clients
@@ -24,8 +22,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	u32 max_dp_lanes;
-	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
 };
 
-- 
2.39.2


