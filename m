Return-Path: <linux-arm-msm+bounces-8294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995E83CCA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96E03B22F24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56C71339A3;
	Thu, 25 Jan 2024 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cIK5vNvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988A134759
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211546; cv=none; b=QMKb1IwEgh9li8K8NQPCSQGosfznA9UUbBZncoUmjknCz4woMHxYx0mrio2zXCe8syg3N6zXoM1MGgQZq8EAJk6ZwKTkIvrsSwJVdlpwFjSdfxAdmNIPx9rzuRyuugkcsuh1Oo9OjIH9UsEzdoOL3WSEl7D+QIJL9IGcVdncoSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211546; c=relaxed/simple;
	bh=GKbn3OH/qHjkTLwkka29FcqaG5v7D8sBgJJYtwu1KV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxWBv7jb2FzlyKrEV+OXF6IGTei/cbo1DCfzbckceupQiFoCn4C3c9rcb5DCbTk4DGWMVhrqdsuY1ClZzqJIcQA+tvR/AXslL21b8mQz/WlGx3xTZ8sKQ3mzuvuAu5m0FYh/HIPqY6xcOGxzPqvHiZeCQRfHQoxKl8IuZje66KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cIK5vNvX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PIw65A007978;
	Thu, 25 Jan 2024 19:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=1F0tX7h9fFr7DzPvvf9iHoNBh6qVgtxioirInoKH4D4=; b=cI
	K5vNvXLkPeDC2WTAQ1oQDf7pb9iDwE0Bp24vSVS4LOfjNL0ClWmdK2+JGt+AY2Mr
	HyR8HDqrpzJx3eHed4JoMG0Cm7onrT+Te/Bwm0lXFOJ662f87iGw2qz4J6L9Tz+l
	IefAC9ru90RQDGGUmhoaiDWzvFY8NdhrG/8/ZyPZVM4ye18Xn1hNTXXzE3zIM6wz
	QOzEZSF4nQBVUxCb3hGq1VPvCzJ4l0AivNMUVorsZANVR3iqtewSMXhjzHntlWXQ
	0Uy1FDM9Rhi3eZCih9aruv3hh1KvTWvna55OGCHFGG4L+C5wdnGV5lUzFYn/kF6p
	g21Rzi1dk5+nU4OcsGNw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vumcwsnu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:38:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJcwqc024775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:38:58 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:38:57 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
Date: Thu, 25 Jan 2024 11:38:11 -0800
Message-ID: <20240125193834.7065-3-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: xBssb2oo7aOD3YMLlMu3xFUpCYCcnd3i
X-Proofpoint-GUID: xBssb2oo7aOD3YMLlMu3xFUpCYCcnd3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=853 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401250140

Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
implementing CDM compatibility for DP.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
 3 files changed, 87 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83380bc92a00a..6cef98f046ea6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
+void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
+				       const struct dpu_format *dpu_fmt,
+				       u32 output_type)
+{
+	struct dpu_hw_cdm *hw_cdm;
+	struct dpu_hw_cdm_cfg *cdm_cfg;
+	struct dpu_hw_pingpong *hw_pp;
+	int ret;
+
+	if (!phys_enc)
+		return;
+
+	cdm_cfg = &phys_enc->cdm_cfg;
+	hw_pp = phys_enc->hw_pp;
+	hw_cdm = phys_enc->hw_cdm;
+
+	if (!hw_cdm)
+		return;
+
+	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
+		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
+			  dpu_fmt->base.pixel_format);
+		if (hw_cdm->ops.bind_pingpong_blk)
+			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
+
+		return;
+	}
+
+	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
+
+	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
+	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
+	cdm_cfg->output_fmt = dpu_fmt;
+	cdm_cfg->output_type = output_type;
+	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
+			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
+	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
+
+	/* enable 10 bit logic */
+	switch (cdm_cfg->output_fmt->chroma_sample) {
+	case DPU_CHROMA_RGB:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	case DPU_CHROMA_H2V1:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	case DPU_CHROMA_420:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
+		break;
+	case DPU_CHROMA_H1V2:
+	default:
+		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
+			  DRMID(phys_enc->parent));
+		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	}
+
+	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
+		  DRMID(phys_enc->parent), cdm_cfg->output_width,
+		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
+		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
+		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
+
+	if (hw_cdm->ops.enable) {
+		cdm_cfg->pp_id = hw_pp->idx;
+		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
+		if (ret < 0) {
+			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
+				  DRMID(phys_enc->parent), ret);
+			return;
+		}
+	}
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 37ac385727c3b..310944303a056 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -381,6 +381,15 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
  */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
+ * @phys_enc: Pointer to physical encoder
+ * @output_type: HDMI/WB
+ */
+void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
+				       const struct dpu_format *dpu_fmt,
+				       u32 output_type);
+
 /**
  * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
  * @drm_enc:    Pointer to drm encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 072fc6950e496..400580847bde7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -264,89 +264,6 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
- *                                     This API does not handle DPU_CHROMA_H1V2.
- * @phys_enc:Pointer to physical encoder
- */
-static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
-					      const struct dpu_format *dpu_fmt,
-					      u32 output_type)
-{
-	struct dpu_hw_cdm *hw_cdm;
-	struct dpu_hw_cdm_cfg *cdm_cfg;
-	struct dpu_hw_pingpong *hw_pp;
-	int ret;
-
-	if (!phys_enc)
-		return;
-
-	cdm_cfg = &phys_enc->cdm_cfg;
-	hw_pp = phys_enc->hw_pp;
-	hw_cdm = phys_enc->hw_cdm;
-
-	if (!hw_cdm)
-		return;
-
-	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
-		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
-			  dpu_fmt->base.pixel_format);
-		if (hw_cdm->ops.bind_pingpong_blk)
-			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
-
-		return;
-	}
-
-	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
-
-	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
-	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
-	cdm_cfg->output_fmt = dpu_fmt;
-	cdm_cfg->output_type = output_type;
-	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
-			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
-	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
-
-	/* enable 10 bit logic */
-	switch (cdm_cfg->output_fmt->chroma_sample) {
-	case DPU_CHROMA_RGB:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	case DPU_CHROMA_H2V1:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	case DPU_CHROMA_420:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
-		break;
-	case DPU_CHROMA_H1V2:
-	default:
-		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
-			  DRMID(phys_enc->parent));
-		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	}
-
-	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
-		  DRMID(phys_enc->parent), cdm_cfg->output_width,
-		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
-		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
-		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
-
-	if (hw_cdm->ops.enable) {
-		cdm_cfg->pp_id = hw_pp->idx;
-		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
-		if (ret < 0) {
-			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
-				  DRMID(phys_enc->parent), ret);
-			return;
-		}
-	}
-}
-
 /**
  * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
  * @phys_enc:	Pointer to physical encoder
@@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
 	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
 }
 
-
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
-- 
2.39.2


