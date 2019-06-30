Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD3C5AFDE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 15:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfF3NQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 09:16:08 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41206 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3NQI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 09:16:08 -0400
Received: by mail-qt1-f195.google.com with SMTP id d17so11720687qtj.8;
        Sun, 30 Jun 2019 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tU2QjlplILF/dSwxFDxnwqJmz4lOyuJ9m7+FabAB1TM=;
        b=umgpvucg5VZShrp5PSpC9dvsc75qP858M/zMR+GQN3iy05FW3gMeOsPQKRagKs74JB
         S71vE+eQvwM15M5hNZPq8iw7IkZlmTeUs3GDuZO0lHh4+TB0X4PhQ0Zg5a9NNPZYlYDl
         a5iubN/yE1fnk39HOgrk5GGpv/8RDlVu5IfRt9EGd8JIL0NInLSpOspXY3ujxn52suu5
         7BamjYtEf9OkpVw9DWGkWzHfAEyQDwecwKkWSlXLhNmVzG0gEuC8N+kOA/4e4y2qX5B1
         7jKGSBDRJ0xkbhnFSYI7ewsyQgGKpoK6m3LAgWu0E1OgMvSKtPOeFYNsBVjff5m7Jtpb
         fQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tU2QjlplILF/dSwxFDxnwqJmz4lOyuJ9m7+FabAB1TM=;
        b=K3xMFpWHy8ML1qdJ3H9EMMvb+4EUM2SMJTGhL05Eo0nMjJ6mDLmlNEI7SZmktUcq/S
         zQciDSUDMZie6oiMt2d+vIUSVbG1qwba8Ip2p8vyQbyTEfUIF47B1OVwjA+CC+CfvTXA
         k8HzPUx9IW9+oPJE4pVkYq0+Vf36bGzEAxgdA9l2bxrIOe9xTBbeMBPLUKR57ipjhiUV
         NVWl0b+B/Hs7vRjp43F1XBcYE3OUQsQCJ1ZUaafU1aiIIFqmQPqGcioh3wRgTPECW6jZ
         b+GkLkmsZmzcQf0idT20j2Tqe2m5PyuOjlPLZf4/7WBHl6qXSmFVzn9UQ9QSytknXkJY
         9Egg==
X-Gm-Message-State: APjAAAXTv5MYvbgI2PQ6GJbUK885H0nl21vZNZG8Qw5wIt5kMnEL38jG
        V3iqmjLO6xpS16WFS1kJeXM+4HcgG1g=
X-Google-Smtp-Source: APXvYqwO7sW3wpg5LURjILC5Z3weemfzsZ/DWUaABvf+rrgN/vo/Lh9n08WNd6xIZ2wcJwkEuNaDOg==
X-Received: by 2002:ac8:18b2:: with SMTP id s47mr15559015qtj.75.1561900566858;
        Sun, 30 Jun 2019 06:16:06 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id l6sm3643043qkf.83.2019.06.30.06.16.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 06:16:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sibi Sankar <sibis@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/dsi: make sure we have panel or bridge earlier
Date:   Sun, 30 Jun 2019 06:14:43 -0700
Message-Id: <20190630131445.25712-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630131445.25712-1-robdclark@gmail.com>
References: <20190630131445.25712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If we are going to -EPROBE_DEFER due to panel/bridge not probed yet, we
want to do it before we start touching hardware.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 30 +++++++++++++--------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  9 +++-----
 3 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 53bb124e8259..e15e7534ccd9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -171,7 +171,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
-int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
+int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 			struct msm_dsi_pll *src_pll);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1ae2f5522979..8e5b0ba9431e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1824,6 +1824,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
+	/*
+	 * Make sure we have panel or bridge early, before we start
+	 * touching the hw.  If bootloader enabled the display, we
+	 * want to be sure to keep it running until the bridge/panel
+	 * is probed and we are all ready to go.  Otherwise we'll
+	 * kill the display and then -EPROBE_DEFER
+	 */
+	if (IS_ERR(of_drm_find_panel(msm_host->device_node)) &&
+			!of_drm_find_bridge(msm_host->device_node)) {
+		pr_err("%s: no panel or bridge yet\n", __func__);
+		return -EPROBE_DEFER;
+	}
+
+
 	msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
@@ -1941,7 +1955,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	return 0;
 }
 
-int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
+int msm_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	int ret;
@@ -1955,20 +1969,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
 			return ret;
 
 		msm_host->registered = true;
-
-		/* If the panel driver has not been probed after host register,
-		 * we should defer the host's probe.
-		 * It makes sure panel is connected when fbcon detects
-		 * connector status and gets the proper display mode to
-		 * create framebuffer.
-		 * Don't try to defer if there is nothing connected to the dsi
-		 * output
-		 */
-		if (check_defer && msm_host->device_node) {
-			if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
-				if (!of_drm_find_bridge(msm_host->device_node))
-					return -EPROBE_DEFER;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index ff39ce6150ad..cd3450dc3481 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -82,7 +82,7 @@ static int dsi_mgr_setup_components(int id)
 	int ret;
 
 	if (!IS_DUAL_DSI()) {
-		ret = msm_dsi_host_register(msm_dsi->host, true);
+		ret = msm_dsi_host_register(msm_dsi->host);
 		if (ret)
 			return ret;
 
@@ -101,14 +101,11 @@ static int dsi_mgr_setup_components(int id)
 		/* Register slave host first, so that slave DSI device
 		 * has a chance to probe, and do not block the master
 		 * DSI device's probe.
-		 * Also, do not check defer for the slave host,
-		 * because only master DSI device adds the panel to global
-		 * panel list. The panel's device is the master DSI device.
 		 */
-		ret = msm_dsi_host_register(slave_link_dsi->host, false);
+		ret = msm_dsi_host_register(slave_link_dsi->host);
 		if (ret)
 			return ret;
-		ret = msm_dsi_host_register(master_link_dsi->host, true);
+		ret = msm_dsi_host_register(master_link_dsi->host);
 		if (ret)
 			return ret;
 
-- 
2.20.1

