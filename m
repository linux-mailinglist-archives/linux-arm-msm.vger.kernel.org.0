Return-Path: <linux-arm-msm+bounces-8298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EA183CCA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0AFA1F29A8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5601BDD6;
	Thu, 25 Jan 2024 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+MTpqhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057119B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211550; cv=none; b=XLNxViDCTq58D9hj+gohcFp1D6MnHS5htyAzSrfNRWyI0haUU29XRcecbTpyUwpQvs3kd8GM8Yjjgp4Z1QpDLq9rm53YdQ+fC2Tp3sEIttBNn5hojMsdhoXJrCBYqtKUDpvt6yeW91Ajq4Bpkh43r+9Mknacad4ZL4KGJE5sfZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211550; c=relaxed/simple;
	bh=NVVL2V+HbY+uPPgn5b9Zpry4DaPaI8neIwBcTk/3T84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdXWkAHitzvuZHj79zYJmD09FL6t9Lps9OHXlgpvcQqtyt91Xtwpmez4LgXj5kicUzLg7/KuVapR7vcDpBXCNFA69hSlMA8ksH/jjctiJ2KanPsto9pDFfwpdGWCkmDNCP+yfK/lqQH7XCwwkfQJxqoPGK/RCXWBCqHvZdJwg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+MTpqhu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PFMQA9012220;
	Thu, 25 Jan 2024 19:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=L5NpXeWWeGKjBmsnFVsKvgZWUj3qe4wu2cyuep4K3TQ=; b=d+
	MTpqhu//nHjFwKD4cY2bBg7ng7FeA9P251QwOEYHO47BSx2Uzu9DryVpsNF94Cqe
	CfwQezMwdQnuRmiwqV71b27betaK5gZoUDUJDVq2+wpWscyCXIPVru+2+jCNSx+b
	JXfMP5AZQ+icmcmTXR6OlCHJzp9K9WRhsEazZBP4LFKrBeHszbFnYWdZszMU/gCn
	FS+2087yaqqnqMi0OE5sLqndKlkCYcXJDxOKBoxn0N+YI9BNkBxUa6nQSR4wfMXy
	5ZH4mnJJgbw84N/A9WO1hu4bzOT/dlxkaqPizT4z7hGe2cxrK7JobtSlPf5j3Qg9
	nVocL9J/Cxo8x8QZDG5Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufwxaaur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd1CG002461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:02 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:01 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 06/17] drm/msm/dpu: move widebus logic to its own API
Date: Thu, 25 Jan 2024 11:38:15 -0800
Message-ID: <20240125193834.7065-7-quic_parellan@quicinc.com>
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
X-Proofpoint-GUID: Jsp1QOwQUV8ijRQD1dRiuR1HI8Y0KqSp
X-Proofpoint-ORIG-GUID: Jsp1QOwQUV8ijRQD1dRiuR1HI8Y0KqSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250142

Widebus enablement is decided by the interfaces based on their specific
checks and that already happens with DSI/DP specific helpers. Let's
invoke these helpers from dpu_encoder_is_widebus_enabled() to make it
cleaner overall.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6cef98f046ea6..b0896814c1562 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -225,9 +225,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
-	const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	const struct dpu_encoder_virt *dpu_enc;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	const struct msm_display_info *disp_info;
+	int index;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	index = disp_info->h_tile_instance[0];
 
-	return dpu_enc->wide_bus_en;
+	if (disp_info->intf_type == INTF_DP)
+		return msm_dp_wide_bus_available(priv->dp[index]);
+	else if (disp_info->intf_type == INTF_DSI)
+		return msm_dsi_wide_bus_enabled(priv->dsi[index]);
+
+	return false;
 }
 
 int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
@@ -1192,26 +1204,17 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 	struct drm_display_mode *cur_mode = NULL;
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
-	struct msm_display_info *disp_info;
-	int index;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	disp_info = &dpu_enc->disp_info;
-	index = disp_info->h_tile_instance[0];
-
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
 
-	if (disp_info->intf_type == INTF_DP)
-		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
-	else if (disp_info->intf_type == INTF_DSI)
-		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
-
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
+	dpu_enc->wide_bus_en = dpu_encoder_is_widebus_enabled(drm_enc);
+
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
 			     cur_mode->vdisplay);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4c05fd5e9ed18..7b4afa71f1f96 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -156,6 +156,10 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
  */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
 /**
-- 
2.39.2


