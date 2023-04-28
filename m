Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A1B6F20EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 00:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346796AbjD1Whd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 18:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346748AbjD1Whc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 18:37:32 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3CA97;
        Fri, 28 Apr 2023 15:37:31 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SJ9cJv008763;
        Fri, 28 Apr 2023 22:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=YoSilu77Juqav4uFECUwWsVVGvTcpVdYAT4bQdmnNaE=;
 b=Cuh3+my1aC61ND3crOKY7s1tbbN65iQoWuDhTsHpwaNdeBLpCPWbGZlcfKeYHAl3B65G
 G6yGNvP7WwXpD6nXpSWHjTIuSvvv0S+CAfwIFedPyrqwkYM5RZFdLsrbIEddFQAxyn+o
 pIFAoy7svJb1JaCDHuB3PhzRrXKx3mw7svvNYYb+2jOMC33Vi638ufLmmMxitKqL1P6o
 qLewhE6TwPSr/uXa5SN0ugkqMXyUTrcC+XtRnTRr7CXjqprON4yLz3tWnD/IzGW4zt6g
 AaKe6lQ1pVtj7qaAybtcfNYdbsJPVDTsInsv/2utV4BifinsFkJkJ3uy0tz5nl6MHP2/ 6A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8abpt85s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 22:37:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SMbPQS030459
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 22:37:25 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 15:37:24 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
Date:   Fri, 28 Apr 2023 15:36:46 -0700
Message-ID: <20230428223646.23595-4-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wz4DVunhIB-C9geqtkNaLEbs_rmmxWmG
X-Proofpoint-GUID: wz4DVunhIB-C9geqtkNaLEbs_rmmxWmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxlogscore=884 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280188
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
than DSPP_MSM8998_MASK, lets drop the latter.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index bdcd554fc8a8..a4679f72a262 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -127,9 +127,9 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 };
 
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
 		 &msm8998_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
 		 &msm8998_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 791a6fc8bdbf..efd466f6122b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -91,8 +91,6 @@
 
 #define MERGE_3D_SM8150_MASK (0)
 
-#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
-
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
 #define INTF_SDM845_MASK (0)
-- 
2.40.1

