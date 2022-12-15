Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E384464DD66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 16:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiLOPMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 10:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiLOPL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 10:11:58 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C80321830;
        Thu, 15 Dec 2022 07:11:56 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFCRATg029930;
        Thu, 15 Dec 2022 15:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=+QSJRhiAUn3DfW9c6T76XAzS/vJbi4cRpllQq+m6h3k=;
 b=hRTZr/GazXWlrQslyMd8/V8gnaUy5C+Tt/DOW2os/t+nXmVTOYf4PGVkeiTMtY5gmjKA
 IMaS8HYXdvr5fwK2uZh+aKsZ22kheBT9i3HFcrKtrPlbB0YQeRPB7jnIhvuk7ig3kjZb
 om9SoIMsJuz+yDQa9ag4QPq2OgwAZv/uwukjQEwI4GL0xIA0DhhXvMFeAN3Dy0V2g1WP
 0XEOUuneDWAZ3TwUtf/bui2MZDmmMyY6mf0MqkGWUsHnDn5GB8IReIkWznMDLd2wZVvz
 esJVtaa9MyZkH87LqOsxvi1xzoTU7vl9Nk4EzXxDEJUQ8hi5gPrV6x3eJMp6VeQ694PQ Dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg2890w25-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 15:11:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFFBiOJ025388
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 15:11:44 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 15 Dec 2022 07:11:39 -0800
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
CC:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] drm/msm/a6xx: Remove cx gdsc polling using 'reset'
Date:   Thu, 15 Dec 2022 20:41:00 +0530
Message-ID: <20221215203751.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671117062-26276-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671117062-26276-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cjk_DWjdX7c_hIFxIRTJ1eA2dL_b1Hpy
X-Proofpoint-ORIG-GUID: cjk_DWjdX7c_hIFxIRTJ1eA2dL_b1Hpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_08,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the unused 'reset' interface which was supposed to help to ensure
that cx gdsc has collapsed during gpu recovery. This is was not enabled
so far due to missing gpucc driver support. Similar functionality using
genpd framework will be implemented in the upcoming patch.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
 drivers/gpu/drm/msm/msm_gpu.c         | 4 ----
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 36c8fb699b56..4b16e75dfa50 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/reset.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1298,9 +1297,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* And the final one from recover worker */
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
-	/* Call into gpucc driver to poll for cx gdsc collapse */
-	reset_control_reset(gpu->cx_collapse);
-
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 30ed45af76ad..97e1319d4577 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -16,7 +16,6 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
-#include <linux/reset.h>
 #include <linux/sched/task.h>
 
 /*
@@ -933,9 +932,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
-	gpu->cx_collapse = devm_reset_control_get_optional_exclusive(&pdev->dev,
-			"cx_collapse");
-
 	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 651786bc55e5..fa9e34d02c91 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -13,7 +13,6 @@
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
-#include <linux/reset.h>
 
 #include "msm_drv.h"
 #include "msm_fence.h"
@@ -282,9 +281,6 @@ struct msm_gpu {
 	bool hw_apriv;
 
 	struct thermal_cooling_device *cooling;
-
-	/* To poll for cx gdsc collapse during gpu recovery */
-	struct reset_control *cx_collapse;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.7.4

