Return-Path: <linux-arm-msm+bounces-27577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82C943654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 21:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56BFC28580F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 19:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA91607B5;
	Wed, 31 Jul 2024 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XNFSh2rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306051607B7;
	Wed, 31 Jul 2024 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453539; cv=none; b=fvm/rVC/YirVQoOsNIncO1jw5Xk+olOVJCEN/YKGYduGL5cwcF4V+kB/QQks6/poq/ZP0nmoZUcstp7q53tByUCXzzUDzszdW/TrSEDRa7RWcusFFLwKXQr8J+ADyQ5rRD8Z+LKlfOKSW2w8x3opzbXRXEzK7o+MeeSOoFYKrR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453539; c=relaxed/simple;
	bh=+P/abtSGxiZPMAiZAo3haGY/M/31j5J/u+le+gI6cVE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=drYvsJzfsZAqrxyf6VGKme4ZA60Q01E8tuxEE/eIG4EwdKDBxVe4Z0uJRDDt5vwbWVMlHfkxtQom+qD7RjsyBJxNGxXI0tzfGCw7vIDRL16P7z0gs1Hjb9ij820VdyNMoq8BQJTV0iRXyK0VnGNU31MOFJ0N3y6YDvtsZSjkWo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XNFSh2rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VAwfbG030503;
	Wed, 31 Jul 2024 19:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l3ltcUHk9tMQkTOvGEzCW7
	XZoeuWZcKvuiV5U4TLfXA=; b=XNFSh2rgueqD8EbrBEGarNu7G0nomh9uFZ+L2g
	TaxQbV/pc/ONkjTDka20Dl5i80ShFY6KllW4mZsGLSSZTxtnfKnCE1oStY9yFGbK
	EmJYW+rHdNtWC5zFoVJf9VNtNX577L2dc6pu53Go/mJyhH1K/nxpjM1OdAD52nw9
	3B/NcGZjay1Fsl7jqgEJ/BAVBc6Ox/TsOQOqZvJrMzgh7sNz1l2xPL8K9VEzpftn
	0f8MZpPm6WtRxP94xge3w6p/va8guE3T3o+SITBGVY67+5Pn8SrojSO0TIpFjMcs
	SXF5c+SgANopUb9wUDLd+z7LJXYw5LzLLEQeMnV8hHADtI8g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qm081cwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:17:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VJHgxk021058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:17:42 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 12:17:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
CC: Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Archit Taneja
	<architt@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
Date: Wed, 31 Jul 2024 12:17:22 -0700
Message-ID: <20240731191723.3050932-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TS2lMN5NxMTUrN4xROGPYtVXkpKCpPxJ
X-Proofpoint-ORIG-GUID: TS2lMN5NxMTUrN4xROGPYtVXkpKCpPxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310135

For cases where the crtc's connectors_changed was set without enable/active
getting toggled , there is an atomic_enable() call followed by an
atomic_disable() but without an atomic_mode_set().

This results in a NULL ptr access for the dpu_encoder_get_drm_fmt() call in
the atomic_enable() as the dpu_encoder's connector was cleared in the
atomic_disable() but not re-assigned as there was no atomic_mode_set() call.

Fix the NULL ptr access by moving the assignment for atomic_enable() and also
use drm_atomic_get_new_connector_for_encoder() to get the connector from
the atomic_state.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 34c56e855af7..3b171bf227d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1171,8 +1171,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
-	dpu_enc->connector = conn_state->connector;
-
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
@@ -1270,6 +1268,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 
 	dpu_enc->commit_done_timedout = false;
 
+	dpu_enc->connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
 	dpu_enc->wide_bus_en = dpu_encoder_is_widebus_enabled(drm_enc);
-- 
2.44.0


