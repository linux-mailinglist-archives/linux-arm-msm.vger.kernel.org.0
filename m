Return-Path: <linux-arm-msm+bounces-12227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6486030E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76C73284457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA0A12D203;
	Thu, 22 Feb 2024 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KLlCBjbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1E6AF98
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630854; cv=none; b=k5tzHHlTcIE6G4PPtwCMUkiSAegHMER4n1q5p/gpUdKR7VjIKNmh3AvZxccgj9+eHLfRBvntKIKmpsY4AYktVWYTWs893CE3A0X/6lO0HzMt3wzPEMjXRrRXTjfc4H2KuYxNp1p6lyRQPyAszO0k3E8LjCIdirLBWcLQgmyV7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630854; c=relaxed/simple;
	bh=2d1tozlNQB1WaoN0jmpwcCrXu/Y1rBwnzQZNrYHfBE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIbUFaWkbyEfxtw/yQP7BR7PaVmwWfDg3sqK6moIhZKqhzKU51gUus2ugfw1S+XgWrbtBkfL2O27oaXT51KgENX0Hu3lMoq+6Ta6QXavUioJwnNVX7gR87i74stRog79FrohfwsF9Gl3Gkbg4X5kU0QdA8ktHoZ9ShlhCEOQHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KLlCBjbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MGuGrS007692;
	Thu, 22 Feb 2024 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=HBrPW0kAG99W+LVmSwfv3zIvOrDezoOWsbZYjrKsA8I=; b=KL
	lCBjbeYgLBjoFKDSBWjy3PaFhJjKhwZhvDpeetUs3UH8z17AnNRgAQETmGfPFSd7
	46x0laK1bGwPXCc5W/KTsSE5qr8u93K/+kw/KSr9VLyFFl+emCEKn7G008Oj1PE1
	rWvt8TZia9Sh+mZrGW5lvDZTQlAT6mF5cfwqoxNF5ul60IrOYLHjYwevbvcRkNoE
	wlZds/P+z6AN14JAt7ljU+3B613ZyJUktT+UFy27GhSnhEyAX+VHzhDVXoNLKxgx
	urlzh3L+hDzHgQQP75+QkLTNjn/M/TGsJjUE7kOmCPKqL1/SqRsQOhpgSWipM7fx
	QfK7ZfNlrM/xdlI9nkaw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wea7crt6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJeitu018300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:44 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:43 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 06/19] drm/msm/dp: rename wide_bus_en to wide_bus_supported
Date: Thu, 22 Feb 2024 11:39:51 -0800
Message-ID: <20240222194025.25329-7-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XMkZK4TAn-huFyI92QBvTvxs_c8cA3nK
X-Proofpoint-GUID: XMkZK4TAn-huFyI92QBvTvxs_c8cA3nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

Rename wide_bus_en to wide_bus_supported in dp_display_private to
correctly establish that the parameter is referencing if wide bus is
supported instead of enabled.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c8e1bbebdffe2..792191f67717f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -114,7 +114,7 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
-	bool wide_bus_en;
+	bool wide_bus_supported;
 
 	struct dp_audio *audio;
 };
@@ -123,7 +123,7 @@ struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	unsigned int connector_type;
-	bool wide_bus_en;
+	bool wide_bus_supported;
 };
 
 static const struct msm_dp_desc sc7180_dp_descs[] = {
@@ -132,8 +132,8 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sc7280_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
 	{}
 };
 
@@ -145,22 +145,22 @@ static const struct msm_dp_desc sc8180x_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sc8280xp_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc sc8280xp_edp_descs[] = {
-	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
 	{}
 };
 
@@ -785,9 +785,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	/* populate wide_bus_en to differernt layers */
-	dp->ctrl->wide_bus_en = dp->wide_bus_en;
-	dp->catalog->wide_bus_en = dp->wide_bus_en;
+	/* populate wide_bus_supported to different layers */
+	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
+	dp->catalog->wide_bus_en = dp->wide_bus_supported;
 
 	return rc;
 
@@ -1257,7 +1257,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
-	dp->wide_bus_en = desc->wide_bus_en;
+	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
@@ -1403,7 +1403,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	return dp->wide_bus_en;
+	return dp->wide_bus_supported;
 }
 
 void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, bool is_edp)
-- 
2.39.2


