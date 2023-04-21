Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAAF6EB535
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 00:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbjDUWrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 18:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbjDUWrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 18:47:47 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322861736;
        Fri, 21 Apr 2023 15:47:42 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33LKrCTP014264;
        Fri, 21 Apr 2023 22:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8EE8timcjGGxQsm//IdKVah5+CYhJ5HJN8lauwDkGgc=;
 b=pKe6sDCsoJD6SPye8/7iZ184cs4C0x1GmfPbq5ZhIbpmVx7Jv27sgKP5HjJrgwZKynZ0
 xy906I8fu9kmHgH3MG7uh2sV184MrZ7TziywLJhxZtgPPvbhIWMLgoRBHiFZ+7o+J007
 wkAep3tHNwjqE94jFOlk4R5XWAG6OiwWoRr4JBxNERa80XXf/Di3/UwpUt75wrV/h4sx
 AY5jw4oPNOjBdw+rFLaRzYsh1euta/2V/tlS2hoTG0/DaHY/C0gC4umRImnRz7lE3/ni
 XnvZXRJv4rnY4UBrlQFcsYa2nRKzgxABFLd4HvCxRaKx6y8xxuoVbwJTPC1+jq++tuLR gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q41wu074c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 22:47:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LMlY17018048
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 22:47:34 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 21 Apr 2023 15:47:33 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/msm/dpu: remove GC related code from dpu catalog
Date:   Fri, 21 Apr 2023 15:47:20 -0700
Message-ID: <20230421224721.12738-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421224721.12738-1-quic_abhinavk@quicinc.com>
References: <20230421224721.12738-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fpqcGfbj42z99P_t5-KueDemiBXZSgj3
X-Proofpoint-ORIG-GUID: fpqcGfbj42z99P_t5-KueDemiBXZSgj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210199
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
2.39.2

