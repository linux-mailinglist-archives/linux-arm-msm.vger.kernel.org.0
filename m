Return-Path: <linux-arm-msm+bounces-50882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA76A5A5C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02BE37A119D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F271E231D;
	Mon, 10 Mar 2025 21:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3kQrXS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15F1DF73B;
	Mon, 10 Mar 2025 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641071; cv=none; b=pQuAMraHfVFHMW9I04tJ8Y092pYNdTM5Ld1sJTm2HtONdfeD1dsmb82ALHVXP0dcxpn6tCWHWbSMLQPUajN+fX9dV4wFc33gTeKA33v81H+uz9vnbVJXQ/SP/hFIijJ6qSaUOpAT+O+RuIgoOXp9zhM6dgEF9y++LuGrBnhEeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641071; c=relaxed/simple;
	bh=m9oGKQc+y2gDIvtA8Ayx1tb1rHCpo38qK1T8At7tUe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0vqzjqwCYPx73JddBzWQcNgh8p4aEtVECVAYiBiaYv3Iku37Bs936M/7Skuhp38m0pomiGr+J2A508zAwvzvdB1xqsqutKqiudO7NnqCFcaUCHJ8ca8uszJ8/7uHc9osAE9HTLfpMrRzB9QjZfFaekjFmFUhMUSXiY6Q6cG/eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3kQrXS2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so40184025e9.1;
        Mon, 10 Mar 2025 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741641067; x=1742245867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlGCSujD/C+Jb6S49OYQL87HrY3Yz3osw0UbSrW84Yw=;
        b=Q3kQrXS2CUOdFaL9xBtSHMBLMykLPWDCo5T7k3dFNg8rrL+xoxPxzdUKZBdjHlXZxF
         yy3YVjA3qsq6e0LtLE6rPrjCetX8GfvyLxyMmpMDurH/VCR69t6WEgttAJPXlUeeXx56
         +ylOvTiAOmmeeDt2XstcDHz2ZPt5tUIEib9yYPqz7ZEGsZsKraUmx5w7yoPZwg76HDka
         peiCuQNDRCz1KkiuvASknTHBy9zrK6+E4O+vlSIZdcrqpXcAGSXBSTfls5ryXnPSy/1F
         9XexvSwVrRptzzkfpliYm7wgCHPW90tKBjA6uDjm7Hc/ppElNV4pJyAPYH6ZpHpvXoVf
         rMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641067; x=1742245867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlGCSujD/C+Jb6S49OYQL87HrY3Yz3osw0UbSrW84Yw=;
        b=Ix/xPTKcR1MbE4arqUl7hW6hduwmp6/43SceAX1x2o7X2VxWKDHwMljtcVWlFNmzpW
         eNEGBzoLDC3dIxG0dCMt86vXhWmITgKoY0eV4ZWn1xegVx1w5nLgwV1/a5F7zDNpcKpA
         2cUr+yCMsbzKOWnTUAvNA7Vr8xdU0D0PobzG0PQ/UHlR23YqoKqhj3SA77Bft9vXKZzt
         PXd6nCleZsGeqa4lAsJALAa6RckfwsWFHPeJdtZs4JmgkZm1JfgjkUobuZWe0jEOWAjB
         ij+c1HA5h8wRQgE4QFalBfCjkbK0rH2TYKRmx5tKx1YoojchtqV6F2lru7/rqn3C0PPe
         8zDg==
X-Forwarded-Encrypted: i=1; AJvYcCUZeoJMPlt0cGt7UdELjAa9Jqb+HOJ2VTxpKzHiM/DkNj9xPkXJOGnkrAkpSqtPG6E8141akQ0fOt2s+ZGv@vger.kernel.org, AJvYcCWGNwc2lriNG7oMxTDGOOkpFM1LnG3eVyNDMfIDPk7njcBbAyKh3Igp3NTZNKos6DdysaZuD0qg6XFU7JxA@vger.kernel.org
X-Gm-Message-State: AOJu0YzblBwSxeflK7EIGuBdzh7ZXpOp4zomycfe8V5zitf2CB1ujpzq
	IabwLlLxCQGooFNbgc0ry/C3uLuk/Z6MwRkzz48uSLySwUtLINacPsGGJHU=
