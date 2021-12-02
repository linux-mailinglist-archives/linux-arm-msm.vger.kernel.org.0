Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3FC466C9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377607AbhLBWcX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377500AbhLBWbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:55 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44ADC061377
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:28:03 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id np3so836280pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmFwe71O6SgnJZrxVfyGwLakllS28Q6zlhd/maqZWnU=;
        b=A2/U/ZMfkChUnfq9PsvkbMDIt7QDQEY3r0JB9IYuAmZMJuo3Jgb7y5L+FnhyzRWdlY
         lGot14kFBgoB6mXDUmCETO/evZUJqdKKpAoX94yqD2P92PEyJi6DLmS/rl3WAeeyJO7M
         gdOOflOBf0yux+U7qNgXsj6GtxkhwOuZu5xjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmFwe71O6SgnJZrxVfyGwLakllS28Q6zlhd/maqZWnU=;
        b=6E51NyzijPILuk7dIaCd3oYiSy4mhjgTMktFO3OETvQkQhTwn7lUKXvxvYcwvQtJVT
         Sl7ENDVgXuJOZWSOdAnAsvTqp96wvAFHQpGWwzRJI2sV1eOLzBAVvOexmATV/y5soBws
         Fq0NdyrPXa0gBWzH6cJncL+4ZCbmzDELH6sDVXBqGZiIyww+wCM+BttxvIL/ZqZTjI/q
         pTi9kJDxp9jz4yIz7wYJaK6Jl4LfsZmCYM+5b/nU6iEmR4Fsv2EcXZqlZZUIvHRZ2GW1
         NQ/Xzsl//iWMvo7ISQzhdPtCxRLoJzd6u0nphV2AkiFJ8CTPFmh5EmTa41kChjSBe9wS
         CIrg==
X-Gm-Message-State: AOAM533GNEZyEXCdxPCtTwyiaTG90WlIxvRyZtUHto1+EhswxXIeIT9z
        oKEaOlKuGKOeiJvdfY9qQQMsuw==
X-Google-Smtp-Source: ABdhPJzat4Uvneo1FNwJL5HsXMAaJnq1bdWvYSmzqPyx/ouc4S5AI21i23OXcJoKd7h6RbkLNCO6rQ==
X-Received: by 2002:a17:90a:6f61:: with SMTP id d88mr9288909pjk.109.1638484083444;
        Thu, 02 Dec 2021 14:28:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:28:03 -0800 (PST)
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
Subject: [PATCH v4 33/34] component: Get rid of drm_of_component_probe()
Date:   Thu,  2 Dec 2021 14:27:31 -0800
Message-Id: <20211202222732.2453851-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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
index 008d6b7d2283..c57216e28b70 100644
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

