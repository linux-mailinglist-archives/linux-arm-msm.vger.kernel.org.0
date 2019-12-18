Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0849123BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfLRAs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:48:58 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:34533 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfLRAsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:48:32 -0500
Received: by mail-pj1-f67.google.com with SMTP id s94so539668pjc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5I5RsOjGn6AIw10awvPPmKNOIBhCgMn63qgGQLogkT0=;
        b=Z/kLD0eoZedWUdTEDSVJ6kbPawHJOoiVPCNRGbgQQgKOAw7fzhYDSK3K02mAbNdlQq
         Fr0oNSrqzR9oqMNnsCr8ULdLH02KZAFfz2cypDlJkWrPbgZ+koWO0EFsgvgaya0R9qXw
         ZlvpV3CLhTTS4eAvXf4/9iFbM0UzmmsU5A7t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5I5RsOjGn6AIw10awvPPmKNOIBhCgMn63qgGQLogkT0=;
        b=k5BCig3RKMCt2diV+qpGFt6WUt6pI/aVWAlXOWF/GAay72bdBHeqkNZ8f6WeT3CNU5
         BwaStFG59csmg0WtcXEqnsK0vf62TH6V8tysGbSP6nwz6MdI6IkGYbab/4AR1IKinu4l
         wDgdxfrvT5QC0oGXYIMXZ6HKcc1YI5RJAvw4GoQDxJDK6SsC7Mf5lcHhYdEbHr5OGHAk
         /l6QiaiTEGKzw08ZPBKQhQjG96TSTzMknEAcKcTbkOG0etchjWVOHr3PlVz9pz+MwnES
         2PwGUjbA9sDoenhn5xu148gc0iCPs75ACnvWamLXd1q3cpecjNpxMaWkup7qYMpVtFYs
         XDag==
X-Gm-Message-State: APjAAAVU+EUQzLGUCMjTlMykQ2O6dkbXJEMAuc25s+8yH+9iwvxof3ov
        N3R4smN0GF6tofIjp7RWOrNyJw==
X-Google-Smtp-Source: APXvYqzlYuY6Q06NylLwmoyVjvz5Q+yRFHQQVef1ISO7bP+Gy7Ho4kEkiZtVedpDN3oy9tmnzGorAg==
X-Received: by 2002:a17:902:9302:: with SMTP id bc2mr1101734plb.148.1576630112269;
        Tue, 17 Dec 2019 16:48:32 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 16:48:31 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, seanpaul@chromium.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 5/9] drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
Date:   Tue, 17 Dec 2019 16:47:37 -0800
Message-Id: <20191217164702.v2.5.Idbd0051d0de53f7e9d18a291ea33011c0854fcc6@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At least one panel hooked up to the bridge (AUO B116XAK01) only
supports 1 lane of DP.  Let's read this information and stop
hardcoding 4 DP lanes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d55d19759796..0fc9e97b2d98 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -313,8 +313,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 		goto err_dsi_host;
 	}
 
-	/* TODO: setting to 4 lanes always for now */
-	pdata->dp_lanes = 4;
+	/* TODO: setting to 4 MIPI lanes always for now */
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
@@ -511,12 +510,41 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
 	usleep_range(10000, 10500); /* 10ms delay recommended by spec */
 }
 
+static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
+{
+	u8 data;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, &data);
+	if (ret != 1) {
+		DRM_DEV_ERROR(pdata->dev,
+			      "Can't read lane count (%d); assuming 4\n", ret);
+		return 4;
+	}
+
+	return data & DP_LANE_COUNT_MASK;
+}
+
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 	unsigned int val;
 	int ret;
 
+	/*
+	 * Run with the maximum number of lanes that the DP sink supports.
+	 *
+	 * Depending use cases, we might want to revisit this later because:
+	 * - It's plausible that someone may have run fewer lines to the
+	 *   sink than the sink actually supports, assuming that the lines
+	 *   will just be driven at a higher rate.
+	 * - The DP spec seems to indicate that it's more important to minimize
+	 *   the number of lanes than the link rate.
+	 *
+	 * If we do revisit, it would be important to measure the power impact.
+	 */
+	pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
+
 	/* DSI_A lane config */
 	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
-- 
2.24.1.735.g03f4e72817-goog

