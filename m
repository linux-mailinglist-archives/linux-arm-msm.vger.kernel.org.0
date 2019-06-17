Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE87E4910B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFQUNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:31 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39802 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:31 -0400
Received: by mail-qt1-f194.google.com with SMTP id i34so7118468qta.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uNOx45kFSG/Yc9D3NQVx4HiI/G/jW8KW7kdSijKdY50=;
        b=Zqvo1ZzApoS+VMx0AyAw9fTnBJqSz0oHFbN/BkF1zoCdv1DXE6wUEOwlxf3v8nDcbb
         M8S7690MJAMScFNAmmhHtmbNb46FoAjzXcEbS6mWHkDn+r6J823VwBtlx4wlIJ/QJ4fU
         lOmXK/9A+Q/p6oTWB9amjHhoRgrqHJJxEgOlRqdODAvJhKU5VrhChs49kNq+ifY7uI68
         5fEyhER4UbzlsEXgilPeSpHRA/RiDV3d9DcA6vwy/y2M0tOyRPXHoeReQZhvdNui+MW3
         6OcP8a3livBABvBqN/dfMX7cNGJ7QBcMoy3nImcc4F96nkYE1+3J+1rkIGHhvNvb1QV0
         20+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNOx45kFSG/Yc9D3NQVx4HiI/G/jW8KW7kdSijKdY50=;
        b=tQA0qh+Rbh2DvYxRQPIyLeMLwfeAfmS678/gXsFC5HsXuTwX6IGeF4VKIa/UqN6wKn
         I1VWFyw17gsplsrXU0PzrPuXc4LIJ/KjXAWmI2cpeY41a0cqwfkh9NYay6eDkWODWRM6
         3G/fnTx2fXutH1sB25+5VIAKuGWDliNoAOzBSTuVFENPwXmIoiThrHKqYFkO1MsuGzCf
         5pcsl771ja9XCcquPdGD1HrykcmZUHiyOssnCau5tFVZdWNLUfy0x9nHAES4AXnNpA65
         PZ2wVhmaXWKmIyiq000/c2IQLLVfMXzc+x6YQnfeK8rs0A8dwXLLM0e5JQKLzEzrzxM/
         l0xQ==
X-Gm-Message-State: APjAAAUDSO7sPxvwljCA3P8hsw1zzVjpVVg6Jtagq8X/xd8LrsFYkHQE
        Gq4NhfReSZL53vb8XM1DfWlxcfwE1mQ=
X-Google-Smtp-Source: APXvYqwEpErj+2U/OoJfqGOB2tT/tidvt52SvFAphs/SqZTqCnQIzDPyLz6+/84OKTLRvERkXF3Agw==
X-Received: by 2002:aed:3e3d:: with SMTP id l58mr46894640qtf.382.1560802410359;
        Mon, 17 Jun 2019 13:13:30 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:29 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 07/13] drm/msm/dsi: Split mode_flags out of msm_dsi_host_get_panel()
Date:   Mon, 17 Jun 2019 16:12:52 -0400
Message-Id: <20190617201301.133275-4-sean@poorly.run>
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

We use the flags in more places than just get_panel, so split them out
into a separate function.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 15 ++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  7 ++++---
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9c6b31c2d79f..8bdc48ca0b67 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -169,8 +169,8 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
-struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host,
-					unsigned long *panel_flags);
+struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
+unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 610183db1daf..daa08a033b59 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2442,17 +2442,14 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 	return 0;
 }
 
-struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host,
-				unsigned long *panel_flags)
+struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
 {
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct drm_panel *panel;
-
-	panel = of_drm_find_panel(msm_host->device_node);
-	if (panel_flags)
-			*panel_flags = msm_host->mode_flags;
+	return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
+}
 
-	return panel;
+unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
+{
+	return to_msm_dsi_host(host)->mode_flags;
 }
 
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 979a8e929341..56b8091b75e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -244,8 +244,9 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 
 	DBG("id=%d", id);
 	if (!msm_dsi->panel) {
-		msm_dsi->panel = msm_dsi_host_get_panel(msm_dsi->host,
-						&msm_dsi->device_flags);
+		msm_dsi->panel = msm_dsi_host_get_panel(msm_dsi->host);
+		msm_dsi->device_flags = msm_dsi_host_get_mode_flags(
+						msm_dsi->host);
 
 		/* There is only 1 panel in the global panel list
 		 * for dual DSI mode. Therefore slave dsi should get
@@ -255,7 +256,7 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 		if (!msm_dsi->panel && IS_DUAL_DSI() &&
 			!IS_MASTER_DSI_LINK(id) && other_dsi)
 			msm_dsi->panel = msm_dsi_host_get_panel(
-					other_dsi->host, NULL);
+						other_dsi->host);
 
 
 		if (msm_dsi->panel && kms->funcs->set_encoder_mode) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

