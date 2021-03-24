Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D22347C54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbhCXPUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbhCXPTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67AFC0613A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q29so32368003lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
        b=Tc25TD5+7Gwo1HO4vQj/3EiBeyJcsnhH7fA3aeCN5TNcqbP/oVU4HMDFXqOtqwP+P2
         Zdq93VMu2vCBVadNX3nvEKyzRcDkbHi5u2/7Avu8aDQtVOtDidA95usU5UlmTP+MJ/R6
         sVguu0bJ75WatTP8XaB3NJPDsLzgw/cpxzjobzcFr8p3kaQeKo57bqtNmE82PfYjpSy1
         ALGNzNRoBz1hiCw566AJcCM/S2N5vCB83Fk0QWPJT3VWfBIoZiTqvExohdsc93hFEM+I
         m2YFbOjtRW6ndpLOdLmt8Zb49bk/7dz3sjQR81yB/rfa3Un0WCyMj02Fn14szlge6Tfv
         vP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
        b=YfSWtvDs+llLaeefQd6VfTLf62szB86jWq5ECygf8MKbhe1+daSaVtpVP7ej39nrd/
         TnG+v3LyjKNRopRboQFVAEvQC0OafXxiNMcmG1hq/KhwWbFbctgeXGISTovYzjVU3M4Q
         1La1oNTH51hRDlQElJGt5F7SxQ9s18JohzYEhwvlg0o2wTfCgQOIA5RTEtLrU++A8LxX
         Rk0gx5oekEHg+3r6itQH3qUkoJ0VlFATTtOzwHefyTeHEhG1L6p/SVWWazwxaEhqdQCV
         EjXWPlmuqFYViMKp89F+Yu8j6M6TSbLLbwLyw8ktUW5VFmzkoxoRSo/qDmOg1o7qCYSp
         6S3g==
X-Gm-Message-State: AOAM532cby0BprqzbL/XC6w+QofijZRqNMD2rB3pGs97d9gGUyN++B3v
        Qsizm3r1DyXqLZQcjT+dEowIPBoC4SuVsQ==
X-Google-Smtp-Source: ABdhPJwkT+pO34l6OqgP6jbUkA2UjX0bT6Qiqht5D9qWgnV/qsJJoLaKaul/Sz5nGrQya5lfmFU+tQ==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr2232448lfe.486.1616599168652;
        Wed, 24 Mar 2021 08:19:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 16/28] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Wed, 24 Mar 2021 18:18:34 +0300
Message-Id: <20210324151846.2774204-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4a8577a08f57..74a4e2daade8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

