Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F776534E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 18:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbiLURQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 12:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbiLURPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 12:15:45 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA7125E85;
        Wed, 21 Dec 2022 09:15:18 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLFusUO031302;
        Wed, 21 Dec 2022 17:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=pMcUY3LZvoRiFLzqqVqggek7oRF2En4eDVRgrrIAbns=;
 b=Dt1FdlRYvv8zXM5yUqdNeP7+NtaSjjRnU5VnYn6gCgHrOKA6ueeJddNMHfcPyce3lP3Y
 fFGWps4k1gERhf6QTePqi/A6yhDhyvCu94u/0JJ13igTKDHS5WuRo9qJpsKfm1uy8IDq
 6rydJdWSwNpmLpD/jk6TOoz7nhZlqH3ds3x+sfU3bcUdol4bi2zzeUg6/jc5haek3w4J
 /zAdY/co0i5A2HstwBt4hrM45kLxO4kvp4bMIN1aSi2GNWcBAueLfMyIAOfhJC+0GhCn
 2VTtE2xCJfjse1XvOb9FVelCLYkMX0YSajdr+tAkxroiaTfpc34iTeFbqFmq7Z/5A8CU wQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkmvta7j4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHErtJ002693
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:53 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:47 -0800
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 5/5] drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
Date:   Wed, 21 Dec 2022 22:44:03 +0530
Message-ID: <20221221224338.v4.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NulHpOuqBOQre9caw2QR65mzucPla5zM
X-Proofpoint-GUID: NulHpOuqBOQre9caw2QR65mzucPla5zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210144
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per the recommended recovery sequence of adreno gpu, cx gdsc should
collapse at hardware before it is turned back ON. This helps to clear
out the stale states in hardware before it is reinitialized. Use the
genpd notifier along with the newly introduced
dev_pm_genpd_synced_poweroff() api to ensure that cx gdsc has collapsed
before we turn it back ON.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v2)

Changes in v2:
- Select PM_GENERIC_DOMAINS from Kconfig

 drivers/gpu/drm/msm/Kconfig           |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3c9dfdb0b328..74f5916f5ca5 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -28,6 +28,7 @@ config DRM_MSM
 	select SYNC_FILE
 	select PM_OPP
 	select NVMEM
+	select PM_GENERIC_DOMAINS
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1580d0090f35..c03830957c26 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1507,6 +1507,17 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
 }
 
+static int cxpd_notifier_cb(struct notifier_block *nb,
+			unsigned long action, void *data)
+{
+	struct a6xx_gmu *gmu = container_of(nb, struct a6xx_gmu, pd_nb);
+
+	if (action == GENPD_NOTIFY_OFF)
+		complete_all(&gmu->pd_gate);
+
+	return 0;
+}
+
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1640,6 +1651,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto detach_cxpd;
 	}
 
+	init_completion(&gmu->pd_gate);
+	complete_all(&gmu->pd_gate);
+	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
+
 	/*
 	 * Get a link to the GX power domain to reset the GPU in case of GMU
 	 * crash
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 5a42dd4dd31f..0bc3eb443fec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -4,8 +4,10 @@
 #ifndef _A6XX_GMU_H_
 #define _A6XX_GMU_H_
 
+#include <linux/completion.h>
 #include <linux/iopoll.h>
 #include <linux/interrupt.h>
+#include <linux/notifier.h>
 #include "msm_drv.h"
 #include "a6xx_hfi.h"
 
@@ -90,6 +92,10 @@ struct a6xx_gmu {
 	bool initialized;
 	bool hung;
 	bool legacy; /* a618 or a630 */
+
+	/* For power domain callback */
+	struct notifier_block pd_nb;
+	struct completion pd_gate;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4b16e75dfa50..dd618b099110 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1258,6 +1259,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int i, active_submits;
 
 	adreno_dump_info(gpu);
@@ -1290,6 +1292,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gpu->active_submits = 0;
 
+	reinit_completion(&gmu->pd_gate);
+	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
+	dev_pm_genpd_synced_poweroff(gmu->cxpd);
+
 	/* Drop the rpm refcount from active submits */
 	if (active_submits)
 		pm_runtime_put(&gpu->pdev->dev);
@@ -1297,6 +1303,11 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* And the final one from recover worker */
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
+		DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
+
+	dev_pm_genpd_remove_notifier(gmu->cxpd);
+
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
-- 
2.7.4

