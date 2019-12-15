Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FF111FAF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 21:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfLOUGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 15:06:34 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34784 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOUGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 15:06:34 -0500
Received: by mail-pf1-f193.google.com with SMTP id l127so2635543pfl.1;
        Sun, 15 Dec 2019 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=olA02RGJ4z+GQuBAoSMwgqWAuMGZ9U+U5K9YnozTaYU=;
        b=NoSvc9LyNA6ksrJeUp7FB7vkKf1dy8iN5L/6J33qDLMS48EKyfcMwFOo4vAihGWHq3
         ajgxWM90HehvQKUpelwLATIPKx9GU+S2ysA9V72PjJz/GeAvoDfYzptauittAyAHSz4d
         R6E71A3Nb+TQDPpR/RAlpUIllwmLrvt+cLKy6XaX4deBhNZT7YgPuArygUF7vdmVZVRV
         qi73VWZpOFXAaR21napSi/Mf68/d2FEpPdtGus2IKGGuUd9V7MnLT9fPD1FdNtyYRg3e
         aemPBsITUNmstQjweFgFX3okr2QhWJ0IUlby6qU6sutU1wx84QlgnSSCAIK/VkSPpoHw
         TwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olA02RGJ4z+GQuBAoSMwgqWAuMGZ9U+U5K9YnozTaYU=;
        b=QrYecJsY8FqL72U4IPbqUPr0lq1ESlg6OZaY5bYioEtIBxKOZQwj9So+zQI+1ZDhsb
         aS3Cdw81nTsCJ0b3VBGSXnq7efopPOoBQyYL58BRc84qyyig3Hj2uc7Qga8UaMsMJYxs
         tsD3za1eGhkOp99rppDdjzEHJiYaHJgHjCK7/YFUXjvalIT9IlYIoPSkJdlsNBVp88pX
         qJMXxFGVMo/87APnWae9pFz2LZwNO2UsjXI6+Lv3bnvRYXCmkulPUZPcPOMNaKbj0wDF
         2AVGGEQanh2rqFOnKYFwvzAlFRWpMmgcgsEUyHCVLveiZD8DlVSyuMkb7JKGuZ/PJQP/
         5q8Q==
X-Gm-Message-State: APjAAAXiXRrVySs2kzi8FTQQZcW7tFrGyccJXwKrrZE6RxAmpRK1A4tQ
        u86Y2ze7qKkMpB1lFFdIu40=
X-Google-Smtp-Source: APXvYqxe5x94xy2/MvtT893jlm05f9npIWyWZBI3QysNVvpVvCVSB7MKtaVzP6zm2GYjpCyme8qK2w==
X-Received: by 2002:a63:4664:: with SMTP id v36mr13653993pgk.147.1576440393629;
        Sun, 15 Dec 2019 12:06:33 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l66sm18645744pga.30.2019.12.15.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 12:06:33 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] fixup! drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
Date:   Sun, 15 Dec 2019 12:06:32 -0800
Message-Id: <20191215200632.1019065-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
References: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

---
Note however, the panel I have on the yoga c630 is not eDP 1.4+, so I
cannot test that path.  But I think it looks correct.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 110 +++++++++++++++++++++-----
 1 file changed, 89 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 976f98991b3d..1cb53be7c9e9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -102,6 +102,9 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	u8				edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+	int				num_sink_rates;
+	int				sink_rate_idxs[DP_MAX_SUPPORTED_RATES];
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -454,15 +457,6 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-/**
- * A table indicating which of the rates in ti_sn_bridge_dp_rate_lut
- * is as per the DP spec (AKA a standard) as opposed to an intermediate
- * rate.
- */
-static const bool ti_sn_bridge_dp_rate_standard[] = {
-	false, true, false, false, true, false, false, true
-};
-
 static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
@@ -573,11 +567,95 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
 	return data & DP_LANE_COUNT_MASK;
 }
 
