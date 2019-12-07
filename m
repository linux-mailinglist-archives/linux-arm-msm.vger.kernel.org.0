Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB44115E95
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfLGUgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:15 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:32931 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGUgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:15 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so4185769pjb.0;
        Sat, 07 Dec 2019 12:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPGabNCq4wvn/E6P0guB04MXnY7RQzJiTE6DO4F+/5c=;
        b=fejbPTGExleKnqhKzbTJe2QRYYJ83L/AsFX3Orxh9feE9NIPyYEMNxKFqkGDyMQ6rF
         FQyuovSyMWmvs5v8uI/3n6B8gT2FfXog5EEwnuGRcXfFF3VgFC/y3+TJGx6OliZQNop7
         7RAXHmpNEiHg/m+Ma7H5ShJYS5Ylv/fe1oP6AgocW9BFyh3cMzHolHB7tJw9wAIaKUQ6
         noB5rFM8gDPsi9qrnkgW9kWd/+5WjBumhgyIVxw5HqzWHuvW5wvWnnIvZWM5TX+RId5m
         Kc2kn5vZLQW5z9rpfRdzfle2qQaUw9U/KQ8ORcog3GiP0gd3937HnI0FgaXikkWiBjGW
         PxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPGabNCq4wvn/E6P0guB04MXnY7RQzJiTE6DO4F+/5c=;
        b=QyJiYQFZUin/6nj1I5wGWnoKJAD/lyX0c70nl3lvIvt+apxUeRwupcKwLQatmpddkc
         lh2zwQyCA4rh9XDgjY6+7Ghkm3ztX8Ho+GL6YWWIw9aPlR+bqYxb/uKNhW6XPOZEqQQE
         7Cfc7SVD5TxOjc7ngw0JuMUV3bPBGU24T7MhdCWig2GvBgsiZLda4micozZ5tBgQXRUE
         WkqtXEnfitLPL65T8xHBruLsTOcQtAMYdJN5k/3Z+B3mJ+PX6goBb6T/TeTYrmoA3JBB
         kLE1LHXPmaVV5kds6EBtqJ44/NkOhsTTjXO8WRsIxyDIRkI2CxPIlGyChuZ6HgJDzjaV
         OhFg==
X-Gm-Message-State: APjAAAUtQFTR/vSJ+zv1e/SEzx6tkO1u/Z7msSUYX48zzmLhR4Jjsg+R
        g+a82jIMXzBBSwXFKCeLkGc=
X-Google-Smtp-Source: APXvYqzDfayEIq2IU2ZF76xRpq1YVP/uNxKHNPyI6TREpRcqY3KTtpmPIdU+GsItMQeh+jnuG7UijA==
X-Received: by 2002:a17:90b:3cc:: with SMTP id go12mr23177882pjb.89.1575750974098;
        Sat, 07 Dec 2019 12:36:14 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 133sm20887100pfy.14.2019.12.07.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:13 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/of: add support to find any enabled endpoint
Date:   Sat,  7 Dec 2019 12:35:51 -0800
Message-Id: <20191207203553.286017-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

To handle the case where there are multiple panel endpoints, only one of
which is enabled/installed, add support for a wildcard endpoint value to
request finding whichever endpoint is enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 41 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 0ca58803ba46..2baf44e401b8 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -219,11 +219,44 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+static int find_enabled_endpoint(const struct device_node *node, u32 port)
+{
+	struct device_node *endpoint_node, *remote;
+	u32 endpoint = 0;
+
+	for (endpoint = 0; ; endpoint++) {
+		endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);
+		if (!endpoint_node) {
+			pr_debug("No more endpoints!\n");
+			return -ENODEV;
+		}
+
+		remote = of_graph_get_remote_port_parent(endpoint_node);
+		of_node_put(endpoint_node);
+		if (!remote) {
+			pr_debug("no valid remote node\n");
+			continue;
+		}
+
+		if (!of_device_is_available(remote)) {
+			pr_debug("not available for remote node\n");
+			of_node_put(remote);
+			continue;
+		}
+
+		pr_debug("found enabled endpoint %d for %s\n", endpoint, remote->name);
+		of_node_put(remote);
+		return endpoint;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
  * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
+ * @endpoint: endpoint in the device tree node, or -1 to find an enabled endpoint
  * @panel: pointer to hold returned drm_panel
  * @bridge: pointer to hold returned drm_bridge
  *
@@ -246,6 +279,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (panel)
 		*panel = NULL;
 
+	if (endpoint == -1) {
+		endpoint = find_enabled_endpoint(np, port);
+		if (endpoint < 0)
+			return endpoint;
+	}
+
 	remote = of_graph_get_remote_node(np, port, endpoint);
 	if (!remote)
 		return -ENODEV;
-- 
2.23.0

