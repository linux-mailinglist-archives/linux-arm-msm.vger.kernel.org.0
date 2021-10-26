Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0F743A8CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhJZADy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235724AbhJZAD3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:29 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC39C061348
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:06 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 75so12302187pga.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
        b=eBJkD88KGHZoyjf0uyhFOf6hXmXPj8CyJleM8bF+Z23T3g4hjnvuyInTyDrdIQ9Vvf
         PD9uL+5hQbzCJTDU5CukFarTB0O6VL8TK9y55i+Sli1EZXzjOY0sBvIDGQidzFo/X2dI
         Me3sFLyu2nTabjMtPst/dDZ0g8ftVN4RrqTkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
        b=mxUc8YnFiXBrtkZ9hlZdzJ9CW74ga5EjnG6xccZPts0Aq3VmhbL3XsOHVzVrEbSliF
         RtviHe/LzHIUkl9VRrWdE4v/yO0X/GtqH5L673hhtUGQTUlL4kmMYoS9QPacBr8SexuT
         vveTWYvKx+SbhqhXqVOfqGxCrrEUoHJwkpGRhEUAtUqhjsC6MmM/bBIxGU0D37Exp+aV
         NSRlXjEn5wry96PP7XBv4dOMYdapX/yEJU9Gi1V0qdpIJ3RB96VEIm6lizdMF5CACUq7
         llUvQOipQWTox09I6+pe2JOVBTuG/AybS21634LnpRuyO4fWLMD55XZpj5hC/SPeoaqO
         Kg6A==
X-Gm-Message-State: AOAM533kPKycywInMDj9QtaIsbkWZ2TaLe+MbDAL33GKLs1INGKnzRsZ
        fIRrow9IJEPyDueKn96whmpuGw==
X-Google-Smtp-Source: ABdhPJx+YQjSm8Kx6nD7Ebqb9PvN4A/RpsIstD9hkOnWwntjaPbSm9R27Ho+0rDkvlMCsSpNZZrSxw==
X-Received: by 2002:aa7:9043:0:b0:44d:13c7:14a5 with SMTP id n3-20020aa79043000000b0044d13c714a5mr21906414pfo.86.1635206466351;
        Mon, 25 Oct 2021 17:01:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 23/34] drm/sun4i: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:33 -0700
Message-Id: <20211026000044.885195-24-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 54dd562e294c..700f5e32eaf7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -56,8 +56,9 @@ static const struct drm_driver sun4i_drv_driver = {
 	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
-static int sun4i_drv_bind(struct device *dev)
+static int sun4i_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct sun4i_drv *drv;
 	int ret;
@@ -125,8 +126,9 @@ static int sun4i_drv_bind(struct device *dev)
 	return ret;
 }
 
-static void sun4i_drv_unbind(struct device *dev)
+static void sun4i_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -140,9 +142,13 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops sun4i_drv_master_ops = {
-	.bind	= sun4i_drv_bind,
-	.unbind	= sun4i_drv_unbind,
+static struct aggregate_driver sun4i_aggregate_driver = {
+	.probe	= sun4i_drv_bind,
+	.remove	= sun4i_drv_unbind,
+	.driver = {
+		.name = "sun4i_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static bool sun4i_drv_node_is_connector(struct device_node *node)
@@ -398,16 +404,14 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 	}
 
 	if (count)
-		return component_master_add_with_match(&pdev->dev,
-						       &sun4i_drv_master_ops,
-						       match);
-	else
-		return 0;
+		return component_aggregate_register(&pdev->dev, &sun4i_aggregate_driver, match);
+
+	return 0;
 }
 
 static int sun4i_drv_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &sun4i_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

