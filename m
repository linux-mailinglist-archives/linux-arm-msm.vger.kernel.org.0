Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7DAF11EEC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 00:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLMXqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 18:46:22 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45633 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfLMXqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 18:46:14 -0500
Received: by mail-pl1-f196.google.com with SMTP id w18so72412plq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+EeHRETkxu0picdlIzKsYQGsspaxhuZcBp2HnJGPsVI=;
        b=dcKFlE9XwzZl4mRXm1/nubZ9pM/vI36bs0JeNK8OmJeHbYVsGHdZYepNRVJ27sqRc8
         hBJ40LIojZR/TpIta9y7LrW5GFl/dpxEH1+dISE61RwY2XZdnLh1/ZIv6XoYsVSE5+b2
         5ynaQAh0YciRpY3C3TrKMakmgW3Wn/NaJtiGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+EeHRETkxu0picdlIzKsYQGsspaxhuZcBp2HnJGPsVI=;
        b=DqYM3MT2bLI8eu8NHsLlWiRFN+oTsTFMCR+vqaDj6CbTZOc49+kHwmv2akebjfChoX
         Q5nJyxKu1oWKhBXQygquUDEGPH0OuYdbohB0o9gE+UtZ4oIdFoU75hLbkLm5rNquZLo9
         PgjaGy9MNPrsaL2pIfCSQiuughfvUvAp3c0O/cfWQP/mUN1hHVK2Z4+xasH6NwsiEUVW
         Qm9OGjciNAW9HhRisN/ljyCKsJVslVv5LhnZWVrnhdOG1ZGJIfcf4wZajlYJIRNpEXP2
         Q0eT479j2Ymbpo1abm0XX+YXJBCRcNuif1rnNBQRueLo6sCX4MuVIbwC8keS5eCyKUgG
         xq5Q==
X-Gm-Message-State: APjAAAU3qcqyhnT8f57vj7nh9VhI8oVmQ+O3YJ8ApgmxIEaoYn+iZyfx
        gU5c+eRiCnbKBV6AvkAisdsD8B/RiL8BFA==
X-Google-Smtp-Source: APXvYqzwmXELCKHrbQ5y46SHZ0WNh/wWcubb9wd3jDnndYX/iS4e3gFT+K2H5pXNZA1dmILWpcEWAg==
X-Received: by 2002:a17:90a:2569:: with SMTP id j96mr2373833pje.79.1576280773362;
        Fri, 13 Dec 2019 15:46:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:46:12 -0800 (PST)
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
Subject: [PATCH 8/9] drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
Date:   Fri, 13 Dec 2019 15:45:29 -0800
Message-Id: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we fail training at a lower DP link rate let's now keep trying
until we run out of rates to try.  Basically the algorithm here is to
start at the link rate that is the theoretical minimum and then slowly
bump up until we run out of rates or hit the max rate of the sink.  We
query the sink using a DPCD read.

This is, in fact, important in practice.  Specifically at least one
panel hooked up to the bridge (AUO B116XAK01) had a theoretical min
rate more than 1.62 GHz (if run at 24 bpp) and fails to train at the
next rate (2.16 GHz).  It would train at 2.7 GHz, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48fb4dc72e1c..cc8bef172f69 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,7 +454,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
@@ -472,8 +472,42 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
-			   DP_DATARATE_MASK, DP_DATARATE(i));
+	return i;
+}
+
+static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
+{
+	u8 data;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
+	if (ret != 1) {
+		DRM_DEV_ERROR(pdata->dev,
+			      "Can't read max rate (%d); assuming 5.4 GHz\n",
+			      ret);
+		return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
+	}
+
+	/*
+	 * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
+	 * these indicies since it's not like the register spec is ever going
+	 * to change and a loop would just be more complicated.  Apparently
+	 * the DP sink can only return these few rates as supported even
+	 * though the bridge allows some rates in between.
+	 */
+	switch (data) {
+	case DP_LINK_BW_1_62:
+		return 1;
+	case DP_LINK_BW_2_7:
+		return 4;
+	case DP_LINK_BW_5_4:
+		return 7;
+	}
+
+	DRM_DEV_ERROR(pdata->dev,
+		      "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
+		      (int)data);
+	return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
 }
 
 static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
@@ -530,13 +564,15 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
 	return data & DP_LANE_COUNT_MASK;
 }
 
-static int ti_sn_link_training(struct ti_sn_bridge *pdata)
+static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
+			       const char **last_err_str)
 {
 	unsigned int val;
 	int ret;
 
 	/* set dp clk frequency value */
-	ti_sn_bridge_set_dp_rate(pdata);
+	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
+			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
 
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
@@ -545,7 +581,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
 				       50 * 1000);
 	if (ret) {
-		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
+		*last_err_str = "DP_PLL_LOCK polling failed";
 		goto exit;
 	}
 
@@ -556,9 +592,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 				       val == ML_TX_NORMAL_MODE, 1000,
 				       500 * 1000);
 	if (ret) {
-		DRM_ERROR("Training complete polling failed (%d)\n", ret);
+		*last_err_str = "Training complete polling failed";
 	} else if (val == ML_TX_MAIN_LINK_OFF) {
-		DRM_ERROR("Link training failed, link is off\n");
+		*last_err_str = "Link training failed, link is off";
 		ret = -EIO;
 	}
 
@@ -573,6 +609,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	const char *last_err_str;
+	int dp_rate_idx;
+	int max_dp_rate_idx;
 	unsigned int val;
 	int ret;
 
@@ -616,9 +655,19 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-	ret = ti_sn_link_training(pdata);
-	if (ret)
+	/* Train until we run out of rates */
+	max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
+	     dp_rate_idx <= max_dp_rate_idx;
+	     dp_rate_idx++) {
+		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
+		if (!ret)
+			break;
+	}
+	if (ret) {
+		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
+	}
 
 	/* config video parameters */
 	ti_sn_bridge_set_video_timings(pdata);
-- 
2.24.1.735.g03f4e72817-goog

