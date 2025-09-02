Return-Path: <linux-arm-msm+bounces-71695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2EB4108A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 01:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45ACF1B64AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655492EA74B;
	Tue,  2 Sep 2025 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnPKGK24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70962E92CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854036; cv=none; b=oSgCBXkrXi2ZEP7NuIviGYXtigatUvDHDB1lQP9kqkfU/SJeEn7h5lGFBaeK/Q7StbGYPPL045xPmn77QqGnDt1XaR9FnLHUslFPUJ/8Hv/PKiFRK5ZtSJHvGIsnfIr1ZfyoU827ZQjoLu23YxPdI3AmTnwqBDk5CbBMTEWBKwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854036; c=relaxed/simple;
	bh=2ZtRO/m8tsfRHQKfyFUcquWj/vnRMD+wrJDWarCI3KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es/NX0yhm/1/XM0Bif21c/PCgiBw9aPgQ0eY7QqqRTgsuyLHS7vlC1InogwnF76RbkMpDcivuxfNNgD+SoP1oU5cogivp5VubWLuhnXDVAYgskX6+TOscDicZQ5rE8YwqPczT5s1lU6w191jp7Rw3m7GuFupYV/agEgKF7LesY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnPKGK24; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAYY018247
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 23:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSHHRxy+PjuuV1IGRHlcjhOvpzS/KRsdT5mc58euYVg=; b=RnPKGK245TSc4uXO
	H/SkKm+G0hHT9bw64Xaeb2qhDhEYljCMUsC8kdsV+kLScDs1L5py8YzERdVkNrJ4
	UNWlAfmNTbevS0KxXdTAauHeLqmpVfYsRGXoliCUnnSXBWdDwZ2VXXkj8mhweOFR
	EhWAWiXfR5i0JHt0M1MHmIwTPL4EuvfKRgj6TCiDlGrX1jtF8aXPAsfNHGtmVdq1
	wRPxyPlSSdNUGaSROmfY5gdHHo2JtbdFvI+kuAfrvNgWklcLv+KeLMo8FD9xyvVu
	rUX1IvtAuWsTdaa5SD0MnBxKN0iDiRa+9931/0F0pP5tlsjYx7xApuRiMWnrns3o
	hfcFvA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwb6v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 23:00:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4c75141882so770599a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854032; x=1757458832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSHHRxy+PjuuV1IGRHlcjhOvpzS/KRsdT5mc58euYVg=;
        b=nd7FARhxiTRFUEWHJw4PsR/ouSDlpWbyWtlHzTXpJYgUxRPlLUKAA3B+e3GEIiEQ2w
         4M2zYpThoh9ihZUzpTCXoD7ut4mbS/q0r8SlgcLb95yXHWC7ktSjKovqPtkQH0BT/CaM
         /GnNe/8J1Nqkxzl32pIXjPrDk2dk3NCn75aIuPOn0g1CvbnlIA+uhYDOfwrmZJy+Z42e
         B+cexTWbBAEbawe3FqsjXdoWouSGnjddrxHNjxAGOEf0DtWF1v7DdeesL78cV4bO/Ubb
         MdjxFMxJRldsFj/JoKkWJy1R0J70vkiA4C/2vbPLVFSDy8KTsrOJjZ+rXF5z80TamHbM
         SzOw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjx38gJ/M7HKCgmxjvo9pAbdowo40daIBXzJGQJWW1hJ/sHV1lJtIMPkilSnChxU3YV72bGD/G/BEVhxG@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWeBzJWU9brXFoaPfSoMPHT2M0xD800vMsvgAswrSSw47/9tD
	2i89m5qs3pSYPHtieQFimCcZkJWI6wRlBXMLHzk+bKxo4RGQ/Z0TuofilHRJmYaCdj9K7zqHoVB
	ypSEfE2E2uFUT8ApIbzhIJ2vOTGq8C9FJdXEA3B2kTwOm/lLih0v275N3tSZUNqWZzEKX
