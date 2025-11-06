Return-Path: <linux-arm-msm+bounces-80507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8ACC38FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 04:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56A11897975
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 03:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4070C2D2495;
	Thu,  6 Nov 2025 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Skes8fZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrLhBSOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E427FB37
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399857; cv=none; b=Gi7PO/u6KdjZLu8vxzTW8do2NwBj+iZ2PVlItkVeopv0Rz0LpoQkxvQBg17LXba6Q2/GLO0HkIJGyOa6Wtef8d+hZplhKoaqRZs0P8K33qGf4BPKjKX/MQFceMwj794aPcBz8/XQRINOxl+r+x3jWo6Vvuc7rjWTTOE8R/RRIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399857; c=relaxed/simple;
	bh=BpxahtdTfL5p/xIwFqdTHXv0tK55J86bKYgLYHC6cqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK+kSPJYHzlmep0NKk0mq2wNPUPe+sLunUJ31Ah1KezmkfobR9sB/+5M9k6Eor3ERIewhL+bEduDkykGVH91dERvlUWVZ4dBhyOKdf8XroMlwuww/v+GRnK2CP9WKchdw437h47TRknDWaiJcA9T0AUuOvkvluQQ5YHjin8DkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Skes8fZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrLhBSOe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF3uM1938893
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 03:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8untyUp5XVd9oafzJRcBMx5+8dRuRoZCKUc8/GlPjfo=; b=Skes8fZc6ghFYmKB
	UrXCdUzKZ8wF3+iTIfow/TzhCDRYelQfAVjYYXdgPcX7e/GrktUKdl17iRfm8JNq
	5fqEdFZv6PMV57f+Qazx7ebEHmu2qXcic5Zm220iKys0cEfqcWQUyFj+6RxSo/GL
	GSjUFXPRny0et8DNJ2ndlqFjZ6kQo0qHwklpGihHqg9TU19k7rFDoP5/bfegntw0
	37cnEC2ohU5SCMsEGCHITjT72xpqete7tXnAZb8sKu5VdJxPXI0pIirRrkVIXOrC
	lU63ysDVQqVTrKeer4Llsv67kRhFCONmBkRaMBW1tvhAZZ8gp28Qc69Ur0HOx2GJ
	MQTGFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8apgsk38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:30:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29523ed27e0so6932735ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 19:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762399852; x=1763004652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8untyUp5XVd9oafzJRcBMx5+8dRuRoZCKUc8/GlPjfo=;
        b=NrLhBSOeUTcTuu+F7LXWDssq7gNnVA86JWlSD7nFcf58qPOTLgfhLsyJbKBY/tVT35
         2TzTbxDYnDYTRQJwS8T1Z1uCuNtRPEwKrXMvjwbtsx8w+OGE3Zq4iFEXLaQsfALKwds8
         st7sgrV3L73Q/zarcVu9bx2Oy8gayaIG0NdEHkahiEsmjfaV45fDBL8roKOJ97c0yWJ1
         RxJSrjLOEQGx8sTQfYZaDDZ5PPGcpSRIG5N5xxVyb8bvpPoeeRC/pvJIthGhG7zYTTwt
         rKeBdEJixsr/eSDOAa/neMhGJISyNazvk6iL1sRiocwWhCB/UkoiyTbLa1qdUvUESmSS
         u5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762399852; x=1763004652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8untyUp5XVd9oafzJRcBMx5+8dRuRoZCKUc8/GlPjfo=;
        b=dfxUSs2xM+nTBFR3/c1P0im8Yqfjmw/66VVCRZuBwTkC376Ok53kR21Ra2pR9DOrKq
         lCZeJlAh8cm820tAxRqxozV889XsmugdlOBmbveQfuXabDuQ89LDBRKrzM07vTLPO/gn
         wNgo/yYqNe0zzQRwW6RC7NEVDMYASx+YvB2zSuEsJXOfVRxAlz7RXEYuZEWk+vqIMUpB
         gTKTKn+RKNV/AMiDv0GEbvXwmWm2f9YSs9hjRmn9gii/yLH2msr/WEpU/blo7TYEXmbn
         oOESRQc8pWrIhGIkIpcXxsYIzmZJRX88d8osEFndc1bjm+yfXAyTDUsfAoWLhqClDVZw
         brZA==
