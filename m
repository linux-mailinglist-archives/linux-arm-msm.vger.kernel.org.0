Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50A5679969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 14:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbjAXNkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 08:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbjAXNkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:14 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39A63754D;
        Tue, 24 Jan 2023 05:40:13 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8FA201FDC3;
        Tue, 24 Jan 2023 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jWHAeVwiu+7Pt1XKK8+Xbu9HCfPR9qcjYa+iK3HlDeo=;
        b=yiClVrJ58vs8iV78LiMLGdn+UPGtz9XD03fu7eyixwqJ39B/IP41Opy+RJGOfXcE6yKs/u
        hYieBJlA0nIFBJfSha4xAdkAKXh65ybZOVPI6F32QHpOCGl/BhVNQdZS6sBsjIOLZaeMlu
        H1zzWV/xxVhgDi+o6J/eRX0dgEVi9rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567612;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jWHAeVwiu+7Pt1XKK8+Xbu9HCfPR9qcjYa+iK3HlDeo=;
        b=7M0NCnXbuQxu9SAUTdw6OKsAcvxWhkzu1iDFMcy0gzkneSAbi5oACmbnipoXorPUEQNEC0
        mTmkNm6zps7UzQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4958E13487;
        Tue, 24 Jan 2023 13:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8Kr0ELzfz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:12 +0000
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
Subject: [PATCH v2 03/10] drm/fb-helper: Introduce drm_fb_helper_unprepare()
Date:   Tue, 24 Jan 2023 14:40:03 +0100
Message-Id: <20230124134010.30263-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
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

