Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3738A68EFFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 14:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBHNmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 08:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjBHNmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 08:42:22 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8015130B18;
        Wed,  8 Feb 2023 05:42:21 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318DShe8009865;
        Wed, 8 Feb 2023 13:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=/41C6LTPlDbTiWcxo7yorrzxHYe7ok4515BXT+VEnI0=;
 b=ZrbcG7dvIHVw7WZ9xsz0l7jjgJaGkD/M+TkBXLrKlYikGirOzPXlm1zM9/1bQConQoTt
 yQIaqg5Nly2iIKgWuQmsb3tBeGpkwVDB1S/Y/uKnJoW//Qcp5trQpHN5NLCT/TMO6y62
 PYw21KZHmNj7HqIbJyK1fj3Vsx7gU9YczU7pRAhUjFKXQ5ZprP5dFaP6/7it5oAieY+J
 f4FXSYCBh3vJh4X9gY5hauMECWc2/xm12zl7KJ2p3C1quMuIokh3x/rgwrIuJMJmjVcw
 vDOQiKAL3Fm0Gn/MpOboLg+Ri/wEPa1NVds8LZc8iLFznUUHDnvRtJaOoROLIBNttRW/ 6A== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkga2v6yf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Feb 2023 13:42:15 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 318DgA4E025380;
        Wed, 8 Feb 2023 13:42:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3nhgekjeqw-1;
        Wed, 08 Feb 2023 13:42:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318DgASs025356;
        Wed, 8 Feb 2023 13:42:10 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 318DgAGm025336;
        Wed, 08 Feb 2023 13:42:10 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 98599480D; Wed,  8 Feb 2023 05:42:09 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: [PATCH v3 2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM request
Date:   Wed,  8 Feb 2023 05:42:02 -0800
Message-Id: <1675863724-28412-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: su2h4brhImDWe89UNTC8uH-RCg3-2x8n
X-Proofpoint-ORIG-GUID: su2h4brhImDWe89UNTC8uH-RCg3-2x8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_05,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxlogscore=696 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080120
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DSPP blocks into the topology for reservation, if there
is a CTM request for that composition.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v1:
- Minor nits (Dmitry)

Changes in v2:
- Populate DSPPs into the reservation only if CTM is requested (Dmitry)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..46d2a5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode)
+			struct drm_display_mode *mode,
+			struct drm_crtc_state *crtc_state)
 {
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
@@ -563,8 +564,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * Adding color blocks only to primary interface if available in
-	 * sufficient number
+	 * Add dspps to the reservation requirements if ctm is requested
 	 */
 	if (intf_count == 2)
 		topology.num_lm = 2;
@@ -573,11 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		if (dpu_kms->catalog->dspp &&
-			(dpu_kms->catalog->dspp_count >= topology.num_lm))
-			topology.num_dspp = topology.num_lm;
-	}
+	if (crtc_state->ctm)
+		topology.num_dspp = topology.num_lm;
 
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
@@ -643,7 +640,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
-- 
2.7.4

