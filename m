Return-Path: <linux-arm-msm+bounces-61235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9AAD8F05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB1D1BC40A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2CF2DA777;
	Fri, 13 Jun 2025 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju0aZhiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006991A254C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823485; cv=none; b=MqBYeMYaQKTK9JlryHSxrNDq+4AFF9npC1bKVn+UmlB4neW2nxq63ThK3ugPG4dIZXV4/aRqrBHI31LLQl+qz8MBoqZGWaEInmNO2yGyOnizVPTWunU+AaxgBXP+5o4q6qNMMGynByfGdmGt8/0li8d7liVX/ANFl6ZXJt7+Ggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823485; c=relaxed/simple;
	bh=9LSytQPyTFkBJt9YzIaXb6/U5LogpeOg/rPyGmYojDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JScj/Df3YtdT+hMydQ/86N7P40JzAQqEzOAhbzhNr55C9yKc8XUod+yXItnlqm7Yx8Zyy6lBl8ZLa3e8VW71soE3e6B1ES3hCplBl7NFUEpAOElPk4Z3oV18si/Hsdq2WO+9ZZ7gNhki7yRQ/2zndtxlG6rR1rxoqPqM9S1FZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju0aZhiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D8HQ9n029236
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x740bfZ74Zy
	o3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=; b=ju0aZhiDyvbvsaZfNBH2azwJZ7A
	Ubzfwh0xHr8I4xdZkbdQgCs3Dd49F9PUxdY3kmrm4RwakCCTQie6mOS2wTNiJcUh
	Y+n+66o+zX9YTcIWNOVUbSuDw9psHS3GGPqIql2nkJtdRPQyycVGYQMstD9uclq4
	NX4/17rE7LW7f4j1sLW+af6C/IQaS8h1CxzD/dypaHIffQj8eX9TZU+z9wlLb8qv
	ATYX67Q9aRRZZMFF4kYET+RvYjFtjxupSyTxayA9v6gTDxr+vfJgvDDVONBjv/Q5
	zdTmgLd+S3Wxfr97TTO7SCK4W9zQXUd3oWpIbgjC93ENSwKk1/cet77Dwww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6kp1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6ef72a544so39279821cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823482; x=1750428282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x740bfZ74Zyo3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=;
        b=Sdl2WFToKXjVWmoaQkNIJYeJuNcQG/4Ey/JcfUHpAQDm+QA+uaFKqeX6nX9Gt9M6Cj
         0Aj26ngtmcHL2Sb1mUy/vEPYeQacuWKZ2mfAz0T6lca0pjnPcTe9RhoMi4/1TYWSRrbT
         /n6+aZYfx8kt+WkskGCn/uZr11b+hVPMdzQoJsRByJcPYpMg4xXJYMNdp+9+z92XB6TS
         GCVGjH897DnB/eXJykvOL31l79YTvHfcLsN/nXhAVqIMEIFx+sHE5G8rsu5lFyrdeke8
         o4lsRjyREMI1FGIeX/zP3Nt06njkaD0ZMvUdDzdFvvaKxBIUx1LuwMOtSiQdbyqN9hKu
         CzeA==
X-Gm-Message-State: AOJu0YwHnXWjGJYHUdAy19nKeD+buoEHpRcXtgMHN4m36BEKjaGEzchi
	r6HObiIbwprwctM0P+Mn1j6e2ZvhlQXk1jJBl1KCrKp3rEk/eRABO2GhEhaWDmyohH/4sLGLW69
	DZ1KmHXO/nZYUVe7+JbkpWGQNn6xHCE1033E1N1ujviu7XpbBaLifHWa9qfq9204vZVItaeSwp8
	Oh
X-Gm-Gg: ASbGncurnz+M70UemMLQB28waiIkET4u+H08Y+5vLsZ5t10Hl35SLY1TSRtZJLRm1Ce
	TOrfmhyQzYEJRkQ9/wkQ2VRjBvyQZrPe1FqbMNyz1r/Ab3P0qUjl3+JTKOi1zbgIH3pazKIRqm7
	qNUGY9vfMUEOqvLrsocayxOeD7RcaeTs8Az3l+1JPbZTxmuBuDzvl1WEBBqtWmI7mNVGAIlg2Tx
	D3xzk9FHxdu6/DrESpwJG8JNx5bni3wNp/McMsaK5FnOyb3AliILLMF35IikyQ3P1VQGHQAcOGV
	zStTzZ9WvgZs/TITzxwlUhmLRdPo1xHJs8IyoIQ0afG9k8ZAaD5E+6kHAkuc9TU/cmrrTLWMHEv
	M
X-Received: by 2002:a05:622a:1b02:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4a72fe680eemr41866631cf.9.1749823481471;
        Fri, 13 Jun 2025 07:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbevzv6PguuQR1l0g0dgZ34lTnIzgLDs80v2wMOxJ6UnIl+jvAGGIIASkHXLfT1eW72IufsQ==
X-Received: by 2002:a05:6122:1809:b0:52f:4776:f6a7 with SMTP id 71dfb90a1353d-5313c860c0bmr2057695e0c.0.1749823470030;
        Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:29 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: venus: hfi_plat_v6_lite: Populate decode capabilities
Date: Fri, 13 Jun 2025 16:04:01 +0200
Message-Id: <20250613140402.3619465-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX/h20iCc+utZ8
 CCjQqaBAcr6StVYNn2tkG3YyKad2bR26lE5/pYCrFHMFjMw9+E9MGf7jKFkPJQ4bRjd/OrNpoG4
 Khuj8LP+hzsw4hK0yg2JAozvTlh4lwtzrM2apY9NHstS5YQW9ooePUysrLpQYQdWBpB/O06YfFF
 nnnRzr8pLSoHIlqAXPRXFdcVeuMaK5j0OGnNMRTjcyQLALsYCvHR/sxPJxZ8RI24fC3rj++L9G9
 UDNOr5G1xcTU76KI/691L4GNkCyourQ0vWIeGlz3YI27LvkhBU3AWDYkfTfR8VrE/Bnrd+E0djZ
 Da76JA66itLAtv0RscohzapzI91ry/HtriTiDbunyf/exHp+xFZmCX8zdZTWthfm1pMB/0XzYtZ
 69JEEIlh/1pSzLuzyHqSCPWhq1em7UOOV1gUadjN1zogdpT5jGtdkdMrMkd9/wn9G4MKDXk7
X-Proofpoint-GUID: yNT6Uyf3LpmHYW0ii7euEVjWBzF7DvkO
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684c2ffb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hV3zkybWQsGKz9K1FyYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yNT6Uyf3LpmHYW0ii7euEVjWBzF7DvkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

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


