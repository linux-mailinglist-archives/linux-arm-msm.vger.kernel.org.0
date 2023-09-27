Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C9D7B0DC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 22:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjI0Uyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 16:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjI0Uyc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 16:54:32 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5BB1B0;
        Wed, 27 Sep 2023 13:54:30 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RKPPHW016169;
        Wed, 27 Sep 2023 20:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=opdOQuI6EXH5/tIxo5LrVinQuVUkdt5vDpsHEYA8a7M=;
 b=mNebwj7ns3eoUV2kijYajfgE+vMHNYPRgpvEQDM+NrsQR9nt2FVPUoZBzhMSi+JAxQaD
 mYFDUy2yvQH6tXiSLUiXuhxOfA7fH/W0CnNbvimaGTOHHgjnCZBS3RYM+dPgv6VayViI
 loFaxdX6LibjGfS/XJ/g8dbWY26YwsXd/XimaS8iHOBvFk5uDnH7aO8Roe3SufWIk+zp
 umU2CPEiFIyFPmEvuDSVedn4JuhaWrwpi6pD6Lg0VRfz/q63b7ZNgphzkdZlZw+E2CH7
 Db4eL7dX/exMwbtOeL2zDo9BQrDjtA6i6TB7uBOhSezPx7+bYHFdqaLTL4ZN2LE7lmC5 lA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcda7t1eh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Sep 2023 20:54:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RKsAGx017240
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Sep 2023 20:54:10 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 27 Sep 2023 13:54:10 -0700
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
Subject: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
Date:   Wed, 27 Sep 2023 13:53:48 -0700
Message-ID: <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xS7gqQ1pLOZIOpdkaUt4Vdm4qh7kj1_J
X-Proofpoint-GUID: xS7gqQ1pLOZIOpdkaUt4Vdm4qh7kj1_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_13,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270178
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently eDP population is done at msm_dp_modeset_init() which happen
at binding time. Move eDP population to be done at display probe time
so that probe deferral cases can be handled effectively.
wait_for_hpd_asserted callback is added during drm_dp_aux_init()
to ensure eDP's HPD is up before proceeding eDP population.

Changes in v4:
-- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
-- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the function
-- not initialize rc = 0

Changes in v3:
-- add done_probing callback into devm_of_dp_aux_populate_bus()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.c | 69 ++++++++++++++++++-------------------
 2 files changed, 60 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 22eb774..425b5c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
 
 int dp_aux_register(struct drm_dp_aux *dp_aux)
 {
-	struct dp_aux_private *aux;
 	int ret;
 
 	if (!dp_aux) {
@@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
 		return -EINVAL;
 	}
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
-
-	aux->dp_aux.name = "dpu_dp_aux";
-	aux->dp_aux.dev = aux->dev;
-	aux->dp_aux.transfer = dp_aux_transfer;
-	ret = drm_dp_aux_register(&aux->dp_aux);
+	ret = drm_dp_aux_register(dp_aux);
 	if (ret) {
 		DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
 				ret);
@@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
 	drm_dp_aux_unregister(dp_aux);
 }
 
+static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
+				 unsigned long wait_us)
+{
+	int ret;
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	pm_runtime_get_sync(aux->dev);
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	pm_runtime_put_sync(aux->dev);
+
+	return ret;
+}
+
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 			      bool is_edp)
 {
@@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 	aux->catalog = catalog;
 	aux->retry_cnt = 0;
 
+	/*
+	 * Use the drm_dp_aux_init() to use the aux adapter
+	 * before registering aux with the DRM device so that
+	 * msm edp panel can be detected by generic_dep_panel_probe().
+	 */
+	aux->dp_aux.name = "dpu_dp_aux";
+	aux->dp_aux.dev = dev;
+	aux->dp_aux.transfer = dp_aux_transfer;
+	aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
+	drm_dp_aux_init(&aux->dp_aux);
+
 	return &aux->dp_aux;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 711d262..9a2b403 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1203,6 +1203,28 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
+static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+{
+	int rc;
+
+	rc = component_add(aux->dev, &dp_display_comp_ops);
+	if (rc)
+		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
+
+	return rc;
+}
+
+static inline int dp_display_auxbus_population(struct dp_display_private *dp)
+{
+	int ret;
+
+	ret = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
+	if (ret == -ENODEV)
+		DRM_ERROR("aux-bus not found\n");
+
+	return ret;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1271,10 +1293,16 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	rc = component_add(&pdev->dev, &dp_display_comp_ops);
-	if (rc) {
-		DRM_ERROR("component add failed, rc=%d\n", rc);
-		dp_display_deinit_sub_modules(dp);
+	if (dp->dp_display.is_edp) {
+		rc = dp_display_auxbus_population(dp);
+		if (rc)
+			DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
+	} else {
+		rc = component_add(&pdev->dev, &dp_display_comp_ops);
+		if (rc) {
+			DRM_ERROR("component add failed, rc=%d\n", rc);
+			dp_display_deinit_sub_modules(dp);
+		}
 	}
 
 	return rc;
@@ -1285,8 +1313,6 @@ static int dp_display_remove(struct platform_device *pdev)
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
-	dp_display_deinit_sub_modules(dp);
-
 	platform_set_drvdata(pdev, NULL);
 
 	dp_display_deinit_sub_modules(dp);
@@ -1385,29 +1411,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 {
 	int rc;
 	struct dp_display_private *dp_priv;
-	struct device_node *aux_bus;
-	struct device *dev;
 
 	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-	dev = &dp_priv->pdev->dev;
-	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
-
-	if (aux_bus && dp->is_edp) {
-		/*
-		 * The code below assumes that the panel will finish probing
-		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
-		 * This isn't a great assumption since it will fail if the
-		 * panel driver is probed asynchronously but is the best we
-		 * can do without a bigger driver reorganization.
-		 */
-		rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
-		of_node_put(aux_bus);
-		if (rc)
-			goto error;
-	} else if (dp->is_edp) {
-		DRM_ERROR("eDP aux_bus not found\n");
-		return -ENODEV;
-	}
 
 	/*
 	 * External bridges are mandatory for eDP interfaces: one has to
@@ -1420,17 +1425,9 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	if (!dp->is_edp && rc == -ENODEV)
 		return 0;
 
-	if (!rc) {
+	if (!rc)
 		dp->next_bridge = dp_priv->parser->next_bridge;
-		return 0;
-	}
 
-error:
-	if (dp->is_edp) {
-		of_dp_aux_depopulate_bus(dp_priv->aux);
-		dp_display_host_phy_exit(dp_priv);
-		dp_display_host_deinit(dp_priv);
-	}
 	return rc;
 }
 
-- 
2.7.4

