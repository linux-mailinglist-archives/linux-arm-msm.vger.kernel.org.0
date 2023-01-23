Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8F8677859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 11:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjAWKGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 05:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjAWKGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 05:06:13 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEE99EF1;
        Mon, 23 Jan 2023 02:06:10 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 22A841F894;
        Mon, 23 Jan 2023 10:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674468366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDd9MXBTjKMXMh/f/QyfHcSewUkTmQXrhwWLESaTFTc=;
        b=I4TtmGYDyKvSOnbWkOxiQM5mENgnz2IBpk2sUXD3kE+W2SFSlaCIvtVg+lgRlkD/Wz/V4D
        P1yn33vBBIAdQHETcDkqiDrp0tUWNSyTz6VPPn7R5/f2zXicB25xcUXeiilpbONcmfYZ4t
        zSbyWVAbDjqztG0Nf78FCYwE7xpQYvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674468366;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDd9MXBTjKMXMh/f/QyfHcSewUkTmQXrhwWLESaTFTc=;
        b=8FR2KJnsq+LEqZkKZWvc+UmQgBc9reVplThcIblGYUo8bC59zPBBsKmGhOGWmr3x5A3rdl
        eCDOwAESYDgvDdDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4609134F5;
        Mon, 23 Jan 2023 10:06:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id AHHKMg1czmO+DwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:05 +0000
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
Subject: [PATCH 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'
Date:   Mon, 23 Jan 2023 11:05:59 +0100
Message-Id: <20230123100559.12351-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123100559.12351-1-tzimmermann@suse.de>
References: <20230123100559.12351-1-tzimmermann@suse.de>
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
---
 drivers/gpu/drm/drm_fbdev_generic.c | 49 ++++++++++++++---------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 49a0bba86ce7..7633da5c13c3 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -46,17 +46,16 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct fb_info *fbi = fb_helper->info;
 	void *shadow = NULL;
 
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi) {
-		if (fbi->fbdefio)
-			fb_deferred_io_cleanup(fbi);
+	if (info) {
+		if (info->fbdefio)
+			fb_deferred_io_cleanup(info);
 		if (drm_fbdev_use_shadow_fb(fb_helper))
-			shadow = fbi->screen_buffer;
+			shadow = info->screen_buffer;
 	}
 
 	drm_fb_helper_fini(fb_helper);
@@ -173,7 +172,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_framebuffer *fb;
-	struct fb_info *fbi;
+	struct fb_info *info;
 	u32 format;
 	struct iosys_map map;
 	int ret;
@@ -192,35 +191,35 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
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
@@ -229,10 +228,10 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
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

