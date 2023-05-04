Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD3336F7025
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 18:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjEDQr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 12:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjEDQr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 12:47:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B347C4492;
        Thu,  4 May 2023 09:47:17 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 344E82T5004926;
        Thu, 4 May 2023 16:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=uJz0dCj2O4DRYiNt5dTLIlLZjPkEd/L5AC0oMq1TdIM=;
 b=U9cKCXJcdcicwNjLSqYd1Qe52rvJSj9LWgTtyjTtqsVILrv9CBngqYWQhhTAVFSIGpTE
 e609RsSlgj/IgkAA2IzbDotpaJVkFmnJLLPWmOEFGAdHWJ1xJ9StSyKg+8/rYZP6txZq
 lJN4Ti6es1AvHDwDnzw5WzTPWRqaOQFY/U6f4jLwJyLOFTgZzxbRyvJtYcmNTvvGhNN2
 yiNJ9senRMqGJKp9N3dnt1JJ37NU8FwypuAQspcHW3cgP3RKyxPR/LQUflq2QiyDptMi
 DYB2afjxagfEnO+oBaQY71l/zSoYc/ubdyf3szF6ZMzBJMW1vguRDWE+FyHqJyrzHRHI Cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qce6mgetd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 May 2023 16:47:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 344Gl7Nn007083
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 4 May 2023 16:47:07 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 4 May 2023 09:47:06 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <quic_khsieh@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 7/7] drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
Date:   Thu, 4 May 2023 09:46:45 -0700
Message-ID: <1683218805-23419-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6H0iZ5xyr3oQOlGALB_4p8H9gTLAE1Mv
X-Proofpoint-ORIG-GUID: 6H0iZ5xyr3oQOlGALB_4p8H9gTLAE1Mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040136
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
feature flag information.  Each display compression engine (DCE) contains
dual hard slice DSC encoders so both share same base address but with
its own different sub block address.

changes in v4:
-- delete DPU_DSC_HW_REV_1_1
-- re arrange sc8280xp_dsc[]

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 ++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 ++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 +++++++++++++++++++++-
 6 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 500cfd0..c4c93c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8350_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.dspp = sm8350_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
+	.dsc = sm8350_dsc,
+	.dsc_count = ARRAY_SIZE(sm8350_dsc),
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5646713..42c66fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
+/* NOTE: sc7280 only has one dsc hard slice encoder */
+static const struct dpu_dsc_cfg sc7280_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
+};
+
 static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -149,6 +154,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.dsc_count = ARRAY_SIZE(sc7280_dsc),
+	.dsc = sc7280_dsc,
 	.intf_count = ARRAY_SIZE(sc7280_intf),
 	.intf = sc7280_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 808aacd..508479f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0), 
+	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1), 
+	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0), 
+	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1), 
+	DSC_BLK_1_2("dce_2", DSC_4, 0x82000, 0x100, 0, dsc_sblk_0), 
+	DSC_BLK_1_2("dce_2", DSC_5, 0x82000, 0x100, 0, dsc_sblk_1), 
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
@@ -216,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
+	.dsc = sc8280xp_dsc,
+	.dsc_count = ARRAY_SIZE(sc8280xp_dsc),
 	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
 	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1a89ff9..741d03f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8450_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -223,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dspp = sm8450_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
+	.dsc = sm8450_dsc,
+	.dsc_count = ARRAY_SIZE(sm8450_dsc),
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 497b34c..3ee6dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8550_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -227,6 +239,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.dspp = sm8550_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8550_pp),
 	.pingpong = sm8550_pp,
+	.dsc = sm8550_dsc,
+	.dsc_count = ARRAY_SIZE(sm8550_dsc),
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
 	.merge_3d = sm8550_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 82b58c6..7944481 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -522,6 +522,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
+static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
+	.enc = {.base = 0x100, .len = 0x100},
+	.ctl = {.base = 0xF00, .len = 0x10},
+};
+
+static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
+	.enc = {.base = 0x200, .len = 0x100},
+	.ctl = {.base = 0xF80, .len = 0x10},
+};
+
 #define DSC_BLK(_name, _id, _base, _features) \
 	{\
 	.name = _name, .id = _id, \
@@ -529,6 +539,19 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.features = _features, \
 	}
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = _len, \
+	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
+	.sblk = &_sblk, \
+	}
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

