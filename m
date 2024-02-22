Return-Path: <linux-arm-msm+bounces-12225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D986030C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF0E283A3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB596AF9D;
	Thu, 22 Feb 2024 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="abhpW/vk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F546AF8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630851; cv=none; b=f+L8wLTcu/vXmGJOQeJ9Hs3xq5P7/hTuiGP72dBmV7MjQtoaxW91m0rP41e7YwN2YkVaY9EfAQ2AtNQBgPfMYeBVuRYawllxHdLaSYxq1f5PVcgzBO2R8ygvRvJ/wR/ukhP784O8BCpCzidScoxD9w8sx5ZTA/MJitFmejfCqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630851; c=relaxed/simple;
	bh=e9nmO60E2yHaP0jElU3yrkMQ0wUt+MD63CpYix31CAE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2floh4jzAK1vYdd2yM033aj+aJlwlMP9iflhkPRWQQItPyDXjoeh5oY9ctuGXGbWThzg+osaM8/9oESVoHNFCPP8mOuzDB4fGw+O92hoeA6mJOOBdIVIcV7eaYYLx3yt7oq+kEpywhKapuCv4+FWZKqIMBGh8X2dTjmsZKySsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=abhpW/vk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41M4wpE0012123;
	Thu, 22 Feb 2024 19:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=y0BLfJOKhmKukjBBBxbaYedzwzAqtFVvUi3jaGAotXc=; b=ab
	hpW/vkvrx3JU8T83HidS5i8k3m1kp6qu0V+KAJZfH805aE4axAygfrDOz7O+PicF
	Pc2i6INy4UBUtTeRMF72Ib3igl1u8/COHjhwr92N0gXCVnBnDwIjNbao8htJwfhJ
	QH0JeckcIdtHV+/g80z+fTSSzhSs2QV2H2zyfRiX/SChg5LPOpN6nasVUv70l2eN
	OUm0KQexf4b1gcOigyPJ4i+ZRkBXZXLb9KQ0t+nYlXnqG74x5QYlFc4JKX1GwuD2
	MM+bKsrp4DRU8i0goxAV8uuGIITLcAa+dP+sPf8YS9QiVOYs+uqvKJR+DcDZx371
	qGC/sSKi4w8OSFb4P3uQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdvwwb03q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJehji029769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:43 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:42 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 05/19] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
Date: Thu, 22 Feb 2024 11:39:50 -0800
Message-ID: <20240222194025.25329-6-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HHp0SNigsyBN0JqGl4hoWap2kA-Esez3
X-Proofpoint-GUID: HHp0SNigsyBN0JqGl4hoWap2kA-Esez3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402220154

Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
implementing YUV420 over DP, which requires CDM compatibility.

Changes in v2:
	- Slightly change the wording of the commit text to make clear
	  that YUV over DP requires CDM

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 83 -------------------
 3 files changed, 87 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8932f38a41b2d..1905e8653b77a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2117,6 +2117,84 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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
index 204d7cc3c1de8..f43d57d9c74e1 100644
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
index 072fc6950e496..32a7a31b667be 100644
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
-- 
2.39.2