X-Gm-Gg: ASbGncvSMEVwbSbEc2kKvdPyxLXWpJStSuEU+j8nc1Tc4uXas7sI9HosVXkwL4zE2HG
	N+VrYk8TkEJlmz57pkj0/5O0ZNFvJ8pqxAHtUuqHgoTdi08ttPpdI5Q64AEVFvWhrZEBiQo4qEc
	NoxAY2YHZY1f35KFTBmK5x1gBWFPJQLAWKuvVeR5PFopeF3TRDXdueERkZj8YYial6SbaEhUs4i
	OTJYg3JzT+I/S0n2nyQJa85kc2iKGbAbCmHZFmJ0o0VKB9yRvxQzZUcFzNhgTOPSB4bXDPYlEaN
	wJM4IXNO0OtrmlxROkwwEOklU8hvPhuTsHG0od4w5M7KiKcinY9ZyPDfsiFFYeOnFCtxuzBL8z0
	kTe6UuQ==
X-Google-Smtp-Source: AGHT+IEJRvlM3jifrzch10V+1aNMBwGsqS6FB5yuAdTPl7ZjG/ify2ODJuAU3c67kHUQ/XiXWt/ytQ==
X-Received: by 2002:a05:6000:4023:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-392641c033fmr1256250f8f.19.1741641066705;
        Mon, 10 Mar 2025 14:11:06 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf595a771sm54980415e9.36.2025.03.10.14.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:11:05 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 2/2] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Mon, 10 Mar 2025 22:05:52 +0100
Message-ID: <20250310211039.29843-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310211039.29843-1-alex.vinarskis@gmail.com>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort requires per-segment link training when LTTPR are switched
to non-transparent mode, starting with LTTPR closest to the source.
Only when each segment is trained individually, source can link train
to sink.

Implement per-segment link traning when LTTPR(s) are detected, to
support external docking stations. On higher level, changes are:

*  Pass phy being trained down to all required helpers
*  Run CR, EQ link training per phy
*  Set voltage swing, pre-emphasis levels per phy

This ensures successful link training both when connected directly to
the monitor (single LTTPR onboard most X1E laptops) and via the docking
station (at least two LTTPRs). This does not address/resolve underlying
mainlink initialization issues.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 136 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
 3 files changed, 98 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d8633a596f8d..20f07ef46ef3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -79,6 +79,8 @@ struct msm_dp_ctrl_private {
 	struct msm_dp_link *link;
 	struct msm_dp_catalog *catalog;
 
+	int *lttpr_count;
+
 	struct phy *phy;
 
 	unsigned int num_core_clks;
@@ -1034,7 +1036,8 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
 	return 0;
 }
 
-static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
+					enum drm_dp_phy dp_phy)
 {
 	struct msm_dp_link *link = ctrl->link;
 	int ret = 0, lane, lane_cnt;
@@ -1075,8 +1078,12 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
 			voltage_swing_level | pre_emphasis_level);
-	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
-					buf, lane_cnt);
+
+	int reg = dp_phy == DP_PHY_DPRX ?
+			    DP_TRAINING_LANE0_SET :
+			    DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
+
+	ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
 	if (ret == lane_cnt)
 		ret = 0;
 
@@ -1084,10 +1091,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 }
 
 static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
-		u8 pattern)
+		u8 pattern, enum drm_dp_phy dp_phy)
 {
 	u8 buf;
 	int ret = 0;
+	int reg = dp_phy == DP_PHY_DPRX ?
+			    DP_TRAINING_PATTERN_SET :
+			    DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
 
@@ -1096,7 +1106,7 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	if (pattern && pattern != DP_TRAINING_PATTERN_4)
 		buf |= DP_LINK_SCRAMBLING_DISABLE;
 
-	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
+	ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
 	return ret == 1;
 }
 
@@ -1115,12 +1125,16 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
-			int *training_step)
+			int *training_step, enum drm_dp_phy dp_phy)
 {
+	int delay_us;
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
 
+	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
+		ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_1;
@@ -1129,18 +1143,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	if (ret)
 		return ret;
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
-		DP_LINK_SCRAMBLING_DISABLE);
+		DP_LINK_SCRAMBLING_DISABLE, dp_phy);
 
