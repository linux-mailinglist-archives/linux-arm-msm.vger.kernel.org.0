Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C265E60D9AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 05:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbiJZD0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 23:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiJZD0o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 23:26:44 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A356BD60;
        Tue, 25 Oct 2022 20:26:42 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q3Hgiw004785;
        Wed, 26 Oct 2022 03:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LyVIrY3tJ2qqOaCkzXC1eFEMMZgK5KC0maZFvChrtp0=;
 b=ZgAWRrVc1zskg5TiEFeneeAHTQokDu/leHNnwYRHM9GmvSXAFFwlVL+NgqNALTtCOq8i
 Nqzy9lzpazcHdSfqoQacIY5st/BL7LkIVd6/j9Y9MIj4dkdmqwcrWIy0mlzU4S3030R8
 lZ05qTjlQ42N3tVKcAvP8c5ZY2QukQoeItu3gUgX1nG6Oz5AoWa01XbZD4oqv5dZPP6I
 z5IPc5neDEOZlO9bH5S+sUrxUX09yrofHvp3EfXzGr2ezApK7tCNycq9tvmvn+plxuXf
 NqWo/ybmF0BImBuKLHqG3rW//3RPXqaPIiDU7BbbliGeECRq7eAWy5MnMRANBFz8Vnuy hA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kebkdj40f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:26:36 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3QZ52030215
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:26:35 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 20:26:34 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kuogee Hsieh" <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/12] drm/msm/dp: Implement hpd_notify()
Date:   Tue, 25 Oct 2022 20:26:19 -0700
Message-ID: <20221026032624.30871-8-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026032624.30871-1-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ChgHosFiuTC_zzMSt6BgZwXmdm2x-9jh
X-Proofpoint-ORIG-GUID: ChgHosFiuTC_zzMSt6BgZwXmdm2x-9jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260016
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
physical signal on a GPIO pin into the controller. This is not always
possible, either because there aren't dedicated GPIOs available or
because the hot-plug signal is a virtual notification, in cases such as
USB Type-C.

For these cases, by implementing the hpd_notify() callback for the
DisplayPort controller's drm_bridge, a downstream drm_bridge
(next_bridge) can be used to track and signal the connection status
changes.

This makes it possible to use downstream drm_bridges such as
display-connector or any virtual mechanism, as long as they are
implemented as a drm_bridge.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[bjorn: Drop connector->fwnode assignment and dev from struct msm_dp]
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v2:
- Fixed spelling of "on a GPIO" in commit message

 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 699f28f2251e..a4563a0753b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1765,3 +1765,25 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	/* Without next_bridge interrupts are handled by the DP core directly */
+	if (!dp_display->next_bridge)
+		return;
+
+	if (!dp->core_initialized) {
+		drm_dbg_dp(dp->drm_dev, "not initialized\n");
+		return;
+	}
+
+	if (!dp_display->is_connected && status == connector_status_connected)
+		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+	else if (dp_display->is_connected && status == connector_status_disconnected)
+		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6df25f7662e7..1a02ec029fdd 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 82035dbb0578..79e6b2cf2d25 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
-- 
2.37.3