X-Forwarded-Encrypted: i=1; AJvYcCVEj3mUwBYuSbzVCB5sfXWcyjbvcIujwhhmpk1TxTRmQl+hSLyt0MCfcAgdrhm85PxYqrlpca02QCoBfqX/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyn6H9nKmXbzbWSs3cRTjlN1ecwpvoMNAckGs8gJgPl7Wtr9or
	I9cDPAchuAHKLhpGT5DeFKztE+TN+RAaf3yCP+5mx/3i3aGFRjEtURuuMDcOy2HnaMAcY65wA5s
	Xgmv3mt4gMg7dM1VeC31B1hKRsiccnfZ7Mui6LmTraEZEAQgbd2offCt36TDl+QDJqIbP
X-Gm-Gg: ASbGncvQKY/JG0ibGuWyYNFCpZej8r89RxMpAPUMaqsOC4A7qnWP8AOBkfLvtP5O9ks
	Aa49jWlbHI2rCtpHBIJkhCw7oLgenFthAedZ6RbKJOzUnTAHmIZaPAacNTx7PaB0ANDOQaXEku1
	3OB1gE2kihKJpZroCA3IlxhTASvdP/d/U6jcOxPiPA+3DlN7lJ8ivWyLAFyQ9gtkArCeKWwAZ0M
	OKLmhN1FWL1/SUebc+2sdbteqcVCF0OqPIKCD154gAVunRtOAmGT2zI982kHbOgTaZq4R/848rM
	ruC/kfuQG3jmUb3c08DxCUVUeIv+/fn1ZSIGxdJRmnae64GmoCBDimWHWyJwtoORMCRqL7xRaDd
	YuFtYGWABtl9hstRbP5lT4qHU8oqQyppkR73hpriX8F+l+XsrN7ZzY9UFZvjXypBtxMLj04MPDw
	==
X-Received: by 2002:a17:902:ec90:b0:295:68dd:4ebf with SMTP id d9443c01a7336-2962ad26752mr80759145ad.16.1762399851879;
        Wed, 05 Nov 2025 19:30:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQEt1tm9bbq/1JmTVa6+9G1gTrExHNXzMEjCM4CI/zvcuS9YM7pCKLOAqGzPRf1Uuz5/0q5A==
X-Received: by 2002:a17:902:ec90:b0:295:68dd:4ebf with SMTP id d9443c01a7336-2962ad26752mr80758705ad.16.1762399851314;
        Wed, 05 Nov 2025 19:30:51 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0060sm10361925ad.108.2025.11.05.19.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 19:30:50 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 11:30:35 +0800
Subject: [PATCH v4 3/6] media: qcom: iris: Add scale support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-iris_encoder_enhancements-v4-3-5d6cff963f1b@oss.qualcomm.com>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399836; l=9501;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=BpxahtdTfL5p/xIwFqdTHXv0tK55J86bKYgLYHC6cqg=;
 b=0Rzmx8hF2HjhyTw+OLVTJIEn9AR8f33d7sRBq3xY1spd1Y6+ZBstOWRQP7VARKEieApYKgTgt
 dUjlUKFl6qBCQ8s6K937Ynt/D2PC35rci1pa7ITmIYRPf1PP2TTtYfY
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyNiBTYWx0ZWRfXyj3DSHJSG53K
 HWgyRN9EKPoZM7qDLZrvKTBbTuq0btLo8JEs9SZrpX5tQHzQV9aVs1BLNFKHzLPrGjJHUXz2vAR
 b56f6aF1uPZdRVpa7Xp1zVpLnnPDge6bazxpdW2FcafY1TxsAQJ40U+QwU1hwYV9Ms4BehTd4iT
 04VeAbgaAk3ZlvfGRsblKaJdggMTuNBRhREwqhpr11lySnhecVCt980J4YWr38cv9w2HJDQVz/Z
 psayTHzSSAkNBROZBq2o6zng3S6sOkA24ZgOhrWr38LOSCc4dkyj2C5MtAA86sQrYU327DqnwGV
 iSTzj9ha+qVcVqhtTyqQWA8y7imt5rkEZlyjgFKVqCEuzffwQSz8RKitSNbJqgQ8TG0oRQzzxU8
 bpeWmHuPZY4d7cU2UNuBQpiIADOGVg==
