Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91F7631C6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 10:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiKUJIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 04:08:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiKUJIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 04:08:30 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BFF8B113;
        Mon, 21 Nov 2022 01:08:29 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL8QiNU026044;
        Mon, 21 Nov 2022 09:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=Xbixi/D3kJQmqiT72xNXf1ix25tBfYqHviclOosD4ng=;
 b=Y4uc1L9F1loAsqINB49U6zR2xCBzkCO66h9Bs+u03K1XgS7Pd8fkBI5X6sMn+1om1Tv8
 l1/PqA/tdcCUDwtG5K63HscPvrYMhvXdpw8nKo3ED+ezGv0+LvvdAuiJDDbkRLOPmn4V
 BHvpeZMx99IxjI2m2dSLwHj1SbsUD+a9bd3iVqchxhchU9PxZ8c+i7TKnz14pJZrvkaR
 8Bjrmn42NiI2ay2K+FF9lxX6LKlqhD4xmkDqYaC8RZE5DQ/N09mfFS6Z0qDswGwVw5KR
 4C2/aHCr1c3q3PQYjZ02RMw8uoLY03HALgSQLK/OyA41Za1kmSwLWr/buuUdUCB3qF0y ug== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrfbux3t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 09:08:25 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AL98LMl032757;
        Mon, 21 Nov 2022 09:08:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3kxr7k3t7v-1;
        Mon, 21 Nov 2022 09:08:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AL98Lne032751;
        Mon, 21 Nov 2022 09:08:21 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AL98LmS032750;
        Mon, 21 Nov 2022 09:08:21 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 4F24D349C; Mon, 21 Nov 2022 01:08:20 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [PATCH v4 1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Date:   Mon, 21 Nov 2022 01:08:13 -0800
Message-Id: <1669021695-4397-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0W2KnGPIeZvLC8-_aXS-fMkQ7mxJ4YuC
X-Proofpoint-ORIG-GUID: 0W2KnGPIeZvLC8-_aXS-fMkQ7mxJ4YuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Pin each crtc with one encoder. This arrangement will
disallow crtc switching between encoders and also will
facilitate to advertise certain features on crtc based
on encoder type.

Changes in v1:
- use drm_for_each_encoder macro while iterating through
  encoder list (Dmitry)

Changes in v2:
- make sure no encoder miss to have a crtc (Dmitry)
- revisit various factors in deciding the crtc count
  such as num_mixers, num_sspp (Dmitry)

Changes in v3:
- none

Changes in v4:
- use max_crtc_count instead of num_encoders in WARN (Dmitry)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc..d967eef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -747,6 +747,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -763,7 +764,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	drm_for_each_encoder(encoder, dev)
 		num_encoders++;
 
-	max_crtc_count = min(catalog->mixer_count, num_encoders);
+	max_crtc_count = num_encoders;
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
@@ -795,22 +796,25 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
-	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	/*
+	 * All the platforms should have at least 1 primary plane for a
+	 * crtc. The below warn should help in setting up the catalog
+	 */
+	WARN_ON(max_crtc_count > primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-	for (i = 0; i < max_crtc_count; i++) {
+	i = 0;
+	drm_for_each_encoder(encoder, dev) {
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
+		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
+		i++;
 	}
 
-	/* All CRTCs are compatible with all encoders */
-	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-
 	return 0;
 }
 
-- 
2.7.4

