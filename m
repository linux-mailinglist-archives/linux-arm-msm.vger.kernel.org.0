Return-Path: <linux-arm-msm+bounces-8306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90C83CCAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B0DE29E22B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D73A136673;
	Thu, 25 Jan 2024 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JLKHbbqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914C136652
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211558; cv=none; b=rQkSVUDk6Ny8e3PeTwgn8jVloVd1Yt14DZm0yyIk50ldAjLBEJUM9LPQCyEKJtRNVq7lLD2wAUqCGmueGBBCDVKpJ71Fe0l6C6jlmymt1koprcaJXWeEnIqP2jrSkm6lzh/zBlhYFbJ8B5tU9qdG0Bq53N7CDiDJTelGz/lofZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211558; c=relaxed/simple;
	bh=LkQjkzeBRxNCYl7oOVg2EEdPDBn961LlMkv2COJnL7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqE9fLZetENXhzHCeVCoYGtl2NOIqHWJVqe7FDi2zbjXszd08lpw7lzsuC2OdzyZOkrrohJW4HQJg9LR0wb0IMS4ZfVQ1pgocL8U3uXr1+Y7uMz6kYoHSE/tTCszVWWlpwPmVedYwzOqY9c5w3W/TDV9h8QExQsaMyHlMkGBuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JLKHbbqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PEoPTb006799;
	Thu, 25 Jan 2024 19:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=cWpyeSt+XaEWRliusaB9YvT1d3yJ5m1DUeGmmnXm+Ew=; b=JL
	KHbbqTLIBCmC6wSH5hw6bDlQmeQo3uNJX+yQam+z/UKoWm2xzM+WcGk9waV6apxa
	elZB8zcj7P+xbmIXpLg1FZKhivET7nLKUFqtM0AcyQIQcJ+b0pf+s1fj3HE1Mt7+
	SHJG8uzoH5aq/XpNZKmbrYmdDi/hwW2D4CMGLQJmlanJ5dlIAXs3n4nM5JCVUxwo
	XkIBF1Go0JLMpUfcshuhqHMuMMsDoIOxqVaY3DhLPfwlUCyPPvOeLJM5YnSnp279
	/YWKGkv2p+erh+BmtrhiMJnZtOeK2BvBWmHeiRv1Yhu5Ht6JkxcNzA2y8DgV7f9C
	U8AXxeg/qMaV4nOuT0OQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vup2thfxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd9oM023758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:09 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:09 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM over DP
Date: Thu, 25 Jan 2024 11:38:23 -0800
Message-ID: <20240125193834.7065-15-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WNXPQx7b1nSWlET-fEth2q95tTLkgPDy
X-Proofpoint-ORIG-GUID: WNXPQx7b1nSWlET-fEth2q95tTLkgPDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=924 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250142

Adjust the encoder format programming in the case of video mode for DP
to accommodate CDM related changes.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
 5 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b0896814c1562..99ec53446ad21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc, const struct drm_display_mode *mode)
+{
+	const struct dpu_encoder_virt *dpu_enc;
+	const struct msm_display_info *disp_info;
+	struct msm_drm_private *priv;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	priv = drm_enc->dev->dev_private;
+
+	if (disp_info->intf_type == INTF_DP &&
+	    msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
+		return DRM_FORMAT_YUV420;
+
+	return DRM_FORMAT_RGB888;
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 7b4afa71f1f96..62255d0aa4487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
  */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_get_drm_fmt - return DRM fourcc format
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @mode:	Corresponding drm_display_mode for dpu encoder
+ */
+u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
+			    const struct drm_display_mode *mode);
+
 /**
  * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
  *	in virtual encoder that can collect CRC values
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e284bf448bdda..a1dde0ff35dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -234,6 +234,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 {
 	struct drm_display_mode mode;
 	struct dpu_hw_intf_timing_params timing_params = { 0 };
+	struct dpu_hw_cdm *hw_cdm;
 	const struct dpu_format *fmt = NULL;
 	u32 fmt_fourcc = DRM_FORMAT_RGB888;
 	unsigned long lock_flags;
@@ -254,17 +255,26 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
 	drm_mode_debug_printmodeline(&mode);
 
-	if (phys_enc->split_role != ENC_ROLE_SOLO) {
+	hw_cdm = phys_enc->hw_cdm;
+	if (hw_cdm) {
+		intf_cfg.cdm = hw_cdm->idx;
+		fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
+	}
+
+	if (phys_enc->split_role != ENC_ROLE_SOLO ||
+	    dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) == DRM_FORMAT_YUV420) {
 		mode.hdisplay >>= 1;
 		mode.htotal >>= 1;
 		mode.hsync_start >>= 1;
 		mode.hsync_end >>= 1;
+		mode.hskew >>= 1;
 
 		DPU_DEBUG_VIDENC(phys_enc,
-			"split_role %d, halve horizontal %d %d %d %d\n",
+			"split_role %d, halve horizontal %d %d %d %d %d\n",
 			phys_enc->split_role,
 			mode.hdisplay, mode.htotal,
-			mode.hsync_start, mode.hsync_end);
+			mode.hsync_start, mode.hsync_end,
+			mode.hskew);
 	}
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
@@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
+	struct dpu_hw_cdm *hw_cdm;
+	const struct dpu_format *fmt = NULL;
+	u32 fmt_fourcc = DRM_FORMAT_RGB888;
 
 	ctl = phys_enc->hw_ctl;
+	hw_cdm = phys_enc->hw_cdm;
+	if (hw_cdm)
+		fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &phys_enc->cached_mode);
+	fmt = dpu_get_dpu_format(fmt_fourcc);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
@@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
+
 	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
 
 	/*
@@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
 		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
-	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP)
+	if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
+		ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
+
+	/*
+	 * Peripheral flush must be updated whenever flushing SDP packets is needed.
+	 * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
+	 */
+	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP &&
+	    phys_enc->hw_cdm)
 		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
 
 skip_flush:
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6d764f5b08727..4329435518351 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
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
+	return dp_panel_vsc_sdp_supported(dp->panel) && drm_mode_is_420_only(info, mode);
+}
+
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd8..b9581bd934e9e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
-
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 #else
@@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
 {
 }
 
+static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
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


