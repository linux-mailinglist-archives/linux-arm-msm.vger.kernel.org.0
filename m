Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDA0421C8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 04:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJECZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 22:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhJECY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 22:24:59 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AD7C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 19:23:10 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 24so24257534oix.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 19:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZD53yNMkUcIS01qS154onKXzIL/7b69q2M6uMmvAQkA=;
        b=x9C1c/f1FtKmThspqGNvBb6HREv06FT+WE8tjB1GFzMdK/rM6MSthINq/+5N279tLW
         D8ZuCsCDziGf7rMmt8xUZuo9b/9M3/2XYdAfbI7LpvmZPY5fvCcdAgvM+5IeIH19iEVD
         XK0Q2pGHa/5nwewwuCxQ4LW5nFypOawxAM3X9Vq/rOWSGT3yj6rRA+g3PqncZZ26oD7u
         scB4Oswm6WeiKL/Sh+f9/Qzndre8Mv9Og6PcMgNnUKzpZeqcsnyYxqcYvVCsKK8ZgKGO
         jopnmLdvYksvuExsnHaUDNkmE6C6OGaIgOj3fpsqiTRdKiYOD54cGac6yrJQPxASEjVI
         p2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZD53yNMkUcIS01qS154onKXzIL/7b69q2M6uMmvAQkA=;
        b=KOHvwgaaGLGeg8kADpMU3Yl6VJ8US7JmT3Gm7KOodXtwsSEQMaeWKdJ6/TCJCK5c2q
         Cv8ZCMxRN+hEskDx8jkRQ0gXbn4Q2JdMsuENB7rV6NGzNKg1VopXtKkNk/n8gjwWcipt
         fwNhfpXReVRBqMZR+5wknEXhy5nSZ+TXDL2JFYdMnN61JAVdaW6snJJU3WAiClNJVaRH
         xz64aFaICUnsBCnWvt5i2SVNYT9rIRvyqhOrCJKLVQZXcsIOty8pq3pIy5YFWqyyOPGQ
         pTwHFEO6lWVN3boBBkRfDPBC+xwYt8jHejgjJt1Xb9RqhdoTH0Sd2gNj/WHYovCuo+mr
         3axg==
X-Gm-Message-State: AOAM531JDR/1LG9S9F//sH5lQ+RNbt9oKdy5pTFEWFcpe+2ZD3Qpbc6i
        BDFCDqAmAOp21zgH4DL/6mLvh6ObrWtnCw==
X-Google-Smtp-Source: ABdhPJzcvoRfuFqJL//8/g70TI12ylSA9Yfkhp0zPB5/pSjhAAUz5HLOzjZWwoL8CIpy0Oz1Gk1Ldg==
X-Received: by 2002:a54:4887:: with SMTP id r7mr462772oic.124.1633400589252;
        Mon, 04 Oct 2021 19:23:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a67sm3180435otb.0.2021.10.04.19.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 19:23:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC] drm/msm/dp: Add typec_mux implementation
Date:   Mon,  4 Oct 2021 19:24:51 -0700
Message-Id: <20211005022451.2037405-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement a typec_mux in order to allow a Type-C controller to signal
the connection and attention of DisplayPort to the related USB-C port.

The remains of support for something along this lines was left in
the dp_display as the driver was upstreamed, so these are reused with
minimal modifications necessary.

When operating in this mode, HPD interrupts has still been observed in
the ISR so, in line with the downstream kernel, these are ignored.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This applies on top of https://lore.kernel.org/linux-arm-msm/20211001180058.1021913-1-bjorn.andersson@linaro.org/

 drivers/gpu/drm/msm/Kconfig         |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 54 +++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 5879f67bc88c..4e4b98c448cb 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -9,6 +9,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on TYPEC || TYPEC=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 56a79aeffed4..e863f537047a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,6 +85,8 @@ struct dp_display_private {
 	bool hpd_irq_on;
 	bool audio_supported;
 
+	bool use_hw_hpd;
+
 	struct platform_device *pdev;
 	struct dentry *root;
 
@@ -466,11 +468,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 	return 0;
 }
 
