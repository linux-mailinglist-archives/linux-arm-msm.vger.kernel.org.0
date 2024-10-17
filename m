Return-Path: <linux-arm-msm+bounces-34666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E289A17CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4586287847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50A113B5A1;
	Thu, 17 Oct 2024 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BZrcLrHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71F9433DF;
	Thu, 17 Oct 2024 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128100; cv=none; b=kKbXqKeKYIvmxq2LY0y7g4FQRGhlrQ9GSH1RAJrz5QH8ziTXFFd3CS9cgc347cLxbMxeMD7RKP5DK4YUPm6770c+VapLH6AFQCDrTWnxuvbDJUxmbzyghIS3mej0iQM9H9VKgwf5lAwVSkpCCbwhs3QO1ytLzUPAGs+3PHunNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128100; c=relaxed/simple;
	bh=Cy2WHkaI7A+m9hVkeImAjDwrGltc2rcC7w9zQfBnBXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gUVXlSpyp+LS49ipEYk8/cF4JpUypMtgwyu3Nq5WCbIZRReCxdAw6LyuF6ONPiDx02OAtWS7evUYwx9Wusz6baXTYZZpcjK6OsbanMYbk8rrnTWBhg7Dfow6T30oVCP49uQ1UNFZAuV3opom/7j9bqpvyv6VaYPfBNdgdHQvZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BZrcLrHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFXclM002343;
	Thu, 17 Oct 2024 01:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Va+MOrIrQMj1rIssKS+JJOelNeyG6FFwsfeTtsaxLDE=; b=BZrcLrHlUeHVF3VJ
	RWgxv9sempUoVKenNcS2puNNS09iBk7fNmM5FmNGypMx/noPNbKJNdryMmXJlJta
	GnFePFIL8mDLcBB9Td87LP3jKTERsgIWpTBxKTTOC4LAI10bRPjhLWXXrfYOYH0y
	B04htxJpsP9kzK8Ec5BgpFVmLah47SrWOkCUV98YqUjZEhWEBNshvebFjfPOp+wm
	97qtdIDil7gd2xOD6P4FHv60dC632eCeaGKns5yaJ1RonhZr+UQ59uS4W16SMbdd
	kvut89loA8zJsbmuor9AgiVSt0WRGqO3CUrEYf5xPU6Wu/DgCZGsL6o+DTOHkDZa
	vtN40w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xykbpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LHS1001413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:17 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:17 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:12 -0700
Subject: [PATCH v3 06/23] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-6-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
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
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=5412;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=DLZweFfSDPAHccDTF656sow8rsu6exfm48DaFgs3aPs=;
 b=9QRhnuP4YstA4RmXdB9/zFSX30iX2IfCo4FAd41mQJfME5lyFic4nu3b9MXMhCfFVQ8Lc1oIE
 Pv7GYQhVhsICXbKuTctlNIXD9Jp4UlAz/PsjMet9Yhip/F7cBaSBQVM
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qcUw_B0by_eLe-82uCRSnHq7iO0pMO7p
X-Proofpoint-ORIG-GUID: qcUw_B0by_eLe-82uCRSnHq7iO0pMO7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
from dpu_crtc_assign_resources().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[quic_abhinavk@quicinc.com: cleaned up formatting]
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 32 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++--------------------
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b918c80d30b3ad4dbc5a629deb068431122f1c57..d53e986eee5467d78aa3b4cc2bc59a954942cdea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0);
 
-	memset(cstate->mixers, 0, sizeof(cstate->mixers));
-	cstate->num_mixers = 0;
-
 	/* disable clk & bw control until clk & bw properties are set */
 	cstate->bw_control = false;
 	cstate->bw_split_vote = false;
@@ -1164,6 +1161,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 }
 
 #define MAX_HDISPLAY_SPLIT 1080
+#define MAX_CHANNELS_PER_CRTC 2
 
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
@@ -1208,9 +1206,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
+	int i, num_lm, num_ctl, num_dspp;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	struct dpu_global_state *global_state;
 	struct msm_display_topology topology;
+	struct dpu_crtc_state *cstate;
 	int ret;
 
 	/*
@@ -1232,6 +1235,29 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
 	if (ret)
 		return ret;
 
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						crtc, DPU_HW_BLK_CTL, hw_ctl,
+						ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+					       crtc, DPU_HW_BLK_LM, hw_lm,
+					       ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						 crtc, DPU_HW_BLK_DSPP, hw_dspp,
+						 ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		if (i < num_dspp)
+			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+	}
+
+	cstate->num_mixers = num_lm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ada9119326caa11cd7e7ffb754d5dee4e98ccf60..36b677cf9c7a53fdedf79107db8958a67cdd2c95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1049,14 +1049,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1083,13 +1080,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
 		ARRAY_SIZE(hw_pp));
-	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
+			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1115,18 +1107,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
-	}
-
-	cstate->num_mixers = num_lm;
-
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

-- 
2.34.1


