Return-Path: <linux-arm-msm+bounces-10460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2185020C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 02:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BCE285D4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 01:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3B01FD1;
	Sat, 10 Feb 2024 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J2ffVtxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E55C99
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707529978; cv=none; b=szJ5fttQDMGqw+RnW3kJyjqbNrii/aSSU2Iv1f3k/0DDxKj/+jp7e+ndDuFJAapQLjNDWy+uKv/Fs3/AKXZIxA1RqqIEZN9Zo7gpqraWXomCmUL0ODb1NrXJgGulkGBb4zbOM6EsDueP8pFwq17o+6JAzKOc82ldXxm7oi5c/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707529978; c=relaxed/simple;
	bh=FoIgKe5fYWNfgAF9YGLXbXfmqG3Yskl5frWNXTzpWmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3oxcb9AEgWcNgXvn79m0WgJ1lhwnauGh2iPHBFqGfMqkjPKA6naw0ETCSM1J3/l3IrB09Ss4RweLj8Oo9g1g49BN+Yqmj4mUlKYr/uw8G8S3Sjgs/j6nQar/aEDoCuvUsvAns8DkWxcKTOb6jT6bkDzRtGsU/tlqwMMcP0z+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J2ffVtxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41A1fnuc001820;
	Sat, 10 Feb 2024 01:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=gSYre8Oqjlzg6ZlibSdpm2Q99C85Z4fTub0LvlpEjfo=; b=J2
	ffVtxgSDYaLBBcYAhRNAbDaR0q4TqKtKAsuGiai5CIcG+jjMXn3KVJINbu87gxGN
	u8R1SJ0uyVZ65bEcbA8mNdnoRslOoNq/FqT75UHkPg00da33eq6z5BQBOttUa1cK
	zpnkjhFNh0sN0fTFpfjeS3oCfmuYEyNnOqIPBtlpy7f1PTzN3iwIkpJRvvTAQZQs
	pxCMHuwQL8Mc1NBiPUZFEcEO+BosGtf09wkviOLKLRrQnWGTfwRZ7CB95PnXHcus
	mCsOi4YQCt2LNoFYVHdAliDbOjC6+I7XBisZUmwpKfUq8lZIJa6traVDVXh801kA
	YFwF0PNvd/sgsTZw4hTQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5m159f2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qoLu002587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 01:52:50 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:50 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 18/19] drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
Date: Fri, 9 Feb 2024 17:52:09 -0800
Message-ID: <20240210015223.24670-19-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FPNFnx-a9pS5y4T09D-RrcAhr-arzXCE
X-Proofpoint-ORIG-GUID: FPNFnx-a9pS5y4T09D-RrcAhr-arzXCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100012

Reserve CDM blocks for DP if the mode format is YUV420. Currently this
reservation only works for writeback and DP if the format is YUV420. But
this can be easily extented to other YUV formats for DP.

Changes in v2:
	- Minor code simplification

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6280c6be6dca9..ec53e5f4a696d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -639,6 +639,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
+	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
@@ -655,6 +656,7 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
+	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -682,21 +684,24 @@ static int dpu_encoder_virt_atomic_check(
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
 
 	/*
-	 * Use CDM only for writeback at the moment as other interfaces cannot handle it.
-	 * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
 	 * earlier.
 	 */
-	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
 			topology.needs_cdm = true;
-		if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-			crtc_state->mode_changed = true;
-		else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-			crtc_state->mode_changed = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+			topology.needs_cdm = true;
 	}
 
+	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
 	 * Dont allocate when active is false.
@@ -1137,7 +1142,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
-	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
+	    dpu_enc->disp_info.intf_type == INTF_DP) {
 		struct dpu_hw_blk *hw_cdm = NULL;
 
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-- 
2.39.2


