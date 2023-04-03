Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E5B6D44AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjDCMpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjDCMpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E182C7D8C
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7201FF48;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0MpE22ymb/Uv+aRaua0I54AqrgI32SSKhftHLKaFNwU=;
        b=uM57m80KIBAW40zUwPpowiigKysc6UaCyetjxw7COBDjStP9/s+C7tSYOqa2DTumFGIM17
        42206dS1S9P2hbVmq608e6PFQ+qaFStO9PSU6k9KSL/wh5WWzt7TJ9oXdkySKdM2+Qx6bH
        CX/4oEq+9sB8SF1rt+avX02KMgDzQYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525942;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0MpE22ymb/Uv+aRaua0I54AqrgI32SSKhftHLKaFNwU=;
        b=PnNHpmm4gcar+kS82jQXoJ5KStJLMGoJpJ0i8JgBGxTYWPwX4SsNo1s3DJ67djWp7TceUo
        EeYIUpb6d1OHDxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 578941331A;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kB9kFHbKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/8] drm/msm: Move module parameter 'fbdev' to fbdev code
Date:   Mon,  3 Apr 2023 14:45:36 +0200
Message-Id: <20230403124538.8497-7-tzimmermann@suse.de>
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

Define the module's parameter 'fbdev' in fbdev code. No other code
uses it. No functional changes, but simplifies the later conversion
to struct drm_client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.c   | 10 ++--------
 drivers/gpu/drm/msm/msm_fbdev.c |  7 +++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 14f4bc33b50b..4bf486f0ebb9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -63,12 +63,6 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
 };
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-static bool fbdev = true;
-MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
-module_param(fbdev, bool, 0600);
-#endif
-
 static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
@@ -242,7 +236,7 @@ static int msm_drm_uninit(struct device *dev)
 	msm_rd_debugfs_cleanup(priv);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (fbdev && ddev->fb_helper)
+	if (ddev->fb_helper)
 		msm_fbdev_free(ddev);
 #endif
 
@@ -536,7 +530,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	drm_mode_config_reset(ddev);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (kms && fbdev)
+	if (kms)
 		msm_fbdev_init(ddev);
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 0bd0cb85c538..7d205632b165 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -14,6 +14,10 @@
 #include "msm_gem.h"
 #include "msm_kms.h"
 
+static bool fbdev = true;
+MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
+module_param(fbdev, bool, 0600);
+
 /*
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
@@ -125,6 +129,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	struct drm_fb_helper *helper;
 	int ret;
 
+	if (!fbdev)
+		return NULL;
+
 	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
 	if (!helper)
 		return NULL;
-- 
2.40.0

