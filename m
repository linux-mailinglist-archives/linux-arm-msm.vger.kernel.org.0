Return-Path: <linux-arm-msm+bounces-80262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B22C2FC61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96449189D536
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5963112AB;
	Tue,  4 Nov 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj5kD4rD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+wttk9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C23112A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243933; cv=none; b=BqUvepr6n+qHjKOHez8n0SE127TAvcQjXzGSuP8TNo8bxFp+4kZyZM8nbiW5BAreJrvjGeOfCX3+u3HpXBcfJ0LPTlv39MwW8Aeu1BBDAU6+XC1THHbgUiVUR0unk7qkU56pYumYpf81+p5Ppgue7Q5xnvvVziEzysftsGMw/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243933; c=relaxed/simple;
	bh=svFxfyQyVIu+Mj++Bic2ws4AviymKTzu/0y2iSS8DxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omoBsVmuKhdrsGlt20qgg8gT8O3w8e1ZEX6BuQZ8ELf/GXdClU8XWdmA2/pxmEHkAsIpdFxsGqSurRJo8jUT6dq0miZRz+MOrfDV3Y931bcdXX6evMEVFnbNVs3hk9kv0v8oMTIhrmp2GrXiROMQO0YEfXk95WgkVMyXvnY6ccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cj5kD4rD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+wttk9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43EorG3616706
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 08:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai9Q1lBunfY/+hDWjYZOyf3Zeo/KJJa1dF19YTbqWQY=; b=cj5kD4rD8F5juCkm
	XwmrPBxH+mQK9AgoNZB8IBL2JbMq9Xnsw5B+HAMlHictLwM1026V+dfOtEHB34o+
	xVA0uDWmpHsyp4aCs7PrAnXE5Zn1EhrSlP2Z1rZBBM8M+dlX0GFuQDdyFjmAFZ4y
	Q8+ZOEtGhw3G8ahZGnjmRK2p434VvxLwWO/10bhOdCIGZAgq9/YFM22Un8MalybT
	h6SmEzir1yt0Szatrlr9Lf6XER8JU6G9akW26HMolZ/wnrUE2h6X8MQfwV7JZrqt
	K4oTKsL+8j1T072tu+6XiaIQUP5uuTye0+RNJI6VogZe+oBY/yhU4sSSFSvAmdcF
	VDSB2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fht6dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 08:12:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso2245465a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 00:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243929; x=1762848729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai9Q1lBunfY/+hDWjYZOyf3Zeo/KJJa1dF19YTbqWQY=;
        b=W+wttk9vcypiMFe96p1Lbl08Iom0Xu8e8VmYlGU1Q5PTvMCaoyqbj3h3s7WVm+VEEN
         kdcgtKoKqCWGtNkaIb3P5hWcJ+vso/GaAy10KaBceQ5aR6F0raM8T+TmQk0pK/K8Leel
         NKcvHKCjAC9BBXUohu2JQYm5w914i6pd9z+HCQU4w6jwv1gs4ZTX6DjJlwRPWEsDcgNi
         I/9jKdsSCqj78l07oEo3vDs9pY0rpwLZvNh4+RdYVeFOaBv0sEPF8eAVOKTbGvjtfsxy
         xIUhiJkTa0oDrjRFgBQR+WI8qNEQqfVvUTPjP6yLa/E4jcFlsHFy+jxyZmzYI2zP/jsr
         ApEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243929; x=1762848729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ai9Q1lBunfY/+hDWjYZOyf3Zeo/KJJa1dF19YTbqWQY=;
        b=FydQyWLbWfMborPSif/ihjlRis9NwfHrydxuX+a0VTVMcZ4Xgr/A7b6V5NHAnzSp+G
         ryyT0L+Zjb+ObZ/CdVrw7XG7kn+FeV9h3IuAP/tNdcfkJdQ9rp7Vbns+Q7D5IJcasJ5N
         QuglQVci7IXJ/QcCSdP/LTBW6h5R7k7hdl/88iUzg4ipUSV5MHqbFjdlG/CCBrTjOooL
         RAxxvtezKDyWYjGRBB5uojDKrUr2uBhNhYh8xga8tzhCpNFJaZhNNqvYf2DfJ07W2KS3
         pqs8ILMT47x7jOrhKA9x/ShSkVWD13SDzDHC8V6RhxgGX7TDDrEwfC3+5zp6TV1KtbOP
         iWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUhH5oO+lynC0fZ6ABbEtUwjvsRByVnFewiM4lLcB07CmmaSeDdU5o6x99h4ysWIwxQElNF5ZoLlH8S29AR@vger.kernel.org
X-Gm-Message-State: AOJu0YyacZbgdWTt+tkyc5rNnCbTuZQEwczlw0SRLog6rQFh+JGfl0Eb
	Se5wUGv+n1SRiM/nUNixjJ8NhzcaKXKHSLBrDio0jiaOZs9Kfxlyo/yAQWJs7ez2Y97BIAW4tjE
	LvqljtAYfdpz+s9X1yGaUNdTe6tAbUfnDa7NO44XRnf3IR+9JrF/oAbofszuVwh/Vf4Qa
