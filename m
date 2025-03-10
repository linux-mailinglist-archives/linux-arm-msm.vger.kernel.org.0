Return-Path: <linux-arm-msm+bounces-50881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 523FEA5A5BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EAA3AE970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EDD1E0B62;
	Mon, 10 Mar 2025 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USOs4R+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258B1D6DBF;
	Mon, 10 Mar 2025 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641069; cv=none; b=SZKJIrBFiu1A59vSYgKuIGJ39pbP7DGb2EUQ83A7uiPoMykdX0J7Rvxsv79zrpgf58JyD/KmmpHd4aGedCGttc39eOVWnriz+pAsXyT3oxCwrWFmdnMEO5HA6+9aBfr23grt5pkUPYGmY1xzrMFqw7Fm0RT79rgxVl3Tmff2LKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641069; c=relaxed/simple;
	bh=MphNhFfzFAwzH3aCNupzI4NANUlzHHovNIwD3Cj0s8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uB7HDrJiPlzP6BaNGgabuKyoGazjbNDcbyoUP4DJwNaz+BfnGxcjomlOCo8Kj3gtu+wc/XKO33nlgDjXgY1oLGj1+ruCryd7k4rnAOhEvoZuftrYwt7GOEkd26YK96XYqM83U4u5HmLB1eY1hcQk0h3glGAOl+CpdyTM4PDr7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USOs4R+Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso29097205e9.2;
        Mon, 10 Mar 2025 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741641066; x=1742245866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TzgCw575Otf9KfkSYbKwBAqhN/d/WSTjuKQ5VGt1/4=;
        b=USOs4R+Zy07T/ELS8UAJ1GS0wWJxgrV/vySm5CixiJ1lo8rhh/7+r5FtjEraUr9TR+
         wRzevPIt4PXBlR8GVsysH3O6izxwJC2j3FApkXjY2/Hbg/hFmeEXb758yDGIfmFdb6C8
         s+s3SVu+azraoo75xGMnHDIYpaKjEAIrlzcsOH5uso6AthWdyTkliQUwG89bL4NZPQVA
         wjhL2XSfl63ix2h06SkdNAmrQemvUviHjfCGrEKUnnMaSjl1D0VEf4/BOmTetzG35Eci
         fjlrtqi+Rlc4lowpsKsDymN1hppZ7BMaYtgeeMw/25df5Bjm44EgzEFcYpi+54M3pJD+
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641066; x=1742245866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TzgCw575Otf9KfkSYbKwBAqhN/d/WSTjuKQ5VGt1/4=;
        b=EKXP23meMlcT8BlCpSju4fB/xGk0XcXeHW6+DZzJurjGXasWJCwXe5pDT2dbfwhsFZ
         n0a/EXXEmaAyycLtXNEV4Y2hvFTpENSG9aFJtfg89s3HOlMORy2E3aI4GAV/FAwx+QpA
         ZKU42CkuqGvdEs6cDayNtNeQ3BPMzbdvyfhs+/IylYggVgRaOfLmVGerlkjkfwZdboBP
         8fJx01m11CRfOpwDjVEI7oKGkIBherDTmteMUxmOffEoLst/GYhDJqdtji3c6QcJbXyw
         P7SR9K7KaX5rIX9E/PrvM9pEqKD99w0YYQbvKhi6aBCE7dW92+3OwyS5E6QpXVHrOVwd
         ly9g==
X-Forwarded-Encrypted: i=1; AJvYcCVILZmQXUA/pOzXcGAFUaPanbo17VKaVr9w9l3hhpdTOJTCpu6xnYpTHc7t+eT6PX0c8bIvVViP4JboSZjT@vger.kernel.org, AJvYcCXhftKWjCeWqwu+klJsWkSN1RCcKcVqErqQqWZ6ijqaaibFgrAVHvniRCwRnBhR8fNeU1cC7U1xK2ogpd/x@vger.kernel.org
X-Gm-Message-State: AOJu0YyQE1nDhH3N12D3VydjmQQg5Dquv0POPINf2pvcqwdD7l6vZsop
	L5xBuyfLQ+GcB4L0yg0zVkexnD0J+9k4wFtBQMqLjQT4Z0MXMik=
