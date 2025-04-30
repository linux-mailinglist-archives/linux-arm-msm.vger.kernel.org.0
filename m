Return-Path: <linux-arm-msm+bounces-56180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E900AAA3ECD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6238A173818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26761EDA06;
	Wed, 30 Apr 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTA6nCe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5261EA7C4;
	Wed, 30 Apr 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972029; cv=none; b=JIlDIt/uYg06nHvXOnZrGb0/ip96JrrqPEwu4/qOS2r3ejaT4ZSK8S9U9puvp0itBt22OG5TCOtrAVZXpdIvvAEFymor3eSo144VELbwNTcDCG6MTytuLG7cVFWaD+PgozGfr4Z33byxXtxeIeTHS/IGIMfQiYaf3MMLqmBwHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972029; c=relaxed/simple;
	bh=OrCDySuyEcSKdE24OYFPQuDDyNhs6Qiqaw1xXkN8dHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJthDCd9qFe3GqxyM/L9e0vcIsCP1aGlvYpoZ1USHsCtquB++Thcd/O5gXTe71ukE+w8Cw9Ujr5kh601tJz3/Q3/xNfBrJj3XdUoubTwiB/4b7BdYZ26GugIA3X4MLw+wFfSemaI1CxB7QOfapGQc7eISLLtABlso0rlLTrgSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTA6nCe3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913d129c1aso268076f8f.0;
        Tue, 29 Apr 2025 17:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745972026; x=1746576826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeBQSkZGCY/fF6ehFHkeTsPAOEs2fzD17DZuZTOEb9c=;
        b=TTA6nCe3xsTpZlhicmgYGcY3ZjyE6t2Is/lEebNOxFW3UqSPHlqZtEX+YvjtuHRfr6
         vC4w0a/NbLE4D3JVytct33Ft8m0e5p/oysK+IfVcqIYjED1p5RF58hjuiWzK8JpaEklt
         bZm9PMVW21HPk43bALP532XQcuV/j5eXBeNcmdW/xMfSZjWB7GaRWJYpMEBhd4IijUMF
         05Pt+X0IyZ1/mNXxnZQkQB7S/QPG91qSCDZxSfPEbX1ON7WuI72oPwdVyneDcDJHVVtF
         PnPhMLsxG3qQ1m1aOhX5yPJ+gN7MymUfvbW5Rye/6xRSUjouCZikHD9fVmdCn1v2lkM0
         rDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972026; x=1746576826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeBQSkZGCY/fF6ehFHkeTsPAOEs2fzD17DZuZTOEb9c=;
        b=JmtIlhUKpf3NqG6xZ9/uqoEOTGucveNs7JOvkbh7ICsCH64DRfohBZ1LEOqGbCXCse
         U5fBiPXVF1mC6JwV2fpvT7rqy3itGPyGemNVgRYiC/PCmg3QZQJiXAdCnOEkhT8bLaiQ
         pP3IMijNyLl7Rp8lTszyemZq3FYLPTM1gmlLrq6PpVGSMMhysNUbKPuOwbQGkhK2QZha
         EH93UoorvZZnT454AWqA1/4U1zwjEsOm5CfECrTg90ReNXMyoQXTVNo+I43zIzImejOJ
         PtD17TYLHTC3h5TmHEcIO7XKiGHiK1QznYDYsgkSZI5/x9rqz3lQ6lffwmTOaqmBryJI
         l1qw==
X-Forwarded-Encrypted: i=1; AJvYcCVAYh1HnLLKUJgCcyPe6KP3IvspLWdYxxqMyErQkBMXwA/msDDxiebUE2YC7jyH0oZz12KOKadvzOIxyt6V@vger.kernel.org, AJvYcCVfzjaquX0u8onYiZri5ZssQF8WmmBvLc3nDo6RRG/eeHuYm8XY3t/Kfmz12KbebRpOdQNSIWL5UOezwimP@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWdDSAzd2rMgaD6+NchQS4OxADZDUDCTSIWFVFDffLP0hhOSl
	EZQB1MM/I4T8SX7Wdt969cEJ6K/ugyfUAfELf7IcdiqjzrT8lRw=
X-Gm-Gg: ASbGncs1s62TBbVeB0PJJmOF48/5ZYlzci8KdmLMU2iawoPNCfdYWtdPJJVS9vI22pt
	L9WQB3T7Hd+QZe2v0ku5jl6wUyTva7PkU/CY369qGzhFWxigIwj/KpFW8mntRkIFpaMSQLBznV3
	my6OefOdFqeXr5XjichdL6Tbut1GaCJ9kxapWSGcqp5q1m6UceMUUZ92TH3hphWI49Hoe9Owj2N
	/onib70tbF3XUyPBxa3unwToi+4aKs7+h7+Q6GSAsoJIy5ZtqYtzyDX1nXa/k3rnRpgDXJ6J0nE
	gjlDTwlTKQ69PuEhukcjpIsLw50MH4vK1NikyBmvHUDh8vghIli4isM7
X-Google-Smtp-Source: AGHT+IHTReNXREapKvhXSnrpwwk2SY3zhJ2rPqmjyK732d0QelsnZwq4reEL9DnRspJ3K/VagfvFMA==
X-Received: by 2002:a5d:588f:0:b0:3a0:6a86:9477 with SMTP id ffacd0b85a97d-3a08fae278bmr544338f8f.0.1745972025990;
        Tue, 29 Apr 2025 17:13:45 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm15574565f8f.99.2025.04.29.17.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:45 -0700 (PDT)
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v4 2/4] drm/msm/dp: Account for LTTPRs capabilities
Date: Wed, 30 Apr 2025 02:09:45 +0200
Message-ID: <20250430001330.265970-3-alex.vinarskis@gmail.com>
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

Take into account LTTPR capabilities when selecting maximum allowed
link rate, number of data lines.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
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


