Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997635AA108
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 22:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbiIAUor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 16:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbiIAUoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 16:44:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2650E0A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 13:34:47 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281JHPxt032540;
        Thu, 1 Sep 2022 20:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zQueqcgjF0tWZQ/MjNT+fI+VmAs6PBgAy4bZLGPmCec=;
 b=RCGy+GVlDmafmuOdMe0QkYPOz8kvGckhPOoGvlBNQlNyjtNX/3NK8k5Gtp/dM4wjDqu3
 upzKViZ1nrjIp9+r4ygUw+yDluAfh9PcWp4qmzS6o006wZi9+nSv23oQBKHUyhzOVHGI
 ytSze9Xl568YuyJf//s3Bk/cP84uGODgUfIIwNJOmaT/lKyjDCtpmLVMpo6Ch0YXfKY9
 jqgjPQMSZ8gVm37zxTFBvlclw0lQHZeRN3iCiYxfWr2c9/EYavvpktKPGkvHX6AeFzBC
 k27pEX2xYmuwSrJOndZI7xICVIlK7g5FVFEeUBU8PTUqTQaJbM/NPBAQ5XbBdPVt8Gp1 jg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jafkx3wth-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Sep 2022 20:34:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281KYiIC010496
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Sep 2022 20:34:44 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 13:34:43 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: Add support for XR30 format
Date:   Thu, 1 Sep 2022 13:34:21 -0700
Message-ID: <20220901203422.217-2-quic_jesszhan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: NXhDEiZpSjDGHgf-hYrYkC4832NyV3Dy
X-Proofpoint-GUID: NXhDEiZpSjDGHgf-hYrYkC4832NyV3Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010089
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for XR30 color format. This supports both linear and
compressed formats.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index f436a1f3419d..57971c08f57c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -524,6 +524,12 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
 		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
+	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
 		C1_B_Cb, C2_R_Cr,
@@ -571,6 +577,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 		{DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
 		{DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
 		{DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
+		{DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
 		{DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
 		{DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
 	};
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..53b6edb2f563 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -156,6 +156,7 @@ static const uint32_t plane_formats[] = {
 	DRM_FORMAT_RGBX8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
@@ -184,6 +185,7 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_RGBX8888,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a617a3d8b1bc..60ea834dc8d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_BGR565,
 
 	DRM_FORMAT_NV12,
-- 
2.35.1

