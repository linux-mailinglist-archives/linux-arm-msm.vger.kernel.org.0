Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9052549113
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfFQUNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42569 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id s15so12383414qtk.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEzDz4BPwaXyOzKMYCDNx7vRyXhUAqPWeV1ESTD5Msw=;
        b=RmwMLFgADM/Y4oOIGfOByWNQ7s+7D6P7ii2gtAZKBobXJy53BAUzHSI5Qw0KDF3zxk
         X3YGx06UTge38Yuoeb/8kgrBdfwR214UiSxRYcPBJk8FGNNp3C+lPwbmI8eimI3xdpXe
         UZiZYRsQGHopnaoGSXrMPtnxFbZZtKgITGJg7BzNx5NNcnEIC223j+MafS4tHyzg2DIJ
         Xkzw4Ty4jFIQXXbM1QyUcGeGOZZngStS6++yDQ/p+jsHeEkUyDr1ExmG2Prbo5+xxfSX
         wx45F4TqQOlMGOFQu9zquwZ1qGnhbYj7ZR+4zzr0X6kQ9AiQDTuNYnk3Z98bzpgtcTf1
         4qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEzDz4BPwaXyOzKMYCDNx7vRyXhUAqPWeV1ESTD5Msw=;
        b=ABHSSjxa6yzuf6zJQmmmiiIN1F+WjM6yAiAV/sWRFueUQRWJ/I+/1CqezqMQ8xQAKk
         gyTBz5kK0uTEQKcj5cMCsLZKVO1T7bfg5UQVnaGP6kbLvlGBPurn+dB+Bafm2sk7R8/H
         +8pP3564lF4ez62Qd/UCP4b5fhn2BXzLzWtl6JmfAu3dToRP6bri6l1d0Teykm6nU60P
         2SsTqyLefsZyyJE1Il1C7HAWL8i34862eXR6wKhlQMyEj2Zh0UNP8cbHd0weClZqsfKt
         9i7y1o+z4OCpZdTcjxlZwmhHCdpgYJNsHVhBF2AdFy8iqvfQUyZDHvEWsr5ZT6Wvajma
         Xqiw==
X-Gm-Message-State: APjAAAWJRAEZ8PTevN/PDNYkrCfi/atgkS6ZZ1xwLhZmslsd7zdgQ/J/
        PWs3Uv2QvL9NBmoiRgsT/6/apQ==
X-Google-Smtp-Source: APXvYqyLyxUymcgrRFmmufiz/kOXGnQYyeWV9QnX+UgPcxWMaPbwqGbNet6adg07NnOWiTdeDRSK8Q==
X-Received: by 2002:ac8:37b8:: with SMTP id d53mr76369630qtc.227.1560802418627;
        Mon, 17 Jun 2019 13:13:38 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:38 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/13] drm/msm/dsi: Simplify the logic in msm_dsi_manager_panel_init()
Date:   Mon, 17 Jun 2019 16:12:55 -0400
Message-Id: <20190617201301.133275-7-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch moves things around a bit to be a little more readable and
pulls out the set_encoder_mode() call into its own function for later
use.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 100 +++++++++++++++-----------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 855139195769..1ee3197a9bdd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -239,56 +239,71 @@ static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
 	return !(host_flags & MIPI_DSI_MODE_VIDEO);
 }
 
