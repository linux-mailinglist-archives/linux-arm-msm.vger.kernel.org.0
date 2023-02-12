Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D6A6938BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 17:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjBLQaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Feb 2023 11:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjBLQao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Feb 2023 11:30:44 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF2EDBC0;
        Sun, 12 Feb 2023 08:30:12 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31CFgHUx011141;
        Sun, 12 Feb 2023 16:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wHEWdJdcDWj4XCDxyIqJ3rnAVDhDBBe5tawnWqlJGWA=;
 b=Soizh1Gur7dVaDjtD2QJH2XoZZ6emh82GgtmEXrTmGjALna0UQE+290cZiWVNY6tXiow
 5TGMfC51ScHhT+nkRAZhfR+qxiMkducR2LCSZrUY57CCjrhDCIs9lQd/V3wa6MLb+BsR
 b3bhpaMpXcYPdQy728ZQUY31U4aYuEobVkqrMipkwI8DQSOIBxGES5w7OWBpaRx2fRxh
 eXoqKne4bkdic41TtE+yV7tALe00WiDDdsuz6MRrFc8lrGZEVAq7iIg3jYHVg9SiRBBm
 GaO5UwyKP6a8ULt6Y+J1rie0osvw83BxxWHaAHh62IaV6A7ZJktSV4m6LQYXpHLOg1kC 3g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np1yy29xg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 12 Feb 2023 16:30:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31CGU3go017937
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 12 Feb 2023 16:30:03 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 12 Feb 2023 08:29:57 -0800
From:   Vinod Polimera <quic_vpolimer@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <quic_kalyant@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <quic_khsieh@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_bjorande@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <quic_sbillaka@quicinc.com>
Subject: [PATCH v13 09/13] drm/msm/dp: Add basic PSR support for eDP
Date:   Sun, 12 Feb 2023 21:58:53 +0530
Message-ID: <1676219337-6526-10-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CbnIafxXDR-KQRY3BMg47OC7MgqYSCYF
X-Proofpoint-ORIG-GUID: CbnIafxXDR-KQRY3BMg47OC7MgqYSCYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-12_06,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302120148
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for basic panel self refresh (PSR) feature for eDP.
Add a new interface to set PSR state in the sink from DPU.
Program the eDP controller to issue PSR enter and exit SDP to
the sink.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  80 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   4 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  80 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c |  19 ++++++
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c     | 133 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_link.c    |  36 ++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   |  22 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
 drivers/gpu/drm/msm/dp/dp_reg.h     |  27 ++++++++
 11 files changed, 411 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d..c12a5d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -47,6 +47,14 @@
 #define DP_INTERRUPT_STATUS2_MASK \
 	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
 
+#define DP_INTERRUPT_STATUS4 \
+	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
+	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
+
+#define DP_INTERRUPT_MASK4 \
+	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
+	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
+
 struct dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -359,6 +367,23 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
 			ln_mapping);
 }
 
+void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
+						bool enable)
+{
+	u32 val;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	val = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+
+	if (enable)
+		val |= DP_MAINLINK_CTRL_ENABLE;
+	else
+		val &= ~DP_MAINLINK_CTRL_ENABLE;
+
+	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 						bool enable)
 {
@@ -610,6 +635,47 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
+{
+	/* trigger sdp */
+	dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
+}
+
+void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 config;
+
+	/* enable PSR1 function */
+	config = dp_read_link(catalog, REG_PSR_CONFIG);
+	config |= PSR1_SUPPORTED;
+	dp_write_link(catalog, REG_PSR_CONFIG, config);
+
+	dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	dp_catalog_enable_sdp(catalog);
+}
+
+void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+			struct dp_catalog_private, dp_catalog);
+	u32 cmd;
+
+	cmd = dp_read_link(catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+
+	if (enter)
+		cmd |= PSR_ENTER;
+	else
+		cmd |= PSR_EXIT;
+
+	dp_catalog_enable_sdp(catalog);
+	dp_write_link(catalog, REG_PSR_CMD, cmd);
+}
+
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
@@ -645,6 +711,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
 	return isr & (mask | ~DP_DP_HPD_INT_MASK);
 }
 
