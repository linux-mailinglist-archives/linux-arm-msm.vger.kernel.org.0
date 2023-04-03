Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531506D44AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjDCMps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjDCMpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA0B76AB
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 524BF21CC5;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=skCn5AI2uPTBCiYt5xdgkcl5qCnBD41szIwfBkuQI4g=;
        b=HgF19yjdHJTNpjJmKe9IiwKJIA3hUE6SAB7v6VJA6iGDwf15pI+u67Czs0b7N68HUIxWw3
        +EFcjpbjmigz2hd+xgexwH31zDBOzAgQHYfXky6afrjOTCaTmf22UGLX1aPJwTWmJhU0em
        SMQrEpn9tp9U/+jQg3HmaI6+d+Q9zm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525942;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=skCn5AI2uPTBCiYt5xdgkcl5qCnBD41szIwfBkuQI4g=;
        b=Ql8Czs46Tqtf43Zpg0lCq/ZfFdPjjvf6p38WLyiOjwMnnjwvXbjp7Tbuxj60buWNHkEjED
        yJA6lzym1y9ydiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AE691331A;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QHaPBXbKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/8] drm/msm: Remove fbdev from struct msm_drm_private
Date:   Mon,  3 Apr 2023 14:45:35 +0200
Message-Id: <20230403124538.8497-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DRM device stores a pointer to the fbdev helper. Remove struct
msm_drm_private.fbdev, which contains the same value. No functional
changes.

v2:
	* test for fb_helper->fb in debugfs code

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 ++---
 drivers/gpu/drm/msm/msm_drv.c     | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h     | 2 --
 drivers/gpu/drm/msm/msm_fbdev.c   | 8 ++------
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d6ecff0ab618..7de9e39f051e 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -241,12 +241,11 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
-	if (priv->fbdev) {
+	if (dev->fb_helper && dev->fb_helper->fb) {
 		seq_printf(m, "fbcon ");
-		fbdev_fb = priv->fbdev->fb;
+		fbdev_fb = dev->fb_helper->fb;
 		msm_framebuffer_describe(fbdev_fb, m);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a1c6ced82c9..14f4bc33b50b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -242,7 +242,7 @@ static int msm_drm_uninit(struct device *dev)
 	msm_rd_debugfs_cleanup(priv);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (fbdev && priv->fbdev)
+	if (fbdev && ddev->fb_helper)
 		msm_fbdev_free(ddev);
 #endif
 
@@ -537,7 +537,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (kms && fbdev)
-		priv->fbdev = msm_fbdev_init(ddev);
+		msm_fbdev_init(ddev);
 #endif
 
 	ret = msm_debugfs_late_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f0c184b02a0..852f88c36621 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -129,8 +129,6 @@ struct msm_drm_private {
 	bool is_a2xx;
 	bool has_cached_coherent;
 
-	struct drm_fb_helper *fbdev;
-
 	struct msm_rd_state *rd;       /* debugfs to dump all submits */
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 81a4ae189a44..0bd0cb85c538 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -122,7 +122,6 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 /* initialize fbdev helper */
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper;
 	int ret;
 
@@ -142,8 +141,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
-	priv->fbdev = helper;
-
 	return helper;
 
 fini:
@@ -156,8 +153,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 void msm_fbdev_free(struct drm_device *dev)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb = helper->fb;
 
 	DBG();
@@ -176,5 +172,5 @@ void msm_fbdev_free(struct drm_device *dev)
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 
-	priv->fbdev = NULL;
+	dev->fb_helper = NULL;
 }
-- 
2.40.0

