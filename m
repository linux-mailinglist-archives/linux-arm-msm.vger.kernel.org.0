Return-Path: <linux-arm-msm+bounces-56182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DBAA3ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC72B17E9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89711F1516;
	Wed, 30 Apr 2025 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3LN15XG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AB1EEA4D;
	Wed, 30 Apr 2025 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972032; cv=none; b=tnsjLhy2wv2D1wYalwa51jyZ0rvns5JpOomlnMDfd0Xq0ugCzSRn9PIk0+OGnZf4v1l5/F+atnkBoh0ocB7xeHzG6xR6qjJYgsb8/J7wKUq9QpAyHu2MFWZBzpOLZcR3iXZD2rRu3/LTQZW0D/jGLOQwM5SEhRZgwadbZE2IyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972032; c=relaxed/simple;
	bh=ax5e9I/1ulRxNz6IVWBGa7vUO7DSEEt72VhKqp49JKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Riom9Qclj1VFJnHEN79Ue4o0irmO3+xhpKeKa0v4a01HuvU2GUTlxdt2Z+TZDJ+yrSMu+zpJ1DT1AuH2GDadhoAbZVU2V8SvuGeF9RxcERvitxFgv7p5O5alJHCTdaF9ArsyaDr5mFYFX3tLpb+yhlHblL4G9nuUxehKeAn9jt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3LN15XG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4614543f8f.1;
        Tue, 29 Apr 2025 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745972029; x=1746576829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1HB0pJCYnHHVtI6leB7kANPGdvrwtJT9eZo64kNwGM=;
        b=h3LN15XGZB3jPee7aucdtrT5+oabHtcKEMbFkgEORo+5uyfW787WxoCqcD5F91Ho4q
         rxgPtZ6Gl06F2siMx3OhAcpbcsY3S0/EzXAKIv3UY/xS8XP48ZjqTdJUUzx4DDzc1xN3
         7SdOmTWQKpXRWY7dej3LD6ihMJTgntSEIK/QbKh4Kfz9OjcKtLzsfCkervFkV/nam7jX
         PB6eAq4aySlDj6DkEU530gZGR7Kug7uZJcL6QfV2W9UaI3jf6vFox94z90S6vyrq9Mc4
         kwSNpOjk7XnX5GljUsW43Djf3JO14yFItEalGTOhuHYWNoqTbBaSbm398VnCS4w4mGxo
         Hpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972029; x=1746576829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1HB0pJCYnHHVtI6leB7kANPGdvrwtJT9eZo64kNwGM=;
        b=PvL/4AYYzsbk95ewtoTbpXMengfMj4lAqhRdVQvXp8jR/BQi3adGVwiNGl4wN/0NeV
         SV5wApArKACVrypNh46ddytiIPAh84Oe/zSCHxKaZ8VvcyyfhSD1Re9soRs3QnzJG0Z6
         sNsWJ/eefh8QNa3fcQs6z5w0zvHJcE6jHIAoTVjpFgkUQsnbsWxu4uxpz2BZ54xzjSa0
         PM9S8ClgscsrNe8rBverTRTSg7YAtzEUMUPC08WVo9Sx/i8R1nKdNH3iOCfrHGd1/H+z
         dcVXwalpSmw2zEBZP5HT36v/EL4tcKn6tqugMpHUawvfMxfYys2/MbNPSrBMVrWKpjJP
         AXKA==
X-Forwarded-Encrypted: i=1; AJvYcCX01/oyC5wQ0EXuSU+5n62EUzrSkjLrioq0KgwghVbEesItJOiYSnR4lVgG8s3AvcUwpW3eiUncc9mdlhrd@vger.kernel.org, AJvYcCXYzOjrbb9/woMYHntcghcLIu2LCIaN4qxKYhKdt2IyF8sAumIOZ1rcStdHZDoUJGP2s7tHCS0EECkI5l6G@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHsxuRdPAZyJ7AtOl6V09V/6LKGCGU4wC0PSB7NoKVtyKzqBM
	6Fi4Ji8y1i6PqZFbWJh2tQXnWOkw8/aNtDxOKtuQuqmTrwwTTvc=
