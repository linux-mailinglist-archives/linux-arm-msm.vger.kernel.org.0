Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5472F34FE94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbhCaK6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhCaK5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:49 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540F8C061762
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m12so28490448lfq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
        b=DdxFqg+UJ9FKMjIZZi6fUqHc4tQRMvdxxHSUffVfU9HMSXKru6kzhwCpfjYqStkBfC
         XT/FIkqJJHOafINowWPi9PbRGtpulo5RxKaAKD7YM4E/aHe+528vrocpPq4tROISvgT3
         CntWnbju89GHH8MhAeBNJwu4Ad5bf7Zae66wHoajRteIgbRJktTRO9dQuRmJfJAY+TBA
         xcR8QJ6q33ZKrAK+ZSO0PIQqnhYyMQZB5x9+/fElOYsKfjIU3MYhS4Wl2GV8LdAt8Q++
         twxhYWtg90yFKkpYDB9PvGqKH3ql3xUpMoE3unLNVZRvyJt753SVUCw1r+BYXrgj8J6T
         HAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
        b=fRR0ZPFM6iPWiKNcxn0AvEuRaXtZ3Sj5AD1rGhGl0sMlGBDRkEFZw9FiV5WPJk+IpS
         rpxQTPFX5BdWR4UxD6uhCNzohRPjpq8hkXgjmORdRAJq+8DOcuT8heDyGN86XzZMEXbD
         QD5b1owhUN1za1wozp/ugLcLksHC0osKcy4/ztTeC7UoyU0PjA6ryvg5KxYcKvzhHwY/
         1Hw3AEsCmH5nomwG8g1VJBLpjQ5DRnjP6A7UmjmE3JoI9drMOiWEhjfDl7J7dH3eGbqN
         86lPHOS3JgUbI5CfQUtT4J7ZN+OuZrT+aLJhmG6PPfhDEO6nbWGTzkrjPa93NUg5b/fc
         y+RQ==
X-Gm-Message-State: AOAM530bcb0Nh453Po40fWR3ba84W/MJdoS7SIf8fxlKwq+j03j0IlFI
        hXQp1lHugWhyf5S4K60x0irnhQ==
X-Google-Smtp-Source: ABdhPJyAC6SLSg7+Dr9VzDvUXl2f9g0aYK2FUaDNGTXtEdt2Nc3MfNNNyGtrjO5BCFE0WkejuQ6wnQ==
X-Received: by 2002:a19:7716:: with SMTP id s22mr1877170lfc.542.1617188267795;
        Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 12/24] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Wed, 31 Mar 2021 13:57:23 +0300
Message-Id: <20210331105735.3690009-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index df3b91b0ea88..46561435a27d 100644
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

