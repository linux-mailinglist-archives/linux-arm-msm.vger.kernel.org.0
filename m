Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2603E3DE94C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 11:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhHCJH3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 05:07:29 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53680 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbhHCJH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 05:07:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7C50F220CC;
        Tue,  3 Aug 2021 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627981637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yHlNgTWb5wzZ2V4HHqthMPQdIuItB7WtEHn3eVsIbM8=;
        b=tB1eVLeNHYgKM4H7X85k+OeVl3eYw+IL7PI/E5sPsLlKf4whuOEzkls2oknrfDl+FVhj69
        KCPfGr6XwuXknDB8vj7zronycaz9GAhxxBYIKmi6VjvmtBnwqSjHg+Dh5lPmlJDSr7KlMS
        bn+Q48xFYnFV0V3j1lv78xzRdg+54Xo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627981637;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yHlNgTWb5wzZ2V4HHqthMPQdIuItB7WtEHn3eVsIbM8=;
        b=nvfsNzKk+H01zHFG+0v//tqYZbMRn5fwyJ76ovyb7gbdum6HbG2U0/oxnuZEgNy2W1BjGp
        Fy4VWbzPMntgKJAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B856113CCA;
        Tue,  3 Aug 2021 09:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GC7AK0QHCWFVJQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:16 +0000
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
Subject: [PATCH v2 13/14] drm: Remove unused devm_drm_irq_install()
Date:   Tue,  3 Aug 2021 11:07:03 +0200
Message-Id: <20210803090704.32152-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DRM IRQ helpers will become legacy. The function devm_drm_irq_install()
is unused and won't be required later.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_irq.c | 32 --------------------------------
 include/drm/drm_irq.h     |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 201eae4bba6c..dc6e38fa8a48 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -209,38 +209,6 @@ int drm_irq_uninstall(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_irq_uninstall);
 
-static void devm_drm_irq_uninstall(void *data)
-{
-	drm_irq_uninstall(data);
-}
-
-/**
- * devm_drm_irq_install - install IRQ handler
- * @dev: DRM device
- * @irq: IRQ number to install the handler for
- *
- * devm_drm_irq_install is a  help function of drm_irq_install.
- *
- * if the driver uses devm_drm_irq_install, there is no need
- * to call drm_irq_uninstall when the drm module get unloaded,
- * as this will done automagically.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int devm_drm_irq_install(struct drm_device *dev, int irq)
-{
-	int ret;
-
-	ret = drm_irq_install(dev, irq);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev->dev,
-					devm_drm_irq_uninstall, dev);
-}
-EXPORT_SYMBOL(devm_drm_irq_install);
-
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 int drm_legacy_irq_control(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
index 631b22f9757d..53634b988f57 100644
--- a/include/drm/drm_irq.h
+++ b/include/drm/drm_irq.h
@@ -28,5 +28,4 @@ struct drm_device;
 
 int drm_irq_install(struct drm_device *dev, int irq);
 int drm_irq_uninstall(struct drm_device *dev);
-int devm_drm_irq_install(struct drm_device *dev, int irq);
 #endif
-- 
2.32.0

