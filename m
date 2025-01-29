Return-Path: <linux-arm-msm+bounces-46445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6323A216B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 04:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB48188862A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDEB189520;
	Wed, 29 Jan 2025 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GgH2W5Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD05171CD;
	Wed, 29 Jan 2025 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738120885; cv=none; b=h963zRZCKBZbHirSBPvg8wpZKm5oCHekk4lt43Zbgv/sehruFuDmnme6DXWzGpgDq5yDulpcEPT11ggiROmxYaIr7XK07XyjY177hMp8h73vakxFoKgyHTaMexJeY2DmeaFtm57dqFEOMfqxtdeXp52dqOzKcvwahtFyF/rDGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738120885; c=relaxed/simple;
	bh=bwpa2nh3gEUJMG70dSCaJRtyDb7SW+1OOYbvr0CoXvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eJMghahwU3JW1q9TySd67Rn543iK0fBQNloLeNeMsgy9+wjBbMBD3LQSE7ZXw9E8fteXK0aBrqi14II+lc2SJMzNQH0CdPkGtS/mTz51oUlBOmEl8wYz/iU/OYuP8PjiI5+Xr59B1H5BP7cLb10IoeX9qgNsOn0A1EvYYn39LDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GgH2W5Du; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gS7t002255;
	Wed, 29 Jan 2025 03:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNi868xUKsUHHMuMgvXEyB0MXMPFgSW62DLyrW/UXuA=; b=GgH2W5DuPNtEnvtg
	5KAC+ZJFcPd0dOQ4ApIcnwlPMogAeUAf0+FJPYO3R1glVZ9YHno0Am/mMI3/uzXV
	SahS4Lc9jqxorog0zDbMzhamrAsbrK6Lpja85Bg4xxM/FuCU9K7+T/JJt+bjOfSv
	0SrF8Y4muGU+YrvNSRMoyxEc81tfLDts5GrUbgc3YYff2ThwA+19lXGepLk67a/k
	7CgIjQz6C03ywgUbcHZiucTF7Irs7SwYiLEdE/oX/AcUytJG7dPymRf3aWikNAm0
	sO+8QNzC1fCbT/y8qATWCvGra7v97ond9hB2NA7K/9JrWxoUZewV6IqsyZ2p3Jno
	PCROQw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f97q08uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 03:21:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L86a020194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 03:21:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:08 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:20:43 -0800
Subject: [PATCH v5 11/14] drm/msm/dpu: Start frame done timer after encoder
 kickoff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-concurrent-wb-v5-11-6464ca5360df@quicinc.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
In-Reply-To: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=4307;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=bwpa2nh3gEUJMG70dSCaJRtyDb7SW+1OOYbvr0CoXvo=;
 b=liY1s/F340JtkvpEdUQZqHlzEpxWmvLDaSB7dPpV4cvs1m3lcqjBVmk9J2IeAztZTRCCiM2L3
 vwRwDBfghELC4PxLbnKVmBb9BcAxJqlwUpWemeBB1KLbvqH6zLZw+2N
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gbJgKI4bgf5CX1xHt-U8F7AqV7vooJDl
X-Proofpoint-ORIG-GUID: gbJgKI4bgf5CX1xHt-U8F7AqV7vooJDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290025

Starting the frame done timer before the encoder is finished kicking off
can lead to unnecessary frame done timeouts when the device is
experiencing heavy load (ex. when debug logs are enabled).

Thus, create a separate API for starting the encoder frame done timer and
call it after the encoder kickoff is finished

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 ++-
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cfb19be0547788aa9a3b78fd0abb0513b8c9bb47..0f8b220b52cec6c6844d3f5e5d924d47c55eb65b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -999,8 +999,10 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_vbif_clear_errors(dpu_kms);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
 		dpu_encoder_kickoff(encoder);
+		dpu_encoder_start_frame_done_timer(encoder);
+	}
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 578b5f1f039551b649fdae130cf097e3fb621d95..ba18226e396fa86bfaf3df38a3ff5caffc6e8841 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2086,6 +2086,25 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
 	return true;
 }
 
+/**
+ * dpu_encoder_start_frame_done_timer - Start the encoder frame done timer
+ * @drm_enc: Pointer to drm encoder structure
+ */
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	unsigned long timeout_ms;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
+			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
+
+	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
+	mod_timer(&dpu_enc->frame_done_timer,
+			jiffies + msecs_to_jiffies(timeout_ms));
+
+}
+
 /**
  * dpu_encoder_kickoff - trigger a double buffer flip of the ctl path
  *	(i.e. ctl flush and start) immediately.
@@ -2095,7 +2114,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
-	unsigned long timeout_ms;
 	unsigned int i;
 
 	DPU_ATRACE_BEGIN("encoder_kickoff");
@@ -2103,13 +2121,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 
 	trace_dpu_enc_kickoff(DRMID(drm_enc));
 
-	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
-			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
-
-	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
-	mod_timer(&dpu_enc->frame_done_timer,
-			jiffies + msecs_to_jiffies(timeout_ms));
-
 	/* All phys encs are ready to go, trigger the kickoff */
 	_dpu_encoder_kickoff_phys(dpu_enc);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index b0ac10ebd02c2b63e6f6f9010a22cdace931cf3b..8503386bb50330a38b065c32d259de18166464d6 100644
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
@@ -95,4 +95,5 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc);
 #endif /* __DPU_ENCODER_H__ */

-- 
2.34.1


