Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB234304B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240919AbhJPTUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:20:47 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:53752 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240944AbhJPTUp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409817; bh=ZmCRcmXfOn4brch3sFsuOuXp9yHp219e3PYR0mVapZM=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=rljxmyj0IrzWjJEZhtHkuZ5kKfyDeKlD2uPtd0sZ5b8xYuXy8yFNMSY/sTJFdIciy
         cTJ4G5MWFK7WsnC/M+h+OE4jDJn4o60mSnKW5stzmme9KeLcYpvtJeUEc3jYjLJJFU
         nE6iF+Zlu+eDNaM/eM2d5hgF8uPwvXCSYczoFeq8=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:34 +0200 (CEST)
X-EA-Auth: IbIiNW/0NCb1fjsuAO9oo//00h6X9/vtgHnLMRK0Dh+QuhMgo9s3GIoWiwDVwcp8NHt0WzykDFkyFO31LEaRnzjiuVzewoCp
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
Subject: [PATCH v2 08/13] drm/sun4i: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:21 +0200
Message-Id: <20211016184226.3862-9-cssk@net-c.es>
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 2f2c9f0a1071..f57bedbbeeb8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -215,11 +215,11 @@ static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return 0;
 
-	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
+	drm_connector_update_edid_property(connector, edid);
+	hdmi->hdmi_monitor = connector->display_info.is_hdmi;
 	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
 			 hdmi->hdmi_monitor ? "an HDMI" : "a DVI");
 
-	drm_connector_update_edid_property(connector, edid);
 	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
-- 
2.33.0


