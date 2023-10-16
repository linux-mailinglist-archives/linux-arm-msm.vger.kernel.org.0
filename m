Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00C07CB0AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 18:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbjJPQ5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 12:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbjJPQ4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 12:56:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D42D65
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40684f53bfcso44071565e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475247; x=1698080047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jimH2tfDdFWkB0SZHBV7Ktkx0rri8vXGCD3VUxA9GeA=;
        b=yHjvUQmxK1Kaums4YIdQCsa+OqESqk8P3PMH/OCkPUkgHlLNyJj39LqHFyVwGiHAMc
         qy3dMopCMCLyt1sYYCVnuqH7VsdaOaHJVvXasX+YeeUnGxJnxmptHWyjS2dm+1e1ucVL
         dxHKa7IiJZ1y1W3Xx+FpxVmcau4drvMksrYP8ceWYE8iN001oumg/2wdPPFOfE3gt8QY
         jClpyoP6+ITv05o++JvjzzANcaZaL3w79wltt2fdYd4I77e+IErkdASD4IbcQkxaQ7uJ
         8dEwyIRu+FgbkUbga3nFxlfXlUZxG1r7MKwfVV0t0OCToLwrzMC/JHyIW6BX1FRgYJHf
         Ga4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475247; x=1698080047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jimH2tfDdFWkB0SZHBV7Ktkx0rri8vXGCD3VUxA9GeA=;
        b=QiFU9K+GNKur+p0LMV7qUGlTOKDtahbDbJvdkGgTmqIZVyP4Lv7Q+n/2FKCiFSfrlc
         kAzh941qsaejycxAw572Xn5Q/vKDA9yZ+Q3CEWuAeTeofvAxbrCRwjj4dtWQjbgZxqPv
         aEAJNB9g7etFuXnleo0+a6xOyiN/T0/nScRko17SzJbBDxIdV8fy3oW6H2TEoY6JEd12
         olAUsY4CKz1I1Byw05qXYjPKl09ocC24cFP/n9lWZ6RX2pXFAev+S5nmgCYzWR5DQB7B
         tB0cgsYpHF53E8gq8bYyDIuO63THeDThCvw0NDjZ7ROBnbZzE437/VyhNo78dZDgsLQG
         vzXg==
X-Gm-Message-State: AOJu0Yx9aUZxzMP8EhJqbsuQJ+lxkde0mwgjLGlSd+VOBlOK6cUgcM7w
        bfg8dtmTdYftPl7mbLOFWoFH8g==
X-Google-Smtp-Source: AGHT+IFDCXD+4t3VPxLJVJO+pq+UmMCJZ9tCFqBC/3siQaBareVnnULXc6m32AkE8Mx8Tvt2g0WS8w==
X-Received: by 2002:a05:600c:2a4e:b0:405:49aa:d578 with SMTP id x14-20020a05600c2a4e00b0040549aad578mr30626127wme.37.1697475247221;
        Mon, 16 Oct 2023 09:54:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:54:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 05/10] drm/msm/dsi: implement manual power control
Date:   Mon, 16 Oct 2023 19:53:50 +0300
Message-ID: <20231016165355.1327217-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement new API for tight control over the DSI link's power state.
This allows bridge and panel drivers to send DSI commands at a proper
time.

Note, this also brings back the ps8640 workaround (to be removed later,
once ps8640 driver sets up the MIPI_DSI_MANUAL_POWERUP flag).. We have
to make sure that the DSI link stays disabled in case of this bridge,
otherwise it will not work.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  4 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 44 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++++++++++++++++++++----
 3 files changed, 106 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a01c326774a6..e0ae2cb144de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -63,6 +63,8 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_tpg_enable(void);
+int msm_dsi_manager_power_up(int id);
+void msm_dsi_manager_power_down(int id);
 
 /* msm dsi */
 static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
@@ -108,6 +110,8 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 void msm_dsi_host_destroy(struct mipi_dsi_host *host);
 int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 					struct drm_device *dev);
+bool msm_dsi_host_auto_powerup(struct mipi_dsi_host *host);
+bool msm_dsi_host_early_powerup(struct mipi_dsi_host *host);
 int msm_dsi_host_init(struct msm_dsi *msm_dsi);
 int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fd2201cb62db..7010a6f17c5f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1671,10 +1671,54 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
