Return-Path: <linux-arm-msm+bounces-23433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2269112ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC3E82845DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6592A1B3F25;
	Thu, 20 Jun 2024 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ezHnzDbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B413A28D;
	Thu, 20 Jun 2024 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718914677; cv=none; b=fsaM+8qtQf8DT6t+IjnzWXFZSAKtSyieSWZYjrZTqg2R85cvVzwId93dHtZ5ewBYPCNsEg4YyjJ5OQUxMACOTMtf6lLP7ksCfVm0U1Yxpfzeh9ZcXXLONTGnbM0KuPFjsu+UpU46Y8pJYtaAjVrutshQeAGk5RQXgfxaZII6RMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718914677; c=relaxed/simple;
	bh=EyB3REJTHkhaFHuiI+zcj+hiafDlmLCDq8DeXrVgZqw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SvK3zgDazNe+2bBYSGDGsFBLo542V8d1ykraanuCuXrnbaVUhxVHsm4KtN0IcH9ZhckIiD9xR4IUbyAB/fyVE1+x5RQuEn8GkM8GG9h8ZbXUUTrWrM85Bl4te67ylsMpuu8xohm2P4RtBDPNAJ/Vf0wginJeYB0d5nbkbbnNfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ezHnzDbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBjVr011464;
	Thu, 20 Jun 2024 20:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ma5O99Ey5vCRMcnOZyHN3i
	hWk1IH0WTFX4ry3dqQbvU=; b=ezHnzDbhXLRrVu+mukY569UkMhIPi2RBfupVR1
	8VQosUvXB82BwXqQAsNs92mkYuAZAIf0C+UCGSHhvJKPIgtTNUAE/fjlU4lpEoDf
	ce/NYkcIBr1VLvL5J5E1KUvuBTQ7EqpYTnA9OpegxgS3PFjjGYhgfvA9fCE03d5Z
	zfqx5WjKMLFesgj63zrJkqiIeGnC6nfP/4nByLeJ+SQ/KPhzXweuzfJcPIHt1iU/
	zoFnsJusCpAbsEMwpUpEhYXV+vdjrQ1d4Josiszzrr1z0mhBogLygtwGjNJHfuj0
	5X0RvMNVKSbzhiDjcZ0UiVjnKjOmrQStRkoVhBFxxqG5cH5Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkvgfgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 20:17:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KKHfPc010435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 20:17:41 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 13:17:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <dan.carpenter@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
Date: Thu, 20 Jun 2024 13:17:30 -0700
Message-ID: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: mKtbaWsLrXC892bPkhFocqUTjIKufl8B
X-Proofpoint-ORIG-GUID: mKtbaWsLrXC892bPkhFocqUTjIKufl8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200147

clear_pending_flush() ctl op is always assigned irrespective of the DPU
hardware revision. Hence there is no needed to check whether the op has
been assigned before calling it.

Drop the checks across the driver for clear_pending_flush() and also
update its documentation that it is always expected to be assigned.

changes in v2:
	- instead of adding more validity checks just drop the one for clear_pending_flush
	- update the documentation for clear_pending_flush() ctl op
	- update the commit text reflecting these changes

changes in v3:
	- simplify the documentation of clear_pending_flush

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 3 ++-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 708657598cce..697ad4a64051 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1743,8 +1743,7 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
 		phys = dpu_enc->phys_encs[i];
 
 		ctl = phys->hw_ctl;
-		if (ctl->ops.clear_pending_flush)
-			ctl->ops.clear_pending_flush(ctl);
+		ctl->ops.clear_pending_flush(ctl);
 
 		/* update only for command mode primary ctl */
 		if ((phys == dpu_enc->cur_master) &&
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 356dca5e5ea9..882c717859ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -538,8 +538,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 	}
 
 	/* reset h/w before final flush */
-	if (phys_enc->hw_ctl->ops.clear_pending_flush)
-		phys_enc->hw_ctl->ops.clear_pending_flush(phys_enc->hw_ctl);
+	phys_enc->hw_ctl->ops.clear_pending_flush(phys_enc->hw_ctl);
 
 	/*
 	 * New CTL reset sequence from 5.0 MDP onwards.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ef56280bea93..4401fdc0f3e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -83,7 +83,8 @@ struct dpu_hw_ctl_ops {
 
 	/**
 	 * Clear the value of the cached pending_flush_mask
-	 * No effect on hardware
+	 * No effect on hardware.
+	 * Required to be implemented.
 	 * @ctx       : ctl path ctx pointer
 	 */
 	void (*clear_pending_flush)(struct dpu_hw_ctl *ctx);
-- 
2.44.0


