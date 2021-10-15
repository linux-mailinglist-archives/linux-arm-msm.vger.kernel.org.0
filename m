Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C102242F06C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 14:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238740AbhJOMW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 08:22:58 -0400
Received: from ip-16.mailobj.net ([213.182.54.16]:45680 "EHLO msg-6.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238683AbhJOMW6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 08:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634297970; bh=0RCef2c/0z8Xou8hnnbMAxQ5ccP8Kcw0a2QdzLGngUY=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=N2A4cnBQdM/+ag5iVAEqFQrQW5X170ALpzQm6Ri9QKnmQnU/yF2pdfumlRvwx7qKU
         oTPKQeMhar6bliCaK41MBZ2Bv/WUESMpw0sdRW7jpNwTfgYfchjEUmurFQc//cgkQq
         PGNgI0RAlg8glxbE11VB22fNnSRzKs1B6ehWlrKk=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 15 Oct 2021 13:38:59 +0200 (CEST)
X-EA-Auth: oQJsqlKKU+Ee2xFaVThnqrBkDGJDLzAYqbWMI2GZs2IdBiEvZ4TEnMSj9XRtXYK6c1OAOLv0ERJ4V6YIrD5VNTQjnQ1NCtR4
From:   Claudio Suarez <cssk@net-c.es>
To:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc:     Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 14/15] drm/nouveau: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Fri, 15 Oct 2021 13:37:12 +0200
Message-Id: <20211015113713.630119-15-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h | 6 ++++++
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..fadd58b015d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -844,7 +844,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	int ret;
 	int size;
 
-	if (!drm_detect_hdmi_monitor(nv_connector->edid))
+	if (nouveau_connector_is_hdmi_monitor(&nv_connector->base))
 		return;
 
 	hdmi = &nv_connector->base.display_info.hdmi;
@@ -1745,7 +1745,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			 */
 			if (mode->clock >= 165000 &&
 			    nv_encoder->dcb->duallink_possible &&
-			    !drm_detect_hdmi_monitor(nv_connector->edid))
+			    !nouveau_connector_is_hdmi_monitor(&nv_connector->base))
 				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
 		} else {
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index d66f97280282..0a138bfb8f32 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
 	struct drm_display_mode *omode = &asyh->state.adjusted_mode;
 	struct drm_display_mode *umode = &asyh->state.mode;
 	int mode = asyc->scaler.mode;
-	struct edid *edid;
 	int umode_vdisplay, omode_hdisplay, omode_vdisplay;
 
-	if (connector->edid_blob_ptr)
-		edid = (struct edid *)connector->edid_blob_ptr->data;
-	else
-		edid = NULL;
-
 	if (!asyc->scaler.full) {
 		if (mode == DRM_MODE_SCALE_NONE)
 			omode = umode;
@@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
 	 */
 	if ((asyc->scaler.underscan.mode == UNDERSCAN_ON ||
 	    (asyc->scaler.underscan.mode == UNDERSCAN_AUTO &&
-	     drm_detect_hdmi_monitor(edid)))) {
+	     nouveau_connector_is_hdmi_monitor(connector)))) {
 		u32 bX = asyc->scaler.underscan.hborder;
 		u32 bY = asyc->scaler.underscan.vborder;
 		u32 r = (asyh->view.oH << 19) / asyh->view.oW;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22b83a6577eb..211543373b72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1010,7 +1010,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 	unsigned duallink_scale =
 		nouveau_duallink && nv_encoder->dcb->duallink_possible ? 2 : 1;
 
-	if (drm_detect_hdmi_monitor(nv_connector->edid)) {
+	if (nouveau_connector_is_hdmi_monitor(connector)) {
 		info = &nv_connector->base.display_info;
 		duallink_scale = 1;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 40f90e353540..299f3a3b2331 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -167,6 +167,12 @@ nouveau_connector_is_mst(struct drm_connector *connector)
 	return encoder->encoder_type == DRM_MODE_ENCODER_DPMST;
 }
 
+static inline bool
+nouveau_connector_is_hdmi_monitor(struct drm_connector *connector)
+{
+	return connector->display_info.is_hdmi;
+}
+
 #define nouveau_for_each_non_mst_connector_iter(connector, iter) \
 	drm_for_each_connector_iter(connector, iter) \
 		for_each_if(!nouveau_connector_is_mst(connector))
-- 
2.33.0


