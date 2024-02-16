Return-Path: <linux-arm-msm+bounces-11430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6285899D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02741F22671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17FD14830A;
	Fri, 16 Feb 2024 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a59hjOPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB81487D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124576; cv=none; b=d334EJGBFpYAHhOQOlci70xYIdD8Gm2RG7e19a/pBNBBjHce2sTU5jH8oYb1aoNOgoGCTbKKJfDMrRfydZHCCHwIsFkSa0bomK8Fqka51HA8ykeIncn+3zI+NRK05QM/rmZe5+U+qxK6PgzFnuTRdWV227QnISFD8h6KgieJ2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124576; c=relaxed/simple;
	bh=vMqt6rEP+l9sqqNHJ7BnZb5oO/m1175BY9qBK8Ac9ZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNsnSGfMut+Q3cRvB1YslyhWDHmPsTEka1jr8iXZsQlRjVeVhghkPHsFHOCmFItI4zQ62s/V84JgPYfQvxd3VJYehspedmgQhB3eTptME+FKluX4GbQqyulv3rYXeN0royIOjmmzvWM3v9+ur2ptPoP5nFUz9uYIMZDIctTyLHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a59hjOPi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GMJV2A010529;
	Fri, 16 Feb 2024 23:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Q7t9OJC0ojL4yxbW9lA6PYhl1OcPicECa2MRPnBpSXA=; b=a5
	9hjOPimN7pbGGXnVAbLpjTaHYpi6w4U1ksAg5jDn7fwAmSQR9/nLvCcSt2lqimpt
	C7rEcltUJafMzuPaZ36RDSnLaLt66oU9TjpRuV8JEPyTFZV93NFkeoSE8jCP5Els
	9X8DUcoR2rbxGm4pRFvtV/kcYy5dmB88arLeRTXfrXzgHKAIVVMprYWfJrdTIR78
	jyjtu79ra2HVg5SY+Sxi2aj+WKQMCgOGAl/G1GW9dHU+tF6qyfk/rsIL8V5Mr9Ge
	JnF5eaSar/eKcYh0+b1KPAqGuY5aOQ4ch3ArjuGL9ApFRwVVsk02cqVSin6FpqR9
	XHfKyQDLJS1ZPwFcrqbg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wabeernt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2nrs031048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:49 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:48 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 07/19] drm/msm/dp: store mode YUV420 information to be used by rest of DP
Date: Fri, 16 Feb 2024 15:01:55 -0800
Message-ID: <20240216230228.26713-8-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6DCyYW3HmV11pXD52njna2ymRdMGMo4e
X-Proofpoint-GUID: 6DCyYW3HmV11pXD52njna2ymRdMGMo4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182

Wide bus is not supported when the mode is YUV420 in DP. In preparation
for changing the DPU programming to reflect this, the value and
assignment location of wide_bus_en for the DP submodules must be
changed. Move it from boot time in dp_init_sub_modules() to run time in
dp_display_mode_set.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 792191f67717f..1a84f68e2b59a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -785,10 +785,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	/* populate wide_bus_supported to different layers */
-	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
-	dp->catalog->wide_bus_en = dp->wide_bus_supported;
-
 	return rc;
 
 error_ctrl:
@@ -809,6 +805,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
 	dp->panel->dp_mode.bpp = mode->bpp;
 	dp->panel->dp_mode.capabilities = mode->capabilities;
+	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
 	dp_panel_init_panel_info(dp->panel);
 	return 0;
 }
@@ -1403,6 +1400,9 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	if (dp->dp_mode.out_fmt_is_yuv_420)
+		return false;
+
 	return dp->wide_bus_supported;
 }
 
@@ -1616,6 +1616,15 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+
+	dp_display->dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
+
+	/* populate wide_bus_support to different layers */
+	dp_display->ctrl->wide_bus_en =
+		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
+	dp_display->catalog->wide_bus_en =
+		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
 }
 
 void dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index a0dfc579c5f9f..6ec68be9f2366 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -19,6 +19,7 @@ struct dp_display_mode {
 	u32 bpp;
 	u32 h_active_low;
 	u32 v_active_low;
+	bool out_fmt_is_yuv_420;
 };
 
 struct dp_panel_in {
-- 
2.39.2


