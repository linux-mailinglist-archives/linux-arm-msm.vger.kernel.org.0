Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FC2146A11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 14:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgAWN74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 08:59:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:44188 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728665AbgAWN74 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 08:59:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 127B7B354;
        Thu, 23 Jan 2020 13:59:52 +0000 (UTC)
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
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 01/22] drm: Remove internal setup of struct drm_device.vblank_disable_immediate
Date:   Thu, 23 Jan 2020 14:59:22 +0100
Message-Id: <20200123135943.24140-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBLANK interrupts can be disabled immediately or with a delay, where the
latter is the default. The former option can be selected by setting
get_vblank_timestamp and enabling vblank_disable_immediate in struct
drm_device. Simplify the code in preparation of the removal of struct
drm_device.get_vblank_timestamp.

v3:
	* remove internal setup of vblank_disable_immediate

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..326db52f2ad8 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -480,19 +480,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
 
-	/* Driver specific high-precision vblank timestamping supported? */
-	if (dev->driver->get_vblank_timestamp)
-		DRM_INFO("Driver supports precise vblank timestamp query.\n");
-	else
-		DRM_INFO("No driver support for vblank timestamp query.\n");
-
-	/* Must have precise timestamping for reliable vblank instant disable */
-	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp) {
-		dev->vblank_disable_immediate = false;
-		DRM_INFO("Setting vblank_disable_immediate to false because "
-			 "get_vblank_timestamp == NULL\n");
-	}
-
 	return 0;
 
 err:
-- 
2.24.1