+/* TODO possibly fold ti_sn_get_max_lanes() into this? */
+static void ti_sn_read_sink_config(struct ti_sn_bridge *pdata)
+{
+	memset(pdata->edp_dpcd, 0, sizeof(pdata->edp_dpcd));
+
+	/*
+	 * Read the eDP display control registers.
+	 *
+	 * Do this independent of DP_DPCD_DISPLAY_CONTROL_CAPABLE bit in
+	 * DP_EDP_CONFIGURATION_CAP, because some buggy displays do not have it
+	 * set, but require eDP 1.4+ detection (e.g. for supported link rates
+	 * method). The display control registers should read zero if they're
+	 * not supported anyway.
+	 */
+	if (drm_dp_dpcd_read(&pdata->aux, DP_EDP_DPCD_REV,
+			     pdata->edp_dpcd, sizeof(pdata->edp_dpcd)) ==
+			     sizeof(pdata->edp_dpcd))
+		DRM_DEBUG_KMS("eDP DPCD: %*ph\n", (int) sizeof(pdata->edp_dpcd),
+			      pdata->edp_dpcd);
+
+	/* Read the eDP 1.4+ supported link rates. */
+	if (pdata->edp_dpcd[0] >= DP_EDP_14) {
+		__le16 sink_rates[DP_MAX_SUPPORTED_RATES];
+		int i, j;
+
+		drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
+				sink_rates, sizeof(sink_rates));
+
+		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
+			int val = le16_to_cpu(sink_rates[i]);
+			int rate_mhz;
+
+			if (val == 0)
+				break;
+
+			/* Value read multiplied by 200kHz gives the per-lane
+			 * link rate in kHz. The source rates are, however,
+			 * stored in MHz
+			 */
+			rate_mhz = DIV_ROUND_UP(val * 200, 1000);
+
+			/* If the rate is also supported by the bridge, add it
+			 * to the table of supported rates:
+			 */
+			for (j = 1; j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); j++) {
+				if (rate_mhz == ti_sn_bridge_dp_rate_lut[j]) {
+					pdata->sink_rate_idxs[pdata->num_sink_rates++] = j;
+					break;
+				}
+			}
+		}
+		pdata->num_sink_rates = i;
+	} else {
+		int i;
+
+		/**
+		 * A table indicating which of the rates in ti_sn_bridge_dp_rate_lut
+		 * is as per the DP spec (AKA a standard) as opposed to an intermediate
+		 * rate.
+		 */
+		static const bool ti_sn_bridge_dp_rate_standard[] = {
+			false, true, false, false, true, false, false, true
+		};
+
+		/* if prior to eDP 1.4, then just use the supported standard rates: */
+		for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
+			if (!ti_sn_bridge_dp_rate_standard[i])
+				continue;
+			pdata->sink_rate_idxs[pdata->num_sink_rates++] = i;
+		}
+	}
+}
+
 static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 			       const char **last_err_str)
 {
 	unsigned int val;
 	int ret;
+	int i;
+
+	/* check for supported rate: */
+	for (i = 0; i < pdata->num_sink_rates; i++)
+		if (pdata->sink_rate_idxs[i] == dp_rate_idx)
+			break;
+
+	if (i == pdata->num_sink_rates) {
+		*last_err_str = "Unsupported rate";
+		return -EINVAL;
+	}
 
 	/* set dp clk frequency value */
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
@@ -624,6 +702,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	unsigned int val;
 	int ret = -EINVAL;
 
+	ti_sn_read_sink_config(pdata);
+
 	/*
 	 * Run with the maximum number of lanes that the DP sink supports.
 	 *
@@ -669,18 +749,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
 	     dp_rate_idx <= max_dp_rate_idx;
 	     dp_rate_idx++) {
-		/*
-		 * To be on the safe side, we'll skip all non-standard
-		 * rates and move up to the next standard one.  This is
-		 * because some panels will pass link training with a non-
-		 * standard rate but just show garbage.  If the non-standard
-		 * rates are useful we should figure out how to enable them
-		 * through querying the panel, having a per-panel whitelist,
-		 * or adding a DT property.
-		 */
-		if (!ti_sn_bridge_dp_rate_standard[dp_rate_idx])
-			continue;
-
 		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
 		if (!ret)
 			break;
-- 
2.23.0

