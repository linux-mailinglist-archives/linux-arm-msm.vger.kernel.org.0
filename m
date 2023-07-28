Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F2E766E6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbjG1N3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 09:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235146AbjG1N3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 09:29:08 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDA444B2;
        Fri, 28 Jul 2023 06:28:26 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S8iFgK004389;
        Fri, 28 Jul 2023 13:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=NakI8Swm1jDQ5/yTFoxmaCTDH8DURQUpI3YiWufXLpA=;
 b=LNwoFC0WKKeAsxMjK1wcpwrYjjIiIAHtcm3UiIFPOn6gk/u+ZgEmuQS13D53eDM7YBO/
 xNadb/T0gZn8SQ8fSbcCAj5fuMQ5EHasqlupSkDbBRapgBt//bJ2sKbZzBptU/tnt4+S
 b9JY1JuTz7lXI+QBCzCMpzngL7HjBvyUR80m84rsEecqD1VIV5pBiA8Y4J349gZQdIUr
 yoV45oW6EWriLo8rm3SVJO4PBFBOOWFC9OOgAFwsUcE2mOi+qLra00+web8hvryRSnoH
 sLFoBml2ta73no5gr0XdC8gFc+NKTFSk09nUsg0EDBJBuGO+vNvPLKya5MM7DTAWUFBH 2g== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3n2kbcq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:26:51 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDQpqc002941
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:26:51 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:26:47 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 29/33] iris: variant: iris3: add helpers for buffer size calculations
Date:   Fri, 28 Jul 2023 18:53:40 +0530
Message-ID: <1690550624-14642-30-git-send-email-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mv8-SO9wgpkPQLGySpr_BthoG3F8Odyv
X-Proofpoint-ORIG-GUID: Mv8-SO9wgpkPQLGySpr_BthoG3F8Odyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280124
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

This implements iris3 specific buffer size calculation for
firmware internal buffers, input and output buffers for
encoder and decoder.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../qcom/iris/variant/iris3/inc/hfi_buffer_iris3.h | 1481 ++++++++++++++++++++
 .../iris/variant/iris3/inc/msm_vidc_buffer_iris3.h |   19 +
 .../iris/variant/iris3/src/msm_vidc_buffer_iris3.c |  595 ++++++++
 3 files changed, 2095 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/inc/hfi_buffer_iris3.h
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_buffer_iris3.h
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_buffer_iris3.c

