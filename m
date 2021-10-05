Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA26423439
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbhJEXNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237005AbhJEXNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:13:37 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216C2C06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 16:11:46 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso840306otb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0OkvfJXc9Y2w0klbpaKdGqzSv5YbDPZgzOyFtH19rk=;
        b=xdg7VEEV7n+/U9chpgEIfjbX+7MZOdTWi/PdSHER+0MBFEPPB4jOwYMbeF1lRVbKcr
         cmnvspVg9VBAV95hkF30baFDqNV8BIQXsUhSy+CTWiEWtbVlt4O5gPS1idCqh6Awv09v
         isizy5GNkDRyfDLpbvtMDVY6EZOd02nI3EEjHIKCiqbxdGDHpp/sZgov5sj8REpWUKR4
         fV/ErhBmum3+XK0fzRo93OKVWG+uFPSO0+F4UGsdp5P0cS64qApAqB/u/5FHUcuAFQkb
         ZVMGvjjYl+ZFmlrfRAIwuxQvuWvnOpAxSZzyer6n+HgUqkpiTi1uBNYktD6V6UZMIkrF
         CM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0OkvfJXc9Y2w0klbpaKdGqzSv5YbDPZgzOyFtH19rk=;
        b=K2eR1GX9d5XDXJORMME3HZj++Dz17LxHNjLTPq3Rxd0+enV8VWH6SrLlsrGrsinaIW
         Zn3Ud2eUBk5IYny+nP/4kwLAK6V0iTh8ZMleOfGBgLcnFfzUoIpq0g3j+Ul/4e7Iy22R
         +IOeHbaBMMLfxdMe3mtdXBiNbLZdBWYlIAPMupbWnbqTFAmgzx8gAqQ21wK2HbUajWr0
         ts+vAEfn/Pk3sbvMcHEJdENIjhsiZcpDvhshyCZ94sTa5a68bit8bMKTgep3KL5Nm3Ke
         EZGTF3+odquW/egRXNNKf+OyRc4dFf17VbgJ/K7njrNHvCvL2VH5zxrxQfizUyjV34d+
         v7bw==
X-Gm-Message-State: AOAM5312ej6JJ0xzooJIYyDqzg64ylKFcnxVUIWG7A5iHKzJWZqlAiSZ
        nq+URspp25iO/FkKkfpcSo8e0Q==
X-Google-Smtp-Source: ABdhPJzgRqO42teenis/dK6KDiIVba+42gFP/lK41coBLLactFMuFi3MuxuAQJq9OyKdBiE0qZJ+OQ==
X-Received: by 2002:a9d:604:: with SMTP id 4mr16885518otn.204.1633475505465;
        Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v9sm1665141oth.62.2021.10.05.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
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
Subject: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per controller
Date:   Tue,  5 Oct 2021 16:13:19 -0700
Message-Id: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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

Changes since v3:
- New patch
- Extended msm_dp_config with connector_type, wrapped in inner struct
- Refactored out of the next patch
- Pass the connector_type to drm_connector_init(), from yet another patch
- Dropped double newline and unnecessary {}

 drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 +-
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5d3ee5ef07c2..eaf08f9e7d87 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,8 +115,25 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+struct msm_dp_desc {
+	phys_addr_t io_start;
+	int connector_type;
+};
+
+struct msm_dp_config {
+	struct msm_dp_desc *descs;
+	size_t num_descs;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.descs = (struct msm_dp_desc[]) {
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
 
+static struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
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
+	struct msm_dp_desc *desc;
 
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
index 8b47cdabb67e..02999408c052 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,6 +18,7 @@ struct msm_dp {
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
+	int connector_type;
 
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

