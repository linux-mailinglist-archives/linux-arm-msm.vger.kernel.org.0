Return-Path: <linux-arm-msm+bounces-8466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8883E142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5E62839C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AEF20DCC;
	Fri, 26 Jan 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKIjeEfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1C20B3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293594; cv=none; b=OdDVq5h5ZzkbQ0H8Swn4nW3dG6rAioDaTMrX+i3BH120kGCZa5kN2h0Ra18F5NloU+8hSikTdecmVYrgWcZachpp5OfNtAglnfUvHCE67XsR1xHza9+czfhn7xHIxdU+yE3TPU0G9104Z8PBPFqZmnRlIzW1JmTjk1WtWB8o9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293594; c=relaxed/simple;
	bh=hNPMvZ0gaSY5MPKRR/EBckDQolNgLCvX0skn+OxZNXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtSTB+lONosQ5FzJd8MknIHoRciUZmUoKHygnzMQsJlbQf366lXVk9Qskagd4C81ms6ttkVj1w+mi7VDaQLs6+hNCmsMlw78Gsrjzzd/S4QpjT2yTAlfUjieIj30US/xIfcIkhffRSOXQ2gOb1Nw6QNZSbWaC1stVcU61mFDvIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKIjeEfO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf1fd1cc5bso7693891fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293590; x=1706898390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=becAfxylwmZejS0VIfTonRkPwt9DcFnsVmjDJA3q3c4=;
        b=lKIjeEfOXff51MP9bYhT9W/oMsL7n61ZmFfYkzdBd65Sz4GnYNWhlj7PaB0RuBGx5C
         quQILhF+0X2g7mef+Cg/zO9XAXQClJwksZMo/dvdBgqaiLPEgrMPN1KDyq55i+YzsWR8
         tWngCEf03EEPRrPP223uLKd0rgJ7Xb1FQ7rR2QcdIn8FQejZcMRSem6zdlPYTsHbgnz3
         0/8rCi7dIizrGuW8qOkKAensoKRM+M3BTxcLxlLsTfBLYB3QWxKSlbBOqiC1YKv61Bwv
         s5ctX9RYCFe9xRoU2xRVCSNfOKv+2ThUx6hUK+Jrr6QbsAS5owUStCppJwNwuAl9Z/nE
         7tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293590; x=1706898390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=becAfxylwmZejS0VIfTonRkPwt9DcFnsVmjDJA3q3c4=;
        b=Yq69NRFyQ+QFvs76RNx95qg8wI122S4914cGsHHGJLYq2d3r2RB6H1wxniWA9gh1TW
         nJTUOozkKm8XM2SfAb3bIY+Pqa3xW4FE9Xl+d13cDUIgInlKfToYTKnNk/geoq2t4r55
         TXEacKsbp20j9oeiDXp0CbwCFbFSRCp14GH3KmicSGqaRDFGQbSRBuUOGn14l1JeRiGe
         +fKn77+QFE9KcGlwZSflYrYh4NmJGJURflzYwduWPb7kMaCe84UkWEz5fshsJ53X74tV
         sPANY/cdR56rAsvElZJ6UzdKb/iQet3j5IgVic1WZUFCDYDPfjgcKMWawO7Yu/1g5aV4
         bOFg==
X-Gm-Message-State: AOJu0YxkVf54bKP5RENtUBHYqiJ9MQX4QHOxRZsNPUf+LFN4SpaI89wW
	QJWcU9DbyWYeG+rjeXu0bU8fVJN2D188kjepPArLoCfivd9Q5Z66mO37mi9KpK4=
X-Google-Smtp-Source: AGHT+IFDgewkzfPfYs4LoKC03Wro/TzujtoDV1JPwPIUfoGEIGsM+W3SR9UE6BHvCdkG6Vd1ZyErVw==
X-Received: by 2002:a2e:8316:0:b0:2cd:50a7:12d0 with SMTP id a22-20020a2e8316000000b002cd50a712d0mr235206ljh.38.1706293590616;
        Fri, 26 Jan 2024 10:26:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:25 +0200
