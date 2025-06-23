Return-Path: <linux-arm-msm+bounces-62042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DAAE3D5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC4C3AC66B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D840248861;
	Mon, 23 Jun 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B92V3qmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A12417D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675886; cv=none; b=Q4LZxX+BGNCFmR6Nsq1LwweQsL4YtWBeOEn531+x3Xt1+yj27PTcE6f9CjiWnlsiUNleUjMjxN+XVpZBXW1loPzLT5EnG5FSNaLSbZXdXsUz2URQ6wYOQqKPgvzcCJi0Srnt2w0E2OqP/s/DyWx+x68ll9OONlpi9b89m7kWaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675886; c=relaxed/simple;
	bh=9LSytQPyTFkBJt9YzIaXb6/U5LogpeOg/rPyGmYojDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eTn7KZK6D73nfpIrthEqnePVXbXiaiyP7bVIYJMlDD0eGD2Didh+iN76/xCvKkFe5n5Fy28pBxa0jaL83SMfSwlIqoPnthlczUTQZe++oihkTARnWoLvoB1riW2uRGGDgac6F33QU/l3NvJDLGJkd/30MRAn8KTtmOJwjLQPmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B92V3qmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9ad12030835
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x740bfZ74Zy
	o3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=; b=B92V3qmrptzyRQR/uuYnYG1uFU3
	pKwMZtAwz/Z5F3DO5CL8OG7Jq6CRyhYkTpht4aB3tmc5rTodS8PLEXteQJ6sTmsl
	NVkaK4+l/lBCNuPsT1DjXq1QeCpOcXuF/UyHgoSR2wtllqxh7QDpYSO21694LBmd
	bWwrihhcqAs85ZpCkUQ9Y52CXv/+SN2j0eZCZzy/evlLTobuP4BziZM+UIqYejp3
	bo7ySuZtxAb0NQRKeCOL87clkWfYzAYp4zwkp3n4MTU/Yc4CYxbGr2M1pMGKDry/
	yxqkWi+MHmf4OO4v7AZhuWKilAISiJbyZWnVMtN4C9RSTjkNTIThugWcwAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tm6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so663100485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675876; x=1751280676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x740bfZ74Zyo3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=;
        b=dRqc369iOgS2s2z5rPnpRRegaxyw7B674ovQJw4wCUBm7VuNc9TKqWUSgomzHgwgqm
         u7EAbGRGo0Xqe7oM3djZQ2OI/GXaWHFQpqdhB3TieKJJ+QOQ0i2kW4u26+5qZWFWI32U
         WRkJUZrzPRb0PYVN9PKwh8bK+zV1zRzgooNo3Aqf4t3ob8hnl8kmMX6xf4iQkWoEGEij
         tq/PNS2uVlXVTQY7CDm/cdhd/I8MQrKOl68GgGNobppBr7XAmmhjCnUTtZI1sawbD5H+
         7jN680sVAdZmGznMDIt1aQKYm37qg8rlf/BmS/I23OLih8OMJ+Hf5D2se9yS6ebVo84U
         wtCA==
X-Gm-Message-State: AOJu0YzCHv8NR/mFUSju2gZYHmXzpe7Ix1hQUt9yhE3KvYM1g5kGNRR1
	tdpTpnXuw6T7OYz0aOemQOCZxUF7YtMHzUwO4qbfjU0OXnPmmF/cW8gq63IgjqIkHfKaFWYUDTi
	woZaGqTM19Jq6zu5wA70Wv077n7OLax9TM3CzVkY4e6qqHuiTTSgctzjnClPjdZRZO2Fx
X-Gm-Gg: ASbGncvB6Xg4FCS/5plwWk9azL32VgA4q9xYrGV9ORGBzENtueXCGsC2CQOcCc+qS/6
	89VnTOAAwEDoaBm5hxxs4c479j7UweaHWHxye/xea+odqvW0BMScCviZOT/sCp7zm1brjQO8DQE
	ZpJkESO2FwDFLZj2iTjPW6xnvo9owbWpEv3chnfNe+iKJoWVAOHhGKUAiJKsP8d3c9FKe2HU/AQ
	fCcE/kGkpZ6i7Iq6rIIGsUQormspTJZAhGMEfn8zGEXptc2vdXy2KJJ7AcT7ksVxUq7ea2f/+7x
	UcnfmRHNh0QWR/9bES1I8OcNBU0IpTStyw++Wwea7uTkBcm3pSdfsZ55VxPxz658G3JwJWvBNVy
	L
