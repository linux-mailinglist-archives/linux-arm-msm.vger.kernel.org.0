Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9DE7BC28E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Oct 2023 00:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjJFWzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 18:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbjJFWzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 18:55:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404749C;
        Fri,  6 Oct 2023 15:55:38 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396MO5l5022013;
        Fri, 6 Oct 2023 22:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2r1/fKRBHj6tg9efRU8sCsiNWGnOuBflWumHZ1tY0FQ=;
 b=L2ZRNH9I4lTUhcvcHKIiyH9ArQOQGW8Lj4Sd8FkNzDlRhwTEuq1CbvhbHJIrnsZQAReA
 9Dbt5fRg+Z1dwn1ujDLaPgu2/G6dOG24M9ixK7qd14ViESb5FcbIvN+41wACV9DdvrCa
 UL+qbZ9IxQJGblC0n28UqhWvEuRRS3Sx5r3BfKNbDK0ZX1xsnmHGwHiSRVcG/e3BvRCO
 bTBa+hZEpyNwzvP0XtKsuttsyvi+IhzyBMLWrfoPJfurf/TIS6/Dlz/NtHd1rlwqiFNg
 umT85zDwS+lDP/UtPbWaJk8EEGEgdLkRQMmWG3jCnZ+poIy4Wn+gEv7jSGJN461T5XOo aQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tjrt089p6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Oct 2023 22:55:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 396MtQIW029245
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 6 Oct 2023 22:55:26 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 6 Oct 2023 15:55:26 -0700
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
Subject: [PATCH v7 4/7] drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
Date:   Fri, 6 Oct 2023 15:55:07 -0700
Message-ID: <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xORoTty8I0_GwdGSVmvEjdDCpfdDA21s
X-Proofpoint-ORIG-GUID: xORoTty8I0_GwdGSVmvEjdDCpfdDA21s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060177
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Original both parser->parse() and dp_power_client_init() are done at
dp_display_bind() since eDP population is done at binding time.
In the preparation of having eDP population done at probe() time,
move both function from dp_display_bind() to dp_display_probe().

Changes in v6:
-- move dp_power_client_deinit() to remove()

Changes in v5:
-- explain why parser->parse() and dp_power_client_init() are moved to
   probe time
-- tear down sub modules if failed

Changes in v4:
-- split this patch out of "incorporate pm_runtime framework into DP
   driver" patch

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32663ea..89fad67 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto end;
-	}
 
 
 	dp->drm_dev = drm;
@@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = dp_power_client_init(dp->power);
-	if (rc) {
-		DRM_ERROR("Power client create failed\n");
-		goto end;
-	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
 	if (rc) {
@@ -328,7 +318,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	dp_power_client_deinit(dp->power);
 	dp_unregister_audio_driver(dev, dp->audio);
 	dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
@@ -1250,6 +1239,18 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
+	rc = dp->parser->parse(dp->parser);
+	if (rc) {
+		DRM_ERROR("device tree parsing failed\n");
+		goto err;
+	}
+
+	rc = dp_power_client_init(dp->power);
+	if (rc) {
+		DRM_ERROR("Power client create failed\n");
+		goto err;
+	}
+
 	/* setup event q */
 	mutex_init(&dp->event_mutex);
 	init_waitqueue_head(&dp->event_q);
@@ -1284,6 +1285,7 @@ static int dp_display_remove(struct platform_device *pdev)
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
+	dp_power_client_deinit(dp->power);
 	dp_display_deinit_sub_modules(dp);
 
 	platform_set_drvdata(pdev, NULL);
-- 
2.7.4

