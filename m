Return-Path: <linux-arm-msm+bounces-74223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E898B8A626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3275622C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4014731E11C;
	Fri, 19 Sep 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlvi9q7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFBC31DDA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296849; cv=none; b=qWhMpkmqnAzAoQyp7U14oHD1d1Z7YuhwHBSBrvP2g45ZShe6TrCMdsLxFHGtjJD/63BGpoeC6YUBi7ITAL1DgauckRI7+7vSQFnPRA/yNFr1W/pSeG0N3sxQwWQlOEacZDvZS7ihXBPCHwA+IoqEkKuvrn/8vxpmRlJBDbj1bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296849; c=relaxed/simple;
	bh=pvA9B8xouilqj6LVGldwlEFgo473mWlgYnVE0v+fEnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUKEEMu7VeCAOa66iOkRmMgg18BkJWubPZw7zWHhRpJ49u/eSMVdZ5zPSoWA4XJHrfHsmSijAVXEGplrG4XYEbI0bY/jmI5y6b5cIvGX7dV+cmz1wch76xnd0B3roy3o9cQasvi57VwtZhEZ7hUfkWlmReGvLDhNTfZij3wmxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlvi9q7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEMHkp001743
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POUB2eB1EiyEuqKZfElV0lPlWDPwpWcu65I5G0yup7Q=; b=dlvi9q7aUh6Gt+0j
	EtXrvZiZmmkAiZKsN1nnOyeOCxBW4uoBBWZyP9+3a1bNwPsZ1x1v7EZlQXI8VwHD
	Lye7UH4ECWz3TjPeYULu7QkFf7pzaDEgkGd9eVi9eONinNUvC27v31X/eCN/4uC/
	FAQ7P1+tjSd72QQJimgVND7jPXMlH8qm3XJaCpVInp0vnlq4j+bQfA4leydAP6HL
	9jqTib/vunE8Cutx9qAG0Vgg+tEWgb7IlEYMpP9pL4ib7xvaO8lyhKWu914wPC2s
	/jUQw8/qkst3wLPZR/rUykPfRTHfAA3fqmeHZopS3zV/kMUdzn8d7RuPfA2T0zkP
	N+WLVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytyfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77df7f0d7a3so1410478b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 08:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296846; x=1758901646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POUB2eB1EiyEuqKZfElV0lPlWDPwpWcu65I5G0yup7Q=;
        b=SL8Bu0KoEZvdy7wgvHTgcLO9HKKCDIYNXDC/8BQmAUxR20Gu2UHRP0Qa7SJsISnupF
         wmacSg5DpZz+tHwalU35P7sRPHMeOfI5T5jTvILRtnN104mf9uWW/Kxv58zSrQMGUG1K
         whd44YIbYpv4kkrwUXQnpGYG9rGfHFwfkzjxwvl9AZwYYUAuEqzwefv981OYLRjeFf/8
         X7sqDjmpfEgNGwIGpWuddRUg+jGy5o5AiiBOI5OgeXKxGdnbU4HZjAA8DC7jfycoWuvq
         62japw3SmU/Kp2aFDrLrbiKVg29lvQZEV2uH64Tqtrz8ZoxHKSsbXiHduQFLSPi6/1NN
         9llA==
X-Forwarded-Encrypted: i=1; AJvYcCUzx3R43kF86NX2ZWoG0JLJT7LlC3qaITkYal/GpttJaDpO1hww3aPHn8niettqqTl4AgHuXNLm7oVgZ3HI@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVHOiCI74Di8aUCWvfmeTqhn1Umycvx0M+/quRGQz4QJGkn5g
	ICa659veSFnPt2ZfGWuJGQS7J5nk5IlPQqt/mgAuzBa7wmzLuaU6Gk4T8KOMaCCWXEGzyoefv24
	Reuv+UVnuh4ZV7WuX+GD58ZEW+rZn9QHVW8qEA18C3Z5eSWR5bRisbaqGLk00rYv2T6Q7
X-Gm-Gg: ASbGncuwqDyKQbF35G0HMuxDr9mgzBrhCTwc3tEdxt2u28UEhhlPPvnLnwcm2DvPsYU
	OvQIXJFK5MV84l933bKXi1vKhiIo5HV41glGaQZe1xMv89Tc5lcj2d4p54u72svXpm1o3IJ2xTf
	Gq0WcIKunXkc8ozGNDkYKFGHPUqGt6H0I/Faptn1DAT5MfKVycYnSjiGFE7z7Iwv+DjHHSsOIFH
	8Duz4G5I6wdPl9Zx0y4oXWHiSFFm7+HVCwc1CLzJuWPVWenwY82gXs7hTDlzVx0eP6f5JyJZgWN
	agnL8Oxokc/ilNXzd1TU/50Hku/bDbdKdnjH4JVkWAsRlYNc6Wx7qRWKMssubD3LG6oAQs3FPV2
	2YA==
X-Received: by 2002:a05:6a20:1586:b0:263:8788:f0c4 with SMTP id adf61e73a8af0-2925c369f14mr5454577637.12.1758296845256;
        Fri, 19 Sep 2025 08:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIVdBa6vt3Y4VATWImfZd6EK6MXLAnJqt6+nigu5j3r7ls005pSNs6F7O/ZMec//MFS2632g==