X-Gm-Gg: ASbGnctdWzBHDnmOVUuftXd/Te2PTZT2wuGjmI2zT4diII2I/nZ2FjD0OK71kLYkLPK
	MAjs+ymQhMrODQZNv72iJp6yQUBw+6ZaFYDROAKDAxlbysDGDhuELk83zVoxJYEFrGER5BzC40n
	K6ShyiiQ5hsm3dUU+gU6sJKMIwxXBpVoXuOjP2aYdYPJVbPGr3tELq5+4tEsZoema1xDCWiN9t8
	bKVrtYywWdTBTrFcwqLgdogT6s3V4f1u+X1HuEaXg8crq5G1L4Vfy+Lp2+Tw8xLfLLZhUJqyn71
	cdvmJvK1soUtQ9uq80EEeawILW+Cm9psl44bt/H4AOYyNz7h4WINcKiw
X-Google-Smtp-Source: AGHT+IGbKUzfK8XZETH8woy9eFt8xfSQrWoqLCX0Oa2T7hxffwMabwMTUtRlu6be8fGYFcv0zYwhMg==
X-Received: by 2002:a5d:584a:0:b0:3a0:8291:20d0 with SMTP id ffacd0b85a97d-3a08f779672mr864108f8f.29.1745972028377;
        Tue, 29 Apr 2025 17:13:48 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm15574565f8f.99.2025.04.29.17.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:47 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [PATCH v4 4/4] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Wed, 30 Apr 2025 02:09:47 +0200
Message-ID: <20250430001330.265970-5-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250430001330.265970-1-alex.vinarskis@gmail.com>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
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

* Pass phy being trained down to all required helpers
* Run CR, EQ link training per phy
* Set voltage swing, pre-emphasis levels per phy

This ensures successful link training both when connected directly to
the monitor (single LTTPR onboard most X1E laptops) and via the docking
station (at least two LTTPRs).

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
 1 file changed, 89 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d8633a596f8d..35b28c2fcd64 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
 	return 0;
 }
 
-static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
+					enum drm_dp_phy dp_phy)
 {
 	struct msm_dp_link *link = ctrl->link;
-	int ret = 0, lane, lane_cnt;
+	int lane, lane_cnt, reg;
+	int ret = 0;
 	u8 buf[4];
 	u32 max_level_reached = 0;
 	u32 voltage_swing_level = link->phy_params.v_level;
@@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
 			voltage_swing_level | pre_emphasis_level);
-	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
-					buf, lane_cnt);
+
+	if (dp_phy == DP_PHY_DPRX)
+		reg = DP_TRAINING_LANE0_SET;
+	else
+		reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
+
+	ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
 	if (ret == lane_cnt)
 		ret = 0;
 
@@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 }
 
 static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
-		u8 pattern)
+		u8 pattern, enum drm_dp_phy dp_phy)
 {
 	u8 buf;
+	int reg;
 	int ret = 0;
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
@@ -1096,7 +1104,12 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	if (pattern && pattern != DP_TRAINING_PATTERN_4)
 		buf |= DP_LINK_SCRAMBLING_DISABLE;
 
-	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
+	if (dp_phy == DP_PHY_DPRX)
+		reg = DP_TRAINING_PATTERN_SET;
+	else
+		reg = DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
+
+	ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
 	return ret == 1;
 }
 
@@ -1115,12 +1128,16 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
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
+						    ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_1;
@@ -1129,18 +1146,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
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
 
@@ -1161,7 +1179,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 	}
@@ -1213,21 +1231,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
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
+						ctrl->panel->dpcd, dp_phy, false);
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
+						ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_2;
@@ -1247,12 +1275,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
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
 
@@ -1262,7 +1290,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 
@@ -1271,9 +1299,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
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
+	int i;
 	int ret = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
@@ -1286,8 +1337,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	link_info.rate = ctrl->link->link_params.rate;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
-	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
-
 	msm_dp_aux_link_configure(ctrl->aux, &link_info);
 
 	if (drm_dp_max_downspread(dpcd))
@@ -1302,24 +1351,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 				&assr, 1);
 	}
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
+	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
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
 
-	/* print success info as this is a result of user initiated action */
-	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
-
 end:
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
@@ -1636,7 +1688,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -1660,7 +1712,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 		return false;
 	}
 	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
-	msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
 	msm_dp_link_send_test_response(ctrl->link);
 
 	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
@@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl);
+			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 		}
 
 		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
@@ -1926,7 +1978,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl);
+		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 		msm_dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
@@ -1997,7 +2049,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	/*
 	 * Set up transfer unit values and set controller state to send
-- 
2.45.2


