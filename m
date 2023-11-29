Return-Path: <linux-arm-msm+bounces-2552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 120BE7FDEB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 18:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355981C2095B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 17:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACAB1B296;
	Wed, 29 Nov 2023 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E0qbPhU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABD7F4;
	Wed, 29 Nov 2023 09:47:20 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATHZjGL031267;
	Wed, 29 Nov 2023 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xGSkSwLuAsf1Ykq6QFLHkhB2RH/cpwyX9XxmPg0zJIo=;
 b=E0qbPhU4qgSpOoOwoh9O8oMJqll0vb4g+i6ms6n9IpU1tlOStgzRlIc6CFmNgSkLAfiW
 O2lbUxG8zUY3/8fGI2EFKgyT2LEEffoXUVl8ariUd8u08TT7DGsB5vJFkBwHpy4HWXqm
 HWwEK4jMi5BFQ54ZnsZcX32ri8Fq/reWgpC0dkJHhvLeci93wPiNgviiNKeSKhI0xhhg
 iSPRmlBgJa5OqXyfiip+W8LRIfGNJEEHrnpf9KXaYSsOskDzeHstW51OW3oc9CHPe2i5
 lp/qKY/MQ92vcXnmHDJ+PRqk6QbalhnvSQfie2//NyIc3WlAjujBjJIp/pEGnDvc2riP 5g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unnpeu5eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 17:47:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATHlBWK030185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 17:47:11 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 09:47:10 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC: Kuogee Hsieh <quic_khsieh@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 2/7] drm/msm/dp: rename is_connected with link_ready
Date: Wed, 29 Nov 2023 09:46:45 -0800
Message-ID: <1701280010-32476-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701280010-32476-1-git-send-email-quic_khsieh@quicinc.com>
References: <1701280010-32476-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -tox8yn7ttkSSuLRPP7fpkw1MrtBe_7j
X-Proofpoint-ORIG-GUID: -tox8yn7ttkSSuLRPP7fpkw1MrtBe_7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_15,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290135

The is_connected flag is set to true after DP mainlink successfully
finishes link training to enter into ST_MAINLINK_READY state rather
than being set after the DP dongle is connected. Rename the
is_connected flag with link_ready flag to match the state of DP
driver's state machine.

Changes in v5:
-- reworded commit text according to review comments from change #4

Changes in v4:
-- reworded commit text

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2110862..56f8d91 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -351,12 +351,11 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 	drm_helper_hpd_irq_event(connector->dev);
 }
 
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
-	if ((hpd && dp->dp_display.is_connected) ||
-			(!hpd && !dp->dp_display.is_connected)) {
+	if ((hpd && dp->dp_display.link_ready) ||
+			(!hpd && !dp->dp_display.link_ready)) {
 		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
 				(hpd ? "on" : "off"));
 		return 0;
@@ -370,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 						 dp->panel->dpcd, dp->panel->downstream_ports);
 	}
 
-	dp->dp_display.is_connected = hpd;
+	dp->dp_display.link_ready = hpd;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
@@ -913,7 +912,7 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 
 	dp_display->plugged_cb = fn;
 	dp_display->codec_dev = codec_dev;
-	plugged = dp_display->is_connected;
+	plugged = dp_display->link_ready;
 	dp_display_handle_plugged_change(dp_display, plugged);
 
 	return 0;
@@ -1344,16 +1343,16 @@ static int dp_pm_resume(struct device *dev)
 	 * also only signal audio when disconnected
 	 */
 	if (dp->link->sink_count) {
-		dp->dp_display.is_connected = true;
+		dp->dp_display.link_ready = true;
 	} else {
-		dp->dp_display.is_connected = false;
+		dp->dp_display.link_ready = false;
 		dp_display_handle_plugged_change(dp_display, false);
 	}
 
 	drm_dbg_dp(dp->drm_dev,
 		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
 		dp->dp_display.connector_type, dp->link->sink_count,
-		dp->dp_display.is_connected, dp->core_initialized,
+		dp->dp_display.link_ready, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
 	mutex_unlock(&dp->event_mutex);
@@ -1741,8 +1740,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 	}
 
-	if (!dp_display->is_connected && status == connector_status_connected)
+	if (!dp_display->link_ready && status == connector_status_connected)
 		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
-	else if (dp_display->is_connected && status == connector_status_disconnected)
+	else if (dp_display->link_ready && status == connector_status_disconnected)
 		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 15dbd2f..46780af 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -17,7 +17,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
-	bool is_connected;
+	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
 	unsigned int connector_type;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 40e7344..f18cb6f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -24,10 +24,10 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 
 	dp = to_dp_bridge(bridge)->dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
-		(dp->is_connected) ? "true" : "false");
+	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
+		(dp->link_ready) ? "true" : "false");
 
-	return (dp->is_connected) ? connector_status_connected :
+	return (dp->link_ready) ? connector_status_connected :
 					connector_status_disconnected;
 }
 
@@ -40,8 +40,8 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	dp = to_dp_bridge(bridge)->dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
-		(dp->is_connected) ? "true" : "false");
+	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
+		(dp->link_ready) ? "true" : "false");
 
 	/*
 	 * There is no protection in the DRM framework to check if the display
@@ -55,7 +55,7 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 	 * After that this piece of code can be removed.
 	 */
 	if (bridge->ops & DRM_BRIDGE_OP_HPD)
-		return (dp->is_connected) ? 0 : -ENOTCONN;
+		return (dp->link_ready) ? 0 : -ENOTCONN;
 
 	return 0;
 }
@@ -78,7 +78,7 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	dp = to_dp_bridge(bridge)->dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
-	if (dp->is_connected) {
+	if (dp->link_ready) {
 		rc = dp_display_get_modes(dp);
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-- 
2.7.4


