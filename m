Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC0070294A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238132AbjEOJo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240646AbjEOJoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:44:08 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A1F1991;
        Mon, 15 May 2023 02:40:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id AA9361F8D7;
        Mon, 15 May 2023 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684143636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T//tfEEUsUlXNaEiKBIRCSCuec02xIqnWeb1TK1YORk=;
        b=sMHUF86N8lIUl6Svx4Te6paLZb/Hjp9geXAXBymcixlSBboAAX7mrtBcr/tUPxuSt+gSNL
        nw0ZSGgMmd7R1ZB+B+GNSw4ofwjLAG3m+72BYCh8OVJWur1HOm4EHK+QMMh/UJeYKctwf+
        jT+QYW0UXG4Dn+MqrVDcmx4+6vdYxSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684143636;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T//tfEEUsUlXNaEiKBIRCSCuec02xIqnWeb1TK1YORk=;
        b=lgaGOMImeMiE4KmKNX+cqf5pRvRwskR8O/D5jJKRZ7oIEgXRUD0MG6rWfMSVnqzORfGOBV
        eJzK/J3B7962wNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 548DD138FE;
        Mon, 15 May 2023 09:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uDOrExT+YWTeTwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 09:40:36 +0000
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
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH v2 05/12] drm/radeon: Use regular fbdev I/O helpers
Date:   Mon, 15 May 2023 11:40:26 +0200
Message-Id: <20230515094033.2133-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515094033.2133-1-tzimmermann@suse.de>
References: <20230515094033.2133-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
helpers. Radeon does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v2:
	* use FB_IO_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/radeon/Kconfig        | 1 +
 drivers/gpu/drm/radeon/radeon_fbdev.c | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

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
index fe76e29910ef..dcabe527f9c0 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -24,6 +24,7 @@
  *     David Airlie
  */
 
+#include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
@@ -193,11 +194,9 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeon_fbdev_fb_open,
 	.fb_release = radeon_fbdev_fb_release,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+	.fb_fillrect = cfb_fillrect,
+	.fb_copyarea = cfb_copyarea,
+	.fb_imageblit = cfb_imageblit,
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
 
-- 
2.40.1

