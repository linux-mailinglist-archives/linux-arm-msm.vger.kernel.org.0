Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62D92146A26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 15:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAWOAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 09:00:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:44520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728900AbgAWOAE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 09:00:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 45644B283;
        Thu, 23 Jan 2020 14:00:03 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 18/22] drm/vc4: Convert to CRTC VBLANK callbacks
Date:   Thu, 23 Jan 2020 14:59:39 +0100
Message-Id: <20200123135943.24140-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert vc4 over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 +
 drivers/gpu/drm/vc4/vc4_drv.c  | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f1e7597ea17e..1208258ad3b2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1031,6 +1031,7 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.gamma_set = drm_atomic_helper_legacy_gamma_set,
 	.enable_vblank = vc4_enable_vblank,
 	.disable_vblank = vc4_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index e6982a7b0c5e..76f93b662766 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -190,8 +190,6 @@ static struct drm_driver vc4_drm_driver = {
 	.irq_postinstall = vc4_irq_postinstall,
 	.irq_uninstall = vc4_irq_uninstall,
 
-	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = vc4_debugfs_init,
 #endif
-- 
2.24.1

