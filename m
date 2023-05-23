Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8AF70E5D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 21:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbjEWTkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 15:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238574AbjEWTkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 15:40:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EFF19D;
        Tue, 23 May 2023 12:39:54 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NH7fn8031386;
        Tue, 23 May 2023 19:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=jIoS+eVNpc6yQjsmF5ImRZeXFYa+uGcXl9haXZCOKeU=;
 b=C/m8frDv+aWjcrzrCcE2b0B0LDsO9Bv6ZiVLAl8m6tBujXjG0VVEbq3SYYme3GXw4e+U
 64inuKPMEsWc6NEOgXC70KDzhrfrcRmdAqWAyVWknbxFgKJSIQKJA3pgrygEZKsmvoQ8
 janvrA6SFthNY/R23Ydrymjrnc7KNkeKWnDShquE/N5tx7tqjXy6Ls0gCYPABoCZPI4X
 MIw6c5fBGDPHq/FWa0Ln8tCt+Z0PLHsRvj2rTgIwS/3mt8Ie1XTOfvih3CSth9tEnZQ0
 Gh3IEYKntLbJ8flPda6UQmwVexRU6czyHJWm3dxQlXz3LL4y0SScfEiWOb5Y7M0oBgER dA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrpmm2acq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 May 2023 19:39:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NJdWje024959
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 May 2023 19:39:32 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 23 May 2023 12:39:32 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <leonard@lausen.nl>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/2] drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disable
Date:   Tue, 23 May 2023 12:39:14 -0700
Message-ID: <1684870754-24906-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684870754-24906-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684870754-24906-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 67oyJbD-DpY27FPix89T3QNkBHOfj1hP
X-Proofpoint-GUID: 67oyJbD-DpY27FPix89T3QNkBHOfj1hP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230159
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
case. HDP related interrupts can not be enabled until internal_hpd is set
to true. At current implementation dp_display_config_hpd() will initialize
DP host controller first followed by enabling HDP related interrupts if
internal_hpd was true at that time. Enable HDP related interrupts depends on
internal_hpd status may leave system with DP driver host is in running state
but without HDP related interrupts being enabled. This will prevent external
display from being detected. Eliminated this dependency by moving HDP related
interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
regardless of internal_hpd status.

Changes in V3:
-- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
-- rewording ocmmit text

Changes in V4:
-- replace dp_display_config_hpd() with dp_display_host_start()
-- move enable_irq() at dp_display_host_start();

Changes in V5:
-- replace dp_display_host_start() with dp_display_host_init()

Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Tested-by: Bjorn Andersson <andersson@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 15 ++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 62 ++++++++++++-------------------------
 3 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7a8cf1c..5142aeb 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -620,7 +620,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 				config & DP_DP_HPD_INT_MASK);
 }
 
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
+void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
@@ -635,6 +635,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+
+	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
+	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+
+	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
+}
+
 static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
 {
 	/* trigger sdp */
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 82376a2..38786e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -104,7 +104,8 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1af49b6..cb805cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -615,12 +615,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
-	/* enable HDP irq_hpd/replug interrupt */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
-					   true);
-
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 	mutex_unlock(&dp->event_mutex);
@@ -658,12 +652,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
-	/* disable irq_hpd/replug interrupts */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
-					   false);
-
 	/* unplugged, no more irq_hpd handle */
 	dp_del_event(dp, EV_IRQ_HPD_INT);
 
@@ -687,10 +675,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	/* disable HPD plug interrupts */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
-
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
@@ -706,10 +690,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
-	/* enable HDP plug interrupt to prepare for next plugin */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
-
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
@@ -1082,20 +1062,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	mutex_unlock(&dp_display->event_mutex);
 }
 
-static void dp_display_config_hpd(struct dp_display_private *dp)
-{
-
-	dp_display_host_init(dp);
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	/* Enable plug and unplug interrupts only if requested */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK,
-				true);
-}
-
 void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
 {
 	struct dp_display_private *dp;
@@ -1170,7 +1136,7 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_INIT_SETUP:
-			dp_display_config_hpd(dp_priv);
+			dp_display_host_init(dp_priv);
 			break;
 		case EV_HPD_PLUG_INT:
 			dp_hpd_plug_handle(dp_priv, todo->data);
@@ -1387,13 +1353,8 @@ static int dp_pm_resume(struct device *dev)
 	/* turn on dp ctrl/phy */
 	dp_display_host_init(dp);
 
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK,
-				true);
+	if (dp_display->is_edp)
+		dp_catalog_ctrl_hpd_enable(dp->catalog);
 
 	if (dp_catalog_link_is_connected(dp->catalog)) {
 		/*
@@ -1561,7 +1522,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 
 	if (aux_bus && dp->is_edp) {
 		dp_display_host_init(dp_priv);
-		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
+		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
 		dp_display_host_phy_init(dp_priv);
 
 		/*
@@ -1792,16 +1753,31 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	mutex_lock(&dp->event_mutex);
+	dp_catalog_ctrl_hpd_enable(dp->catalog);
+
+	/* enable HDP interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
 
 	dp_display->internal_hpd = true;
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	mutex_lock(&dp->event_mutex);
+	/* disable HDP interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
+	dp_catalog_ctrl_hpd_disable(dp->catalog);
 
 	dp_display->internal_hpd = false;
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_notify(struct drm_bridge *bridge,
-- 
2.7.4

