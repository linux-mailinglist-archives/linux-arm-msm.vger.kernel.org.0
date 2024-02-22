Return-Path: <linux-arm-msm+bounces-12228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7586030F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 018AF1F25A69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E196AF9C;
	Thu, 22 Feb 2024 19:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TE7pLiFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177A6AF99
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630855; cv=none; b=sNG51aj1KP0LFQE3MwJvZlbwOWsWyUc9Dio1FOT6i4I6EB02bm8bpAkR1JHk8zSNE++7V+xWO3y/U2ZGMospSM+NYAx7RAmVj0byUA36H/vUMuzLk/cA2sRrUG5po/KvLBatbGBPtQio9cTlD+NLjY5J+gBJTZuuanu3Enqnh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630855; c=relaxed/simple;
	bh=F7CpIkfdQMUyd5XLt7AKzDFxMyKSuwfHPOpcYKIH8oA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R79+MzNsqQGuLagOmU7Wm3OXUDZ+VYVJUIk3xMRDDC5sK6nqcVsWN4ETEfmqv7EvcGBaSoSGr7umGzCZug717zz7xuBUzBrRbGzpAPB1hLhjswGMuPHKEMUN3zUp4/s4TT98Gjgklb8+jApMe87Fw7YeUOYTIie8JuIb73ifJfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TE7pLiFX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MCMCRw006807;
	Thu, 22 Feb 2024 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=XVM0awCe9wQcpKgEcvaY+xJAlnKcMPfQgy1aHvg2n2s=; b=TE
	7pLiFXcZNxRMAodI3FXT3pdEVNLzyyrLNxrczH8IeRRtZQ9u3BacwtaF5vBbUM5Q
	AjYVm4C51OHrvxNF77P4mEF+QNDQEDwSEOjCHeeT0U4MGnNJuTNJ6xk6RZCUGhh9
	hGiqUIdM/Aetxbt1psdF4lB3uDxQT9Bqa8yMdwXHVs3S95UUX1UvajGo8l99kxPh
	UTt+MwQbU6UPk2XVrNF3LOB0koOM83HgzaQnIbZE/94bh2MCoe1RoHbAhPDZZMYg
	ZAtIMZDG9GvHj8plc8tIYZFyiuRfK29Vja7qUJQtibqKoYDKlAoN4fsLMm1gZFMf
	y2NP9B3vqHd6q2+B0Mew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we24aj9f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJekex007199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:46 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:45 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
Date: Thu, 22 Feb 2024 11:39:53 -0800
Message-ID: <20240222194025.25329-9-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FthsWzuD3zBcSO9P3AU51lcVtVgUOce9
X-Proofpoint-ORIG-GUID: FthsWzuD3zBcSO9P3AU51lcVtVgUOce9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=896 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

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
index 1a84f68e2b59a..4b1b79b74bc72 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1596,8 +1596,10 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
+	struct dp_panel *dp_panel;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	dp_panel = dp_display->panel;
 
 	memset(&dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
 
@@ -1618,7 +1620,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
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


