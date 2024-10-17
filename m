Return-Path: <linux-arm-msm+bounces-34668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC869A17D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B7B2B22A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0551F15C139;
	Thu, 17 Oct 2024 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fCsghL9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8D6A33B;
	Thu, 17 Oct 2024 01:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128101; cv=none; b=XGM380H5wSvbpkh88xXxQDG/fAnuE5rDUFsqm4IZnHhN9ObCnlXz7NWDMcqHFFpWul3QpiS3GG3NCJHERhh2TgeBfBpy5Jw+qHBT3N1aZnOHnSLU4qU3OqCREYFFmtAP5JWWmDaMxn+MkDtvhNWw/VZGqzISDRXv4XfP2ImgDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128101; c=relaxed/simple;
	bh=Uh2osSYqiNZxlG45r8i1z0Ie2Fryx21yrgA39lYHqWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IYUwUUSeh2BGxy3Bu0uEsnQr56VV1uz2ZlDI6tu7GStAwGqx1ncF7+oZBtMfPv7DzJ6XEtYhRFxN6YcOf5KqNEczzRXeF+Zl2YvAUZpyKFZPvkoDhP/up3c4w6d4q4goxBDxt6x3z5NxysPseXTrl8wP3zUX8QwhsXR4I0+bXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fCsghL9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GIsNsU013279;
	Thu, 17 Oct 2024 01:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1HuegkdlXY4Be7K+lmAuxTCSGj1s6b/58gvuuiLnQo=; b=fCsghL9VNr7sLflY
	HgNui0q39tzssDSVu84y/nTAYvZnPKZxJ7Qlydn6Ta78jeaSeJZI1XFhluT9+oCS
	iiVf8Nz8QD//7kq4pNKmUxAJ/vyoVF3W8u4XBdBnhQgKqSdAY2Ey6KmLOx3ca8Li
	LamK17FljW4IyGzrx1iXmukgdCmFS2AlqL8RTao8QTDPjLjO3J2wYYclQ1lVQe/Z
	IrCeQ8RJzS5EGJb6MuSxb2kl+LY/jtg9Mf1SyyAm8Q6GQ6xUUNinbFy3N02dsG3N
	FmpRVh2vOGwwgXEdKj55srJCaIVKkPqNO8SsBC7AUhR0Cxo7F+HwNo2tNEoUeuZJ
	wmEleg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxtc6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LHfG022722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:17 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:17 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:11 -0700
Subject: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=14626;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=QbmYv4ounKD4uT3vrIa5Wmch6rvBLUgHgtMrZvkrPVI=;
 b=pRagRJa9UHx8+rmpiz2lE361e4MQvz4yALHvAMzMvGwc+wz3MQ906Eou8SWgg6oLQoZCtWVYw
 76A/nRGmwu9D8E44sQK5LSLOAHhmxiht/KZf3frLxpVIIV+ZGPVcA6P
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fejWlLrxGOtVzupgWWNhbiAPIe0r_RQP
X-Proofpoint-GUID: fejWlLrxGOtVzupgWWNhbiAPIe0r_RQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170008

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All resource allocation is centered around the LMs. Then other blocks
(except DSCs) are allocated basing on the LMs that was selected, and LM
powers up the CRTC rather than the encoder.

Moreover if at some point the driver supports encoder cloning,
allocating resources from the encoder will be incorrect, as all clones
will have different encoder IDs, while LMs are to be shared by these
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
 3 files changed, 183 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4c1be2f0555f7ea57191b9c1718a9e041069ed86..b918c80d30b3ad4dbc5a629deb068431122f1c57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1163,6 +1163,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+#define MAX_HDISPLAY_SPLIT 1080
+
+static struct msm_display_topology dpu_crtc_get_topology(
+		struct drm_crtc *crtc,
+		struct dpu_kms *dpu_kms,
+		struct drm_crtc_state *crtc_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
+					    &crtc_state->adjusted_mode);
+
+	/*
+	 * Datapath topology selection
+	 *
+	 * Dual display
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
+	 * Single display
+	 * 1 LM, 1 INTF
+	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
+	 *
+	 * Add dspps to the reservation requirements if ctm is requested
+	 */
+
+	if (topology.num_intf == 2)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
+		topology.num_lm = 2;
+	else if (dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+	else
+		topology.num_lm = 1;
+
+	if (crtc_state->ctm)
+		topology.num_dspp = topology.num_lm;
+
+	return topology;
+}
+
+static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	struct dpu_global_state *global_state;
+	struct msm_display_topology topology;
+	int ret;
+
+	/*
+	 * Release and Allocate resources on every modeset
+	 * Dont allocate when enable is false.
+	 */
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release(global_state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
+	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			     crtc, &topology);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1174,10 +1246,24 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
 
