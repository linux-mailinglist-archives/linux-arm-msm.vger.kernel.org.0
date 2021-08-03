Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DD73DE941
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 11:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbhHCJHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 05:07:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58692 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbhHCJHW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 05:07:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2E60A200B8;
        Tue,  3 Aug 2021 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627981631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8mQOCbOV52pRbUkfuvMipsrJoBTjpbf/hTeFLBcfUcs=;
        b=pE4Ct261pU5hg/fsj9SX8fXhK8cqFgqYkLuKhYTzoGNfQGjkupJfZbzcovMJRemiNxc8XS
        6NYB/f/Cb8+8IsrfOUH0pCJTWjp2hkY3rBJijhaL3Fc9vFv4O+vKzmfilWPKWjG+ux0vpw
        liZeiO+PsJdnbq/3RZ5RV1mPSOgebAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627981631;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8mQOCbOV52pRbUkfuvMipsrJoBTjpbf/hTeFLBcfUcs=;
        b=NnAynRUoXwjHoSSYCnmTH+Mziaaw7udrD/3J8eL3EF59np9Ft4jreAFr7/RHi9pnzSG+qO
        5iyM/YZPwz505AAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C66A13CCA;
        Tue,  3 Aug 2021 09:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SMEtGT4HCWFVJQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:10 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, liviu.dudau@arm.com,
        brian.starkey@arm.com, sam@ravnborg.org, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
        patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
        robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
        tomi.valkeinen@ideasonboard.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/14] drm/gma500: Convert to Linux IRQ interfaces
Date:   Tue,  3 Aug 2021 11:06:55 +0200
Message-Id: <20210803090704.32152-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/gma500/power.c   |  1 +
 drivers/gpu/drm/gma500/psb_drv.c |  8 ++------
 drivers/gpu/drm/gma500/psb_drv.h |  5 -----
 drivers/gpu/drm/gma500/psb_irq.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/gma500/psb_irq.h |  4 ++--
 5 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index f07641dfa5a4..20ace6010f9f 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -32,6 +32,7 @@
 #include "psb_drv.h"
 #include "psb_reg.h"
 #include "psb_intel_reg.h"
+#include "psb_irq.h"
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 3850842d58f3..58bce1a60a4d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_pciids.h>
 #include <drm/drm_vblank.h>
 
@@ -33,6 +32,7 @@
 #include "power.h"
 #include "psb_drv.h"
 #include "psb_intel_reg.h"
+#include "psb_irq.h"
 #include "psb_reg.h"
 
 static const struct drm_driver driver;
@@ -380,7 +380,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 
-	drm_irq_install(dev, pdev->irq);
+	psb_irq_install(dev, pdev->irq);
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
 
@@ -515,10 +515,6 @@ static const struct drm_driver driver = {
 	.lastclose = drm_fb_helper_lastclose,
 
 	.num_ioctls = ARRAY_SIZE(psb_ioctls),
-	.irq_preinstall = psb_irq_preinstall,
-	.irq_postinstall = psb_irq_postinstall,
-	.irq_uninstall = psb_irq_uninstall,
-	.irq_handler = psb_irq_handler,
 
 	.dumb_create = psb_gem_dumb_create,
 	.ioctls = psb_ioctls,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index d6e7c2c2c947..f2bae270ca7b 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -624,11 +624,6 @@ static inline struct drm_psb_private *psb_priv(struct drm_device *dev)
 }
 
 /* psb_irq.c */
-extern irqreturn_t psb_irq_handler(int irq, void *arg);
-extern void psb_irq_preinstall(struct drm_device *dev);
-extern int psb_irq_postinstall(struct drm_device *dev);
-extern void psb_irq_uninstall(struct drm_device *dev);
-
 extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
 extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
 extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 104009e78487..deb1fbc1f748 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -8,6 +8,7 @@
  *
  **************************************************************************/
 
+#include <drm/drm_drv.h>
 #include <drm/drm_vblank.h>
 
 #include "power.h"
@@ -222,7 +223,7 @@ static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
 	PSB_RSGX32(PSB_CR_EVENT_HOST_CLEAR2);
 }
 
-irqreturn_t psb_irq_handler(int irq, void *arg)
+static irqreturn_t psb_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
 	struct drm_psb_private *dev_priv = dev->dev_private;
@@ -304,7 +305,7 @@ void psb_irq_preinstall(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 }
 
-int psb_irq_postinstall(struct drm_device *dev)
+void psb_irq_postinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
@@ -332,12 +333,31 @@ int psb_irq_postinstall(struct drm_device *dev)
 		dev_priv->ops->hotplug_enable(dev, true);
 
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
+}
+
+int psb_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	psb_irq_preinstall(dev);
+
+	/* PCI devices require shared interrupts. */
+	ret = request_irq(irq, psb_irq_handler, IRQF_SHARED, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	psb_irq_postinstall(dev);
+
 	return 0;
 }
 
 void psb_irq_uninstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -366,6 +386,8 @@ void psb_irq_uninstall(struct drm_device *dev)
 	/* This register is safe even if display island is off */
 	PSB_WVDC32(PSB_RVDC32(PSB_INT_IDENTITY_R), PSB_INT_IDENTITY_R);
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
+
+	free_irq(pdev->irq, dev);
 }
 
 /*
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index 17c9b0b62471..a97cb49393d8 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -19,9 +19,9 @@ bool sysirq_init(struct drm_device *dev);
 void sysirq_uninit(struct drm_device *dev);
 
 void psb_irq_preinstall(struct drm_device *dev);
-int  psb_irq_postinstall(struct drm_device *dev);
+void psb_irq_postinstall(struct drm_device *dev);
+int  psb_irq_install(struct drm_device *dev, unsigned int irq);
 void psb_irq_uninstall(struct drm_device *dev);
-irqreturn_t psb_irq_handler(int irq, void *arg);
 
 int  psb_enable_vblank(struct drm_crtc *crtc);
 void psb_disable_vblank(struct drm_crtc *crtc);
-- 
2.32.0

