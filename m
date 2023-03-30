Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C92F6CFD11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjC3Hl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjC3Hlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:41:55 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9A64681
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:41:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E4B4821B04;
        Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680162112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k930eYMGmtYlGfmZvFTN92NO2Rqb8IiXQ99gQmEMF70=;
        b=tiW9h0L8QChUMGotD1CXWHHRKCw/4CVPj4AIzOjaS420AvV5VS37oRdi4OgWIjOV9O2kn8
        3HRinAMfGPQmWXO25OH1+wOBBHSI2CHnEhUJQQteS0B4ImcZHytIN/tNVKRGulEIUgVJEP
        9I/4hPCRjY6p7moWb93jmvoCJUyEwyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680162112;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k930eYMGmtYlGfmZvFTN92NO2Rqb8IiXQ99gQmEMF70=;
        b=51La0ssuDzuehYIXDX97g8BY7P8gQA/PCjWP2mzCdMls/IzYDKDXPp5r9B7i8lq8nwnf6Y
        zZddapDX2q+e3FCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF7041390D;
        Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2NjUKUA9JWSZfQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:52 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] drm/msm: Initialize fbdev DRM client
Date:   Thu, 30 Mar 2023 09:41:48 +0200
Message-Id: <20230330074150.7637-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
References: <20230330074150.7637-1-tzimmermann@suse.de>
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

Initialize the fbdev client in the fbdev code with empty helper
functions. Also clean up the client. The helpers will later
implement various functionality of the DRM client. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 38 +++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 95b193a5e0d5..6c3665c5f4f6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -119,6 +119,30 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 	.fb_probe = msm_fbdev_create,
 };
 
+/*
+ * struct drm_client
+ */
+
+static void msm_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int msm_fbdev_client_restore(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs msm_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= msm_fbdev_client_unregister,
+	.restore	= msm_fbdev_client_restore,
+	.hotplug	= msm_fbdev_client_hotplug,
+};
+
 /* initialize fbdev helper */
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
@@ -131,10 +155,16 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
+	ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		goto err_drm_fb_helper_unprepare;
+	}
+
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
-		goto fail;
+		goto err_drm_client_release;
 	}
 
 	ret = drm_fb_helper_initial_config(helper);
@@ -145,8 +175,11 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 fini:
 	drm_fb_helper_fini(helper);
-fail:
+err_drm_client_release:
+	drm_client_release(&helper->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(helper);
+	kfree(helper);
 	return NULL;
 }
 
@@ -168,6 +201,7 @@ void msm_fbdev_free(struct drm_device *dev)
 		drm_framebuffer_remove(fb);
 	}
 
+	drm_client_release(&helper->client);
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 
-- 
2.40.0