X-Received: by 2002:a05:6a20:1586:b0:263:8788:f0c4 with SMTP id adf61e73a8af0-2925c369f14mr5454534637.12.1758296844623;
        Fri, 19 Sep 2025 08:47:24 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm5706653b3a.36.2025.09.19.08.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:47:24 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 21:17:16 +0530
Subject: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758296838; l=12597;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=pvA9B8xouilqj6LVGldwlEFgo473mWlgYnVE0v+fEnQ=;
 b=NeHbaTCBpvmQFMnJpcAZr14RfJUX2OV9Kk+CUbhMlQv57Vie0qCUKnR/vxu4iZEDN7tc0fHCG
 UAcP8Wf72irC2oE22PEEOyDlLlbxFFXDwCxzp3tKx8NE12t+J2E3swA
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd7b0e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RJhurUOXKBuHq34M8EMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: L12bvBV-cdqNC5TxePIt85W1DFkB0MYr
X-Proofpoint-ORIG-GUID: L12bvBV-cdqNC5TxePIt85W1DFkB0MYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9mGgy/4klbQd
 hmPPMJvWPC7w00hdrfnAAQZ4ZCPYM61Tsa9UVstOx3CqDwVMK+wwFQ2TOvzSvHxF+Qemve36xJ5
 Xs6wyxJG04ybGjTFbkUjRm0ZipQFa8s1qmYIPwtWG+OIy6EfHAg1YO0KSEWXkh86S5VTS+mYNFa
 ZhJkYnIZZbbiiq7DxVWcxhVvjKXLdLcha9NpS8hsF5wYzUUhW/N7iQ5/RoF3gToLe53aUqY0Do8
 /UPAy8q4Isoq0d8cb/mW4e75cb+VnYPlkIyxntaHotR+XCdCX8cL3qrRkid4yAdojfzUqUemTaS
 6fyQV1lqKyVB4sh0UDUyHOunYf7qTT1P2WxILV5l1gDsfSGpw5wOCw28vB9I+pckSLgOQx13HWI
 Dj1xDvt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Introduce handling for the QC08C format in the decoder.
Update format checks and configuration to enable decoding of QC08C
streams.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
 8 files changed, 89 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
 		case BUF_INPUT:
 			return iris_dec_bitstream_buffer_size(inst);
 		case BUF_OUTPUT:
-			return iris_yuv_buffer_size_nv12(inst);
+			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+				return iris_yuv_buffer_size_qc08c(inst);
+			else
+				return iris_yuv_buffer_size_nv12(inst);
 		case BUF_DPB:
 			return iris_yuv_buffer_size_qc08c(inst);
 		default:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
 		if (iris_split_mode_enabled(inst)) {
 			fmt.buffer_type = HFI_BUFFER_OUTPUT;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
-				HFI_COLOR_FORMAT_NV12_UBWC : 0;
+			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 			if (ret)
 				return ret;
 
 			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 		} else {
 			fmt.buffer_type = HFI_BUFFER_OUTPUT;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 		}
@@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
 	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
 	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
 
+	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+		return 0;
+
 	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
 	pconstraint.num_planes = 2;
 	pconstraint.plane_format[0].stride_multiples = 128;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
+	u32 opb_enable = iris_split_mode_enabled(inst);
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_OPB_ENABLE,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32,
+						  &opb_enable,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
@@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
+			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	} else {
 		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
 		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
@@ -527,6 +542,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
 		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
 		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
+		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_OPB_ENABLE			0x03000184
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -15,12 +15,17 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 
-enum iris_fmt_type {
+enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
 	IRIS_FMT_VP9,
 };
 
+enum iris_fmt_type_cap {
+	IRIS_FMT_NV12,
+	IRIS_FMT_UBWC,
+};
+
 struct iris_fmt {
 	u32 pixfmt;
 	u32 type;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
 };
 
 static const u32 sm8550_vdec_output_config_params[] = {
+	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
 
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
-	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
+	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
+		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats[] = {
+static const struct iris_fmt iris_vdec_formats_out[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
@@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
 	},
 };
 
+static const struct iris_fmt iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = {
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	[IRIS_FMT_UBWC] = {
+		.pixfmt = V4L2_PIX_FMT_QC08C,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+};
+
 static const struct iris_fmt *
 find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
-	const struct iris_fmt *fmt = iris_vdec_formats;
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
 	unsigned int i;
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_vdec_formats_out;
+		size = ARRAY_SIZE(iris_vdec_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_vdec_formats_cap;
+		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	for (i = 0; i < size; i++) {
 		if (fmt[i].pixfmt == pixfmt)
@@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 static const struct iris_fmt *
 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = iris_vdec_formats;
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_vdec_formats_out;
+		size = ARRAY_SIZE(iris_vdec_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_vdec_formats_cap;
+		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	if (index >= size || fmt[index].type != type)
 		return NULL;
@@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (f->index)
+		fmt = find_format_by_index(inst, f->index, f->type);
+		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = V4L2_PIX_FMT_NV12;
+		f->pixelformat = fmt->pixfmt;
 		break;
 	default:
 		return -EINVAL;
@@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+		if (!fmt) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+			return -EINVAL;
+
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
-			return -EINVAL;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
 		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
@@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
 	const struct iris_fmt *fmt = NULL;
 
-	if (pixelformat != V4L2_PIX_FMT_NV12) {
+	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!fmt) {
 		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 		if (!fmt)
 			return -EINVAL;

-- 
2.34.1


