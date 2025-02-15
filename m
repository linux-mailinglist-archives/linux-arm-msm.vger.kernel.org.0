Return-Path: <linux-arm-msm+bounces-48098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A246A369D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1210188D836
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06F3156F44;
	Sat, 15 Feb 2025 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HMM85a/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CCB16419;
	Sat, 15 Feb 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739578545; cv=none; b=vCmJ+685FbfrL/luAq6jaCWXbt0toyXKzywXPppKBVpmNKixNiWiEro4c2d2zrqcnHeAua75GOyP+jYhZpvxSC/of1Tk0Dh4ghPjgLZkfO1XBdZ6XBt7i23ytuiEDMVNV2F4Xs2uIY7jpMH6u3dxkgi2DL9lK3fT4/tX7rwrCYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739578545; c=relaxed/simple;
	bh=pvgECbPQ/JDAivTsh+L479RxNw/VRhZQY1DvYVgYBYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DOFha1dKEFlZr35/pp0BCFCkRGtVfzrxkOX8oyiT32gAXrEWTibakeeNlbtEtJTFMjYLMnI8ExCpHqmC+4SkvF7bbRhr8aRt6UN+zbuUI/oBZbGWxKPBxMHl76ErTl46LroA5aHu4TIZ3IzHAgIYrlompLFNPyvfmjDR/RUU2qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HMM85a/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EJNB1V016912;
	Sat, 15 Feb 2025 00:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zaw3IqhXyte3xZi7odT+t8I4NjSERvJ6XMjdv/I0VjM=; b=HMM85a/kZztu/4IH
	iGcEyRMLStM43Q85+bEAhtvd+aLoRHRNfzs5sPbzl3SGOuuKmQ0KKEj45IqYYwhN
	f3ABu1EV4A7wnxeQwwudCTMEZKsUYEuyfe2Ts8ZLwU5MW7nsQt+g8XjZP5a2drAJ
	WKbMsQ+pUoOSLFjBv6GcYK4LMgU4rN6rN8Z4Vb36ZK4cVRe2FBd6F+2QLmJ5f1IM
	b0klon8cLhVkGt6QQRdLd48Yurl3DkHhyMjmCgZREnL0Hx+XcBB0/abSXlnwmLLm
	bUL0TRYXppuMDEA9pbttGI1vnAyZ5s00a5VbUd7D3e1WT+LzO/XJ2kWNtTZE12oU
	ot/DAQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sde8d87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FSQk012726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:15:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:27 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:35 -0800
Subject: [PATCH v6 12/14] drm/msm/dpu: Skip trigger flush and start for CWB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-12-a44c293cf422@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=2387;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=pvgECbPQ/JDAivTsh+L479RxNw/VRhZQY1DvYVgYBYg=;
 b=6glMxdFzMYuJAvEDul78w0KjwjbqSgAn/9NeVX/91QC0z8hkjFD0JnnVSTZRMN6OVt2Lpx8bf
 YyynI8En/UUBfWbsANOwi4U7zfiKXErgvl/FWyeGT7GYeMot+6KTmXK
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8iL3BwUncLIUvLPIbrJgicEm3vPbs91w
X-Proofpoint-ORIG-GUID: 8iL3BwUncLIUvLPIbrJgicEm3vPbs91w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150000

For concurrent writeback, the real time encoder is responsible for
trigger flush and trigger start. Return early for trigger start and
trigger flush for the concurrent writeback encoders.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 69f63151ca94..5b1dd74471d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1610,6 +1610,7 @@ static void dpu_encoder_off_work(struct work_struct *work)
 static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct dpu_hw_ctl *ctl;
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
@@ -1627,6 +1628,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
 	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
 
+	/* Return early if encoder is writeback and in clone mode */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
+				DRMID(drm_enc));
+		return;
+	}
+
+
 	if (extra_flush_bits && ctl->ops.update_pending_flush)
 		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
 
@@ -1649,6 +1659,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1659,6 +1671,12 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
+		return;
+	}
+
 	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
 		phys->ops.trigger_start(phys);
 }

-- 
2.48.1


