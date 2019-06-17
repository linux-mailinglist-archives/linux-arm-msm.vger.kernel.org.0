Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B64364910D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfFQUNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:34 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42549 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:34 -0400
Received: by mail-qt1-f196.google.com with SMTP id s15so12383016qtk.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jxs1S2d2hEiLW82WrQt+RxzLo4SztRkqjbe0RaFo6/s=;
        b=O0ax73sp/+EuyzNDsfHkAAsUf01j89TC19eFeVjyMhAJUyZBseS7i+o3vyhXU4+kQb
         Qfp+/WmglUwkpelFJfRmAmrKs+mLPd0yY2NpFF1175iGrouehTBzW2E0zwTMmR0vdxv5
         3vTg6NSaVTshR+GKQNLU3mdAxrED5JF0wTxmWt7EZm7woMaTRlvMuotfkUbDP3h3Yypb
         hkfr3DYmJ6DKxz22HEGkVaj0eZCKfebHZZY+ftqSS3KKgHKn6HndcpnROlgPdin5BJMf
         JNeFXLKkZDYcmUTBtlzoODykuOYO/yzwv7HBowQwUnsTqZpMOLazwxmBR+B3dZkqN1oG
         k03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jxs1S2d2hEiLW82WrQt+RxzLo4SztRkqjbe0RaFo6/s=;
        b=KBFEBSVNLigylZOcoWvTeYnMoIYoGmmko9htfPj5dUuxSrrwxYc9q6kbL1ISbeCGvJ
         1i7ZDHm/uycXj9sfAI3gNgaAamkUZHO7hv5OKVT4EAVbVDnpn9OqV1AdWk+pseNRM2zu
         ZGnfo9xZwhajgxlQPkbryJfGmUUkda8uCnujOxatNvq6WNcaZ/kwN0Fbf1/JjMp89dS7
         J94em0wfk/+zN81WRpwuCk7O5EgQoZ47+9H4lLfnsTB6v0xyifkkSQo/gGoz+Tw5SbLg
         L6Z6rkBRyda2C2GBmFsXijF5BxGXYzQGChuCdewgMrlhoEEBqInGVSl1qWCZBW3cd0Id
         frJg==
X-Gm-Message-State: APjAAAVivW92+eo2BmIZedQBJk1QOTr0RSLrDYt+Qdtau8RZkYiz+PMv
        uAK5RH4v+gFmmWI1hbVXsqtMWg==
X-Google-Smtp-Source: APXvYqxrCCqUNZYscrPplWQuYI6u4SH9DgjdX5HyNqBtvGiURcPXRZ1zswf+fS5gy+aDHRDdNa7TWg==
X-Received: by 2002:aed:3ac5:: with SMTP id o63mr24476334qte.309.1560802413064;
        Mon, 17 Jun 2019 13:13:33 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:32 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 08/13] drm/msm/dsi: Don't store dsi host mode_flags in msm_dsi
Date:   Mon, 17 Jun 2019 16:12:53 -0400
Message-Id: <20190617201301.133275-5-sean@poorly.run>
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

It's a bit dangerous to store the flags in msm_dsi since there's no way to
tell when they're populated. Fortunately the only place that uses them
is the same place that fills them. So just use a local variable and
delete the struct member.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 17 +++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 8bdc48ca0b67..e0bbe8128aef 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -79,7 +79,6 @@ struct msm_dsi {
 	 */
 	struct drm_panel *panel;
 	struct drm_bridge *external_bridge;
-	unsigned long device_flags;
 
 	struct device *phy_dev;
 	bool phy_enabled;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 56b8091b75e7..735fff79ae67 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -233,6 +233,12 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
+static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
+	return !(host_flags & MIPI_DSI_MODE_VIDEO);
+}
+
 static enum drm_connector_status dsi_mgr_connector_detect(
 		struct drm_connector *connector, bool force)
 {
@@ -241,17 +247,15 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
 	struct msm_drm_private *priv = connector->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
+	bool cmd_mode;
 
 	DBG("id=%d", id);
 	if (!msm_dsi->panel) {
 		msm_dsi->panel = msm_dsi_host_get_panel(msm_dsi->host);
-		msm_dsi->device_flags = msm_dsi_host_get_mode_flags(
-						msm_dsi->host);
 
 		/* There is only 1 panel in the global panel list
 		 * for dual DSI mode. Therefore slave dsi should get
-		 * the drm_panel instance from master dsi, and
-		 * keep using the panel flags got from the current DSI link.
+		 * the drm_panel instance from master dsi.
 		 */
 		if (!msm_dsi->panel && IS_DUAL_DSI() &&
 			!IS_MASTER_DSI_LINK(id) && other_dsi)
@@ -259,9 +263,8 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 						other_dsi->host);
 
 
+		cmd_mode = dsi_mgr_is_cmd_mode(msm_dsi);
 		if (msm_dsi->panel && kms->funcs->set_encoder_mode) {
-			bool cmd_mode = !(msm_dsi->device_flags &
-					  MIPI_DSI_MODE_VIDEO);
 			struct drm_encoder *encoder =
 					msm_dsi_get_encoder(msm_dsi);
 
@@ -277,8 +280,6 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 		 */
 		if (msm_dsi->panel && IS_DUAL_DSI() &&
 			other_dsi && other_dsi->panel) {
-			bool cmd_mode = !(msm_dsi->device_flags &
-						MIPI_DSI_MODE_VIDEO);
 			struct drm_encoder *encoder = msm_dsi_get_encoder(
 					dsi_mgr_get_dsi(DSI_ENCODER_MASTER));
 			struct drm_encoder *slave_enc = msm_dsi_get_encoder(
-- 
Sean Paul, Software Engineer, Google / Chromium OS

