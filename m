Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317B043047B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbhJPTTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:19:54 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:53638 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhJPTTy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409871; bh=N1FC6bbFpWwj5uck3C6Zh9AXCf70UfpiuPwfacUawG4=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=FLOaxtDKxrOCwaN2JUieLWpNeRShro/11cgee3OVr3lIP5s4CTt9MXuXvaYj36UA5
         0/snJ6pYPwHtaIjUJxCOJuz26rFBNFNrGOBnOdHR0Um1T1AxOWFJaDGavf3Rx2BWIZ
         h5DYJy1YTumxpWNOlRIaRqlUzRA6RKfyZ482Ph9w=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:41 +0200 (CEST)
X-EA-Auth: 1mwmR8XS1gsbmKJszXM4LJ28aURnXGIiZWNfGxwQ0dQwNiPmg9b5MpRHrpcm8447xbI+VC+IOpuWtCLJ5eqq3Zopng2hk4C8
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
Subject: [PATCH v2 11/13] drm/bridge: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:24 +0200
Message-Id: <20211016184226.3862-12-cssk@net-c.es>
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
drm_display_info.is_hdmi where possible

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 drivers/gpu/drm/bridge/sii902x.c             | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..f6891280a58d 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -617,7 +617,7 @@ static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
 		__adv7511_power_off(adv7511);
 
 	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-			       drm_detect_hdmi_monitor(edid));
+			       connector->display_info.is_hdmi);
 
 	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 89558e581530..5719be0a03c7 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -283,7 +283,7 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
-		if (drm_detect_hdmi_monitor(edid))
+		if (connector->display_info.is_hdmi)
 			output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
 
 		num = drm_add_edid_modes(connector, edid);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f08d0fded61f..33f0afb6b646 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2359,7 +2359,7 @@ static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
 	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
 		edid->width_cm, edid->height_cm);
 
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
+	hdmi->sink_is_hdmi = connector->display_info.is_hdmi;
 	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 
 	return edid;
-- 
2.33.0


