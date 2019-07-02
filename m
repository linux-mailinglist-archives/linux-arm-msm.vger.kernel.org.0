Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4BCE5D340
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 17:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfGBPoj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 11:44:39 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37159 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGBPoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 11:44:39 -0400
Received: by mail-qk1-f195.google.com with SMTP id d15so14461675qkl.4;
        Tue, 02 Jul 2019 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZJiwvjj9fDU7DxrMr8mtf6HfgbC93nAUMw1oRC2Lt8=;
        b=LYevnwo9WIJp9bSgzwfX1XVlrHKir2ZZbBVAhgC8ARt7UfjEV6pcO+SvaWmSCTHbH3
         KvIEGJCBFdsSasKCW3x5UxJIsdoIgNVHXLO1PqJH+KGPq2bqPiWht+fUtFs7gQkvFH+t
         z5DfYAy5Ma2FH8PjBSw5xJDghjfQQij+Yt7uOhCGl9UTjnL2yazo269ojRjYer/lpSgo
         RUdg5FlInIPuWgVTtvFjiD7DxwVFweVH4ASaa1ILfT2tbyQY23cM0/BdH3MOzFLdY4Mc
         SlM9DZcwMFhPvHAALkb7CTE4F1Zh8Oj6e6pTJF3bBV0szrCGA43l5Gpi7moK1YzH0EIa
         m1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZJiwvjj9fDU7DxrMr8mtf6HfgbC93nAUMw1oRC2Lt8=;
        b=hjYTSvhH3pOpLxYBbpSbBT/2cu9hcp7yYFCMHhinKCg7h4Ih5uw8tDOZrbqd87jMpc
         rjKsVG6L0gPY/2303kVg19IEt/V0TeUyh15W4G5BiN5+/JkLTxqZ9MG3WWcyJFcG4oLL
         VTzOndGy7KZ40eeaJBQY982CSLc1+Eol3OpWlR36zQGB7N5tYyAd4n3So1gWY+DJL91w
         s/AW1eUh2DpcvpaZKNOcCWCg3W54D3mZDlfTiBFlfLv81PdrrsU17M7kzFLeNMwQPJwT
         YhqWuM0Wiroz5ifHLixrcMYetiWz+JIGiPMfgnB6iWOE4izCIPKi/WH6LqLFHHudu4hS
         btww==
X-Gm-Message-State: APjAAAXiE1qlnyZU9QHy0cbjPH3CSSd9AMTLFkvaefqMWsfWdFEeWZzY
        /YS59/bI8rDnwhOlH/tF7L8=
X-Google-Smtp-Source: APXvYqzAZEkKpxeLcmDK75ZZ0trIM1JgZgt6dDfwCEhn4ru6eHZ/guN/4ysKfZB6YaWdhI5TMDfnMw==
X-Received: by 2002:a05:620a:10b2:: with SMTP id h18mr25786034qkk.14.1562082277651;
        Tue, 02 Jul 2019 08:44:37 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id z21sm5836582qto.48.2019.07.02.08.44.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 08:44:37 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
Date:   Tue,  2 Jul 2019 08:44:17 -0700
Message-Id: <20190702154419.20812-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a debugfs file to show status registers.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f1a2493b86d9..a6f27648c015 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
@@ -109,6 +110,7 @@ struct ti_sn_bridge {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
+	struct dentry			*debugfs;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -178,6 +180,42 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
 	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
 };
 
+static int status_show(struct seq_file *s, void *data)
+{
+	struct ti_sn_bridge *pdata = s->private;
+	unsigned int reg, val;
+
+	seq_puts(s, "STATUS REGISTERS:\n");
+
+	pm_runtime_get_sync(pdata->dev);
+
+	/* IRQ Status Registers, see Table 31 in datasheet */
+	for (reg = 0xf0; reg <= 0xf8; reg++) {
+		regmap_read(pdata->regmap, reg, &val);
+		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
+	}
+
+	pm_runtime_put(pdata->dev);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(status);
+
+static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
+{
+	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
+
+	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
+			&status_fops);
+}
+
+static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
+{
+	debugfs_remove_recursive(pdata->debugfs);
+	pdata->debugfs = NULL;
+}
+
 /* Connector funcs */
 static struct ti_sn_bridge *
 connector_to_ti_sn_bridge(struct drm_connector *connector)
@@ -869,6 +907,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
+	ti_sn_debugfs_init(pdata);
+
 	return 0;
 }
 
@@ -879,6 +919,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
+	ti_sn_debugfs_remove(pdata);
+
 	of_node_put(pdata->host_node);
 
 	pm_runtime_disable(pdata->dev);
-- 
2.20.1

