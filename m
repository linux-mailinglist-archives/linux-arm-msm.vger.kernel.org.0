Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F5D6D44A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbjDCMpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjDCMpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4997685
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1672221CC3;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PBGxFc2yCehzv3WNMkfqLoCYuoPOxqXkauIB9MLClOA=;
        b=ZFPrSV+140kF/COUTrDE2ZJUDbuJPzdr7IqPOsesWb1ryuD6wUmEU5bJkB7FGxwQwr3LjA
        lWWTvZKhVVlGlfmdfVts8+pWIrxVDRzl7TeLsChR8bIfGwQRXx/CuVrqK57RcmBnnrgmn8
        XrlOUeMuf/D6XItJZJJmTC52vpYoZ0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525942;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PBGxFc2yCehzv3WNMkfqLoCYuoPOxqXkauIB9MLClOA=;
        b=4vJivaIMbsurKmtpkGQEbvTM9OrR9QEfqh0Bdkwzz9NKXBEJtw0fP+Ci/dw2kFr6GCj0ft
        +VGqd/j6sZKkp8Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFF3E13A2F;
        Mon,  3 Apr 2023 12:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eOikMXXKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:41 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/8] drm/msm: Remove struct msm_fbdev
Date:   Mon,  3 Apr 2023 14:45:34 +0200
Message-Id: <20230403124538.8497-5-tzimmermann@suse.de>
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

Remove struct msm_fbdev, which is an empty wrapper around struct
drm_fb_helper. Use the latter directly. No functional changes.

v2:
	* kfree fbdev helper instance on init errors (Dmitri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 323a79d9ef83..81a4ae189a44 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -18,12 +18,6 @@
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
 
-#define to_msm_fbdev(x) container_of(x, struct msm_fbdev, base)
-
-struct msm_fbdev {
-	struct drm_fb_helper base;
-};
-
 static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
@@ -129,16 +123,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_fbdev *fbdev;
 	struct drm_fb_helper *helper;
 	int ret;
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev)
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper)
 		return NULL;
 
-	helper = &fbdev->base;
-
 	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
@@ -159,7 +150,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	drm_fb_helper_fini(helper);
 fail:
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	kfree(helper);
 	return NULL;
 }
 
@@ -168,7 +159,6 @@ void msm_fbdev_free(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
 	struct drm_framebuffer *fb = helper->fb;
-	struct msm_fbdev *fbdev;
 
 	DBG();
 
@@ -176,8 +166,6 @@ void msm_fbdev_free(struct drm_device *dev)
 
 	drm_fb_helper_fini(helper);
 
-	fbdev = to_msm_fbdev(priv->fbdev);
-
 	/* this will free the backing object */
 	if (fb) {
 		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
@@ -186,7 +174,7 @@ void msm_fbdev_free(struct drm_device *dev)
 	}
 
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	kfree(helper);
 
 	priv->fbdev = NULL;
 }
-- 
2.40.0

