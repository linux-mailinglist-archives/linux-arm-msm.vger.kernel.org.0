Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF706CFD0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjC3Hlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjC3Hly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:41:54 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CC144A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:41:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E7E6721B01;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680162111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sqn+2z7EyTf7nLrUP9hk+hPnBxXhVceTrbTzbVoeGag=;
        b=GIxWZRcC4uZTDremJzF5frTCOnmYarsxDVzhv7TuEmoB7zlifIZA7v7Oa+NxL9IlZx7B3p
        9s5O9HX/9oHZHu72/cKnHVbHr493TWB6fy/86HgEkSKMZ3UM1Ixzqm8olI7HJzIWsIdb52
        RXEpas4UyBb++/nE1WjpslaIQW9VSPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680162111;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sqn+2z7EyTf7nLrUP9hk+hPnBxXhVceTrbTzbVoeGag=;
        b=ogd3bO968HyHGUVriFjZdxrensTQqlTI7ka913cso5M740hjERn4e9p9Bktio9ACt3tM4n
        GL7RxHYLZ1kltYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B27611390D;
        Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kPG3Kj89JWSZfQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:51 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/6] drm/msm: Clear aperture ownership outside of fbdev code
Date:   Thu, 30 Mar 2023 09:41:44 +0200
Message-Id: <20230330074150.7637-2-tzimmermann@suse.de>
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

Move aperture management out of the fbdev code. It is unrelated
and needs to run even if fbdev support has been disabled. Call
the helper at the top of msm_drm_init() to take over hardware
from other drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
 drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index aca48c868c14..5211140ec50b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -411,6 +412,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
 
+	/* the fw fb could be anywhere in memory */
+	ret = drm_aperture_remove_framebuffers(false, drv);
+	if (ret)
+		return ret;
+
 	ddev = drm_dev_alloc(drv, dev);
 	if (IS_ERR(ddev)) {
 		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index d26aa52217ce..fc7d0406a9f9 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -4,7 +4,6 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -154,11 +153,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(false, dev->driver);
-	if (ret)
-		goto fini;
-
 	ret = drm_fb_helper_initial_config(helper);
 	if (ret)
 		goto fini;
-- 
2.40.0

