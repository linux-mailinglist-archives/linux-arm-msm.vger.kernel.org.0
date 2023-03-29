Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8A06CF6D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjC2XTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjC2XTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:19:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF885B88
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:19:31 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TMxF7B024056;
        Wed, 29 Mar 2023 23:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=K17Q7rSKZF9USZpVPpiuudz2rOUWy3tz7SPwEQOW6CM=;
 b=lnM9tRpyw8pfp4+6Ckz5Kq8bWnDmQV4FGEyeGR6n52xGverLzBX3fkRb4u7emF+Ba8MU
 NKJU/WSJYzwKylBk5tK7V7/LajSRpEzgu6LGOUlC9G0qJVCYXTGvjIYTGiU3XuV5mJLa
 yVlY+KMYi/ZgN4f1ceDLwqesfTfbN1oaFqdHq/D8dbtwqobay9pp5tZWTcsOr0loJr/V
 Cuj+Bvl9qJtxH94lfGvzPyDmGfOUg09J25XseRPOqLxS4zHvt9Pl/X5D8joP8VR9+ulR
 OQNW1tYSGac92W6g2SqfxMEVUz8nOIeriLA+cZaSlGRCkZ6PvXWIvAjN4kD2udz2zVWl IQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmbs8axk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:26 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNJPhq001027
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:19:24 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 29 Mar 2023 16:18:50 -0700
Subject: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680131963; l=2616;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=xG8XY4p+9sFuZ8VS88BsiwokXrujL45jZTipBXd/wvk=;
 b=yGo90Rh1uJuG9Kx42aciP2HeHa7QELQufwSogDlIuBpZRPEUR96UNeFoqIgekbvkfktbpv+QB
 z96j45GCIBUA0ty4D60dp9yRMeTCFUle5crSsvozq9xFk2ZZs7Kcyof
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1NEiBEXsOL0vyW1QztdmwpQtOyfrXS5A
X-Proofpoint-GUID: 1NEiBEXsOL0vyW1QztdmwpQtOyfrXS5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=981 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290174
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use MSM and DRM DSC helper methods.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 74d38f90398a..7419fe58a941 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -31,6 +31,7 @@
 #include "msm_kms.h"
 #include "msm_gem.h"
 #include "phy/dsi_phy.h"
+#include "disp/msm_dsc_helper.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
@@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 {
 	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 reg, reg_ctrl, reg_ctrl2;
-	u32 slice_per_intf, total_bytes_per_intf;
+	u32 slice_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
 	 */
-	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
+	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
 
 	/*
 	 * If slice_count is greater than slice_per_intf
@@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	if (dsc->slice_count > slice_per_intf)
 		dsc->slice_count = 1;
 
-	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
+			dsi_get_bpp(msm_host->format));
 
-	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->slice_count;
+	pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -911,6 +912,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	DBG("");
 
+	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+		/* Default widebus_en to false for now. */
+		hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, mode->hdisplay,
+				dsi_get_bpp(msm_host->format));
+
 	/*
 	 * For bonded DSI mode, the current DRM mode has
 	 * the complete width of the panel. Since, the complete
@@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return ret;
 	}
 
-	dsc->initial_scale_value = 32;
+	dsc->initial_scale_value = drm_dsc_calculate_initial_scale_value(dsc);
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
 	return drm_dsc_compute_rc_parameters(dsc);

-- 
2.39.2