+u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 intr, intr_ack;
+
+	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
+	intr_ack = (intr & DP_INTERRUPT_STATUS4)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
+
+	return intr;
+}
+
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f4..2174bb5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -93,6 +93,7 @@ void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
 void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
 void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
@@ -104,12 +105,15 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
 				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
+u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
 				u32 dp_tu, u32 valid_boundary,
 				u32 valid_boundary2);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dd26ca6..ea1c1f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -22,6 +22,7 @@
 
 #define DP_KHZ_TO_HZ 1000
 #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
+#define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
 #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
 
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
@@ -80,6 +81,7 @@ struct dp_ctrl_private {
 	struct dp_catalog *catalog;
 
 	struct completion idle_comp;
+	struct completion psr_op_comp;
 	struct completion video_comp;
 };
 
@@ -153,6 +155,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
+	if (ctrl->panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
 	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
 }
 
@@ -1375,6 +1380,64 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
+void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl)
+{
+	u8 cfg;
+	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
+			struct dp_ctrl_private, dp_ctrl);
+
+	if (!ctrl->panel->psr_cap.version)
+		return;
+
+	dp_catalog_ctrl_config_psr(ctrl->catalog);
+
+	cfg = DP_PSR_ENABLE;
+	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
+}
+
+void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
+{
+	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
+			struct dp_ctrl_private, dp_ctrl);
+
+	if (!ctrl->panel->psr_cap.version)
+		return;
+
+	/*
+	 * When entering PSR,
+	 * 1. Send PSR enter SDP and wait for the PSR_UPDATE_INT
+	 * 2. Turn off video
+	 * 3. Disable the mainlink
+	 *
+	 * When exiting PSR,
+	 * 1. Enable the mainlink
+	 * 2. Send the PSR exit SDP
+	 */
+	if (enter) {
+		reinit_completion(&ctrl->psr_op_comp);
+		dp_catalog_ctrl_set_psr(ctrl->catalog, true);
+
+		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
+			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
+			DRM_ERROR("PSR_ENTRY timedout\n");
+			dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+			return;
+		}
+
+		dp_ctrl_push_idle(dp_ctrl);
+		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+
+		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
+	} else {
+		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
+
+		dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+		dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+		dp_ctrl_wait4video_ready(ctrl);
+		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	}
+}
+
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
@@ -1989,6 +2052,22 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
+	if (ctrl->panel->psr_cap.version) {
+		isr = dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+
+		if (isr)
+			complete(&ctrl->psr_op_comp);
+
+		if (isr & PSR_EXIT_INT)
+			drm_dbg_dp(ctrl->drm_dev, "PSR exit done\n");
+
+		if (isr & PSR_UPDATE_INT)
+			drm_dbg_dp(ctrl->drm_dev, "PSR frame update done\n");
+
+		if (isr & PSR_CAPTURE_INT)
+			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
+	}
+
 	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
@@ -2035,6 +2114,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		dev_err(dev, "failed to add DP OPP table\n");
 
 	init_completion(&ctrl->idle_comp);
+	init_completion(&ctrl->psr_op_comp);
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9f29734..b226683 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -37,4 +37,7 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 
+void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
+void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 985287e..86ed80c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -406,6 +406,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	edid = dp->panel->edid;
 
+	dp->dp_display.psr_supported = dp->panel->psr_cap.version;
+
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
@@ -910,6 +912,10 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 	/* signal the connect event late to synchronize video and display */
 	dp_display_handle_plugged_change(dp_display, true);
+
+	if (dp_display->psr_supported)
+		dp_ctrl_config_psr(dp->ctrl);
+
 	return 0;
 }
 
@@ -1104,6 +1110,19 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
 	enable_irq(dp->irq);
 }
 