diff --git a/drivers/media/platform/qcom/iris/variant/iris3/inc/hfi_buffer_iris3.h b/drivers/media/platform/qcom/iris/variant/iris3/inc/hfi_buffer_iris3.h
new file mode 100644
index 0000000..cb068ca
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/inc/hfi_buffer_iris3.h
@@ -0,0 +1,1481 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __HFI_BUFFER_IRIS3__
+#define __HFI_BUFFER_IRIS3__
+
+#include <linux/types.h>
+
+#include "hfi_property.h"
+
+typedef u8      HFI_U8;
+typedef s8      HFI_S8;
+typedef u16     HFI_U16;
+typedef s16     HFI_S16;
+typedef u32     HFI_U32;
+typedef s32     HFI_S32;
+typedef u64     HFI_U64;
+typedef u32     HFI_BOOL;
+
+#ifndef MIN
+#define  MIN(x, y) (((x) < (y)) ? (x) : (y))
+#endif
+
+#ifndef MAX
+#define  MAX(x, y) (((x) > (y)) ? (x) : (y))
+#endif
+
+#define HFI_ALIGNMENT_4096 (4096)
+
+#define BUF_SIZE_ALIGN_16 (16)
+#define BUF_SIZE_ALIGN_32 (32)
+#define BUF_SIZE_ALIGN_64 (64)
+#define BUF_SIZE_ALIGN_128 (128)
+#define BUF_SIZE_ALIGN_256 (256)
+#define BUF_SIZE_ALIGN_512 (512)
+#define BUF_SIZE_ALIGN_4096 (4096)
+
+#define HFI_ALIGN(a, b) (((b) & ((b) - 1)) ? (((a) + (b) - 1) / \
+	(b) * (b)) : (((a) + (b) - 1) & (~((b) - 1))))
+
+#define HFI_WORKMODE_1 1
+#define HFI_WORKMODE_2 2
+
+#define HFI_DEFAULT_METADATA_STRIDE_MULTIPLE (64)
+#define HFI_DEFAULT_METADATA_BUFFERHEIGHT_MULTIPLE (16)
+
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH (32)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH (16)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH (48)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH (24)
+#define HFI_COLOR_FORMAT_RGBA8888_UBWC_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_RGBA8888_UBWC_TILE_WIDTH (16)
+
+#define HFI_NV12_IL_CALC_Y_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = HFI_ALIGN(frame_width, stride_multiple))
+
+#define HFI_NV12_IL_CALC_Y_BUFHEIGHT(buf_height, frame_height, \
+	min_buf_height_multiple) (buf_height = HFI_ALIGN(frame_height, \
+	min_buf_height_multiple))
+
+#define HFI_NV12_IL_CALC_UV_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = HFI_ALIGN(frame_width, stride_multiple))
+
+#define HFI_NV12_IL_CALC_UV_BUFHEIGHT(buf_height, frame_height, \
+	min_buf_height_multiple) (buf_height = HFI_ALIGN((((frame_height) + 1) \
+	 >> 1),	min_buf_height_multiple))
+
+#define HFI_NV12_IL_CALC_BUF_SIZE(buf_size, y_bufsize, y_stride, y_buf_height, \
+	uv_buf_size, uv_stride, uv_buf_height) \
+	do { \
+		y_bufsize = (y_stride * y_buf_height); \
+		uv_buf_size = (uv_stride * uv_buf_height); \
+		buf_size = HFI_ALIGN(y_bufsize + uv_buf_size, HFI_ALIGNMENT_4096) \
+	} while (0)
+
+#define HFI_NV12_UBWC_IL_CALC_Y_BUF_SIZE(y_bufsize, y_stride, y_buf_height) \
+	(y_bufsize = HFI_ALIGN(y_stride * y_buf_height, HFI_ALIGNMENT_4096))
+
+#define HFI_NV12_UBWC_IL_CALC_UV_BUF_SIZE(uv_buf_size, \
+	uv_stride, uv_buf_height) \
+	(uv_buf_size = HFI_ALIGN(uv_stride * uv_buf_height, HFI_ALIGNMENT_4096))
+
+#define HFI_NV12_UBWC_IL_CALC_BUF_SIZE_V2(buf_size,\
+	frame_width, frame_height, y_stride_multiple,\
+	y_buffer_height_multiple, uv_stride_multiple, \
+	uv_buffer_height_multiple, y_metadata_stride_multiple, \
+	y_metadata_buffer_height_multiple, \
+	uv_metadata_stride_multiple, uv_metadata_buffer_height_multiple) \
+	do { \
+		HFI_U32 y_buf_size, uv_buf_size, y_meta_size, uv_meta_size;   \
+		HFI_U32 stride, _height; \
+		HFI_U32 half_height = (frame_height + 1) >> 1; \
+		HFI_NV12_IL_CALC_Y_STRIDE(stride, frame_width,\
+					y_stride_multiple); \
+		HFI_NV12_IL_CALC_Y_BUFHEIGHT(_height, half_height,\
+					y_buffer_height_multiple); \
+		HFI_NV12_UBWC_IL_CALC_Y_BUF_SIZE(y_buf_size, stride, _height);\
+		HFI_NV12_IL_CALC_UV_STRIDE(stride, frame_width, \
+					uv_stride_multiple); \
+		HFI_NV12_IL_CALC_UV_BUFHEIGHT(_height, half_height, \
+					uv_buffer_height_multiple); \
+		HFI_NV12_UBWC_IL_CALC_UV_BUF_SIZE(uv_buf_size, stride, _height);\
+		HFI_UBWC_CALC_METADATA_PLANE_STRIDE(stride, frame_width,\
+				y_metadata_stride_multiple, \
+			HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH);\
+		HFI_UBWC_METADATA_PLANE_BUFHEIGHT(_height, half_height, \
+				y_metadata_buffer_height_multiple,\
+			HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT);\
+		HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(y_meta_size, stride, \
+				_height);    \
+		HFI_UBWC_UV_METADATA_PLANE_STRIDE(stride, frame_width,\
+				uv_metadata_stride_multiple, \
+			HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH); \
+		HFI_UBWC_UV_METADATA_PLANE_BUFHEIGHT(_height, half_height,\
+				uv_metadata_buffer_height_multiple,\
+			HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT);\
+		HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(uv_meta_size, stride, \
+				 _height); \
+		buf_size = (y_buf_size + uv_buf_size + y_meta_size + \
+			uv_meta_size) << 1;\
+	} while (0)
+
+#define HFI_YUV420_TP10_CALC_Y_STRIDE(stride, frame_width, stride_multiple) \
+	do { \
+		stride = HFI_ALIGN(frame_width, 192); \
+		stride = HFI_ALIGN(stride * 4 / 3, stride_multiple); \
+	} while (0)
+
+#define HFI_YUV420_TP10_CALC_Y_BUFHEIGHT(buf_height, frame_height, \
+				min_buf_height_multiple) \
+	(buf_height = HFI_ALIGN(frame_height, min_buf_height_multiple))
+
+#define HFI_YUV420_TP10_CALC_UV_STRIDE(stride, frame_width, stride_multiple) \
+	do { \
+		stride = HFI_ALIGN(frame_width, 192); \
+		stride = HFI_ALIGN(stride * 4 / 3, stride_multiple); \
+	} while (0)
+
+#define HFI_YUV420_TP10_CALC_UV_BUFHEIGHT(buf_height, frame_height, \
+				min_buf_height_multiple) \
+	(buf_height = HFI_ALIGN(((frame_height + 1) >> 1), \
+			min_buf_height_multiple))
+
+#define HFI_YUV420_TP10_CALC_BUF_SIZE(buf_size, y_buf_size, y_stride,\
+		y_buf_height, uv_buf_size, uv_stride, uv_buf_height) \
+	do {	\
+		y_buf_size = (y_stride * y_buf_height); \
+		uv_buf_size = (uv_stride * uv_buf_height); \
+		buf_size = y_buf_size + uv_buf_size \
+	} while (0)
+
+#define HFI_YUV420_TP10_UBWC_CALC_Y_BUF_SIZE(y_buf_size, y_stride, \
+					y_buf_height) \
+	(y_buf_size = HFI_ALIGN(y_stride * y_buf_height, HFI_ALIGNMENT_4096))
+
+#define HFI_YUV420_TP10_UBWC_CALC_UV_BUF_SIZE(uv_buf_size, uv_stride, \
+					uv_buf_height) \
+	(uv_buf_size = HFI_ALIGN(uv_stride * uv_buf_height, HFI_ALIGNMENT_4096))
+
+#define HFI_YUV420_TP10_UBWC_CALC_BUF_SIZE(buf_size, y_stride, y_buf_height, \
+	uv_stride, uv_buf_height, y_md_stride, y_md_height, uv_md_stride, \
+	uv_md_height)\
+	do { \
+		HFI_U32 y_data_size, uv_data_size, y_md_size, uv_md_size; \
+		HFI_YUV420_TP10_UBWC_CALC_Y_BUF_SIZE(y_data_size, y_stride,\
+						y_buf_height); \
+		HFI_YUV420_TP10_UBWC_CALC_UV_BUF_SIZE(uv_data_size, uv_stride, \
+						uv_buf_height); \
+		HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(y_md_size, y_md_stride, \
+						y_md_height); \
+		HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(uv_md_size, uv_md_stride, \
+						uv_md_height); \
+		buf_size = y_data_size + uv_data_size + y_md_size + \
+						uv_md_size; \
+	} while (0)
+
+#define HFI_YUV420_P010_CALC_Y_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = HFI_ALIGN(frame_width * 2, stride_multiple))
+
+#define HFI_YUV420_P010_CALC_Y_BUFHEIGHT(buf_height, frame_height, \
+				min_buf_height_multiple) \
+	(buf_height = HFI_ALIGN(frame_height, min_buf_height_multiple))
+
+#define HFI_YUV420_P010_CALC_UV_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = HFI_ALIGN(frame_width * 2, stride_multiple))
+
+#define HFI_YUV420_P010_CALC_UV_BUFHEIGHT(buf_height, frame_height, \
+				min_buf_height_multiple) \
+	(buf_height = HFI_ALIGN(((frame_height + 1) >> 1), \
+			min_buf_height_multiple))
+
+#define HFI_YUV420_P010_CALC_BUF_SIZE(buf_size, y_data_size, y_stride, \
+	y_buf_height, uv_data_size, uv_stride, uv_buf_height) \
+	do { \
+		y_data_size = HFI_ALIGN(y_stride * y_buf_height, \
+				HFI_ALIGNMENT_4096);\
+		uv_data_size = HFI_ALIGN(uv_stride * uv_buf_height, \
+				HFI_ALIGNMENT_4096); \
+		buf_size = y_data_size + uv_data_size; \
+	} while (0)
+
+#define HFI_RGB888_CALC_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = ((frame_width * 3) + stride_multiple - 1) & \
+			 (0xffffffff - (stride_multiple - 1)))
+
+#define HFI_RGB888_CALC_BUFHEIGHT(buf_height, frame_height, \
+			min_buf_height_multiple) \
+	(buf_height = ((frame_height + min_buf_height_multiple - 1) & \
+			(0xffffffff - (min_buf_height_multiple - 1))))
+
+#define HFI_RGB888_CALC_BUF_SIZE(buf_size, stride, buf_height) \
+	(buf_size = ((stride) * (buf_height)))
+
+#define HFI_RGBA8888_CALC_STRIDE(stride, frame_width, stride_multiple) \
+	(stride = HFI_ALIGN((frame_width << 2), stride_multiple))
+
+#define HFI_RGBA8888_CALC_BUFHEIGHT(buf_height, frame_height, \
+			min_buf_height_multiple) \
+	(buf_height = HFI_ALIGN(frame_height, min_buf_height_multiple))
+
+#define HFI_RGBA8888_CALC_BUF_SIZE(buf_size, stride, buf_height) \
+	(buf_size = (stride) * (buf_height))
+
+#define HFI_RGBA8888_UBWC_CALC_DATA_PLANE_BUF_SIZE(buf_size, stride, \
+				buf_height) \
+	(buf_size = HFI_ALIGN((stride) * (buf_height), HFI_ALIGNMENT_4096))
+
+#define HFI_RGBA8888_UBWC_BUF_SIZE(buf_size, data_buf_size, \
+	metadata_buffer_size, stride, buf_height, _metadata_tride, \
+	_metadata_buf_height) \
+	do { \
+		HFI_RGBA8888_UBWC_CALC_DATA_PLANE_BUF_SIZE(data_buf_size, \
+				stride, buf_height); \
+		HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(metadata_buffer_size, \
+				_metadata_tride, _metadata_buf_height); \
+		buf_size = data_buf_size + metadata_buffer_size \
+	} while (0)
+
+#define HFI_UBWC_CALC_METADATA_PLANE_STRIDE(metadata_stride, frame_width,\
+	metadata_stride_multiple, tile_width_in_pels) \
+	((metadata_stride = HFI_ALIGN(((frame_width + (tile_width_in_pels - 1)) /\
+	tile_width_in_pels), metadata_stride_multiple)))
+
+#define HFI_UBWC_METADATA_PLANE_BUFHEIGHT(metadata_buf_height, frame_height, \
+	metadata_height_multiple, tile_height_in_pels) \
+	((metadata_buf_height = HFI_ALIGN(((frame_height + \
+	(tile_height_in_pels - 1)) / tile_height_in_pels), \
+	metadata_height_multiple)))
+
+#define HFI_UBWC_UV_METADATA_PLANE_STRIDE(metadata_stride, frame_width, \
+	metadata_stride_multiple, tile_width_in_pels) \
+	((metadata_stride = HFI_ALIGN(((((frame_width + 1) >> 1) +\
+	(tile_width_in_pels - 1)) / tile_width_in_pels), \
+	metadata_stride_multiple)))
+
+#define HFI_UBWC_UV_METADATA_PLANE_BUFHEIGHT(metadata_buf_height, frame_height,\
+	metadata_height_multiple, tile_height_in_pels) \
+	(metadata_buf_height = HFI_ALIGN(((((frame_height + 1) >> 1) + \
+	(tile_height_in_pels - 1)) / tile_height_in_pels), \
+	metadata_height_multiple))
+
+#define HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(buffer_size, _metadata_tride, \
+					_metadata_buf_height) \
+	((buffer_size = HFI_ALIGN(_metadata_tride * _metadata_buf_height, \
+					HFI_ALIGNMENT_4096)))
+
+#define BUFFER_ALIGNMENT_512_BYTES 512
+#define BUFFER_ALIGNMENT_256_BYTES 256
+#define BUFFER_ALIGNMENT_128_BYTES 128
+#define BUFFER_ALIGNMENT_64_BYTES 64
+#define BUFFER_ALIGNMENT_32_BYTES 32
+#define BUFFER_ALIGNMENT_16_BYTES 16
+#define BUFFER_ALIGNMENT_8_BYTES 8
+#define BUFFER_ALIGNMENT_4_BYTES 4
+
+#define VENUS_DMA_ALIGNMENT BUFFER_ALIGNMENT_256_BYTES
+
+#define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE 64
+#define MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE 64
+#define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
+#define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE 640
+#define MAX_FE_NBR_DATA_CB_LINE_BUFFER_SIZE 320
+#define MAX_FE_NBR_DATA_CR_LINE_BUFFER_SIZE 320
+
+#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
+
+#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE (64 * 2 * 3)
+#define MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE (32 * 2 * 3)
+#define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE (16 * 2 * 3)
+
+#define MAX_TILE_COLUMNS 32
+
+#define SIZE_VPSS_LB(size, frame_width, frame_height, num_vpp_pipes) \
+	do { \
+		HFI_U32 vpss_4tap_top_buffer_size, vpss_div2_top_buffer_size, \
+		vpss_4tap_left_buffer_size, vpss_div2_left_buffer_size; \
+		HFI_U32 opb_wr_top_line_luma_buffer_size, \
+		opb_wr_top_line_chroma_buffer_size, \
+		opb_lb_wr_llb_y_buffer_size,\
+		opb_lb_wr_llb_uv_buffer_size; \
+		HFI_U32 macrotiling_size; \
+		vpss_4tap_top_buffer_size = 0; \
+		vpss_div2_top_buffer_size = 0; \
+		vpss_4tap_left_buffer_size = 0; \
+		vpss_div2_left_buffer_size = 0; \
+		macrotiling_size = 32; \
+		opb_wr_top_line_luma_buffer_size = HFI_ALIGN(frame_width, \
+			macrotiling_size) / macrotiling_size * 256; \
+			opb_wr_top_line_luma_buffer_size = \
+		HFI_ALIGN(opb_wr_top_line_luma_buffer_size, \
+		VENUS_DMA_ALIGNMENT) + (MAX_TILE_COLUMNS - 1) * 256; \
+		opb_wr_top_line_luma_buffer_size = \
+		MAX(opb_wr_top_line_luma_buffer_size, (32 * \
+			HFI_ALIGN(frame_height, 8))); \
+		opb_wr_top_line_chroma_buffer_size = \
+			opb_wr_top_line_luma_buffer_size;\
+		opb_lb_wr_llb_uv_buffer_size = \
+			HFI_ALIGN((HFI_ALIGN(frame_height, 8) / (4 / 2)) * 64,\
+					   BUFFER_ALIGNMENT_32_BYTES); \
+		opb_lb_wr_llb_y_buffer_size = \
+			HFI_ALIGN((HFI_ALIGN(frame_height, 8) / (4 / 2)) * 64,\
+					   BUFFER_ALIGNMENT_32_BYTES); \
+		size = num_vpp_pipes * 2 * (vpss_4tap_top_buffer_size +  \
+						vpss_div2_top_buffer_size) +  \
+			   2 * (vpss_4tap_left_buffer_size + \
+					vpss_div2_left_buffer_size) + \
+			   opb_wr_top_line_luma_buffer_size + \
+			   opb_wr_top_line_chroma_buffer_size + \
+			   opb_lb_wr_llb_uv_buffer_size + \
+			   opb_lb_wr_llb_y_buffer_size; \
+	} while (0)
+
+#define VPP_CMD_MAX_SIZE (1 << 20)
+#define NUM_HW_PIC_BUF 32
+#define BIN_BUFFER_THRESHOLD (1280 * 736)
+#define H264D_MAX_SLICE 1800
+#define SIZE_H264D_BUFTAB_T (256)
+#define SIZE_H264D_HW_PIC_T (1 << 11)
+#define SIZE_H264D_BSE_CMD_PER_BUF (32 * 4)
+#define SIZE_H264D_VPP_CMD_PER_BUF (512)
+
+#define SIZE_H264D_LB_FE_TOP_DATA(frame_width, frame_height) \
+	(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * HFI_ALIGN(frame_width, 16) * 3)
+
+#define SIZE_H264D_LB_FE_TOP_CTRL(frame_width, frame_height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * ((frame_width + 15) >> 4))
+
+#define SIZE_H264D_LB_FE_LEFT_CTRL(frame_width, frame_height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * ((frame_height + 15) >> 4))
+
+#define SIZE_H264D_LB_SE_TOP_CTRL(frame_width, frame_height) \
+	(MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * ((frame_width + 15) >> 4))
+
+#define SIZE_H264D_LB_SE_LEFT_CTRL(frame_width, frame_height) \
+	(MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * ((frame_height + 15) >> 4))
+
+#define SIZE_H264D_LB_PE_TOP_DATA(frame_width, frame_height) \
+	(MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE *  ((frame_width + 15) >> 4))
+
+#define SIZE_H264D_LB_VSP_TOP(frame_width, frame_height) \
+	((((frame_width + 15) >> 4) << 7))
+
+#define SIZE_H264D_LB_RECON_DMA_METADATA_WR(frame_width, frame_height) \
+	(HFI_ALIGN(frame_height, 16) * 32)
+
+#define SIZE_H264D_QP(frame_width, frame_height) \
+	(((frame_width + 63) >> 6) * ((frame_height + 63) >> 6) * 128)
+
+#define SIZE_HW_PIC(size_per_buf) \
+	(NUM_HW_PIC_BUF * size_per_buf)
+
+#define SIZE_H264D_BSE_CMD_BUF(_size, frame_width, frame_height) \
+	do { \
+		HFI_U32 _height = HFI_ALIGN(frame_height, \
+				BUFFER_ALIGNMENT_32_BYTES);  \
+		_size = MIN((((_height + 15) >> 4) * 48), H264D_MAX_SLICE) *\
+					  SIZE_H264D_BSE_CMD_PER_BUF; \
+	} while (0)
+
+#define SIZE_H264D_VPP_CMD_BUF(_size, frame_width, frame_height)    \
+	do { \
+		HFI_U32 _height = HFI_ALIGN(frame_height, \
+				BUFFER_ALIGNMENT_32_BYTES); \
+		_size = MIN((((_height + 15) >> 4) * 48), H264D_MAX_SLICE) * \
+					SIZE_H264D_VPP_CMD_PER_BUF; \
+		if (_size > VPP_CMD_MAX_SIZE) \
+			_size = VPP_CMD_MAX_SIZE; \
+	} while (0)
+
+#define HFI_BUFFER_COMV_H264D(comv_size, frame_width, \
+			frame_height, _comv_bufcount) \
+	do { \
+		HFI_U32 frame_width_in_mbs = ((frame_width + 15) >> 4); \
+		HFI_U32 frame_height_in_mbs = ((frame_height + 15) >> 4); \
+		HFI_U32 col_mv_aligned_width = (frame_width_in_mbs << 7); \
+		HFI_U32 col_zero_aligned_width = (frame_width_in_mbs << 2); \
+		HFI_U32 col_zero_size = 0, size_colloc = 0; \
+		col_mv_aligned_width = HFI_ALIGN(col_mv_aligned_width, \
+					BUFFER_ALIGNMENT_16_BYTES); \
+		col_zero_aligned_width = HFI_ALIGN(col_zero_aligned_width, \
+					BUFFER_ALIGNMENT_16_BYTES); \
+		col_zero_size = col_zero_aligned_width * \
+					((frame_height_in_mbs + 1) >> 1); \
+		col_zero_size = HFI_ALIGN(col_zero_size, \
+				BUFFER_ALIGNMENT_64_BYTES);  \
+		col_zero_size <<= 1; \
+		col_zero_size = HFI_ALIGN(col_zero_size, \
+				BUFFER_ALIGNMENT_512_BYTES); \
+		size_colloc = col_mv_aligned_width * ((frame_height_in_mbs + \
+				1) >> 1); \
+		size_colloc = HFI_ALIGN(size_colloc, \
+				BUFFER_ALIGNMENT_64_BYTES); \
+		size_colloc <<= 1; \
+		size_colloc = HFI_ALIGN(size_colloc, \
+				BUFFER_ALIGNMENT_512_BYTES); \
+		size_colloc += (col_zero_size + SIZE_H264D_BUFTAB_T * 2); \
+		comv_size = size_colloc * (_comv_bufcount); \
+		comv_size += BUFFER_ALIGNMENT_512_BYTES; \
+	} while (0)
+
+#define HFI_BUFFER_NON_COMV_H264D(_size, frame_width, frame_height, \
+								num_vpp_pipes) \
+	do { \
+		HFI_U32 _size_bse, _size_vpp; \
+		SIZE_H264D_BSE_CMD_BUF(_size_bse, frame_width, frame_height); \
+		SIZE_H264D_VPP_CMD_BUF(_size_vpp, frame_width, frame_height); \
+		_size = HFI_ALIGN(_size_bse, VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(_size_vpp, VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), \
+			VENUS_DMA_ALIGNMENT); \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define HFI_BUFFER_LINE_H264D(_size, frame_width, frame_height, \
+							  is_opb, num_vpp_pipes)            \
+	do { \
+		HFI_U32 vpss_lb_size = 0; \
+		_size = HFI_ALIGN(SIZE_H264D_LB_FE_TOP_DATA(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H264D_LB_FE_TOP_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H264D_LB_FE_LEFT_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+			HFI_ALIGN(SIZE_H264D_LB_SE_TOP_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H264D_LB_SE_LEFT_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) * \
+			num_vpp_pipes + \
+			HFI_ALIGN(SIZE_H264D_LB_PE_TOP_DATA(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H264D_LB_VSP_TOP(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H264D_LB_RECON_DMA_METADATA_WR\
+			(frame_width, frame_height), \
+			VENUS_DMA_ALIGNMENT) * 2 + HFI_ALIGN(SIZE_H264D_QP\
+			(frame_width, frame_height), VENUS_DMA_ALIGNMENT); \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+		if (is_opb) { \
+			SIZE_VPSS_LB(vpss_lb_size, frame_width, frame_height, \
+						num_vpp_pipes); \
+		} \
+		_size = HFI_ALIGN((_size + vpss_lb_size), \
+			VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define H264_CABAC_HDR_RATIO_HD_TOT 1
+#define H264_CABAC_RES_RATIO_HD_TOT 3
+
+#define SIZE_H264D_HW_BIN_BUFFER(_size, frame_width, frame_height, \
+				delay, num_vpp_pipes) \
+	do { \
+		HFI_U32 size_yuv, size_bin_hdr, size_bin_res; \
+		size_yuv = ((frame_width * frame_height) <= \
+			BIN_BUFFER_THRESHOLD) ?\
+			((BIN_BUFFER_THRESHOLD * 3) >> 1) : \
+			((frame_width * frame_height * 3) >> 1); \
+		size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_HD_TOT; \
+		size_bin_res = size_yuv * H264_CABAC_RES_RATIO_HD_TOT; \
+		size_bin_hdr = size_bin_hdr * (((((HFI_U32)(delay)) & 31) /\
+				10) + 2) / 2; \
+		size_bin_res = size_bin_res * (((((HFI_U32)(delay)) & 31) /\
+				10) + 2) / 2; \
+		size_bin_hdr = HFI_ALIGN(size_bin_hdr / num_vpp_pipes,\
+				VENUS_DMA_ALIGNMENT) * num_vpp_pipes; \
+		size_bin_res = HFI_ALIGN(size_bin_res / num_vpp_pipes, \
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes; \
+		_size = size_bin_hdr + size_bin_res; \
+	} while (0)
+
+#define HFI_BUFFER_BIN_H264D(_size, frame_width, frame_height, is_interlaced, \
+			delay, num_vpp_pipes) \
+	do { \
+		HFI_U32 n_aligned_w = HFI_ALIGN(frame_width, \
+				BUFFER_ALIGNMENT_16_BYTES);\
+		HFI_U32 n_aligned_h = HFI_ALIGN(frame_height, \
+				BUFFER_ALIGNMENT_16_BYTES); \
+		if (!is_interlaced)  { \
+			SIZE_H264D_HW_BIN_BUFFER(_size, n_aligned_w, \
+				n_aligned_h, delay, num_vpp_pipes); \
+		} else \
+			_size = 0;  \
+	} while (0)
+
+#define NUM_SLIST_BUF_H264 (256 + 32)
+#define SIZE_SLIST_BUF_H264 (512)
+#define SIZE_SEI_USERDATA (4096)
+#define H264_NUM_FRM_INFO (66)
+#define H264_DISPLAY_BUF_SIZE (3328)
+#define SIZE_DOLBY_RPU_METADATA (41 * 1024)
+#define HFI_BUFFER_PERSIST_H264D(_size, rpu_enabled) \
+	(_size = HFI_ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 + \
+	H264_DISPLAY_BUF_SIZE * H264_NUM_FRM_INFO + \
+	NUM_HW_PIC_BUF * SIZE_SEI_USERDATA + \
+	(rpu_enabled) * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA), \
+	VENUS_DMA_ALIGNMENT))
+
+#define LCU_MAX_SIZE_PELS 64
+#define LCU_MIN_SIZE_PELS 16
+
+#define H265D_MAX_SLICE 1200
+#define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
+#define SIZE_H265D_BSE_CMD_PER_BUF (16 * sizeof(HFI_U32))
+#define SIZE_H265D_VPP_CMD_PER_BUF (256)
+
+#define SIZE_H265D_LB_FE_TOP_DATA(frame_width, frame_height) \
+	(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * \
+	(HFI_ALIGN(frame_width, 64) + 8) * 2)
+
+#define SIZE_H265D_LB_FE_TOP_CTRL(frame_width, frame_height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	(HFI_ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_FE_LEFT_CTRL(frame_width, frame_height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	(HFI_ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_SE_TOP_CTRL(frame_width, frame_height) \
+	((LCU_MAX_SIZE_PELS / 8 * (128 / 8)) * ((frame_width + 15) >> 4))
+
+#define SIZE_H265D_LB_SE_LEFT_CTRL(frame_width, frame_height)    \
+	(MAX(((frame_height + 16 - 1) / 8) * \
+		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,     \
+	MAX(((frame_height + 32 - 1) / 8) * \
+		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((frame_height + 64 - 1) / 8) * \
+		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE)))
+
+#define SIZE_H265D_LB_PE_TOP_DATA(frame_width, frame_height) \
+	(MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * (HFI_ALIGN(frame_width, \
+	LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_VSP_TOP(frame_width, frame_height) \
+	(((frame_width + 63) >> 6) * 128)
+
+#define SIZE_H265D_LB_VSP_LEFT(frame_width, frame_height) \
+	(((frame_height + 63) >> 6) * 128)
+
+#define SIZE_H265D_LB_RECON_DMA_METADATA_WR(frame_width, frame_height) \
+	SIZE_H264D_LB_RECON_DMA_METADATA_WR(frame_width, frame_height)
+
+#define SIZE_H265D_QP(frame_width, frame_height) \
+		SIZE_H264D_QP(frame_width, frame_height)
+
+#define SIZE_H265D_BSE_CMD_BUF(_size, frame_width, frame_height)\
+	do { \
+		_size = HFI_ALIGN(((HFI_ALIGN(frame_width, \
+		LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) * \
+		(HFI_ALIGN(frame_height, LCU_MAX_SIZE_PELS) /\
+		LCU_MIN_SIZE_PELS)) * NUM_HW_PIC_BUF, VENUS_DMA_ALIGNMENT);  \
+		_size = MIN(_size, H265D_MAX_SLICE + 1);          \
+		_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;     \
+	} while (0)
+
+#define SIZE_H265D_VPP_CMD_BUF(_size, frame_width, frame_height)  \
+	do { \
+		_size = HFI_ALIGN(((HFI_ALIGN(frame_width, LCU_MAX_SIZE_PELS) /\
+		LCU_MIN_SIZE_PELS) * (HFI_ALIGN(frame_height, \
+		LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) * \
+		NUM_HW_PIC_BUF, VENUS_DMA_ALIGNMENT);  \
+		_size = MIN(_size, H265D_MAX_SLICE + 1);    \
+		_size = HFI_ALIGN(_size, 4);  \
+		_size = 2 * _size * SIZE_H265D_VPP_CMD_PER_BUF; \
+		if (_size > VPP_CMD_MAX_SIZE) { \
+			_size = VPP_CMD_MAX_SIZE;   \
+		}                          \
+	} while (0)
+
+#define HFI_BUFFER_COMV_H265D(_size, frame_width, frame_height, \
+							_comv_bufcount) \
+	do { \
+		_size = HFI_ALIGN(((((frame_width + 15) >> 4) * \
+			((frame_height + 15) >> 4)) << 8), \
+			BUFFER_ALIGNMENT_512_BYTES); \
+		_size *= _comv_bufcount; \
+		_size += BUFFER_ALIGNMENT_512_BYTES; \
+	} while (0)
+
+#define HDR10_HIST_EXTRADATA_SIZE (4 * 1024)
+
+#define HFI_BUFFER_NON_COMV_H265D(_size, frame_width, frame_height, \
+				num_vpp_pipes) \
+	do { \
+		HFI_U32 _size_bse, _size_vpp; \
+		SIZE_H265D_BSE_CMD_BUF(_size_bse, frame_width, \
+		frame_height); \
+		SIZE_H265D_VPP_CMD_BUF(_size_vpp, frame_width, \
+		frame_height);  \
+		_size = HFI_ALIGN(_size_bse, VENUS_DMA_ALIGNMENT) +     \
+			HFI_ALIGN(_size_vpp, VENUS_DMA_ALIGNMENT) +     \
+			HFI_ALIGN(NUM_HW_PIC_BUF * 20 * 22 * 4, \
+			VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(2 * sizeof(HFI_U16) *           \
+			(HFI_ALIGN(frame_width, LCU_MAX_SIZE_PELS) / \
+			LCU_MIN_SIZE_PELS) * (HFI_ALIGN(frame_height, \
+			LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS), \
+			VENUS_DMA_ALIGNMENT) +                \
+			HFI_ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), \
+			VENUS_DMA_ALIGNMENT) + \
+			HDR10_HIST_EXTRADATA_SIZE;           \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT);  \
+	} while (0)
+
+#define HFI_BUFFER_LINE_H265D(_size, frame_width, frame_height, \
+			is_opb, num_vpp_pipes) \
+	do { \
+		HFI_U32 vpss_lb_size = 0; \
+		_size = HFI_ALIGN(SIZE_H265D_LB_FE_TOP_DATA(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H265D_LB_FE_TOP_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H265D_LB_FE_LEFT_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+			HFI_ALIGN(SIZE_H265D_LB_SE_LEFT_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+			HFI_ALIGN(SIZE_H265D_LB_SE_TOP_CTRL(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H265D_LB_PE_TOP_DATA(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) + \
+			HFI_ALIGN(SIZE_H265D_LB_VSP_TOP(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) +        \
+			HFI_ALIGN(SIZE_H265D_LB_VSP_LEFT(frame_width, \
+			frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+			HFI_ALIGN(SIZE_H265D_LB_RECON_DMA_METADATA_WR\
+			(frame_width, frame_height), \
+			VENUS_DMA_ALIGNMENT) * 4 +  \
+			HFI_ALIGN(SIZE_H265D_QP(frame_width, frame_height),\
+			VENUS_DMA_ALIGNMENT);           \
+		if (is_opb) { \
+			SIZE_VPSS_LB(vpss_lb_size, frame_width, frame_height,\
+						 num_vpp_pipes); \
+		} \
+		_size = HFI_ALIGN((_size + vpss_lb_size), \
+			VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define H265_CABAC_HDR_RATIO_HD_TOT 2
+#define H265_CABAC_RES_RATIO_HD_TOT 2
+
+#define SIZE_H265D_HW_BIN_BUFFER(_size, frame_width, frame_height, \
+				delay, num_vpp_pipes)    \
+	do { \
+		HFI_U32 size_yuv, size_bin_hdr, size_bin_res;     \
+		size_yuv = ((frame_width * frame_height) <= \
+			BIN_BUFFER_THRESHOLD) ? \
+			((BIN_BUFFER_THRESHOLD * 3) >> 1) : \
+			((frame_width * frame_height * 3) >> 1); \
+		size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;    \
+		size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;   \
+		size_bin_hdr = size_bin_hdr * \
+			(((((HFI_U32)(delay)) & 31) / 10) + 2) / 2;    \
+		size_bin_res = size_bin_res * \
+			(((((HFI_U32)(delay)) & 31) / 10) + 2) / 2;    \
+		size_bin_hdr = HFI_ALIGN(size_bin_hdr / \
+			num_vpp_pipes, VENUS_DMA_ALIGNMENT) * \
+			num_vpp_pipes;  \
+		size_bin_res = HFI_ALIGN(size_bin_res / num_vpp_pipes,\
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes;  \
+		_size = size_bin_hdr + size_bin_res;    \
+	} while (0)
+
+#define HFI_BUFFER_BIN_H265D(_size, frame_width, frame_height, \
+				is_interlaced, delay, num_vpp_pipes) \
+	do { \
+		HFI_U32 n_aligned_w = HFI_ALIGN(frame_width, \
+				BUFFER_ALIGNMENT_16_BYTES); \
+		HFI_U32 n_aligned_h = HFI_ALIGN(frame_height, \
+				BUFFER_ALIGNMENT_16_BYTES); \
+		if (!is_interlaced) { \
+			SIZE_H265D_HW_BIN_BUFFER(_size, n_aligned_w, \
+			n_aligned_h, delay, num_vpp_pipes); \
+		} else \
+			_size = 0; \
+	} while (0)
+
+#define SIZE_SLIST_BUF_H265 (1 << 10)
+#define NUM_SLIST_BUF_H265 (80 + 20)
+#define H265_NUM_TILE_COL 32
+#define H265_NUM_TILE_ROW 128
+#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
+#define H265_NUM_FRM_INFO (48)
+#define H265_DISPLAY_BUF_SIZE (3072)
+#define HFI_BUFFER_PERSIST_H265D(_size, rpu_enabled) \
+	(_size = HFI_ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + \
+	H265_NUM_FRM_INFO * H265_DISPLAY_BUF_SIZE + \
+	H265_NUM_TILE * sizeof(HFI_U32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA + \
+	rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA),\
+	VENUS_DMA_ALIGNMENT))
+
+#define SIZE_VPXD_LB_FE_LEFT_CTRL(frame_width, frame_height) \
+	MAX(((frame_height + 15) >> 4) * \
+	MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE, \
+	MAX(((frame_height + 31) >> 5) * \
+	MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((frame_height + 63) >> 6) * MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE))
+#define SIZE_VPXD_LB_FE_TOP_CTRL(frame_width, frame_height) \
+	(((HFI_ALIGN(frame_width, 64) + 8) * 10 * 2))
+#define SIZE_VPXD_LB_SE_TOP_CTRL(frame_width, frame_height) \
+	(((frame_width + 15) >> 4) * MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE)
+#define SIZE_VPXD_LB_SE_LEFT_CTRL(frame_width, frame_height)  \
+	MAX(((frame_height + 15) >> 4) * \
+	MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,\
+	MAX(((frame_height + 31) >> 5) * \
+	MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((frame_height + 63) >> 6) * MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE))
+#define SIZE_VPXD_LB_RECON_DMA_METADATA_WR(frame_width, frame_height) \
+	HFI_ALIGN((HFI_ALIGN(frame_height, 8) / (4 / 2)) * 64,\
+	BUFFER_ALIGNMENT_32_BYTES)
+#define SIZE_MP2D_LB_FE_TOP_DATA(frame_width, frame_height) \
+	((HFI_ALIGN(frame_width, 16) + 8) * 10 * 2)
+#define SIZE_VP9D_LB_FE_TOP_DATA(frame_width, frame_height) \
+	((HFI_ALIGN(HFI_ALIGN(frame_width, 8), 64) + 8) * 10 * 2)
+#define SIZE_MP2D_LB_PE_TOP_DATA(frame_width, frame_height) \
+	((HFI_ALIGN(frame_width, 16) >> 4) * 64)
+#define SIZE_VP9D_LB_PE_TOP_DATA(frame_width, frame_height) \
+	((HFI_ALIGN(HFI_ALIGN(frame_width, 8), 64) >> 6) * 176)
+#define SIZE_MP2D_LB_VSP_TOP(frame_width, frame_height) \
+	(((HFI_ALIGN(frame_width, 16) >> 4) * 64 / 2) + 256)
+#define SIZE_VP9D_LB_VSP_TOP(frame_width, frame_height) \
+	((((HFI_ALIGN(HFI_ALIGN(frame_width, 8), 64) >> 6) * 64 * 8) + 256))
+
+#define HFI_IRIS3_VP9D_COMV_SIZE \
+	((((8192 + 63) >> 6) * ((4320 + 63) >> 6) * 8 * 8 * 2 * 8))
+
+#define SIZE_VP9D_QP(frame_width, frame_height) \
+	SIZE_H264D_QP(frame_width, frame_height)
+
+#define HFI_IRIS3_VP9D_LB_SIZE(_size, frame_width, frame_height, num_vpp_pipes)\
+		(_size = HFI_ALIGN(SIZE_VPXD_LB_FE_LEFT_CTRL(frame_width, \
+		frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+		HFI_ALIGN(SIZE_VPXD_LB_SE_LEFT_CTRL(frame_width, frame_height),\
+		VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+		HFI_ALIGN(SIZE_VP9D_LB_VSP_TOP(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VPXD_LB_FE_TOP_CTRL(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + 2 * \
+		HFI_ALIGN(SIZE_VPXD_LB_RECON_DMA_METADATA_WR \
+		(frame_width, frame_height), VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VPXD_LB_SE_TOP_CTRL(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VP9D_LB_PE_TOP_DATA(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VP9D_LB_FE_TOP_DATA(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VP9D_QP(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT))
+
+#define HFI_BUFFER_LINE_VP9D(_size, frame_width, frame_height, \
+		_yuv_bufcount_min, is_opb, num_vpp_pipes) \
+	do { \
+		HFI_U32 _lb_size = 0;                  \
+		HFI_U32 vpss_lb_size = 0;              \
+		HFI_IRIS3_VP9D_LB_SIZE(_lb_size, frame_width, frame_height,\
+			num_vpp_pipes);             \
+		if (is_opb) { \
+			SIZE_VPSS_LB(vpss_lb_size, frame_width, frame_height, \
+			num_vpp_pipes); \
+		} \
+		_size = _lb_size + vpss_lb_size; \
+	} while (0)
+
+#define VPX_DECODER_FRAME_CONCURENCY_LVL (2)
+#define VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO (1 / 2)
+#define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
+
+#define HFI_BUFFER_BIN_VP9D(_size, frame_width, frame_height, \
+				is_interlaced, num_vpp_pipes) \
+	do { \
+		HFI_U32 _size_yuv = HFI_ALIGN(frame_width, \
+		BUFFER_ALIGNMENT_16_BYTES) *\
+		HFI_ALIGN(frame_height, BUFFER_ALIGNMENT_16_BYTES) * 3 / 2;  \
+		if (!is_interlaced) { \
+			_size = HFI_ALIGN(((MAX(_size_yuv, \
+			((BIN_BUFFER_THRESHOLD * 3) >> 1)) * \
+			VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO * \
+			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), \
+			VENUS_DMA_ALIGNMENT) + HFI_ALIGN(((MAX(_size_yuv, \
+			((BIN_BUFFER_THRESHOLD * 3) >> 1)) * \
+			VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO * \
+			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), \
+			VENUS_DMA_ALIGNMENT);  \
+			_size = _size * num_vpp_pipes;   \
+		}              \
+		else \
+			_size = 0;     \
+	} while (0)
+
+#define VP9_NUM_FRAME_INFO_BUF 32
+#define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
+#define VP9_PROB_TABLE_SIZE (3840)
+#define VP9_FRAME_INFO_BUF_SIZE (6144)
+
+#define VP9_UDC_HEADER_BUF_SIZE (3 * 128)
+#define MAX_SUPERFRAME_HEADER_LEN (34)
+#define CCE_TILE_OFFSET_SIZE HFI_ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_32_BYTES)
+
+#define HFI_BUFFER_PERSIST_VP9D(_size) \
+	(_size = HFI_ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, \
+	VENUS_DMA_ALIGNMENT) + HFI_ALIGN(HFI_IRIS3_VP9D_COMV_SIZE, \
+	VENUS_DMA_ALIGNMENT) + HFI_ALIGN(MAX_SUPERFRAME_HEADER_LEN, \
+	VENUS_DMA_ALIGNMENT) + HFI_ALIGN(VP9_UDC_HEADER_BUF_SIZE, \
+	VENUS_DMA_ALIGNMENT) + HFI_ALIGN(VP9_NUM_FRAME_INFO_BUF * \
+	CCE_TILE_OFFSET_SIZE, VENUS_DMA_ALIGNMENT) + \
+	HFI_ALIGN(VP9_NUM_FRAME_INFO_BUF * VP9_FRAME_INFO_BUF_SIZE, \
+	VENUS_DMA_ALIGNMENT) + HDR10_HIST_EXTRADATA_SIZE)
+
+#define HFI_BUFFER_LINE_MP2D(_size, frame_width, frame_height, \
+_yuv_bufcount_min, is_opb, num_vpp_pipes)           \
+	do { \
+		HFI_U32 vpss_lb_size = 0;     \
+		_size = HFI_ALIGN(SIZE_VPXD_LB_FE_LEFT_CTRL(frame_width, \
+		frame_height), VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+		HFI_ALIGN(SIZE_VPXD_LB_SE_LEFT_CTRL(frame_width, frame_height),\
+		VENUS_DMA_ALIGNMENT) * num_vpp_pipes + \
+		HFI_ALIGN(SIZE_MP2D_LB_VSP_TOP(frame_width, frame_height),\
+		VENUS_DMA_ALIGNMENT) + HFI_ALIGN(SIZE_VPXD_LB_FE_TOP_CTRL\
+		(frame_width, frame_height), VENUS_DMA_ALIGNMENT) + \
+		2 * HFI_ALIGN(SIZE_VPXD_LB_RECON_DMA_METADATA_WR(frame_width,\
+		frame_height), VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_VPXD_LB_SE_TOP_CTRL(frame_width, frame_height),\
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_MP2D_LB_PE_TOP_DATA(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT) + \
+		HFI_ALIGN(SIZE_MP2D_LB_FE_TOP_DATA(frame_width, frame_height), \
+		VENUS_DMA_ALIGNMENT); \
+		if (is_opb) { \
+			SIZE_VPSS_LB(vpss_lb_size, frame_width, frame_height, \
+						num_vpp_pipes); \
+		} \
+		_size += vpss_lb_size; \
+	} while (0)
+
+#define HFI_BUFFER_BIN_MP2D(_size, frame_width, frame_height, is_interlaced) 0
+
+#define QMATRIX_SIZE (sizeof(HFI_U32) * 128 + 256)
+#define MP2D_QPDUMP_SIZE 115200
+#define HFI_BUFFER_PERSIST_MP2D(_size) \
+	do { \
+		_size = QMATRIX_SIZE + MP2D_QPDUMP_SIZE \
+	} while (0)
+
+#define HFI_BUFFER_BITSTREAM_ENC(size, frame_width, frame_height, \
+			rc_type, is_ten_bit) \
+	do { \
+		HFI_U32 aligned_width, aligned_height, bitstream_size, yuv_size; \
+		aligned_width = HFI_ALIGN(frame_width, 32); \
+		aligned_height = HFI_ALIGN(frame_height, 32); \
+		bitstream_size = aligned_width * aligned_height * 3; \
+		yuv_size = (aligned_width * aligned_height * 3) >> 1; \
+		if (aligned_width * aligned_height > (4096 * 2176)) { \
+		    /* bitstream_size = 0.25 * yuv_size; */ \
+			bitstream_size = (bitstream_size >> 3); \
+		} \
+		else if (aligned_width * aligned_height > (1280 * 720)) { \
+		    /* bitstream_size = 0.5 * yuv_size; */ \
+			bitstream_size = (bitstream_size >> 2); \
+		} else { \
+		    /* bitstream_size = 2 * yuv_size; */ \
+		} \
+		if ((rc_type == HFI_RC_CQ || rc_type == HFI_RC_OFF) && \
+			bitstream_size < yuv_size)  { \
+			bitstream_size = (bitstream_size << 1);\
+		} \
+		if (is_ten_bit) { \
+			bitstream_size = (bitstream_size) + \
+					(bitstream_size >> 2); \
+		} \
+		size = HFI_ALIGN(bitstream_size, HFI_ALIGNMENT_4096); \
+	} while (0)
+
+#define HFI_IRIS3_ENC_TILE_SIZE_INFO(tile_size, tile_count, last_tile_size, \
+				frame_width_coded, codec_standard) \
+	do { \
+		HFI_U32 without_tile_enc_width; \
+		HFI_U32 min_tile_size = 352, fixed_tile_width = 960; \
+		without_tile_enc_width = min_tile_size + fixed_tile_width; \
+		if (codec_standard == HFI_CODEC_ENCODE_HEVC && \
+			frame_width_coded > without_tile_enc_width) { \
+			tile_size = fixed_tile_width; \
+			tile_count = (frame_width_coded + tile_size - 1) / tile_size; \
+			last_tile_size = (frame_width_coded - (tile_size * (tile_count - 1))); \
+			if (last_tile_size < min_tile_size) { \
+				tile_count -= 1; \
+				last_tile_size = (tile_size + min_tile_size); \
+			} \
+		} else { \
+			tile_size = frame_width_coded; \
+			tile_count = 1; \
+			last_tile_size = 0; \
+		} \
+	} while (0)
+
+#define HFI_IRIS3_ENC_MB_BASED_MULTI_SLICE_COUNT(total_slice_count, frame_width, frame_height, \
+			codec_standard, multi_slice_max_mb_count) \
+	do { \
+		HFI_U32 tile_size, tile_count, last_tile_size, \
+			slice_count_per_tile, slice_count_in_last_tile; \
+		HFI_U32 mbs_in_one_tile, mbs_in_last_tile; \
+		HFI_U32 frame_width_coded, frame_height_coded, lcu_size; \
+		lcu_size = (codec_standard == HFI_CODEC_ENCODE_HEVC) ? 32 : 16; \
+		frame_width_coded = HFI_ALIGN(frame_width, lcu_size); \
+		frame_height_coded = HFI_ALIGN(frame_height, lcu_size); \
+		HFI_IRIS3_ENC_TILE_SIZE_INFO(tile_size, tile_count, last_tile_size, \
+			frame_width_coded, codec_standard); \
+		mbs_in_one_tile = (tile_size * frame_height_coded) / (lcu_size * lcu_size); \
+		slice_count_per_tile = \
+			(mbs_in_one_tile + multi_slice_max_mb_count - 1) / \
+			(multi_slice_max_mb_count); \
+		if (last_tile_size) { \
+			mbs_in_last_tile = \
+				(last_tile_size * frame_height_coded) / (lcu_size * lcu_size); \
+			slice_count_in_last_tile = \
+				(mbs_in_last_tile + multi_slice_max_mb_count - 1) / \
+				(multi_slice_max_mb_count); \
+			total_slice_count = \
+				(slice_count_per_tile * (tile_count - 1)) + \
+				slice_count_in_last_tile; \
+		} else \
+			total_slice_count = (slice_count_per_tile * tile_count); \
+	} while (0)
+
+#define SIZE_ROI_METADATA_ENC(size_roi, frame_width, frame_height, lcu_size)\
+	do { \
+		HFI_U32 width_in_lcus = 0, height_in_lcus = 0, n_shift = 0;    \
+		while (lcu_size && !(lcu_size & 0x1)) { \
+			n_shift++;                          \
+			lcu_size = lcu_size >> 1;          \
+		}                                      \
+		width_in_lcus = (frame_width + (lcu_size - 1)) >> n_shift; \
+		height_in_lcus = (frame_height + (lcu_size - 1)) >> n_shift;  \
+		size_roi = (((width_in_lcus + 7) >> 3) << 3) * \
+					height_in_lcus * 2 + 256; \
+	} while (0)
+
+#define HFI_BUFFER_INPUT_METADATA_ENC(size, frame_width, frame_height, \
+				is_roi_enabled, lcu_size) \
+	do { \
+		HFI_U32 roi_size = 0; \
+		if (is_roi_enabled) { \
+			SIZE_ROI_METADATA_ENC(roi_size, frame_width, \
+				frame_height, lcu_size); \
+		} \
+		size = roi_size + 16384; \
+		size = HFI_ALIGN(size, HFI_ALIGNMENT_4096); \
+	} while (0)
+
+#define HFI_BUFFER_INPUT_METADATA_H264E(size_metadata, frame_width, \
+		frame_height, is_roi_enabled)    \
+		HFI_BUFFER_INPUT_METADATA_ENC(size_metadata, frame_width, \
+			frame_height, is_roi_enabled, 16)
+
+#define HFI_BUFFER_INPUT_METADATA_H265E(size_metadata, frame_width, \
+		frame_height, is_roi_enabled)    \
+		HFI_BUFFER_INPUT_METADATA_ENC(size_metadata, frame_width, \
+			frame_height, is_roi_enabled, 32)
+
+#define HFI_BUFFER_ARP_ENC(size) \
+	(size = 204800)
+
+#define HFI_MAX_COL_FRAME 6
+#define HFI_VENUS_VENC_TRE_WB_BUFF_SIZE (65 << 4) // bytes
+#define HFI_VENUS_VENC_DB_LINE_BUFF_PER_MB 512
+#define HFI_VENUS_VPPSG_MAX_REGISTERS 2048
+#define HFI_VENUS_WIDTH_ALIGNMENT 128
+#define HFI_VENUS_WIDTH_TEN_BIT_ALIGNMENT 192
+#define HFI_VENUS_HEIGHT_ALIGNMENT 32
+#define VENUS_METADATA_STRIDE_MULTIPLE 64
+#define VENUS_METADATA_HEIGHT_MULTIPLE 16
+
+#ifndef SYSTEM_LAL_TILE10
+#define SYSTEM_LAL_TILE10 192
+#endif
+
+#define HFI_IRIS3_ENC_RECON_BUF_COUNT(num_recon, n_bframe, ltr_count, \
+	_total_hp_layers, _total_hb_layers, hybrid_hp, codec_standard) \
+	do { \
+		HFI_U32 num_ref = 1; \
+		if (n_bframe) \
+			num_ref = 2; \
+		if (_total_hp_layers > 1) { \
+			if (hybrid_hp) \
+				num_ref = (_total_hp_layers + 1) >> 1; \
+			else if (codec_standard == HFI_CODEC_ENCODE_HEVC) \
+				num_ref = (_total_hp_layers + 1) >> 1; \
+			else if (codec_standard == HFI_CODEC_ENCODE_AVC && \
+				_total_hp_layers < 4) \
+				num_ref = (_total_hp_layers - 1);  \
+			else \
+				num_ref = _total_hp_layers; \
+		} \
+		if (ltr_count) \
+			num_ref = num_ref + ltr_count; \
+		if (_total_hb_layers > 1) { \
+			if (codec_standard == HFI_CODEC_ENCODE_HEVC) \
+				num_ref = (_total_hb_layers); \
+			else if (codec_standard == HFI_CODEC_ENCODE_AVC) \
+				num_ref = (1 << (_total_hb_layers - 2)) + 1; \
+		} \
+		num_recon = num_ref + 1; \
+	} while (0)
+
+#define SIZE_BIN_BITSTREAM_ENC(_size, rc_type, frame_width, frame_height, \
+		work_mode, lcu_size, profile) \
+	do { \
+		HFI_U32 size_aligned_width = 0, size_aligned_height = 0; \
+		HFI_U32 bitstream_size_eval = 0; \
+		size_aligned_width = HFI_ALIGN((frame_width), lcu_size); \
+		size_aligned_height = HFI_ALIGN((frame_height), lcu_size); \
+		if (work_mode == HFI_WORKMODE_2) { \
+			if (rc_type == HFI_RC_CQ || rc_type == HFI_RC_OFF) { \
+				bitstream_size_eval = (((size_aligned_width) * \
+							(size_aligned_height) * 3) >> 1); \
+			} \
+			else { \
+				bitstream_size_eval = ((size_aligned_width) * \
+							(size_aligned_height) * 3); \
+				if (rc_type == HFI_RC_LOSSLESS) { \
+					bitstream_size_eval = (bitstream_size_eval * 3 >> 2); \
+				} else if ((size_aligned_width * size_aligned_height) > \
+					(4096 * 2176)) { \
+					bitstream_size_eval >>= 3; \
+				} else if ((size_aligned_width * size_aligned_height) > \
+					(480 * 320)) { \
+					bitstream_size_eval >>= 2; \
+				} \
+				if (profile == HFI_H265_PROFILE_MAIN_10 || \
+					profile == HFI_H265_PROFILE_MAIN_10_STILL_PICTURE) \
+					bitstream_size_eval = (bitstream_size_eval * 5 >> 2); \
+			} \
+		} else { \
+			bitstream_size_eval = size_aligned_width * \
+					size_aligned_height * 3; \
+		} \
+		_size = HFI_ALIGN(bitstream_size_eval, VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define SIZE_ENC_SINGLE_PIPE(size, rc_type, bitbin_size, num_vpp_pipes, \
+			frame_width, frame_height, lcu_size) \
+	do { \
+		HFI_U32 size_single_pipe_eval = 0, sao_bin_buffer_size = 0, \
+			_padded_bin_sz = 0; \
+		HFI_U32 size_aligned_width = 0, size_aligned_height = 0; \
+		size_aligned_width = HFI_ALIGN((frame_width), lcu_size); \
+		size_aligned_height = HFI_ALIGN((frame_height), lcu_size); \
+		if ((size_aligned_width * size_aligned_height) > \
+			(3840 * 2160)) { \
+			size_single_pipe_eval = (bitbin_size / num_vpp_pipes); \
+		} else if (num_vpp_pipes > 2) { \
+			size_single_pipe_eval = bitbin_size / 2; \
+		} else { \
+			size_single_pipe_eval = bitbin_size; \
+		} \
+		if (rc_type == HFI_RC_LOSSLESS) { \
+			size_single_pipe_eval = (size_single_pipe_eval << 1); \
+		} \
+		sao_bin_buffer_size = (64 * ((((frame_width) + \
+				BUFFER_ALIGNMENT_32_BYTES) * ((frame_height) +\
+				BUFFER_ALIGNMENT_32_BYTES)) >> 10)) + 384; \
+		_padded_bin_sz = HFI_ALIGN(size_single_pipe_eval, \
+				VENUS_DMA_ALIGNMENT);\
+		size_single_pipe_eval = sao_bin_buffer_size + _padded_bin_sz; \
+		size_single_pipe_eval = HFI_ALIGN(size_single_pipe_eval, \
+				VENUS_DMA_ALIGNMENT); \
+		size = size_single_pipe_eval; \
+	} while (0)
+
+#define HFI_BUFFER_BIN_ENC(_size, rc_type, frame_width, frame_height, lcu_size, \
+				work_mode, num_vpp_pipes, profile)           \
+	do { \
+		HFI_U32 bitstream_size = 0, total_bitbin_buffers = 0, \
+			size_single_pipe = 0, bitbin_size = 0; \
+		SIZE_BIN_BITSTREAM_ENC(bitstream_size, rc_type, frame_width, \
+			frame_height, work_mode, lcu_size, profile);         \
+		if (work_mode == HFI_WORKMODE_2) { \
+			total_bitbin_buffers = 3; \
+			bitbin_size = bitstream_size * 12 / 10; \
+			bitbin_size = HFI_ALIGN(bitbin_size, \
+				VENUS_DMA_ALIGNMENT); \
+		} \
+		else if ((lcu_size == 16) || (num_vpp_pipes > 1)) { \
+			total_bitbin_buffers = 1; \
+			bitbin_size = bitstream_size; \
+		} \
+		if (total_bitbin_buffers > 0) { \
+			SIZE_ENC_SINGLE_PIPE(size_single_pipe, rc_type, bitbin_size, \
+				num_vpp_pipes, frame_width, frame_height, lcu_size); \
+			bitbin_size = size_single_pipe * num_vpp_pipes; \
+			_size = HFI_ALIGN(bitbin_size, VENUS_DMA_ALIGNMENT) * \
+					total_bitbin_buffers + 512; \
+		} else \
+			/* Avoid 512 Bytes allocation in case of 1Pipe HEVC Direct Mode*/ \
+			_size = 0; \
+	} while (0)
+
+#define HFI_BUFFER_BIN_H264E(_size, rc_type, frame_width, frame_height, \
+				work_mode, num_vpp_pipes, profile)    \
+		HFI_BUFFER_BIN_ENC(_size, rc_type, frame_width, frame_height, 16, \
+				work_mode, num_vpp_pipes, profile)
+
+#define HFI_BUFFER_BIN_H265E(_size, rc_type, frame_width, frame_height, \
+				work_mode, num_vpp_pipes, profile)    \
+		HFI_BUFFER_BIN_ENC(_size, rc_type, frame_width, frame_height, 32,\
+				work_mode, num_vpp_pipes, profile)
+
+#define SIZE_ENC_SLICE_INFO_BUF(num_lcu_in_frame) HFI_ALIGN((256 + \
+		(num_lcu_in_frame << 4)), VENUS_DMA_ALIGNMENT)
+#define SIZE_LINE_BUF_CTRL(frame_width_coded) \
+		HFI_ALIGN(frame_width_coded, VENUS_DMA_ALIGNMENT)
+#define SIZE_LINE_BUF_CTRL_ID2(frame_width_coded) \
+		HFI_ALIGN(frame_width_coded, VENUS_DMA_ALIGNMENT)
+
+#define SIZE_LINEBUFF_DATA(_size, is_ten_bit, frame_width_coded) \
+		(_size = is_ten_bit ? (((((10 * (frame_width_coded) +\
+		 1024) + (VENUS_DMA_ALIGNMENT - 1)) & \
+		 (~(VENUS_DMA_ALIGNMENT - 1))) * 1) + \
+		(((((10 * (frame_width_coded) + 1024) >> 1) + \
+		(VENUS_DMA_ALIGNMENT - 1)) & (~(VENUS_DMA_ALIGNMENT - 1))) * \
+		2)) : (((((8 * (frame_width_coded) + 1024) + \
+		(VENUS_DMA_ALIGNMENT - 1)) \
+		& (~(VENUS_DMA_ALIGNMENT - 1))) * 1) + \
+		(((((8 * (frame_width_coded) +\
+		1024) >> 1) + (VENUS_DMA_ALIGNMENT - 1)) & \
+		(~(VENUS_DMA_ALIGNMENT - 1))) * 2)))
+
+#define SIZE_LEFT_LINEBUFF_CTRL(_size, standard, frame_height_coded, \
+				num_vpp_pipes_enc) \
+	do { \
+		_size = (standard == HFI_CODEC_ENCODE_HEVC) ? \
+			(((frame_height_coded) + \
+			(BUF_SIZE_ALIGN_32)) / BUF_SIZE_ALIGN_32 * 4 * 16) : \
+			(((frame_height_coded) + 15) / 16 * 5 * 16); \
+		if ((num_vpp_pipes_enc) > 1) { \
+			_size += BUFFER_ALIGNMENT_512_BYTES; \
+			_size = HFI_ALIGN(_size, BUFFER_ALIGNMENT_512_BYTES) *\
+				(num_vpp_pipes_enc); \
+		} \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define SIZE_LEFT_LINEBUFF_RECON_PIX(_size, is_ten_bit, frame_height_coded, \
+				num_vpp_pipes_enc) \
+		(_size = (((is_ten_bit + 1) * 2 * (frame_height_coded) + \
+		VENUS_DMA_ALIGNMENT) + \
+		(VENUS_DMA_ALIGNMENT << (num_vpp_pipes_enc - 1)) - 1) & \
+		(~((VENUS_DMA_ALIGNMENT << (num_vpp_pipes_enc - 1)) - 1)) * 1)
+
+#define SIZE_TOP_LINEBUFF_CTRL_FE(_size, frame_width_coded, standard) \
+	do { \
+		_size = (standard == HFI_CODEC_ENCODE_HEVC) ? (64 * \
+		((frame_width_coded) >> 5)) : (VENUS_DMA_ALIGNMENT + 16 * \
+		((frame_width_coded) >> 4)); \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+	} while (0)
+
+#define SIZE_LEFT_LINEBUFF_CTRL_FE(frame_height_coded, num_vpp_pipes_enc) \
+	((((VENUS_DMA_ALIGNMENT + 64 * ((frame_height_coded) >> 4)) +         \
+	   (VENUS_DMA_ALIGNMENT << (num_vpp_pipes_enc - 1)) - 1) &          \
+	  (~((VENUS_DMA_ALIGNMENT << (num_vpp_pipes_enc - 1)) - 1)) * 1) *  \
+	 num_vpp_pipes_enc)
+
+#define SIZE_LEFT_LINEBUFF_METADATA_RECON_Y(_size, frame_height_coded, \
+		is_ten_bit, num_vpp_pipes_enc) \
+	do { \
+		_size = ((VENUS_DMA_ALIGNMENT + 64 * ((frame_height_coded) / \
+		(8 * (is_ten_bit ? 4 : 8)))));   \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+		_size = (_size * num_vpp_pipes_enc); \
+	} while (0)
+
+#define SIZE_LEFT_LINEBUFF_METADATA_RECON_UV(_size, frame_height_coded, \
+			is_ten_bit, num_vpp_pipes_enc) \
+	do { \
+		_size = ((VENUS_DMA_ALIGNMENT + 64 * ((frame_height_coded) / \
+				(4 * (is_ten_bit ? 4 : 8)))));    \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT); \
+		_size = (_size * num_vpp_pipes_enc); \
+	} while (0)
+
+#define SIZE_LINEBUFF_RECON_PIX(_size, is_ten_bit, frame_width_coded) \
+	do { \
+		_size = ((is_ten_bit ? 3 : 2) * (frame_width_coded));         \
+		_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT);             \
+	} while (0)
+
+#define SIZE_SLICE_CMD_BUFFER (HFI_ALIGN(20480, VENUS_DMA_ALIGNMENT))
+#define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
+
+#define SIZE_FRAME_RC_BUF_SIZE(_size, standard, frame_height_coded, \
+			num_vpp_pipes_enc) \
+	do { \
+		_size = (standard == HFI_CODEC_ENCODE_HEVC) ? (256 + 16 * \
+			(14 + ((((frame_height_coded) >> 5) + 7) >> 3))) : \
+			(256 + 16 * (14 + ((((frame_height_coded) >> 4) + 7) >> 3))); \
+		_size *= 11; \
+		if (num_vpp_pipes_enc > 1) { \
+			_size = HFI_ALIGN(_size, VENUS_DMA_ALIGNMENT) * \
+					num_vpp_pipes_enc;\
+		} \
+		_size = HFI_ALIGN(_size, BUFFER_ALIGNMENT_512_BYTES) * \
+				HFI_MAX_COL_FRAME; \
+	} while (0)
+
+#define ENC_BITCNT_BUF_SIZE(num_lcu_in_frame) HFI_ALIGN((256 + \
+		(4 * (num_lcu_in_frame))), VENUS_DMA_ALIGNMENT)
+#define ENC_BITMAP_BUF_SIZE(num_lcu_in_frame) HFI_ALIGN((256 + \
+		((num_lcu_in_frame) >> 3)), VENUS_DMA_ALIGNMENT)
+#define SIZE_LINE_BUF_SDE(frame_width_coded) HFI_ALIGN((256 + \
+		(16 * ((frame_width_coded) >> 4))), VENUS_DMA_ALIGNMENT)
+
+#define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
+
+#define SIZE_LAMBDA_LUT (256 * 11)
+#define SIZE_OVERRIDE_BUF(num_lcumb) (HFI_ALIGN(((16 * (((num_lcumb) + 7)\
+		>> 3))), VENUS_DMA_ALIGNMENT) * 2)
+#define SIZE_IR_BUF(num_lcu_in_frame) HFI_ALIGN((((((num_lcu_in_frame) << 1) + 7) &\
+	(~7)) * 3), VENUS_DMA_ALIGNMENT)
+
+#define SIZE_VPSS_LINE_BUF(num_vpp_pipes_enc, frame_height_coded, \
+			frame_width_coded) \
+	(HFI_ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) + \
+	(((((MAX((frame_width_coded), (frame_height_coded)) + 3) >> 2) << 5) +\
+	256) * 16)), VENUS_DMA_ALIGNMENT))
+
+#define SIZE_TOP_LINE_BUF_FIRST_STG_SAO(frame_width_coded) \
+	HFI_ALIGN((16 * ((frame_width_coded) >> 5)), VENUS_DMA_ALIGNMENT)
+
+#define HFI_BUFFER_LINE_ENC(_size, frame_width, frame_height, is_ten_bit, \
+			num_vpp_pipes_enc, lcu_size, standard) \
+	do { \
+		HFI_U32 width_in_lcus = 0, height_in_lcus = 0, \
+			frame_width_coded = 0, frame_height_coded = 0; \
+		HFI_U32 line_buff_data_size = 0, left_line_buff_ctrl_size = 0, \
+			left_line_buff_recon_pix_size = 0, \
+			top_line_buff_ctrl_fe_size = 0; \
+		HFI_U32 left_line_buff_metadata_recon__y__size = 0, \
+			left_line_buff_metadata_recon__uv__size = 0, \
+			line_buff_recon_pix_size = 0;          \
+		width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size); \
+		height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size); \
+		frame_width_coded = width_in_lcus * (lcu_size); \
+		frame_height_coded = height_in_lcus * (lcu_size); \
+		SIZE_LINEBUFF_DATA(line_buff_data_size, is_ten_bit, \
+			frame_width_coded);\
+		SIZE_LEFT_LINEBUFF_CTRL(left_line_buff_ctrl_size, standard, \
+			frame_height_coded, num_vpp_pipes_enc); \
+		SIZE_LEFT_LINEBUFF_RECON_PIX(left_line_buff_recon_pix_size, \
+			is_ten_bit, frame_height_coded, num_vpp_pipes_enc); \
+		SIZE_TOP_LINEBUFF_CTRL_FE(top_line_buff_ctrl_fe_size, \
+			frame_width_coded, standard); \
+		SIZE_LEFT_LINEBUFF_METADATA_RECON_Y\
+			(left_line_buff_metadata_recon__y__size, \
+			frame_height_coded, is_ten_bit, num_vpp_pipes_enc); \
+		SIZE_LEFT_LINEBUFF_METADATA_RECON_UV\
+			(left_line_buff_metadata_recon__uv__size, \
+			frame_height_coded, is_ten_bit, num_vpp_pipes_enc); \
+		SIZE_LINEBUFF_RECON_PIX(line_buff_recon_pix_size, is_ten_bit,\
+			frame_width_coded); \
+		_size = SIZE_LINE_BUF_CTRL(frame_width_coded) + \
+			SIZE_LINE_BUF_CTRL_ID2(frame_width_coded) + \
+			line_buff_data_size + \
+			left_line_buff_ctrl_size + \
+			left_line_buff_recon_pix_size + \
+			top_line_buff_ctrl_fe_size + \
+			left_line_buff_metadata_recon__y__size + \
+			left_line_buff_metadata_recon__uv__size + \
+			line_buff_recon_pix_size + \
+		SIZE_LEFT_LINEBUFF_CTRL_FE(frame_height_coded, \
+			num_vpp_pipes_enc) + SIZE_LINE_BUF_SDE(frame_width_coded) + \
+		SIZE_VPSS_LINE_BUF(num_vpp_pipes_enc, frame_height_coded, \
+			frame_width_coded) + \
+		SIZE_TOP_LINE_BUF_FIRST_STG_SAO(frame_width_coded); \
+	} while (0)
+
+#define HFI_BUFFER_LINE_H264E(_size, frame_width, frame_height, is_ten_bit, \
+		num_vpp_pipes)                   \
+		HFI_BUFFER_LINE_ENC(_size, frame_width, frame_height, 0, \
+			num_vpp_pipes, 16, HFI_CODEC_ENCODE_AVC)
+
+#define HFI_BUFFER_LINE_H265E(_size, frame_width, frame_height, is_ten_bit, \
+			num_vpp_pipes)                          \
+		HFI_BUFFER_LINE_ENC(_size, frame_width, frame_height, \
+		is_ten_bit, num_vpp_pipes, 32, HFI_CODEC_ENCODE_HEVC)
+
+#define HFI_BUFFER_COMV_ENC(_size, frame_width, frame_height, lcu_size, \
+			num_recon, standard) \
+	do { \
+		HFI_U32 size_colloc_mv = 0, size_colloc_rc = 0; \
+		HFI_U32 mb_width = ((frame_width) + 15) >> 4; \
+		HFI_U32 mb_height = ((frame_height) + 15) >> 4; \
+		HFI_U32 width_in_lcus = ((frame_width) + (lcu_size) - 1) /\
+					(lcu_size); \
+		HFI_U32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / \
+					(lcu_size); \
+		HFI_U32 num_lcu_in_frame = width_in_lcus * height_in_lcus; \
+		size_colloc_mv = (standard == HFI_CODEC_ENCODE_HEVC) ? \
+		(16 * ((num_lcu_in_frame << 2) + BUFFER_ALIGNMENT_32_BYTES)) : \
+		(3 * 16 * (width_in_lcus * height_in_lcus +\
+		BUFFER_ALIGNMENT_32_BYTES)); \
+		size_colloc_mv = HFI_ALIGN(size_colloc_mv, \
+		VENUS_DMA_ALIGNMENT) * num_recon; \
+		size_colloc_rc = (((mb_width + 7) >> 3) * 16 * 2 * mb_height); \
+		size_colloc_rc = HFI_ALIGN(size_colloc_rc, \
+		VENUS_DMA_ALIGNMENT) * HFI_MAX_COL_FRAME; \
+		_size = size_colloc_mv + size_colloc_rc; \
+	} while (0)
+
+#define HFI_BUFFER_COMV_H264E(_size, frame_width, frame_height, num_recon) \
+		HFI_BUFFER_COMV_ENC(_size, frame_width, frame_height, 16, \
+			num_recon, HFI_CODEC_ENCODE_AVC)
+
+#define HFI_BUFFER_COMV_H265E(_size, frame_width, frame_height, num_recon) \
+		HFI_BUFFER_COMV_ENC(_size, frame_width, frame_height, 32,\
+			num_recon, HFI_CODEC_ENCODE_HEVC)
+
+#define HFI_BUFFER_NON_COMV_ENC(_size, frame_width, frame_height, \
+			num_vpp_pipes_enc, lcu_size, standard) \
+	do { \
+		HFI_U32 width_in_lcus = 0, height_in_lcus = 0, \
+		frame_width_coded = 0, frame_height_coded = 0, \
+		num_lcu_in_frame = 0, num_lcumb = 0; \
+		HFI_U32	frame_rc_buf_size = 0; \
+		width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size); \
+		height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size); \
+		num_lcu_in_frame = width_in_lcus * height_in_lcus; \
+		frame_width_coded = width_in_lcus * (lcu_size); \
+		frame_height_coded = height_in_lcus * (lcu_size); \
+		num_lcumb = (frame_height_coded / lcu_size) * \
+		((frame_width_coded + lcu_size * 8) / lcu_size); \
+		SIZE_FRAME_RC_BUF_SIZE(frame_rc_buf_size, standard, \
+		frame_height_coded, num_vpp_pipes_enc); \
+		_size = SIZE_ENC_SLICE_INFO_BUF(num_lcu_in_frame) + \
+			   SIZE_SLICE_CMD_BUFFER + \
+			   SIZE_SPS_PPS_SLICE_HDR + \
+			   frame_rc_buf_size + \
+			   ENC_BITCNT_BUF_SIZE(num_lcu_in_frame) + \
+			   ENC_BITMAP_BUF_SIZE(num_lcu_in_frame) + \
+			   SIZE_BSE_SLICE_CMD_BUF + \
+			   SIZE_LAMBDA_LUT + \
+			   SIZE_OVERRIDE_BUF(num_lcumb) + \
+			   SIZE_IR_BUF(num_lcu_in_frame); \
+	} while (0)
+
+#define HFI_BUFFER_NON_COMV_H264E(_size, frame_width, frame_height, \
+				num_vpp_pipes_enc) \
+		HFI_BUFFER_NON_COMV_ENC(_size, frame_width, frame_height, \
+				num_vpp_pipes_enc, 16, HFI_CODEC_ENCODE_AVC)
+
+#define HFI_BUFFER_NON_COMV_H265E(_size, frame_width, frame_height, \
+				num_vpp_pipes_enc) \
+		HFI_BUFFER_NON_COMV_ENC(_size, frame_width, frame_height, \
+			num_vpp_pipes_enc, 32, HFI_CODEC_ENCODE_HEVC)
+
+#define SIZE_ENC_REF_BUFFER(size, frame_width, frame_height) \
+	do { \
+		HFI_U32 u_buffer_width = 0, u_buffer_height = 0, \
+			u_chroma_buffer_height = 0; \
+		u_buffer_height = HFI_ALIGN(frame_height, \
+			HFI_VENUS_HEIGHT_ALIGNMENT); \
+		u_chroma_buffer_height = frame_height >> 1; \
+		u_chroma_buffer_height = HFI_ALIGN(u_chroma_buffer_height, \
+			HFI_VENUS_HEIGHT_ALIGNMENT); \
+		u_buffer_width = HFI_ALIGN(frame_width, \
+			HFI_VENUS_WIDTH_ALIGNMENT); \
+		size = (u_buffer_height + u_chroma_buffer_height) * \
+			u_buffer_width; \
+	} while (0)
+
+#define SIZE_ENC_TEN_BIT_REF_BUFFER(size, frame_width, frame_height) \
+	do { \
+		HFI_U32 ref_buf_height = 0, ref_luma_stride_in_bytes = 0, \
+		u_ref_stride = 0, luma_size = 0, ref_chrm_height_in_bytes = 0, \
+		chroma_size = 0, ref_buf_size = 0; \
+		ref_buf_height = (frame_height + \
+		(HFI_VENUS_HEIGHT_ALIGNMENT - 1)) \
+		& (~(HFI_VENUS_HEIGHT_ALIGNMENT - 1)); \
+		ref_luma_stride_in_bytes = ((frame_width + \
+		SYSTEM_LAL_TILE10 - 1) / SYSTEM_LAL_TILE10) * \
+		SYSTEM_LAL_TILE10; \
+		u_ref_stride = 4 * (ref_luma_stride_in_bytes / 3); \
+		u_ref_stride = (u_ref_stride + (BUF_SIZE_ALIGN_128 - 1)) &\
+			(~(BUF_SIZE_ALIGN_128 - 1)); \
+		luma_size = ref_buf_height * u_ref_stride; \
+		ref_chrm_height_in_bytes = (((frame_height + 1) >> 1) + \
+			(BUF_SIZE_ALIGN_32 - 1)) & (~(BUF_SIZE_ALIGN_32 - 1)); \
+		chroma_size = u_ref_stride * ref_chrm_height_in_bytes; \
+		luma_size = (luma_size + (BUF_SIZE_ALIGN_4096 - 1)) & \
+			(~(BUF_SIZE_ALIGN_4096 - 1)); \
+		chroma_size = (chroma_size + (BUF_SIZE_ALIGN_4096 - 1)) & \
+			(~(BUF_SIZE_ALIGN_4096 - 1)); \
+		ref_buf_size = luma_size + chroma_size; \
+		size = ref_buf_size; \
+	} while (0)
+
+#define HFI_BUFFER_DPB_ENC(_size, frame_width, frame_height, is_ten_bit) \
+	do { \
+		HFI_U32 metadata_stride, metadata_buf_height, meta_size_y, \
+			meta_size_c; \
+		HFI_U32 ten_bit_ref_buf_size = 0, ref_buf_size = 0; \
+		if (!is_ten_bit) { \
+			SIZE_ENC_REF_BUFFER(ref_buf_size, frame_width, \
+				frame_height); \
+			HFI_UBWC_CALC_METADATA_PLANE_STRIDE(metadata_stride, \
+				(frame_width), 64, \
+				HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH); \
+			HFI_UBWC_METADATA_PLANE_BUFHEIGHT(metadata_buf_height, \
+				(frame_height), 16, \
+				HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT); \
+			HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(meta_size_y, \
+				metadata_stride, metadata_buf_height); \
+			HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(meta_size_c, \
+				metadata_stride, metadata_buf_height); \
+			_size = ref_buf_size + meta_size_y + meta_size_c; \
+		} else { \
+			SIZE_ENC_TEN_BIT_REF_BUFFER(ten_bit_ref_buf_size, \
+				frame_width, frame_height); \
+			HFI_UBWC_CALC_METADATA_PLANE_STRIDE(metadata_stride, \
+				frame_width, VENUS_METADATA_STRIDE_MULTIPLE, \
+			HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH); \
+			HFI_UBWC_METADATA_PLANE_BUFHEIGHT(metadata_buf_height, \
+				frame_height, VENUS_METADATA_HEIGHT_MULTIPLE, \
+			HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT); \
+			HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(meta_size_y, \
+				metadata_stride, metadata_buf_height); \
+			HFI_UBWC_METADATA_PLANE_BUFFER_SIZE(meta_size_c, \
+				metadata_stride, metadata_buf_height); \
+			_size = ten_bit_ref_buf_size + meta_size_y + \
+				meta_size_c; \
+		} \
+	} while (0)
+
+#define HFI_BUFFER_DPB_H264E(_size, frame_width, frame_height) \
+		HFI_BUFFER_DPB_ENC(_size, frame_width, frame_height, 0)
+
+#define HFI_BUFFER_DPB_H265E(_size, frame_width, frame_height, is_ten_bit) \
+		HFI_BUFFER_DPB_ENC(_size, frame_width, frame_height, is_ten_bit)
+
+#define HFI_BUFFER_VPSS_ENC(vpss_size, dswidth, dsheight, ds_enable, blur, is_ten_bit) \
+	do { \
+		vpss_size = 0; \
+		if (ds_enable || blur) { \
+			HFI_BUFFER_DPB_ENC(vpss_size, dswidth, dsheight, is_ten_bit); \
+		} \
+	} while (0)
+
+#define HFI_IRIS3_ENC_MIN_INPUT_BUF_COUNT(numinput, totalhblayers) \
+	do { \
+		numinput = 3;                                             \
+		if (totalhblayers >= 2) { \
+			numinput = (1 << (totalhblayers - 1)) + 2;        \
+		}                                                         \
+	} while (0)
+
+#endif /* __HFI_BUFFER_IRIS3__ */
diff --git a/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_buffer_iris3.h b/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_buffer_iris3.h
new file mode 100644
index 0000000..1d44662
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_buffer_iris3.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __H_MSM_VIDC_BUFFER_IRIS3_H__
+#define __H_MSM_VIDC_BUFFER_IRIS3_H__
+
+#include "msm_vidc_inst.h"
+
+int msm_buffer_size_iris3(struct msm_vidc_inst *inst,
+			  enum msm_vidc_buffer_type buffer_type);
+int msm_buffer_min_count_iris3(struct msm_vidc_inst *inst,
+			       enum msm_vidc_buffer_type buffer_type);
+int msm_buffer_extra_count_iris3(struct msm_vidc_inst *inst,
+				 enum msm_vidc_buffer_type buffer_type);
+
+#endif // __H_MSM_VIDC_BUFFER_IRIS3_H__
diff --git a/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_buffer_iris3.c b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_buffer_iris3.c
new file mode 100644
index 0000000..f9a999c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_buffer_iris3.c
@@ -0,0 +1,595 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "hfi_buffer_iris3.h"
+#include "hfi_property.h"
+#include "msm_media_info.h"
+#include "msm_vidc_buffer.h"
+#include "msm_vidc_buffer_iris3.h"
+#include "msm_vidc_core.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_inst.h"
+#include "msm_vidc_platform.h"
+
+static u32 msm_vidc_decoder_bin_size_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 size = 0;
+	u32 width, height, num_vpp_pipes;
+	struct v4l2_format *f;
+	bool is_interlaced;
+	u32 vpp_delay;
+
+	core = inst->core;
+
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+	if (inst->decode_vpp_delay.enable)
+		vpp_delay = inst->decode_vpp_delay.size;
+	else
+		vpp_delay = DEFAULT_BSE_VPP_DELAY;
+	if (inst->capabilities[CODED_FRAMES].value ==
+			CODED_FRAMES_PROGRESSIVE)
+		is_interlaced = false;
+	else
+		is_interlaced = true;
+	f = &inst->fmts[INPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_BIN_H264D(size, width, height,
+				     is_interlaced, vpp_delay, num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_BIN_H265D(size, width, height,
+				     0, vpp_delay, num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_VP9)
+		HFI_BUFFER_BIN_VP9D(size, width, height,
+				    0, num_vpp_pipes);
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_decoder_comv_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	u32 width, height, num_comv, vpp_delay;
+	struct v4l2_format *f;
+
+	f = &inst->fmts[INPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	num_comv = inst->buffers.output.min_count;
+
+	msm_vidc_update_cap_value(inst, NUM_COMV, num_comv, __func__);
+
+	if (inst->decode_vpp_delay.enable)
+		vpp_delay = inst->decode_vpp_delay.size;
+	else
+		vpp_delay = DEFAULT_BSE_VPP_DELAY;
+	num_comv = max(vpp_delay + 1, num_comv);
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_COMV_H264D(size, width, height, num_comv);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_COMV_H265D(size, width, height, num_comv);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_decoder_non_comv_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	u32 width, height, num_vpp_pipes;
+	struct msm_vidc_core *core;
+	struct v4l2_format *f;
+
+	core = inst->core;
+
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+
+	f = &inst->fmts[INPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_NON_COMV_H264D(size, width, height, num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_NON_COMV_H265D(size, width, height, num_vpp_pipes);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_decoder_line_size_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 size = 0;
+	u32 width, height, out_min_count, num_vpp_pipes, vpp_delay;
+	struct v4l2_format *f;
+	bool is_opb;
+	u32 color_fmt;
+
+	core = inst->core;
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+
+	color_fmt = v4l2_colorformat_to_driver(inst,
+					       inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat,
+					       __func__);
+	if (is_linear_colorformat(color_fmt))
+		is_opb = true;
+	else
+		is_opb = false;
+	/*
+	 * assume worst case, since color format is unknown at this
+	 * time.
+	 */
+	is_opb = true;
+
+	if (inst->decode_vpp_delay.enable)
+		vpp_delay = inst->decode_vpp_delay.size;
+	else
+		vpp_delay = DEFAULT_BSE_VPP_DELAY;
+
+	f = &inst->fmts[INPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+	out_min_count = inst->buffers.output.min_count;
+	out_min_count = max(vpp_delay + 1, out_min_count);
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_LINE_H264D(size, width, height, is_opb,
+				      num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_LINE_H265D(size, width, height, is_opb,
+				      num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_VP9)
+		HFI_BUFFER_LINE_VP9D(size, width, height, out_min_count,
+				     is_opb, num_vpp_pipes);
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_decoder_persist_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_PERSIST_H264D(size, 0);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_PERSIST_H265D(size, 0);
+	else if (inst->codec == MSM_VIDC_VP9)
+		HFI_BUFFER_PERSIST_VP9D(size);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_decoder_dpb_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	u32 color_fmt;
+	u32 width, height;
+	struct v4l2_format *f;
+
+	color_fmt = inst->capabilities[PIX_FMTS].value;
+	if (!is_linear_colorformat(color_fmt))
+		return size;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	if (color_fmt == MSM_VIDC_FMT_NV12 ||
+	    color_fmt == MSM_VIDC_FMT_NV12C) {
+		color_fmt = MSM_VIDC_FMT_NV12C;
+		HFI_NV12_UBWC_IL_CALC_BUF_SIZE_V2(size, width, height,
+						  video_y_stride_bytes(color_fmt, width),
+						  video_y_scanlines(color_fmt, height),
+						  video_uv_stride_bytes(color_fmt, width),
+						  video_uv_scanlines(color_fmt, height),
+						  video_y_meta_stride(color_fmt, width),
+						  video_y_meta_scanlines(color_fmt, height),
+						  video_uv_meta_stride(color_fmt, width),
+						  video_uv_meta_scanlines(color_fmt, height));
+	} else if (color_fmt == MSM_VIDC_FMT_P010 ||
+		color_fmt == MSM_VIDC_FMT_TP10C) {
+		color_fmt = MSM_VIDC_FMT_TP10C;
+		HFI_YUV420_TP10_UBWC_CALC_BUF_SIZE(size,
+						   video_y_stride_bytes(color_fmt, width),
+						   video_y_scanlines(color_fmt, height),
+						   video_uv_stride_bytes(color_fmt, width),
+						   video_uv_scanlines(color_fmt, height),
+						   video_y_meta_stride(color_fmt, width),
+						   video_y_meta_scanlines(color_fmt, height),
+						   video_uv_meta_stride(color_fmt, width),
+						   video_uv_meta_scanlines(color_fmt, height));
+	}
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+/* encoder internal buffers */
+static u32 msm_vidc_encoder_bin_size_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 size = 0;
+	u32 width, height, num_vpp_pipes, stage, profile;
+	struct v4l2_format *f;
+
+	core = inst->core;
+
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+	stage = inst->capabilities[STAGE].value;
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+	profile = inst->capabilities[PROFILE].value;
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_BIN_H264E(size, inst->hfi_rc_type, width,
+				     height, stage, num_vpp_pipes, profile);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_BIN_H265E(size, inst->hfi_rc_type, width,
+				     height, stage, num_vpp_pipes, profile);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_get_recon_buf_count(struct msm_vidc_inst *inst)
+{
+	u32 num_buf_recon = 0;
+	s32 n_bframe, ltr_count, hp_layers = 0, hb_layers = 0;
+	bool is_hybrid_hp = false;
+	u32 hfi_codec = 0;
+
+	n_bframe = inst->capabilities[B_FRAME].value;
+	ltr_count = inst->capabilities[LTR_COUNT].value;
+
+	if (inst->hfi_layer_type == HFI_HIER_B) {
+		hb_layers = inst->capabilities[ENH_LAYER_COUNT].value + 1;
+	} else {
+		hp_layers = inst->capabilities[ENH_LAYER_COUNT].value + 1;
+		if (inst->hfi_layer_type == HFI_HIER_P_HYBRID_LTR)
+			is_hybrid_hp = true;
+	}
+
+	if (inst->codec == MSM_VIDC_H264)
+		hfi_codec = HFI_CODEC_ENCODE_AVC;
+	else if (inst->codec == MSM_VIDC_HEVC)
+		hfi_codec = HFI_CODEC_ENCODE_HEVC;
+
+	HFI_IRIS3_ENC_RECON_BUF_COUNT(num_buf_recon, n_bframe, ltr_count,
+				      hp_layers, hb_layers, is_hybrid_hp, hfi_codec);
+
+	return num_buf_recon;
+}
+
+static u32 msm_vidc_encoder_comv_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	u32 width, height, num_recon = 0;
+	struct v4l2_format *f;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	num_recon = msm_vidc_get_recon_buf_count(inst);
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_COMV_H264E(size, width, height, num_recon);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_COMV_H265E(size, width, height, num_recon);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_non_comv_size_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 size = 0;
+	u32 width, height, num_vpp_pipes;
+	struct v4l2_format *f;
+
+	core = inst->core;
+
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_NON_COMV_H264E(size, width, height, num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_NON_COMV_H265E(size, width, height, num_vpp_pipes);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_line_size_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 size = 0;
+	u32 width, height, pixfmt, num_vpp_pipes;
+	bool is_tenbit = false;
+	struct v4l2_format *f;
+
+	core = inst->core;
+	num_vpp_pipes = core->capabilities[NUM_VPP_PIPE].value;
+	pixfmt = inst->capabilities[PIX_FMTS].value;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+	is_tenbit = (pixfmt == MSM_VIDC_FMT_P010 || pixfmt == MSM_VIDC_FMT_TP10C);
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_LINE_H264E(size, width, height, is_tenbit, num_vpp_pipes);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_LINE_H265E(size, width, height, is_tenbit, num_vpp_pipes);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_dpb_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	u32 width, height, pixfmt;
+	struct v4l2_format *f;
+	bool is_tenbit;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	pixfmt = inst->capabilities[PIX_FMTS].value;
+	is_tenbit = (pixfmt == MSM_VIDC_FMT_P010 || pixfmt == MSM_VIDC_FMT_TP10C);
+
+	if (inst->codec == MSM_VIDC_H264)
+		HFI_BUFFER_DPB_H264E(size, width, height);
+	else if (inst->codec == MSM_VIDC_HEVC)
+		HFI_BUFFER_DPB_H265E(size, width, height, is_tenbit);
+
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_arp_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+
+	HFI_BUFFER_ARP_ENC(size);
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_vpss_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 size = 0;
+	bool ds_enable = false, is_tenbit = false;
+	u32 rotation_val = HFI_ROTATION_NONE;
+	u32 width, height, driver_colorfmt;
+	struct v4l2_format *f;
+
+	ds_enable = is_scaling_enabled(inst);
+	msm_vidc_v4l2_to_hfi_enum(inst, ROTATION, &rotation_val);
+
+	f = &inst->fmts[OUTPUT_PORT];
+	if (is_rotation_90_or_270(inst)) {
+		/*
+		 * output width and height are rotated,
+		 * so unrotate them to use as arguments to
+		 * HFI_BUFFER_VPSS_ENC.
+		 */
+		width = f->fmt.pix_mp.height;
+		height = f->fmt.pix_mp.width;
+	} else {
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
+	}
+
+	f = &inst->fmts[INPUT_PORT];
+	driver_colorfmt = v4l2_colorformat_to_driver(inst,
+						     f->fmt.pix_mp.pixelformat, __func__);
+	is_tenbit = is_10bit_colorformat(driver_colorfmt);
+
+	HFI_BUFFER_VPSS_ENC(size, width, height, ds_enable, 0, is_tenbit);
+	i_vpr_l(inst, "%s: size %d\n", __func__, size);
+	return size;
+}
+
+static u32 msm_vidc_encoder_output_size_iris3(struct msm_vidc_inst *inst)
+{
+	u32 frame_size;
+	struct v4l2_format *f;
+	bool is_ten_bit = false;
+	int bitrate_mode, frame_rc;
+	u32 hfi_rc_type = HFI_RC_VBR_CFR;
+	enum msm_vidc_codec_type codec;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	codec = v4l2_codec_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+	if (codec == MSM_VIDC_HEVC)
+		is_ten_bit = true;
+
+	bitrate_mode = inst->capabilities[BITRATE_MODE].value;
+	frame_rc = inst->capabilities[FRAME_RC_ENABLE].value;
+	if (!frame_rc)
+		hfi_rc_type = HFI_RC_OFF;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		hfi_rc_type = HFI_RC_CQ;
+
+	HFI_BUFFER_BITSTREAM_ENC(frame_size, f->fmt.pix_mp.width,
+				 f->fmt.pix_mp.height, hfi_rc_type, is_ten_bit);
+
+	return frame_size;
+}
+
+struct msm_vidc_buf_type_handle {
+	enum msm_vidc_buffer_type type;
+	u32 (*handle)(struct msm_vidc_inst *inst);
+};
+
+int msm_buffer_size_iris3(struct msm_vidc_inst *inst,
+			  enum msm_vidc_buffer_type buffer_type)
+{
+	int i;
+	u32 size = 0, buf_type_handle_size = 0;
+	const struct msm_vidc_buf_type_handle *buf_type_handle_arr = NULL;
+	static const struct msm_vidc_buf_type_handle dec_buf_type_handle[] = {
+		{MSM_VIDC_BUF_INPUT,           msm_vidc_decoder_input_size              },
+		{MSM_VIDC_BUF_OUTPUT,          msm_vidc_decoder_output_size             },
+		{MSM_VIDC_BUF_BIN,             msm_vidc_decoder_bin_size_iris3          },
+		{MSM_VIDC_BUF_COMV,            msm_vidc_decoder_comv_size_iris3         },
+		{MSM_VIDC_BUF_NON_COMV,        msm_vidc_decoder_non_comv_size_iris3     },
+		{MSM_VIDC_BUF_LINE,            msm_vidc_decoder_line_size_iris3         },
+		{MSM_VIDC_BUF_PERSIST,         msm_vidc_decoder_persist_size_iris3      },
+		{MSM_VIDC_BUF_DPB,             msm_vidc_decoder_dpb_size_iris3          },
+	};
+	static const struct msm_vidc_buf_type_handle enc_buf_type_handle[] = {
+		{MSM_VIDC_BUF_INPUT,           msm_vidc_encoder_input_size              },
+		{MSM_VIDC_BUF_OUTPUT,          msm_vidc_encoder_output_size_iris3       },
+		{MSM_VIDC_BUF_BIN,             msm_vidc_encoder_bin_size_iris3          },
+		{MSM_VIDC_BUF_COMV,            msm_vidc_encoder_comv_size_iris3         },
+		{MSM_VIDC_BUF_NON_COMV,        msm_vidc_encoder_non_comv_size_iris3     },
+		{MSM_VIDC_BUF_LINE,            msm_vidc_encoder_line_size_iris3         },
+		{MSM_VIDC_BUF_DPB,             msm_vidc_encoder_dpb_size_iris3          },
+		{MSM_VIDC_BUF_ARP,             msm_vidc_encoder_arp_size_iris3          },
+		{MSM_VIDC_BUF_VPSS,            msm_vidc_encoder_vpss_size_iris3         },
+	};
+
+	if (is_decode_session(inst)) {
+		buf_type_handle_size = ARRAY_SIZE(dec_buf_type_handle);
+		buf_type_handle_arr = dec_buf_type_handle;
+	} else if (is_encode_session(inst)) {
+		buf_type_handle_size = ARRAY_SIZE(enc_buf_type_handle);
+		buf_type_handle_arr = enc_buf_type_handle;
+	}
+
+	/* handle invalid session */
+	if (!buf_type_handle_arr || !buf_type_handle_size) {
+		i_vpr_e(inst, "%s: invalid session %d\n", __func__, inst->domain);
+		return size;
+	}
+
+	/* fetch buffer size */
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	/* handle unknown buffer type */
+	if (i == buf_type_handle_size) {
+		i_vpr_e(inst, "%s: unknown buffer type %#x\n", __func__, buffer_type);
+		goto exit;
+	}
+
+	i_vpr_l(inst, "buffer_size: type: %11s,  size: %9u\n", buf_name(buffer_type), size);
+
+exit:
+	return size;
+}
+
+static int msm_vidc_input_min_count_iris3(struct msm_vidc_inst *inst)
+{
+	u32 input_min_count = 0;
+	u32 total_hb_layer = 0;
+
+	if (is_decode_session(inst)) {
+		input_min_count = MIN_DEC_INPUT_BUFFERS;
+	} else if (is_encode_session(inst)) {
+		total_hb_layer = is_hierb_type_requested(inst) ?
+			inst->capabilities[ENH_LAYER_COUNT].value + 1 : 0;
+		if (inst->codec == MSM_VIDC_H264 &&
+		    !inst->capabilities[LAYER_ENABLE].value) {
+			total_hb_layer = 0;
+		}
+		HFI_IRIS3_ENC_MIN_INPUT_BUF_COUNT(input_min_count,
+						  total_hb_layer);
+	} else {
+		i_vpr_e(inst, "%s: invalid domain %d\n", __func__, inst->domain);
+		return 0;
+	}
+
+	return input_min_count;
+}
+
+static int msm_buffer_dpb_count(struct msm_vidc_inst *inst)
+{
+	int count = 0;
+
+	/* encoder dpb buffer count */
+	if (is_encode_session(inst))
+		return msm_vidc_get_recon_buf_count(inst);
+
+	/* decoder dpb buffer count */
+	if (is_split_mode_enabled(inst)) {
+		count = inst->fw_min_count ?
+			inst->fw_min_count : inst->buffers.output.min_count;
+	}
+
+	return count;
+}
+
+int msm_buffer_min_count_iris3(struct msm_vidc_inst *inst,
+			       enum msm_vidc_buffer_type buffer_type)
+{
+	int count = 0;
+
+	switch (buffer_type) {
+	case MSM_VIDC_BUF_INPUT:
+		count = msm_vidc_input_min_count_iris3(inst);
+		break;
+	case MSM_VIDC_BUF_OUTPUT:
+		count = msm_vidc_output_min_count(inst);
+		break;
+	case MSM_VIDC_BUF_BIN:
+	case MSM_VIDC_BUF_COMV:
+	case MSM_VIDC_BUF_NON_COMV:
+	case MSM_VIDC_BUF_LINE:
+	case MSM_VIDC_BUF_PERSIST:
+	case MSM_VIDC_BUF_ARP:
+	case MSM_VIDC_BUF_VPSS:
+		count = msm_vidc_internal_buffer_count(inst, buffer_type);
+		break;
+	case MSM_VIDC_BUF_DPB:
+		count = msm_buffer_dpb_count(inst);
+		break;
+	default:
+		break;
+	}
+
+	i_vpr_l(inst, "  min_count: type: %11s, count: %9u\n", buf_name(buffer_type), count);
+	return count;
+}
+
+int msm_buffer_extra_count_iris3(struct msm_vidc_inst *inst,
+				 enum msm_vidc_buffer_type buffer_type)
+{
+	int count = 0;
+
+	switch (buffer_type) {
+	case MSM_VIDC_BUF_INPUT:
+		count = msm_vidc_input_extra_count(inst);
+		break;
+	case MSM_VIDC_BUF_OUTPUT:
+		count = msm_vidc_output_extra_count(inst);
+		break;
+	default:
+		break;
+	}
+
+	i_vpr_l(inst, "extra_count: type: %11s, count: %9u\n", buf_name(buffer_type), count);
+	return count;
+}
-- 
2.7.4

