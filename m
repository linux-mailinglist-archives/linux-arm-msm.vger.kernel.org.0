Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE7D69E7C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjBUSno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjBUSno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:43:44 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB04CA01
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:43:43 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LCYe2S010429;
        Tue, 21 Feb 2023 18:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=7LzMzwHnUP17OpfrDGjx+6bwCwlpjKGwkqpfz2eh9nw=;
 b=bSZf9l0s7GaxXdaGji/oLUuhn3RtVjDNxNSoRuwxmE9N9Qj2rReDPS39zIZK/wYcsaqQ
 zBbaUIZp0bl2PexprxyJrJEWjoicQoXf21VOMt8VLiljuwSwEJeYtwnDq+Y2D5yKJW4C
 qjfAtJD1+kj/JLnQkWYI5c+tpLb3UOWQGwzMFjNdrMUihK1gM5K6mZMFIHdl9hU0XRZj
 CK4Fko/gkAcphRBTSansgsuiLbMTgHOWmJemBT2Da2qkos4a3acXlJc3CPGjEyFdcluz
 D/GFO+mvCb523n23BQDRuX9x3W1l84AkZ1z+FsCdBuGK4+KbMNLcaeyx3HxfW/U1S6sH yw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvnbta3g6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 18:43:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LIhb2r008055
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 18:43:37 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Feb 2023 10:43:36 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit() function
Date:   Tue, 21 Feb 2023 10:42:55 -0800
Message-ID: <20230221184256.1436-4-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JyLaebyLmnEm4wvyPtY3Rcic9MrC1NFQ
X-Proofpoint-ORIG-GUID: JyLaebyLmnEm4wvyPtY3Rcic9MrC1NFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_11,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210159
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the TE setup has been moved to prepare_for_kickoff(),  we have
not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()
do nothing. Remove prepare_commit() from DPU driver.

Changes in V3:
- Reworded commit message to be more clear
- Corrected spelling mistake in commit message

Changes in V4:
- Reworded commit message for clarity

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
 3 files changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index dcceed91aed8..35e120b5ef53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
-{
-	struct dpu_encoder_virt *dpu_enc;
-	struct dpu_encoder_phys *phys;
-	int i;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		phys = dpu_enc->phys_encs[i];
-		if (phys->ops.prepare_commit)
-			phys->ops.prepare_commit(phys);
-	}
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236ef34e6..2c9ef8d1b877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
 int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		struct msm_display_info *disp_info);
 
-/**
- * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
- *	atomic commit, before any registers are written
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
-
 /**
  * dpu_encoder_set_idle_timeout - set the idle timeout for video
  *                    and command mode encoders.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 165958d47ec6..6f7ddbf0d9b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
 	return ktime_get();
 }
 
-static void dpu_kms_prepare_commit(struct msm_kms *kms,
-		struct drm_atomic_state *state)
-{
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-	struct drm_encoder *encoder;
-	int i;
-
-	if (!kms)
-		return;
-
-	/* Call prepare_commit for all affected encoders */
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		drm_for_each_encoder_mask(encoder, crtc->dev,
-					  crtc_state->encoder_mask) {
-			dpu_encoder_prepare_commit(encoder);
-		}
-	}
-}
-
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
 	.vsync_time      = dpu_kms_vsync_time,
-	.prepare_commit  = dpu_kms_prepare_commit,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
-- 
2.39.2

