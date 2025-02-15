Return-Path: <linux-arm-msm+bounces-48086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D016A369C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F249188D10E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDEA481DD;
	Sat, 15 Feb 2025 00:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IWjL8rOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84B2BD1B;
	Sat, 15 Feb 2025 00:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739578542; cv=none; b=hvtkCDkpBX0kWXWD8Zwcz5rjKY3IJ/vMA4JrzR/EpiHkMOy2MGNx6ulJgWQgqt/8/ss8mfQfR79mf71i4qOcU9FrygatpQoHoe4QpqwFu6AyfEHqDpbWNi1SlFaRMNpCvNNyVP14w/Qmq2T+KcoBfPcfZkmqV6ZBM9euuikvaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739578542; c=relaxed/simple;
	bh=F014DWPkXFmJurvDMZt8GhnZGOxQ4QPVbwxCeo8YLYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LFhZ6dMbsBKp8NKmqdPP8ebXEdTMa7fS0cg7bIs/+K8UrTYUN1+iApLHbqUZ4RAexY51nRG9phMjIlI1BjTAFWyLXmhMtUHEuEWAi5xxPp4McpPOWpr2N95sW4FhCwiZVMBOk6qTtl6PuYgJX2F+4mTQ9CNW6DO8lT6pNvkzUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IWjL8rOW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EBgq6v018132;
	Sat, 15 Feb 2025 00:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWZ4L1V3TWR22EtURUF2vQxU3LryE5kqkhej60pgNE4=; b=IWjL8rOWOZz2HELE
	JrNln1/QEP/J3YbIqxUo87bxL+6STnJh5hMeTWjN3D5RNOkl4HK3kqAeo1RNhN7z
	Q9w+FNZC2OAl6ddlQ8SyXb4l5Gg3tTDqKKh/voBI8gkudgTzLp8A+YtvZGwhNi3i
	KC5iO3/q2ZN0cQvXBId9Jvv4Fb0ZXIyjnlKEAcNzMTMLVUtl6SqPo46i/lTfUEsE
	IDdj3kqdpOsWtuzK7uq2qoTWvRych8/K3AlBlZO7TllNOfRgJic21y7aiKi0SQxF
	t0cokJVByxlAaHEIWDG4AhHVzfLau/gu0cfM2AURciTx1hb3c/No1/ZG7HuXRwg2
	D7J4/w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t56vhm83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FRpb028165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:27 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:33 -0800
Subject: [PATCH v6 10/14] drm/msm/dpu: Adjust writeback phys encoder setup
 for CWB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-10-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
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
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=2601;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=F014DWPkXFmJurvDMZt8GhnZGOxQ4QPVbwxCeo8YLYM=;
 b=57ddU4vLifikUM1qXMDiHKUc6Wm6Qo9Y4VbBmGgr0jzu22haVOEQzdS0IiARjLFUFPILgW4+V
 li4epqgRAcbCQzNN43Ywjbc4uBVD3gyKl59YnPMPHtqKp31V4G3GtVa
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YhnFOhNES_v9Lzf8jcJkoPg95Ukza_5V
X-Proofpoint-GUID: YhnFOhNES_v9Lzf8jcJkoPg95Ukza_5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502150000

Adjust QoS remapper, OT limit, and CDP parameters to account for
concurrent writeback

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 648e6b3aab84..849fea580a4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -68,7 +68,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.num = hw_wb->idx - WB_0;
 	ot_params.width = phys_enc->cached_mode.hdisplay;
 	ot_params.height = phys_enc->cached_mode.vdisplay;
-	ot_params.is_wfd = true;
+	ot_params.is_wfd = !dpu_encoder_helper_get_cwb_mask(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
 	ot_params.rd = false;
@@ -111,7 +111,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
-	qos_params.is_rt = false;
+	qos_params.is_rt = dpu_encoder_helper_get_cwb_mask(phys_enc);
 
 	DPU_DEBUG("[qos_remap] wb:%d vbif:%d xin:%d is_rt:%d\n",
 			qos_params.num,
@@ -174,6 +174,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_cfg *wb_cfg;
+	u32 cdp_usage;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid encoder\n");
@@ -182,6 +183,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 
 	hw_wb = phys_enc->hw_wb;
 	wb_cfg = &wb_enc->wb_cfg;
+	if (dpu_encoder_helper_get_cwb_mask(phys_enc))
+		cdp_usage = DPU_PERF_CDP_USAGE_RT;
+	else
+		cdp_usage = DPU_PERF_CDP_USAGE_NRT;
 
 	wb_cfg->intf_mode = phys_enc->intf_mode;
 	wb_cfg->roi.x1 = 0;
@@ -199,7 +204,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
 		hw_wb->ops.setup_cdp(hw_wb, format,
-				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
+				     perf->cdp_cfg[cdp_usage].wr_enable);
 	}
 
 	if (hw_wb->ops.setup_outaddress)

-- 
2.48.1


