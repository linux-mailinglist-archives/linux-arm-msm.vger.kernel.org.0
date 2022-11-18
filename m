Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044A862F45D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbiKRMRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240700AbiKRMRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:17:00 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED23785ED8;
        Fri, 18 Nov 2022 04:16:59 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIBlUJ6010324;
        Fri, 18 Nov 2022 12:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=uRp/u16xQYmKjhV+fe6yBaMSO+Uv2ElPDHphNubQ9dU=;
 b=aNWd79/yJGl64fTYKNiTPiZCps7XLIyA80NpYjmfbgBMABP0+nnqI+szkpw3zeSijOsw
 ZpGwMcMWfiLdclhluPMIm76OPhVUw38YINtIKDxOO1lK6pu3QXJXHcdOCWTr7KnW/esP
 qkyGl4/Dm8UlSrgrfHmFQ80dlWH9SlYZGZ+tEdw3i/9a1sRWIy9RZL2uUaVnw5pBJosf
 xcNIHrjl1NiGFkzUhXjHKzi54tTkoyFuJgUvogGO2GogoAuAnZmbWMMP7oVLDswbWBdy
 eUMgvLncFruKPODZQ9lRlVA83TZrz5+J/VMZgZf2piR5uW85QZmjkCHyBIbT4V9ZL9hb Cw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0s5hkte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 12:16:55 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AICGoxX013697;
        Fri, 18 Nov 2022 12:16:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kt4jkkc6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Nov 2022 12:16:52 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AICGphD013703;
        Fri, 18 Nov 2022 12:16:51 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AICGpQM013698;
        Fri, 18 Nov 2022 12:16:51 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 76F4C2EA0; Fri, 18 Nov 2022 04:16:50 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [PATCH v3 2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
Date:   Fri, 18 Nov 2022 04:16:46 -0800
Message-Id: <1668773807-19598-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TLZvwzQ9bRuMumk0d1E-Zahh6G7PwSOa
X-Proofpoint-ORIG-GUID: TLZvwzQ9bRuMumk0d1E-Zahh6G7PwSOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=980 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180073
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

Changes in v3:
- use bridge type instead of bridge ops in determining connector (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..574f2b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_bridge.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -217,6 +218,32 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+bool dpu_encoder_is_builtin(struct drm_encoder *encoder)
+{
+	struct drm_bridge *bridge;
+	int ops = 0;
+
+	if (!encoder)
+		return false;
+
+	/* Get last bridge in the chain to determine connector type */
+	drm_for_each_bridge_in_chain(encoder, bridge)
+		if (!drm_bridge_get_next_bridge(bridge))
+			ops = bridge->type;
+
+	switch (ops) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_WRITEBACK:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+		return true;
+	default:
+		return false;
+	}
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..7f3d823 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -224,4 +224,10 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
  */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_is_builtin - find if the encoder is of type builtin
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+bool dpu_encoder_is_builtin(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
-- 
2.7.4

