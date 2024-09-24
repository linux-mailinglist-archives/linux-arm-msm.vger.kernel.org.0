Return-Path: <linux-arm-msm+bounces-32352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B8984E7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9A9BB24146
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6E9185E4E;
	Tue, 24 Sep 2024 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="otrYyMeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201A18452C;
	Tue, 24 Sep 2024 23:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218814; cv=none; b=To0w0VjFrxl/Ime/b8NWb8Gwjpw7NiOCob8ikJ7glpA87fEx2yS/nhGR1DXlgomOhow7oLCRiOSEi1x9Ieobgz2H2O+lymgp69zvexMv7QOoD9UrrTQE7WPy/7isx0R0eqyfP4ZrKf+D0U7a7IMi9mDsy50Psv9MwJw3qufwZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218814; c=relaxed/simple;
	bh=0NcialL7RnMxyrqomDWPdsQpyBsB2o+ciQqhNhUexgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uxZCBc8heObiElnohW4LW76lJOc2MEJkYLWqb846YNNrJovP3ZZpTQ8zcp/xOSIDzovo7SikyhxBV9iOBt8bj1oKNXBLPwLNJCDtJLrlcdF+Z4Bd/WmI/Cu26O5tSUACdZMEoP9u1prYy65SdhVOqMk/NVTBvwr5tNnZsCjxzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=otrYyMeE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OI0m8T009504;
	Tue, 24 Sep 2024 23:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XS4fqlM3UIsQiI3Va/ZXxsce9GUqrdbYyoqk5wa2r7E=; b=otrYyMeEtV5lc9Oq
	uqF6syLuobOZZ3cxNMANgQaZci+bZX4xSB45inTnfIJv8hrG28Qx4Xs8F3DsXWUh
	IX06208QGOfglvE8QIxyTygWLnNjoA7+unfT7t/+bJXY8+aimwt66wvAqMdDuzML
	pedEOsw6lNQu4CTBlN6JaMzgyb2SJa6tTup6bDPlGhkqdQkjWJ+8VgsQELnm1ck6
	CmRbU/R8KGIdqJod8kUwlKd+2XySmprrShTajpARbF9BcotrDyfuwxyI3yJa/GXK
	O29AGwZ4STo10FcAKbY2u9Q84RgJ8O6dSwCT4212yW0bTv2AvgQQOlIVSNn+/4hT
	obVaMg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuet6gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxxXu007796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:59 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:35 -0700
Subject: [PATCH v2 19/22] drm/msm/dpu: Start frame done timer after encoder
 kickoff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-19-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=3819;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=0NcialL7RnMxyrqomDWPdsQpyBsB2o+ciQqhNhUexgY=;
 b=x32MwxAGGrpGtyJGRyJHnl1zsK9aS+5onnroAe65llcLIraRr1GB2rN63jAnZEM9S+B+7iRrM
 FpMxKTwP58oBoAaTHIuoAzFA6LnzuDQqNH2uKSIYcBG/w1dQYV5NThU
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m5bCbREJL1v3_HsBMUFkqFRjRma7SSGi
X-Proofpoint-ORIG-GUID: m5bCbREJL1v3_HsBMUFkqFRjRma7SSGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

Starting the frame done timer before the encoder is finished kicking off
can lead to unnecessary frame done timeouts when the device is
experiencing heavy load (ex. when debug logs are enabled).

Thus, create a separate API for starting the encoder frame done timer and
call it after the encoder kickoff is finished

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 ++++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +++-
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f20e44e9fc05..e8c80ea12866 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -970,8 +970,10 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_vbif_clear_errors(dpu_kms);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
 		dpu_encoder_kickoff(encoder);
+		dpu_encoder_start_frame_done_timer(encoder);
+	}
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7337bb3ae7ca..ac3ff13b65c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1941,18 +1941,16 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
 	return true;
 }
 
-void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
+/**
+ * dpu_encoder_start_frame_done_timer - Start the encoder frame done timer
+ * @drm_enc: Pointer to drm encoder structure
+ */
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
-	struct dpu_encoder_phys *phys;
 	unsigned long timeout_ms;
-	unsigned int i;
 
-	DPU_ATRACE_BEGIN("encoder_kickoff");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	trace_dpu_enc_kickoff(DRMID(drm_enc));
-
 	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
 			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
 
@@ -1960,6 +1958,19 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 	mod_timer(&dpu_enc->frame_done_timer,
 			jiffies + msecs_to_jiffies(timeout_ms));
 
+}
+
+void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	struct dpu_encoder_phys *phys;
+	unsigned int i;
+
+	DPU_ATRACE_BEGIN("encoder_kickoff");
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	trace_dpu_enc_kickoff(DRMID(drm_enc));
+
 	/* All phys encs are ready to go, trigger the kickoff */
 	_dpu_encoder_kickoff_phys(dpu_enc);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 0d27e50384f0..deaa0463b289 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -210,4 +210,6 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
  */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */

-- 
2.34.1


