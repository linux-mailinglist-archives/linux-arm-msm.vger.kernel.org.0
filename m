Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C8941F926
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhJBB3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbhJBB3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:29:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72028C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 18:27:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z24so45298312lfu.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 18:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKHFO3dr+m9bm0sBpvW4eyWO19sk206ehV2Fufn3Uw=;
        b=RwoO6xCNqLSgb+yrVyvfkrUfVwPVgcCyfM28jknW+jK2socKpUyLvDeugNwcicYJwe
         idh5hMywEhDW43Zw6ok6BubluCqlu94qKb4ZISBIcil5Vx5y1je7q7NrESn5mh+DxAt8
         TgFRLa7YuKMAk48SEZ9xnSRGBldR3iMQnuCxc1zf4JqT2uwQ7mhFAwe4lYccsBpofkqP
         2o3u0JhDLNsZf3ppgwC+5Jr+Afwq3X2TB5J1k/bvyDNy7fWQZcwLU/KbIeRTbDwU8Y62
         nL+yODKfvkZ5qlreYvYtYI0ihThS9RbnMgOVte/21PXpvp0QzXrj5oFSTLEG2eaNeFnw
         jwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKHFO3dr+m9bm0sBpvW4eyWO19sk206ehV2Fufn3Uw=;
        b=bvjE+NmiFqqDdnCjVs9yzJUryxQBsLkkotLTK9QkIzNvN7LrOrPNS+NisF90ojYpe7
         yNnE+0wVsjuygEvYrJWmHhz+tPOj6hW3l5/m/ymzf1DVYq+hMn+xeJVBFD8x4p8UBDc4
         pMxl8/1JdW+yGTUGHwH+T4DMua4BCC1ApIZ7U5Ew0TdhFgWfRWAz4cPo7+vwDG5ERqk4
         N4mYa1y0PpsCOp3h8ft27z0lrRxkzqutWnflJz/dASIozDfuE8qefizcJrbEEZtq6yuT
         mK808dWzK7t2g5WTRydbG3bl/zPYI7RwQJfUSH8KQKb5u2wjn6m7kysmYBjdxP98P548
         KBvQ==
X-Gm-Message-State: AOAM530Ww2LXAYUon1ne19fNl/Fve2fmiS+3fCfxoX6aP3LYDQDwH/Mi
        C09SR1LFOdA0V79IUVqd6rbfWQ==
X-Google-Smtp-Source: ABdhPJwyZY4O91MaQ4n2WL+AocW5fgIQtGUtMJ+NghEL1qP+x20mZOH+mg6hamq1SiXHgim0j0Q1LA==
X-Received: by 2002:a19:6e06:: with SMTP id j6mr1208786lfc.351.1633138036834;
        Fri, 01 Oct 2021 18:27:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j20sm722405lfu.304.2021.10.01.18.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 18:27:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: use bulk clk API
Date:   Sat,  2 Oct 2021 04:27:15 +0300
Message-Id: <20211002012715.691406-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use clk_bulk_* API instead of hand-coding them. Note, this drops support
for legacy clk naming (e.g. "iface_clk" instead of just "iface"),
however all in-kernel device trees were converted long long ago. The
warning is present there since 2017.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 59 ++++++------------------------
 1 file changed, 12 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..3b81f40bba2e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -106,7 +106,8 @@ struct msm_dsi_host {
 	phys_addr_t ctrl_size;
 	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
 
-	struct clk *bus_clks[DSI_BUS_CLK_MAX];
+	int num_bus_clks;
+	struct clk_bulk_data bus_clks[DSI_BUS_CLK_MAX];
 
 	struct clk *byte_clk;
 	struct clk *esc_clk;
@@ -374,15 +375,14 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	int i, ret = 0;
 
 	/* get bus clocks */
-	for (i = 0; i < cfg->num_bus_clks; i++) {
-		msm_host->bus_clks[i] = msm_clk_get(pdev,
-						cfg->bus_clk_names[i]);
-		if (IS_ERR(msm_host->bus_clks[i])) {
-			ret = PTR_ERR(msm_host->bus_clks[i]);
-			pr_err("%s: Unable to get %s clock, ret = %d\n",
-				__func__, cfg->bus_clk_names[i], ret);
-			goto exit;
-		}
+	for (i = 0; i < cfg->num_bus_clks; i++)
+		msm_host->bus_clks[i].id = cfg->bus_clk_names[i];
+	msm_host->num_bus_clks = cfg->num_bus_clks;
+
+	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
+		goto exit;
 	}
 
 	/* get link and source clocks */
@@ -433,41 +433,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	return ret;
 }
 
-static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
-{
-	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
-	int i, ret;
-
-	DBG("id=%d", msm_host->id);
-
-	for (i = 0; i < cfg->num_bus_clks; i++) {
-		ret = clk_prepare_enable(msm_host->bus_clks[i]);
-		if (ret) {
-			pr_err("%s: failed to enable bus clock %d ret %d\n",
-				__func__, i, ret);
-			goto err;
-		}
-	}
-
-	return 0;
-err:
-	for (; i > 0; i--)
-		clk_disable_unprepare(msm_host->bus_clks[i]);
-
-	return ret;
-}
-
-static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
-{
-	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
-	int i;
-
-	DBG("");
-
-	for (i = cfg->num_bus_clks - 1; i >= 0; i--)
-		clk_disable_unprepare(msm_host->bus_clks[i]);
-}
-
 int msm_dsi_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -478,7 +443,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
 	if (!msm_host->cfg_hnd)
 		return 0;
 
-	dsi_bus_clk_disable(msm_host);
+	clk_bulk_disable_unprepare(msm_host->num_bus_clks, msm_host->bus_clks);
 
 	return 0;
 }
@@ -493,7 +458,7 @@ int msm_dsi_runtime_resume(struct device *dev)
 	if (!msm_host->cfg_hnd)
 		return 0;
 
-	return dsi_bus_clk_enable(msm_host);
+	return clk_bulk_prepare_enable(msm_host->num_bus_clks, msm_host->bus_clks);
 }
 
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
-- 
2.33.0