-static void msm_dsi_manager_panel_init(struct drm_connector *connector, u8 id)
+static void msm_dsi_manager_setup_encoder(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
-	struct msm_drm_private *priv = connector->dev->dev_private;
+	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	bool cmd_mode;
+	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
 
-	if (!msm_dsi->panel) {
-		msm_dsi->panel = msm_dsi_host_get_panel(msm_dsi->host);
+	if (encoder && kms->funcs->set_encoder_mode)
+		kms->funcs->set_encoder_mode(kms, encoder,
+					     dsi_mgr_is_cmd_mode(msm_dsi));
+}
 
-		/* There is only 1 panel in the global panel list
-		 * for dual DSI mode. Therefore slave dsi should get
-		 * the drm_panel instance from master dsi.
-		 */
-		if (!msm_dsi->panel && IS_DUAL_DSI() &&
-			!IS_MASTER_DSI_LINK(id) && other_dsi)
-			msm_dsi->panel = msm_dsi_host_get_panel(
-						other_dsi->host);
+static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
+{
+	struct msm_drm_private *priv = conn->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
+	struct msm_dsi *master_dsi, *slave_dsi;
+	struct drm_panel *panel;
 
+	if (IS_DUAL_DSI() && !IS_MASTER_DSI_LINK(id)) {
+		master_dsi = other_dsi;
+		slave_dsi = msm_dsi;
+	} else {
+		master_dsi = msm_dsi;
+		slave_dsi = other_dsi;
+	}
 
-		cmd_mode = dsi_mgr_is_cmd_mode(msm_dsi);
-		if (msm_dsi->panel && kms->funcs->set_encoder_mode) {
-			struct drm_encoder *encoder =
-					msm_dsi_get_encoder(msm_dsi);
+	/*
+	 * There is only 1 panel in the global panel list for dual DSI mode.
+	 * Therefore slave dsi should get the drm_panel instance from master
+	 * dsi.
+	 */
+	panel = msm_dsi_host_get_panel(master_dsi->host);
+	if (IS_ERR(panel)) {
+		DRM_ERROR("Could not find panel for %u (%ld)\n", msm_dsi->id,
+			  PTR_ERR(panel));
+		return PTR_ERR(panel);
+	}
 
-			kms->funcs->set_encoder_mode(kms, encoder, cmd_mode);
-		}
+	if (!panel)
+		return 0;
 
-		if (msm_dsi->panel && IS_DUAL_DSI())
-			drm_object_attach_property(&connector->base,
-				connector->dev->mode_config.tile_property, 0);
+	msm_dsi_manager_setup_encoder(id);
 
-		/* Set split display info to kms once dual DSI panel is
-		 * connected to both hosts.
-		 */
-		if (msm_dsi->panel && IS_DUAL_DSI() &&
-			other_dsi && other_dsi->panel) {
-			struct drm_encoder *encoder = msm_dsi_get_encoder(
-					dsi_mgr_get_dsi(DSI_ENCODER_MASTER));
-			struct drm_encoder *slave_enc = msm_dsi_get_encoder(
-					dsi_mgr_get_dsi(DSI_ENCODER_SLAVE));
-
-			if (kms->funcs->set_split_display)
-				kms->funcs->set_split_display(kms, encoder,
-							slave_enc, cmd_mode);
-			else
-				pr_err("mdp does not support dual DSI\n");
-		}
+	if (!IS_DUAL_DSI())
+		goto out;
+
+	drm_object_attach_property(&conn->base,
+				   conn->dev->mode_config.tile_property, 0);
+
+	/*
+	 * Set split display info to kms once dual DSI panel is connected to
+	 * both hosts.
+	 */
+	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
+		kms->funcs->set_split_display(kms, master_dsi->encoder,
+					      slave_dsi->encoder,
+					      dsi_mgr_is_cmd_mode(msm_dsi));
 	}
+
+out:
+	msm_dsi->panel = panel;
+	return 0;
 }
 
 static enum drm_connector_status dsi_mgr_connector_detect(
@@ -298,8 +313,11 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 
 	DBG("id=%d", id);
-	if (!msm_dsi->panel)
-		msm_dsi_manager_panel_init(connector, id);
+	if (!msm_dsi->panel) {
+		int ret = msm_dsi_manager_panel_init(connector, id);
+		if (ret)
+			return connector_status_disconnected;
+	}
 
 	return msm_dsi->panel ? connector_status_connected :
 		connector_status_disconnected;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

