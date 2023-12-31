Return-Path: <linux-arm-msm+bounces-6163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D691820957
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613591C21ACF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245402906;
	Sun, 31 Dec 2023 00:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DaspcHan"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438B23D5
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso4515926e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983446; x=1704588246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmzxiDtfIj9ufHxF00tEh02Gm3cNvE43DWsuO5/QTNA=;
        b=DaspcHanql2MU7zCekJOZfvfB1TETfvokdABI5So7ODOvvQVNrr6AyVuhmP8zYUDMK
         jjXl1ZhwbQdZXOEubW3X6RtpNQS/J2U6IntzzWx8hO/Xs+SW/DyWl6r6v3NQwDxO/a4Z
         phbzwZkGQZEglK9LapFn0I1r/0EYKS+fDMXw3c3WDRK2TuYDyYpjLdrW6OSeA57LBwfF
         BKB2YW0+AVuJeaxzh/xr7RNU7vUcZCv3ieuBxYb+tOCeyQzWx+upjpQ7GdEqzfIMBYxi
         AR6zoiGvVhiIx7sFyHAs7fLBWZRry2raD9mWMRxQknCDcyoiQ8bNayDvkD2oFWp8liVl
         ipKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983446; x=1704588246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmzxiDtfIj9ufHxF00tEh02Gm3cNvE43DWsuO5/QTNA=;
        b=Sf8rEO8a3cXQ64B5pUEHjfNiPOMI7u3haPVwqBT+SZR3cZF3BIdPbB+yVBzm8VrlP5
         oD9qSUH7lPJnBGeqQoi78lgxweL+DTS5k0syYW3X5/lMhZpxoh1BLJnKsTCrSnpo4Kju
         yg7mEaLF98PFBXHiuFACxGz5zMgh3cMN8U68x+OrlVsJ9xgM625Jaoo5HBtxenNPW0hW
         Sm0dDORkYi+8T8IbMHSrUhOQWYeDRkGUzP7SvtfL+uY+Ik+GQ2h0jh5sHXUA1WUiX9ss
         k+5RAg9tu+iPDcHjkcqr/NuQn3wMCFhd8WlWKo0hRV+eoEYugdPsmAsdY1RnnGq3D9R5
         rIrw==
X-Gm-Message-State: AOJu0YyPi0/p1d8aBF3PfWExWnEj20NHDQ+D5cvxocahDKkc6tPfcwQm
	K3pyLY+Bte859ZAtrZrkllgJou3PSuF7eg==
X-Google-Smtp-Source: AGHT+IEFDu++j9wwDKrWytuUZnRSvpg4SN5GmtQAwI5911iEJdNvaGxrORHrc6uD5vO2CUCXzhzW3w==
X-Received: by 2002:a05:6512:38c1:b0:50e:5770:718b with SMTP id p1-20020a05651238c100b0050e5770718bmr6978860lft.11.1703983446410;
        Sat, 30 Dec 2023 16:44:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:44:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:44:00 +0200
Subject: [PATCH v2 13/15] drm/msm/dp: move link property handling to
 dp_panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-13-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=a/dqsh/DEIltXYPrbLQ9upGy63erTmReZAb/0kas5zo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlLbKm4jpRfV1QaZHTjtUtMkgLsC0pnYhLWm
 EUxcOt3ekiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SwAKCRCLPIo+Aiko
 1R/VB/9TF7J/kg40388SB1VD/yMYThWvCMxBT2xUbF2kMh/J0NPG+kpNi73HlrsjblnchlXY4Dp
 xXcXftnoBrz+zEOrAg0PhyTD8AkR3F6c5LgtwzaH9OLv03yq6opWB6vJxWlc/vtrFr9iLswpxLe
 6At8qRY6nKSvbVCWmBAMVloI6N/MxAjSnTjVbZWNufhPn5PZVDqCcluguDKaVwhNDhgkIOnJ72p
 kNHnwbmqi66Ej5JubjHA454QaNxIBFv3Ijs9d2xUYdSxTzCeG/ZElVPRkZBiHHV2cW0RgHQWfNK
 L1leUnonPCxtafmEO0hlc7O8sKQ9A6HIhu8fTBN4ivPgr+6K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of passing link properties through the separate struct, parse
them directly in the dp_panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 -----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 66 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 54 ------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  4 ---
 5 files changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5ad96989c5f2..f19cb8c7e8cb 100644
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
index 127f6af995cd..8242541a81b9 100644
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
@@ -386,10 +393,65 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
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
+	struct dp_panel_private *panel;
+	struct device_node *of_node;
+	int cnt;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	of_node = panel->dev->of_node;
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
@@ -408,6 +470,10 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
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


