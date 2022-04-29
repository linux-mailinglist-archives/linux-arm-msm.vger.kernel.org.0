Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4575154FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380452AbiD2UBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 16:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380451AbiD2UA6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 16:00:58 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF12A5E8A
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c15so11722144ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G7PbuXYKXlI64VMOZ2GSnxEyqdNqbhMYiveQLAlQZfs=;
        b=FKL6/d3WvwaWlVhUpHO20k5LvcxnN1F/KCMjndtRu7VWwPPRT13rEgIdGYUkrRbgZT
         pYNQtAsGBEQctm+loU1bkA045oMN0oEQaXDoBwFQaTt47f1iMT8DoQvZ+Dw1dUPdfeDt
         ir/cY8QQFEwU6T+o5CVrpJh/xnetwe4Sdt8U6DonJcHE9oAbCuay39Zzvy/1p5FkefJr
         Y+0YIPktabgil5WnafdgperzThDBWke6v+rG2oP8ypTRExn0q7LzLJIc/rn+k2cXV+Ls
         Tccotfup2kkp8XuwFVLP3KTDSfvHV4+r+MlRNLj6vqnCO8hPTpQtGJvwBxc6/v3EN9XL
         hOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G7PbuXYKXlI64VMOZ2GSnxEyqdNqbhMYiveQLAlQZfs=;
        b=bhWJq/Toz+ITbgu4ZOolkbTlNgy/ZA1HDnOk8KQGM1JcdqspvA4EQqm1cFtx+gkqAY
         Pft+zqDLE2/byPgyWhYdkovZYGJQrthUfPmAnNNAGmg/akTjdjbIUOCawgqiFw1y9vow
         IJ42r27tpxJsHcThdyEDPZMtvGvza1NbcRD3Hd9Ob2gdS2VwVtschiKsz2V4x4DOGrir
         E5fb42RtB7+eaf+1VWDQrG/RXp3nWMvW1B5vKDyhCRuk9yGiS36HYCH50/QvQShlbsCX
         X+WZYvKvsSUaPM4z/6RYLahj1AEMDhgq/C1t8QUK+v8lNhEoSx0HR0X8f+EW/WsbbCLd
         Kmsw==
X-Gm-Message-State: AOAM530BoHDePRFOmUo8kKSan6tBTrgT7tReI5LpPK33n0Kr9AKygtRF
        Xkny65uruCENX+9bSZy3hY5fYscHdpix2A==
X-Google-Smtp-Source: ABdhPJwOFLNSXlfXXcWjTwVAPb1i8v2YxfySvMDChH5s2kqre1hVwU8rr7XDvPGNGCpBwh+uLiprHg==
X-Received: by 2002:a2e:988a:0:b0:24f:364d:6d09 with SMTP id b10-20020a2e988a000000b0024f364d6d09mr497376ljj.49.1651262256983;
        Fri, 29 Apr 2022 12:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:57:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 4/5] drm/msm/dp: remove most of usbpd-related remains