X-Gm-Gg: ASbGncvxbmTkYfgl+JkrJWWCy/vVuAujsfvxMyHxMpd8z3/u7u6K9OqGYM4FrlJ1H6y
	2SeGZH0zjHYU24zXEearMVyzG7L1VVogFzRQExdb27aF3ZijYq2dgFxoCI2tUDIVe0PlpyXtUqx
	vNrkn3Z6ns7KK6SoPCQnPaULYgcHi7GgcrmKGh6rC4C7L3hEO7v+gMeWdb0XkH/9UIj7CGXJ7Ib
	GA5N0DRCO1bsw+Fum9vqMtlCUyJDGgkA1fM+x5QZsZvnEfwG390CkDRGLHBZ+jJb1EOPtulUZNt
	sbwuXfS2Mgz0yiyC49y56TSW646QnPhd7j2LYUM/RTqiXVRz7BWMDUovDJQAiWQOlKX0qAThP7q
	Zs6OsY+3SM2EzuUsIlMWXe4mH
X-Received: by 2002:a17:90b:4a90:b0:325:cce7:f661 with SMTP id 98e67ed59e1d1-327f5b1c87dmr11365588a91.1.1756854029997;
        Tue, 02 Sep 2025 16:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnSK0SPYINSicqZ+jOba1bc9+A0SxDYpIs9MjwUwXezKhepQdCkzGb99axnfF7hVsfXV0gNw==
X-Received: by 2002:a17:90b:4a90:b0:325:cce7:f661 with SMTP id 98e67ed59e1d1-327f5b1c87dmr11365498a91.1.1756854028710;
        Tue, 02 Sep 2025 16:00:28 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32a698ad4c1sm1875866a91.5.2025.09.02.16.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:00:28 -0700 (PDT)
From: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 16:00:07 -0700
Subject: [PATCH RFC 5/5] media: iris: Define AV1-specific platform
 capabilities and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rfc_split-v1-5-47307a70c061@oss.qualcomm.com>
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
In-Reply-To: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756854022; l=14729;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2ZtRO/m8tsfRHQKfyFUcquWj/vnRMD+wrJDWarCI3KI=;
 b=IBaX8Y8tG8Fz1DItSl9p5jLCGReUJmkv913ed+YMJug1dUUfjfhf+Z+KJHuAmtfozTh5D5cOh
 kmKj+YxvdFWArlFkPP1mjuDqcVZP+x5xlkaa6Ls4srx/Hjf8reevEVN
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXxGBlVFDgcZaw
 UznE19CBffE9DDfRBlnM+tK+MatS8dWhclQxLJarUsFOTrSoNDCVtETV1JTW/m4sXk4jIMX0ETY
 4jK/pJMWc53TSRyunHicxZp0WxO2keph5vT4MFB5rizM9LBZIf6rRHe1A6lE/0dDhqwqwlTylmh
 kVTWF/LYhZaWiANsQvbP8+ZcUq7US69wTSvGPJ9vH0Q5g+tp4G6s4giF0+Gpq6f0Z4HxmQjdVDe
 3FcLYF988r5FkgoyrcQGwYThwum3U3NNKyyiFEnINENzPZZ2a57o5CHb2avWKPpFZAVcNcalfKd
 30P/EDU/d6+Dz1FrkF6KAo9i2/khHvWDIO7mRZ4n6FOFlWPbgsj52Qnes9Y+SZ3W/rSTEIQQpgq
 hah0gtPn
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b77711 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=WozdMtv4ce4I7T1ONSgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: lYKh86svuqkwGnenBnup9XEuR5IFpuKH
X-Proofpoint-ORIG-GUID: lYKh86svuqkwGnenBnup9XEuR5IFpuKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Defining platform specific capabilities specific to AV1 decoder.
Set and subscribe to manadatory properties to firmware for AV1.

Signed-off-by: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  19 +++
 .../platform/qcom/iris/iris_platform_common.h      |  13 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 132 ++++++++++++++++++++-
 6 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
