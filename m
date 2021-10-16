Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBB3430475
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240670AbhJPTTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:19:36 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:51892 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhJPTTg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409786; bh=6xsMxrnlNAEGEZg8rndfdmRmdX7OzFdxIK93N1Vj41A=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=PC2arG0iCmgN9npSiZyfe1uXZp3wuUf7cXpxdOml6WnORNv9CU98c7+me5rp2BPB5
         qPSbk04EHsbYLMo9aM8PaHZ0q6XdZ2GUH85nQUQdFIna0N3VovbJ/7auPhuwReg1DT
         remxd9D7jwfIcXwupesqoA5854muAhoQy4CCVKm8=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:06 +0200 (CEST)
X-EA-Auth: zdke9kpqLbMJIvo6khoMzB9zFloV/UNCB4tBlpT2RLT4oBLt+Cye6DSWBrqSv1I5fHSGkM4ym6zzQ6PnR7B/mDnuah9YPqjU
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
Subject: [PATCH v2 04/13] drm/tegra: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:17 +0200
Message-Id: <20211016184226.3862-5-cssk@net-c.es>
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
 drivers/gpu/drm/tegra/hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..21571221b49b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -831,14 +831,10 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
-	struct edid *edid;
-
 	if (!output->connector.edid_blob_ptr)
 		return false;
 
-	edid = (struct edid *)output->connector.edid_blob_ptr->data;
-
-	return drm_detect_hdmi_monitor(edid);
+	return output->connector.display_info.is_hdmi;
 }
 
 static enum drm_connector_status
-- 
2.33.0