Date:   Fri, 29 Apr 2022 22:57:30 +0300
Message-Id: <20220429195731.3716446-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove most of remains of downstream usbpd code. Mainline kernel uses
different approach for managing Type-C / USB-PD, so this remains unused.
Do not touch usbpd callbacks for now, since they look usefull enough as
an example of how to handle connect/disconnect (to be rewritten into .

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 42 +++-------------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 67 -------------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h     | 78 -----------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
 10 files changed, 13 insertions(+), 192 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 66395ee0862a..c417443168f6 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -123,7 +123,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
-	dp/dp_hpd.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_parser.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 0745fde01b45..52648b56f54b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -14,7 +14,6 @@
 #include "dp_catalog.h"
 
 struct dp_ctrl {
-	bool orientation;
 	atomic_t aborted;
 	u32 pixel_rate;
 	bool wide_bus_en;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 5e35033ba3e4..3bba901afe33 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,7 +21,6 @@
 struct dp_debug_private {
 	struct dentry *root;
 
-	struct dp_usbpd *usbpd;
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector *connector;
@@ -232,14 +231,14 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector *connector, struct drm_minor *minor)
 {
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
 	int rc;
 
-	if (!dev || !panel || !usbpd || !link) {
+	if (!dev || !panel || !link) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
@@ -252,7 +251,6 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	}
 
 	debug->dp_debug.debug_en = false;
-	debug->usbpd = usbpd;
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 8c0d0b5178fd..be350cb393ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -42,7 +42,7 @@ struct dp_debug {
  * for debugfs input to be communicated with existing modules
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector *connector,
 		struct drm_minor *minor);
 
@@ -59,7 +59,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector *connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c38832304353..454c21e702ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,7 +14,6 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
-#include "dp_hpd.h"
 #include "dp_parser.h"
 #include "dp_power.h"
 #include "dp_catalog.h"
@@ -88,7 +87,6 @@ struct dp_display_private {
 	struct platform_device *pdev;
 	struct dentry *root;
 
-	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
 	struct dp_power   *power;
 	struct dp_catalog *catalog;
@@ -98,7 +96,6 @@ struct dp_display_private {
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
 
-	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
@@ -442,7 +439,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_init(dp->power, false);
+	dp_power_init(dp->power);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -460,16 +457,14 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 	dp->core_initialized = false;
 }
 
-static int dp_display_usbpd_configure_cb(struct device *dev)
+static int dp_display_usbpd_configure(struct dp_display_private *dp)
 {
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
-
 	dp_display_host_phy_init(dp);
 
 	return dp_display_process_hpd_high(dp);
 }
 
-static int dp_display_usbpd_disconnect_cb(struct device *dev)
+static int dp_display_usbpd_disconnect(struct dp_display_private *dp)
 {
 	return 0;
 }
@@ -535,11 +530,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
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
@@ -558,13 +552,9 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 
 static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 	int ret;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
@@ -588,7 +578,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_configure(dp);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
@@ -626,12 +616,8 @@ static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
@@ -719,7 +705,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	dp_display_usbpd_attention(dp);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -741,24 +727,10 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->pdev->dev;
-	struct dp_usbpd_cb *cb = &dp->usbpd_cb;
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
 
-	/* Callback APIs used for cable status change event */
-	cb->configure  = dp_display_usbpd_configure_cb;
-	cb->disconnect = dp_display_usbpd_disconnect_cb;
-	cb->attention  = dp_display_usbpd_attention_cb;
-
-	dp->usbpd = dp_hpd_get(dev, cb);
-	if (IS_ERR(dp->usbpd)) {
-		rc = PTR_ERR(dp->usbpd);
-		DRM_ERROR("failed to initialize hpd, rc = %d\n", rc);
-		dp->usbpd = NULL;
-		goto error;
-	}
-
 	dp->parser = dp_parser_get(dp->pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
@@ -1527,7 +1499,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
-	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
+	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, dp->dp_display.connector,
 					minor);
 	if (IS_ERR(dp->debug)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
deleted file mode 100644
index db98a1d431eb..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
-
-#include <linux/slab.h>
-#include <linux/device.h>
-
-#include "dp_hpd.h"
-
-/* DP specific VDM commands */
-#define DP_USBPD_VDM_STATUS	0x10
-#define DP_USBPD_VDM_CONFIGURE	0x11
-
-/* USBPD-TypeC specific Macros */
-#define VDM_VERSION		0x0
-#define USB_C_DP_SID		0xFF01
-
-struct dp_hpd_private {
-	struct device *dev;
-	struct dp_usbpd_cb *dp_cb;
-	struct dp_usbpd dp_usbpd;
-};
-
-int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
-{
-	int rc = 0;
-	struct dp_hpd_private *hpd_priv;
-
-	hpd_priv = container_of(dp_usbpd, struct dp_hpd_private,
-					dp_usbpd);
-
-	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
-				|| !hpd_priv->dp_cb->disconnect) {
-		pr_err("hpd dp_cb not initialized\n");
-		return -EINVAL;
-	}
-	if (hpd)
-		hpd_priv->dp_cb->configure(hpd_priv->dev);
-	else
-		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
-
-	return rc;
-}
-
-struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
-{
-	struct dp_hpd_private *dp_hpd;
-
-	if (!cb) {
-		pr_err("invalid cb data\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	dp_hpd = devm_kzalloc(dev, sizeof(*dp_hpd), GFP_KERNEL);
-	if (!dp_hpd)
-		return ERR_PTR(-ENOMEM);
-
-	dp_hpd->dev = dev;
-	dp_hpd->dp_cb = cb;
-
-	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
-
-	return &dp_hpd->dp_usbpd;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
deleted file mode 100644
index 8feec5aa5027..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ /dev/null
@@ -1,78 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_HPD_H_
-#define _DP_HPD_H_
-
-//#include <linux/usb/usbpd.h>
-
-#include <linux/types.h>
-#include <linux/device.h>
-
-enum plug_orientation {
-	ORIENTATION_NONE,
-	ORIENTATION_CC1,
-	ORIENTATION_CC2,
-};
-
-/**
- * struct dp_usbpd - DisplayPort status
- *
- * @orientation: plug orientation configuration
- * @low_pow_st: low power state
- * @adaptor_dp_en: adaptor functionality enabled
- * @multi_func: multi-function preferred
- * @usb_config_req: request to switch to usb
- * @exit_dp_mode: request exit from displayport mode
- * @hpd_irq: Change in the status since last message
- * @alt_mode_cfg_done: bool to specify alt mode status
- * @debug_en: bool to specify debug mode
- * @connect: simulate disconnect or connect for debug mode
- */
-struct dp_usbpd {
-	enum plug_orientation orientation;
-	bool low_pow_st;
-	bool adaptor_dp_en;
-	bool multi_func;
-	bool usb_config_req;
-	bool exit_dp_mode;
-	bool hpd_irq;
-	bool alt_mode_cfg_done;
-	bool debug_en;
-
-	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
-};
-
-/**
- * struct dp_usbpd_cb - callback functions provided by the client
- *
- * @configure: called by usbpd module when PD communication has
- * been completed and the usb peripheral has been configured on
- * dp mode.
- * @disconnect: notify the cable disconnect issued by usb.
- * @attention: notify any attention message issued by usb.
- */
-struct dp_usbpd_cb {
-	int (*configure)(struct device *dev);
-	int (*disconnect)(struct device *dev);
-	int (*attention)(struct device *dev);
-};
-
-/**
- * dp_hpd_get() - setup hpd module
- *
- * @dev: device instance of the caller
- * @cb: struct containing callback function pointers.
- *
- * This function allows the client to initialize the usbpd
- * module. The module will communicate with HPD module.
- */
-struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
-
-int dp_hpd_register(struct dp_usbpd *dp_usbpd);
-void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
-int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
-
-#endif /* _DP_HPD_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d861197ac1c8..7571c42d8f4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -10,7 +10,6 @@
 
 #include "dp_aux.h"
 #include "dp_link.h"
-#include "dp_hpd.h"
 
 struct edid;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index d9e011775ad8..faa3bfbccc9e 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -352,7 +352,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 }
 
-int dp_power_init(struct dp_power *dp_power, bool flip)
+int dp_power_init(struct dp_power *dp_power)
 {
 	int rc = 0;
 	struct dp_power_private *power = NULL;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index e3f959ffae12..a3dec200785e 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -26,13 +26,12 @@ struct dp_power {
  * dp_power_init() - enable power supplies for display controller
  *
  * @power: instance of power module
- * @flip: bool for flipping gpio direction
  * return: 0 if success or error if failure.
  *
  * This API will turn on the regulators and configures gpio's
  * aux/hpd.
  */
-int dp_power_init(struct dp_power *power, bool flip);
+int dp_power_init(struct dp_power *power);
 
 /**
  * dp_power_deinit() - turn off regulators and gpios.
-- 
2.35.1

