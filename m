Return-Path: <linux-arm-msm+bounces-32360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0F984E8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B668EB25240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EAB188583;
	Tue, 24 Sep 2024 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iFdvUFqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0B18562A;
	Tue, 24 Sep 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218819; cv=none; b=pJlFQweoE5q/C4r5WkCuBG5j/CZuy8lW4D3J643mydjIEEqXFwzpAsqwhNvj33uroR6pkVn9E/RggNqZMNx/EfQuBvpb+UtQolp26Mz20CFAsKjPW43dt50zmXA133CHpD//YopkQe1BzOsRFl0GpnGE/XaRKhKbeKO3QwI9Bwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218819; c=relaxed/simple;
	bh=7V4kPfOp6UMn+ynrpIRZ1jkIDGGaQWWHCrzuxgpBnL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lfwGj1kAOEKG/OmjmQ/7cmk5tgTuDOWijzaV5oGHss/mKj0qjXt973T1m8/JsEM/Bij/JwklWX+1r+na9roKn5YndS3xWDO5JeFkwEfbr4MQRsK9fuOpjpGLhEwJ4cvCirl9st2yS6hesqQrP2ksnBn/gAjPV1XQ7icsUFzdFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iFdvUFqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIY1rG011991;
	Tue, 24 Sep 2024 22:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pz3XvA3NR3VJ2DdILpReUGeE4OqNSzymv1hDLbeufng=; b=iFdvUFqdLvVhqPOs
	Duep/WBy47qYnHwGQhEmkx5gr1fzEiyXwqcF3tN+3qi1Vd8UULZuNqh//PwfsjJ4
	k1jqqGrO6/+hacGAvA4g0tCo91ENJuxuJdjGE1NuuaUoWzOOQFXyp9o52DHFRP3A
	Y0smHqBVm8A1qWx5ryNp88tWlr5C08tt9FmSIBQNsMxWitWDcUIKKVEAYKKfKZ0f
	2Y89BhTORUyrXzrr6Zn3aVJxSgB+T5KVfg1sAhByBA/7Xxcl65yQ1ARPPD4H7B4h
	jo4c9FJ57CqBd7FLBa3iDvOSg+hJonp+twljI4kc6yM7+wq2CmRuPs1lt1IY5mlI
	4m6+AA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh2d6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxtjo007691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:55 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:20 -0700
Subject: [PATCH v2 04/22] drm/msm/dpu: switch RM to use crtc_id rather than
 enc_id for allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-4-7849f900e863@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=24013;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=tZcim61kNk804Zbix3YxYvhLVe04nn7WrjSzhfB8zaw=;
 b=VsBj1e7sWuS5bX43+6fVxp6vCXE/QKlJ2t1Nt5HwSkeoBeXetjUuZckOzkFvbYPq7bzjV5sZL
 gKj9VIQBBJ/CkVT4rrYSjIoF5Me4twaIbCFl6nOlWq4kBUI+spXEKKG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sj23m-xkbgFodMuhDqndWsG87XKzh5aE
X-Proofpoint-GUID: sj23m-xkbgFodMuhDqndWsG87XKzh5aE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Up to now the driver has been using encoder to allocate hardware
resources. Switch it to use CRTC id in preparation for the next step.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  18 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 182 ++++++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  12 +-
 4 files changed, 108 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6293e716a1c3..4a9edcfbcaae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -687,11 +687,11 @@ static int dpu_encoder_virt_atomic_check(
 	 * Dont allocate when active is false.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, drm_enc);
+		dpu_rm_release(global_state, crtc_state->crtc);
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, &topology);
+					crtc_state->crtc, &topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
@@ -1125,14 +1125,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
+		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
 		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
+		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
@@ -1140,7 +1140,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 						: NULL;
 
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-						drm_enc->base.id, DPU_HW_BLK_DSC,
+						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
 	for (i = 0; i < num_dsc; i++) {
 		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
@@ -1154,7 +1154,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		struct dpu_hw_blk *hw_cdm = NULL;
 
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-					      drm_enc->base.id, DPU_HW_BLK_CDM,
+					      drm_enc->crtc, DPU_HW_BLK_CDM,
 					      &hw_cdm, 1);
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
@@ -2021,7 +2021,7 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
 
 	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
