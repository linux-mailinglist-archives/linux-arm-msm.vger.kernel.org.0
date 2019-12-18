Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB97C123BC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfLRAsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:48:36 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35110 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfLRAsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:48:35 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so176463plt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=si3/aZxayWyxRtmbxBApJb8jBIUuiyY2NA4K59mZEjs=;
        b=I1vPcKTziCjSzpUpntR3WPkNkwwxVqSkesYgV1nXY4rDmZ+dphNINRv5omhsnvmw2m
         RNI2g/w7Z/rtDEe9IqxHx850lqY34FqBfIf9W8dBTPux2CJTFmX+xsRwg15uC80400wT
         JEXw2YJm7anCk8NrcAaJdlINcOOoeZugZtg1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=si3/aZxayWyxRtmbxBApJb8jBIUuiyY2NA4K59mZEjs=;
        b=Lm+UOjQD0hWVq0029u70rSeb5/CH6BqpGaIPdidih1iSOB1CGZihHb8bSYs8qwVQ+v
         R5/+wXiIi3Y8w3qVtb0TFhyA/Ln41qujbU1s/1DypEINTaFJ9r+gaKqLdQQT3kkMKCbF
         IznvFJhvWgYgLDgNdqVcungAXNxqjty7pynZ2x7A8ZGKBRdcRLV2iTobKFjTahuRiCdJ
         uqHMwqfW3mMkmTOSgsH23rQKusnwcg+C0wNCw8e/+pTdlmseslNXUOmey/zC3s0B36VP
         RpzFY1q4gHyaz9bviLBCXn9anD43UPSsKQOI6zvVAQroLiAl4Hqo7DMfoUpI2JsAa8Yc
         keow==
X-Gm-Message-State: APjAAAWQdVloUj5AGMf03Nz/ysa8StmfC+Z+LrH3TPhcRLmERm9IJBeM
        H68z38ppgUQ/tgHoclht4VNrqA==
X-Google-Smtp-Source: APXvYqyU+DrDIYXKwJopWVnTcJrTm9iCZXee/CEelL/zaVEx5zgQtVdaftfoj2XLFYZuI3Dh1fO9kg==
X-Received: by 2002:a17:90a:cb83:: with SMTP id a3mr220788pju.80.1576630113475;
        Tue, 17 Dec 2019 16:48:33 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 16:48:32 -0800 (PST)
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
Subject: [PATCH v2 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
Date:   Tue, 17 Dec 2019 16:47:38 -0800
Message-Id: <20191217164702.v2.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current bridge driver always forced us to use 24 bits per pixel
over the DP link.  This is a waste if you are hooked up to a panel
that only supports 6 bits per color or fewer, since in that case you
ran run at 18 bits per pixel and thus end up at a lower DP clock rate.

Let's support this.

While at it, let's clean up the math in the function to avoid rounding
errors (and round in the correct direction when we have to round).
Numbers are sufficiently small (because mode->clock is in kHz) that we
don't need to worry about integer overflow.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0fc9e97b2d98..d5990a0947b9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -51,6 +51,7 @@
 #define SN_ENH_FRAME_REG			0x5A
 #define  VSTREAM_ENABLE				BIT(3)
 #define SN_DATA_FORMAT_REG			0x5B
+#define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
 #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
@@ -436,6 +437,14 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
+static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
+{
+	if (pdata->connector.display_info.bpc <= 6)
+		return 18;
+	else
+		return 24;
+}
+
 /**
  * LUT index corresponds to register value and
  * LUT values corresponds to dp data rate supported
@@ -447,21 +456,17 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 
 static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 {
-	unsigned int bit_rate_mhz, dp_rate_mhz;
+	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
-	/*
-	 * Calculate minimum bit rate based on our pixel clock.  At
-	 * the moment this driver never sets the DP_18BPP_EN bit in
-	 * register 0x5b so we hardcode 24bpp.
-	 */
-	bit_rate_mhz = (mode->clock / 1000) * 24;
+	/* Calculate minimum bit rate based on our pixel clock. */
+	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
-	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
-							DP_CLK_FUDGE_DEN;
+	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
+				   1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
 
 	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
@@ -550,6 +555,10 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	/* Set the DP output format (18 bpp or 24 bpp) */
+	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
+
 	/* DP lane config */
 	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
-- 
2.24.1.735.g03f4e72817-goog