Subject: [PATCH RESEND v3 06/15] drm/msm/dp: simplify stream clocks
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-6-098d5f581dd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10486;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hNPMvZ0gaSY5MPKRR/EBckDQolNgLCvX0skn+OxZNXs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQSSYv8c1DSvtZRJhpBMqcUiTUMJ4Qzsp9m
 6B/y62AkAmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1bJ5B/4+oMoasQ1D+tsbBp1nzqLZ5nio8y2dDl5L06I+E4qwZdO5s/Gt0zAsgalHpoV3Z31pZes
 TYcuSsndx+FqyG6uSErko82wDWde9a3xZshxudS1B/W7gjCw/dFlxmLEgb1QSkDz4S6NJa89WR9
 aDAkAyZTCwDvlVGeCm840BNgjhbFG/qwO8GjuK/1gUaSoJZXkvVfwNyZ6sc42UyKtRAVXeygYBC
 2NyIrzrln4v0DPe12y847cgQfwQWjb2SfP3E3mr/qDhECzWUDc77Zz1R9RTrZARcOcEy6pJuwb1
 A6CktOV/skpgBuOLNfG1AEQ+I+hPNOeEkeCk3h/UDvzYlX+q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is only a single DP_STREAM_PM clock, stream_pixel. Instead of
using a separate dss_module_power instance for this single clock, handle
this clock directly. This allows us to drop several wrapping functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c   | 91 ++++++++++++++++----------------------
 drivers/gpu/drm/msm/dp/dp_parser.c | 41 ++++-------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 -
 3 files changed, 47 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index da29281c575b..56a424a82a1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -79,6 +79,8 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct clk *pixel_clk;
+
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
@@ -1320,27 +1322,6 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	return ret;
 }
 
-static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
-			enum dp_pm_type module, char *name, unsigned long rate)
-{
-	u32 num = ctrl->parser->mp[module].num_clk;
-	struct clk_bulk_data *cfg = ctrl->parser->mp[module].clocks;
-
-	while (num && strcmp(cfg->id, name)) {
-		num--;
-		cfg++;
-	}
-
-	drm_dbg_dp(ctrl->drm_dev, "setting rate=%lu on clk=%s\n",
-						rate, name);
-
-	if (num)
-		clk_set_rate(cfg->clk, rate);
-	else
-		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
-				name, rate);
-}
-
 int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		       enum dp_pm_type pm_type, bool enable)
 {
@@ -1351,8 +1332,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	if (pm_type != DP_CORE_PM &&
-	    pm_type != DP_CTRL_PM &&
-	    pm_type != DP_STREAM_PM) {
+	    pm_type != DP_CTRL_PM) {
 		DRM_ERROR("unsupported ctrl module: %s\n",
 			  dp_parser_pm_name(pm_type));
 		return -EINVAL;
@@ -1371,12 +1351,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 			return 0;
 		}
 
-		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "pixel clks already enabled\n");
-			return 0;
-		}
-
 		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
 			drm_dbg_dp(ctrl->drm_dev,
 				   "Enable core clks before link clks\n");
@@ -1401,8 +1375,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	if (pm_type == DP_CORE_PM)
 		ctrl->core_clks_on = enable;
-	else if (pm_type == DP_STREAM_PM)
-		ctrl->stream_clks_on = enable;
 	else
 		ctrl->link_clks_on = enable;
 
@@ -1734,14 +1706,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	}
 
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		return ret;
 	}
 
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			return ret;
+		}
+		ctrl->stream_clks_on = true;
+	}
+
 	dp_ctrl_send_phy_test_pattern(ctrl);
 
 	return 0;
@@ -1977,14 +1958,23 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		}
 	}
 
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
-		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		goto end;
 	}
 
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			goto end;
+		}
+		ctrl->stream_clks_on = true;
+	}
+
 	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
 		dp_ctrl_link_retrain(ctrl);
 
