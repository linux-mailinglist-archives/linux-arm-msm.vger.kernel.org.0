Return-Path: <linux-arm-msm+bounces-46452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BCA216D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 04:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E506C161BCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7219D19924E;
	Wed, 29 Jan 2025 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J0t6zyM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE7194C92;
	Wed, 29 Jan 2025 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738120893; cv=none; b=EXY+5hY+JFfu/k3Ej7Do2lNtpwmdNn4CbofzeIfAOgfvm2W+nh71DEOxfEbrhhNJrUaB5jiaogo9Q/XW89vqUy9auyV+voel4DcmSKPBt7AG5+Lqxu0eSimfoRPOq+PuqJPdKFcUvcg97mMyzv00ys8JgcL2LyFhu57RUnDA/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738120893; c=relaxed/simple;
	bh=Rb8gnPR5V1E8D4gA2Znczy6RJFgd6o3zJ23bHpCSW8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=n52sf4MrlJvEYjrGTg+TmgR0JdjQ7MdxQlXu5ECvr+MDsm0vu+IIi9TEFAcnQ1KKfsbYHT40CmDKBD8zotXhtyjrszA1UP4E3pnvRrLVde2ldBCzRdMXS1kQ4qm4MHgtI+3Su0ehOhKpfnEJW3AHbfWiICTgksMCnNmBheN7FEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J0t6zyM6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2hl08024678;
	Wed, 29 Jan 2025 03:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujyWe5p8QurZUnc6a7HNvOAEUv0f1Vbu+TXI2utMM/Y=; b=J0t6zyM6oV9EbS1o
	etKbxzLR+Ae12BvO+LZpj6f/tzgTp5aRdRFihChwzy6JdPPHnabjc7fRsk2b8ciz
	Ro5kfy/yDPy1eKoiVTBQfGf9NeU+eThNNB8L1YJkicyZgDsY4ZXxgcnufUoSheWT
	uanlsbj9y2VDVIYHOEZ/KVQQzrCWRKp2UKQveL/sK9Yk+6yJliLAYjEyIfC11bVT
	xgcS06QDN4eXzcZvrM1pf9R5i+SERCwE4ILAccD3GAFRXmZjlP0BpCbNOxnRemL/
	Kq6bzGc+oddlx58AaN3IYwZ9JEzkLT9uqcaR8CFnPSVJ7iPrxTyXsY9sLlIpmoR6
	OBtrAA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eygu9rc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 03:21:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L6mn012897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 03:21:06 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:06 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:20:36 -0800
Subject: [PATCH v5 04/14] drm/msm/dpu: Add CWB to msm_display_topology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-concurrent-wb-v5-4-6464ca5360df@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=4227;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Rb8gnPR5V1E8D4gA2Znczy6RJFgd6o3zJ23bHpCSW8s=;
 b=ISfVxqcFhsHovIYMXw0tnMAYZfajPX5rEz3Rrq3ZGHBQIdx3TVJfyJ3TJfLkxltyOd46fjhlW
 FhAtx6NKdG1DauUebgq4A3ANQIhDgQqVHhZCwoaiNV+b11OI2aG+UnN
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1vt_t2jMuneWlSBjdXIQq0Bm2yvOvfL_
X-Proofpoint-ORIG-GUID: 1vt_t2jMuneWlSBjdXIQq0Bm2yvOvfL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290026

Currently, the topology is calculated based on the assumption that the
user cannot request real-time and writeback simultaneously. For example,
the number of LMs and CTLs are currently based off the number of phys
encoders under the assumption there will be at least 1 LM/CTL per phys
encoder.

This will not hold true for concurrent writeback as both phys encoders
(1 real-time and 1 writeback) must be driven by 1 LM/CTL when concurrent
writeback is enabled.

To account for this, add a cwb_enabled flag and only adjust the number of
CTL/LMs needed by a given topology based on the number of phys encoders
only if CWB is not enabled.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

---
Changes in v5:
- Reworded commit message to be more specific
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8144de25ac7316e9ab9ab0aa45c0d01a7267c24c..3449a7066e084eaeeb713d21d53f3d8e877cc30e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1246,6 +1246,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
+	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+
 	/*
 	 * Datapath topology selection
 	 *
@@ -1259,9 +1261,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
+	 *
+	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
+	 * enabled. This is because in cases where CWB is enabled, num_intf will
+	 * count both the WB and real-time phys encoders.
+	 *
+	 * For non-DSC CWB usecases, have the num_lm be decided by the
+	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2)
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a7b4086ae990aaebfd1103acd50ff2a84cff4406..0fbb92021b184c4792ddfe059e98b3acf7bc7cc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -381,8 +381,18 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	/*
+	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
+	 * control path.
+	 *
+	 * Hardcode num_ctls to 1 if CWB is enabled because in CWB, both the
+	 * writeback and real-time encoders must be driven by the same control
+	 * path
+	 */
+	if (top->cwb_enabled)
+		num_ctls = 1;
+	else
+		num_ctls = top->num_intf;
 
 	needs_split_display = _dpu_rm_needs_split_display(top);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 463c532cdfdff1d8b7fb8760c40c2c572ce3d674..b854e42d319d2c482e4e1732239754979f6950dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -52,6 +52,7 @@ struct dpu_rm_sspp_requirements {
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
  * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ * @cwb_enabled:  indicates whether CWB is enabled for this display topology
  */
 struct msm_display_topology {
 	u32 num_lm;
@@ -59,6 +60,7 @@ struct msm_display_topology {
 	u32 num_dspp;
 	u32 num_dsc;
 	bool needs_cdm;
+	bool cwb_enabled;
 };
 
 int dpu_rm_init(struct drm_device *dev,

-- 
2.34.1


