Return-Path: <linux-arm-msm+bounces-42434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086079F3F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8CD189190A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CED15535B;
	Tue, 17 Dec 2024 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DEkS4oO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD16145FE0;
	Tue, 17 Dec 2024 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396225; cv=none; b=IjWFxvvqjyVktw+epeB/Ql6CN0TLqiEPEJK7UNGQiYSvncNDCbbFt2TZ015Nh3E9qGvtatPO6leD9vSfmU1y6sISKRmCv5nvvtBEBSCdeL4isvvsC7nOjAxS4BfJewBUCApYliv7Yb+TavxTKxvdsK0dW6j8385CLMjordBe8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396225; c=relaxed/simple;
	bh=wLoWkFirgi84BYEh/Liwv/8V3eksFKTgbyFrVbpRhic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=srG/YeawXmoQeXxii2nLkV1+AbmEpdpMmu+zOBAWqb5bC0+SZTMDBJSwGnb7pzwoL0z6Pw0BD3jDXjSnL/jpQK6kfAvnzgz9NeF0zVTVCgYSNOsd27WW0tHisoq7SlXeukrdH0AJLrH8nxzq400YgEV6l1Kal40kYPsNIpgNnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DEkS4oO2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMrVwm006689;
	Tue, 17 Dec 2024 00:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+CuoR5wTOn+x2WxAsspqptD8vxbxNktQZjS6rDw/HE=; b=DEkS4oO2up0VNkxW
	70a8nkiTZzNjiAGa1O4ji+7zvyEv2DyJ63Mdx9lJwAM9aeV8XiDFytuSYtDBiSmL
	348moFPiGnUTHqFtWDWAvpoYSPyfxlH3fYLDuQZmVTMT37zyVws98QBBICTh5bJ2
	Ap9oZL6xPdExglkVsm9MaSrHhckC7Ymbroldq5oR9pBtW5OD7A+v+V5mfSUsZTlC
	iwXyZv+G7SaXnQztE4ROv93g4SQrnHRz4BdLYeH+k7w8BLaw73xPqfgjatd2sTZR
	fmy7FH2u303EQQ/WmzUyYc9BXNDTH+OxXobapKeU7WlXhEn4Ph+4xPLetaJChyHI
	PsCOag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jwda062h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hTDk030653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:29 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:26 -0800
Subject: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=3375;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=wLoWkFirgi84BYEh/Liwv/8V3eksFKTgbyFrVbpRhic=;
 b=TfAS7T39FkuupI63f6sH/quSvqywkBueulhTOcga/aRWGwZrPInsnodDmCfH6dAjKmbVoZAD8
 Rn1zC+6PFMkABqMV8+e8SgYIAnL8cJBNdHcCZ2RLsGmF4c1x4lRcXLq
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m_x3YUPWX9qNJBcdfbIdi9uim2af4I96
X-Proofpoint-ORIG-GUID: m_x3YUPWX9qNJBcdfbIdi9uim2af4I96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=986 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

Add the cwb_enabled flag to msm_display topology and adjust the toplogy
to account for concurrent writeback

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
+	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+
 	/*
 	 * Datapath topology selection
 	 *
@@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
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
index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	/*
+	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
+	 * control path. Hardcode num_ctls to 1 if CWB is enabled
+	 */
+	if (top->cwb_enabled)
+		num_ctls = 1;
+	else
+		num_ctls = top->num_intf;
 
 	needs_split_display = _dpu_rm_needs_split_display(top);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -46,6 +46,7 @@ struct dpu_rm {
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
  * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ * @cwb_enabled:  indicates whether CWB is enabled for this display topology
  */
 struct msm_display_topology {
 	u32 num_lm;
@@ -53,6 +54,7 @@ struct msm_display_topology {
 	u32 num_dspp;
 	u32 num_dsc;
 	bool needs_cdm;
+	bool cwb_enabled;
 };
 
 int dpu_rm_init(struct drm_device *dev,

-- 
2.34.1


