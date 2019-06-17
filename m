Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D3A49114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfFQUNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:42 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43027 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfFQUNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id w17so6001839qto.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0IYZw+KH0ep1U9uj+KlMGqWaqwAhViNoXO4Kfh8beQ=;
        b=G4uJYUFMtcTefXKAlRErNW0ANUVg7YuNxp3waBaDItU+/XvEaV64v4+HFc2q+inCPu
         xE+BYJqIBaR8N6IPnstD/HwIDz3kEz+PGZOZUTK7NVsYpnv01Sdt8dxT/nFA/0w+tm80
         M3BB/yHh3FDEgkY9tBCoAsv0OGnJQ2F/vOLi/o3QNLIeVOHQmr0IULbOeswl7BYilBKP
         FeGeAdr2AJCJsFqIFX30M9KVLqIjBrlv7EGO+Yt6C0ACEdqKzaUlujqjqasfrJoFH5HD
         2w7yHGRDMNBK0Mhc6jQiSjwyZZ6+Qo10xAuHU0tj3V27OaLX5klFzpt5DYVFC8NVp+La
         Yqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0IYZw+KH0ep1U9uj+KlMGqWaqwAhViNoXO4Kfh8beQ=;
        b=RwgAzQfr30rDGqbboHyl8HuV1yQ9uy1tDAqNUhn7J62jzlDUVk12j2puqOQC8co0Ny
         In8Kd86daO01+gGGONgiS3MdUsCbV9wyxDRfONzGaQJclffxmAK18v99JRxr4EMu94kD
         ghAVLBmd1XpHPPZTCucEGDdZbVRjw96ut5QKc/nXm337Dy80qYOV0I/tlEQkAWDy6Pft
         Hme1MZl0e5GNqaClMpdATBT0Jr4SXep2iki6i1Byu680EgjEdmYbVmAg9NfIpou63epd
         05HAAxji9u4HVK6jpXO8pH+C4pLZloZdEaCugafsDfSyfJuEx49zWk1b5fkkmFCQVLLI
         0PpA==
X-Gm-Message-State: APjAAAW4NL9YE5lXhV8cbwXyc2fZqC72dk4Xs6jXGv9A+Z/+KJhbj6Yq
        ylJKS03Yvc518vxoZ/vv0rIMSw==
X-Google-Smtp-Source: APXvYqy+jk+BfnzTYGY88EaSeelKmL4/FugRI08hWufUcxI6WAllfyoDpbco0gKpGs4EEpE6pKrO7w==
X-Received: by 2002:ac8:38cc:: with SMTP id g12mr95183704qtc.68.1560802421456;
        Mon, 17 Jun 2019 13:13:41 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:41 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 11/13] drm/msm/dsi: Use the new setup_encoder function in attach_dsi_device
Date:   Mon, 17 Jun 2019 16:12:56 -0400
Message-Id: <20190617201301.133275-8-sean@poorly.run>
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

Now that we have a function to call set_encoder_mode() for us, use it.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 15 ++-------------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index e0bbe8128aef..f8a611725f2e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -96,7 +96,7 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
 struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
-void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags);
+void msm_dsi_manager_attach_dsi_device(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index daa08a033b59..effea0db5626 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1598,7 +1598,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
 
-	msm_dsi_manager_attach_dsi_device(msm_host->id, dsi->mode_flags);
+	msm_dsi_manager_attach_dsi_device(msm_host->id);
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 1ee3197a9bdd..602953b90cab 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -787,14 +787,10 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len)
 	return true;
 }
 
-void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
+void msm_dsi_manager_attach_dsi_device(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
-	struct msm_drm_private *priv;
-	struct msm_kms *kms;
-	struct drm_encoder *encoder;
-	bool cmd_mode;
 
 	/*
 	 * drm_device pointer is assigned to msm_dsi only in the modeset_init
@@ -806,14 +802,7 @@ void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
 	if (!dev)
 		return;
 
-	priv = dev->dev_private;
-	kms = priv->kms;
-	encoder = msm_dsi_get_encoder(msm_dsi);
-	cmd_mode = !(device_flags &
-				 MIPI_DSI_MODE_VIDEO);
-
-	if (encoder && kms->funcs->set_encoder_mode)
-		kms->funcs->set_encoder_mode(kms, encoder, cmd_mode);
+	msm_dsi_manager_setup_encoder(id);
 }
 
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

