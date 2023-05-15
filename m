Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC154702943
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240789AbjEOJoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240610AbjEOJoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:44:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EC14223;
        Mon, 15 May 2023 02:40:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7D7C121C83;
        Mon, 15 May 2023 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684143635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ky/T9sxQFkFg9mWm114fhNRWHvZEHyZCwJPgXOmx12g=;
        b=xRldKZuG3ETyIhlqhiq2IMoiqXzmVrM58gW/7ooohmjOgVsMgfqHGh0uqvfY9lUXwc2YKR
        U4QEGRafBq7rnks2azjW5U6azcb6l3T9clpn0RoE+2XWoYvgX8NxD6seGXB6d0ToHemQHV
        sN1+r6+D9h64ggq5AzydOy99po38XLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684143635;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ky/T9sxQFkFg9mWm114fhNRWHvZEHyZCwJPgXOmx12g=;
        b=ObX6EUWyXD5+4ZOBGJ0Gxylxgf/ZNiPdpzXhB6ZG158H5Xm0eNfs5y3TtDdbMRr9+1uZdw
        IXvnmQztR38+KnBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B8DC13466;
        Mon, 15 May 2023 09:40:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KMlVCRP+YWTeTwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 09:40:35 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
Date:   Mon, 15 May 2023 11:40:23 +0200
Message-Id: <20230515094033.2133-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515094033.2133-1-tzimmermann@suse.de>
References: <20230515094033.2133-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Armada does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/Kconfig        | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index f5c66d89ba99..5afade25e217 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -3,6 +3,7 @@ config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
 	depends on DRM && HAVE_CLK && ARM && MMU
 	select DRM_KMS_HELPER
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	help
 	  Support the "LCD" controllers found on the Marvell Armada 510
 	  devices.  There are two controllers on the device, each controller
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 0a5fd1aa86eb..6c3bbaf53569 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -34,11 +35,9 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_read	= drm_fb_helper_cfb_read,
-	.fb_write	= drm_fb_helper_cfb_write,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_fillrect	= cfb_fillrect,
+	.fb_copyarea	= cfb_copyarea,
+	.fb_imageblit	= cfb_imageblit,
 	.fb_destroy	= armada_fbdev_fb_destroy,
 };
 
-- 
2.40.1

