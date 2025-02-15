Return-Path: <linux-arm-msm+bounces-48094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B95A369CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914DD168FF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C278A14884C;
	Sat, 15 Feb 2025 00:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L+NkluNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B73FBA7;
	Sat, 15 Feb 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739578544; cv=none; b=U2Eq41tOpTU56PRsefZ0qsXdiMqNIEVEWHKkx0pQK+i0NQyYJn1m64Mj/wKA1Tb9M11JyPkobgHFLP8FKLhyN5IdYV+L+X90mtQ+0Sz+ImpiN8W9u9OrS9YU+kz+NI4+BA9P5OBgdPSgiUxdylQiNGTkDjWDhu87K9QviGNvvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739578544; c=relaxed/simple;
	bh=7W6Ea+aFfRsj5/jpu0ZzrQ6VDkfBCTxhGks/L0dpItM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XuIfK/y2DdkaLRHcX429EwjF6ubWfKncXrwE2VEfLGQluoYC3h5d85IGsiWUbr2G7PSITTm8MPCW26h8+CakGrkhK+/6SHYDUkaHwhP+yd9rZ1C+L1xU1sa9O5Pcf2t5YFXRt1eDZMVFZid80YBfO19d9j5V2bG0vKUJLDbs2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L+NkluNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAC48Y002088;
	Sat, 15 Feb 2025 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ih94t1hxQLsxjSGLqI+DzVxJ1wVgpeS141rsSCs4JSE=; b=L+NkluNV0yNJWO+c
	q8x22cPRlbuPXPoFlzjZQXUma7qhFbB57Xf3nkv81uB6Pta+0neD/hrHpSI+oqlB
	JtNhUcJdd4SuaZs5hDtqHSu4t5y+dVJvPbK6Gc/7I14zpHTYzr6J3IPaUEJALej/
	z5THO6GlLKSBIz/NmSy4gNgxJ8HewdwHamCGVMzJvek7GQibND6CpmQg14EJg7ij
	p5SgScAGzH+mPGmzqYIZ+PrKqAcMSw9Topojejg65DjkUVAGwslTRKNZqwgwMjM8
	9H6sPKfOC86tza4Fyor61C5gbUPMNCpoW2RMu9xH7ORjY4c/32owl/STUEY0yVOA
	4r/v5g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w4eexy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FQjE012713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:29 -0800
Subject: [PATCH v6 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
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
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=3751;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7W6Ea+aFfRsj5/jpu0ZzrQ6VDkfBCTxhGks/L0dpItM=;
 b=Zvlj0BMNSDKlITuPqOUFPusLi4i5lGXdLX6jHx6aieJ/BG/db046tKEW/nn5BwkUcSvaBDQEo
 +oTaIkXXLBUCMYE1NXLOw1MQpcQFkmI5eQerFsRC7w9SL0A2xwoEobe
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M-xq9OaaiLidXVLxRtpBBAotLJ36ixME
X-Proofpoint-ORIG-GUID: M-xq9OaaiLidXVLxRtpBBAotLJ36ixME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150000

Currently, our hardware only supports a single output using CDM block at
most. Because of this, we cannot support cases where both writeback and DP
output request CDM simultaneously

To avoid this happening when CWB is enabled, change
msm_display_topoloy.needs_cdm into a num_cdm counter to track how many
outputs are requesting CDM block. Return EINVAL if multiple outputs are
trying to reserve CDM.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v6:
- cdm_requested -> num_cdm

Changes in v5:
- Changed check to fail only if multiple outputs are requesting CDM
  simultaneously
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ad969a5b9434..0e4f27da9534 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology->needs_cdm = true;
+			topology->num_cdm++;
 	} else if (disp_info->intf_type == INTF_DP) {
 		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology->needs_cdm = true;
+			topology->num_cdm++;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0fbb92021b18..4da2e47265d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id)
+			       uint32_t crtc_id,
+			       int num_cdm)
 {
 	/* try allocating only one CDM block */
 	if (!rm->cdm_blk) {
@@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 		return -EIO;
 	}
 
+	if (num_cdm > 1) {
+		DPU_ERROR("More than 1 INTF requesting CDM\n");
+		return -EINVAL;
+	}
+
 	if (global_state->cdm_to_crtc_id) {
 		DPU_ERROR("CDM_0 is already allocated\n");
 		return -EIO;
@@ -629,8 +635,8 @@ static int _dpu_rm_make_reservation(
 	if (ret)
 		return ret;
 
-	if (topology->needs_cdm) {
-		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
+	if (topology->num_cdm > 0) {
+		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id, topology->num_cdm);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
 			return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index b854e42d319d..a19dbdb1b6f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -51,7 +51,8 @@ struct dpu_rm_sspp_requirements {
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ * @num_cdm:      indicates how many outputs are requesting cdm block for
+ *                    this display topology
  * @cwb_enabled:  indicates whether CWB is enabled for this display topology
  */
 struct msm_display_topology {
@@ -59,7 +60,7 @@ struct msm_display_topology {
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
-	bool needs_cdm;
+	int num_cdm;
 	bool cwb_enabled;
 };
 

-- 
2.48.1


