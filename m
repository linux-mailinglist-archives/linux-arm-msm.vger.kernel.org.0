Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B330C43A8D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbhJZAEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235815AbhJZADj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:39 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDB4C061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso705986pjm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjH6JfZy633Mdr6nuYTumgUfiknsiduwzml/anz47ME=;
        b=GS7o1pHAw3tTsWH7XdqZKIN7bPOPZszkuj6EpYu8zwcOKoGqYqlV9JovaA1E4nJE3j
         vIbk8YSciBMFPuTDVsOdwKcEqX5M75LpFNJWu+hSDoHPUc/RKACkpvNf5H6XzDoYU3ZB
         MEgTebOBNPg2Pq0O36DpeosHugWzwzWZvKzS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjH6JfZy633Mdr6nuYTumgUfiknsiduwzml/anz47ME=;
        b=FUxy1E+qUvJQ0+z0S5hTluNHYsqRd2ldjakN3+zJIUC6vQyrvfm6yiL65RpbonOA0D
         ahQBPl1ocSPy9NJuauWo2iN3r5hE7+ijI+ySq+TDjDyE3vyLCDXofoW+1NnGISDvpWi0
         Ol4osPg60pyI2UNp+mlSxLR9VGkVCz0yeaWkGCI7ZyeNAve+XEQITHCGKgpKO2dPzJtl
         rGVNO5s3qEvWrgwTNVNE3p/D5eLFDWu1zAza+MStvuFYpCKkfWZJdiTFsnuZQyZPqZ+G
         8XQ7uE0Sxt6Q+6BLVlo4gScY/l8xBXXj4IMzbYEBEZWWv3KlMDlvAngHBDaM0z+hERCw
         cX0Q==
X-Gm-Message-State: AOAM530f2C+K4EbOWhIYFGm4IFUIoccUQfev1RZyGp+CU3oIQXYRyPyi
        NXwdNhb2b6o6UTJMKx6QO1O7lA==
X-Google-Smtp-Source: ABdhPJxqYbeQUqqTBAzMFcnsZfHJVsAf9NX9bB2x8AMm19LNpq0/ho/ozMVRh4r/A3bcIfhe7Rvanw==
X-Received: by 2002:a17:902:c214:b0:13f:1b2a:8011 with SMTP id 20-20020a170902c21400b0013f1b2a8011mr19334289pll.3.1635206475063;
        Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:14 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 33/34] component: Get rid of drm_of_component_probe()
Date:   Mon, 25 Oct 2021 17:00:43 -0700
Message-Id: <20211026000044.885195-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There aren't any users anymore so drop it.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 85 +++++++++-------------------------------
 include/drm/drm_of.h     | 12 ------
 2 files changed, 19 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index dc4b507c809d..5131e3dbe3a7 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -99,18 +99,30 @@ void drm_of_component_match_add(struct device *master,
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
 
-static int _drm_of_component_probe(struct device *dev,
+/**
+ * drm_of_aggregate_probe - Generic probe function for a component based aggregate host
+ * @dev: device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @adrv: aggregate driver to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the aggregate device. Interface ports are added before the encoders in
+ * order to satisfy their .bind_component requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_aggregate_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
-			   struct component_match **matchptr)
+			   struct aggregate_driver *adrv)
 {
 	struct device_node *ep, *port, *remote;
+	struct component_match *match = NULL;
 	int i;
 
 	if (!dev->of_node)
 		return -EINVAL;
 
-	*matchptr = NULL;
-
 	/*
 	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
 	 * called from encoder's .bind callbacks works as expected
@@ -121,7 +133,7 @@ static int _drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, matchptr, compare_of,
+			drm_of_component_match_add(dev, &match, compare_of,
 						   port);
 
 		of_node_put(port);
@@ -132,7 +144,7 @@ static int _drm_of_component_probe(struct device *dev,
 		return -ENODEV;
 	}
 
-	if (!*matchptr) {
+	if (!match) {
 		dev_err(dev, "no available port\n");
 		return -ENODEV;
 	}
@@ -162,72 +174,13 @@ static int _drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, matchptr, compare_of,
+			drm_of_component_match_add(dev, &match, compare_of,
 						   remote);
 			of_node_put(remote);
 		}
 		of_node_put(port);
 	}
 
-	return 0;
-}
-
-/**
- * drm_of_component_probe - Generic probe function for a component based master
- * @dev: master device containing the OF node
- * @compare_of: compare function used for matching components
- * @m_ops: component master ops to be used
- *
- * Parse the platform device OF node and bind all the components associated
- * with the master. Interface ports are added before the encoders in order to
- * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
- *
- * Deprecated: Use drm_of_aggregate_probe() instead.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_component_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops)
-{
-
-	struct component_match *match;
-	int ret;
-
-	ret = _drm_of_component_probe(dev, compare_of, &match);
-	if (ret)
-		return ret;
-
-	return component_master_add_with_match(dev, m_ops, match);
-}
-EXPORT_SYMBOL(drm_of_component_probe);
-
-
-/**
- * drm_of_aggregate_probe - Generic probe function for a component based aggregate host
- * @dev: device containing the OF node
- * @compare_of: compare function used for matching components
- * @adrv: aggregate driver to be used
- *
- * Parse the platform device OF node and bind all the components associated
- * with the aggregate device. Interface ports are added before the encoders in
- * order to satisfy their .bind_component requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_aggregate_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   struct aggregate_driver *adrv)
-{
-	struct component_match *match;
-	int ret;
-
-	ret = _drm_of_component_probe(dev, compare_of, &match);
-	if (ret)
-		return ret;
-
 	return component_aggregate_register(dev, adrv, match);
 }
 EXPORT_SYMBOL(drm_of_aggregate_probe);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 9d35a141f888..33fba4f8e304 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -8,7 +8,6 @@
 #endif
 
 struct aggregate_driver;
-struct component_master_ops;
 struct component_match;
 struct device;
 struct drm_device;
@@ -38,9 +37,6 @@ void drm_of_component_match_add(struct device *master,
 				struct component_match **matchptr,
 				int (*compare)(struct device *, void *),
 				struct device_node *node);
-int drm_of_component_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops);
 int drm_of_aggregate_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   struct aggregate_driver *adrv);
@@ -74,14 +70,6 @@ drm_of_component_match_add(struct device *master,
 {
 }
 
-static inline int
-drm_of_component_probe(struct device *dev,
-		       int (*compare_of)(struct device *, void *),
-		       const struct component_master_ops *m_ops)
-{
-	return -EINVAL;
-}
-
 static inline int
 drm_of_aggregate_probe(struct device *dev,
 		       int (*compare_of)(struct device *, void *),
-- 
https://chromeos.dev

