Return-Path: <linux-arm-msm+bounces-11065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120E8551A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860171C21CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E6012CDA3;
	Wed, 14 Feb 2024 18:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CtIMaaXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345712CD88
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933864; cv=none; b=KdtZCtn/Tpl9ooejtEw1s2jQa4szF6EkrCU9K14WkDnzjxjUUEQpWYZdaL2FpzHy3NOloWEu3PWz572WDZrAxvkbBnNlY1j99auzZQzNxzI14wV267MaDUPxjppGMIZBM4JQLJHDdA3cs4FgZbHRQ+bLXXRicsjXaYBemzkUH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933864; c=relaxed/simple;
	bh=wIvTpdKcpcYOFJRUzcM3S1drfbtUzG9DuH1QtetD2N8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYJZos9KN7NhRjqb6TbtYdwrUpmCIv3rbSiM6AS8BMyzXZyeBZo720NNbWRw/GVpHyPmzeFa0I/rolfWqX8wXmsutdGZAOwD688x6bE5lZhOWwVhAqlD+UiYAHxSzJxZMRw22LfTcXM5c/5sLI/RlTJqtlk0AAJgsuTsvyNtWkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CtIMaaXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EGVsE6001539;
	Wed, 14 Feb 2024 18:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=4HBeYkc6jwbYqjdqXsjGpMgx/RbwRsRYaSB1PRA3BXk=; b=Ct
	IMaaXE7MsWYPG7aVA9Mm/LPE1dE7JsKn9cTa8gAzg+IOccTH15l4cJvsdw1Az5io
	DUNJZ+zKh27SAGR+ZcPoOzxw+aOQkkmPB4kQg9J1fBHkvu2+rSlUO1tN29lzBeAW
	FGgbE66Ok/Qm+Gv1qnKIXQrzeMqvKiTEWoq6hHv63LyI7/qiCed7iomybhNR7Y+h
	hYDm5j3VzShV4CBYtEqZFMbbKFc9NlLX6iSTk885xsNCpM7eZG8OByY77FoHV3Dj
	RX0LcnG02YO4jMm1eXEbWCLsKhTi855FcFdP/JKXGiF+aIxSizpuJ1pbKtRjg6Fh
	ijMr/daVpdVax5PnU+Xw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8j65sxy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4FTc009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:16 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:15 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 16/19] drm/msm/dpu: modify encoder programming for CDM over DP
Date: Wed, 14 Feb 2024 10:03:38 -0800
Message-ID: <20240214180347.1399-17-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xs8jZT-hAkpEQSmz8HeSLtTd9KsaJNY-
X-Proofpoint-ORIG-GUID: xs8jZT-hAkpEQSmz8HeSLtTd9KsaJNY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=974 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140140

Adjust the encoder format programming in the case of video mode for DP
to accommodate CDM related changes.

Changes in v2:
	- Move timing engine programming to a separate patch from this
	  one
	- Move update_pending_flush_periph() invocation completely to
	  this patch
	- Change the logic of dpu_encoder_get_drm_fmt() so that it only
	  calls drm_mode_is_420_only() instead of doing additional
	  unnecessary checks
	- Create new functions msm_dp_needs_periph_flush() and it's
	  supporting function dpu_encoder_needs_periph_flush() to check
	  if the mode is YUV420 and VSC SDP is enabled before doing a
	  peripheral flush

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
 drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
 5 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7e7796561009a..6280c6be6dca9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_encoder_virt *dpu_enc;
+	struct drm_display_info *info;
+	struct drm_display_mode *mode;
+
+	drm_enc = phys_enc->parent;
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	info = &dpu_enc->connector->display_info;
+	mode = &phys_enc->cached_mode;
+
+	if (drm_mode_is_420_only(info, mode))
+		return DRM_FORMAT_YUV420;
+
+	return DRM_FORMAT_RGB888;
+}
+
+bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_encoder_virt *dpu_enc;
+	struct msm_display_info *disp_info;
+	struct msm_drm_private *priv;
+	struct drm_display_mode *mode;
+
+	drm_enc = phys_enc->parent;
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	priv = drm_enc->dev->dev_private;
+	mode = &phys_enc->cached_mode;
+
+	return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
+	       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f43d57d9c74e1..211a3d90eb690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_drm_fmt - return DRM fourcc format
+ * @phys_enc: Pointer to physical encoder structure
+ */
+u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
+
+/**
+ * dpu_encoder_needs_periph_flush - return true if physical encoder requires
+ *	peripheral flush
+ * @phys_enc: Pointer to physical encoder structure
+ */
+bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
+
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
  *	This helper function may be used by physical encoders to configure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index f02411b062c4c..e29bc4bd39208 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -415,8 +415,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
+	struct dpu_hw_cdm *hw_cdm;
+	const struct dpu_format *fmt = NULL;
+	u32 fmt_fourcc = DRM_FORMAT_RGB888;
 
 	ctl = phys_enc->hw_ctl;
+	hw_cdm = phys_enc->hw_cdm;
+	if (hw_cdm)
+		fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
+	fmt = dpu_get_dpu_format(fmt_fourcc);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
@@ -425,6 +432,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
+
 	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
 
 	/*
@@ -440,6 +449,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
 		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
+	if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
+		ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
+
+	/*
+	 * Peripheral flush must be updated whenever flushing SDP packets is needed.
+	 * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
+	 */
+	if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
+		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
+
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
 		"update pending flush ctl %d intf %d\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4b04388719363..ebcc76ef1d590 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode)
+{
+	struct dp_display_private *dp;
+	const struct drm_display_info *info;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	info = &dp_display->connector->display_info;
+
+	return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
+}
+
+bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode)
+{
+	return msm_dp_is_yuv_420_enabled(dp_display, mode);
+}
+
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd8..b876ebd48effe 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
-
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode);
+bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 #else
@@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
 {
 }
 
+static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+					     const struct drm_display_mode *mode)
+{
+	return false;
+}
+
+static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+					     const struct drm_display_mode *mode)
+{
+	return false;
+}
+
 static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	return false;
-- 
2.39.2


