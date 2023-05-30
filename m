Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E1D716670
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 17:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjE3PMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 11:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbjE3PMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 11:12:36 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C764A7;
        Tue, 30 May 2023 08:12:34 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id ADA051FDD9;
        Tue, 30 May 2023 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685459552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6A8Pi7OykTxyfG7Hxlk+Dam5oT5Zam16nRF2el8SnhQ=;
        b=GI3/5rdauTT0mDV6Fr6i0ecLQmgxKZ8SUTXKEz8qGpaseWp06sZsrLa/YcPTwJ+dJyrNzL
        solskh40PjDRjPZZ/nAA5soHfYZdgo0qZaHODK1bMZFoNa71ZJ34LdsB77KWgOF7Dn1QnP
        k+vWaQg+eG5v5ZPRWEZ9Oul4E6gVzMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685459552;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6A8Pi7OykTxyfG7Hxlk+Dam5oT5Zam16nRF2el8SnhQ=;
        b=Ul6ux8+pHFNTU7ooE2jxkmzWyhp/7juQOzuTdHsTG7otbCNbZtqTJkOweA2urjPdLnkMqZ
        h6Folh+zGhRYP5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 516E213478;
        Tue, 30 May 2023 15:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GPLiEmASdmRjAQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:32 +0000
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
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH v5 06/13] drm/radeon: Use regular fbdev I/O helpers
Date:   Tue, 30 May 2023 17:12:21 +0200
Message-Id: <20230530151228.22979-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
helpers. Radeon does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v4:
	* use initializer macros for struct fb_ops
v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/radeon/Kconfig        | 1 +
 drivers/gpu/drm/radeon/radeon_fbdev.c | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index e19d77d58810..fe498c8af1bb 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -11,6 +11,7 @@ config DRM_RADEON
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select POWER_SUPPLY
 	select HWMON
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index fe76e29910ef..28212c2d6c98 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -24,6 +24,7 @@
  *     David Airlie
  */
 
+#include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
@@ -190,14 +191,10 @@ static void radeon_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops radeon_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeon_fbdev_fb_open,
 	.fb_release = radeon_fbdev_fb_release,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+	FB_DEFAULT_IO_OPS,
+	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
 
-- 
2.40.1