-static int dp_display_usbpd_attention_cb(struct device *dev)
+static int dp_display_usbpd_attention(struct dp_display_private *dp)
 {
 	int rc = 0;
 	u32 sink_request;
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
@@ -690,7 +691,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_attention(dp);
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
 	}
@@ -709,6 +710,13 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 	dp_audio_put(dp->audio);
 }
 
+static int dp_display_usbpd_attention_cb(struct device *dev)
+{
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+
+	return dp_irq_hpd_handle(dp, 0);
+}
+
 static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
@@ -731,6 +739,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
+	dp->use_hw_hpd = !of_property_read_bool(dev->of_node, "mode-switch");
+
 	dp->parser = dp_parser_get(dp->pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
@@ -1135,27 +1145,29 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+	if (dp->use_hw_hpd) {
+		hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
 
-	DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
-	if (hpd_isr_status & 0x0F) {
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
+		if (hpd_isr_status & 0x0F) {
+			/* hpd related interrupts */
+			if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+				dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* stop sentinel connect pending checking */
-			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
-			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
-		}
+			if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
+				/* stop sentinel connect pending checking */
+				dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
+				dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
-		}
+			if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+				dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+				dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			}
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+				dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		}
 	}
 
 	/* DP controller isr */
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index e1c90fa47411..2a7ed9b8354e 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -7,6 +7,9 @@
 
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 
 #include "dp_hpd.h"
 
@@ -22,6 +25,8 @@ struct dp_hpd_private {
 	struct device *dev;
 	struct dp_usbpd_cb *dp_cb;
 	struct dp_usbpd dp_usbpd;
+	struct typec_mux *mux;
+	bool connected;
 };
 
 int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
@@ -47,9 +52,45 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 	return rc;
 }
 
+static int dp_hpd_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	struct dp_hpd_private *dp_hpd = typec_mux_get_drvdata(mux);
+	struct dp_usbpd *usbpd = &dp_hpd->dp_usbpd;
+	struct typec_displayport_data *dp_data = state->data;
+	int pin_assign = 0;
+
+	if (dp_data) {
+		pin_assign = DP_CONF_GET_PIN_ASSIGN(dp_data->conf);
+		usbpd->hpd_high = !!(dp_data->status & DP_STATUS_HPD_STATE);
+		usbpd->hpd_irq = !!(dp_data->status & DP_STATUS_IRQ_HPD);
+		usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
+	}
+
+	if (!pin_assign) {
+		if (dp_hpd->connected) {
+			dp_hpd->connected = false;
+			dp_hpd->dp_cb->disconnect(dp_hpd->dev);
+		}
+	} else if (!dp_hpd->connected) {
+		dp_hpd->connected = true;
+		dp_hpd->dp_cb->configure(dp_hpd->dev);
+	} else {
+		dp_hpd->dp_cb->attention(dp_hpd->dev);
+	}
+
+	return 0;
+}
+
+static void dp_hpd_unregister_typec_mux(void *data)
+{
+	typec_mux_unregister(data);
+}
+
 struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 {
+	struct typec_mux_desc mux_desc = {};
 	struct dp_hpd_private *dp_hpd;
+	int rc;
 
 	if (!cb) {
 		pr_err("invalid cb data\n");
@@ -65,5 +106,18 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 
 	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
 
+	mux_desc.fwnode = dev->fwnode;
+	mux_desc.set = dp_hpd_mux_set;
+	mux_desc.drvdata = dp_hpd;
+	dp_hpd->mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(dp_hpd->mux)) {
+		dev_err(dev, "unable to register typec mux\n");
+		return ERR_CAST(dp_hpd->mux);
+	}
+
+	rc = devm_add_action_or_reset(dev, dp_hpd_unregister_typec_mux, dp_hpd->mux);
+	if (rc)
+		return ERR_PTR(rc);
+
 	return &dp_hpd->dp_usbpd;
 }
-- 
2.29.2