@@ -2036,11 +2026,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	if (ctrl->stream_clks_on) {
-		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
-		if (ret) {
-			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
-			return ret;
-		}
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
@@ -2108,9 +2095,10 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
-	if (ret)
-		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
@@ -2174,7 +2162,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl_private;
 	int rc = 0;
-	struct dss_module_power *core, *ctrl, *stream;
+	struct dss_module_power *core, *ctrl;
 	struct device *dev;
 
 	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
@@ -2182,7 +2170,6 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 
 	core = &ctrl_private->parser->mp[DP_CORE_PM];
 	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
-	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
 
 	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc)
@@ -2192,9 +2179,9 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return -ENODEV;
 
-	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
-	if (rc)
-		return -ENODEV;
+	ctrl_private->pixel_clk = devm_clk_get(dev, "stream_pixel");
+	if (IS_ERR(ctrl_private->pixel_clk))
+		return PTR_ERR(ctrl_private->pixel_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 2d9d126c119b..fe2b75f7555a 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -150,12 +150,11 @@ static inline bool dp_parser_check_prefix(const char *clk_prefix,
 static int dp_parser_init_clk_data(struct dp_parser *parser)
 {
 	int num_clk, i, rc;
-	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	num_clk = of_property_count_strings(dev->of_node, "clock-names");
 	if (num_clk <= 0) {
@@ -174,9 +173,6 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 
 		if (dp_parser_check_prefix("ctrl", clk_name))
 			ctrl_clk_count++;
-
-		if (dp_parser_check_prefix("stream", clk_name))
-			stream_clk_count++;
 	}
 
 	/* Initialize the CORE power module */
@@ -207,47 +203,30 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 		return -ENOMEM;
 	}
 
-	/* Initialize the STREAM power module */
-	if (stream_clk_count == 0) {
-		DRM_ERROR("no stream (pixel) clocks are defined\n");
-		return -EINVAL;
-	}
-
-	stream_power->num_clk = stream_clk_count;
-	stream_power->clocks = devm_kcalloc(dev,
-			stream_power->num_clk, sizeof(struct clk_bulk_data),
-			GFP_KERNEL);
-	if (!stream_power->clocks) {
-		stream_power->num_clk = 0;
-		return -ENOMEM;
-	}
-
-	return 0;
+	return num_clk;
 }
 
 static int dp_parser_clock(struct dp_parser *parser)
 {
 	int rc = 0, i = 0;
 	int num_clk = 0;
-	int core_clk_index = 0, ctrl_clk_index = 0, stream_clk_index = 0;
-	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	int core_clk_index = 0, ctrl_clk_index = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	rc =  dp_parser_init_clk_data(parser);
-	if (rc) {
+	if (rc < 0) {
 		DRM_ERROR("failed to initialize power data %d\n", rc);
-		return -EINVAL;
+		return rc;
 	}
 
+	num_clk = rc;
+
 	core_clk_count = core_power->num_clk;
 	ctrl_clk_count = ctrl_power->num_clk;
-	stream_clk_count = stream_power->num_clk;
-
-	num_clk = core_clk_count + ctrl_clk_count + stream_clk_count;
 
 	for (i = 0; i < num_clk; i++) {
 		rc = of_property_read_string_index(dev->of_node, "clock-names",
@@ -260,10 +239,6 @@ static int dp_parser_clock(struct dp_parser *parser)
 				core_clk_index < core_clk_count) {
 			core_power->clocks[core_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			core_clk_index++;
-		} else if (dp_parser_check_prefix("stream", clk_name) &&
-				stream_clk_index < stream_clk_count) {
-			stream_power->clocks[stream_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-			stream_clk_index++;
 		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
 			ctrl_power->clocks[ctrl_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 4ccc432b4142..c6fe26602e07 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -19,7 +19,6 @@
 enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
-	DP_STREAM_PM,
 	DP_MAX_PM
 };
 
@@ -40,7 +39,6 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	switch (module) {
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
-	case DP_STREAM_PM:	return "DP_STREAM_PM";
 	default:		return "???";
 	}
 }

-- 
2.39.2


