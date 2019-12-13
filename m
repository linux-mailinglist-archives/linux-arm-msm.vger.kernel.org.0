Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2727011EEBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 00:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfLMXqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 18:46:08 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45269 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfLMXqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 18:46:08 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so229892pgk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 15:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Ve4LMGBgan+F8VZipmKjjix5j1MoppRCjBAaqc2gpE=;
        b=RRbRwgBiDBHRW2GR/MOwzVGUgQELNYjduuux7ac+ai8K079MsvEkqbNHZ+XhO4+zUS
         Z2jnz7vhwVep544DeCJyd6nNMPL3X87C94ruUuVUYEcDVliAlRLly1tgJGUX1+/IPheI
         u1xgFGC7DtCX6ChZeaggPTX3cY47hqaNzs9XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Ve4LMGBgan+F8VZipmKjjix5j1MoppRCjBAaqc2gpE=;
        b=q5uIII9keOg36oMl6stt8L1ur7uQ5xjW7w+ASl0/sapR/Njq1KZqu5uKwVuOJrpxq/
         op2qlHznpdyhHvWZOwH6suSX8/ErdJ9y7NrcmsaP48ABoya6avYH8Ye7qhoQIXwOoM8w
         DdoUw2uxhPsUQvGGI4Z/P/mOL47gNggzTu7HAtzJ5PdAAkvLQLZs8dNZd0jtpySq5VBF
         PB+es3sbWLro04tfkSASa48NaUvyn6FhHoX+Jnfk/H+UKzRi9WR53Q8LQkqk8vhu4Oo+
         u8LWl7YnYyjCfiPnUu/5hiJYLmflzMAm8HFoSdFpJi+K8PSP0T9KxPiZpQtk9bVKlRa3
         dgSA==
X-Gm-Message-State: APjAAAUrzg2uVzgk8oAU3C7giDzQE54Y8OMMUy+nxaoR0fVTmrTfetIK
        3mbS5pNXFj4dGTESRzlqm9gTFQ==
X-Google-Smtp-Source: APXvYqxO0d9p2M8qFnt6mqa6LtLZ5HJZK6HH0joHpvkGPX0B+IxH8OZBSzCB+ugzc3JO9EngFiHocQ==
X-Received: by 2002:aa7:9839:: with SMTP id q25mr2409112pfl.161.1576280767575;
        Fri, 13 Dec 2019 15:46:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:46:07 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/9] drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
Date:   Fri, 13 Dec 2019 15:45:24 -0800
Message-Id: <20191213154448.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
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
---

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