+static bool msm_dsi_host_manual_powerup(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	return msm_host->mode_flags & MIPI_DSI_MANUAL_POWERUP;
+}
+
+bool msm_dsi_host_auto_powerup(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	return msm_host->mode_flags & MIPI_DSI_AUTO_POWERUP;
+}
+
+bool msm_dsi_host_early_powerup(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	return !msm_dsi_host_manual_powerup(host) &&
+		!msm_dsi_host_auto_powerup(host);
+}
+
+static int msm_dsi_host_power_up(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	if (msm_dsi_host_auto_powerup(host))
+		return 0;
+
+	return msm_dsi_manager_power_up(msm_host->id);
+}
+
+static void msm_dsi_host_power_down(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	if (!msm_dsi_host_manual_powerup(host))
+		return;
+
+	msm_dsi_manager_power_down(msm_host->id);
+}
+
 static const struct mipi_dsi_host_ops dsi_host_ops = {
 	.attach = dsi_host_attach,
 	.detach = dsi_host_detach,
 	.transfer = dsi_host_transfer,
+	.power_up = msm_dsi_host_power_up,
+	.power_down = msm_dsi_host_power_down,
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 9fa1f29ec11a..2d7040d21239 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -198,6 +198,44 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
+/*
+ * If the next bridge in the chain is the Parade ps8640 bridge chip then don't
+ * power on early since it seems to violate the expectations of the firmware
+ * that the bridge chip is running.
+ */
+static bool dsi_mgr_next_is_ps8640(struct drm_bridge *bridge)
+{
+	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
+
+	return next_bridge &&
+		next_bridge->of_node &&
+		of_device_is_compatible(next_bridge->of_node, "parade,ps8640");
+}
+
+static bool dsi_mgr_auto_powerup(struct drm_bridge *bridge)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct mipi_dsi_host *host = msm_dsi->host;
+
+	if (dsi_mgr_next_is_ps8640(bridge))
+		return true;
+
+	return msm_dsi_host_auto_powerup(host);
+}
+
+static bool dsi_mgr_early_powerup(struct drm_bridge *bridge)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct mipi_dsi_host *host = msm_dsi->host;
+
+	if (dsi_mgr_next_is_ps8640(bridge))
+		return false;
+
+	return msm_dsi_host_early_powerup(host);
+}
+
 static void msm_dsi_manager_set_split_display(u8 id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
@@ -228,9 +266,8 @@ static void msm_dsi_manager_set_split_display(u8 id)
 	}
 }
 
-static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
+int msm_dsi_manager_power_up(int id)
 {
-	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
@@ -240,6 +277,10 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 
 	DBG("id=%d", id);
 
+	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
+	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+		return 0;
+
 	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
 	if (ret)
 		goto phy_en_fail;
@@ -278,9 +319,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	return ret;
 }
 
-static void dsi_mgr_bridge_power_off(struct drm_bridge *bridge)
+void msm_dsi_manager_power_down(int id)
 {
-	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
@@ -312,10 +352,12 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
-	ret = dsi_mgr_bridge_power_on(bridge);
-	if (ret) {
-		dev_err(&msm_dsi->pdev->dev, "Power on failed: %d\n", ret);
-		return;
+	if (dsi_mgr_auto_powerup(bridge)) {
+		ret = msm_dsi_manager_power_up(id);
+		if (ret) {
+			dev_err(&msm_dsi->pdev->dev, "Power on failed: %d\n", ret);
+			return;
+		}
 	}
 
 	ret = msm_dsi_host_enable(host);
@@ -337,7 +379,8 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 host1_en_fail:
 	msm_dsi_host_disable(host);
 host_en_fail:
-	dsi_mgr_bridge_power_off(bridge);
+	if (dsi_mgr_auto_powerup(bridge))
+		msm_dsi_manager_power_down(id);
 }
 
 void msm_dsi_manager_tpg_enable(void)
@@ -390,7 +433,9 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	/* Save PHY status if it is a clock source */
 	msm_dsi_phy_pll_save_state(msm_dsi->phy);
 
-	dsi_mgr_bridge_power_off(bridge);
+	if (dsi_mgr_auto_powerup(bridge) ||
+	    dsi_mgr_early_powerup(bridge))
+		msm_dsi_manager_power_down(id);
 }
 
 static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
@@ -411,6 +456,9 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
+
+	if (dsi_mgr_early_powerup(bridge))
+		msm_dsi_manager_power_up(id);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.42.0

