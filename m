Return-Path: <linux-arm-msm+bounces-30126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0B96512E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 22:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21821F2449B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 20:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0AD1BC069;
	Thu, 29 Aug 2024 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DszwjYma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277611BAEF1;
	Thu, 29 Aug 2024 20:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724964561; cv=none; b=dkqYSza+OeAZVKI0Eo5KhgdxJ1g7ooRejZAktDXtWoMJKmH1SyfMfpdBg9PyFjsQc9lvNCAFvnoCz7RYip7ftHo8Rrdy6gfPinpNLWdxDHGJ05nXdTgRfu7lnoPyextDYrhhHjKXxmgCizFl7FXpJ6s7lLXbGqT5yArTRzNlOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724964561; c=relaxed/simple;
	bh=Zkfb0x1UhHELZyP7wkQbLW0HhqrMn1zVAR+JC51dopI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tZWF8Z3meir/XKT2TBvdUMfwHkA+xWScndJ/nMTCJ0VmNJSx2uK+RliIdVm29NiXKOq+0UuDvhQ0er2KdsYss3NTopuef2niZjNlduEWIzZjMMY75r96MnAwO1eWjQCBZth0BnW/mgxLcwZi0ednABVGVRE28DryuxL2i0nRZ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DszwjYma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGePBg006365;
	Thu, 29 Aug 2024 20:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLL17NErFn0beDKFMT994aik7V3gYXWvBuhXwiSVTHQ=; b=DszwjYmaXO8qPCQE
	Qyn3xEmDKx52rY0zkVdQuayDKhYPQDGRilwtNujHxVoNdjBhlYzEMjnRScswu3AM
	bKUavylYqUCqNwX4zSbqYQ6aohx6TvylU648viwGzFsUuw3t4sL3PyBDrMwQ5pKq
	LKB/5BIz3xgnaf0M+2FANDxD0oyv4PqL57WT/+htwUHIJjXLex9D1I/kwSAbNGnL
	PUJB/k5doBk29dZDIdg+aGC5wGT152HI2o/hNtJhMo2iDbwpt/b04RzwUh7Oom8q
	0K0/HZRJWNS7naWVGLCLZg8M5HU1KioXf8wSsNxaNZ32k/9FJ/QRLDo+96+wupAJ
	1KcAiw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putxpbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:49:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn4KQ021054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:49:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:42 -0700
Subject: [PATCH 21/21] drm/msm/dpu: Set possible clones for all encoders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-21-502b16ae2ebb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=3416;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Zkfb0x1UhHELZyP7wkQbLW0HhqrMn1zVAR+JC51dopI=;
 b=LKMEdAVhhzG5AzVK2wzQBejPgyRawIrGfiCXQVn4QZZOtA2zQGMjuBZv9BkUeInhh0SParZ79
 07HPjlnfqf8DRjZnC21lcSeeZCLX9E3MzOI0G41XY9g+ZmNoy4IN0DB
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eQwKgQ5f36EI-sTq3enKJDvMoVLglevw
X-Proofpoint-GUID: eQwKgQ5f36EI-sTq3enKJDvMoVLglevw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147

Set writeback encoders as possible clones for non-writeback encoders and
vice versa.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 47b5a5994234..aad659e6d35b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2352,6 +2352,33 @@ static int dpu_encoder_virt_add_phys_encs(
 	return 0;
 }
 
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
+{
+	struct drm_encoder *curr;
+	int type = drm_enc->encoder_type;
+	uint32_t clone_mask = drm_encoder_mask(drm_enc);
+
+	/*
+	 * Set writeback as possible clones of real-time encoders and real-time
+	 * encoders as clones of writeback.
+	 *
+	 * Writeback encoders can't be clones of each other and real-time
+	 * encoders can't be clones of each other.
+	 */
+	drm_for_each_encoder(curr, drm_enc->dev) {
+		if (type == DRM_MODE_ENCODER_VIRTUAL &&
+				curr->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+		if (type != DRM_MODE_ENCODER_VIRTUAL &&
+				curr->encoder_type != DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		clone_mask |= drm_encoder_mask(curr);
+	}
+
+	return clone_mask;
+}
+
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
 				 struct msm_display_info *disp_info)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 7ab5f9380bf5..70eda127488a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -98,6 +98,13 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
  */
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 
+/**
+ * dpu_encoder_get_clones - set possible_clones for DPU encoder
+ * @drm_enc:        DRM encoder pointer
+ * Returns:         possible_clones mask
+ */
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_init - initialize virtual encoder object
  * @dev:        Pointer to drm device structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 87526d3c224a..1a82aa61d217 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Red Hat
  * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -793,8 +793,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		return ret;
 
 	num_encoders = 0;
-	drm_for_each_encoder(encoder, dev)
+	drm_for_each_encoder(encoder, dev) {
 		num_encoders++;
+		if (catalog->cwb_count > 0)
+			encoder->possible_clones = dpu_encoder_get_clones(encoder);
+	}
 
 	max_crtc_count = min(catalog->mixer_count, num_encoders);
 

-- 
2.34.1


