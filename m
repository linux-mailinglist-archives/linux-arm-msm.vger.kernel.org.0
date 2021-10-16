Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56EC43053A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 00:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244733AbhJPWTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 18:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244727AbhJPWTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 18:19:07 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891AEC061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:16:58 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id l24-20020a9d1c98000000b00552a5c6b23cso358734ota.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y3JSg0yjBHrIT9e1qqj+dh8glMv7U4JrsszeYJgzm9Q=;
        b=YrmKUcV7WuxXB+t/OZ4842VQRF3FlgSqUZUl5VqT9vxRkAXHbyF0ffYQ5T/1Itw8oS
         mjIhwyWIhnfHmtNhg6bSefMQr6gMLGEnDKEmT3o1G2T9O9VPdM2yWm8MQlHGOM9X+50D
         MU4UWk4kEEAKfcH7MQv489gEi2MEJt0iAh3NQAlDI6xeqc7yrG6NOMsNrAkkNfLi/CdP
         eTfci3BxSdxGra+jkaKHhfUrn9XsLlBjPDcETUjKii1hErQ6pDqbfpV4d1QxPmPLnk0d
         GmNuE5Ow/cP38eqchf7fXogHkhWnJZImo4iribnAkuQE3ux2T7jZkQVje3LfUzOYEFvE
         UW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y3JSg0yjBHrIT9e1qqj+dh8glMv7U4JrsszeYJgzm9Q=;
        b=NhCwpJ0jPfO3PaqlgAeh3vX5YO+GNs1KpCCd+7b/lA7cppMq5mp9VcfHnhOzJKneg2
         mXNiFHqY0K0Z+V5Hd8b4m5LoohyCHkITA6K03Ge5AU08E7C4c7Pu+A8Q5/Y8R5kT6KWj
         v9NrTSwo9QHsuK2GDsmrkW/W9lB/+V5u99cYiwowvi8/MjsynmXbDQ7HSTjcI76HxjeV
         bPsCNjU58oERKOw9ZqccdsML5+PXUkiYkea6eX8jqDFoPRCPh5uCtHlkA/YwrHwgO4n8
         d8Qx8aNe91FTAzW1SdMj6TPWtWUpgso7V5FDL3iKsUHaUdyScnbjNGuqhqq/ooLvpuaA
         yISQ==
X-Gm-Message-State: AOAM532CYHsiuIiXGMQ+RlPiKHrwe54OP7SOjsAzk1XsrXrVXS6EfnXs
        Enfac6kVIlYMoCGvB3sJhSy9Gg==
X-Google-Smtp-Source: ABdhPJyrCsT1ZNTJeq27AsTSzZjO/SqXJJIUpmVsq80CISG5SYITx0lVjJGNO4Xrfy0YRFMXxL4afQ==
X-Received: by 2002:a9d:60d9:: with SMTP id b25mr15175971otk.378.1634422617920;
        Sat, 16 Oct 2021 15:16:57 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d15sm1747058oic.32.2021.10.16.15.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 15:16:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] drm/msm/dp: Allow specifying connector_type per controller
Date:   Sat, 16 Oct 2021 15:18:39 -0700
Message-Id: <20211016221843.2167329-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the following patches introduced support for multiple DP blocks in a
platform and some of those block might be eDP it becomes useful to be
able to specify the connector type per block.

Although there's only a single block at this point, the array of descs
and the search in dp_display_get_desc() are introduced here to simplify
the next patch, that does introduce support for multiple DP blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- const the various struct msm_dp_desc instances
- unsigned the connector_type


The references to DRM_MODE_CONNECTOR_DisplayPort in dp_debug.c, that was
highligted in the review of v4 has been removed in a separate patch.

 drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 +-
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5d3ee5ef07c2..6913970c8cf9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,8 +115,25 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+struct msm_dp_desc {
+	phys_addr_t io_start;
+	unsigned int connector_type;
+};
+
+struct msm_dp_config {
+	const struct msm_dp_desc *descs;
+	size_t num_descs;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	},
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{}
 };
 
@@ -1180,10 +1197,29 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
+static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
+{
+	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
+	struct resource *res;
+	int i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < cfg->num_descs; i++)
+		if (cfg->descs[i].io_start == res->start)
+			return &cfg->descs[i];
+
+	dev_err(&pdev->dev, "unknown displayport instance\n");
+	return NULL;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
 	struct dp_display_private *dp;
+	const struct msm_dp_desc *desc;
 
 	if (!pdev || !pdev->dev.of_node) {
 		DRM_ERROR("pdev not found\n");
@@ -1194,8 +1230,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	desc = dp_display_get_desc(pdev);
+	if (!desc)
+		return -EINVAL;
+
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
+	dp->dp_display.connector_type = desc->connector_type;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 8b47cdabb67e..75fcabcfbbdd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,6 +18,7 @@ struct msm_dp {
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
+	unsigned int connector_type;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 764f4b81017e..f33e31523f56 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -147,7 +147,7 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	ret = drm_connector_init(dp_display->drm_dev, connector,
 			&dp_connector_funcs,
-			DRM_MODE_CONNECTOR_DisplayPort);
+			dp_display->connector_type);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.29.2

