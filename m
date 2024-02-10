Return-Path: <linux-arm-msm+bounces-10447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC098501E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 02:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19EFEB25FAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 01:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E746B7;
	Sat, 10 Feb 2024 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ImZ0juLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F84414
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707529972; cv=none; b=sj6H7zieEO1JFuyex3oSRibAPo09Ca0X3cVTjBoQiK27Eg1XBFhyqqdWLGKApQSAc9mxSEVUfaaKAs1X30kkEf68VKh5bZVShuJL/6v+yz/9ijERxeh/QNSgIpKNmnQr9Sor36/VPX2vmD830zl09LC7oTQNVqxLhKszWPdwtIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707529972; c=relaxed/simple;
	bh=kB+AhEBFoq7ALQClkNmBWA6OE2JVbhAYKEjX6H+iPwU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJCoMjdXDBqxKBARnRdMcjuJY3S9D1sJeGkTTrmSl7qaQT7vC1t8JHoELnyG+q0YZkBzC553fT8+1t7+ON2RzzzO/dZGjsY8lAbUyde9CuijHl7pFrKmHs1ftUm7Ih24zsncjRORsntuiNt1qUOo2aKvNsULkshH5rrj6tEw5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ImZ0juLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41A1Zutq027976;
	Sat, 10 Feb 2024 01:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=1b4ph8V+GhnBd4Sy49HAVwhTNlVcRHUGHWFvmn7Hs28=; b=Im
	Z0juLnFiMxTybAgjZxQ8JRvwMNBiF/ni1E3NM0WItjMbmeeLqlIJDgpbrsYKajlq
	syNH6Z3RWScbUfae60u4Q+ZvJsIUrePAkHZ09FVqRxy4k1uEU39Z5x3yh007M8og
	lkwdDdRqVUe8J1a1Tuw1AVMQ0xKpFa6jhagmsmAcDzJxYrK59N9U8hGeeqFivX5S
	m0yeIn/RY/I1k9kgSX4zI4BgMTkMDH5CJiGM/PXOrHJb/anzcYG7GH8J5eGm+L4U
	at7KvOVFXQOTvhbVAbrgVqRzMPLgj89PX9rlh4CVDDLsR9zsyMMJXr0mvicejz92
	eGArpeOlp7Y5kXHIx3ew==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ann2kku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qgbd028021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:42 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:42 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
Date: Fri, 9 Feb 2024 17:51:59 -0800
Message-ID: <20240210015223.24670-9-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FLlbWn-SxAqfRy2pPYQtvNnpu5N0ub84
X-Proofpoint-GUID: FLlbWn-SxAqfRy2pPYQtvNnpu5N0ub84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=753
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100012

In the DP driver, check if VSC SDP is supported and propagate this value
to dp_panel. In dp_display's dp_mode, the out_fmt_is_yuv_420 parameter
must also utilize this value since YUV420 is only allowed when VSC SDP
is supported.

Changes in v2:
	- Move DP programming when VSC SDP is supported to this patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
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


