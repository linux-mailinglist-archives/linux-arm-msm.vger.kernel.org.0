Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FBE76D682
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 20:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjHBSJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 14:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbjHBSJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 14:09:22 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223F11FD6;
        Wed,  2 Aug 2023 11:09:16 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372AZpbp024201;
        Wed, 2 Aug 2023 18:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=XNMYA4UbcbSXzfcqNjsG0H+M63r3pQMWY3iLGwCz6eI=;
 b=n3rDGpSaOIIvvOa3z0TXlHvTfGTAmiz6mVQm2mHrH3LEnTi7JsEJPYWVG9HwVxUSqEEJ
 KF+jmey5nf0CxS/psoBWzuxO6YIJ7o8GjGwsz0MrgcveFQ/Ia1rvRp7sERzxoZGmU5e4
 KWdnG3QO0JZ/XKTtHi4nouk9/RgIVOjrzz9nAqsOg9hRSXQT7qCd9DjAoeZmNVveXnaZ
 R8uKWnAcco/P/1DoM+ijbwPjQuRC5cNSLYXBYJAk7sz4eC0SvLbHR2Z3EiZ+QdRRSH9b
 4qDZc7KyUV2/wn1M1noPvJ13QP0JKssP44yc3SNzl4Y7l4k9t/GWSQuMdVclyjwpCwpM 2A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s76jv30hs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 18:09:08 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372I97a6025295
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 2 Aug 2023 18:09:07 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 11:09:07 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 2 Aug 2023 11:08:48 -0700
Subject: [PATCH v3 1/4] drm/msm/dpu: Move DPU encoder wide_bus_en setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>
CC:     <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690999747; l=1688;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=v5usOJssXFWNQ35+PYIdulVA0KY1v7/lvKo5ADvLodg=;
 b=QNRCYxZXwNhEQ6iJF9jR3Jp8PqyJPnq3RqLVQ90YhkPRfHX2FWZhFtVDARncvUcRSiRlVZI73
 faEywMDRjXyC/gnvqDOn3yTDfJDa582MJ6CRchoPLRY1fWW1gTyFQnw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1r9A7K8T_vsxGidKUlm4BcrjMgT7qtXi
X-Proofpoint-GUID: 1r9A7K8T_vsxGidKUlm4BcrjMgT7qtXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=984 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020160
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the setting of dpu_enc.wide_bus_en to
dpu_encoder_virt_atomic_enable() so that it mirrors the setting of
dpu_enc.dsc.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..3dcd37c48aac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 	struct drm_display_mode *cur_mode = NULL;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	struct msm_display_info *disp_info;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
 
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
+	if (disp_info->intf_type == INTF_DP)
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
+				priv->dp[disp_info->h_tile_instance[0]]);
+
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
@@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == INTF_DP)
-		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
-				priv->dp[disp_info->h_tile_instance[0]]);
-
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
 	dpu_enc->idle_timeout = IDLE_TIMEOUT;

-- 
2.41.0

