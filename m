Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2FC62C0DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 15:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiKPObA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 09:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbiKPOay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 09:30:54 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57426583;
        Wed, 16 Nov 2022 06:30:53 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGBxHTu026233;
        Wed, 16 Nov 2022 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=FcBLrYDz5MLJ+JQbxLtt5oyeeAzeEZbn+lgGXcvd7CA=;
 b=Vl/SUlrY5cX/WB+K3cvDKUvGwJD/HmIl8X0vMXBBmAi2OOmxk9HQflN/kuG6J0dWSmzT
 2EnA4NfTEYqMU/hE+HwJpPUEIvfrVy+9ZnIUZWo0LJDPrC9DesHSLjd+ADuBgr/LE81S
 exPDnPklUTSMyNy/dMM6kPBkV8mIXpyNb47jg5rsBbJliOHtlE09gY3UmU4j4Bm9R87l
 13C5ikH6x+FEVicdfGkc4YAEPyNqGIoKIYeqY2+V5hrUn9KkILx1fXOp/f1jvuN2lnhy
 GF3kmxbjd2X2oV3w5wAIC8BiiY9Ur1KB3gbuCnmohnbb6nT6+TVg5I9cNTNQXwMpTOgZ RQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvyfm8aq3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Nov 2022 14:30:49 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUjvo008039;
        Wed, 16 Nov 2022 14:30:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kt4jkxbcb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 16 Nov 2022 14:30:45 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUjID008030;
        Wed, 16 Nov 2022 14:30:45 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2AGEUjFU008026;
        Wed, 16 Nov 2022 14:30:45 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 9953448A0; Wed, 16 Nov 2022 06:30:44 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [PATCH v2 1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Date:   Wed, 16 Nov 2022 06:30:38 -0800
Message-Id: <1668609040-2549-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bX5IMCjNQ7Do9QsEjm83_8lsHFm115xW
X-Proofpoint-ORIG-GUID: bX5IMCjNQ7Do9QsEjm83_8lsHFm115xW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 spamscore=0
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

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc..4784db8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -763,7 +763,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	drm_for_each_encoder(encoder, dev)
 		num_encoders++;
 
-	max_crtc_count = min(catalog->mixer_count, num_encoders);
+	max_crtc_count = num_encoders;
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
@@ -795,22 +795,25 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
-	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	/*
+	 * All the platforms should have at least 1 primary plane for an
+	 * encoder. The below warn should help in setting up the catalog
+	 */
+	WARN_ON(num_encoders > primary_planes_idx);
 
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

