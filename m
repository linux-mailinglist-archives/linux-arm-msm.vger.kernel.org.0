Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512F05AA107
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 22:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiIAUop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 16:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbiIAUoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 16:44:44 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399F35FE3
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 13:34:50 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281Jmr6V021099;
        Thu, 1 Sep 2022 20:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=9zgtldukfpaFfXFlDu7O/9Jkrprn+HmTvthjTii1qDU=;
 b=XsQEVOYG0vqUx898iPmF66+U3+dBWXtSBSRbpCd170L0HMbDVf9HVaRJPKaFeSbW1oQo
 uNs6xkschfVutM4Qd6RE7CJa/b+my++MomElxNMgL4BKo2LSbWwteLHMqslEBSPJKZzQ
 OS7vG42x0s7mkjFFv4XzbmP0wPxb8Rm3IMXyzFPOIuxhSFv4Wzea8eIS2oLYA7szkP5e
 WhNKWz8ILzKVX6n8EpvW5ybU30RBxztHLOaEKcQm67V4ccftp3/Wc7y30P8ymUZzmPhX
 UcwuLtBmttg6EzNVwmpkuiRFumSfBUOaA3Z06CwdOq1uvjBHNNRtcuj33Et8techMTyN 4Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jabqk4x1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Sep 2022 20:34:47 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281KYkdc008606
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Sep 2022 20:34:46 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 13:34:46 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dpu: Add support for P010 format
Date:   Thu, 1 Sep 2022 13:34:22 -0700
Message-ID: <20220901203422.217-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901203422.217-1-quic_jesszhan@quicinc.com>
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fWEgeHjMz3Cq4OVLeKbfYNfVWy_Z6YGo
X-Proofpoint-ORIG-GUID: fWEgeHjMz3Cq4OVLeKbfYNfVWy_Z6YGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010088
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for P010 color format. This adds support for both linear and
compressed formats.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 17 ++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 57971c08f57c..d95540309d4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -434,6 +434,12 @@ static const struct dpu_format dpu_format_map[] = {
 		DPU_CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
 		DPU_FETCH_LINEAR, 2),
 
+	PSEUDO_YUV_FMT_LOOSE(P010,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr,
+		DPU_CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 2),
+
 	INTERLEAVED_YUV_FMT(VYUY,
 		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
@@ -536,6 +542,14 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV |
 				DPU_FORMAT_FLAG_COMPRESSED,
 		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
+
+	PSEUDO_YUV_FMT_TILED(P010,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr,
+		DPU_CHROMA_420, DPU_FORMAT_FLAG_DX |
+				DPU_FORMAT_FLAG_YUV |
+				DPU_FORMAT_FLAG_COMPRESSED,
+		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
 };
 
 /* _dpu_get_v_h_subsample_rate - Get subsample rates for all formats we support
@@ -584,7 +598,8 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 	int color_fmt = -1;
 	int i;
 
-	if (fmt->base.pixel_format == DRM_FORMAT_NV12) {
+	if (fmt->base.pixel_format == DRM_FORMAT_NV12 ||
+	    fmt->base.pixel_format == DRM_FORMAT_P010) {
 		if (DPU_FORMAT_IS_DX(fmt)) {
 			if (fmt->unpack_tight)
 				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 53b6edb2f563..199a2f755db4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -210,6 +210,7 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_RGBX4444,
 	DRM_FORMAT_BGRX4444,
 
+	DRM_FORMAT_P010,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV16,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 60ea834dc8d6..f130bf783081 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,6 +73,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_BGR565,
 
 	DRM_FORMAT_NV12,
+	DRM_FORMAT_P010,
 };
 
 /**
-- 
2.35.1

