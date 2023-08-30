Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CC178E2C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 00:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344010AbjH3Wup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 18:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343881AbjH3Wuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 18:50:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1F0A3;
        Wed, 30 Aug 2023 15:50:15 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ULT3Mt024932;
        Wed, 30 Aug 2023 22:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=kDV496rf6VT/ZPwykQMltAhcUOGjKakrmldeP3u/29U=;
 b=OBwLTTKF8LXCXlZXbe+7XOGqoUQdYuP+ExsG/PUPrurOe+J65iJ4L4e66ueTOeGRGCeL
 za9chf3x9XHcqDF36UX19RRlqYOGRj6kjcmXJ0UQ2zlAHlL8J0aq4u3I+u44egr/lp66
 ofKVMYfqVjWsdTJzpwMKmZpoSoRVGx85oO5rPBufvi3hGiCVNLxO3DuRsaGzwTAdDJ17
 VvW7n8yorhBLIieJnKcbVV5LMER4yQJAM347s5j6KBMdX418o84Ns3MvbTo3MnUhwfGb
 F6nymea3IZe++WQQ9EsU+Rxs+2+dlp1AAtFojrky++TUcd8jMxsfjZHqnXnE1dcNK3Ub rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st9vx0hye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 22:49:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMnu2N025661
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 22:49:56 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:49:56 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
Date:   Wed, 30 Aug 2023 15:49:00 -0700
Message-ID: <20230830224910.8091-8-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rW8JdzAvxq7zwZilFmBLLjVKIwMutuqX
X-Proofpoint-ORIG-GUID: rW8JdzAvxq7zwZilFmBLLjVKIwMutuqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=704 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300207
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the RM APIs necessary to initialize and allocate CDM
blocks by the rest of the DPU pipeline.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643c71a..7b6444a3fcb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
@@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 		}
 	}
 
+	if (rm->cdm_blk)
+		dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
+
 	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
 		dpu_hw_wb_destroy(rm->hw_wb[i]);
 
@@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
 	}
 
+	if (cat->cdm) {
+		struct dpu_hw_cdm *hw;
+
+		hw = dpu_hw_cdm_init(cat->cdm, mmio);
+		/* CDM is optional so no need to bail out */
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_DEBUG("failed cdm object creation: err %d\n", rc);
+		} else {
+			rm->cdm_blk = &hw->base;
+		}
+	}
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 2b551566cbf4..29b221491926 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -22,6 +22,7 @@ struct dpu_global_state;
  * @hw_wb: array of wb hardware resources
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
+ * @cdm_blk: cdm hardware resource
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -33,6 +34,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
+	struct dpu_hw_blk *cdm_blk;
 };
 
 /**
-- 
2.40.1

