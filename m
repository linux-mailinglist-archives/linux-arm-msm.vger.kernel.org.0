Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E5D67BBC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbjAYUE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236198AbjAYUEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:22 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F1B38B75;
        Wed, 25 Jan 2023 12:04:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3CD3521C89;
        Wed, 25 Jan 2023 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e08ONuN0TCqslXy4RigVWp3ixbi2nOSyqtwWMRMhRNs=;
        b=ToVWTEMnv7pEkk4/B7wCok9NwUHypVeEX+dylfZLP81ZR/Pug74NIqqAt0oM9RoYiNvThZ
        mz1ijJa8jSlhvNSKxX2E0jnewA702YUA0ajYjiftEDp3DEo5vIb51CGEKDZt6e1nYJIEWQ
        yf29+GneExLQBtLK9kvC5xtPvjX5v70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677059;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e08ONuN0TCqslXy4RigVWp3ixbi2nOSyqtwWMRMhRNs=;
        b=wZ3G+lpiRcCn4/sbyKXXwQumzE++p8isH5Do6a7X2atbZ+QMmAJCWbxS4eosTeXdrMsvLh
        rvC5z0u/cCI2GPCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B381339E;
        Wed, 25 Jan 2023 20:04:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qHc7O0KL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:18 +0000
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
Subject: [PATCH v3 08/10] drm/fbdev-generic: Minimize client unregistering
Date:   Wed, 25 Jan 2023 21:04:13 +0100
Message-Id: <20230125200415.14123-9-tzimmermann@suse.de>
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

For uninitialized framebuffers, only release the DRM client and
free the fbdev memory. Do not attempt to clean up the framebuffer.

DRM fbdev clients have a two-step initialization: first create
the DRM client; then create the framebuffer device on the first
successful hotplug event. In cases where the client never creates
the framebuffer, only the client state needs to be released. We
can detect which case it is, full or client-only cleanup, by
looking at the presence of fb_helper's info field.

v3:
	* fix typo in commit message (Javier)
	* release client before unpreparing fbdev
v2:
	* remove test for (fbi != NULL) in drm_fbdev_cleanup() (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index dd8be5e0f271..a9c519001019 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -51,12 +51,10 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi) {
-		if (fbi->fbdefio)
-			fb_deferred_io_cleanup(fbi);
-		if (drm_fbdev_use_shadow_fb(fb_helper))
-			shadow = fbi->screen_buffer;
-	}
+	if (fbi->fbdefio)
+		fb_deferred_io_cleanup(fbi);
+	if (drm_fbdev_use_shadow_fb(fb_helper))
+		shadow = fbi->screen_buffer;
 
 	drm_fb_helper_fini(fb_helper);
 
@@ -362,11 +360,13 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (fb_helper->info)
-		/* drm_fbdev_fb_destroy() takes care of cleanup */
+	if (fb_helper->info) {
 		drm_fb_helper_unregister_info(fb_helper);
-	else
-		drm_fbdev_release(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
 }
 
 static int drm_fbdev_client_restore(struct drm_client_dev *client)
-- 
2.39.0

