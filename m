Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9568D430497
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbhJPTUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:20:21 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:53696 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240894AbhJPTUV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409817; bh=rwTF5+9x+ye/AXjZbx/MNNkZB6C1fknU5OsMIO6dc6Y=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=Er32Ekk9v/dXLgySNTU+obfJQJHRSRXFSUKDkHVgR2uKII367FeMcWBDYGQY37pOc
         MHe6bXDyqBrmlKC4zb9bv4D0jhczax5iTAFzzll+NRBMo7GaWd47a4ZBhJk8uUUHs9
         qNQRCzAMyT8nI8xdQP30FAyW+Vp5evDsj9tSdjKk=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:36 +0200 (CEST)
X-EA-Auth: WnARczOEgryUYsklIfGx/VsanIDi9S5emLUlMK7j8vIvK1XEHEj1/ZNQZczjPJ8se8LRy+w+9hCoGHaCadzpH3mkgC1RbRvf
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
Subject: [PATCH v2 09/13] drm/sti: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:22 +0200
Message-Id: <20211016184226.3862-10-cssk@net-c.es>
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
 drivers/gpu/drm/sti/sti_hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f3ace11209dd..3f8b04a1407e 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -984,14 +984,16 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto fail;
 
-	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-	DRM_DEBUG_KMS("%s : %dx%d cm\n",
-		      (hdmi->hdmi_monitor ? "hdmi monitor" : "dvi monitor"),
-		      edid->width_cm, edid->height_cm);
 	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
 
 	count = drm_add_edid_modes(connector, edid);
+
+	/* This updates connector->display_info */
 	drm_connector_update_edid_property(connector, edid);
+	hdmi->hdmi_monitor = connector->display_info.is_hdmi;
+	DRM_DEBUG_KMS("%s : %dx%d cm\n",
+		      (hdmi->hdmi_monitor ? "hdmi monitor" : "dvi monitor"),
+		      edid->width_cm, edid->height_cm);
 
 	kfree(edid);
 	return count;
-- 
2.33.0


