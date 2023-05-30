Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E728D7165A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjE3PDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 11:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbjE3PC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 11:02:59 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAC4F0;
        Tue, 30 May 2023 08:02:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 50B8621AA2;
        Tue, 30 May 2023 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685458976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+n2MBZA96RKe6j3XjALvpnP7GV6tfvs+CKWxd3q0Zrw=;
        b=K6ppEw9eCT1gaCq/v5ZKuSJtZUxikc9Bsko99NPdA149+qvX6wJ6ru7GptlP+9hPfSFe/l
        CktPEGH3SYrjRWolU9qZ3CvyMWtMwzyBvjHvTnzYNRfB5tpJ5IkJgOXCD6jkOhjTIHlqlb
        Ttd8JoV3yLD7q4NyjH6mCrsVZ2z3qfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685458976;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+n2MBZA96RKe6j3XjALvpnP7GV6tfvs+CKWxd3q0Zrw=;
        b=aJkBhk5gIetAVQ+7tFEgsZYrCws4zZY7rUiLB4ds2DOqtXT2Mb085C3au8nIpv3O2U9mFy
        w36rDM7xWgu9JGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E6C813A21;
        Tue, 30 May 2023 15:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6M/MAiAQdmShegAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:02:56 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v5 05/13] drm/gma500: Use regular fbdev I/O helpers
Date:   Tue, 30 May 2023 17:02:45 +0200
Message-Id: <20230530150253.22758-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530150253.22758-1-tzimmermann@suse.de>
References: <20230530150253.22758-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Gma500 does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v4:
	* use initializer macros for struct fb_ops
v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Kconfig | 1 +
 drivers/gpu/drm/gma500/fbdev.c | 8 +++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 2efc0eb41c64..cd3d92725ed4 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -3,6 +3,7 @@ config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	select I2C
 	select I2C_ALGOBIT
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 4f0309548b2b..955cbe9f05a7 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -5,6 +5,7 @@
  *
  **************************************************************************/
 
+#include <linux/fb.h>
 #include <linux/pfn_t.h>
 
 #include <drm/drm_crtc_helper.h>
@@ -134,13 +135,10 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops psb_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
+	__FB_DEFAULT_IO_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psb_fbdev_fb_setcolreg,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+	__FB_DEFAULT_IO_OPS_DRAW,
 	.fb_mmap = psb_fbdev_fb_mmap,
 	.fb_destroy = psb_fbdev_fb_destroy,
 };
-- 
2.40.1