X-Authority-Analysis: v=2.4 cv=LoCfC3dc c=1 sm=1 tr=0 ts=690c166d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Z8iH8PakIHK9AZBxCNEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LCjHJ4BiUe0zcVv8knC6PdIi-659Mg2r
X-Proofpoint-ORIG-GUID: LCjHJ4BiUe0zcVv8knC6PdIi-659Mg2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060026

Add members enc_scale_width, enc_scale_height to the struct iris_inst to
support scale requirements.

Add output width and height settings in iris_venc_s_fmt_output to
enable scaling functionality.

Add VPSS buffer to platform data, which the scale function requires.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 10 ++++++----
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
 6 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 69034e1ea8eb64440646776a40dcc657453916db..815e3e435fbc5a36efb633bc0cc330ff8e86ad47 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
 		payload_type = HFI_PAYLOAD_U32;
 	} else {
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
-			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
+		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
+			ALIGN(inst->enc_scale_height, codec_align);
 		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_32_PACKED;
 	}
@@ -239,8 +239,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		} else {
-			bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
-			right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
+			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+					inst->enc_scale_height);
+			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+				       inst->enc_scale_width);
 			left_offset = 0;
 			top_offset = 0;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
+	case HFI_BUFFER_VPSS:
+		return BUF_VPSS;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a9892988c10bc28e9b2d8c3b5482e99b5b9af623..0b36092fe4e7296da2f66aecf9083f7f1edc5459 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -66,6 +66,8 @@ struct iris_fmt {
  * @hfi_rc_type: rate control type
  * @enc_raw_width: source image width for encoder instance
  * @enc_raw_height: source image height for encoder instance
+ * @enc_scale_width: scale width for encoder instance
+ * @enc_scale_height: scale height for encoder instance
  */
 
 struct iris_inst {
@@ -106,6 +108,8 @@ struct iris_inst {
 	u32				hfi_rc_type;
 	u32				enc_raw_width;
 	u32				enc_raw_height;
+	u32				enc_scale_width;
+	u32				enc_scale_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..d3306189d902a1f42666010468c9e4e4316a66e1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -729,6 +729,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
+static const u32 sm8550_enc_ip_int_buf_tbl[] = {
+	BUF_VPSS,
+};
+
 static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -816,6 +820,8 @@ struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -908,6 +914,8 @@ struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -989,6 +997,8 @@ struct iris_platform_data sm8750_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -1077,6 +1087,8 @@ struct iris_platform_data qcs8300_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 7ad747d2272f029e69a56572a188a032f898a3fb..f573408a3fc66e1bbc7814a8fc7953158e043fce 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->enc_raw_width = DEFAULT_WIDTH;
 	inst->enc_raw_height = DEFAULT_HEIGHT;
+	inst->enc_scale_width = DEFAULT_WIDTH;
+	inst->enc_scale_height = DEFAULT_HEIGHT;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -188,15 +190,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
+	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
+	u32 codec_align;
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!venc_fmt)
 		return -EINVAL;
 
+	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	/*
+	 * If output format size != input format size,
+	 * it is considered a scaling case,
+	 * and the scaled size needs to be saved.
+	 */
+	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
+	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+		inst->enc_scale_width = f->fmt.pix_mp.width;
+		inst->enc_scale_height = f->fmt.pix_mp.height;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+	}
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -254,6 +273,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	inst->enc_raw_width = f->fmt.pix_mp.width;
 	inst->enc_raw_height = f->fmt.pix_mp.height;
+	inst->enc_scale_width = f->fmt.pix_mp.width;
+	inst->enc_scale_height = f->fmt.pix_mp.height;
 
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
 
 inline bool is_scaling_enabled(struct iris_inst *inst)
 {
-	return inst->crop.left != inst->compose.left ||
-		inst->crop.top != inst->compose.top ||
-		inst->crop.width != inst->compose.width ||
-		inst->crop.height != inst->compose.height;
+	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
+
+	return dst_fmt->width != src_fmt->width ||
+		dst_fmt->height != src_fmt->height;
 }
 
 static inline

-- 
2.43.0


