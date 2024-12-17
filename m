Return-Path: <linux-arm-msm+bounces-42440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7339F3F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F69C162690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD4172BA9;
	Tue, 17 Dec 2024 00:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kwg0Odyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491014A4E0;
	Tue, 17 Dec 2024 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396228; cv=none; b=ebC61Pz+RenyAb2EqODQm65KlK8xZ40LeOIIxScPx1fuTMopwHDyFVVs289RSZphHS06lrsZcxw+MvVMsv9YYKVeiMeQL/zLS8565Qu71L3M9Yu8OcwxjTnaVwWucsMgOt8ZAT+2i/IhYFAqPOeRLpXSUS8UE/pTM5m789otZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396228; c=relaxed/simple;
	bh=mQMJNK55F5GpVzJ8NIYrVusf3tpKy/510hf5r7eS1iU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aGfopQ1R7VATYwhvNplOeBCg/cuEiUgkvyq0VZUXKBb1cYc4Q3mVx55tEwx4N0X4j5LKhl6FdwoTzZxxaw9vMW7Eot7RZ9cCAsoERNX3Xnj3/TlWIg+thE7P58V8OEIzmo3nDCa8Lp2NGH3r6ro2NVSrPeKKEnGh/LKY/UxgayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kwg0Odyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIwdZ6010436;
	Tue, 17 Dec 2024 00:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FzXcaKGixo9+I+kheITTBu8Ik18AMMllyLatZwBPSM=; b=kwg0OdyjOhJXKajO
	zVuool4weiMr1QA32pjgn12WkClKgzAWo1IieQxf835N9QwF+hXxP9+mdjpkLnU8
	ekcgDTUK7KdeVx5YV/BS8oZqlVDPAWXY0Q2M4pGnGOKmm8DXyOpcySitDSBBGvon
	h2q3ojoHF21owZ8bad3yUtK7edLyVFHZb5P/ilTWNa4i5UVBxcStS/JaQv8y2YVW
	Cf38x9YSdxu0VHFw/OS5YJb84e6Qm3CEqV+UvwGGln+AGE4hwfoU07fMApcYu7BZ
	tI3s6IMOopOH9UeAFoGUbRndntmsshYJ0GLDkiQshKB2eODzvtqSAbWryxzSyJFy
	4ZJnsw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsy70mn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hRD4026883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:16 -0800
Subject: [PATCH v4 05/25] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-5-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=8960;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=h+KEOUcLTeDISwjTtNiCkTjfuMdSqKxLcyjFMH9DylM=;
 b=uU9OBHKdR31vZroJtrQOTbrmKUQ4wHWgJrf8U0aCEbZ6TdTEjka5T0ILJT6fvfjUmiifu329V
 82SyFTV8CayDJ94flwwlDF4GFKGZoPwpCs4uS6LlEnUtCCsLGA90+wn
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kWFJ9gLrt1-eA532a0yRWgi9AhOvyGlY
X-Proofpoint-GUID: kWFJ9gLrt1-eA532a0yRWgi9AhOvyGlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The struct dpu_rm_requirements was used to wrap display topology and
hw resources, which meant INTF indices. As of commit ef58e0ad3436
("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
resources struct was removed, leaving struct dpu_rm_requirements
containing a single field (topology). Remove the useless wrapper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 ++++++++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
 3 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..5172ab4dea995a154cd88d05c3842d7425fc34ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -800,7 +800,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, &topology);
 		if (!ret)
 			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
 							  global_state, crtc_state);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c247af03dc8ef7174eedf3d5cc267d64f17a8656..cd5960af4a151428cc6fb7154c3ffdb65ebcf287 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -5,6 +5,7 @@
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
+#include "msm_drv.h"
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
@@ -26,14 +27,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 	return res_map[idx] && res_map[idx] != enc_id;
 }
 
-/**
- * struct dpu_rm_requirements - Reservation requirements parameter bundle
- * @topology:  selected topology for the display
- */
-struct dpu_rm_requirements {
-	struct msm_display_topology topology;
-};
-
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
@@ -241,14 +234,13 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  *      mixer in rm->pingpong_blks[].
  * @dspp_idx: output parameter, index of dspp block attached to the layer
  *      mixer in rm->dspp_blks[].
- * @reqs: input parameter, rm requirements for HW blocks needed in the
- *      datapath.
+ * @topology:  selected topology for the display
  * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
@@ -273,7 +265,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	}
 	*pp_idx = idx;
 
-	if (!reqs->topology.num_dspp)
+	if (!topology->num_dspp)
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
@@ -295,7 +287,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
 			       uint32_t enc_id,
-			       struct dpu_rm_requirements *reqs)
+			       struct msm_display_topology *topology)
 
 {
 	int lm_idx[MAX_BLOCKS];
@@ -303,14 +295,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
-	if (!reqs->topology.num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
+	if (!topology->num_lm) {
+		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
 		return -EINVAL;
 	}
 
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
-			lm_count < reqs->topology.num_lm; i++) {
+			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
@@ -319,14 +311,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
 				enc_id, i, &pp_idx[lm_count],
-				&dspp_idx[lm_count], reqs)) {
+				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
 
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		if (lm_count < reqs->topology.num_lm) {
+		if (lm_count < topology->num_lm) {
 			int j = _dpu_rm_get_lm_peer(rm, i);
 
 			/* ignore the peer if there is an error or if the peer was already processed */
@@ -339,7 +331,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
-					reqs)) {
+					topology)) {
 				continue;
 			}
 
@@ -348,7 +340,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != reqs->topology.num_lm) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
@@ -357,7 +349,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
 		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			reqs->topology.num_dspp ? enc_id : 0;
+			topology->num_dspp ? enc_id : 0;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -594,28 +586,28 @@ static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
+	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
-				&reqs->topology);
+			topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
 	if (ret)
 		return ret;
 
-	if (reqs->topology.needs_cdm) {
+	if (topology->needs_cdm) {
 		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
@@ -626,20 +618,6 @@ static int _dpu_rm_make_reservation(
 	return ret;
 }
 
-static int _dpu_rm_populate_requirements(
-		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs,
-		struct msm_display_topology req_topology)
-{
-	reqs->topology = req_topology;
-
-	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d cdm: %d\n",
-		      reqs->topology.num_lm, reqs->topology.num_dsc,
-		      reqs->topology.num_intf, reqs->topology.needs_cdm);
-
-	return 0;
-}
-
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 				  uint32_t enc_id)
 {
@@ -693,9 +671,8 @@ int dpu_rm_reserve(
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology)
+		struct msm_display_topology *topology)
 {
-	struct dpu_rm_requirements reqs;
 	int ret;
 
 	/* Check if this is just a page-flip */
@@ -710,13 +687,11 @@ int dpu_rm_reserve(
 	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
 		      enc->base.id, crtc_state->crtc->base.id);
 
-	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
-	if (ret) {
-		DPU_ERROR("failed to populate hw requirements\n");
-		return ret;
-	}
+	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
+		      topology->num_lm, topology->num_dsc,
+		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
+	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ea0e49cb7b0d3e05dfa57442784c83acb69c3ada..2240275080c4e97e91f52eae329a3457ec2bc538 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -63,7 +63,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology);
+		struct msm_display_topology *topology);
 
 void dpu_rm_release(struct dpu_global_state *global_state,
 		struct drm_encoder *enc);

-- 
2.34.1


