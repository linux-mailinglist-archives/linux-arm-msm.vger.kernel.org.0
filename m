Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50C86E28A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 18:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjDNQql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 12:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjDNQqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 12:46:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC6CBA;
        Fri, 14 Apr 2023 09:46:40 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EEd8QG028575;
        Fri, 14 Apr 2023 16:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=7+TsOP++DooVFLAxfVY9IG1YmgdG7JzRlvZbp1DatVk=;
 b=Id6vPLOWdRnZuFZ9/A+Q/2znRUkp8Cluz0RMGSP3zA4PregV+wbCeljV15aXHYs/Iw57
 HwRW4fRQGJqEDVw4SPFw9p+nvPH9XpNUQNW8AZktO9GSn3p+a8pNdXIjtfDwOIdzo8Hv
 WKU5/5IqVm2LcaZbzS6xmIMsLxhjsUOFUKu36YCmCrARcfj0s8LlDPYDrr348uSXYBPy
 RdEUUiHJVX2InNx4LXHyI4OWYeJPQylY1HgY6Hg/R46waJ9UuNnPu+MdhyLOa05s1nKX
 LC8gQ2u6yCYRGfTa/zbqx5prgMIiJzSpbdYxWRWXEzUowAUjFKcWYM5quTx+7g+/KwrP Gg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3py20e1743-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 16:46:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EGkSAf023941
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 16:46:28 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 14 Apr 2023 09:46:27 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
        <airlied@gmail.com>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
        <marijn.suijten@somainline.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_khsieh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/msm/dpu: always program DSC active bits
Date:   Fri, 14 Apr 2023 09:46:17 -0700
Message-ID: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lJwAbsVO9EpPYOAslYzyC-i809aXykHk
X-Proofpoint-ORIG-GUID: lJwAbsVO9EpPYOAslYzyC-i809aXykHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_09,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=674
 priorityscore=1501 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140148
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In current code, the dsc active bits are set only if the cfg->dsc is set.
However, for displays which are hot-pluggable, there can be a use-case
of disconnecting a DSC supported sink and connecting a non-DSC sink.

For those cases we need to clear DSC active bits during teardown.

As discuss at [1], clear DSC active bit will handled at reset_intf_cfg()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

[1] https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index bbdc95c..88e4efe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
-	if (cfg->dsc) {
-		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
-		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
-	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
+	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

