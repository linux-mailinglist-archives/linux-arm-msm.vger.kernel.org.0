Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D0167BBC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbjAYUE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236197AbjAYUEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:22 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218A045887;
        Wed, 25 Jan 2023 12:04:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B52E21FF18;
        Wed, 25 Jan 2023 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y/gEPYKc6u74/1ZhA3KTyyGoxjq8IY3iL1CCJO+JrM4=;
        b=vYkGvI84jV3ZN70tW/1DxVKWRlpUTiM5LSBJKNLkbDFTA3SmMAeAiKqQA29Ng+6IC9NFmI
        ea7zG/GftgVyiVIUhnOzHS8cbedbaNyYJcHHsnS93YbVGURVhNo2fcy6SayA7ooeOoaFin
        ymCNUA3zys6+Ef5ngIpKTMdpsSgrpfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677059;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y/gEPYKc6u74/1ZhA3KTyyGoxjq8IY3iL1CCJO+JrM4=;
        b=7YStTZ9T/UfO30CN7zcek5I/OMQLBvqLdS5t3eKRDjSuaB/KkRB8BtNpxTsyF2IAlTqdir
        4jfZSVKwM3Y08IAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D4811339E;
        Wed, 25 Jan 2023 20:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wKTSHUOL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:19 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'
Date:   Wed, 25 Jan 2023 21:04:15 +0100
Message-Id: <20230125200415.14123-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125200415.14123-1-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The generic fbdev emulation names variables of type struct fb_info
both 'fbi' and 'info'. The latter seems to be more common in fbdev
code, so name fbi accordingly.

Also replace the duplicate variable in drm_fbdev_fb_destroy().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 47 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 68ce652e3a14..43f94aa9e015 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -46,16 +46,15 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct fb_info *fbi = fb_helper->info;
 	void *shadow = NULL;
 
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi->fbdefio)
-		fb_deferred_io_cleanup(fbi);
+	if (info->fbdefio)
+		fb_deferred_io_cleanup(info);
 	if (drm_fbdev_use_shadow_fb(fb_helper))
-		shadow = fbi->screen_buffer;
+		shadow = info->screen_buffer;
 
 	drm_fb_helper_fini(fb_helper);
 
@@ -171,7 +170,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_framebuffer *fb;
-	struct fb_info *fbi;
+	struct fb_info *info;
 	u32 format;
 	struct iosys_map map;
 	int ret;
@@ -190,35 +189,35 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->fb = buffer->fb;
 	fb = buffer->fb;
 
-	fbi = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(fbi))
-		return PTR_ERR(fbi);
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
 
-	fbi->fbops = &drm_fbdev_fb_ops;
-	fbi->screen_size = sizes->surface_height * fb->pitches[0];
-	fbi->fix.smem_len = fbi->screen_size;
-	fbi->flags = FBINFO_DEFAULT;
+	info->fbops = &drm_fbdev_fb_ops;
+	info->screen_size = sizes->surface_height * fb->pitches[0];
+	info->fix.smem_len = info->screen_size;
+	info->flags = FBINFO_DEFAULT;
 
-	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	if (drm_fbdev_use_shadow_fb(fb_helper)) {
-		fbi->screen_buffer = vzalloc(fbi->screen_size);
-		if (!fbi->screen_buffer)
+		info->screen_buffer = vzalloc(info->screen_size);
+		if (!info->screen_buffer)
 			return -ENOMEM;
-		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
+		info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
 
-		fbi->fbdefio = &drm_fbdev_defio;
-		fb_deferred_io_init(fbi);
+		info->fbdefio = &drm_fbdev_defio;
+		fb_deferred_io_init(info);
 	} else {
 		/* buffer is mapped for HW framebuffer */
 		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
 		if (ret)
 			return ret;
 		if (map.is_iomem) {
-			fbi->screen_base = map.vaddr_iomem;
+			info->screen_base = map.vaddr_iomem;
 		} else {
-			fbi->screen_buffer = map.vaddr;
-			fbi->flags |= FBINFO_VIRTFB;
+			info->screen_buffer = map.vaddr;
+			info->flags |= FBINFO_VIRTFB;
 		}
 
 		/*
@@ -227,10 +226,10 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 		 * case.
 		 */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-		if (fb_helper->hint_leak_smem_start && fbi->fix.smem_start == 0 &&
+		if (fb_helper->hint_leak_smem_start && info->fix.smem_start == 0 &&
 		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
-			fbi->fix.smem_start =
-				page_to_phys(virt_to_page(fbi->screen_buffer));
+			info->fix.smem_start =
+				page_to_phys(virt_to_page(info->screen_buffer));
 #endif
 	}
 
-- 
2.39.0

