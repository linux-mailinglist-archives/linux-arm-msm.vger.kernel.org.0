Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D969468F9CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjBHVhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 16:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBHVhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 16:37:38 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962E21F486
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 13:37:37 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318LR0r6022472;
        Wed, 8 Feb 2023 21:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=dXQHSAT6TPjiCFBIFs/QrCyAWa73Qd+48UyvDFAmmm4=;
 b=Ph4KLX6mFOgOl1uamI0+asMBAR5Q3j8gGxz43IQW17yyNcW7NQcZUXPTJySQTqv0miKc
 cpdEVKdptVTAewxFMBskcGpxDpQW+aZ/Q04cuVmCgz1IbY+dR8gvfTys9ImGWpyguRFt
 1bWa13anp6v2rEL5tPVEwvem10/sORGH45D48rU0xU9D1+aDBCi/hN6g3TJjUmzn6/yV
 ac992htkLcefqJxYCTkRhSZEg6Ru2PF01a9keEHKAqcihZfRHDB76+s4NafyPuZR3dK3
 NLcsD7ERCvL2re3ZEklZ3W/HnKVuivGMfMnpdxA1Km8wWkzi+d37FF4pUl6RCAu90OZZ uA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm86msvcw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Feb 2023 21:37:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318LbTOG014728
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Feb 2023 21:37:29 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 8 Feb 2023 13:37:29 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [RFC PATCH] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Date:   Wed, 8 Feb 2023 13:37:13 -0800
Message-ID: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -qLleWssL0OLw3GSVAaVkNn2Td7CbcBL
X-Proofpoint-ORIG-GUID: -qLleWssL0OLw3GSVAaVkNn2Td7CbcBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080183
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, DPU will enable TE during prepare_commit(). However, this
will cause issues when trying to read/write to register in
get_autorefresh_config(), because the core clock rates aren't set at
that time.

This used to work because phys_enc->hw_pp is only initialized in mode
set [1], so the first prepare_commit() will return before any register
read/write as hw_pp would be NULL.

However, when we try to implement support for INTF TE, we will run into
the clock issue described above as hw_intf will *not* be NULL on the
first prepare_commit(). This is because the initialization of
dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].

To avoid this issue, let's enable TE during prepare_for_kickoff()
instead as the core clock rates are guaranteed to be set then.

Depends on: "Implement tearcheck support on INTF block" [3]

[1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
[2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
[3] https://patchwork.freedesktop.org/series/112332/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 279a0b7015ce..746250bce3d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -587,39 +587,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(cmd_enc);
 }
 
-static void dpu_encoder_phys_cmd_prepare_for_kickoff(
-		struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_encoder_phys_cmd *cmd_enc =
-			to_dpu_encoder_phys_cmd(phys_enc);
-	int ret;
-
-	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
-		      phys_enc->hw_pp->idx - PINGPONG_0,
-		      atomic_read(&phys_enc->pending_kickoff_cnt));
-
-	/*
-	 * Mark kickoff request as outstanding. If there are more than one,
-	 * outstanding, then we have to wait for the previous one to complete
-	 */
-	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
-	if (ret) {
-		/* force pending_kickoff_cnt 0 to discard failed kickoff */
-		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
-			  DRMID(phys_enc->parent), ret,
-			  phys_enc->hw_pp->idx - PINGPONG_0);
-	}
-
-	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			atomic_read(&phys_enc->pending_kickoff_cnt));
-}
-
 static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -645,8 +612,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 	return false;
 }
 
-static void dpu_encoder_phys_cmd_prepare_commit(
-		struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
@@ -704,6 +670,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 			 "disabled autorefresh\n");
 }
 
+static void dpu_encoder_phys_cmd_prepare_for_kickoff(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_encoder_phys_cmd *cmd_enc =
+			to_dpu_encoder_phys_cmd(phys_enc);
+	int ret;
+
+	if (!phys_enc->hw_pp) {
+		DPU_ERROR("invalid encoder\n");
+		return;
+	}
+
+
+	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
+		      phys_enc->hw_pp->idx - PINGPONG_0,
+		      atomic_read(&phys_enc->pending_kickoff_cnt));
+
+	/*
+	 * Mark kickoff request as outstanding. If there are more than one,
+	 * outstanding, then we have to wait for the previous one to complete
+	 */
+	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
+	if (ret) {
+		/* force pending_kickoff_cnt 0 to discard failed kickoff */
+		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
+			  DRMID(phys_enc->parent), ret,
+			  phys_enc->hw_pp->idx - PINGPONG_0);
+	}
+
+	dpu_encoder_phys_cmd_enable_te(phys_enc);
+
+	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
+			phys_enc->hw_pp->idx - PINGPONG_0,
+			atomic_read(&phys_enc->pending_kickoff_cnt));
+}
+
+static void dpu_encoder_phys_cmd_prepare_commit(
+		struct dpu_encoder_phys *phys_enc)
+{
+}
+
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 		struct dpu_encoder_phys *phys_enc)
 {
-- 
2.39.1

