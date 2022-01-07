Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236BB487003
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345288AbiAGCBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345255AbiAGCBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:39 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E93DC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:39 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h2so10226731lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/81ihr5/bmjqyS1R9V0PUwYFeshMlAAJdXhf9FQFGo0=;
        b=w9VpM9kphaymoMYswx2q1h2u96x8Bp/d9hioCKc52SKFhflWbL8GZmpFvevv+QTZQw
         bNKLBtiXxdxF2MBOyV1QI9dHVK80WZggq1nVhXgnoD9s0Zm4NEeOYzvdUk6DZqBVYqxX
         zJDGc3/BLhMA23tZ+xbvMZKLHR/yD3mrc2f8lOGDD7kwFLgnUGKPoJv/dktdDQb7X4JI
         gtXJPV2kODDgBCN3x9cR0unh2tShFipyTUnQ5ldF50lkDuYnMm5PXSZ0a4O0t3opOcH+
         oGl3A3FWxd24lVw2ATlhHdVhFSn4f6z/PSuaPgQOh7NcXS0Ok/qRdVOWrjV4YTZFDx8T
         4UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/81ihr5/bmjqyS1R9V0PUwYFeshMlAAJdXhf9FQFGo0=;
        b=HJBt1rVh+ZEzNhWK5ltaDEowXK4KQo8dsmAj5ohw+6ERmtMhtuSncwUSXW7gDXatpU
         vXzoHjdq4QVwYhiWUu8m127LaEX4XFBDlaBHeyfg+OM5mIHyvBDTvnBgzH1koTcWGxst
         42c0QkTC6pgOzGN3D4MiiB5hZVkgklr3gktEArLqAqrrFHR9CpnXFEIcAVo4R4MhfFkH
         dPbYuM1CpgqiVif8BgMwyYYR5Ks5oevdQwwj6KjRKfnNL6grAbAak97lZPq3JdkPtON/
         RJ0/j0pmjcqhURZg4H9iXj0kSanB9PVRTC8p/bhhdcODIqjNtLPy88/3CZVQDBvqnxw7
         Tgfg==
X-Gm-Message-State: AOAM531xHDS78NQP1erg7yP+C58RSKK/hlGqzzzITR5VHW6/vcGrFfyN
        1VS6h7lP2LYZsL7yGn4WgfUOlA==
X-Google-Smtp-Source: ABdhPJyFjpRum/JlwI/KwpbLrQfC7WGZRnMEYnG9taRKpoe9gpl39svMfhttQwHhrgA+iJSAHWS5Ug==
X-Received: by 2002:a05:6512:2304:: with SMTP id o4mr52821174lfu.563.1641520897174;
        Thu, 06 Jan 2022 18:01:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP encoder
Date:   Fri,  7 Jan 2022 05:01:27 +0300
Message-Id: <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently DP driver will allocate panel bridge for eDP panels.
Simplify this code to just check if there is any next bridge in the
chain (be it a panel bridge or regular bridge). Rename panel_bridge
field to next_bridge accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
 5 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21f2091..184a1d1470e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -246,7 +246,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
+	dp->dp_display.next_bridge = dp->parser->next_bridge;
 
 	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e3adcd578a90..7af2b186d2d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,7 +16,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 26ef41a4c1b6..80f59cf99089 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -236,9 +236,9 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
-	if (dp_display->panel_bridge) {
+	if (dp_display->next_bridge) {
 		rc = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, bridge,
+					dp_display->next_bridge, bridge,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index a7acc23f742b..5de21f3d0812 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -265,22 +265,14 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_find_panel(struct dp_parser *parser)
+static int dp_parser_find_next_bridge(struct dp_parser *parser)
 {
 	struct device *dev = &parser->pdev->dev;
-	struct drm_panel *panel;
-	int rc;
 
-	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (rc) {
-		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
-		return rc;
-	}
-
-	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(parser->panel_bridge)) {
-		DRM_ERROR("failed to create panel bridge\n");
-		return PTR_ERR(parser->panel_bridge);
+	parser->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(parser->next_bridge)) {
+		DRM_ERROR("failed to create next bridge\n");
+		return PTR_ERR(parser->next_bridge);
 	}
 
 	return 0;
@@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 	if (rc)
 		return rc;
 
-	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
-		rc = dp_parser_find_panel(parser);
-		if (rc)
-			return rc;
-	}
+	rc = dp_parser_find_next_bridge(parser);
+	if (rc)
+		return rc;
 
 	/* Map the corresponding regulator information according to
 	 * version. Currently, since we only have one supported platform,
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3172da089421..4cec851e38d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -123,7 +123,7 @@ struct dp_parser {
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 
 	int (*parse)(struct dp_parser *parser, int connector_type);
 };
-- 
2.34.1

