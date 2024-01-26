Return-Path: <linux-arm-msm+bounces-8469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D13DA83E147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4979AB24769
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C6A20DC5;
	Fri, 26 Jan 2024 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grMkqyvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592920DC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293596; cv=none; b=bj6/BZyxvzrHSc/BprwHOJ+Cn12sCRxH1Q1svpjdPzB4q4kmxlsRYf5cInU6Rjj8ey5/YlkjSVvmNNKsLq7fYhUThzhayBN7IFp7avf2NLQC2qX17CKBAcBZ4z7GKssvUaDy23hLvOKfvQ3qs5flkkEPhzbbFW74i2YpH/J5wGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293596; c=relaxed/simple;
	bh=CuOUcUYoOW9aEzG7k566U8KJoISzql09wErRpuOUKaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqCAN9Gw5aYEWf0I+BiGBqat+rnhNqZwhmiU5YQXnPCsrIsjb/2jCJGvsaYmsVe/1rdXQ8hkjt/OQSQaeokqrQCgBueX6PXDjSUlouvRDYyhwb4dVWKRAlf4JocbjucoU1Nr3g9DnvM5TaXaDvihlguvzw3cC1RxlE48vaUglwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grMkqyvV; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cf42ca9bb2so9216651fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293592; x=1706898392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDjngIAgyaNOEXPfDUMIuujOfmjvFlpOeLVhFSGQ3io=;
        b=grMkqyvVlWookfEKXoi/o4X88Tna0/SFulbOnkbX780X1JE+f8/DW63+wofAWn5xBV
         torIcywjrBRWpetf3yUliBgJLmofoyt8TeO9WwT9wSCNvGZuJBGSlI2ZhjCTAjZmgDgv
         dnOAH7a/BARJyXyrBcWEhzZU7SOa3uiVthVE6WhaZhxTwYwrEjHQsewuH7J+wkhKlTtG
         U6zCGgCASolBL11cHdoQ7qAJ942nVVWHmWy9w7KrgmPs7G9jtdLUHSadHMyxnlg55CDo
         RJS/G30kx27M3DIDIiOL7f6a/jK5D8DAYJUIcE9CNmpayKH1bpAaGQDjOs+Jfd7xCS8m
         ykQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293592; x=1706898392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDjngIAgyaNOEXPfDUMIuujOfmjvFlpOeLVhFSGQ3io=;
        b=DJNOC+CVhaVvQDlXjpvLqSD7hLf9JkZW9Y1Mtk1bjeftrphij++JE7S3Mkbhh7Fe/G
         o2iy0j9a0U5Iw0Pewt2q6Z5R9GTuZmxRDVJeG/HEPwdm/2HJUAK8shk5XV4olb82CFZX
         oSDXxuPVjNZcuppOGRQK6fJj5xV+L62kiqdXDJ7mk4sFll7QUkrITEZ+cvjcY+eJpVJl
         V/RQNvHJgDqGimMQR7B79hHUECk3jrx15vWj39I7j0rK3Knp8CAd8CUfuprvsJ90zYlY
         Wtr9zm9zeAng/XbHNlGfxzkQiS0/9KBoYHcL90XsO5lFPgR7qqfv+DgrpMiugXG3VKma
         kIxQ==
X-Gm-Message-State: AOJu0YxBxSH1yAnyDxCPQRq8S+prtjE1ZlfK9yQkrfNLU9oIJ+insR+s
	1e4V6yE/drRxVsPssrZ64i4i1VsALoRGb/iEnbecpSz3qIeb9LMBNI6rrPyJ17g=
X-Google-Smtp-Source: AGHT+IFXphI1kYlp3YvBXWbWG02DPEv3mXQiMhN77yi4pwgykj0H657zOsQ3VJ+Sb/Dvp0oBfyJ74g==
X-Received: by 2002:a2e:9350:0:b0:2cf:4d88:1763 with SMTP id m16-20020a2e9350000000b002cf4d881763mr93947ljh.98.1706293592231;
        Fri, 26 Jan 2024 10:26:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:27 +0200
