Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CF17169A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 18:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjE3QdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 12:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjE3QdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 12:33:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71E5E40;
        Tue, 30 May 2023 09:32:42 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UGLupo016810;
        Tue, 30 May 2023 16:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=nuNUU5PxWTALruPOf2nHBOuNO9qQlR6/ni9XgjTlAuw=;
 b=TpocnICz/GnwvD7zBeequVWGBo8fxCzqXJW1KupHTmJ1lI5V+62Gh5064YKWX3Reqb4Y
 72Z9Ribo87i9Z9ccnrmZf+J06R6doshie5HQaRUjBIknuQ+wR7vEdmUhYeCvmEwBfryG
 EPucIQ2mQubJteHGH/FD7UT5nY+wrQ4tPNY0fU3F1YXzwRJ4OtMUFFMYZszranFziv++
 ynY1zejvNqdipzPCwUQAfoz2OC6I+UFISiOt2Zm78NgZ5Iv61Zk6ZNOOyTU2lw3Kcv/H
 I85xVAFi+CTDlV5CDYBffzP3NV48pE8GCIliGAIm2IBkNcHkMB5gXaH7yJckSb8qbd6n lA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qw5xestga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 May 2023 16:32:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34UGWEVV021705
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 May 2023 16:32:14 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 30 May 2023 09:32:13 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct at atomic_check()
Date:   Tue, 30 May 2023 09:31:57 -0700
Message-ID: <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RFhVdye5XFkoNYXPmiP0vGZ4VFAkYpm-
X-Proofpoint-ORIG-GUID: RFhVdye5XFkoNYXPmiP0vGZ4VFAkYpm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_12,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=928 suspectscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300131
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At current implementation, DSI DSC struct is populated at display setup
during system bootup. This mechanism works fine with embedded display.
But will run into problem with plugin/unplug oriented external display,
such as DP, due to DSC struct will become stale once external display
unplugged. New DSC struct has to be re populated to reflect newer external
display which just plugged in. Move retrieving of DSI DSC struct to
atomic_check() so that same mechanism will work for both embedded display
and external plugin/unplug oriented display.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h               |  6 ++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3b416e1..2927d20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -16,6 +16,8 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_fixed.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -639,6 +641,15 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+		struct drm_bridge *bridge;
+
+		if (!dpu_enc->dsc) {
+			bridge = drm_bridge_chain_get_first_bridge(drm_enc);
+			dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
+		}
+	}
+
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/*
@@ -2121,8 +2132,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
-	if (dpu_enc->dsc)
+	if (dpu_enc->dsc) {
 		dpu_encoder_unprep_dsc(dpu_enc);
+		dpu_enc->dsc = NULL;
+	}
 
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cb..5a7c1f4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -341,6 +341,7 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
+struct drm_dsc_config *msm_dsi_bridge_get_dsc_config(struct drm_bridge *bridge);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -374,6 +375,11 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 {
 	return NULL;
 }
+
+struct drm_dsc_config *msm_dsi_bridge_get_dsc_config(struct drm_bridge *bridge)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.7.4

