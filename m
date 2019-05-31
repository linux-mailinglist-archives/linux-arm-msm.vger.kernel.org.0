Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C4430BFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEaJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:31 -0400
Received: from onstation.org ([52.200.56.107]:51332 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfEaJqb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:31 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9C84845030;
        Fri, 31 May 2019 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295990;
        bh=9mBVVbn6rJsZy3fk3p9FSUaxsGo48y0RAmTTrzWO82g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NLun37JEBXaEPY4tbpCr4z5g4gUmHWgCzVBa/PJomsrorYAWg3sotdASS0swFFYaW
         30uzbgKecI2s+U/RRHzphnoHfKKLb2w4NP9li1KkNrBIVIq/ubXVrqpTV7oTfkFNDa
         8JbvdxuXYmNsTLPNabgIj0hB4VniTWnae5HWvWlU=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 1/6] drm/msm: add dirty framebuffer helper
Date:   Fri, 31 May 2019 05:46:14 -0400
Message-Id: <20190531094619.31704-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use drm_atomic_helper_dirtyfb() as the dirty callback in the
msm_framebuffer_funcs struct. Call drm_plane_enable_fb_damage_clips()
when the planes are initialized in mdp4, mdp5, and dpu1.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c  | 3 +++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
 drivers/gpu/drm/msm/msm_fb.c               | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d831cedb55ec..2ea42f50401f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -21,6 +21,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_atomic_uapi.h>
 
 #include "msm_drv.h"
@@ -1535,6 +1536,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
+	drm_plane_enable_fb_damage_clips(plane);
+
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 005066f7154d..2d46d1126283 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -15,6 +15,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <drm/drm_damage_helper.h>
 #include "mdp4_kms.h"
 
 #define DOWN_SCALE_MAX	8
@@ -391,6 +392,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 
 	mdp4_plane_install_properties(plane, &plane->base);
 
+	drm_plane_enable_fb_damage_clips(plane);
+
 	return plane;
 
 fail:
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9d9fb6c5fd68..9a9ae44655b4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -16,6 +16,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_print.h>
 #include "mdp5_kms.h"
 
@@ -1095,6 +1096,8 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 
 	mdp5_plane_install_properties(plane, &plane->base);
 
+	drm_plane_enable_fb_damage_clips(plane);
+
 	return plane;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 68fa2c8f61e6..a816ceb58716 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -16,6 +16,7 @@
  */
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -35,6 +36,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 	.destroy = drm_gem_fb_destroy,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.20.1

