Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11B61256DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 23:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLRWgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 17:36:01 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33626 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfLRWf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 17:35:59 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so2042263pgk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oRMrQvnKv8sUjeUK0UWacEw5OuTlAMvQh07s4c6q20=;
        b=db+TBlr64EdEwBEdMs7w/Pv0H3tuG2jAw41a3OXASqoAZL0EYUaWZ8HDZIfe49qvZA
         pFTHJMOSZ1DUHo6yp0wOMGWXQci8BN/9/nnoGHSnTOEwQ8aHsf+528NQ2yhrN+P9x6GK
         XVrBd6FxIvat+vm+Zie433PrCuTb46Gkq0JC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+oRMrQvnKv8sUjeUK0UWacEw5OuTlAMvQh07s4c6q20=;
        b=GZ4zndfzkElDVVgAnjv/p9usrIYTfTlioDQvN2RzaXrHlgI+39iiUclsUGPywTV/sm
         XH6l5cTxC1+b3C6Npj8M3oNKSCN+QBXQiIqsYgEYjUrTclUafrDo1Ob1QromDcYiI2Ba
         al1PFUbz+9aPkGsmzU7tk89oO/5FXHuZWCeu6gYtAPewcKUpHwIfN7ShBtOZY0XS137i
         qnxC4Cvao/ejW5nlv1h8Lwo22JFcAL7agQXLV33CSLbAXZ7KDd0iIu3WDtMh6FduWsqL
         T7W3F4izdPqrbRorobI88jTBIdPp86+LiexeNe2z3ypmlqXjxuQhX+gj0IwWW45QEH9F
         u3Eg==
X-Gm-Message-State: APjAAAXSfmYwJ3cXsHQMy6083j5kLS2gbi4FMGpB2fmdw6QNG8KwbYcA
        mLvVqzTg80KNSFD5MWgHRsBDSQ==
X-Google-Smtp-Source: APXvYqyxaHyGUjuepnVu3CFb1Nbl4hMcUXmhJvEcO3i8W028D3on1sqc1halTkAOiHuxndTpK4WDwA==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr5797968pfn.62.1576708559241;
        Wed, 18 Dec 2019 14:35:59 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:35:58 -0800 (PST)
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
Subject: [PATCH v3 1/9] drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
Date:   Wed, 18 Dec 2019 14:35:22 -0800
Message-Id: <20191218143416.v3.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
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
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

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

