Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C005048700A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344448AbiAGCBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345294AbiAGCBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:43 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A5DC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:43 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp20so10263018lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cavINj3cofdeKu4U7XMW4TvkQD30lvi7kbRjPCa2LIY=;
        b=rqmMHxTRkxBezlU0DpApXj6CmPCvVe6iSMS3gnQffk6cfkuXdhKWWyryRJg2dfyX5r
         L5qFK9EFsyUKEc4omyAf3RBXFQDmW9ZBRA2KDgVLkliganJiFDzqbBgM7V2s5FAhjvH8
         82rZ5C+ZwWCS7+S3mXCsIXsmvjaFPZJnddI2ITMdIhpsI5zaBgNsY65gTd8DwBs4RjSz
         21hQ3z4Ikd5kv/4QQVE/75cF+VjmHxyyh2QAQJYgJeaprpD9CFJqvgMQA/b8F76pZPTt
         MP48hANI89zeJIu3u+77eWR/l+NDl0yQclhyZvbw4Uoo7LbHwWWOgntM5LrL52zVZFpD
         Fl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cavINj3cofdeKu4U7XMW4TvkQD30lvi7kbRjPCa2LIY=;
        b=6gyMdZ1Y4+HiAeJ2lF7iZnquvFUIgHM2+EhFb2B5TCLubtZTH1uXsuAXVKLaKVwFkh
         SsvmCTsV3mLPy6LuX6ohu8G28pPixt5VMbYz4+t0Ldi06/SXzW7QJxPGV3RAAt4t9/sH
         TsXiP08O+BhmLvQIxCO9mSORpirIN79fEQ1/R8lvhVSQyL74n4fZpVBKP8lNSZ1nNjzd
         ajlxfrsgWTQK8uHGtSA5TfbUZwdG6OXe5BtURuo4yrtuiKFaqRHsKywohd3uLoJrlETw
         qoD4vt05MCJ7iuQPYx2Rx36nijkCwu6CigwslzwOr/ivhxjc7lb7YxLd1uP3D7HbKjhd
         P8Bw==
X-Gm-Message-State: AOAM532Kr5dAzM0zrkiAOiWrsrjTKcQMgBhJxMZWKiy0iLjGsQWalg06
        A3yMyySzvuNqJ3PphOy4aJ/i5g==
X-Google-Smtp-Source: ABdhPJzrdA/wggs3ngCjXFAtkKp0DyG0Sq0NZxWjQKwdK/7ikm1DhWRSKvTXFkqcoczymqKfvGE1DA==
X-Received: by 2002:a05:6512:11c9:: with SMTP id h9mr39598037lfr.33.1641520901690;
        Thu, 06 Jan 2022 18:01:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 7/7] drm/msm/dp: stop carying about the connector type
Date:   Fri,  7 Jan 2022 05:01:32 +0300
Message-Id: <20220107020132.587811-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After changing dp_parser code to always check for the next bridge, it
does not check connector type anymore. Remove connector type from the
dp_paser_parse() arguments list and from the struct msm_dp_desc fields
list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++-----
 drivers/gpu/drm/msm/dp/dp_parser.c  | 2 +-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 720e80ea99cb..0a71a17975b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,7 +129,6 @@ struct dp_display_private {
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
-	unsigned int connector_type;
 };
 
 struct msm_dp_config {
@@ -139,15 +138,15 @@ struct msm_dp_config {
 
 static const struct msm_dp_config sc7180_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000 },
 	},
 	.num_descs = 1,
 };
 
 static const struct msm_dp_config sc7280_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000 },
+		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000 },
 	},
 	.num_descs = 2,
 };
@@ -249,7 +248,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
+	rc = dp->parser->parse(dp->parser);
 	if (rc) {
 		DRM_ERROR("device tree parsing failed\n");
 		goto end;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 5de21f3d0812..044ab0b63b14 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -278,7 +278,7 @@ static int dp_parser_find_next_bridge(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_parse(struct dp_parser *parser, int connector_type)
+static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 4cec851e38d9..1f036dd3e224 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -125,7 +125,7 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	struct drm_bridge *next_bridge;
 
-	int (*parse)(struct dp_parser *parser, int connector_type);
+	int (*parse)(struct dp_parser *parser);
 };
 
 /**
-- 
2.34.1