+	struct drm_encoder *drm_enc;
+
 	int rc = 0;
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	/* there might be cases where encoder needs a modeset too */
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
+		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
+			crtc_state->mode_changed = true;
+	}
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		rc = dpu_crtc_assign_resources(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4a9edcfbcaae67eaaa161e8fe410d4927b10fc8a..ada9119326caa11cd7e7ffb754d5dee4e98ccf60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -58,8 +58,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i, intf_count = 0, num_dsc = 0;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct msm_display_info *disp_info;
+	struct drm_framebuffer *fb;
+	struct msm_drm_private *priv;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
+			topology->num_intf++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		topology->num_dsc += 2;
 
-	return (num_dsc > 0) && (num_dsc > intf_count);
-}
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return;
 
-struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
-{
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int index = dpu_enc->disp_info.h_tile_instance[0];
+	disp_info = &dpu_enc->disp_info;
 
-	if (dpu_enc->disp_info.intf_type == INTF_DSI)
-		return msm_dsi_get_dsc_config(priv->dsi[index]);
+	priv = drm_enc->dev->dev_private;
 
-	return NULL;
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology->needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+			topology->needs_cdm = true;
+	}
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state,
-			struct drm_dsc_config *dsc)
+static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
 {
-	struct msm_display_topology topology = {0};
-	int i, intf_count = 0;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	u32 num_intf = 0;
+	u32 num_dsc = 0;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
-
-	/* Datapath topology selection
-	 *
-	 * Dual display
-	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
-	 *
-	 * Single display
-	 * 1 LM, 1 INTF
-	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
-	 *
-	 * Add dspps to the reservation requirements if ctm is requested
-	 */
-	if (intf_count == 2)
-		topology.num_lm = 2;
-	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
-	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-
-	if (crtc_state->ctm)
-		topology.num_dspp = topology.num_lm;
-
-	topology.num_intf = intf_count;
+			num_intf++;
 
-	if (dsc) {
-		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
-		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
-	}
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
+	if (dpu_enc->dsc)
+		num_dsc += 2;
 
-	return topology;
+	return (num_dsc > 0) && (num_dsc > num_intf);
 }
 
-static int dpu_encoder_virt_atomic_check(
-		struct drm_encoder *drm_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
 {
-	struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
-	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
-	struct dpu_global_state *global_state;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
-	struct drm_dsc_config *dsc;
-	int ret = 0;
-
-	if (!drm_enc || !crtc_state || !conn_state) {
-		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
-				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
-		return -EINVAL;
-	}
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
-	dpu_kms = to_dpu_kms(priv->kms);
-	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_global_state(crtc_state->state);
-	if (IS_ERR(global_state))
-		return PTR_ERR(global_state);
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	trace_dpu_enc_atomic_check(DRMID(drm_enc));
+	if (!drm_enc || !state)
+		return false;
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return false;
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
 		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
+			if (!dpu_enc->cur_master->hw_cdm)
+				return true;
+		} else {
+			if (dpu_enc->cur_master->hw_cdm)
+				return true;
+		}
 	}
 
-	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	/*
-	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
-	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, crtc_state->crtc);
+	return false;
+}
 
-		if (!crtc_state->active_changed || crtc_state->enable)
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					crtc_state->crtc, &topology);
-	}
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	int index = dpu_enc->disp_info.h_tile_instance[0];
 
-	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
+	if (dpu_enc->disp_info.intf_type == INTF_DSI)
+		return msm_dsi_get_dsc_config(priv->dsi[index]);
 
-	return ret;
+	return NULL;
+}
+
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+{
+	return dpu_encoder_needs_dsc_merge(drm_enc);
 }
 
 static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
@@ -2449,7 +2405,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_disable = dpu_encoder_virt_atomic_disable,
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
-	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index f7465a1774aa0d4dfd9252b9f09b5b3c442a98df..0d27e50384f049e21d4b5b5258d77d3ec7976c13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -169,6 +169,25 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
  */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:   Topology to be updated
+ * @state:      Current DRM atomic state
+ * @adj_mode:   Current DRM display mode associated with the crtc
+ */
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode);
+
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:   Current DRM atomic state
+ */
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
+
 /**
  * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure

-- 
2.34.1


