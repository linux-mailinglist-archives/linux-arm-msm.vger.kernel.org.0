Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02F9641988
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 23:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiLCWmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 17:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLCWmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 17:42:13 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D791D655;
        Sat,  3 Dec 2022 14:42:13 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B3MSNdX014991;
        Sat, 3 Dec 2022 22:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=crbVMJQ2kqxIIKPitFZehVSLYa6oQZoXw3RhLd2htU8=;
 b=XyCKtPIrJtwHQeok+OQEwLUmULQgFcGNZxGRMAt676AJ0C0mzmyHaTuR1YfHOoV8ckil
 cASMUC91axR7oaO2WfCkLCnBVQq7UgLkWq6FV12Rkbcm3cjO+t5+BoM2tp5W0zvTfUL4
 jN9IqdkDvF96U265n1j/3G8k4g37CXx4QgtLLwukWsKOel4xpED4I9KFWSZ4H8hqR0Dz
 biERICwX0wzcf1i3neJvTLycvmu68ywh8PGWhVbeo+IRzPquNBHx28J/ZFw6WDuM+AU2
 6iCf9dniVAgiees0+VWksWhKaTV/EmW0ezf7rl9se0GvtYPQtCiHUJFbr4QhxuIPvsMn vQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7wff1b9d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 03 Dec 2022 22:42:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B3Mg6kk004800
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 3 Dec 2022 22:42:06 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sat, 3 Dec 2022 14:42:02 -0800
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
CC:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Duoming Zhou" <duoming@zju.edu.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm/msm: Fix failure paths in msm_drm_init()
Date:   Sun, 4 Dec 2022 04:11:42 +0530
Message-ID: <20221204040946.2.I49dfc3654040be61702e491f1aa63d3a5f308852@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
References: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FWq7KCjSapIa27EHnuu0-zGpuKgT0wHH
X-Proofpoint-ORIG-GUID: FWq7KCjSapIa27EHnuu0-zGpuKgT0wHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-03_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212030202
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ensure that we do drm_dev_put() when there is an early return in
msm_drm_init().

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c                | 11 +++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index e75b97127c0d..b73031cd48e4 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -129,6 +129,9 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 	}
 
 	priv = drm_dev->dev_private;
+	if (!priv->kms)
+		return;
+
 	kms = priv->kms;
 
 	if (kms->dump_worker)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index eb5b056ce3f7..544e041dd710 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -149,6 +149,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 
+	if (!priv->kms)
+		return;
+
 	kms->funcs->irq_uninstall(kms);
 	if (kms->irq_requested)
 		free_irq(kms->irq, dev);
@@ -265,8 +268,6 @@ static int msm_drm_uninit(struct device *dev)
 	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
-	drm_dev_put(ddev);
-
 	destroy_workqueue(priv->wq);
 
 	return 0;
@@ -441,12 +442,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		return ret;
+		goto err_drm_dev_put;
 
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		return ret;
+		goto err_drm_dev_put;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -541,6 +542,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_msm_uninit:
 	msm_drm_uninit(dev);
+err_drm_dev_put:
+	drm_dev_put(ddev);
 	return ret;
 }
 
-- 
2.7.4