+		return PROFILE_AV1;
+	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
+		return LEVEL_AV1;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case PROFILE_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
+	case LEVEL_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,9 @@ struct hfi_subscription_params {
 	u32	profile;
 	u32	level;
 	u32	tier;
+	u32	drap;
+	u32	film_grain;
+	u32	super_block;
 };
 
 u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index bbfe7a0851ea94fb7041a868b4df8b2ec63bf427..9cc0989c67d74a9e051725e9ee571a2ab9160519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -89,9 +89,18 @@ enum hfi_seq_header_mode {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
+#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
+#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
+#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
+#define HFI_PROP_AV1_OP_POINT				0x03000182
+#define HFI_PROP_OPB_ENABLE                 0x03000184
+#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
+#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
+#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 943d3884248fafccc3b8e944e455c96124914353..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -599,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
 		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
+		break;
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
@@ -611,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
 
+	if (inst->codec == V4L2_PIX_FMT_AV1) {
+		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
+		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
+	}
+
 	inst->fw_min_count = subsc_params.fw_min_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
@@ -714,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 	case HFI_PROP_NO_OUTPUT:
 		inst_hfi_gen2->hfi_frame_info.no_output = 1;
 		break;
+	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
+		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
+		break;
+	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
+		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
+		break;
 	case HFI_PROP_QUALITY_MODE:
 	case HFI_PROP_STAGE:
 	case HFI_PROP_PIPE:
@@ -844,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
 		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
+		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
+		break;
 	}
 
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 99057a624cb976af68403ef042173b5ebefde8af..e543a3cc142b15e50b12cfe672d00dd0acfdb4d1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -95,6 +95,13 @@ enum platform_inst_fw_cap_type {
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
+	PROFILE_AV1,
+	LEVEL_AV1,
+	TIER_AV1,
+	DRAP,
+	FILM_GRAIN,
+	SUPER_BLOCK,
+	ENH_LAYER_COUNT,
 	INPUT_BUF_HOST_MAX_COUNT,
 	OUTPUT_BUF_HOST_MAX_COUNT,
 	STAGE,
@@ -231,8 +238,12 @@ struct iris_platform_data {
 	unsigned int dec_input_config_params_hevc_size;
 	const u32 *dec_input_config_params_vp9;
 	unsigned int dec_input_config_params_vp9_size;
+	const u32 *dec_input_config_params_av1;
+	unsigned int dec_input_config_params_av1_size;
 	const u32 *dec_output_config_params;
 	unsigned int dec_output_config_params_size;
+	const u32 *dec_output_config_params_av1;
+	unsigned int dec_output_config_params_av1_size;
 	const u32 *enc_input_config_params;
 	unsigned int enc_input_config_params_size;
 	const u32 *enc_output_config_params;
@@ -245,6 +256,8 @@ struct iris_platform_data {
 	unsigned int dec_output_prop_hevc_size;
 	const u32 *dec_output_prop_vp9;
 	unsigned int dec_output_prop_vp9_size;
+	const u32 *dec_output_prop_av1;
+	unsigned int dec_output_prop_av1_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c0a03c03bb9349a0e551ce6dc72b6f8b23ff696d..4c2ffe3ceecc88bb3c1830357ae27cdafb53791b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -61,6 +61,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = PROFILE_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
+		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = PROFILE_VP9,
 		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
@@ -144,6 +154,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
+		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
+		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = TIER,
 		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
@@ -155,6 +192,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = TIER_AV1,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = DRAP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = FILM_GRAIN,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+		.flags = CAP_FLAG_VOLATILE,
+	},
+	{
+		.cap_id = SUPER_BLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	},
+	{
+		.cap_id = ENH_LAYER_COUNT,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_OP_POINT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,
@@ -698,6 +782,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 	HFI_PROP_LEVEL,
 };
 
+static const u32 sm8550_vdec_input_config_param_av1[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
 static const u32 sm8550_venc_input_config_params[] = {
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_RAW_RESOLUTION,
@@ -711,6 +808,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };
 
+static const u32 sm8550_vdec_output_config_param_av1[] = {
+	HFI_PROP_OPB_ENABLE,
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+};
+
 static const u32 sm8550_venc_output_config_params[] = {
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
@@ -734,6 +837,12 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
 	HFI_PROP_PICTURE_TYPE,
 };
 
+static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+	HFI_PROP_WORST_COMPLEXITY_FACTOR,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -803,11 +912,18 @@ struct iris_platform_data sm8550_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
+	.dec_output_config_params_av1 =
+		sm8550_vdec_output_config_param_av1,
+	.dec_output_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
 	.enc_input_config_params =
 		sm8550_venc_input_config_params,
 	.enc_input_config_params_size =
@@ -828,6 +944,9 @@ struct iris_platform_data sm8550_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
@@ -896,10 +1015,18 @@ struct iris_platform_data sm8650_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_output_config_params_av1 =
+		sm8550_vdec_output_config_param_av1,
+	.dec_output_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
 
 	.enc_input_config_params =
 		sm8550_venc_input_config_params,
@@ -921,6 +1048,9 @@ struct iris_platform_data sm8650_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),

-- 
2.34.1


