Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5704C123BDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfLRAsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:48:30 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45911 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfLRAsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:48:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so155232pls.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKlZciW9yOoB1QLny3nToWkbcoT8cQoB81Y4h8hlUVc=;
        b=YG4gnKrP5+2eK4VZjU0zn2nYWPimDMpdSKDWwAmvsQX8+Jrn4q2KxwIYHgPdfTPN/6
         of5M88oWW4el8iKa2j/zCqHvSgw831J5SkREWH6snahmo7A2k30ihmqBgF2Gn711zM2A
         og4lWOI4ARBCR77vMCd6rsZNQeYXf/3UumUJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKlZciW9yOoB1QLny3nToWkbcoT8cQoB81Y4h8hlUVc=;
        b=QWIGlsmJa5LrjMNSd1ednhQeZXJLGhjMulOew692Hm33RtHPhEA6PjRLFBUVBQKdBN
         XwGTnl9KGtooe+Ee5rBqOSMc+TpbFchFc2oSpREVwQYaQom2PQ5OeU45SMc6zXB2/w2V
         XCIKafzPyHFoVWB+a9oWovvG3Lhrj2JOmRmEi8nQhdqNbGBNaa5NcfdKhLVyLrpFf77y
         dLCcq80RWod9iZGENHGjkBY3739j9KugWiCcfWNRQCkw5KFLcBndCMQKBZTAn3hJpoog
         hp3LRG016BNxPSgSSXg3DoQrUHi+waKnhkEhLUZdLpP/JbjYu0gKlYE+ZL8DPZf66paQ
         6FQA==
X-Gm-Message-State: APjAAAUNR+EMuXAmpOGIcj6BQ2ART2KBgj+F+npq9SS8KnFhGYXiQQJk
        qTPpDFhghwSXoGZm/2bFbYjBqA==
X-Google-Smtp-Source: APXvYqxQrZdh4gpi+ultOK6NhNRHPUWMeGgRMSWtjmGbsFLrNoEhqj7uQvNV/gp+6aTDA1/pXmYRcQ==
X-Received: by 2002:a17:90a:5217:: with SMTP id v23mr155234pjh.121.1576630109410;
        Tue, 17 Dec 2019 16:48:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 16:48:28 -0800 (PST)
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
Subject: [PATCH v2 3/9] drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
Date:   Tue, 17 Dec 2019 16:47:35 -0800
Message-Id: <20191217164702.v2.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ti-sn65dsi86 is a bridge from MIPI to DP and thus has two links:
the MIPI link and the DP link.  The two links do not need to have the
same format or number of lanes.  Stop using MIPI variables when
talking about the DP link.

This has zero functional change because:
* currently we are hardcoding the MIPI link as unpacked RGB888 which
  requires 24 bits and currently we are not changing the DP link rate
  from the bridge's default of 8 bits per pixel.
* currently we are hardcoding both the MIPI and DP as being 4 lanes.

This is all in prep for fixing some of the above.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 7b596af265e4..ab644baaf90c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -100,6 +100,7 @@ struct ti_sn_bridge {
 	struct drm_panel		*panel;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
+	int				dp_lanes;
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -313,6 +314,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 	}
 
 	/* TODO: setting to 4 lanes always for now */
+	pdata->dp_lanes = 4;
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
@@ -451,13 +453,17 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
-	/* set DSIA clk frequency */
-	bit_rate_mhz = (mode->clock / 1000) *
-			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	/*
+	 * Calculate minimum bit rate based on our pixel clock.  At
+	 * the moment this driver never sets the DP_18BPP_EN bit in
+	 * register 0x5b so we hardcode 24bpp.
+	 */
+	bit_rate_mhz = (mode->clock / 1000) * 24;
 
-	/* set DP data rate */
-	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
+	/* Calculate minimum DP data rate, taking 80% as per DP spec */
+	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
+
 	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
@@ -517,7 +523,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   CHA_DSI_LANES_MASK, val);
 
 	/* DP lane config */
-	val = DP_NUM_LANES(pdata->dsi->lanes - 1);
+	val = DP_NUM_LANES(pdata->dp_lanes - 1);
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-- 
2.24.1.735.g03f4e72817-goog

