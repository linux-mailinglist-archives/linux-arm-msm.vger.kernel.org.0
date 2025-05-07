Return-Path: <linux-arm-msm+bounces-57199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD005AAEEEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A683B99B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE9229186D;
	Wed,  7 May 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh0lXmy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207E20487E;
	Wed,  7 May 2025 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658885; cv=none; b=Moc00LSQ75psBX1Z4Cdrq4HiWovJzVnLXHzfQjqk2TeyZSh4MwRS6EKDvd126ghiZz6wrUNsFaBclPJIPF9pACJwYUL86w19hFmRuiQRWnZMGkRe4hRnTq7v3Rm6CO6K5kLywGiFWP3uf1tHqQJq90d4qb/s4yv41tLZ70fCzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658885; c=relaxed/simple;
	bh=FXuElGAeBvyiR7NULoTHz3owGjeVv5aXGHiDXz5jvHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcXe5/GWaI3sp/VOw8byV+AnPCZx8l7zqqHjSs/Kkm09ft2fumRsgcT4NQg1xTHqu5M53SfkWehgknYkgz75jpZb1TqobM2RtrZg4kf+I7khHC3w+EsBfRZlWMBlQ/7ZOP4GAZMZTSfuTrksHgQZRO45YlUDtSt6kds+6HXvZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh0lXmy1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so604944a12.2;
        Wed, 07 May 2025 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746658882; x=1747263682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vtr6Z3uXRjrwIOudB2G0wwIqDwu8zbz8ZZjV8N4QrW8=;
        b=jh0lXmy1CoUJogZAGWTw7q2VUpDyOpeWGHTCubHX4GbzVb3Snlx0f3/Oxjxku+mZ86
         esrdaFFDtyNJN7uZhXr+12ChBJGneahOXduTLfaHL+WGgYVvnPM7Nt87VCTVXZanikGi
         ZGoNum4eCpT0IUji+/EA8ILbL+4RLSsBKRNA014ZGnywMcHdoFCQKh5/9AEf4YGt4UYh
         HBRwCEV1ARi+DE4AGHzacaBT+YKGcrPj+ZMNF2X95O2zXeVXnnGf6kBRvfRLytMd0GsG
         nmX2wG6raDw39wW3dToknWdYJ3m/Dc5phQHIEqN7pk48ALQC06nALKUcg9AaV8Y2iLEG
         c8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658882; x=1747263682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vtr6Z3uXRjrwIOudB2G0wwIqDwu8zbz8ZZjV8N4QrW8=;
        b=CwDftv5YJLAGD9+ss75+HlbMOjW6gsJNBuMmA95N+VC0Na7Rlgkmd7MsPlquEKNjJT
         n0mgKbyN7fP3jBh+AGM99Zov0LBaym5eV/9vANWWbnCWTIglTGS3CndWK8t0iudXu8Q9
         gVSy6VVdhl9BMrJ4fnl4KvEHg+duEYn/1gIuwc8ZfFGohudblIQUckplbUbdXol+ZKta
         7OD3ZO/lNBE7fo/m7t/5CUG592S5ztab9rZf3LyKwPEVRrBkMm2Gbv/qcMZ78gLYGUsu
         NS3yT8nxiLw+v8wF9BpBfyBvrCQXsbSVteiMdErUYX/a+OzU8jlxEhU8MgbVRv5tPlDT
         8J4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAkK1usFFdunuFjMS1iADxNxXg86wCtAsMBmM0y+kU99cO8zFv1uiKZcXNXGEpZiO5tUQ1gfh8CgLVxzJ1@vger.kernel.org, AJvYcCX9csis3fkNABzYUeAmh36nEYjDJk3iCpSS02f9bWxezWJZZ3GiLRr52BVt61Rn32aV+z3M6rT2vMtGeHgU@vger.kernel.org
X-Gm-Message-State: AOJu0YzXs9ZbJlqAttGHz74p0fRo1b+GNWxKpCZ3i9fysCgRlYwYgPkd
	CXdt4CpiAZRQx5TpvaCBsosJUfo4xKtma6UP+Ql1GIPEqD9ojUU=
X-Gm-Gg: ASbGncv2/MtfMUn9F1u8WFBzhIdWCext/fQWKpDL/4dDSHwIQfo8drYBoSu5fDdPGQr
	x+8ZmwOdxwV1QlwaJ/2lEAE3/RO0khR6L/l2BXHf9Hm/SdzRbv5Y2XblHmshs4670JkyOGpgh76
	ZsdS+yTOlTRuE8XpDyvEt3rI2DF2oAIiVJHdaBVi3CaBUrN7L5aQ8tHv878p0Pjt2Q2nBm/HIWy
	WIwinZmChToe2I7yo5CbBYWIyElZpX2BvUOFFvpCa2BYkfh2ODRa8kPki+G6qYdKXc5irEfHS5T
	DyP2mCalGogH8sswzesRSzuzanlKGYQC9d+NIEAtQU8vVw==
X-Google-Smtp-Source: AGHT+IGgOqgiwXozfNdElrzWtq1i+GFP3auhQlx6gHo1wpD8zyMRrdBGxZGV8laM6gYsqYdlG1vMyQ==
X-Received: by 2002:a05:6402:1e8e:b0:5f8:e6de:fd0f with SMTP id 4fb4d7f45d1cf-5fbe9e49289mr4179538a12.15.1746658881721;
        Wed, 07 May 2025 16:01:21 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:01:21 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 2/4] drm/msm/dp: Account for LTTPRs capabilities
Date: Thu,  8 May 2025 00:59:00 +0200
Message-ID: <20250507230113.14270-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take into account LTTPR capabilities when selecting maximum allowed
link rate, number of data lines.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
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


