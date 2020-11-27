Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF82C619A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgK0JXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgK0JXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:23:22 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1F4C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:23:22 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y7so5168381lji.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jap4CSSphbNhkQ0riEHLjy5ZHv6p/5lP6LbqE0EEZnE=;
        b=VgzMNMCYncvkjKZ7PGOsRpkTT1+54DEF/4ixFBc7ESvn9jYTi7c8ZUHHu5FiGgEoWG
         Ju+IiUrvVm93SUL/SLg+4KbI0MtS0zzN/fgX1TykpiB/DDk9Z4jjhab7BtieElUEWoOI
         md2ZVWBEr+F1b5UG/spnhu0pZdvj9ViMXlDSqqSev0usIQMKFqYbHlh/iTdZz1WW47my
         +VhfNNQgYyldQneoWQkGnPVqfR2bP7CmBPnRzQsrDNdR3Zdx+GW5xAiBgHXIe+/lN3Mu
         jNKohrj7OWNtuYNt8JU/ptDz1itNFH1ojC24cgiRSkqUyzxILtH/tCfMbp4GpzdHoQbb
         aA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jap4CSSphbNhkQ0riEHLjy5ZHv6p/5lP6LbqE0EEZnE=;
        b=kwwDF/n51eEiSgj6IHXxCO2eI/e2BEj/6hBLwxXKfQDIpULqv4/zUYhGC5GPSwM9mg
         6X5Ebs6sw28ltiAgEE7P4et5QrQOK8tHK8MpJSj8h+1Av7ODKiJIwJUfosaZ3npl7TFb
         NoEzqn1X427F1bB2mGMPT0rB3lcjD3mfXjeEFQHGoOeiTBi2wONZkY37phCPFCGWlBiw
         1xxaILRY+nTBULQioKhKmW59XiEuufID6l2qEcSjRvr4FRh6ZKquADgVySr+4fj27EIh
         9aSzBe0GTe5TXmUiNYhLO8J4BelCybI8zXD59xdfX5QNHaMJ+h/o+nVFuB+DsrhEJ+6b
         BiAQ==
X-Gm-Message-State: AOAM532zGNzvo//Nx5TCskNVsk1sxlCXLioWa9VukTUfHKq09ugdKYLt
        y9yGhKIj2LV3n1vNw0lUuxrLew==
X-Google-Smtp-Source: ABdhPJxuyB4IHPUPxJcrPeo6dQYafbut5vK33LBKEmQw43u7jbE7CeVq373AT576hexUZjM0dJT27A==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr2999342ljc.224.1606469000477;
        Fri, 27 Nov 2020 01:23:20 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
        by smtp.gmail.com with ESMTPSA id a6sm615442lfi.107.2020.11.27.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:23:19 -0800 (PST)
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
Subject: [PATCH 2/2] drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler
Date:   Fri, 27 Nov 2020 12:23:16 +0300
Message-Id: <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
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
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b708700e182d..88630bc2921f 100644
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
@@ -52,6 +54,7 @@ struct lt9611uxc {
 
 	bool hpd_supported;
 	bool edid_read;
+	bool hdmi_connected;
 	uint8_t fw_version;
 };
 
@@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 	}
 
 	if (irq_status & BIT(1)) {
-		if (lt9611uxc->connector.dev)
-			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-		else
-			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
+		lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));
+		schedule_work(&lt9611uxc->work);
 	}
 
 	return IRQ_HANDLED;
 }
 
+void lt9611uxc_hpd_work(struct work_struct *work)
+{
+	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
+
+	if (lt9611uxc->connector.dev)
+		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	else
+		drm_bridge_hpd_notify(&lt9611uxc->bridge,
+				      lt9611uxc->hdmi_connected ?
+				      connector_status_connected :
+				      connector_status_disconnected);
+}
+
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
 {
 	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
@@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	unsigned int reg_val = 0;
 	int ret;
-	int connected = 1;
+	bool connected = true;
 
 	if (lt9611uxc->hpd_supported) {
 		lt9611uxc_lock(lt9611uxc);
@@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 		if (ret)
 			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
 		else
-			connected  = reg_val & BIT(1);
+			connected  = !!(reg_val & BIT(1));
 	}
+	lt9611uxc->hdmi_connected = connected;
 
 	return connected ?  connector_status_connected :
 				connector_status_disconnected;
@@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	lt9611uxc->fw_version = ret;
 
 	init_waitqueue_head(&lt9611uxc->wq);
+	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					lt9611uxc_irq_thread_handler,
 					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
@@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
+	flush_scheduled_work();
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
-- 
2.29.2

