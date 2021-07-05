Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB383BC407
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 01:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhGEXUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 19:20:11 -0400
Received: from [94.230.151.217] ([94.230.151.217]:58592 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhGEXUK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 19:20:10 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 9118C23B1D;
        Tue,  6 Jul 2021 01:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625527050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RmsyD6q4iRpACLT/yZUQSpS9sDUS63kukVfLZnbfL7k=;
        b=of88mqwFUHzXD9NSHjUdfyPRzU9CJrErAY+oW16lVnEo6oNyv81c37sc9JiKgAKo9udtml
        JK9HesbSy79B0NftPxw4Uc+lhmQAMN6JZKAEfgDLaW+4zt6WcEDdMN7KCE535F3R7BeWgl
        tsQ3YS7RILTJxdzsTlMA19IM9JXKojY=
From:   David Heidelberg <david@ixit.cz>
To:     Jonathan Marek <jonathan@marek.ca>,
        robdclark <robdclark@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH 2/2] drm/msm/mdp4: move HW revision detection to earlier phase
Date:   Tue,  6 Jul 2021 01:16:41 +0200
Message-Id: <20210705231641.315804-2-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705231641.315804-1-david@ixit.cz>
References: <20210705231641.315804-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes if condition, which never worked inside mdp4_kms_init, since
HW detection has been done later in mdp4_hw_init.

Fixes: eb2b47bb9a03 ("drm/msm/mdp4: only use lut_clk on mdp4.2+")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 45 ++++++++++++------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3a7a01d801aa..0712752742f4 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -19,23 +19,12 @@ static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
-	u32 major, minor, dmap_cfg, vg_cfg;
+	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
 	int ret = 0;
 
 	pm_runtime_get_sync(dev->dev);
 
-	read_mdp_hw_revision(mdp4_kms, &major, &minor);
-
-	if (major != 4) {
-		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
-				major, minor);
-		ret = -ENXIO;
-		goto out;
-	}
-
-	mdp4_kms->rev = minor;
-
 	if (mdp4_kms->rev > 1) {
 		mdp4_write(mdp4_kms, REG_MDP4_CS_CONTROLLER0, 0x0707ffff);
 		mdp4_write(mdp4_kms, REG_MDP4_CS_CONTROLLER1, 0x03073f3f);
@@ -81,7 +70,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 	if (mdp4_kms->rev > 1)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
-out:
 	pm_runtime_put_sync(dev->dev);
 
 	return ret;
@@ -428,6 +416,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	struct msm_kms *kms = NULL;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
+	u32 major, minor;
 
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms) {
@@ -488,15 +477,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	if (IS_ERR(mdp4_kms->pclk))
 		mdp4_kms->pclk = NULL;
 
-	if (mdp4_kms->rev >= 2) {
-		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
-		if (IS_ERR(mdp4_kms->lut_clk)) {
-			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
-			ret = PTR_ERR(mdp4_kms->lut_clk);
-			goto fail;
-		}
-	}
-
 	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
 	if (IS_ERR(mdp4_kms->axi_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
@@ -505,8 +485,27 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	}
 
 	clk_set_rate(mdp4_kms->clk, config->max_clk);
-	if (mdp4_kms->lut_clk)
+
+	read_mdp_hw_revision(mdp4_kms, &major, &minor);
+
+	if (major != 4) {
+		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
+			      major, minor);
+		ret = -ENXIO;
+		goto fail;
+	}
+
+	mdp4_kms->rev = minor;
+
+	if (mdp4_kms->rev >= 2) {
+		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
+		if (IS_ERR(mdp4_kms->lut_clk)) {
+			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
+			ret = PTR_ERR(mdp4_kms->lut_clk);
+			goto fail;
+		}
 		clk_set_rate(mdp4_kms->lut_clk, config->max_clk);
+	}
 
 	pm_runtime_enable(dev->dev);
 	mdp4_kms->rpm_enabled = true;
-- 
2.30.2

