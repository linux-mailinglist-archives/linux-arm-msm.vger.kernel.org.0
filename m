Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910F5466C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377329AbhLBWbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377341AbhLBWb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:29 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD50C0613F4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:49 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id z6so945347pfe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InGYSc3cNsqSsbEpZp55brWuJhvXfCPzOPufF1ln430=;
        b=hq0KVI3W2yasYBuPgIGtzBCut5dk4DJYuICxw3vS2py6HtWsmJi0uOZrbEt2z5j4bQ
         vk45hg2s5gz+GFi/7KR+2nDoWq28hq/63rxC2XqkyKm+DHAxwf8l/MoPaqX83nBWNAiP
         byNhGcarciphKJgh8x2UQWNtymc+mEA+PPlJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InGYSc3cNsqSsbEpZp55brWuJhvXfCPzOPufF1ln430=;
        b=FvBDuPTjd6NmwqOOn3Z+OdC+4LcD20KIeZJ3QPx7NeJbyHGdjAhzexplu40+EXoLjS
         3zxSgzKDXvvHTsMQArbyPcV81qH3omcDKzQl8A847KqWTd7cDm3oPOu9BCnh+3QZRYfh
         WkHSZiu6cMzLAY4pokV4wxq1L5rT8vc2OT+PjZEpbQjQ1LyjbB18l2HHOVQawcDEqUup
         XA04/TsgNdEHgnEiUASUbGFrrmjs9U+fbe2pm2c5RG9wmCGMEnz0ljfMZorX7v33QP1D
         c5HCJCUCXmOCavKSdUsFR6i2csjQubGqnMDmugUTtWu/gNBb9+dH7XhVzcDKbHwMQCbt
         wT7w==
X-Gm-Message-State: AOAM533DNKPaJqr6Ga9oY6coCLSB0+qHTZ2BGwX71/U4dymPTK9mdBkS
        JkoE01z1YtzSYUGATGhGKn+mSg==
X-Google-Smtp-Source: ABdhPJzBOFRRT3xYAgGwIIFyu36iZ8Fa/CB6Iksub5c1GFh4wBor6MIE8SX52J8xtv42ROyKRqcMew==
X-Received: by 2002:a63:2ccd:: with SMTP id s196mr1541758pgs.77.1638484069377;
        Thu, 02 Dec 2021 14:27:49 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:49 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 16/34] drm/ingenic: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:14 -0800
Message-Id: <20211202222732.2453851-17-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

TODO: Move the helpers to PM in aggregate driver hooks.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 25 +++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..d5330fb486e8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int ingenic_drm_bind_with_components(struct device *dev)
+static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return ingenic_drm_bind(dev, true);
 }
 
@@ -1174,9 +1176,20 @@ static void ingenic_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(&priv->drm);
 }
 
-static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind_with_components,
-	.unbind = ingenic_drm_unbind,
+static void ingenic_aggregate_remove(struct aggregate_device *adev)
+{
+	struct device *dev = adev->parent;
+
+	ingenic_drm_unbind(dev);
+}
+
+static struct aggregate_driver ingenic_aggregate_driver = {
+	.probe = ingenic_drm_bind_with_components,
+	.remove = ingenic_aggregate_remove,
+	.driver = {
+		.name = "ingenic_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -1196,7 +1209,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
 
-	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+	return component_aggregate_register(dev, &ingenic_aggregate_driver, match);
 }
 
 static int ingenic_drm_remove(struct platform_device *pdev)
@@ -1206,7 +1219,7 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		ingenic_drm_unbind(dev);
 	else
-		component_master_del(dev, &ingenic_master_ops);
+		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

