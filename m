Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B42E6FE79C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 00:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbjEJWzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 18:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbjEJWzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 18:55:11 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4431271F
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 15:55:09 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AMQbKE013041;
        Wed, 10 May 2023 22:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=auKhiDbQr2FP0azU62SzJmWj0BbiKjPyM1nqNzvqhpA=;
 b=LtSaQvvn2pZYWtLPy2f4BKcL+AV1DYePAb+2bRHtNjkRCtmUosKYGKMCmU6TWhBIOzgN
 oCZKw8i1c2sFCJWWz/4ZV4cRSES+bs+KSs+8F9hG3N7/KWCHDfQw3HuXAsk6pZOEQgGb
 fTxYk8oCccp4+RxM03LZr7lY2qBrJ1QOowIaM9yguYFKFsJRGNujoAvp70HYNQGcbOat
 gOx7GvF6eVp22xmqhu+y+pGQ67+N34f+CU3OHUHaWCP4n8BYMfnZibxE2NgLPVH2oWJO
 8iN9DMGOxOc5Sa9uNHw4At2tc1h7FL7GhKjFP5LRGXS0rMpoHEuAr5U/d2OmmCuLFCRj Iw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg1g12959-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:55:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMt3Wf025218
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:55:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:55:03 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 10 May 2023 15:54:45 -0700
Subject: [PATCH v9 5/8] drm/msm/dpu: Use fixed DRM DSC helper for
 det_thresh_flatness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v9-5-87daeaec2c0a@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683759301; l=1426;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=br5LvAp4/2HAZOqgHTP/2qMYu0f3UwcBBShc5n91vak=;
 b=UD8KIVw2eP5yYDhCqPPXqg3KH8ffyqEERh10UkWYXH9r1Jwcw04iYEEVEEEAybepM/5AYBKwN
 8Z89gPaFQt0C5Cq1gqhRBYDamAn2atOFJgf+oAa42z5pk3RbTQzUPJ7
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -9_sHcAVzskQUWZCmcHyR5skq9DCXDTg
X-Proofpoint-ORIG-GUID: -9_sHcAVzskQUWZCmcHyR5skq9DCXDTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=825 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100190
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current dpu_hw_dsc calculation for det_thresh_flatness does not
match the downstream calculation or the DSC spec.

Use the DRM DSC helper for det_thresh_flatness to match downstream
implementation and the DSC spec.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4e1396575e6a..1e11c0fb0545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2020-2022, Linaro Limited
  */
 
+#include <drm/display/drm_dsc_helper.h>
+
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
@@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	data |= dsc->final_offset;
 	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
 
-	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
+	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
 	data = det_thresh_flatness << 10;
 	data |= dsc->flatness_max_qp << 5;
 	data |= dsc->flatness_min_qp;

-- 
2.40.1

