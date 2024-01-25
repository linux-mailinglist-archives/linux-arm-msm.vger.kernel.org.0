Return-Path: <linux-arm-msm+bounces-8366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5883D034
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9B628F9A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1FF125BC;
	Thu, 25 Jan 2024 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ic8e8Fe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC9125C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223773; cv=none; b=rnZRAlhNaoJjFiXXnOOH/FyPhyf5+8Z3nlD6K5T+fLjtwy6iclDBagyJibIl///U0Qb/zsjzvyeo4hxClt14xuP3z4uh2qGA0f6XLf5m9QhOPpAum0gJTIH/qdbrbe/QX0DPWHScaL/HxNsdeLQsJuPOd0TaaAmaxM8n5V8o8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223773; c=relaxed/simple;
	bh=0NAS4mEEbdPscE96IS/ZQUPtnwStNLMs/YpeYKfO3to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlVsmBaOm8kv8RU68TYRokvTrfyY+Zzb/Oci4fiC385KP7SaVWGzUgWdIV9gdOrN0KN9fBvYqqn7L3hQpXgO1MpNSrBLVwrMTi3p74WAbVB4bDiqNotlnRZVKZYvoImsb8JKyvnF1QaONpS34htVuh5rgtbIYRuGy3v/uoy7B4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ic8e8Fe+; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf42ca9bb2so5519521fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223770; x=1706828570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxGc0QEVEAiuhcb+m6WRpEuH/wAutaZBlt2LY4FoYiU=;
        b=Ic8e8Fe+M/AmCfhv+gqtl/HpDhAMpu59hzd4qTNoxje7jH4YtCQnhdDMX0puW9FAkF
         qhLVm1rgB78i3288W6BS/mqeMKFCO2sCY20lagY6nn6NhURr/mhvPLk5OzFyavtd8yLn
         0aRfPjweXX+9bwWwlm4YjVM2fwtNmVI0+sldaFrfnDEXbblA7m/SSFv2qAmW+vpIziss
         +RjMms8Be9+OGgUuTx0B3ihEn2RYHfOmF7nCUQf9YVWM3qIQKPKXufKmHfc9Vw5mS7vr
         HCWtjzgixP6ebd/9tpa/nRWSMgZE/niqhGu1hdY1FR6Cxo2+86NcQ9SN6Rta6VXUPsWB
         oNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223770; x=1706828570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxGc0QEVEAiuhcb+m6WRpEuH/wAutaZBlt2LY4FoYiU=;
        b=wcTSkYs9T62FyIDssi9ORDJEO9bMXTPADTUrj90nGnOjswgkzs4XDchgzofPWKpMvq
         5itG1ZNkDTngp0I+ckIeLgW8y+xvXBzQ453xrI75BZhoCt78fRr8k68dv0FjFE9AT/op
         bIeKcCQVP4lhQEhi/0hiV6DQ2mHzt5dza3BOKBCxFVXz6Cbukyw38t/3PyZ/cBgv8RWI
         DN6z1czQKgzArZC12f+IwnKFQYaHeMwgNFvcq7kQXelk4NYPxIGoByh/cod+DLCOiT5S
         FQ1pdQIe7KkzHsYdpbYcQB3CwiP/3+CPn5ikkhAJuduHmOQ6y2zmlz+KIhIwrtb7X6vk
         bd+w==
X-Gm-Message-State: AOJu0YyPHDxOh7dL1lXRARdv0dGD0u5/w+A43gVjMR/hvKnAtlZZ3ucM
	gDtze8hSqK6xxBhrH/CByEEPs+OCWOXOMLmdlqBKo9YQbZJ3lZmn1gthJtiLBT8=
X-Google-Smtp-Source: AGHT+IElOOYFQMI9jkSzU191y5XBrXiTVF6X/Bz3C3MsHWvFm6s/qeVBRMn6L8D77beQiBcZxgxqBw==
X-Received: by 2002:a2e:9098:0:b0:2cc:e976:5915 with SMTP id l24-20020a2e9098000000b002cce9765915mr203162ljg.49.1706223769784;
        Thu, 25 Jan 2024 15:02:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:42 +0200
Subject: [PATCH v3 13/15] drm/msm/dp: move link property handling to
 dp_panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-13-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 bh=0NAS4mEEbdPscE96IS/ZQUPtnwStNLMs/YpeYKfO3to=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiIxrdCDzmlKXYADEjnppFnFlH8+g0oGBGqm
 kiFudUc9IGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1b8XCACyz11o8PXL1aavfiXQr7b3mbB7ckTvcEJAnKwGWtXSJzWhXzv/TcwlHM5kUQhPmo+6D+F
 GlEUFZgMZaFqgemhwmMdJ32Q6hsY/4srjZG1irXHO/rAHxuCZ2B2MyiM2cqZqlnhUCPe/855m+C
 ymyBqQ7kOxHBID/warSZi0OuPKytmnJy1Bs1yAGyAceRNeNjIh/dYAjvyYMhQ3MnNuh4pP6XQy5
 oMG6xocAgfJX9gOyD/omWhJL5Y43CqmJjAzHgkLLsy/9OGDhqyrUk1Moum49IK5Z5awbIjBjza+
 mlVivy/uKQpzg7UgqOkHdCQAjW56TwDMdWy0RVRtJ/w8SZlB
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
index 7306768547a6..21a66932e35e 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -11,8 +11,6 @@
 #include "msm_drv.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
-#define DP_MAX_NUM_DP_LANES	4
-#define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
 /**
  * struct dp_parser - DP parser's data exposed to clients
@@ -23,8 +21,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	u32 max_dp_lanes;
-	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
 };
 

-- 
2.39.2


