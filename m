Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8D74911C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfFQUNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:49 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42385 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfFQUNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:49 -0400
Received: by mail-qk1-f194.google.com with SMTP id b18so7023729qkc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8D4fpJmFY4SmM2l/JKOdVtbyAkJaL5JwqyG6lAC7i44=;
        b=TlA2izxyGxy/AB0BmL6o3peFHfIycGsvRzNH80Dm3Gh+0XagV93JT1nomoZjAwx3Vp
         2TLX7RbdRM1gDHAxkxaNIY7mxjOCqVPTSxvtkm0oTbJ8/zyFE3gtdwWIRvWe5joWhklf
         rYYBCp3a2NQ/UNqWIP0PUkiZK5ChJ/VPtIDJ6b4QNYRt2Wbty9PWYFopbllQmELXpbYd
         N3bmtgwRVmuarb96TDQ0UeRJvPOHGYW5J9qlJ5hYN7zVYuxpjbVWPLSJVZaEn84YVh0r
         kpCY0u+8CbOUFdtPB4xLCuZORVHYhJSacGFg3JaUWa7oPZJOlkEqxckly50lah6nMakJ
         tbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8D4fpJmFY4SmM2l/JKOdVtbyAkJaL5JwqyG6lAC7i44=;
        b=H2bqpRV2Ckr1ciTMBeS8lRbe93eMrxSRerOYsaNqB1ZvWcN80wsuymCL+JvcERTOdB
         9ax6B7378EyzYfDcs7X+c2gfFFnbFFw65ypksscBi6m0pgfJO+6pdyvQ4datrnqUycth
         BXrBn461fRHD2Tc1HJ/YDknA4A4YGirBRS0XZ0GuUJYqKgADn1ZxeipPqQZwFTFiBLFu
         S9gpd/wgGXL+cDaDMKFLJJuu1OV5oX/VFuJDf6Zbg6rIukqkxvsP7ldxLPueYWDIqH+m
         NlxLo3eVSXf1+6kemHaqp+Sobh1wMd7NLKYgBox4THs94yGNF6l+Gka+pBdGbpVLeNLt
         NUrg==
X-Gm-Message-State: APjAAAWd9enY070vcxI3E+ydNO1zx8x0clYyFhEeJ3s+/lrZkMIW4zur
        hh1GrT2LP6xeue5boJmoiFDKJQ==
X-Google-Smtp-Source: APXvYqyVopaO7ELEOlR+hgQSDvaXfKt1Dbo8ZDtVFdgbP0AOMItc20y562fsPNfb6gNkN7+n1cwp/Q==
X-Received: by 2002:a37:bc03:: with SMTP id m3mr13718582qkf.199.1560802428032;
        Mon, 17 Jun 2019 13:13:48 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:47 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 13/13] drm/msm/dsi: Move setup_encoder to modeset_init
Date:   Mon, 17 Jun 2019 16:12:58 -0400
Message-Id: <20190617201301.133275-10-sean@poorly.run>
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

Now that the panel probe/setup is in the modeset path, we can call
dsi_manager_setup_encoder() in a common place for both internal and
external bridge setups.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  2 ++
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    |  2 --
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 27 ++-------------------------
 4 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 7b2a1e6a8810..d45b0a40aaf3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -250,6 +250,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
+	msm_dsi_manager_setup_encoder(msm_dsi->id);
+
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index f8a611725f2e..53bb124e8259 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -96,7 +96,7 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
 struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
-void msm_dsi_manager_attach_dsi_device(int id);
+void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index effea0db5626..04db0c806aa4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1598,8 +1598,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
 
-	msm_dsi_manager_attach_dsi_device(msm_host->id);
-
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 5db43c7ffafc..ff39ce6150ad 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -239,7 +239,7 @@ static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
 	return !(host_flags & MIPI_DSI_MODE_VIDEO);
 }
 
-static void msm_dsi_manager_setup_encoder(int id)
+void msm_dsi_manager_setup_encoder(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
@@ -280,12 +280,7 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 		return PTR_ERR(panel);
 	}
 
-	if (!panel)
-		return 0;
-
-	msm_dsi_manager_setup_encoder(id);
-
-	if (!IS_DUAL_DSI())
+	if (!panel || !IS_DUAL_DSI())
 		goto out;
 
 	drm_object_attach_property(&conn->base,
@@ -790,24 +785,6 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len)
 	return true;
 }
 
-void msm_dsi_manager_attach_dsi_device(int id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_device *dev = msm_dsi->dev;
-
-	/*
-	 * drm_device pointer is assigned to msm_dsi only in the modeset_init
-	 * path. If mipi_dsi_attach() happens in DSI driver's probe path
-	 * (generally the case when we're connected to a drm_panel of the type
-	 * mipi_dsi_device), this would be NULL. In such cases, try to set the
-	 * encoder mode in the DSI connector's detect() op.
-	 */
-	if (!dev)
-		return;
-
-	msm_dsi_manager_setup_encoder(id);
-}
-
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi)
 {
 	struct msm_dsi_manager *msm_dsim = &msm_dsim_glb;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