X-Gm-Gg: ASbGnctl3KCrQ6h1/qNzCUstkN6DvwaZButbb5zwj9SXVsn45U3gZB1QHdFFmPbjTXo
	z83DYAIS44ZDDPBVlEbri4CHg3ViI3Rjnhp5Ok/G8fo9x/guXFO1xrKv93WJjKxdfusrg5qHbGa
	QeoYLC6/+UEJoCTJyfLSr38UYMd7LH1nAz0IEGMgKfs3qm0/ReECrlExaxninkqlsUUBime/Qbq
	rqy2isdpZSkfinhACZNtA3E+Hyh5ORw7ufQKp9taJxmaDH2io3K11kYqtEbACX5aNnj7OT26OFq
	oePrmrIL1O+GqnvqDWUgoFJRBN0FYZ76u/IqL41s95SMn1p5rvCqA5JGVkEK5J7R0MeLAdZhvUq
	vit9Wmv46YPoT1biRC8vhrPuX6rmolzZlgNgf9PqGAlKWeEnkrlJIZtCYRHkhWItLYMY3yij98Q
	==
X-Received: by 2002:a17:90b:2d8f:b0:33f:ebc2:645 with SMTP id 98e67ed59e1d1-3408306b990mr21754028a91.20.1762243928546;
        Tue, 04 Nov 2025 00:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8rXxWGnHy8DYKwIFk9Js7lIJJhS4Bf7aFc0ZuEwe0zWOPqYDegM3mkKtpHfgn2V7sxqOl0A==
X-Received: by 2002:a17:90b:2d8f:b0:33f:ebc2:645 with SMTP id 98e67ed59e1d1-3408306b990mr21753985a91.20.1762243927979;
        Tue, 04 Nov 2025 00:12:07 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2f12sm3601755a91.5.2025.11.04.00.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:12:07 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 16:11:46 +0800
Subject: [PATCH v3 2/5] media: qcom: iris: Add scale support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-iris_encoder_enhancements-v3-2-63b0c431b4d0@oss.qualcomm.com>
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
In-Reply-To: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243916; l=9528;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=svFxfyQyVIu+Mj++Bic2ws4AviymKTzu/0y2iSS8DxY=;
 b=e66faaQbfNEW3YHjWJybNKgsWVJUb+nLNDawxkWrYIXCubsGb4hkF+LZKiQ7Z3c4dIwv4Cr/w
 741ZZxTSk8ZBzEgEnfotAjsjMRYoM/Ly1RFBIY5ufrk5upz4+riAb37
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfXw0oTjROAqZ35
 GUmxeU9FhQPofW/4OcWPwLfBmJQ01Az2rqV+Q3rqm0qMVld40YNlPh4Ox3qyEtmAYVujcbNZkYb
 MOP+NvANwpFuXlhU4NSQZuZldec8pr9c9flHESE3GOfyZqjbwRFdokFp4PqJ2iFq4tXK3h3PvJK
 9ELcUeLlRzxjLxtPd2iiwTwLHTflrHxvwhV3zGov/7IbqCqtd+7otX8Tzc7D9iQrLWu4g0KuKkS
 e/dXJtubAh8QNGevzIQ8Qff2Ukf+jO7RtlFlvNVgUo9jf2ad39SeY/uxvTHMG9FUUju4sX0o+Xm
 jWoj9jxktIEsDiElzEBH/A3yvC9Pe8XgD9kBkjWT6K/mt0ZDt8Cwnp+GoUKpPaCGRsVHD/CVdoO
 5QwFZfKNAxnG9lpqZSfREexeRPDTCw==
X-Proofpoint-ORIG-GUID: ZrvbM8qDSW-KY4laGrBgH-9h2fxfu-Qh
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=6909b559 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Z8iH8PakIHK9AZBxCNEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZrvbM8qDSW-KY4laGrBgH-9h2fxfu-Qh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040066

Add members enc_scale_width, enc_scale_height to the struct iris_inst to
support scale requirements.

Add output width and height settings in iris_venc_s_fmt_output to
enable scaling functionality.

Add VPSS buffer to platform data, which the scale function requires.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 12 +++++------
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
 6 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 2469e027706fb6c9c0b95be11109c3cd0f8d70ce..815e3e435fbc5a36efb633bc0cc330ff8e86ad47 100644
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
@@ -239,10 +239,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		} else {
-			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
-					inst->enc_raw_height);
-			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
-					inst->enc_raw_width);
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
index fbae1662947df73bb3d10b7892839fa1076b7e61..5ff01dd7177fc919d0cc69553fadede5801592a1 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -66,6 +66,8 @@ struct iris_fmt {
  * @hfi_rc_type: rate control type
  * @enc_raw_width: raw image width for encoder instance
  * @enc_raw_height: raw image height for encoder instance
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


