Return-Path: <linux-arm-msm+bounces-32346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E194984E5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7917A1C23510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB0218592F;
	Tue, 24 Sep 2024 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I1iuBMPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C218453C;
	Tue, 24 Sep 2024 23:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218813; cv=none; b=LRosODPwy+o7rdqPmsWvPz/Bte1U8nk214sDvi2ZaFDM7vIf8s3oZBMmMaUT70uPrXht+QqgBtC0zdbA8lkj4+vL7CbB29FlLjqyn5b+w2t751XcPq7X9yxE7giu9OOv8Y9VW73Q7ByxpPhRL1ZGF+9vFy939BD/xqqpCUZ/N04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218813; c=relaxed/simple;
	bh=vTd5wZD++p6l2VT711s6dJ+3qBnB6Idl+lQDvIxPUTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=m6wWbFpeSqsYft4F+o3zCk9U0Q0pgqzp47+1jtKbIq/LR+/aSyJI8b2YY+UT5QjfWpP16QCpsM2EHrv8y4fk4C45I0PiAPfvO3dUaQPWqU4AnTwjJo/rA4Ig9Qk14oQxVPCdPp99abE4Fgm6y090leYphAimcoTqdZbcBa+SLag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I1iuBMPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OGs4ZN017527;
	Tue, 24 Sep 2024 23:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4HLFAKAwF39LY1TL5UYRvbpLZQAW45NQgmPHJu/uwQ=; b=I1iuBMPq+E1LVAns
	NgfrCP7bqg5tSljNmXk4b1wJ8Cp8kUbI3SCu0KAVYX/0qkF3jA+yD7M1959kiZYl
	Kvflam4jz0dW/U2jIA1Dk+llmUu59+JAy/hAIfrSToP6Azggf4mdkIjZHbF/PoKL
	5LEwu6iQGLCJ62s0O18hImXoc+PrbcqqzmywpXmD3XRIAV5TXx+sUWq50hFT/0n4
	NzCP6QvR83XA7CXbakjUugqgAaUiGkS7tGAozxPsgLPWjWsk40Du84Mx4TMh4oHx
	3uF136f5KyEiTz7P9WDMegR2M7oXabkgqUKnaR1nvv4P15N6NVSh5ZgH1cwsPBZO
	VgkhkA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2t1r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 23:00:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxxe7024998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:59 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:36 -0700
Subject: [PATCH v2 20/22] drm/msm/dpu: Skip trigger flush and start for CWB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
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
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=2270;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=vTd5wZD++p6l2VT711s6dJ+3qBnB6Idl+lQDvIxPUTM=;
 b=ap928yEnbTX1FAk4D91Ks/Mvp9uGa0Qgje2qedyK2ryZvKrBLbE1c3rCSQcoJlqSbeoUoABAH
 3nP1iHSAcQjB6qh9cnX5kCgOLw1XXE0H8KflCYqEAVi8WXZKpzTKDQx
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Uo7RJH0lEU9HTAOBrYKjnmpMbBC9I6xk
X-Proofpoint-ORIG-GUID: Uo7RJH0lEU9HTAOBrYKjnmpMbBC9I6xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

For concurrent writeback, the real time encoder is responsible for
trigger flush and trigger start. Return early for trigger start and
trigger flush for the concurrent writeback encoders.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ac3ff13b65c3..87eaaf1196c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1488,6 +1488,7 @@ static void dpu_encoder_off_work(struct work_struct *work)
 static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct dpu_hw_ctl *ctl;
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
@@ -1505,6 +1506,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
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
 
@@ -1527,6 +1537,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1537,6 +1549,12 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
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
2.34.1


