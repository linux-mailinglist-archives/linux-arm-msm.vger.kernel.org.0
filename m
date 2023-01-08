Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6852D6613E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbjAHH0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjAHH0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80431D0FA
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bf43so8321999lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/cju9fotz0lov5duz5S4oQdny3N24g+NVMg5SEoeSQ=;
        b=rLU1K5uipb0gy24t+IepL6qVyNnwvhMzLn0RyNiqYk/gW24yFOaLJFYWI8HRMtzB00
         MkECToLk/8l+PP7XU7IVOJLFytHIENcsEweM6srbVhtYmRuQArOJ9v+hNEfqG79HEhPa
         8xjf6FBkW+eH8G/c6GQyitugECkrd8gqjCLQF8HrXBndZXDP5k+3+IsNvfjy4Uzr7v+6
         0xpxtqb9/tABUpH/RbiapfrX0sVCrV5ccY3JzIYfOFJvEZ1PUb3Rz+nq97P1oqLA9QBi
         +PwJJHC5AdGyR7nnsD9BpmFwW3M+6xZhWiKtI0Ai2cbhA6YDFMl1GcWXqxNbykYs6nEY
         MKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/cju9fotz0lov5duz5S4oQdny3N24g+NVMg5SEoeSQ=;
        b=ZmJm4zjoQjpafW0Xmc1ziG/q5VVrPz9ZrU1OT3plpu9RpHb2UCfieyaK3OlB6vOD2I
         PqnAwAmUb7ssOtKFeueLKkUiC17zHlXZSMLW6QjtbpSzCRjlUxoOMiyUXoplgKnfP0H/
         mj78uuOnTkYaClGulK33NMLvKHQebqhAqswE2AN/7a8Pq9FtiATWm7R0FmQtUrU21zMg
         fPdrsZCItIrnOozpaiMdONuqGkEaiHkAmCVBjgiIuaJHz9fqAfIoomyZF/zuULx8M+jT
         kZbMw11YDK+uPh3/oM5p+bvoT/huJE3oWbJkL3jFvFexwPpLRhj4tlYezbgtmFIIC6xz
         9bfA==
X-Gm-Message-State: AFqh2krwubTBAA3DsQ39WaKnjEITfNuPF77YzLAVNvA5pkv3ZehWl0QU
        8LN7EN0MXOuFxVkZ2GE999hIQA==
X-Google-Smtp-Source: AMrXdXskec8bUaQHl367R6JZpMP1qlkjjBNCz6mTmI7rHJpfquyB5B3zGsboE1R6eRZDWvm4INLH6g==
X-Received: by 2002:a19:7008:0:b0:4b5:7d49:4a05 with SMTP id h8-20020a197008000000b004b57d494a05mr15425094lfc.0.1673162762122;
        Sat, 07 Jan 2023 23:26:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:26:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 08/12] drm/bridge: lt9611: attach to the next bridge
Date:   Sun,  8 Jan 2023 09:25:51 +0200
Message-Id: <20230108072555.2905260-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings require that there is a next bridge after the lt9611. If
nothing else it can be the hdmi-connector (as used on the RB3 platform,
see sdm845-db845c.dts).

Bring in the next bridge into the drm bridges chain and attach to it.

Since lt9611 is not anymore the last bridge in the chain, this also
allows us to drop all the !DRM_BRIDGE_ATTACH_NO_CONNECTOR functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 99 ++-----------------------
 1 file changed, 7 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b65a573be27..773d7a56f86f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -19,6 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -33,7 +34,7 @@
 struct lt9611 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
+	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 
@@ -107,11 +108,6 @@ static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 	return container_of(bridge, struct lt9611, bridge);
 }
 
-static struct lt9611 *connector_to_lt9611(struct drm_connector *connector)
-{
-	return container_of(connector, struct lt9611, connector);
-}
-
 static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
 {
 	const struct reg_sequence reg_cfg[] = {
@@ -581,9 +577,9 @@ static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
 	return NULL;
 }
 
-/* connector funcs */
-static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
+static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	unsigned int reg_val = 0;
 	int connected = 0;
 
@@ -596,12 +592,6 @@ static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
 	return lt9611->status;
 }
 
-static enum drm_connector_status
-lt9611_connector_detect(struct drm_connector *connector, bool force)
-{
-	return __lt9611_detect(connector_to_lt9611(connector));
-}
-
 static int lt9611_read_edid(struct lt9611 *lt9611)
 {
 	unsigned int temp;
@@ -683,30 +673,6 @@ lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 	return 0;
 }
 
-static int lt9611_connector_get_modes(struct drm_connector *connector)
-{
-	struct lt9611 *lt9611 = connector_to_lt9611(connector);
-	unsigned int count;
-	struct edid *edid;
-
-	lt9611_power_on(lt9611);
-	edid = drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-}
-
-static enum drm_mode_status
-lt9611_connector_mode_valid(struct drm_connector *connector,
-			    struct drm_display_mode *mode)
-{
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
-
-	return lt9611_mode ? MODE_OK : MODE_BAD;
-}
-
 /* bridge funcs */
 static void
 lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -784,21 +750,6 @@ lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 }
 
-static struct
-drm_connector_helper_funcs lt9611_bridge_connector_helper_funcs = {
-	.get_modes = lt9611_connector_get_modes,
-	.mode_valid = lt9611_connector_mode_valid,
-};
-
-static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = lt9611_connector_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 						 struct device_node *dsi_node)
 {
@@ -834,44 +785,13 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	return dsi;
 }
 
-static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
-{
-	int ret;
-
-	ret = drm_connector_init(bridge->dev, &lt9611->connector,
-				 &lt9611_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&lt9611->connector,
-				 &lt9611_bridge_connector_helper_funcs);
-
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
-
-	return 0;
-}
-
 static int lt9611_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	int ret;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = lt9611_connector_init(bridge, lt9611);
-		if (ret < 0)
-			return ret;
-	}
 
-	return 0;
+	return drm_bridge_attach(bridge->encoder, lt9611->next_bridge,
+				 bridge, flags);
 }
 
 static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
@@ -918,11 +838,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	lt9611_sleep_setup(lt9611);
 }
 
-static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
-{
-	return __lt9611_detect(bridge_to_lt9611(bridge));
-}
-
 static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
@@ -995,7 +910,7 @@ static int lt9611_parse_dt(struct device *dev,
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-	return 0;
+	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
 }
 
 static int lt9611_gpio_init(struct lt9611 *lt9611)
-- 
2.39.0

