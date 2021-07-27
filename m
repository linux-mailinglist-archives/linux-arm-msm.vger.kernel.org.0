Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6163D7D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhG0S1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:27:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58232 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhG0S1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:27:25 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0B11D22236;
        Tue, 27 Jul 2021 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627410444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zbZGfD3h61RJ7LPnuc97io9gIE8wTbiYY0NEeg4ps04=;
        b=yDolEE9qyoy93dVG7AELCevKDx8y58MQAgfTBJwaoXHOU4qhQelPsz3f7XCo5PaGvdVRuR
        mHqvEgzPXLEiJF5gaZiaQBEQQFcAs95sHhckbKZWGhlKggvQR8YFXGuUcPrrwBE2242DjD
        Z9K7fO960BQzmxKYr/lX1Ocw11qB8D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627410444;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zbZGfD3h61RJ7LPnuc97io9gIE8wTbiYY0NEeg4ps04=;
        b=kygrV2WbWUTNKiWysdcZUZw/yd4+JpQlZJll1dg6mmfslFHwcgOENZHm5z5ipdcXHOfdlB
        rURWjR5GMS0YmvBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DF3513E9D;
        Tue, 27 Jul 2021 18:27:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cEfBHQtQAGGwGQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:23 +0000
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
Subject: [PATCH 01/14] drm/amdgpu: Convert to Linux IRQ interfaces
Date:   Tue, 27 Jul 2021 20:27:08 +0200
Message-Id: <20210727182721.17981-2-tzimmermann@suse.de>
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
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

The interrupt number returned by pci_msi_vector() is now stored
in struct amdgpu_irq. Calls to pci_msi_vector() can fail and return
a negative errno code. Abort initlaizaton in thi case. The DRM IRQ
midlayer does not handle this correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 21 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2bd13fc2541a..1e05b5aa94e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1775,7 +1775,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
-	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 0d01cfaca77e..a36cdc7323f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -46,7 +46,6 @@
 #include <linux/pci.h>
 
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_vblank.h>
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
@@ -184,7 +183,7 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)
  * Returns:
  * result of handling the IRQ, as defined by &irqreturn_t
  */
-irqreturn_t amdgpu_irq_handler(int irq, void *arg)
+static irqreturn_t amdgpu_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *) arg;
 	struct amdgpu_device *adev = drm_to_adev(dev);
@@ -307,6 +306,7 @@ static void amdgpu_restore_msix(struct amdgpu_device *adev)
 int amdgpu_irq_init(struct amdgpu_device *adev)
 {
 	int r = 0;
+	unsigned int irq;
 
 	spin_lock_init(&adev->irq.lock);
 
@@ -349,15 +349,22 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	INIT_WORK(&adev->irq.ih2_work, amdgpu_irq_handle_ih2);
 	INIT_WORK(&adev->irq.ih_soft_work, amdgpu_irq_handle_ih_soft);
 
-	adev->irq.installed = true;
-	/* Use vector 0 for MSI-X */
-	r = drm_irq_install(adev_to_drm(adev), pci_irq_vector(adev->pdev, 0));
+	/* Use vector 0 for MSI-X. */
+	r = pci_irq_vector(adev->pdev, 0);
+	if (r < 0)
+		return r;
+	irq = r;
+
+	/* PCI devices require shared interrupts. */
+	r = request_irq(irq, amdgpu_irq_handler, IRQF_SHARED, adev_to_drm(adev)->driver->name,
+			adev_to_drm(adev));
 	if (r) {
-		adev->irq.installed = false;
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 		return r;
 	}
+	adev->irq.installed = true;
+	adev->irq.irq = irq;
 	adev_to_drm(adev)->max_vblank_count = 0x00ffffff;
 
 	DRM_DEBUG("amdgpu: irq initialized.\n");
@@ -368,7 +375,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
 {
 	if (adev->irq.installed) {
-		drm_irq_uninstall(&adev->ddev);
+		free_irq(adev->irq.irq, adev_to_drm(adev));
 		adev->irq.installed = false;
 		if (adev->irq.msi_enabled)
 			pci_free_irq_vectors(adev->pdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
index 78ad4784cc74..e9f2c11ea416 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -80,6 +80,7 @@ struct amdgpu_irq_src_funcs {
 
 struct amdgpu_irq {
 	bool				installed;
+	unsigned int			irq;
 	spinlock_t			lock;
 	/* interrupt sources */
 	struct amdgpu_irq_client	client[AMDGPU_IRQ_CLIENTID_MAX];
@@ -100,7 +101,6 @@ struct amdgpu_irq {
 };
 
 void amdgpu_irq_disable_all(struct amdgpu_device *adev);
-irqreturn_t amdgpu_irq_handler(int irq, void *arg);
 
 int amdgpu_irq_init(struct amdgpu_device *adev);
 void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
-- 
2.32.0

