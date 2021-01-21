Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD522FF8FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbhAUXeS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbhAUXeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:34:13 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A8BC061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:13 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o13so5047831lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wshZlF4l3dM7/942tJe1PTLnIy8oQxHCkv+Yoccj52Y=;
        b=nK4+stLKBtiPG93FQAlIQTeFqc44W+FLadMxRM1AguYtbsR5d9suMyKsSUdbN6L0t7
         Kcbtz1mkcrwy6NuH12mTrmSiRQzTCdntFIJFWmZrC3GvOOMk66cZQhvQlqccT/ufyMYc
         OVKo61QS7bmkh+DL0ydk/U2njoHUxc/vOiKmbct9jljywuJvTGrxunU0r4f0g8z8V6Px
         9oXNWxZyBQtamk2KnUSv2uvWjLuSFrPcLYnJWEKAXd8mO6f8Aq4WZ06qjGbEEa1ja34O
         uXnF5qAFpbGD2PsvnVex7b3V0yIKVQKtx2n9fLfMtmNTMgB8VjUHWIeZiPipb5dGMd5c
         nfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wshZlF4l3dM7/942tJe1PTLnIy8oQxHCkv+Yoccj52Y=;
        b=MfKbBEt2diIQFryEVqro/CDdQZhyMiojAj3eJXEWy0qCXYZZikYkfRQgcB5EnEP3cR
         FlH8khYRWw3WNUPeKxDtUhyFHrAGL69Lh+AHZuonBxQUDImHxRow4lB8IrY1AEJrrW+W
         xW69OI+O6PNEk9qsLjcAUfftveQje2U/XD1WdlBmi2aijD0ZRUD0GD35lmC8aywa+gwJ
         QVrDZhiwjMIdfYLh89B3WWGH8AliBZxrXhI7h2zAOQiWcoq7Ltpkc9EkrRdSgdZLZWde
         NHqiFj7GDfTdRsV5LXU7RPjX+s3xS8Lwild77XlVlDNPmVusNQOdBRaFQk5vg9KEvc3t
         y/NQ==
X-Gm-Message-State: AOAM531t+19T7zfHc4Q5JwybXaYVozNcmImfXRfXpahIviEGN6Nn91Fe
        4xSpAbHqGPQT5XqLt+GCDqw+nPcxqmeL2xv2
X-Google-Smtp-Source: ABdhPJz4rYea/E+pyD21/b6h5FgZFOC7Kv2hgLlVOIq8wTHlmlSgQNGD45OjvH7xBIHOYRGF2awqsg==
X-Received: by 2002:a05:6512:131f:: with SMTP id x31mr842004lfu.552.1611271992194;
        Thu, 21 Jan 2021 15:33:12 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
        by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:33:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 3/3] drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler
Date:   Fri, 22 Jan 2021 02:33:03 +0300
Message-Id: <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
thus delaying further lt9611uxc IRQ events processing.  It was observed
occasionally during bootups, when drm_client_modeset_probe() was waiting
for EDID ready event, which was delayed because IRQ handler was stuck
trying to deliver hotplug event.
Move hotplug notifications from IRQ handler to separate work to be able
to process IRQ events without delays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 46 +++++++++++++++++-----
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b708700e182d..fee27952ec6d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
 
 #include <sound/hdmi-codec.h>
 
@@ -36,6 +37,7 @@ struct lt9611uxc {
 	struct mutex ocm_lock;
 
 	struct wait_queue_head wq;
+	struct work_struct work;
 
 	struct device_node *dsi0_node;
 	struct device_node *dsi1_node;
@@ -52,6 +54,8 @@ struct lt9611uxc {
 
 	bool hpd_supported;
 	bool edid_read;
+	/* can be accessed from different threads, so protect this with ocm_lock */
+	bool hdmi_connected;
 	uint8_t fw_version;
 };
 
@@ -143,23 +147,41 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 	if (irq_status)
 		regmap_write(lt9611uxc->regmap, 0xb022, 0);
 
-	lt9611uxc_unlock(lt9611uxc);
-
 	if (irq_status & BIT(0)) {
 		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
 		wake_up_all(&lt9611uxc->wq);
 	}
 
 	if (irq_status & BIT(1)) {
-		if (lt9611uxc->connector.dev)
-			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-		else
-			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
+		lt9611uxc->hdmi_connected = hpd_status & BIT(1);
+		schedule_work(&lt9611uxc->work);
 	}
 
+	lt9611uxc_unlock(lt9611uxc);
+
 	return IRQ_HANDLED;
 }
 
+static void lt9611uxc_hpd_work(struct work_struct *work)
+{
+	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
+	bool connected;
+
+	if (lt9611uxc->connector.dev)
+		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	else {
+
+		mutex_lock(&lt9611uxc->ocm_lock);
+		connected = lt9611uxc->hdmi_connected;
+		mutex_unlock(&lt9611uxc->ocm_lock);
+
+		drm_bridge_hpd_notify(&lt9611uxc->bridge,
+				      connected ?
+				      connector_status_connected :
+				      connector_status_disconnected);
+	}
+}
+
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
 {
 	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
@@ -447,18 +469,21 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	unsigned int reg_val = 0;
 	int ret;
-	int connected = 1;
+	bool connected = true;
+
+	lt9611uxc_lock(lt9611uxc);
 
 	if (lt9611uxc->hpd_supported) {
-		lt9611uxc_lock(lt9611uxc);
 		ret = regmap_read(lt9611uxc->regmap, 0xb023, &reg_val);
-		lt9611uxc_unlock(lt9611uxc);
 
 		if (ret)
 			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
 		else
 			connected  = reg_val & BIT(1);
 	}
+	lt9611uxc->hdmi_connected = connected;
+
+	lt9611uxc_unlock(lt9611uxc);
 
 	return connected ?  connector_status_connected :
 				connector_status_disconnected;
@@ -931,6 +956,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	lt9611uxc->fw_version = ret;
 
 	init_waitqueue_head(&lt9611uxc->wq);
+	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					lt9611uxc_irq_thread_handler,
 					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
@@ -967,6 +994,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
+	flush_scheduled_work();
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
-- 
2.29.2

