Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9884C7A29A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 23:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237661AbjIOVjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 17:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbjIOVjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 17:39:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3B618E;
        Fri, 15 Sep 2023 14:38:55 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FLVsM4027285;
        Fri, 15 Sep 2023 21:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=efuSWbn2u+iFrnRwxcDgf3AY9tYWMo/dVl/ugt0Xau0=;
 b=CNGX8n4VNAp2CxZ1niCZk0ELNmsWvgGOjspj8hrd0l40b9Ay8ac+cSL8bJsshvf50Zih
 r4/vSE9eCRZhJmgLJLqFUkUIY5h1WX1w2GSXkNQPdZq6/Efk+jv0hz4kS+Luw9JQFpGJ
 7JtLnDKnCzuc0tTSk4sLnmdq/eGR74ahlUpB/L1i4wK8LmBHc+BFmo0ruZu/u4TScTtx
 lZEpNPsSzntjkcZECDAZl1uhmh7qCf8UaUCZUiCcSN1GEu5Bay9Ei32Wwo+IiUKYJ7hN
 YlQcQvIZKjjUmx1z1gDwUyVAN0IUlZrvJyl7Pkz07ZdzCjkvHWYIx2XKHuKqj0UF7LYf 4g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g3gt6ah-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 21:38:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FLckKU014548
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 21:38:46 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 14:38:45 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
Date:   Fri, 15 Sep 2023 14:38:20 -0700
Message-ID: <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mVmtGT4uDoQGybl_g8oOg2c1YnzqdYgh
X-Proofpoint-ORIG-GUID: mVmtGT4uDoQGybl_g8oOg2c1YnzqdYgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_18,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150194
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm_runtime_force_suspend()/resume() to complete incorporating pm
runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
are added to set hpd_state to correct state. After resume, DP driver will
re training its main link after .hpd_enable() callback enabled HPD
interrupts and bring up display accordingly.

Changes in v3:
-- replace dp_pm_suspend() with pm_runtime_force_suspend()
-- replace dp_pm_resume() with pm_runtime_force_resume()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 87 +++++--------------------------------
 1 file changed, 10 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b6992202..b58cb02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1333,101 +1333,35 @@ static int dp_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_resume(struct device *dev)
+static void dp_pm_complete(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-	int sink_count = 0;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	mutex_lock(&dp->event_mutex);
 
 	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
+		"type=%d core_inited=%d phy_inited=%d power_on=%d\n",
 		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
+		dp->phy_initialized, dp->dp_display.power_on);
 
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
-	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp);
-
-	if (dp_display->is_edp)
-		dp_catalog_ctrl_hpd_enable(dp->catalog);
-
-	if (dp_catalog_link_is_connected(dp->catalog)) {
-		/*
-		 * set sink to normal operation mode -- D0
-		 * before dpcd read
-		 */
-		dp_display_host_phy_init(dp);
-		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
-		sink_count = drm_dp_read_sink_count(dp->aux);
-		if (sink_count < 0)
-			sink_count = 0;
-
-		dp_display_host_phy_exit(dp);
-	}
-
-	dp->link->sink_count = sink_count;
-	/*
-	 * can not declared display is connected unless
-	 * HDMI cable is plugged in and sink_count of
-	 * dongle become 1
-	 * also only signal audio when disconnected
-	 */
-	if (dp->link->sink_count) {
-		dp->dp_display.link_ready = true;
-	} else {
-		dp->dp_display.link_ready = false;
-		dp_display_handle_plugged_change(dp_display, false);
-	}
-
-	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
-		dp->dp_display.connector_type, dp->link->sink_count,
-		dp->dp_display.link_ready, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	mutex_unlock(&dp->event_mutex);
-
-	return 0;
 }
 
-static int dp_pm_suspend(struct device *dev)
+static int dp_pm_prepare(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 		dp_ctrl_off_link_stream(dp->ctrl);
 
-	dp_display_host_phy_exit(dp);
-
-	/* host_init will be called at pm_resume */
-	dp_display_host_deinit(dp);
-
 	dp->hpd_state = ST_SUSPENDED;
 
-	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1435,8 +1369,10 @@ static int dp_pm_suspend(struct device *dev)
 
 static const struct dev_pm_ops dp_pm_ops = {
 	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
-	.suspend = dp_pm_suspend,
-	.resume =  dp_pm_resume,
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+                                pm_runtime_force_resume)
+	.prepare = dp_pm_prepare,
+	.complete = dp_pm_complete,
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1670,9 +1606,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	if (dp->is_edp)
-		dp_hpd_unplug_handle(dp_display, 0);
-
 	mutex_lock(&dp_display->event_mutex);
 
 	state = dp_display->hpd_state;
-- 
2.7.4

