Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFFB67BBAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236189AbjAYUEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236175AbjAYUEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:20 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CA5298EF;
        Wed, 25 Jan 2023 12:04:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E1E6821B80;
        Wed, 25 Jan 2023 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WhdE2M5zn4/MKgwBvX3WXtrBqldU9porz9r1vGCJMT4=;
        b=BQEpa3QWTs7km2Iwl1SWuPd4jwDYfkegPuRiTf2Zgvz7wjGhaOjvD09/lElSBxzVTfXl1D
        bmSHpQiaP6ai0wNUPSlgo0IjXpNw/vmEKqvF8Nt1KtnLyWDsFagTVPlEA/6BuM1f2mRg+B
        EgciDfwWdYVAtrpoTnDLBmX4K623Psg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677057;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WhdE2M5zn4/MKgwBvX3WXtrBqldU9porz9r1vGCJMT4=;
        b=JS+3ACRHPBij17coQtUCBHTadO69mnvhgJMiW1m0ntPW4V0C1CD4hFTsy2cuRV0CYdjc7B
        +FPYU3qCcHT7mwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9FFF13A06;
        Wed, 25 Jan 2023 20:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2JK8KEGL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:17 +0000
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
Subject: [PATCH v3 03/10] drm/fb-helper: Introduce drm_fb_helper_unprepare()
Date:   Wed, 25 Jan 2023 21:04:08 +0100
Message-Id: <20230125200415.14123-4-tzimmermann@suse.de>
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

Move the fb-helper clean-up code into drm_fb_helper_unprepare(). No
functional changes.

v2:
	* declare as static inline (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
 include/drm/drm_fb_helper.h     |  5 +++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c5c13e192b64..4379bcd7718b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -435,6 +435,18 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 }
 EXPORT_SYMBOL(drm_fb_helper_prepare);
 
+/**
+ * drm_fb_helper_unprepare - clean up a drm_fb_helper structure
+ * @fb_helper: driver-allocated fbdev helper structure to set up
+ *
+ * Cleans up the framebuffer helper. Inverse of drm_fb_helper_prepare().
+ */
+void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
+{
+	mutex_destroy(&fb_helper->lock);
+}
+EXPORT_SYMBOL(drm_fb_helper_unprepare);
+
 /**
  * drm_fb_helper_init - initialize a &struct drm_fb_helper
  * @dev: drm device
@@ -561,7 +573,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	}
 	mutex_unlock(&kernel_fb_helper_lock);
 
-	mutex_destroy(&fb_helper->lock);
+	drm_fb_helper_unprepare(fb_helper);
 
 	if (!fb_helper->client.funcs)
 		drm_client_release(&fb_helper->client);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index f443e1f11654..39710c570a04 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -230,6 +230,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 			   const struct drm_fb_helper_funcs *funcs);
+void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
 void drm_fb_helper_fini(struct drm_fb_helper *helper);
 int drm_fb_helper_blank(int blank, struct fb_info *info);
@@ -296,6 +297,10 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
 {
 }
 
+static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
+{
+}
+
 static inline int drm_fb_helper_init(struct drm_device *dev,
 		       struct drm_fb_helper *helper)
 {
-- 
2.39.0