X-Gm-Gg: ASbGncuO01vuWN9DrPfPMFo9y7t9sDgt24HumwcCB5Hg7ifCuvVRRz05D3J+KZxTfN4
	bTqKlTV7Zt8dDwlbvrTqK/diF+WrNvuw8wXuAuciJUPcQnetTivNVUzXhhz7KpkeV+k0eUlyrYR
	8tGcg61C3czWaamEyfCWDQQDfsQQaCIFaGI0zy9t99NsVZIhyag0jofnwhrZ8kF2M2nTJl+6RBp
	qQ/3R/pncBUoBylG8RRCRSkL2q6NgX0xXICOHd/11PjC4g9D2No46uojwL01okXrqt89EBoiXXa
	t+Zd9edFcZHT+d7t3sHG3SqasWnit8GskFvGXxoGTrUKnavYYTXE5lu4U7fp7Ym+8+WZ7OJ3ICz
	HVkauCg==
X-Google-Smtp-Source: AGHT+IFTUrPFzesY7S5XLhKv9h7x11RZW7LkIYqDI5b4pXvS38g73Wbp1S0P/EBF7w0Cm27fXcUEAA==
X-Received: by 2002:a05:600c:511b:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43cf61e702fmr53627805e9.2.1741641065289;
        Mon, 10 Mar 2025 14:11:05 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf595a771sm54980415e9.36.2025.03.10.14.11.04
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
Subject: [PATCH v1 1/2] drm/msm/dp: Fix support of LTTPR handling
Date: Mon, 10 Mar 2025 22:05:51 +0100
Message-ID: <20250310211039.29843-2-alex.vinarskis@gmail.com>
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

Take into account LTTPR capabilities when selecting maximum allowed
link rate, number of data lines. Initialize LTTPR before
msm_dp_panel_read_sink_caps, as
a) Link params computation need to take into account LTTPR's caps
b) It appears DPTX shall (re)read DPRX caps after LTTPR detection

Return lttpr_count to prepare for per-segment link training.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 30 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 3 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..2edbc6adfde5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,17 +369,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
-	int rc;
+	int rc, lttpr_count;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
-		return;
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->lttpr_common_caps))
+		return 0;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
-	if (rc)
-		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
+		DRM_ERROR("fialed to set LTTPRs transparency mode, rc=%d\n", rc);
+		return 0;
+	}
+
+	return lttpr_count;
 }
 
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
@@ -385,12 +391,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp);
+	msm_dp_display_lttpr_init(dp, dpcd);
+
+	rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
+	if (rc)
+		goto end;
 
 	msm_dp_link_process_request(dp->link);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 92415bf8aa16..f41b4cf7002e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -45,9 +45,12 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 	}
 }
 
-static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
+static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel,
+				  const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE])
 {
 	int rc;
+	int max_sink_lanes, max_source_lanes, max_lttpr_lanes;
+	int max_sink_rate, max_source_rate, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
 	u8 *dpcd, major, minor;
@@ -64,16 +67,24 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link_info->rate = drm_dp_max_link_rate(dpcd);
-	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
+	max_source_lanes = msm_dp_panel->max_dp_lanes;
+	max_source_rate = msm_dp_panel->max_dp_link_rate;
 
-	/* Limit data lanes from data-lanes of endpoint property of dtsi */
-	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
-		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
+	max_sink_lanes = drm_dp_max_lane_count(dpcd);
+	max_sink_rate = drm_dp_max_link_rate(dpcd);
+
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(lttpr_common_caps);
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(lttpr_common_caps);
 
+	if (max_lttpr_lanes)
+		max_sink_lanes = min(max_sink_lanes, max_lttpr_lanes);
+	if (max_lttpr_rate)
+		max_sink_rate = min(max_sink_rate, max_lttpr_rate);
+
+	/* Limit data lanes from data-lanes of endpoint property of dtsi */
+	link_info->num_lanes = min(max_sink_lanes, max_source_lanes);
 	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
-		link_info->rate = msm_dp_panel->max_dp_link_rate;
+	link_info->rate = min(max_sink_rate, max_source_rate);
 
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
@@ -109,6 +120,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 }
 
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+	const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
 	struct drm_connector *connector)
 {
 	int rc, bw_code;
@@ -125,7 +137,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
 
-	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
+	rc = msm_dp_panel_read_dpcd(msm_dp_panel, lttpr_common_caps);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4906f4f09f24..d89e17a9add5 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -7,6 +7,7 @@
 #define _DP_PANEL_H_
 
 #include <drm/msm_drm.h>
+#include <drm/display/drm_dp_helper.h>
 
 #include "dp_aux.h"
 #include "dp_link.h"
@@ -49,6 +50,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+		const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-- 
2.45.2