Subject: [PATCH RESEND v3 08/15] drm/msm/dp: split dp_ctrl_clk_enable into
 four functuions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-8-098d5f581dd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CuOUcUYoOW9aEzG7k566U8KJoISzql09wErRpuOUKaE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQNmuwnvMtAdWnWeW8XqJhmP2nOSPIVXx1p
 imHCbaP3KOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1U2JB/9QXvUlqVQ0V8zl6VsILjelMWxoP3yfHiL863g8YBpYiJaG8cvbbxnurkwwUFqzRjjHhLv
 uHbnduoJ5+B4UOqpdrTSIHXjBx8FwmKLkuDmzUjC7c4ypcK6xyOOa++op/yMUWnu5GTxt3wIlH+
 uy/IyfEIUlL/k9lwnj4TaOiVLWEQbPlq8265+GETmqf72qAQTcE7a2mfENSlDIThjNyMN4w7cqM
 +ghBAic/jlz20LKYyYDP9VQuIzECqqnNIskFr8sTtF18aFKctfnAPvjFxDjr4+ZMB5zm0+Fx0W7
 CBrx+JDxZdmYRP9cBx6SjskNqehcVNW7ZsFEyKirHSTUeovc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Split the dp_ctrl_clk_enable() beast into four functions, each of them
doing just a single item: enabling or disabling core or link clocks.
This allows us to cleanup the dss_module_power structure and makes
several dp_ctrl functions return void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 220 +++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  16 +--
 drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
 3 files changed, 108 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cfcf6136ffa6..e367eb8e5bea 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -69,11 +69,6 @@ struct dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
-struct dss_module_power {
-	unsigned int num_clk;
-	struct clk_bulk_data *clocks;
-};
-
 struct dp_ctrl_private {
 	struct dp_ctrl dp_ctrl;
 	struct drm_device *drm_dev;
@@ -84,7 +79,12 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
-	struct dss_module_power mp[DP_MAX_PM];
+	unsigned int num_core_clks;
+	struct clk_bulk_data *core_clks;
+
+	unsigned int num_link_clks;
+	struct clk_bulk_data *link_clks;
+
 	struct clk *pixel_clk;
 
 	struct completion idle_comp;
@@ -96,15 +96,6 @@ struct dp_ctrl_private {
 	bool stream_clks_on;
 };
 
-static inline const char *dp_pm_name(enum dp_pm_type module)
-{
-	switch (module) {
-	case DP_CORE_PM:	return "DP_CORE_PM";
-	case DP_CTRL_PM:	return "DP_CTRL_PM";
-	default:		return "???";
-	}
-}
-
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
@@ -1337,67 +1328,76 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	return ret;
 }
 
-int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
-		       enum dp_pm_type pm_type, bool enable)
+int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dss_module_power *mp;
 	int ret = 0;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	if (pm_type != DP_CORE_PM &&
-	    pm_type != DP_CTRL_PM) {
-		DRM_ERROR("unsupported ctrl module: %s\n",
-			  dp_pm_name(pm_type));
-		return -EINVAL;
+	if (ctrl->core_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "core clks already enabled\n");
+		return 0;
 	}
 
-	if (enable) {
-		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "core clks already enabled\n");
-			return 0;
-		}
+	ret = clk_bulk_prepare_enable(ctrl->num_core_clks, ctrl->core_clks);
+	if (ret)
+		return ret;
 
-		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "links clks already enabled\n");
-			return 0;
-		}
+	ctrl->core_clks_on = true;
 
-		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "Enable core clks before link clks\n");
-			mp = &ctrl->mp[DP_CORE_PM];
+	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
 
-			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-			if (ret)
-				return ret;
+	return 0;
+}
 
-			ctrl->core_clks_on = true;
-		}
+void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	clk_bulk_disable_unprepare(ctrl->num_core_clks, ctrl->core_clks);
+
+	ctrl->core_clks_on = false;
+
+	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
+}
+
+static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	int ret = 0;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (ctrl->link_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "links clks already enabled\n");
+		return 0;
 	}
 
-	mp = &ctrl->mp[pm_type];
-	if (enable) {
-		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-		if (ret)
-			return ret;
-	} else {
-		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
+	if (!ctrl->core_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "Enable core clks before link clks\n");
+
+		dp_ctrl_core_clk_enable(dp_ctrl);
 	}
 
-	if (pm_type == DP_CORE_PM)
-		ctrl->core_clks_on = enable;
-	else
-		ctrl->link_clks_on = enable;
+	ret = clk_bulk_prepare_enable(ctrl->num_link_clks, ctrl->link_clks);
+	if (ret)
+		return ret;
 
-	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
-		   enable ? "enable" : "disable",
-		   dp_pm_name(pm_type));
-	drm_dbg_dp(ctrl->drm_dev,
-		   "stream_clks:%s link_clks:%s core_clks:%s\n",
+	ctrl->link_clks_on = true;
+
+	drm_dbg_dp(ctrl->drm_dev, "enale link clocks\n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
 		   ctrl->stream_clks_on ? "on" : "off",
 		   ctrl->link_clks_on ? "on" : "off",
 		   ctrl->core_clks_on ? "on" : "off");
@@ -1405,6 +1405,23 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	return 0;
 }
 