-		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+		phys_enc->parent->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 
 	for (i = 0; i < num_lm; i++) {
 		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 935ff6fd172c..4fdc5f933261 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -122,12 +122,12 @@ struct dpu_global_state {
 
 	struct dpu_rm *rm;
 
-	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
-	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
-	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
-	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
-	uint32_t cdm_to_enc_id;
+	uint32_t pingpong_to_crtc_id[PINGPONG_MAX - PINGPONG_0];
+	uint32_t mixer_to_crtc_id[LM_MAX - LM_0];
+	uint32_t ctl_to_crtc_id[CTL_MAX - CTL_0];
+	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
+	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
+	uint32_t cdm_to_crtc_id;
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 8193c3d579df..bc99b04eae3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -22,9 +22,9 @@
 
 
 static inline bool reserved_by_other(uint32_t *res_map, int idx,
-				     uint32_t enc_id)
+				     uint32_t crtc_id)
 {
-	return res_map[idx] && res_map[idx] != enc_id;
+	return res_map[idx] && res_map[idx] != crtc_id;
 }
 
 int dpu_rm_init(struct drm_device *dev,
@@ -216,7 +216,7 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  *	pingpong
  * @rm: dpu resource manager handle
  * @global_state: resources shared across multiple kms objects
- * @enc_id: encoder id requesting for allocation
+ * @crtc_id: encoder id requesting for allocation
  * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
  *      if lm, and all other hardwired blocks connected to the lm (pp) is
  *      available and appropriate
@@ -229,14 +229,14 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
+		uint32_t crtc_id, int lm_idx, int *pp_idx, int *dspp_idx,
 		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
 
 	/* Already reserved? */
-	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
+	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
 		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
 		return false;
 	}
@@ -248,7 +248,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return false;
 	}
 
-	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
 		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
 				lm_cfg->pingpong);
 		return false;
@@ -264,7 +264,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return false;
 	}
 
-	if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
 		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
 				lm_cfg->dspp);
 		return false;
@@ -276,7 +276,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       uint32_t enc_id,
+			       uint32_t crtc_id,
 			       struct msm_display_topology *topology)
 
 {
@@ -300,7 +300,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
-				enc_id, i, &pp_idx[lm_count],
+				crtc_id, i, &pp_idx[lm_count],
 				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
@@ -319,7 +319,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 				continue;
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
-					global_state, enc_id, j,
+					global_state, crtc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
 					topology)) {
 				continue;
@@ -336,12 +336,12 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	}
 
 	for (i = 0; i < lm_count; i++) {
-		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
-		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
-		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			topology->num_dspp ? enc_id : 0;
+		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
+		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
+		global_state->dspp_to_crtc_id[dspp_idx[i]] =
+			topology->num_dspp ? crtc_id : 0;
 
-		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
+		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, crtc_id,
 					 pp_idx[i] + PINGPONG_0);
 	}
 
@@ -351,7 +351,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 static int _dpu_rm_reserve_ctls(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		uint32_t enc_id,
+		uint32_t crtc_id,
 		const struct msm_display_topology *top)
 {
 	int ctl_idx[MAX_BLOCKS];
@@ -370,7 +370,7 @@ static int _dpu_rm_reserve_ctls(
 
 		if (!rm->ctl_blks[j])
 			continue;
-		if (reserved_by_other(global_state->ctl_to_enc_id, j, enc_id))
+		if (reserved_by_other(global_state->ctl_to_crtc_id, j, crtc_id))
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
@@ -394,8 +394,8 @@ static int _dpu_rm_reserve_ctls(
 		return -ENAVAIL;
 
 	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
-		global_state->ctl_to_enc_id[ctl_idx[i]] = enc_id;
-		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
+		global_state->ctl_to_crtc_id[ctl_idx[i]] = crtc_id;
+		trace_dpu_rm_reserve_ctls(i + CTL_0, crtc_id);
 	}
 
 	return 0;
@@ -403,12 +403,12 @@ static int _dpu_rm_reserve_ctls(
 
 static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
 				       int start,
-				       uint32_t enc_id)
+				       uint32_t crtc_id)
 {
 	int i;
 
 	for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
-		if (global_state->pingpong_to_enc_id[i] == enc_id)
+		if (global_state->pingpong_to_crtc_id[i] == crtc_id)
 			return i;
 	}
 
@@ -429,7 +429,7 @@ static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
 
 static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 			     struct dpu_global_state *global_state,
-			     uint32_t enc_id,
+			     uint32_t crtc_id,
 			     const struct msm_display_topology *top)
 {
 	int num_dsc = 0;
@@ -442,10 +442,10 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 		if (!rm->dsc_blks[dsc_idx])
 			continue;
 
-		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
+		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id))
 			continue;
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -453,7 +453,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 		if (ret)
 			return -ENAVAIL;
 
