Return-Path: <linux-arm-msm+bounces-8468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0F83E144
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 490EC283993
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBAC20DD5;
	Fri, 26 Jan 2024 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHvKcfnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58E20DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293595; cv=none; b=Zu6u2S14nhW212Ki6WaX7V/5Z5FpIIL5hBcvJG1mpp+6XH/4japv8d1s1shJOUpupV0feH5FQrsg4yyP9+VywXArqFzMXVyvxa+W82gzi4wrI+ZpMhOpkGZMNT5YufOc9KACpd4bMhYZ2ry4p8+cjjSkw5sUig3qRaX4GbX/kwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293595; c=relaxed/simple;
	bh=jlCbwCtXmASgMzTIlxwNTO3EoGrFovMlywq9Nb9Ul3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlN1j01A7/Wa3c6iTPlApfxNjZxrAURHzis610TyMGAXV3woTCnNvrFvgczz+KFcfaCKWF3KsPfbhinYs47k/w07E8Ow4Cw92bhKEJluulpIxqRblPLBu29cdvecjhOrXwOGCyPi2Dq9CdqBI/W3aVDBpmTYflLqEJqC47IX3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHvKcfnA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so6644891fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293591; x=1706898391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LV6p00KhO1LDwvwQC4F9WJVNdeFMCAAEui1qxHdo5Cw=;
        b=BHvKcfnAqOWpSkasf+M7SIb/0h7d88KxyqEiQxZBLz9wY7tnE1G6sveCzfcs/Ai2R4
         P072eeDDLBUrHK4BvM+iqUXVWstSUvVLfoyII2EEk0knLvLAKpVHYY5kI5JObq/q7fPp
         C8lJ75fjY6nTlcGKWaHlND+cux/YAczZW/rJQdJ7xfYQSZQ2n6XvAgdueyb0WwL1qNY3
         a1Zl4vI8efl+fV3DHS6zdZaSbLkPNxZPrDX6Y7CpI1X1LkUUNovtyiV2l7eUIQsS8iRJ
         0cgfU/LwhUcVzAcxhEn/qQE/vcoOb784ujFs+zyfmAfq7alMrWGaIpCb/h0Qxn36G9JL
         jo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293591; x=1706898391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV6p00KhO1LDwvwQC4F9WJVNdeFMCAAEui1qxHdo5Cw=;
        b=fJAnff+EaVcd16ifZce+4qPsxc1Z7JHfs96b5ifvjtVdodV6CSw9dwD6hQ6sL6Klqi
         ii+3P6ibiFxjD+xJeHu7mlCNIFmucbblRifdCqqxJ5gYhZe79OgK1CdfEAj1A4MM11XB
         DKTs9AsTlO6dY/0egh8jOCaRU8eDWE700+zBseHjEtdvEIgyVgpU0Az+0IAX2RaPEfyt
         hKS1c0m0UwMkipjehUIzlpCkukRAIYY/tofDswVERFWt8nNsUONTbdIjBV8e8BFlzqis
         uuiUcnKW9aPuns/GtyTZDkWfYB4QCpNuJIwidQ5EvjOQzXn/3r6yQQjXQoU/QGWxjv8X
         auzw==
X-Gm-Message-State: AOJu0YyFDq3UfvKERlSaxRrRCz6x5iKBDvozS1AXFtRnoNDm1mpP/vbd
	ed6inxVers+2HdpL0+UoCL+mwVusaCfbI+AAAQPD0WUbXz7NG7TeCFyRq22bN88=
X-Google-Smtp-Source: AGHT+IFe6n5lhuUGZ/t0dU5rxyqzKp6v88Ja4oC0wn4/NqqTa7zBrtXpaZn8zEdv77qwvMckCgFSzw==
X-Received: by 2002:a2e:b910:0:b0:2cf:32d3:3073 with SMTP id b16-20020a2eb910000000b002cf32d33073mr191703ljb.47.1706293591463;
        Fri, 26 Jan 2024 10:26:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:26 +0200
