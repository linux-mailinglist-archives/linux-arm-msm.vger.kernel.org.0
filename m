Return-Path: <linux-arm-msm+bounces-11053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7D855198
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA9C292A34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE37112C81E;
	Wed, 14 Feb 2024 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n6o3eetw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B812C819
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933859; cv=none; b=taFox7g4k0XVSaJFzyEMUeR6vBDFbqOdQcA549XY6Zecmpj19q1YzuZLFUBgPeSutqIN6lwxTh9eayS/5w9TGWExPKOanvBGNEB68YrUmfFPUMpRjrptv6UyTb+rBblLX188GTRpnlQDeXPlbNusWwByZH7XNxaSIWO7XDyseAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933859; c=relaxed/simple;
	bh=EPYU7jzVJVl4qLtx40eR67SdWgmJsr5Ce74ydOk6n6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKDC8mwFZylIp98yz1Kb3+FqfZVXiNFR8u9LQM0H8/LBnBqz4rHDIrog8+LZAYmuN1P6dg6pGk3ddJU6prG3uQeAFp7kRnMiKqB3LCjNzO7/2bo9LJiLB+uUgDbwP/O/NHhpFnImGkNE5H8J3IdZKQOA1uprO+BdUXC1nrRIIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n6o3eetw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41E6q0B6027945;
	Wed, 14 Feb 2024 18:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=XaI+1cEG8bMAJJ8+LruHY9D6I6KVtw5F03a98Xy1zKw=; b=n6
	o3eetwIIRMqh878mKvSpJ8lOFvTAWFnubvqsfe2baBj7L7zl1ca+l37Dl00Ippoh
	cwgE9mbhvrCsefSIe8h5f0kkjR/ZSL2kAIJYbEnOwlaTluOaDktgWcY3m54dvXR4
	NVz5utV1lQZUfre/TO6MW1E3v16giXSzFyp7hAjlthnqFU9AxXaiwjIWfGUnJ1Um
	xd2AZrgWvad8A/4vbmVh28maQjFOwUIvsWKAVOxOdcNXFTrIJ9Z1CfPVkuuJKsjK
	UZaY+S2ZH9WvNlcaoa5se1lzzZAdf1gR36SOncPWZ23jzhBqJcz8tiXiy6h/0Amc
	LqRR6o6r2h8iNqgMUTBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8myg1s4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI46nv030670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:06 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:06 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 04/19] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
Date: Wed, 14 Feb 2024 10:03:26 -0800
Message-ID: <20240214180347.1399-5-quic_parellan@quicinc.com>
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
X-Proofpoint-GUID: 89Rceqa98-miEoAtKm092ckT8f-A9LLA
X-Proofpoint-ORIG-GUID: 89Rceqa98-miEoAtKm092ckT8f-A9LLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402140141

Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.

Changes in v2:
	- Minor formatting changes
	- Move the modification of the dimensions for CDM setup to a new
	  patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 27 ++++++++++---------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 993f263433314..204d7cc3c1de8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -154,6 +154,7 @@ enum dpu_intr_idx {
  * @hw_wb:		Hardware interface to the wb registers
  * @hw_cdm:		Hardware interface to the CDM registers
  * @dpu_kms:		Pointer to the dpu_kms top level
+ * @cdm_cfg:		CDM block config needed to store WB/DP block's CDM configuration
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
  * @vblank_ctl_lock:	Vblank ctl mutex lock to protect vblank_refcount
  * @enabled:		Whether the encoder has enabled and running a mode
@@ -184,6 +185,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_cdm *hw_cdm;
 	struct dpu_kms *dpu_kms;
+	struct dpu_hw_cdm_cfg cdm_cfg;
 	struct drm_display_mode cached_mode;
 	struct mutex vblank_ctl_lock;
 	enum dpu_enc_split_role split_role;
@@ -213,7 +215,6 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
  * @wbirq_refcount:     Reference count of writeback interrupt
  * @wb_done_timeout_cnt: number of wb done irq timeout errors
  * @wb_cfg:  writeback block config to store fb related details
- * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
  * @wb_conn: backpointer to writeback connector
  * @wb_job: backpointer to current writeback job
  * @dest:   dpu buffer layout for current writeback output buffer
@@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
 	atomic_t wbirq_refcount;
 	int wb_done_timeout_cnt;
 	struct dpu_hw_wb_cfg wb_cfg;
-	struct dpu_hw_cdm_cfg cdm_cfg;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_writeback_job *wb_job;
 	struct dpu_hw_fmt_layout dest;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index ec9e053d3947d..072fc6950e496 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -269,28 +269,21 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
  *                                     This API does not handle DPU_CHROMA_H1V2.
  * @phys_enc:Pointer to physical encoder
  */
-static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
+					      const struct dpu_format *dpu_fmt,
+					      u32 output_type)
 {
 	struct dpu_hw_cdm *hw_cdm;
 	struct dpu_hw_cdm_cfg *cdm_cfg;
 	struct dpu_hw_pingpong *hw_pp;
-	struct dpu_encoder_phys_wb *wb_enc;
-	const struct msm_format *format;
-	const struct dpu_format *dpu_fmt;
-	struct drm_writeback_job *wb_job;
 	int ret;
 
 	if (!phys_enc)
 		return;
 
-	wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	cdm_cfg = &wb_enc->cdm_cfg;
+	cdm_cfg = &phys_enc->cdm_cfg;
 	hw_pp = phys_enc->hw_pp;
 	hw_cdm = phys_enc->hw_cdm;
-	wb_job = wb_enc->wb_job;
-
-	format = msm_framebuffer_format(wb_enc->wb_job->fb);
-	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
 
 	if (!hw_cdm)
 		return;
@@ -309,7 +302,7 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
 	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
 	cdm_cfg->output_fmt = dpu_fmt;
-	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
+	cdm_cfg->output_type = output_type;
 	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
 			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
 	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
@@ -462,6 +455,14 @@ static void dpu_encoder_phys_wb_setup(
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
 	struct drm_display_mode mode = phys_enc->cached_mode;
 	struct drm_framebuffer *fb = NULL;
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
+	struct drm_writeback_job *wb_job;
+	const struct msm_format *format;
+	const struct dpu_format *dpu_fmt;
+
+	wb_job = wb_enc->wb_job;
+	format = msm_framebuffer_format(wb_enc->wb_job->fb);
+	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
 
 	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
 			hw_wb->idx - WB_0, mode.name,
@@ -475,7 +476,7 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
 
-	dpu_encoder_helper_phys_setup_cdm(phys_enc);
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
 
 	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
-- 
2.39.2


