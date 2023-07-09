Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7449D74C826
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 22:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGIUZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 16:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjGIUZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 16:25:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966BA12A
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 13:25:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5784183e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688934315; x=1691526315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
        b=V/vHa2PK+D/qCRPIwFpoIHMlno6WlqZqZXyRqE5l7aVSLTqgaeXJzdsTHYFJDL73ge
         u3PkNWQ+1ea7I1Vf8ZUm7DnJwBcrLWpyiEfVGHabTyLLOaAEwrjm8AczawyLmVMk+1SZ
         MFvQdWnEan/H4W1f4jlDXDwTzK/mCz6892wxn8I/ya4jGvDkWx3eblObXkSmT0KEAzpy
         iyNlVRr8HTQOIfT1k0IHnU4nY8N59gDqMOwXKV+Tlm4lCFSq0lzIldVf/fGAaIVWZGjW
         +hABB49a1BDv74/TICyl6UbF43fU7DvW/2F9rFH8tcqiIDYiHABJ1qcmvuIx9tYZL7il
         2GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688934315; x=1691526315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
        b=GogxZt/ym70WPVNA0cAai7G7KzTZSL8bhQqnVy06kZ5zSPsHhhxfmoHjeL+YDwvaba
         iZOJYqTswEzZDUCd+pXRccCqAxWfekeoxWfoBRndhnQ5H9tILU03m/BGOZNVxX9o31nw
         nQQII6Dwfdf/5QaL+kfcKKa5mJ5EZcWlixUHHffe/dPEDBCCD7s1XdjmmPrgF5WPQ7ja
         B4y4vaOagSrWf8LLZ0cKomNbUTxa3wnA806QIzi2QwYgQDKI1SATJEOu6dTnOayK+vUW
         XKdeBCPl64kEsm9d2x2dOvuYJEr1Kb0FXGZpcngC4tqC7/WapZ4Zu/QSVQHP/bfxj2XS
         +P/Q==
X-Gm-Message-State: ABy/qLYvqdjDbMVPxOZO6wBPcJVs0+KITR8e/uQKMvzDks8qUpHAhXTa
        4i5/Y3WPGO7Lyimk226rFkM40A==
X-Google-Smtp-Source: APBJJlGUB8GKtg3VepVo22RlSHHMlhbrsC5WpIr5OK9gBeoUlx6CsUUmDEj4Vzo6mPoFTr5l1naNcA==
X-Received: by 2002:a05:6512:b8c:b0:4f8:6ea5:104b with SMTP id b12-20020a0565120b8c00b004f86ea5104bmr10023114lfv.30.1688934315507;
        Sun, 09 Jul 2023 13:25:15 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id 8-20020ac24828000000b004fb771a5b2dsm1428774lft.1.2023.07.09.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 13:25:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 3/3] drm/bridge_connector: implement oob_hotplug_event
Date:   Sun,  9 Jul 2023 23:25:11 +0300
Message-Id: <20230709202511.287794-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
References: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 84d8d310ef04..364f6e37fbdc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -5,6 +5,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_state_helper.h>
@@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+					    enum drm_connector_status status)
 {
-	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
@@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_hpd_cb(void *cb_data,
+					enum drm_connector_status status)
+{
+	drm_bridge_connector_handle_hpd(cb_data, status);
+}
+
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_handle_hpd(bridge_connector, status);
+}
+
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -216,6 +232,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -351,6 +368,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
+#ifdef CONFIG_OF
+		if (!drm_bridge_get_next_bridge(bridge) &&
+		    bridge->of_node)
+			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
+#endif
+
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
-- 
2.39.2

