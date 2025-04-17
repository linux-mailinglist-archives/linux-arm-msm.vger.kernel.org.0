Return-Path: <linux-arm-msm+bounces-54582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE0A91190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 04:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72DB3BD69D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 02:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACDB1D5142;
	Thu, 17 Apr 2025 02:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwlvoUda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF321A314B;
	Thu, 17 Apr 2025 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856037; cv=none; b=CnWEtXCPWylIbh17KYvployt8gQhMVNLbCmTY1mTHBMWGFFkOpTh68QcpQUzzaCXC5KYvVUWdOQeupiT3KsrD79h856jljwdjJIUJHDjDwC88QDnmpmg3ue0ZLD78XtgNBO0a9Uux+ayV+oRwJPDQYqLof7N2zfOz9dsct+cx38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856037; c=relaxed/simple;
	bh=TOHQAi3vLhD2HH4auq8iWvrYUmO6tddPj2Z3FgNNrk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIyHba0RNpZdvAgRX7c8sF3J2lD8lMKEQ4mtARCIlWbUSC3D+jslwSd9VJDP3YKG3m0BpZaC5VXtC7h+MGtMQjba07C/MapRYS1MwrWsrluxBEoUVE3ytHqAPC3QFrr2hQXQ1ZearzqQHIRFSt1Cev776EQCezEh0JaRI7M7mVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwlvoUda; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso174559f8f.0;
        Wed, 16 Apr 2025 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744856034; x=1745460834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiKAF8xumpKDG16lLTYF+amuABJyX9EUNgIyTBAAQEY=;
        b=mwlvoUdaRfXK167mFvLkSWLiPdK9cWHzYRJ8EJ1YOEksLqzH65jmjKmeBk6p81sNUH
         C00I/IbaaR5LMhnvnIVD+rtQVaiYUPbglaoo5knPmr/RD0f8EPiyK+L+gU8oS0YoI+Ei
         6kI1qL6Zx/ty16ROWc8RoiZrb01BXptcjYV2BOmyRIJet5VgSPesHzZGxdxtvU2WeArD
         iLMM86mgGKFWPFvzmdmwU7EmMQHp7yhlavtVMA+rMLKmgjdPq5ZkoyJH2QylcGl9uC4F
         fHu9wOkzTZHTLjPJa+3A89TO5Ji2M8jDA70tco28W9C5ZabgniC9AyQUV6fh6ilyePOX
         pUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744856034; x=1745460834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiKAF8xumpKDG16lLTYF+amuABJyX9EUNgIyTBAAQEY=;
        b=uUQHgA2szuKy0DMqUmo8ey4jzL4Ps+rJdR0rnZq+ITBNxsPtmaQ9DE+aD216JC/Vf5
         81qHu+uzSXx+fQW50LZgLklwdOaf+ul2Yp0buBJUBD6mfEIicA9/X1J4U+u8CLihGpA6
         aqCvUVtEdLMK63ABmcpm+2fNoXtKhCzCEctwtElCV2i539phF3aiTY9+YMKNY3TKeKOy
         2NQ4046DQdkIPZteaNeX9gWJ98FgD4bt+NXuYW4WmYTo0hNBQwzScYuBpz+AHlDV0kkT
         y9cTKnNrJY+SosFZ6mOQghFA3c0gcFfAn8vDagrILswmwdMpvY4+op7sHZVXgei3cNA/
         alug==
X-Forwarded-Encrypted: i=1; AJvYcCUmTsxz8GEWhXK+H9FHRgAqNm0yrmDAY5usT+3r2fep5wWPoGcuBJoZZH392h1AE8EhBX3UdlG/ogWtTNJE@vger.kernel.org, AJvYcCVw/9F5LtAieL3fxT11fVKscCtvXPByAs07FbaT2+XJnX5EYG2pXsCINdyZOqQTOLWRU2LanMWjmY/HNE6H@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6UIvgkAQs7KutrEAkU69HquQ8Zx4jexQmQJkCt2uBfDpyoZy
	8OyJ3d0nmmSnxrPNadR5/aAasI2Krj1sJL9+iGwSkUtDLSgYYI8=
X-Gm-Gg: ASbGncu+84Xgf8bEf1oCeVe/pVT8pxd6HYKCsSDhGmT4jSPrUpWncWZekYwlLuY3Skn
	ZeaNybvGS4u1AkndEZDV00MvVWHbZ8A05Cnd8g3ceTUSluOuggfrmAwsKcnOJVOv3HBXDrUBuxv
	8lc8jFymEeQHSlX0RglpxHmSboBLrqDPoPfmKaMWTzp6qJq6v13Vc5sdJMuJbFRZVLcIBfjFjGS
	zKVgazDO7VGbeLsILKTD4agpegycUQ/+FhMOofhUjzbHlwBjyH7YUUiMkScGnHhLn+uSS69flO0
	nrZR4Xz/ROEYIjsIJtVSqxpOXAEDt5dxUdWbATTkYPm76g==
X-Google-Smtp-Source: AGHT+IER0MvpbQy2etmfGig8mHy40gEeXrIqD175eUCLOGtP2Y4C5981p4HcbO03f79MbWw6TR2cRA==
X-Received: by 2002:a5d:5f90:0:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-39ee5bac57emr3587692f8f.47.1744856033728;
        Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
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
Subject: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Date: Thu, 17 Apr 2025 04:10:33 +0200
Message-ID: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take into account LTTPR capabilities when selecting maximum allowed
link rate, number of data lines.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
 drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fc07cce68382..5c57c1d7ac60 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -369,13 +369,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	int rc;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->link->lttpr_common_caps))
 		return;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->link->lttpr_common_caps));
 	if (rc)
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 8db5d5698a97..c47d75cfc720 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -7,6 +7,7 @@
 #define _DP_LINK_H_
 
 #include "dp_aux.h"
+#include <drm/display/drm_dp_helper.h>
 
 #define DS_PORT_STATUS_CHANGED 0x200
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
@@ -60,6 +61,8 @@ struct msm_dp_link_phy_params {
 };
 
 struct msm_dp_link {
+	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	u32 sink_request;
 	u32 test_response;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 92415bf8aa16..4e8ab75c771b 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -47,7 +47,7 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 
 static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 {
-	int rc;
+	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
 	u8 *dpcd, major, minor;
@@ -75,6 +75,16 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
 		link_info->rate = msm_dp_panel->max_dp_link_rate;
 
+	/* Limit data lanes from LTTPR capabilities, if any */
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
+	if (max_lttpr_lanes && max_lttpr_lanes < link_info->num_lanes)
+		link_info->num_lanes = max_lttpr_lanes;
+
+	/* Limit link rate from LTTPR capabilities, if any */
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(panel->link->lttpr_common_caps);
+	if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
+		link_info->rate = max_lttpr_rate;
+
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
 	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
-- 
2.45.2


