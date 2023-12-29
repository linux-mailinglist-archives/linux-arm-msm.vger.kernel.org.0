Return-Path: <linux-arm-msm+bounces-6107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FD820277
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A930B22269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11015154AD;
	Fri, 29 Dec 2023 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GA9WZTuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CD15496
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e49a0b5caso8138267e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890621; x=1704495421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN+QhfjzW6P1W7O8ikSW8Wdk6+ITJyhlX+DJs6XFBy4=;
        b=GA9WZTuB9gp99sq/MIrzF+gNOT2cF8vxbKb4/tVsrzDt1NcJ2CMEPmP790tZavdGOy
         4mq5Hq9OkiRSnzWVgqXvLnW5R4YidkMOv9rcI55yJ4sFTy/aST3/DRZmLLWsopYd1LpL
         g9dyN3QxDjYUYWIdSy9NoewsczYxFU3bO9ubS7YzuZr9gPzZZ5tE96NH9Ud6BXUwTJNK
         EyShBGS1EdK7h3N+vsyq8b5+sWCO7C/b4We0Yj522q+pJtqd+OkhGpVXyZbHQe7kGrLS
         UiDjqv8FIN3rPo+W3cf07MdYU2/wJR2POS0btlloo/3k7tk7kcsz1iZoFvylxXytrQAy
         Yvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890621; x=1704495421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gN+QhfjzW6P1W7O8ikSW8Wdk6+ITJyhlX+DJs6XFBy4=;
        b=nnkYgnQdHnaLSe9QKzPRlBBKmZDKZRunYKrZm7cs5e3aPBNKxiwxX3A/KV+k+lM+oE
         G/NBLcad7LO30QIy0JDZSYCJdgfPAdvcvxt1JkocxxXIV1hM9ith5EhgLMCdpe7xG81v
         TiQT020y3g5SldKchGHUFsCgqti9j1r1VeqJYuA2BBOZpFAQgD7cxYTYRUA3dLFQhdwa
         SYKZubFbofdtc9HTwqzf+czWHqy1Za90HCIdU7QiV1Gablm1u5ZMzfmy/GGDRu2aqCkP
         Rd2EYiglX2JyNp/Ct0WvqTm5UJvkEfSCH6NPBlkRps2NTyl7DxGUxQv9KpKsNGZAoLU/
         PJ+A==
X-Gm-Message-State: AOJu0YwOBJmKucWdQ8tvscdqfme5qsPKh48Dbd/BzxF3HulUi9J/xSaV
	TRLpysMku8bWAhEDLv7kLGv7qjO0dIHngA==
X-Google-Smtp-Source: AGHT+IGFvnyGaUZgzOXysYSJJFs72wqZ9ABaDZ+u9s2biWLoEy3FICm1Llc5zAhNYHFhQvSNOjKqvA==
X-Received: by 2002:ac2:51a7:0:b0:50e:4bf6:8848 with SMTP id f7-20020ac251a7000000b0050e4bf68848mr5097967lfk.38.1703890621344;
        Fri, 29 Dec 2023 14:57:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.57.00
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
Subject: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
Date: Sat, 30 Dec 2023 00:56:49 +0200
Message-Id: <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
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

Remove two levels of indirection and fetch next bridge directly in
dp_display_probe_tail().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
 3 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4de0857c31ce..923df47efcc9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1195,16 +1195,24 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp);
-
 static int dp_display_probe_tail(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dp_display_get_next_bridge(dp);
-	if (ret)
-		return ret;
+	/*
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
+	 *
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
+	 */
+	dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->dev.of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		if (dp->is_edp || ret != -ENODEV)
+			return ret;
+	}
 
 	ret = component_add(dev, &dp_display_comp_ops);
 	if (ret)
@@ -1397,30 +1405,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
 	}
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp)
-{
-	int rc;
-	struct dp_display_private *dp_priv;
-
-	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-
-	/*
-	 * External bridges are mandatory for eDP interfaces: one has to
-	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
-	 *
-	 * For DisplayPort interfaces external bridges are optional, so
-	 * silently ignore an error if one is not present (-ENODEV).
-	 */
-	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
-	if (!dp->is_edp && rc == -ENODEV)
-		return 0;
-
-	if (!rc)
-		dp->next_bridge = dp_priv->parser->next_bridge;
-
-	return rc;
-}
-
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index aa135d5cedbd..f95ab3c5c72c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,20 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
-{
-	struct platform_device *pdev = parser->pdev;
-	struct drm_bridge *bridge;
-
-	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
-	if (IS_ERR(bridge))
-		return PTR_ERR(bridge);
-
-	parser->next_bridge = bridge;
-
-	return 0;
-}
-
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index bc56e0e8c446..2b39b1c394ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -22,7 +22,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	struct drm_bridge *next_bridge;
 };
 
 /**
@@ -38,17 +37,4 @@ struct dp_parser {
  */
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
-/**
- * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
- *
- * @dev: device to tie bridge lifetime to
- * @parser: dp_parser data from client
- *
- * This function is used to find any additional bridge attached to
- * the DP controller. The eDP interface requires a panel bridge.
- *
- * Return: 0 if able to get the bridge, otherwise negative errno for failure.
- */
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
-
 #endif
-- 
2.39.2


