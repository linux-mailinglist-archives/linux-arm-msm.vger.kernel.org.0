Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7D56D44B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjDCMpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjDCMpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FE4658F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D946D21CCA;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xi3die/I2dHKAwxwocB9Q8kQlecVkzakyk/lNTgIG/w=;
        b=NGMViStDbxAOgFYBgXP3A46oogBwwLMiODzC7eG7HI8msKGTE/SnVFBgxh+73i+W5pDhjy
        bP8ZoLhNFu1/sf3ULcA6JSlZTdMR+CncMw+qFYXkSLwShGp5sXvuqxxJ7ucfAhisQsydKt
        4XCmx6ovnM/N2KGlRR3CqaojBjSn5OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525942;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xi3die/I2dHKAwxwocB9Q8kQlecVkzakyk/lNTgIG/w=;
        b=Mp3i4S7Y2+xhfSeKI3hu5azB8qHC8aFrebnU+OdJGnwPyygND/uxd3nH91AbHMvm22coIn
        UmU+pGbgbMa/6tAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A077E1331A;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eCtKJnbKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/8] drm/msm: Initialize fbdev DRM client
Date:   Mon,  3 Apr 2023 14:45:37 +0200
Message-Id: <20230403124538.8497-8-tzimmermann@suse.de>
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

Initialize the fbdev client in the fbdev code with empty helper
functions. Also clean up the client. The helpers will later
implement various functionality of the DRM client. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 37 +++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 7d205632b165..77788c6c802d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -123,6 +123,30 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
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
@@ -138,10 +162,16 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
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
@@ -152,7 +182,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 fini:
 	drm_fb_helper_fini(helper);
-fail:
+err_drm_client_release:
+	drm_client_release(&helper->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 	return NULL;
@@ -176,6 +208,7 @@ void msm_fbdev_free(struct drm_device *dev)
 		drm_framebuffer_remove(fb);
 	}
 
+	drm_client_release(&helper->client);
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 
-- 
2.40.0