Subject: [PATCH RESEND v3 07/15] drm/msm/dp: stop parsing clock names from
 DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-7-098d5f581dd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10440;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jlCbwCtXmASgMzTIlxwNTO3EoGrFovMlywq9Nb9Ul3Y=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rmnwH/wsq3HTCT6yk5yBEbuqxtws+YZ046eu7LP6+/K
 BnBP8Wxk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT6Yhi/593Z/MF9jSXSV11
 OcVTGh29NwgenOa2cgJjn4bBvZszfotUMQrKWVycW13hpHVDVYx9Y7DcRZGwMyUVKil+XeId346
 9WC3JrrFCsrBj5nJJxYmVkrNlbXWVnHfPfLIhVHN//oWqdPWSUsaQvSXprEd2+KtzOlde+VjzZd
 1JfldXzeV+f7aa+lqpqBu37Xo9SW2/xqudq2RvfChwzQ7wrTe2brmd66TE5aLIHPNYN3ti1tFIA
 /GXxSsffnoaXrpW7vLtG8JC01mc65Ld2i/9lhHkvayctfONE+vKmoC2gw8//Uq/Nf118TYd1Rmb
 l+2oCPuZXtNnwMp6KUDo9Y6rGwXj+HVPrF4ZclqihO0QAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All supported platforms use the same clocks configuration. Instead of
parsing names from DT in a pretty complex manner, use the static
configuration. If at some point newer (or older) platforms have
different clock configuration, this clock config can be moved to the
device data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c   |  73 ++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h   |   6 ++
 drivers/gpu/drm/msm/dp/dp_parser.c | 112 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  22 --------
 4 files changed, 63 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 56a424a82a1b..cfcf6136ffa6 100644
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
@@ -1334,7 +1349,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	if (pm_type != DP_CORE_PM &&
 	    pm_type != DP_CTRL_PM) {
 		DRM_ERROR("unsupported ctrl module: %s\n",
-			  dp_parser_pm_name(pm_type));
+			  dp_pm_name(pm_type));
 		return -EINVAL;
 	}
 
@@ -1354,7 +1369,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
 			drm_dbg_dp(ctrl->drm_dev,
 				   "Enable core clks before link clks\n");
-			mp = &ctrl->parser->mp[DP_CORE_PM];
+			mp = &ctrl->mp[DP_CORE_PM];
 
 			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
 			if (ret)
@@ -1364,7 +1379,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		}
 	}
 
-	mp = &ctrl->parser->mp[pm_type];
+	mp = &ctrl->mp[pm_type];
 	if (enable) {
 		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
 		if (ret)
@@ -1380,7 +1395,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
 		   enable ? "enable" : "disable",
-		   dp_parser_pm_name(pm_type));
+		   dp_pm_name(pm_type));
 	drm_dbg_dp(ctrl->drm_dev,
 		   "stream_clks:%s link_clks:%s core_clks:%s\n",
 		   ctrl->stream_clks_on ? "on" : "off",
@@ -2158,30 +2173,56 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 	return ret;
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
-	struct dp_ctrl_private *ctrl_private;
-	int rc = 0;
-	struct dss_module_power *core, *ctrl;
+	struct dp_ctrl_private *ctrl;
+	struct dss_module_power *core, *link;
 	struct device *dev;
+	int i, rc;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dev = ctrl->dev;
 
-	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dev = ctrl_private->dev;
+	core = &ctrl->mp[DP_CORE_PM];
+	link = &ctrl->mp[DP_CTRL_PM];
 
-	core = &ctrl_private->parser->mp[DP_CORE_PM];
-	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
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
 
-	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
+	link->num_clk = ARRAY_SIZE(ctrl_clks);
+	link->clocks = devm_kcalloc(dev, link->num_clk, sizeof(*link->clocks), GFP_KERNEL);
+	if (!link->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < link->num_clk; i++)
+		link->clocks[i].id = ctrl_clks[i];
+
+	rc = devm_clk_bulk_get(dev, link->num_clk, link->clocks);
 	if (rc)
-		return -ENODEV;
+		return rc;
 
-	ctrl_private->pixel_clk = devm_clk_get(dev, "stream_pixel");
-	if (IS_ERR(ctrl_private->pixel_clk))
-		return PTR_ERR(ctrl_private->pixel_clk);
+	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
+	if (IS_ERR(ctrl->pixel_clk))
+		return PTR_ERR(ctrl->pixel_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 85da5a7e5307..d8007a9d8260 100644
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


