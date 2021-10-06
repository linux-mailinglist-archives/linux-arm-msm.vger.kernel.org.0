Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0534246E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239529AbhJFTks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239331AbhJFTkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:40:35 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1CBC061769
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:41 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so5184130pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3+KKYOBNeMz4YDnDUwMm+dvq1TCGf0KiZpH7bEg1t3k=;
        b=cIlUCzUKbYKvFQHptHb/+1rEiCBTsA7YiOonN/yDYcHmuOxhI9UWnR+OH082NRPZLz
         hm6RrKXV48rvk1rg8EA+DZA/S+zzACinmylAqQX3bt/3kavhk739DEfoW4Y4chpquL8Z
         P3I++WJHYPBUAFicaqfanAqoYLuenzmAfhN4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3+KKYOBNeMz4YDnDUwMm+dvq1TCGf0KiZpH7bEg1t3k=;
        b=kXFiSo/+17Ja7sDjgxqpOdTsx4UimDMD0WhIXnAVFM4xwtSd2XJFWR63LUkGxxvs5b
         0dfzu/HAwQD/DyT+RFoD+2qifRJlXZJ8QCuw111eR6pgRdVGW64V2ABWmsCEy5i9n9WW
         P+5kzh1eAKKl+UfuUiN4eiXMzwtHMl8rQSRFH0YCQEDAT6bA2v7WBDtiwE8t9RXWinwf
         JZZKR2JDoTGmb4dE8KH0d/ulNOj5YCvjDVociSfzjfRIZ8iYLeuPU1vOTfXFxdUf3hEA
         FRQPIqyrrwxdiRms+eGaptnsEpR+QVyfwbe+9Sn31r0DlHkJQ40tAsRF5pB1DkrBc5qt
         K3DA==
X-Gm-Message-State: AOAM531P7rOvGuxazwEZfBDgXt4Gt5J/w7t8GQvr6B4PElFBgcj0dE2h
        bBL007Ly+PoR12exuax+3We+Aw==
X-Google-Smtp-Source: ABdhPJzLIboz6ak13hw4FyGymL+hdEvIt62t88kiZKW2shC6ECYiY2A2MZCcaBIHk8qK3kT2wspfbw==
X-Received: by 2002:a17:902:dacf:b0:13e:ab53:87dc with SMTP id q15-20020a170902dacf00b0013eab5387dcmr12718666plx.78.1633549121440;
        Wed, 06 Oct 2021 12:38:41 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:41 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 16/34] drm/mcde: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:01 -0700
Message-Id: <20211006193819.2654854-17-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index e60566a5739c..84fcfe77540e 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -215,8 +215,9 @@ static const struct drm_driver mcde_drm_driver = {
 	DRM_GEM_CMA_DRIVER_OPS,
 };
 
-static int mcde_drm_bind(struct device *dev)
+static int mcde_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	int ret;
 
@@ -247,8 +248,9 @@ static int mcde_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void mcde_drm_unbind(struct device *dev)
+static void mcde_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
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
@@ -421,7 +427,7 @@ static int mcde_probe(struct platform_device *pdev)
 	 * Perform an invasive reset of the MCDE and all blocks by
 	 * cutting the power to the subsystem, then bring it back up
 	 * later when we enable the display as a result of
-	 * component_master_add_with_match().
+	 * component_aggregate_register().
 	 */
 	ret = regulator_disable(mcde->epod);
 	if (ret) {
@@ -431,8 +437,7 @@ static int mcde_probe(struct platform_device *pdev)
 	/* Wait 50 ms so we are sure we cut the power */
 	usleep_range(50000, 70000);
 
-	ret = component_master_add_with_match(&pdev->dev, &mcde_drm_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &mcde_drm_comp_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		/*
@@ -461,7 +466,7 @@ static int mcde_remove(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct mcde *mcde = to_mcde(drm);
 
-	component_master_del(&pdev->dev, &mcde_drm_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &mcde_drm_comp_driver);
 	clk_disable_unprepare(mcde->mcde_clk);
 	regulator_disable(mcde->vana);
 	regulator_disable(mcde->epod);
-- 
https://chromeos.dev

