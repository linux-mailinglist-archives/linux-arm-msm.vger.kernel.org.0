Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9CE32A110
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245687AbhCBEsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238966AbhCAX1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:27:44 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF63DC061356
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:18 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r23so21608410ljh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFg8JcWXyY2OGGMhqP+ZEB31pQUymR3GBzUkTBvm1ik=;
        b=Lb3XX0AhMyNS0gBsYf/gakRG6b/duv1VfVOmFvv0P1Ruro6s3xmUOpZv+/Q4Rwdzwm
         h7fgRZDPAmUDnZuAh/tBG3PsdtZ0Fti+uS2UDjlrPfKFGaJ898qMpZR2GXajP36PhdND
         GiRh12d1CcxOf50jQ5tFGSh6lGenMZyKBFCgo21NyOIlH17VOIHXagyd4TNpWAcQfAwl
         BtobIVBGX1SVwOz/YKd3h8EN/kIMZvuqtF6GilXK5lQ48s4HOepHSkdMUyWKlq/RH8sQ
         TkvXxQfkMJx1ydPFNThQYpYhMOzP3wMlZLsYsUqAhCKeIrIT+/2y+2I+i8jxmKSGb1kV
         GQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFg8JcWXyY2OGGMhqP+ZEB31pQUymR3GBzUkTBvm1ik=;
        b=EsnJ5S6RK0XFlT7EmWza51pat2E+FiA/IH2HY1M/pmNbX9km61S9jHOQYIy8NTSrop
         yxU+Bw4JWCLaKFf1PyQB4WpMS4pAcsFIMTLqN1M2cVZBgZjOtepOUQKpq4T9CzdiZQE1
         hTdPcKCt2eWDDqmgaZTuZxpYezxMtlrYiqdMvRrlmkzCw+znXNEn/dR33hhpBpJHuO1e
         yPSd5DiFud7tJMcAgBrNdfhZtUWFOCqY+dsAMxpW4AKkMV8xLbO8mRwd6zuG7uPqXskv
         yyswO8TS1B5QddT1IFWi6uV0MKeZq64VywYMDw7N2LWRJlfCzX3rqA5Yha4XNPoc6J7n
         szbw==
X-Gm-Message-State: AOAM533vRmwLn3k/TTlSkQYZrewELNrnV0B6K1vmPpNr7We7HImMRbo5
        aS70P6nby3OHDeNjGWiew48Bkw==
X-Google-Smtp-Source: ABdhPJyQ3PA2C/BS+n5Qp6W7I8EG3hQWozXMKKHE1EZTxUJ6VAc6GI68+VqjLOXv5zAl9Add4g4D7g==
X-Received: by 2002:a2e:854a:: with SMTP id u10mr10589375ljj.309.1614641177218;
        Mon, 01 Mar 2021 15:26:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 12/24] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Tue,  2 Mar 2021 02:24:55 +0300
Message-Id: <20210301232506.3057401-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
index 8c0bc5ccba8f..0c26451db310 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -734,7 +734,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -748,31 +748,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
2.30.0