+void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
+{
+	struct dp_display_private *dp;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp_ctrl_set_psr(dp->ctrl, enter);
+}
+
 static int hpd_event_thread(void *data)
 {
 	struct dp_display_private *dp_priv;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 371337d..1e9415a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -29,6 +29,7 @@ struct msm_dp {
 
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
+	bool psr_supported;
 };
 
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
@@ -39,5 +40,6 @@ bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
+void dp_display_set_psr(struct msm_dp *dp, bool enter);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 3252d50..3b38bd9 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -107,6 +107,137 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
+static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct msm_dp *dp = to_dp_bridge(drm_bridge)->dp_display;
+
+	if (WARN_ON(!conn_state))
+		return -ENODEV;
+
+	if (!conn_state->crtc || !crtc_state)
+		return 0;
+
+	if (crtc_state->self_refresh_active && !dp->psr_supported)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+				     struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+
+	/*
+	 * Check the old state of the crtc to determine if the panel
+	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * If the panel is in psr, just exit psr state and skip the full
+	 * bridge enable sequence.
+	 */
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state,
+						   drm_bridge->encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+
+	if (old_crtc_state && old_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, false);
+		return;
+	}
+
+	dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
+}
+
+static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+				      struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
+						   drm_bridge->encoder);
+	if (!crtc)
+		goto out;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (!new_crtc_state)
+		goto out;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (!old_crtc_state)
+		goto out;
+
+	/*
+	 * Set self refresh mode if current crtc state is active.
+	 *
+	 * If old crtc state is active, then this is a display disable
+	 * call while the sink is in psr state. So, exit psr here.
+	 * The eDP controller will be disabled in the
+	 * edp_bridge_atomic_post_disable function.
+	 *
+	 * We observed sink is stuck in self refresh if psr exit is skipped
+	 * when display disable occurs while the sink is in psr state.
+	 */
+	if (new_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, true);
+		return;
+	} else if (old_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, false);
+		return;
+	}
+
+out:
+	dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
+}
+
+static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
+						   drm_bridge->encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (!new_crtc_state)
+		return;
+
+	/*
+	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 */
+	if (new_crtc_state->self_refresh_active)
+		return;
+
+	dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
+}
+
+static const struct drm_bridge_funcs edp_bridge_ops = {
+	.atomic_enable = edp_bridge_atomic_enable,
+	.atomic_disable = edp_bridge_atomic_disable,
+	.atomic_post_disable = edp_bridge_atomic_post_disable,
+	.mode_set = dp_bridge_mode_set,
+	.mode_valid = dp_bridge_mode_valid,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check = edp_bridge_atomic_check,
+};
+
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
@@ -121,7 +252,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 	dp_bridge->dp_display = dp_display;
 
 	bridge = &dp_bridge->bridge;
-	bridge->funcs = &dp_bridge_ops;
+	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
 	bridge->type = dp_display->connector_type;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index f1f1d64..5a4817a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -937,6 +937,38 @@ static int dp_link_process_phy_test_pattern_request(
 	return 0;
 }
 
+static bool dp_link_read_psr_error_status(struct dp_link_private *link)
+{
+	u8 status;
+
+	drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, &status, 1);
+
+	if (status & DP_PSR_LINK_CRC_ERROR)
+		DRM_ERROR("PSR LINK CRC ERROR\n");
+	else if (status & DP_PSR_RFB_STORAGE_ERROR)
+		DRM_ERROR("PSR RFB STORAGE ERROR\n");
+	else if (status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
+		DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
+	else
+		return false;
+
+	return true;
+}
+
+static bool dp_link_psr_capability_changed(struct dp_link_private *link)
+{
+	u8 status;
+
+	drm_dp_dpcd_read(link->aux, DP_PSR_ESI, &status, 1);
+
+	if (status & DP_PSR_CAPS_CHANGE) {
+		drm_dbg_dp(link->drm_dev, "PSR Capability Change\n");
+		return true;
+	}
+
+	return false;
+}
+
 static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
 {
 	return link_status[r - DP_LANE0_1_STATUS];
@@ -1055,6 +1087,10 @@ int dp_link_process_request(struct dp_link *dp_link)
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
 	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
+	} else if (dp_link_read_psr_error_status(link)) {
+		DRM_ERROR("PSR IRQ_HPD received\n");
+	} else if (dp_link_psr_capability_changed(link)) {
+		drm_dbg_dp(link->drm_dev, "PSR Capabiity changed");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 1800d89..42d5251 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -20,6 +20,27 @@ struct dp_panel_private {
 	bool aux_cfg_update_done;
 };
 
+static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
+{
+	ssize_t rlen;
+	struct dp_panel *dp_panel;
+
+	dp_panel = &panel->dp_panel;
+
+	/* edp sink */
+	if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
+		rlen = drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
+				&dp_panel->psr_cap, sizeof(dp_panel->psr_cap));
+		if (rlen == sizeof(dp_panel->psr_cap)) {
+			drm_dbg_dp(panel->drm_dev,
+				"psr version: 0x%x, psr_cap: 0x%x\n",
+				dp_panel->psr_cap.version,
+				dp_panel->psr_cap.capabilities);
+		} else
+			DRM_ERROR("failed to read psr info, rlen=%zd\n", rlen);
+	}
+}
+
 static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 {
 	int rc = 0;
@@ -107,6 +128,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 		}
 	}
 