X-Received: by 2002:a05:620a:4112:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d3fc0625a9mr1406342685a.23.1750675875949;
        Mon, 23 Jun 2025 03:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFraPfCr4FC4vsti+CVOOg0GTleJvAU6FX5+6t5gE9B4Hmr3Z1tfZsKzIA7D6IFQ4f0i40f6Q==
X-Received: by 2002:a05:620a:4112:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d3fc0625a9mr1406338985a.23.1750675875371;
        Mon, 23 Jun 2025 03:51:15 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] media: venus: hfi_plat_v6_lite: Populate decode capabilities
Date: Mon, 23 Jun 2025 12:51:05 +0200
Message-Id: <20250623105107.3461661-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8xqLv0w0JLN0LJB_yUWL8uqodi61Chf0
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=685931a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hV3zkybWQsGKz9K1FyYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NCBTYWx0ZWRfXwkYAgloG+d5w
 XZYrapHotETzFA7h/UjjQc/iBi0j66YQDs87Kn3AX9pF64boo40b6bjlTn8fkjzlrepnnY0R9HJ
 lp6Kac0tA7Fejom1EyI8PNPuzY8cW4Ki2sXUJMcMgkALJeb2Pt083SugPuiHuE6TIZezuHxZQzx
 D2DxHtkYuHkdoLmheMDP53xzkx/uAI/wXddrk8wsSMgZF80nFQksB+LpeBPYdNulOCX0hV1PNLl
 ag7x5pu8d72Xa73V0js5koaY1Hop6F/nfWWeVhRwlb3xNOChtHjGqHj6DUntx22fBmqVEJO73bk
 QTRNaEilyo1EJ11ij4fqxjgtogG99ploCd2m4Fu+yBCP7M7iMC1cM5HLgNRm4MrrqJFMytbV76n
 Xyr58hVzRaoUTstfRxkFQxxrB1MIomeoxfGAG0P445Pp9gPrv+yY8AfGTpYw+2BRxMirD9Cb
X-Proofpoint-GUID: 8xqLv0w0JLN0LJB_yUWL8uqodi61Chf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230064

Add hfi platform file with decoding capabilities for hfi v6_lite.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 91ee6be10292..4a6a942db58b 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
 		   hfi_parser.o pm_helpers.o dbgfs.o \
 		   hfi_platform.o hfi_platform_v4.o \
-		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
+		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 643e5aa138f5..f56b8f9946d7 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 		return &hfi_plat_v4;
 	case HFI_VERSION_6XX:
 		return &hfi_plat_v6;
+	case HFI_VERSION_6XX_LITE:
+		return &hfi_plat_v6_lite;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index ec89a90a8129..6356e4bd0de2 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -58,6 +58,7 @@ struct hfi_platform {
 
 extern const struct hfi_platform hfi_plat_v4;
 extern const struct hfi_platform hfi_plat_v6;
+extern const struct hfi_platform hfi_plat_v6_lite;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
 unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
new file mode 100644
index 000000000000..41958a3e353b
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+
+static const struct hfi_plat_caps caps[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP9,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
+	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+} };
+
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+{
+	*entries = ARRAY_SIZE(caps);
+	return caps;
+}
+
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+{
+	*enc_codecs = 0x0;
+	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+		      HFI_VIDEO_CODEC_VP9;
+	*count = 3;
+}
+
+static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+};
+
+static const struct hfi_platform_codec_freq_data *
+get_codec_freq_data(u32 session_type, u32 pixfmt)
+{
+	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
+	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
+	const struct hfi_platform_codec_freq_data *found = NULL;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt &&
+		    data[i].session_type == session_type) {
+			found = &data[i];
+			break;
+		}
+	}
+
+	return found;
+}
+
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vpp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vsp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->low_power_freq;
+
+	return 0;
+}
+
+const struct hfi_platform hfi_plat_v6_lite = {
+	.codec_vpp_freq = codec_vpp_freq,
+	.codec_vsp_freq = codec_vsp_freq,
+	.codec_lp_freq = codec_lp_freq,
+	.codecs = get_codecs,
+	.capabilities = get_capabilities,
+	.bufreq = hfi_plat_bufreq_v6,
+};
-- 
2.34.1


