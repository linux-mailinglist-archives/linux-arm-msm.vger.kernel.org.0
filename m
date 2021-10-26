Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B527543A8CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhJZAD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235739AbhJZADc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:32 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6C9C061243
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:08 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id t184so12518237pfd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8fBlAXi6sFYrXtAp7S0GQqlwZRRttRb1KFYpoiMF4WI=;
        b=lsr8K2a030rR0WfvezZcCFE1im2JtiNyOoBBVNT3ZzLz0QpGkEOgTqxRQLzMQySVcO
         5z0MWMfaXteKDv1SCA424nO791h6lLbvMPSHVDDlk+MuE1qDtbIXl7u0HizxUv5q6PiV
         sT5ZngUKTpX+KCzmIzo7JdHpKMFIEhgOs54yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8fBlAXi6sFYrXtAp7S0GQqlwZRRttRb1KFYpoiMF4WI=;
        b=A0LGVVLvrycp52LEmNn9ZiZb4cQ0nK8YSKq826S0Q1Hy9DlhZLcSv9B6Bp5z9G8m7g
         3QHoXN6Xaj0Gsj9ri7JnDn9CN1h3kqhWYNBEcGlVg49x9PZ72zc768/6g7Td36JaBd/k
         A6LCt6DEhxMofKw6YC7GOTLmvA0xju32xuc3s1w70e5zwVHrhq+sqTSdUGH02r6EsqJF
         xIA9IU5E7pmq2NXIcbSyUKxEUx3jK7/SOudLDAapfpeaQ1dUwS8Kymt9pzdfFWEub87v
         gbVUOf4RyOcYMvsXXfZ7NdlxXCk4FHIAEu40t8SYxwGLJziS2AE/C7F5i8j6gUfmS8FM
         8ghA==
X-Gm-Message-State: AOAM533Yg3laejlxeRhW3NYw7Sq6vtpGAFHbqMryifePq+nIEZU4+ApG
        drnZ8XcPBHV68xP3aLLJkj2ADw==
X-Google-Smtp-Source: ABdhPJyr+Y42XiVJbe97WieMkIZF3lwI88q58uOwx49usBfS0ujaudFSbSSCCsC5/7Hh0FMIQghMKw==
X-Received: by 2002:a05:6a00:1681:b0:46f:6fc0:e515 with SMTP id k1-20020a056a00168100b0046f6fc0e515mr21771511pfc.11.1635206468058;
        Mon, 25 Oct 2021 17:01:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:07 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 25/34] drm/vc4: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:35 -0700
Message-Id: <20211026000044.885195-26-swboyd@chromium.org>
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

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index f6c16c5aee68..bccbde7a2f59 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -214,8 +214,9 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
-static int vc4_drm_bind(struct device *dev)
+static int vc4_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -286,8 +287,9 @@ static int vc4_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void vc4_drm_unbind(struct device *dev)
+static void vc4_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -295,9 +297,13 @@ static void vc4_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops vc4_drm_ops = {
-	.bind = vc4_drm_bind,
-	.unbind = vc4_drm_unbind,
+static struct aggregate_driver vc4_aggregate_driver = {
+	.probe = vc4_drm_bind,
+	.remove = vc4_drm_unbind,
+	.driver = {
+		.name = "vc4_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 /*
@@ -328,12 +334,12 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
 	vc4_match_add_drivers(dev, &match,
 			      component_drivers, ARRAY_SIZE(component_drivers));
 
-	return component_master_add_with_match(dev, &vc4_drm_ops, match);
+	return component_aggregate_register(dev, &vc4_aggregate_driver, match);
 }
 
 static int vc4_platform_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &vc4_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &vc4_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

