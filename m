Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E833D62C0DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 15:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiKPOa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 09:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbiKPOay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 09:30:54 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F2F186CD;
        Wed, 16 Nov 2022 06:30:54 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGC02U2029056;
        Wed, 16 Nov 2022 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=wkJ1Y48hEDj/CRFHK6FUI+sLNPDPj7zrZGorfJ3Cj2w=;
 b=mdEun6Ev5qC9r4scOhc7B01yBh2o5KRoCHM4P2Px2jczDuziry+jdrABT06JjwQntLFj
 n/WffITmZl8jAc9DF3fLsU0JWT5egnleSwshypac11ywpf1n4uLrhiVcDu5ZHIiOfsmL
 hTzyrfzpOO08Bmb+bJEvHi7BOdilVruS2DlH7l9UH/pMt9Wj8FSqT0R9DyEIUKHXnsAu
 6KQ5PFh6JP6n19x6i+nDDwZ9UWukSbkreL9fTuNnpNj90BwBQhwNkP+Te4kWD3/SupuR
 hAC0jq7/WDcReN+itpvMnLSPupj2mtJtR6M1yqXAXb8zo4eYCecMIaM4g2ld4ABhJq8C /A== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvyfm8aq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Nov 2022 14:30:50 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AGETMLw005215;
        Wed, 16 Nov 2022 14:30:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kt4jkxbcm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 16 Nov 2022 14:30:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUklM008049;
        Wed, 16 Nov 2022 14:30:46 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2AGEUksx008046;
        Wed, 16 Nov 2022 14:30:46 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 921D148C2; Wed, 16 Nov 2022 06:30:45 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [PATCH v2 2/3] drm/msm/disp/dpu1: add helper to know if display is pluggable
Date:   Wed, 16 Nov 2022 06:30:39 -0800
Message-Id: <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mkKminuOSsAhzOcCXC25zH4He9Kt9hWW
X-Proofpoint-ORIG-GUID: mkKminuOSsAhzOcCXC25zH4He9Kt9hWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxlogscore=997 phishscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160100
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since DRM encoder type for few encoders can be similar
(like eDP and DP) find out if the interface supports HPD
from encoder bridge to differentiate between builtin
and pluggable displays.

Changes in v1:
- add connector type in the disp_info (Dmitry)
- add helper functions to know encoder type
- update commit text reflecting the change

Changes in v2:
- avoid hardcode of connector type for DSI as it may not be true (Dmitry)
- get the HPD information from encoder bridge

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..be93269 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_bridge.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
+{
+	struct drm_bridge *bridge;
+	int ops = 0;
+
+	if (!encoder)
+		return false;
+
+	/* Get last bridge in the chain to determine pluggable state */
+	drm_for_each_bridge_in_chain(encoder, bridge)
+		if (!drm_bridge_get_next_bridge(bridge))
+			ops = bridge->ops;
+
+	return ops & DRM_BRIDGE_OP_HPD;
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..691ab57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -224,4 +224,10 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
  */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_is_pluggable - find if the encoder is of type pluggable
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+bool dpu_encoder_is_pluggable(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
-- 
2.7.4

