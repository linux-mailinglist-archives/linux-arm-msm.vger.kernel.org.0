Return-Path: <linux-arm-msm+bounces-57201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B3AAEEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F48516AEA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3682918D5;
	Wed,  7 May 2025 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IC5EE9kS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8768291893;
	Wed,  7 May 2025 23:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658889; cv=none; b=VOJwdGjcpifmEDbmvu+i04TnBd/0Go1yMaUNylFNDJBUY+5UYRhQQowYifS7VGptKhhxBzYwz1w0Gge3OewtryyNlJjFVnmO1JVzgvZXiVRlOr8K/ukjA/h59CLY9ulXCU0RQIcqujpIjL9OS9Y6BevMLQCJqfG3tboGN7cuFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658889; c=relaxed/simple;
	bh=BC/pT7+dNFQTyFJU7rdevnzP3IxD2GIkgQiwuZgznF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrYOv/YClfrIsHmUQdqyeMEaY43bPoIlSvOqE1/yj08iYHkY48d1I1oJmBfzlmdJ5V18KGutbMsQcgmi9QdbJUGW4dPkrQ5h3LzJ8IxmpXrFtq29EdGM7v/syGgG8L5YBg7bQTioUZAayNNwdKEVfZZqtO28anJSQQOnLqYat1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IC5EE9kS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fc5bc05f99so355749a12.3;
        Wed, 07 May 2025 16:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746658886; x=1747263686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVpb7+CUL0xlsyVNYrdBfV2De+Kf2gFS5RjhAJ27WRo=;
        b=IC5EE9kSVbJ4gVLVAZ8sbbCFtLY8V1ywYfcb/3vm3O6N6t8iVy80RFkC0vIs+G4hlR
         apgW3IN8pDL9C3Nb3kP6I2U3QUISb9gmYQiNSaf3X9xv8a6h4B1XMTDlCUw1xNEpPhGq
         G0NSoIGT4t7XaI9WJH5G9pDZQ1CiibDIm+T7wXuCn/F85HQ5X2UZES7k9XCoJa2lRswb
         xbLZTj3fCq7tC1x0sGMAmhjnkxkiCzBfFBLP2OOBOl9ETopO5XEJKE89h7xFFS+ftWF2
         0nSbzgUIF03ObmpusTXLFB31/sLK3nUsHTx7xY2XKXCNnMVfW33icvmJhAulhLUa7NeG
         llXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658886; x=1747263686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVpb7+CUL0xlsyVNYrdBfV2De+Kf2gFS5RjhAJ27WRo=;
        b=vEjo1ZZPMmBsyeFCeNCCob7dFo0LlmSE4YdXdHjaRMpEznLImCvOAGT8iVB11v9Y27
         yp1vc3A1vT0ihhi0+UtMVGzWaWef7ULabM16XG1gg37xnFrJeElN8tCVhKJZWFYr5EP1
         SKnXza5XsM7DJpGLX65PygJphtY6BPge73/MDrNtDOW+oTj/GjTpZBbsZLyvkT9OWdZ4
         f1iTmp1kJ8+XQzmo4H/YHwYxwrqzLeH0AAun1X02EbP4y1GM5dI5ltIOWhoxM5mqy9G8
         wxPtDybAlj/kMReZBKECKtu5ES3iGSiIS0Jf818x5FtcIsK5ncQAW+WmbYJgOEJlnB4E
         GVUw==
X-Forwarded-Encrypted: i=1; AJvYcCUoly+DgBTwRr73hn+qYtQP0qDeSCz8fI/+A0IaXMbO7JZoIGGA7tAfFocBEzH0J/Sasdpcw9M6hF8N7+Px@vger.kernel.org, AJvYcCVksSj8b1NIywwIhxtWNzM4KlPIMubpjVfk8yinK6gT3i1FK+BMJOYQb5E+lr+7mB62wI3Z/sjyvJtliiqK@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIQydJvHn2Y1T3tG7sjw8sbGr/FZcLvCMz++TjDzv+MH/yXnh
	8eWKhjWogfxAEAmyOmNMqKkgZ9uUaK0ALLytSYXHy6ok7RzPXfy7vdv/ZILzFw==
X-Gm-Gg: ASbGncsLK4UNFU4J+bQ88OATF6VJi5eqyVZzT0Sfqs97rmAAR+ofCdAhD3fJYh8PEYK
	MeNL0NVc7lPg5+gmtHyyt0PR7aP7S1/SVsU3AW8+0PR/7/S1SgLyJRNV875FoGP874r3T+xCj+J
	vDl9tQqTQANyOImoqXSdY0rnoVhW22ewnrE27cItuWCCfuYmPynwqS0ffxi3CmEJTTO3Y0FahBE
	jYt9kbKrrwxP3zZv1J9ZfOeFICqQ+ZzVmkW3QGt7tsSatuRiTJbc3Mi0xf+7nTqIgeobulw8K83
	FmD83NBJ1Aq+bkXzQ+55qIINOXfK0BfHpytXUlPXZIw80g==
X-Google-Smtp-Source: AGHT+IEjwSurPUUJmicmXJh9IZH04pLXCjBbDPL14W8ZKg0fSQTlEKOgSEwPGjyuHAyHPng+4en8rA==
X-Received: by 2002:a05:6402:2689:b0:5f8:afab:9e14 with SMTP id 4fb4d7f45d1cf-5fbe9fa810amr4628252a12.28.1746658885593;
        Wed, 07 May 2025 16:01:25 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:01:24 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 4/4] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Thu,  8 May 2025 00:59:02 +0200
Message-ID: <20250507230113.14270-5-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since at least some LTTPRs (eg. Parade PS8830) do not correctly report
voltage-swing, pre-emphasis level 3 support, always assume level 3 is
supported. This is permitted under DP 2.1(a) section 3.6.7.2 stating
that LTTPR shall set its transmitter levels as close as possible to
those requested by the DPTX, if the DPTX sets the voltage swing or
pre-emphasis to a level that the LTTPR does not support. It shall be
noted that LTTPR’s level choosing is implementation-specific.

This ensures successful link training both when connected directly to
the monitor (single LTTPR onboard most X1E laptops) and via the docking
station (at least two LTTPRs).

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


