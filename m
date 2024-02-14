Return-Path: <linux-arm-msm+bounces-11059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D0E85519E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922EB298064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FC91292D6;
	Wed, 14 Feb 2024 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gbNjZEuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259512CD91
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933863; cv=none; b=SjoC//Bk0fTroh7M8+IHNK+1RlCXFGQQ+Jmz0lX9XavCB5FnGkSMvrxFljLBuiG8mcMO8rz8sA1dvAdZgTS5AcISsLvdlJJoJEVkelHt9QVxglSMxVRieVsN8NXt7pvRWKMLUj9QxxctgibSLKB7uvZPDxIozaZYog674F/0znw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933863; c=relaxed/simple;
	bh=ikSoaVTgou4QUhyudEBKUbV4A4oD911MoNo8QVt9DGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LcnJ2MbVNIXaaTeel7+Ca0O5P/XQ+Wmj/ztno6/aQfjZMMGLG0qpKvQI5e8ICPs6X7AzKhpTNYdWgJit3EV65Nkje+P5BQBQjnLxD4ZeXR8JJiqZzptjQ7qz58F/jEkUb16gEY5IN0Nyuri+MVmX8BLknYAhPiVE6/on5hVn/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gbNjZEuO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EH6XJW011079;
	Wed, 14 Feb 2024 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=YAFY7yQuZ1+VmApTZoiKKfi8JaMMtClKcl02cntHS7M=; b=gb
	NjZEuOXUPkOIZiUOnh0SLfB7ou50/Gy1mgvpRqJj83y9zP7BNq47ZCjX5N4B2NQr
	wRXt8RAZo1lZd8nTUQcmeUkhI8dmnILN/Bqo1zzb9Xugz8JnXj3mklbhCaVup7Ej
	U114K0om3ky3GXP89JJl4q8S5PQ/6xxt1cl6XMLZKlEvJzjfFucCAm9H+ahSQbxo
	7uiO/SB0ZiHB5fHOHiHyCZLDTnqNi4rwk88kbwfKD62AgAZSO7CLdqFu6aEylhFm
	P3aV/pRL3EdMmViBbfTE5WV7IImfGjZcwvN1jC7MLAgHCc8lwOAtnMyagg5JnUp+
	1dTVRyxTCTMXyBsNUWeA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8eksactj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI49Jv032203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:09 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:09 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
Date: Wed, 14 Feb 2024 10:03:30 -0800
Message-ID: <20240214180347.1399-9-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1EJszySTOu2EqjD5AkSRZtsVqfRNyQ7R
X-Proofpoint-GUID: 1EJszySTOu2EqjD5AkSRZtsVqfRNyQ7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=778 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140141

In the DP driver, check if VSC SDP is supported and propagate this value
to dp_panel. In dp_display's dp_mode, the out_fmt_is_yuv_420 parameter
must also utilize this value since YUV420 is only allowed when VSC SDP
is supported.

Changes in v2:
	- Move DP programming when VSC SDP is supported to this patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 1 +
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ddac55f45a722..6323dc08d5eb8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1595,8 +1595,10 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
+	struct dp_panel *dp_panel;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	dp_panel = dp_display->panel;
 
 	memset(&dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
 
@@ -1617,7 +1619,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 
 	dp_display->dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
+		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
+		dp_panel->vsc_sdp_supported;
 
 	/* populate wide_bus_support to different layers */
 	dp_display->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 127f6af995cd1..db1942794f1a4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -53,6 +53,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (rc)
 		return rc;
 
+	dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 6ec68be9f2366..e843f5062d1f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -46,6 +46,7 @@ struct dp_panel {
 	struct dp_display_mode dp_mode;
 	struct dp_panel_psr psr_cap;
 	bool video_test;
+	bool vsc_sdp_supported;
 
 	u32 vic;
 	u32 max_dp_lanes;
-- 
2.39.2


