Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED0C6CFD0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjC3Hl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjC3Hly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:41:54 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EE8423A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:41:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E25371FE93;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680162112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B23GwBjXyqlLfWI6saGLFzkXcQ1lh31OLApNscq2YIA=;
        b=n+ou+Aa5zsGKe5lp+65Yc9KV0GEjMVjavrB2j5W8qqdGTkigZiSNawRRhsyH5jIBTk11HM
        6VPgB1V/3FUoYfB/VT7E9UyHAEQD7H76m1NEcRSPq+4OtKBJjoUkAp5RESGxIKCNzNrOnj
        sJ1L8CCbx/jjFcutqmxL2hgEryx0g1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680162112;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B23GwBjXyqlLfWI6saGLFzkXcQ1lh31OLApNscq2YIA=;
        b=LsUzS8SzQufe5Jk28N3qdv1SFm4xrpHvsFk6chPbeovB++jVH4GJqrDxA5LUHBiQMcYevx
        ow+yI5M1vOpjVcDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECFDF1348E;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2LbTOD89JWSZfQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:51 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] drm/msm: Remove fb from struct msm_fbdev
Date:   Thu, 30 Mar 2023 09:41:45 +0200
Message-Id: <20230330074150.7637-3-tzimmermann@suse.de>
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

Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
struct msm_fbdev.fb, which contains thre same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fc7d0406a9f9..323a79d9ef83 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -14,8 +14,6 @@
 #include "msm_gem.h"
 #include "msm_kms.h"
 
-static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
-
 /*
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
@@ -24,9 +22,16 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
 struct msm_fbdev {
 	struct drm_fb_helper base;
-	struct drm_framebuffer *fb;
 };
 
+static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
+	struct drm_gem_object *bo = msm_framebuffer_bo(helper->fb, 0);
+
+	return drm_gem_prime_mmap(bo, vma);
+}
+
 static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -42,19 +47,9 @@ static const struct fb_ops msm_fb_ops = {
 	.fb_mmap = msm_fbdev_mmap,
 };
 
-static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
-	struct msm_fbdev *fbdev = to_msm_fbdev(helper);
-	struct drm_gem_object *bo = msm_framebuffer_bo(fbdev->fb, 0);
-
-	return drm_gem_prime_mmap(bo, vma);
-}
-
 static int msm_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
-	struct msm_fbdev *fbdev = to_msm_fbdev(helper);
 	struct drm_device *dev = helper->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb = NULL;
@@ -101,7 +96,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
-	fbdev->fb = fb;
 	helper->fb = fb;
 
 	fbi->fbops = &msm_fb_ops;
@@ -118,7 +112,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	fbi->fix.smem_len = bo->size;
 
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
-	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
+	DBG("allocated %dx%d fb", fb->width, fb->height);
 
 	return 0;
 
@@ -173,6 +167,7 @@ void msm_fbdev_free(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_framebuffer *fb = helper->fb;
 	struct msm_fbdev *fbdev;
 
 	DBG();
@@ -184,11 +179,10 @@ void msm_fbdev_free(struct drm_device *dev)
 	fbdev = to_msm_fbdev(priv->fbdev);
 
 	/* this will free the backing object */
-	if (fbdev->fb) {
-		struct drm_gem_object *bo =
-			msm_framebuffer_bo(fbdev->fb, 0);
+	if (fb) {
+		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
 		msm_gem_put_vaddr(bo);
-		drm_framebuffer_remove(fbdev->fb);
+		drm_framebuffer_remove(fb);
 	}
 
 	drm_fb_helper_unprepare(helper);
-- 
2.40.0

