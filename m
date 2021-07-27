Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED883D7D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhG0S13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:27:29 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58282 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhG0S10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:27:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BD52C22237;
        Tue, 27 Jul 2021 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627410445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RbBfL4mCTjt0RtM9rcPnqtOKzHPQr0ry5imZlRlAO48=;
        b=xUJvzwt1aqVfdnP7e6n9jHDh5bJCuVbKL5suy5GWaHc4O7kMRwVxWJ5G3hB/ey8/so52i6
        UbaYx7sGgxxAMTcsToqK5xpMqrUOpPZ39KM19xLG4TWSaa2S8+KbjEBl0Tfw4vtB8PkBQQ
        uor/N0XCVw05ycpCaQvOhmLCad6K8c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627410445;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RbBfL4mCTjt0RtM9rcPnqtOKzHPQr0ry5imZlRlAO48=;
        b=vXERzI5KPDUe9Sf+lTt1cRBXWjh0B8kqdRJrL6TKmnyTTZwgL26Kh8X5mwg9sWKzHTcFno
        8HNKFkfUNNHgUJBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CD4213B86;
        Tue, 27 Jul 2021 18:27:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0L35CQ1QAGGwGQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:25 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, liviu.dudau@arm.com,
        brian.starkey@arm.com, sam@ravnborg.org, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
        patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
        robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        jyri.sarha@iki.fi, tomba@kernel.org
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/14] drm/fsl-dcu: Convert to Linux IRQ interfaces
Date:   Tue, 27 Jul 2021 20:27:11 +0200
Message-Id: <20210727182721.17981-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
References: <20210727182721.17981-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it. DRM IRQ callbacks are now being called
directly or inlined.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 78 +++++++++++++----------
 1 file changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 7528e8a2d359..660fe573db96 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -51,7 +50,7 @@ static const struct regmap_config fsl_dcu_regmap_config = {
 	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
 };
 
-static void fsl_dcu_irq_uninstall(struct drm_device *dev)
+static void fsl_dcu_irq_reset(struct drm_device *dev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
@@ -59,6 +58,45 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 	regmap_write(fsl_dev->regmap, DCU_INT_MASK, ~0);
 }
 
+static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	unsigned int int_status;
+	int ret;
+
+	ret = regmap_read(fsl_dev->regmap, DCU_INT_STATUS, &int_status);
+	if (ret) {
+		dev_err(dev->dev, "read DCU_INT_STATUS failed\n");
+		return IRQ_NONE;
+	}
+
+	if (int_status & DCU_INT_STATUS_VBLANK)
+		drm_handle_vblank(dev, 0);
+
+	regmap_write(fsl_dev->regmap, DCU_INT_STATUS, int_status);
+
+	return IRQ_HANDLED;
+}
+
+static int fsl_dcu_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	fsl_dcu_irq_reset(dev);
+
+	return request_irq(irq, fsl_dcu_drm_irq, 0, dev->driver->name, dev);
+}
+
+static void fsl_dcu_irq_uninstall(struct drm_device *dev)
+{
+	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+
+	fsl_dcu_irq_reset(dev);
+	free_irq(fsl_dev->irq, dev);
+}
+
 static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
@@ -73,13 +111,13 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize vblank\n");
-		goto done;
+		goto done_vblank;
 	}
 
-	ret = drm_irq_install(dev, fsl_dev->irq);
+	ret = fsl_dcu_irq_install(dev, fsl_dev->irq);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to install IRQ handler\n");
-		goto done;
+		goto done_irq;
 	}
 
 	if (legacyfb_depth != 16 && legacyfb_depth != 24 &&
@@ -90,11 +128,11 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	return 0;
-done:
+done_irq:
 	drm_kms_helper_poll_fini(dev);
 
 	drm_mode_config_cleanup(dev);
-	drm_irq_uninstall(dev);
+done_vblank:
 	dev->dev_private = NULL;
 
 	return ret;
@@ -106,41 +144,17 @@ static void fsl_dcu_unload(struct drm_device *dev)
 	drm_kms_helper_poll_fini(dev);
 
 	drm_mode_config_cleanup(dev);
-	drm_irq_uninstall(dev);
+	fsl_dcu_irq_uninstall(dev);
 
 	dev->dev_private = NULL;
 }
 
-static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
-	unsigned int int_status;
-	int ret;
-
-	ret = regmap_read(fsl_dev->regmap, DCU_INT_STATUS, &int_status);
-	if (ret) {
-		dev_err(dev->dev, "read DCU_INT_STATUS failed\n");
-		return IRQ_NONE;
-	}
-
-	if (int_status & DCU_INT_STATUS_VBLANK)
-		drm_handle_vblank(dev, 0);
-
-	regmap_write(fsl_dev->regmap, DCU_INT_STATUS, int_status);
-
-	return IRQ_HANDLED;
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(fsl_dcu_drm_fops);
 
 static const struct drm_driver fsl_dcu_drm_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.load			= fsl_dcu_load,
 	.unload			= fsl_dcu_unload,
-	.irq_handler		= fsl_dcu_drm_irq,
-	.irq_preinstall		= fsl_dcu_irq_uninstall,
-	.irq_uninstall		= fsl_dcu_irq_uninstall,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops			= &fsl_dcu_drm_fops,
 	.name			= "fsl-dcu-drm",
-- 
2.32.0

