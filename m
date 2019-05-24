Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA1F829FE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 22:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404154AbfEXU3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 16:29:22 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:46981 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404104AbfEXU3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 16:29:22 -0400
Received: by mail-yw1-f65.google.com with SMTP id a130so4098320ywe.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2019 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2ELsUk5RigKbXs7v0mo3vG/aBHd4zdn0FsdaHEKk18=;
        b=VrBGa884upuPpxxrR3rFCWPSDyhTYoDYb39LqTQLOjjfaHJTglKZ3WwVJOGsSjQeXh
         tE7HKZp+uvxd9CMKk3J0Ix6anvhbV6Xz0PkKnuYM96+7KBb1eG7I0pqSlAm1l+MPN7Xf
         qbM1vVk5WAtxR37M+9pHvolO4k06NJn3zyprLDgNf2GE0hn5yDqx3ojAVDgmFpdp4bQw
         gXfVRaJAn2Pf9PNpU55FVq9gUhquejhXY78Y0os+b2YSFLRu33F0xD7BM6kX3Pk0ANP2
         P5jcM+HcFF2iZ9WNL/ruQsZBfSxyHqU7yN7cZDgIkexXoAqE+XcR/GBUV6nNf4/pPp2z
         mLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2ELsUk5RigKbXs7v0mo3vG/aBHd4zdn0FsdaHEKk18=;
        b=AHKe0M0qiznz0tZX7qyKNijm40alk0cUgyD4q6S2NpbehTFeYFz36CE0SLVU3p2HRv
         rmySEl3lmUpfhYWHw16mtORQY5NDKlJ/9b3bVo5x/stwf3e+0Tgm2qPcaJ8BD0dqfFOQ
         N37CsWojLZyC9kH7Pt9x30g9e1sg/nnqx1d6Ad24mi4Op/0vlzte+aDsYyuTSNVg7SAr
         x6wY+x3xbC2AkEv9VteUXze1PzN1SoWDscL+BbcEHFEQ7juVZ8zYSMfXEQj7sPDoUWD7
         OZdlVPAOp10pkuj4p6t3MLIoYrol1a5B4NgPJKX1DscRNVV/JqAzSciz3Ub/hvXH9m+0
         k8bw==
X-Gm-Message-State: APjAAAVR/CTvvu64D5sieO8X/b42Q/vRoZR1HjtaS8iV64/UPPV3SEkN
        K3CljbChk5PysLtaDJF86Zy41w==
X-Google-Smtp-Source: APXvYqxjH+mJbEbFJxzZxGrWUHPRyOR+Ke2+ux9+XDNzM37Gpre/xYmMibmp0/Ave/On3ss5xe+/Bw==
X-Received: by 2002:a81:2245:: with SMTP id i66mr47857690ywi.307.1558729761162;
        Fri, 24 May 2019 13:29:21 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id m185sm891987ywf.38.2019.05.24.13.29.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 13:29:20 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: Re-order uninit function to work during probe defer
Date:   Fri, 24 May 2019 16:29:13 -0400
Message-Id: <20190524202919.179289-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

If bind fails, we can call msm_drm_uninit before kms elements have been
created. In this case, drm_atomic_helper_shutdown will fail since there
are no drm objects. Only call drm unregistration and shutdown if drm is
registered.

Also while we're in here move the workqueue destruction to below
component_unbind since components could be actively using the wq during
uninit or in their unbind routine.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 31deb87abfc6..9f16a995ed42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -259,13 +259,24 @@ static int msm_drm_uninit(struct device *dev)
 	struct msm_mdss *mdss = priv->mdss;
 	int i;
 
+	/*
+	 * Shutdown the hw if we're far enough along where things might be on.
+	 * If we run this too early, we'll end up panicking in any variety of
+	 * places. Since we don't register the drm device until late in
+	 * msm_drm_init, drm_dev->registered is used as an indicator that the
+	 * shutdown will be successful.
+	 */
+	if (ddev->registered) {
+		drm_dev_unregister(ddev);
+		drm_atomic_helper_shutdown(ddev);
+	}
+
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before drm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
 	 */
 
 	flush_workqueue(priv->wq);
-	destroy_workqueue(priv->wq);
 
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
@@ -279,8 +290,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	drm_dev_unregister(ddev);
-
 	msm_perf_debugfs_cleanup(priv);
 	msm_rd_debugfs_cleanup(priv);
 
@@ -288,7 +297,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (fbdev && priv->fbdev)
 		msm_fbdev_free(ddev);
 #endif
-	drm_atomic_helper_shutdown(ddev);
+
 	drm_mode_config_cleanup(ddev);
 
 	pm_runtime_get_sync(dev);
@@ -313,6 +322,7 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
+	destroy_workqueue(priv->wq);
 	kfree(priv);
 
 	return 0;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

