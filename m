Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1434304A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240894AbhJPTUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:20:30 -0400
Received: from ip-15.mailobj.net ([213.182.54.15]:41688 "EHLO msg-4.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240966AbhJPTU3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409788; bh=fAZBlXdW20V7B6rubts4j3AhP0Cl8xUukv0+rRfZYFI=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=ZM7Y0GmRm9+RsKEclLVGSTr/d/ZgqfZ5Kof6c/2+cRS0MIvU35pa1Vxk9+YRlMRpb
         H8Wt6jC/NRjVTtyNtKOL8gu0XNzjuEV2NEJtqajxhx9xwjBK1JLBFSmtzktqWu8gm2
         r/C+VTX3W2AUZRU+FNfWbTbkMNspw3z5iX1ifdfY=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:08 +0200 (CEST)
X-EA-Auth: bMa72/rpZ8KA+zrHRU52NItHoBU81sC/gUx2aRv8jn8f9cT532jMh/ja7ZdIluXsIxxgfgWkRfj77mZEvqU0+BT6X67qVtWf
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
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
        ville.syrjala@linux.intel.com
Cc:     Claudio Suarez <cssk@net-c.es>
Subject: [PATCH v2 05/13] drm/gma500: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:18 +0200
Message-Id: <20211016184226.3862-6-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016184226.3862-1-cssk@net-c.es>
References: <20211016184226.3862-1-cssk@net-c.es>
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
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 3 ++-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index e525689f84f0..d9db5d52d52e 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -130,6 +130,7 @@ static enum drm_connector_status cdv_hdmi_detect(
 	struct edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
+	/* This updates connector->display_info */
 	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->adapter);
 
 	hdmi_priv->has_hdmi_sink = false;
@@ -138,7 +139,7 @@ static enum drm_connector_status cdv_hdmi_detect(
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			hdmi_priv->has_hdmi_sink =
-						drm_detect_hdmi_monitor(edid);
+						connector->display_info.is_hdmi;
 			hdmi_priv->has_hdmi_audio =
 						drm_detect_monitor_audio(edid);
 		}
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 355da2856389..5ef49d17de98 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1266,8 +1266,10 @@ psb_intel_sdvo_hdmi_sink_detect(struct drm_connector *connector)
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			if (psb_intel_sdvo->is_hdmi) {
-				psb_intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
-				psb_intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
+				psb_intel_sdvo->has_hdmi_monitor =
+						connector->display_info.is_hdmi;
+				psb_intel_sdvo->has_hdmi_audio =
+						drm_detect_monitor_audio(edid);
 			}
 		} else
 			status = connector_status_disconnected;
-- 
2.33.0



