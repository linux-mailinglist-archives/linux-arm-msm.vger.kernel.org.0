Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08CA6EFB00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 21:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238579AbjDZTX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 15:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234750AbjDZTXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 15:23:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997F2188;
        Wed, 26 Apr 2023 12:23:07 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QIoDuX008872;
        Wed, 26 Apr 2023 19:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=am/GE3mG+Z81EN7UaMF/VcN3JD0vIz9Ej3Kyrq50Pm0=;
 b=jqZJ17dQBAvlJHCk8PR/ESbdzsQ/xYaXIdXejSCzox/4lPWd5wqadRmHgaQJhG6t0bX2
 ohbMxfElFyw6JXJc8ipb4e8aVHTgOnA0a5sPHKv+k/eqrX4bq5Xfo66G0r6zW7Hc9kHY
 +gWzohlp0XUU3nlk0ulFHjs1F/pwse5ZHAUyIlnlEteNlOCL6ngHkmj5ELZ+4JPxb4YW
 hn+4t6iluD8bNWg2n4wwayMTYW/xLBYJyuXQx//o1sWKp53grb7ayI+wrq8whlcunAMB
 Z+xSgg7xhb/SfRbUmXB9OLJX2By1Ri9+v6EwH4C6C4PERkCXv5ICWNMcVvXulCTy63IR 8g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q73xs8xm9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 19:23:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QJN1L0001820
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 19:23:01 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 26 Apr 2023 12:23:00 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] drm/msm/dpu: remove GC related code from dpu catalog
Date:   Wed, 26 Apr 2023 12:22:45 -0700
Message-ID: <20230426192246.5517-3-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h2VoqFaADoIWA6GI89ClmnoLUDYRZ2ml
X-Proofpoint-GUID: h2VoqFaADoIWA6GI89ClmnoLUDYRZ2ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304260172
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since Gamma Correction (GC) block is currently unused, drop
related code from the dpu hardware catalog otherwise this
becomes a burden to carry across chipsets in the catalog.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20230421224721.12738-2-quic_abhinavk@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 03f162af1a50..badfc3680485 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -91,7 +91,7 @@
 
 #define MERGE_3D_SM8150_MASK (0)
 
-#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
+#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
@@ -449,8 +449,6 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
 	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
-	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
-		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..e0dcef04bc61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -127,12 +127,10 @@ enum {
 /**
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
- * @DPU_DSPP_GC              Gamma correction block
  * @DPU_DSPP_IGC             Inverse gamma correction block
  */
 enum {
 	DPU_DSPP_PCC = 0x1,
-	DPU_DSPP_GC,
 	DPU_DSPP_IGC,
 	DPU_DSPP_MAX
 };
@@ -433,22 +431,18 @@ struct dpu_sspp_sub_blks {
  * @maxwidth:               Max pixel width supported by this mixer
  * @maxblendstages:         Max number of blend-stages supported
  * @blendstage_base:        Blend-stage register base offset
- * @gc: gamma correction block
  */
 struct dpu_lm_sub_blks {
 	u32 maxwidth;
 	u32 maxblendstages;
 	u32 blendstage_base[MAX_BLOCKS];
-	struct dpu_pp_blk gc;
 };
 
 /**
  * struct dpu_dspp_sub_blks: Information of DSPP block
- * @gc : gamma correction block
  * @pcc: pixel color correction block
  */
 struct dpu_dspp_sub_blks {
-	struct dpu_pp_blk gc;
 	struct dpu_pp_blk pcc;
 };
 
-- 
2.40.1

