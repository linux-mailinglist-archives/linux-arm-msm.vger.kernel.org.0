Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537D01FFE16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 00:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbgFRW1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 18:27:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10506 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbgFRW1t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 18:27:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592519268; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=roXsRUrgLrTLCItljCLLC5qAULtMMnn5xkIYb7xgpU8=; b=OOh7Pxf7ayaHag+GSRdp7Fq/1SKGyC5KjnzP3HjZLO8dIFufyRyZggTBAxuqewcOg1FMC9Xd
 xDSN1U0pbGulKgEbjs0u7UbX6f802WLcj+Uku4lC1Id4Lri6jZ5zqIQjvvRPOZZI/IfM4g+y
 tL3RA/bB7ORuS6H/q5XFzMgqxvA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5eebea566bebe35debbade58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 22:27:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18C5FC4344E; Thu, 18 Jun 2020 22:27:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B93E5C43387;
        Thu, 18 Jun 2020 22:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B93E5C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     robh+dt@kernel.org, swboyd@chromium.org, sam@ravnborg.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, varar@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v7 6/6] drm/msm/dp: Add Display Port HPD feature
Date:   Thu, 18 Jun 2020 15:26:14 -0700
Message-Id: <20200618222614.14061-7-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618222614.14061-1-tanmay@codeaurora.org>
References: <20200618222614.14061-1-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure HPD registers in DP controller and
enable HPD interrupt.

Add interrupt to handle HPD connect and disconnect events.

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  18 ++++
 drivers/gpu/drm/msm/dp/dp_catalog.c     |  67 +++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.h     |   5 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c        |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c     | 110 ++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_reg.h         |  12 +++
 drivers/gpu/drm/msm/msm_drv.h           |   6 ++
 7 files changed, 183 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1295221d7341..ef17c64dd6e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -765,6 +765,23 @@ static void dpu_irq_preinstall(struct msm_kms *kms)
 	dpu_core_irq_preinstall(dpu_kms);
 }
 
+static int dpu_irq_postinstall(struct msm_kms *kms)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+
+	if (!dpu_kms || !dpu_kms->dev)
+		return -EINVAL;
+
+	priv = dpu_kms->dev->dev_private;
+	if (!priv)
+		return -EINVAL;
+
+	msm_dp_irq_postinstall(priv->dp);
+
+	return 0;
+}
+
 static void dpu_irq_uninstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -775,6 +792,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_irq_preinstall,
+	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_irq_uninstall,
 	.irq             = dpu_irq,
 	.enable_commit   = dpu_kms_enable_commit,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 84e7a57f41d0..1b197eebdc5d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -17,7 +17,6 @@
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
 
-#define REFTIMER_DEFAULT_VALUE			0x20000
 #define SCRAMBLER_RESET_COUNT_VALUE		0xFC
 
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
@@ -766,35 +765,51 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog,
 	}
 }
 
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool en)
+void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+			u32 intr_mask, bool en)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	if (en) {
-		u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
-
-		dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
-				DP_DP_HPD_PLUG_INT_ACK |
-				DP_DP_IRQ_HPD_INT_ACK |
-				DP_DP_HPD_REPLUG_INT_ACK |
-				DP_DP_HPD_UNPLUG_INT_ACK);
-		dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_IRQ_HPD_INT_MASK |
-				DP_DP_HPD_REPLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK);
-
-		/* Configure REFTIMER */
-		reftimer |= REFTIMER_DEFAULT_VALUE;
-		dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-		/* Enable HPD */
-		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
-				DP_DP_HPD_CTRL_HPD_EN);
-	} else {
-		/* Disable HPD */
-		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0x0);
-	}
+	u32 config = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+
+	config = (en ? config | intr_mask : config & ~intr_mask);
+
+	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+				config & DP_DP_HPD_INT_MASK);
+}
+
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+
+	/* enable HPD interrupts */
+	dp_catalog_hpd_config_intr(dp_catalog,
+		DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
+		| DP_DP_HPD_UNPLUG_INT_MASK, true);
+
+	/* Configure REFTIMER and enable it */
+	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
+	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+
+	/* Enable HPD */
+	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+}
+
+u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	int isr = 0;
+
+	isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+				 (isr & DP_DP_HPD_INT_MASK));
+
+	return isr;
 }
 
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 86b82d4fcb42..23d1cec7a517 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -60,7 +60,10 @@ void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+			u32 intr_mask, bool en);
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog, bool flipped,
 				u8 lane_cnt);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ef08e8bbd476..98407e1d09e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1569,7 +1569,6 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 
 	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
