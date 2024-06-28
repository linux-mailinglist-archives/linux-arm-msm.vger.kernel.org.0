Return-Path: <linux-arm-msm+bounces-24695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2891C9A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 01:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9603284550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6798E824BD;
	Fri, 28 Jun 2024 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a53M9s7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF307BA53;
	Fri, 28 Jun 2024 23:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719617987; cv=none; b=l6GhzLwN5Y0Ps57cEzRZ14TQ670Hch4fpTh1TN5+Ppr4NNuGfwtmGv3pp3Ezf8FJ5AmOVFYnLZ+aiX5YvdyAyL5AFndioNhkOTk4Eb92qfUYE7HwO7H5Lv9i7dYK5ZRLQYRr50hMQmxzcrY9awUOwXO4P4edlcuICf+MDCxbo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719617987; c=relaxed/simple;
	bh=8QKy2lXBzQ85bEFZodymFo/Ofgd5ikOnxqfFiifKNTg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dd+FvezMa+Eiqt5P38WtYnzK+63prrjDuy0rMU5LeR9T+l5FJY6Q03ZJ7ZLf87SBYXFXJ/Zwud4rNS1Ssuv9pvZDw2Ha3GKVIDdEDc31KO0xe9FdR7gWRIXEJY3l1UHDcIe6LlE1vsp0v+k2LZqHXT0XqqH3L9/zuuXz3U5nt9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a53M9s7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEDcpn017914;
	Fri, 28 Jun 2024 23:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pVJfCo+GVd0WbrAQXA5dzO
	qBibhi8n5E3sa+U79L5Yk=; b=a53M9s7fU+BWZOdfs9odfWG/iVMPQsh0Y8+prK
	dpmIRgiOyJI4sL6KBlw/0MpU1DNVPGXs9YIf8WQq43CzV7fxR/YG7wo7ZvsFo1OR
	XhKe1uVUuX0sRmqoIZdQUE9BzdQKFG26+uhLtP0Cj2aA5HHEfbKpn9GMARsnNjY5
	iU42lVL69g+ftLJF6L/SeMzbPYHmbCUnH+GubP09FydSI1u/7maPIhlNgg9T5ENp
	Db6LlZiCnovCEBW73minehLHonR4GXSGuRfBwk2biM+SF68aXvsrJZ3VVH/MjAEX
	KRPvOIxuRbu8n6usQj6oMTQkj4Jdalkuu58lGFHRm22ueG6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmggbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 23:39:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SNdaOG018928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 23:39:36 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 16:39:36 -0700
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
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: check ubwc support before adding compressed formats
Date: Fri, 28 Jun 2024 16:39:27 -0700
Message-ID: <20240628233927.4170966-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: ocAUVpHP5sZTrcdzxz3zqm63zANRU_kB
X-Proofpoint-ORIG-GUID: ocAUVpHP5sZTrcdzxz3zqm63zANRU_kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280179

On QCM2290 chipset DPU does not support UBWC.

Add a dpu cap to indicate this and do not expose compressed formats
in this case.

changes since RFC:
	- use ubwc enc and dec version of mdss_data instead of catalog
	  to decide if ubwc is supported

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..40c4dd2c3139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -18,6 +18,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 
 #include "msm_drv.h"
+#include "msm_mdss.h"
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
@@ -1342,10 +1343,14 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
+			   (dpu_kms->mdss->ubwc_dec_version == 0);
+
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED && !has_no_ubwc)
 		return dpu_find_format(format, qcom_compressed_supported_formats,
 				ARRAY_SIZE(qcom_compressed_supported_formats));
 
-- 
2.44.0


