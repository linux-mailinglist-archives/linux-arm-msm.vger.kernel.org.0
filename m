Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70474756A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 11:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbhLOKnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 05:43:23 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:48634 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237596AbhLOKnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 05:43:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DC256212C0;
        Wed, 15 Dec 2021 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639565001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nb9F5Z8bMRJ29PjFnWYClorHHVdL3vddk6Ud4G0acUE=;
        b=YlrtP9J9w9LWDYVaM2I344dafJSH/Pls0vIJE23fov4LEXEtj5lfZJ1/ne14tq6Mpk6smA
        cmOdXild3GZlPIQrYrzbPTRsV6qaB1M4gtcE67ZNr82Jckgn5eVEFZOweOhCOIPDY40/j9
        Q7ftQkrMbe58DRiui3eS1siT67pE2tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639565001;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nb9F5Z8bMRJ29PjFnWYClorHHVdL3vddk6Ud4G0acUE=;
        b=BxEeOmmMblkITUSERkAtFz5DHSAO7WVbnt1rtUK6JQQf+U5loAVoc2Hj5PwrAdMCYE6YGE
        ve+wVuh/6UXtsXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9473A13B1C;
        Wed, 15 Dec 2021 10:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wNdnI8nGuWH1eAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 10:43:21 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     mripard@kernel.org, maarten.lankhorst@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/5] drm/dp: Move DP declarations into separate header file
Date:   Wed, 15 Dec 2021 11:43:14 +0100
Message-Id: <20211215104318.18866-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215104318.18866-1-tzimmermann@suse.de>
References: <20211215104318.18866-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split the DP declarations from other helpers before moving the
DP functions into a separate module.

v2:
	* forward-declare struct drm_dp_aux (Jani)
	* add include guards in drm_dp_helper_internal.h

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h | 27 ------------------
 drivers/gpu/drm/drm_dp_aux_dev.c           |  2 +-
 drivers/gpu/drm/drm_dp_helper.c            |  2 +-
 drivers/gpu/drm/drm_dp_helper_internal.h   | 33 ++++++++++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c      |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c    |  1 +
 6 files changed, 37 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dp_helper_internal.h

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index 61e09f8a8d0f..28e04e750130 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -28,36 +28,9 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_modes.h>
 
-/* drm_dp_aux_dev.c */
-#ifdef CONFIG_DRM_DP_AUX_CHARDEV
-int drm_dp_aux_dev_init(void);
-void drm_dp_aux_dev_exit(void);
-int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
-void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
-#else
-static inline int drm_dp_aux_dev_init(void)
-{
-	return 0;
-}
-
-static inline void drm_dp_aux_dev_exit(void)
-{
-}
-
-static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
-{
-	return 0;
-}
-
-static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
-{
-}
-#endif
-
 /* drm_probe_helper.c */
 enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
index 06b374cae956..0618dfe16660 100644
--- a/drivers/gpu/drm/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/drm_dp_aux_dev.c
@@ -40,7 +40,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_print.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 
 struct drm_dp_aux_dev {
 	unsigned index;
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 23f9073bc473..e995a0262ed7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -35,7 +35,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_panel.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
diff --git a/drivers/gpu/drm/drm_dp_helper_internal.h b/drivers/gpu/drm/drm_dp_helper_internal.h
new file mode 100644
index 000000000000..8917fc3af9ec
--- /dev/null
+++ b/drivers/gpu/drm/drm_dp_helper_internal.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DP_HELPER_INTERNAL_H
+#define DRM_DP_HELPER_INTERNAL_H
+
+struct drm_dp_aux;
+
+#ifdef CONFIG_DRM_DP_AUX_CHARDEV
+int drm_dp_aux_dev_init(void);
+void drm_dp_aux_dev_exit(void);
+int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
+#else
+static inline int drm_dp_aux_dev_init(void)
+{
+	return 0;
+}
+
+static inline void drm_dp_aux_dev_exit(void)
+{
+}
+
+static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
+{
+	return 0;
+}
+
+static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7f0ff96261cf..9f7b0b606924 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -45,7 +45,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 #include "drm_dp_mst_topology_internal.h"
 
 /**
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index 47e92400548d..88260d26409c 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_print.h>
 
+#include "drm_dp_helper_internal.h"
 #include "drm_crtc_helper_internal.h"
 
 MODULE_AUTHOR("David Airlie, Jesse Barnes");
-- 
2.34.1

