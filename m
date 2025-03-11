Return-Path: <linux-arm-msm+bounces-51076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF35A5D340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA7B189D9DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 23:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFA9233737;
	Tue, 11 Mar 2025 23:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guks1As+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BA71F09B4;
	Tue, 11 Mar 2025 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741736479; cv=none; b=Vu5x2mcKp7pknaS4ZzVt8BWC3EBVSYI9OLyMiGhHNamSutr5eRF3OH+bs+aqj2UwB1JYNM55uRlQ5Z6tI9yUQWCLp9OvaN+bM/O72S1Y7prbcOTXOayiDts44beCCkk3dlh1Qn9j4P6TF3Ctapcsv2ZvZTnmtZgJaDFFX5jyKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741736479; c=relaxed/simple;
	bh=OyUUgOWlnDebmz4S1DRu13bg5gOUB5HPBWPcU0aM6QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lONT77g5b/GipkgLCvBlREkR6GrEQldi/kojfgE1NJKXn5JBuZtT//1Mav0Gc3G4p08tA8AmWCV9LR+xoCmh6T2u/kfSpySE3uVaOGaENXJ/F3v3WUpc73+pLXmIG/RVS9/m9tm6zrn7pfnyCPITqXJH7cXo6Szmq6WZx1GZ2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guks1As+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso3016591f8f.3;
        Tue, 11 Mar 2025 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741736476; x=1742341276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4l/oaCQRVDlXaGgtOTR3rjmRlzQQJyPgMUHku9RrsM=;
        b=guks1As+3zM1R+yslRrFexsb0uB6nHLbHt8P/N+7jFW7YjS1bJj8p6QSnMp7j3u59j
         FTCvWCeo/7Zw2NQ3SRma9Wz8TfqdoQjXUWuzxiU0ubhIy6IUsl7p+qQn//NhXMk++k7r
         2xxJzHAeegMFnTWt9V/Ue6S96iic9e7+UQpW2EJoffwi+UFUvzUd8PhqrojqbYb8gdi/
         X1x8OTI6AFXSDUiGk0b60P9+N1ZxjiDvPy+82aPx3evmwrZkSyab2ITA1ANR+FYUcmcJ
         z1uzooAXT2wCRasAujW48YB16SShtlJPKxQnS0+/DF5F9r+GA2r0Z77h/u3oEwzSFcdS
         h9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741736476; x=1742341276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4l/oaCQRVDlXaGgtOTR3rjmRlzQQJyPgMUHku9RrsM=;
        b=FhatLkwCQrTKvYBWcPB0gmSiW2OFUIpqM5vzdkivraJ7D+6/tHcD9EdIWBid0teIxz
         Z6qMhNUjvZv4W84g14o0iv+nJTziDCcoRPDj2T4vh+86C4qQsg2xD9atyDkirWJ7G9QH
         t/SM31K7HZCDJV3/H+upppzqVuCAH3RgPM5Iqk/CGioSAb5NO/6ZnXdwKeNLbDyJR6m+
         jJz1iXKjqhY5dRl/kezK9YdfHfoNskf9STDhc12H3T9MnK4sC3bS6oeSlMaKRm52Pamv
         d+VPr8whcEKola2Pq+11RQVoJ1HO+ELJ2zPqy7bL1EUapmQodTfUruJIymGS4bpHW1fX
         cv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5cjQGYXEzULh7L511ZHlizul+toJ5H9D7yX3lIBgAKbo+IZvH1PHbYCuKXP/3lcEferY79b/kPvf2bK1h@vger.kernel.org, AJvYcCXwwUhy2VDnKD4mHG8Nj26cFqAtwd8XIwDhszL9/lZiuJ4AS1pKUfRRvUc2RuBa1yr2EhjnByRoF00p5zKG@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJijcP/kGespDTmRZrAW31MX6GK9RInfipPRk0RoWuC7ZO+U0
	eT4aUTva78VEsw5ua8cZ9M5tj9lRUyiE49AuUt7frOJ0uyAzZJ8=
X-Gm-Gg: ASbGncumGe8L1UvYDIA8m91WAxR4F/kTMV1XCeJ6K596sQC/mhuLvfLF1inxkyw+iqR
	jAmibz9ZJ1NzXuOc4rFCMehmoRY8hXXsroSJdO+u4zpNpZLyW6Y88fcaAGrdS7uy0isR9AGDuwc
	zCRtVqJODD3vO9U+WkgG/eUtCJYJjv9wUs0CD5Jyw0rnFgme72+wW6mCVcfgQkuG3beoNdK6VF4
	6X27//7A0CmWQfDygMJ4hg0F/BLTBqiYONiH5HGUTR3POgqUsTtUKCslIYBLy9cQ0H/j0jSE1CN
	tLlJCeJ1MyOwUySKs98vFdJG5XLtMxn3gUL+xcY8Mlg56PNi6/MhAVx1NQfOx7LDZJbPMREDJt4
	LHkf3iA==
X-Google-Smtp-Source: AGHT+IHB9g+En0CWc1s3jiznwqoGbtpaeJW2BYwZ/bRVnWuTmdukJCDX5lWiuhj/D6s9X3feftILPQ==
X-Received: by 2002:adf:b197:0:b0:394:570b:aab6 with SMTP id ffacd0b85a97d-394570bac03mr217849f8f.37.1741736475279;
        Tue, 11 Mar 2025 16:41:15 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ea88sm3988345e9.7.2025.03.11.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:41:15 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/msm/dp: Fix support of LTTPR handling
Date: Wed, 12 Mar 2025 00:38:03 +0100
Message-ID: <20250311234109.136510-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311234109.136510-1-alex.vinarskis@gmail.com>
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
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
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 30 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 3 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..d0c2dc7e6648 100644
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
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
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