+	dp_panel_read_psr_cap(panel);
 end:
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index f04d021..45208b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -34,6 +34,11 @@ struct dp_panel_in {
 	struct dp_catalog *catalog;
 };
 
+struct dp_panel_psr {
+	u8 version;
+	u8 capabilities;
+};
+
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
@@ -46,6 +51,7 @@ struct dp_panel {
 	struct edid *edid;
 	struct drm_connector *connector;
 	struct dp_display_mode dp_mode;
+	struct dp_panel_psr psr_cap;
 	bool video_test;
 
 	u32 vic;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 2686028..ea85a69 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -22,6 +22,20 @@
 #define REG_DP_INTR_STATUS2			(0x00000024)
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
+#define REG_DP_INTR_STATUS4			(0x0000002C)
+#define PSR_UPDATE_INT				(0x00000001)
+#define PSR_CAPTURE_INT				(0x00000004)
+#define PSR_EXIT_INT				(0x00000010)
+#define PSR_UPDATE_ERROR_INT			(0x00000040)
+#define PSR_WAKE_ERROR_INT			(0x00000100)
+
+#define REG_DP_INTR_MASK4			(0x00000030)
+#define PSR_UPDATE_MASK				(0x00000001)
+#define PSR_CAPTURE_MASK			(0x00000002)
+#define PSR_EXIT_MASK				(0x00000004)
+#define PSR_UPDATE_ERROR_MASK			(0x00000008)
+#define PSR_WAKE_ERROR_MASK			(0x00000010)
+
 #define REG_DP_DP_HPD_CTRL			(0x00000000)
 #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
 
@@ -164,6 +178,16 @@
 #define MMSS_DP_AUDIO_TIMING_RBR_48		(0x00000094)
 #define MMSS_DP_AUDIO_TIMING_HBR_48		(0x00000098)
 
+#define REG_PSR_CONFIG				(0x00000100)
+#define DISABLE_PSR				(0x00000000)
+#define PSR1_SUPPORTED				(0x00000001)
+#define PSR2_WITHOUT_FRAMESYNC			(0x00000002)
+#define PSR2_WITH_FRAMESYNC			(0x00000003)
+
+#define REG_PSR_CMD				(0x00000110)
+#define PSR_ENTER				(0x00000001)
+#define PSR_EXIT				(0x00000002)
+
 #define MMSS_DP_PSR_CRC_RG			(0x00000154)
 #define MMSS_DP_PSR_CRC_B			(0x00000158)
 
@@ -184,6 +208,9 @@
 #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
 
+#define MMSS_DP_SDP_CFG3			(0x0000024c)
+#define UPDATE_SDP				(0x00000001)
+
 #define MMSS_DP_EXTENSION_0			(0x00000250)
 #define MMSS_DP_EXTENSION_1			(0x00000254)
 #define MMSS_DP_EXTENSION_2			(0x00000258)
-- 
2.7.4