-		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
+		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
 		num_dsc++;
 		pp_idx++;
 	}
@@ -469,7 +469,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 
 static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 				  struct dpu_global_state *global_state,
-				  uint32_t enc_id,
+				  uint32_t crtc_id,
 				  const struct msm_display_topology *top)
 {
 	int num_dsc = 0;
@@ -484,11 +484,11 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 
 		/* consective dsc index to be paired */
-		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
-		    reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
+		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id) ||
+		    reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx + 1, crtc_id))
 			continue;
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -498,7 +498,7 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 		}
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -508,8 +508,8 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 		}
 
-		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
-		global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
+		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
+		global_state->dsc_to_crtc_id[dsc_idx + 1] = crtc_id;
 		num_dsc += 2;
 		pp_idx++;	/* start for next pair */
 	}
@@ -525,11 +525,9 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc,
+			       uint32_t crtc_id,
 			       const struct msm_display_topology *top)
 {
-	uint32_t enc_id = enc->base.id;
-
 	if (!top->num_dsc || !top->num_intf)
 		return 0;
 
@@ -545,16 +543,16 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 
 	/* num_dsc should be either 1, 2 or 4 */
 	if (top->num_dsc > top->num_intf)	/* merge mode */
-		return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
+		return _dpu_rm_dsc_alloc_pair(rm, global_state, crtc_id, top);
 	else
-		return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
+		return _dpu_rm_dsc_alloc(rm, global_state, crtc_id, top);
 
 	return 0;
 }
 
 static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc)
