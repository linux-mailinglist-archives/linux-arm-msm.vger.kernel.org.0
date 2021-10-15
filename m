Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9378742F0A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 14:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238769AbhJOMYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 08:24:40 -0400
Received: from ip-8.mailobj.net ([213.182.54.8]:43848 "EHLO msg-3.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238730AbhJOMYk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 08:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634297854; bh=EXkDekAufK6goeabnufaLKQbzyG9y1fY1+pkrXICOg0=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=trR0cCwk0E7f5AYxYGlukPi8aiLA98MSOI+OGdYzeIw76VbqbliTgTpjqiyHxrUs3
         tqW7FqTmOHNRialIWvv0YmRcQAGqoMelAiphnp11q/U2l+AT6kmovenU+4c1ZgbGZJ
         cYL5fIrLlIJ+UcT91uy/qFbz6KOCdnDqbKZG+660=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 15 Oct 2021 13:37:34 +0200 (CEST)
X-EA-Auth: FzfiRJoiBG/O1+TXf0H4ryZjXiL4Gihdpt7BFp6efST2EUumb9WCzcoiWHxfb1quhALH7eZIXa1z+3IqSJ0MB43ddQyGVYfM
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
Subject: [PATCH 03/15] drm/vc4: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Fri, 15 Oct 2021 13:37:01 +0200
Message-Id: <20211015113713.630119-4-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Use this value instead of calling
drm_detect_hdmi_monitor() to avoid a second parse.

This is a TODO task in Documentation/gpu/todo.rst

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b4b4653fe301..d531e4c501eb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -182,7 +182,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
+				vc4_hdmi->encoder.hdmi_monitor =
+						connector->display_info.is_hdmi;
 				kfree(edid);
 			}
 		}
@@ -212,10 +213,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
+	vc4_encoder->hdmi_monitor = connector->display_info.is_hdmi;
 	kfree(edid);
 
 	if (vc4_hdmi->disable_4kp60) {
-- 
2.33.0



