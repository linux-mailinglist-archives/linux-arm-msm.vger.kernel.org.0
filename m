Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C04246CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239477AbhJFTk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239437AbhJFTk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:40:26 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF75C061766
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:30 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 66so3381769pgc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRSGJsbcrSuo8/hCk8AH4Rju+QnPEjHdwHGnjiYpj+0=;
        b=aN+zbJy7ziqmUBmCYP38UAKUihmed+FYp84G9KznDRdiWV1uTzOqYVISExYpWNudP9
         8Dc9Afor0eTRnSRj4DZvI35qEHwhtOqSMN1x3vINUIIW87cVGkpDaNrVIHbrScKtagE5
         k7RFVoTVJwC7AnEUzRZokTQlMf88bLKgetc4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRSGJsbcrSuo8/hCk8AH4Rju+QnPEjHdwHGnjiYpj+0=;
        b=bcNHpyfVLHtqtvje0H+KQ+6CgtKWhMl5XtLaGogJiA5BRN/54XCJylFsb4c7hCuBZH
         oqZyCpRl4I5lhCk14TLUTo+aHnXkUKAplddNgDmUMp3M/SjendaGqaKxC4MgfX6kGSGq
         M2fOzRouR0TANxS0hEgs2k3vEqiLELhjxDPwJf6h9ulkm/vd5fPJcQkntBZFuhzHnlBG
         UeS6s876x91LTjHe4J9vBjSNTwPSWGyCSFeu+5XH0MnLhZU5MFhDKbC/JnR6DSp0JjBl
         Y8nrfp4en7UTqnjeYSoaGYTM5qcTAsT0bmTWCXqyb076MBxfOEWUof168s+2D3YZ+Fdi
         Fctw==
X-Gm-Message-State: AOAM533QKCER1nsMLJUIE+OtR0GH9N4ik6/FAnMEB92KqM3YtTFm55+B
        Ju3QkjAhbt/yaGuQwRNFlnMVxw==
X-Google-Smtp-Source: ABdhPJw2THsDae51farFvaMjtz9MkGLifCVXXxt8tCOU+bKfcMJ5VbxsHYXLHY80SLIp4mB4UkAkVQ==
X-Received: by 2002:a65:620d:: with SMTP id d13mr483109pgv.36.1633549109943;
        Wed, 06 Oct 2021 12:38:29 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:29 -0700 (PDT)
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
Subject: [PATCH v2 06/34] drm/of: Add a drm_of_aggregate_probe() API
Date:   Wed,  6 Oct 2021 12:37:51 -0700
Message-Id: <20211006193819.2654854-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Similar to drm_of_component_probe() but using the new API that registers
a driver instead of an ops struct. This allows us to migrate the users
of drm_of_component_probe() to the new way of doing things.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 85 +++++++++++++++++++++++++++++++---------
 include/drm/drm_of.h     | 11 ++++++
 2 files changed, 77 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 997b8827fed2..58db65ad2770 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -99,30 +99,18 @@ void drm_of_component_match_add(struct device *master,
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
 
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
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_component_probe(struct device *dev,
+static int _drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops)
+			   struct component_match **matchptr)
 {
 	struct device_node *ep, *port, *remote;
-	struct component_match *match = NULL;
 	int i;
 
 	if (!dev->of_node)
 		return -EINVAL;
 
+	*matchptr = NULL;
+
 	/*
 	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
 	 * called from encoder's .bind callbacks works as expected
@@ -133,7 +121,7 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   port);
 
 		of_node_put(port);
@@ -144,7 +132,7 @@ int drm_of_component_probe(struct device *dev,
 		return -ENODEV;
 	}
 
-	if (!match) {
+	if (!*matchptr) {
 		dev_err(dev, "no available port\n");
 		return -ENODEV;
 	}
@@ -174,17 +162,76 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   remote);
 			of_node_put(remote);
 		}
 		of_node_put(port);
 	}
 
+	return 0;
+}
+
+/**
+ * drm_of_component_probe - Generic probe function for a component based master
+ * @dev: master device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @m_ops: component master ops to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the master. Interface ports are added before the encoders in order to
+ * satisfy their .bind requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Deprecated: Use drm_of_aggregate_probe() instead.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+static int drm_of_component_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   const struct component_master_ops *m_ops)
+{
+
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
 	return component_master_add_with_match(dev, m_ops, match);
 }
 EXPORT_SYMBOL(drm_of_component_probe);
 
+
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
+static int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv)
+{
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
+	return component_aggregate_register(dev, adrv, match);
+}
+EXPORT_SYMBOL(drm_of_aggregate_probe);
+
 /*
  * drm_of_encoder_active_endpoint - return the active encoder endpoint
  * @node: device tree node containing encoder input ports
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b9b093add92e..c3ec9b14df48 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -40,6 +40,9 @@ void drm_of_component_match_add(struct device *master,
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
+int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv);
 int drm_of_encoder_active_endpoint(struct device_node *node,
 				   struct drm_encoder *encoder,
 				   struct of_endpoint *endpoint);
@@ -78,6 +81,14 @@ drm_of_component_probe(struct device *dev,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_aggregate_probe(struct device *dev,
+		       int (*compare_of)(struct device *, void *),
+		       struct aggregate_driver *adrv)
+{
+	return -EINVAL;
+}
+
 static inline int drm_of_encoder_active_endpoint(struct device_node *node,
 						 struct drm_encoder *encoder,
 						 struct of_endpoint *endpoint)
-- 
https://chromeos.dev