+			       uint32_t crtc_id)
 {
 	/* try allocating only one CDM block */
 	if (!rm->cdm_blk) {
@@ -562,12 +560,12 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 		return -EIO;
 	}
 
-	if (global_state->cdm_to_enc_id) {
+	if (global_state->cdm_to_crtc_id) {
 		DPU_ERROR("CDM_0 is already allocated\n");
 		return -EIO;
 	}
 
-	global_state->cdm_to_enc_id = enc->base.id;
+	global_state->cdm_to_crtc_id = crtc_id;
 
 	return 0;
 }
@@ -575,30 +573,31 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *enc,
+		uint32_t crtc_id,
 		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
+	ret = _dpu_rm_reserve_lms(rm, global_state, crtc_id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
+
+	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
 			topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, crtc_id, topology);
 	if (ret)
 		return ret;
 
 	if (topology->needs_cdm) {
-		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
+		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
 			return ret;
@@ -609,103 +608,98 @@ static int _dpu_rm_make_reservation(
 }
 
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
-				  uint32_t enc_id)
+				  uint32_t crtc_id)
 {
 	int i;
 
 	for (i = 0; i < cnt; i++) {
-		if (res_mapping[i] == enc_id)
+		if (res_mapping[i] == crtc_id)
 			res_mapping[i] = 0;
 	}
 }
 
 void dpu_rm_release(struct dpu_global_state *global_state,
-		    struct drm_encoder *enc)
+		    struct drm_crtc *crtc)
 {
-	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
-		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
-		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
-		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
-		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
-		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
+	uint32_t crtc_id = crtc->base.id;
+
+	_dpu_rm_clear_mapping(global_state->pingpong_to_crtc_id,
+			ARRAY_SIZE(global_state->pingpong_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->mixer_to_crtc_id,
+			ARRAY_SIZE(global_state->mixer_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->ctl_to_crtc_id,
+			ARRAY_SIZE(global_state->ctl_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->dsc_to_crtc_id,
+			ARRAY_SIZE(global_state->dsc_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
+			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
 }
 
 int dpu_rm_reserve(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
+		struct drm_crtc *crtc,
 		struct msm_display_topology *topology)
 {
 	int ret;
 
-	/* Check if this is just a page-flip */
-	if (!drm_atomic_crtc_needs_modeset(crtc_state))
-		return 0;
-
 	if (IS_ERR(global_state)) {
 		DPU_ERROR("failed to global state\n");
 		return PTR_ERR(global_state);
 	}
 
-	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
-		      enc->base.id, crtc_state->crtc->base.id);
+	DRM_DEBUG_KMS("reserving hw for crtc %d\n", crtc->base.id);
 
 	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
 		      topology->num_lm, topology->num_dsc,
 		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
+	ret = _dpu_rm_make_reservation(rm, global_state, crtc->base.id, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
-
-
 	return ret;
 }
 
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
-	struct dpu_global_state *global_state, uint32_t enc_id,
+	struct dpu_global_state *global_state, struct drm_crtc *crtc,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
 {
+	uint32_t crtc_id = crtc->base.id;
 	struct dpu_hw_blk **hw_blks;
-	uint32_t *hw_to_enc_id;
+	uint32_t *hw_to_crtc_id;
 	int i, num_blks, max_blks;
 
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
 		hw_blks = rm->pingpong_blks;
-		hw_to_enc_id = global_state->pingpong_to_enc_id;
+		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
 		break;
 	case DPU_HW_BLK_LM:
 		hw_blks = rm->mixer_blks;
-		hw_to_enc_id = global_state->mixer_to_enc_id;
+		hw_to_crtc_id = global_state->mixer_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->mixer_blks);
 		break;
 	case DPU_HW_BLK_CTL:
 		hw_blks = rm->ctl_blks;
-		hw_to_enc_id = global_state->ctl_to_enc_id;
+		hw_to_crtc_id = global_state->ctl_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
 	case DPU_HW_BLK_DSPP:
 		hw_blks = rm->dspp_blks;
-		hw_to_enc_id = global_state->dspp_to_enc_id;
+		hw_to_crtc_id = global_state->dspp_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->dspp_blks);
 		break;
 	case DPU_HW_BLK_DSC:
 		hw_blks = rm->dsc_blks;
-		hw_to_enc_id = global_state->dsc_to_enc_id;
+		hw_to_crtc_id = global_state->dsc_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->dsc_blks);
 		break;
 	case DPU_HW_BLK_CDM:
 		hw_blks = &rm->cdm_blk;
-		hw_to_enc_id = &global_state->cdm_to_enc_id;
+		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
 		max_blks = 1;
 		break;
 	default:
@@ -715,17 +709,17 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	num_blks = 0;
 	for (i = 0; i < max_blks; i++) {
-		if (hw_to_enc_id[i] != enc_id)
+		if (hw_to_crtc_id[i] != crtc_id)
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d resources assigned to crtc %d\n",
+				  blks_size, crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
+				  type, crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];
@@ -755,37 +749,37 @@ void dpu_rm_print_state(struct drm_printer *p,
 
 	drm_puts(p, "resource mapping:\n");
 	drm_puts(p, "\tpingpong=");
-	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->pingpong_blks[i],
-					  global_state->pingpong_to_enc_id[i]);
+					  global_state->pingpong_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tmixer=");
-	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->mixer_blks[i],
-					  global_state->mixer_to_enc_id[i]);
+					  global_state->mixer_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tctl=");
-	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->ctl_blks[i],
-					  global_state->ctl_to_enc_id[i]);
+					  global_state->ctl_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tdspp=");
-	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->dspp_blks[i],
-					  global_state->dspp_to_enc_id[i]);
+					  global_state->dspp_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tdsc=");
-	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->dsc_blks[i],
-					  global_state->dsc_to_enc_id[i]);
+					  global_state->dsc_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tcdm=");
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
-				  global_state->cdm_to_enc_id);
+				  global_state->cdm_to_crtc_id);
 	drm_puts(p, "\n");
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 62cc2edd2ee0..36a0b6ed628d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -61,32 +61,30 @@ int dpu_rm_init(struct drm_device *dev,
  *	HW blocks can then be accessed through dpu_rm_get_* functions.
  *	HW Reservations should be released via dpu_rm_release_hw.
  * @rm: DPU Resource Manager handle
- * @drm_enc: DRM Encoder handle
- * @crtc_state: Proposed Atomic DRM CRTC State handle
+ * @crtc: DRM CRTC handle
  * @topology: Pointer to topology info for the display
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *drm_enc,
-		struct drm_crtc_state *crtc_state,
+		struct drm_crtc *crtc,
 		struct msm_display_topology *topology);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any
  *	HW blocks previously reserved for that use case.
  * @rm: DPU Resource Manager handle
- * @enc: DRM Encoder handle
+ * @crtc: DRM CRTC handle
  * @Return: 0 on Success otherwise -ERROR
  */
 void dpu_rm_release(struct dpu_global_state *global_state,
-		struct drm_encoder *enc);
+		struct drm_crtc *crtc);
 
 /**
  * Get hw resources of the given type that are assigned to this encoder.
  */
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
-	struct dpu_global_state *global_state, uint32_t enc_id,
+	struct dpu_global_state *global_state, struct drm_crtc *crtc,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
 /**

-- 
2.34.1


