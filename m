Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4582249110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfFQUNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:36 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35872 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:36 -0400
Received: by mail-qt1-f195.google.com with SMTP id p15so12424210qtl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eW5UYe8I4qvCNc714+7hSZS3b/NQZnllHNBPJZkv2eY=;
        b=cTj2H0fFpMLV68ZtM8KoMdCOc4uIpHZdR68OxZTYdpYvkn8ssFMPpu+rO9RxdPNA9a
         9Nqzd+cVkEe1tOuxwJTnJ87Gge3kDSG8kYngKvZfUyOY4lKUH2fUeAxjd8IDC/z0/FXa
         LcWXJaKSkrnASvMWWDkpT4S645E2cRsdNGaxXecflkaUnnqhDZfIK+qIbxx8VSeF4JBR
         Rix4NO3lIrUV//pL71dWZWyYr3MNzgNyWD2DmUu8Fqn+yT2rwysJoNudAYfUZJlxXK9B
         3AtEASA43KTp+jtX1spMSmx+HtzgOy5CKeNMhKH+1BsXHVyMni937yC6aRKMQHQsXYGH
         RajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eW5UYe8I4qvCNc714+7hSZS3b/NQZnllHNBPJZkv2eY=;
        b=rrNODSFd+7OEJzzHSqJAkyOqhVeBuMEN8lOjj48vr3pCWCorl9FAmWLDFveyIh2Wfn
         0BxLQEGZ6PaphTvlsOZWd6zvz+Fiuct5edEm5KHbjMMgh/WKGTLxYt1tH2/1kEIvr1lJ
         GoJYDgsEtThtzf5XFTY8ypy59+5HtO9pguWGw/3Icza8Tc7HrCYLb+pkXyuoZ1C+jKmW
         x6couI4Yvs6XVqC5M5GlnXzQs5YA+Z3RU7U/IIdA13X6AZ0Uc33VxFciQYY8dIWX53nB
         kkOB9nbhbzSbpbZr4+YsZGVZeG4XBzrhiq/5RFo7m4glPvD/NPsh8RvD52fTYhVC4ru1
         6VBw==
X-Gm-Message-State: APjAAAXnwpUbPuBKoFg4ZCe71pu6VPL3mvtQMYdyN7SbjfJhXqbd/L4K
        5AjYed8OsBi7HjEMzrg51ph9ZA==
X-Google-Smtp-Source: APXvYqy0nkpRBCX5jT4q6yqC4LA6QLk30UxErp74KBr3V96+SlASaTXo3caNWvDOhCc9VLbG+OJ5zw==
X-Received: by 2002:a0c:aed0:: with SMTP id n16mr23668643qvd.101.1560802415854;
        Mon, 17 Jun 2019 13:13:35 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:35 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/13] drm/msm/dsi: Pull out panel init code into function
Date:   Mon, 17 Jun 2019 16:12:54 -0400
Message-Id: <20190617201301.133275-6-sean@poorly.run>
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

Pull all of the panel init code out of detect() and put it in its own
function. This will be useful in future patches where it's moved from
detect().

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 735fff79ae67..855139195769 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -239,17 +239,14 @@ static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
 	return !(host_flags & MIPI_DSI_MODE_VIDEO);
 }
 
-static enum drm_connector_status dsi_mgr_connector_detect(
-		struct drm_connector *connector, bool force)
+static void msm_dsi_manager_panel_init(struct drm_connector *connector, u8 id)
 {
-	int id = dsi_mgr_connector_get_id(connector);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
 	struct msm_drm_private *priv = connector->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	bool cmd_mode;
 
-	DBG("id=%d", id);
 	if (!msm_dsi->panel) {
 		msm_dsi->panel = msm_dsi_host_get_panel(msm_dsi->host);
 
@@ -292,6 +289,17 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 				pr_err("mdp does not support dual DSI\n");
 		}
 	}
+}
+
+static enum drm_connector_status dsi_mgr_connector_detect(
+		struct drm_connector *connector, bool force)
+{
+	int id = dsi_mgr_connector_get_id(connector);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+
+	DBG("id=%d", id);
+	if (!msm_dsi->panel)
+		msm_dsi_manager_panel_init(connector, id);
 
 	return msm_dsi->panel ? connector_status_connected :
 		connector_status_disconnected;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