-	dp_catalog_ctrl_hpd_config(ctrl->catalog, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		DRM_DEBUG_DP("using phy test link parameters\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cc9b5294762d..192d2a405253 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -17,6 +17,7 @@
 #include "dp_power.h"
 #include "dp_catalog.h"
 #include "dp_aux.h"
+#include "dp_reg.h"
 #include "dp_link.h"
 #include "dp_panel.h"
 #include "dp_ctrl.h"
@@ -36,6 +37,7 @@ struct dp_display_private {
 	bool power_on;
 	bool hpd_irq_on;
 	bool audio_supported;
+	atomic_t hpd_isr_status;
 
 	struct platform_device *pdev;
 	struct dentry *root;
@@ -54,6 +56,8 @@ struct dp_display_private {
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
+
+	struct delayed_work config_hpd_work;
 };
 
 static const struct of_device_id dp_dt_match[] = {
@@ -64,6 +68,20 @@ static const struct of_device_id dp_dt_match[] = {
 static irqreturn_t dp_display_irq(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 hpd_isr_status;
+
+	if (!dp) {
+		DRM_ERROR("invalid data\n");
+		return IRQ_NONE;
+	}
+
+	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+
+	if (hpd_isr_status & DP_DP_HPD_INT_MASK) {
+		atomic_set(&dp->hpd_isr_status, hpd_isr_status);
+		ret = IRQ_WAKE_THREAD;
+	}
 
 	/* DP controller isr */
 	dp_ctrl_isr(dp->ctrl);
@@ -71,6 +89,54 @@ static irqreturn_t dp_display_irq(int irq, void *dev_id)
 	/* DP aux isr */
 	dp_aux_isr(dp->aux);
 
+	return ret;
+}
+
+static irqreturn_t dp_display_hpd_isr_work(int irq, void *data)
+{
+	struct dp_display_private *dp;
+	struct dp_usbpd *hpd;
+	u32 isr = 0;
+
+	dp = (struct dp_display_private *)data;
+	if (!dp)
+		return IRQ_NONE;
+
+	isr = atomic_read(&dp->hpd_isr_status);
+
+	/* reset to default */
+	atomic_set(&dp->hpd_isr_status, 0);
+
+	hpd = dp->usbpd;
+	if (!hpd)
+		return IRQ_NONE;
+
+	if (isr & DP_DP_HPD_PLUG_INT_MASK &&
+		isr & DP_DP_HPD_STATE_STATUS_CONNECTED) {
+		hpd->hpd_high = 1;
+		dp->usbpd_cb.configure(&dp->pdev->dev);
+	} else if (isr & DP_DP_HPD_UNPLUG_INT_MASK &&
+		(isr & DP_DP_HPD_STATE_STATUS_MASK) ==
+			 DP_DP_HPD_STATE_STATUS_DISCONNECTED) {
+
+		/* disable HPD plug interrupt until disconnect is done
+		 */
+		dp_catalog_hpd_config_intr(dp->catalog,
+			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
+			false);
+
+		hpd->hpd_high = 0;
+
+		/* We don't need separate work for disconnect as
+		 * connect/attention interrupts are disabled
+		 */
+		dp->usbpd_cb.disconnect(&dp->pdev->dev);
+
+		dp_catalog_hpd_config_intr(dp->catalog,
+			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
+			true);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -203,8 +269,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	int rc = 0;
 	struct edid *edid;
 
-	dp_aux_init(dp->aux, dp->parser->aux_cfg);
-
 	if (dp->link->psm_enabled)
 		goto notify;
 
@@ -250,7 +314,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip);
-	enable_irq(dp->irq);
+	dp_aux_init(dp->aux, dp->parser->aux_cfg);
 	dp->core_initialized = true;
 }
 
@@ -261,10 +325,6 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
-	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
-	disable_irq(dp->irq);
 	dp->core_initialized = false;
 }
 
@@ -620,7 +680,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 		return rc;
 	}
 
-	rc = devm_request_irq(&dp->pdev->dev, dp->irq, dp_display_irq,
+	rc = devm_request_threaded_irq(&dp->pdev->dev, dp->irq,
+		dp_display_irq, dp_display_hpd_isr_work,
 		IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -789,6 +850,39 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
+static void dp_display_config_hpd_work(struct work_struct *work)
+{
+	struct dp_display_private *dp;
+	struct delayed_work *dw = to_delayed_work(work);
+
+	dp = container_of(dw, struct dp_display_private, config_hpd_work);
+
+	dp_display_host_init(dp);
+	dp_catalog_ctrl_hpd_config(dp->catalog);
+
+	/* set default to 0 */
+	atomic_set(&dp->hpd_isr_status, 0);
+
+	/* Enable interrupt first time
+	 * we are leaving dp clocks on during disconnect
+	 * and never disable interrupt
+	 */
+	enable_irq(dp->irq);
+}
+
+void msm_dp_irq_postinstall(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	if (!dp_display)
+		return;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	INIT_DELAYED_WORK(&dp->config_hpd_work, dp_display_config_hpd_work);
+	queue_delayed_work(system_wq, &dp->config_hpd_work, HZ * 10);
+}
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index ad6f1760f893..6b3e297e4e04 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -54,10 +54,22 @@
 #define DP_DP_IRQ_HPD_INT_MASK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_MASK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_MASK		(0x00000008)
+#define DP_DP_HPD_INT_MASK			(DP_DP_HPD_PLUG_INT_MASK | \
+						DP_DP_IRQ_HPD_INT_MASK | \
+						DP_DP_HPD_REPLUG_INT_MASK | \
+						DP_DP_HPD_UNPLUG_INT_MASK)
+#define DP_DP_HPD_STATE_STATUS_CONNECTED	(0x40000000)
+#define DP_DP_HPD_STATE_STATUS_PENDING		(0x20000000)
+#define DP_DP_HPD_STATE_STATUS_DISCONNECTED	(0x00000000)
+#define DP_DP_HPD_STATE_STATUS_MASK		(0xE0000000)
 
 #define REG_DP_DP_HPD_REFTIMER			(0x00000018)
+#define DP_DP_HPD_REFTIMER_ENABLE		(1 << 16)
+
 #define REG_DP_DP_HPD_EVENT_TIME_0		(0x0000001C)
 #define REG_DP_DP_HPD_EVENT_TIME_1		(0x00000020)
+#define DP_DP_HPD_EVENT_TIME_0_VAL		(0x3E800FA)
+#define DP_DP_HPD_EVENT_TIME_1_VAL		(0x1F407D0)
 
 #define REG_DP_AUX_CTRL				(0x00000030)
 #define DP_AUX_CTRL_ENABLE			(0x00000001)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 5e3219be65a1..58e5fe5f35f3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -390,6 +390,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
+void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -421,6 +422,11 @@ static inline void msm_dp_display_mode_set(struct msm_dp *dp,
 				struct drm_display_mode *adjusted_mode)
 {
 }
+
+static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
+{
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

