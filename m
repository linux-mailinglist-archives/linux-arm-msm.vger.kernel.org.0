Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1778E2C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 00:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344209AbjH3Wus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 18:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344185AbjH3Wup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 18:50:45 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D8CF3;
        Wed, 30 Aug 2023 15:50:22 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UMm4BJ020260;
        Wed, 30 Aug 2023 22:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=JvyTOpsk1NOMCY/Ox0uNmO6RA+2hINDJklVYkOTg2lQ=;
 b=RiIJvhMbcFSnfxfl0lsuAqAbSlS/gWYHkseeIf3dPwT3Z+wvBK7DYHRpjYCTcGfTZ1Ao
 bKiFnkROMFLddzRQBq1dKzplKb6CvmhaewzYq1Bef2ll6K/BavRWBZnFqhxK85qxqR+X
 e3TpGgL1ez/L6nOrMtryBuYux/4773jI2Yb+sbzH0DI1+DIhLge9Vsgiki5QMx+f8DpF
 LWCZtU+vFokbdOINVzTwsiNLjd+9X5/J2KRnMrK36mdmpBEQCVQ/93W736ZjQerfuNdz
 qfhGnz3VSAKJKhIsWUo7FKYUVNfkPE+6upy5VCp14oAYAfGuqTa51hGf5KeWQheSV3WI JQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st159ssee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 22:50:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMo6LF025960
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 22:50:06 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:50:05 -0700
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
Subject: [PATCH 12/16] drm/msm/dpu: plug-in the cdm related bits to writeback setup
Date:   Wed, 30 Aug 2023 15:49:05 -0700
Message-ID: <20230830224910.8091-13-quic_abhinavk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lL0eoLx5OlyqU2oUJmIk6H2wdf-hNQCX
X-Proofpoint-GUID: lL0eoLx5OlyqU2oUJmIk6H2wdf-hNQCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308300207
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To setup and enable CDM block for the writeback pipeline, lets
add the pieces together to set the active bits and the flush
bits for the CDM block.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 11935aac9fd5..7fc174b33ae2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -194,6 +194,7 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_ctl *ctl;
+	struct dpu_hw_cdm *hw_cdm;
 
 	if (!phys_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -202,6 +203,7 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 
 	hw_wb = phys_enc->hw_wb;
 	ctl = phys_enc->hw_ctl;
+	hw_cdm = phys_enc->hw_cdm;
 
 	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
 		(phys_enc->hw_ctl &&
@@ -218,6 +220,9 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 		if (mode_3d && hw_pp && hw_pp->merge_3d)
 			intf_cfg.merge_3d = hw_pp->merge_3d->idx;
 
+		if (hw_cdm)
+			intf_cfg.cdm = hw_cdm->idx;
+
 		if (phys_enc->hw_pp->merge_3d && phys_enc->hw_pp->merge_3d->ops.setup_3d_mode)
 			phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
 					mode_3d);
@@ -414,6 +419,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_ctl *hw_ctl;
 	struct dpu_hw_pingpong *hw_pp;
+	struct dpu_hw_cdm *hw_cdm;
 	u32 pending_flush = 0;
 
 	if (!phys_enc)
@@ -422,6 +428,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	hw_wb = phys_enc->hw_wb;
 	hw_pp = phys_enc->hw_pp;
 	hw_ctl = phys_enc->hw_ctl;
+	hw_cdm = phys_enc->hw_cdm;
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
@@ -437,6 +444,9 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 		hw_ctl->ops.update_pending_flush_merge_3d(hw_ctl,
 				hw_pp->merge_3d->idx);
 
+	if (hw_cdm && hw_ctl->ops.update_pending_flush_cdm)
+		hw_ctl->ops.update_pending_flush_cdm(hw_ctl);
+
 	if (hw_ctl->ops.get_pending_flush)
 		pending_flush = hw_ctl->ops.get_pending_flush(hw_ctl);
 
-- 
2.40.1

