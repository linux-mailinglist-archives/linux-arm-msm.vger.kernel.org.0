Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D69C631C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 10:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiKUJIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 04:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiKUJIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 04:08:30 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA9918B35;
        Mon, 21 Nov 2022 01:08:30 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL8Opuu000867;
        Mon, 21 Nov 2022 09:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=gWu3FAL7SNTqtCvUeN203XgMcssG6tMZhtleUGDkIfo=;
 b=XSl7uWJd/iBduaBKViLk5BGeSjmh7K0rbSU0uY3XOZEBYpJVq8zrWY7uYH9P2ETEL/Os
 gYtZXxl2DEjvPHEY0QrG+6HpvJLY5YvGmDc04+BdAkXyOgZpKxioHJ06H/45SGhrTEwR
 +HiQHYXwrHa0lo8VISUyPDdKh6gUNBY2U3FxpdotvX4yqJ512oxoIBxzUafiV+AzkaM8
 Q3kenz4VEGTLMalI+zL8RO3NY/nO5wlRYJGsYaTqc1AirNoNrGCpodg2gOF3XdFRhLXV
 UPSKrwni2CGcR+Otjo/asVexQdkOBF5D9ANmfocsCc3K5X9ICWlcp3YE+0jdYWnck5IZ LA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrf5ky3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 09:08:26 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AL98MH7000301;
        Mon, 21 Nov 2022 09:08:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3kxr7k3t81-1;
        Mon, 21 Nov 2022 09:08:22 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AL98JXF032737;
        Mon, 21 Nov 2022 09:08:22 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AL98MDN032762;
        Mon, 21 Nov 2022 09:08:22 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 3835734A4; Mon, 21 Nov 2022 01:08:21 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [PATCH v4 2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
Date:   Mon, 21 Nov 2022 01:08:14 -0800
Message-Id: <1669021695-4397-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VilkInZZ6Lz839DscdCPl5OGJCuSnL6J
X-Proofpoint-ORIG-GUID: VilkInZZ6Lz839DscdCPl5OGJCuSnL6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_05,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=952 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210071
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
(like eDP and DP), get the connector type for a given
encoder to differentiate between builtin and pluggable
displays.

Changes in v1:
- add connector type in the disp_info (Dmitry)
- add helper functions to know encoder type
- update commit text reflecting the change

Changes in v2:
- avoid hardcode of connector type for DSI as it may not be true (Dmitry)
- get the HPD information from encoder bridge

Changes in v3:
- use connector type instead of bridge ops in determining
connector (Dmitry)

Changes in v4:
- get type from the drm connector rather from bridge connector (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..96db7fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,32 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+bool dpu_encoder_is_builtin(struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_device *dev = encoder->dev;
+	int type = 0;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (drm_connector_has_possible_encoder(connector, encoder)) {
+			type = connector->connector_type;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	switch (type) {
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
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

