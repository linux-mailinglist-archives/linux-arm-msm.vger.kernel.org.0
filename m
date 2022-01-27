Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4D749EBDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343839AbiA0UCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343726AbiA0UCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F81BC061749
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:16 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so4174732pjp.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9a8zcSwcpladoTNvW+Mx8bO+UU4CpffIWXmtXe0Ndo=;
        b=X5ktv8lLpf+IELlZ3g3ez+/s2Mg1qsxtLoUl7oUREs6OxUk7pRfz3KrRj4laK6MZsJ
         rlPqF8raj9oFQiIAKqoNkqum2trbRgRBfAeKg2Mj8IQZD1i5xV+LgsrXqEpNEjAAYJgO
         LjwLv5Bx+fNXpHWa33uWdM5Vv444CSvs1Hz3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9a8zcSwcpladoTNvW+Mx8bO+UU4CpffIWXmtXe0Ndo=;
        b=OR/3SovWP34qughxaSVbtgGlov3cg9/eIhVd8OXFZPoSIWB5OPW2UwccBvSSTz0muw
         NQIuALpcP1ghcB5h3Y6JJ652bUgLYJU9Y1MQ/qpCHY7/8EedskwtbUbvIHmDUZn5QO4s
         pE+u2rZqTlEBlOaMKfSo/E4uC0lwSS/RRw4C2HMohTdZpYlguXnRlDffUZvS92JfZIi5
         aZGvA79G7LPFRepzU+lZA+Jny3AcW9ZPgVDKzPxiV5d0u8125Ftf+JHyVNYAmqX1orbT
         6YanF3Ep2zgODA11dABOl0NOFEfCHIDu2QDNgRY9KH9MsTH8I4UwZn4PnoZ7ZPr2qiaC
         fLHw==
X-Gm-Message-State: AOAM532vxE4X13K49bLnZ2vjSL8qc2b81NrXDIc5cgpQQ6ge9C7CKA1o
        DXtfq8ordrJ81tAvN9mgcNWwrw==
X-Google-Smtp-Source: ABdhPJwhwwSoScMQGXENh1vbCzHG8zEwuePWTRvR/QDNk3tl3wOiOJIi3bcWWIfqw+HtCoBAtt+CIQ==
X-Received: by 2002:a17:90b:4f4e:: with SMTP id pj14mr5917665pjb.220.1643313735720;
        Thu, 27 Jan 2022 12:02:15 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:15 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6 16/35] drm/mcde: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:22 -0800
Message-Id: <20220127200141.1295328-17-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5b5afc6aaf8e..b8479355844e 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -215,8 +215,9 @@ static const struct drm_driver mcde_drm_driver = {
 	DRM_GEM_CMA_DRIVER_OPS,
 };
 
-static int mcde_drm_bind(struct device *dev)
+static int mcde_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 	int ret;
 
@@ -247,8 +248,9 @@ static int mcde_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void mcde_drm_unbind(struct device *dev)
+static void mcde_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -256,9 +258,13 @@ static void mcde_drm_unbind(struct device *dev)
 	component_unbind_all(drm->dev, drm);
 }
 
-static const struct component_master_ops mcde_drm_comp_ops = {
-	.bind = mcde_drm_bind,
-	.unbind = mcde_drm_unbind,
+static struct aggregate_driver mcde_drm_comp_driver = {
+	.probe = mcde_drm_bind,
+	.remove = mcde_drm_unbind,
+	.driver = {
+		.name = "mcde_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static struct platform_driver *const mcde_component_drivers[] = {
@@ -419,7 +425,7 @@ static int mcde_probe(struct platform_device *pdev)
 	 * Perform an invasive reset of the MCDE and all blocks by
 	 * cutting the power to the subsystem, then bring it back up
 	 * later when we enable the display as a result of
-	 * component_master_add_with_match().
+	 * component_aggregate_register().
 	 */
 	ret = regulator_disable(mcde->epod);
 	if (ret) {
@@ -429,8 +435,7 @@ static int mcde_probe(struct platform_device *pdev)
 	/* Wait 50 ms so we are sure we cut the power */
 	usleep_range(50000, 70000);
 
-	ret = component_master_add_with_match(&pdev->dev, &mcde_drm_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &mcde_drm_comp_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		/*
@@ -459,7 +464,7 @@ static int mcde_remove(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct mcde *mcde = to_mcde(drm);
 
-	component_master_del(&pdev->dev, &mcde_drm_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &mcde_drm_comp_driver);
 	clk_disable_unprepare(mcde->mcde_clk);
 	regulator_disable(mcde->vana);
 	regulator_disable(mcde->epod);
-- 
https://chromeos.dev

