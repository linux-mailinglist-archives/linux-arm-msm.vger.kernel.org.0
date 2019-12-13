Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88BF11EEB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 00:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfLMXqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 18:46:08 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38392 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLMXqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 18:46:05 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so245687pgm.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 15:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCB1KIVahlXQKWBS7hxxSbVh5ZcN9u97BqK9nO2uQ04=;
        b=SnfBwtRpMms+XqhrvoTDfK3B9tOlEd29DDYcdfTbv1yQlasgMa3ncrTzHEbvqmeAXR
         uCP98TANejscAqyK9+hOQA4UQUXHllXs9HJksbv5JDXC9xL6AnYWt4hjU7a7zAOk07UH
         TvpiY2+9LBqOgJe74n3uu9mqTNHlxbVWy6S98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCB1KIVahlXQKWBS7hxxSbVh5ZcN9u97BqK9nO2uQ04=;
        b=R3gQqvNfoYlsjmyEJAGLQ+wH24ytXcAhBkR0QiVSp+6iYOB9AwH4/Or50/YF4ZAQKb
         39StinQfcHnO24A6xmwoY6uV+9tYr9QywTw8vZIikRY89/TOyFgsGjftd3LfBLoME68O
         qJQgJ2W+ZF6Xmx40lI79lDLOww9YPJ8mfzC6jxvCQUg9AcNBNv3mRNQ2WqfWMpZTuXSx
         mMaF6dRSgRTGSzMNzT2p5RTQHzNxDJ60ZFBWCxl2h9YJ0oxJmlOo4c+cQWCHXkRYNzt3
         MniX01v2WUx0fkEBEpMYsjiEbWGQ+xi+ZfMJeQxEshkxB8CCiW0WsUzc6b2qTxSRTcWc
         Bg5Q==
X-Gm-Message-State: APjAAAUNO0e1u2uHSKZzoBlX7LwYO6u9YmCHAX/Y1byLAMvL9KCPACRe
        o+AiFqUxZYTa/3iu4aimMrne5Q==
X-Google-Smtp-Source: APXvYqwWU0kzoE96+aLrGB9T1QDrKSljpD+TwHPMs33XMNH5KyYsirHxBbrw+ZdaseYw0W0rize4cQ==
X-Received: by 2002:a63:106:: with SMTP id 6mr2447435pgb.190.1576280765132;
        Fri, 13 Dec 2019 15:46:05 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:46:04 -0800 (PST)
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
Subject: [PATCH 1/9] drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
Date:   Fri, 13 Dec 2019 15:45:22 -0800
Message-Id: <20191213154448.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two things were in one function.  Split into two.  This looks
like it's duplicating some code, but don't worry.  This is is just in
preparation for future changes.

This is intended to have zero functional change and will just make
future patches easier to understand.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 43abf01ebd4c..2fb9370a76e6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -417,6 +417,24 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
 			   REFCLK_FREQ(i));
 }
 
+static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
+{
+	unsigned int bit_rate_mhz, clk_freq_mhz;
+	unsigned int val;
+	struct drm_display_mode *mode =
+		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+
+	/* set DSIA clk frequency */
+	bit_rate_mhz = (mode->clock / 1000) *
+			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
+
+	/* for each increment in val, frequency increases by 5MHz */
+	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
+		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
+	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
+}
+
 /**
  * LUT index corresponds to register value and
  * LUT values corresponds to dp data rate supported
@@ -426,22 +444,16 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 {
-	unsigned int bit_rate_mhz, clk_freq_mhz, dp_rate_mhz;
-	unsigned int val, i;
+	unsigned int bit_rate_mhz, dp_rate_mhz;
+	unsigned int i;
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
 	/* set DSIA clk frequency */
 	bit_rate_mhz = (mode->clock / 1000) *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
-
-	/* for each increment in val, frequency increases by 5MHz */
-	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
-		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
-	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
@@ -510,7 +522,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   val);
 
 	/* set dsi/dp clk frequency value */
-	ti_sn_bridge_set_dsi_dp_rate(pdata);
+	ti_sn_bridge_set_dsi_rate(pdata);
+	ti_sn_bridge_set_dp_rate(pdata);
 
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
-- 
2.24.1.735.g03f4e72817-goog

