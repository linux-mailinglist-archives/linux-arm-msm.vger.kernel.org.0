Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D31B0E0C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 21:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732797AbfJVTB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Oct 2019 15:01:28 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36138 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732517AbfJVTB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Oct 2019 15:01:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so11221381pfr.3;
        Tue, 22 Oct 2019 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WYVPyN6TIQKQmBJ/hjRhIQzHM1SMeDB+rC6cCAZ6daQ=;
        b=CK5IZ7/fDlc9HGDR/5NYBLaFIb472dWbbATEk0sFtqAxKrqYwkzYrCL3ITn8stO5B5
         C9Mmkymm0eGpXhUTOue0kAODrlapvXBKREBm71YlYwt9WVmcNC+mlsiw7kXsxM1zZuOG
         BDBUcrnEhnmoE54WYC/3YgLdFi/ITSnT+3zW0srdQowk4E5pBF/LuwrECZ4AoTJkFvBb
         oakxR9XGZEJsCyVaQMNrxC6Go27fC5w/2ZnU21w/vggcpXBjbWz7U72osg6UjojQFWMf
         1yxVicruoyAQIqEVVb0R707IxYnsxv1kdeVnocE8hs8MxSivLG5yNhWRik20ZnIdIAG6
         cidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WYVPyN6TIQKQmBJ/hjRhIQzHM1SMeDB+rC6cCAZ6daQ=;
        b=EDvcJz7dn4Tp/7DzjJDhFSjVTznvj2FPcVySnL8W23agN5WbR3LCQ9JJ7jInFVetNG
         LC/ab1s0POA65bpohzelgWAc3ADm5R+oZ68EVcD2gtkOFfvpqpwCEQ9F8KRByxHa8ZGE
         Mr+gOdM9GeEF4yslieXwpM52y743QCYjdFZriy0jnI3qGih+qer5PCUIovgNHadbrLec
         zHoyhAcgWmoSVvGMZGQASeQ+ML4tNzISWUu7joakT2C2ihtjwaI5c2XlXfeMeEYV6fTZ
         WpBXSOxkPbQsihWjwDBWR9QTiU2LxoPmSe8GJErOcYKkdccWd27u8dko8IsD79uh17jv
         9ULw==
X-Gm-Message-State: APjAAAU6wtKX0FUO0n4fdyeEkreqO8jF4SWp7scmnsUHqplOQL01apfs
        CxNFTaVFLzVqp3WTnWcqvFw=
X-Google-Smtp-Source: APXvYqzAbRABJxb7CI6UKHnD8ZpCEZSa9XbNpVCEb9Dl5FiMXCGYH/7+YnC/R9o/2VDIgZAIEw+5Jg==
X-Received: by 2002:a63:6607:: with SMTP id a7mr2744430pgc.68.1571770885773;
        Tue, 22 Oct 2019 12:01:25 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v9sm4365690pfm.85.2019.10.22.12.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:01:24 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Decouple DP output lanes from DSI input lanes
Date:   Tue, 22 Oct 2019 12:01:20 -0700
Message-Id: <20191022190120.25772-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>

The bridge can be configured to use 1, 2, or 4 DP lanes.  This
configuration is independent of the input DSI lanes.  Right now, the
driver assumes that there is 1:1 mapping of input lanes to output lanes
which is not correct and does not work for manu devices such as the
Lenovo Miix 630 and Lenovo Yoga C630 laptops.

The bridge can also be configured to use one of a number of data rates on
the DP lanes.  Currently any of the supported rates is considered valid,
however the configured rate must also be supported by the connected panel,
and not all rates are supported or even valid for any particular panel.

Luckily, we can determine what we need at runtime by reading the DPCD from
the attached panel.  DPCD will tell us the maximum number of supported
lanes, and the supported data rates.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

Bjorn, I think this should address the issue you pointed out concerning
the data rate glitch I missed in your origional work.  Would you kindly
give this a test and let me know if it appears to address all of the
issues you were working around?

v2:
-Use DPCD instead of DT to address the issue of some panels not
supporting all the rates

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 97 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 43abf01ebd4c..72bacca8d49a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -100,6 +100,7 @@ struct ti_sn_bridge {
 	struct drm_panel		*panel;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
+	int				dp_lanes;
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -432,6 +433,8 @@ static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
 	unsigned int val, i;
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+	u8 dpcd_val;
+	u8 rate_valid[8] = {0};
 
 	/* set DSIA clk frequency */
 	bit_rate_mhz = (mode->clock / 1000) *
@@ -444,10 +447,91 @@ static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 
 	/* set DP data rate */
-	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
+	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
+
+	/* read the panel capabilities to determine valid supported rates */
+	val = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
+	if (!val) {
+		DRM_ERROR("Reading max link rate from DPCD failed\n");
+		return;
+	}
+
+	if (dpcd_val) {
+		/* cap to the max rate supported by the bridge */
+		if (dpcd_val > 0x14)
+			dpcd_val = 0x14;
+
+		switch (dpcd_val) {
+		case 0x14:
+			rate_valid[7] = 1;
+			/* fall through */
+		case 0xa:
+			rate_valid[4] = 1;
+			/* fall through */
+		case 0x6:
+			rate_valid[1] = 1;
+			break;
+		default:
+			DRM_ERROR("Invalid max link rate from DPCD:%x\n",
+				  dpcd_val);
+			return;
+		}
+	} else {
+		/* eDP 1.4 devices can provide a custom table */
+		__le16 sink_rates[DP_MAX_SUPPORTED_RATES];
+
+		val = drm_dp_dpcd_readb(&pdata->aux, DP_EDP_DPCD_REV, &dpcd_val);
+		if (!val) {
+			DRM_ERROR("Reading eDP rev from DPCD failed\n");
+			return;
+		}
+
+		if (dpcd_val < DP_EDP_14) {
+			DRM_ERROR("eDP 1.4 supported link rates specified from non-1.4 device\n");
+			return;
+		}
+
+		drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
+			      sink_rates, sizeof(sink_rates));
+
+		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
+			val = le16_to_cpu(sink_rates[i]);
+
+			if (!val)
+				break;
+
+			switch (val) {
+			case 27000:
+				rate_valid[7] = 1;
+				break;
+			case 21600:
+				rate_valid[6] = 1;
+				break;
+			case 16200:
+				rate_valid[5] = 1;
+				break;
+			case 13500:
+				rate_valid[4] = 1;
+				break;
+			case 12150:
+				rate_valid[3] = 1;
+				break;
+			case 10800:
+				rate_valid[2] = 1;
+				break;
+			case 8100:
+				rate_valid[1] = 1;
+				break;
+			default:
+				/* unsupported */
+				break;
+			}
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
-		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
+		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz && rate_valid[i])
 			break;
 
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
@@ -505,7 +589,14 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   CHA_DSI_LANES_MASK, val);
 
 	/* DP lane config */
-	val = DP_NUM_LANES(pdata->dsi->lanes - 1);
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, (u8 *)&val);
+	if (!ret) {
+		DRM_ERROR("Reading lane count from DPCD failed\n");
+		return;
+	}
+	pdata->dp_lanes = val & DP_MAX_LANE_COUNT_MASK;
+	/* 4 lanes are encoded with the value "3" */
+	val = DP_NUM_LANES(pdata->dp_lanes == 4 ? 3 : pdata->dp_lanes);
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-- 
2.17.1

