Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C91B42F079
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 14:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238749AbhJOMXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 08:23:22 -0400
Received: from ip-8.mailobj.net ([213.182.54.8]:43740 "EHLO msg-3.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238748AbhJOMXW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 08:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634297913; bh=zROZ5t1FiQl6m7iqtJ/AW4sPBpIU6ZAMfQADZLWZ7+g=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=WqLqSD3kuPiZR92onkkfakBivfCLi24VmanHOvDQMxSFB0CKO26yo8d303L13OUqm
         8w3YoBYBChfP0Q1wHL6nFemEWQ42rKvtpWcXAAmX4JX0P0RnI2YkjpgVEj1Wz40dBK
         3ZYMIPX1+DhUjT9W/OTebYpfuh0mS9a3q1mEMUnY=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 15 Oct 2021 13:38:32 +0200 (CEST)
X-EA-Auth: RnI/jvREmrkuPQGsBmzlIch1CX9MOuV5EW0Uey6UCXOxVz6uSVtWljP+Wb5sDpGVvNDHCCkX9JR+/ehhUml4/JiOrFUKRz42
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
Subject: [PATCH 11/15] drm/zte: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Fri, 15 Oct 2021 13:37:09 +0200
Message-Id: <20211015113713.630119-12-cssk@net-c.es>
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
 drivers/gpu/drm/zte/zx_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index cd79ca0a92a9..7df682d90723 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -265,9 +265,9 @@ static int zx_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return 0;
 
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 	drm_connector_update_edid_property(connector, edid);
+	hdmi->sink_is_hdmi = connector->display_info.is_hdmi;
+	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
-- 
2.33.0