+static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
+
+	ctrl->link_clks_on = false;
+
+	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
+}
+
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1421,7 +1438,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
+	ret = dp_ctrl_link_clk_enable(&ctrl->dp_ctrl);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
@@ -1569,11 +1586,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 * link maintenance.
 	 */
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
-		return ret;
-	}
+
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+
 	phy_power_off(phy);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
@@ -1591,7 +1606,6 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
@@ -1601,10 +1615,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -1708,11 +1719,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	ret = dp_ctrl_off(&ctrl->dp_ctrl);
-	if (ret) {
-		DRM_ERROR("failed to disable DP controller\n");
-		return ret;
-	}
+	dp_ctrl_off(&ctrl->dp_ctrl);
 
 	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
 	if (ret) {
@@ -1828,7 +1835,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
+	dp_ctrl_core_clk_enable(&ctrl->dp_ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
@@ -2024,12 +2031,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 	return ret;
 }
 
-int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2046,11 +2052,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-		return ret;
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -2060,15 +2062,13 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
-	return ret;
 }
 
-int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2076,10 +2076,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
 		phy, phy->init_count, phy->power_count);
@@ -2088,19 +2085,13 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
 		phy, phy->init_count, phy->power_count);
-
-	return ret;
 }
 
-int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret = 0;
-
-	if (!dp_ctrl)
-		return -EINVAL;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2116,16 +2107,11 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
-
-	return ret;
 }
 
 irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
@@ -2186,37 +2172,33 @@ static const char *ctrl_clks[] = {
 static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dss_module_power *core, *link;
 	struct device *dev;
 	int i, rc;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dev = ctrl->dev;
 
-	core = &ctrl->mp[DP_CORE_PM];
-	link = &ctrl->mp[DP_CTRL_PM];
-
-	core->num_clk = ARRAY_SIZE(core_clks);
-	core->clocks = devm_kcalloc(dev, core->num_clk, sizeof(*core->clocks), GFP_KERNEL);
-	if (!core->clocks)
+	ctrl->num_core_clks = ARRAY_SIZE(core_clks);
+	ctrl->core_clks = devm_kcalloc(dev, ctrl->num_core_clks, sizeof(*ctrl->core_clks), GFP_KERNEL);
+	if (!ctrl->core_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < core->num_clk; i++)
-		core->clocks[i].id = core_clks[i];
+	for (i = 0; i < ctrl->num_core_clks; i++)
+		ctrl->core_clks[i].id = core_clks[i];
 
-	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
+	rc = devm_clk_bulk_get(dev, ctrl->num_core_clks, ctrl->core_clks);
 	if (rc)
 		return rc;
 
-	link->num_clk = ARRAY_SIZE(ctrl_clks);
-	link->clocks = devm_kcalloc(dev, link->num_clk, sizeof(*link->clocks), GFP_KERNEL);
-	if (!link->clocks)
+	ctrl->num_link_clks = ARRAY_SIZE(ctrl_clks);
+	ctrl->link_clks = devm_kcalloc(dev, ctrl->num_link_clks, sizeof(*ctrl->link_clks), GFP_KERNEL);
+	if (!ctrl->link_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < link->num_clk; i++)
-		link->clocks[i].id = ctrl_clks[i];
+	for (i = 0; i < ctrl->num_link_clks; i++)
+		ctrl->link_clks[i].id = ctrl_clks[i];
 
-	rc = devm_clk_bulk_get(dev, link->num_clk, link->clocks);
+	rc = devm_clk_bulk_get(dev, ctrl->num_link_clks, ctrl->link_clks);
 	if (rc)
 		return rc;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index d8007a9d8260..023f14d0b021 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,17 +17,11 @@ struct dp_ctrl {
 	bool wide_bus_en;
 };
 
-enum dp_pm_type {
-	DP_CORE_PM,
-	DP_CTRL_PM,
-	DP_MAX_PM
-};
-
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
-int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
@@ -44,7 +38,7 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
 
-int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
-		       bool enable);
+int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 33e9d7deb3f8..6fbbd0f93d13 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -432,7 +432,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, true);
+	dp_ctrl_core_clk_enable(dp->ctrl);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -446,7 +446,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, false);
+	dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
 }
 

-- 
2.39.2


