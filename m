Return-Path: <linux-arm-msm+bounces-11070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A38551EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AD6BB2FBB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4521312CDBF;
	Wed, 14 Feb 2024 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sx6S2Fxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E812CDB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933868; cv=none; b=LhF8DChYQfZ0qUL4l/t7gd/R3swg+ryoqB4F3uSQVGVEGfBXQCQ7KV2mWHC2Xa8Z/MUvKq7YMLy6Di54uEupG5N09Pfysf+MsbTT8KIuWjHBE1FoaFqXLKVHPbuW7uLjNx7QZKffGS+gq5UVvXUC7YpRqbuRcbnzWZDOB9JrkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933868; c=relaxed/simple;
	bh=TWQF+skqfIckWOywfxADDU1rXFNF+g8snokZRgcnv4k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Md94FsOsXGZH9oHce2Oa+Hr2jdI1ZyZNnIBfiuWDpJ4tK0OFaLMVvHKOnyGWLHWgNGusDOpDhT4zp0lx/edKhyHpTnry3/hxsa8UKHqqefplKqlsdkk+475sXgoCwurcWCxxfY6R2Ha+fDJ+cBX9Tfz+VOt6Es9PiTgt10NdzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sx6S2Fxa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EBiiwt016022;
	Wed, 14 Feb 2024 18:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=GFEtG3QU+aeeQYh4tnYcW6HJ4M3lvZ0KmCht8GlUVNc=; b=Sx
	6S2FxaM9z6o0Smn07C/JSebyCFz+9LNCiSfrkU/CTEX0Cj9SNuO+ah5egovRZx/r
	W2JOJlJ36p7C6louVE9XE9qyFY33CicmjWf4QCS1OVeoikBQUiSAQQ6tvM+Mmx3f
	IbXyu50f0tZVGfS/MMDtUoyEsBW17YrRmwrrpUd6vd9Djq2xJygIznI5CHN4sh0s
	XdyNJyePwxPSOWj/jGgJWCljqPwTG9vEECnyHR3L/tJQkmqnF2QgtHTj+piaXyVp
	wCnJFhZS0kpBdkSS5EAg1vyufwrfJMOyaBxNz//sQ1ct/255SSj+JTBOBotwka46
	ODpJC1keX/mGu7O2ffRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8448usp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4IJ2032468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:18 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:17 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 19/19] drm/msm/dp: allow YUV420 mode for DP connector when CDM available
Date: Wed, 14 Feb 2024 10:03:41 -0800
Message-ID: <20240214180347.1399-20-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: UckuAdmA0NTn0jmCnkiol6mqoNTe413z
X-Proofpoint-GUID: UckuAdmA0NTn0jmCnkiol6mqoNTe413z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402140141

All the components of YUV420 over DP are added. Therefore, let's mark the
connector property as true for DP connector when the DP type is not eDP
and when there is a CDM block available.

Changes in v3:
	- Move setting the connector's ycbcr_420_allowed parameter so
	  that it is not dependent on if the dp_display is not eDP

Changes in v2:
	- Check for if dp_catalog has a CDM block available instead of
	  checking if VSC SDP is allowed when setting the dp connector's
	  ycbcr_420_allowed parameter

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c         | 6 +++++-
 drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
 drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
 5 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d821431..8d326fb36550a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
+	bool yuv_supported;
 	int rc;
 	int i;
 
@@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
+		yuv_supported = !!dpu_kms->catalog->cdm;
+		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ebcc76ef1d590..9b9f5f2921903 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 }
 
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder)
+			struct drm_encoder *encoder, bool yuv_supported)
 {
 	struct dp_display_private *dp_priv;
 	int ret;
@@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return ret;
 	}
 
-	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
+	dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 46e6889037e88..a819a4ff76a9f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 }
 
 /* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
+					    bool yuv_supported)
 {
 	struct drm_connector *connector = NULL;
 
@@ -364,6 +365,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (!dp_display->is_edp)
 		drm_connector_attach_dp_subconnector_property(connector);
 
+	if (yuv_supported)
+		connector->ycbcr_420_allowed = true;
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index b3d684db2383b..45e57ac25a4d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -19,7 +19,8 @@ struct msm_dp_bridge {
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
+					    bool yuv_supported);
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b876ebd48effe..37335777f5c09 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -385,7 +385,7 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-			 struct drm_encoder *encoder);
+			 struct drm_encoder *encoder, bool yuv_supported);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
@@ -403,7 +403,8 @@ static inline void __exit msm_dp_unregister(void)
 }
 static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 				       struct drm_device *dev,
-				       struct drm_encoder *encoder)
+				       struct drm_encoder *encoder,
+				       bool yuv_supported)
 {
 	return -EINVAL;
 }
-- 
2.39.2