-	ret = msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
+	ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 	if (ret)
 		return ret;
 
 	tries = 0;
 	old_v_level = ctrl->link->phy_params.v_level;
 	for (tries = 0; tries < maximum_retries; tries++) {
-		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
+		fsleep(delay_us);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
 		if (ret)
 			return ret;
 
@@ -1161,7 +1176,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 	}
@@ -1213,21 +1228,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
+					       enum drm_dp_phy dp_phy)
 {
-	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
-	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
+	int delay_us;
+
+	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
+
+	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
+		ctrl->panel->dpcd, dp_phy, false);
+	fsleep(delay_us);
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
-			int *training_step)
+			int *training_step, enum drm_dp_phy dp_phy)
 {
+	int delay_us;
 	int tries = 0, ret = 0;
 	u8 pattern;
 	u32 state_ctrl_bit;
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
+	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
+		ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_2;
@@ -1247,12 +1272,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	if (ret)
 		return ret;
 
-	msm_dp_ctrl_train_pattern_set(ctrl, pattern);
+	msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
 
 	for (tries = 0; tries <= maximum_retries; tries++) {
-		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
+		fsleep(delay_us);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
 		if (ret)
 			return ret;
 
@@ -1262,7 +1287,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 
@@ -1271,10 +1296,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
+static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
+				      int *training_step, enum drm_dp_phy dp_phy)
+{
+	int ret;
+
+	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
+	if (ret) {
+		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
+		return ret;
+	}
+	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
+
+	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
+	if (ret) {
+		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
+		return ret;
+	}
+	drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp_phy);
+
+	return 0;
+}
+
 static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
-	int ret = 0;
+	int ret = 0, i;
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
@@ -1286,8 +1333,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	link_info.rate = ctrl->link->link_params.rate;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
-	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
-
 	msm_dp_aux_link_configure(ctrl->aux, &link_info);
 
 	if (drm_dp_max_downspread(dpcd))
@@ -1302,23 +1347,29 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 				&assr, 1);
 	}
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
+	for (i = *ctrl->lttpr_count - 1; i >= 0; i--) {
+		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
+
+		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
+		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
+
+		if (ret)
+			break;
+	}
+
 	if (ret) {
-		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
+		DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
 		goto end;
 	}
 
-	/* print success info as this is a result of user initiated action */
-	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
-
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
 	if (ret) {
-		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
+		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
 		goto end;
 	}
 
 	/* print success info as this is a result of user initiated action */
-	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
+	drm_dbg_dp(ctrl->drm_dev, "link training on sink successful\n");
 
 end:
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
@@ -1636,7 +1687,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -1660,7 +1711,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 		return false;
 	}
 	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
-	msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
 	msm_dp_link_send_test_response(ctrl->link);
 
 	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
@@ -1902,7 +1953,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl);
+			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 		}
 
 		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
@@ -1926,7 +1977,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl);
+		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 		msm_dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
@@ -1997,7 +2048,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	/*
 	 * Set up transfer unit values and set controller state to send
@@ -2207,7 +2258,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
+			struct msm_dp_catalog *catalog, int *lttpr_count,
 			struct phy *phy)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -2242,12 +2293,13 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->panel    = panel;
-	ctrl->aux      = aux;
-	ctrl->link     = link;
-	ctrl->catalog  = catalog;
-	ctrl->dev      = dev;
-	ctrl->phy      = phy;
+	ctrl->panel       = panel;
+	ctrl->aux         = aux;
+	ctrl->link        = link;
+	ctrl->catalog     = catalog;
+	ctrl->dev         = dev;
+	ctrl->phy         = phy;
+	ctrl->lttpr_count = lttpr_count;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b7abfedbf574..3fb45b138b31 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -27,7 +27,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
+			struct msm_dp_catalog *catalog, int *lttpr_count,
 			struct phy *phy);
 
 void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2edbc6adfde5..5fcc5951797b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,7 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	int lttpr_count;
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
 
 	bool wide_bus_supported;
@@ -397,7 +398,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp, dpcd);
+	dp->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
 	rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
 	if (rc)
@@ -798,6 +799,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
+			       &dp->lttpr_count,
 			       phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
-- 
2.45.2


