Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E352442EB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 14:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhKBNDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 09:03:09 -0400
Received: from ip-15.mailobj.net ([213.182.54.15]:38962 "EHLO msg-4.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230128AbhKBNDJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 09:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1635858027; bh=KZE5be4kZ78AY9HnD875H39rS7AY7Po+gyBhLbeR+7Q=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=gLPzDJ2Zt52jpaCdwkiNzcp7JRczDHs6DAzPfjQOmpW7xHavFW/ZqF+2X4AT7w0y/
         1DCTS+5mmrc0FzHCKnk5vXz3F0cG7Zy1lx+yJ9+2mFtL99bsA2gi8LCN18hRzZEeT6
         vz6lFJECZyw3qmw9Cna4dfiDWsZBWaTEOcmvpuf0=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Tue,  2 Nov 2021 14:00:27 +0100 (CET)
X-EA-Auth: kyKYQi70H6EL66+AI7uvNmj5oUg5Z6PG/JpYJTFXfoSMem1EG/HqbLnQ7tSwzwE8WKzJ1Hb3lnp7YzkeWlRV97PALCV7FQLV
Date:   Tue, 2 Nov 2021 14:00:24 +0100
From:   Claudio Suarez <cssk@net-c.es>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YYE2aLJeUSx1lk/J@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es>
 <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain>
 <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa>
 <YXKoMEF/gU98cL9n@intel.com>
 <YXKtIUDk+f2Bnn++@intel.com>
 <YXXbgWNHts9CMJXD@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXXbgWNHts9CMJXD@gineta.localdomain>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit a92d083d08b0 created the new flag is_hdmi in drm_display_info
which is set when sink compliant with CEA-861 (EDID) will be treated
as an HDMI sink.

From that day, this value can be used in some cases instead of
calling drm_detect_hdmi_monitor() and a second parse is avoided
because drm_detect_hdmi_monitor() parses. A TODO task was
registered in Documentation/gpu/todo.rst to perform that task in
the future.

The flag drm_display_info.is_hdmi is set in the function
drm_add_display_info(), which is called from
drm_connector_update_edid_property(). Since commit 5186421cbfe2,
drm_get_edid() calls drm_connector_update_edid_property() when
reading the edid data from an i2c adapter. Therefore, in these
cases drm_display_info.is_hdmi is updated to its correct
value when returning from drm_get_edid().

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
in the cases when drm_detect_hdmi_monitor() is called after a
read from an i2c adapter using drm_get_edid() in the i915 driver.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b04685bb6439..008e5b0ba408 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	to_intel_connector(connector)->detect_edid = edid;
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
-		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
+		intel_hdmi->has_hdmi_sink = connector->display_info.is_hdmi;
 
 		connected = true;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 6cb27599ea03..b4065e4df644 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			if (intel_sdvo_connector->is_hdmi) {
-				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
+				intel_sdvo->has_hdmi_monitor =
+							    connector->display_info.is_hdmi;
 			}
 		} else
 			status = connector_status_disconnected;
-- 
2.33.0



