Return-Path: <linux-arm-msm+bounces-30130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016A965138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 22:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBEFE284813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 20:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8185C1BD017;
	Thu, 29 Aug 2024 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cj9+ES1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3A18C00A;
	Thu, 29 Aug 2024 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724964562; cv=none; b=OIExCgowO51POdz7HHI1pSwWn0dX6QkK1Zg4Tz5U4EKalHjZnJfx8JbEK1b+YYOhm9HxdMyoCI/Jjr+cuXBBgCjifmeiMp5e+9lIPyvDHDfTAnPfjxhe2EGGlKtp+kQdoz2BxzUwChnb+LQxy1KVxi+yApVUNH5D52VUcRQ2Qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724964562; c=relaxed/simple;
	bh=EsK89cuQd4E/Olk9CLDiqKxnZJMyBEVg2nofQkF5Db4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qrp8Po6Ucvne8gXPbhF0siF8sFEUmKkNdqbNEVe48lKpYlcQWuJO0+h2QAGdouHk9Z68fmO6t28cNd3gJ2eyRnWVaHmIdMSnlKikX2142JArGpIRYWCj75EsonlzXCscboTh3HrJEP0McaQff7DuOwrGfrUk7rC3zHTa/IOsbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cj9+ES1I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TIGteV028780;
	Thu, 29 Aug 2024 20:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9xmPE3LcEFtsnje+NXk1JzGDpi3cJIN0kHrvQdUo6k=; b=Cj9+ES1IF8B1d7bM
	2fGu/M4hBYlCrBSHG6PR8sD03n3Nj8een8PpQRbvPn187Xam6ByNw2TwCorRayCU
	Ds6RZgxZ2D4pSkA4wdrcvAA5j09gVqghQPB+IAf83Tw2AuxlmZ9hYKAcBjtYagG9
	cU5izANXOluqt12m/+enveu2qGAi3XeJyLJPHkQPYv0C3hql6136H+KpFYdfanPS
	s4lXkN5pDck9YabDJan0lCtsxz9EMZgyeZTbj5FJB7ed/sMIuiwuJiln07R6ZrqT
	i4TiIl2P/LrSpMaXJW9emvgcN/y4MeZijaggZaod2ISrr6VCIuVdJIPFGYoWLkhq
	pEiekQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ax4mgarj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:49:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn4e6021042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:49:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:40 -0700
Subject: [PATCH 19/21] drm/msm/dpu: Skip trigger flush and start for CWB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-19-502b16ae2ebb@quicinc.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
In-Reply-To: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=2215;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=EsK89cuQd4E/Olk9CLDiqKxnZJMyBEVg2nofQkF5Db4=;
 b=vf1u1k7QGkMcp4X/2ZSFaPDSoGEvv711r3qSuI77cuEA3X5IkALKfZnXKD9NZK5OtTDU/NVH4
 XdAnr+Hill7Bs+2QN/xI4OwIyHa+F72sFU409z9BZwkcsTcouSmJHu+
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0va5OZCIrb031jAv5k4UiguokciDdLPc
X-Proofpoint-ORIG-GUID: 0va5OZCIrb031jAv5k4UiguokciDdLPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147

For concurrent writeback, the real time encoder is responsible for
trigger flush and trigger start. Return early for trigger start and
trigger flush for the concurrent writeback encoders.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9d495a186eb8..47b5a5994234 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1493,6 +1493,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
 {
 	struct dpu_hw_ctl *ctl;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
 
@@ -1509,6 +1510,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
 	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
 
+	/* Return early if encoder is writeback and in clone mode */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+			dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
+				DRMID(drm_enc));
+		return;
+	}
+
+
 	if (extra_flush_bits && ctl->ops.update_pending_flush)
 		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
 
@@ -1531,6 +1541,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1541,6 +1553,13 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+			dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d CWB enabled, skipping\n",
+				DRMID(phys->parent));
+		return;
+	}
+
 	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
 		phys->ops.trigger_start(phys);
 }

-- 
2.34.1


